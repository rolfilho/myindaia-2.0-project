unit PGPO014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCGrids, ExtCtrls, Buttons, Mask, DBCtrls, Db;
type
  Tfrm_po_prepara = class(TForm)
    dbctrlgrd_po: TDBCtrlGrid;
    dbctrlgrd_po_itens: TDBCtrlGrid;
    Label3: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    lbl_ncm: TLabel;
    Label15: TLabel;
    lbl_nec_LI: TLabel;
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
    rdgrp_prep_embarque: TRadioGroup;
    btn_prepara: TSpeedButton;
    dbchkbx_sel_po: TDBCheckBox;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    dbchkbx_sel_itens: TDBCheckBox;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBCheckBox3: TDBCheckBox;
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
    dbtxt_nr_processo: TDBText;
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbchkbx_sel_poClick(Sender: TObject);
    procedure dbchkbx_sel_itensClick(Sender: TObject);
    procedure DBText6DblClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure msk_qt_baixarExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_preparaClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Verifica_Valores( lVerifica : Boolean );

  public
    { Public declarations }
  end;

var
  frm_po_prepara: Tfrm_po_prepara;

implementation

uses PGGP015, PGPO004, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_po_prepara.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo then btn_nr_processoClick(nil);
  end;
end;

procedure Tfrm_po_prepara.btn_nr_processoClick(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);

  datm_po_prepara.qry_ret_unid_neg_.Close;
  datm_po_prepara.qry_ret_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  datm_po_prepara.qry_ret_unid_neg_.Prepare;
  datm_po_prepara.qry_ret_unid_neg_.Open;

  If datm_po_prepara.qry_ret_unid_neg_.RecordCount = 1 then
     frm_consulta_processo.str_cd_unid := datm_po_prepara.qry_ret_unid_neg_CD_UNID_NEG.AsString
  else
     frm_consulta_processo.str_cd_unid := '';

  frm_consulta_processo.str_cd_prod := '01';
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text  := Copy(frm_consulta_processo.Nr_Processo, 5, 14);
    msk_nr_processoExit(nil);
  end;

end;


procedure Tfrm_po_prepara.msk_nr_processoExit(Sender: TObject);
begin
  btn_prepara.Enabled := False;

  if (msk_nr_processo.Text = '') then
  begin
    BoxMensagem( 'Necessário informar o Processo para preparação da LI / DI !!', 2 );
    msk_nr_processo.setfocus;
    Exit;
  end;

  with datm_po_prepara do
  begin

    if msk_nr_processo.Text <> '' then
    begin
      qry_ret_unid_neg_.Close;
      qry_ret_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_ret_unid_neg_.Prepare;
      qry_ret_unid_neg_.Open;

      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := qry_ret_unid_neg_CD_UNID_NEG.AsString +
                                                           str_cd_produto + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        qry_processo_.Close;
        MessageDlg('Processo não encontrado. Digite novamente.', mtError, [mbOk], 0);
        msk_nr_processo.Setfocus;
        Exit
      end;

      dbctrlgrd_po.DataSource       := datm_po_prepara.ds_po;
      dbctrlgrd_po_itens.DataSource := datm_po_prepara.ds_po_itens;
      dbedt_nr_item.DataSource      := datm_po_prepara.ds_po_itens;
      dbedt_qt_inicial.DataSource   := datm_po_prepara.ds_po_itens;
      dbedt_qt_disponivel.DataSource:= datm_po_prepara.ds_po_itens;
      dbedt_qt_baixada.DataSource   := datm_po_prepara.ds_po_itens;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;

      if Trim( qry_po_NR_PROCESSO.AsString ) <> '' then
      begin
        dbctrlgrd_po.Enabled             := True;
        dbctrlgrd_po.SelectedColor       := clTeal;
        dbctrlgrd_po_itens.Enabled       := True;
        dbctrlgrd_po_itens.SelectedColor := clTeal;
        dbctrlgrd_po.SetFocus;
      end
      else
      begin
        dbctrlgrd_po.Enabled             := False;
        dbctrlgrd_po.SelectedColor       := clMenu;
        dbctrlgrd_po_itens.Enabled       := False;
        dbctrlgrd_po_itens.SelectedColor := clMenu;
        dbchkbx_sel_po.Checked := False;
        dbchkbx_sel_itens.Checked := False;
        msk_nr_processo.SetFocus;
      end;
    end;
    qry_processo_.Close;
  end;

end;


procedure Tfrm_po_prepara.FormShow(Sender: TObject);
begin

  dbchkbx_sel_po.Checked := False;
  dbchkbx_sel_itens.Checked := False;

  with datm_po_prepara do
  begin
    qry_po_.Close;
    qry_po_.Prepare;
    qry_po_.Open;

    qry_po_itens_.Close;
    qry_po_itens_.Prepare;
    qry_po_itens_.Open;
  end;

  rdgrp_prep_embarque.ItemIndex := 1;
  btn_prepara.Enabled        := False;
  dbctrlgrd_po.Enabled       := False;
  dbctrlgrd_po.SelectedColor := clMenu;
  dbctrlgrd_po_itens.Enabled       := False;
  dbctrlgrd_po_itens.SelectedColor := clMenu;

  msk_nr_processo.SetFocus;
end;

procedure Tfrm_po_prepara.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_po_prepara, datm_po_prepara );

end;

procedure Tfrm_po_prepara.btn_sairClick(Sender: TObject);
begin

  with datm_po_prepara do
  begin
    qry_prep_item_.Close;
    qry_prep_item_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_prep_item_.Prepare;
    qry_prep_item_.Open;

    If qry_prep_item_.RecordCount > 0 then
    begin
      sp_po_exclui_prep.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      ExecStoredProc(datm_po_prepara.sp_po_exclui_prep);
      CloseStoredProc(datm_po_prepara.sp_po_exclui_prep);
    end;

    ExecStoredProc(sp_po_desmarca);
    CloseStoredProc(sp_po_desmarca);
  end;

  Close;
end;

procedure Tfrm_po_prepara.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  btn_sairClick(nil);

  with datm_po_prepara do
  begin
    qry_po_.Close;
    qry_po_itens_.Close;
    qry_via_transporte_.Close;

    Free;
  end;
  Action := caFree

end;

procedure Tfrm_po_prepara.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure Tfrm_po_prepara.dbchkbx_sel_poClick(Sender: TObject);
var
  cFlag : String[1];

begin
  If (datm_po_prepara.qry_po_.State in [dsInsert, dsEdit]) then
  begin
    If dbchkbx_sel_po.Checked = True then
       cFlag := '1'
    else
       cFlag := '0';

    with datm_po_prepara do
    begin
      try
        datm_main.db_broker.StartTransaction;

        qry_po_IN_SELECIONADO.AsString := cFlag;

        CloseStoredProc(sp_po_marca_item);
        sp_po_marca_item.ParamByName('@NR_PROCESSO').AsString := qry_po_NR_PROCESSO.AsString;
        sp_po_marca_item.ParamByName('@IN_SELECIONADO').AsString := cFlag;
        ExecStoredProc(sp_po_marca_item);
        CloseStoredProc(sp_po_marca_item);

        datm_main.db_broker.Commit;

      except
        on E: Exception do
        begin
          TrataErro(E);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        end;
      end;

      qry_po_itens_.Close;
      qry_po_itens_.Prepare;
      qry_po_itens_.Open;
    end;
    btn_prepara.Enabled := True;
  end;

end;

procedure Tfrm_po_prepara.dbchkbx_sel_itensClick(Sender: TObject);
begin
  If datm_po_prepara.qry_po_itens_.State in [dsInsert, dsEdit] then
  begin

    If datm_po_prepara.qry_po_itens_NR_ITEM.AsString = '' then
    begin
      dbchkbx_sel_itens.Checked := False;
      exit;
    end;

    If dbchkbx_sel_itens.Checked = True then
       datm_po_prepara.qry_po_itens_IN_SELECIONADO.AsString := '1'
    else
       datm_po_prepara.qry_po_itens_IN_SELECIONADO.AsString := '0';

    btn_prepara.Enabled := True;
  end;
end;

procedure Tfrm_po_prepara.DBText6DblClick(Sender: TObject);
begin
  If datm_po_prepara.qry_po_itens_NR_PROCESSO.AsString = '' then
  begin
     BoxMensagem( 'Item baixado ou não existente !!', 2 );
     exit;
  end;

  If dbchkbx_sel_itens.Checked = False then
     dbchkbx_sel_itens.Checked := True;

  If datm_po_prepara.qry_po_itens_CalcQTDisp.ASFloat = 0 then
  begin
     BoxMensagem( 'Não é possível baixar o item. Quantidade Disponível está zerada !!', 2 );
     exit;
  end;

  dbctrlgrd_po.Enabled       := False;
  dbctrlgrd_po_itens.Enabled := False;

  btn_prepara.Enabled := False;
  btn_salvar.Enabled := True;
  btn_cancelar.Enabled := True;

  msk_qt_baixar.ReadOnly := False;
  msk_dt_baixa.ReadOnly := False;

  datm_po_prepara.qry_verif_item_.Close;
  datm_po_prepara.qry_verif_item_.ParamByName('NR_PROCESSO').AsString := datm_po_prepara.qry_po_itens_NR_PROCESSO.AsString;    // Old -> PROC_OLD
  datm_po_prepara.qry_verif_item_.ParamByName('NR_ITEM').AsString     := datm_po_prepara.qry_po_itens_NR_ITEM.AsString;        // Old -> ITEM_OLD
  datm_po_prepara.qry_verif_item_.Prepare;
  datm_po_prepara.qry_verif_item_.Open;

  If datm_po_prepara.qry_verif_item_.RecordCount = 0 then
  begin
    msk_dt_baixa.Text := DateToStr( Date );
    msk_qt_baixar.Text := FormatFloat('###,###,##0.000', StrToFloat( '0,000' ) );
  end
  else
  begin
    msk_dt_baixa.Text  := DateToStr( datm_po_prepara.qry_verif_item_DT_BAIXA.AsDateTime );
    msk_qt_baixar.Text := FormatFloat( '###,###,##0.000', datm_po_prepara.qry_verif_item_QT_BAIXADA.AsFloat );
  end;
  msk_qt_baixar.SetFocus;

  datm_po_prepara.qry_verif_item_.Close;

end;


procedure Tfrm_po_prepara.btn_cancelarClick(Sender: TObject);
begin
  dbctrlgrd_po.Enabled             := True;
  dbctrlgrd_po_itens.Enabled       := True;

  btn_prepara.Enabled := True;
  btn_salvar.Enabled := False;
  btn_cancelar.Enabled := False;

  msk_qt_baixar.Text := '';
  msk_dt_baixa.Text := '';

  msk_qt_baixar.ReadOnly := True;
  msk_dt_baixa.ReadOnly := True;

  dbctrlgrd_po_itens.SetFocus;
end;

procedure Tfrm_po_prepara.msk_qt_baixarExit(Sender: TObject);
begin

  If Trim( msk_qt_baixar.Text ) = '' then
     msk_qt_baixar.Text := '0';

  msk_qt_baixar.Text := FormatFloat('###,###,##0.000', StrToFloat( msk_qt_baixar.Text ) );

  If msk_qt_baixar.Text = '0,000' then
     msk_qt_baixar.Text := ''

end;

procedure Tfrm_po_prepara.btn_salvarClick(Sender: TObject);
var
  nNum, nNum2, Code  : Integer;
  lPossui_NVE : Boolean;
  cProcesso   : String[18];
  nQtdeBx     : Double;

begin

  dbctrlgrd_po.Enabled             := True;
  dbctrlgrd_po_itens.Enabled       := True;

  datm_po_prepara.qry_prep_po_.Close;
  datm_po_prepara.qry_prep_po_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_po_prepara.qry_prep_po_.Prepare;
  datm_po_prepara.qry_prep_po_.Open;

  If datm_po_prepara.qry_prep_po_.RecordCount = 0 then
  begin
    datm_po_prepara.qry_po_selec_.Close;
    datm_po_prepara.qry_po_selec_.Prepare;
    datm_po_prepara.qry_po_selec_.Open;

    If not (dbchkbx_sel_po.Checked = True) then
    begin
       If (datm_po_prepara.qry_po_selec_.RecordCount = 0) then
       begin
         BoxMensagem( 'Necessário marcar um Processo para Capa !!', 2 );
         dbctrlgrd_po.SetFocus;
         exit;
       end;
    end
    else
    begin

      // Incluir processo na capa
      with datm_po_prepara do
      begin
        qry_po_selec_.First;

        try
          datm_main.db_broker.StartTransaction;

          cProcesso := Trim(qry_po_selec_NR_PROCESSO.AsString);
          If cProcesso = '' then
             cProcesso := qry_po_NR_PROCESSO.AsString;

          CloseStoredProc(sp_po_prep_inc_proc);
          sp_po_prep_inc_proc.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_po_prep_inc_proc.ParamByName('@NR_PROC_OLD').AsString := cProcesso;
          ExecStoredProc(sp_po_prep_inc_proc);
          CloseStoredProc(sp_po_prep_inc_proc);

          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            TrataErro(E);
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          end;
        end;
      end;
    end;
  end;

  // Incluir item no tprepara_item
  lPossui_NVE := True;

  with datm_po_prepara do
  begin
    qry_po_valor_.Close;
    qry_po_valor_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_po_valor_.Prepare;
    qry_po_valor_.Open;

    Val( qry_po_valor_QT_TOTAL_ITEM.AsString, nNum2, Code );
    qry_po_valor_.Close;

    qry_verif_item_.Close;
    qry_verif_item_.ParamByName('NR_PROCESSO').AsString := qry_po_itens_NR_PROCESSO.AsString;    // Old -> PROC_OLD
    qry_verif_item_.ParamByName('NR_ITEM').AsString     := qry_po_itens_NR_ITEM.AsString;        // Old -> ITEM_OLD
    qry_verif_item_.Prepare;
    qry_verif_item_.Open;

    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_po_prep_inc_item);

      Val( msk_qt_baixar.Text, nNum, Code );
      If qry_verif_item_.RecordCount = 0 then
      begin
        If nNum > qry_po_itens_CalcQTDisp.AsFloat then
        begin
          BoxMensagem( 'Quantidade a baixar maior do que a quantidade disponível !!', 2 );
          msk_qt_baixar.SetFocus;
          exit;
        end;
      end
      else
      begin
        nQtdeBx := (qry_po_itens_CalcQTDisp.AsFloat + qry_verif_item_QT_BAIXADA.AsFloat) - nNum;
        If nQtdeBx > datm_po_prepara.qry_po_itens_QT_INICIAL.AsFloat then
        begin
          BoxMensagem( 'Quantidade a baixar maior do que a quantidade disponível !!', 2 );
          msk_qt_baixar.SetFocus;
          exit;
        end;
      end;

      If qry_verif_item_.RecordCount = 0 then  // Nao existe no TPREPARA_ITEM
      begin
        sp_po_prep_inc_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        sp_po_prep_inc_item.ParamByName('@NR_ITEM').AsString     := StrZero( nNum2 + 1, 3 );
        sp_po_prep_inc_item.ParamByName('@NR_PROC_OLD').AsString := qry_po_itens_NR_PROCESSO.AsString;
        sp_po_prep_inc_item.ParamByName('@NR_ITEM_OLD').AsString := qry_po_itens_NR_ITEM.AsString;
        sp_po_prep_inc_item.ParamByName('@TIPO').AsString        := '1';
        lPossui_NVE := True;
      end
      else
      begin                                    // Caso ja exista o item incluso
        sp_po_prep_inc_item.ParamByName('@NR_PROCESSO').AsString := qry_po_itens_NR_PROCESSO.AsString;
        sp_po_prep_inc_item.ParamByName('@NR_ITEM').AsString     := qry_po_itens_NR_ITEM.AsString;
        sp_po_prep_inc_item.ParamByName('@TIPO').AsString        := '2';
        lPossui_NVE := False;
      end;
      sp_po_prep_inc_item.ParamByName('@QT_BAIXAR').AsFloat    := StrToFloat(msk_qt_baixar.Text);
      sp_po_prep_inc_item.ParamByName('@DT_BAIXA').AsDateTime  := StrToDate(msk_dt_baixa.Text);

      ExecStoredProc(sp_po_prep_inc_item);
      CloseStoredProc(sp_po_prep_inc_item);

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;

    qry_verif_item_.Close;

  end;

  // Incluir NVE no tprepara_nve
  If lPossui_NVE = True then
  begin
    with datm_po_prepara do
    begin

      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc(sp_po_prep_inc_nve);
        sp_po_prep_inc_nve.ParamByName('@NR_PROCESSO').AsString := qry_po_itens_NR_PROCESSO.AsString;
        sp_po_prep_inc_nve.ParamByName('@NR_ITEM').AsString     := qry_po_itens_NR_ITEM.AsString;
        ExecStoredProc(sp_po_prep_inc_nve);
        CloseStoredProc(sp_po_prep_inc_nve);

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          TrataErro(E);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        end;
      end;
    end;
  end;

  Verifica_Valores( lPossui_NVE );

  btn_prepara.Enabled := True;
  btn_salvar.Enabled := False;
  btn_cancelar.Enabled := False;

  msk_qt_baixar.Text := '';
  msk_dt_baixa.Text := '';

  msk_qt_baixar.ReadOnly := True;
  msk_dt_baixa.ReadOnly := True;

  dbctrlgrd_po_itens.SetFocus;
end;

procedure Tfrm_PO_prepara.Verifica_Valores( lVerifica : Boolean );
begin

  datm_po_prepara.qry_po_itens_.Edit;

  If not (lVerifica) then    // Item ja existente
  begin
    If datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat > 0 then
    begin
      datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat := (datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat +
                                                             datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat) -
                                                             StrToFloat( msk_qt_baixar.Text );
      datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat := StrToFloat( msk_qt_baixar.Text );
    end
    Else
    begin
      datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat := StrToFloat( msk_qt_baixar.Text );
      datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat := datm_po_prepara.qry_po_itens_QT_INICIAL.AsFloat -
                                                            StrToFloat( msk_qt_baixar.Text );
    end;
  end
  else
    datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat := StrToFloat( msk_qt_baixar.Text );



  datm_po_prepara.qry_po_itens_.Post;

  datm_po_prepara.qry_po_itens_.Close;
  datm_po_prepara.qry_po_itens_.Prepare;
  datm_po_prepara.qry_po_itens_.Open;

end;



procedure Tfrm_po_prepara.btn_preparaClick(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;

  with datm_po_prepara do
  begin
    qry_muda_.Close;
    qry_muda_.SQL.Clear;
    qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TPO WHERE IN_SELECIONADO = "1"' );
    qry_muda_.Prepare;
    qry_muda_.Open;

    If rdgrp_prep_embarque.ItemIndex = -1 then
    begin
      BoxMensagem( 'É necessario preencher Preparação para LI / DI !!', 3 );
      rdgrp_prep_embarque.SetFocus;
      exit;
    end;

    If dbchkbx_sel_po.Checked = False then
    begin
      If qry_muda_.RecordCount = 0 then
      begin
        qry_muda_.SQL.Clear;
        qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = "' + str_nr_processo + '"' );
        qry_muda_.Prepare;
        qry_muda_.Open;
        If qry_muda_.RecordCount = 0 then
        begin
          BoxMensagem( 'Necessário marcar um Processo para Preparação do Embarque !!', 3 );
          dbctrlgrd_po.SetFocus;
          btn_prepara.Enabled := False;
          exit;
        end;
      end;
    end
    else
    begin
      qry_muda_.SQL.Clear;
      qry_muda_.SQL.Add( 'EXEC sp_po_marca_proc "' + qry_po_NR_PROCESSO.AsString + '"' );
      qry_muda_.ExecSQL;
    end;

    qry_muda_.Close;
    qry_muda_.SQL.Clear;
    qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TPO_ITEM ' );
    qry_muda_.SQL.Add( 'WHERE (IN_SELECIONADO = "1") AND (QT_BAIXADA_DI+QT_BAIXADA_LI <> QT_INICIAL)' );
    qry_muda_.Prepare;
    qry_muda_.Open;

    If qry_muda_.RecordCount = 0 then
    begin
       BoxMensagem( 'Necessário marcar um Item para Preparação do Embarque !!', 3 );
       dbctrlgrd_po_itens.SetFocus;
       btn_prepara.Enabled := False;
       exit;
    end;

    qry_po_.Close;
    qry_po_itens_.Close;

    try
      datm_main.db_broker.StartTransaction;

      // Calcula processo PO
      qry_muda_.SQL.Clear;
      qry_muda_.SQL.Add( 'EXEC sp_po_calcula' );
      qry_muda_.ExecSQL;

      // Monta para arquivo de LI ou DI
      qry_muda_.SQL.Clear;
      If rdgrp_prep_embarque.ItemIndex = 0 then  // Monta LI
         qry_muda_.SQL.Add('EXEC sp_po_monta_li "' + str_nr_processo + '"' )
      Else                                       // Monta DI
         qry_muda_.SQL.Add('EXEC sp_po_monta_di "' + str_nr_processo + '"' );

      qry_muda_.ExecSQL;
      qry_muda_.Close;

      Screen.Cursor := crArrow;

      BoxMensagem( 'Montagem Realizada com Sucesso !!', 3 );

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;
  end;

  msk_nr_processo.Text := '';
  msk_nr_processo.SetFocus;
  btn_prepara.Enabled := False;

  dbctrlgrd_po.Enabled             := False;
  dbctrlgrd_po.SelectedColor       := clMenu;
  dbctrlgrd_po_itens.Enabled       := False;
  dbctrlgrd_po_itens.SelectedColor := clMenu;

  Screen.Cursor := crArrow;

end;




end.


