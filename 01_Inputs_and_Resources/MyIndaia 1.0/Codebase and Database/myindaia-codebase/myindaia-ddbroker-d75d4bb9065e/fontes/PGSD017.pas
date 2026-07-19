unit PGSD017;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Menus, Buttons,
  ExtCtrls, Db, DBTables, ToolEdit, Funcoes, PGGP017, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid,  cxGridExportLink, ShellAPI,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  Tfrm_sda_pesq = class(TForm)
    pnl_pesq_pagto: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    pgctrl_pesq_sda: TPageControl;
    ts_filtros: TTabSheet;
    ts_lista: TTabSheet;
    lbl_item: TLabel;
    btn_co_desp: TSpeedButton;
    msk_cd_desp: TMaskEdit;
    edt_nm_desp: TEdit;
    mi_manut_proc: TMenuItem;
    btn_co_distribuidor: TSpeedButton;
    lbl_usuario: TLabel;
    lbl_nr_processo: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    edt_nm_distribuidor: TEdit;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_status: TLabel;
    dblckpbox_status_sda: TDBLookupComboBox;
    lbl_vl_sda: TLabel;
    msk_vl_sda: TMaskEdit;
    btn_pesquisa: TSpeedButton;
    btn_co_processo: TSpeedButton;
    msk_cd_distribuidor: TMaskEdit;
    pnl_pagtos: TPanel;
    lbl_usuario_solic: TLabel;
    dbedt_cd_distribuidor: TDBEdit;
    dbedt_nm_distribuidor: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label6: TLabel;
    msk_dt_ini_distr: TDateEdit;
    msk_dt_fim_distr: TDateEdit;
    Label7: TLabel;
    msk_dt_ini_emis: TDateEdit;
    msk_dt_fim_emis: TDateEdit;
    Label8: TLabel;
    msk_dt_ini_pagto: TDateEdit;
    msk_dt_fim_pagto: TDateEdit;
    Label9: TLabel;
    msk_dt_ini_cancel: TDateEdit;
    msk_dt_fim_cancel: TDateEdit;
    Label10: TLabel;
    Bevel3: TBevel;
    Label11: TLabel;
    Label14: TLabel;
    msk_cd_emissor: TMaskEdit;
    edt_nm_emissor: TEdit;
    btn_co_emissor: TSpeedButton;
    Label15: TLabel;
    msk_cd_cancelador: TMaskEdit;
    edt_nm_cancelador: TEdit;
    btn_co_cancelador: TSpeedButton;
    Label1: TLabel;
    dbedt_dt_emissao: TDBEdit;
    Label2: TLabel;
    dbedt_dt_cancelamento: TDBEdit;
    Label16: TLabel;
    dbedt_dt_pagto: TDBEdit;
    lbl_dt_pagto: TLabel;
    dbedt_dt_distribuicao: TDBEdit;
    Label3: TLabel;
    dbedt_cd_emissor: TDBEdit;
    dbedt_dt_emissor: TDBEdit;
    Label4: TLabel;
    dbedt_cd_cancelador: TDBEdit;
    dbedt_nm_cancelador: TDBEdit;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1NR_PROCESSO: TcxGridDBColumn;
    cxGridDBTableView1NM_DESPACHANTE: TcxGridDBColumn;
    cxGridDBTableView1VL_SDA: TcxGridDBColumn;
    cxGridDBTableView1NM_STATUS_SDA: TcxGridDBColumn;
    btnExcel: TBitBtn;
    SaveDialog: TSaveDialog;
    cxGridDBTableView1NM_EMPRESA: TcxGridDBColumn;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    Label13: TLabel;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    Label12: TLabel;
    cxGridDBTableView1DT_DISTRIBUICAO: TcxGridDBColumn;
    cxGridDBTableView1DT_EMISSAO: TcxGridDBColumn;
    procedure msk_cd_despExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_despClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_pesq_sdaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_pesq_sdaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_distribuidorExit(Sender: TObject);
    procedure dblckpbox_status_sdaClick(Sender: TObject);
    procedure btn_co_distribuidorClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure msk_vl_sdaExit(Sender: TObject);
    procedure msk_cd_emissorExit(Sender: TObject);
    procedure msk_cd_canceladorExit(Sender: TObject);
    procedure btn_co_emissorClick(Sender: TObject);
    procedure btn_co_canceladorClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure GeraExcel(var grid : TcxGrid);
    procedure cxGridDBTableView1CustomDrawIndicatorCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);
  private
    str_valor : String;
    str_status : String;
    vl_sda : Double;
    procedure GeraSqlStr;
    function Consiste : Boolean;
  public
  end;

var
  frm_sda_pesq: Tfrm_sda_pesq;

implementation

uses GSMLIB, PGGP001, PGGP015, PGSD018, PGSM010, PGSM016, PGSM018, PGSM046, PGSM136;

{$R *.DFM}

procedure Tfrm_sda_pesq.msk_cd_despExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.msk_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.msk_cd_produtoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.msk_cd_favorecidoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.btn_co_despClick(Sender: TObject);
begin
  with datm_sda_pesq do
  begin
    Application.CreateForm( Tfrm_despachante, frm_despachante );
    with frm_despachante do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_despachante.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_desp.Text := frm_despachante.Cons_OnLine_Texto;
      msk_cd_despExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_pesq.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sda_pesq do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_pesq.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sda_pesq do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

function Tfrm_sda_pesq.Consiste : Boolean;
begin
  Consiste := True;
  with datm_sda_pesq do
  begin
    {Unidade}
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) = '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Unidade não encontrada!', 2 );
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        edt_nm_produto.Text  := '';
        Consiste             := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_NM_UNID_NEG.AsString;
        edt_nm_produto.Text  := '';
      end;
    end;

    {Produto}
    if ( Trim( msk_cd_unid_neg.Text ) = '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_produto );
      if Not ( qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Produto não encontrado!', 2 );
        msk_cd_produto.Text  := '';
        edt_nm_produto.Text  := '';
        edt_nm_unid_neg.Text := '';
        Consiste             := False;
        msk_cd_produto.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text := '';
        edt_nm_produto.Text  := qry_usuario_habilitacao_NM_PRODUTO.AsString;
      end;
    end;

    {Unidade - Produto}
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      ValCodEdt( msk_cd_produto );
      if Not ( qry_usuario_habilitacao_.Locate( 'CD_UNID_NEG;CD_PRODUTO', VarArrayOf( [msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Unidade x Produto não encontrada, sem habilitação ou desativado!', 2 );
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_produto.Text  := '';
        edt_nm_produto.Text  := '';
        Consiste             := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_NM_UNID_NEG.AsString;
        edt_nm_produto.Text  := qry_usuario_habilitacao_NM_PRODUTO.AsString;
      end;
    end;

    if ( Trim( msk_cd_unid_neg.Text ) = '' ) and ( Trim( msk_cd_produto.Text ) = '' ) then
    begin
      edt_nm_unid_neg.Text       := '';
      edt_nm_produto.Text        := '';
    end;

    {Processo}
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
       ( Trim( msk_cd_produto.Text ) <> '' ) and
       ( Trim( msk_nr_processo.Text ) <> '' ) then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if Not ( qry_processo_.Locate('NR_PROCESSO', msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Processo inexistente ou não liberado!', 2 );
        msk_nr_processo.Text := '';
        Consiste             := False;
        msk_nr_processo.SetFocus;
      end;
    end;

    {Despachante}
    if ( Trim( msk_cd_desp.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_desp );
      qry_desp_.Close;
      qry_desp_.ParamByName('CD_DESPACHANTE').AsString := msk_cd_desp.Text;
      qry_desp_.Prepare;
      qry_desp_.Open;
      if qry_desp_.RecordCount = 0 then
      begin
        BoxMensagem( 'Despachante inexistente!', 2 );
        msk_cd_desp.Text    := '';
        edt_nm_desp.Text    := '';
        Consiste            := False;
        msk_cd_desp.SetFocus;
      end
      else
      begin
        edt_nm_desp.Text    := qry_desp_NM_DESPACHANTE.AsString;
      end;
    end
    else
    begin
      edt_nm_desp.Text      := '';
    end;

    {Distribuidor}
    if ( Trim( msk_cd_distribuidor.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_distribuidor );
      qry_usuario_.Close;
      qry_usuario_.ParamByName('CD_USUARIO').AsString := msk_cd_distribuidor.Text;
      qry_usuario_.Prepare;
      qry_usuario_.Open;
      if qry_usuario_.RecordCount = 0 then
      begin
        BoxMensagem( 'Usuário Distribuidor inexistente!', 2 );
        msk_cd_distribuidor.Text := '';
        edt_nm_distribuidor.Text := '';
        Consiste                 := False;
        msk_cd_distribuidor.SetFocus;
      end
      else
      begin
        edt_nm_distribuidor.Text := qry_usuario_NM_USUARIO.AsString;
      end;
    end
    else
    begin
      edt_nm_distribuidor.Text   := '';
    end;

    {Emissor}
    if ( Trim( msk_cd_emissor.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_emissor );
      qry_usuario_.Close;
      qry_usuario_.ParamByName('CD_USUARIO').AsString := msk_cd_emissor.Text;
      qry_usuario_.Prepare;
      qry_usuario_.Open;
      if qry_usuario_.RecordCount = 0 then
      begin
        BoxMensagem( 'Usuário Emissor inexistente!', 2 );
        msk_cd_emissor.Text := '';
        edt_nm_emissor.Text := '';
        Consiste                 := False;
        msk_cd_emissor.SetFocus;
      end
      else
      begin
        edt_nm_emissor.Text := qry_usuario_NM_USUARIO.AsString;
      end;
    end
    else
    begin
      edt_nm_emissor.Text   := '';
    end;

    {Cancelador}
    if ( Trim( msk_cd_cancelador.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_cancelador );
      qry_usuario_.Close;
      qry_usuario_.ParamByName('CD_USUARIO').AsString := msk_cd_cancelador.Text;
      qry_usuario_.Prepare;
      qry_usuario_.Open;
      if qry_usuario_.RecordCount = 0 then
      begin
        BoxMensagem( 'Usuário Cancelador inexistente!', 2 );
        msk_cd_cancelador.Text := '';
        edt_nm_cancelador.Text := '';
        Consiste               := False;
        msk_cd_cancelador.SetFocus;
      end
      else
      begin
        edt_nm_cancelador.Text := qry_usuario_NM_USUARIO.AsString;
      end;
    end
    else
    begin
      edt_nm_cancelador.Text   := '';
    end;
  end;
end;

procedure Tfrm_sda_pesq.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_sda_pesq, datm_sda_pesq );
  with datm_sda_pesq do
  begin
    // traz as habilitacoes para o usuario
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;

    // abre queries
    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;

    qry_desp_.Close;
    qry_desp_.Prepare;
    qry_desp_.Open;

    qry_status_sda_.Close;
    qry_status_sda_.Prepare;
    qry_status_sda_.Open;

    // atualiza tela
    msk_cd_unid_neg.Text := str_cd_unid_neg;
//    msk_cd_produto.Text  := str_cd_produto;

    Consiste;
  end;
end;

procedure Tfrm_sda_pesq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sda_pesq Do
  begin
    qry_usuario_habilitacao_.Close;
    qry_desp_.Close;
    qry_status_sda_.Close;

    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sda_pesq.pgctrl_pesq_sdaChange(Sender: TObject);
begin
  if pgctrl_pesq_sda.ActivePage = ts_lista then
    btn_pesquisaClick(nil)
  else
    datm_sda_pesq.qry_pesq_.Close;
end;

procedure Tfrm_sda_pesq.GeraSqlStr;
var
  sqlstr : String;
begin
  sqlstr := '';

  sqlstr := sqlstr + '  SELECT S.NR_PROCESSO, S.CD_DESPACHANTE, D.NM_DESPACHANTE,   ' +
                     '  S.CD_STATUS, ST.NM_STATUS_SDA,                              ' +
                     '  P.CD_UNID_NEG, U.NM_UNID_NEG, P.CD_PRODUTO, PR.NM_PRODUTO,  ' +
                     '  ( S.VL_SDA + S.VL_CONTR_ASSIST + S.VL_COMPL ) AS VL_SDA,    ' +
                     '  S.DT_DISTRIBUICAO, S.DT_EMISSAO, S.DT_CANCEL, S.DT_PAGTO,   ' +
                     '  S.CD_DISTRIBUIDOR, UD.NM_USUARIO AS NM_DISTRIBUIDOR,        ' +
                     '  S.CD_EMISSOR, UE.NM_USUARIO AS NM_EMISSOR,                  ' +
                     '  S.CD_CANCELADOR, UC.NM_USUARIO AS NM_CANCELADOR             ' +
                     '  ,EN.NM_EMPRESA                                              ' +
                     '  FROM   TPROCESSO_SDA S,                                     ' +
                     '         TPROCESSO P,                                         ' +
                     '         TDESPACHANTE D,                                      ' +
                     '         TSTATUS_SDA ST,                                      ' +
                     '         TUSUARIO UD,                                         ' +
                     '         TUSUARIO UE,                                         ' +
                     '         TUSUARIO UC,                                         ' +
                     '         TUNID_NEG U,                                         ' +
                     '         TPRODUTO PR,                                         ' +
                     '         TEMPRESA_NAC EN                                      ' +
                     '  WHERE S.NR_PROCESSO        = P.NR_PROCESSO                  ' +
                     '    AND S.CD_DESPACHANTE    *= D.CD_DESPACHANTE               ' +
                     '    AND P.CD_UNID_NEG        = U.CD_UNID_NEG                  ' +
                     '    AND P.CD_PRODUTO         = PR.CD_PRODUTO                  ' +
                     '    AND S.CD_STATUS         *= ST.CD_STATUS_SDA               ' +
                     '    AND S.CD_DISTRIBUIDOR   *= UD.CD_USUARIO                  ' +
                     '    AND S.CD_EMISSOR        *= UE.CD_USUARIO                  ' +
                     '    AND S.CD_CANCELADOR     *= UC.CD_USUARIO                  ' +
                     '    AND P.CD_CLIENTE         = EN.CD_EMPRESA                  ' +
                     '    AND P.IN_CANCELADO       = "0"                            ' +
                     '    AND P.IN_LIBERADO        = "1"                            ';

  {Unidade}
  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND P.CD_UNID_NEG = ' + QuotedStr( msk_cd_unid_neg.Text );
  end;

  {Produto}
  if Trim( msk_cd_produto.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND P.CD_PRODUTO = ' + QuotedStr( msk_cd_produto.Text );
  end;

  {Processo}
  if Trim( msk_nr_processo.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND S.NR_PROCESSO = ' + QuotedStr( msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text );
  end;

  {Despachante}
  if Trim( msk_cd_desp.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_DESPACHANTE = ' + QuotedStr( msk_cd_desp.Text );
  end;

  {Status}
  if Trim( str_status ) <> '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_STATUS = ' + QuotedStr( str_status );
  end;

  {Valor}
  if Trim( msk_vl_sda.Text ) <> '' then
  begin
    str_valor := msk_vl_sda.Text;
    if Pos( ',', str_valor ) > 0 then
       str_valor[Pos( ',', str_valor )] := '.';
    sqlstr := sqlstr + ' AND ( S.VL_SDA + S.VL_CONTR_ASSIST + S.VL_COMPL ) = ' + str_valor;
  end;

  {Período Distribuição}
  if msk_dt_ini_distr.Text <> '  /  /    ' then
  begin
    sqlstr := sqlstr + ' AND CONVERT( datetime, S.DT_DISTRIBUICAO, 103 ) >= CONVERT( datetime, "' + msk_dt_ini_distr.Text + '", 103 ) AND ' +
                       'CONVERT( datetime, S.DT_DISTRIBUICAO, 103 ) <= CONVERT( datetime, "' + msk_dt_fim_distr.Text + '", 103 ) ';
  end;

  {Período Emissão}
  if msk_dt_ini_emis.Text <> '  /  /    ' then
  begin
    sqlstr := sqlstr + ' AND CONVERT( datetime, S.DT_EMISSAO, 103 ) >= CONVERT( datetime, "' + msk_dt_ini_emis.Text + '", 103 ) AND ' +
                       'CONVERT( datetime, S.DT_EMISSAO, 103 ) <= dateadd(day, 1,CONVERT( datetime, "' + msk_dt_fim_emis.Text + '", 103 )) ';
  end;

  {Período Cancelamento}
  if msk_dt_ini_cancel.Text <> '  /  /    ' then
  begin
    sqlstr := sqlstr + ' AND CONVERT( datetime, S.DT_CANCEL, 103 ) >= CONVERT( datetime, "' + msk_dt_ini_cancel.Text + '", 103 ) AND ' +
                       'CONVERT( datetime, S.DT_CANCEL, 103 ) <= CONVERT( datetime, "' + msk_dt_fim_cancel.Text + '", 103 ) ';
  end;

  {Período Pagamento}
  if msk_dt_ini_pagto.Text <> '  /  /    ' then
  begin
    sqlstr := sqlstr + ' AND CONVERT( datetime, S.DT_PAGTO, 103 ) >= CONVERT( datetime, "' + msk_dt_ini_pagto.Text + '", 103 ) AND ' +
                       'CONVERT( datetime, S.DT_PAGTO, 103 ) <= CONVERT( datetime, "' + msk_dt_fim_pagto.Text + '", 103 ) ';
  end;

  {Usuário Distribuidor}
  if Trim( msk_cd_distribuidor.Text ) <>  '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_DISTRIBUIDOR = ' + QuotedStr( msk_cd_distribuidor.Text );
  end;

  {Usuário Emissor}
  if Trim( msk_cd_emissor.Text ) <>  '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_EMISSOR = ' + QuotedStr( msk_cd_emissor.Text );
  end;

  {Usuário Cancelador}
  if Trim( msk_cd_cancelador.Text ) <>  '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_CANCELADOR = ' + QuotedStr( msk_cd_cancelador.Text );
  end;
    sqlstr := sqlstr + ' ORDER BY P.CD_PRODUTO, S.CD_DESPACHANTE';

  datm_sda_pesq.qry_pesq_.Close;
  datm_sda_pesq.qry_pesq_.Sql.Clear;
  datm_sda_pesq.qry_pesq_.Sql.Add( sqlstr );
  datm_sda_pesq.qry_pesq_.Prepare;
  datm_sda_pesq.qry_pesq_.Open;
end;

procedure Tfrm_sda_pesq.FormShow(Sender: TObject);
begin
  pgctrl_pesq_sda.ActivePage := ts_filtros;
  msk_dt_ini_emis.Date := dt_server;
  msk_dt_fim_emis.Date    := dt_server;
end;

procedure Tfrm_sda_pesq.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sda_pesq.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_sda_pesq.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_nr_processo     then btn_co_processoClick(nil);
    if Sender = msk_cd_unid_neg     then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto      then btn_co_produtoClick(nil);
    if Sender = msk_cd_desp         then btn_co_despClick(nil);
    if Sender = msk_cd_distribuidor then btn_co_distribuidorClick(nil);
    if Sender = msk_cd_emissor      then btn_co_emissorClick(nil);
    if Sender = msk_cd_cancelador   then btn_co_canceladorClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_pesq.pgctrl_pesq_sdaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

procedure Tfrm_sda_pesq.msk_nr_processoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.msk_cd_distribuidorExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.dblckpbox_status_sdaClick(Sender: TObject);
begin
  str_status := datm_sda_pesq.qry_status_sda_CD_STATUS_SDA.AsString;
end;

procedure Tfrm_sda_pesq.btn_co_distribuidorClick(Sender: TObject);
begin
  with datm_sda_pesq do
  begin
    Application.CreateForm( Tfrm_usuario, frm_usuario );
    with frm_usuario do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_usuario.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_distribuidor.Text := frm_usuario.Cons_OnLine_Texto;
      msk_cd_distribuidorExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_pesq.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_sda_pesq.btn_pesquisaClick(Sender: TObject);
begin
  GeraSqlStr;

  if pgctrl_pesq_sda.ActivePage = ts_filtros then pgctrl_pesq_sda.ActivePage := ts_lista;
end;

procedure Tfrm_sda_pesq.msk_vl_sdaExit(Sender: TObject);
begin
  if msk_vl_sda.Text = '' then Exit;
  vl_sda := StrToFloat( msk_vl_sda.Text );
  msk_vl_sda.Text := FormatFloat( '0.00', vl_sda );
end;

procedure Tfrm_sda_pesq.msk_cd_emissorExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.msk_cd_canceladorExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_sda_pesq.btn_co_emissorClick(Sender: TObject);
begin
  with datm_sda_pesq do
  begin
    Application.CreateForm( Tfrm_usuario, frm_usuario );
    with frm_usuario do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_usuario.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_emissor.Text := frm_usuario.Cons_OnLine_Texto;
      msk_cd_emissorExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_pesq.btn_co_canceladorClick(Sender: TObject);
begin
  with datm_sda_pesq do
  begin
    Application.CreateForm( Tfrm_usuario, frm_usuario );
    with frm_usuario do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_usuario.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_cancelador.Text := frm_usuario.Cons_OnLine_Texto;
      msk_cd_canceladorExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_pesq.btnExcelClick(Sender: TObject);
begin
  GeraExcel(cxGrid)
end;

procedure Tfrm_sda_pesq.GeraExcel(var grid : TcxGrid);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';

  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName, grid, False, True, False)
    else
    if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName, grid, False)
    else
    if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName, grid, False)
    else
    if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName, grid, False);

    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure Tfrm_sda_pesq.cxGridDBTableView1CustomDrawIndicatorCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);
var
  Txt: string;
  ARect: TRect;
  Idx:Integer;
begin
  if not (AViewInfo is TcxGridIndicatorRowItemViewInfo) then Exit;
  ACanvas.Brush.Color := AViewInfo.Params.Color;
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.Pen.Color := clBlack;
  ACanvas.Canvas.Rectangle(AViewInfo.Bounds);
  ARect := AViewInfo.Bounds;
 InflateRect(ARect, -3, -3);
  with TcxGridIndicatorRowItemViewInfo(AViewInfo) do
    Txt := IntToStr(RowViewInfo.Index + GridViewInfo.FirstRecordIndex + 1);
  DrawText(ACanvas.Handle, PChar(Txt), Length(Txt), ARect, DT_VCENTER or DT_CENTER);
  ADone := True;
end;

end.
