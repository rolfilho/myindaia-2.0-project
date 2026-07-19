unit PGDIXXX;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, DBTables, Db, DBCtrls, DBCGrids;

type
  Tfrm_DI_adicao_Com_LI = class(TForm)
    Panel1: TPanel;
    Mensagem: TStatusBar;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText2: TDBText;
    DBText1: TDBText;
    DBText3: TDBText;
    Label1: TLabel;
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private                             
    { Private declarations }
  public
    { Public declarations }
    cd_unidade : String[2];
    nr_processo : String[11];
    function InsereItem : Boolean;
  end;

var
  frm_DI_adicao_Com_LI: Tfrm_DI_adicao_Com_LI;

implementation

uses PGGP001, GSMLIB, PGGP017, PGDI034;

{$R *.DFM}

procedure Tfrm_DI_adicao_Com_LI.btn_iniciarClick(Sender: TObject);
begin

  Mensagem.SimpleText := 'Gerando Nova Adição ...';
  Application.ProcessMessages;

  str_nr_processo := cd_unidade + '01' + nr_processo;
  try
    if Not( InsereItem ) then Exit;
  except
    Mensagem.SimpleText := 'Erro na geração da Adição.';
    Application.ProcessMessages;
    Exit;
  end;

  Mensagem.SimpleText := 'Adição gerada com sucesso.';

end;

function Tfrm_DI_adicao_Com_LI.InsereItem : Boolean;
Var
  nr_adicao         : String[3];
  nr_item           : String[3];
  dbl_peso_liq      : Double;
  dbl_soma_peso_liq : Double;
  dbl_qt_estat      : Double;
  dbl_soma_qt_estat : Double;
  dbl_total_quant   : Double;
  nr_ultimo_item    : String[2];
  str_unidade       : String[3];
  nAcoxambro, nSoma_MCV, nSoma_MLE, nMCV_Unit : Double;
begin

  Result := True;    // default

  nr_adicao := '';
  nr_item   := '';

  with datm_DI_adicao_com_LI do
  begin
    qry_di_itens_.Close;
    qry_di_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_di_itens_.ParamByName('NR_ADICAO').AsString   := '001';
    qry_di_itens_.ParamByName('NR_ITEM').AsString     := '***';
    qry_di_itens_.Prepare;
    qry_di_itens_.Open;

    if qry_di_itens_.RecordCount > 0 then qry_di_itens_.Delete;

    qry_di_itens_.Close;

    tbl_Item_.Open;

    qry_li_.ParamByName('NR_OPER_TRAT_PREV').AsString := qry_li_browseNR_OPER_TRAT_PREV.AsString;
    qry_li_.Prepare;
    qry_li_.Open;

    if (qry_li_.EOF) then
    begin
      Mensagem.SimpleText := 'Registro de DI não encontrado.';
      Application.ProcessMessages;
      Result := False;
      Exit;
    end;

    qry_item_.ParamByName('NR_OPER_TRAT_PREV').AsString := qry_li_NR_OPER_TRAT_PREV.AsString;
    qry_item_.Open;

    if (qry_item_.EOF) then
    begin
      Mensagem.SimpleText := 'Itens da LI não encontrados.';
      Application.ProcessMessages;
      Result := False;
      Exit;
    end;

    nAcoxambro      := 0;
    nSoma_MLE       := ( qry_li_VL_MERC_MNEG_EMB.AsFloat / 100 );
    dbl_total_quant := 0;
    nSoma_MCV       := 0;
    while Not (qry_item_.EOF) do
    begin
      dbl_total_quant := dbl_total_quant + qry_item_QT_MERC_UN_COMERC.AsFloat;
      nSoma_MCV       := nSoma_MCV + Arredondar ( (qry_item_QT_MERC_UN_COMERC.AsFloat / 100000) *
                        (qry_item_VL_UNID_COND_VENDA.AsFloat / 10000000), 2);
      qry_item_.Next
    end;

    qry_item_.Last;
    nr_ultimo_item := qry_item_NR_SEQ_PRODUTO.AsString;
    qry_item_.First;

    try
      if datm_main.db_cad.Connected then datm_main.db_cad.Connected := False;
      datm_main.db_cad.Params[0] := 'USER NAME=SA';
      datm_main.db_cad.Params[1] := 'PASSWORD=123';
      datm_main.db_cad.Connected := True;
      datm_main.db_cad.StartTransaction;
      CloseStoredProc(sp_unid_medida);
      sp_unid_medida.ParamByName('@NM_UN_MED_COMERC').AsString := Trim( qry_item_NM_UN_MEDID_COMER.AsString );
      ExecStoredProc(sp_unid_medida);
      str_unidade := sp_unid_medida.ParamByName('@CD_UNID_MEDIDA').AsString;
      CloseStoredProc(sp_unid_medida);
      datm_main.db_cad.Commit;
      datm_main.db_cad.Connected := False;
      datm_main.db_cad.Params[0] := datm_main.db_gsm.Params[0];
      datm_main.db_cad.Params[1] := datm_main.db_gsm.Params[1];
      datm_main.db_cad.Connected := True;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_cad.InTransaction then datm_main.db_cad.Rollback;
      end;
    end;

    try
      with datm_main.db_di do
      begin
        if Connected = False then Connected := True;
      end;

      datm_main.db_di.StartTransaction;

      dbl_soma_peso_liq := 0;
      dbl_soma_qt_estat := 0;
      while Not (qry_item_.EOF) do
      begin
        if ( qry_item_NR_SEQ_PRODUTO.AsString = nr_ultimo_item ) then
        begin
          dbl_peso_liq := ( qry_li_PL_MERCADORIA.AsFloat / 100000 ) - dbl_soma_peso_liq;
          dbl_qt_estat := ( qry_li_QT_UN_ESTATISTICA.AsFloat / 100000 ) - dbl_soma_qt_estat;
        end
        else
        begin
          if (dbl_total_quant) > 0 then
          begin
            dbl_peso_liq := Arredondar( ( ( qry_li_PL_MERCADORIA.AsFloat / 100000 ) *
                                          ( qry_item_QT_MERC_UN_COMERC.AsFloat / dbl_total_quant ) ), 5);
            dbl_qt_estat := Arredondar( ( ( qry_li_QT_UN_ESTATISTICA.AsFloat / 100000 ) *
                                          ( qry_item_QT_MERC_UN_COMERC.AsFloat / dbl_total_quant ) ), 5);
          end
          else
          begin
            dbl_peso_liq := 0;
            dbl_qt_estat := 0;
          end;
        end;
        dbl_soma_peso_liq := dbl_soma_peso_liq + dbl_peso_liq;
        dbl_soma_qt_estat := dbl_soma_qt_estat + dbl_qt_estat;

        tbl_Item_.Append;
        tbl_Item_NR_PROCESSO.AsString          := str_nr_processo;
        tbl_Item_NR_ADICAO.AsString            := '001';
        tbl_Item_NR_ITEM.AsString              := '***';
        tbl_Item_CD_EXPORTADOR.AsString        := '';
        tbl_Item_CD_FABR_EXPO.AsString         := '1';
        tbl_Item_CD_FABRICANTE.AsString        := '';
        tbl_Item_CD_MERCADORIA.AsString        := '';
        tbl_Item_CD_NALADI_NCCA.AsString       := qry_li_CD_MERC_NALADI_NCC.AsString;
        tbl_Item_CD_NALADI_SH.AsString         := qry_li_CD_MERC_NALADI_SH.AsString;
        tbl_Item_CD_NCM_SH.AsString            := qry_li_CD_MERCADORIA_NCM.AsString;
        tbl_Item_CD_PAIS_AQUISICAO.AsString    := qry_li_CD_PAIS_AQUIS_MERC.AsString;
        tbl_Item_CD_PAIS_ORIGEM.AsString       := qry_li_CD_PAIS_ORIG_MERC.AsString;
        tbl_Item_CD_TIPO_CALCULO_ITEM.AsString := '1';
        tbl_Item_CD_UN_MED_COMERC.AsString     := str_unidade;
        tbl_Item_NR_FATURA.AsString            := '';
        tbl_Item_PC_DESCONTO_MERC.AsFloat      := 0;
        tbl_Item_PL_MERCADORIA.AsFloat         := dbl_peso_liq;
        tbl_Item_QT_MERC_UN_COMERC.AsFloat     := qry_item_QT_MERC_UN_COMERC.AsFloat / 100000;
        tbl_Item_QT_MERC_UN_ESTAT.AsFloat      := dbl_qt_estat;
        tbl_Item_TX_DESC_DET_MERC.AsString     := qry_item_TX_DESC_DET_MERC.AsString;
        tbl_Item_VL_DESCONTO_MERC.AsFloat      := 0;
        tbl_Item_VL_FRETE_ITEM.AsFloat         := 0;
        tbl_Item_VL_MCV_ITEM.AsFloat           := ( qry_item_VL_UNID_COND_VENDA.AsFloat / 10000000 ) * ( qry_item_QT_MERC_UN_COMERC.AsFloat / 100000 );
        tbl_Item_VL_SEGURO_ITEM.AsFloat        := 0;
        tbl_Item_VL_UNID_COND_VENDA.AsFloat    := ( qry_item_VL_UNID_COND_VENDA.AsFloat / 10000000 );
        nMCV_Unit := ( qry_item_VL_UNID_COND_VENDA.AsFloat / 10000000 );

        if ( qry_item_NR_SEQ_PRODUTO.AsString <> nr_ultimo_item ) then
          tbl_Item_VL_MLE_ITEM.AsFloat :=
             Arredondar( nMCV_Unit * ( tbl_Item_QT_MERC_UN_COMERC.AsFloat * ( nSoma_MLE / nSoma_MCV ) ), 2)
        else {último item}
          tbl_Item_VL_MLE_ITEM.AsFloat := Arredondar( (nSoma_MLE - nAcoxambro), 2);

        tbl_Item_VL_UNITARIO.AsFloat   :=
           Arredondar( (tbl_Item_VL_MLE_ITEM.AsFloat / tbl_Item_QT_MERC_UN_COMERC.AsFloat ), 7);

        if Not tbl_Item_VL_MLE_ITEM.IsNull then
           nAcoxambro := nAcoxambro + tbl_Item_VL_MLE_ITEM.AsFloat;

        tbl_Item_NR_OPER_TRAT_PREV.AsString    := qry_li_NR_OPER_TRAT_PREV.AsString;
        tbl_Item_.Post;

        tbl_Item_.Close;

        CloseStoredProc(sp_di_classifica_item);
        sp_di_classifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc(sp_di_classifica_item);
        if sp_di_classifica_item.ParamByName('Result').AsInteger = 0 then
        begin
          nr_adicao := sp_di_classifica_item.ParamByName('@NR_ADICAO').AsString;
          nr_item   := sp_di_classifica_item.ParamByName('@NR_ITEM').AsString;
        end;

        CloseStoredProc(sp_di_classifica_item);

        tbl_Item_.Open;

        qry_item_.Next;

      end;

      tbl_Item_.Close;
      qry_item_.Close;

      tbl_adicao_.Open;

      if tbl_adicao_.FindKey([str_nr_processo,nr_adicao]) then
      begin
        if not ( tbl_adicao_.State in [dsEdit,dsInsert] ) then tbl_adicao_.Edit;

        tbl_adicao_NR_PROCESSO.AsString                 := str_nr_processo;
        tbl_adicao_NR_ADICAO.AsString                   := nr_adicao;
        tbl_adicao_CD_ACORDO_ALADI.AsString             := qry_li_CD_ACORDO_ALADI.AsString;
        tbl_adicao_CD_AGENC_AGENT_IMP.AsString          := '';
        tbl_adicao_CD_APLICACAO_MERC.AsString           := '1';
        tbl_adicao_CD_AUSENCIA_FABRIC.AsString          := qry_li_CD_AUSENCIA_FABRIC.AsString;
        tbl_adicao_CD_BANC_AGENTE_IMP.AsString          := '';
        tbl_adicao_CD_COBERT_CAMBIAL.AsString           := qry_li_CD_COBERT_CAMBIAL.AsString;
        tbl_adicao_CD_FABRICANTE.AsString               := '';
        tbl_adicao_CD_FORNECEDOR.AsString               := '';
        tbl_adicao_CD_FUND_LEG_REGIME.AsString          := qry_li_CD_FUND_LEG_REGIME.AsString;
        tbl_adicao_CD_INCOTERMS_VENDA.AsString          := qry_li_CD_INCOTERMS_VENDA.AsString;
        tbl_adicao_CD_LOC_COND_VENDA.AsString           := '';
        tbl_adicao_CD_MD_FRETE_MERC.AsString            := '';
        tbl_adicao_CD_MERC_NALADI_NCC.AsString          := qry_li_CD_MERC_NALADI_NCC.AsString;
        tbl_adicao_CD_MERC_NALADI_SH.AsString           := qry_li_CD_MERC_NALADI_SH.AsString;
        tbl_adicao_CD_MERC_NBM_SH.AsString              := qry_li_CD_MERCADORIA_NCM.AsString;
        tbl_adicao_CD_NCM_SH.AsString                   := qry_li_CD_MERCADORIA_NCM.AsString;
        tbl_adicao_CD_MERCADORIA_NCM.AsString           := qry_li_CD_MERCADORIA_NCM.AsString;
        tbl_adicao_CD_METOD_VALORACAO.AsString          := '01';
        tbl_adicao_CD_MODALIDADE_PGTO.AsString          := qry_li_CD_MODALIDADE_PGTO.AsString;
        tbl_adicao_CD_MOEDA_NEGOCIADA.AsString          := qry_li_CD_MOEDA_NEGOCIADA.AsString;
        tbl_adicao_CD_MOEDA_SEG_MERC.AsString           := '';
        tbl_adicao_CD_MOEDAS_DESPESAS.AsString          := '';
        tbl_adicao_CD_MOTIVO_ADM_TEMP.AsString          := '';
        tbl_adicao_CD_MOTIVO_SEM_COB.AsString           := qry_li_CD_MOTIVO_SEM_COB.AsString;
        tbl_adicao_CD_ORGAO_FIN_INTER.AsString          := qry_li_CD_ORGAO_FIN_INTER.AsString;
        tbl_adicao_CD_PAIS_AQUIS_MERC.AsString          := qry_li_CD_PAIS_AQUIS_MERC.AsString;
        tbl_adicao_CD_PAIS_ORIG_MERC.AsString           := qry_li_CD_PAIS_ORIG_MERC.AsString;
        tbl_adicao_CD_PERIOD_PGTO_360.AsString          := '';
        tbl_adicao_CD_REGIME_TRIBUTAR.AsString          := qry_li_CD_REGIME_TRIBUTAR.AsString;
        tbl_adicao_CD_TAXA_JUROS.AsString               := '';
        tbl_adicao_CD_TIPO_ACORDO_TAR.AsString          := qry_li_CD_TIPO_ACORDO_TAR.AsString;
        tbl_adicao_CD_TIPO_AGENTE_IMP.AsString          := '';
        tbl_adicao_CD_VINC_IMPO_EXPO.AsString           := '1';
        tbl_adicao_ED_CIDAD_FABRIC.AsString             := qry_li_ED_CIDAD_FABRIC.AsString;
        tbl_adicao_ED_CIDAD_FORN_ESTR.AsString          := qry_li_ED_CIDAD_FORN_ESTR.AsString;
        tbl_adicao_ED_COMPL_FABRIC.AsString             := qry_li_ED_COMPL_FABRIC.AsString;
        tbl_adicao_ED_COMPL_FORN_ESTR.AsString          := qry_li_ED_COMPL_FORN_ESTR.AsString;
        tbl_adicao_ED_ESTAD_FORN_ESTR.AsString          := qry_li_ED_ESTAD_FORN_ESTR.AsString;
        tbl_adicao_ED_ESTADO_FABRIC.AsString            := qry_li_ED_ESTADO_FABRIC.AsString;
        tbl_adicao_ED_LOGR_FABRIC.AsString              := qry_li_ED_LOGR_FABRIC.AsString;
        tbl_adicao_ED_LOGR_FORN_ESTR.AsString           := qry_li_ED_LOGR_FORN_ESTR.AsString;
        tbl_adicao_ED_NR_FABRIC.AsString                := qry_li_ED_NR_FABRIC.AsString;
        tbl_adicao_ED_NR_FORN_ESTR.AsString             := qry_li_ED_NR_FORN_ESTR.AsString;
        tbl_adicao_IN_BEM_ENCOMENDA.AsBoolean           := False; {qry_li_IN_BEM_ENCOMENDA}
        tbl_adicao_IN_IPI_NAO_TRIBUT.AsBoolean          := False;
        tbl_adicao_IN_JUROS_ATE_360.AsBoolean           := False;
        tbl_adicao_IN_MATERIAL_USADO.AsBoolean          := False; {qry_li_IN_MATERIAL_USADO}
        tbl_adicao_IN_MULTIMODAL.AsBoolean              := False;
        tbl_adicao_IN_PGTO_VARIAV_360.AsBoolean         := False;
        tbl_adicao_NM_FABRICANTE_MERC.AsString          := qry_li_NM_FABRICANTE_MERC.AsString;
        tbl_adicao_NM_FORN_ESTR.AsString                := qry_li_NM_FORN_ESTR.AsString;
        tbl_adicao_NR_AGENTE_IMP.AsString               := '';
        tbl_adicao_NR_DCTO_REDUCAO.AsString             := '';
        tbl_adicao_NR_OPER_TRAT_PREV.AsString           := qry_li_NR_OPER_TRAT_PREV.AsString;
        tbl_adicao_NR_ROF.AsString                      := '';
        tbl_adicao_PC_COEF_REDUC_II.AsFloat             := 0;
        tbl_adicao_PC_COMISSAO_AG_IMP.AsFloat           := 0;
        tbl_adicao_PC_TAXA_JUROS.AsFloat                := 0;
        tbl_adicao_PL_MERCADORIA.AsFloat                := ( qry_li_PL_MERCADORIA.AsFloat / 100000 );
        tbl_adicao_QT_ITENS_ADICAO.AsInteger            := StrToInt( nr_item );
        tbl_adicao_QT_PARC_FINANC_360.AsInteger         := 0;
        tbl_adicao_QT_PERIOD_PGTO_360.AsInteger         := 0;
        if qry_li_QT_UN_ESTATISTICA.AsFloat = qry_li_PL_MERCADORIA.AsFloat then
          tbl_adicao_QT_UN_ESTATISTICA.AsFloat          := ( qry_li_PL_MERCADORIA.AsFloat / 100000 )
        else
          tbl_adicao_QT_UN_ESTATISTICA.AsFloat          := ( qry_li_QT_UN_ESTATISTICA.AsFloat / 100000 );
        tbl_adicao_TX_COMPL_VL_ADUAN.AsString           := '';
        tbl_adicao_VL_ACRESCIMOS_MN.AsFloat             := 0;
        tbl_adicao_vl_base_calculo_mn.AsFloat           := 0;
        tbl_adicao_VL_CALC_DCR_DOLAR.AsFloat            := 0;
        tbl_adicao_VL_COMISSAO_AG_IMP.AsFloat           := 0;
        tbl_adicao_VL_DEDUCOES_MN.AsFloat               := 0;
        tbl_adicao_VL_DESPESAS_MN.AsFloat               := 0;
        tbl_adicao_VL_DESPESAS_MNEG.AsFloat             := 0;
        tbl_adicao_VL_FINANC_SUP_360.AsFloat            := 0;
        tbl_adicao_VL_FRETE_MERC_MN.AsFloat             := 0;
        tbl_adicao_VL_FRETE_MERC_MNEG.AsFloat           := 0;
        tbl_adicao_VL_II_A_REC_ZFM.AsFloat              := 0;
        tbl_adicao_VL_II_CALC_DCR_MN.AsFloat            := 0;
        tbl_adicao_VL_II_DEVIDO_ZFM.AsFloat             := 0;
        tbl_adicao_VL_MERC_COND_VENDA.AsFloat           := 0;
        tbl_adicao_VL_MERC_EMB_MN.AsFloat               := 0;
        tbl_adicao_vl_merc_loc_emb_mn.AsFloat           := 0;
        tbl_adicao_VL_MERC_VENDA_MN.AsFloat             := 0;
        tbl_adicao_VL_SEG_MERC_MN.AsFloat               := 0;
        tbl_adicao_VL_SEG_MERC_MNEG.AsFloat             := 0;
        tbl_adicao_VL_TOT_FINANC_360.AsFloat            := 0;
        tbl_adicao_VL_UNID_LOC_EMP.AsFloat              := 0;
        tbl_adicao_IN_ADICAO_CALCULADA.AsBoolean        := False;

        qry_li_.Close;

        tbl_adicao_.Post;

        tbl_adicao_.Close;

        CloseStoredProc(sp_di_calculo);
        sp_di_calculo.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc(sp_di_calculo);
        CloseStoredProc(sp_di_calculo);
        datm_main.db_di.Commit;
      end
      else
      begin
        datm_main.db_di.Commit;
        tbl_adicao_.Close;
        qry_li_.Close;
        tbl_Item_.Close;
        qry_item_.Close;
        Mensagem.SimpleText := 'Classificação da Adição não foi feita com sucesso.';
        Application.ProcessMessages;
        Result := False;
      end;
    except
      if datm_main.db_di.InTransaction then datm_main.db_di.Rollback;
    end;
  end;
end;

procedure Tfrm_DI_adicao_Com_LI.btn_fecharClick(Sender: TObject);
begin
  datm_DI_adicao_com_LI.qry_li_browse.Close;
  Close;
end;

procedure Tfrm_DI_adicao_Com_LI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_DI_adicao_com_LI.Free;
  Action := caFree;
  Application.ProcessMessages;
end;

procedure Tfrm_DI_adicao_Com_LI.FormShow(Sender: TObject);
begin
  with datm_DI_adicao_com_LI.db_ri do if (not Connected) then Connected := True;
  datm_DI_adicao_com_LI.qry_li_browse.Open;
end;

procedure Tfrm_DI_adicao_Com_LI.FormCreate(Sender: TObject);
begin
  { Inicializa o Data Module para Adição com LI }
  Application.CreateForm( Tdatm_DI_adicao_com_LI, datm_DI_adicao_com_LI );
end;

end.
