unit uIntNexus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, StrUtils, Mask, ComObj, ToolEdit;

type
  TfrmIntNexus = class(TForm)
    fleArquivo: TFilenameEdit;
    Label1: TLabel;
    btnIntegrar: TBitBtn;
    procedure btnIntegrarClick(Sender: TObject);
  private
    function GetProcesso(APedido: String): String;
    function AtualizaEvento(AProcesso, AEvento: String; AData: TDateTime): Boolean;
  public
    function IntegrarArquivo(AArquivo: String): Boolean;
  end;

var
  frmIntNexus: TfrmIntNexus;

implementation

uses
  PGGP017, ConsOnlineEx, Funcoes;

{$R *.dfm}

{ TfrmIntNexus }

function TfrmIntNexus.AtualizaEvento(AProcesso, AEvento: String; AData: TDateTime): Boolean;
begin
  Result := FastExecSQL('UPDATE TFOLLOWUP ' +
                        'SET DT_REALIZACAO      = CONVERT(DATETIME, :DATA, 103) + CONVERT(DATETIME, :HORA, 108), ' +
                        '    CD_RESP_REALIZACAO = :CD_USUARIO ' +
                        'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                        '  AND CD_EVENTO  = :CD_EVENTO', [FormatDateTime('dd/mm/yyyy', AData), FormatDateTime('hh:nn:ss', AData), str_cd_usuario, AProcesso, AEvento]);
end;

procedure TfrmIntNexus.btnIntegrarClick(Sender: TObject);
begin
  if (fleArquivo.FileName = '') or not FileExists(fleArquivo.FileName) then
  begin
    fleArquivo.SetFocus;
    MessageDlg('Informe um arquivo válido.', mtError, [mbOk], 0);
  end
  else
    IntegrarArquivo(fleArquivo.FileName);
end;

function TfrmIntNexus.GetProcesso(APedido: String): String;
begin
  Result := ConsultaLookUPSQL('SELECT NR_PROCESSO ' +
                              'FROM TREF_CLIENTE ' +
                              'WHERE CD_REFERENCIA = :CD_REFERENCIA', 'NR_PROCESSO', [APedido]);
end;

function TfrmIntNexus.IntegrarArquivo(AArquivo: String): Boolean;
var
  ExcelApp, WorkBook, Sheet: OleVariant;
  Linha: Integer;
  Processo, Pedido, Booking, Evento, DataStr: String;
  Data: TDateTime;

  function TryStrToDateTime(Str: String; var ADate: TDateTime): Boolean;
  var
    Dt, Hr: String;
    Dia, Mes, Ano: String;
  begin
    // 07/17/2013 - 04:00 PM Europe/Madrid
    Str := Trim(Str);
    Mes := '';
    while (Str <> '') and (Str[1] in ['0'..'9']) do
    begin
      Mes := Mes + Str[1];
      Delete(Str, 1, 1);
    end;
    while (Str <> '') and (Str[1] in ['/']) do
      Delete(Str, 1, 1);
    Dia := '';
    while (Str <> '') and (Str[1] in ['0'..'9']) do
    begin
      Dia := Dia + Str[1];
      Delete(Str, 1, 1);
    end;
    while (Str <> '') and (Str[1] in ['/']) do
      Delete(Str, 1, 1);
    Ano := '';
    while (Str <> '') and (Str[1] in ['0'..'9']) do
    begin
      Ano := Ano + Str[1];
      Delete(Str, 1, 1);
    end;
    Dt := Dia + '/' + Mes + '/' + Ano;

    Result := (Dia <> '') and (Mes <> '') and (Ano <> '') and SysUtils.TryStrToDate(Dt, ADate);

    if Result then
    begin
      while (Str <> '') and not (Str[1] in ['0'..'9']) do
        Delete(Str, 1, 1);
      Str := Trim(Str);
      Hr := '';
      while (Str <> '') and (Str[1] in ['0'..'9', ':']) do
      begin
        Hr := Hr + Str[1];
        Delete(Str, 1, 1);
      end;
      Result := (Hr = '') or ((Hr <> '') and (SysUtils.TryStrToTime(Hr, ADate)));
      if Result then
        Result := SysUtils.TryStrToDateTime(Dt + ' ' + Hr, ADate)
      else
        Result := SysUtils.TryStrToDateTime(Dt, ADate);
    end;
  end;
begin
  try
    Result := False;
    ExcelApp := CreateOLEObject('Excel.Application');
    WorkBook := ExcelApp.Workbooks.Open(AArquivo);
    Sheet    := WorkBook.Sheets[1];
    ExcelApp.Visible := True;

    Sheet.Cells[1, 1].Value := 'Processo/Msg';

    Linha := 2;
    while (Trim(Sheet.Cells[Linha, 4].Value) <> '') or (Trim(Sheet.Cells[Linha, 5].Value) <> '') or (Trim(Sheet.Cells[Linha, 6].Value) <> '') do
    begin
      Booking := Trim(Sheet.Cells[Linha, 2].Value);
      Pedido  := Trim(Sheet.Cells[Linha, 4].Value);
      Evento  := Trim(Sheet.Cells[Linha, 5].Value);
      DataStr := Trim(Sheet.Cells[Linha, 6].Value);

      Processo := '';
      
      if Booking <> '' then
        Processo := ConsultaLookUPSQL(' SELECT NR_PROCESSO ' +
                                      ' FROM TREF_CLIENTE ' +
                                      ' WHERE CD_REFERENCIA = :CD_REFERENCIA ' +
                                      '   AND TP_REFERENCIA = ''05''', 'NR_PROCESSO', [Booking]);

      if (Processo = '') and (Pedido <> '') then
        Processo := Trim(GetProcesso(Pedido));

      if Processo = '' then
      begin
        Sheet.Cells[Linha, 4].Interior.ColorIndex := 3;
        Sheet.Cells[Linha, 1].Value := 'Processo não encontrado';
        Sheet.Cells[Linha, 1].Interior.ColorIndex := 3;
      end
      else
      begin
        if (DataStr = '') or not TryStrToDateTime(DataStr, Data) then
        begin
          Sheet.Cells[Linha, 6].Interior.ColorIndex := 3;
          Sheet.Cells[Linha, 1].Interior.ColorIndex := 3;
          Sheet.Cells[Linha, 1].Value := 'Data inválida';
        end
        else if (Evento = '') then
        begin
          Sheet.Cells[Linha, 5].Interior.ColorIndex := 3;
          Sheet.Cells[Linha, 1].Interior.ColorIndex := 3;
          Sheet.Cells[Linha, 1].Value := 'Evento não informado';
        end
        else
        begin
          Sheet.Cells[Linha, 1].Value := Processo;
          Sheet.Cells[Linha, 1].Interior.ColorIndex := 8;

          if AnsiContainsText(Evento, 'Discharged for Transshipment') then
            Evento := ConsultaLookUPSQL(' SELECT TOP 1 CD_EVENTO ' +
                                        ' FROM TFOLLOWUP ' +
                                        ' WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                        '   AND CD_EVENTO IN (''582'', ''841'', ''845'') ' +
                                        '   AND DT_REALIZACAO IS NULL ' +
                                        ' ORDER BY CD_EVENTO', 'CD_EVENTO', [Processo])
          else if AnsiContainsText(Evento, 'Discharged at Port of Discharge') then
            Evento := '261'
          else if AnsiContainsText(Evento, 'Loaded for Transshipment') then
            Evento := ConsultaLookUPSQL(' SELECT TOP 1 CD_EVENTO ' +
                                        ' FROM TFOLLOWUP ' +
                                        ' WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                        '   AND CD_EVENTO IN (''583'', ''843'', ''847'') ' +
                                        '   AND DT_REALIZACAO IS NULL ' +
                                        ' ORDER BY CD_EVENTO', 'CD_EVENTO', [Processo])
          else
            Evento := 'ND';

          if Trim(Evento) = '' then
          begin
            Sheet.Cells[Linha, 5].Interior.ColorIndex := 3;
            Sheet.Cells[Linha, 1].Value := 'Evento não encontrado no Followup';
            Sheet.Cells[Linha, 1].Interior.ColorIndex := 3;
          end
          else if Evento = 'ND' then
          begin
            Sheet.Cells[Linha, 5].Interior.ColorIndex := 3;
            Sheet.Cells[Linha, 1].Value := 'Evento não definido';
            Sheet.Cells[Linha, 1].Interior.ColorIndex := 3;
          end
          else if AtualizaEvento(Processo, Evento, Data) then
            Sheet.Range['D' + IntToStr(Linha) + ':E' + IntToStr(Linha)].Interior.ColorIndex := 8
          else
          begin
            Sheet.Range['D' + IntToStr(Linha) + ':E' + IntToStr(Linha)].Interior.ColorIndex := 6;
            Sheet.Cells[Linha, 1].Value := 'Erro atualizando data';
            Sheet.Cells[Linha, 1].Interior.ColorIndex := 3;
          end;
        end;
      end; // Processo <> ''

      // Full Container Discharged for Transshipment     - 582, 841, 845
      // Full Container Discharged at Port of Discharge  - 261
      // Full Container Loaded for Transshipment         - 583, 843, 847

      Inc(Linha);
    end;
    Result := True;
  finally
    Sheet    := Null;
    WorkBook := Null;
    ExcelApp := Null;
  end;
end;

end.
