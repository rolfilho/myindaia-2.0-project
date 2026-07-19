unit PGPO003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCGrids, ExtCtrls, Buttons, Mask, DBCtrls, Db, Menus, Funcoes, DbTables;
type
  Tfrm_po_prepara = class(TForm)
    dbctrlgrd_po: TDBCtrlGrid;
    dbctrlgrd_po_itens: TDBCtrlGrid;
    pnl_botoes: TPanel;
    btn_sair: TSpeedButton;
    btn_preparar: TSpeedButton;
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
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_preparar: TMenuItem;
    mi_sair: TMenuItem;
    Panel2: TPanel;
    lbl_nr_processo: TLabel;
    btn_nr_processo: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_localizar_: TLabel;
    btn_co_po: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    edt_pesquisa: TEdit;
    Panel3: TPanel;
    lbl_proc_po_da: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    lbl_ncm: TLabel;
    lbl_nec_LI: TLabel;
    Label19: TLabel;
    rdgrp_prep_embarque: TRadioGroup;
    Label2: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    chkProcessos: TCheckBox;
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbchkbx_sel_poClick(Sender: TObject);
    procedure dbchkbx_sel_itensClick(Sender: TObject);
    procedure DBText6DblClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure msk_qt_baixarExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_prepararClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_pesquisaChange(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure pnl_localizarEnter(Sender: TObject);
    procedure btn_co_poClick(Sender: TObject);
    procedure edt_pesquisaExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
  private
    { Private declarations }
    nr_processo : String[18];
    cFlag: String[1];
    procedure Verifica_Valores( lVerifica : Boolean );
  public
    tp_po : String[1];
    { Public declarations }
  end;

var
  frm_po_prepara: Tfrm_po_prepara;

implementation

uses PGGP015, PGPO004, GSMLIB, PGGP001, PGPO009, PGGP017, PGSM136, PGSM018, ConsOnLineEx,
  PGSM010;

{$R *.DFM}

procedure Tfrm_po_prepara.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_nr_processo then btn_nr_processoClick(btn_nr_processo);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_po_prepara.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin

  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;

  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_po_prepara.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text = nr_processo then Exit;
  btn_preparar.Enabled := False;
  mi_preparar.Enabled  := False;

  if ( msk_nr_processo.Text = '' ) then
  begin
    BoxMensagem( 'Necessário informar o Processo para preparação da LI / DI !!', 2 );
    msk_nr_processo.SetFocus;
    Exit;
  end;

  with datm_po_prepara do
  begin
    if msk_nr_processo.Text <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '01' + Trim( msk_nr_processo.Text );
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.EOF then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo não encontrado ou já registrado.' + #13#10 +
                     'Digite novamente.', 2 );
        msk_nr_processo.SetFocus;
        Exit;
      end;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;
    end;
  end;
end;

procedure Tfrm_po_prepara.FormShow(Sender: TObject);
begin
  pnl_botoes.Color := clMenuBroker;
  dbchkbx_sel_po.Checked    := False;
  dbchkbx_sel_itens.Checked := False;

  rdgrp_prep_embarque.ItemIndex    := 1;
  btn_preparar.Enabled             := False;
  mi_preparar.Enabled              := False;
  dbctrlgrd_po.Enabled             := False;
  dbctrlgrd_po.SelectedColor       := clMenu;
  dbctrlgrd_po_itens.Enabled       := False;
  dbctrlgrd_po_itens.SelectedColor := clMenu;

  if tp_po = '0' then
  begin
    Caption                       := 'Preparação de LI / DI';
    rdgrp_prep_embarque . Visible := True;
    lbl_proc_po_da.Caption        := 'Processo PO';
    btn_co_po.Visible             := False;
    mi_preparar.Caption           := '&Preparar LI/DI';
    btn_preparar.Hint             := 'Monta a Preparação do Embarque (LI/DI)';
  end;
  if tp_po = '1' then
  begin
    Caption                       := 'Nacionalização';
    rdgrp_prep_embarque . Visible := False;
    lbl_proc_po_da.Caption        := 'Processo DA';
    btn_co_po.Visible             := True;
    mi_preparar.Caption           := '&Nacionalizar';
    btn_preparar.Hint             := 'Nacionalizar';
  end;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_PRODUTO FROM TPRODUTO WHERE TP_PRODUTO = ''01'' AND CD_PRODUTO = ''' + str_cd_produto + '''' );
    Prepare;
    Open;

    if not IsEmpty then
    begin
      msk_cd_produto.Text := str_cd_produto;
      msk_cd_produtoExit(nil);
    end;

    Free;
  end;
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
  Close;
end;

procedure Tfrm_po_prepara.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with datm_po_prepara do
  begin
    qry_prep_item_.Close;
    qry_prep_item_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_prep_item_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_prep_item_.Prepare;
    qry_prep_item_.Open;

    if not qry_prep_item_.EOF then
    begin
      sp_po_exclui_prep.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      sp_po_exclui_prep.ParamByName('@CD_USUARIO').AsString  := str_cd_usuario;
      sp_po_exclui_prep.ParamByName('@TP_PROC').AsInteger    := rdgrp_prep_embarque.ItemIndex;
      ExecStoredProc(datm_po_prepara.sp_po_exclui_prep);
      CloseStoredProc(datm_po_prepara.sp_po_exclui_prep);
    end;

    ExecStoredProc(sp_po_desmarca);
    CloseStoredProc(sp_po_desmarca);

    if qry_po_.State in [dsEdit, dsInsert] then
       qry_po_.Cancel;
    qry_po_.Close;
    qry_po_itens_.Close;
    qry_via_transporte_.Close;

    Free;
  end;
  Action := caFree

end;

procedure Tfrm_po_prepara.dbchkbx_sel_poClick(Sender: TObject);
begin
  if (datm_po_prepara.qry_po_.State in [dsInsert, dsEdit]) then
  begin
    if dbchkbx_sel_po.Checked then
       cFlag := '1'
    else
       cFlag := '0';

    with datm_po_prepara do
    begin
      try
        Screen.Cursor := crHourGlass;
        datm_main.db_broker.StartTransaction;

        qry_po_IN_SELECIONADO.AsString := cFlag;

        CloseStoredProc(sp_po_marca_item);
        sp_po_marca_item.ParamByName('@NR_PROCESSO').AsString    := qry_po_NR_PROCESSO.AsString;
        sp_po_marca_item.ParamByName('@IN_SELECIONADO').AsString := cFlag;
        sp_po_marca_item.ParamByName('@IN_DRAWBACK').AsString    := '0';
        ExecStoredProc(sp_po_marca_item);
        CloseStoredProc(sp_po_marca_item);

        datm_main.db_broker.Commit;
        Screen.Cursor := crDefault;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Screen.Cursor := crDefault;
        end;
      end;

      qry_po_itens_.Close;
      qry_po_itens_.Prepare;
      qry_po_itens_.Open;
    end;
    btn_preparar.Enabled := True;
    mi_preparar.Enabled  := True;
  end;

end;

procedure Tfrm_po_prepara.dbchkbx_sel_itensClick(Sender: TObject);
begin
  if datm_po_prepara.qry_po_itens_.State in [dsInsert, dsEdit] then
  begin
    if datm_po_prepara.qry_po_itens_NR_ITEM.AsString = '' then
    begin
      dbchkbx_sel_itens.Checked := False;
      Exit;
    end;

    if dbchkbx_sel_itens.Checked then
       datm_po_prepara.qry_po_itens_IN_SELECIONADO.AsString := '1'
    else
       datm_po_prepara.qry_po_itens_IN_SELECIONADO.AsString := '0';

    btn_preparar.Enabled := True;
    mi_preparar.Enabled  := True;
    datm_po_prepara.qry_po_itens_CD_USUARIO_MONTA.AsString := str_cd_usuario;
  end;
end;

procedure Tfrm_po_prepara.DBText6DblClick(Sender: TObject);
begin
  if datm_po_prepara.qry_po_itens_NR_PROCESSO.AsString = '' then
  begin
     BoxMensagem( 'Item baixado ou não existente !!', 2 );
     exit;
  end;

  if Not dbchkbx_sel_itens.Checked then
     dbchkbx_sel_itens.Checked := True;

  if datm_po_prepara.qry_po_itens_CalcQTDisp.ASFloat = 0 then
  begin
    BoxMensagem( 'Não é possível baixar o item. Quantidade Disponível está zerada !!', 2 );
    Exit;
  end;

  dbctrlgrd_po.Enabled       := False;
  dbctrlgrd_po_itens.Enabled := False;

  btn_preparar.Enabled       := False;
  mi_preparar.Enabled        := False;
  btn_salvar.Enabled         := True;
  mi_salvar.Enabled          := True;
  btn_cancelar.Enabled       := True;
  mi_cancelar.Enabled        := True;

  msk_qt_baixar.ReadOnly     := False;
  msk_dt_baixa.ReadOnly      := False;

  datm_po_prepara.qry_verif_item_.Close;
  datm_po_prepara.qry_verif_item_.ParamByName('NR_PROCESSO').AsString := datm_po_prepara.qry_po_itens_NR_PROCESSO.AsString;    // Old -> PROC_OLD
  datm_po_prepara.qry_verif_item_.ParamByName('NR_ITEM').AsString     := datm_po_prepara.qry_po_itens_NR_ITEM.AsString;        // Old -> ITEM_OLD
  datm_po_prepara.qry_verif_item_.ParamByName('NR_PROC').AsString     := str_nr_processo;    // PROCESSO DI
  datm_po_prepara.qry_verif_item_.Prepare;
  datm_po_prepara.qry_verif_item_.Open;

  if datm_po_prepara.qry_verif_item_.EOF then
  begin
    msk_dt_baixa.Text := DateToStr( Date );
//    msk_qt_baixar.Text := FormatFloat('###,###,##0.000', StrToFloat( '0,000' ) );
    msk_qt_baixar.Text := FormatFloat('#0,.000', StrToFloat( '0,000' ) );
  end
  else
  begin
    msk_dt_baixa.Text  := DateToStr( datm_po_prepara.qry_verif_item_DT_BAIXA.AsDateTime );
//    msk_qt_baixar.Text := FormatFloat( '###,###,##0.000', datm_po_prepara.qry_verif_item_QT_BAIXADA.AsFloat );
    msk_qt_baixar.Text := FormatFloat('#0,.000',datm_po_prepara.qry_verif_item_QT_BAIXADA.AsFloat );
  end;
  msk_qt_baixar.SetFocus;

  datm_po_prepara.qry_verif_item_.Close;

end;

procedure Tfrm_po_prepara.btn_cancelarClick(Sender: TObject);
begin
  dbctrlgrd_po.Enabled             := True;
  dbctrlgrd_po_itens.Enabled       := True;

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

  dbctrlgrd_po_itens.SetFocus;
end;

procedure Tfrm_po_prepara.msk_qt_baixarExit(Sender: TObject);
begin
  if Trim( msk_qt_baixar.Text ) = '' then
     msk_qt_baixar.Text := '0';

//  msk_qt_baixar.Text := FormatFloat('###,###,##0.000', StrToFloat( msk_qt_baixar.Text ) );
  msk_qt_baixar.Text := FormatFloat('#0,.000', StrToFloat( msk_qt_baixar.Text ) );

  if msk_qt_baixar.Text = '0,000' then
     msk_qt_baixar.Text := ''
end;

procedure Tfrm_po_prepara.btn_salvarClick(Sender: TObject);
var
  nNum, nNum2, Code  : Integer;
  lPossui_NVE : Boolean;
  cProcesso   : String[18];
  nQtdeBx     : Double;
  lCommit     : Boolean;

begin
  dbctrlgrd_po.Enabled       := True;
  dbctrlgrd_po_itens.Enabled := True;
  lCommit := True;
  ActiveControl := nil;
  datm_po_prepara.qry_prep_po_.Close;
  datm_po_prepara.qry_prep_po_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_po_prepara.qry_prep_po_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
  datm_po_prepara.qry_prep_po_.ParamByName('TP_PROC').AsInteger    := rdgrp_prep_embarque.ItemIndex;   // Tipo do Processo LI ou DI
  datm_po_prepara.qry_prep_po_.Prepare;
  datm_po_prepara.qry_prep_po_.Open;

  if datm_po_prepara.qry_prep_po_.EOF then
  begin
    datm_po_prepara.qry_po_selec_.Close;
    datm_po_prepara.qry_po_selec_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    datm_po_prepara.qry_po_selec_.Prepare;
    datm_po_prepara.qry_po_selec_.Open;

    if Not ( dbchkbx_sel_po.Checked ) then
    begin
      if ( datm_po_prepara.qry_po_selec_.EOF ) then
      begin
        BoxMensagem( 'Necessário marcar um Processo para Capa !!', 2 );
        dbctrlgrd_po.SetFocus;
        Exit;
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

          cProcesso := Trim( qry_po_selec_NR_PROCESSO.AsString );
          if cProcesso = '' then
             cProcesso := qry_po_NR_PROCESSO.AsString;

          CloseStoredProc(sp_po_prep_inc_proc);
          sp_po_prep_inc_proc.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_po_prep_inc_proc.ParamByName('@NR_PROC_OLD').AsString := cProcesso;
          sp_po_prep_inc_proc.ParamByName('@TP_PROC').AsInteger    := rdgrp_prep_embarque.ItemIndex;   // Tipo do PRocesso LI ou DI

          ExecStoredProc(sp_po_prep_inc_proc);
          CloseStoredProc(sp_po_prep_inc_proc);

          datm_main.db_broker.Commit;
          lCommit := True;
        except
          on E: Exception do
          begin
            lCommit := False;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end;
    end;
  end;

  lPossui_NVE := True;

  if Not lCommit then
     Exit;

  // Incluir item no tprepara_item
  with datm_po_prepara do
  begin
    qry_po_valor_.Close;
    qry_po_valor_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_po_valor_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_po_valor_.Prepare;
    qry_po_valor_.Open;

    Val( qry_po_valor_QT_TOTAL_ITEM.AsString, nNum2, Code );
    qry_po_valor_.Close;

    qry_verif_item_.Close;
    qry_verif_item_.ParamByName('NR_PROCESSO').AsString := qry_po_itens_NR_PROCESSO.AsString; // Old -> PROC_OLD
    qry_verif_item_.ParamByName('NR_ITEM').AsString     := qry_po_itens_NR_ITEM.AsString;     // Old -> ITEM_OLD
    qry_verif_item_.ParamByName('NR_PROC').AsString     := str_nr_processo;                   // PROCESSO DI / LI
    qry_verif_item_.ParamByName('TP_PROC').AsInteger    := rdgrp_prep_embarque.ItemIndex;     // Tipo do Processo
    qry_verif_item_.Prepare;
    qry_verif_item_.Open;

    Val( TiraPonto( msk_qt_baixar.Text ), nNum, Code );
    if qry_verif_item_.RecordCount = 0 then
    begin
      if nNum > qry_po_itens_CalcQTDisp.AsFloat then
      begin
        BoxMensagem( 'Quantidade a baixar maior do que a quantidade disponível !', 2 );
        msk_qt_baixar.SetFocus;
        Exit;
      end;
    end
    else
    begin
      nQtdeBx := ( qry_po_itens_CalcQTDisp.AsFloat + qry_verif_item_QT_BAIXADA.AsFloat ) - nNum;
      if nQtdeBx > datm_po_prepara.qry_po_itens_QT_INICIAL.AsFloat then
      begin
        BoxMensagem( 'Quantidade a baixar maior do que a quantidade disponível !!', 2 );
        msk_qt_baixar.SetFocus;
        exit;
      end;
    end;

    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_po_prep_inc_item);
      if qry_verif_item_.RecordCount = 0 then  // Nao existe no TPREPARA_ITEM
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
      sp_po_prep_inc_item.ParamByName('@QT_BAIXAR').AsFloat    := StrToFloat( TiraPonto( msk_qt_baixar.Text ) );
      sp_po_prep_inc_item.ParamByName('@DT_BAIXA').AsDateTime  := StrToDate( TiraPonto( msk_dt_baixa.Text ) );
      sp_po_prep_inc_item.ParamByName('@TP_PROC').AsInteger    := rdgrp_prep_embarque.ItemIndex;   // Tipo do PRocesso LI ou DI

      ExecStoredProc(sp_po_prep_inc_item);
      CloseStoredProc(sp_po_prep_inc_item);

      datm_main.db_broker.Commit;

      lCommit := True;
    except
      on E: Exception do
      begin
        lCommit := False;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    qry_verif_item_.Close;
  end;

  if lCommit = False then
     exit;

  // Incluir NVE no tprepara_nve
  if lPossui_NVE then
  begin
    with datm_po_prepara do
    begin
      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc(sp_po_prep_inc_nve);
        sp_po_prep_inc_nve.ParamByName('@NR_PROCESSO').AsString := qry_po_itens_NR_PROCESSO.AsString;
        sp_po_prep_inc_nve.ParamByName('@NR_ITEM').AsString     := qry_po_itens_NR_ITEM.AsString;
        sp_po_prep_inc_nve.ParamByName('@NR_PROC').AsString     := str_nr_processo;
        ExecStoredProc(sp_po_prep_inc_nve);
        CloseStoredProc(sp_po_prep_inc_nve);

        datm_main.db_broker.Commit;
        lCommit := True;
      except
        on E: Exception do
        begin
          lCommit := False;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  if lCommit = False then
     exit;

  Verifica_Valores( lPossui_NVE );

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

  dbctrlgrd_po_itens.SetFocus;
end;

procedure Tfrm_PO_prepara.Verifica_Valores( lVerifica : Boolean );
begin
  datm_po_prepara.qry_po_itens_.Edit;

  if Not (lVerifica) then    // Item ja existente
  begin
    if datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat > 0 then
    begin
      datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat := ( datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat +
                                                              datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat ) -
                                                              StrToFloat( TiraPonto( msk_qt_baixar.Text ) );
      datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat := StrToFloat( TiraPonto( msk_qt_baixar.Text ) );
    end
    else
    begin
      datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat := StrToFloat( TiraPonto( msk_qt_baixar.Text ) );
      datm_po_prepara.qry_po_itens_QT_DISPONIVEL.AsFloat := datm_po_prepara.qry_po_itens_QT_INICIAL.AsFloat -
                                                            StrToFloat( TiraPonto( msk_qt_baixar.Text ) );
    end;
  end
  else
    datm_po_prepara.qry_po_itens_QT_BAIXAR.AsFloat := StrToFloat( TiraPonto( msk_qt_baixar.Text ) );

  datm_po_prepara.qry_po_itens_CD_USUARIO_MONTA.AsString := str_cd_usuario;
  datm_po_prepara.qry_po_itens_.Post;

  datm_po_prepara.qry_po_itens_.Close;
  datm_po_prepara.qry_po_itens_.Prepare;
  datm_po_prepara.qry_po_itens_.Open;

end;

procedure Tfrm_po_prepara.btn_prepararClick(Sender: TObject);
var
  mens_ato : String;
begin
  Screen.Cursor := crHourGlass;

  with datm_po_prepara do
  begin
    if qry_po_.State in [dsEdit, dsInsert] then qry_po_.Post;
    if qry_po_itens_.State in [dsEdit, dsInsert] then qry_po_itens_.Post;

    qry_muda_.Close;
    qry_muda_.SQL.Clear;
    qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TPO WHERE IN_SELECIONADO = "1" AND CD_USUARIO_MONTA = "' + str_cd_usuario + '"' );
    qry_muda_.Prepare;
    qry_muda_.Open;

    if rdgrp_prep_embarque.ItemIndex = -1 then
    begin
      BoxMensagem( 'É necessario preencher Preparação para LI / DI !!', 3 );
      rdgrp_prep_embarque.SetFocus;
      exit;
    end;

    if Not dbchkbx_sel_po.Checked  then
    begin
      if qry_muda_.EOF then
      begin
        qry_muda_.SQL.Clear;
        qry_muda_.SQL.Add( 'SELECT NR_PROCESSO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = "' + str_nr_processo + '"' );
        qry_muda_.Prepare;
        qry_muda_.Open;
        if qry_muda_.RecordCount = 0 then
        begin
          BoxMensagem( 'Necessário marcar um Processo para Preparação do Embarque !!', 3 );
          dbctrlgrd_po.SetFocus;
          btn_preparar.Enabled := False;
          mi_preparar.Enabled  := False;
          Exit;
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
    qry_muda_.SQL.Add( 'WHERE (IN_SELECIONADO = "1") AND (QT_BAIXADA_DI+QT_BAIXADA_LI <> QT_INICIAL) AND CD_USUARIO_MONTA = "' + str_cd_usuario + '"' );
    qry_muda_.Prepare;
    qry_muda_.Open;

    if qry_muda_.EOF then
    begin
      BoxMensagem( 'Necessário marcar um Item para Preparação do Embarque !!', 3 );
      dbctrlgrd_po_itens.SetFocus;
      btn_preparar.Enabled := False;
      mi_preparar.Enabled  := False;
      Exit;
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
      if rdgrp_prep_embarque.ItemIndex = 0 then  // Monta LI
         qry_muda_.SQL.Add('EXEC sp_po_monta_li "' + str_nr_processo + '"' )
      else                                       // Monta DI
         qry_muda_.SQL.Add('EXEC sp_po_monta_di "' + str_nr_processo + '"' );
      qry_muda_.ExecSQL;
      qry_muda_.Close;

      Screen.Cursor := crArrow;

      if tp_po = '0' then //PO
      begin
        //Verificação de Produtos que incidem Ato de DrawBack
        if rdgrp_prep_embarque.ItemIndex = 1 then  // Monta DI
        begin
          mens_ato := '';
          qry_merc_com_ato_.Close;
          qry_merc_com_ato_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_merc_com_ato_.Prepare;
          qry_merc_com_ato_.Open;
          while Not qry_merc_com_ato_.EOF do
          begin
            if Trim( mens_ato ) = '' then
              mens_ato := 'Montagem Realizada com Sucesso !!' + #13#10 +
                          'Existem mercadorias que incidem Ato Drawback!' + #13#10 +
                          'Favor verificá-las no SAP:' + #13#10;
            mens_ato := mens_ato + Copy( qry_merc_com_ato_.FieldByName('NR_PROCESSO').AsString, 5, 14 ) + ' - ' +
                        qry_merc_com_ato_.FieldByName('NR_PROC_PO').AsString + ' - ' +
                        qry_merc_com_ato_.FieldByName('CD_MERCADORIA').AsString + ' - ' +
                        qry_merc_com_ato_.FieldByName('AP_MERCADORIA').AsString + #13#10;
            qry_merc_com_ato_.Next;
          end;
          if Trim( mens_ato ) <> '' then
          begin
            BoxMensagem( mens_ato, 3 );
          end
          else
          begin
            BoxMensagem( 'Montagem realizada com sucesso!!', 3 );
          end;
        end;
      end
      else //Nacionalização
        BoxMensagem( 'Nacionalização montada com sucesso!!', 3 );

      if rdgrp_prep_embarque.ItemIndex = 0 then  // Monta LI
        BoxMensagem( 'Montagem realizada com sucesso!!', 3 );

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  msk_nr_processo.Text             := '';
  msk_nr_processo.SetFocus;
  btn_preparar.Enabled             := False;
  mi_preparar.Enabled              := False;

  dbctrlgrd_po.Enabled             := False;
  dbctrlgrd_po.SelectedColor       := clMenu;
  dbctrlgrd_po_itens.Enabled       := False;
  dbctrlgrd_po_itens.SelectedColor := clMenu;

  with datm_po_prepara do
  begin
    qry_prep_item_.Close;
    qry_prep_item_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_prep_item_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_prep_item_.Prepare;
    qry_prep_item_.Open;

    if qry_prep_item_.EOF then
    begin
      sp_po_exclui_prep.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      ExecStoredProc(datm_po_prepara.sp_po_exclui_prep);
      CloseStoredProc(datm_po_prepara.sp_po_exclui_prep);
    end;

    ExecStoredProc(sp_po_desmarca);
    CloseStoredProc(sp_po_desmarca);

    qry_prep_item_.Close;
  end;

  with datm_po_prepara do
  begin
    try
      datm_main.db_broker.StartTransaction;

      qry_muda_.SQL.Clear;
      qry_muda_.SQL.Add( 'EXEC sp_atz_evento_po_di "' + str_nr_processo + '"' );
      qry_muda_.ExecSQL;
      qry_muda_.Close;

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Exit;
      end;
    end;
  end;
  Screen.Cursor := crArrow;    
end;

procedure Tfrm_po_prepara.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_po_prepara.edt_pesquisaChange(Sender: TObject);
begin
  try
//    datm_po_prepara.qry_po_.Locate('NR_PROCESSO', edt_pesquisa.text, [loPartialKey, loCaseInsensitive] );
  except
  end;
end;

procedure Tfrm_po_prepara.msk_nr_processoEnter(Sender: TObject);
begin
  nr_processo := msk_nr_processo.Text;
end;

procedure Tfrm_po_prepara.pnl_localizarEnter(Sender: TObject);
begin
  edt_pesquisa.SetFocus;
end;

procedure Tfrm_po_prepara.btn_co_poClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_po, frm_consulta_po);
  frm_consulta_po.tp_po := '1';
  frm_consulta_po.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_po.Nr_Processo <> '') then
  begin
    edt_pesquisa.Text := frm_consulta_po.Nr_Processo;
  end;
end;

procedure Tfrm_po_prepara.edt_pesquisaExit(Sender: TObject);
begin
  with datm_po_prepara do
  begin
    if msk_nr_processo.Text <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.EOF then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo não encontrado ou já registrado.' + #13#10 +
                     'Digite novamente.', 2 );
        msk_nr_processo.SetFocus;
        Exit
      end;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;

      qry_po_.Close;
      qry_po_.ParamByName('NR_PO').AsString := Trim( edt_pesquisa.Text );
      qry_po_.Prepare;
      qry_po_.Open;

      qry_po_itens_.Close;
      qry_po_itens_.Prepare;
      qry_po_itens_.Open;

      dbctrlgrd_po.DataSource        := datm_po_prepara.ds_po;
      dbctrlgrd_po_itens.DataSource  := datm_po_prepara.ds_po_itens;
      dbedt_nr_item.DataSource       := datm_po_prepara.ds_po_itens;
      dbedt_qt_inicial.DataSource    := datm_po_prepara.ds_po_itens;
      dbedt_qt_disponivel.DataSource := datm_po_prepara.ds_po_itens;
      dbedt_qt_baixada.DataSource    := datm_po_prepara.ds_po_itens;

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
        dbchkbx_sel_po.Checked           := False;
        dbchkbx_sel_itens.Checked        := False;
        msk_nr_processo.SetFocus;
      end;
    end;
    qry_processo_.Close;
  end;
end;

procedure Tfrm_po_prepara.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_unid_neg);
  with datm_po_prepara.qry_unid_neg_ do
  begin
    Close;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else
    begin
      edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text ,'NM_UNID_NEG');
//      edt_nm_unid_neg.Text := FieldByName('NM_UNID_NEG').AsString
    end;
    Close;
  end;
end;

procedure Tfrm_po_prepara.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade de Negociação'], 'CD_UNID_NEG',  nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text ,'NM_UNID_NEG');

 { Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;    }
  msk_cd_unid_negExit(msk_cd_unid_neg);
end;


procedure Tfrm_po_prepara.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_produto);
  with datm_po_prepara.qry_produto_ do
  begin
    Close;
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Produto não encontrado!', 2 );
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
      msk_cd_produto.SetFocus;
    end
    else
    begin
      edt_nm_produto.Text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO WHERE TP_PRODUTO = ''01'' AND CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text), 'NM_PRODUTO');
      if edt_nm_produto.Text = '' then
      begin
        BoxMensagem( 'Produto inválido para esta operação!', 2 );
        msk_cd_produto.Clear;
        edt_nm_produto.Clear;
        msk_cd_produto.SetFocus;
      end;
//      edt_nm_produto.Text := FieldByName('NM_PRODUTO').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_po_prepara.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_produto.Text := ConsultaOnLineExFiltro('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Produtos'], 'CD_PRODUTO', ' TP_PRODUTO = ''01'' ', nil)
  else
    edt_nm_produto.Text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO WHERE TP_PRODUTO = ''01'' AND CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text), 'NM_PRODUTO');

  {  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    msk_cd_produtoExit(nil);
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    end;
  end;  }
  msk_cd_produtoExit(msk_cd_produto);
end;

end.


