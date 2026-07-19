(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPO019.PAS - DataModule Realização por PO

AUTOR: Alexandre Gonçalves Neto

DATA: 08/09/2004

Manutenção: 

Data: dd/mm/yyyy
*************************************************************************************************)

unit PGPO019;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Variants, Funcoes;

type
  Tdatm_po_flp = class(TDataModule)
    ds_po: TDataSource;
    qry_po_: TQuery;
    qry_po_NR_PROCESSO: TStringField;
    qry_po_CD_IMPORTADOR: TStringField;
    qry_po_CD_SERVICO: TStringField;
    qry_po_NR_PROCESSO_INDAIA: TStringField;
    qry_po_CD_UNID_NEG: TStringField;
    qry_po_CD_PRODUTO: TStringField;
    qry_po_AP_EMPRESA: TStringField;
    qry_po_NM_SERVICO: TStringField;
    ds_po_item: TDataSource;
    qry_po_item_: TQuery;
    qry_po_item_NR_PROCESSO: TStringField;
    ds_flp_po: TDataSource;
    qry_flp_po_: TQuery;
    ds_flp_po_item: TDataSource;
    qry_flp_po_item_: TQuery;
    qry_evento_: TQuery;
    ds_po_edita_: TDataSource;
    qry_po_edita_: TQuery;
    qry_po_edita_NR_PROCESSO: TStringField;
    qry_po_edita_CD_CANAL: TStringField;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_flp_po_item_NR_PROCESSO: TStringField;
    qry_flp_po_item_CD_EVENTO: TStringField;
    qry_flp_po_item_IN_APLICAVEL: TStringField;
    qry_flp_po_item_CD_RESP_REALIZACAO: TStringField;
    qry_flp_po_item_DT_REALIZACAO: TDateTimeField;
    qry_flp_po_item_DT_PREVISTA: TDateTimeField;
    qry_flp_po_item_DT_LIMITE: TDateTimeField;
    qry_flp_po_NR_PROCESSO: TStringField;
    qry_flp_po_CD_EVENTO: TStringField;
    qry_flp_po_IN_APLICAVEL: TStringField;
    qry_flp_po_CD_RESP_REALIZACAO: TStringField;
    qry_flp_po_DT_REALIZACAO: TDateTimeField;
    qry_flp_po_DT_PREVISTA: TDateTimeField;
    qry_flp_po_DT_LIMITE: TDateTimeField;
    sp_atz_flp_po: TStoredProc;
    sp_atz_obs_flp_po: TStoredProc;
    sp_atz_flp_po_item: TStoredProc;
    sp_atz_obs_flp_po_item: TStoredProc;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_flp_po_pesq_ev_: TQuery;
    qry_status_flp_: TQuery;
    qry_flp_po_item_pesq_ev_: TQuery;
    qry_flp_po_item_pesq_ev_NR_PROCESSO: TStringField;
    qry_flp_po_item_pesq_ev_CD_EVENTO: TStringField;
    qry_flp_po_item_pesq_ev_NM_EVENTO: TStringField;
    qry_flp_po_pesq_ev_NR_PROCESSO: TStringField;
    qry_flp_po_pesq_ev_CD_EVENTO: TStringField;
    qry_flp_po_pesq_ev_NM_EVENTO: TStringField;
    qry_status_flp_CD_STATUS_FLP: TStringField;
    qry_status_flp_NM_STATUS_FLP: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_flp_po_CalcAtrazado: TStringField;
    qry_flp_po_item_CalcAtrazado: TStringField;
    qry_flp_po_item_CalcDiferencaDias: TStringField;
    sp_atz_ev_flp_po: TStoredProc;
    qry_atz_obs_po_: TQuery;
    qry_atz_obs_po_item_: TQuery;
    qry_atz_obs_po_TX_OBS: TMemoField;
    qry_atz_obs_po_item_TX_OBS: TMemoField;
    ds_atz_obs_po: TDataSource;
    ds_atz_obs_po_item: TDataSource;
    sp_atz_ev_flp_po_item: TStoredProc;
    qry_processo_: TQuery;
    qry_processo_NR_REFERENCIA: TStringField;
    qry_po_item_NR_ITEM_CLIENTE: TStringField;
    qry_po_NR_PROCESSO_1: TStringField;
    qry_flp_po_item_NR_ITEM: TStringField;
    qry_flp_po_item_NR_ITEM_CLIENTE: TStringField;
    qry_po_item_NR_ITEM: TStringField;
    qry_flp_po_item_pesq_ev_NR_ITEM: TStringField;
    qry_flp_po_CalcDiferencaDias: TStringField;
    dsFlpPoItemEtapa: TDataSource;
    qryFlpPoItemEtapa: TQuery;
    qryFlpPoItemEtapaNR_PROCESSO: TStringField;
    qryFlpPoItemEtapaNR_ITEM: TStringField;
    qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA: TIntegerField;
    qryFlpPoItemEtapaCD_ETAPA: TIntegerField;
    qryFlpPoItemEtapaCD_USUARIO: TStringField;
    qryFlpPoItemEtapaDT_ALTERACAO: TDateTimeField;
    qryFlpPoItemEtapaNM_ETAPA: TStringField;
    qryFlpPoItemEtapaAP_USUARIO: TStringField;
    updFlpPoItemEtapa: TUpdateSQL;
    qry_flp_po_NM_EVENTO: TStringField;
    upd_flp_po: TUpdateSQL;
    qry_flp_po_item_NM_EVENTO: TStringField;
    upd_flp_po_item: TUpdateSQL;
    qry_flp_po_item_AP_USUARIO: TStringField;
    qry_flp_po_AP_USUARIO: TStringField;
    procedure datm_po_flpCreate(Sender: TObject);
    procedure qry_flp_po_CalcFields(DataSet: TDataSet);
    procedure qry_flp_po_item_CalcFields(DataSet: TDataSet);
    procedure qry_flp_po_AfterScroll(DataSet: TDataSet);
    procedure qry_flp_po_item_AfterScroll(DataSet: TDataSet);
    procedure qry_flp_po_AfterPost(DataSet: TDataSet);
    procedure qry_flp_po_BeforePost(DataSet: TDataSet);
    procedure qry_flp_po_item_AfterPost(DataSet: TDataSet);
    procedure qry_flp_po_item_BeforePost(DataSet: TDataSet);
    procedure qry_po_AfterClose(DataSet: TDataSet);
    procedure qry_po_AfterOpen(DataSet: TDataSet);
    procedure qry_po_edita_AfterScroll(DataSet: TDataSet);
    procedure qry_po_edita_BeforeClose(DataSet: TDataSet);
    procedure qryFlpPoItemEtapaAfterPost(DataSet: TDataSet);
    procedure qryFlpPoItemEtapaAfterDelete(DataSet: TDataSet);
    procedure qry_flp_po_AfterDelete(DataSet: TDataSet);
    procedure qry_flp_po_item_AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    cd_reg_di, cd_emissao_fat, cd_prev_fab, cd_estim_cheg, cd_cheg : String[3];
    { Public declarations }
  end;

var
  datm_po_flp: Tdatm_po_flp;

implementation

uses GSMLIB, PGPO018, PGGP017, PGGP001;

{$R *.DFM}

procedure Tdatm_po_flp.datm_po_flpCreate(Sender: TObject);
begin
  with TQuery.Create( Application ) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT CD_EV_REG_DI, CD_ITEM_DED, CD_EV_PREV_FABRICA, ' +
            '       CD_EV_ESPERA_NAVIO, CD_EV_ENT ' +
            'FROM TPARAMETROS ( NOLOCK )');
    Prepare;
    Open;
    cd_reg_di      := FieldByName('CD_EV_REG_DI').AsString;
    cd_emissao_fat := FieldByName('CD_ITEM_DED').AsString;
    cd_prev_fab    := FieldByName('CD_EV_PREV_FABRICA').AsString;
    cd_estim_cheg  := FieldByName('CD_EV_ESPERA_NAVIO').AsString;
    cd_cheg        := FieldByName('CD_EV_ENT').AsString;
    Free;
  end;
end;

procedure Tdatm_po_flp.qry_flp_po_CalcFields(DataSet: TDataSet);
var
  vStrDias : string;
begin
  //verifica se o evento é aplicavel
  if qry_flp_po_IN_APLICAVEL.AsString = '1' then
    if ( qry_flp_po_DT_REALIZACAO.IsNull ) or
       ( qry_flp_po_DT_REALIZACAO.AsDateTime = 0 ) then
      if ( ( qry_flp_po_DT_PREVISTA.AsDateTime <> 0 ) and
           ( qry_flp_po_DT_PREVISTA.AsDateTime < date ) ) or
         ( ( qry_flp_po_DT_LIMITE.AsDateTime <> 0 ) and
           ( qry_flp_po_DT_LIMITE.AsDateTime < date ) ) then
      begin
        qry_flp_po_CalcAtrazado.AsString := 'Atrasado';
        //frm_po_flp.dbtxt_atrazado_comum.Font.Color := clRed;
      end
      else
        if ( ( qry_flp_po_DT_PREVISTA.AsDateTime <> 0 ) and
             ( qry_flp_po_DT_PREVISTA.AsDateTime = date ) ) or
           ( ( qry_flp_po_DT_LIMITE.AsDateTime <> 0 ) and
             ( qry_flp_po_DT_LIMITE.AsDateTime = date ) ) then
        begin
          qry_flp_po_CalcAtrazado.AsString := 'Atenção';
          //frm_po_flp.dbtxt_atrazado_comum.Font.Color := clOlive;
        end
        else
          qry_flp_po_CalcAtrazado.AsString := ''
    else
    begin
      qry_flp_po_CalcAtrazado.AsString      := '';
      qry_flp_po_CalcDiferencaDias.AsString := '0';
      if ( Not qry_flp_po_DT_PREVISTA.IsNull ) or ( qry_flp_po_DT_PREVISTA.AsDateTime <> 0 )then
      begin
        vStrDias := FloatToStr(qry_flp_po_DT_REALIZACAO.AsDateTime - qry_flp_po_DT_PREVISTA.AsDateTime);
        if Pos(',',vStrDias) > 0 then
          qry_flp_po_CalcDiferencaDias.AsString := Copy(vStrDias,0,Pos(',',vStrDias)-1)
        else
          qry_flp_po_CalcDiferencaDias.AsString := vStrDias;
        if qry_flp_po_CalcDiferencaDias.AsString = '-0' then
          qry_flp_po_CalcDiferencaDias.AsString := '0';
        if qry_flp_po_CalcDiferencaDias.AsString <> '' then
          if StrToFloat(qry_flp_po_CalcDiferencaDias.AsString) > 0 then
            qry_flp_po_CalcDiferencaDias.AsString := '+' + qry_flp_po_CalcDiferencaDias.AsString;
      end;
    end
  else
    qry_flp_po_CalcAtrazado.AsString := '';
end;

procedure Tdatm_po_flp.qry_flp_po_item_CalcFields(DataSet: TDataSet);
begin
  //verifica se o evento é aplicavel
  if qry_flp_po_item_IN_APLICAVEL.AsString = '1' then
    if ( qry_flp_po_item_DT_REALIZACAO.IsNull ) or
       ( qry_flp_po_item_DT_REALIZACAO.AsDateTime = 0 ) then
      if ( ( qry_flp_po_item_DT_PREVISTA.AsDateTime <> 0 ) and
           ( qry_flp_po_item_DT_PREVISTA.AsDateTime < date ) ) or
         ( ( qry_flp_po_item_DT_LIMITE.AsDateTime <> 0 ) and
           ( qry_flp_po_item_DT_LIMITE.AsDateTime < date ) ) then
      begin
        qry_flp_po_item_CalcAtrazado.AsString      := 'Atrasado';
        //frm_po_flp.dbtxt_atrazado_espec.Font.Color := clRed;
      end
      else
        if ( ( qry_flp_po_item_DT_PREVISTA.AsDateTime <> 0 ) and
             ( qry_flp_po_item_DT_PREVISTA.AsDateTime = date ) ) or
           ( ( qry_flp_po_item_DT_LIMITE.AsDateTime <> 0 ) and
             ( qry_flp_po_item_DT_LIMITE.AsDateTime = date ) ) then
        begin
          qry_flp_po_item_CalcAtrazado.AsString      := 'Atenção';
          //frm_po_flp.dbtxt_atrazado_espec.Font.Color := clOlive;
        end
        else
          qry_flp_po_item_CalcAtrazado.AsString := ''
    else
    begin
      qry_flp_po_item_CalcAtrazado.AsString      := '';
      qry_flp_po_item_CalcDiferencaDias.AsString := '0';
      if ( Not qry_flp_po_item_DT_PREVISTA.IsNull ) or ( qry_flp_po_item_DT_PREVISTA.AsDateTime <> 0 )then
      begin
        qry_flp_po_item_CalcDiferencaDias.AsString := FloatToStr(qry_flp_po_item_DT_REALIZACAO.AsDateTime - qry_flp_po_item_DT_PREVISTA.AsDateTime);
        if StrToInt(qry_flp_po_item_CalcDiferencaDias.AsString) > 0 then
          qry_flp_po_item_CalcDiferencaDias.AsString := '+' + qry_flp_po_item_CalcDiferencaDias.AsString;
      end;
    end
  else
    qry_flp_po_item_CalcAtrazado.AsString := '';

  {if qry_flp_po_item_.RecordCount > 0 Then
    if qry_flp_po_item_CD_STATUS.AsInteger in [ 0, 1 ] then
      qry_flp_po_item_CalcRedFlag.AsString := '!'
    else
      qry_flp_po_item_CalcRedFlag.AsString := '';}
end;

procedure Tdatm_po_flp.qry_flp_po_AfterScroll(DataSet: TDataSet);
begin
  if ( qry_flp_po_IN_APLICAVEL.AsString = '0' ) then
  begin
    //frm_po_flp.dbedt_dt_realizada_ev_comum.ReadOnly := True;
  end
  else
  begin
    //frm_po_flp.dbedt_dt_realizada_ev_comum.ReadOnly := False;
  end;
  qry_flp_po_pesq_ev_.Close;
  qry_flp_po_pesq_ev_.Prepare;
  qry_flp_po_pesq_ev_.Open;

  Application.ProcessMessages;
end;


procedure Tdatm_po_flp.qry_flp_po_item_AfterScroll(DataSet: TDataSet);
begin
  {if ( qry_flp_po_item_IN_APLICAVEL.AsString = '0' ) then
  begin
    frm_po_flp.dbedt_dt_realizada_ev_espec.ReadOnly := True;
  end
  else
  begin
    frm_po_flp.dbedt_dt_realizada_ev_espec.ReadOnly := False;
  end;}
  qry_flp_po_item_pesq_ev_.Close;
  qry_flp_po_item_pesq_ev_.Prepare;
  qry_flp_po_item_pesq_ev_.Open;
  FRM_PO_FLP.AtualizaEtapaProcesso;
  Application.ProcessMessages;
end;

procedure Tdatm_po_flp.qry_flp_po_AfterPost(DataSet: TDataSet);
var cProcesso, cEvento, cItem : String;
begin
  try
    cItem := '';

    with frm_po_flp do
    begin
      cProcesso := Trim( msk_nr_po.Text );
      cEvento   := Trim( qry_flp_po_CD_EVENTO.AsString );
    end;
    qry_flp_po_.ApplyUpdates;
    qry_flp_po_.Close;
    {
    CloseStoredProc(sp_atz_flp_po);
    sp_atz_flp_po.ParamByName('@nr_processo').AsString := cProcesso;
    ExecStoredProc(sp_atz_flp_po);
    CloseStoredProc(sp_atz_flp_po);

    CloseStoredProc(sp_atz_obs_flp_po);
    sp_atz_obs_flp_po.ParamByName('@nr_processo').AsString := cProcesso;
    ExecStoredProc(sp_atz_obs_flp_po);
    CloseStoredProc(sp_atz_obs_flp_po);
    }
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TSERVICO_EVENTO');
      SQL.Add(' WHERE CD_SERVICO = ''' + qry_po_CD_SERVICO.AsString + '''');
      SQL.Add('   AND CD_TIPO_EVENTO = ''01''');
      SQL.Add('   AND CD_EV_BASICO = ''' + cEvento + '''');
      Open;
      if Fields[0].AsInteger > 0 then
      begin
        cItem := Trim( frm_po_flp.msk_item.Text );
        qry_po_item_.First;
        while not qry_po_item_.EOF do
        begin
         { CloseStoredProc(sp_atz_flp_po_item);
          sp_atz_flp_po_item.ParamByName('@nr_processo').AsString := cProcesso;
          sp_atz_flp_po_item.ParamByName('@nr_item').AsString     := qry_po_item_NR_ITEM.AsString;
          ExecStoredProc(sp_atz_flp_po_item);
          CloseStoredProc(sp_atz_flp_po_item);

          CloseStoredProc(sp_atz_obs_flp_po_item);
          sp_atz_obs_flp_po_item.ParamByName('@nr_processo').AsString := cProcesso;
          sp_atz_obs_flp_po_item.ParamByName('@nr_item').AsString     := qry_po_item_NR_ITEM.AsString;
          ExecStoredProc(sp_atz_obs_flp_po_item);
          CloseStoredProc(sp_atz_obs_flp_po_item); }
          qry_po_item_.Next;
        end;
      end;
      Close;
      Free;
    end;

    datm_main.db_broker.Commit;
    qry_flp_po_.Prepare;
    qry_flp_po_.Open;
    qry_flp_po_.Locate('NR_PROCESSO;CD_EVENTO', VarArrayOf ([cProcesso, cEvento]), [loCaseInsensitive]);
    qry_flp_po_.EnableControls;

    if cItem <> '' then
    begin
      qry_flp_po_item_.Close;
      qry_flp_po_item_.Prepare;
      qry_flp_po_item_.Open;
      qry_flp_po_item_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([cProcesso, cItem]), [loCaseInsensitive]);
      qry_flp_po_item_.EnableControls;
      qryFlpPoItemEtapa.Open;
    end;

  except
    on E: Exception do
    begin
      qry_flp_po_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      BoxMensagem('Falha na Gravação!', 2);
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tdatm_po_flp.qry_flp_po_BeforePost(DataSet: TDataSet);
begin
  qry_flp_po_.DisableControls;
  Screen.Cursor := crHourGlass;
  if Not datm_main.db_broker.InTransaction then
    datm_main.db_broker.StartTransaction;
  if qry_flp_po_.State in [dsEdit, dsInsert] then
    qry_flp_po_CD_RESP_REALIZACAO.AsString := str_cd_usuario;
  Screen.Cursor := crDefault;
end;

procedure Tdatm_po_flp.qry_flp_po_item_AfterPost(DataSet: TDataSet);
var
 cProcesso, cItem, cEvento, cInAplic : String;
 cDtRealiz : TDateTime;
begin
  try
    with frm_po_flp do begin
      cProcesso := Trim(msk_nr_po.Text );
      cItem     := Trim(msk_item.Text );
      cEvento   := Trim(qry_flp_po_item_CD_EVENTO.AsString);
      cInAplic  := Trim(qry_flp_po_item_IN_APLICAVEL.AsString);
      cDtRealiz := qry_flp_po_item_DT_REALIZACAO.AsDateTime;

      qry_flp_po_item_.ApplyUpdates;
      qry_flp_po_item_.Close;
      qryFlpPoItemEtapa.Close;

      if chkRealizaLote.checked then begin
        chkRealizaLote.Checked := False;
        with TQuery.Create(application) do begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add('UPDATE TFLP_PO_ITEM SET ');
          if cDtRealiz > 0 then
            SQL.Add('  DT_REALIZACAO = :DT_REALIZACAO,')
          else
            SQL.Add('  DT_REALIZACAO = NULL,');
          SQL.Add('  IN_APLICAVEL  = :IN_APLICAVEL');
          SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = :CD_EVENTO');
          if cDtRealiz > 0 then
            ParamByName('DT_REALIZACAO').AsDateTime := cDtRealiz;
          ParamByName('IN_APLICAVEL').AsString    := cInAplic;
          ParamByName('NR_PROCESSO').AsString     := cProcesso;
          ParamByName('CD_EVENTO').AsString       := cEvento;
          ExecSQL;
          Free;
        end;
        qry_po_item_.First;
        while not qry_po_item_.EOF do
        begin
         { CloseStoredProc(sp_atz_flp_po_item);
          sp_atz_flp_po_item.ParamByName('@nr_processo').AsString := cProcesso;
          sp_atz_flp_po_item.ParamByName('@nr_item').AsString     := qry_po_item_NR_ITEM.AsString;
          ExecStoredProc(sp_atz_flp_po_item);
          CloseStoredProc(sp_atz_flp_po_item);

          CloseStoredProc(sp_atz_obs_flp_po_item);
          sp_atz_obs_flp_po_item.ParamByName('@nr_processo').AsString := cProcesso;
          sp_atz_obs_flp_po_item.ParamByName('@nr_item').AsString     := qry_po_item_NR_ITEM.AsString;
          ExecStoredProc(sp_atz_obs_flp_po_item);
          CloseStoredProc(sp_atz_obs_flp_po_item); }
          qry_po_item_.Next;
        end;
        qry_po_item_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf([cProcesso, cItem]), [loCaseInsensitive]);
      end
      else begin
      {  CloseStoredProc(sp_atz_flp_po_item);
        sp_atz_flp_po_item.ParamByName('@nr_processo').AsString := cProcesso;
        sp_atz_flp_po_item.ParamByName('@nr_item').AsString     := cItem;
        ExecStoredProc(sp_atz_flp_po_item);
        CloseStoredProc(sp_atz_flp_po_item);

        CloseStoredProc(sp_atz_obs_flp_po_item);
        sp_atz_obs_flp_po_item.ParamByName('@nr_processo').AsString := cProcesso;
        sp_atz_obs_flp_po_item.ParamByName('@nr_item').AsString     := cItem;
        ExecStoredProc(sp_atz_obs_flp_po_item);
        CloseStoredProc(sp_atz_obs_flp_po_item); }
      end;
    end;

    datm_main.db_broker.Commit;
    qry_flp_po_item_.Open;
    qry_flp_po_item_.Locate('NR_PROCESSO;NR_ITEM;CD_EVENTO', VarArrayOf ([cProcesso, cItem, cEvento]), [loCaseInsensitive]);
    qry_flp_po_item_.EnableControls;
    qryFlpPoItemEtapa.Open;
  except
    on E: Exception do
    begin
      qry_flp_po_item_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      BoxMensagem('Falha na Gravação!', 2);
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tdatm_po_flp.qry_flp_po_item_BeforePost(DataSet: TDataSet);
begin
  qry_flp_po_item_.DisableControls;
  Screen.Cursor := crHourGlass;
  if Not datm_main.db_broker.InTransaction then
    datm_main.db_broker.StartTransaction;
  if qry_flp_po_item_.State in [dsEdit, dsInsert] then
    qry_flp_po_item_CD_RESP_REALIZACAO.AsString := str_cd_usuario;
  Screen.Cursor := crDefault;
end;

procedure Tdatm_po_flp.qry_po_AfterClose(DataSet: TDataSet);
begin
  qry_po_edita_.Open;
end;

procedure Tdatm_po_flp.qry_po_AfterOpen(DataSet: TDataSet);
begin
  qry_po_edita_.Close;
end;

procedure Tdatm_po_flp.qry_po_edita_AfterScroll(DataSet: TDataSet);
begin
  if qry_po_edita_.State in [dsEdit] then qry_po_edita_.Post;
end;

procedure Tdatm_po_flp.qry_po_edita_BeforeClose(DataSet: TDataSet);
begin
  if qry_po_edita_.State in [dsEdit] then qry_po_edita_.Post;
end;

procedure Tdatm_po_flp.qryFlpPoItemEtapaAfterPost(DataSet: TDataSet);
begin
  qryFlpPoItemEtapa.ApplyUpdates;
end;

procedure Tdatm_po_flp.qryFlpPoItemEtapaAfterDelete(DataSet: TDataSet);
begin
  qryFlpPoItemEtapa.ApplyUpdates;
end;

procedure Tdatm_po_flp.qry_flp_po_AfterDelete(DataSet: TDataSet);
begin
  qry_flp_po_.ApplyUpdates;
end;

procedure Tdatm_po_flp.qry_flp_po_item_AfterDelete(DataSet: TDataSet);
begin
  qry_flp_po_item_.ApplyUpdates;
end;

end.
