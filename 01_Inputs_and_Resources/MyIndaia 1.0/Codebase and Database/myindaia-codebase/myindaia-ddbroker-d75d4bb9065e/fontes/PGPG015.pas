unit PGPG015;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Menus, Buttons,
  ExtCtrls, Db, DBTables, Funcoes, PGGP017, ConsOnLineEx;

type
  Tfrm_pesq_pagto = class(TForm)
    pnl_pesq_pagto: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    pgctrl_pesq_pagto: TPageControl;
    ts_filtros: TTabSheet;
    ts_lista: TTabSheet;
    dbg_lib_proc: TDBGrid;
    lbl_item: TLabel;
    btn_co_item: TSpeedButton;
    msk_cd_item: TMaskEdit;
    edt_nm_item: TEdit;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    mi_manut_proc: TMenuItem;
    btn_co_usuario: TSpeedButton;
    lbl_dt_inicio: TLabel;
    lbl_dt_termino: TLabel;
    lbl_usuario: TLabel;
    lbl_nr_processo: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_dt_inicio: TMaskEdit;
    msk_dt_termino: TMaskEdit;
    edt_nm_usuario: TEdit;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_status: TLabel;
    dblckbox_cd_status: TDBLookupComboBox;
    dblckpbox_tp_destino: TDBLookupComboBox;
    lbl_tp_destino: TLabel;
    lbl_vl_pagto: TLabel;
    msk_vl_pagto: TMaskEdit;
    lbl_nr_docto: TLabel;
    msk_nr_docto: TMaskEdit;
    btn_pesquisa: TSpeedButton;
    btn_co_processo: TSpeedButton;
    msk_cd_usuario: TMaskEdit;
    pnl_pagtos: TPanel;
    Label1: TLabel;
    lbl_vl_item: TLabel;
    Label2: TLabel;
    lbl_dt_pagto: TLabel;
    lbl_calculo2: TLabel;
    Label4: TLabel;
    dbedt_vl_pagto: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_dt_pagto: TDBEdit;
    dbedt_cd_calculo: TDBEdit;
    dbedt_nm_calculo: TDBEdit;
    dbedt_tp_destino: TDBEdit;
    dbedt_cd_status: TDBEdit;
    lbl_calculo: TLabel;
    btn_co_calculo: TSpeedButton;
    msk_cd_calculo: TMaskEdit;
    edt_nm_calculo: TEdit;
    lbl_usuario_solic: TLabel;
    dbedt_cd_usuario: TDBEdit;
    dbedt_nm_usuario: TDBEdit;
    lnl_nr_docto: TLabel;
    dbedt_nr_docto: TDBEdit;
    Label5: TLabel;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    shpNav: TShape;
    bvl1: TBevel;
    pnlTop: TPanel;
    shpColor: TShape;
    Label12: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    Label13: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    procedure msk_cd_itemExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_pesq_pagtoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_pesq_pagtoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_terminoEnter(Sender: TObject);
    procedure msk_dt_terminoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_usuarioExit(Sender: TObject);
    procedure dblckpbox_tp_destinoClick(Sender: TObject);
    procedure dblckbox_cd_statusClick(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure msk_cd_calculoExit(Sender: TObject);
    procedure btn_co_calculoClick(Sender: TObject);
    procedure msk_vl_pagtoExit(Sender: TObject);
  private
    str_valor : String;
    dt_inicio, dt_termino : TDate;
    str_status, str_tp_destino : String;
    vl_pagto : Double;
    procedure GeraSqlStr;
    function Consiste : Boolean;
  public
  end;

var
  frm_pesq_pagto: Tfrm_pesq_pagto;

implementation

uses GSMLIB,  PGGP001, PGGP015, PGSM016, PGSM018, PGSM010, PGSM059, PGSM090,
     PGPG016, PGSM136;

{$R *.DFM}

procedure Tfrm_pesq_pagto.msk_cd_itemExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_pagto.msk_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_pagto.msk_cd_produtoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_pagto.msk_cd_favorecidoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_pagto.btn_co_itemClick(Sender: TObject);
begin
{  with datm_pesq_pagto do
  begin
    Application.CreateForm(Tfrm_item, frm_item );
    with frm_item do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_item.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_item.Text := frm_item.Cons_OnLine_Texto;
      msk_cd_itemExit(nil);
    end;
  end; }

  if Sender is TSpeedButton then begin
    msk_cd_item.Text := ConsultaOnLineEx('TITEM','Itens',['CD_ITEM','NM_ITEM'],['Código','Descrição'],'CD_ITEM', nil, 1, msk_cd_item.text);
  end else
    edt_nm_item.Text := ConsultaLookUP('TITEM','CD_ITEM', msk_cd_item.Text,'NM_ITEM');

end;

procedure Tfrm_pesq_pagto.btn_co_unid_negClick(Sender: TObject);
begin
{  with datm_pesq_pagto do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
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
  end; }

  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT (U.CD_UNID_NEG) AS UNID, U.NM_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                                '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                                '  WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                                'GROUP BY U.CD_UNID_NEG, U.NM_UNID_NEG '  ,
                                                'Unidades de Negócio', ['UNID', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'UNID', nil, msk_cd_unid_neg.text )
  else
    edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT U.AP_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                              '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                              ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                              '   AND U.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                              'GROUP BY U.AP_UNID_NEG',
                                              'AP_UNID_NEG');
end;

procedure Tfrm_pesq_pagto.btn_co_produtoClick(Sender: TObject);
begin
{  with datm_pesq_pagto do
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
  end; }

  if Sender is TSpeedButton then begin
    msk_cd_produto.Text := ConsultaOnLineExSQL('SELECT (P.CD_PRODUTO) AS PROD, P.AP_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                               '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''') ' +
                                               ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                               ' GROUP BY P.CD_PRODUTO, P.AP_PRODUTO ',
                                               'Produto',['PROD','AP_PRODUTO'],['Código','Descrição'],'PROD',frm_main.mi_tabela_produto, msk_cd_produto.Text);

  End Else
    edt_nm_produto.Text := ConsultaLookUPSQL('SELECT P.AP_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                             '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''') ' +
                                             ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                             '   AND P.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ' +
                                             ' GROUP BY P.AP_PRODUTO',
                                             'AP_PRODUTO');

end;

function Tfrm_pesq_pagto.Consiste : Boolean;
begin
  Consiste := True;
{  with datm_pesq_pagto do
  begin

    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) = '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Unidade não encontrada!', 2);
        msk_cd_unid_neg.Text     := '';
        edt_nm_unid_neg.Text     := '';
        edt_nm_produto.Text      := '';
        Consiste                 := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := qry_usuario_habilitacao_look_nm_unid_neg.AsString;
        edt_nm_produto.Text      := '';
      end;
    end;

    if ( Trim( msk_cd_unid_neg.Text ) = '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_produto );
      if Not ( qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Produto não encontrado!', 2);
        msk_cd_produto.Text      := '';
        edt_nm_produto.Text      := '';
        edt_nm_unid_neg.Text     := '';
        Consiste                 := False;
        msk_cd_produto.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := '';
        edt_nm_produto.Text      := qry_usuario_habilitacao_look_nm_produto.AsString;
      end;
    end;

    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      ValCodEdt( msk_cd_produto );
      if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Unidade x Produto não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text     := '';
        edt_nm_unid_neg.Text     := '';
        msk_cd_produto.Text      := '';
        edt_nm_produto.Text      := '';
        Consiste                 := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := qry_usuario_habilitacao_look_nm_unid_neg.AsString;
        edt_nm_produto.Text      := qry_usuario_habilitacao_look_nm_produto.AsString;
      end;
    end;

    if ( Trim( msk_cd_unid_neg.Text ) = '' ) and ( Trim( msk_cd_produto.Text ) = '' ) then
    begin
      edt_nm_unid_neg.Text       := '';
      edt_nm_produto.Text        := '';
    end; }

      // Unidade
  if (Trim(msk_cd_unid_neg.text) <> '') then begin
    msk_cd_unid_neg.Text :=  Copy('00' , 1, 2- Length(Trim(msk_cd_unid_neg.Text))) + Trim(msk_cd_unid_neg.Text);
    edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT U.AP_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                              '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                              ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                              '   AND U.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                              'GROUP BY U.CD_UNID_NEG, U.AP_UNID_NEG',
                                              'AP_UNID_NEG');

    if edt_nm_unid_neg.text = '' then begin
      ShowMessage('Unidade de Negócio não cadastrada ou Usuário sem direitos de acesso!');
      msk_cd_unid_neg.Text := '';
      edt_nm_unid_neg.Text := '';
      Consiste         := False;
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

  end;

  // Produto
  if (Trim(msk_cd_produto.text) <> '') then begin
    msk_cd_produto.Text :=  Copy('00' , 1, 2- Length(Trim(msk_cd_produto.Text))) + Trim(msk_cd_produto.Text);
    edt_nm_produto.Text := ConsultaLookUPSQL('SELECT P.AP_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                             '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''') ' +
                                             ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                             '   AND P.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ' +
                                             ' GROUP BY P.AP_PRODUTO',
                                             'AP_PRODUTO');

    if edt_nm_produto.Text = '' then begin
      ShowMessage( 'Produto não cadastrado ou Usuário sem direitos de acesso!');
      msk_cd_produto.Text := '';
      edt_nm_produto.Text := '';
      Consiste            := False;
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end;

    {Processo}
  if ( Trim(msk_cd_unid_neg.Text ) <> '' ) and
     ( Trim(msk_cd_produto.Text)   <> '' ) and
     ( Trim(msk_nr_processo.Text)  <> '' ) then begin

    msk_nr_processo.Text := ConsultaLookUPSQL('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ' +
                                             '       FROM   TPROCESSO PR ( NOLOCK ) ' +
                                             '       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE' +
                                             ' WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text + ''' ' +
                                             '  AND PR.IN_CANCELADO = ''0'' ', 'NR_PROCESSO');

    if msk_nr_processo.Text = '' then begin
      ShowMessage( 'Processo inexistente ou cancelado!');
      msk_nr_processo.SetFocus;
      Exit;
    end;
  end;
{      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if Not ( qry_processo_.Locate('NR_PROCESSO', msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Processo inexistente ou não liberado!', 2);
        msk_nr_processo.Text := '';
        Consiste             := False;
        msk_nr_processo.SetFocus;
      end;
    end;  }

    {Usuário}
  if ( Trim( msk_cd_usuario.Text ) <> '' ) then  begin
    msk_cd_usuario.Text :=  Copy('0000' , 1, 4- Length(Trim(msk_cd_usuario.Text))) + Trim(msk_cd_usuario.Text);
    edt_nm_usuario.Text := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO (NOLOCK) ' +
                                             ' WHERE CD_USUARIO = ''' + msk_cd_usuario.Text + ''' AND IN_ATIVO = "1" ',
                                             'NM_USUARIO');
    if edt_nm_usuario.Text = '' then begin
      ShowMessage('Usuário inexistente!');
      msk_cd_usuario.Text      := '';
      edt_nm_usuario.Text      := '';
      Consiste                 := False;
      msk_cd_usuario.SetFocus;
    end;
  end;

    {      ValCodEdt( msk_cd_usuario );
      if Not ( qry_usuario_.Locate('CD_USUARIO', msk_cd_usuario.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Usuário inexistente!', 2);
        msk_cd_usuario.Text      := '';
        edt_nm_usuario.Text      := '';
        Consiste                 := False;
        msk_cd_usuario.SetFocus;
      end
      else
      begin
        edt_nm_usuario.Text      := qry_usuario_NM_USUARIO.AsString;
      end;
    end
    else
    begin
      edt_nm_usuario.Text        := '';
    end; }

    {Item}
   if ( Trim( msk_cd_item.Text ) <> '' ) then  begin
    msk_cd_item.Text :=  Copy('000' , 1, 3- Length(Trim(msk_cd_item.Text))) + Trim(msk_cd_item.Text);
    edt_nm_item.Text := ConsultaLookUp('TITEM', 'CD_ITEM', msk_cd_item.text, 'NM_ITEM');
    if edt_nm_item.text = '' then begin
      ShowMessage('Item não cadastrado!');
      msk_cd_item.Text := '';
      edt_nm_item.Text := '';
      Consiste         := False;
      msk_cd_item.SetFocus;
      Exit;
    end;
   end;
{      ValCodEdt( msk_cd_item );
      if Not ( qry_item_.Locate('CD_ITEM', msk_cd_item.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Item inexistente!', 2);
        msk_cd_item.Text    := '';
        edt_nm_item.Text    := '';
        Consiste            := False;
        msk_cd_item.SetFocus;
      end
      else
      begin
        edt_nm_item.Text    := qry_item_NM_ITEM.AsString;
      end;
    end
    else
    begin
      edt_nm_item.Text      := '';
    end; }

    {Favorecido}
  if ( Trim( msk_cd_favorecido.Text ) <> '' ) then begin
    msk_cd_favorecido.Text :=  Copy('00000' , 1, 5 - Length(Trim(msk_cd_favorecido.Text))) + Trim(msk_cd_favorecido.Text);
    edt_nm_favorecido.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO', msk_cd_favorecido.Text,'NM_FAVORECIDO');

    if edt_nm_favorecido.Text = '' then begin
      BoxMensagem( 'Favorecido não cadastrado!', 2 );
      msk_cd_favorecido.Text := '';
      edt_nm_favorecido.Text := '';
      Consiste               := False;
      msk_cd_favorecido.SetFocus;
      Exit;
    end;
  end;
{      ValCodEdt( msk_cd_favorecido );
      if Not ( qry_favorecido_.Locate('CD_FAVORECIDO', msk_cd_favorecido.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Favorecido inexistente!', 2);
        msk_cd_favorecido.Text := '';
        edt_nm_favorecido.Text := '';
        Consiste               := False;
        msk_cd_favorecido.SetFocus;
      end
      else
      begin
        edt_nm_favorecido.Text := qry_favorecido_NM_FAVORECIDO.AsString;
      end;
    end
    else
    begin
      edt_nm_favorecido.Text   := '';
    end; }

    {Tipo de Cálculo}
  if ( Trim( msk_cd_calculo.Text ) <> '' ) then begin
    msk_cd_calculo.Text :=  Copy('000' , 1, 3- Length(Trim(msk_cd_calculo.Text))) + Trim(msk_cd_calculo.Text);
    edt_nm_calculo.Text := ConsultaLookUP('TCALCULO','CD_CALCULO', msk_cd_calculo.Text,'NM_CALCULO');

    if (edt_nm_calculo.Text = '') then begin
      ShowMessage('Cálculo inexistente!');
      msk_cd_calculo.Text := '';
      edt_nm_calculo.Text := '';
      Consiste            := False;
      msk_cd_calculo.SetFocus;
    end


  end;
{      ValCodEdt( msk_cd_calculo );
      if Not ( qry_calculo_.Locate('CD_CALCULO', msk_cd_calculo.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Cálculo inexistente!', 2);
        msk_cd_calculo.Text := '';
        edt_nm_calculo.Text := '';
        Consiste            := False;
        msk_cd_calculo.SetFocus;
      end
      else
      begin
        edt_nm_calculo.Text := qry_calculo_NM_CALCULO.AsString;
      end;
    end
    else
    begin
      edt_nm_calculo.Text   := '';
    end;
  end;}
end;

procedure Tfrm_pesq_pagto.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_pesq_pagto, datm_pesq_pagto );
  with datm_pesq_pagto do
  begin
    // traz as habilitacoes para o usuario
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;

    // abre queries
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_tp_destino_.Close;
    qry_tp_destino_.Prepare;
    qry_tp_destino_.Open;

    qry_status_solic_pagto_.Close;
    qry_status_solic_pagto_.Prepare;
    qry_status_solic_pagto_.Open;

    qry_calculo_.Close;
    qry_calculo_.Prepare;
    qry_calculo_.Open;

    // atualiza tela
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_produto.Text  := str_cd_produto;
    Consiste;

  end;
end;

procedure Tfrm_pesq_pagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_pesq_pagto Do
  begin
    qry_usuario_habilitacao_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_favorecido_.Close;
    qry_item_.Close;
    qry_unid_neg_.Close;
    qry_tp_destino_.Close;
    qry_status_solic_pagto_.Close;
    qry_calculo_.Close;

//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_pesq_pagto.pgctrl_pesq_pagtoChange(Sender: TObject);
begin
  if pgctrl_pesq_pagto.ActivePage = ts_lista then btn_pesquisaClick(nil);
end;

procedure Tfrm_pesq_pagto.GeraSqlStr;
var
  sqlstr : String;
begin
  sqlstr := '';

  sqlstr := sqlstr + 'SELECT S.NR_PROCESSO, S.CD_ITEM, S.CD_USUARIO_SOLIC, P.CD_UNID_NEG, ' +
                     'U.NM_UNID_NEG, P.CD_PRODUTO, PR.NM_PRODUTO, S.CD_CALCULO, S.CD_FAVORECIDO, ' +
                     'S.TP_DESTINO, S.CD_STATUS, S.VL_PAGTO, S.NR_DOCTO, S.DT_PAGTO ';
  sqlstr := sqlstr + 'FROM TSOLIC_PAGTO S, TPROCESSO P, TUNID_NEG U, TPRODUTO PR ';
  sqlstr := sqlstr + 'WHERE S.NR_PROCESSO = P.NR_PROCESSO AND ' +
                     'P.CD_UNID_NEG = U.CD_UNID_NEG AND ' +
                     'P.CD_PRODUTO = PR.CD_PRODUTO AND ' +
                     '(P.CD_UNID_NEG+P.CD_PRODUTO) IN ' +
                     '(SELECT CD_UNID_NEG+CD_PRODUTO ' +
                     'FROM TUSUARIO_HABILITACAO ' +
                     'WHERE CD_USUARIO='''+str_cd_usuario+''' ' +
                     'AND IN_ATIVO=''1'') ';

  {Por período}
  if msk_dt_inicio.Text <> '  /  /    ' then
  begin
    sqlstr := sqlstr + 'AND CONVERT(datetime, S.DT_PAGTO, 103 ) >= CONVERT(datetime, "' + msk_dt_inicio.Text + '", 103 ) AND ' +
                       'CONVERT(datetime, S.DT_PAGTO, 103 ) <= CONVERT(datetime, "' + msk_dt_termino.Text + '", 103 ) ';
  end;

  {Unidade}
  if (msk_cd_unid_neg.Text <> '') then
  begin
    sqlstr := sqlstr + ' AND P.CD_UNID_NEG=''' + msk_cd_unid_neg.Text + ''' ';
  end;

  {Produto}
  if (msk_cd_produto.Text <> '') then
  begin
    sqlstr := sqlstr + ' AND P.CD_PRODUTO=''' + msk_cd_produto.Text + ''' ';
  end;

  {Processo}
  if ( msk_nr_processo.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND S.NR_PROCESSO=''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text + ''' ';
  end;

  {Usuário}
  if Trim( msk_cd_usuario.Text ) <>  '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_USUARIO_SOLIC=''' + msk_cd_usuario.Text + ''' ';
  end;

  {Item}
  if Trim( msk_cd_item.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_ITEM=''' + msk_cd_item.Text + ''' ';
  end;

  {Favorecido}
  if Trim( msk_cd_favorecido.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND S.CD_FAVORECIDO=''' + msk_cd_favorecido.Text + ''' ';
  end;

  {Tipo de Cálculo}
  if (msk_cd_calculo.Text <> '') then
  begin
    sqlstr := sqlstr + ' AND S.CD_CALCULO=''' + msk_cd_calculo.Text + ''' ';
  end;

  {Tipo de Destino}
  if Trim( str_tp_destino ) <> '' then
  begin
    sqlstr := sqlstr + 'AND S.TP_DESTINO = "' + str_tp_destino + '"';
  end;

  {Status}
  if Trim( str_status ) <> '' then
  begin
    sqlstr := sqlstr + 'AND S.CD_STATUS = "' + str_status + '"';
  end;

  {Valor}
  if msk_vl_pagto.Text <> '' then
  begin
    str_valor := msk_vl_pagto.Text;
    if Pos(',', str_valor) > 0 then str_valor[Pos(',', str_valor)] := '.';
    sqlstr := sqlstr + 'AND S.VL_PAGTO = ' + str_valor;
  end;

  {Nº Docto}
  if Trim( msk_nr_docto.Text ) <> '' then
  begin
    sqlstr := sqlstr + ' AND S.NR_DOCTO=''' + msk_nr_docto.Text + ''' ';
  end;

  datm_pesq_pagto.qry_pesq_.Close;
  datm_pesq_pagto.qry_pesq_.Sql.Clear;
  datm_pesq_pagto.qry_pesq_.Sql.Add(sqlstr);
  datm_pesq_pagto.qry_pesq_.Prepare;
  datm_pesq_pagto.qry_pesq_.Open;

end;

procedure Tfrm_pesq_pagto.FormShow(Sender: TObject);
begin
  //cores do sistema
  pnl_pesq_pagto.Color := clMenuBroker;
  shpColor.Brush.Color := clPnlClaroBroker;
  shpNav.Brush.Color := clPnlClaroBroker;

  pgctrl_pesq_pagto.ActivePage := ts_filtros;
end;

procedure Tfrm_pesq_pagto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pesq_pagto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_pesq_pagto.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_nr_processo     then btn_co_processoClick(btn_co_processo);
    if Sender = msk_cd_usuario      then btn_co_usuarioClick(btn_co_usuario);
    if Sender = msk_cd_unid_neg     then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto      then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_item         then btn_co_itemClick(btn_co_item);
    if Sender = msk_cd_favorecido   then btn_co_favorecidoClick(btn_co_favorecido);
    if Sender = msk_cd_calculo      then btn_co_calculoClick(btn_co_calculo);
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

procedure Tfrm_pesq_pagto.pgctrl_pesq_pagtoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

procedure Tfrm_pesq_pagto.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      dt_inicio := StrToDate(msk_dt_inicio.Text);
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_pagto.msk_dt_terminoEnter(Sender: TObject);
begin
  if msk_dt_termino.Text <> '  /  /    ' then
  begin
    if dt_inicio > dt_termino then
    begin
      BoxMensagem('Data de início maior que data de término!', 2);
      msk_dt_inicio.Text := '  /  /   ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_pagto.msk_dt_terminoExit(Sender: TObject);
begin
  try
    if msk_dt_termino.Text <> '  /  /    ' then
    begin
      dt_termino := StrToDate(msk_dt_termino.Text);
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_termino.SetFocus;
      Exit;
    end;
  end;

  if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_termino.Text <> '  /  /    ' ) then
  begin
    if dt_inicio > dt_termino then
    begin
      BoxMensagem('Data de início maior que data de término!', 2);
      msk_dt_inicio.Text := '  /  /    ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_pagto.msk_nr_processoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_pagto.msk_cd_usuarioExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_pagto.dblckpbox_tp_destinoClick(Sender: TObject);
begin
  str_tp_destino := datm_pesq_pagto.qry_tp_destino_CD_TP_DESTINO.AsString;
end;

procedure Tfrm_pesq_pagto.dblckbox_cd_statusClick(Sender: TObject);
begin
  str_status := datm_pesq_pagto.qry_status_solic_pagto_CODIGO.AsString;
end;

procedure Tfrm_pesq_pagto.btn_co_usuarioClick(Sender: TObject);
begin
{  with datm_pesq_pagto do
  begin
    Application.CreateForm(Tfrm_usuario, frm_usuario );
    with frm_usuario do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_usuario.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_usuario.Text := frm_usuario.Cons_OnLine_Texto;
      msk_cd_usuarioExit(nil);
    end;
  end;  }

  if Sender is TSpeedButton then
    msk_cd_usuario.Text := ConsultaOnLineExFiltro('TUSUARIO', 'Usuários', ['CD_USUARIO', 'NM_USUARIO'], ['Código', 'Nome'], 'CD_USUARIO',' IN_ATIVO = "1"', nil, msk_cd_usuario.text )
  else
    edt_nm_usuario.Text := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO (NOLOCK) ' +
                                             ' WHERE CD_USUARIO = ''' + msk_cd_usuario.Text + ''' AND IN_ATIVO = "1" ',
                                             'NM_USUARIO');


end;

procedure Tfrm_pesq_pagto.btn_co_favorecidoClick(Sender: TObject);
begin
{  with datm_pesq_pagto do
  begin
    Application.CreateForm(Tfrm_Favor, frm_Favor );
    with frm_Favor do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_Favor.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_favorecido.Text := frm_Favor.Cons_OnLine_Texto;
      msk_cd_favorecidoExit(nil);
    end;
  end;   }

  if Sender is TSpeedButton then begin
    msk_cd_favorecido.Text := ConsultaOnLineEx('TFAVORECIDO','Favorecidoss',['CD_FAVORECIDO','NM_FAVORECIDO'],['Código','Descrição'],'CD_FAVORECIDO', nil, 1, msk_cd_favorecido.text);
  end else
    edt_nm_favorecido.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO', msk_cd_favorecido.Text,'NM_FAVORECIDO');
  
end;

procedure Tfrm_pesq_pagto.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
  Application.ProcessMessages;
{begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo.Text := Copy(frm_consulta_processo.Nr_Processo,5,14);
    msk_nr_processoExit(nil);
  end;}
end;

procedure Tfrm_pesq_pagto.btn_pesquisaClick(Sender: TObject);
begin
  GeraSqlStr;
  if pgctrl_pesq_pagto.ActivePage = ts_filtros then pgctrl_pesq_pagto.ActivePage := ts_lista; 
end;

procedure Tfrm_pesq_pagto.msk_cd_calculoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_pagto.btn_co_calculoClick(Sender: TObject);
begin
{  Cons_On_line( 'DBBROKER', 'TCALCULO', datm_pesq_pagto.qry_pesq_CD_CALCULO,
                'Tipo de Cálculo', 7, '','TTable');}

  if Sender is TSpeedButton then begin
    msk_cd_calculo.Text := ConsultaOnLineEx('TCALCULO','Tipos de Cálculo',['CD_CALCULO','NM_CALCULO'],['Código','Descrição'],'CD_CALCULO', nil, 1, msk_cd_calculo.text);
  end else
    edt_nm_calculo.Text := ConsultaLookUP('TCALCULO','CD_CALCULO', msk_cd_calculo.Text,'NM_CALCULO');

end;

procedure Tfrm_pesq_pagto.msk_vl_pagtoExit(Sender: TObject);
begin
  if msk_vl_pagto.Text = '' then Exit;
  vl_pagto := StrToFloat( msk_vl_pagto.Text );
  msk_vl_pagto.Text := FormatFloat( '0.00', vl_pagto );
end;

end.
