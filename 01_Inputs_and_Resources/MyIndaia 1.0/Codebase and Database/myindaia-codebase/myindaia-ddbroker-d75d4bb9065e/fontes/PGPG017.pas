unit PGPG017;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Menus, Buttons,
  ExtCtrls, Db, DBTables, Funcoes, ConsOnLineEx, pggp017, Variants;

type
  Tfrm_pesq_adm = class(TForm)
    pnl_pesq_adm: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    pgctrl_pesq_adm: TPageControl;
    ts_filtros: TTabSheet;
    ts_lista: TTabSheet;
    dbg_lib_proc: TDBGrid;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    mi_manut_proc: TMenuItem;
    btn_co_usuario: TSpeedButton;
    lbl_usuario: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_usuario: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    lbl_status: TLabel;
    dblckbox_cd_status: TDBLookupComboBox;
    lbl_vl_vencto: TLabel;
    msk_vl_lancto: TMaskEdit;
    lbl_nr_docto: TLabel;
    msk_nr_docto: TMaskEdit;
    btn_pesquisa: TSpeedButton;
    msk_cd_usuario: TMaskEdit;
    lbl_historico: TLabel;
    btn_co_historico: TSpeedButton;
    msk_cd_historico: TMaskEdit;
    edt_nm_historico: TEdit;
    msk_cd_acesso: TMaskEdit;
    lbl_acesso: TLabel;
    msk_cd_aux: TMaskEdit;
    lbl_aux: TLabel;
    btn_co_ct_contabil: TSpeedButton;
    lbl_ct_contabil: TLabel;
    edt_nm_ct_contabil: TEdit;
    msk_cd_ct_contabil: TMaskEdit;
    grp_pagto: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    msk_dt_inicio_pagto: TMaskEdit;
    msk_dt_termino_pagto: TMaskEdit;
    rdgrp_tp_natureza: TRadioGroup;
    grp_vencto: TGroupBox;
    lbl_dt_inicio: TLabel;
    lbl_dt_termino: TLabel;
    msk_dt_inicio_vencto: TMaskEdit;
    msk_dt_termino_vencto: TMaskEdit;
    Panel1: TPanel;
    lbl_ct_contabil2: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    lbl_dt_pagto_recebto: TLabel;
    lbl_dt_vencto: TLabel;
    lbl_acesso2: TLabel;
    lbl_aux2: TLabel;
    Label15: TLabel;
    dbedt_vl_lancto: TDBEdit;
    DBEdit2: TDBEdit;
    dbedt_nm_ct_contabil: TDBEdit;
    dbedt_cd_ct_contabil: TDBEdit;
    DBEdit3: TDBEdit;
    dbedt_dt_pagto: TDBEdit;
    dbedt_dt_vencto: TDBEdit;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    dbrdgrp_tp_natureza: TDBRadioGroup;
    dbedt_cd_historico: TDBEdit;
    dbedt_nm_historico: TDBEdit;
    Label1: TLabel;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_nm_usuario: TDBEdit;
    Label2: TLabel;
    dbedt_cd_usuario: TDBEdit;
    Label3: TLabel;
    dbedt_nr_docto: TDBEdit;
    lbl_nr_lancamento: TLabel;
    dbedt_nr_lancamento: TDBEdit;
    shpNav: TShape;
    pnlTop: TPanel;
    Label12: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    shpColor: TShape;
    bvl1: TBevel;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_pesq_admChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_pesq_admChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure msk_dt_inicio_venctoExit(Sender: TObject);
    procedure msk_dt_termino_venctoEnter(Sender: TObject);
    procedure msk_dt_termino_venctoExit(Sender: TObject);
    procedure msk_cd_usuarioExit(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure dblckbox_cd_statusClick(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure msk_cd_historicoExit(Sender: TObject);
    procedure msk_vl_lanctoExit(Sender: TObject);
    procedure msk_cd_acessoEnter(Sender: TObject);
    procedure msk_cd_auxEnter(Sender: TObject);
    procedure msk_cd_auxExit(Sender: TObject);
    procedure msk_cd_acessoExit(Sender: TObject);
    procedure msk_cd_ct_contabilEnter(Sender: TObject);
    procedure msk_cd_ct_contabilExit(Sender: TObject);
    procedure rdgrp_tp_naturezaExit(Sender: TObject);
    procedure msk_dt_inicio_pagtoExit(Sender: TObject);
    procedure msk_dt_termino_pagtoEnter(Sender: TObject);
    procedure msk_dt_termino_pagtoExit(Sender: TObject);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure btn_co_historicoClick(Sender: TObject);
    procedure dbg_lib_procDblClick(Sender: TObject);
  private
    str_valor : String;
    dt_inicio_vencto, dt_termino_vencto, dt_inicio_pagto, dt_termino_pagto : TDate;
    str_status : String;
    cd_ct_contabil : String[10];
    cd_acesso, cd_aux : String[1];
    vl_lancto : Double;
    verSelec: string[1]; 
    procedure GeraSqlStr;
    function Consiste : Boolean;
  public
  end;

var
  frm_pesq_adm: Tfrm_pesq_adm;

implementation

uses GSMLIB, PGGP001, PGSM016, PGSM018, PGSM041, PGSM090, PGSM168, PGSM174, PGPG018;

{$R *.DFM}

procedure Tfrm_pesq_adm.msk_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_adm.msk_cd_favorecidoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_adm.btn_co_unid_negClick(Sender: TObject);
begin
{  with datm_pesq_adm do
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

function Tfrm_pesq_adm.Consiste : Boolean;
begin
  Consiste := True;
    {Unidade}
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then  begin
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
{      ValCodEdt( msk_cd_unid_neg );
      if Not ( qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Unidade não encontrada!', 2);
        msk_cd_unid_neg.Text     := '';
        edt_nm_unid_neg.Text     := '';
        Consiste                 := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := qry_unid_neg_NM_UNID_NEG.AsString;
      end;
    end; }


    {Usuário}
    if ( Trim( msk_cd_usuario.Text ) <> '' ) then begin
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

  {Conta Contábil}
  with datm_pesq_adm do
  begin
    if datm_pesq_adm.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
    begin
      if ( Trim( msk_cd_ct_contabil.Text ) <> '' ) then
      begin
        if Not ( qry_ct_contabilRM_.Locate('CD_CT_CONTABIL', msk_cd_ct_contabil.Text, [loCaseInsensitive]) ) then
        begin
          BoxMensagem('Conta Contábil Sintética ou inexistente!', 2);
          msk_cd_ct_contabil.Text    := '';
          edt_nm_ct_contabil.Text    := '';
          Consiste                   := False;
          msk_cd_ct_contabil.SetFocus;
        end
        else
        begin
          msk_cd_acesso.Text      := '';
          msk_cd_aux.Text         := '';
          edt_nm_ct_contabil.Text := qry_ct_contabilRM_NM_CT_CONTABIL.AsString;
        end;
      end
      else
      begin
        msk_cd_acesso.Text      := '';
        msk_cd_aux.Text         := '';
        edt_nm_ct_contabil.Text := '';
      end;
    end
    else
    begin
      if ( Trim( msk_cd_ct_contabil.Text ) <> '' ) then
      begin
        if Not ( qry_ct_contabil_.Locate('CD_CT_CONTABIL', msk_cd_ct_contabil.Text, [loCaseInsensitive]) ) then
        begin
          BoxMensagem('Conta Contábil Sintética ou inexistente!', 2);
          msk_cd_ct_contabil.Text    := '';
          edt_nm_ct_contabil.Text    := '';
          Consiste                   := False;
          msk_cd_ct_contabil.SetFocus;
        end
        else
        begin
          msk_cd_acesso.Text      := qry_ct_contabil_CD_ACESSO.AsString;
          msk_cd_aux.Text         := qry_ct_contabil_CD_AUX.AsString;
          edt_nm_ct_contabil.Text := qry_ct_contabil_NM_CT_CONTABIL.AsString;
        end;
      end
      else
      begin
        msk_cd_acesso.Text      := '';
        msk_cd_aux.Text         := '';
        edt_nm_ct_contabil.Text := '';
      end;
    end;
  end;

    {Favorecido}
  if (msk_cd_favorecido.Text <> '') then begin
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
     { ValCodEdt( msk_cd_favorecido );
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

    {Histórico}
    if ( Trim( msk_cd_historico.Text ) <> '' ) then begin
    msk_cd_historico.Text :=  Copy('000' , 1, 3- Length(Trim(msk_cd_historico.Text))) + Trim(msk_cd_historico.Text);
    edt_nm_historico.Text := ConsultaLookUP('THIST_PADRAO','CD_HISTORICO', msk_cd_historico.Text,'NM_HISTORICO');

    if edt_nm_historico.Text = '' then begin
      BoxMensagem( 'Histórico não cadastrado!', 2 );
      msk_cd_historico.Text := '';
      edt_nm_historico.Text := '';
      Consiste              := False;
      msk_cd_historico.SetFocus;
      Exit;
    end;
    end;
{      ValCodEdt( msk_cd_historico );
      if Not ( qry_historico_.Locate('CD_HISTORICO', msk_cd_historico.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Histórico inexistente!', 2);
        msk_cd_historico.Text  := '';
        edt_nm_historico.Text  := '';
        Consiste               := False;
        msk_cd_historico.SetFocus;
      end
      else
      begin
        edt_nm_historico.Text    := qry_historico_NM_HISTORICO.AsString;
      end;
    end
    else
    begin
      edt_nm_historico.Text      := '';
    end;}

    {Banco}
    if (msk_cd_banco.Text <> '') then begin
          msk_cd_banco.Text :=  Copy('000' , 1, 3- Length(Trim(msk_cd_banco.Text))) + Trim(msk_cd_banco.Text);
    edt_nm_banco.Text := ConsultaLookUp('TBANCO', 'CD_BANCO', msk_cd_banco.text, 'NM_BANCO');

    if edt_nm_banco.Text = '' then begin
      ShowMessage( 'Banco não cadastrado!');
      msk_cd_banco.Text := '';
      edt_nm_banco.Text := '';
      Consiste          := False;
      msk_cd_banco.SetFocus;
      Exit;
    end;

    end;
{      ValCodEdt( msk_cd_banco );
      if Not ( qry_banco_.Locate('CD_BANCO', msk_cd_banco.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Banco inexistente!', 2);
        msk_cd_banco.Text := '';
        edt_nm_banco.Text := '';
        Consiste          := False;
        msk_cd_banco.SetFocus;
      end
      else
      begin
        edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
      end;
    end
    else
    begin
      edt_nm_banco.Text   := '';
    end;
  end; }
end;

procedure Tfrm_pesq_adm.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_pesq_adm, datm_pesq_adm );
  with datm_pesq_adm do
  begin
    // abre queries
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;

    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_historico_.Close;
    qry_historico_.Prepare;
    qry_historico_.Open;

    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
    begin
      {Acesso}
      lbl_acesso.Visible                      := False;
      lbl_acesso2.Visible                     := False;
      msk_cd_acesso.Visible                   := False;
      dbedt_cd_acesso.Visible                 := False;
      {Aux}
      lbl_aux.Visible                         := False;
      lbl_aux2.Visible                        := False;
      msk_cd_aux.Visible                      := False;
      dbedt_cd_aux.Visible                    := False;
      {Conta Contábil}
      lbl_ct_contabil.Left                    := lbl_acesso.Left;
      lbl_ct_contabil2.Left                   := lbl_acesso2.Left;
      msk_cd_ct_contabil.Left                 := msk_cd_acesso.Left;
      dbedt_cd_ct_contabil.Left               := dbedt_cd_acesso.Left;
      edt_nm_ct_contabil.Left                 := msk_cd_acesso.Left + 80;
      dbedt_nm_ct_contabil.Left               := dbedt_cd_acesso.Left + 80;
      edt_nm_ct_contabil.Width                := edt_nm_ct_contabil.Width + 90;
      dbedt_nm_ct_contabil.Width              := dbedt_nm_ct_contabil.Width + 90;

      dbedt_nm_ct_contabil.DataField          := 'LookCtContabilRM';
      //dbg_lib_proc.Columns[2].FieldName       := 'LookCtContabilRM';
      msk_cd_ct_contabil.EditMask             := '';
      qry_pesq_.FieldByName('CD_CT_CONTABIL').EditMask := '';
    end
    else
    begin {ContMaster/SI}
      {Acesso}
      lbl_acesso.Visible                      := True;
      lbl_acesso2.Visible                     := True;
      msk_cd_acesso.Visible                   := True;
      dbedt_cd_acesso.Visible                 := True;
      {Aux}
      lbl_aux.Visible                         := True;
      lbl_aux2.Visible                        := True;
      msk_cd_aux.Visible                      := True;
      dbedt_cd_aux.Visible                    := True;
      {Conta Contábil}
      dbedt_nm_ct_contabil.DataField          := 'LookCtContabil';
      //dbg_lib_proc.Columns[2].FieldName       := 'LookCtContabil';
      msk_cd_ct_contabil.EditMask             := '999.99.99999;0;_';
      qry_pesq_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    end;

    qry_status_solic_adm_.Close;
    qry_status_solic_adm_.Prepare;
    qry_status_solic_adm_.Open;

    // atualiza tela
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    Consiste;

  end;
end;

procedure Tfrm_pesq_adm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_pesq_adm Do
  begin
    qry_param_.Close;
    qry_unid_neg_.Close;
    qry_favorecido_.Close;
    qry_ct_contabil_.Close;
    qry_unid_neg_.Close;
    qry_historico_.Close;
    qry_status_solic_adm_.Close;
    qry_banco_.Close;

//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_pesq_adm.pgctrl_pesq_admChange(Sender: TObject);
begin
  if pgctrl_pesq_adm.ActivePage = ts_lista then btn_pesquisaClick(nil);
end;

procedure Tfrm_pesq_adm.GeraSqlStr;
var
  sqlstr : String;
begin
  sqlstr := '';

  sqlstr := sqlstr + 'SELECT S.CD_UNID_NEG, S.CD_ACESSO, S.CD_AUX, S.CD_CT_CONTABIL, S.CD_USUARIO_SOLIC, ' +
                     'S.CD_BANCO, S.CD_FAVORECIDO, S.CD_HISTORICO, S.CD_STATUS_ADM, S.VL_LANCTO, ' +
                     'S.NR_DOCTO, S.DT_VENCTO, S.DT_PAGTO, S.TP_NATUREZA, S.NR_LANCAMENTO, S.NR_LANCAMENTO_SELECIONADO, S.DT_LANCTO, S.IN_SELECIONADO ';
  sqlstr := sqlstr + 'FROM   TADM S, TUNID_NEG U ';
  sqlstr := sqlstr + 'WHERE  S.CD_UNID_NEG = U.CD_UNID_NEG ';
  if verSelec = '1' then
    sqlstr := sqlstr + 'AND ISNULL(S.IN_SELECIONADO, "0") = "1" ';

  {Por período de Vencimento}
  if msk_dt_inicio_vencto.Text <> '  /  /    ' then
  begin
    sqlstr := sqlstr + 'AND CONVERT(datetime, S.DT_VENCTO, 103 ) >= CONVERT(datetime, "' + msk_dt_inicio_vencto.Text + '", 103 ) AND ' +
                       'CONVERT(datetime, S.DT_VENCTO, 103 ) <= CONVERT(datetime, "' + msk_dt_termino_vencto.Text + '", 103 ) ';
  end;

  {Por período de Pagamento}
  if msk_dt_inicio_pagto.Text <> '  /  /    ' then
  begin
    sqlstr := sqlstr + 'AND CONVERT(datetime, S.DT_PAGTO, 103 ) >= CONVERT(datetime, "' + msk_dt_inicio_pagto.Text + '", 103 ) AND ' +
                       'CONVERT(datetime, S.DT_PAGTO, 103 ) <= CONVERT(datetime, "' + msk_dt_termino_pagto.Text + '", 103 ) ';
  end;

  {Unidade}
  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then
  begin
    sqlstr := sqlstr + ' AND S.CD_UNID_NEG=''' + msk_cd_unid_neg.Text + ''' ';
  end;

  {Usuário}
  if ( Trim( msk_cd_usuario.Text ) <>  '' ) then
  begin
    sqlstr := sqlstr + ' AND S.CD_USUARIO_SOLIC=''' + msk_cd_usuario.Text + ''' ';
  end;

  {Conta Contábil}
  if ( Trim( msk_cd_ct_contabil.Text ) <> '' ) then
  begin
    sqlstr := sqlstr + ' AND S.CD_CT_CONTABIL=''' + msk_cd_ct_contabil.Text + ''' ';
  end;

  {Favorecido}
  if ( Trim( msk_cd_favorecido.Text ) <> '' ) then
  begin
    sqlstr := sqlstr + ' AND S.CD_FAVORECIDO=''' + msk_cd_favorecido.Text + ''' ';
  end;

  {Histórico}
  if ( Trim( msk_cd_historico.Text ) <> '' ) then
  begin
    sqlstr := sqlstr + ' AND S.CD_HISTORICO=''' + msk_cd_historico.Text + ''' ';
  end;

  {Banco}
  if ( Trim( msk_cd_banco.Text ) <> '' ) then
  begin
    sqlstr := sqlstr + ' AND S.CD_BANCO=''' + msk_cd_banco.Text + ''' ';
  end;

  {Status}
  if Trim( str_status ) <> '' then
  begin
    sqlstr := sqlstr + 'AND S.CD_STATUS_ADM = "' + str_status + '"';
  end;

  {Valor}
  if ( Trim( msk_vl_lancto.Text ) <> '' ) then
  begin
    str_valor := msk_vl_lancto.Text;
    if Pos(',', str_valor) > 0 then str_valor[Pos(',', str_valor)] := '.';
    sqlstr := sqlstr + 'AND S.VL_LANCTO = ' + str_valor;
  end;

  {Nº Docto}
  if ( Trim( msk_nr_docto.Text ) <> '' ) then
  begin
    sqlstr := sqlstr + ' AND S.NR_DOCTO=''' + msk_nr_docto.Text + ''' ';
  end;

  {Natureza}
  if rdgrp_tp_natureza.ItemIndex < 1 then
  begin
    sqlstr := sqlstr + ' AND S.TP_NATUREZA=''C''';
  end
  else
  begin
    sqlstr := sqlstr + ' AND S.TP_NATUREZA=''D''';
  end;

  with datm_pesq_adm do
  begin
    qry_pesq_.Close;
    qry_pesq_.Sql.Clear;
    qry_pesq_.Sql.Add(sqlstr);
    qry_pesq_.Prepare;
    qry_pesq_.Open;
  end;
end;

procedure Tfrm_pesq_adm.FormShow(Sender: TObject);
begin
  //cores do sistema
  pnl_pesq_adm.Color := clMenuBroker;
  shpColor.Brush.Color := clPnlClaroBroker;
  shpNav.Brush.Color := clPnlClaroBroker;

  pgctrl_pesq_adm.ActivePage  := ts_filtros;
  rdgrp_tp_natureza.ItemIndex := 1;

  //verifica permissão odo Cargo para ver tudo ou apenas os selecionados
  VerSelec := ConsultaLookUp('TCARGO', 'CD_CARGO', str_cd_cargo, 'IN_SELECIONADO');
  dbg_lib_proc.Columns[0].Visible := (VerSelec = '0');
  dbg_lib_proc.Columns[1].Visible := (VerSelec = '1');
  if VerSelec = '0' then
    dbedt_nr_lancamento.DataField := 'NR_LANCAMENTO'
  else
    dbedt_nr_lancamento.DataField := 'NR_LANCAMENTO_SELECIONADO';


  if datm_pesq_adm.qry_param_CD_SISTEMA_CONTABIL.AsString = '0' then
    dbg_lib_proc.Columns[3].FieldName := 'LookCtContabilRM'
  else
    dbg_lib_proc.Columns[3].FieldName := 'LookCtContabil';
end;

procedure Tfrm_pesq_adm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pesq_adm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_pesq_adm.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_usuario      then btn_co_usuarioClick(btn_co_usuario);
    if Sender = msk_cd_unid_neg     then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_ct_contabil  then btn_co_ct_contabilClick(nil);
    if Sender = msk_cd_favorecido   then btn_co_favorecidoClick(btn_co_favorecido);
    if Sender = msk_cd_historico    then btn_co_historicoClick(btn_co_historico);
    if Sender = msk_cd_banco        then btn_co_bancoClick(btn_co_banco);
  end;
end;

procedure Tfrm_pesq_adm.pgctrl_pesq_admChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

procedure Tfrm_pesq_adm.msk_dt_inicio_venctoExit(Sender: TObject);
begin
  try
    if msk_dt_inicio_vencto.Text <> '  /  /    ' then
    begin
      dt_inicio_vencto := StrToDate( msk_dt_inicio_vencto.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_inicio_vencto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_adm.msk_dt_termino_venctoEnter(Sender: TObject);
begin
  if msk_dt_termino_vencto.Text <> '  /  /    ' then
  begin
    if dt_inicio_vencto > dt_termino_vencto then
    begin
      BoxMensagem('Data de Vencimento inícial maior que data de Vencimento final!', 2);
      msk_dt_inicio_vencto.Text := '  /  /   ';
      msk_dt_inicio_vencto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_adm.msk_dt_termino_venctoExit(Sender: TObject);
begin
  try
    if msk_dt_termino_vencto.Text <> '  /  /    ' then
    begin
      dt_termino_vencto := StrToDate(msk_dt_termino_vencto.Text);
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_termino_vencto.SetFocus;
      Exit;
    end;
  end;

  if ( msk_dt_inicio_vencto.Text <> '  /  /    ' ) and ( msk_dt_termino_vencto.Text <> '  /  /    ' ) then
  begin
    if dt_inicio_vencto > dt_termino_vencto then
    begin
      BoxMensagem('Data de Vencimento inicial maior que data de Vencimento final!', 2);
      msk_dt_inicio_vencto.Text := '  /  /    ';
      msk_dt_inicio_vencto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_adm.msk_cd_usuarioExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_adm.msk_cd_bancoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_adm.dblckbox_cd_statusClick(Sender: TObject);
begin
  str_status := datm_pesq_adm.qry_status_solic_adm_CODIGO.AsString;
end;

procedure Tfrm_pesq_adm.btn_co_usuarioClick(Sender: TObject);
begin
{  with datm_pesq_adm do
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
  end; }

  if Sender is TSpeedButton then
    msk_cd_usuario.Text := ConsultaOnLineExFiltro('TUSUARIO', 'Usuários', ['CD_USUARIO', 'NM_USUARIO'], ['Código', 'Nome'], 'CD_USUARIO',' IN_ATIVO = "1"', nil, msk_cd_usuario.text )
  else
    edt_nm_usuario.Text := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO (NOLOCK) ' +
                                             ' WHERE CD_USUARIO = ''' + msk_cd_usuario.Text + ''' AND IN_ATIVO = "1" ',
                                             'NM_USUARIO');


end;

procedure Tfrm_pesq_adm.btn_co_favorecidoClick(Sender: TObject);
begin
{  with datm_pesq_adm do
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
  end;}

  if Sender is TSpeedButton then begin
    msk_cd_favorecido.Text := ConsultaOnLineEx('TFAVORECIDO','Favorecidoss',['CD_FAVORECIDO','NM_FAVORECIDO'],['Código','Descrição'],'CD_FAVORECIDO', nil, 1, msk_cd_favorecido.text);
  end else
    edt_nm_favorecido.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO', msk_cd_favorecido.Text,'NM_FAVORECIDO');

end;

procedure Tfrm_pesq_adm.btn_co_bancoClick(Sender: TObject);
begin
{  with datm_pesq_adm do
  begin
    Application.CreateForm(Tfrm_banco, frm_banco );
    with frm_banco do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_banco.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_banco.Text := frm_banco.Cons_OnLine_Texto;
      msk_cd_bancoExit(nil);
    end;
  end; }
  if Sender is TSpeedButton then begin
    msk_cd_banco.Text := ConsultaOnLineEx('TBANCO','Bancos',['CD_BANCO','NM_BANCO'],['Código','Descrição'],'CD_BANCO', nil, 1, msk_cd_banco.text);
  end else
    edt_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO', msk_cd_banco.Text,'NM_BANCO');


end;

procedure Tfrm_pesq_adm.btn_pesquisaClick(Sender: TObject);
begin
  GeraSqlStr;
  if pgctrl_pesq_adm.ActivePage = ts_filtros then pgctrl_pesq_adm.ActivePage := ts_lista;
end;

procedure Tfrm_pesq_adm.msk_cd_historicoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_adm.msk_vl_lanctoExit(Sender: TObject);
begin
  if msk_vl_lancto.Text = '' then Exit;
  vl_lancto := StrToFloat( msk_vl_lancto.Text );
  msk_vl_lancto.Text := FormatFloat( '0.00', vl_lancto );
end;

procedure Tfrm_pesq_adm.msk_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := msk_cd_acesso.Text;
end;

procedure Tfrm_pesq_adm.msk_cd_auxEnter(Sender: TObject);
begin
  cd_aux := msk_cd_aux.Text;
end;

procedure Tfrm_pesq_adm.msk_cd_auxExit(Sender: TObject);
begin
  if msk_cd_aux.Text = cd_aux then Exit;
  with datm_pesq_adm do
  begin
    if ( Trim( msk_cd_acesso.Text ) <> '' ) and ( Trim( msk_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( msk_cd_acesso.Text ) + Trim( msk_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        msk_cd_ct_contabil.Text := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
        msk_cd_ct_contabilExit(nil);
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_pesq_adm.msk_cd_acessoExit(Sender: TObject);
begin
  if msk_cd_acesso.Text = cd_acesso then Exit;
  with datm_pesq_adm do
  begin
    if ( Trim( msk_cd_acesso.Text ) <> '' ) and ( Trim( msk_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( msk_cd_acesso.Text ) + Trim( msk_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        msk_cd_ct_contabil.Text := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_pesq_adm.msk_cd_ct_contabilEnter(Sender: TObject);
begin
  cd_ct_contabil := msk_cd_ct_contabil.Text;
end;

procedure Tfrm_pesq_adm.msk_cd_ct_contabilExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_adm.rdgrp_tp_naturezaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_adm.msk_dt_inicio_pagtoExit(Sender: TObject);
begin
  try
    if msk_dt_inicio_pagto.Text <> '  /  /    ' then
    begin
      dt_inicio_pagto := StrToDate( msk_dt_inicio_pagto.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_inicio_pagto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_adm.msk_dt_termino_pagtoEnter(Sender: TObject);
begin
  if msk_dt_termino_pagto.Text <> '  /  /    ' then
  begin
    if dt_inicio_pagto > dt_termino_pagto then
    begin
      BoxMensagem('Data de Pagamento inicial maior que data de Pagamento final!', 2);
      msk_dt_inicio_pagto.Text := '  /  /   ';
      msk_dt_inicio_pagto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_adm.msk_dt_termino_pagtoExit(Sender: TObject);
begin
  try
    if msk_dt_termino_pagto.Text <> '  /  /    ' then
    begin
      dt_termino_pagto := StrToDate( msk_dt_termino_pagto.Text);
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_termino_pagto.SetFocus;
      Exit;
    end;
  end;

  if ( msk_dt_inicio_pagto.Text <> '  /  /    ' ) and ( msk_dt_termino_pagto.Text <> '  /  /    ' ) then
  begin
    if dt_inicio_pagto > dt_termino_pagto then
    begin
      BoxMensagem('Data de Pagamento inicial maior que data de Pagamento final!', 2);
      msk_dt_inicio_pagto.Text := '  /  /    ';
      msk_dt_inicio_pagto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_adm.btn_co_ct_contabilClick(Sender: TObject);
begin
  with datm_pesq_adm do
  begin
    if datm_pesq_adm.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
    begin
      Cons_On_line_Texto( 'DBBROKER', 'TCONTABIL_PLANO',
                    msk_cd_ct_contabil, 'Contas Contábeis', 8, 'CD_COLIGADA = ' + str_cd_coligada );
    end
    else
    begin
      Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil );
      with frm_ct_contabil do
      begin
        Caption := Caption + ' [Consulta On-Line]';
        lCons_OnLine := True;
        ShowModal;
        lCons_OnLine := False;
      end;
      if (frm_ct_contabil.Cons_OnLine_Texto <> '' ) then
      begin
        msk_cd_ct_contabil.Text := frm_ct_contabil.Cons_OnLine_Texto;
        msk_cd_ct_contabilExit(nil);
      end;
    end;
  end;
  msk_cd_ct_contabilExit(nil);
end;

procedure Tfrm_pesq_adm.btn_co_historicoClick(Sender: TObject);
begin
{  with datm_pesq_adm do
  begin
    Application.CreateForm(Tfrm_hist_padrao, frm_hist_padrao );
    with frm_hist_padrao do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_hist_padrao.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_historico.Text := frm_hist_padrao.Cons_OnLine_Texto;
      msk_cd_historicoExit(nil);
    end;
  end; }

  if Sender is TSpeedButton then begin
    msk_cd_historico.Text := ConsultaOnLineEx('THIST_PADRAO','Bancos',['CD_HISTORICO','NM_HISTORICO'],['Código','Descrição'],'CD_HISTORICO', nil, 1, msk_cd_historico.text);
  end else
    edt_nm_historico.Text := ConsultaLookUP('THIST_PADRAO','CD_HISTORICO', msk_cd_historico.Text,'NM_HISTORICO');

end;







procedure Tfrm_pesq_adm.dbg_lib_procDblClick(Sender: TObject);
var
  vDataOld : TDateTime;
  vNumeroOld, vTpNaturezaOld, vCtContabilOld, vUnidNegOld, vChangeTo : string;
begin
  with datm_pesq_adm do
  begin
    if dbg_lib_proc.SelectedField.Name = 'qry_pesq_calcIN_SELECIONADO' then
    begin
      vDataOld       := qry_pesq_DT_LANCTO.AsDateTime;
      vNumeroOld     := qry_pesq_NR_LANCAMENTO.AsString;
      vTpNaturezaOld := qry_pesq_TP_NATUREZA.AsString;
      vCtContabilOld := qry_pesq_CD_CT_CONTABIL.AsString;
      vUnidNegOld    := qry_pesq_CD_UNID_NEG.AsString;
      qry_pesq_.DisableControls;
      if qry_pesq_IN_SELECIONADO.AsString = '1' then
        vChangeTo := '0'
      else vChangeTo := '1';
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('UPDATE TADM SET IN_SELECIONADO = ''' + vChangeTo + '''');
        SQL.Add(' WHERE CD_UNID_NEG = :CD_UNID_NEG AND NR_LANCAMENTO = :NR_LANCAMENTO ');
        SQL.Add('   AND DT_LANCTO = :DT_LANCTO AND TP_NATUREZA = :TP_NATUREZA ');
        SQL.Add('   AND CD_CT_CONTABIL = :CD_CT_CONTABIL ');
        ParamByName('CD_UNID_NEG').AsString    := qry_pesq_CD_UNID_NEG.AsString;
        ParamByName('NR_LANCAMENTO').AsString  := qry_pesq_NR_LANCAMENTO.AsString;
        ParamByName('DT_LANCTO').AsDateTime    := qry_pesq_DT_LANCTO.AsDateTime;
        ParamByName('TP_NATUREZA').AsString    := qry_pesq_TP_NATUREZA.AsString;
        ParamByName('CD_CT_CONTABIL').AsString := qry_pesq_CD_CT_CONTABIL.AsString;
        ExecSQL;
        Free;
      end;
      GeraSqlStr;
      qry_pesq_.Locate('CD_UNID_NEG;DT_LANCTO;CD_CT_CONTABIL;TP_NATUREZA;NR_LANCAMENTO', VarArrayOf([vUnidNegOld,vDataOld,vCtContabilOld,vTpNaturezaOld, vNumeroOld]), [loPartialKey]);
      qry_pesq_.EnableControls;
    end;
  end;

end;

end.
