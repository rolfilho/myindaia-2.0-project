unit PGGP017;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, Db, DBTables,
  ppVar, ppBands, ppRegion, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppCache, ppDBPipe, ppDBBDE,
  Graphics, PGSM990, madExceptVcl,
  FormsLog, DBXpress, SqlExpr, FMTBcd; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;


type
  TipoTabela = (TTProposta, TTProcesso);
  TOutrasReferencias = record
    Tabela: Int64;
    Referencia: String;
  end;
  TReferenciaPedido = record
    Unidade: String;
    Produto: String;
    Cliente: String;
    Referencia: String;
  end;
  TReferenciaDigitalizacao = record
    Processo: String;
    Instrucao: String;
    OutraReferencia: TOutrasReferencias;
    Pedido: TReferenciaPedido;
  end;

type
  Tdatm_main = class(TDataModule)
    tbl_parametro_: TTable;
    sp_data_hora_server: TStoredProc;
    db_broker: TDatabase;
    qry_direito_acesso_: TQuery;
    qry_insere_log_: TQuery;
    qry_direito_acesso_IN_ACESSO: TBooleanField;
    qry_direito_acesso_IN_INCLUIR: TBooleanField;
    qry_direito_acesso_IN_MODIFICAR: TBooleanField;
    qry_direito_acesso_IN_EXCLUIR: TBooleanField;
    tbl_parametro_DT_SOLIC_CH: TDateTimeField;
    tbl_parametro_NR_SOLIC_CH: TIntegerField;
    tbl_parametro_HM_PARA_SOLIC_CH: TStringField;
    tbl_parametro_PATH_RISC: TStringField;
    tbl_parametro_NM_SERVIDOR: TStringField;
    tbl_parametro_NM_CID_CHEQUE: TStringField;
    tbl_parametro_CD_ITEM_SDA: TStringField;
    tbl_parametro_CD_ITEM_RECEB_NUM: TStringField;
    tbl_parametro_CD_ITEM_DEVOL_NUM: TStringField;
    tbl_parametro_CD_ITEM_EXTOR_NUM: TStringField;
    tbl_parametro_CD_ITEM_SALDO_CRE: TStringField;
    tbl_parametro_CD_ITEM_SALDO_DEB: TStringField;
    tbl_parametro_CD_ITEM_RECEB_SD: TStringField;
    tbl_parametro_CD_ITEM_PAGTO_SD: TStringField;
    tbl_parametro_CD_ITEM_IR: TStringField;
    tbl_parametro_VL_ALIQ_IR: TFloatField;
    tbl_parametro_VL_MIN_IR: TFloatField;
    tbl_parametro_CD_EV_REG_DI: TStringField;
    tbl_parametro_CD_EV_DESEMB: TStringField;
    tbl_parametro_CD_EV_PAGTO_LI: TStringField;
    tbl_parametro_CD_EV_ENT: TStringField;
    tbl_parametro_CD_ITEM_CPMF: TStringField;
    tbl_parametro_CD_EV_CHEGADA: TStringField;
    tbl_parametro_CD_EV_ENT_SETPIN: TStringField;
    tbl_parametro_CD_EV_SAI_SETPIN: TStringField;
    tbl_parametro_CD_EV_DESCARGA: TStringField;
    tbl_parametro_CD_ITEM_COMISSAO: TStringField;
    tbl_parametro_CD_ITEM_EXPED: TStringField;
    tbl_parametro_CD_EV_PREV_CHEGADA: TStringField;
    tbl_parametro_CD_EV_ETD: TStringField;
    tbl_parametro_CD_EV_PREV_DESEMB: TStringField;
    tbl_parametro_CD_EV_CONHECIMENTO: TStringField;
    tbl_parametro_CD_EV_RECEB_DOC: TStringField;
    tbl_parametro_CD_ITEM_II: TStringField;
    tbl_parametro_CD_ITEM_IPI: TStringField;
    tbl_parametro_CD_ITEM_ICMS: TStringField;
    tbl_parametro_CD_ITEM_FRETE_AEREO: TStringField;
    tbl_parametro_CD_ITEM_FRETE_MAR: TStringField;
    tbl_parametro_CD_ITEM_SEGURO: TStringField;
    tbl_parametro_CD_ITEM_VMLE: TStringField;
    tbl_parametro_CD_ITEM_ACRESC: TStringField;
    tbl_parametro_CD_ITEM_DED: TStringField;
    tbl_parametro_CD_ITEM_SISCOMEX: TStringField;
    tbl_parametro_CD_ITEM_AFRMM: TStringField;
    tbl_parametro_CD_GRP_ITEM_FRETE: TStringField;
    tbl_parametro_CD_GRP_ITEM_ARM: TStringField;
    tbl_parametro_CD_GRP_ITEM_CAP: TStringField;
    sp_atz_contabil: TStoredProc;
    qry_di_calculo_: TQuery;
    sp_di_calculo: TStoredProc;
    tbl_parametro_PATH_CONTABIL: TStringField;
    tbl_parametro_PATH_GSM_SERVER: TStringField;
    tbl_parametro_PATH_GSM_CLIENT: TStringField;
    qry_di_calculo_IN_MOEDA_UNICA: TBooleanField;
    qry_di_calculo_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_calculo_PL_CARGA: TFloatField;
    qry_di_calculo_SUM_VL_MLE_ITEM: TFloatField;
    qry_di_calculo_SUM_PL_MERCADORIA: TFloatField;
    qry_di_taxa_: TQuery;
    qry_di_taxa_NR_PROCESSO: TStringField;
    qry_di_taxa_CD_MOEDA_MLE: TStringField;
    qry_di_taxa_CD_MOEDA_FRETE: TStringField;
    qry_di_taxa_CD_MOEDA_SEGURO: TStringField;
    qry_di_taxa_IN_MOEDA_UNICA: TBooleanField;
    qry_di_taxa_TX_MLE: TFloatField;
    qry_di_taxa_TX_FRETE: TFloatField;
    qry_adicao_taxa_: TQuery;
    qry_adicao_taxa_CD_MOEDA_MLE: TStringField;
    qry_adicao_taxa_TX_MLE: TFloatField;
    qry_di_taxa_TX_DOLAR: TFloatField;
    qry_di_taxa_VL_TOTAL_MLE_MN: TFloatField;
    qry_di_taxa_VL_TOT_DESPS_MN: TFloatField;
    qry_di_taxa_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_taxa_VL_TOT_DESPS_MNEG: TFloatField;
    qry_di_taxa_VL_TOTAL_FRETE_MN: TFloatField;
    qry_di_taxa_VL_TOTAL_SEG_MN: TFloatField;
    qry_di_taxa_VL_TOT_FRT_COLLECT: TFloatField;
    qry_di_taxa_VL_TOT_FRT_PREPAID: TFloatField;
    qry_di_taxa_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_di_taxa_TX_INFO_COMPL: TMemoField;
    qry_di_taxa_VL_TOT_SEGURO_MNEG: TFloatField;
    qry_calculo_erro_: TQuery;
    qry_calculo_erro_NM_STORED_PROCEDURE: TStringField;
    qry_calculo_erro_CD_ERRO: TSmallintField;
    qry_calculo_erro_NM_MENSAGEM: TStringField;
    sp_navega: TStoredProc;
    tbl_parametro_CD_INSTALACAO: TStringField;
    sp_ult_sequencia: TStoredProc;
    tbl_parametro_CD_MOEDA_CORRENTE: TStringField;
    tbl_parametro_CD_ITEM_NAO_FAT: TStringField;
    tbl_parametro_CD_EV_ABRE_PROC: TStringField;
    ds_di_taxa: TDataSource;
    qry_verifica_integrid_: TQuery;
    ds_calculo_: TDataSource;
    tbl_parametro_CD_ITEM_ISS: TStringField;
    tbl_parametro_CD_ITEM_EXT_RECEB: TStringField;
    tbl_parametro_CD_ITEM_EXT_PAGTO: TStringField;
    tbl_parametro_CD_ITEM_PAGO_CLI: TStringField;
    qry_di_calculo_VL_TOTAL_MLE_MN: TFloatField;
    qry_di_calculo_SUM_VL_MLE_ITEM_MN: TFloatField;
    sp_rel_followup_aut: TStoredProc;
    qry_cli_rel_flp_aut_: TQuery;
    qry_cli_rel_flp_aut_CD_CLIENTE: TStringField;
    qry_rel_flp_aut_: TQuery;
    ds_cli_flp_aut: TDataSource;
    qry_cli_rel_flp_aut_NM_CLIENTE: TStringField;
    tbl_parametro_PATH_COB_AUT_IMP: TStringField;
    tbl_parametro_PATH_COB_AUT_TRANS: TStringField;
    qry_param_unid_neg_: TQuery;
    qry_param_unid_neg_PATH_RELATORIOS: TStringField;
    qry_param_unid_neg_PATH_SISCOMEX: TStringField;
    qry_param_unid_neg_PATH_REI: TStringField;
    tbl_parametro_CD_SISTEMA_CONTABIL: TStringField;
    tbl_parametro_VL_MINIMO_TED: TFloatField;
    qry_atz_di_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    tbl_parametro_CD_ITEM_DEMURRAGE: TStringField;
    qry_atz_da_: TQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    sp_da_calculo: TStoredProc;
    sp_nac_calculo: TStoredProc;
    qry_atz_nac_: TQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField3: TFloatField;
    qry_release_: TQuery;
    qry_release_NR_VERSAO: TStringField;
    qry_release_PATH_TELA: TStringField;
    qry_release_TX_RELEASE: TMemoField;
    ds_release: TDataSource;
    ppBDE_release: TppBDEPipeline;
    ppRepRelease: TppReport;
    ppHeaderRelease: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppRegion1: TppRegion;
    ppLabel2: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppVarRodapeEsq: TppVariable;
    ppVarRodapeDir: TppVariable;
    tbl_parametro_VL_AUTOCLOSER: TIntegerField;
    tbl_parametro_IN_INTEGRACAO_CONTABIL: TStringField;
    tbl_parametro_DT_CONTABILIZACAO: TDateTimeField;
    db_suporte: TDatabase;
    tbl_parametro_NR_ULT_RD: TStringField;
    tbl_parametro_NR_DIAS_CONS_PROC: TIntegerField;
    tbl_parametro_CD_EV_DT_ENT_FABR: TStringField;
    db_broker_pendencias: TDatabase;
    Session1: TSession;
    qry_Forms: TQuery;
    qry_FormsNM_FORM: TStringField;
    qry_FormsNM_DATA_MODULE: TStringField;
    qry_FormsNM_QUERY: TStringField;
    qry_FormsID_TABELA: TIntegerField;
    qry_FormsNM_TABELA: TStringField;
    qry_FormsNM_CAMPO: TStringField;
    qry_FormsIN_PROCESSO: TStringField;
    MadExceptionHandler1: TMadExceptionHandler;
    SP_ALTERA_SENHA_OLD: TStoredProc;
    SP_REINCLUIR_USUARIO_BANCOS_OLD: TStoredProc;
    SQLConnection: TSQLConnection;
    qrySP_ALTERAR_USUARIO: TSQLQuery;
    qryTiposDoctos: TQuery;
    qryTiposDoctosCD_TIPO_DOCTO: TIntegerField;
    qryTiposDoctosNM_TIPO_DOCTO: TStringField;
    qryTiposDoctosCD_PRODUTO: TStringField;
    qryTiposDoctosIN_MULTIPLOS_ARQ: TIntegerField;
    qryTiposDoctosNM_PREFIXO_ARQ: TStringField;
    qryTiposDoctosIN_ENVIA_WEB: TStringField;
    qryTiposDoctosID_TABELA: TIntegerField;
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure DataModuleCreate(Sender: TObject);
    procedure db_brokerBeforeConnect(Sender: TObject);
    procedure MadExceptionHandler1Exception(const exceptIntf: IMEException;
      var handled: Boolean);
  private
    dt_server: TDateTime;
    hr_server: TDateTime;
    function Space( i : Integer) : String;
  public
    function GetReferenciaDigitalizacao: TReferenciaDigitalizacao;
  end;

var
  datm_main: Tdatm_main;
  clMenuBroker     : TColor;
  clPnlClaroBroker : TColor;
  str_cd_usuario   : string[4];
  str_cd_cargo     : string[3];
  vTipoTabela      : TipoTabela;
  vClassificarItens       : Boolean;

implementation

{$R *.DFM}

uses GSMLIB, ConsOnlineEx, madExcept;

procedure Tdatm_main.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeEsq.AsString := 'RBREL001' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
end;

procedure Tdatm_main.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tdatm_main.DataModuleCreate(Sender: TObject);
var
  User_Name: array[0..255] of Char;
  Size: Cardinal;
  PathPriv, PathRede: String;    // Session  - Padrão
  PathPriv2, PathRede2: String;  // Session1 - Pendências
begin
  // Desconeta os TDataBases caso estejam conectados para atualizar as sessions - Michel - 24/08/210
  if db_broker.Connected then
    db_broker.Close;
  if db_suporte.Connected then
    db_suporte.Close;
  if db_broker_pendencias.Connected then
    db_broker_pendencias.Close;

  try
    // Pega o nome de usuário do computador e define as pastas - Michel - 24/08/210
    Size := 256;
    GetUserName(User_Name, Size);
    if StrPas(User_Name) <> '' then
    begin
      PathPriv  := ExtractFilePath(ParamStr(0)) + StrPas(User_Name) + '\PRIV';
      PathRede  := ExtractFilePath(ParamStr(0)) + StrPas(User_Name) + '\REDE';
      PathPriv2 := ExtractFilePath(ParamStr(0)) + StrPas(User_Name) + '\PRIV2';
      PathRede2 := ExtractFilePath(ParamStr(0)) + StrPas(User_Name) + '\REDE2';
    end
    else
    begin
      PathPriv  := ExtractFilePath(ParamStr(0)) + 'PRIV';
      PathRede  := ExtractFilePath(ParamStr(0)) + 'REDE';
      PathPriv2 := ExtractFilePath(ParamStr(0)) + 'PRIV2';
      PathRede2 := ExtractFilePath(ParamStr(0)) + 'REDE2';
    end;

    // Cria os diretórios - Michel - 24/08/210
    if not DirectoryExists(PathPriv) then
      ForceDirectories(PathPriv);
    if not DirectoryExists(PathRede) then
      ForceDirectories(PathRede);


    Session.Active:=False; //by Carlos - 15/03/2011

    // Se os diretórios estiverem criados, usa-os - Michel - 24/08/210
    if DirectoryExists(PathPriv) then begin
      DeleteFile(PathPriv+'\PARADOX.LCK');
      DeleteFile(PathPriv+'\PDOXUSRS.LCK');
      Session.PrivateDir := PathPriv;
    end;

    if DirectoryExists(PathRede) then begin
      DeleteFile(PathRede+'\PDOXUSRS.NET');
      Session.NetFileDir := PathRede;
    end;


    if DirectoryExists(PathPriv2) then begin
      DeleteFile(PathPriv2+'\PARADOX.LCK');
      DeleteFile(PathPriv2+'\PDOXUSRS.LCK');

      Session.PrivateDir := PathPriv2;
    end;

    if DirectoryExists(PathRede2) then begin
      DeleteFile(PathRede2+'\PDOXUSRS.NET');
      Session.NetFileDir := PathRede2;
    end;

    Session.Active:=True;
  except
    on E: Exception do
      MessageDlg('Erro definindo diretórios da sessão.'#13 + E.Message, mtError, [mbOk], 0);
  end;

  dt_server := sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
  hr_server := dt_server;
  dt_server := StrToDate(DateToStr(dt_server));
  vClassificarItens := False;
end;

function Tdatm_main.Space( i : Integer) : String;
var
  s : string;
begin
  s := '';
  While Length( s ) < i do s := s + ' ';
  Space := s;
end;


procedure Tdatm_main.db_brokerBeforeConnect(Sender: TObject);
var
  CPU: array[0..255] of Char;
  Size: Cardinal;
begin
  GetComputerName(CPU, Size);
  db_broker.Params.Values['HOST NAME'] := StrPas(CPU);
  //
  //alterar o memsize do BDE para evitar o erro de insuficiente memoria em querys que retornam muitos registros - by carlos 29/06/2011
  Altera_Reg_Win('SOFTWARE\Borland\Database Engine\Settings\System\INIT','MEMSIZE','205','STR');

end;

function Tdatm_main.GetReferenciaDigitalizacao: TReferenciaDigitalizacao;
var
  I: Integer;
  DataModule: TComponent;
  Query: TQuery;
  S: String;
  //Param: String;
begin
  Result.Processo   := '';
  Result.Instrucao  := '';
  Result.OutraReferencia.Tabela     := 0;
  Result.OutraReferencia.Referencia := '';
  if (Trim(str_cd_usuario) = '') then
    Exit;
  if qry_Forms.Active then
    qry_Forms.Close;
  I := 0;
  while I < Screen.FormCount do
  begin
    if qry_Forms.Active then
      qry_Forms.Close;
    if Screen.ActiveForm is TFrm_impressao then
      qry_Forms.ParamByName('NM_FORM').AsString := Screen.Forms[I].Name
    else
      qry_Forms.ParamByName('NM_FORM').AsString := Screen.ActiveForm.Name;
    qry_Forms.Open;
    if not qry_Forms.Eof then
      Break;
    Inc(I);
  end;

  if qry_Forms.Active and (qry_Forms.RecordCount > 0) then
  begin
    DataModule := Application.FindComponent(qry_FormsNM_DATA_MODULE.AsString);
    if Assigned(DataModule) then
    begin
      Query := TQuery(DataModule.FindComponent(qry_FormsNM_QUERY.AsString));
      if Assigned(Query) then
      begin
        if Assigned(Query.FieldByName(qry_FormsNM_CAMPO.AsString)) then
        begin
          S := Query.FieldByName(qry_FormsNM_CAMPO.AsString).AsString;
          case qry_FormsIN_PROCESSO.AsString[1] of
            // Processo
            '1': Result.Processo := S;
            // Instrução de Desembaraço
            '2': Result.Instrucao := S;
            // Pedido
            '3': begin
                   if Assigned(Query.FieldByName('CD_UNID_NEG')) then
                     Result.Pedido.Unidade := Query.FieldByName('CD_UNID_NEG').AsString;
                   if Assigned(Query.FieldByName('CD_PRODUTO')) then
                     Result.Pedido.Produto := Query.FieldByName('CD_PRODUTO').AsString;
                   if Assigned(Query.FieldByName('CD_CLIENTE')) then
                     Result.Pedido.Cliente := Query.FieldByName('CD_CLIENTE').AsString;
                   Result.Pedido.Referencia := S;
                 end;
          // Outros
          else // 0
            Result.OutraReferencia.Tabela := qry_FormsID_TABELA.AsInteger;
            Result.OutraReferencia.Referencia := S;
          end;
          {if qry_FormsIN_PROCESSO.AsString = '1' then
            Result.Processo := S
          else if qry_FormsIN_PROCESSO.AsString = '2' then // Criado para Instrução de Desembaraço
            Result.Instrucao := S
          else
          begin
            Result.OutraReferencia.Tabela := qry_FormsID_TABELA.AsInteger;
            Result.OutraReferencia.Referencia := S;
          end;}
        end;
      end;
    end;
  end;
end;

procedure Tdatm_main.MadExceptionHandler1Exception(
  const exceptIntf: IMEException; var handled: Boolean);
var
  Codigo: String;
  Body: String;
  Txt, Img: String;
  BugTxt: TStrings;
begin
  Codigo := FormatDateTime('ddmmyyyyhhnnss', Now);
  try
    Body := '<b>Usuario: </b>' + Trim(ConsultaLookUP('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'NM_USUARIO')) + '<br>' +
            '<b.Codigo: </b>' + str_cd_usuario + '<br><br>';

    if Assigned(exceptIntf.RelatedObject) then
    begin
      Body := '<b>Objeto Relacionado: </b>';
      if exceptIntf.RelatedObject is TComponent then
        Body := Body + TComponent(exceptIntf.RelatedObject).Name + ' = ' + exceptIntf.RelatedObject.ClassName
      else
        Body := Body + exceptIntf.RelatedObject.ClassName;
      Body := Body + '<br><br>';
    end;

    try
      if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'MadLog') then
        ForceDirectories(ExtractFilePath(Application.ExeName) + 'MadLog');
      Img := ExtractFilePath(Application.ExeName) + 'MadLog\' + Codigo + '.png';
      exceptIntf.ScreenShot.SavePng(Img);
      Txt := ExtractFilePath(Application.ExeName) + 'MadLog\' + Codigo + '.txt';
      BugTxt := TStringList.Create;
      try
        BugTxt.Text := exceptIntf.GetBugReport;
        BugTxt.SaveToFile(Txt);
      finally
        FreeAndNil(BugTxt);
      end;
      EnviaEmailHtml('[myIndaiá Local] Log de Exceção - ' + str_cd_usuario + '/' + Codigo, Body, 'log@myindaia.com.br', [Img, Txt{, GetLogFileName}]);
    except
      EnviaEmailHtml('[myIndaiá Local] Log de Exceção - ' + str_cd_usuario + '/' + Codigo, Body, 'log@myindaia.com.br', []);
    end;
  except
  end;
  MessageDlg('Um erro foi encontrado.'#13 +
             'Abra uma ocorrência informando o código ''' + str_cd_usuario + '/' + Codigo + ''' na ocorrência.', mtInformation, [mbOk], 0);
  handled := True;
end;

end.
