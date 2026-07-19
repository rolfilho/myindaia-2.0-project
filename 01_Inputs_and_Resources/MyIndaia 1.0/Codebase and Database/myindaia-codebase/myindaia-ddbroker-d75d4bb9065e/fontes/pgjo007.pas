{ Transmissão de Licenca de Importação }

unit PGLI007;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DbTables, DBGrids, ByCustomDBGrid, ExtCtrls;

type
  Tfrm_trans_LI = class(TForm)
    DSGipLiteLI: TDataSource;
    Panel1: TPanel;
    Ordem: TLabel;
    cb_ordem: TComboBox;
    Panel2: TPanel;
    DBGGipLiteLI: TByDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    edt_chave: TEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    gbox_monitor: TGroupBox;
    lbl_Capas: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_processos: TLabel;
    lbl_adicoes: TLabel;
    lbl_itens: TLabel;
    lbl_mensagem: TLabel;
    bbfechar: TBitBtn;
    dbgrd_li: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbfecharClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure DBGGipLiteLIInsertBookMark(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
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

    procedure open_tabelas_sisco;
    procedure open_tabelas_giplite;
    procedure close_tabelas_sisco;
    procedure close_tabelas_giplite;
    function  Nr_Import(cTipo : String) : String ;

  public
    { Public declarations }
    function Campo_DigitoCGC(cAgenciaSecex : String) : String;
    function NaoConsta(cDest : String) : Boolean;
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

uses GSMLIB, PGLI008;
//uses pggl000, pggl015, Pggl010, Pggl008, pggl019, pggl020;

{$R *.DFM}

procedure Tfrm_trans_LI.FormShow(Sender: TObject);
begin
  with datm_trans_LI do
  begin
    edt_chave.Text     := '';
    lCancelar          := False;
    cb_ordem.ItemIndex := 0;
    cCursor            := Screen.Cursor;
    Screen.Cursor      := crHourGlass;
    REGIMP.Connected   := True;
    qry_li_.Close;
    qry_li_.Prepare;
    qry_li_.Open;
    bbok.Enabled       := True;
    bbfechar.Enabled   := True;
    Screen.Cursor      := cCursor;
  end;
end;

procedure Tfrm_trans_LI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_trans_LI.qry_li_.Close;
  datm_trans_LI.REGIMP.Connected   := False;
  datm_trans_LI.TABSISCO.Connected := False;
end;

procedure Tfrm_trans_LI.bbfecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_trans_LI.bbCancelClick(Sender: TObject);
begin
  lbl_mensagem.Caption := 'Transmissão sendo abortada!!!';
  Application.ProcessMessages;

  bbCancel.Enabled     := False;
  lCancelar            := True;
end;

procedure Tfrm_trans_LI.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_trans_LI.qry_li_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_trans_LI.bbOkClick(Sender: TObject);
var
   i : Integer;
begin
   nProcesso := 0;
   nAdicao   := 0;
   nItem     := 0;
   lCancelar := False;

  if dbgrd_li.SelectedRows.Count = 0 then
  begin
    BoxMensagem('Nenhuma Declaração foi selecionada.', 2);
    Exit;
  end;

   bbok.Enabled          := False;
   bbfechar.Enabled      := False;
   bbcancel.Enabled      := True;
   lbl_processos.caption := IntToStr(nProcesso);
   lbl_adicoes.caption   := IntToStr(nAdicao);
   lbl_itens.caption     := IntToStr(nItem);

   {abertura das tabelas Import SISCOMEX}
   lbl_mensagem.caption := 'Acessando Tabelas Siscomex ... ';
   open_tabelas_sisco;
   lbl_mensagem.caption := 'Acessando Tabelas Gip-Lite ... ';
   open_tabelas_giplite;

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
   lbl_mensagem.caption := 'Fechando Tabelas Siscomex ... ';
   close_tabelas_sisco;
   lbl_mensagem.caption := 'Fechando Tabelas Gip-Lite ... ';
   close_tabelas_giplite;
   bbok.Enabled := true;
   bbfechar.Enabled := true;
   bbcancel.Enabled := false;
   if lCancelar then lbl_mensagem.Caption:= 'Transmissão abortada! Aguardando Instrução...'
   else lbl_mensagem.caption := 'Aguardando Instrução ... ';
end;

procedure Tfrm_trans_LI.IntegraLI;
var
  cFabricante, cExportador : String;
  nValorMercad : Double;
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
      qry_li_scx_.UnPrepare;
      qry_li_scx_.SQL.Clear;
      qry_li_scx_.SQL.Add('SELECT * FROM OPERAÇÃO_COM_TRATAMENTO ');
      qry_li_scx_.SQL.Add('WHERE NR_TRAT_IMP_MICRO = "'+cProcSCX+'"');
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
          qry_li_scx_.FieldByName('NM_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('NM_EMPRESA').AsString;
          qry_li_scx_.FieldByName('NR_TEL_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('NR_FONE').AsString;
          qry_li_scx_.FieldByName('ED_LOGR_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('END_EMPRESA').AsString;
          qry_li_scx_.FieldByName('ED_NR_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('END_NUMERO').AsString;
          qry_li_scx_.FieldByName('ED_BA_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('END_BAIRRO').AsString;
          qry_li_scx_.FieldByName('ED_MUN_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('END_CIDADE').AsString;
          qry_li_scx_.FieldByName('ED_UF_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('END_UF').AsString;
          qry_li_scx_.FieldByName('ED_CEP_IMPORTADOR').AsString :=
             qry_emp_nac_.FieldByName('END_CEP').AsString;
          qry_li_scx_.FieldByName('CD_ATIV_ECON_IMPO').AsString :=
             qry_emp_nac_.FieldByName('CD_ATIV_ECONOMICA').AsString;
          qry_li_scx_.FieldByName('ED_COMPL_IMPO').AsString := Replicate( ' ',30);
        end;
      end;
    end;

    if Trim( qry_li_.FieldByName('CD_URF_ENTRADA').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_URF_ENTR_MERC').AsString :=
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
         Trim( qry_li_itens_.FieldByName('CD_PAIS_PROCEDENCIA').AsString );
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
    if Trim( qry_li_.FieldByName('CA3208').AsString ) <> '' then
    begin
      qry_li_scx_.FieldByName('CD_FUND_LEG_REGIME').AsString :=
         DMGipLite.adi032.FieldByName('CA3208').AsSTring;
    end;
    datm_trans_LI.qry_li_scx_.FieldByName('CD_COBERT_CAMBIAL').AsString :=
    FormatFloat( '0',DMGipLite.adi032.FieldByName('CN3227').AsInteger);
    if DMGipLite.adi032.FieldByName('CA3203').AsString <> '' then
    begin
       datm_trans_LI.qry_li_scx_.FieldByName('CD_MODALIDADE_PGTO').AsString :=
       DMGipLite.adi032.FieldByName('CA3203').AsSTring;
    end;
    if DMGipLite.adi032.FieldByName('CA3214').AsString <> '' then
    begin
       datm_trans_LI.qry_li_scx_.FieldByName('CD_ORGAO_FIN_INTER').AsString :=
       DMGipLite.adi032.FieldByName('CA3214').AsSTring;
    end;
    if DMGipLite.adi032.FieldByName('CA3215').AsString <> '' then
    begin
       datm_trans_LI.qry_li_scx_.FieldByName('CD_MOTIVO_SEM_COB').AsString :=
       DMGipLite.adi032.FieldByName('CA3215').AsSTring;
    end;
    if DMGipLite.adi032.FieldByName('CA3209').AsString <> '' then
    begin
       datm_trans_LI.qry_li_scx_.FieldByName('CD_AGENCIA_SECEX').AsString :=
       Campo_DigitoCGC(DMGipLite.adi032.FieldByName('CA3209').AsSTring);
    end;
    if DMGipLite.adi032.FieldByName('CA3222').AsString <> '' then
    begin
       datm_trans_LI.qry_li_scx_.FieldByName('CD_URF_DESPACHO').AsString :=
       DMGipLite.adi032.FieldByName('CA3222').AsSTring;
    end;

    Case DMGipLite.adi032.FieldByName('CN3228').AsInteger of
    0, 1, 3 : datm_trans_LI.qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := false;
    2 : datm_trans_LI.qry_li_scx_.FieldByName('IN_BEM_ENCOMENDA').AsBoolean := true;
    end;
    Case DMGipLite.adi032.FieldByName('CN3228').AsInteger of
    0, 1, 2 : datm_trans_LI.qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := false;
    3 : datm_trans_LI.qry_li_scx_.FieldByName('IN_MATERIAL_USADO').AsBoolean := true;
    end;
    if DMGipLite.adi032.FieldByName('CA3211').AsString <> '' then begin
       datm_trans_LI.qry_li_scx_.FieldByName('NR_ATO_DRAWBACK').AsString :=
       DMGipLite.adi032.FieldByName('CA3211').AsSTring;
    end;
    if DMGipLite.adi032.FieldByName('CA3218').AsString <> '' then begin
       datm_trans_LI.qry_li_scx_.FieldByName('NR_COMUNIC_COMPRA').AsString :=
       DMGipLite.adi032.FieldByName('CA3218').AsSTring;
    end;
    if DMGipLite.adi032.FieldByName('CM3220').AsString <> '' then begin
       datm_trans_LI.qry_li_scx_.FieldByName('TX_INFO_COMPL').Assign(
       DMGipLite.adi032.FieldByName('CM3220') );
    end;

    if lCancelar then begin
       exit;
    end;

    datm_trans_LI.qry_li_scx_.Post;

    inc(nProcesso);
    if GipLite.Estacao = true then
    begin
      lbl_processos.caption := IntToStr(nProcesso);
    end
    else
    begin
      lbl_processos.caption := IntToStr(nProcesso);
    end;
    Application.ProcessMessages;

    IntegraItemLI;

    Det_NCM_LI;
    Proc_Anuente;
  end;
end;

procedure Tfrm_trans_LI.Proc_Anuente;
var
   nOcorrencias : Byte;
   cChaveArq : String;
begin

   datm_trans_LI.RS_Proc_Anuente.Close;
   datm_trans_LI.RS_Proc_Anuente.UnPrepare;
   datm_trans_LI.RS_Proc_Anuente.SQL.Clear;
   datm_trans_LI.RS_Proc_Anuente.SQL.Add('SELECT * FROM PROCESSO_ANUENTE ');
   datm_trans_LI.RS_Proc_Anuente.SQL.Add(' WHERE NR_TRAT_IMP_MICRO = "'+cProcSCX+'"') ;
   datm_trans_LI.RS_Proc_Anuente.Prepare;
   datm_trans_LI.RS_Proc_Anuente.Open;

   while not datm_trans_LI.RS_Proc_Anuente.EOF do begin
      datm_trans_LI.RS_Proc_Anuente.Delete;
   end;

   DMGipLite.afl013.FindNearest([ cProcGIP ]);
   while ( not DMGipLite.afl013.Eof ) and 
      ( DMGipLite.afl013.FieldByName('CA1301').AsString = cProcGIP ) and
      ( DMGipLite.afl013.FieldByName('CA1303').AsString <> '' ) do begin
      datm_trans_LI.RS_Proc_Anuente.Append;
      datm_trans_LI.RS_Proc_Anuente.FieldbyName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
      if DMGipLite.afl013.FieldByName('CA1303').AsString <> '' then begin
         datm_trans_LI.RS_Proc_Anuente.FieldbyName('NR_PROC_ANUENTE').AsString :=
         DMGipLite.afl013.FieldByName('CA1303').AsString;
      end;
      if DMGipLite.afl013.FieldByName('CA1302').AsString <> '' then begin
         datm_trans_LI.RS_Proc_Anuente.FieldbyName('SG_ORG_PROC_ANUENT').AsString :=
         DMGipLite.afl013.FieldByName('CA1302').AsString;
      end;
      datm_trans_LI.RS_Proc_Anuente.Post;
      DMGipLite.afl013.Next;
   end;
end;

procedure Tfrm_trans_LI.Det_NCM_LI;
var
   nOcorrencias : Byte;
   cChaveArq : String;
begin
   datm_trans_LI.RS_Dest_NCM.Close;
   datm_trans_LI.RS_Dest_NCM.UnPrepare;
   datm_trans_LI.RS_Dest_NCM.SQL.Clear;
   datm_trans_LI.RS_Dest_NCM.SQL.Add('SELECT * FROM DESTAQUE_NCM ');
   datm_trans_LI.RS_Dest_NCM.SQL.Add(' WHERE NR_TRAT_IMP_MICRO = "'+cProcSCX+'"') ;
   datm_trans_LI.RS_Dest_NCM.Prepare;
   datm_trans_LI.RS_Dest_NCM.Open;

   while not datm_trans_LI.RS_Dest_NCM.EOF do begin
      datm_trans_LI.RS_Dest_NCM.Delete;
   end;

   DMGipLite.adi033.FindNearest([ cProcGIP ] );
   while ( not DMGipLite.adi033.Eof ) and 
      ( DMGipLite.adi033.FieldByName('CA3301').AsString = cProcGIP )  do begin
      if DMGipLite.adi033.FieldByName('CA3329').AsString <> '' then begin
         if NaoConsta(DMGipLite.adi033.FieldByName('CA3329').AsString) Then begin
            datm_trans_LI.RS_Dest_NCM.Append;
            datm_trans_LI.RS_Dest_NCM.FieldByName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
            datm_trans_LI.RS_Dest_NCM.FieldByName('NR_DESTAQUE_NCM').AsString :=
            DMGipLite.adi033.FieldByName('CA3329').AsString;
            datm_trans_LI.RS_Dest_NCM.Post;
         end;
      end;
      DMGipLite.adi033.Next;
   end;
end;


function Tfrm_trans_LI.NaoConsta(cDest : String) : Boolean;
var
   i : Byte;
   nao : boolean;
begin
   nao := true;
   for i := 1 To nDest do begin
       if aDest[i] = cDest Then begin
          Nao := False;
       end;
   end;

   if Nao = True Then begin
      inc(nDest);
      aDest[nDest] := cDest;
   end;
end;

procedure Tfrm_trans_LI.IntegraItemLI;
begin
   while ( not DMGipLite.adi033.EOF ) and 
      ( DMGipLite.adi033.FieldByName('CA3301').AsString = 
      DMGipLite.adi032.FieldByName('CA3201').AsString ) do begin
      cItemLI := Copy(DMGipLite.adi033.FieldByName('CA3302').AsString,2,2);
      
      ItemLI;
      
      inc(nItem);
      if GipLite.Estacao = true then
      begin
        lbl_itens.caption := IntToStr(nItem);
      end
      else
      begin
        lbl_itens.caption := IntToStr(nItem);
      end;
      DMGipLite.adi033.Next;
   end;
end;

procedure Tfrm_trans_LI.ItemLI;
begin
   datm_trans_LI.RS_Item_LI.SQL.Clear;
   datm_trans_LI.RS_Item_LI.SQL.Add('SELECT * FROM DETALHE_MERC_COM_TRATAMENTO');
   datm_trans_LI.RS_Item_LI.SQL.Add(' WHERE NR_TRAT_IMP_MICRO = "'+cProcSCX+'"');
   datm_trans_LI.RS_Item_LI.SQL.Add(' AND NR_SEQ_PRODUTO = "'+cItemLI+'"');
   datm_trans_LI.RS_Item_LI.Active := true;
   
   If datm_trans_LI.RS_Item_LI.RecordCount > 0 Then begin
      datm_trans_LI.RS_Item_LI.Edit;
      end
   Else begin
      datm_trans_LI.RS_Item_LI.Append;
      datm_trans_LI.RS_Item_LI.FieldbyName('NR_TRAT_IMP_MICRO').AsString := cProcSCX;
      datm_trans_LI.RS_Item_LI.FieldbyName('NR_SEQ_PRODUTO').AsString := cItemLI;
   end;

   if DMGipLite.adi033.FieldByName('CN3303').AsFloat <> 0 then begin
      datm_trans_LI.RS_Item_LI.FieldByName('QT_MERC_UN_COMERC').AsString := 
      frmSiscoDI.Num_To_Str(DMGipLite.adi033.FieldByName('CN3303').AsFloat,14,5);
   end;   

   if DMGipLite.adi033.FieldByName('CA3319').AsString <> '' then begin
      if DMGipLite.agi021.FindKey([DMGipLite.adi033.FieldByName('CA3319').AsString ] ) then begin
         if DMGipLite.agi021.FieldByName('CA2102').AsString <> '' then begin
            datm_trans_LI.RS_Item_LI.FieldByName('NM_UN_MEDID_COMER').AsString :=
            DMGipLite.agi021.FieldByName('CA2102').AsString;            
         end;
         end               
      else begin
         datm_trans_LI.RS_Item_LI.FieldByName('NM_UN_MEDID_COMER').AsString := replicate(' ',20);
      end;
   end;
   if DMGipLite.adi033.FieldByName('CN3306').AsFloat <> 0 then begin
      datm_trans_LI.RS_Item_LI.FieldByName('VL_UNID_COND_VENDA').AsString := 
      frmSiscoDI.Num_To_Str(DMGipLite.adi033.FieldByName('CN3306').AsFloat,20,7);
      end
   else begin
      datm_trans_LI.RS_Item_LI.FieldByName('VL_UNID_COND_VENDA').AsString := 
      frmSiscoDI.Num_To_Str( 0,20,7);
   end;

   if DMGipLite.adi033.FieldByName('CM3308').AsString <> '' then begin
      datm_trans_LI.RS_Item_LI.FieldByName('TX_DESC_DET_MERC').Assign(
      DMGipLite.adi033.FieldByName('CM3308') );
   end;
   datm_trans_LI.RS_Item_LI.FieldByName('CD_PRODUTO').AsString := Replicate(' ',15);
   datm_trans_LI.RS_Item_LI.Post;
end;

function Tfrm_trans_LI.Campo_DigitoCGC(cAgenciaSecex : String) : String;
begin
   if DMTabSisco.Tb_Ag_Secex.FindKey([cAgenciaSecex]) Then begin
      Campo_DigitoCGC := cAgenciaSecex + 
      Copy(DMTabSisco.Tb_Ag_Secex.FieldbyName('CGC_SECEX').AsString, 13, 1);
      end
   else begin
      Campo_DigitoCGC := '';
   end;
end;


procedure Tfrm_trans_LI.numera_li;
var
   cAno      : String;
   nNovoProc : Integer;
   nAno      : Integer;
begin   
   nNovoProc := datm_trans_LI.TB_Numerador_LI.FieldbyName('NR_SEQ_OPER_MICRO').AsInteger;
   nAno := datm_trans_LI.TB_Numerador_LI.FieldbyName('NR_ANO_OPER_MICRO').AsInteger;
   
   if datm_trans_LI.TB_Numerador_LI.RecordCount > 0 then begin
      datm_trans_LI.TB_Numerador_LI.Edit;
      datm_trans_LI.TB_Numerador_LI.FieldbyName('NR_SEQ_OPER_MICRO').AsInteger := nNovoProc + 1;
      datm_trans_LI.TB_Numerador_LI.FieldbyName('NR_ANO_OPER_MICRO').AsInteger := nAno;
      end
   else begin
      datm_trans_LI.TB_Numerador_LI.Append;
      datm_trans_LI.TB_Numerador_LI.FieldByName('NR_SEQ_OPER_MICRO').AsInteger := 1;
      cAno :=Copy(FormatDateTime('ddmmyyyy',Date),5,4);
      datm_trans_LI.TB_Numerador_LI.FieldByName('NR_ANO_OPER_MICRO').AsInteger := StrToInt(cAno);
      nNovoProc := datm_trans_LI.TB_Numerador_LI.FieldByName('NR_SEQ_OPER_MICRO').AsInteger;
      nAno := datm_trans_LI.TB_Numerador_LI.FieldByName('NR_ANO_OPER_MICRO').AsInteger;
   end;
   datm_trans_LI.TB_Numerador_LI.Post;
   cProcSCX := FormatFloat('00000',nNovoProc) + '/' +  Copy(FormatFloat('0000',nAno),3,2);
   DMGipLite.adi032.Edit;
   DMGipLite.adi032.FieldbyName('CA3298').AsString := cProcSCX;
   DMGipLite.adi032.FieldByName('CA3247').AsString := GipLite.Maquina;
   DMGipLite.adi032.Post;
end;
{ tabelas do siscomex }
procedure Tfrm_trans_LI.open_tabelas_sisco;
begin
   Application.ProcessMessages;
   datm_trans_LI.TB_Numerador_LI.Active := true;
   DMTabSisco.TB_Ag_Secex.Active := true;
end;
procedure Tfrm_trans_LI.close_tabelas_sisco;
begin
   Application.ProcessMessages;
   datm_trans_LI.TB_Numerador_LI.Active := false;
   DMTabSisco.TB_Ag_Secex.Active := false;
end;
{ tabelas do gip-lite }
procedure Tfrm_trans_LI.open_tabelas_giplite;
begin
   Application.ProcessMessages;
   DMGipLite.agi001.Active := true;
   DMGipLite.agi004.Active := true;
   DMGipLite.agi021.Active := true;

   DMGipLite.adi033.Active := true;

   DMGipLite.afl013.Active := true;
end;
procedure Tfrm_trans_LI.close_tabelas_giplite;
begin
   Application.ProcessMessages;
   DMGipLite.agi001.Active := false;
   DMGipLite.agi004.Active := false;
   DMGipLite.agi021.Active := false;

   DMGipLite.adi033.Active := false;

   DMGipLite.afl013.Active := false;

   if GipLite.Estacao = true then begin
      DMGipLite.adi032.active := false;
      datm_trans_LI.REGIMP.Connected := false;
      DMTabSisco.TABSISCO.Connected := false;
   end;
end;

procedure Tfrm_trans_LI.DBGGipLiteLIInsertBookMark(Sender: TObject);
begin
   if DBGGipLiteLI.DataSource.DataSet.FieldByName('CA3251').IsNull then begin
      messagedlg('Processo não está montado!',mtInformation,[mbOk],0 );
      abort;
   end;
end;

procedure Tfrm_trans_LI.FormCreate(Sender: TObject);
begin
  cb_ordem.ItemIndex := 0;
end;

procedure Tfrm_trans_LI.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_trans_LI.qry_li_NR_PROCESSO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_trans_LI.qry_li_.Close;
  datm_trans_LI.qry_li_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_trans_LI.qry_li_.Prepare;
  datm_trans_LI.qry_li_.Open;
  Localiza(datm_trans_LI.qry_li_, Pesquisa, a_str_indices[0] );
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


end.
