{ Transmissão de Licenca de Importação }

unit PGLI007;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DbTables, DBGrids, ExtCtrls, Menus, Mask,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_trans_LI = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    dbgrd_li: TDBGrid;
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
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    SP_cons_db_susp: TStoredProc;
    sp_saldo_drawback: TStoredProc;
    SqlAuxiliar: TQuery;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_trans_LI: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
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
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure dbgrd_liKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    a_str_indices : Array[0..4] Of String[60];
    cd_unid_neg : String[2];
    Pesquisa : String;

    procedure Integrali;
    procedure IntegraItemLI;
    procedure ItemLI;
    procedure Det_NCM_LI;
    procedure Proc_Anuente;

    procedure open_tabelas_broker;
    procedure close_tabelas_broker;
    function  Nr_Import(cTipo : String) : String ;
    function  NumeraLI : String;

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

uses PGGP001, PGGP017, GSMLIB, PGLI008, PGSM018, uDiagnostico, Funcoes;

{$R *.DFM}

// Nos eventos abaixo o campo NR_IDENT_USUARIO foi modificado para passar o processo todo sem traço.
// Ex: 0101IM000109001 - Michel - 16/03/2009 - Ocorrência 07899/09

procedure Tfrm_trans_LI.FormShow(Sender: TObject);
begin
  with datm_trans_LI do
  begin
    //msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    edt_chave.Text       := '';
    lCancelar            := False;
    cb_ordem.ItemIndex   := 0;
    cCursor              := Screen.Cursor;
    Screen.Cursor        := crHourGlass;

    qry_li_lista_.Close;
    qry_li_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_li_lista_.Prepare;
    qry_li_lista_.Open;
    btn_trans_LI.Enabled := True;
    btn_sair.Enabled     := True;
    mi_trans_li.Enabled  := True;
    mi_sair.Enabled      := True;

    edt_chave.SetFocus;

    Screen.Cursor        := cCursor;
  end;
end;

procedure Tfrm_trans_LI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_trans_LI do
  begin
    qry_li_lista_.Close;
    qry_li_.Close;
    REGIMP.Connected   := False;
    TABSISCO.Connected := False;
    Free;
  end;
end;

procedure Tfrm_trans_LI.edt_chave1Change(Sender: TObject);
begin
  Localiza( datm_trans_LI.qry_li_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_trans_LI.IntegraLI;
var
  cFabricante, cExportador, IdentUsuario : String;
  nTotalLI : Double;
begin
  with datm_trans_LI do
  begin

    lbl_mensagem.caption := 'Transmitindo LI ... ';
    Application.ProcessMessages;

    cProcGIP := qry_li_.FieldByName('NR_PROCESSO').AsString;
    IdentUsuario := StringReplace(cProcGIP, '-', '', [rfReplaceAll]);
    Delete(IdentUsuario, 1, 1);
    Delete(IdentUsuario, 2, 1);

    qry_li_scx_.Close;
    //qry_li_scx_.ParamByName('NR_IDENT_USUARIO').AsString := Copy( cProcGIP, 5, 14 );
    qry_li_scx_.ParamByName('NR_IDENT_USUARIO').AsString := IdentUsuario;
    qry_li_scx_.Prepare;
    qry_li_scx_.Open;
    if Not qry_li_scx_.EOF then { Já existe LI no Orientador }
    begin
      cProcSCX := qry_li_scx_.FieldbyName('NR_TRAT_IMP_MICRO').AsString;
      qry_li_scx_.Edit;
    end
    else
    begin
      qry_li_scx_.Append;
      cProcSCX := NumeraLI;
      qry_li_scx_.FieldbyName('NR_TRAT_IMP_MICRO').AsString  := cProcSCX;
      qry_li_scx_.FieldbyName('CD_ORIGEM_LI').AsString       := '1';   {Texto 10}
      qry_li_scx_.FieldbyName('IN_SALVO_DIAG').AsBoolean     := False; {Sim/Não 1}
      qry_li_scx_.FieldbyName('IN_SELECAO_DIAG').AsBoolean   := False; {Sim/Não 1}
    end;

    // LI Substitutiva
    if Trim( qry_li_.FieldByName('NR_LI_SUBSTITUIDO').AsString ) <> '' then
       qry_li_scx_.FieldbyName('NR_LI_SUBSTITUIDO').AsString  := qry_li_.FieldByName('NR_LI_SUBSTITUIDO').AsString;

    //qry_li_scx_.FieldbyName('NR_IDENT_USUARIO').AsString    := Copy( cProcGIP, 5, 14 );
    qry_li_scx_.FieldbyName('NR_IDENT_USUARIO').AsString    := IdentUsuario;
    qry_li_scx_.FieldByName('DT_ATU_OPER_MICRO').AsString   := FormatDateTime('dd/mm/yyyy',Date);

    if qry_li_.FieldByName('CD_IMPORTADOR').AsString <> '' then
    begin
      qry_emp_nac_.Close;
      qry_emp_nac_.ParamByName('CD_CLIENTE').AsString := qry_li_.FieldByName('CD_IMPORTADOR').AsString;
      qry_emp_nac_.Prepare;
      qry_emp_nac_.Open;

      if Not qry_emp_nac_.EOF then
      begin
        qry_li_scx_.FieldbyName('CD_TIPO_IMPORTADOR').AsString := qry_emp_nac_.FieldByName('CD_TIPO_PESSOA').AsString;

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

    {Abrir Itens - Broker}
    qry_li_itens_.Close;
    qry_li_itens_.Prepare;
    qry_li_itens_.Open;

    if qry_li_itens_.FieldByName('CD_FABR_EXPO').AsString <> '' then
    begin
      if qry_li_itens_.FieldByName('CD_FABR_EXPO').AsInteger <> 0 then
      begin
        datm_trans_LI.qry_li_scx_.FieldByName('CD_AUSENCIA_FABRIC').AsString :=
           Trim( IntToStr( qry_li_itens_.FieldByName('CD_FABR_EXPO').AsInteger ) );
      end;
    end;

    if Trim( qry_li_itens_.FieldByName('CD_EXPORTADOR').AsString ) <> '' then
    begin
      cExportador := Trim( qry_li_itens_.FieldByName('CD_EXPORTADOR').AsString );

      qry_emp_est_.Close;
      qry_emp_est_.ParamByName('CD_EMPRESA').AsString := cExportador;
      qry_emp_est_.Prepare;
      qry_emp_est_.Open;

      if Not qry_emp_est_.EOF then
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

        if Not qry_emp_est_.EOF then
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
    // Tipo DrawBack
    if Trim( qry_li_itens_.FieldByName('IN_REG_DRAWBACK').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('IN_REG_DRAWBACK').AsString :=
         qry_li_itens_.FieldByName('IN_REG_DRAWBACK').AsString;
    end;
    // Registro DrawBack
    if Trim( qry_li_itens_.FieldByName('NR_REG_DRAWBACK').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('NR_REG_DRAWBACK').AsString :=
         Trim( qry_li_itens_.FieldByName('NR_REG_DRAWBACK').AsString );
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
    if qry_li_.FieldByName('QT_DIAS_COBERTURA').AsInteger <> 0 then
    begin
      qry_li_scx_.FieldByName('QT_DIA_LIMITE_PGTO').AsInteger :=
        qry_li_.FieldByName('QT_DIAS_COBERTURA').AsInteger;
    end;
    if Trim( qry_li_.FieldByName('CD_INCOTERM').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_INCOTERMS_VENDA').AsString :=
         Trim( qry_li_.FieldByName('CD_INCOTERM').AsSTring );
    end;
    nTotalLI := 0;
    if qry_li_.FieldByName('VL_TOTAL_MOEDA').AsFloat <> 0 then
      nTotalLI := nTotalLI + qry_li_.FieldByName('VL_TOTAL_MOEDA').AsFloat;
    if qry_li_.FieldByName('VL_DESPESA_MOEDA').AsFloat <> 0 then
      nTotalLI := nTotalLI + qry_li_.FieldByName('VL_DESPESA_MOEDA').AsFloat;
    if qry_li_.FieldByName('VL_DESCONTO_MOEDA').AsFloat <> 0 then
      nTotalLI := nTotalLI - qry_li_.FieldByName('VL_DESCONTO_MOEDA').AsFloat;
    if qry_li_.FieldByName('IN_EMBUT_FRT_ITENS').AsString = '1' then
      nTotalLI := nTotalLI - qry_li_.FieldByName('VL_FRETE_MOEDA').AsFloat;
    qry_li_scx_.FieldByName('VL_MERC_MNEG_EMB').AsString := Num_To_Str(nTotalLI, 15, 2);

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
    if Trim( qry_li_.FieldByName('TP_CAMBIO').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_COBERT_CAMBIAL').AsString :=
         qry_li_.FieldByName('TP_CAMBIO').AsString;
    end;
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

    if ( qry_li_.FieldByName('CD_CONDICAO_MERC').AsString = '' ) then
    begin
      qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := False
    end
    else
    begin
      if ( qry_li_.FieldByName('CD_CONDICAO_MERC').IsNull ) or
         ( qry_li_.FieldByName('CD_CONDICAO_MERC').AsInteger = 2 ) or
         ( Trim( qry_li_.FieldByName('CD_CONDICAO_MERC').AsString ) = '' ) then
         qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := False
      else
      begin
        if qry_li_.FieldByName('CD_CONDICAO_MERC').AsInteger = 0 then
           qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := True
        else
           qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := False;
      end;
    end;

    if ( qry_li_.FieldByName('CD_CONDICAO_MERC').AsString = '' ) then
    begin
      qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := False
    end
    else
    begin
      if ( qry_li_.FieldByName('CD_CONDICAO_MERC').IsNull ) or
         ( qry_li_.FieldByName('CD_CONDICAO_MERC').AsInteger = 2 ) or
         ( Trim( qry_li_.FieldByName('CD_CONDICAO_MERC').AsString ) = '' ) then
         qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := False
      else
      begin
        if qry_li_.FieldByName('CD_CONDICAO_MERC').AsInteger = 1 then
           qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := True
        else
           qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := False;
      end;
    end;

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
// Grava na tabela DETALHE_MERC_COM_TRATAMENTO - REGIMP.MDB
begin
  with datm_trans_LI do
  begin
    qry_li_itens_scx_.Close;
    qry_li_itens_scx_.ParamByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
    qry_li_itens_scx_.ParamByName('NR_SEQ_PRODUTO').AsString    := cItemLI;
    qry_li_itens_scx_.Prepare;
    qry_li_itens_scx_.Open;

    if Not qry_li_itens_scx_.EOF then
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

      if Not qry_unid_med_broker_.EOF then
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

    //verificar se o valor esta embutido nos itens, se estiver então enviar o MLE, não o MCV
    if ( qry_li_itens_.FieldByName('VL_UNIT_MLE').AsFloat <> 0 ) then
    begin
        qry_li_itens_scx_.FieldByName('VL_UNID_COND_VENDA').AsString :=
           Num_To_Str( qry_li_itens_.FieldByName('VL_UNIT_MLE').AsFloat, 20, 7 );
    end
    //Comentado porque independente do frete estar incluido no item o valor unitário não muda  ocorrência (19235/11-Andressa)
    //else
    //if ( qry_li_itens_.FieldByName('VL_UNIT_MCV').AsFloat <> 0 ) and ( qry_li_.FieldByName('IN_EMBUT_FRT_ITENS').AsString = '0' ) then
    //begin
      //qry_li_itens_scx_.FieldByName('VL_UNID_COND_VENDA').AsString :=
         //Num_To_Str( qry_li_itens_.FieldByName('VL_UNIT_MCV').AsFloat, 20, 7 );
    //end
    else
    begin
      qry_li_itens_scx_.FieldByName('VL_UNID_COND_VENDA').AsString := Num_To_Str( 0, 20, 7 );
    end;

    if qry_li_itens_.FieldByName('TX_DESC_DET_MERC').AsString <> '' then
    begin
      qry_li_itens_scx_.FieldByName('TX_DESC_DET_MERC').Assign(qry_li_itens_.FieldByName('TX_DESC_DET_MERC') );
    end;

    if qry_li_itens_.FieldByName('VL_TOTAL_MLE').AsFloat <> 0 then
    begin
       qry_li_itens_scx_.FieldByName('VL_PROD_DRAWBACK').AsString :=
          Num_To_Str( qry_li_itens_.FieldByName('VL_TOTAL_MLE').AsFloat, 15, 2 );
    end;
    if qry_li_itens_.FieldByName('QT_MERC_UN_ESTAT').AsFloat <> 0 then
    begin
       qry_li_itens_scx_.FieldByName('QT_PROD_DRAWBACK').AsString :=
          Num_To_Str( qry_li_itens_.FieldByName('QT_MERC_UN_ESTAT').AsFloat, 14, 5 );
    end;


    // Item Drawback
    if qry_li_itens_.FieldByName('NR_ITEM_DRAWBACK').AsString <> '' then
    begin
      qry_li_itens_scx_.FieldByName('NR_ITEM_DRAWBACK').AsString :=
         Trim( qry_li_itens_.FieldByName('NR_ITEM_DRAWBACK').AsString );
    end;
    if qry_li_itens_.FieldByName('CD_MERCADORIA').AsString <> '' then
      qry_li_itens_scx_.FieldByName('CD_PRODUTO').AsString := qry_li_itens_.FieldByName('CD_MERCADORIA').AsString;
    qry_li_itens_scx_.Post;
  end;
end;

procedure Tfrm_trans_LI.Det_NCM_LI;
begin
  with datm_trans_LI do
  begin
    qry_dest_NCM_scx_.Close;
    qry_dest_NCM_scx_.ParamByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
    qry_dest_NCM_scx_.Prepare;
    qry_dest_NCM_scx_.Open;
    qry_dest_NCM_scx_.First;
    while Not qry_dest_NCM_scx_.EOF do
    begin
      qry_dest_NCM_scx_.Delete;
    end;

    qry_li_itens_.Close;
    qry_li_itens_.Prepare;
    qry_li_itens_.Open;
    qry_li_itens_.First;

    while ( Not qry_li_itens_.EOF ) do
    begin
      if qry_li_itens_.FieldByName('NR_DESTAQUE_NCM').AsString <> '' then
      begin
        qry_dest_NCM_scx_.Close;
        qry_dest_NCM_scx_.ParamByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
        qry_dest_NCM_scx_.Prepare;
        qry_dest_NCM_scx_.Open;

        if Not ( qry_dest_NCM_scx_.Locate( 'NR_TRAT_IMP_MICRO;NR_DESTAQUE_NCM',
                 VarArrayOf( [cProcSCX,qry_li_itens_.FieldByName('NR_DESTAQUE_NCM').AsString] ),
                 [loCaseInsensitive] ) ) then
        begin
          qry_dest_NCM_scx_.Append;
          qry_dest_NCM_scx_.FieldByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
          qry_dest_NCM_scx_.FieldByName('NR_DESTAQUE_NCM').AsString   := qry_li_itens_.FieldByName('NR_DESTAQUE_NCM').AsString;
          qry_dest_NCM_scx_.Post;
        end;
      end;
      qry_li_itens_.Next;
    end;
  end;
end;

procedure Tfrm_trans_LI.Proc_Anuente;
begin
  with datm_trans_LI do
  begin
    qry_proc_anuentes_scx_.Close;
    qry_proc_anuentes_scx_.ParamByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
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

function Tfrm_trans_LI.Campo_DigitoCGC(cAgenciaSecex : String) : String;
begin
  with datm_trans_LI do
  begin
    qry_ag_secex_.Close;
    qry_ag_secex_.ParamByName('CODIGO').AsString := cAgenciaSecex;
    qry_ag_secex_.Prepare;
    qry_ag_secex_.Open;
    if Not qry_ag_secex_.EOF then
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

function Tfrm_trans_LI.NumeraLI : String;
var
   nNovoProc : Integer;
begin
  with datm_trans_LI do
  begin
    qry_numera_li_.Close;
    qry_numera_li_.ParamByName('NR_ANO').AsString := FormatDateTime( 'yy', Date );
    qry_numera_li_.Prepare;
    qry_numera_li_.Open;
    if qry_numera_li_.EOF then
       nNovoProc := 1
    else
    begin
      if qry_numera_li_.FieldByName('ULTIMO').AsString = '' then
        nNovoProc := 1
      else
        nNovoProc := StrToInt( qry_numera_li_.FieldByName('ULTIMO').AsString ) + 1
    end;
    Result := FormatFloat( '00000', nNovoProc ) + '/' +  FormatDateTime( 'yy', Date );
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
  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'DT_PROCESSO_LI';
  a_str_indices[2] := 'NM_EMPRESA';
  a_str_indices[3] := 'NR_REGISTRO_LI';
  a_str_indices[4] := 'DT_REGISTRO_LI';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Data Processo');
    Items.Add('Importador');
    Items.Add('Nº Registro');
    Items.Add('Data Registro');
    ItemIndex := 1;
  end;
  cb_ordem.ItemIndex := 0;
end;

procedure Tfrm_trans_LI.cb_ordem1Click(Sender: TObject);
begin
  Pesquisa := datm_trans_LI.qry_li_lista_.FieldByName('NR_PROCESSO').AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_trans_LI.qry_li_lista_.Close;
  datm_trans_LI.qry_li_lista_.SQL[6] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
  datm_trans_LI.qry_li_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
  datm_trans_LI.qry_li_lista_.Prepare;
  datm_trans_LI.qry_li_lista_.Open;
  Localiza( datm_trans_LI.qry_li_lista_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_trans_LI.Nr_Import(cTipo : String) : String ;
var
  nTipo : Integer;
begin
  if cTipo = '' then
  begin
    Nr_Import := '';
    Exit;
  end;
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
  i, MR : Integer;

  Procedure ConsisteDrawBack;
  Begin
    CloseStoredProc(SP_cons_db_susp);
    SP_cons_db_susp.ParamByName('@nr_processo').AsString := datm_trans_LI.qry_li_lista_NR_PROCESSO.AsString;
    SP_cons_db_susp.ParamByName('@tp_movimento').AsString := 'LI';
    ExecStoredProc(SP_cons_db_susp);
    CloseStoredProc(SP_cons_db_susp);
  End;
  
  Procedure ExecProcSaldoDrawBack;
  Begin
    CloseStoredProc(sp_saldo_drawback);
    sp_saldo_drawback.ParamByName('@nr_processo').AsString := datm_trans_LI.qry_li_lista_NR_PROCESSO.AsString;
    sp_saldo_drawback.ParamByName('@tp_movimento').AsString := 'LI';
    ExecStoredProc(sp_saldo_drawback);
    CloseStoredProc(sp_saldo_drawback);
  End;
begin
  nProcesso := 0;
  nItem     := 0;
  lCancelar := False;

  if dbgrd_li.SelectedRows.Count = 0 then
  begin
    BoxMensagem( 'Nenhuma Declaração foi selecionada.', 2 );
    Exit;
  end;

  //if (str_cd_cargo = '001') then
    MR := MessageDlg('Deseja transmitir o Siscomex Importação Web?'#13'Para Web clique Sim, para Orientador clique Não.', mtConfirmation, [mbYes, mbNo, mbCancel], 0)
  {else
    MR := mrYes};

  //GUILHERME - 30/01/2014
  //If MessageDlg('ATENÇÃO: Deseja transmitir o Siscomex Importação Web?'#13'Para Web clique Sim, para Orientador clique Não.', mtConfirmation, [mbYes, mbNo, mbCancel], 0) = mrYes then
  if MR = mrYes then
  begin
    for I := 0 To dbgrd_li.SelectedRows.Count - 1 do
    begin
      TTable(dbgrd_li.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_li.SelectedRows[i]));
      with SqlAuxiliar, SqlAuxiliar.Sql Do
      begin
        Close;
        Clear;
        Add('UPDATE TLICENCA_IMPORTACAO SET IN_SOLIC_TRANSMISSAO = ''1'', CD_USUARIO_TRANSMISSAO = ''' + str_cd_usuario + ''', DT_TRANSMISSAO = NULL, NR_REGISTRO_LI = NULL, DT_REGISTRO_LI = NULL WHERE NR_PROCESSO = :PROCESSO');
        ParamByName('PROCESSO').AsString := datm_Trans_LI.qry_li_lista_NR_PROCESSO.AsString;
        ExecSQL;
      end;
    end;
    MessageDlg('ATENÇÃO: O processo foi enviado para uma fila e será  transmitido em instantes.'#13'Você recerá um email avisando quando isto acontecer.', mtInformation, [mbOK], 0)
  end
  else
  begin
    btn_trans_LI.Enabled  := False;
    mi_trans_LI.Enabled   := False;

    btn_cancelar.Enabled  := True;
    mi_cancelar.Enabled   := True;

    lbl_processos.Caption := IntToStr(nProcesso);
    lbl_itens.Caption     := IntToStr(nItem);

    {abertura das tabelas Import SISCOMEX}
    lbl_mensagem.caption := 'Acessando Tabelas Siscomex ... ';
    datm_trans_LI.tbl_Numerador_LI_.Open;
    lbl_mensagem.caption := 'Acessando Tabelas DDBroker ... ';
    open_tabelas_broker;

  // DRAWBACK *******************************************
  // 1ª Parte - Diagnósticos

    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( 'DELETE FROM TTEMP_DIAGN_DB_SUSP');
      ExecSql;
      SQL.Clear;
      SQL.Add( 'DELETE FROM TDIAGNOSTICO_SALDO');
      ExecSql;
      Free;
    End;

    For i := 0 To dbgrd_li.SelectedRows.Count - 1 Do
    Begin
      If Not lCancelar Then
      Begin
        TTable(dbgrd_li.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_li.SelectedRows[i]));
        ConsisteDrawBack;
      End
      Else
        Break;
      Application.ProcessMessages;
    End;
    Application.CreateForm(TFrmDiagnostico,FrmDiagnostico);
    FrmDiagnostico.SqlDiagnostico.Open;
    If FrmDiagnostico.SqlDiagnostico.RecordCount > 0 Then
      FrmDiagnostico.ShowModal;
  //***************************************************
    If Not FrmDiagnostico.FlagCancelou Then
    Begin
      For I := 0 To dbgrd_li.SelectedRows.Count - 1 Do
      Begin
        If Not lCancelar Then
        Begin
          TTable(dbgrd_li.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_li.SelectedRows[i]));
          With SqlAuxiliar, SqlAuxiliar.Sql Do
         Begin
            Close;
            Clear;
            Add('select NR_PROCESSO from TTEMP_DIAGN_DB_SUSP');
            Add('where nr_processo =:PROCESSO and LIBERADO = ''N''');
            ParamByName('PROCESSO').AsString := datm_Trans_LI.qry_li_lista_NR_PROCESSO.AsString;
            Open;
          End;
          If SqlAuxiliar.IsEmpty Then
          Begin
            IntegraLI;
            ExecProcSaldoDrawBack;
          End;
        End
        Else
          Break;
        Application.ProcessMessages;
      End;
    End;
    FrmDiagnostico.Release;
    {Desmarcando}
    if dbgrd_li.SelectedRows.Count > 0 then
       TTable(dbgrd_li.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_li.SelectedRows[0]));
    for i := 0 to dbgrd_li.SelectedRows.Count - 1 do
    begin
      dbgrd_li.SelectedRows.CurrentRowSelected := False;
      if dbgrd_li.SelectedRows.Count > 0 then
        TTable(dbgrd_li.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_li.SelectedRows[0]))
      else Break;
    end;

    lbl_mensagem.Caption := 'Fechando Tabelas Siscomex ... ';
    datm_trans_LI.tbl_Numerador_LI_.Close;
    lbl_mensagem.Caption := 'Fechando Tabelas DDBroker ... ';
    close_tabelas_broker;
    btn_trans_LI.Enabled := True;
    btn_cancelar.Enabled := False;
  end;
  mi_trans_LI.Enabled  := True;
  mi_sair.Enabled      := True;
  mi_cancelar.Enabled  := False;

  if lCancelar then lbl_mensagem.Caption := 'Transmissão abortada! Aguardando Instrução...'
  else lbl_mensagem.Caption              := 'Dados transmitidos com sucesso... ';
end;

procedure Tfrm_trans_LI.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 0 then
     Localiza( datm_trans_LI.qry_li_lista_, msk_cd_unid_neg.Text + '01' + Trim( edt_chave.Text ), a_str_indices[cb_ordem.ItemIndex] )
  else
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
  btn_trans_LI.Enabled := True;
  mi_trans_LI.Enabled  := True;
  lCancelar            := True;
end;

procedure Tfrm_trans_LI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_trans_LI.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = cd_unid_neg then Exit;
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_unid_neg);
  with datm_trans_LI.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else
    begin
      cd_unid_neg := msk_cd_unid_neg.Text;
      edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
      datm_trans_LI.qry_li_lista_.Close;
      datm_trans_LI.qry_li_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      datm_trans_LI.qry_li_lista_.Prepare;
      datm_trans_LI.qry_li_lista_.Open;
    end;
    Close;
  end;
end;

procedure Tfrm_trans_LI.btn_cd_unid_negClick(Sender: TObject);
begin
  vstr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_trans_LI.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_trans_LI.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_trans_LI.dbgrd_liKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    if dbgrd_li.SelectedRows.CurrentRowSelected then
       dbgrd_li.SelectedRows.CurrentRowSelected := False
    else
       dbgrd_li.SelectedRows.CurrentRowSelected := True;
  end;
end;

end.
