unit PGRE004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, DbTables, StdCtrls, Mask, ExtCtrls, UCRPE32, ComCtrls, Funcoes;

type
  Tfrm_sel_unid_cli_imp_area = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    crp_rel: TCrpe;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cliente: TLabel;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_imp: TLabel;
    btn_co_importador: TSpeedButton;
    msk_cd_importador: TMaskEdit;
    edt_nm_importador: TEdit;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_sg_grupo: TLabel;
    edt_sg_grupo: TEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure msk_cd_importadorExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure edt_sg_grupoExit(Sender: TObject);
  private
    TotalTipo, TotalClassif : Byte;
    JaLeu : Boolean;
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
    CBClassif : Array [0..6] of TCheckBox;
    CBTipo : Array [0..15] of TCheckBox;
    PanelAtBASF : Array [0..1] of TGroupBox;
    {1 - Exportação - Relação de RE´s
     2 - Relatório de Pedidos - Atendimento BASF }
  end;

var
  frm_sel_unid_cli_imp_area: Tfrm_sel_unid_cli_imp_area;

implementation

{$R *.DFM}

uses GSMLIB,  PGGP001, PGGP017, PGSM010, PGSM016, PGSM018, PGSM024, PGSM103, PGSM119,
     PGSM212, PGRE005;

procedure Tfrm_sel_unid_cli_imp_area.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_cli_imp_area do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_cli_imp_area do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.btn_imprimirClick(Sender: TObject);
var
  nr_identificador: integer;
  i : Byte;
  SelClassif, SelTipo, JaQuebrou : Boolean;
begin
  with datm_sel_unid_cli_imp_area do
  begin
    nr_identificador := 0;

    if ( Trim( msk_cd_unid_neg.Text ) = '' ) and Not ( tp_rel in [1] ) then
    begin
      BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if ( ( Trim( msk_cd_cliente.Text ) = '' ) and ( Trim( msk_cd_grupo.Text ) = '' ) ) and ( Not ( tp_rel in [1,2] ) ) then
    begin
      BoxMensagem( 'Informe um Cliente ou Grupo!', 2 );
      msk_cd_cliente.SetFocus;
      Exit;
    end;

    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    case tp_rel of
      1: begin
           CloseStoredProc( sp_rel_exp_re );
           if Trim( msk_cd_unid_neg.Text ) = '' then
             sp_rel_exp_re.ParamByName('@cd_unid_neg').AsString   := 'X'
           else
             sp_rel_exp_re.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;

           if Trim( msk_cd_grupo.Text ) = '' then
             sp_rel_exp_re.ParamByName('@cd_grupo').AsString      := 'X'
           else
             sp_rel_exp_re.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;

           if Trim( msk_cd_cliente.Text ) = '' then
             sp_rel_exp_re.ParamByName('@cd_cliente').AsString    := 'X'
           else
             sp_rel_exp_re.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;

           if Trim( msk_cd_importador.Text ) = '' then
             sp_rel_exp_re.ParamByName('@cd_importador').AsString := 'X'
           else
             sp_rel_exp_re.ParamByName('@cd_importador').AsString := msk_cd_importador.Text;

           if Trim( msk_cd_area.Text ) = '' then
             sp_rel_exp_re.ParamByName('@cd_area').AsString       := 'X'
           else
             sp_rel_exp_re.ParamByName('@cd_area').AsString       := msk_cd_area.Text;

           if msk_dt_inicio.Date = 0 then
             sp_rel_exp_re.ParamByName('@dt_inicio').AsString     := 'X'
           else
             sp_rel_exp_re.ParamByName('@dt_inicio').AsString     := FormatDateTime( FData, msk_dt_inicio.Date );

           if msk_dt_fim.Date = 0 then
             sp_rel_exp_re.ParamByName('@dt_fim').AsString        := 'X'
           else
             sp_rel_exp_re.ParamByName('@dt_fim').AsString        := FormatDateTime( FData, msk_dt_fim.Date );

           ExecStoredProc( sp_rel_exp_re );
           nr_identificador := sp_rel_exp_re.ParamByName('@nr_identificador').AsInteger;
           CloseStoredProc( sp_rel_exp_re );

           qry_rel_exp_re_.Close;
           qry_rel_exp_re_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
           qry_rel_exp_re_.Prepare;
           qry_rel_exp_re_.Open;

           ppRepUnidCliImpArea.Template.FileName := cDir_RPT + '\RBEXP006.RTM';
           ppRepUnidCliImpArea.Template.LoadFromFile;
           ppRepUnidCliImpArea.AllowPrintToFile  := True;
           ppRepUnidCliImpArea.TextFileName      := cDir_Rpt + '\RBEXP006.PDF';
           pplbl_titulo.Caption                  := 'Relação de RE´s';
           pplbl_periodo.Caption                 := FormatDateTime( 'dd/mm/yyyy',msk_dt_inicio.date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_fim.date );
         end;

      2: begin
           {Consiste Classificação}
           SelClassif := False;
           for i := 0 to ( TotalClassif - 1 )do
           begin
             if CBClassif[i].Checked then
               SelClassif := True;
           end;
           if Not SelClassif then
           begin
             Screen.Cursor := crDefault;
             BoxMensagem( 'Selecione uma Classificação!', 2 );
             Exit;
           end;

           {Consiste Tipo}
           SelTipo := False;
           for i := 0 to ( TotalTipo - 1 )do
           begin
             if CBTipo[i].Checked then
               SelTipo := True;
           end;
           if Not SelTipo then
           begin
             Screen.Cursor := crDefault;
             BoxMensagem( 'Selecione um Tipo!', 2 );
             Exit;
           end;

           {Abertura das Querys}
           qry_classif_at_basf_.Close;
           qry_classif_at_basf_.SQL.Clear;
           qry_classif_at_basf_.SQL.Add( 'SELECT * FROM TTP_CLASSIF_AT_BASF WHERE TP_CLASSIF_AT_BASF IN ( "", ' );
           for i := 0 to ( TotalClassif - 1 )do
           begin
             if CBClassif[i].Checked then
               qry_classif_at_basf_.SQL.Add( QuotedStr( IntToStr( i ) ) + ', ' );
           end;
           qry_classif_at_basf_.SQL.Add( '"" ) ORDER BY CONVERT( int, TP_CLASSIF_AT_BASF ) ' );
           qry_classif_at_basf_.Prepare;
           qry_classif_at_basf_.Open;

           qry_at_basf_transmissao_.Close;
           qry_at_basf_followup_.Close;
           qry_at_basf_revisao_fat_.Close;
           qry_at_basf_demurrage_.Close;
           qry_at_basf_ent_basf_.Close;
           qry_at_basf_ent_bsg_.Close;
           qry_at_basf_chec_doc_.Close;

           qry_at_basf_transmissao_.SQL.Clear;
           qry_at_basf_followup_.SQL.Clear;
           qry_at_basf_revisao_fat_.SQL.Clear;
           qry_at_basf_demurrage_.SQL.Clear;
           qry_at_basf_ent_basf_.SQL.Clear;
           qry_at_basf_ent_bsg_.SQL.Clear;
           qry_at_basf_chec_doc_.SQL.Clear;

           qry_at_basf_transmissao_.SQL.Add( 'SELECT "1" AS QUEBRA, B.NR_PEDIDO, B.CD_AREA, UPPER( A.NM_GRUPO ) AS NM_GRUPO, UPPER( A.NM_AREA ) AS NM_AREA, ' );
           qry_at_basf_followup_.SQL.Add(    'SELECT "1" AS QUEBRA, B.NR_PEDIDO, B.CD_AREA, UPPER( A.NM_GRUPO ) AS NM_GRUPO, UPPER( A.NM_AREA ) AS NM_AREA, ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'SELECT "1" AS QUEBRA, B.NR_PEDIDO, B.CD_AREA, UPPER( A.NM_GRUPO ) AS NM_GRUPO, UPPER( A.NM_AREA ) AS NM_AREA, ' );
           qry_at_basf_demurrage_.SQL.Add(   'SELECT "1" AS QUEBRA, B.NR_PEDIDO, B.CD_AREA, UPPER( A.NM_GRUPO ) AS NM_GRUPO, UPPER( A.NM_AREA ) AS NM_AREA, ' );
           qry_at_basf_ent_basf_.SQL.Add(    'SELECT "1" AS QUEBRA, B.NR_PEDIDO, B.CD_AREA, UPPER( A.NM_GRUPO ) AS NM_GRUPO, UPPER( A.NM_AREA ) AS NM_AREA, ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'SELECT "1" AS QUEBRA, B.NR_PEDIDO, B.CD_AREA, UPPER( A.NM_GRUPO ) AS NM_GRUPO, UPPER( A.NM_AREA ) AS NM_AREA, ' );
           qry_at_basf_chec_doc_.SQL.Add(    'SELECT "1" AS QUEBRA, B.NR_PEDIDO, B.CD_AREA, UPPER( A.NM_GRUPO ) AS NM_GRUPO, UPPER( A.NM_AREA ) AS NM_AREA, ' );

           qry_at_basf_transmissao_.SQL.Add( 'UPPER( T.NM_TP_AT_BASF ) AS NM_TP_AT_BASF, B.VL_TRANSMISSAO AS VL_PEDIDO ' );
           qry_at_basf_followup_.SQL.Add(    'UPPER( T.NM_TP_AT_BASF ) AS NM_TP_AT_BASF, B.VL_FOLLOWUP AS VL_PEDIDO ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'UPPER( T.NM_TP_AT_BASF ) AS NM_TP_AT_BASF, B.VL_REVISAO_FAT AS VL_PEDIDO ' );
           qry_at_basf_demurrage_.SQL.Add(   'UPPER( T.NM_TP_AT_BASF ) AS NM_TP_AT_BASF, B.VL_DEMURRAGE AS VL_PEDIDO ' );
           qry_at_basf_ent_basf_.SQL.Add(    'UPPER( T.NM_TP_AT_BASF ) AS NM_TP_AT_BASF, B.VL_ENT_BASF AS VL_PEDIDO ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'UPPER( T.NM_TP_AT_BASF ) AS NM_TP_AT_BASF, B.VL_ENT_BSG AS VL_PEDIDO ' );
           qry_at_basf_chec_doc_.SQL.Add(    'UPPER( T.NM_TP_AT_BASF ) AS NM_TP_AT_BASF, B.VL_CHEC_DOC AS VL_PEDIDO ' );

           qry_at_basf_transmissao_.SQL.Add( 'FROM TAT_BASF B, TAREA A, TTP_AT_BASF T ' );
           qry_at_basf_followup_.SQL.Add(    'FROM TAT_BASF B, TAREA A, TTP_AT_BASF T ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'FROM TAT_BASF B, TAREA A, TTP_AT_BASF T ' );
           qry_at_basf_demurrage_.SQL.Add(   'FROM TAT_BASF B, TAREA A, TTP_AT_BASF T ' );
           qry_at_basf_ent_basf_.SQL.Add(    'FROM TAT_BASF B, TAREA A, TTP_AT_BASF T ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'FROM TAT_BASF B, TAREA A, TTP_AT_BASF T ' );
           qry_at_basf_chec_doc_.SQL.Add(    'FROM TAT_BASF B, TAREA A, TTP_AT_BASF T ' );

           qry_at_basf_transmissao_.SQL.Add( 'WHERE B.CD_AREA = A.CD_AREA AND ' );
           qry_at_basf_followup_.SQL.Add(    'WHERE B.CD_AREA = A.CD_AREA AND ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'WHERE B.CD_AREA = A.CD_AREA AND ' );
           qry_at_basf_demurrage_.SQL.Add(   'WHERE B.CD_AREA = A.CD_AREA AND ' );
           qry_at_basf_ent_basf_.SQL.Add(    'WHERE B.CD_AREA = A.CD_AREA AND ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'WHERE B.CD_AREA = A.CD_AREA AND ' );
           qry_at_basf_chec_doc_.SQL.Add(    'WHERE B.CD_AREA = A.CD_AREA AND ' );

           qry_at_basf_transmissao_.SQL.Add( 'B.TP_AT_BASF = T.TP_AT_BASF AND ' );
           qry_at_basf_followup_.SQL.Add(    'B.TP_AT_BASF = T.TP_AT_BASF AND ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'B.TP_AT_BASF = T.TP_AT_BASF AND ' );
           qry_at_basf_demurrage_.SQL.Add(   'B.TP_AT_BASF = T.TP_AT_BASF AND ' );
           qry_at_basf_ent_basf_.SQL.Add(    'B.TP_AT_BASF = T.TP_AT_BASF AND ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'B.TP_AT_BASF = T.TP_AT_BASF AND ' );
           qry_at_basf_chec_doc_.SQL.Add(    'B.TP_AT_BASF = T.TP_AT_BASF AND ' );

           if Trim( msk_cd_area.Text ) <> '' then
           begin
             qry_at_basf_transmissao_.SQL.Add( 'B.CD_AREA = ' + QuotedStr( Trim( msk_cd_area.Text ) ) + ' AND ' );
             qry_at_basf_followup_.SQL.Add(    'B.CD_AREA = ' + QuotedStr( Trim( msk_cd_area.Text ) ) + ' AND ' );
             qry_at_basf_revisao_fat_.SQL.Add( 'B.CD_AREA = ' + QuotedStr( Trim( msk_cd_area.Text ) ) + ' AND ' );
             qry_at_basf_demurrage_.SQL.Add(   'B.CD_AREA = ' + QuotedStr( Trim( msk_cd_area.Text ) ) + ' AND ' );
             qry_at_basf_ent_basf_.SQL.Add(    'B.CD_AREA = ' + QuotedStr( Trim( msk_cd_area.Text ) ) + ' AND ' );
             qry_at_basf_ent_bsg_.SQL.Add(     'B.CD_AREA = ' + QuotedStr( Trim( msk_cd_area.Text ) ) + ' AND ' );
             qry_at_basf_chec_doc_.SQL.Add(    'B.CD_AREA = ' + QuotedStr( Trim( msk_cd_area.Text ) ) + ' AND ' );
           end;

           if Trim(edt_sg_grupo.Text) <> '' then 
           begin
             qry_at_basf_transmissao_.SQL.Add( 'A.NM_GRUPO = ' + QuotedStr( Trim(edt_sg_grupo.Text ) ) + ' AND ' );
             qry_at_basf_followup_.SQL.Add(    'A.NM_GRUPO = ' + QuotedStr( Trim(edt_sg_grupo.Text ) ) + ' AND ' );
             qry_at_basf_revisao_fat_.SQL.Add( 'A.NM_GRUPO = ' + QuotedStr( Trim(edt_sg_grupo.Text ) ) + ' AND ' );
             qry_at_basf_demurrage_.SQL.Add(   'A.NM_GRUPO = ' + QuotedStr( Trim(edt_sg_grupo.Text ) ) + ' AND ' );
             qry_at_basf_ent_basf_.SQL.Add(    'A.NM_GRUPO = ' + QuotedStr( Trim(edt_sg_grupo.Text ) ) + ' AND ' );
             qry_at_basf_ent_bsg_.SQL.Add(     'A.NM_GRUPO = ' + QuotedStr( Trim(edt_sg_grupo.Text ) ) + ' AND ' );
             qry_at_basf_chec_doc_.SQL.Add(    'A.NM_GRUPO = ' + QuotedStr( Trim(edt_sg_grupo.Text ) ) + ' AND ' );
           end;

           qry_at_basf_transmissao_.SQL.Add( 'B.DT_PEDIDO BETWEEN CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_inicio.Date ) ) + ', 103 ) AND CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_fim.Date ) ) + ', 103 ) AND ' );
           qry_at_basf_followup_.SQL.Add(    'B.DT_PEDIDO BETWEEN CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_inicio.Date ) ) + ', 103 ) AND CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_fim.Date ) ) + ', 103 ) AND ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'B.DT_PEDIDO BETWEEN CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_inicio.Date ) ) + ', 103 ) AND CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_fim.Date ) ) + ', 103 ) AND ' );
           qry_at_basf_demurrage_.SQL.Add(   'B.DT_PEDIDO BETWEEN CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_inicio.Date ) ) + ', 103 ) AND CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_fim.Date ) ) + ', 103 ) AND ' );
           qry_at_basf_ent_basf_.SQL.Add(    'B.DT_PEDIDO BETWEEN CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_inicio.Date ) ) + ', 103 ) AND CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_fim.Date ) ) + ', 103 ) AND ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'B.DT_PEDIDO BETWEEN CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_inicio.Date ) ) + ', 103 ) AND CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_fim.Date ) ) + ', 103 ) AND ' );
           qry_at_basf_chec_doc_.SQL.Add(    'B.DT_PEDIDO BETWEEN CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_inicio.Date ) ) + ', 103 ) AND CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, msk_dt_fim.Date ) ) + ', 103 ) AND ' );

           qry_at_basf_transmissao_.SQL.Add( 'B.IN_TRANSMISSAO = "1" AND B.TP_AT_BASF IN ( "", ' );
           qry_at_basf_followup_.SQL.Add(    'B.IN_FOLLOWUP    = "1" AND B.TP_AT_BASF IN ( "", ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'B.IN_REVISAO_FAT = "1" AND B.TP_AT_BASF IN ( "", ' );
           qry_at_basf_demurrage_.SQL.Add(   'B.IN_DEMURRAGE   = "1" AND B.TP_AT_BASF IN ( "", ' );
           qry_at_basf_ent_basf_.SQL.Add(    'B.IN_ENT_BASF    = "1" AND B.TP_AT_BASF IN ( "", ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'B.IN_ENT_BSG     = "1" AND B.TP_AT_BASF IN ( "", ' );
           qry_at_basf_chec_doc_.SQL.Add(    'B.IN_CHEC_DOC    = "1" AND B.TP_AT_BASF IN ( "", ' );

           for i := 0 to ( TotalTipo - 1 )do
           begin
             if CBTipo[i].Checked then
             begin
               qry_at_basf_transmissao_.SQL.Add( QuotedStr( IntToStr( ( i + 1 ) ) ) + ', ' );
               qry_at_basf_followup_.SQL.Add(    QuotedStr( IntToStr( ( i + 1 ) ) ) + ', ' );
               qry_at_basf_revisao_fat_.SQL.Add( QuotedStr( IntToStr( ( i + 1 ) ) ) + ', ' );
               qry_at_basf_demurrage_.SQL.Add(   QuotedStr( IntToStr( ( i + 1 ) ) ) + ', ' );
               qry_at_basf_ent_basf_.SQL.Add(    QuotedStr( IntToStr( ( i + 1 ) ) ) + ', ' );
               qry_at_basf_ent_bsg_.SQL.Add(     QuotedStr( IntToStr( ( i + 1 ) ) ) + ', ' );
               qry_at_basf_chec_doc_.SQL.Add(    QuotedStr( IntToStr( ( i + 1 ) ) ) + ', ' );
             end;
           end;

           qry_at_basf_transmissao_.SQL.Add( '"" ) ' );
           qry_at_basf_followup_.SQL.Add(    '"" ) ' );
           qry_at_basf_revisao_fat_.SQL.Add( '"" ) ' );
           qry_at_basf_demurrage_.SQL.Add(   '"" ) ' );
           qry_at_basf_ent_basf_.SQL.Add(    '"" ) ' );
           qry_at_basf_ent_bsg_.SQL.Add(     '"" ) ' );
           qry_at_basf_chec_doc_.SQL.Add(    '"" ) ' );

           qry_at_basf_transmissao_.SQL.Add( 'ORDER BY A.NM_GRUPO, A.NM_AREA, T.NM_TP_AT_BASF, B.NR_PEDIDO ' );
           qry_at_basf_followup_.SQL.Add(    'ORDER BY A.NM_GRUPO, A.NM_AREA, T.NM_TP_AT_BASF, B.NR_PEDIDO ' );
           qry_at_basf_revisao_fat_.SQL.Add( 'ORDER BY A.NM_GRUPO, A.NM_AREA, T.NM_TP_AT_BASF, B.NR_PEDIDO ' );
           qry_at_basf_demurrage_.SQL.Add(   'ORDER BY A.NM_GRUPO, A.NM_AREA, T.NM_TP_AT_BASF, B.NR_PEDIDO ' );
           qry_at_basf_ent_basf_.SQL.Add(    'ORDER BY A.NM_GRUPO, A.NM_AREA, T.NM_TP_AT_BASF, B.NR_PEDIDO ' );
           qry_at_basf_ent_bsg_.SQL.Add(     'ORDER BY A.NM_GRUPO, A.NM_AREA, T.NM_TP_AT_BASF, B.NR_PEDIDO ' );
           qry_at_basf_chec_doc_.SQL.Add(    'ORDER BY A.NM_GRUPO, A.NM_AREA, T.NM_TP_AT_BASF, B.NR_PEDIDO ' );

           qry_at_basf_transmissao_.Prepare;
           qry_at_basf_followup_.Prepare;
           qry_at_basf_revisao_fat_.Prepare;
           qry_at_basf_demurrage_.Prepare;
           qry_at_basf_ent_basf_.Prepare;
           qry_at_basf_ent_bsg_.Prepare;
           qry_at_basf_chec_doc_.Prepare;

           qry_at_basf_transmissao_.Open;
           qry_at_basf_followup_.Open;
           qry_at_basf_revisao_fat_.Open;
           qry_at_basf_demurrage_.Open;
           qry_at_basf_ent_basf_.Open;
           qry_at_basf_ent_bsg_.Open;
           qry_at_basf_chec_doc_.Open;

           if Not JaLeu then
           begin
             ppRepUnidCliImpArea.Template.FileName := cDir_RPT + '\RBPO004.RTM';
             ppRepUnidCliImpArea.Template.LoadFromFile;
             JaLeu := True;
           end;

           JaQuebrou := False;
           for i := 0 to ( TotalClassif - 1 )do
           begin
             if CBClassif[i].Checked then
             begin
               case i of
                 0 : ppTitleBandTransmissao.NewPage := JaQuebrou;
                 1 : ppTitleBandFollowUp.NewPage    := JaQuebrou;
                 2 : ppTitleBandRevisaoFat.NewPage  := JaQuebrou;
                 3 : ppTitleBandDemurrage.NewPage   := JaQuebrou;
                 4 : ppTitleBandEntBasf.NewPage     := JaQuebrou;
                 5 : ppTitleBandEntBSG.NewPage      := JaQuebrou;
                 6 : ppTitleBandChecDoc.NewPage     := JaQuebrou;
               end;
               JaQuebrou := True;
             end;
           end;

           pplbl_periodo.Caption                 := 'Período: ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_inicio.date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_fim.date );
           ppRepUnidCliImpArea.TextFileName      := cDir_Rpt + '\RBPO004.PDF';
         end;
    end; {end case}

    ppRepUnidCliImpArea.AllowPrintToFile         := True;
    ppRepUnidCliImpArea.DeviceType               := 'Screen';
    ppRepUnidCliImpArea.Print;

    if tp_rel = 1 then
      ApagaDados( 'TREL_EXP_FLP', nr_identificador );

    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.FormShow(Sender: TObject);
var
  i, j, k, Topo, Altura, TotalItens : Byte;
  qry_tp_at_basf_, qry_tp_classif_at_basf_ : TQuery;
begin
  JaLeu := False;

  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  if ComPeriodo then
    lbl_periodo.Caption := 'Selecione um período:'
  else
  begin
    if tp_rel in [1] then
    begin
      lbl_periodo.Caption := 'Selecione uma data:';
      msk_dt_inicio.Date  := dt_server;
    end;
  end;

  case tp_rel of
    1 : begin
          Caption := 'Relação de RE´s';
          lbl_grupo.Visible      := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cliente.Visible    := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          msk_dt_inicio.TabOrder := msk_cd_area.TabOrder + 1;
          msk_dt_fim.TabOrder    := msk_dt_inicio.TabOrder + 1;
        end;
    2 : begin
          {Criação dos painéis}
          Topo   := 15;
          Altura := 22;

          {Painel da Classificação}
          qry_tp_classif_at_basf_ := TQuery.Create(nil);
          with qry_tp_classif_at_basf_ do
          begin
            Close;
            DataBaseName := 'DBBroker';
            RequestLive := False;
            Sql.Clear;
            Sql.Add( 'SELECT * FROM TTP_CLASSIF_AT_BASF ORDER BY CONVERT( int, TP_CLASSIF_AT_BASF )' );
            Prepare;
            Open;
            TotalItens   := qry_tp_classif_at_basf_.RecordCount;
            TotalClassif := TotalItens;
            j := ( ( TotalItens div 2 ) + ( ( TotalItens mod 2 ) ) ) - 1; {j = quebra}
            k := 0;
            i := 0;

            PanelAtBASF[0]            := TGroupBox.Create(Self);
            PanelAtBASF[0].Name       := 'PanelBASF0';
            PanelAtBASF[0].Caption    := 'Classificação';
            PanelAtBASF[0].Width      := 420;
            PanelAtBASF[0].Height     := ( Altura * ( j + 1 ) ) + Topo;
            PanelAtBASF[0].Left       := msk_dt_inicio.Left;
            PanelAtBASF[0].Top        := msk_dt_inicio.Top + msk_dt_inicio.Height + 10;
            PanelAtBASF[0].Font.Style := [fsbold];
            PanelAtBASF[0].Parent     := frm_sel_unid_cli_imp_area;

            qry_tp_classif_at_basf_.First;
            while Not qry_tp_classif_at_basf_.EOF do
            begin
              CBClassif[i]            := TCheckBox.Create(Self);
              CBClassif[i].Caption    := qry_tp_classif_at_basf_.FieldByName('NM_TP_CLASSIF_AT_BASF').AsString;
              CBClassif[i].Checked    := False;
              CBClassif[i].Name       := 'chkbox_classif' + IntToStr(i);
              if i > j then
              begin
                CBClassif[i].Left        := msk_cd_unid_neg.Left + 180;
              end
              else
              begin
                CBClassif[i].Left        := msk_cd_unid_neg.Left;
              end;

              CBClassif[i].Top           := ( Altura * k ) + Topo;
              CBClassif[i].Width         := 210;
              CBClassif[i].Font.Style    := [fsbold];
              CBClassif[i].Parent        := PanelAtBASF[0];
              k := k + 1;
              if i = j then
                k := 0;

              i := i + 1;
              qry_tp_classif_at_basf_.Next;
            end;
            Close;
            Free;
          end;

          {Painel do Tipo}
          qry_tp_at_basf_ := TQuery.Create(nil);
          with qry_tp_at_basf_ do
          begin
            Close;
            DataBaseName := 'DBBroker';
            RequestLive := False;
            Sql.Clear;
            Sql.Add( 'SELECT * FROM TTP_AT_BASF ORDER BY CONVERT( int, TP_AT_BASF )' );
            Prepare;
            Open;
            TotalItens := qry_tp_at_basf_.RecordCount;
            TotalTipo  := TotalItens;
            j := ( ( TotalItens div 2 ) + ( ( TotalItens mod 2 ) ) ) - 1; {j = quebra}
            k := 0;
            i := 0;
            PanelAtBASF[1]            := TGroupBox.Create(Self);
            PanelAtBASF[1].Name       := 'PanelBASF1';
            PanelAtBASF[1].Caption    := 'Tipo';
            PanelAtBASF[1].Width      := 420;
            PanelAtBASF[1].Height     := ( Altura * ( j + 1 ) ) + Topo;
            PanelAtBASF[1].Left       := msk_dt_inicio.Left;
            PanelAtBASF[1].Font.Style := [fsbold];
            PanelAtBASF[1].Parent     := frm_sel_unid_cli_imp_area;

            qry_tp_at_basf_.First;
            while Not qry_tp_at_basf_.EOF do
            begin
              CBTipo[i]               := TCheckBox.Create(Self);
              CBTipo[i].Caption       := qry_tp_at_basf_.FieldByName('NM_TP_AT_BASF').AsString;
              CBTipo[i].Checked       := False;
              CBTipo[i].Name          := 'chkbox_tipo' + IntToStr(i);
              if i > j then
              begin
                CBTipo[i].Left        := msk_cd_unid_neg.Left + 180;
              end
              else
              begin
                CBTipo[i].Left        := msk_cd_unid_neg.Left;
              end;
              CBTipo[i].Top           := ( Altura * k ) + Topo;
              CBTipo[i].Width         := 210;
              CBTipo[i].Font.Style    := [fsbold];
              CBTipo[i].Parent        := PanelAtBASF[1];
              k := k + 1;
              if i = j then
                k := 0;

              i := i + 1;
              qry_tp_at_basf_.Next;
            end;
            Close;
            Free;
          end;

          Caption := 'Lançamentos de Pedidos Importação - Relatório';
          lbl_unid_neg.Visible      := False;
          msk_cd_unid_neg.Visible   := False;
          edt_nm_unid_neg.Visible   := False;
          btn_co_unid_neg.Visible   := False;
          lbl_imp.Visible           := False;
          msk_cd_importador.Visible := False;
          edt_nm_importador.Visible := False;
          btn_co_importador.Visible := False;
          edt_sg_grupo.TabOrder     := msk_cd_area.TabOrder + 1; 
          msk_dt_inicio.TabOrder    := edt_sg_grupo.TabOrder + 1;
          msk_dt_fim.TabOrder       := msk_dt_inicio.TabOrder + 1;
          PanelAtBASF[0].TabOrder   := msk_dt_fim.TabOrder + 1;
          PanelAtBASF[1].TabOrder   := PanelAtBASF[0].TabOrder + 1;
          btn_imprimir.TabOrder     := PanelAtBASF[1].TabOrder + 1;
          btn_sair.TabOrder         := btn_imprimir.TabOrder + 1;
          lbl_area.Left             := lbl_unid_neg.Left;
          lbl_area.Top              := lbl_unid_neg.Top;
          lbl_sg_grupo.Top          := lbl_unid_neg.top; 
          msk_cd_area.Left          := msk_cd_unid_neg.Left;
          msk_cd_area.Top           := msk_cd_unid_neg.Top;
          edt_nm_area.Left          := edt_nm_unid_neg.Left;
          edt_nm_area.Top           := edt_nm_unid_neg.Top;
          btn_co_area.Left          := btn_co_unid_neg.Left;
          edt_sg_grupo.Top          := msk_cd_unid_neg.Top;               
          btn_co_area.Top           := btn_co_unid_neg.Top;
          lbl_periodo.Top           := lbl_grupo.Top;
          msk_dt_inicio.Top         := msk_cd_grupo.Top;
          msk_dt_fim.Top            := msk_cd_grupo.Top;
          lbl_a.Top                 := msk_cd_grupo.Top;
          PanelAtBASF[0].Top        := msk_dt_inicio.Top + msk_dt_inicio.Height + 10;
          PanelAtBASF[1].Top        := PanelAtBASF[0].Top + PanelAtBASF[0].Height + 10;
          btn_imprimir.Top          := PanelAtBASF[1].Top + PanelAtBASF[1].Height + 10;
          btn_sair.Top              := PanelAtBASF[1].Top + PanelAtBASF[1].Height + 10;
          Height                    := btn_imprimir.Top + btn_imprimir.Height + 50;
          msk_cd_area.SetFocus;
        end;
  end;

  with datm_sel_unid_cli_imp_area do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  lbl_a.Visible        := ComPeriodo;
  msk_dt_fim.Visible   := ComPeriodo;
end;

procedure Tfrm_sel_unid_cli_imp_area.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_rel.Free;
  with datm_sel_unid_cli_imp_area do
  begin
    qry_importador_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_area_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sel_unid_cli_imp_area.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module}
  Application.CreateForm( Tdatm_sel_unid_cli_imp_area, datm_sel_unid_cli_imp_area );
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_cliente.Text := 'Todos'
    else edt_nm_cliente.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_unid_cli_imp_area.qry_cliente_ do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_co_unid_negClick(nil);
    if Sender = msk_cd_grupo      then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente    then btn_co_clienteClick(nil);
    if Sender = msk_cd_importador then btn_co_importadorClick(nil);
    if Sender = msk_cd_area       then btn_co_areaClick(nil);
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_grupo.Cons_OnLine_Texto <> '' then msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_grupo.Text := 'Todos'
    else edt_nm_grupo.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_unid_cli_imp_area.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Grupo de Clientes não encontrado!', 2 );
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.btn_co_importadorClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_emp_est, frm_emp_est );
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_emp_est.Cons_OnLine_Texto := msk_cd_importador.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_importador.Text := frm_emp_est.Cons_OnLine_Texto;
  end;
  msk_cd_importadorExit(nil);
  msk_cd_importador.SetFocus;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_importadorExit(Sender: TObject);
begin
  edt_nm_importador.Clear;
  if msk_cd_importador.Text = '' then
  begin
    edt_nm_importador.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_importador );
  with datm_sel_unid_cli_imp_area.qry_importador_ do
  begin
    Close;
    ParamByName('CD_IMPORTADOR').AsString := msk_cd_importador.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Importador não encontrado!', 2 );
      msk_cd_importador.Clear;
      edt_nm_importador.Clear;
      msk_cd_importador.SetFocus;
    end
    else edt_nm_importador.Text := FieldByName('NM_IMPORTADOR').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.btn_co_areaClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_area, frm_area );
  with frm_area do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_area.Cons_OnLine_Texto := msk_cd_area.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_area.Text := frm_area.Cons_OnLine_Texto;
  end;
  msk_cd_areaExit(nil);
  msk_cd_area.SetFocus;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_cd_areaExit(Sender: TObject);
begin
  edt_nm_area.Clear;
  if msk_cd_area.Text = '' then
  begin
    if tp_rel in [1, 2] then edt_nm_area.Text := 'Todas'
    else edt_nm_area.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_area );
  with datm_sel_unid_cli_imp_area.qry_area_ do
  begin
    Close;
    ParamByName('CD_AREA').AsString := msk_cd_area.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Área não encontrada!', 2 );
      msk_cd_area.Clear;
      edt_nm_area.Clear;
      msk_cd_area.SetFocus;
    end
    else edt_nm_area.Text := FieldByName('NM_AREA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_dt_fimExit(Sender: TObject);
begin
  if msk_dt_fim.Date = 0 then
  begin
    BoxMensagem( 'Informe uma Data Inicial!', 2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;
end;

procedure Tfrm_sel_unid_cli_imp_area.msk_dt_inicioExit(Sender: TObject);
begin
  if msk_dt_inicio.Date = 0 then
  begin
    BoxMensagem('Informe uma Data Inicial!', 2);
    msk_dt_inicio.SetFocus;
    Exit;
  end;
end;



procedure Tfrm_sel_unid_cli_imp_area.edt_sg_grupoExit(Sender: TObject);
begin
  if edt_sg_grupo.Text <> '' then
  begin
    with datm_sel_unid_cli_imp_area.qry_grupo_area_ do
      begin
      Close;
      sql.Clear;
      sql.Add('select nm_grupo from tarea where (nm_grupo = '+ QuotedStr(edt_sg_grupo.text) +')');
      Prepare;
      Open;
      if Eof then
      begin
        BoxMensagem( 'Grupo não encontrado!', 2 );
        edt_sg_grupo.Clear;
        edt_sg_grupo.SetFocus;
      end;
      Close;
    end;
  end;
end;
end.
