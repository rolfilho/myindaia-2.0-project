unit PGSM076;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ConsOnlineEx, Funcoes;


type
  Tdatm_cliente_servico = class(TDataModule)
    ds_cliente_servico: TDataSource;
    qry_cliente_servico_: TQuery;
    ds_empresa_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_servico: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_cliente_servico_IN_ATIVO: TStringField;
    qry_cliente_servico_NR_DPS: TStringField;
    qry_cliente_servico_DT_CAPTACAO: TDateTimeField;
    qry_cliente_servico_PZ_PROPOSTA: TIntegerField;
    qry_cliente_servico_IN_INCIDE_SDA: TStringField;
    qry_cliente_servico_LookCliente: TStringField;
    qry_cliente_servico_LookUnidNeg: TStringField;
    qry_cliente_servico_LookProduto: TStringField;
    qry_cliente_servico_LookServico: TStringField;
    qry_cliente_servico_LookAtivo: TStringField;
    qry_cliente_servico_LookIncideSDA: TStringField;
    qry_cliente_servico_DT_AUTORIZACAO: TDateTimeField;
    qry_cliente_servico_CD_PREFIXO: TStringField;
    qry_cliente_servico_CD_BANCO_DEB_CC: TStringField;
    qry_cliente_servico_CD_BANCO_COM: TStringField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_cliente_servico_LookBancoDebCC: TStringField;
    qry_cliente_servico_LookBancoCom: TStringField;
    qry_cliente_servico_CD_BANCO_DEB_COM: TStringField;
    qry_cliente_servico_LookBancoDebCom: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_exclui_: TQuery;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_cliente_servico_IN_CPMF_NUM: TStringField;
    qry_cliente_servico_LookCpmfNum: TStringField;
    qry_tot_proc_: TQuery;
    qry_tot_proc_TOT_PROC: TIntegerField;
    qry_cliente_servico_CD_TAB_SDA: TStringField;
    qry_sda_: TQuery;
    qry_cliente_servico_LookSDA: TStringField;
    qry_sda_CD_SDA: TStringField;
    qry_sda_TX_DESCRICAO: TStringField;
    qry_cliente_servico_IN_REL_VOL_MOD2: TStringField;
    qry_cliente_servico_IN_LANCA_SOLIC: TStringField;
    dsClienteServicoFrete: TDataSource;
    qryClienteServicoFrete: TQuery;
    updClienteServicoFrete: TUpdateSQL;
    qryClienteServicoFreteCD_CLIENTE: TStringField;
    qryClienteServicoFreteCD_UNID_NEG: TStringField;
    qryClienteServicoFreteCD_PRODUTO: TStringField;
    qryClienteServicoFreteCD_SERVICO: TStringField;
    qryClienteServicoFreteCD_TAB_FRETE: TStringField;
    qryClienteServicoFretecalcFRETE: TStringField;
    qry_cliente_servico_IN_HORA_EVENTOS: TBooleanField;
    upd_cliente_servico: TUpdateSQL;
    procedure qry_cliente_servico_AfterScroll(DataSet: TDataSet);
    procedure qryClienteServicoFreteCalcFields(DataSet: TDataSet);
    procedure qryClienteServicoFreteAfterDelete(DataSet: TDataSet);
    procedure qryClienteServicoFreteBeforePost(DataSet: TDataSet);
    procedure qryClienteServicoFreteAfterPost(DataSet: TDataSet);
    procedure qryClienteServicoFreteNewRecord(DataSet: TDataSet);
    procedure ds_cliente_servicoStateChange(Sender: TObject);
    procedure qryClienteServicoFreteUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_cliente_servico_BeforeOpen(DataSet: TDataSet);
  private
    vPreencheu: Boolean;
    FServicoNovo: Boolean;
    procedure SetServicoNovo(const Value: Boolean);
    function GetServicoNovo: Boolean;
  public
    property ServicoNovo: Boolean read GetServicoNovo;// write SetServicoNovo;
  end;

var
  datm_cliente_servico: Tdatm_cliente_servico;

implementation

uses PGSM075;

{$R *.DFM}

procedure Tdatm_cliente_servico.qry_cliente_servico_AfterScroll(DataSet: TDataSet);
begin
    qryClienteServicoFrete.Close;
    qryClienteServicoFrete.Open;

  with frm_cliente_servico do
  begin
    btn_numerario.Enabled     := qry_cliente_servico_.RecordCount > 0;
    btn_faturamento.Enabled   := qry_cliente_servico_.RecordCount > 0;
    btn_itens_por_ton.Enabled := qry_cliente_servico_.RecordCount > 0;
    btn_duplicacao.Enabled    := qry_cliente_servico_.RecordCount > 0;
    btn_fat_compl.Enabled     := qry_cliente_servico_.RecordCount > 0;
    btn_repres.Enabled        := qry_cliente_servico_.RecordCount > 0;

    dbedt_cd_tab_sda.ReadOnly := str_tp_tab_sda = '0';
    btn_co_tab_sda.Enabled    := str_tp_tab_sda = '1';
    if str_tp_tab_sda = '0' then
    begin
      dbedt_cd_tab_sda.Color    := clMenu;
      dbedt_cd_tab_sda.TabStop  := False;
      dbedt_cd_tab_sda.ReadOnly := True;
    end
    else
    begin
      dbedt_cd_tab_sda.Color    := clWindow;
      dbedt_cd_tab_sda.TabStop  := True;
      dbedt_cd_tab_sda.ReadOnly := False;
    end;
    vAlteracaoFrete := 0;
  end;

end;

procedure Tdatm_cliente_servico.qryClienteServicoFreteCalcFields(DataSet: TDataSet);
begin
  if ServicoNovo then
    DataSet.FieldByName('calcFRETE').AsString := ConsultaLookUpSQL(' SELECT DESC_TAB_FRETE ' +
                                                                   ' FROM TTAB_FRETE ' +
                                                                   ' WHERE CD_TAB_FRETE = "' + DataSet.FieldByName('CD_TAB_FRETE').AsString + '" ' +
                                                                   '   AND IN_DESEMBARACO IN (1,2)' +
                                                                   '   AND CD_VIA_TRANSP IN (SELECT CD_VIA_TRANSPORTE ' +
                                                                   '                         FROM TSERVICO_NOVO ' +
                                                                   '                         WHERE CD_SERVICO = ' + qry_cliente_servico_CD_SERVICO.ASString + ')', 'DESC_TAB_FRETE')
  else
    DataSet.FieldByName('calcFRETE').AsString := ConsultaLookUpSQL(' SELECT DESC_TAB_FRETE ' +
                                                                   ' FROM TTAB_FRETE ' +
                                                                   ' WHERE CD_TAB_FRETE = "' + DataSet.FieldByName('CD_TAB_FRETE').AsString + '" ' +
                                                                   '   AND IN_DESEMBARACO IN (1,2)' +
                                                                   '   AND CD_VIA_TRANSP IN (SELECT CD_VIA_TRANSPORTE ' +
                                                                   '                         FROM TSERVICO ' +
                                                                   '                         WHERE CD_SERVICO = "' + qry_cliente_servico_CD_SERVICO.ASString + '")', 'DESC_TAB_FRETE');
end;

procedure Tdatm_cliente_servico.qryClienteServicoFreteAfterDelete(DataSet: TDataSet);
begin
  qryClienteServicoFrete.ApplyUpdates;
end;

procedure Tdatm_cliente_servico.qryClienteServicoFreteBeforePost(DataSet: TDataSet);
begin
  if ServicoNovo then
    vPreencheu := (ConsultaLookUpSQL(' SELECT DESC_TAB_FRETE ' +
                                     ' FROM TTAB_FRETE ' +
                                     ' WHERE CD_TAB_FRETE = "' + DataSet.FieldByName('CD_TAB_FRETE').AsString + '" ' +
                                     '   AND IN_DESEMBARACO IN (1,2) ' +
                                     '   AND CD_VIA_TRANSP IN (SELECT CD_VIA_TRANSPORTE ' +
                                     '                         FROM TSERVICO_NOVO ' +
                                     '                         WHERE CD_SERVICO = ' + qry_cliente_servico_CD_SERVICO.ASString + ')', 'DESC_TAB_FRETE') <> '')
  else
    vPreencheu := (ConsultaLookUpSQL(' SELECT DESC_TAB_FRETE ' +
                                     ' FROM TTAB_FRETE ' +
                                     ' WHERE CD_TAB_FRETE = "' + DataSet.FieldByName('CD_TAB_FRETE').AsString + '" ' +
                                     '   AND IN_DESEMBARACO IN (1,2) ' +
                                     '   AND CD_VIA_TRANSP IN (SELECT CD_VIA_TRANSPORTE ' +
                                     '                         FROM TSERVICO ' +
                                     '                         WHERE CD_SERVICO = "' + qry_cliente_servico_CD_SERVICO.ASString + '")', 'DESC_TAB_FRETE') <> '');
end;

procedure Tdatm_cliente_servico.qryClienteServicoFreteAfterPost(DataSet: TDataSet);
begin
  if vPreencheu then
    qryClienteServicoFrete.ApplyUpdates
  else
    ShowMessage('Os Dados são inconsistentes. Operação será cancelada!');

  qryClienteServicoFrete.Close;
  qryClienteServicoFrete.Open;
end;

procedure Tdatm_cliente_servico.qryClienteServicoFreteNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('CD_UNID_NEG').AsString := qry_cliente_servico_CD_UNID_NEG.AsString;
  DataSet.FieldByName('CD_PRODUTO').AsString := qry_cliente_servico_CD_PRODUTO.AsString;
  DataSet.FieldByName('CD_SERVICO').AsString := qry_cliente_servico_CD_SERVICO.AsString;
  DataSet.FieldByName('CD_CLIENTE').AsString := qry_cliente_servico_CD_CLIENTE.AsString;
end;

procedure Tdatm_cliente_servico.ds_cliente_servicoStateChange(
  Sender: TObject);
begin
  frm_cliente_servico.lbl1.Visible :=  (qry_cliente_servico_.State in [dsInsert, dsEdit]);
  frm_cliente_servico.Label3.Visible :=  not (qry_cliente_servico_.State in [dsInsert, dsEdit]);
  frm_cliente_servico.dbgrdTabFrete.Visible :=  not (qry_cliente_servico_.State in [dsInsert, dsEdit]);
end;

procedure Tdatm_cliente_servico.qryClienteServicoFreteUpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort;
  TrataErro(E);
end;

procedure Tdatm_cliente_servico.SetServicoNovo(const Value: Boolean);
var
  I: Integer;
  Ativo: Boolean;
  SQL: string;
begin
  if ServicoNovo <> Value then
  begin
    //FServicoNovo := Value;

    I := 0;
    while I < ComponentCount do
    begin
      if (Components[I] is TQuery) and (Components[I] <> qry_servico_) then
      begin
        Ativo := TQuery(Components[I]).Active;
        TQuery(Components[I]).Active := False;

        SQL := TQuery(Components[I]).SQL.Text;
        if Value then
        begin
          SQL := StringReplace(SQL, 'TSERVICO ', 'TSERVICO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO'#13, 'TSERVICO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO ', 'TSERVICO_EVENTO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO'#13, 'TSERVICO_EVENTO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
        end
        else
        begin
          SQL := StringReplace(SQL, 'TSERVICO_NOVO ', 'TSERVICO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_NOVO'#13, 'TSERVICO'#13, [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO_NOVO ', 'TSERVICO_EVENTO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO_NOVO'#13, 'TSERVICO_EVENTO'#13, [rfReplaceAll, rfIgnoreCase]);
        end;

        TQuery(Components[I]).SQL.Text := SQL;

        if TQuery(Components[I]).FieldList.IndexOf('CD_SERVICO') >= 0 then
          TQuery(Components[I]).FieldByName('CD_SERVICO').Free;
        try
          TQuery(Components[I]).FieldDefs.Update;
        except
        end;
        if TQuery(Components[I]).FieldDefs.IndexOf('CD_SERVICO') >= 0 then
        begin
          qry_servico_CD_SERVICO := TStringField(TQuery(Components[I]).FieldDefs.Find('CD_SERVICO').CreateField(TQuery(Components[I])));
          TQuery(Components[I]).FieldByName('CD_SERVICO').DisplayLabel := 'Código';
        end;

        TQuery(Components[I]).Active := Ativo;
      end;

      Inc(I);
    end;
  end;
end;

function Tdatm_cliente_servico.GetServicoNovo: Boolean;
begin
  //Result := qry_cliente_servico_.Active and ((Length(Trim(qry_cliente_servico_CD_SERVICO.AsString)) < 3) or
  //   ((Trim(qry_cliente_servico_CD_SERVICO.AsString) <> '') and (ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
  //                                                                                 ' FROM TSERVICO_NOVO ' +
  //                                                                                 ' WHERE CD_SERVICO = ' + Trim(qry_cliente_servico_CD_SERVICO.AsString), 'QTD') <> '0' )));
  Result := FServicoNovo;
end;

procedure Tdatm_cliente_servico.qry_cliente_servico_BeforeOpen(DataSet: TDataSet);
begin
  FServicoNovo := ConsultaLookUPSQL('SELECT CASE WHEN ((DT_NOVO_FOLLOWUP_EXP IS NOT NULL) OR (DT_NOVO_FOLLOWUP_IMP IS NOT NULL)) THEN 1 ELSE 0 END AS IN_SERVICO_NOVO ' +
                                    'FROM TEMPRESA_NAC E ' +
                                    '  INNER JOIN TGRUPO G ON G.CD_GRUPO = E.CD_GRUPO ' +
                                    'WHERE E.CD_EMPRESA = :CD_EMPRESA', 'IN_SERVICO_NOVO', [qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString]) = '1';
end;

end.
