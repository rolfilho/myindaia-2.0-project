unit dDDE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ByHLLAPI, ServicoNovo,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_dde = class(TDataModule)
    qry_dde: TQuery;
    ds_dde: TDataSource;
    upd_dde: TUpdateSQL;
    qry_dde_re: TQuery;
    ds_dde_re: TDataSource;
    upd_dde_re: TUpdateSQL;
    qry_ddeNR_SD: TStringField;
    qry_ddeNR_REGISTRO_SD: TStringField;
    qry_ddeCD_EXPORTADOR: TStringField;
    qry_ddeCD_VIA_TRANSPORTE: TStringField;
    qry_ddeVL_TOTAL_PESO_LIQUIDO: TFloatField;                            
    qry_ddeVL_TOTAL_PESO_BRUTO: TFloatField;
    qry_ddeVL_TOTAL_COND_VENDA: TFloatField;
    qry_ddeQT_ESTAB_DESPACHO: TFloatField;
    qry_ddeCD_PROPRIETARIO: TStringField;
    qry_ddeTX_REGIMES_ADUANEIROS: TStringField;
    qry_ddeIN_INF_REPRESENTANTE_LEGAL: TStringField;
    qry_ddeIN_INF_DESPACHO_POSTERIOR: TStringField;
    qry_ddeIN_INF_DESP_CARGA_FRACIONADA: TStringField;
    qry_ddeIN_OUTROS_DOCS_INF_RECEPCAO: TStringField;
    qry_ddeIN_INF_PRESENCA_CARGA: TStringField;
    qry_ddeIN_INF_DADOS_EMBARQUE: TStringField;
    qry_ddeCD_URF_EMBARQUE: TStringField;
    qry_ddeCD_URF_DESPACHO: TStringField;
    qry_ddeCD_RECINTO: TStringField;
    qry_ddeCD_SETOR: TStringField;
    qry_ddeDT_VALIDADE_EMBARQUE: TDateTimeField;
    qry_ddeTX_NACIONALIDADE_EMBARCACAO: TStringField;
    qry_ddeCD_RECINTO_ALFANDEG: TStringField;
    qry_ddeTX_IDENT_VEIC_TRANSP: TStringField;
    qry_ddeTX_NUMERO_ESTABELECIMENTO: TStringField;
    qry_ddeDT_DATA_SD: TDateTimeField;
    qry_ddeTX_LOCAL_NAO_ALFANDEG: TStringField;
    qry_ddeQT_TOTAL_VOLUMES: TFloatField;
    qry_dde_espec: TQuery;
    upd_dde_espec: TUpdateSQL;
    ds_dde_espec: TDataSource;
    qry_dde_nf: TQuery;
    upd_dde_nf: TUpdateSQL;
    ds_dde_nf: TDataSource;
    qry_ddeNR_SUFIXO_CGC: TStringField;
    qry_ddeNomeExportador: TStringField;
    qry_dde_reNR_SD: TStringField;
    qry_dde_reNR_PROCESSO_RE: TStringField;
    qry_dde_reNR_RE_SISCOMEX: TStringField;
    qry_dde_reVL_SOMA_PESO_LIQUIDO: TFloatField;
    qry_dde_reVL_SOMA_COND_VENDA: TFloatField;
    qry_dde_reNR_ANEXO_INICIAL: TStringField;
    qry_dde_reNR_ANEXO_FINAL: TStringField;
    qry_dde_especNR_SD: TStringField;
    qry_dde_especNR_SEQ_ESPEC: TAutoIncField;
    qry_dde_especQT_ESPECIE: TFloatField;
    qry_dde_especTX_MARCACAO_VOLUME: TStringField;
    qry_dde_especDT_DATA: TDateTimeField;
    qry_dde_especCD_USUARIO: TStringField;
    qry_dde_especcalcTipoEmbalagem: TStringField;
    qry_dde_especCD_ESPECIE: TStringField;
    qry_dde_estab: TQuery;
    upd_dde_estab: TUpdateSQL;
    ds_dde_estab: TDataSource;
    qry_dde_estabNR_PROCESSO: TStringField;
    qry_dde_estabNR_ESTABELECIMENTO: TStringField;
    qry_dde_estabNR_SUFIXO_CGC: TStringField;
    qry_ddeCalcPrefixoCGC: TStringField;
    qry_ddeNR_SD_REDUZIDO: TStringField;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_exec_sp_: TQuery;
    qry_unid_neg_: TQuery;
    qry_usuario_habilitacao_: TQuery;
    qry_produto_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_exec_sp_CD_UNID_NEG: TStringField;
    qry_exec_sp_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_dde_envio: TQuery;
    qry_dde_espec_envio: TQuery;
    qry_dde_re_envio: TQuery;
    qry_dde_estab_envio: TQuery;
    qry_dde_nf_envio: TQuery;
    qry_ddeIN_SELECIONADO: TStringField;
    qry_ddeCalc_Status: TStringField;
    ByHLLAPI_DDE: TByHLLAPI;
    qry_ddeCPF_USUARIO: TStringField;
    qry_ddeTX_SITUCAO_DDE: TStringField;
    qry_fila_exp: TQuery;
    upd_fila_exp: TUpdateSQL;
    ds_fila_exp: TDataSource;
    qry_fila_expCD_FILA: TAutoIncField;
    qry_fila_expCD_USUARIO: TStringField;
    qry_fila_expNR_PROCESSO: TStringField;
    qry_fila_expDT_STATUS: TDateTimeField;
    qry_fila_expTX_STATUS: TStringField;
    qry_ddeIN_FILA: TStringField;
    qry_fila_expNM_USUARIO: TStringField;
    qry_fila_expDT_FILA: TDateTimeField;
    qry_fila_expDATA_FILA: TStringField;
    qry_fila_expHORA_FILA: TStringField;
    qry_fila_expDATA_STATUS: TStringField;
    qry_fila_expHORA_STATUS: TStringField;
    qry_dde_nfNR_SD: TStringField;
    qry_dde_nfNR_SEQ_NF: TAutoIncField;
    qry_dde_nfNR_NF_INICIAL: TStringField;
    qry_dde_nfNR_NF_FINAL: TStringField;
    qry_dde_nfNR_SERIE_NF: TStringField;
    qry_dde_nfDT_DATA: TDateTimeField;
    qry_dde_nfCD_USUARIO: TStringField;
    qry_dde_nfNR_ESTABELECIMENTO: TStringField;
    procedure AplicaUpdates(DataSet : TDataSet);
    procedure qry_ddeCalcFields(DataSet: TDataSet);
    procedure qry_dde_especBeforePost(DataSet: TDataSet);
    procedure qry_dde_nfBeforePost(DataSet: TDataSet);
    procedure ds_dde_especStateChange(Sender: TObject);
    procedure ds_dde_nfStateChange(Sender: TObject);
    procedure qry_dde_especAfterPost(DataSet: TDataSet);
    procedure qry_dde_especCalcFields(DataSet: TDataSet);
    procedure qry_dde_especAfterDelete(DataSet: TDataSet);
    procedure qry_dde_estabBeforePost(DataSet: TDataSet);
    procedure qry_dde_estabAfterInsert(DataSet: TDataSet);
    procedure ds_dde_estabStateChange(Sender: TObject);
    procedure qry_dde_estabAfterScroll(DataSet: TDataSet);
    procedure qry_dde_reBeforePost(DataSet: TDataSet);
    procedure qry_dde_reAfterPost(DataSet: TDataSet);
    procedure ds_ddeDataChange(Sender: TObject; Field: TField);
    procedure qry_dde_reAfterDelete(DataSet: TDataSet);
    procedure qry_dde_envioAfterOpen(DataSet: TDataSet);
    procedure qry_dde_envioAfterScroll(DataSet: TDataSet);
    procedure qry_dde_envioAfterClose(DataSet: TDataSet);
    procedure qry_dde_estab_envioAfterOpen(DataSet: TDataSet);
    procedure qry_dde_estab_envioAfterScroll(DataSet: TDataSet);
    procedure qry_dde_estab_envioAfterClose(DataSet: TDataSet);
    procedure qry_ddeAfterInsert(DataSet: TDataSet);
    procedure qry_ddeAfterScroll(DataSet: TDataSet);
    procedure qry_fila_expAfterPost(DataSet: TDataSet);
    procedure qry_ddeAfterDelete(DataSet: TDataSet);
    procedure qry_fila_expAfterDelete(DataSet: TDataSet);
    procedure qry_fila_expBeforeDelete(DataSet: TDataSet);
    procedure qry_dde_nfAfterPost(DataSet: TDataSet);
  private
    procedure AtualizaCgcNF;
  public
    function UltimoEstabelecimento : Integer;
  end;

var
  datm_dde: Tdatm_dde;
  st_modificar, st_incluir, st_excluir : Boolean;

implementation

uses uDDE, ConsOnLineEx, Funcoes, FuncoesExport;

{$R *.DFM}

procedure Tdatm_dde.AplicaUpdates(DataSet : TDataSet);
begin


  TQuery(DataSet).ApplyUpdates;


  
  with TQuery.Create(Application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TPROCESSO');
    SQL.Add('SET NR_DDE     =:NR_DDE,');
    // ADICIONADO PARA MANTER APENAS UM UPDATE - MICHEL - 14/11/2008
    SQL.Add('    CD_DESPACHANTE = ''' + ConsultaLookUp('TDESPACHANTE', 'CPF_DESPACHANTE', qry_ddeCPF_USUARIO.AsString, 'CD_DESPACHANTE') + ''',');
    SQL.Add(IIF(qry_ddeDT_DATA_SD.AsDateTime = 0,'DT_REG_DDE = NULL','DT_REG_DDE =:DT_REG_DDE')); //se a data estiver vazia, joga NULO pois senão ele salva como 30/12/1899
    SQL.Add('WHERE NR_PROCESSO =:NR_SD');

    ParamByName('NR_DDE').AsString       := Copy(qry_ddeNR_REGISTRO_SD.AsString,1,10) + Copy(qry_ddeNR_REGISTRO_SD.AsString,12,1);

    if qry_ddeDT_DATA_SD.AsDateTime <> 0 then
      ParamByName('DT_REG_DDE').AsDateTime := qry_ddeDT_DATA_SD.AsDateTime;

    ParamByName('NR_SD').AsString          := qry_ddeNR_SD.AsString;

    ExecSql;
    Free;
  end;
  AtualizaCgcNF;
end;

procedure Tdatm_dde.AtualizaCgcNF;
begin
  if qry_ddeQT_ESTAB_DESPACHO.AsInteger = 1 then begin
    with TQuery.Create(Application) do begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TSD_ESTAB_NF');
      SQL.Add('SET NR_SUFIXO_CGC =:NR_SUFIXO_CGC');
      SQL.Add('WHERE');
      SQL.Add('   NR_PROCESSO =:NR_PROCESSO');
      ParamByName('NR_PROCESSO').AsString   := qry_ddeNR_SD.AsString;
      ParamByName('NR_SUFIXO_CGC').AsString := Copy(frm_dde.Edt_cnpj2.Text, 9, 7);
      ExecSql;
      Free;
    end;
  end;
end;

procedure Tdatm_dde.qry_ddeCalcFields(DataSet: TDataSet);
begin
  qry_dde.FieldByName('NomeExportador').AsString    := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',qry_dde.FieldByName('CD_EXPORTADOR').AsString,'NM_EMPRESA');
  qry_dde.FieldByName('Calc_Status').AsString       := '';

  if qry_dde.FieldByName('IN_SELECIONADO').AsString = '1' then
    qry_dde.FieldByName('Calc_Status').AsString      := 'ü';
end;

procedure Tdatm_dde.qry_dde_especBeforePost(DataSet: TDataSet);
begin
  datm_dde.qry_dde_espec.FieldByName('NR_SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
end;

procedure Tdatm_dde.qry_dde_nfBeforePost(DataSet: TDataSet);
begin
  datm_dde.qry_dde_nf.FieldByName('NR_ESTABELECIMENTO').AsString := datm_dde.qry_dde_estab.FieldByName('NR_ESTABELECIMENTO').AsString;
  datm_dde.qry_dde_nf.FieldByName('NR_SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
end;

procedure Tdatm_dde.ds_dde_especStateChange(Sender: TObject);
begin
  with frm_dde do begin
    btn_incluir.Enabled   := (not (qry_dde_espec.State in [dsEdit,dsInsert]) and (pgDDE.ActivePageIndex = 2));
    btn_salvar.Enabled    := (qry_dde_espec.State in [dsEdit,dsInsert]) and (pgDDE.ActivePageIndex = 2);
    btn_cancelar.Enabled  := (qry_dde_espec.State in [dsEdit,dsInsert]) and (pgDDE.ActivePageIndex = 2);
    btn_excluir.Enabled   := (not (qry_dde_espec.IsEmpty)) and (pgDDE.ActivePageIndex = 2);
  end;
end;

procedure Tdatm_dde.ds_dde_nfStateChange(Sender: TObject);
begin
  with frm_dde do begin
    btn_incluir.Enabled   := (not (qry_dde_nf.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde_nf.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde_nf.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde_nf.IsEmpty));
  end;
end;

procedure Tdatm_dde.qry_dde_especAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
  frm_dde.AtualizaQtTotalVolumes;
end;

procedure Tdatm_dde.qry_dde_especCalcFields(DataSet: TDataSet);
begin
  qry_dde_espec.FieldByName('calcTipoEmbalagem').AsString := ConsultaLookUP('TTP_EMBALAGEM','CODIGO',qry_dde_espec.FieldByname('CD_ESPECIE').AsString,'DESCRICAO');
end;

procedure Tdatm_dde.qry_dde_especAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
  frm_dde.AtualizaQtTotalVolumes;
end;

procedure Tdatm_dde.qry_dde_estabBeforePost(DataSet: TDataSet);
begin
  datm_dde.qry_dde_estab.FieldByName('NR_PROCESSO').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
end;

function Tdatm_dde.UltimoEstabelecimento : Integer;
Begin
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_ESTABELECIMENTO),0) FROM TSD_ESTAB_NF (NOLOCK) WHERE NR_PROCESSO = ''' + qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

procedure Tdatm_dde.qry_dde_estabAfterInsert(DataSet: TDataSet);
var
  vIntAux : Integer;
begin
  vIntAux := UltimoEstabelecimento + 1;
  datm_dde.qry_dde_estab.FieldByName('NR_ESTABELECIMENTO').AsString := copy('00',1,2-length(IntToStr(vIntAux))) + IntToStr(vIntAux);
end;

procedure Tdatm_dde.ds_dde_estabStateChange(Sender: TObject);
begin
  with frm_dde do begin
    btn_incluir_estab.Enabled   := (not (qry_dde_estab.State in [dsEdit,dsInsert]));
    btn_salvar_estab.Enabled    := (qry_dde_estab.State in [dsEdit,dsInsert]);
    btn_cancelar_estab.Enabled  := (qry_dde_estab.State in [dsEdit,dsInsert]);
    btn_excluir_estab.Enabled   := (not (qry_dde_estab.IsEmpty));
  end;
end;

procedure Tdatm_dde.qry_dde_estabAfterScroll(DataSet: TDataSet);
begin
  frm_dde.pnlEstabelecimentos.Visible := frm_dde.PodeIncluirEstabelecimento;
end;

procedure Tdatm_dde.qry_dde_reBeforePost(DataSet: TDataSet);
begin
  if qry_dde_re.FieldByName('NR_RE_SISCOMEX').AsString = '' then begin
    qry_dde_re.Cancel;
    MessageDlg('Deve ser informado o Numero do RE.', mtInformation, [mbOk], 0);
    Abort;
  end;
  datm_dde.qry_dde_re.FieldByName('NR_SD').AsString  := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
end;

procedure Tdatm_dde.qry_dde_reAfterPost(DataSet: TDataSet);
begin
  qry_dde_re.ApplyUpdates;
  frm_dde.AtualizaValoresDDE;
end;

procedure Tdatm_dde.ds_ddeDataChange(Sender: TObject; Field: TField);
begin
  with frm_dde do begin
    btn_incluir.Enabled   := (not (qry_dde.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_re.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_re.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde.IsEmpty));
  end;
end;

procedure Tdatm_dde.qry_dde_reAfterDelete(DataSet: TDataSet);
begin
  qry_dde_re.ApplyUpDates;
end;

procedure Tdatm_dde.qry_dde_envioAfterOpen(DataSet: TDataSet);
begin
  datm_dde.qry_dde_re_envio.Close;
  datm_dde.qry_dde_re_envio.ParamByName('NR_SD').AsString    := datm_dde.qry_dde_envio.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_re_envio.Prepare;
  datm_dde.qry_dde_re_envio.Open;

  datm_dde.qry_dde_espec_envio.Close;
  datm_dde.qry_dde_espec_envio.ParamByName('NR_SD').AsString := datm_dde.qry_dde_envio.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_espec_envio.Prepare;
  datm_dde.qry_dde_espec_envio.Open;

  datm_dde.qry_dde_estab_envio.Close;
  datm_dde.qry_dde_estab_envio.ParamByName('NR_SD').AsString := datm_dde.qry_dde_envio.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_estab_envio.Prepare;
  datm_dde.qry_dde_estab_envio.Open;
end;

procedure Tdatm_dde.qry_dde_envioAfterScroll(DataSet: TDataSet);
begin
  datm_dde.qry_dde_re_envio.Close;
  datm_dde.qry_dde_re_envio.ParamByName('NR_SD').AsString    := datm_dde.qry_dde_envio.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_re_envio.Prepare;
  datm_dde.qry_dde_re_envio.Open;

  datm_dde.qry_dde_espec_envio.Close;
  datm_dde.qry_dde_espec_envio.ParamByName('NR_SD').AsString := datm_dde.qry_dde_envio.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_espec_envio.Prepare;
  datm_dde.qry_dde_espec_envio.Open;

  datm_dde.qry_dde_estab_envio.Close;
  datm_dde.qry_dde_estab_envio.ParamByName('NR_SD').AsString := datm_dde.qry_dde_envio.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_estab_envio.Prepare;
  datm_dde.qry_dde_estab_envio.Open;
end;

procedure Tdatm_dde.qry_dde_envioAfterClose(DataSet: TDataSet);
begin
  datm_dde.qry_dde_re_envio.Close;
  datm_dde.qry_dde_espec_envio.Close;
  datm_dde.qry_dde_estab_envio.Close;
end;

procedure Tdatm_dde.qry_dde_estab_envioAfterOpen(DataSet: TDataSet);
begin
  datm_dde.qry_dde_nf_envio.Close;
  datm_dde.qry_dde_nf_envio.ParamByName('NR_PROCESSO').AsString := datm_dde.qry_dde_estab_envio.FieldByName('NR_PROCESSO').AsString;
  datm_dde.qry_dde_nf_envio.ParamByName('NR_ESTABELECIMENTO').AsString := datm_dde.qry_dde_estab_envio.FieldByName('NR_ESTABELECIMENTO').AsString;
  datm_dde.qry_dde_nf_envio.Prepare;
  datm_dde.qry_dde_nf_envio.Open;
end;

procedure Tdatm_dde.qry_dde_estab_envioAfterScroll(DataSet: TDataSet);
begin
  datm_dde.qry_dde_nf_envio.Close;
  datm_dde.qry_dde_nf_envio.ParamByName('NR_PROCESSO').AsString := datm_dde.qry_dde_estab_envio.FieldByName('NR_PROCESSO').AsString;
  datm_dde.qry_dde_nf_envio.ParamByName('NR_ESTABELECIMENTO').AsString := datm_dde.qry_dde_estab_envio.FieldByName('NR_ESTABELECIMENTO').AsString;
  datm_dde.qry_dde_nf_envio.Prepare;
  datm_dde.qry_dde_nf_envio.Open;
end;

procedure Tdatm_dde.qry_dde_estab_envioAfterClose(DataSet: TDataSet);
begin
  datm_dde.qry_dde_nf_envio.Close;
end;

procedure Tdatm_dde.qry_ddeAfterInsert(DataSet: TDataSet);
begin
  qry_ddeIN_INF_DESP_CARGA_FRACIONADA.AsString := '0';
  qry_ddeIN_INF_DESPACHO_POSTERIOR.AsString    := '0';
end;

procedure Tdatm_dde.qry_ddeAfterScroll(DataSet: TDataSet);
begin
  frm_dde.PnlSituacao.Visible := qry_ddeTX_SITUCAO_DDE.AsString <> '';
end;

procedure Tdatm_dde.qry_fila_expAfterPost(DataSet: TDataSet);
begin
  qry_fila_exp.ApplyUpdates;
end;

procedure Tdatm_dde.qry_ddeAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_dde.qry_fila_expAfterDelete(DataSet: TDataSet);
begin
  qry_fila_exp.ApplyUpdates;
end;

procedure Tdatm_dde.qry_fila_expBeforeDelete(DataSet: TDataSet);
begin
 if not st_excluir then
   abort;


  //qdo se elimina um registro da FILA via programa - deve-se retira-lo da fila do TSD tbem
  with TQuery.Create(Application) do begin
     DataBaseName := 'DBBROKER';
     SQL.Clear;
     Sql.Add(' update TSD set IN_FILA="0" ');
     Sql.Add('  WHERE NR_SD = "' + qry_fila_expNR_PROCESSO.AsString + '"');
     ExecSQL;
     Free;
  end;

end;

procedure Tdatm_dde.qry_dde_nfAfterPost(DataSet: TDataSet);
begin
  if (Trim(qry_dde_nfNR_NF_INICIAL.AsString) = '') and
     (Trim(qry_dde_nfNR_NF_FINAL.AsString) = '') and
     (Trim(qry_dde_nfNR_SERIE_NF.AsString) = '') then
    TQuery(DataSet).CancelUpdates
  else
    AplicaUpdates(DataSet);
end;

end.
