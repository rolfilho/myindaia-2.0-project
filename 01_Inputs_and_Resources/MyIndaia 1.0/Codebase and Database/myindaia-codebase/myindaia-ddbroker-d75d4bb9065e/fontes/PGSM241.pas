unit PGSM241;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes;

type
  Tdatm_viagem = class(TDataModule)
    ds_viagem: TDataSource;
    qry_viagem_: TQuery;
    qry_ult_viagem_: TQuery;
    qry_produto_: TQuery;
    qry_unid_neg_: TQuery;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_AP_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_AP_PRODUTO: TStringField;
    qry_lista_: TQuery;
    ds_lista: TDataSource;
    qry_lista_NR_VIAGEM: TStringField;
    qry_lista_DT_ESPERADA: TDateTimeField;
    qry_lista_DT_ENT: TDateTimeField;
    qry_lista_NM_ARMAZEM: TStringField;
    qry_lista_NR_MANIFESTO: TStringField;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_lista_CD_PRODUTO: TStringField;
    qry_lista_CD_EMBARCACAO: TStringField;
    qry_viagem_CD_UNID_NEG: TStringField;
    qry_viagem_CD_PRODUTO: TStringField;
    qry_viagem_CD_EMBARCACAO: TStringField;
    qry_viagem_NR_VIAGEM: TStringField;
    qry_viagem_DT_ESPERADA: TDateTimeField;
    qry_viagem_DT_ENT: TDateTimeField;
    qry_viagem_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_viagem_NR_MANIFESTO: TStringField;
    qry_embarcacao_: TQuery;
    qry_armazem_: TQuery;
    qry_viagem_LookUnidNeg: TStringField;
    qry_viagem_LookProduto: TStringField;
    qry_viagem_LookEmbarcacao: TStringField;
    qry_viagem_LookArmazemAtracacao: TStringField;
    qry_param_: TQuery;
    qry_ult_dt_esperada_: TQuery;
    qry_yes_no_: TQuery;
    qry_viagem_IN_TRANSBORDO: TStringField;
    qry_viagem_LookTransbordo: TStringField;
    sp_ev_prev_fabrica_viagem: TStoredProc;
    qry_local_: TQuery;
    qry_viagem_LookLocal: TStringField;
    qry_viagem_CD_LOCAL: TStringField;
    qry_lista_DESCRICAO: TStringField;
    qry_lista_CD_LOCAL: TStringField;
    qry_viagem_DT_DEADLINE_BL: TDateTimeField;
    qry_viagem_DT_DEADLINE_CARGA: TDateTimeField;
    qry_viagem_NR_TRANSIT_TIME: TFloatField;
    qry_viagem_DT_ABERTURA_GATE: TDateTimeField;
    qry_viagem_DT_PREVISTA_ORIGEM_DESTINO: TDateTimeField;
    qry_viagem_NR_VIAGEM_ARMADOR: TStringField;
    qry_viagem_DT_DEADLINE_IMO: TDateTimeField;
    qry_viagem_CD_CIDADE: TStringField;
    qry_viagem_CD_UF: TStringField;
    qry_viagem_CD_PAIS: TStringField;
    qry_viagem_TX_BANDEIRA: TStringField;
    qry_viagem_NR_FONTE: TIntegerField;
    qry_viagem_DT_DEADLINE_CARTA_TEMP: TDateTimeField;
    qry_viagem_HR_DEADLINE_CARTA_TEMP: TStringField;
    qry_viagem_HR_DEADLINE_BL: TStringField;
    qry_viagem_HR_DEADLINE_CARGA: TStringField;
    qry_viagem_HR_DEADLINE_IMO: TStringField;
    qry_viagem_HR_ABERTURA_GATE: TStringField;
    ds_viagem_DeadLine: TDataSource;
    qry_viagem_DeadLine: TQuery;
    qry_viagem_DeadLineCD_UNID_NEG: TStringField;
    qry_viagem_DeadLineCD_PRODUTO: TStringField;
    qry_viagem_DeadLineCD_EMBARCACAO: TStringField;
    qry_viagem_DeadLineNR_VIAGEM: TStringField;
    qry_viagem_DeadLineCD_AGENTE: TStringField;
    qry_viagem_DeadLineTP_ESTUFAGEM: TStringField;
    qry_viagem_DeadLineDT_DEADLINE_BL: TDateTimeField;
    qry_viagem_DeadLineHR_DEADLINE_BL: TStringField;
    qry_viagem_DeadLineDT_DEADLINE_CARGA: TDateTimeField;
    qry_viagem_DeadLineHR_DEADLINE_CARGA: TStringField;
    qry_viagem_DeadLineDT_DEADLINE_IMO: TDateTimeField;
    qry_viagem_DeadLineHR_DEADLINE_IMO: TStringField;
    qry_viagem_DeadLineDT_ABERTURA_GATE: TDateTimeField;
    qry_viagem_DeadLineHR_ABERTURA_GATE: TStringField;
    qry_viagem_DeadLineDT_DEADLINE_CARTA_TEMP: TDateTimeField;
    qry_viagem_DeadLineHR_DEADLINE_CARTA_TEMP: TStringField;
    qry_viagem_DeadLinecalcEstufagem: TStringField;
    qry_viagem_DeadLinecalcDtHrBL: TStringField;
    qry_viagem_DeadLinecalcDtHrCarga: TStringField;
    qry_viagem_DeadLinecalcDtHrImo: TStringField;
    qry_viagem_DeadLinecalcDtHrGate: TStringField;
    qry_viagem_DeadLinecalcDtHrTemp: TStringField;
    updViagem_DeadLine: TUpdateSQL;
    qry_viagem_DeadLineNM_AGENTE: TStringField;
    upd_viagem_: TUpdateSQL;
    qry_viagem_CD_CRIADOR_VIAGEM: TStringField;
    qry_viagem_NM_USUARIO: TStringField;
    qry_viagem_DeadLineCD_RESP_ALTERACAO: TStringField;
    qry_viagem_DeadLineDT_ALTERACAO: TDateTimeField;
    qry_viagem_DeadLineVIAGEMDOAGENTE: TStringField;
    qry_viagem_DeadLineDT_DEADLINE_VGM: TDateTimeField;
    qry_viagem_DeadLineHR_DEADLINE_VGM: TStringField;
    procedure qry_viagem_CalcFields(DataSet: TDataSet);
    procedure qry_lista_BeforeOpen(DataSet: TDataSet);
    procedure qry_viagem_AfterPost(DataSet: TDataSet);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_viagem_AfterScroll(DataSet: TDataSet);
    procedure qry_viagem_DeadLineAfterInsert(DataSet: TDataSet);
    procedure qry_viagem_AfterOpen(DataSet: TDataSet);
    procedure qry_viagem_DeadLineCalcFields(DataSet: TDataSet);
    procedure qry_viagem_DeadLineAfterPost(DataSet: TDataSet);
    procedure qry_viagem_AfterDelete(DataSet: TDataSet);
    procedure qry_viagem_AfterClose(DataSet: TDataSet);
    procedure qry_viagem_DT_ESPERADAChange(Sender: TField);
    procedure qry_viagem_DeadLineNewRecord(DataSet: TDataSet);
  private
    FAtualizandoData: Boolean;
  public
    { Public declarations }
  end;

var
  datm_viagem: Tdatm_viagem;

implementation

uses GSMLIB, PGSM240;

{$R *.DFM}

procedure Tdatm_viagem.qry_viagem_CalcFields(DataSet: TDataSet);
begin
  {Unidade de Negócio}
  qry_viagem_LookUnidNeg.AsString := Lookup( qry_unid_neg_, qry_viagem_CD_UNID_NEG, 'CD_UNID_NEG', 'AP_UNID_NEG' );
  {Produto}
  qry_viagem_LookProduto.AsString := Lookup( qry_produto_, qry_viagem_CD_PRODUTO, 'CD_PRODUTO', 'AP_PRODUTO' );
  {Embarcação}
  qry_viagem_LookEmbarcacao.AsString := Lookup( qry_embarcacao_, qry_viagem_CD_EMBARCACAO, 'CD_EMBARCACAO', 'NM_EMBARCACAO' );
  {Armazém de Atracação}
  qry_viagem_LookArmazemAtracacao.AsString := Lookup( qry_armazem_, qry_viagem_CD_ARMAZEM_ATRACACAO, 'CD_ARMAZEM', 'NM_ARMAZEM' );
  {Local Embarque/Desembarque}
  qry_viagem_LookLocal.AsString := Lookup(qry_local_, qry_viagem_CD_LOCAL, 'CD_LOCAL', 'DESCRICAO');
end;

procedure Tdatm_viagem.qry_lista_BeforeOpen(DataSet: TDataSet);
begin
  with frm_viagem do
  begin
    if Trim( msk_cd_produto.Text ) = '01' then
    begin
      qry_lista_DT_ESPERADA.DisplayLabel := 'Dt. Esperada';
      qry_lista_DT_ENT.DisplayLabel      := 'Dt. Entrada';
    end
    else
    begin
      qry_lista_DT_ESPERADA.DisplayLabel := 'Dt. Prevista';
      qry_lista_DT_ENT.DisplayLabel      := 'Dt. Embarque';
    end;
  end;
end;

procedure Tdatm_viagem.qry_viagem_AfterPost(DataSet: TDataSet);
begin
  qry_viagem_.ApplyUpdates;
  CloseStoredProc( sp_ev_prev_fabrica_viagem );
  sp_ev_prev_fabrica_viagem.ParamByName('@cd_unid_neg').AsString   := qry_viagem_CD_UNID_NEG.AsString;
  sp_ev_prev_fabrica_viagem.ParamByName('@cd_produto').AsString    := qry_viagem_CD_PRODUTO.AsString;
  sp_ev_prev_fabrica_viagem.ParamByName('@cd_embarcacao').AsString := qry_viagem_CD_EMBARCACAO.AsString;
  sp_ev_prev_fabrica_viagem.ParamByName('@nr_viagem').AsString     := qry_viagem_NR_VIAGEM.AsString;
  sp_ev_prev_fabrica_viagem.ParamByName('@cd_local').AsString      := qry_viagem_CD_LOCAL.AsString;
  ExecStoredProc( sp_ev_prev_fabrica_viagem );
  CloseStoredProc( sp_ev_prev_fabrica_viagem );
end;

procedure Tdatm_viagem.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_viagem_.Close;
  qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := qry_lista_CD_UNID_NEG.AsString;
  qry_viagem_.ParamByName('CD_PRODUTO').AsString    := qry_lista_CD_PRODUTO.AsString;
  qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := qry_lista_CD_EMBARCACAO.AsString;
  qry_viagem_.ParamByName('NR_VIAGEM').AsString     := qry_lista_NR_VIAGEM.AsString;
  qry_viagem_.ParamByName('CD_LOCAL').AsString      := qry_lista_CD_LOCAL.AsString;
  qry_viagem_.Prepare;
  qry_viagem_.Open;
end;

procedure Tdatm_viagem.qry_viagem_AfterScroll(DataSet: TDataSet);
begin
  frm_viagem.ts_DeadLines.TabVisible        := qry_viagem_CD_PRODUTO.AsString = '02';
  frm_viagem.lblAberturaGate.Visible        := frm_viagem.ts_DeadLines.TabVisible;
  frm_viagem.dbedt_DT_ABERTURA_GATE.Visible := frm_viagem.ts_DeadLines.TabVisible;
  frm_viagem.dbedt_hr_abertura_gate.Visible := frm_viagem.ts_DeadLines.TabVisible;  
end;

procedure Tdatm_viagem.qry_viagem_DeadLineAfterInsert(DataSet: TDataSet);
begin
  frm_viagem.btn_mi( False, True, True, False );
end;

procedure Tdatm_viagem.qry_viagem_AfterOpen(DataSet: TDataSet);
begin
  qry_viagem_DeadLine.Open;
end;

procedure Tdatm_viagem.qry_viagem_DeadLineCalcFields(DataSet: TDataSet);
begin
  qry_viagem_DeadLinecalcEstufagem.AsString := IIF(qry_viagem_DeadLineTP_ESTUFAGEM.AsString = '1','FCL','LCL');

  qry_viagem_DeadLinecalcDtHrBL.AsString    := qry_viagem_DeadLineDT_DEADLINE_BL.AsString         + ' - ' + qry_viagem_DeadLineHR_DEADLINE_BL.AsString;
  qry_viagem_DeadLinecalcDtHrCarga.AsString := qry_viagem_DeadLineDT_DEADLINE_CARGA.AsString      + ' - ' + qry_viagem_DeadLineHR_DEADLINE_CARGA.AsString;
  qry_viagem_DeadLinecalcDtHrImo.AsString   := qry_viagem_DeadLineDT_DEADLINE_IMO.AsString        + ' - ' + qry_viagem_DeadLineHR_DEADLINE_IMO.AsString;
  qry_viagem_DeadLinecalcDtHrGate.AsString  := qry_viagem_DeadLineDT_ABERTURA_GATE.AsString       + ' - ' + qry_viagem_DeadLineHR_ABERTURA_GATE.AsString;
  qry_viagem_DeadLinecalcDtHrTemp.AsString  := qry_viagem_DeadLineDT_DEADLINE_CARTA_TEMP.AsString + ' - ' + qry_viagem_DeadLineHR_DEADLINE_CARTA_TEMP.AsString;
end;

procedure Tdatm_viagem.qry_viagem_DeadLineAfterPost(DataSet: TDataSet);
begin
  qry_viagem_DeadLine.ApplyUpdates;
end;

procedure Tdatm_viagem.qry_viagem_AfterDelete(DataSet: TDataSet);
begin
  qry_viagem_.ApplyUpdates;
end;

procedure Tdatm_viagem.qry_viagem_AfterClose(DataSet: TDataSet);
begin
  if qry_viagem_DeadLine.Active then
    qry_viagem_DeadLine.Close;
end;

procedure Tdatm_viagem.qry_viagem_DT_ESPERADAChange(Sender: TField);
begin
  if (Sender.AsDateTime > Now + 90) and (not FAtualizandoData) then
  begin
    FAtualizandoData := True;
    if MessageDlg('Você está inserindo uma data superior a 90 dias da data atual.'#13'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      try
        Sender.Value := Sender.OldValue;
      except
        Sender.Clear;
      end;
    FAtualizandoData := False;
  end;
end;

procedure Tdatm_viagem.qry_viagem_DeadLineNewRecord(DataSet: TDataSet);
begin
   {by carlos - 01/06/2011}
   qry_viagem_DeadLineCD_UNID_NEG.AsString   := qry_viagem_CD_UNID_NEG.AsString;
   qry_viagem_DeadLineCD_PRODUTO.AsString    := qry_viagem_CD_PRODUTO.AsString;
   qry_viagem_DeadLineCD_EMBARCACAO.AsString := qry_viagem_CD_EMBARCACAO.AsString;
   qry_viagem_DeadLineNR_VIAGEM.AsString     := qry_viagem_NR_VIAGEM.AsString;
end;

end.
