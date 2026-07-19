unit uContCambio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, Mask,
  MemTable;

type
  TfrmContCambio = class(TForm)
    pnlComandos: TPanel;
    dbWeb: TDatabase;
    qryContCamb: TQuery;
    qryProcessoExpContCamb: TQuery;
    dsContCamb: TDataSource;
    dsProcessoExpContCamb: TDataSource;
    qryContCambNR_CONT_CAMB: TStringField;
    qryContCambNR_BANCO: TStringField;
    qryContCambVL_DISPONIVEL: TFloatField;
    qryContCambDT_VENC_DOCTO: TDateTimeField;
    qryProcessoExpContCambNR_FATURA_CDE: TStringField;
    qryProcessoExpContCambVL_VINCULADO: TFloatField;
    qryProcessoExpContCambDT_VINCULADO: TDateTimeField;
    qryProcessoExpContCambNR_PROCESSO: TStringField;
    mtblFaturas: TMemoryTable;
    mtblFaturasNR_BANCO: TStringField;
    mtblFaturasNR_CONT_CAMB: TStringField;
    mtblFaturasNR_FATURA_CDE: TStringField;
    mtblFaturasVL_VINCULADO: TFloatField;
    mtblFaturasDT_VINCULADO: TDateTimeField;
    dsFaturas: TDataSource;
    btnIncluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    updProcessoExpContCamb: TUpdateSQL;
    qryProcessoExpContCambNR_CONT_CAMB: TStringField;
    qryProcessoExpContCambNR_BANCO: TStringField;
    qryProcessoExpContCambCD_USUARIO_VINC: TStringField;
    updContCamb: TUpdateSQL;
    qryContCambVL_ACE: TFloatField;
    qryProcessoExpContCambcalcNrProcesso: TStringField;
    qryContCambVL_NEGOC: TFloatField;
    qryContCambCD_STATUS_CONT: TStringField;
    pnlProcesso: TPanel;
    lblProcesso: TLabel;
    mskNrProcesso: TMaskEdit;
    btnNrProcesso: TSpeedButton;
    chkNrProcesso: TCheckBox;
    lblUnidade: TLabel;
    mskUnidade: TMaskEdit;
    edtUnidade: TEdit;
    btnUnidade: TSpeedButton;
    pnlContratos: TPanel;
    lblContratos: TLabel;
    dbgrdContratos: TDBGrid;
    lblProcessos: TLabel;
    dbgrdFaturasVinc: TDBGrid;
    lblMoeda: TLabel;
    lblDtVencto: TLabel;
    edtNmMoeda: TEdit;
    edtDtVencto: TEdit;
    dbgrdFaturas: TDBGrid;
    shp1: TShape;
    lbl1: TLabel;
    ssnWeb: TSession;
    memInfo: TMemo;
    mtblFaturasIN_CAMBIO_PRONTO: TBooleanField;
    mtblFaturascalcIN_CAMBIO_PRONTO: TStringField;
    mtblFaturasDT_FATURA_CDE: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbgrdContratosCellClick(Column: TColumn);
    procedure mskUnidadeExit(Sender: TObject);
    procedure mskNrProcessoExit(Sender: TObject);
    procedure btnUnidadeClick(Sender: TObject);
    procedure btnNrProcessoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryContCambAfterPost(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure qryProcessoExpContCambCalcFields(DataSet: TDataSet);
    procedure dbgrdFaturasDblClick(Sender: TObject);
    procedure mskNrProcessoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mtblFaturasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure btnComandos(i, s, c : Boolean);
    function VerificaProcesso : Boolean;
  public
    { Public declarations }
    vNrContrato, vNrBanco, vNrProcesso : string;
    vCodMoeda : string;
  end;

var
  frmContCambio: TfrmContCambio;

implementation

{$R *.dfm}

uses Funcoes, ConsOnLineEx, PGGP001, PGGP017;

procedure TfrmContCambio.btnComandos(i, s, c : Boolean);
begin
  btnIncluir.Enabled := i;
  btnSalvar.Enabled := s;
  btnCancelar.Enabled := c;
  mskUnidade.Enabled := btnIncluir.Enabled;
  btnUnidade.Enabled := btnIncluir.Enabled;
  mskNrProcesso.Enabled := btnIncluir.Enabled;
  btnNrProcesso.Enabled := btnIncluir.Enabled;
  chkNrProcesso.Enabled := btnIncluir.Enabled;
  dbgrdFaturas.Enabled := btnIncluir.Enabled;
end;

function TfrmContCambio.VerificaProcesso : Boolean;
begin
  result := false;
  if vNrProcesso = '' then begin
    Application.MessageBox('Processo não definido!' + #13#10 +
      'Informe o Nr. de processo.', 'Erro', MB_OK + MB_ICONSTOP);
    mskNrProcesso.SetFocus;
  end;
  //verifica se o processo já tem faturas vinculadas
  with TQuery.Create(Application) do begin
    DatabaseName := 'dbWeb';
    SessionName := 'ContratoCambio';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO');
    ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    Open;
    if Fields[0].AsInteger > 0 then begin
      Application.MessageBox('Processo com fatura(s) vinculada(s)!'
        + #13#10 + 'Informe outro processo.', 'Atenção', MB_OK + MB_ICONWARNING);
      mskNrProcesso.SelectAll;
      mskNrProcesso.SetFocus;
    end
    else result := true;
    Close;
    Free;
  end;
end;

procedure TfrmContCambio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mtblFaturas.Close;
  qryProcessoExpContCamb.Close;
  qryContCamb.Close;
  dbWeb.Connected := false;
  ssnWeb.Close;
  Action := caFree;
end;
                         
procedure TfrmContCambio.FormCreate(Sender: TObject);
begin
  ssnWeb.Open;
  if CriaAlias('MYINDAIA','INDAIA10',ssnWeb) then begin
    dbWeb.Connected := true;

    qryContCamb.Close;
    qryContCamb.Open;

    qryProcessoExpContCamb.Close;
    qryProcessoExpContCamb.ParamByName('NR_CONT_CAMB').AsString := qryContCambNR_CONT_CAMB.AsString;
    qryProcessoExpContCamb.ParamByName('NR_BANCO').AsString     := qryContCambNR_BANCO.AsString;
    qryProcessoExpContCamb.Open;

    vNrContrato := qryContCambNR_CONT_CAMB.AsString;
    vNrBanco    := qryContCambNR_BANCO.AsString;
  end;
end;

procedure TfrmContCambio.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;  //mudar para o botão de sair
end;

procedure TfrmContCambio.FormShow(Sender: TObject);
begin
  pnlComandos.Color := clMenuBroker;

  if vNrProcesso <> '' then
  begin
    mskUnidade.Text := Copy(vNrProcesso, 1, 2);
    mskUnidadeExit(nil);
    mskNrProcesso.Text := Copy(vNrProcesso, 5, 13);
    mskNrProcessoExit(nil);
  end
  else
  begin
    mskUnidade.Text := str_cd_unid_neg;
    mskUnidadeExit(nil);
  end;
  btnComandos((vNrProcesso = ''), (vNrProcesso <> ''), (vNrProcesso <> ''));
end;

procedure TfrmContCambio.dbgrdContratosCellClick(Column: TColumn);
begin
  if (vNrContrato <> qryContCambNR_CONT_CAMB.AsString) or (vNrBanco <> qryContCambNR_BANCO.AsString) then begin
    qryProcessoExpContCamb.Close;
    qryProcessoExpContCamb.ParamByName('NR_CONT_CAMB').AsString := qryContCambNR_CONT_CAMB.AsString;
    qryProcessoExpContCamb.ParamByName('NR_BANCO').AsString     := qryContCambNR_BANCO.AsString;
    qryProcessoExpContCamb.Open;

    vNrContrato := qryContCambNR_CONT_CAMB.AsString;
    vNrBanco    := qryContCambNR_BANCO.AsString;
  end;
end;

procedure TfrmContCambio.mskUnidadeExit(Sender: TObject);
begin
  if Trim(mskUnidade.Text) = '' then Exit;

  mskUnidade.Text := Copy('00',0,2-Length(mskUnidade.Text)) + mskUnidade.Text;

  with TQuery.Create(application) do begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG = '''+ mskUnidade.Text +''' ');
    SQL.Add('AND CD_UNID_NEG IN ( SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = '''+ str_cd_usuario +''')' );
    Open;
    if Fields[0].AsInteger = 0 then begin
      Application.MessageBox('Unidade inválida/Usuário não habilitado!','Informação',MB_OK+MB_ICONINFORMATION);
      mskUnidade.Clear;
      mskUnidade.SetFocus;
    end;
    Close;
    Free;
  end;
end;

procedure TfrmContCambio.mskNrProcessoExit(Sender: TObject);
var
  vQryProcesso, vQryContrato : TQuery;
  vValorTotalMLE, vValorFatura, vValorVincular : Double;
  aContCambio : array of array[0..1] of string;
  i : Integer;
begin
  //busca pelo processo
  vNrProcesso := mskUnidade.Text + '02' + mskNrProcesso.Text;
  if not VerificaProcesso then Exit;
  //cria a query que vai realizar a pré-vinculação
  vQryProcesso := TQuery.Create(Application);
  vQryProcesso.DatabaseName := 'DBBROKER';
  vQryContrato := TQuery.Create(Application);
  vQryContrato.DatabaseName := 'dbWeb';
  vQryContrato.SessionName := 'ContratoCambio';
  try
    //seleciona o valor MLE de cada fatura do processo
    with vQryProcesso do begin
      SQL.Clear;
      SQL.Add('SELECT I.NR_PEDIDO AS NR_FATURA_CDE, SUM(I.VL_MLE) AS VL_MLE, P.CD_MOEDA_MLE, F.DT_REALIZACAO,');
      SQL.Add('  DATEADD(day, T.NR_PERIODICIDADE-15, P.DT_CONHECIMENTO) AS DT_PAGTO_CDE');
      SQL.Add('FROM TPROCESSO P (NOLOCK)');
      SQL.Add('  INNER JOIN TPROCESSO_EXP E (NOLOCK) ON (E.NR_PROCESSO = P.NR_PROCESSO)');
      SQL.Add('  INNER JOIN TPROCESSO_EXP_ITEM I (NOLOCK) ON (I.NR_PROCESSO = P.NR_PROCESSO)');
      SQL.Add('  INNER JOIN TFOLLOWUP F (NOLOCK) ON (F.NR_PROCESSO = P.NR_PROCESSO)');
      SQL.Add('  INNER JOIN TTERMO_PAGTO T (NOLOCK) ON (T.CD_TERMO_PAGTO = E.CD_TERMO_PAGTO)');
      SQL.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
      SQL.Add('  AND F.CD_EVENTO = ''132''');
      SQL.Add('  AND F.DT_REALIZACAO IS NOT NULL');
      SQL.Add('GROUP BY I.NR_PEDIDO, P.CD_MOEDA_MLE, P.DT_CONHECIMENTO, F.DT_REALIZACAO, T.NR_PERIODICIDADE');
      ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      Open;
    end;
    //verifica se retornaram valores e se o processo esta correto
    if vQryProcesso.IsEmpty then begin
      Application.MessageBox('Um dos seguintes problemas foram encontrados no processo:' 
        + #13#10#13#10 +
        '- Processo inexistente ou informado incorretamente;' + #13#10 +
        '- Processo não embarcado(evento 132 em branco);' + #13#10 +
        '- Não possui itens ou o valor MLE é igual a zero;' + #13#10 +
        '- Não foi informada a moeda MLE.', 'Erro', MB_OK + MB_ICONSTOP);
      mskNrProcesso.SelectAll;
      mskNrProcesso.SetFocus;
      Exit;
    end;

    vCodMoeda := vQryProcesso.FieldByName('CD_MOEDA_MLE').AsString;
    //preenche edits da tela
    edtNmMoeda.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',vCodMoeda,'NM_MOEDA');
    edtDtVencto.Text := DateToStr(vQryProcesso.FieldByName('DT_REALIZACAO').AsDateTime);
    //verifica se as faturas são cambio pronto
    with TQuery.Create(Application) do begin
      DatabaseName := 'dbWeb';
      SessionName := 'ContratoCambio';
      vValorTotalMLE := 0;
      i := 0;
      while not vQryProcesso.Eof do begin
        SQL.Clear;
        SQL.Add('SELECT C.NR_CONT_CAMB, C.NR_BANCO, (VL_NEGOC-VL_ACE) AS VL_ACC');
        SQL.Add('FROM TCONT_CAMB C (NOLOCK), TCONT_CAMB_FATURA F (NOLOCK)');
        SQL.Add('WHERE F.NR_CONT_CAMB = C.NR_CONT_CAMB');
        SQL.Add('  AND C.NR_BANCO = F.NR_BANCO');
        SQL.Add('  AND F.NR_FATURA_CDE = :NR_FATURA_CDE');
        ParamByName('NR_FATURA_CDE').AsString := vQryProcesso.FieldByName('NR_FATURA_CDE').AsString;
        Open;
        SetLength(aContCambio, i+1);
        if RecordCount > 0 then begin
          //verifica se o contrato tem saldo para vincular com o cambio pronto
          if (vQryProcesso.FieldByName('VL_MLE').AsFloat > FieldByName('VL_ACC').AsFloat) then begin
            Application.MessageBox('Contrato de câmbio pronto sem saldo suficiente!'+ #13#10 +
              'Por favor contate o cliente. Não é possível continuar a vinculação.', 'Atenção', MB_OK + MB_ICONWARNING);
            mskNrProcesso.SelectAll;
            mskNrProcesso.SetFocus;
            Exit;
          end;
          aContCambio[i, 0] := FieldByName('NR_CONT_CAMB').AsString;
          aContCambio[i, 1] := FieldByName('NR_BANCO').AsString;
        end
        else begin
          aContCambio[i, 0] := '';
          aContCambio[i, 1] := '';
          vValorTotalMLE := vValorTotalMLE + vQryProcesso.FieldByName('VL_MLE').AsFloat;
        end;
        Inc(i);
        Close;
        vQryProcesso.Next;
      end;
      Free;
      vQryProcesso.First;
    end;
    //se o valor total MLE for maior que zero, é porque tem faturas que não são câmbio pronto
    if vValorTotalMLE > 0 then begin
      with vQryContrato do begin
        SQL.Clear;
        SQL.Add('SELECT SUM(VL_NEGOC)-SUM(VL_ACE) AS VL_ACC');
        SQL.Add('FROM TCONT_CAMB (NOLOCK)');
        SQL.Add('WHERE CD_MOEDA_NEGOC = :CD_MOEDA');
        SQL.Add('  AND DT_VENC_LIQ > :DT_VENC_LIQ');
        SQL.Add('  AND TX_FATURAS IS NULL');
        SQL.Add('GROUP BY CD_MOEDA_NEGOC');
        SQL.Add('HAVING SUM(VL_NEGOC)-SUM(VL_ACE) >= :VL_ACC');
        ParamByName('CD_MOEDA').AsString := vQryProcesso.FieldByName('CD_MOEDA_MLE').AsString;
        ParamByName('DT_VENC_LIQ').AsDateTime := vQryProcesso.FieldByName('DT_PAGTO_CDE').AsDateTime;
        ParamByName('VL_ACC').AsFloat := vValorTotalMLE;
        Open;
        //verifica se existe saldo suficiente para a vinculação
        if vQryContrato.IsEmpty then begin
          Application.MessageBox('Não existe saldo suficiente na moeda e/ou data de vencimento expirou. '+ #13#10 +
            'Por favor contate o cliente. Não é possível continuar a vinculação.', 'Atenção', MB_OK + MB_ICONWARNING);
          mskNrProcesso.SelectAll;
          mskNrProcesso.SetFocus;
          Exit;
        end;
      end;
    end;
    //seleciona os contratos para montagem da prévia da vinculação
    mtblFaturas.Close;
    mtblFaturas.Open;
    with vQryContrato do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT NR_CONT_CAMB, NR_BANCO, (VL_NEGOC-VL_ACE) AS VL_ACC');
      SQL.Add('FROM TCONT_CAMB (NOLOCK)');
      SQL.Add('WHERE VL_NEGOC-VL_ACE > 0');
      SQL.Add('  AND CD_MOEDA_NEGOC = :CD_MOEDA');
      SQL.Add('  AND DT_VENC_LIQ > :DT_VENC_LIQ');
      SQL.Add('  AND TX_FATURAS IS NULL');
      SQL.Add('ORDER BY DT_VENC_LIQ ASC');
      ParamByName('CD_MOEDA').AsString := vQryProcesso.FieldByName('CD_MOEDA_MLE').AsString;
      ParamByName('DT_VENC_LIQ').AsDateTime := vQryProcesso.FieldByName('DT_PAGTO_CDE').AsDateTime;
      Open;
    end;
    //inicia a vinculação dos contratos x faturas
    i := 0;
    while not vQryProcesso.Eof do begin
      //seleciona o valor da fatura
      vValorFatura := vQryProcesso.FieldByName('VL_MLE').AsFloat;
      if (aContCambio[i, 0] = '') and (aContCambio[i, 1] = '') then begin
        //vincula contratos até a fatura estar finalizada
        while vValorFatura > 0 do begin
          mtblFaturas.Insert;
          mtblFaturasNR_FATURA_CDE.AsString  := vQryProcesso.FieldByName('NR_FATURA_CDE').AsString;
          mtblFaturasNR_CONT_CAMB.AsString   := vQryContrato.FieldByName('NR_CONT_CAMB').AsString;
          mtblFaturasNR_BANCO.AsString       := vQryContrato.FieldByName('NR_BANCO').AsString;
          //verifica se o valor da fatura é maior que o disponível no contrato
          if vValorFatura > vQryContrato.FieldByName('VL_ACC').AsFloat then begin
            //se o valor for maior que o disponível, utiliza todo o que estiver disponível
            //subtrai o valor vinculado do total do contrato e avança para o próximo contrato
            vValorVincular := vQryContrato.FieldByName('VL_ACC').AsFloat;
            vValorFatura   := vValorFatura - vQryContrato.FieldByName('VL_ACC').AsFloat;
            vQryContrato.Next;
          end
          else begin
            //se não for maior, o valor a vincular é o própio valor da fatura
            vValorVincular := vValorFatura;
            vValorFatura   := 0;
          end;
          mtblFaturasVL_VINCULADO.AsFloat := vValorVincular;
          mtblFaturasDT_VINCULADO.AsDateTime := Date;
          mtblFaturasDT_FATURA_CDE.AsDateTime := vQryProcesso.FieldByName('DT_PAGTO_CDE').AsDateTime;
          mtblFaturasIN_CAMBIO_PRONTO.AsBoolean := false;
          mtblFaturas.Post;
        end;
      end
      else begin
        //cambio pronto, insere na tabela de vinculação prévia
        mtblFaturas.Insert;
        mtblFaturasNR_FATURA_CDE.AsString  := vQryProcesso.FieldByName('NR_FATURA_CDE').AsString;
        mtblFaturasNR_CONT_CAMB.AsString   := aContCambio[i, 0];
        mtblFaturasNR_BANCO.AsString       := aContCambio[i, 1];
        mtblFaturasVL_VINCULADO.AsFloat    := vQryProcesso.FieldByName('VL_MLE').AsFloat;
        mtblFaturasDT_VINCULADO.AsDateTime := Date;
        mtblFaturasDT_FATURA_CDE.AsDateTime := vQryProcesso.FieldByName('DT_PAGTO_CDE').AsDateTime;
        mtblFaturasIN_CAMBIO_PRONTO.AsBoolean := true;
        mtblFaturas.Post;
      end;
      Inc(i);
      vQryProcesso.Next;
    end;
    vQryContrato.Close;
    btnComandos(false, true, true);
    dbgrdFaturas.Enabled := true;
    vQryProcesso.Close;
  finally
    vQryProcesso.Free;
    vQryContrato.Free;
  end;
end;

procedure TfrmContCambio.btnUnidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    mskUnidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    mskUnidadeExit(nil);
  end else edtUnidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskUnidade.Text,'AP_UNID_NEG');
end;

procedure TfrmContCambio.btnNrProcessoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT DISTINCT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO,');
  vListAux.Add('  EN.NM_EMPRESA+''(''+EN.AP_EMPRESA+'')'' AS NM_EMPRESA, PR.CD_MOEDA_MLE, DT_ABERTURA');
  vListAux.Add('FROM TPROCESSO PR (NOLOCK)');
  vListAux.Add('  INNER JOIN TPROCESSO_EXP_ITEM PEI (NOLOCK) ON PEI.NR_PROCESSO = PR.NR_PROCESSO');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE PR.CD_UNID_NEG  = ''' + mskUnidade.Text + '''');
  vListAux.Add('  AND PR.CD_PRODUTO   = ''02''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  vListAux.Add('  AND PR.CD_GRUPO = ''028''');
  //verifica se últimos processos esta ativo
  if chkNrProcesso.Checked then vListAux.Add('  AND PR.DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  //abre consulta e retona numero do processo
  mskNrProcesso.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'NM_EMPRESA', 'CD_MOEDA_MLE', 'DT_ABERTURA'],
    ['Processo', 'Cliente', 'Moeda', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
  mskNrProcessoExit(nil);
end;

procedure TfrmContCambio.btnIncluirClick(Sender: TObject);
begin
  mskNrProcesso.Text := '';
  edtNmMoeda.Text := '';
  edtDtVencto.Text := '';
  //pnlProcesso.BringToFront;
  //pnlContratos.SendToBack;
  mskNrProcesso.SetFocus;
end;

procedure TfrmContCambio.btnSalvarClick(Sender: TObject);
var
  vNrContCamb, vNrBanco : String;
  vValorVincular, vValorACE : Double;
  vInVincValida : Boolean;
begin
  if not VerificaProcesso then Exit;
  try
    dbWeb.StartTransaction;
    //verifica se existem faturas na pré-vinculação
    if mtblFaturas.IsEmpty then begin
      Application.MessageBox('Sem faturas para vincular nesse processo!' +
        #13#10 + 'Informe um processo com faturas válidas.', 'Erro', MB_OK + MB_ICONSTOP);
      mskNrProcesso.SelectAll;
      mskNrProcesso.SetFocus;
    end
    else begin
      //verifica se os dados da pré-vinculação ainda são válidos
      mtblFaturas.First;
      vNrContCamb := mtblFaturasNR_CONT_CAMB.AsString;
      vNrBanco := mtblFaturasNR_BANCO.AsString;
      vValorVincular := mtblFaturasVL_VINCULADO.AsFloat;
      vInVincValida := true;

      while not mtblFaturas.Eof do begin
        //verifica se o saldo disponível "realmente" está disponível
        with TQuery.Create(Application) do begin
          DatabaseName := 'dbWeb';
          SessionName := 'ContratoCambio';
          SQL.Clear;
          SQL.Add('SELECT (VL_NEGOC-VL_ACE) AS VL_ACC FROM TCONT_CAMB');
          SQL.Add('WHERE NR_CONT_CAMB = :NR_CONT_CAMB AND NR_BANCO = :NR_BANCO');
          ParamByName('NR_CONT_CAMB').AsString := vNrContCamb;
          ParamByName('NR_BANCO').AsString := vNrBanco;
          Open;
          //se o valor a vincular for maior que o disponível...
          if Fields[0].AsFloat < vValorVincular then vInVincValida := false;
          Close;
          Free;
        end;
        if not vInVincValida then break;
        mtblFaturas.Next;
        if mtblFaturasNR_CONT_CAMB.AsString+mtblFaturasNR_BANCO.AsString <> vNrContCamb+vNrBanco then
          vValorVincular := mtblFaturasVL_VINCULADO.AsFloat
        else
          vValorVincular := vValorVincular + mtblFaturasVL_VINCULADO.AsFloat;
        vNrContCamb := mtblFaturasNR_CONT_CAMB.AsString;
        vNrBanco := mtblFaturasNR_BANCO.AsString;
      end;

      if not vInVincValida then begin
        if Application.MessageBox('Os contratos de câmbio previamente vinculados a(s) fatura(s) desse processo não são mais válidos.'
             + #13#10 + 'Você deseja que o sistema procure por novos contratos para vincular a(s) fatura(s)?',
             'Erro', MB_YESNO + MB_ICONSTOP) = mrYes then begin
          mskNrProcessoExit(nil);
        end;
      end
      else begin
        mtblFaturas.First;
        //insere as faturas vinculadas na tabela
        while not mtblFaturas.Eof do begin
          qryProcessoExpContCamb.Insert;
          qryProcessoExpContCambNR_CONT_CAMB.AsString    := mtblFaturasNR_CONT_CAMB.AsString;
          qryProcessoExpContCambNR_BANCO.AsString        := mtblFaturasNR_BANCO.AsString;
          qryProcessoExpContCambNR_PROCESSO.AsString     := vNrProcesso;
          qryProcessoExpContCambNR_FATURA_CDE.AsString   := mtblFaturasNR_FATURA_CDE.AsString;
          qryProcessoExpContCambVL_VINCULADO.AsFloat     := mtblFaturasVL_VINCULADO.AsFloat;
          qryProcessoExpContCambDT_VINCULADO.AsDateTime  := mtblFaturasDT_VINCULADO.AsDateTime;
          qryProcessoExpContCambCD_USUARIO_VINC.AsString := str_cd_usuario;
          qryProcessoExpContCamb.Post;
          //atualiza a tabela de contratos
          qryContCamb.Locate('NR_CONT_CAMB;NR_BANCO',VarArrayOf([mtblFaturasNR_CONT_CAMB.AsString,mtblFaturasNR_BANCO.AsString]),[loCaseInsensitive]);
          qryContCamb.Edit;
          vValorACE := qryContCambVL_ACE.AsFloat + mtblFaturasVL_VINCULADO.AsFloat;
          //verifica se todo o valor do contrato já foi utilizado.
          if vValorACE = qryContCambVL_NEGOC.AsFloat then begin
            qryContCambCD_STATUS_CONT.AsString := '3';
          end;
          qryContCambVL_ACE.AsFloat := vValorACE;
          qryContCamb.Post;
          mtblFaturas.Next;
        end;
        //atualiza os componentes no form
        mtblFaturas.Close;
        //pnlProcesso.SendToBack;
        //pnlContratos.BringToFront;
        btnComandos(true, false, false);
        Application.ProcessMessages;
      end;
    end;
    dbWeb.Commit;
  except
    on E: Exception do
    begin
      if dbWeb.InTransaction then dbWeb.Rollback;
      TrataErro(E);
    end;
  end;
  //atualiza as tabelas
  qryContCamb.Close;
  qryContCamb.Open;

  qryProcessoExpContCamb.Close;
  qryProcessoExpContCamb.ParamByName('NR_CONT_CAMB').AsString := qryContCambNR_CONT_CAMB.AsString;
  qryProcessoExpContCamb.ParamByName('NR_BANCO').AsString     := qryContCambNR_BANCO.AsString;
  qryProcessoExpContCamb.Open;

  vNrContrato := qryContCambNR_CONT_CAMB.AsString;
  vNrBanco    := qryContCambNR_BANCO.AsString;
end;

procedure TfrmContCambio.btnCancelarClick(Sender: TObject);
begin
  mtblFaturas.Close;
  mskNrProcesso.Text := '';
  edtNmMoeda.Text := '';
  edtDtVencto.Text := '';
  btnComandos(true, false, false);
end;

procedure TfrmContCambio.qryContCambAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmContCambio.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContCambio.qryProcessoExpContCambCalcFields(DataSet: TDataSet);
begin
  qryProcessoExpContCambcalcNrProcesso.AsString := Copy(qryProcessoExpContCambNR_PROCESSO.AsString, 5, 10);
end;

procedure TfrmContCambio.dbgrdFaturasDblClick(Sender: TObject);
var
  vListAux : TStringList;
  vContCambBanco : String;
  vValorPrev : Double;
  vDtFatura : TDateTime;
begin
  //põe a tabela em edição
  if mtblFaturas.State = dsBrowse then mtblFaturas.Edit else Exit;
  //verifica se o registro é cambio pronto
  if mtblFaturasIN_CAMBIO_PRONTO.AsBoolean then begin
    Application.MessageBox('Não é possível  alterar o contrato de câmbio da' + 
      #13#10 + 'fatura quando for câmbio pronto.', 'Atenção', MB_OK + MB_ICONWARNING);
    mtblFaturas.Cancel;
    Exit;
  end;
  vListAux := TStringList.Create;
  try
    vValorPrev := mtblFaturasVL_VINCULADO.AsFloat;
    vDtFatura := mtblFaturasDT_FATURA_CDE.AsDateTime;
    vListAux.Add('SELECT NR_CONT_CAMB+''/''+NR_BANCO AS CODIGO, (VL_NEGOC-VL_ACE) AS VL_ACC,');
    vListAux.Add('  ISNULL(E.NM_EMPRESA+'', ''+E.AP_EMPRESA, '''') AS NM_EXPORTADOR, C.DT_VENC_LIQ');
    vListAux.Add('FROM MYINDAIA.DBO.TCONT_CAMB C (NOLOCK)');
    vListAux.Add('  INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = C.CD_EXPORTADOR');
    vListAux.Add('WHERE C.CD_MOEDA_NEGOC = '''+vCodMoeda+'''');
    vListAux.Add('  AND C.TX_FATURAS IS NULL');
    vListAux.Add('  AND C.VL_NEGOC-VL_ACE >= '+StringReplace(FloatToStr(vValorPrev),',','.',[rfReplaceAll]));
    vListAux.Add('  AND C.DT_VENC_LIQ > CONVERT(datetime, '''+DateToStr(vDtFatura)+''', 103)');
    vListAux.Add('ORDER BY C.DT_VENC_LIQ ASC');
    vContCambBanco := ConsultaOnLineExSQLList(vListAux,'Contratos de Câmbio',['CODIGO','VL_ACC','NM_EXPORTADOR','DT_VENC_LIQ'],
      ['Contrato/Banco','Valor ACC','Exportador','Vencto. Contrato'],'CODIGO',nil);
    if vContCambBanco <> '' then begin
      mtblFaturasNR_CONT_CAMB.AsString := Copy(vContCambBanco, 0, Pos('/',vContCambBanco)-1);
      mtblFaturasNR_BANCO.AsString := Copy(vContCambBanco, Pos('/',vContCambBanco)+1, Length(vContCambBanco));
      mtblFaturas.Post;
    end
    else mtblFaturas.Cancel;
  finally
    vListAux.Free;
  end;
end;

procedure TfrmContCambio.mskNrProcessoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then mskNrProcessoExit(nil);
end;

procedure TfrmContCambio.mtblFaturasCalcFields(DataSet: TDataSet);
begin
  mtblFaturas.FieldByName('calcIN_CAMBIO_PRONTO').AsString := '';
  if mtblFaturasIN_CAMBIO_PRONTO.AsBoolean then
    mtblFaturas.FieldByName('calcIN_CAMBIO_PRONTO').AsString := 'ü';
end;

end.

