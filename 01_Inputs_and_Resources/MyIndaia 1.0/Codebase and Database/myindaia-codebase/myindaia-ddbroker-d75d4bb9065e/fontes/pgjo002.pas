unit PGLI002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, PGGP001, UCRPE32;

type
  Tfrm_LI = class(TForm)
    pnl_cadastro: TPanel;
    btn_nova_li: TSpeedButton;
    btn_sair_li: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_nova_li: TMenuItem;
    mi_capa_li: TMenuItem;
    mi_item_li: TMenuItem;
    Bevel1: TBevel;
    lbl_nr_processo: TLabel;
    mskedt_nr_processo: TMaskEdit;
    btn_nr_processo: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    lbl_cd_servico: TLabel;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    btn_itens_li: TSpeedButton;
    btn_capa_li: TSpeedButton;
    mi_saida: TMenuItem;
    btn_duplica_li: TSpeedButton;
    mi_duplica_li: TMenuItem;
    btn_co_unid_neg: TSpeedButton;
    Bevel2: TBevel;
    Panel1: TPanel;
    btn_imprime_li: TSpeedButton;
    Crpe1: TCrpe;
    dbgrd_LI: TDBGrid;
    procedure btn_sair_liClick(Sender: TObject);
    procedure btn_nova_liClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure btn_itens_liClick(Sender: TObject);
    procedure btn_capa_liClick(Sender: TObject);
    procedure btn_duplica_liClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_tipo_declaracaoClick(Sender: TObject);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure btn_imprime_liClick(Sender: TObject);
    procedure btn_siscomexClick(Sender: TObject);
    procedure btn_liClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskedt_cd_tipo_declaracaoEnter(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure mskedt_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure dbgrd_LIEnter(Sender: TObject);
    procedure mskedt_nr_processoChange(Sender: TObject);
    procedure dbgrd_LIDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Criando_LI:Boolean;
    cState : String[1];
    i_seletor : Integer;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    in_DI_Registrada : Boolean;
    in_DI_Retificacao : Boolean;
    procedure HabilitaBotoes( lResp : Boolean);
  end;

var
  frm_LI: Tfrm_LI;

implementation

uses GSMLIB,  PGGP017, PGDI017, PGDI001, PGDI004, PGDI005, PGDI010, PGSM018,
     PGSM096, PGDI007, PGDI012, PGDI015, PGGP015, PGSM121, PGDI018, PGDI032,
     PGLI004, PGLI001, PGLI003;

{$R *.DFM}

procedure Tfrm_LI.btn_sair_liClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_LI.btn_nova_liClick(Sender: TObject);
begin
  with datm_li do
  begin
    if mskedt_cd_unid_neg.Text = '' then
    begin
      MessageDlg('A Unidade de Negócio deve ser informada.', mtError, [mbOk], 0);
      Exit;
    end;
    if mskedt_nr_processo.Text = '' then
    begin
      MessageDlg('O Cliente deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;

    qry_li_.Close;
    qry_li_.Prepare;
    qry_li_.Open;
    qry_li_.Append;

    qry_li_NR_PROCESSO.AsString    := str_nr_processo;
    qry_li_CD_IMPORTADOR.AsString  := edt_cd_cliente.Text;
    qry_li_CD_SERVICO.AsString     := edt_cd_servico.Text;

    try
      datm_main.db_broker.StartTransaction;
      qry_li_.Post;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;

    HabilitaBotoes( True );

    Criando_LI := True;
    btn_capa_liClick(Sender);

  end;
end;

procedure Tfrm_LI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_LI.Destroy;
  Action := caFree;
end;

procedure Tfrm_LI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_LI.HabilitaBotoes( lResp : Boolean);
begin

  btn_nova_li.Enabled         := lResp;

  btn_capa_li.Enabled         := not lResp;
  btn_itens_li.Enabled        := not lResp;
  btn_duplica_li.Enabled      := not lResp;
  btn_imprime_li.Enabled      := not lResp;

  mi_nova_li.Enabled          := lResp;
  mi_capa_li.Enabled          := not lResp;
  mi_item_li.Enabled          := not lResp;
  mi_duplica_li.Enabled       := not lResp;

end;

procedure Tfrm_LI.mskedt_nr_processoExit(Sender: TObject);
begin

  if (mskedt_nr_processo.Text = '') then
  begin
    datm_li.qry_li_.Close;
    btn_nova_li.Enabled := False;
    Exit;
  end;

  with datm_li do
  begin
    edt_cd_cliente.Text := '';
    edt_nm_cliente.Text := '';

    edt_cd_servico.Text := '';
    edt_nm_servico.Text := '';

    if mskedt_nr_processo.Text <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := mskedt_cd_unid_neg.Text+str_cd_produto+mskedt_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        qry_li_.Close;
        qry_processo_.Close;
        MessageDlg('Processo não encontrado. Digite novamente.', mtError, [mbOk], 0);
        mskedt_nr_processo.Setfocus;
        Exit
      end;

      edt_cd_cliente.Text := qry_processo_CD_CLIENTE.AsString;

      qry_empresa_.Close;
      qry_empresa_.ParamByName('CD_EMPRESA').AsString := qry_processo_CD_CLIENTE.AsString;
      qry_empresa_.Prepare;
      qry_empresa_.Open;
      if qry_empresa_.RecordCount > 0 then edt_nm_cliente.Text := qry_empresa_NM_EMPRESA.AsString;
      qry_empresa_.Close;

      edt_cd_servico.Text := qry_processo_CD_SERVICO.AsString;
      qry_servico_.Close;
      qry_servico_.ParamByName('CD_SERVICO').AsString := qry_processo_CD_SERVICO.AsString;
      qry_servico_.Prepare;
      qry_servico_.Open;
      if qry_servico_.RecordCount > 0 then edt_nm_servico.Text := qry_servico_NM_SERVICO.AsString;
      qry_servico_.Close;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;

      qry_li_.Close;
      qry_li_.ParamByName('NR_PROCESSO').AsString  := mskedt_cd_unid_neg.Text+str_cd_produto+mskedt_nr_processo.Text;
      qry_li_.Prepare;
      qry_li_.Open;

      if qry_LI_.RecordCount > 0 then
         begin
            dbgrd_Li.Enabled := True;
            // HabilitaBotoes( False );
         end
      else
         HabilitaBotoes( True  );
    end;

    qry_processo_.Close;

  end;

end;

procedure Tfrm_LI.btn_capa_liClick(Sender: TObject);
begin

  Application.CreateForm(Tfrm_LI_Capa, frm_LI_Capa);

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  frm_LI_Capa.ShowModal;

  Application.ProcessMessages;

  case i_seletor of
    2: begin
         i_seletor := 0;
         btn_itens_liClick(Sender);
       end;
  end;
end;


procedure Tfrm_LI.btn_itens_liClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_LI_Itens, frm_LI_Itens);

  frm_LI_Itens.ShowModal;


  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  case i_seletor of
    1: begin
         i_seletor := 0;
         btn_capa_liClick(Sender);
       end;
  end;


end;

procedure Tfrm_LI.btn_duplica_liClick(Sender: TObject);
begin
  BoxMensagem( 'Aguarde próxima versão !!', 3 );

  {
  Application.CreateForm( Tfrm_duplica_DI, frm_duplica_DI );
  frm_duplica_DI.ShowModal;
  mskedt_nr_processoExit(Sender);
  Application.ProcessMessages;
  }

end;


procedure Tfrm_LI.btn_co_unid_negClick(Sender: TObject);
begin

  with datm_LI do
  begin

    Application.CreateForm(Tfrm_unidade, frm_unidade);
    frm_unidade.Cons_OnLine := qry_processo_CD_UNID_NEG;

    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;

    if (frm_unidade.Cons_OnLine.AsString <> '' ) then
    begin
      mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine.AsString;
      qry_unidade_.Close;
      qry_unidade_.ParamByName('CODIGO').AsString := mskedt_cd_unid_neg.Text;
      qry_unidade_.Prepare;
      qry_unidade_.Open;
      if qry_unidade_.RecordCount > 0 then edt_nm_unid_neg.Text := qry_unidade_AP_UNID_NEG.AsString;
      qry_unidade_.Close;
    end;
  end;
end;

procedure Tfrm_LI.btn_tipo_declaracaoClick(Sender: TObject);
begin

  with datm_LI do
  begin
    qry_li_.Close;
    qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_li_.Prepare;
    qry_li_.Open;

    Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);
    {
    frm_consulta_padrao.nCodigo := 1;
    frm_consulta_padrao.Tabela.TableName := 'TTIPO_DECLARACAO';
    frm_consulta_padrao.Tabela.Open;
    frm_consulta_padrao.Cons_OnLine := qry_li_CD_TIPO_DECLARACAO;
    }

    with frm_consulta_padrao do
    begin
      Caption := Caption + ' [Tipo de Declaração]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;

    if (frm_consulta_padrao.Cons_OnLine.AsString <> '' ) then
    begin
      //mskedt_cd_tipo_declaracao.Text := frm_consulta_padrao.Cons_OnLine.AsString;
      //qry_tp_decl_.Close;
      //qry_tp_decl_.ParamByName('CODIGO').AsString := mskedt_cd_tipo_declaracao.Text;
      //qry_tp_decl_.Prepare;
      //qry_tp_decl_.Open;
      //if qry_tp_decl_.RecordCount > 0 then edt_nm_tipo_declaracao.Text := qry_tp_decl_Descricao.AsString;
      //qry_tp_decl_.Close;
    end;

    qry_li_.Close;

  end;

end;

procedure Tfrm_LI.mskedt_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( mskedt_cd_unid_neg );
  with datm_LI.qry_usuario_habilitacao_ do
  begin
    ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    Prepare;
    Open;
    if not Locate('CD_UNID_NEG', mskedt_cd_unid_neg.Text, [loCaseInsensitive]) then
    begin
      BoxMensagem('Unidade de Negócio não existe ou não está Habilitada!',3);
      mskedt_cd_unid_neg.Text := '';
    end;
    Close;
  end;
end;

procedure Tfrm_LI.btn_imprime_liClick(Sender: TObject);
begin

  BoxMensagem( 'Aguarde próxima versão !!', 3 )
  {
  screen.cursor := crHourGlass;

  with Crpe1 do
  begin
    ReportName  := cDir_Rpt + '\CRGSM001.RPT';
    ReportTitle := 'Rascunho de DI - Capa e Itens';
    }
    // SelectionFormula[0] := '{DI.NR_PROCESSO} = "'+ str_nr_processo +'"';
    {
    execute;
  end;

  Screen.Cursor := crArrow;
  }
end;

procedure Tfrm_LI.btn_siscomexClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Integracao_DI,frm_Integracao_DI);
  frm_Integracao_DI.cd_unidade  := mskedt_cd_unid_neg.Text;
  frm_Integracao_DI.nr_processo := mskedt_nr_processo.Text;
  frm_Integracao_DI.ShowModal;
end;

procedure Tfrm_LI.btn_liClick(Sender: TObject);
begin
  // Application.CreateForm(Tfrm_LI_Adicao_Com_LI,frm_LI_Adicao_Com_LI);
  frm_DI_Adicao_Com_LI.cd_unidade  := mskedt_cd_unid_neg.Text;
  frm_DI_Adicao_Com_LI.nr_processo := mskedt_nr_processo.Text;
  frm_DI_Adicao_Com_LI.ShowModal;
end;

procedure Tfrm_LI.FormCreate(Sender: TObject);
begin
  Criando_LI    := False;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  { Inicializa o Data Module para Senha }
  Application.CreateForm( Tdatm_LI, datm_LI );

  with Crpe1 do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
  end;

  with datm_li do
  begin
    //in_LI_Retificacao               := False;
    str_cd_produto                  := '01';
    mskedt_cd_unid_neg.Text         := str_cd_unid_neg;
    //mskedt_cd_tipo_declaracao.Text  := '01';

    qry_unidade_.Close;
    qry_unidade_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
    if qry_unidade_.RecordCount > 0 then edt_nm_unid_neg.Text := qry_unidade_AP_UNID_NEG.AsString;
    qry_unidade_.Close;

    {
    qry_tp_decl_.Close;
    qry_tp_decl_.ParamByName('CODIGO').AsString := mskedt_cd_tipo_declaracao.Text;
    qry_tp_decl_.Prepare;
    qry_tp_decl_.Open;
    if qry_tp_decl_.RecordCount > 0 then edt_nm_tipo_declaracao.Text := qry_tp_decl_Descricao.AsString;
    qry_tp_decl_.Close;
    }
  end;
end;

procedure Tfrm_LI.FormShow(Sender: TObject);
begin
  mskedt_nr_processo.SetFocus;
  dbgrd_Li.Enabled := False;
  //if in_LI_Retificacao then Caption := 'Retificação de Licença de Importação';
end;

procedure Tfrm_LI.mskedt_cd_tipo_declaracaoEnter(Sender: TObject);
begin
  //if Not mskedt_cd_tipo_declaracao.TabStop then mskedt_nr_processo.SetFocus;
end;

procedure Tfrm_LI.btn_calculoClick(Sender: TObject);
begin
  //MessageDlg(sp_di_calculo(str_nr_processo, True), mtInformation, [mbOK], 0);
end;

procedure Tfrm_LI.mskedt_nr_processoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_nr_processo then btn_nr_processoClick(nil);
  end;
end;

procedure Tfrm_LI.btn_nr_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := mskedt_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := '01';
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    mskedt_cd_unid_neg.Text  := Copy(frm_consulta_processo.Nr_Processo, 1, 2);
    mskedt_nr_processo.Text  := Copy(frm_consulta_processo.Nr_Processo, 5, 14);
    mskedt_cd_unid_negExit(nil);
    mskedt_nr_processoExit(nil);
  end;
end;

procedure Tfrm_LI.dbgrd_LIEnter(Sender: TObject);
begin
   If datm_li.qry_li_nr_processo.AsString <> '' then
      HabilitaBotoes( False );

end;

procedure Tfrm_LI.mskedt_nr_processoChange(Sender: TObject);
begin
  btn_nova_li.Enabled         := False;

  btn_capa_li.Enabled         := False;
  btn_itens_li.Enabled        := False;
  btn_duplica_li.Enabled      := False;
  btn_imprime_li.Enabled      := False;

  mi_nova_li.Enabled          := False;
  mi_capa_li.Enabled          := False;
  mi_item_li.Enabled          := False;
  mi_duplica_li.Enabled       := False;

end;

procedure Tfrm_LI.dbgrd_LIDblClick(Sender: TObject);
begin
   btn_capa_liClick(sender);
end;

end.
