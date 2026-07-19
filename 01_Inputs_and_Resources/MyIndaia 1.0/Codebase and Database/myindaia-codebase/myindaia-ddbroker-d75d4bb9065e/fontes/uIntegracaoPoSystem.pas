unit uIntegracaoPoSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, CheckLst, Mask, ConsOnLineEx,
  Grids, DBGrids, DB, DBClient;

type
  TLeiauteArquivo = (laPosystem, laSefaz);

  TfrmIntegrcaoPoSystem = class(TForm)
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
    medCliente: TMaskEdit;
    edCliente: TEdit;
    Label1: TLabel;
    btnCliente: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    cdsMainNR_PROCESSO: TStringField;
    cdsMainNR_NOTA: TIntegerField;
    cdsMainDT_NOTA: TDateTimeField;
    cdsMainVL_NOTA: TFloatField;
    SpeedButton1: TSpeedButton;
    SaveDialog: TSaveDialog;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
  private
    LeiauteArquivo: TLeiauteArquivo;
    function AdicionaProcessoNaLista(const Processo: string): Boolean;
    procedure GerarArquivoPoSystem(const FileName: string);
    procedure GaranteHandle(Handle: Integer);
    procedure GerarArquivosSefaz(const FileName: string);
    { Private declarations }
  public
    class procedure ExecutePOSystem();
    class procedure ExecuteSefaz();
  end;

var
  frmIntegrcaoPoSystem: TfrmIntegrcaoPoSystem;

implementation

uses PGGP001, Funcoes, KrQuery, KrHandle, KrFormat, KrUtil, MaskUtils ,
  uLeiautePOSystem, uLeiauteSefazMattel;

{$R *.dfm}

procedure TfrmIntegrcaoPoSystem.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TfrmIntegrcaoPoSystem.btn_co_produtoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
end;

procedure TfrmIntegrcaoPoSystem.btnClienteClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    medCliente.Text := ConsultaOnLineEx('TEMPRESA_NAC', 'Cliente', ['CD_EMPRESA','AP_EMPRESA', 'NM_EMPRESA', 'CGC_EMPRESA'], ['Código','Nome', 'Razão Social', 'CNPJ'],'CD_EMPRESA',nil, 1, medCliente.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 4 then
      edCliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', medCliente.Text, 'AP_EMPRESA');
end;

procedure TfrmIntegrcaoPoSystem.FormActivate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  btn_co_unid_negClick(nil);
  msk_cd_produto.Text  := str_cd_produto;
  btn_co_produtoClick(nil);
  btnClienteClick(nil);
end;

class procedure TfrmIntegrcaoPoSystem.ExecutePOSystem();
var
  Form: TfrmIntegrcaoPoSystem;
begin
  Form := TfrmIntegrcaoPoSystem.Create(nil);
  try
    Form.cdsMainVL_NOTA.Visible := True;
    Form.LeiauteArquivo := laPosystem;
    Form.Caption := 'PO System';
    Form.ShowModal;
  finally
    FreeAndNil(Form);
  end;
end;

class procedure TfrmIntegrcaoPoSystem.ExecuteSefaz();
var
  Form: TfrmIntegrcaoPoSystem;
begin
  Form := TfrmIntegrcaoPoSystem.Create(nil);
  try
    Form.cdsMainVL_NOTA.Visible := False;
    Form.LeiauteArquivo := laSefaz;
    Form.Caption := 'Sefaz';
    Form.ShowModal;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TfrmIntegrcaoPoSystem.btn_co_processoClick(Sender: TObject);
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
  if (medCliente.Text = '') then
  begin
    MessageDlg('Cliente não informado.', mtWarning, [mbOK], 0);
    Exit;
  end;
  vListAux := TStringList.Create;
  try
    vListAux.Text := 'SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA '+
                     'FROM TPROCESSO PR ( NOLOCK ) '+
                     'INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE '+
                     'WHERE CD_PRODUTO  = '+ QuotedStr(msk_cd_produto.Text) +
                     '  AND CD_UNID_NEG = ' + QuotedStr(msk_cd_unid_neg.Text) +
                     '  AND PR.CD_CLIENTE = ' + QuotedStr(medCliente.Text) +
                     '  AND PR.IN_CANCELADO = ' + QuotedStr('0');
    Ret := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, Ret);
    AdicionaProcessoNaLista(msk_cd_unid_neg.Text + msk_cd_produto.Text + Ret);
    msk_nr_processo.Clear;
  finally
    vListAux.Free;
  end;
end;

function TfrmIntegrcaoPoSystem.AdicionaProcessoNaLista(const Processo: string): Boolean;
var
  Query: TLocalQuery;
  SQL: string;
begin
  Result := False;
  if LeiauteArquivo = laPosystem then
    SQL := 'SELECT NR_PROCESSO, NR_NOTA, DT_NOTA, VL_NOTA FROM TPROCESSO_NF PNF  '+
         'WHERE RTRIM(PNF.NR_PROCESSO) = :NR_PROCESSO AND '+
         '  PNF.IN_COMPLEMENTAR = 0 '+
         '  AND PNF.DT_NOTA = (SELECT MIN(DT_NOTA) FROM TPROCESSO_NF '+
         '                     WHERE RTRIM(NR_PROCESSO) = :NR_PROCESSO '+
         '                     AND IN_COMPLEMENTAR = 0 ) '
  else
    SQL := 'SELECT NR_PROCESSO FROM TPROCESSO P '+
         'WHERE RTRIM(P.NR_PROCESSO) = :NR_PROCESSO ';
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
      if LeiauteArquivo = laPosystem then
      begin
        cdsMainNR_NOTA.AsInteger := Query.FieldByName('NR_NOTA').AsInteger;
        cdsMainDT_NOTA.AsDateTime := Query.FieldByName('DT_NOTA').AsDateTime;
        cdsMainVL_NOTA.AsFloat := Query.FieldByName('VL_NOTA').AsFloat;
      end;
      cdsMain.Post;
      Query.Next;
    end;
  end
  else
    MessageDlg('Não foi possível adicionar o processo na lista.'#13#10+
               'Verifique se o processo possui DI e Notas.' , mtWarning, [mbOK], 0);
end;

procedure TfrmIntegrcaoPoSystem.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
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
    if (medCliente.Text = '') then
    begin
      MessageDlg('Cliente não informado.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Length(msk_nr_processo.Text)>= 12 then
    begin
      AdicionaProcessoNaLista(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text);
      msk_nr_processo.Clear;
    end;
  end;
end;

procedure TfrmIntegrcaoPoSystem.FormCreate(Sender: TObject);
begin
  cdsMain.CreateDataSet;
  cdsMain.Open;
end;

procedure TfrmIntegrcaoPoSystem.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIntegrcaoPoSystem.GaranteHandle(Handle: Integer);
const
  Insert = 'INSERT INTO TPROCESSO_H VALUES(:HANDLE, :NR_PROCESSO)';
var
  Query: TLocalQuery;
begin
  cdsMain.DisableControls;
  try
    Query := AutoQuery.Query(Insert);
    cdsMain.First;
    while not cdsMain.Eof do
    begin
      Query.ParamByName('HANDLE').AsInteger := Handle;
      Query.ParamByName('NR_PROCESSO').AsString := cdsMainNR_PROCESSO.AsString;
      Query.ExecSQL;
      cdsMain.Next;
    end;
  finally
    cdsMain.EnableControls;
  end;
end;

procedure TfrmIntegrcaoPoSystem.GerarArquivoPoSystem(const FileName: string);
var
  PoSystem: TLeiautePoSystem;
  Handle: Integer;
begin
  Handle := GetHandle('TProcesso_H');
  PoSystem := TLeiautePoSystem.Create(FileName, Handle);
  try
    GaranteHandle(Handle);
    PoSystem.GerarArquivo;
    ShowMessage('Concluído.');
  finally
    PoSystem.Free;
    DeleteHandle(Handle, 'TProcesso_H');
  end;
end;

procedure TfrmIntegrcaoPoSystem.GerarArquivosSefaz(const FileName: string);
var
  SefazMattel: TLeiauteSefazMattel;
  Handle: Integer;
begin
  Handle := GetHandle('TProcesso_H');
  SefazMattel := TLeiauteSefazMattel.Create(FileName, Handle);
  try
    GaranteHandle(Handle);
    SefazMattel.GerarArquivo(medCliente.Text);
    ShowMessage('Concluído.');
  finally
    SefazMattel.Free;
    DeleteHandle(Handle, 'TProcesso_H');
  end;
end;

procedure TfrmIntegrcaoPoSystem.SpeedButton1Click(Sender: TObject);
var
  data :TDateTime ;
  sdata : string;
begin
  if cdsMain.IsEmpty then
  begin
    MessageDlg('Não há processos na lista.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if medCliente.Text = '' then
  begin
    MessageDlg('Código do cliente não informado.', mtInformation, [mbOK], 0);
    Exit;
  end;

  if LeiauteArquivo = laPOSystem then
  begin
    if SaveDialog.Execute then
      GerarArquivoPoSystem(SaveDialog.FileName);
  end
  else
  begin
    data  := Now;
    sdata := formatDateTime('yyyy/mm/dd', data);
  //    SaveDialog.FileName := 'NFM3_NPG_'+FormataData('ddmmyyyyhhmmss', data);
    SaveDialog.FileName := 'NFM4_NPG_'+FormataData('ddmmyyyyhhmmss', data);

    if SaveDialog.Execute then
      GerarArquivosSefaz(SaveDialog.FileName);
  end;
end;

procedure TfrmIntegrcaoPoSystem.msk_nr_processoChange(Sender: TObject);
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
    if (medCliente.Text = '') then
    begin
      MessageDlg('Cliente não informado.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if AdicionaProcessoNaLista(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text) then
      msk_nr_processo.Clear;
  end;
end;

end.
