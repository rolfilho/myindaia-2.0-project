unit PGFT031;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, PGGP001, ComCtrls, UCRPE32, Funcoes;

type
  Tfrm_previsao_custo = class(TForm)
    pnl_cadastro: TPanel;
    pnl_selecao: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    pgctrl_prev_custo: TPageControl;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_Cancelar: TSpeedButton;
    btn_sair: TSpeedButton;
    ts_prev_custo: TTabSheet;
    pnl_prev_custo: TPanel;
    lbl_valor: TLabel;
    lblItem: TLabel;
    btn_co_item: TSpeedButton;
    dbedt_vl_recebimento: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbg_prev_custo: TDBGrid;
    btn_excluir: TSpeedButton;
    mi_excluir: TMenuItem;
    lbl_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    lbl_data: TLabel;
    dbedt_dt_lancamento: TDBEdit;
    btn_atz: TSpeedButton;
    mi_atz: TMenuItem;
    btn_imprime: TSpeedButton;
    crp_prev_custo: TCrpe;
    rdgrpEmissao: TRadioGroup;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure mi_novoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure dbedt_vl_recebimentoChange(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure Cancelar;
    procedure btn_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_atzClick(Sender: TObject);
    procedure btn_imprimeClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    chave        : string;

    function Consiste    : Boolean;
    function Grava       : Boolean;
    function VerAlt      : Boolean;

  public
    cState : String[1];
    lNaoConsiste: Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    { Public declarations }
  end;

var
  frm_previsao_custo: Tfrm_previsao_custo;

implementation

uses GSMLIB, PGGP015, PGGP017, PGFT032, PGSM018, PGSM059, PGSM136;

{$R *.DFM}

type
  EOperacaoCancelada = class(Exception);

procedure Tfrm_previsao_custo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_previsao_custo.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  with datm_previsao_custo do
  begin
    if Not VerAlt then Exit;

{    qry_apaga_.Close;
    qry_apaga_.ExecSQL;
    qry_apaga_.Close;}

    qry_item_.Close;
    qry_unid_neg_.Close;
    qry_processo_.Close;
    qry_previsao_custo_.Close;
    Free;
  end;
  crp_prev_custo.Free;
  Action := caFree;

end;

procedure Tfrm_previsao_custo.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Dados da Previsão de Custo}
  Application.CreateForm(Tdatm_previsao_custo, datm_previsao_custo );
end;

procedure Tfrm_previsao_custo.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  With datm_previsao_custo Do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_unid_neg_.Open;
    if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.text, [loCaseInsensitive, loPartialKey]) then
    begin
      edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;
      msk_nr_processo.SetFocus;
    end
    else
    begin
      edt_nm_unid_neg.clear;
      BoxMensagem('Unidade não habilitada/ativa!', 2);
      msk_cd_unid_neg.SetFocus;
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

procedure Tfrm_previsao_custo.mi_novoClick(Sender: TObject);
begin
  with datm_previsao_custo Do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if msk_cd_unid_neg.text = '' then
      begin
        MessageDlg('Forneça o código da Unidade de Negócio.', mtError, [mbOk], 0);
        msk_cd_unid_neg.setfocus;
        Exit
      end;
    except
      begin
        datm_main.db_broker.Rollback;
      end
    end;
  end;
end;

procedure Tfrm_previsao_custo.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do
  Begin
  Caption := Caption + ' [Consulta On-Line]';
  frm_unidade.Cons_OnLine_Texto := msk_cd_unid_neg.Text;
  lCons_OnLine := True;
  ShowModal;
  lCons_OnLine := False;
  end;
  msk_cd_unid_negExit(Sender);
end;

procedure Tfrm_previsao_custo.btn_cd_unid_negClick(Sender: TObject);
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

procedure Tfrm_previsao_custo.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;
  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;
  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;
  mi_Cancelar.Enabled  := c;
//  btn_excluir.Enabled  := e;
//  mi_excluir.Enabled   := e;
end;

procedure Tfrm_previsao_custo.dbedt_vl_recebimentoChange(Sender: TObject);
begin
  If (datm_previsao_custo.qry_previsao_custo_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi (false, true, true, false);
  end;
end;

procedure Tfrm_previsao_custo.dbedt_cd_itemChange(Sender: TObject);
begin
  If (datm_previsao_custo.qry_previsao_custo_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi (false, true, true, false);
  end;
end;

procedure Tfrm_previsao_custo.btn_incluirClick(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem('Informe a Unidade de Negócio!', 2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if msk_nr_processo.Text = '' then
  begin
    BoxMensagem('Informe o Processo!', 2);
    msk_nr_processo.SetFocus;
    Exit;
  end;

  try
    With datm_previsao_custo Do
    begin
      qry_previsao_custo_.Append;
      qry_previsao_custo_NR_PROCESSO.AsString     := qry_processo_NR_PROCESSO.AsString;
      qry_previsao_custo_DT_LANCAMENTO.AsDateTime := Date;
      qry_previsao_custo_IN_TRANSF.AsString       := '0';
    end;
  except
    on E: Exception do
    begin
      datm_previsao_custo.qry_previsao_custo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Exit;
    end;
  end;
  btn_mi (False, True, True, False);
  dbedt_cd_item.SetFocus;
end;

procedure Tfrm_previsao_custo.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

function Tfrm_previsao_custo.Consiste : Boolean;
begin
  Consiste := True;
  if Not lNaoConsiste then
  begin
    if dbedt_vl_recebimento.Text = '' then
    begin
      BoxMensagem('Campo Valor deve ser preenchido!', 2);
      dbedt_vl_recebimento.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_cd_item.Text = '' then
    begin
      BoxMensagem('Campo Item deve ser preenchido!', 2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      exit;
    end;
  end;

  If Not ( datm_previsao_custo.qry_previsao_custo_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_item );
  if dbedt_cd_item.Text <> '' Then
  begin
    if dbedt_nm_item.Text = '' Then
    begin
      BoxMensagem('Código do Item inválido!',2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

function Tfrm_previsao_custo.Grava : Boolean;
var
cd_item : String;
begin
  with datm_previsao_custo do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_previsao_custo_.State in [dsInsert, dsEdit] ) then
      begin
        chave := qry_previsao_custo_NR_PROCESSO.Asstring;
        {Força a data}
        qry_previsao_custo_DT_LANCAMENTO.AsDateTime := StrToDate( dbedt_dt_lancamento.Text );
        {grava Previsão de Custo}
        qry_previsao_custo_VL_CALCULADO.AsFloat := qry_previsao_custo_VL_INFORMADO.AsFloat;
        if qry_previsao_custo_IN_TRANSF.AsString = '0' then
        begin
          qry_taxa_cambio_.Close;
          qry_taxa_cambio_.ParamByName('DT_LANCAMENTO').AsDate := qry_previsao_custo_DT_LANCAMENTO.AsDateTime;
          qry_taxa_cambio_.Prepare;
          qry_taxa_cambio_.Open;
          qry_previsao_custo_VL_TAXA.AsFloat          := qry_taxa_cambio_TX_CAMBIO.AsFloat;
        end;
        qry_previsao_custo_.Post;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_previsao_custo.qry_previsao_custo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    cd_item := qry_previsao_custo_CD_ITEM.AsString;
    qry_previsao_custo_.Close;
    qry_previsao_custo_.Open;
    qry_previsao_custo_.Locate('CD_ITEM', cd_item, [loCaseInsensitive]);
  end;
  Btn_Mi(True, False, False, True );
end;

procedure Tfrm_previsao_custo.Cancelar;
begin
  try
    if datm_previsao_custo.qry_previsao_custo_.State in [dsInsert, dsEdit] then
      datm_previsao_custo.qry_previsao_custo_.Cancel;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi (True, False, False, True);
end;

function Tfrm_previsao_custo.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( datm_previsao_custo.qry_previsao_custo_.State in [dsEdit, dsInsert] )then
  begin
    if BoxMensagem('Recebimento foi alterado' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_previsao_custo.btn_CancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_previsao_custo.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.text := str_cd_unid_neg;
  msk_cd_unid_negExit(sender);
end;

procedure Tfrm_previsao_custo.dbedt_cd_itemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao_custo.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_previsao_custo.qry_previsao_custo_CD_ITEM;
  frm_item.lRecDesp := True;
  With frm_item Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_previsao_custo.qry_previsao_custo_.State in [dsEdit, dsInsert] ) then
       datm_previsao_custo.qry_previsao_custo_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_previsao_custo do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1515';
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_previsao_custo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

procedure Tfrm_previsao_custo.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_previsao_custo do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' +
         msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        msk_nr_processo.Text := '';
        BoxMensagem('Processo não cadastrado!', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end
      else
      begin
        with datm_previsao_custo do
        begin
          qry_previsao_custo_.Close;
          qry_previsao_custo_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
          qry_previsao_custo_.Prepare;
          qry_previsao_custo_.Open;
        end;
      end;
    end;
  end;
end;


procedure Tfrm_previsao_custo.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := '01';
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := frm_consulta_processo.Nr_Processo;
    msk_nr_processoExit(Sender);
  end;
end;

procedure Tfrm_previsao_custo.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este item será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_previsao_custo.qry_previsao_custo_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_previsao_custo.qry_previsao_custo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_previsao_custo.btn_atzClick(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem('Informe a Unidade de Negócio!', 2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if msk_nr_processo.Text = '' then
  begin
    BoxMensagem('Informe o Processo!', 2);
    msk_nr_processo.SetFocus;
    Exit;
  end;

  with datm_previsao_custo do
  begin
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_atz_prev_custo);
      sp_atz_prev_custo.ParamByName('@nr_processo').AsString :=
         msk_nr_processo.Text;
      ExecStoredProc(sp_atz_prev_custo);
      CloseStoredProc(sp_atz_prev_custo);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    qry_previsao_custo_.Close;
    qry_previsao_custo_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString ;
    qry_previsao_custo_.Prepare;
    qry_previsao_custo_.Open;

  end;
end;


procedure Tfrm_previsao_custo.btn_imprimeClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_prev_custo, datm_previsao_custo do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    {Verifiica se existe D.I.}
    qry_di_.Close;
    qry_di_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qry_di_.Prepare;
    qry_di_.Open;
    Formulas[0] := 'Processo = "'+ Trim( qry_processo_NR_PROCESSO.AsString ) + '"';
    if qry_di_.FieldByName('TOTAL').AsInteger > 0 then
    begin
      ReportName  := cDir_Rpt + '\CRGI006.RPT';
      ReportTitle := Caption;
      Formulas[1] := 'CodGrupo = "'+ Trim( IntToStr( rdgrpEmissao.ItemIndex + 1 ) ) + '"';
    end
    else
    begin
      ReportName  := cDir_Rpt + '\CRGI008.RPT';
    end;
    Execute;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_previsao_custo.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_nr_processo then btn_co_processoClick(nil);
    if Sender = dbedt_cd_item then btn_co_itemClick(nil);
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

end.
