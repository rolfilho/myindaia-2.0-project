unit PGPE007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCGrids, ExtCtrls, Buttons, Mask, DBCtrls, Db, Menus, Funcoes;
type
  Tfrm_pe_prepara = class(TForm)
    dbctrlgrd_pe: TDBCtrlGrid;
    dbctrlgrd_pe_itens: TDBCtrlGrid;
    Label3: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    lbl_ncm: TLabel;
    Label15: TLabel;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_nr_processo: TSpeedButton;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    pnl_botoes: TPanel;
    btn_sair: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    btn_preparar: TSpeedButton;
    Panel1: TPanel;
    lbl_item: TLabel;
    lbl_qt_inicial: TLabel;
    lbl_qt_disp: TLabel;
    lbl_qt_baixada: TLabel;
    lbl_qt_baixar: TLabel;
    lbl_dt_baixa: TLabel;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbedt_nr_item: TDBEdit;
    dbedt_qt_inicial: TDBEdit;
    dbedt_qt_disponivel: TDBEdit;
    dbedt_qt_baixada: TDBEdit;
    msk_qt_baixar: TMaskEdit;
    msk_dt_baixa: TMaskEdit;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_preparar: TMenuItem;
    mi_sair: TMenuItem;
    dbchkbx_sel_itens: TDBCheckBox;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    dbchkbx_sel_pe: TDBCheckBox;
    dbtxt_nr_processo: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    Label2: TLabel;
    msk_nr_pe: TMaskEdit;
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbchkbx_sel_peClick(Sender: TObject);
    procedure dbchkbx_sel_itensClick(Sender: TObject);
    procedure DBText6DblClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure msk_qt_baixarExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_prepararClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_nr_peChange(Sender: TObject);
  private
    { Private declarations }
    Procedure Verifica_Valores( lVerifica : Boolean );

  public
    { Public declarations }
  end;

var
  frm_pe_prepara: Tfrm_pe_prepara;

implementation

uses PGPE008, PGGP015, GSMLIB, PGGP001, PGGP017, PGSM018, PGSM136;

{$R *.DFM}

procedure Tfrm_pe_prepara.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
     if Sender = msk_nr_processo then btn_nr_processoClick(nil);
     if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_pe_prepara.btn_nr_processoClick(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);

  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := '02';
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text  := Copy(frm_consulta_processo.Nr_Processo, 5, 14);
    msk_nr_processoExit(nil);
  end;

end;


procedure Tfrm_pe_prepara.msk_nr_processoExit(Sender: TObject);
begin
  btn_preparar.Enabled := False;
  mi_preparar.Enabled  := False;

{ if (msk_nr_processo.Text = '') then
  begin
    BoxMensagem( 'Necessário informar o PE para preparação do Processo de Exportação !!', 2 );
    msk_nr_processo.setfocus;
    Exit;
  end;
}
  with datm_pe_prepara do
  begin

    if msk_nr_processo.Text <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if Trim(qry_processo_NR_PROCESSO.AsString) = '' then
      begin
        qry_processo_.Close;
        MessageDlg('Processo não encontrado. Digite novamente.', mtError, [mbOk], 0);
        msk_nr_processo.SetFocus;
        Exit
      end;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;

      qry_pe_.Close;
      qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe_prepara.msk_cd_unid_neg.Text;
      qry_pe_.Prepare;
      qry_pe_.Open;

      qry_pe_itens_.Close;
      qry_pe_itens_.ParamByName('CD_UNID_NEG').AsString := frm_pe_prepara.msk_cd_unid_neg.Text;
      qry_pe_itens_.Prepare;
      qry_pe_itens_.Open;

      dbctrlgrd_pe.DataSource       := datm_pe_prepara.ds_pe;
      dbctrlgrd_pe_itens.DataSource := datm_pe_prepara.ds_pe_itens;
      dbedt_nr_item.DataSource      := datm_pe_prepara.ds_pe_itens;
      dbedt_qt_inicial.DataSource   := datm_pe_prepara.ds_pe_itens;
      dbedt_qt_disponivel.DataSource:= datm_pe_prepara.ds_pe_itens;
      dbedt_qt_baixada.DataSource   := datm_pe_prepara.ds_pe_itens;

      if Not (qry_pe_.EOF) then
      begin
        dbctrlgrd_pe.Enabled             := True;
        dbctrlgrd_pe.SelectedColor       := clTeal;
        dbctrlgrd_pe_itens.Enabled       := True;
        dbctrlgrd_pe_itens.SelectedColor := clTeal;
        msk_nr_pe.SetFocus;
      end
      else
      begin
        dbctrlgrd_pe.Enabled             := False;
        dbctrlgrd_pe.SelectedColor       := clMenu;
        dbctrlgrd_pe_itens.Enabled       := False;
        dbctrlgrd_pe_itens.SelectedColor := clMenu;
        dbchkbx_sel_pe.Checked := False;
        dbchkbx_sel_itens.Checked := False;
        msk_nr_processo.SetFocus;
      end;
    end;
    qry_processo_.Close;
  end;

end;


procedure Tfrm_pe_prepara.FormShow(Sender: TObject);
begin

  dbchkbx_sel_pe.Checked := False;
  dbchkbx_sel_itens.Checked := False;

  btn_preparar.Enabled             := False;
  mi_preparar.Enabled              := False;
  dbctrlgrd_pe.Enabled             := False;
  dbctrlgrd_pe.SelectedColor       := clMenu;
  dbctrlgrd_pe_itens.Enabled       := False;
  dbctrlgrd_pe_itens.SelectedColor := clMenu;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_nr_processo.SetFocus;
  msk_cd_unid_negExit(sender);

end;

procedure Tfrm_pe_prepara.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_pe_prepara, datm_pe_prepara );

end;

procedure Tfrm_pe_prepara.btn_sairClick(Sender: TObject);
begin

  with datm_pe_prepara do
  begin
    qry_prep_item_.Close;
    qry_prep_item_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_prep_item_.Prepare;
    qry_prep_item_.Open;

    If Trim(qry_prep_item_NR_PROCESSO.AsString) <> '' then
    begin
      sp_pe_exclui_prep.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      sp_pe_exclui_prep.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      ExecStoredProc(datm_pe_prepara.sp_pe_exclui_prep);
      CloseStoredProc(datm_pe_prepara.sp_pe_exclui_prep);
    end;

    sp_pe_desmarca.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ExecStoredProc(sp_pe_desmarca);
    CloseStoredProc(sp_pe_desmarca);
  end;

  Close;
end;

procedure Tfrm_pe_prepara.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  btn_sairClick(nil);

  with datm_pe_prepara do
  begin
    qry_pe_.Close;
    qry_pe_itens_.Close;
    qry_via_transporte_.Close;

    Free;
  end;
  Action := caFree

end;

procedure Tfrm_pe_prepara.dbchkbx_sel_peClick(Sender: TObject);
var
  cFlag : String[1];

begin
  if (datm_pe_prepara.qry_pe_.State in [dsInsert, dsEdit]) then
  begin
    if dbchkbx_sel_pe.Checked = True then
       cFlag := '1'
    else
       cFlag := '0';

    with datm_pe_prepara do
    begin
      try
        datm_main.db_broker.StartTransaction;

        qry_pe_IN_SELECIONADO.AsString := cFlag;

        CloseStoredProc(sp_pe_marca_item);
        sp_pe_marca_item.ParamByName('@NR_PROCESSO').AsString := qry_pe_NR_PROCESSO.AsString;
        sp_pe_marca_item.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        sp_pe_marca_item.ParamByName('@IN_SELECIONADO').AsString := cFlag;
        ExecStoredProc(sp_pe_marca_item);
        CloseStoredProc(sp_pe_marca_item);

        datm_main.db_broker.Commit;

      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      qry_pe_itens_.Close;
      qry_pe_itens_.ParamByName('CD_UNID_NEG').AsString := frm_pe_prepara.msk_cd_unid_neg.Text;
      qry_pe_itens_.Prepare;
      qry_pe_itens_.Open;
    end;
    btn_preparar.Enabled := True;
    mi_preparar.Enabled  := True;
  end;

end;

procedure Tfrm_pe_prepara.dbchkbx_sel_itensClick(Sender: TObject);
begin
  If datm_pe_prepara.qry_pe_itens_.State in [dsInsert, dsEdit] then
  begin

    If datm_pe_prepara.qry_pe_itens_NR_ITEM.AsString = '' then
    begin
      dbchkbx_sel_itens.Checked := False;
      exit;
    end;

    if dbchkbx_sel_itens.Checked = True then
       datm_pe_prepara.qry_pe_itens_IN_SELECIONADO.AsString := '1'
    else
       datm_pe_prepara.qry_pe_itens_IN_SELECIONADO.AsString := '0';

    btn_preparar.Enabled := True;
    mi_preparar.Enabled  := True;
  end;
end;

procedure Tfrm_pe_prepara.DBText6DblClick(Sender: TObject);
begin
  If datm_pe_prepara.qry_pe_itens_NR_PROCESSO.AsString = '' then
  begin
     BoxMensagem( 'Item baixado ou não existente !!', 2 );
     exit;
  end;

  If dbchkbx_sel_itens.Checked = False then
     dbchkbx_sel_itens.Checked := True;

  If datm_pe_prepara.qry_pe_itens_CalcQTDisp.ASFloat = 0 then
  begin
     BoxMensagem( 'Não é possível baixar o item. Quantidade Disponível está zerada !!', 2 );
     exit;
  end;

  dbctrlgrd_pe.Enabled       := False;
  dbctrlgrd_pe_itens.Enabled := False;

  btn_preparar.Enabled       := False;
  mi_preparar.Enabled        := False;
  btn_salvar.Enabled         := True;
  mi_salvar.Enabled          := True;
  btn_cancelar.Enabled       := True;
  mi_cancelar.Enabled        := True;

  msk_qt_baixar.ReadOnly     := False;
  msk_dt_baixa.ReadOnly      := False;

  datm_pe_prepara.qry_verif_item_.Close;
  datm_pe_prepara.qry_verif_item_.ParamByName('NR_PROCESSO').AsString := datm_pe_prepara.qry_pe_itens_NR_PROCESSO.AsString;    // Old -> PROC_OLD
  datm_pe_prepara.qry_verif_item_.ParamByName('NR_ITEM').AsString     := datm_pe_prepara.qry_pe_itens_NR_ITEM.AsString;        // Old -> ITEM_OLD
  datm_pe_prepara.qry_verif_item_.ParamByName('NR_PROC').AsString     := str_nr_processo;    // PROCESSO EXP
  datm_pe_prepara.qry_verif_item_.Prepare;
  datm_pe_prepara.qry_verif_item_.Open;

  If Trim(datm_pe_prepara.qry_verif_item_NR_PROCESSO.AsString) = '' then
  begin
    msk_dt_baixa.Text := DateToStr( Date );
    msk_qt_baixar.Text := FormatFloat('###,###,##0.00', StrToFloat( '0,00' ) );
  end
  else
  begin
    msk_dt_baixa.Text  := DateToStr( datm_pe_prepara.qry_verif_item_DT_BAIXA.AsDateTime );
    msk_qt_baixar.Text := FormatFloat( '###,###,##0.00', datm_pe_prepara.qry_verif_item_QT_BAIXADA.AsFloat );
  end;
  msk_qt_baixar.SetFocus;

  datm_pe_prepara.qry_verif_item_.Close;

end;


procedure Tfrm_pe_prepara.btn_cancelarClick(Sender: TObject);
begin
  dbctrlgrd_pe.Enabled             := True;
  dbctrlgrd_pe_itens.Enabled       := True;

  btn_preparar.Enabled             := True;
  mi_preparar.Enabled              := True;
  btn_salvar.Enabled               := False;
  mi_salvar.Enabled                := False;
  btn_cancelar.Enabled             := False;
  mi_cancelar.Enabled              := False;

  msk_qt_baixar.Text               := '';
  msk_dt_baixa.Text                := '';

  msk_qt_baixar.ReadOnly           := True;
  msk_dt_baixa.ReadOnly            := True;

  dbctrlgrd_pe_itens.SetFocus;
end;

procedure Tfrm_pe_prepara.msk_qt_baixarExit(Sender: TObject);
begin

  If Trim( msk_qt_baixar.Text ) = '' then
     msk_qt_baixar.Text := '0';

  msk_qt_baixar.Text := FormatFloat('###,###,##0.00', StrToFloat( msk_qt_baixar.Text ) );

  If msk_qt_baixar.Text = '0,00' then
     msk_qt_baixar.Text := ''

end;

procedure Tfrm_pe_prepara.btn_salvarClick(Sender: TObject);
var
  nNum, nNum2, Code  : Integer;
  cProcesso   : String[18];
  nQtdeBx     : Double;
  lNaoExiste  : Boolean;

begin
  ActiveControl := nil;
  lNaoExiste := True;
  dbctrlgrd_pe.Enabled             := True;
  dbctrlgrd_pe_itens.Enabled       := True;

  datm_pe_prepara.qry_prep_pe_.Close;
  datm_pe_prepara.qry_prep_pe_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_pe_prepara.qry_prep_pe_.Prepare;
  datm_pe_prepara.qry_prep_pe_.Open;

  If Trim(datm_pe_prepara.qry_prep_pe_NR_PROCESSO.AsString) = '' then
  begin
    datm_pe_prepara.qry_pe_selec_.Close;
    datm_pe_prepara.qry_pe_selec_.ParamByName('CD_UNID_NEG').AsString := frm_pe_prepara.msk_cd_unid_neg.Text;
    datm_pe_prepara.qry_pe_selec_.Prepare;
    datm_pe_prepara.qry_pe_selec_.Open;

    If not (dbchkbx_sel_pe.Checked = True) then
    begin
       If (datm_pe_prepara.qry_pe_selec_.RecordCount = 0) then
       begin
         BoxMensagem( 'Necessário marcar um Processo para Capa !!', 2 );
         dbctrlgrd_pe.SetFocus;
         exit;
       end;
    end
    else
    begin

      // Incluir processo na capa
      with datm_pe_prepara do
      begin
        qry_pe_selec_.First;

        try
          datm_main.db_broker.StartTransaction;

          cProcesso := Trim(qry_pe_selec_NR_PROCESSO.AsString);
          If cProcesso = '' then
             cProcesso := qry_pe_NR_PROCESSO.AsString;

          CloseStoredProc(sp_pe_prep_inc_proc);
          sp_pe_prep_inc_proc.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_pe_prep_inc_proc.ParamByName('@NR_PROC_OLD').AsString := cProcesso;
          ExecStoredProc(sp_pe_prep_inc_proc);
          CloseStoredProc(sp_pe_prep_inc_proc);

          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end;
    end;
  end;

  // Incluir item no tprepara_item
  with datm_pe_prepara do
  begin
    qry_pe_valor_.Close;
    qry_pe_valor_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_pe_valor_.Prepare;
    qry_pe_valor_.Open;

    Val( qry_pe_valor_QT_TOTAL_ITEM.AsString, nNum2, Code );
    qry_pe_valor_.Close;

    qry_verif_item_.Close;
    qry_verif_item_.ParamByName('NR_PROCESSO').AsString := qry_pe_itens_NR_PROCESSO.AsString;    // Old -> PROC_OLD
    qry_verif_item_.ParamByName('NR_ITEM').AsString     := qry_pe_itens_NR_ITEM.AsString;        // Old -> ITEM_OLD
    qry_verif_item_.ParamByName('NR_PROC').AsString     := str_nr_processo;    // PROCESSO EXP
    qry_verif_item_.Prepare;
    qry_verif_item_.Open;

    Val( msk_qt_baixar.Text, nNum, Code );
    If Trim(qry_verif_item_NR_PROCESSO.AsString) = '' then
    begin
      If nNum > qry_pe_itens_CalcQTDisp.AsFloat then
      begin
        BoxMensagem( 'Quantidade a baixar maior do que a quantidade disponível !!', 2 );
        msk_qt_baixar.SetFocus;
        exit;
      end;
    end
    else
    begin
      nQtdeBx := (qry_pe_itens_CalcQTDisp.AsFloat + qry_verif_item_QT_BAIXADA.AsFloat) - nNum;
      If nQtdeBx > datm_pe_prepara.qry_pe_itens_QT_MERCADORIA.AsFloat then
      begin
        BoxMensagem( 'Quantidade a baixar maior do que a quantidade disponível !!', 2 );
        msk_qt_baixar.SetFocus;
        exit;
      end;
    end;

    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_pe_prep_inc_item);
      If Trim(qry_verif_item_NR_PROCESSO.AsString) = '' then  // Nao existe no TPREPARA_ITEM
      begin
        sp_pe_prep_inc_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        sp_pe_prep_inc_item.ParamByName('@NR_ITEM').AsString     := StrZero( nNum2 + 1, 3 );
        sp_pe_prep_inc_item.ParamByName('@NR_PROC_OLD').AsString := qry_pe_itens_NR_PROCESSO.AsString;
        sp_pe_prep_inc_item.ParamByName('@NR_ITEM_OLD').AsString := qry_pe_itens_NR_ITEM.AsString;
        lNaoExiste := True;
      end
      else
      begin       // Caso ja exista o item incluso
        sp_pe_prep_inc_item.ParamByName('@NR_PROCESSO').AsString := qry_pe_itens_NR_PROCESSO.AsString;
        sp_pe_prep_inc_item.ParamByName('@NR_ITEM').AsString     := qry_pe_itens_NR_ITEM.AsString;
        lNaoExiste := False;
      end;
      sp_pe_prep_inc_item.ParamByName('@QT_BAIXAR').AsFloat    := StrToFloat(msk_qt_baixar.Text);
      sp_pe_prep_inc_item.ParamByName('@DT_BAIXA').AsDateTime  := StrToDate(msk_dt_baixa.Text);

      ExecStoredProc(sp_pe_prep_inc_item);
      CloseStoredProc(sp_pe_prep_inc_item);

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    qry_verif_item_.Close;

  end;

  Verifica_Valores( lNaoExiste );

  btn_preparar.Enabled   := True;
  mi_preparar.Enabled    := True;
  btn_salvar.Enabled     := False;
  mi_salvar.Enabled      := False;
  btn_cancelar.Enabled   := False;
  mi_cancelar.Enabled    := False;

  msk_qt_baixar.Text     := '';
  msk_dt_baixa.Text      := '';

  msk_qt_baixar.ReadOnly := True;
  msk_dt_baixa.ReadOnly  := True;

  dbctrlgrd_pe_itens.SetFocus;
end;

procedure Tfrm_pe_prepara.Verifica_Valores( lVerifica : Boolean );
begin
  datm_pe_prepara.qry_pe_itens_.Edit;

  if Not (lVerifica) then    // Item ja existente
  begin
    If datm_pe_prepara.qry_pe_itens_QT_DISPONIVEL.AsFloat > 0 then
    begin
      datm_pe_prepara.qry_pe_itens_QT_DISPONIVEL.AsFloat := (datm_pe_prepara.qry_pe_itens_QT_DISPONIVEL.AsFloat +
                                                             datm_pe_prepara.qry_pe_itens_QT_BAIXAR.AsFloat) -
                                                             StrToFloat( msk_qt_baixar.Text );
      datm_pe_prepara.qry_pe_itens_QT_BAIXAR.AsFloat := StrToFloat( msk_qt_baixar.Text );
    end
    Else
    begin
      datm_pe_prepara.qry_pe_itens_QT_BAIXAR.AsFloat := StrToFloat( msk_qt_baixar.Text );
      datm_pe_prepara.qry_pe_itens_QT_DISPONIVEL.AsFloat := datm_pe_prepara.qry_pe_itens_QT_MERCADORIA.AsFloat -
                                                            StrToFloat( msk_qt_baixar.Text );
    end;
  end
  else
    datm_pe_prepara.qry_pe_itens_QT_BAIXAR.AsFloat := StrToFloat( msk_qt_baixar.Text );

  datm_pe_prepara.qry_pe_itens_.Post;

  datm_pe_prepara.qry_pe_itens_.Close;
  datm_pe_prepara.qry_pe_itens_.Prepare;
  datm_pe_prepara.qry_pe_itens_.Open;

end;



procedure Tfrm_pe_prepara.btn_prepararClick(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;

  with datm_pe_prepara do
  begin
    qry_muda_.Close;
    qry_muda_.SQL.Clear;
    qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TPE WHERE IN_SELECIONADO = "1" AND CD_UNID_NEG="' + msk_cd_unid_neg.Text + '"' );
    qry_muda_.Prepare;
    qry_muda_.Open;

    if dbchkbx_sel_pe.Checked = False then
    begin
      if qry_muda_.EOF then
      begin
        qry_muda_.SQL.Clear;
        qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TPROCESSO_EXP WHERE NR_PROCESSO = "' + str_nr_processo + '"' );
        qry_muda_.Prepare;
        qry_muda_.Open;
        if qry_muda_.EOF then
        begin
          BoxMensagem( 'Necessário marcar um Processo para Preparação do Embarque !!', 3 );
          dbctrlgrd_pe.SetFocus;
          btn_preparar.Enabled := False;
          mi_preparar.Enabled  := False;
          Exit;
        end;
      end;
    end
    else
    begin
      qry_muda_.SQL.Clear;
      qry_muda_.SQL.Add( 'EXEC sp_pe_marca_proc "' + qry_pe_NR_PROCESSO.AsString + '","' + msk_cd_unid_neg.Text + '"' );
      qry_muda_.ExecSQL;
    end;

    qry_muda_.Close;
    qry_muda_.SQL.Clear;
    qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TPE_ITEM ' );
    qry_muda_.SQL.Add( 'WHERE (IN_SELECIONADO = "1") AND (QT_BAIXADA <> QT_MERCADORIA) AND (CD_UNID_NEG="' + msk_cd_unid_neg.Text + '")' );
    qry_muda_.Prepare;
    qry_muda_.Open;

    if qry_muda_.EOF then
    begin
       BoxMensagem( 'Necessário marcar um Item para Preparação do Embarque !!', 3 );
       dbctrlgrd_pe_itens.SetFocus;
       btn_preparar.Enabled := False;
       mi_preparar.Enabled  := False;
       Exit;
    end;

    qry_pe_.Close;
    qry_pe_itens_.Close;

    try
      datm_main.db_broker.StartTransaction;

      // Monta para arquivo de EXP
      qry_muda_.SQL.Clear;
      qry_muda_.SQL.Add('EXEC sp_pe_monta_exp "' + str_nr_processo + '","' + msk_cd_unid_neg.Text + '"' );

      qry_muda_.ExecSQL;
      qry_muda_.Close;

      Screen.Cursor := crArrow;

      BoxMensagem( 'Montagem Realizada com Sucesso !!', 3 );

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  msk_nr_processo.Text := '';
  msk_nr_processo.SetFocus;
  btn_preparar.Enabled := False;
  mi_preparar.Enabled  := False;

  dbctrlgrd_pe.Enabled             := False;
  dbctrlgrd_pe.SelectedColor       := clMenu;
  dbctrlgrd_pe_itens.Enabled       := False;
  dbctrlgrd_pe_itens.SelectedColor := clMenu;

  with datm_pe_prepara do
  begin
    qry_prep_item_.Close;
    qry_prep_item_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_prep_item_.Prepare;
    qry_prep_item_.Open;

    If Trim(qry_prep_item_NR_PROCESSO.AsString) <> '' then
    begin
      sp_pe_exclui_prep.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      sp_pe_exclui_prep.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      ExecStoredProc(datm_pe_prepara.sp_pe_exclui_prep);
      CloseStoredProc(datm_pe_prepara.sp_pe_exclui_prep);
    end;

    sp_pe_desmarca.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ExecStoredProc(sp_pe_desmarca);
    CloseStoredProc(sp_pe_desmarca);

    qry_prep_item_.Close;
  end;

  Screen.Cursor := crArrow;
    
end;





procedure Tfrm_pe_prepara.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then btn_sairClick(nil);

end;

procedure Tfrm_pe_prepara.btn_cd_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_unidade.Cons_OnLine_Texto := msk_cd_unid_neg.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(Sender);
  end;
end;

procedure Tfrm_pe_prepara.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  With datm_pe_prepara Do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    If qry_unid_neg_.EOF then
    begin
      edt_nm_unid_neg.clear;
      BoxMensagem('Unidade não habilitada/ativa!', 2);
      msk_cd_unid_neg.SetFocus;
    end
    else
    begin
      edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;
      msk_nr_processo.SetFocus;
    end;
    qry_unid_neg_.Close;
    qry_processo_.Close;

    if ( msk_cd_unid_neg.Text <> '' ) then
    begin
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' +
         msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
    end;
  end;

end;




procedure Tfrm_pe_prepara.msk_nr_peChange(Sender: TObject);
begin
  try
    datm_pe_prepara.qry_pe_.Locate('NR_PROCESSO', msk_nr_pe.Text, [loPartialKey, loCaseInsensitive] );
  except
  end;
end;

end.





