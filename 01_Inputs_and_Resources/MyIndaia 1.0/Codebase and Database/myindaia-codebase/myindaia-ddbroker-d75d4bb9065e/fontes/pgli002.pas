unit PGLI002;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, DB, DBTables,
  Buttons, Funcoes, ConsOnLineEx, UCRPE32,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_LI = class(TForm)
    menu_cadastro: TMainMenu;
    mi_nova_li: TMenuItem;
    mi_capa_li: TMenuItem;
    mi_item_li: TMenuItem;
    bvl_li: TBevel;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_nr_processo: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    lbl_cd_servico: TLabel;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    mi_saida: TMenuItem;
    btn_co_unid_neg: TSpeedButton;
    crp_li: TCrpe;
    mi_imprime_li: TMenuItem;
    mi_desmonta_li: TMenuItem;
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    mi_imprime_li_rasc_compl: TMenuItem;
    mi_imprime_li_rasc_resum: TMenuItem;
    pnl_cadastro: TPanel;
    btn_sair_li: TSpeedButton;
    btn_nova_li: TSpeedButton;
    btn_capa_li: TSpeedButton;
    btn_itens_li: TSpeedButton;
    btn_duplica_li: TSpeedButton;
    btn_imprime_li: TSpeedButton;
    btn_desmonta_li: TSpeedButton;
    dbgrd_li: TDBGrid;
    chk_ult_processos: TCheckBox;
    btn_trans_LI: TSpeedButton;
    ppmLI: TPopupMenu;
    miRetificaLI: TMenuItem;
    ImportarItensDI1: TMenuItem;
    DuplicarLI1: TMenuItem;
    IncluirItensPedidos1: TMenuItem;
    procedure btn_sair_liClick(Sender: TObject);
    procedure btn_nova_liClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_itens_liClick(Sender: TObject);
    procedure btn_capa_liClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_tipo_declaracaoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_imprime_liClick(Sender: TObject);
    procedure btn_liClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure dbgrd_liDblClick(Sender: TObject);
    procedure btn_desmonta_liClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_trans_LIClick(Sender: TObject);
    procedure miRetificaLIClick(Sender: TObject);
    procedure ImportarItensDI1Click(Sender: TObject);
    procedure DuplicarLI1Click(Sender: TObject);
    procedure IncluirItensPedidos1Click(Sender: TObject);
  private
    function ConsultaProcesso: string;
    procedure CopiarItensDaDI;
    procedure DuplicarLi;
    procedure CopiarItensDoPedido;
    { Private declarations }
  public
    { Public declarations }
    in_abertura, in_montada, in_atualizar, in_retificar: Boolean;
    i_seletor: Integer;
    //lCons_OnLine : Boolean;
    procedure btn_mi(n, c, i, d, p, m: Boolean);
  end;

var
  frm_LI: Tfrm_LI;
  vLi:string;

implementation

uses GSMLIB, PGGP001, PGGP002, PGGP017, PGLI001, PGLI003, PGLI004, PGSM136,
  PGLI007, PGLI008, PGLI006, PGGP015;

{$R *.DFM}

procedure Tfrm_LI.btn_mi(n, c, i, d, p, m: Boolean);
begin
  btn_nova_li.Enabled := n;
  mi_nova_li.Enabled := n;
  btn_capa_li.Enabled := c;
  mi_capa_li.Enabled := c;
  btn_itens_li.Enabled := i;
  mi_item_li.Enabled := i;
  btn_duplica_li.Enabled := d;
  btn_imprime_li.Enabled := p;
  mi_imprime_li.Enabled := p;
  btn_desmonta_li.Enabled := m;
  mi_desmonta_li.Enabled := m;
  if btn_itens_li.Enabled = true then
    btn_trans_LI.Enabled:=true
  else
    btn_trans_LI.Enabled:=false;
end;

procedure Tfrm_LI.btn_sair_liClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_LI.btn_nova_liClick(Sender: TObject);
begin
  with datm_li do
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      MessageDlg('A Unidade de Negócio deve ser informada.', mtError, [mbOk], 0);
      Exit;
    end;
    if Trim( msk_cd_produto.Text ) = '' then
    begin
      MessageDlg('O Produto deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;
    if Trim( msk_nr_processo.Text ) = '' then
    begin
      MessageDlg('O Processo deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;

    if qry_li_.Locate('NR_PROCESSO;IN_MONTADA', VarArrayOf([msk_nr_processo.Text,'0']), [loCaseInsensitive]) then
    begin
      MessageDlg('Para abrir um novo processo de L.I. deve-se ter todos os outros montados.', mtError, [mbOK], 0);
      Exit;
    end;

    qry_li_.Close;
    qry_li_.Prepare;
    qry_li_.Open;
    qry_li_.Append;

    qry_li_NR_PROCESSO.AsString      := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
    qry_li_CD_IMPORTADOR.AsString    := edt_cd_cliente.Text;
    qry_li_CD_SERVICO.AsString       := edt_cd_servico.Text;
    qry_li_DT_PROCESSO_LI.AsDateTime := StrToDate( DateToStr( Date ) );
    qry_li_CD_CONDICAO_MERC.AsString := '0';
    try
      datm_main.db_broker.StartTransaction;
      qry_li_.Post;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    btn_mi(True, False, False, True, True, in_montada);
    btn_trans_LI.Enabled:= false;


    in_atualizar := True;
    in_abertura  := True;
    btn_capa_liClick(Sender);
  end;
end;

procedure Tfrm_LI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  str_nr_processo := '';
  datm_LI.Free;
  crp_li.Free;
  Action := caFree;
end;

procedure Tfrm_LI.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_LI.msk_nr_processoExit(Sender: TObject);
begin
  with datm_li do
  begin
    edt_cd_cliente.Text := '';
    edt_nm_cliente.Text := '';

    edt_cd_servico.Text := '';
    edt_nm_servico.Text := '';

    if (msk_nr_processo.Text = '') then
    begin
      qry_li_.Close;
      btn_mi(False, False, False, False, True, False);
      btn_trans_LI.Enabled:=false;
      Exit;
    end;

    if msk_nr_processo.Text <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.EOF then
      begin
        qry_li_.Close;
        qry_processo_.Close;
        MessageDlg('Processo não encontrado. Digite novamente.', mtError, [mbOk], 0);
        msk_nr_processo.Setfocus;
        Exit;
      end;

      edt_cd_cliente.Text := qry_processo_CD_CLIENTE.AsString;
      qry_empresa_.Close;
      qry_empresa_.ParamByName('CD_EMPRESA').AsString := qry_processo_CD_CLIENTE.AsString;
      qry_empresa_.Prepare;
      qry_empresa_.Open;
      if Not qry_empresa_.EOF then
        edt_nm_cliente.Text := qry_empresa_NM_EMPRESA.AsString;
      qry_empresa_.Close;

      edt_cd_servico.Text := qry_processo_CD_SERVICO.AsString;
      qry_servico_.Close;
      qry_servico_.ParamByName('CD_SERVICO').AsString := qry_processo_CD_SERVICO.AsString;
      qry_servico_.Prepare;
      qry_servico_.Open;
      if Not qry_servico_.EOF then
        edt_nm_servico.Text := qry_servico_NM_SERVICO.AsString;
      qry_servico_.Close;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;
      in_atualizar    := False;

      qry_li_.Close;
      qry_li_.ParamByName('NR_PROCESSO').AsString := Trim( str_nr_processo );
      qry_li_.SQL[5] := ' OR NR_PROCESSO LIKE "' + Trim( str_nr_processo ) + '%"';
      qry_li_.Prepare;
      qry_li_.Open;

      ImportarItensDI1.Enabled := qry_li_.RecordCount = 0;
      IncluirItensPedidos1.Enabled := qry_li_.RecordCount = 0;
      DuplicarLI1.Enabled := qry_li_.RecordCount = 0;
    end;
    vLi:= qry_li_calc_nr_proc.AsString;
    qry_processo_.Close;
  end;
end;

procedure Tfrm_LI.btn_capa_liClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm(Tfrm_LI_Capa, frm_LI_Capa);

  frm_LI_Capa.ShowModal;

  if in_atualizar then msk_nr_processoExit(nil);

  case i_seletor of
    2: begin
         i_seletor := 0;
         btn_itens_liClick(Sender);
       end;
  end;
end;

procedure Tfrm_LI.btn_itens_liClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm(Tfrm_LI_Itens, frm_LI_Itens);

  frm_LI_Itens.ShowModal;

  if in_atualizar then msk_nr_processoExit(nil);

  case i_seletor of
    1: begin
         i_seletor := 0;
         btn_capa_liClick(Sender);
       end;
  end;
end;

procedure Tfrm_LI.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
    msk_cd_unid_negExit(nil);
  End
  Else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_LI.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
  with datm_LI do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]) ) then
    begin
      BoxMensagem('Unidade de Negócio não existe ou não está Habilitada! ' + #13#10 +
                  'A Unidade de Negócio padrão do usuário será mantida.',3);
      msk_cd_unid_neg.Text := str_cd_unid_neg;
      msk_cd_unid_negExit(nil);
      Exit;
    end;
    qry_usuario_habilitacao_.Close;

    qry_unidade_.Close;
    qry_unidade_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
    if qry_unidade_.RecordCount > 0 then edt_nm_unid_neg.Text := qry_unidade_AP_UNID_NEG.AsString;
    qry_unidade_.Close;
  end;
end;

procedure Tfrm_LI.btn_tipo_declaracaoClick(Sender: TObject);
begin
  {
  with datm_LI do
  begin
    qry_li_.Close;
    qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_li_.Prepare;
    qry_li_.Open;

    Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

    with frm_consulta_padrao do
    begin
      Caption := Caption + ' [Tipo de Declaração]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_li_.Close;
  end;
  }
end;

procedure Tfrm_LI.btn_imprime_liClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if ( datm_LI.qry_li_NR_PROCESSO.AsString = '' ) or ( datm_LI.qry_li_NR_PROCESSO.IsNull ) then
  begin
    BoxMensagem('Selecione um Processo LI', 2);
    Exit;
  end;
  //by Paulo - 08/10/2002
  if Sender = mi_imprime_li_rasc_compl then
  begin
    with crp_li do
    begin
      ReportName  := cDir_Rpt + '\CRLI001.RPT';    //não mexi neste relatório
      ReportTitle := 'Rascunho de LI - Completo - ' + msk_nr_processo.Text;  //by Paulo - 08/10/2002
      ParamFields[0] := datm_LI.qry_li_NR_PROCESSO.AsString;
      Execute;
    end;
  end
  else        //acessando pelo botão, imprimir o resumido (by Valotto)
  if (Sender = btn_imprime_li) or (Sender = mi_imprime_li_rasc_resum) then
  begin
    with crp_li do
    begin            //by Paulo - 08/10/2002
      ReportName  := cDir_Rpt + '\CRLI001res.RPT';  //criei este a partir do de cima
      ReportTitle := 'Rascunho de LI - Resumido - ' + msk_nr_processo.Text;
      ParamFields[0] := datm_LI.qry_li_NR_PROCESSO.AsString;
      Execute;
    end;
  end;
  Screen.Cursor := crArrow;
end;

procedure Tfrm_LI.btn_liClick(Sender: TObject);
begin
  {
  frm_DI_Adicao_Com_LI.cd_unidade  := msk_cd_unid_neg.Text;
  frm_DI_Adicao_Com_LI.cd_produto  := msk_cd_produto.Text;
  frm_DI_Adicao_Com_LI.nr_processo := msk_nr_processo.Text;
  frm_DI_Adicao_Com_LI.ShowModal;
  }
end;

procedure Tfrm_LI.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  Application.CreateForm( Tdatm_LI, datm_LI );

  in_abertura := False;
  in_montada  := False;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);

  crp_li.Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
end;

procedure Tfrm_LI.FormShow(Sender: TObject);
begin
  dbgrd_li.Enabled := False;
  msk_nr_processo.SetFocus;
end;

procedure Tfrm_LI.msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo then btn_nr_processoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text  := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

function Tfrm_LI.ConsultaProcesso: string;
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  try
    vListAux.Add('SELECT SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, DT_ABERTURA, ' );
    vListAux.Add('  CD_CLIENTE,    (SELECT AP_EMPRESA    FROM TEMPRESA_NAC ( NOLOCK ) WHERE CD_EMPRESA    = PR.CD_CLIENTE)    AS NM_CLIENTE,    ' );
    vListAux.Add('  CD_SERVICO,    (SELECT NM_SERVICO    FROM TSERVICO     ( NOLOCK ) WHERE CD_SERVICO    = PR.CD_SERVICO)    AS NM_SERVICO,    ' );
    vListAux.Add('  CD_EMBARCACAO, (SELECT NM_EMBARCACAO FROM TEMBARCACAO  ( NOLOCK ) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, ' );
    vListAux.Add('  NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER, NR_DI, NR_MANIFESTO    ' );
    vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ' );
    vListAux.Add('WHERE CD_UNID_NEG  = ' + QuotedStr(msk_cd_unid_neg.Text) );
    vListAux.Add('  AND CD_PRODUTO   = ' + QuotedStr(msk_cd_produto.Text)  );
    vListAux.Add('  AND IN_CANCELADO = ''0''' );

    if chk_ult_processos.Checked then
      vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));

    Result := ConsultaOnLineExSQLList(vListAux,'Processos',
        ['NR_PROCESSO' ,'DT_ABERTURA'     ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_SERVICO'  ,'NM_SERVICO','CD_EMBARCACAO'  ,'NM_EMBARCACAO','NR_CONHECIMENTO' ,'NR_CONHECIMENTO_MASTER' ,'NR_DI','NR_MANIFESTO' ],
        ['Nr. Processo','Data de Abertura','Cód. Cliente','Cliente'   ,'Cód. Serviço','Serviço'   ,'Cod. Embarcação','Embarcação'   ,'Nr. Conhecimento','Nr. Conhecimento Master','DI'   ,'Nr. Manifesto'],
         'NR_PROCESSO',nil);
  finally
    vListAux.Free;
  end;
end;

procedure Tfrm_LI.btn_nr_processoClick(Sender: TObject);
begin
  msk_nr_processo.Text := ConsultaProcesso;
  msk_nr_processoExit(nil);
end;

procedure Tfrm_LI.msk_nr_processoChange(Sender: TObject);
begin
  in_retificar := False;
  btn_mi(False, False, False, False, True, False);
end;

procedure Tfrm_LI.dbgrd_liDblClick(Sender: TObject);
begin
  btn_capa_liClick(nil);
end;

procedure Tfrm_LI.btn_desmonta_liClick(Sender: TObject);
begin
  with datm_LI do
  try
    begin
      if BoxMensagem( 'Deseja desmontar LI ?', 1 ) then
      begin
        CloseStoredProc( datm_LI.sp_li_desmonta );
        sp_li_desmonta.ParamByName('@NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
        ExecStoredProc( sp_li_desmonta );
        CloseStoredProc( sp_li_desmonta );

        BoxMensagem( 'LI desmontada com sucesso!', 3 );

        msk_nr_processoExit(nil);
        btn_mi(True, True, True, True, True, False);
        btn_trans_LI.Enabled:=true;
      end;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;          
end;

procedure Tfrm_LI.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_produto );
  with datm_LI do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]) ) then
    begin
      BoxMensagem('Produto não existe ou não está habilitado!' + #13#10 +
                  'O produto padrão do usuário será mantido.', 3 );
      msk_cd_produto.Text := str_cd_produto;
      msk_cd_produtoExit(nil);
    end;
    qry_usuario_habilitacao_.Close;

    qry_produto_.Close;
    qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_produto_.Prepare;
    qry_produto_.Open;
    if qry_produto_.RecordCount > 0 then edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
    qry_produto_.Close;

  end;
end;

procedure Tfrm_LI.btn_co_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  End
  Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_LI.btn_trans_LIClick(Sender: TObject);
var
a:string;
begin
  Application.CreateForm(Tfrm_trans_li, frm_trans_li);
  datm_trans_li.qry_li_lista_.ParamByName('NR_PROCESSO').AsString := trim(msk_cd_unid_neg.text)+ trim(msk_cd_produto.text) +vLi  ;
  frm_trans_LI.msk_cd_unid_neg.Text := msk_cd_unid_neg.text;
  frm_trans_LI.msk_cd_unid_negExit(frm_trans_LI.msk_cd_unid_neg);
  //frm_trans_LI.msk_cd_unid_neg.Enabled := False;
  //frm_trans_LI.btn_cd_unid_neg.Enabled := False;
  frm_trans_LI.ShowModal;
  FreeAndNil(frm_trans_LI);
end;

procedure Tfrm_LI.miRetificaLIClick(Sender: TObject);
begin
  if BoxMensagem( 'Deseja realmente retificar esta LI ?', 1 ) then
  begin
    in_retificar := True;
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( ' UPDATE TLICENCA_ITENS ');
      SQL.Add( ' SET NR_LI_SUBSTITUIDO = :NR_LI_SUBSTITUIDO ');
      SQL.Add( ' WHERE NR_PROCESSO = :NR_PROCESSO ');
      ParamByName('NR_LI_SUBSTITUIDO').AsString := datm_LI.qry_li_NR_REGISTRO_LI.AsString;
      ParamByName('NR_PROCESSO').AsString := datm_LI.qry_li_NR_PROCESSO.AsString;
      ExecSql;
      SQL.Clear;
      SQL.Add( ' UPDATE TLICENCA_IMPORTACAO ');
      SQL.Add( ' SET NR_REGISTRO_LI = NULL, NR_LI_SUBSTITUIDO = :NR_LI_SUBSTITUIDO ');
      SQL.Add( ' WHERE NR_PROCESSO = :NR_PROCESSO ');
      ParamByName('NR_LI_SUBSTITUIDO').AsString := datm_LI.qry_li_NR_REGISTRO_LI.AsString;;
      ParamByName('NR_PROCESSO').AsString := datm_LI.qry_li_NR_PROCESSO.AsString;
      ExecSql;
      Free;
    end;
    btn_capa_liClick(sender);
  end;
end;

procedure Tfrm_LI.ImportarItensDI1Click(Sender: TObject);
begin
  CopiarItensDaDI;
end;

procedure Tfrm_LI.CopiarItensDaDI;
var
  vNrProcessoCopia: string;
  qryLIUpdate, qryLI, qryItemLi: TQuery;
  Resultado: integer;
  i: Integer;
begin

  Application.CreateForm( Tdatm_LI_Itens, datm_LI_Itens );

  try
    vNrProcessoCopia := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );

    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      MessageDlg('A Unidade de Negócio deve ser informada.', mtError, [mbOk], 0);
      Exit;
    end;
    if Trim( msk_cd_produto.Text ) = '' then
    begin
      MessageDlg('O Produto deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;
    if Trim( msk_nr_processo.Text ) = '' then
    begin
      MessageDlg('O Processo deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;

    qryLIUpdate := TQuery.Create(Application);
    qryLIUpdate.DatabaseName := 'DBBROKER';

    qryItemLi := TQuery.Create(Application);
    qryItemLi.DatabaseName := 'DBBROKER';

    qryLI := TQuery.Create(Application);
    qryLI.DatabaseName := 'DBBROKER';

    try
      qryLIUpdate.SQL.Clear;
      qryLIUpdate.SQL.Text := 'UPDATE TLICENCA_IMPORTACAO SET QT_TOTAL_ITEM = :QT_TOTAL_ITEM WHERE NR_PROCESSO = :NR_PROCESSO';


      qryLI.SQL.Clear;
      qryLI.SQL.Text := 'INSERT INTO TLICENCA_IMPORTACAO ( ' + #13#10 +
                        '	NR_PROCESSO, ' + #13#10 +
                        '	CD_IMPORTADOR, ' + #13#10 +
                        '	CD_SERVICO, ' + #13#10 +
                        '	DT_PROCESSO_LI, ' + #13#10 +
                        '	CD_CONDICAO_MERC, ' + #13#10 +
                        '	CD_PAIS_PROCEDENCIA, ' + #13#10 +
                        '	CD_URF_DESPACHO, ' + #13#10 +
                        '	CD_URF_ENTRADA, ' + #13#10 +
                        '	CD_REGIME_TRIBUTACAO, ' + #13#10 +
                        '	CD_FUND_LEGAL, ' + #13#10 +
                        '	TP_ACORDO_ALADI, ' + #13#10 +
                        '	CD_ACORDO_ALADI, ' + #13#10 +
                        '	TP_CAMBIO, ' + #13#10 +
                        '	CD_MOD_PAGAMENTO, ' + #13#10 +
                        '	QT_TOTAL_PES_LIQ, ' + #13#10 +
                        '	CD_MOEDA_MLE, ' + #13#10 +
                        '	VL_TOTAL_MOEDA, ' + #13#10 +
                        '	CD_INCOTERM, ' + #13#10 +
                        '	CD_MOEDA_FRETE, ' + #13#10 +
                        '	VL_FRETE_MOEDA, ' + #13#10 +
                        '	IN_EMBUT_FRT_ITENS ' + #13#10 +
                        ') VALUES ( ' + #13#10 +
                        '	:NR_PROCESSO, ' + #13#10 +
                        '	:CD_IMPORTADOR, ' + #13#10 +
                        '	:CD_SERVICO, ' + #13#10 +
                        '	:DT_PROCESSO_LI, ' + #13#10 +
                        '	:CD_CONDICAO_MERC, ' + #13#10 +
                        '	:CD_PAIS_PROCEDENCIA, ' + #13#10 +
                        '	:CD_URF_DESPACHO, ' + #13#10 +
                        '	:CD_URF_ENTRADA, ' + #13#10 +
                        '	:CD_REGIME_TRIBUTACAO, ' + #13#10 +
                        '	:CD_FUND_LEGAL, ' + #13#10 +
                        '	:TP_ACORDO_ALADI, ' + #13#10 +
                        '	:CD_ACORDO_ALADI, ' + #13#10 +
                        '	:TP_CAMBIO, ' + #13#10 +
                        '	:CD_MOD_PAGAMENTO, ' + #13#10 +
                        '	:QT_TOTAL_PES_LIQ, ' + #13#10 +
                        '	:CD_MOEDA_MLE, ' + #13#10 +
                        '	:VL_TOTAL_MOEDA, ' + #13#10 +
                        '	:CD_INCOTERM, ' + #13#10 +
                        '	:CD_MOEDA_FRETE, ' + #13#10 +
                        '	:VL_FRETE_MOEDA, ' + #13#10 +
                        '	:IN_EMBUT_FRT_ITENS ' + #13#10 +
                        ') ';

      qryItemLi.SQL.Clear;
      qryItemLi.SQL.Text := 'INSERT INTO TLICENCA_ITENS( ' + #13#10 +
                            '	NR_PROCESSO, ' + #13#10 +
                            '	NR_ITEM, ' + #13#10 +
                            '	CD_EXPORTADOR, ' + #13#10 +
                            '	CD_FABR_EXPO, ' + #13#10 +
                            '	CD_FABRICANTE, ' + #13#10 +
                            '	CD_MERCADORIA, ' + #13#10 +
                            '	CD_NALADI_NCCA, ' + #13#10 +
                            '	CD_NALADI_SH, ' + #13#10 +
                            '	CD_NCM_SH, ' + #13#10 +
                            '	CD_PAIS_AQUISICAO, ' + #13#10 +
                            '	CD_PAIS_ORIGEM, ' + #13#10 +
                            '	CD_UN_MED_COMERC, ' + #13#10 +
                            '	PL_MERCADORIA, ' + #13#10 +
                            '	QT_MERC_UN_COMERC, ' + #13#10 +
                            '	QT_MERC_UN_ESTAT, ' + #13#10 +
                            '	TX_DESC_DET_MERC, ' + #13#10 +
                            '	NR_ITEM_PO, ' + #13#10 +
                            '	NR_PROC_PO, ' + #13#10 +
                            '	VL_UNIT_MLE, ' + #13#10 +
                            '	VL_TOTAL_MLE, ' + #13#10 +
                            '	NR_DESTAQUE_NCM ' + #13#10 +
                            ') VALUES ( ' + #13#10 +
                            '	:NR_PROCESSO, ' + #13#10 +
                            '	:NR_ITEM, ' + #13#10 +
                            '	:CD_EXPORTADOR, ' + #13#10 +
                            '	:CD_FABR_EXPO, ' + #13#10 +
                            '	:CD_FABRICANTE, ' + #13#10 +
                            '	:CD_MERCADORIA, ' + #13#10 +
                            '	:CD_NALADI_NCCA, ' + #13#10 +
                            '	:CD_NALADI_SH, ' + #13#10 +
                            '	:CD_NCM_SH, ' + #13#10 +
                            '	:CD_PAIS_AQUISICAO, ' + #13#10 +
                            '	:CD_PAIS_ORIGEM, ' + #13#10 +
                            '	:CD_UN_MED_COMERC, ' + #13#10 +
                            '	:PL_MERCADORIA, ' + #13#10 +
                            '	:QT_MERC_UN_COMERC, ' + #13#10 +
                            '	:QT_MERC_UN_ESTAT, ' + #13#10 +
                            '	:TX_DESC_DET_MERC, ' + #13#10 +
                            '	:NR_ITEM_PO, ' + #13#10 +
                            '	:NR_PROC_PO, ' + #13#10 +
                            '	:VL_UNIT_MLE, ' + #13#10 +
                            '	:VL_TOTAL_MLE, ' + #13#10 +
                            '	:NR_DESTAQUE_NCM ' + #13#10 +
                            ') ';




      datm_LI.qry_Adicoes_DI_Copia.Close;
      datm_LI.qry_Adicoes_DI_Copia.ParamByName('NR_PROCESSO').AsString := vNrProcessoCopia;
      datm_LI.qry_Adicoes_DI_Copia.Open;

      if datm_LI.qry_Adicoes_DI_Copia.RecordCount = 0 then
      begin
        ShowMessage('Não existe itens de DI para o processo digitado : ' + vNrProcessoCopia);
        Exit;
      end;


      datm_LI.qry_Adicoes_DI_Copia.First;
      while not datm_LI.qry_Adicoes_DI_Copia.Eof do
      begin
        qryLI.ParamByName('NR_PROCESSO').AsString := vNrProcessoCopia;
        qryLI.ParamByName('CD_IMPORTADOR').AsString := edt_cd_cliente.Text;
        qryLI.ParamByName('CD_SERVICO').AsString := edt_cd_servico.Text;
        qryLI.ParamByName('DT_PROCESSO_LI').AsDateTime := StrToDate( DateToStr( Date ) );
        qryLI.ParamByName('CD_CONDICAO_MERC').AsString := '0';
        qryLI.ParamByName('CD_PAIS_PROCEDENCIA').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_PAIS_PROC_CARGA.AsString; //Pais de Procedencia -- (TLICENCA_IMPORTACAO)
        qryLI.ParamByName('CD_URF_DESPACHO').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_URF_DESPACHO.AsString; //URF de Despacho
        qryLI.ParamByName('CD_URF_ENTRADA').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_URF_ENTR_CARGA.AsString; //URF de Entrada
        qryLI.ParamByName('CD_REGIME_TRIBUTACAO').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_REGIME_TRIBUTAR.AsString; //Código
        qryLI.ParamByName('CD_FUND_LEGAL').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_FUND_LEG_REGIME.AsString; //Fund.Legal
        qryLI.ParamByName('TP_ACORDO_ALADI').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_TIPO_ACORDO_TAR.AsString; //Acordo Tarifario – Tipo
        qryLI.ParamByName('CD_ACORDO_ALADI').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_ACORDO_ALADI.AsString; //Acordo Tarifario – Acordo ALADI
        qryLI.ParamByName('TP_CAMBIO').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_COBERT_CAMBIAL.AsString; //Cobertura Cambial
        qryLI.ParamByName('CD_MOD_PAGAMENTO').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_MODALIDADE_PGTO.AsString; //Modalidade de Pag.
        qryLI.ParamByName('QT_TOTAL_PES_LIQ').AsFloat := datm_LI.qry_Adicoes_DI_CopiaPL_MERCADORIA.AsFloat; //Peso Líquido (kg)
        qryLI.ParamByName('CD_MOEDA_MLE').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_MOEDA_NEGOCIADA.AsString; //Moeda
        qryLI.ParamByName('VL_TOTAL_MOEDA').AsFloat := datm_LI.qry_Adicoes_DI_CopiaVL_MERC_LOC_EMB_MNEG.AsFloat; //VMLE
        qryLI.ParamByName('CD_INCOTERM').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_INCOTERMS_VENDA.AsString; //Incoterm
        qryLI.ParamByName('CD_MOEDA_FRETE').AsString := datm_LI.qry_Adicoes_DI_CopiaCD_MD_FRETE_MERC.AsString; //Frete – Moeda
        qryLI.ParamByName('VL_FRETE_MOEDA').AsFloat := datm_LI.qry_Adicoes_DI_CopiaVL_FRETE_MERC_MNEG.AsFloat; //Frete – Valor na Moeda
        qryLI.ParamByName('IN_EMBUT_FRT_ITENS').AsString := datm_LI.qry_Adicoes_DI_CopiaIN_EMBUT_FRT_ITENS.AsString; //Embutido nos itens
        qryLI.ExecSql;

        datm_LI.qry_Itens_DI_Copia.Close;
        datm_LI.qry_Itens_DI_Copia.ParamByName('NR_PROCESSO').AsString := vNrProcessoCopia;
        datm_LI.qry_Itens_DI_Copia.ParamByName('NR_ADICAO').AsString := datm_LI.qry_Adicoes_DI_CopiaNR_ADICAO.AsString;
        datm_LI.qry_Itens_DI_Copia.Open;

        qryLIUpdate.ParamByName('NR_PROCESSO').AsString := vNrProcessoCopia;
        qryLIUpdate.ParamByName('QT_TOTAL_ITEM').AsString := IntToStr(datm_LI.qry_Itens_DI_Copia.recordcount);
        qryLIUpdate.ExecSQL;

        i := 0;
        datm_LI.qry_Itens_DI_Copia.First;
        while not datm_LI.qry_Itens_DI_Copia.Eof do
        begin
          i := i + 1;

          qryItemLi.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qryItemLi.ParamByName('NR_ITEM').AsString := StrZero( i, 3 );
          qryItemLi.ParamByName('CD_EXPORTADOR').AsString := datm_LI.qry_Itens_DI_CopiaCD_EXPORTADOR.AsString;
          qryItemLi.ParamByName('CD_FABR_EXPO').AsString := datm_LI.qry_Itens_DI_CopiaCD_FABR_EXPO.AsString;
          qryItemLi.ParamByName('CD_FABRICANTE').AsString := datm_LI.qry_Itens_DI_CopiaCD_FABRICANTE.AsString;
          qryItemLi.ParamByName('CD_MERCADORIA').AsString := datm_LI.qry_Itens_DI_CopiaCD_MERCADORIA.AsString;
          qryItemLi.ParamByName('CD_NALADI_NCCA').AsString := datm_LI.qry_Itens_DI_CopiaCD_NALADI_NCCA.AsString;
          qryItemLi.ParamByName('CD_NALADI_SH').AsString := datm_LI.qry_Itens_DI_CopiaCD_NALADI_SH.AsString;
          qryItemLi.ParamByName('CD_NCM_SH').AsString := datm_LI.qry_Itens_DI_CopiaCD_NCM_SH.AsString;
          qryItemLi.ParamByName('CD_PAIS_AQUISICAO').AsString := datm_LI.qry_Itens_DI_CopiaCD_PAIS_AQUISICAO.AsString;
          qryItemLi.ParamByName('CD_PAIS_ORIGEM').AsString := datm_LI.qry_Itens_DI_CopiaCD_PAIS_ORIGEM.AsString;
          qryItemLi.ParamByName('CD_UN_MED_COMERC').AsString := datm_LI.qry_Itens_DI_CopiaCD_UN_MED_COMERC.AsString;
          qryItemLi.ParamByName('PL_MERCADORIA').AsFloat := datm_LI.qry_Itens_DI_CopiaPL_MERCADORIA.AsFloat;
          qryItemLi.ParamByName('QT_MERC_UN_COMERC').AsFloat := datm_LI.qry_Itens_DI_CopiaQT_MERC_UN_COMERC.AsFloat;
          qryItemLi.ParamByName('QT_MERC_UN_ESTAT').AsFloat := datm_LI.qry_Itens_DI_CopiaQT_MERC_UN_ESTAT.AsFloat;
          qryItemLi.ParamByName('TX_DESC_DET_MERC').AsMemo := datm_LI.qry_Itens_DI_CopiaTX_DESC_DET_MERC.Value;
          qryItemLi.ParamByName('NR_ITEM_PO').AsString := datm_LI.qry_Itens_DI_CopiaNR_ITEM_PO.AsString;
          qryItemLi.ParamByName('NR_PROC_PO').AsString := datm_LI.qry_Itens_DI_CopiaNR_PROC_PO.AsString;
          qryItemLi.ParamByName('VL_UNIT_MLE').AsFloat := datm_LI.qry_Itens_DI_CopiaVL_UNID_COND_VENDA.AsFloat; // ou VL_UNITARIO
          qryItemLi.ParamByName('VL_TOTAL_MLE').AsFloat := datm_LI.qry_Itens_DI_CopiaVL_MLE_ITEM.AsFloat;       // ou VL_MLE_ITEM
          qryItemLi.ParamByName('NR_DESTAQUE_NCM').AsString := datm_LI.qry_Itens_DI_CopiaNR_DESTAQUE_NCM.AsString;

          qryItemLi.ExecSql;
          datm_LI.qry_Itens_DI_Copia.Next;
        end;

        CloseStoredProc( datm_LI_Itens.sp_li_monta_li );
        datm_LI_Itens.sp_li_monta_li.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc( datm_LI_Itens.sp_li_monta_li );
        case datm_LI_Itens.sp_li_monta_li.ParamByName('Result').AsInteger of
          1: begin
               BoxMensagem('Valor Total da Mercadoria diferente!', 2);
               Exit;
             end;
          2: begin
               BoxMensagem('Total do Peso Liquido é diferente !', 2);
               Exit;
             end;
          3: begin
               BoxMensagem('Total da Quantidade é diferente!', 2);
               Exit;
             end;
        end;
        CloseStoredProc( datm_LI_Itens.sp_li_monta_li );

        datm_LI.qry_Adicoes_DI_Copia.Next;
      end;

      ImportarItensDI1.Enabled := false;
      ShowMessage('Cópia dos itens de LI finalizada com sucesso!');

    finally
      FreeAndNil(qryLIUpdate);
      FreeAndNil(qryLI);
      FreeAndNil(qryItemLi);
    end;

  finally
    FreeAndNil(datm_LI_Itens);
  end;
end;

procedure Tfrm_LI.CopiarItensDoPedido;
var
  vNrProcessoCopia: string;
  qryLI, qryItemLi: TQuery;
  Resultado: integer;
  i: Integer;
begin

  vNrProcessoCopia := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );

  if Trim( msk_cd_unid_neg.Text ) = '' then
  begin
    MessageDlg('A Unidade de Negócio deve ser informada.', mtError, [mbOk], 0);
    Exit;
  end;
  if Trim( msk_cd_produto.Text ) = '' then
  begin
    MessageDlg('O Produto deve ser informado.', mtError, [mbOk], 0);
    Exit;
  end;
  if Trim( msk_nr_processo.Text ) = '' then
  begin
    MessageDlg('O Processo deve ser informado.', mtError, [mbOk], 0);
    Exit;
  end;

  qryItemLi := TQuery.Create(Application);
  qryItemLi.DatabaseName := 'DBBROKER';

  qryLI := TQuery.Create(Application);
  qryLI.DatabaseName := 'DBBROKER';


  datm_main.db_broker.StartTransaction;
  try
    try
      qryLI.SQL.Clear;
      qryLI.SQL.Text := 'INSERT INTO TLICENCA_IMPORTACAO ( ' + #13#10 +
                        '	NR_PROCESSO, ' + #13#10 +
                        '	CD_IMPORTADOR, ' + #13#10 +
                        '	CD_SERVICO, ' + #13#10 +
                        '	DT_PROCESSO_LI, ' + #13#10 +
                        '	CD_CONDICAO_MERC, ' + #13#10 +
                        ' QT_TOTAL_ITEM ' + #13#10 +
                        ') VALUES ( ' + #13#10 +
                        '	:NR_PROCESSO, ' + #13#10 +
                        '	:CD_IMPORTADOR, ' + #13#10 +
                        '	:CD_SERVICO, ' + #13#10 +
                        '	:DT_PROCESSO_LI, ' + #13#10 +
                        '	:CD_CONDICAO_MERC, ' + #13#10 +
                        ' :QT_TOTAL_ITEM ' + #13#10 +
                        ') ';

      qryItemLi.SQL.Clear;
      qryItemLi.SQL.Text := ' INSERT INTO TLICENCA_ITENS ' +#13#10 +
                            '         ( ' +#13#10 +
                            '         NR_PROCESSO, ' +#13#10 +
                            '         NR_ITEM, ' +#13#10 +
                            '         CD_EXPORTADOR, ' +#13#10 +
                            '         CD_FABR_EXPO, ' +#13#10 +
                            '         CD_FABRICANTE, ' +#13#10 +
                            '         CD_MERCADORIA, ' +#13#10 +
                            '         CD_NALADI_NCCA, ' +#13#10 +
                            '         CD_NALADI_SH, ' +#13#10 +
                            '         CD_NCM_SH, ' +#13#10 +
                            '         CD_PAIS_AQUISICAO, ' +#13#10 +
                            '         CD_PAIS_ORIGEM, ' +#13#10 +
                            '         CD_UN_MED_COMERC, ' +#13#10 +
                            '         PL_MERCADORIA, ' +#13#10 +
                            '         QT_MERC_UN_COMERC, ' +#13#10 +
                            '         TX_DESC_DET_MERC, ' +#13#10 +
                            '         NR_ITEM_PO, ' +#13#10 +
                            '         NR_PROC_PO, ' +#13#10 +
                            '         VL_UNIT_MLE, ' +#13#10 +
                            '         VL_TOTAL_MLE ' +#13#10 +
                            '         ) ' +#13#10 +
                            ' SELECT P.NR_PROCESSO, ' +#13#10 +
                            '        ROW_NUMBER() OVER(ORDER BY POI.NR_PROCESSO, POI.NR_ITEM_CLIENTE, POI.NR_PARCIAL ) AS NR_ITEM, ' +#13#10 +
                            '        POI.CD_EXPORTADOR, ' +#13#10 +
                            '        POI.IN_FABR_EXP_PROD, ' +#13#10 +
                            '        POI.CD_FABRICANTE, ' +#13#10 +
                            '        POI.CD_MERCADORIA, ' +#13#10 +
                            '        POI.CD_NALADI_NCCA, ' +#13#10 +
                            '        POI.CD_NALADI_SH, ' +#13#10 +
                            '        POI.CD_NCM_SH, ' +#13#10 +
                            '        POI.CD_PAIS_AQUISICAO, ' +#13#10 +
                            '        POI.CD_PAIS_ORIGEM, ' +#13#10 +
                            '        POI.CD_UNID_MEDIDA, ' +#13#10 +
                            '        POI.PL_ITEM, ' +#13#10 +
                            '        POI.QT_INICIAL, ' +#13#10 +
                            '        POI.TX_MERCADORIA, ' +#13#10 +
                            '        POI.NR_ITEM, ' +#13#10 +
                            '        POI.NR_PROCESSO, ' +#13#10 +
                            '        POI.VL_UNITARIO, ' +#13#10 +
                            '        POI.VL_UNITARIO * POI.QT_INICIAL ' +#13#10 +
                            ' FROM TREF_CLIENTE R (NOLOCK) ' +#13#10 +
                            ' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = R.NR_PROCESSO ' +#13#10 +
                            ' INNER JOIN TPO_ITEM POI (NOLOCK) ON POI.NR_PROCESSO = R.CD_REFERENCIA AND ' +#13#10 +
                            '                                     POI.NR_ITEM_CLIENTE = R.NR_ITEM_PO AND ' +#13#10 +
                            '                                     POI.NR_PARCIAL = R.NR_PARCIAL AND ' +#13#10 +
                            '                                     POI.CD_EMPRESA = P.CD_CLIENTE ' +#13#10 +
                            ' WHERE ' +#13#10 +
                            ' P.NR_PROCESSO = :NR_PROCESSO ';
  //                          ' AND POI.NR_PROCESSO = :NR_REFERENCIA ' +#13#10 +
  //                          ' AND POI.NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ' +#13#10 +
  //                          ' AND POI.NR_PARCIAL = :NR_PARCIAL ';


      datm_LI.qry_Itens_Pedidos.Close;
      datm_LI.qry_Itens_Pedidos.ParamByName('NR_PROCESSO').AsString := vNrProcessoCopia;
      datm_LI.qry_Itens_Pedidos.Open;

      if datm_LI.qry_Itens_Pedidos.RecordCount = 0 then
      begin
        ShowMessage('Pedido não encontrado para o processo digitado : ' + vNrProcessoCopia);
        Exit;
      end;

      qryLI.ParamByName('NR_PROCESSO').AsString := vNrProcessoCopia;
      qryLI.ParamByName('CD_IMPORTADOR').AsString := edt_cd_cliente.Text;
      qryLI.ParamByName('CD_SERVICO').AsString := edt_cd_servico.Text;
      qryLI.ParamByName('DT_PROCESSO_LI').AsDateTime := StrToDate( DateToStr( Date ) );
      qryLI.ParamByName('CD_CONDICAO_MERC').AsString := '0';
      qryLI.ParamByName('QT_TOTAL_ITEM').AsInteger := datm_LI.qry_Itens_Pedidos.recordCount;
      qryLI.ExecSql;

      qryItemLi.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qryItemLi.ExecSql;


  //      i := 0;
  //      datm_LI.qry_Itens_Pedidos.First;
  //      while not datm_LI.qry_Itens_Pedidos.Eof do
  //      begin
  //        i := i + 1;
  //
  //        qryItemLi.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  //        qryItemLi.ParamByName('NR_ITEM').AsString := StrZero( i, 3 );
  //
  //        qryItemLi.ParamByName('NR_REFERENCIA').AsString := datm_LI.qry_Itens_PedidosNR_REFERENCIA.AsString;
  //        qryItemLi.ParamByName('NR_ITEM_CLIENTE').AsString := datm_LI.qry_Itens_PedidosNR_ITEM_CLIENTE.AsString;
  //        qryItemLi.ParamByName('NR_PARCIAL').AsString := datm_LI.qry_Itens_PedidosNR_PARCIAL.AsString;
  //        qryItemLi.ExecSql;
  //        datm_LI.qry_Itens_Pedidos.Next;
  //      end;

      IncluirItensPedidos1.Enabled := false;
      ShowMessage('Cópia dos itens de LI finalizada com sucesso!');

      datm_main.db_broker.Commit;

    finally
      FreeAndNil(qryLI);
      FreeAndNil(qryItemLi);
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_LI.DuplicarLi;
var
  vNrProcessoCopia, vNrProcessoNovo: string;
  qryLI, qryItemLi: TQuery;
  Resultado: integer;
  i: Integer;
begin

  Application.CreateForm( Tdatm_LI_Itens, datm_LI_Itens );

  try
    vNrProcessoCopia := InputBox('Duplicar LIs', 'Número do processo:', '');

    if Length(vNrProcessoCopia) <> 12 then
    begin
      ShowMessage('O número do processo deve conter 12 caracteres.');
      Exit;
    end;

    vNrProcessoNovo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
    vNrProcessoCopia := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + vNrProcessoCopia;

    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      MessageDlg('A Unidade de Negócio deve ser informada.', mtError, [mbOk], 0);
      Exit;
    end;
    if Trim( msk_cd_produto.Text ) = '' then
    begin
      MessageDlg('O Produto deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;
    if Trim( msk_nr_processo.Text ) = '' then
    begin
      MessageDlg('O Processo deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;

    qryItemLi := TQuery.Create(Application);
    qryItemLi.DatabaseName := 'DBBROKER';

    qryLI := TQuery.Create(Application);
    qryLI.DatabaseName := 'DBBROKER';

    try
      qryLI.SQL.Clear;
      qryLI.SQL.Text := 'INSERT INTO TLICENCA_IMPORTACAO ' + #13#10 +
                        'SELECT ' + #13#10 +
                        '  :NR_PROCESSO_NOVO + SUBSTRING(NR_PROCESSO, 17, 20), ' + #13#10 +
                        '  NR_IDENT_USUARIO, ' + #13#10 +
                        '  NR_ATO_DRAWBACK, ' + #13#10 +
                        '  NR_COMUNICADO_COMPRA, ' + #13#10 +
                        '  NULL, ' + #13#10 + //NR_REGISTRO_LI
                        '  CD_MOD_PAGAMENTO, ' + #13#10 +
                        '  CD_IMPORTADOR, ' + #13#10 +
                        '  CD_ACORDO_ALADI, ' + #13#10 +
                        '  CD_REGIME_TRIBUTACAO, ' + #13#10 +
                        '  CD_FUND_LEGAL, ' + #13#10 +
                        '  CD_AGENCIA_SECEX, ' + #13#10 +
                        '  CD_PAIS_PROCEDENCIA, ' + #13#10 +
                        '  CD_INCOTERM, ' + #13#10 +
                        '  CD_INSTITUICAO_FINANC, ' + #13#10 +
                        '  CD_MOT_SEM_COBERTURA, ' + #13#10 +
                        '  CD_CONDICAO_MERC, ' + #13#10 +
                        '  CD_MOEDA_FOB, ' + #13#10 +
                        '  CD_URF_DESPACHO, ' + #13#10 +
                        '  CD_URF_ENTRADA, ' + #13#10 +
                        '  CD_MOEDA_FRETE, ' + #13#10 +
                        '  CD_MOEDA_SEGURO, ' + #13#10 +
                        '  CD_MOEDA_MLE, ' + #13#10 +
                        '  CD_TIPO_IMPORTADOR, ' + #13#10 +
                        '  CD_SERVICO, ' + #13#10 +
                        '  GETDATE(), ' + #13#10 +
                        '  NULL, ' + #13#10 + //DT_REGISTRO_LI
                        '  QT_DIAS_COBERTURA, ' + #13#10 +
                        '  QT_TOTAL_PES_LIQ, ' + #13#10 +
                        '  QT_MED_ESTATISTICA, ' + #13#10 +
                        '  QT_TOTAL_ITEM, ' + #13#10 +
                        '  TP_CAMBIO, ' + #13#10 +
                        '  TP_ACORDO_ALADI, ' + #13#10 +
                        '  TX_INFO_COMPLEMENTAR, ' + #13#10 +
                        '  VL_FRETE_MOEDA, ' + #13#10 +
                        '  VL_SEGURO_MOEDA, ' + #13#10 +
                        '  VL_DESPESA_MOEDA, ' + #13#10 +
                        '  VL_DESCONTO_MOEDA, ' + #13#10 +
                        '  VL_TOTAL_MOEDA, ' + #13#10 +
                        '  NR_PROCESSO_SISCOMEX, ' + #13#10 +
                        '  IN_MONTADA, ' + #13#10 +
                        '  NR_LI_SUBSTITUIDO, ' + #13#10 +
                        '  TP_RATEIO_PESO_LIQ, ' + #13#10 +
                        '  IN_RATEIO_PESO_LIQ, ' + #13#10 +
                        '  IN_EMBUT_FRT_ITENS, ' + #13#10 +
                        '  NULL, ' + #13#10 + //IN_SOLIC_TRANSMISSAO
                        '  NULL, ' + #13#10 + //DT_TRANSMISSAO
                        '  NULL, ' + #13#10 + //CD_USUARIO_TRANSMISSAO
                        '  NULL, ' + #13#10 + //NR_IDENT_TRANSMISSAO
                        '  NULL, ' + #13#10 + //CD_USUARIO_REGISTRO
                        '  ENQ_MAT_USADO, ' + #13#10 +
                        '  OP_NACIONALIZACAO, ' + #13#10 +
                        '  VL_FRETE_MOEDA_MERC ' + #13#10 +
                        'FROM TLICENCA_IMPORTACAO ' + #13#10 +
                        'WHERE NR_PROCESSO = :NR_PROCESSO_COPIA';

      qryItemLi.SQL.Clear;
      qryItemLi.SQL.Text :=
                            'INSERT INTO TLICENCA_ITENS ' + #13#10 +
                            'SELECT ' + #13#10 +
                            ':NR_PROCESSO_NOVO  + SUBSTRING(NR_PROCESSO, 17, 20), ' + #13#10 +
                            'NR_ITEM, ' + #13#10 +
                            'NR_DESTAQUE_NCM, ' + #13#10 +
                            'CD_IMPORTADOR, ' + #13#10 +
                            'CD_EXPORTADOR, ' + #13#10 +
                            'CD_FABR_EXPO, ' + #13#10 +
                            'CD_FABRICANTE, ' + #13#10 +
                            'CD_MERCADORIA, ' + #13#10 +
                            'CD_NALADI_NCCA, ' + #13#10 +
                            'CD_NALADI_SH, ' + #13#10 +
                            'CD_NCM_SH, ' + #13#10 +
                            'CD_PAIS_AQUISICAO, ' + #13#10 +
                            'CD_PAIS_ORIGEM, ' + #13#10 +
                            'CD_UN_MED_COMERC, ' + #13#10 +
                            'CD_UN_MED_ESTAT, ' + #13#10 +
                            'PL_MERCADORIA, ' + #13#10 +
                            'QT_MERC_UN_COMERC, ' + #13#10 +
                            'QT_MERC_UN_ESTAT, ' + #13#10 +
                            'TX_DESC_DET_MERC, ' + #13#10 +
                            'VL_UNIT_MLE, ' + #13#10 +
                            'VL_TOTAL_MLE, ' + #13#10 +
                            'VL_UNIT_MCV, ' + #13#10 +
                            'CD_PAIS_PROCEDENCIA, ' + #13#10 +
                            'VL_RAT_FRETE, ' + #13#10 +
                            'VL_RAT_SEGURO, ' + #13#10 +
                            'VL_RAT_DESPESA, ' + #13#10 +
                            'VL_RAT_DESCONTO, ' + #13#10 +
                            'NR_ITEM_PO, ' + #13#10 +
                            'NR_PROC_PO, ' + #13#10 +
                            'NR_ATO_DRAWBACK, ' + #13#10 +
                            'CD_REGIME_TRIBUTACAO, ' + #13#10 +
                            'CD_FUND_LEGAL, ' + #13#10 +
                            'NR_ITEM_DRAWBACK_BK, ' + #13#10 +
                            'NR_REG_DRAWBACK, ' + #13#10 +
                            'IN_REG_DRAWBACK, ' + #13#10 +
                            'NR_LI_SUBSTITUIDO, ' + #13#10 +
                            'IN_DRAWBACK_AUTOMATICO, ' + #13#10 +
                            'QT_PRODUTO_DRAWBACK, ' + #13#10 +
                            'VL_PRODUTO_DRAWBACK, ' + #13#10 +
                            'NR_FATURA_PO, ' + #13#10 +
                            'SISTEMA_DRAWBACK, ' + #13#10 +
                            'NR_ITEM_DRAWBACK, ' + #13#10 +
                            'NR_QUEBRA_EXTRA, ' + #13#10 +
                            'VL_TOTAL_MLE_SEM_FRETE, ' + #13#10 +
                            'VL_RAT_FRETE_MOEDA_MERC ' + #13#10 +
                            'FROM TLICENCA_ITENS WHERE ' + #13#10 +
                            'NR_PROCESSO = :NR_PROCESSO_COPIA ';

      datm_LI.qry_LIs_Copia.Close;
      datm_LI.qry_LIs_Copia.ParamByName('NR_PROCESSO_COPIA').AsString := vNrProcessoCopia + '%';
      datm_LI.qry_LIs_Copia.Open;

      if datm_LI.qry_LIs_Copia.RecordCount = 0 then
      begin
        ShowMessage('Não existe LIs para o processo digitado : ' + vNrProcessoCopia);
        Exit;
      end;

      datm_LI.qry_LIs_Copia.First;
      while not datm_LI.qry_LIs_Copia.Eof do
      begin
        qryLI.ParamByName('NR_PROCESSO_NOVO').AsString := vNrProcessoNovo;
        qryLI.ParamByName('NR_PROCESSO_COPIA').AsString := datm_LI.qry_LIs_CopiaNR_PROCESSO.AsString;
        qryLI.ExecSql;

        qryItemLi.ParamByName('NR_PROCESSO_NOVO').AsString := vNrProcessoNovo;
        qryItemLi.ParamByName('NR_PROCESSO_COPIA').AsString := datm_LI.qry_LIs_CopiaNR_PROCESSO.AsString;
        qryItemLi.ExecSql;

        CloseStoredProc( datm_LI_Itens.sp_li_monta_li );
        datm_LI_Itens.sp_li_monta_li.ParamByName('@NR_PROCESSO').AsString := vNrProcessoNovo;
        ExecStoredProc( datm_LI_Itens.sp_li_monta_li );
        case datm_LI_Itens.sp_li_monta_li.ParamByName('Result').AsInteger of
          1: begin
               BoxMensagem('Valor Total da Mercadoria diferente!', 2);
               Exit;
             end;
          2: begin
               BoxMensagem('Total do Peso Liquido é diferente !', 2);
               Exit;
             end;
          3: begin
               BoxMensagem('Total da Quantidade é diferente!', 2);
               Exit;
             end;
        end;
        CloseStoredProc( datm_LI_Itens.sp_li_monta_li );

        datm_LI.qry_LIs_Copia.Next;
      end;

      DuplicarLI1.Enabled := false;
      ShowMessage('LI duplicada com sucesso!');

    finally
      FreeAndNil(qryLI);
      FreeAndNil(qryItemLi);
    end;
  finally
    FreeAndNil(datm_LI_Itens);
  end;
end;

procedure Tfrm_LI.DuplicarLI1Click(Sender: TObject);
begin
  DuplicarLi;
end;

procedure Tfrm_LI.IncluirItensPedidos1Click(Sender: TObject);
begin
  CopiarItensDoPedido;
end;

end.
