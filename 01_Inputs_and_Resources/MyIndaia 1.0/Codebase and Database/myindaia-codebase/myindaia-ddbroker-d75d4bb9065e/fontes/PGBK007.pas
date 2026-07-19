{ Transmissão de Licenca de Importação }

unit PGLI007;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DbTables, DBGrids, ByCustomDBGrid, ExtCtrls,
  Menus;

type
  Tfrm_trans_LI = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    dbgrd_li: TDBGrid;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_trans_LI: TSpeedButton;
    btn_cancelar: TSpeedButton;
    gbox_monitor: TGroupBox;
    lbl_Capas: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_processos: TLabel;
    lbl_itens: TLabel;
    lbl_mensagem: TLabel;
    menu_trans_li: TMainMenu;
    mi_trans_LI: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_chave1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_ordem1Click(Sender: TObject);
    procedure btn_trans_LIClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;

    procedure integrali;
    procedure numera_li;
    procedure IntegraItemLI;
    procedure ItemLI;
    procedure Det_NCM_LI;
    procedure Proc_Anuente;

    procedure open_tabelas_broker;
    procedure close_tabelas_broker;
    function  Nr_Import(cTipo : String) : String ;

  public
    { Public declarations }
    function Campo_DigitoCGC(cAgenciaSecex : String) : String;
  end;

var
  frm_trans_LI: Tfrm_trans_LI;
  nProcesso, nAdicao, nItem : Integer;
  cProcSCX, cProcGIP, cItemLI : String;
  nDest : Integer;
  aDest : array[0..3] of string;
  cCursor  : TCursor;
  lCancelar : Boolean;

implementation

uses PGGP001, GSMLIB, PGLI008;
//uses pggl000, pggl015, Pggl010, Pggl008, pggl019, pggl020;

{$R *.DFM}

procedure Tfrm_trans_LI.FormShow(Sender: TObject);
begin
  with datm_trans_LI do
  begin
    edt_chave.Text       := '';
    lCancelar            := False;
    cb_ordem.ItemIndex   := 0;
    cCursor              := Screen.Cursor;
    Screen.Cursor        := crHourGlass;

    qry_li_lista_.Close;
    qry_li_lista_.Prepare;
    qry_li_lista_.Open;
    btn_trans_LI.Enabled := True;
    btn_sair.Enabled     := True;
    mi_trans_li.Enabled  := True;
    mi_sair.Enabled      := True;
    Screen.Cursor        := cCursor;
  end;
end;

procedure Tfrm_trans_LI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_trans_LI do
  begin
    qry_li_.Close;
    REGIMP.Connected   := False;
    TABSISCO.Connected := False;
    Destroy;
  end;
end;

procedure Tfrm_trans_LI.edt_chave1Change(Sender: TObject);
begin
  Localiza( datm_trans_LI.qry_li_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_trans_LI.IntegraLI;
var
  cFabricante, cExportador : String;
  lRepetir : Boolean;
begin
  with datm_trans_LI do
  begin
    lRepetir := True;

    lbl_mensagem.caption := 'Transmitindo LI ... ';
    Application.ProcessMessages;

    if ( Trim( qry_li_.FieldByName('NR_PROCESSO_SISCOMEX').AsString ) = '' ) or
       ( qry_li_.FieldByName('NR_PROCESSO_SISCOMEX').IsNull ) then
    begin
      Numera_LI;
    end
    else
    begin
      cProcSCX := qry_li_.FieldByName('NR_PROCESSO_SISCOMEX').AsString;
    end;

    while lRepetir do
    begin
      qry_li_scx_.Close;
      qry_li_scx_.ParamByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
      qry_li_scx_.Prepare;
      qry_li_scx_.Open;
      if qry_li_scx_.RecordCount > 0 then
      begin
        { Check para evitar a sobreposição de Processos }
        if qry_li_scx_.FieldbyName('NR_IDENT_USUARIO').AsString <> '' then
        begin
          if Trim( qry_li_scx_.FieldbyName('NR_IDENT_USUARIO').AsString ) <>
             Trim( qry_li_.FieldByName('NR_PROCESSO').AsString ) then
          begin
            { Possibilidade de Sobreposição pois a referencia do Cliente é diferente }
            Numera_LI;
            lRepetir := True;
          end
          else
          begin
            lRepetir := False;
          end;
        end
        else
        begin
          lRepetir := False;
        end;
      end
      else
      begin
        lRepetir := False;
      end;
    end;

    if qry_li_scx_.RecordCount > 0 then
    begin
      qry_li_scx_.Edit;
    end
    else
    begin
      qry_li_scx_.Append;
      qry_li_scx_.FieldbyName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
      qry_li_scx_.FieldbyName('CD_ORIGEM_LI').AsString      := '1';   {Texto 10}
      qry_li_scx_.FieldbyName('IN_SALVO_DIAG').AsBoolean    := False; {Sim/Não 1}
      qry_li_scx_.FieldbyName('IN_SELECAO_DIAG').AsBoolean  := False; {Sim/Não 1}
    end;
    cProcGIP := qry_li_.FieldByName('NR_PROCESSO').AsString;

    qry_li_itens_.Close;
    qry_li_itens_.Prepare;
    qry_li_itens_.Open;

    qry_li_scx_.FieldbyName('NR_IDENT_USUARIO').AsString    := cProcGIP;
    qry_li_scx_.FieldByName('DT_ATU_OPER_MICRO').AsString   := FormatDateTime('dd/mm/yyyy',Date);

    if qry_li_.FieldByName('CD_IMPORTADOR').AsString <> '' then
    begin
      qry_emp_nac_.Close;
      qry_emp_nac_.ParamByName('CD_CLIENTE').AsString := qry_li_.FieldByName('CD_IMPORTADOR').AsString;
      qry_emp_nac_.Prepare;
      qry_emp_nac_.Open;

      if qry_emp_nac_.RecordCount > 0 then
      begin
        qry_li_scx_.FieldbyName('CD_TIPO_IMPORTADOR').AsString :=
           Tipo_Importador( qry_emp_nac_.FieldByName('CD_TIPO_PESSOA').AsString );

        qry_li_scx_.FieldbyName('NR_IMPORTADOR').AsString :=
           Nr_Import( qry_li_scx_.FieldbyName('CD_TIPO_IMPORTADOR').AsString);

        if ( qry_li_scx_.FieldByName('CD_TIPO_IMPORTADOR').AsString = '3' ) or
           ( qry_li_scx_.FieldByName('CD_TIPO_IMPORTADOR').AsString = '4' ) then
        begin
          qry_li_scx_.FieldByName('CD_PAIS_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('CD_PAIS_IMPORTADOR').AsString;
          qry_li_scx_.FieldByName('NM_IMPORTADOR').AsString      :=
             qry_emp_nac_.FieldByName('NM_EMPRESA').AsString;
          qry_li_scx_.FieldByName('NR_TEL_IMPORTADOR').AsString  :=
             qry_emp_nac_.FieldByName('NR_FONE').AsString;
          qry_li_scx_.FieldByName('ED_LOGR_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('END_EMPRESA').AsString;
          qry_li_scx_.FieldByName('ED_NR_IMPORTADOR').AsString   :=
             qry_emp_nac_.FieldByName('END_NUMERO').AsString;
          qry_li_scx_.FieldByName('ED_BA_IMPORTADOR').AsString   :=
             qry_emp_nac_.FieldByName('END_BAIRRO').AsString;
          qry_li_scx_.FieldByName('ED_MUN_IMPORTADOR').AsString  :=
             qry_emp_nac_.FieldByName('END_CIDADE').AsString;
          qry_li_scx_.FieldByName('ED_UF_IMPORTADOR').AsString   :=
             qry_emp_nac_.FieldByName('END_UF').AsString;
          qry_li_scx_.FieldByName('ED_CEP_IMPORTADOR').AsString  :=
             qry_emp_nac_.FieldByName('END_CEP').AsString;
          qry_li_scx_.FieldByName('CD_ATIV_ECON_IMPO').AsString  :=
             qry_emp_nac_.FieldByName('CD_ATIV_ECONOMICA').AsString;
          qry_li_scx_.FieldByName('ED_COMPL_IMPO').AsString      := Replicate( ' ',30);
        end;
      end;
    end;

    if Trim( qry_li_.FieldByName('CD_URF_ENTRADA').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_URF_ENTR_MERC').AsString       :=
         Trim( qry_li_.FieldByName('CD_URF_ENTRADA').AsString );
    end;
    if qry_li_itens_.FieldByName('CD_FABR_EXPO').AsInteger <> 0 then
    begin
      datm_trans_LI.qry_li_scx_.FieldByName('CD_AUSENCIA_FABRIC').AsString :=
         Trim( IntToStr( qry_li_itens_.FieldByName('CD_FABR_EXPO').AsInteger ) );
    end;

    if Trim( qry_li_itens_.FieldByName('CD_EXPORTADOR').AsString ) <> '' then
    begin
      cExportador := Trim( qry_li_itens_.FieldByName('CD_EXPORTADOR').AsString );

      qry_emp_est_.Close;
      qry_emp_est_.ParamByName('CD_EMPRESA').AsString := cExportador;
      qry_emp_est_.Prepare;
      qry_emp_est_.Open;

      if qry_emp_est_.RecordCount > 0 then
      begin
        if Trim( qry_emp_est_.FieldByName('NM_EMPRESA').AsString ) <> '' then
        begin
          qry_li_scx_.FieldByName('NM_FORN_ESTR').AsString :=
             Trim( qry_emp_est_.FieldByName('NM_EMPRESA').AsString );
        end;
        if Trim( qry_emp_est_.FieldByName('END_EMPRESA').AsString ) <> '' then
        begin
          qry_li_scx_.FieldByName('ED_LOGR_FORN_ESTR').AsString :=
             Trim( qry_emp_est_.FieldByName('END_EMPRESA').AsString );
        end;
        if Trim( qry_emp_est_.FieldByName('END_NUMERO').AsString ) <> '' then
        begin
          qry_li_scx_.FieldByName('ED_NR_FORN_ESTR').AsString :=
             Trim( qry_emp_est_.FieldByName('END_NUMERO').AsString );
        end;
        if Trim( qry_emp_est_.FieldByName('END_COMPL').AsString ) <> '' then
        begin
          qry_li_scx_.FieldByName('ED_COMPL_FORN_ESTR').AsString :=
             Trim( qry_emp_est_.FieldByName('END_COMPL').AsString );
        end;
        if Trim( qry_emp_est_.FieldByName('END_CIDADE').AsString ) <> '' then
        begin
          qry_li_scx_.FieldByName('ED_CIDAD_FORN_ESTR').AsString :=
             Trim( qry_emp_est_.FieldByName('END_CIDADE').AsString );
        end;
        if Trim( qry_emp_est_.FieldByName('END_ESTADO').AsString ) <> '' then
        begin
          qry_li_scx_.FieldByName('ED_ESTAD_FORN_ESTR').AsString :=
             Trim( qry_emp_est_.FieldByName('END_ESTADO').AsString );
        end;
        if Trim( qry_emp_est_.FieldByName('CD_PAIS').AsString ) <> '' then
        begin
          qry_li_scx_.FieldByName('CD_PAIS_AQUIS_MERC').AsString :=
             Trim( qry_emp_est_.FieldByName('CD_PAIS').AsString );
        end;
      end;
    end;
    if Trim( qry_li_itens_.FieldByName('CD_PAIS_AQUISICAO').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_PAIS_AQUIS_MERC').AsString :=
         Trim( qry_li_itens_.FieldByName('CD_PAIS_AQUISICAO').AsString );
    end;
    if Trim( qry_li_.FieldByName('CD_PAIS_PROCEDENCIA').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_PAIS_PROC_MERC').AsString :=
         Trim( qry_li_.FieldByName('CD_PAIS_PROCEDENCIA').AsString );
    end;

    if Trim( qry_li_itens_.FieldByName('CD_NCM_SH').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_MERCADORIA_NCM').AsString :=
         qry_li_itens_.FieldByName('CD_NCM_SH').AsString;
    end;

    if qry_li_scx_.FieldByName('CD_AUSENCIA_FABRIC').AsString = '2' then
    begin
      if Trim( qry_li_itens_.FieldByName('CD_FABRICANTE').AsString ) <> '' then
      begin
        cFabricante := Trim( qry_li_itens_.FieldByName('CD_FABRICANTE').AsString );
        qry_emp_est_.Close;
        qry_emp_est_.ParamByName('CD_EMPRESA').AsString := cFabricante;
        qry_emp_est_.Prepare;
        qry_emp_est_.Open;

        if qry_emp_est_.RecordCount > 0 then
        begin
          if Trim( qry_emp_est_.FieldByName('NM_EMPRESA').AsString ) <> '' then
          begin
            qry_li_scx_.FieldByName('NM_FABRICANTE_MERC').AsString :=
               Trim( qry_emp_est_.FieldByName('NM_EMPRESA').AsString );
          end;
          if Trim( qry_emp_est_.FieldByName('END_EMPRESA').AsString ) <> '' then
          begin
            qry_li_scx_.FieldByName('ED_LOGR_FABRIC').AsString :=
               Trim( qry_emp_est_.FieldByName('END_EMPRESA').AsString );
          end;
          if Trim( qry_emp_est_.FieldByName('END_NUMERO').AsString ) <> '' then
          begin
            qry_li_scx_.FieldByName('ED_NR_FABRIC').AsString :=
               Trim( qry_emp_est_.FieldByName('END_NUMERO').AsString );
          end;
          if Trim( qry_emp_est_.FieldByName('END_COMPL').AsString ) <> '' then
          begin
            qry_li_scx_.FieldByName('ED_COMPL_FABRIC').AsString :=
               Trim( qry_emp_est_.FieldByName('END_COMPL').AsString );
          end;
          if Trim( qry_emp_est_.FieldByName('END_CIDADE').AsString ) <> '' then
          begin
            qry_li_scx_.FieldByName('ED_CIDAD_FABRIC').AsString :=
               Trim( qry_emp_est_.FieldByName('END_CIDADE').AsString );
          end;
          if Trim( qry_emp_est_.FieldByName('END_ESTADO').AsString ) <> '' then
          begin
            qry_li_scx_.FieldByName('ED_ESTADO_FABRIC').AsString :=
               Trim( qry_emp_est_.FieldByName('END_ESTADO').AsString );
          end;
          if Trim( qry_emp_est_.FieldByName('CD_PAIS').AsString ) <> '' then
          begin
            qry_li_scx_.FieldByName('CD_PAIS_ORIG_MERC').AsString :=
               Trim( qry_emp_est_.FieldByName('CD_PAIS').AsString );
          end;
        end;
      end;
    end;

    if qry_li_scx_.FieldbyName('CD_AUSENCIA_FABRIC').AsString = '1' then
    begin
      if Trim( qry_li_scx_.FieldbyName('CD_PAIS_AQUIS_MERC').AsString ) <> '' then
      begin
        qry_li_scx_.FieldbyName('CD_PAIS_ORIG_MERC').AsString :=
           qry_li_scx_.FieldbyName('CD_PAIS_AQUIS_MERC').AsString;
      end;
    end
    else
    begin
      if Trim( qry_li_itens_.FieldByName('CD_PAIS_ORIGEM').AsString ) <> '' then
      begin
        qry_li_scx_.FieldByName('CD_PAIS_ORIG_MERC').AsString :=
           Trim( qry_li_itens_.FieldByName('CD_PAIS_ORIGEM').AsString );
      end;
    end;
    if Trim( qry_li_itens_.FieldByName('CD_NALADI_SH').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_MERC_NALADI_SH').AsString :=
         Trim( qry_li_itens_.FieldByName('CD_NALADI_SH').AsString );
    end;
    if qry_li_.FieldByName('QT_TOTAL_PES_LIQ').AsFloat <> 0 then
    begin
      qry_li_scx_.FieldByName('PL_MERCADORIA').AsString :=
         Num_To_Str( qry_li_.FieldByName('QT_TOTAL_PES_LIQ').AsFloat, 15, 5);
    end;
    if qry_li_.FieldByName('QT_MED_ESTATISTICA').AsFloat <> 0 then
    begin
      qry_li_scx_.FieldByName('QT_UN_ESTATISTICA').AsString :=
         Num_To_Str( qry_li_.FieldByName('QT_MED_ESTATISTICA').AsFloat, 14, 5);
    end;
    if Trim( qry_li_.FieldByName('CD_MOEDA_MLE').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_MOEDA_NEGOCIADA').AsString :=
         Trim( qry_li_.FieldByName('CD_MOEDA_MLE').AsSTring );
    end;
    if qry_li_.FieldByName('QT_DIA_COBERTURA').AsInteger <> 0 then
    begin
      qry_li_scx_.FieldByName('QT_DIA_LIMITE_PGTO').AsInteger :=
        qry_li_.FieldByName('QT_DIA_COBERTURA').AsInteger;
    end;
    if Trim( qry_li_.FieldByName('CD_INCOTERM').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_INCOTERMS_VENDA').AsString :=
         Trim( qry_li_.FieldByName('CD_INCOTERM').AsSTring );
    end;
    if qry_li_.FieldByName('VL_TOTAL_MOEDA').AsFloat <> 0 then
    begin
      qry_li_scx_.FieldByName('VL_MERC_MNEG_EMB').AsString :=
         Num_To_Str(qry_li_.FieldByName('VL_TOTAL_MOEDA').AsFloat, 11, 2);
    end;
//    if qry_li_.FieldByName('CA3205').AsString <> '' then
//    begin
//        qry_li_scx_.FieldByName('CD_TIPO_ACORDO_TAR').AsString :=
//          frmSiscoDI.AcordoTar(DMGipLite.adi032.FieldByName('CA3205').AsSTring);
//    end;
    if Trim( qry_li_.FieldByName('CD_ACORDO_ALADI').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_ACORDO_ALADI').AsString :=
         Trim( qry_li_.FieldByName('CD_ACORDO_ALADI').AsSTring );
    end;
    if Trim( qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_REGIME_TRIBUTAR').AsString :=
         Trim( qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsSTring );
    end;
    if Trim( qry_li_.FieldByName('CD_FUND_LEGAL').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_FUND_LEG_REGIME').AsString :=
         Trim( qry_li_.FieldByName('CD_FUND_LEGAL').AsSTring );
    end;
    qry_li_scx_.FieldByName('CD_COBERT_CAMBIAL').AsString :=
       qry_li_.FieldByName('TP_CAMBIO').AsString;
    if Trim( qry_li_.FieldByName('CD_MOD_PAGAMENTO').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_MODALIDADE_PGTO').AsString :=
         Trim( qry_li_.FieldByName('CD_MOD_PAGAMENTO').AsSTring );
    end;
    if Trim( qry_li_.FieldByName('CD_INSTITUICAO_FINANC').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_ORGAO_FIN_INTER').AsString :=
         Trim( qry_li_.FieldByName('CD_INSTITUICAO_FINANC').AsSTring );
    end;
    if Trim( qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_MOTIVO_SEM_COB').AsString :=
         Trim( qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').AsSTring );
    end;
    if Trim( qry_li_.FieldByName('CD_AGENCIA_SECEX').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_AGENCIA_SECEX').AsString :=
         Campo_DigitoCGC( Trim( qry_li_.FieldByName('CD_AGENCIA_SECEX').AsSTring) );
    end;
    if Trim( qry_li_.FieldByName('CD_URF_DESPACHO').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_URF_DESPACHO').AsString :=
         Trim( qry_li_.FieldByName('CD_URF_DESPACHO').AsSTring );
    end;

    if qry_li_.FieldByName('CD_CONDICAO_MERC').AsInteger = 0 then
       qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := True
    else
       qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := False;

    if qry_li_.FieldByName('CD_CONDICAO_MERC').AsInteger = 1 then
       qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := True
    else
       qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := False;

    if Trim( qry_li_.FieldByName('NR_ATO_DRAWBACK').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('NR_ATO_DRAWBACK').AsString :=
         Trim( qry_li_.FieldByName('NR_ATO_DRAWBACK').AsSTring );
    end;
    if Trim( qry_li_.FieldByName('NR_COMUNICADO_COMPRA').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('NR_COMUNIC_COMPRA').AsString :=
         Trim( qry_li_.FieldByName('NR_COMUNICADO_COMPRA').AsSTring );
    end;
    if qry_li_.FieldByName('TX_INFO_COMPLEMENTAR').AsString <> '' then
    begin
      qry_li_scx_.FieldByName('TX_INFO_COMPL').Assign( qry_li_.FieldByName('TX_INFO_COMPLEMENTAR') );
    end;

    if lCancelar then
    begin
      Exit;
    end;

    datm_trans_LI.qry_li_scx_.Post;

    Inc(nProcesso);
    lbl_processos.caption := IntToStr(nProcesso);

    Application.ProcessMessages;

    IntegraItemLI;

    Det_NCM_LI;
    Proc_Anuente;
  end;
end;

procedure Tfrm_trans_LI.Proc_Anuente;
begin
  with datm_trans_LI do
  begin
    qry_proc_anuentes_scx_.Close;
    qry_proc_anuentes_scx_.ParamByName('NR_PROCESSO').AsString := cProcSCX;
    qry_proc_anuentes_scx_.Prepare;
    qry_proc_anuentes_scx_.Open;
    qry_proc_anuentes_scx_.First;
    while Not qry_proc_anuentes_scx_.EOF do
    begin
      qry_proc_anuentes_scx_.Delete;
    end;

    qry_proc_anuentes_.Close;
    qry_proc_anuentes_.ParamByName('NR_PROCESSO').AsString := cProcGIP;
    qry_proc_anuentes_.Prepare;
    qry_proc_anuentes_.Open;
    qry_proc_anuentes_.First;
    while ( Not qry_proc_anuentes_.EOF ) do
    begin
      qry_proc_anuentes_scx_.Append;
      qry_proc_anuentes_scx_.FieldbyName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
      if Trim( qry_proc_anuentes_.FieldByName('PROCESSO').AsString ) <> '' then
      begin
        qry_proc_anuentes_scx_.FieldbyName('NR_PROC_ANUENTE').AsString :=
           Trim( qry_proc_anuentes_.FieldByName('PROCESSO').AsString );
      end;
      if Trim( qry_proc_anuentes_.FieldByName('ORGAO').AsString ) <> '' then
      begin
        qry_proc_anuentes_scx_.FieldbyName('SG_ORG_PROC_ANUENT').AsString :=
           Trim( qry_proc_anuentes_.FieldByName('ORGAO').AsString );
      end;
      qry_proc_anuentes_scx_.Post;
      qry_proc_anuentes_.Next;
    end;
  end;
end;

procedure Tfrm_trans_LI.Det_NCM_LI;
begin
  with datm_trans_LI do
  begin
    qry_dest_NCM_.Close;
    qry_dest_NCM_.ParamByName('NR_PROCESSO').AsString := cProcSCX;
    qry_dest_NCM_.Prepare;
    qry_dest_NCM_.Open;
    qry_dest_NCM_.First;
    while Not qry_dest_NCM_.EOF do
    begin
      qry_dest_NCM_.Delete;
    end;

    qry_li_itens_.Close;
    qry_li_itens_.Prepare;
    qry_li_itens_.Open;
    qry_li_itens_.First;

    while ( Not qry_li_itens_.Eof ) do
    begin
      if qry_li_itens_.FieldByName('NR_DESTAQUE_NCM').AsString <> '' then
      begin
         if Not ( qry_dest_NCM_.Locate('NR_DESTAQUE_NCM', qry_li_itens_.FieldByName('NR_DESTAQUE_NCM').AsString, [loCaseInsensitive] ) ) then
         begin
            qry_dest_NCM_.Append;
            qry_dest_NCM_.FieldByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
            qry_dest_NCM_.FieldByName('NR_DESTAQUE_NCM').AsString   :=
               qry_li_itens_.FieldByName('NR_DESTAQUE_NCM').AsString;
            qry_dest_NCM_.Post;
         end;
      end;
      qry_li_itens_.Next;
    end;
  end;
end;

procedure Tfrm_trans_LI.IntegraItemLI;
begin
  with datm_trans_LI do
  begin
    qry_li_itens_.First;
    while ( Not qry_li_itens_.EOF ) do
    begin
      cItemLI := Copy( qry_li_itens_.FieldByName('NR_ITEM').AsString, 2, 2);
      ItemLI;
      Inc(nItem);
      lbl_itens.caption := IntToStr(nItem);
      qry_li_itens_.Next;
    end;
  end;
end;

procedure Tfrm_trans_LI.ItemLI;
begin
  with datm_trans_LI do
  begin
    qry_li_itens_scx_.Close;
    qry_li_itens_scx_.ParamByName('NR_PROCESSO').AsString := cProcSCX;
    qry_li_itens_scx_.ParamByName('NR_ITEM').AsString     := cItemLI;
    qry_li_itens_scx_.Prepare;
    qry_li_itens_scx_.Open;

    if qry_li_itens_scx_.RecordCount > 0 then
    begin
      qry_li_itens_scx_.Edit;
    end
    else
    begin
      qry_li_itens_scx_.Append;
      qry_li_itens_scx_.FieldbyName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
      qry_li_itens_scx_.FieldbyName('NR_SEQ_PRODUTO').AsString    := cItemLI;
    end;

    if qry_li_itens_.FieldByName('QT_MERC_UN_COMERC').AsFloat <> 0 then
    begin
      qry_li_itens_scx_.FieldByName('QT_MERC_UN_COMERC').AsString :=
         Num_To_Str( qry_li_itens_.FieldByName('QT_MERC_UN_COMERC').AsFloat, 14, 5);
    end;

    if Trim( qry_li_itens_.FieldByName('CD_UN_MED_COMERC').AsString ) <> '' then
    begin
      qry_unid_med_broker_.Close;
      qry_unid_med_broker_.ParamByName('CD_UNID_MEDIDA').AsString :=
         Trim( qry_li_itens_.FieldByName('CD_UN_MED_COMERC').AsString );
      qry_unid_med_broker_.Prepare;
      qry_unid_med_broker_.Open;

      if qry_unid_med_broker_.RecordCount > 0 then
      begin
        if qry_unid_med_broker_.FieldByName('NM_UNID_MEDIDA').AsString <> '' then
        begin
          qry_li_itens_scx_.FieldByName('NM_UN_MEDID_COMER').AsString :=
             qry_unid_med_broker_.FieldByName('NM_UNID_MEDIDA').AsString;
        end;
      end
      else
      begin
        qry_li_itens_scx_.FieldByName('NM_UN_MEDID_COMER').AsString := Replicate(' ',20);
      end;
      qry_unid_med_broker_.Close;
    end;

    if qry_li_itens_.FieldByName('VL_UNIT_MCV').AsFloat <> 0 then
    begin
      qry_li_itens_scx_.FieldByName('VL_UNID_COND_VENDA').AsString :=
         Num_To_Str( qry_li_itens_.FieldByName('VL_UNIT_MCV').AsFloat, 20, 7);
    end
    else
    begin
      qry_li_itens_scx_.FieldByName('VL_UNID_COND_VENDA').AsString := Num_To_Str( 0,20,7);
    end;

    if qry_li_itens_.FieldByName('TX_DESC_DET_MERC').AsString <> '' then
    begin
      qry_li_itens_scx_.FieldByName('TX_DESC_DET_MERC').Assign(qry_li_itens_.FieldByName('TX_DESC_DET_MERC') );
    end;
    qry_li_itens_scx_.FieldByName('CD_PRODUTO').AsString := Replicate(' ',15);
    qry_li_itens_scx_.Post;
  end;
end;

function Tfrm_trans_LI.Campo_DigitoCGC(cAgenciaSecex : String) : String;
begin
  with datm_trans_LI do
  begin
    qry_ag_secex_.Close;
    qry_ag_secex_.ParamByName('CODIGO').AsString := cAgenciaSecex;
    qry_ag_secex_.Prepare;
    qry_ag_secex_.Open;
    if qry_ag_secex_.RecordCount > 0 then
    begin
      Campo_DigitoCGC := cAgenciaSecex +
         Copy( qry_ag_secex_.FieldbyName('CGC_SECEX').AsString, 13, 1);
    end
    else
    begin
      Campo_DigitoCGC := '';
    end;
  end;
end;

procedure Tfrm_trans_LI.numera_li;
var
   cAno      : String;
   nNovoProc : Integer;
   nAno      : Integer;
begin
  with datm_trans_LI do
  begin
    nNovoProc := tbl_Numerador_LI_.FieldbyName('NR_SEQ_OPER_MICRO').AsInteger;
    nAno      := tbl_Numerador_LI_.FieldbyName('NR_ANO_OPER_MICRO').AsInteger;

    if tbl_Numerador_LI_.RecordCount > 0 then
    begin
      tbl_Numerador_LI_.Edit;
      tbl_Numerador_LI_.FieldbyName('NR_SEQ_OPER_MICRO').AsInteger := nNovoProc + 1;
      tbl_Numerador_LI_.FieldbyName('NR_ANO_OPER_MICRO').AsInteger := nAno;
    end
    else
    begin
      tbl_Numerador_LI_.Append;
      tbl_Numerador_LI_.FieldByName('NR_SEQ_OPER_MICRO').AsInteger := 1;
      cAno      := Copy(FormatDateTime('ddmmyyyy',Date),5,4);
      tbl_Numerador_LI_.FieldByName('NR_ANO_OPER_MICRO').AsInteger := StrToInt(cAno);
      nNovoProc := tbl_Numerador_LI_.FieldByName('NR_SEQ_OPER_MICRO').AsInteger;
      nAno      := tbl_Numerador_LI_.FieldByName('NR_ANO_OPER_MICRO').AsInteger;
    end;
    tbl_Numerador_LI_.Post;
    cProcSCX := FormatFloat('00000',nNovoProc) + '/' +  Copy(FormatFloat('0000',nAno),3,2);
    qry_li_.Edit;
    qry_li_.FieldbyName('NR_IDENT_USUARIO').AsString := cProcSCX;
    qry_li_.Post;
  end;
end;

{ tabelas do DDBroker }
procedure Tfrm_trans_LI.open_tabelas_broker;
begin
  with datm_trans_LI do
  begin
    Application.ProcessMessages;

    qry_emp_nac_.Close;
    qry_emp_nac_.Prepare;
    qry_emp_nac_.Open;

    qry_emp_est_.Close;
    qry_emp_est_.Prepare;
    qry_emp_est_.Open;

    qry_unid_med_broker_.Close;
    qry_unid_med_broker_.Prepare;
    qry_unid_med_broker_.Open;
  end;
end;

procedure Tfrm_trans_LI.close_tabelas_broker;
begin
  with datm_trans_LI do
  begin
    Application.ProcessMessages;
    qry_emp_nac_.Close;
    qry_emp_est_.Close;
    qry_unid_med_broker_.Close;
  end;
end;

procedure Tfrm_trans_LI.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_trans_LI, datm_trans_LI);
  cb_ordem.ItemIndex := 0;
end;

procedure Tfrm_trans_LI.cb_ordem1Click(Sender: TObject);
begin
  Pesquisa := datm_trans_LI.qry_li_lista_.FieldByName('NR_PROCESSO').AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_trans_LI.qry_li_lista_.Close;
  datm_trans_LI.qry_li_lista_.SQL[4] := a_str_indices[cb_ordem.ItemIndex];
  datm_trans_LI.qry_li_lista_.Prepare;
  datm_trans_LI.qry_li_lista_.Open;
  Localiza( datm_trans_LI.qry_li_lista_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_trans_LI.Nr_Import(cTipo : String) : String ;
var
  nTipo : integer;
begin
  nTipo := StrToInt(cTipo);
  case nTipo of
     1 : Nr_Import := datm_trans_LI.qry_emp_nac_.FieldByName('CGC_EMPRESA').AsString;
     2 : Nr_Import := datm_trans_LI.qry_emp_nac_.FieldByName('CPF_EMPRESA').AsString;
     3 : Nr_Import := datm_trans_LI.qry_emp_nac_.FieldByName('OUTRO_DOC').AsString;
     4 : Nr_Import := '';
  end;
end;

procedure Tfrm_trans_LI.btn_trans_LIClick(Sender: TObject);
var
   i : Integer;
begin
  nProcesso := 0;
  nItem     := 0;
  lCancelar := False;

  if dbgrd_li.SelectedRows.Count = 0 then
  begin
    BoxMensagem('Nenhuma Declaração foi selecionada.', 2);
    Exit;
  end;

  btn_trans_LI.Enabled  := False;
  mi_trans_LI.Enabled   := False;

  btn_sair.Enabled      := False;
  mi_sair.Enabled       := False;
  btn_cancelar.Enabled  := True;
  mi_cancelar.Enabled   := True;

  lbl_processos.caption := IntToStr(nProcesso);
  lbl_itens.caption     := IntToStr(nItem);

  {abertura das tabelas Import SISCOMEX}
  lbl_mensagem.caption := 'Acessando Tabelas Siscomex ... ';
  datm_trans_LI.tbl_Numerador_LI_.Open;
  lbl_mensagem.caption := 'Acessando Tabelas DDBroker ... ';
  open_tabelas_broker;

  for i := 0 to dbgrd_li.SelectedRows.Count - 1 do
  begin
    if Not lCancelar then
    begin
      dbgrd_li.SelectedRows.CurrentRowSelected := False;
      if dbgrd_li.SelectedRows.Count > 0 then
      begin
        IntegraLI;
        TTable(dbgrd_li.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_li.SelectedRows[0]));
      end;
    end
    else Break;
    Application.ProcessMessages;
  end;

  lbl_mensagem.Caption := 'Fechando Tabelas Siscomex ... ';
  datm_trans_LI.tbl_Numerador_LI_.Close;
  lbl_mensagem.Caption := 'Fechando Tabelas DDBroker ... ';
  close_tabelas_broker;
  btn_trans_LI.Enabled := True;
  btn_sair.Enabled     := True;
  btn_cancelar.Enabled := False;

  mi_trans_LI.Enabled  := True;
  mi_sair.Enabled      := True;
  mi_cancelar.Enabled  := False;

  if lCancelar then lbl_mensagem.Caption := 'Transmissão abortada! Aguardando Instrução...'
  else lbl_mensagem.Caption              := 'Aguardando Instrução ... ';
end;


procedure Tfrm_trans_LI.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_trans_LI.qry_li_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_trans_LI.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_trans_LI.btn_cancelarClick(Sender: TObject);
begin
  lbl_mensagem.Caption := 'Transmissão sendo abortada!!!';
  Application.ProcessMessages;

  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  lCancelar            := True;
end;


procedure Tfrm_trans_LI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

end.
