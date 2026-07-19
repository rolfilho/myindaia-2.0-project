unit uPrometeonEDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, CheckLst, Mask, ConsOnLineEx,
  Grids, DBGrids, DB, DBClient, DBTables;

type
  TfrmPrometeonEDI = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    btn_sair: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    lbl_nr_processo: TLabel;
    medGrupo: TMaskEdit;
    edGrupo: TEdit;
    Label1: TLabel;
    btnCliente: TSpeedButton;
    Panel2: TPanel;
    dbgProcessos: TDBGrid;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    cdsMainNR_PROCESSO: TStringField;
    SaveDialog: TSaveDialog;
    rgTipoArquivo: TRadioGroup;
    SpeedButton1: TSpeedButton;
    qryFunctionTxt: TQuery;
    qryFunctionTxtTX_LINHA: TMemoField;
    btnAdd: TSpeedButton;
    btn5: TSpeedButton;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    function AdicionaProcessoNaLista(const Processo: string): Boolean;
   procedure GeraArquivo(Processos, Destino : String; Tipo : integer);
    function AbreQueryTxt(AFunction: String; AParams: array of String): Boolean;
    { Private declarations }
  public
  end;

var
  frmPrometeonEDI: TfrmPrometeonEDI;

implementation

uses PGGP001, Funcoes, KrQuery, KrFormat, KrUtil, MaskUtils;

{$R *.dfm}

procedure TfrmPrometeonEDI.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TfrmPrometeonEDI.btn_co_produtoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
end;

procedure TfrmPrometeonEDI.btnClienteClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    medGrupo.Text := ConsultaOnLineEx('TGRUPO', 'Grupo', ['CD_GRUPO', 'NM_GRUPO'], ['Código','Nome'],'CD_GRUPO',nil, 1, medGrupo.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) = 3 then
      edGrupo.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', medGrupo.Text, 'NM_GRUPO');
end;

procedure TfrmPrometeonEDI.FormActivate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  btn_co_unid_negClick(nil);
  msk_cd_produto.Text  := str_cd_produto;
  btn_co_produtoClick(nil);
  btnClienteClick(nil);
  medGrupo.text := 'C11';
end;

procedure TfrmPrometeonEDI.btn_co_processoClick(Sender: TObject);
var
  vListAux: TStringList;
  Ret: string;
begin
  if (msk_cd_unid_neg.Text = '') then
  begin
    MessageDlg('Unidade não informada.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if (msk_cd_produto.Text = '') then
  begin
    MessageDlg('Produto não informado.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if (medGrupo.Text = '') then
  begin
    MessageDlg('Grupo não informado.', mtWarning, [mbOK], 0);
    Exit;
  end;

  vListAux := TStringList.Create;
  try
    vListAux.Text := 'SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, '+
                     '       PR.CD_SERVICO, G.NM_GRUPO, DT_ABERTURA '+
                     'FROM TPROCESSO   PR ( NOLOCK ) '+
                     'INNER JOIN TGRUPO G ( NOLOCK ) ON G.CD_GRUPO = PR.CD_GRUPO '+
                     'WHERE CD_PRODUTO      = ' + QuotedStr(msk_cd_produto.Text) +
                     '  AND CD_UNID_NEG     = ' + QuotedStr(msk_cd_unid_neg.Text) +
                     '  AND PR.CD_GRUPO   = ' + QuotedStr(medGrupo.Text) +
                     '  AND PR.IN_CANCELADO = ' + QuotedStr('0');

    Ret := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_GRUPO', 'DT_ABERTURA'],['Processo', 'Serviço', 'Grupo', 'Data de Abertura'],'NR_PROCESSO',nil, Ret);
    if Ret <> '' then
       msk_nr_processo.text := ret;
     // AdicionaProcessoNaLista(msk_cd_unid_neg.Text + msk_cd_produto.Text + Ret);

//    msk_nr_processo.Clear;
  finally
    vListAux.Free;
  end;
end;

function TfrmPrometeonEDI.AdicionaProcessoNaLista(const Processo: string): Boolean;
var
  Query: TLocalQuery;
  SQL: string;
begin
  Result := False;
  SQL := 'SELECT NR_PROCESSO FROM TPROCESSO P (NOLOCK) WHERE RTRIM(P.NR_PROCESSO) = :NR_PROCESSO ';

  Query := AutoQuery.Query;
  Query.SQL.Text := SQL;
  Query.ParamByName('NR_PROCESSO').AsString := Processo;
  Query.Open;
  if not Query.IsEmpty then
  begin
    Result := True;
    while not Query.Eof do
    begin
      cdsMain.Append;
      cdsMainNR_PROCESSO.AsString := Query.FieldByName('NR_PROCESSO').AsString;
      cdsMain.Post;
      Query.Next;
    end;
  end
  else
    MessageDlg('Não foi possível adicionar o processo na lista.', mtWarning, [mbOK], 0);
end;

procedure TfrmPrometeonEDI.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnAdd.click();
  end;
end;

procedure TfrmPrometeonEDI.FormCreate(Sender: TObject);
begin
  cdsMain.CreateDataSet;
  cdsMain.Open;
end;

procedure TfrmPrometeonEDI.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrometeonEDI.SpeedButton1Click(Sender: TObject);
var
  data :TDateTime ;
  sdata, sprocessos, sarquivo : string;
begin
  if cdsMain.IsEmpty then
  begin
    MessageDlg('Não há processos na lista.', mtInformation, [mbOK], 0);
    Exit;
  end;

  sprocessos := '';
  cdsMain.first;
  while not cdsMain.eof do
  begin
    if sprocessos = '' then
      sprocessos := cdsMain.fieldByName('NR_PROCESSO').asString
    else
      sprocessos :=  sprocessos + ',' + cdsMain.fieldByName('NR_PROCESSO').asString;
    cdsMain.next;      
  end;

  data  := Now;
  sdata := formatDateTime('yyyy/mm/dd', data);
  case rgTipoArquivo.ItemIndex of
    0: sarquivo := 'PROMETEON_FUP'+FormataData('ddmmyyyyhhmm', data);
    1: sarquivo := 'PROMETEON_DI'+FormataData('ddmmyyyyhhmm', data);
    2: sarquivo := 'PROMETEON_DIADIC'+FormataData('ddmmyyyyhhmm', data);
    3: sarquivo := 'PROMETEON_ADIANT'+FormataData('ddmmyyyyhhmm', data);
    4: sarquivo := 'PROMETEON_FATU'+FormataData('ddmmyyyyhhmm', data);
    5: sarquivo := 'PROMETEON_VLDI'+FormataData('ddmmyyyyhhmm', data);    
  end;
  
  SaveDialog.FileName := sarquivo;

  if SaveDialog.Execute then
  begin
    GeraArquivo(sprocessos,SaveDialog.FileName,rgTipoArquivo.ItemIndex);
  end;
end;

procedure TfrmPrometeonEDI.GeraArquivo(Processos, Destino : String; Tipo : integer);
var
  SL: TStringList;
begin
  if not AbreQueryTxt('FN_EDI_PROMETEON', [inttostr(Tipo),Processos]) then
    MessageDlg('Erro Abrindo consulta.', mtError, [mbOk], 0)
  else
  begin
    if qryFunctionTxt.Eof then
      MessageDlg('A consulta não retornou linhas para o arquivo.', mtWarning, [mbOk], 0)
    else
      try
        SL := TStringList.Create;
        qryFunctionTxt.first;
        while not qryFunctionTxt.Eof do
        begin
          if qryFunctionTxtTX_LINHA.AsString <> '' then
            SL.Add(qryFunctionTxtTX_LINHA.AsString)
          else
          begin
            MessageDlg('A consulta retornou uma linha vazia.'#13'Favor informar ao TI.', mtError, [mbOk], 0);
            Break;
          end;
          qryFunctionTxt.Next;  
        end;

        SL.SaveToFile(Destino);
        ShowMessage('Arquivo gerado com sucesso.');
      finally
        FreeAndNil(SL);
      end;
  end;
end;

function TfrmPrometeonEDI.AbreQueryTxt(AFunction: String; AParams: array of String): Boolean;
var
  From: String;
  I: Integer;
begin
  try
    if qryFunctionTxt.Active then
      qryFunctionTxt.Close;
    qryFunctionTxt.SQL.Clear;

    From := 'FROM DBO.' + AFunction + '(';
    if High(AParams) >= 0 then
    begin
      for I := 0 to High(AParams) do
        From := From + ':P' + IntToStr(I +1) + ', ';
      From := Copy(From, 1, Length(From) -2) + ')';
    end;

    qryFunctionTxt.SQL.Add('SELECT *');
    qryFunctionTxt.SQL.Add(From);
    qryFunctionTxt.SQL.Add(' ORDER BY NR_PROCESSO');

    for I := 0 to High(AParams) do
      qryFunctionTxt.Params[I].Value := AParams[I];

    qryFunctionTxt.Open;

    Result := True;
  except  on E: Exception do
  begin
    showmessage(e.message);
    Result := False;
  end;
  end;
end;

procedure TfrmPrometeonEDI.btnAddClick(Sender: TObject);
begin
  if Length(msk_nr_processo.Text)>= 12 then
  begin
    if (msk_cd_unid_neg.Text = '') then
    begin
      MessageDlg('Unidade não informada.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (msk_cd_produto.Text = '') then
    begin
      MessageDlg('Produto não informado.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if AdicionaProcessoNaLista(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text) then
      msk_nr_processo.Clear;
  end;
end;

procedure TfrmPrometeonEDI.btn5Click(Sender: TObject);
begin
  if not cdsMain.eof then
    cdsMain.delete;
end;

end.
