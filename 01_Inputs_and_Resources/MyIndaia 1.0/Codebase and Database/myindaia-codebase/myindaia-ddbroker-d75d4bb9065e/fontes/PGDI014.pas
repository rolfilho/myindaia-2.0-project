unit PGDI014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants, Db, DBTables, StdCtrls, ComCtrls, ExtCtrls, Funcoes;

type
  Tfrm_integracao_LI = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_q_li: TLabel;
    lbl_q_li_a: TLabel;
    lbl_q_li_i: TLabel;
    lbl_q_itens: TLabel;
    lbl_q_dest_ncm: TLabel;
    Bevel1: TBevel;
    Mensagem: TStatusBar;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Bevel3: TBevel;
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cProcBroker : String;
    nLI : Integer;
    nLI_a : Integer;
    nLI_i : Integer;
    nItens : Integer;
    nDest : Integer;
    procedure IntegraLI;
    procedure AtualizaItens;
    procedure AtualizaDest_NCM;
    procedure IntegraLI2;
    procedure AtualizaItens2;
    procedure AtualizaDest_NCM2;
    function AjustaProcesso(AProcesso: String): String;
  end;

var
  frm_integracao_LI: Tfrm_integracao_LI;

implementation

uses PGDI031;

{$R *.DFM}

// Nos eventos abaixo o campo NR_IDENT_USUARIO foi modificado para recolocar os traços no processo (inverso de PGLI07).
// Ex: 0101IM-0001-09-001 - Michel - 16/03/2009 - Ocorrência 07899/09

procedure Tfrm_Integracao_LI.AtualizaItens;
var
  totItemLI : Integer;
begin
  with datm_integracao_li do
  begin
    qry_det_merc_o_.Close;
    qry_det_merc_o_.Parameters.ParamByName('NR_TRAT_IMP_MICRO').Value := tbl_li_o_NR_TRAT_IMP_MICRO.AsString;
    qry_det_merc_o_.Open;

    while not qry_det_merc_o_.Eof do
    begin
      Application.ProcessMessages;

      qry_existe_item_li_.Close;
      qry_existe_item_li_.Parameters.ParamByName('NR_PROCESSO').Value := qry_li_d_NR_PROCESSO.AsString;
      qry_existe_item_li_.Parameters.ParamByName('NR_ITEM').Value     := '0' + qry_det_merc_o_NR_SEQ_PRODUTO.AsString;
      qry_existe_item_li_.Open;
      totItemLI := qry_existe_item_li_TOT.AsInteger;
      qry_existe_item_li_.Close;

      qry_itens_li_.Close;
      qry_itens_li_.Parameters.ParamByName('NR_PROCESSO').Value := qry_li_d_NR_PROCESSO.AsString;
      qry_itens_li_.Parameters.ParamByName('NR_ITEM').Value     := '0' + qry_det_merc_o_NR_SEQ_PRODUTO.AsString;
      qry_itens_li_.Open;

      // Para depuração
      if qry_li_d_NR_PROCESSO.AsString = '0101I0-2320-01-001' then
        Application.ProcessMessages;
      qry_det_merc_d_.Close;
      qry_det_merc_d_.Parameters.ParamByName('NR_PROCESSO').Value := qry_li_d_NR_PROCESSO.AsString;
      qry_det_merc_d_.Parameters.ParamByName('NR_ITEM').Value     := '0' + qry_det_merc_o_NR_SEQ_PRODUTO.AsString;
      qry_det_merc_d_.Open;

      if totItemLI > 0 then
        qry_det_merc_d_.Edit
      else
      begin
        qry_det_merc_d_.Append;
        qry_det_merc_d_NR_PROCESSO.AsString := qry_li_d_NR_PROCESSO.AsString;
        qry_det_merc_d_NR_ITEM.AsString     := '0' + qry_det_merc_o_NR_SEQ_PRODUTO.AsString;
      end;

      if qry_det_merc_o_QT_MERC_UN_COMERC.AsString <> '' then
        qry_det_merc_d_QT_MERC_UN_COMERC.AsFloat := qry_det_merc_o_QT_MERC_UN_COMERC.AsFloat / 100000
      else
        qry_det_merc_d_QT_MERC_UN_COMERC.AsFloat := 0;

      if Trim(qry_det_merc_o_NM_UN_MEDID_COMER.AsString) <> '' then
      begin
        if sp_unid_medida.Active then
          sp_unid_medida.Close;
        sp_unid_medida.Parameters.ParamByName('@NM_UN_MED_COMERC').Value := Trim(qry_det_merc_o_NM_UN_MEDID_COMER.AsString);
        sp_unid_medida.ExecProc;
        qry_det_merc_d_CD_UN_MED_COMERC.AsString := sp_unid_medida.Parameters.ParamByName('@CD_UNID_MEDIDA').Value;
        if sp_unid_medida.Active then
          sp_unid_medida.Close;
      end;

      if qry_det_merc_o_NR_ITEM_DRAWBACK.AsString <> '' then
        qry_det_merc_d_NR_ITEM_DRAWBACK.AsString := qry_det_merc_o_NR_ITEM_DRAWBACK.AsString;

      if tbl_li_o_NR_ATO_DRAWBACK.AsString <> '' then
        qry_det_merc_d_NR_ATO_DRAWBACK.AsString := tbl_li_o_NR_ATO_DRAWBACK.AsString;

      if qry_itens_li_IN_DRAWBACK_AUTOMATICO.AsString <> '0' then
      begin
        if qry_det_merc_o_QT_PROD_DRAWBACK.AsString <> '' then
          qry_det_merc_d_QT_MERC_UN_ESTAT.AsFloat     := qry_det_merc_o_QT_PROD_DRAWBACK.AsFloat / 100000
        else
          qry_det_merc_d_QT_MERC_UN_ESTAT.AsFloat     := 0;

        if qry_det_merc_o_VL_PROD_DRAWBACK.AsString <> '' then
          qry_det_merc_d_VL_TOTAL_MLE.AsFloat     := qry_det_merc_o_VL_PROD_DRAWBACK.AsFloat / 100
        else
          qry_det_merc_d_VL_TOTAL_MLE.AsFloat     := 0;
      end;

      if qry_det_merc_o_VL_UNID_COND_VENDA.AsString <> '' then
        qry_det_merc_d_VL_UNIT_MCV.AsFloat        := qry_det_merc_o_VL_UNID_COND_VENDA.AsFloat / 100000
      else
        qry_det_merc_d_VL_UNIT_MCV.AsFloat        := 0;

      qry_det_merc_d_TX_DESC_DET_MERC.Assign(qry_det_merc_o_TX_DESC_DET_MERC);

      if Trim(qry_det_merc_o_CD_PRODUTO.AsString) <> '' then
        qry_det_merc_d_CD_MERCADORIA.AsString     := qry_det_merc_o_CD_PRODUTO.AsString;

      qry_det_merc_d_CD_NCM_SH.AsString         := tbl_li_o_CD_MERCADORIA_NCM.AsString;
      qry_det_merc_d_CD_NALADI_NCCA.AsString    := tbl_li_o_CD_MERC_NALADI_NCC.AsString;
      qry_det_merc_d_CD_NALADI_SH.AsString      := tbl_li_o_CD_MERC_NALADI_SH.AsString;

      qry_det_merc_d_CD_FABR_EXPO.AsString      := tbl_li_o_CD_AUSENCIA_FABRIC.AsString;
      if qry_det_merc_d_CD_FABR_EXPO.AsString = '1' then
         qry_det_merc_d_CD_PAIS_AQUISICAO.AsString := tbl_li_o_CD_PAIS_AQUIS_MERC.AsString
      else
      begin
        qry_det_merc_d_CD_PAIS_AQUISICAO.AsString := tbl_li_o_CD_PAIS_AQUIS_MERC.AsString;
        qry_det_merc_d_CD_PAIS_ORIGEM.AsString    := tbl_li_o_CD_PAIS_ORIG_MERC.AsString;
      end;

      qry_det_merc_d_IN_REG_DRAWBACK.AsString   := tbl_li_o_IN_REG_DRAWBACK.AsString;
      qry_det_merc_d_NR_REG_DRAWBACK.AsString   := tbl_li_o_NR_REG_DRAWBACK.AsString;

      qry_det_merc_d_.Post;

      qry_det_merc_o_.Next;
    end;

    qry_itens_li_.Close;
    qry_det_merc_o_.Close;
  end;
end;

procedure Tfrm_Integracao_LI.AtualizaDest_NCM;
begin
  with datm_integracao_li do
  begin
    qry_dest_ncm_o_.Close;
    qry_dest_ncm_o_.Parameters.ParamByName('NR_TRAT_IMP_MICRO').Value := tbl_li_o_NR_TRAT_IMP_MICRO.AsString;
    qry_dest_ncm_o_.Open;

    tbl_dest_ncm_d_.Open;
    while not qry_dest_ncm_o_.Eof do
    begin
      Application.ProcessMessages;

      if not tbl_dest_ncm_d_.Locate('NR_OPER_TRAT_PREV;NR_DESTAQUE_NCM', VarArrayOf([tbl_li_o_NR_OPER_TRAT_PREV.AsString, qry_dest_ncm_o_NR_DESTAQUE_NCM.AsString]), []) then
      begin
        tbl_dest_ncm_d_.Append;
        tbl_dest_ncm_d_NR_OPER_TRAT_PREV.AsString := tbl_li_o_NR_OPER_TRAT_PREV.AsString;
        tbl_dest_ncm_d_NR_DESTAQUE_NCM.AsString   := qry_dest_ncm_o_NR_DESTAQUE_NCM.AsString;
        tbl_dest_ncm_d_.Post;
      end;
      qry_dest_ncm_o_.Next
    end;
    tbl_dest_ncm_d_.Close;

    qry_dest_ncm_o_.Close;
  end;
end;

procedure Tfrm_integracao_LI.btn_iniciarClick(Sender: TObject);
begin
  nLI    := 0;
  nLI_i  := 0;
  nLI_a  := 0;
  nItens := 0;
  nDest  := 0;

  lbl_q_li.Caption       := IntToStr(nLI);
  lbl_q_li_a.Caption     := IntToStr(nLI_a);
  lbl_q_li_i.Caption     := IntToStr(nLI_i);
  lbl_q_itens.Caption    := IntToStr(nItens);
  lbl_q_dest_ncm.Caption := IntToStr(nDest);

  try
    datm_integracao_li.ConBroker.BeginTrans;
    IntegraLI;
    IntegraLI2;
    datm_integracao_li.ConBroker.CommitTrans;
    Mensagem.SimpleText  := 'Integração de LI foi bem sucedida.';
    Application.ProcessMessages;
  except
    on E: Exception do
    begin
      if datm_integracao_li.ConBroker.InTransaction then
        datm_integracao_li.ConBroker.RollbackTrans;
      // Versão do driver ODBC Microsoft Access Driver deve ser 4.00.3711.08 - ODBCJT32.dll - 05/04/99
      Mensagem.SimpleText  := 'Erro na Leitura de Dados do Orientador.';
      TrataErro(E);
      Application.ProcessMessages;
      MessageDlg('Erro durante o processamento...'#13 + E.Message, mtError, [mbOk], 0);
      //BoxMensagem('Erro ao atualizar L.I.!'#13'Versão ou configuração incorreta do driver ODBC!', 3);
    end;
  end;
end;

procedure Tfrm_Integracao_LI.IntegraLI;
var nLoop : Boolean;
    totLI : Integer;
    Lista: TStrings;
    nProc: Integer;
begin

  Mensagem.SimpleText := 'Conectando com o Banco de Dados.';
  Application.ProcessMessages;
  Lista := TStringList.Create;

  with datm_integracao_li do
  begin
    tbl_li_o_.Open;

    if qry_li_d_.Active then
      qry_li_d_.Close;
    qry_li_d_.Open;

    if qry_det_merc_d_.Active then
      qry_det_merc_d_.Close;
    qry_det_merc_d_.Open;

    while not tbl_li_o_.Eof do
    begin
      nLoop := False;

      //cProcBroker := str_cd_unid_neg + '01' + tbl_li_o_.FieldByName('NR_IDENT_USUARIO').AsString;
      cProcBroker := tbl_li_o_NR_IDENT_USUARIO.AsString;
      if not TryStrToInt(Copy(cProcBroker, 1, 4), nProc) then
        cProcBroker := '0' + Copy(cProcBroker, 1, 1) + '0' + Copy(cProcBroker, 2, 20);
      cProcBroker := AjustaProcesso(cProcBroker);

      if Trim(tbl_li_o_NR_IDENT_USUARIO.AsString) <> '' then
      begin
        // Para depuração
        if tbl_li_o_NR_OPER_TRAT_PREV.AsString = '0102464038' then
          Application.ProcessMessages;
        Mensagem.SimpleText := 'Processando LI nº ' + Copy(tbl_li_o_NR_OPER_TRAT_PREV.AsString, 1, 2 ) + '/' +
                                                      Copy(tbl_li_o_NR_OPER_TRAT_PREV.AsString, 3, 7 ) + '-' +
                                                      Copy(tbl_li_o_NR_OPER_TRAT_PREV.AsString, 10, 1 ) + ' - ' +
                                                      cProcBroker;
        Application.ProcessMessages;

        if qry_existe_li_.Active then
          qry_existe_li_.Close;
        //qry_existe_li_.ParamByName('NR_PROCESSO').AsString := copy( cProcBroker, 1,18 );
        qry_existe_li_.Parameters.ParamByName('NR_PROCESSO').Value := cProcBroker;
        qry_existe_li_.Open;
        totLI := qry_existe_li_TOT_LI.AsInteger;
        qry_existe_li_.Close;

        if totLI > 0 then
        begin
          qry_li_d_.First;
          if not qry_li_d_.Locate('NR_PROCESSO', cProcBroker, []) then
            nLoop := True
          else
            qry_li_d_.Edit;
        end
        else
          nLoop := True;

        if not nLoop then
        begin
          qry_li_d_NR_REGISTRO_LI.AsString       := tbl_li_o_NR_OPER_TRAT_PREV.AsString;
          qry_li_d_NR_PROCESSO_SISCOMEX.AsString := tbl_li_o_NR_TRAT_IMP_MICRO.AsString;
          qry_li_d_CD_URF_ENTRADA.AsString       := tbl_li_o_CD_URF_ENTR_MERC.AsString;
          qry_li_d_CD_PAIS_PROCEDENCIA.AsString  := tbl_li_o_CD_PAIS_PROC_MERC.AsString;

          if tbl_li_o_PL_MERCADORIA.AsString <> '' then
            qry_li_d_QT_TOTAL_PES_LIQ.AsFloat      := tbl_li_o_PL_MERCADORIA.AsFloat / 100000
          else
            qry_li_d_QT_TOTAL_PES_LIQ.AsFloat      := 0;

          if tbl_li_o_QT_UN_ESTATISTICA.AsString <> '' then
            qry_li_d_QT_MED_ESTATISTICA.AsFloat    := tbl_li_o_QT_UN_ESTATISTICA.AsFloat / 100000
          else
            qry_li_d_QT_MED_ESTATISTICA.AsFloat    := 0;

          qry_li_d_CD_MOEDA_MLE.AsString         := tbl_li_o_CD_MOEDA_NEGOCIADA.AsString;

          if tbl_li_o_QT_DIA_LIMITE_PGTO.AsString <> '' then
            qry_li_d_QT_DIAS_COBERTURA.AsInteger   := tbl_li_o_QT_DIA_LIMITE_PGTO.AsInteger
          else
            qry_li_d_QT_DIAS_COBERTURA.AsInteger   := 0;

          qry_li_d_CD_INCOTERM.AsString          := tbl_li_o_CD_INCOTERMS_VENDA.AsString;

          if tbl_li_o_VL_MERC_MNEG_EMB.AsString <> '' then
            qry_li_d_VL_TOTAL_MOEDA.AsFloat        := tbl_li_o_VL_MERC_MNEG_EMB.AsFloat / 100
          else
            qry_li_d_VL_TOTAL_MOEDA.AsFloat        := 0;

          if tbl_li_o_CD_TIPO_ACORDO_TAR.AsString <> '' then
            qry_li_d_TP_ACORDO_ALADI.AsString   := IntToStr(StrToInt(tbl_li_o_CD_TIPO_ACORDO_TAR.AsString) + 1);

          qry_li_d_CD_ACORDO_ALADI.AsString      := tbl_li_o_CD_ACORDO_ALADI.AsString;
          qry_li_d_CD_REGIME_TRIBUTACAO.AsString := tbl_li_o_CD_REGIME_TRIBUTAR.AsString;
          qry_li_d_CD_FUND_LEGAL.AsString        := tbl_li_o_CD_FUND_LEG_REGIME.AsString;
          qry_li_d_TP_CAMBIO.AsString            := tbl_li_o_CD_COBERT_CAMBIAL.AsString;
          qry_li_d_CD_MOD_PAGAMENTO.AsString     := tbl_li_o_CD_MODALIDADE_PGTO.AsString;
          qry_li_d_CD_INSTITUICAO_FINANC.AsString:= tbl_li_o_CD_ORGAO_FIN_INTER.AsString;
          qry_li_d_CD_MOT_SEM_COBERTURA.AsString := tbl_li_o_CD_MOTIVO_SEM_COB.AsString;
          qry_li_d_CD_AGENCIA_SECEX.AsString     := tbl_li_o_CD_AGENCIA_SECEX.AsString;
          qry_li_d_CD_URF_DESPACHO.AsString      := tbl_li_o_CD_URF_DESPACHO.AsString;

          if tbl_li_o_IN_BEM_ENCOMENDA.AsBoolean  then
            qry_li_d_CD_CONDICAO_MERC.AsString  := '0';

          if tbl_li_o_IN_MATERIAL_USADO.AsBoolean  then
            qry_li_d_CD_CONDICAO_MERC.AsString  := '1';

          qry_li_d_NR_ATO_DRAWBACK.AsString      := tbl_li_o_NR_ATO_DRAWBACK.AsString;
          qry_li_d_NR_COMUNICADO_COMPRA.AsString := tbl_li_o_NR_COMUNIC_COMPRA.AsString;

          if tbl_li_o_DT_REG_OPER_TRAT.AsString <> '' then
            qry_li_d_DT_REGISTRO_LI.AsDateTime     := StrToDate(tbl_li_o_DT_REG_OPER_TRAT.AsString);

          if tbl_li_o_DT_ATU_OPER_MICRO.AsString <> '' then
            qry_li_d_DT_PROCESSO_LI.AsDateTime     := StrToDate(tbl_li_o_DT_ATU_OPER_MICRO.AsString);

          if tbl_li_o_NR_LI_SUBSTITUIDO.AsString <> '' then
            qry_li_d_NR_LI_SUBSTITUIDO.AsString    := tbl_li_o_NR_LI_SUBSTITUIDO.AsString;

          qry_li_d_TX_INFO_COMPLEMENTAR.Assign(tbl_li_o_TX_INFO_COMPL);
          qry_li_d_.Post;

          Application.ProcessMessages;

          AtualizaItens;

          Application.ProcessMessages;

          AtualizaDest_NCM;

          Application.ProcessMessages;
        end
        else
        begin
          qry_li_d_.Cancel;
          Lista.Add(cProcBroker);
        end;
      end;

      tbl_li_o_.Next;                                                
    end;

    tbl_li_o_.Close;

    qry_li_d_.Close;
    qry_det_merc_d_.Close;

    Mensagem.SimpleText := 'Desconectando com o Banco de Dados.';
    Application.ProcessMessages;
    if Lista.Count > 0 then
      MessageDlg('Os processos abaixo não foram recuperados.'#13 +
                 'Informe ao TI para que possa ser ajustado.'#13 + Lista.Text, mtWarning, [mbOk], 0);
    Lista.Free;
  end;
end;

procedure Tfrm_integracao_LI.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integracao_LI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_integracao_li.Free;
  Action := caFree;
end;

procedure Tfrm_integracao_LI.FormCreate(Sender: TObject);
begin
  // Inicializa o Data Module para Evento
  Application.CreateForm(Tdatm_integracao_li, datm_integracao_li);
  with datm_integracao_li do
    ConBroker.Open;
end;

procedure Tfrm_Integracao_LI.IntegraLI2;
begin
  Mensagem.SimpleText := 'Conectando com o Banco de Dados.';
  Application.ProcessMessages;

  with datm_integracao_li do
  begin
    tbl_li_o_.Open;

    tbl_li_d_.Open;
    tbl_det_merc_d_.Open;

    while not tbl_li_o_.Eof do
    begin
      if tbl_li_o_NR_OPER_TRAT_PREV.AsString <> '' then
      begin
        nLI := nLI + 1;
        Mensagem.SimpleText := 'Processando LI nº ' + Copy(tbl_li_o_NR_OPER_TRAT_PREV.AsString, 1, 2 ) + '/' +
                                                      Copy(tbl_li_o_NR_OPER_TRAT_PREV.AsString, 3, 7 ) + '-' +
                                                      Copy(tbl_li_o_NR_OPER_TRAT_PREV.AsString, 10, 1 ) + ' - ' +
                                                      AjustaProcesso(tbl_li_o_NR_IDENT_USUARIO.AsString);
        Application.ProcessMessages;

        if tbl_li_d_.Locate('NR_OPER_TRAT_PREV', tbl_li_o_NR_OPER_TRAT_PREV.AsString, []) then
        begin
          nLI_a := nLI_a + 1;
          tbl_li_d_.Edit
        end
        else
        begin
          nLI_i := nLI_i + 1;
          tbl_li_d_.Append;
          tbl_li_d_NR_OPER_TRAT_PREV.AsString   := tbl_li_o_NR_OPER_TRAT_PREV.AsString;
        end;

        tbl_li_d_NR_TRAT_IMP_MICRO.AsString     := tbl_li_o_NR_TRAT_IMP_MICRO.AsString;
        //tbl_li_d_.FieldByName('NR_IDENT_USUARIO').AsString      := tbl_li_o_.FieldByName('NR_IDENT_USUARIO').AsString;
        tbl_li_d_NR_IDENT_USUARIO.AsString      := AjustaProcesso(tbl_li_o_NR_IDENT_USUARIO.AsString);
        tbl_li_d_NR_OPER_TRAT_PROT.AsString     := tbl_li_o_NR_OPER_TRAT_PROT.AsString;
        tbl_li_d_CD_AUTORIZ_TRANSM.AsString     := tbl_li_o_CD_AUTORIZ_TRANSM.AsString;
        tbl_li_d_NR_LI_SUBSTITUIDO.AsString     := tbl_li_o_NR_LI_SUBSTITUIDO.AsString;
        tbl_li_d_CD_ORIGEM_LI.AsString          := tbl_li_o_CD_ORIGEM_LI.AsString;
        tbl_li_d_NR_DECL_IMP_VINC.AsString      := tbl_li_o_NR_DECL_IMP_VINC.AsString;
        tbl_li_d_NR_ADI_IMP_VINC.AsString       := tbl_li_o_NR_ADI_IMP_VINC.AsString;
        tbl_li_d_NR_SEQ_RETI_VINC.AsString      := tbl_li_o_NR_SEQ_RETI_VINC.AsString;
        tbl_li_d_CD_TIPO_IMPORTADOR.AsString    := tbl_li_o_CD_TIPO_IMPORTADOR.AsString;
        tbl_li_d_NR_IMPORTADOR.AsString         := tbl_li_o_NR_IMPORTADOR.AsString;
        tbl_li_d_CD_PAIS_IMPORTADOR.AsString    := tbl_li_o_CD_PAIS_IMPORTADOR.AsString;
        tbl_li_d_NM_IMPORTADOR.AsString         := tbl_li_o_NM_IMPORTADOR.AsString;
        tbl_li_d_NR_TEL_IMPORTADOR.AsString     := tbl_li_o_NR_TEL_IMPORTADOR.AsString;
        tbl_li_d_ED_LOGR_IMPORTADOR.AsString    := tbl_li_o_ED_LOGR_IMPORTADOR.AsString;
        tbl_li_d_ED_NR_IMPORTADOR.AsString      := tbl_li_o_ED_NR_IMPORTADOR.AsString;
        tbl_li_d_ED_COMPL_IMPO.AsString         := tbl_li_o_ED_COMPL_IMPO.AsString;
        tbl_li_d_ED_BA_IMPORTADOR.AsString      := tbl_li_o_ED_BA_IMPORTADOR.AsString;
        tbl_li_d_ED_MUN_IMPORTADOR.AsString     := tbl_li_o_ED_MUN_IMPORTADOR.AsString;
        tbl_li_d_ED_UF_IMPORTADOR.AsString      := tbl_li_o_ED_UF_IMPORTADOR.AsString;
        tbl_li_d_ED_CEP_IMPORTADOR.AsString     := tbl_li_o_ED_CEP_IMPORTADOR.AsString;
        tbl_li_d_CD_ATIV_ECON_IMPO.AsString     := tbl_li_o_CD_ATIV_ECON_IMPO.AsString;
        tbl_li_d_NR_CPF_REPR_LEGAL.AsString     := tbl_li_o_NR_CPF_REPR_LEGAL.AsString;
        tbl_li_d_CD_URF_ENTR_MERC.AsString      := tbl_li_o_CD_URF_ENTR_MERC.AsString;
        tbl_li_d_NM_FORN_ESTR.AsString          := tbl_li_o_NM_FORN_ESTR.AsString;
        tbl_li_d_ED_LOGR_FORN_ESTR.AsString     := tbl_li_o_ED_LOGR_FORN_ESTR.AsString;
        tbl_li_d_ED_NR_FORN_ESTR.AsString       := tbl_li_o_ED_NR_FORN_ESTR.AsString;
        tbl_li_d_ED_COMPL_FORN_ESTR.AsString    := tbl_li_o_ED_COMPL_FORN_ESTR.AsString;
        tbl_li_d_ED_CIDAD_FORN_ESTR.AsString    := tbl_li_o_ED_CIDAD_FORN_ESTR.AsString;
        tbl_li_d_ED_ESTAD_FORN_ESTR.AsString    := tbl_li_o_ED_ESTAD_FORN_ESTR.AsString;
        tbl_li_d_CD_PAIS_AQUIS_MERC.AsString    := tbl_li_o_CD_PAIS_AQUIS_MERC.AsString;
        tbl_li_d_CD_MERCADORIA_NCM.AsString     := tbl_li_o_CD_MERCADORIA_NCM.AsString;
        tbl_li_d_CD_PAIS_PROC_MERC.AsString     := tbl_li_o_CD_PAIS_PROC_MERC.AsString;
        tbl_li_d_CD_AUSENCIA_FABRIC.AsString    := tbl_li_o_CD_AUSENCIA_FABRIC.AsString;
        tbl_li_d_NM_FABRICANTE_MERC.AsString    := tbl_li_o_NM_FABRICANTE_MERC.AsString;
        tbl_li_d_ED_LOGR_FABRIC.AsString        := tbl_li_o_ED_LOGR_FABRIC.AsString;
        tbl_li_d_ED_NR_FABRIC.AsString          := tbl_li_o_ED_NR_FABRIC.AsString;
        tbl_li_d_ED_COMPL_FABRIC.AsString       := tbl_li_o_ED_COMPL_FABRIC.AsString;
        tbl_li_d_ED_CIDAD_FABRIC.AsString       := tbl_li_o_ED_CIDAD_FABRIC.AsString;
        tbl_li_d_ED_ESTADO_FABRIC.AsString      := tbl_li_o_ED_ESTADO_FABRIC.AsString;
        tbl_li_d_CD_PAIS_ORIG_MERC.AsString     := tbl_li_o_CD_PAIS_ORIG_MERC.AsString;
        tbl_li_d_CD_MERC_NALADI_NCC.AsString    := tbl_li_o_CD_MERC_NALADI_NCC.AsString;
        tbl_li_d_CD_MERC_NALADI_SH.AsString     := tbl_li_o_CD_MERC_NALADI_SH.AsString;
        tbl_li_d_PL_MERCADORIA.AsString         := tbl_li_o_PL_MERCADORIA.AsString;
        tbl_li_d_QT_UN_ESTATISTICA.AsString     := tbl_li_o_QT_UN_ESTATISTICA.AsString;
        tbl_li_d_CD_MOEDA_NEGOCIADA.AsString    := tbl_li_o_CD_MOEDA_NEGOCIADA.AsString;
        tbl_li_d_QT_DIA_LIMITE_PGTO.AsString    := tbl_li_o_QT_DIA_LIMITE_PGTO.AsString;
        tbl_li_d_CD_INCOTERMS_VENDA.AsString    := tbl_li_o_CD_INCOTERMS_VENDA.AsString;
        tbl_li_d_VL_MERC_MNEG_EMB.AsString      := tbl_li_o_VL_MERC_MNEG_EMB.AsString;
        tbl_li_d_VL_TOT_DOLAR_EMB.AsString      := tbl_li_o_VL_TOT_DOLAR_EMB.AsString;
        tbl_li_d_CD_TIPO_ACORDO_TAR.AsString    := tbl_li_o_CD_TIPO_ACORDO_TAR.AsString;
        tbl_li_d_CD_ACORDO_ALADI.AsString       := tbl_li_o_CD_ACORDO_ALADI.AsString;
        tbl_li_d_CD_REGIME_TRIBUTAR.AsString    := tbl_li_o_CD_REGIME_TRIBUTAR.AsString;
        tbl_li_d_CD_FUND_LEG_REGIME.AsString    := tbl_li_o_CD_FUND_LEG_REGIME.AsString;
        tbl_li_d_CD_COBERT_CAMBIAL.AsString     := tbl_li_o_CD_COBERT_CAMBIAL.AsString;
        tbl_li_d_CD_MODALIDADE_PGTO.AsString    := tbl_li_o_CD_MODALIDADE_PGTO.AsString;
        tbl_li_d_CD_ORGAO_FIN_INTER.AsString    := tbl_li_o_CD_ORGAO_FIN_INTER.AsString;
        tbl_li_d_CD_MOTIVO_SEM_COB.AsString     := tbl_li_o_CD_MOTIVO_SEM_COB.AsString;
        tbl_li_d_CD_AGENCIA_SECEX.AsString      := tbl_li_o_CD_AGENCIA_SECEX.AsString;
        tbl_li_d_CD_URF_DESPACHO.AsString       := tbl_li_o_CD_URF_DESPACHO.AsString;
        tbl_li_d_IN_REST_DATA_EMB_LI.AsString   := tbl_li_o_IN_REST_DATA_EMB_LI.AsString;
        tbl_li_d_IN_MATERIAL_USADO.AsBoolean    := tbl_li_o_IN_MATERIAL_USADO.AsBoolean;
        tbl_li_d_IN_BEM_ENCOMENDA.AsBoolean     := tbl_li_o_IN_BEM_ENCOMENDA.AsBoolean;
        tbl_li_d_NR_ATO_DRAWBACK.AsString       := tbl_li_o_NR_ATO_DRAWBACK.AsString;
        tbl_li_d_NR_COMUNIC_COMPRA.AsString     := tbl_li_o_NR_COMUNIC_COMPRA.AsString;
        tbl_li_d_DT_REG_OPER_TRAT.AsString      := tbl_li_o_DT_REG_OPER_TRAT.AsString;
        tbl_li_d_DT_ATU_OPER_MICRO.AsString     := tbl_li_o_DT_ATU_OPER_MICRO.AsString;
        tbl_li_d_IN_SALVO_DIAG.AsBoolean        := tbl_li_o_IN_SALVO_DIAG.AsBoolean;
        tbl_li_d_IN_SELECAO_DIAG.AsBoolean      := tbl_li_o_IN_SELECAO_DIAG.AsBoolean;
        // Sera resolvido posteriormente - Henrique 17/06/1998
        // tbl_li_d_.FieldByName('TX_INFO_COMPL.AsString         := tbl_li_o_.FieldByName('TX_INFO_COMPL.AsString;
        tbl_li_d_TX_INFO_COMPL.Assign(tbl_li_o_TX_INFO_COMPL);
        tbl_li_d_CD_SITUAC_OP_TRAT.AsString     := tbl_li_o_CD_SITUAC_OP_TRAT.AsString;
        tbl_li_d_DT_SITUAC_OP_TRAT.AsString     := tbl_li_o_DT_SITUAC_OP_TRAT.AsString;
        tbl_li_d_DT_VALID_OP_TRAT.AsString      := tbl_li_o_DT_VALID_OP_TRAT.AsString;
        tbl_li_d_CD_CANCEL_OP_TRAT.AsString     := tbl_li_o_CD_CANCEL_OP_TRAT.AsString;
        tbl_li_d_DT_CANCEL_OP_TRAT.AsString     := tbl_li_o_DT_CANCEL_OP_TRAT.AsString;
        tbl_li_d_NR_CPF_CANC_ANUENC.AsString    := tbl_li_o_NR_CPF_CANC_ANUENC.AsString;
        tbl_li_d_NR_LI_SUBSTITUTIVO.AsString    := tbl_li_o_NR_LI_SUBSTITUTIVO.AsString;
        tbl_li_d_IN_REG_DRAWBACK.AsString       := tbl_li_o_IN_REG_DRAWBACK.AsString;
        tbl_li_d_NR_REG_DRAWBACK.AsString       := tbl_li_o_NR_REG_DRAWBACK.AsString;
        tbl_li_d_.Post;

        lbl_q_li.Caption   := IntToStr(nLI);
        lbl_q_li_a.Caption := IntToStr(nLI_a);
        lbl_q_li_i.Caption := IntToStr(nLI_i);

        Application.ProcessMessages;

        AtualizaItens2;

        Application.ProcessMessages;

        AtualizaDest_NCM2;

        Application.ProcessMessages;

      end;

      tbl_li_o_.Next;

    end;

    tbl_li_o_.Close;

    tbl_li_d_.Close;
    tbl_det_merc_d_.Close;

    Mensagem.SimpleText := 'Desconectando com o Banco de Dados.';
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_Integracao_LI.AtualizaItens2;
begin
  with datm_integracao_li do
  begin
    qry_det_merc_o_.Close;
    qry_det_merc_o_.Parameters.ParamByName('NR_TRAT_IMP_MICRO').Value := tbl_li_o_NR_TRAT_IMP_MICRO.AsString;
    qry_det_merc_o_.Open;

    While not qry_det_merc_o_.Eof Do
    begin
      nItens := nItens + 1;
      lbl_q_itens.Caption := IntToStr(nItens);

      Application.ProcessMessages;

      if tbl_det_merc_d_.Locate('NR_OPER_TRAT_PREV;NR_SEQ_PRODUTO', VarArrayOf([tbl_li_o_NR_OPER_TRAT_PREV.AsString, qry_det_merc_o_NR_SEQ_PRODUTO.AsString]), []) then
        tbl_det_merc_d_.Edit
      else
      begin
        tbl_det_merc_d_.Append;
        tbl_det_merc_d_NR_OPER_TRAT_PREV.AsString  := tbl_li_o_NR_OPER_TRAT_PREV.AsString;
        tbl_det_merc_d_NR_SEQ_PRODUTO.AsString     := qry_det_merc_o_NR_SEQ_PRODUTO.AsString;
      end;

      tbl_det_merc_d_QT_MERC_UN_COMERC.AsString    := qry_det_merc_o_QT_MERC_UN_COMERC.AsString;
      tbl_det_merc_d_NM_UN_MEDID_COMER.AsString    := qry_det_merc_o_NM_UN_MEDID_COMER.AsString;
      tbl_det_merc_d_VL_UNID_COND_VENDA.AsString   := qry_det_merc_o_VL_UNID_COND_VENDA.AsString;
      tbl_det_merc_d_TX_DESC_DET_MERC.Assign(qry_det_merc_o_TX_DESC_DET_MERC);
      tbl_det_merc_d_CD_PRODUTO.AsString           := qry_det_merc_o_CD_PRODUTO.AsString;
      tbl_det_merc_d_NR_ITEM_DRAWBACK.AsString     := qry_det_merc_o_NR_ITEM_DRAWBACK.AsString;
      if qry_det_merc_o_QT_PROD_DRAWBACK.AsString <> '' then
        tbl_det_merc_d_QT_PROD_DRAWBACK.AsString     := qry_det_merc_o_QT_PROD_DRAWBACK.AsString
      else
        tbl_det_merc_d_QT_PROD_DRAWBACK.AsString     := '0';
      if qry_det_merc_o_VL_PROD_DRAWBACK.AsString <> '' then
         tbl_det_merc_d_VL_PROD_DRAWBACK.AsString     := qry_det_merc_o_VL_PROD_DRAWBACK.AsString
      else
         tbl_det_merc_d_VL_PROD_DRAWBACK.AsString     := '0';

      tbl_det_merc_d_.Post;

      qry_det_merc_o_.Next;
    end;

    qry_det_merc_o_.Close;
  end;

end;

procedure Tfrm_Integracao_LI.AtualizaDest_NCM2;
begin
  with datm_integracao_li do
  begin
    qry_dest_ncm_o_.Close;
    qry_dest_ncm_o_.Parameters.ParamByName('NR_TRAT_IMP_MICRO').Value := tbl_li_o_NR_TRAT_IMP_MICRO.AsString;
    qry_dest_ncm_o_.Open;

    tbl_dest_ncm_d_.Open;
    while not qry_dest_ncm_o_.Eof do
    begin
      nDest := nDest + 1;
      lbl_q_dest_ncm.Caption := IntToStr(nDest);

      Application.ProcessMessages;

      if not tbl_dest_ncm_d_.Locate('NR_OPER_TRAT_PREV;NR_DESTAQUE_NCM', VarArrayOf([tbl_li_o_NR_OPER_TRAT_PREV.AsString, qry_dest_ncm_o_NR_DESTAQUE_NCM.AsString]), []) then
      begin
        tbl_dest_ncm_d_.Append;
        tbl_dest_ncm_d_NR_OPER_TRAT_PREV.AsString := tbl_li_o_NR_OPER_TRAT_PREV.AsString;
        tbl_dest_ncm_d_NR_DESTAQUE_NCM.AsString   := qry_dest_ncm_o_NR_DESTAQUE_NCM.AsString;
        tbl_dest_ncm_d_.Post;
      end;
      qry_dest_ncm_o_.Next
    end;
    tbl_dest_ncm_d_.Close;

    qry_dest_ncm_o_.Close;
  end;
end;

function Tfrm_integracao_LI.AjustaProcesso(AProcesso: String): String;
begin
  if Length(Trim(AProcesso)) = 15 then // Processos até 2013
    Result := Copy(AProcesso,  1, 6) + '-' + // Unidade + Produto + Prefixo. Ex: 0101IM
              Copy(AProcesso,  7, 4) + '-' + // Número do processo. Ex: 0001
              Copy(AProcesso, 11, 2) + '-' + // Ano do processo. Ex: 09
              Copy(AProcesso, 13, 3)         // Número da adição. Ex: 001
  else // Processo a partir de 2014
    Result := Copy(AProcesso,  1, 6) + '-' + // Unidade + Produto + Prefixo. Ex: 0101IM
              Copy(AProcesso,  7, 6) + '-' + // Número do processo. Ex: 000001
              Copy(AProcesso, 13, 2) + '-' + // Ano do processo. Ex: 09
              Copy(AProcesso, 15, 3);        // Número da adição. Ex: 001
end;

end.
