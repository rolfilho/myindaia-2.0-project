unit USelecionaProcTransitTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBClient, Mask,
  ComObj, DBTables, ImgList, ComCtrls;

type
  TfrmSelecionaProcTransitTime = class(TForm)
    Panel1: TPanel;
    btn_sair: TSpeedButton;
    Panel2: TPanel;
    dbgEmailsProcesso: TDBGrid;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    btnAtualizar: TSpeedButton;
    cdsProcessosProcesso: TStringField;
    OpenDialogExcel: TOpenDialog;
    cdsProcessosTransitTime: TIntegerField;
    lblTotalProcessos: TLabel;
    lblTotalProcessosValor: TLabel;
    qryUpdateTransitTime: TQuery;
    ProgressBar1: TProgressBar;
    lblStatusUpdate: TLabel;
    ImageList1: TImageList;
    cdsProcessosAtualizado: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgEmailsProcessoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  function VerificaDoctoJaExiste(Processo : String) : Boolean;
  public
    unidade: string;
    produto: string;
    { Public declarations }
  end;

var
  frmSelecionaProcTransitTime: TfrmSelecionaProcTransitTime;

implementation

uses ConsOnLineEx, PGGP017;

{$R *.dfm}


function TfrmSelecionaProcTransitTime.VerificaDoctoJaExiste(Processo : String) : Boolean;
begin
  Result := false;
  cdsProcessos.first;
  while not cdsProcessos.eof do
  begin
    if AnsiCompareText(Processo, cdsProcessos.fieldByName('Processo').asString) = 0 then
    begin
      Result := true;
      break;
    end;
    cdsProcessos.next;
  end;
end;

procedure TfrmSelecionaProcTransitTime.FormCreate(Sender: TObject);
begin
  cdsProcessos.CreateDataSet;
end;

procedure TfrmSelecionaProcTransitTime.btnAtualizarClick(Sender: TObject);
var
  vPosicao: Integer;
begin
  btnAtualizar.Enabled := false;
  vPosicao := 0;
  lblStatusUpdate.Visible := true;
  ProgressBar1.Visible := true;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := cdsProcessos.RecordCount;
  cdsProcessos.First;
  while not cdsProcessos.Eof do
  begin
    inc(vPosicao);
    lblStatusUpdate.Caption := 'Atualizando o processo: ' + cdsProcessos.fieldByName('Processo').asString + ' ' + IntToStr(vPosicao) + ' de ' + IntToStr(cdsProcessos.RecordCount);
    application.ProcessMessages;

    datm_main.db_broker.StartTransaction;
    try
      qryUpdateTransitTime.ParamByName('processo').AsString := cdsProcessos.fieldByName('Processo').asString;
      qryUpdateTransitTime.ParamByName('TransitTime').AsString := cdsProcessos.FieldByName('TransitTime').AsString;
      qryUpdateTransitTime.ExecSQL;
      datm_main.db_broker.Commit;
    except
      datm_main.db_broker.Rollback;
    end;

    cdsProcessos.Edit;
    cdsProcessos.FieldByName('Atualizado').AsString := 's';
    cdsProcessos.post;

    ProgressBar1.Position := vPosicao;
    cdsProcessos.Next;
  end;
  lblStatusUpdate.Caption := 'Atualização concluída. ' + '  ' + IntToStr(vPosicao) + ' de ' + IntToStr(cdsProcessos.RecordCount);  
  ShowMessage('Transit Time atualizado com sucesso nos processos.');

end;

procedure TfrmSelecionaProcTransitTime.btn_sairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelecionaProcTransitTime.FormShow(Sender: TObject);
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, c: Integer;
  vContemRegistroNaLinha: Boolean;
  vExisteRegistroNfRef: Boolean;
  vProcesso: String;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    if not OpenDialogExcel.Execute() then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i := 1;
    c := 0;

    cdsProcessos.DisableControls;
    try
      while vSheet.Cells[I, 1].Value <> '' do
      begin
        if (Pos('EM-', vSheet.Cells[I, 1].Value) > 0) or
           (Pos('EA-', vSheet.Cells[I, 1].Value) > 0) or
           (Pos('ER-', vSheet.Cells[I, 1].Value) > 0) or
           (Pos('EF-', vSheet.Cells[I, 1].Value) > 0) then
        begin
          vProcesso := Trim(vSheet.Cells[i,1].value);
          if Length(vProcesso) = 12 then
            vProcesso := unidade + produto + vProcesso;
          if not VerificaDoctoJaExiste(vProcesso) then
          begin
            cdsProcessos.append;
            cdsProcessos.fieldByName('Processo').asString := vProcesso;
            cdsProcessos.FieldByName('TransitTime').AsString := Trim(vSheet.Cells[i,2].value);
            cdsProcessos.post;

            Inc(c,1);
          end;
        end;
        Inc(i, 1);        
      end;
    finally
      cdsProcessos.EnableControls;
    end;
    lblTotalProcessosValor.Caption := IntToStr(c);
  finally
    vPlanilhaExcel.WorkBooks.Close;
  end;
end;

procedure TfrmSelecionaProcTransitTime.dbgEmailsProcessoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  lIndiceImagem: byte;
begin
  if UpperCase(Column.Field.FieldName) = 'ATUALIZADO' then
  begin
    if Column.Field.AsString = 's' then
    begin
      dbgEmailsProcesso.Canvas.FillRect(Rect);
      lIndiceImagem := 0;
      // desenha a imagem conforme a condição acima
      ImageList1.Draw(dbgEmailsProcesso.Canvas, Rect.Left + 22, Rect.Top, lIndiceImagem);
    end;
  end;
end;

end.
