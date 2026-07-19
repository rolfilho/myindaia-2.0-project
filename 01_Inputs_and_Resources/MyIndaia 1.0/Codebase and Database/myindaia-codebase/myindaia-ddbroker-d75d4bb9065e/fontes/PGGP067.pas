unit PGGP067;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, ComCtrls, ShellApi, DBCtrls, DBTables,
  DBGrids, RXLookup, RxDBComb, UCRPE32, ComObj, Funcoes;

type
  Tfrm_po_planilha = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
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
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_sg_grupo: TLabel;
    edt_sg_grupo: TEdit;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
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
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

  public

  end;

var
  frm_po_planilha: Tfrm_po_planilha;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM024, PGSM119,
     PGSM212, PGGP068, ConsOnLineEx;

procedure Tfrm_po_planilha.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_po_planilha.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_po_planilha do
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


procedure Tfrm_po_planilha.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := 'Todos';
    Exit;
  end;

  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_po_planilha do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_.FieldByName('NM_PRODUTO').AsString;
      end
      else
      begin
        BoxMensagem( 'Produto não cadastrado!', 2 );
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;


procedure Tfrm_po_planilha.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_po_planilha do
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


procedure Tfrm_po_planilha.btn_co_produtoClick(Sender: TObject);
begin
  with datm_po_planilha do
  begin
    Application.CreateForm( Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;


procedure Tfrm_po_planilha.btn_imprimirClick(Sender: TObject);
var
  vCorAux, nr_identificador, nLinha, i: integer;
  Excel, xlWorkB, oSheet: OleVariant;
begin

  if Trim( msk_cd_unid_neg.Text ) = ''  then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if Trim( msk_cd_produto.Text ) = '' then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if ( ( Trim( msk_cd_cliente.Text ) = '' ) and ( Trim( msk_cd_grupo.Text ) = '' ) ) then
  begin
    BoxMensagem( 'Informe um Cliente ou Grupo!', 2 );
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with datm_po_planilha do
  begin
    try
      //datm_main.db_broker.StartTransaction; // Comentado por Michel por não haver necessidade de transação aqui - 19/04/2010
      qry_rel_po_planilha_.Close;

      if Trim( msk_cd_unid_neg.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_UNID_NEG').AsString   := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
      if Trim( msk_cd_produto.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_PRODUTO').AsString    := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
      if Trim( msk_cd_grupo.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_GRUPO').AsString      := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_GRUPO').AsString      := msk_cd_grupo.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_CLIENTE').AsString    := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_CLIENTE').AsString    := msk_cd_cliente.Text;
      qry_rel_po_planilha_.ParamByName('DT_INICIO').AsDateTime    := msk_dt_inicio.Date;
      qry_rel_po_planilha_.ParamByName('DT_FIM').AsDateTime    := msk_dt_fim.Date;
      if Trim( msk_cd_area.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_AREA').AsString       := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_AREA').AsString       := msk_cd_area.Text;
      if Trim( edt_sg_grupo.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_GRUPO_AREA').AsString        := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_GRUPO_AREA').AsString        := edt_sg_grupo.Text;
      if Trim( MaskEdit1.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_ANALISTA_COMISSARIA').AsString        := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_ANALISTA_COMISSARIA').AsString        := MaskEdit1.Text;
      if Trim( MaskEdit2.Text ) = '' then
        qry_rel_po_planilha_.ParamByName('CD_ANALISTA_CLIENTE').AsString   := 'X'
      else qry_rel_po_planilha_.ParamByName('CD_ANALISTA_CLIENTE').AsString   := MaskEdit2.Text;

      qry_rel_po_planilha_.Prepare;
      qry_rel_po_planilha_.Open;

      if qry_rel_po_planilha_.EOF then
      begin
        BoxMensagem('Não há dados para exibir', 2)
      end
      else
      begin
        try
          Excel := CreateOLEObject('Excel.Application');

          xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\FOLLOWUP_PO.XLS' );
          Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\FOLLOWUP_PO_' +
          Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

          oSheet := Excel.WorkBooks[1].Worksheets[1];
        except
          begin
            BoxMensagem('Erro na criação da Planilha.', 2) ;
            Exit;
          end
        end;

        //filtros da planilha
        oSheet.Cells[ 01, 05 ].value := edt_nm_unid_neg.text;
        oSheet.Cells[ 02, 05 ].value := edt_nm_produto.text;
        if ( edt_nm_grupo.text = '' ) OR ( Trim( edt_nm_grupo.text ) = 'Todos' ) then
        begin
          oSheet.Cells[ 03, 04 ].value := 'Cliente:  ';
          oSheet.Cells[ 03, 05 ].value := edt_nm_cliente.text;
        end else begin
          oSheet.Cells[ 03, 04 ].value := 'Grupo:  ';
          oSheet.Cells[ 03, 05 ].value := edt_nm_grupo.text;
        end;
        oSheet.Cells[ 04, 05 ].value := edt_nm_area.text;
        oSheet.Cells[ 05, 05 ].value := Edit1.text;
        oSheet.Cells[ 06, 05 ].value := Edit2.text;
        oSheet.Cells[ 02, 07 ].value := DatetoStr( msk_dt_inicio.date ) + ' à ' + DatetoStr( msk_dt_fim.date );

        // Alimenta a planilha
        nLinha := 8;
        vCorAux := 19;

        while not qry_rel_po_planilha_.EOF do
        begin
          nLinha := nLinha + 1;

          if vCorAux = 19 then
            vCorAux := 20
          else vCorAux := 19;

          for i := 1 to 20 do
            oSheet.Cells[ nLinha, i ].Interior.ColorIndex := vCorAux;

//          oSheet.Cells[ nLinha, 1 ].value := Copy( qry_rel_po_planilha_NR_PROCESSO.AsString, 5, 10 );
          oSheet.Cells[ nLinha, 1 ].value  := qry_rel_po_planilha_.FieldByName('NR_REFERENCIA').AsString;
          oSheet.Cells[ nLinha, 2 ].value  := qry_rel_po_planilha_.FieldByName('NR_ITEM_CLIENTE').AsString;
          oSheet.Cells[ nLinha, 3 ].value  := qry_rel_po_planilha_.FieldByName('NR_ORDEM').AsString;
          oSheet.Cells[ nLinha, 4 ].value  := qry_rel_po_planilha_.FieldByName('CD_MERCADORIA').AsString;
          oSheet.Cells[ nLinha, 5 ].value  := qry_rel_po_planilha_.FieldByName('NOME_MERCADORIA').AsString;
          oSheet.Cells[ nLinha, 6 ].value  := qry_rel_po_planilha_.FieldByName('NM_EMPRESA').AsString;
//          oSheet.Cells[ nLinha, 7 ].value := qry_rel_po_planilha_CD_REF_IMP.AsString;
          oSheet.Cells[ nLinha, 7 ].value  := qry_rel_po_planilha_.FieldByName('NOME_VIA_TRANSPORTE').AsString;
//          oSheet.Cells[ nLinha, 8 ].value := qry_rel_po_planilha_NM_CLIENTE.AsString;
          oSheet.Cells[ nLinha, 8 ].value  := qry_rel_po_planilha_.FieldByName('CD_INCOTERM').AsString;
          oSheet.Cells[ nLinha, 9 ].value  := qry_rel_po_planilha_.FieldByName('NOME_LOCAL_EMBARQUE').AsString;
          oSheet.Cells[ nLinha, 10 ].value := Copy( qry_rel_po_planilha_.FieldByName('DATA_NECESSIDADE').AsString, 1, 10 );
          oSheet.Cells[ nLinha, 11 ].value := Copy( qry_rel_po_planilha_.FieldByName('DATA_ALOCACAO').AsString, 1, 10 );
          oSheet.Cells[ nLinha, 12 ].value := Copy( qry_rel_po_planilha_.FieldByName('DATA_RESERVA').AsString, 1, 10 );
          oSheet.Cells[ nLinha, 13 ].value := qry_rel_po_planilha_.FieldByName('NAVIO_VOO').AsString;
          oSheet.Cells[ nLinha, 14 ].value := Copy( qry_rel_po_planilha_.FieldByName('DATA_ETD').AsString, 1, 10 );
          oSheet.Cells[ nLinha, 15 ].value := Copy( qry_rel_po_planilha_.FieldByName('DATA_ETA').AsString, 1, 10 );
          oSheet.Cells[ nLinha, 16 ].value := qry_rel_po_planilha_.FieldByName('NM_AREA').AsString;
//          oSheet.Cells[ nLinha, 14 ].value := qry_rel_po_planilha_IN_NEC_LI.AsString;
//          oSheet.Cells[ nLinha, 15 ].value := Copy( qry_rel_po_planilha_DT_EMISSAO.AsString, 1, 10 );
          oSheet.Cells[ nLinha, 17 ].value := Copy( qry_rel_po_planilha_.FieldByName('DATA_DOCS').AsString, 1, 10 );
          oSheet.Cells[ nLinha, 18 ].value := qry_rel_po_planilha_.FieldByName('NM_EXPORTADOR').AsString;
          oSheet.Cells[ nLinha, 19 ].value := qry_rel_po_planilha_.FieldByName('NM_TP_PEDIDO').AsString;
//          oSheet.Cells[ nLinha, 22 ].value := Copy( qry_rel_po_planilha_DT_AUT_EMBARQUE.AsString, 1, 10 );
//          oSheet.Cells[ nLinha, 23 ].value := Copy( qry_rel_po_planilha_DT_VENC_LI.AsString, 1, 10 );
//          oSheet.Cells[ nLinha, 24 ].value := Copy( qry_rel_po_planilha_DT_DEF_LI.AsString, 1, 10 );
          oSheet.Cells[ nLinha, 20 ].value := '  ';
          qry_rel_po_planilha_.next;
        end;

        sp_po_planilha.close;
        Screen.Cursor := crDefault;

        //Limpa a tabela auxiliar
//        ApagaDados( 'TREL_PO_PLANILHA', nr_identificador );
        Excel.Visible := True;

        // Envia msg de sucesso
        ShowMessage('Planilha gerada com sucesso');

        Screen.Cursor := crDefault;
        Application.ProcessMessages;
      end;

      except
        on E: Exception do
        begin
          //if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback; // Comentado por Michel por não haver necessidade de transação aqui - 19/04/2010
          TrataErro(E);
        end;
      end;

    end;

  Screen.Cursor := crDefault;
end;


procedure Tfrm_po_planilha.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  with datm_po_planilha do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;
  end;

  msk_dt_inicio.TabOrder     := 8;
  msk_dt_fim.TabOrder        := 9;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

end;


procedure Tfrm_po_planilha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_po_planilha do
  begin
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_area_.Close;
    Free;
  end;

  Action := caFree;
end;


procedure Tfrm_po_planilha.FormCreate(Sender: TObject);
begin
 // Inicializa o Data Module para Seleção de Recebimento
  Application.CreateForm( Tdatm_po_planilha, datm_po_planilha );
end;


procedure Tfrm_po_planilha.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    Exit;
  end;

  ValCodEdt(msk_cd_cliente);
  with datm_po_planilha.qry_cliente_ do
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


procedure Tfrm_po_planilha.btn_co_clienteClick(Sender: TObject);
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


procedure Tfrm_po_planilha.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto  then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(btn_co_grupo);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(btn_co_cliente);
    if Sender = msk_cd_area     then btn_co_areaClick(btn_co_area);
    if Sender = MaskEdit1       then SpeedButton1Click(SpeedButton1);
    if Sender = MaskEdit2       then SpeedButton2Click(SpeedButton2);
  end;
end;


procedure Tfrm_po_planilha.btn_co_grupoClick(Sender: TObject);
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


procedure Tfrm_po_planilha.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    edt_nm_grupo.Text := 'Todos';
    Exit;
  end;

  ValCodEdt(msk_cd_grupo);
  with datm_po_planilha.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo de Clientes não encontrado!',2);
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;


procedure Tfrm_po_planilha.msk_cd_grupoChange(Sender: TObject);
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


procedure Tfrm_po_planilha.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.text = '' then
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


procedure Tfrm_po_planilha.btn_co_areaClick(Sender: TObject);
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


procedure Tfrm_po_planilha.msk_cd_areaExit(Sender: TObject);
begin
  edt_nm_area.Clear;
  if msk_cd_area.Text = '' then
  begin
    edt_nm_area.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_area );
  with datm_po_planilha.qry_area_ do
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


procedure Tfrm_po_planilha.msk_dt_fimExit(Sender: TObject);
begin
  if msk_dt_fim.Date = 0 then
  begin
    BoxMensagem( 'Informe uma Data Inicial!', 2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;
end;


procedure Tfrm_po_planilha.msk_dt_inicioExit(Sender: TObject);
begin
  if msk_dt_inicio.Date = 0 then
  begin
    BoxMensagem( 'Informe uma Data Inicial!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;
end;



procedure Tfrm_po_planilha.MaskEdit1Exit(Sender: TObject);
begin
  Edit1.Clear;
  if MaskEdit1.Text = '' then
  begin
    Edit1.Text := 'Todos';
    Exit;
  end;

  ValCodEdt(MaskEdit1);
  if Edit1.Text = '' then
  begin
    BoxMensagem( 'Analista não encontrado!', 2 );
    MaskEdit1.Clear;
    Edit1.Clear;
    MaskEdit1.SetFocus;
  end;
end;

procedure Tfrm_po_planilha.SpeedButton1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    MaskEdit1.Text := ConsultaOnLineExSQL('SELECT CD_USUARIO, NM_USUARIO, NM_EMAIL FROM TUSUARIO WHERE CD_CARGO IN (''004'',''044'')','Analistas Indaiá',['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil)
  else
    Edit1.Text := ConsultaLookup('TUSUARIO','CD_USUARIO',MaskEdit1.Text,'NM_USUARIO');
end;

procedure Tfrm_po_planilha.SpeedButton2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    MaskEdit2.Text := ConsultaOnLineExSQL('SELECT CD_USUARIO, NM_USUARIO, NM_EMAIL FROM TUSUARIO WHERE CD_CARGO = ''040'' AND IN_ATIVO = ''1''','Contatos',['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil)
  else
    Edit2.Text := ConsultaLookup('TUSUARIO','CD_USUARIO',MaskEdit2.Text,'NM_USUARIO');
end;

end.
