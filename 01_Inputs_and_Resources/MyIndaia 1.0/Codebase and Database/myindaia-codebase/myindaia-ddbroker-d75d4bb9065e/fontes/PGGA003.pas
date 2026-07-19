(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGGA003.PAS - Realização por Processo
AUTOR: Leandro Stipanich
DATA: dd/mm/yyyy
Manutenção: Leandro Stipanich
Data: 26/10/2001
*************************************************************************************************)
unit PGGA003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls, DBTABLES, Grids,
  DBGrids, DBCGrids, PGGP001, ppComm, ppRptExp, Funcoes;

type
  Tfrm_proc_realiza = class(TForm)
    menu_manut: TMainMenu;
    mi_sair: TMenuItem;
    pnl_entrada_de_dados: TPanel;
    pnl_manut_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbg_evento_aplicavel: TDBCtrlGrid;
    bvl_cabecalho_grid: TBevel;
    DBText1: TDBText;
    DBText2: TDBText;
    btn_obs: TButton;
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    lbl_nr_processo: TLabel;
    btn_processo: TSpeedButton;
    Label3: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    lbl_cd_servico: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    dbedt_realiza: TDBEdit;
    dbchk_aplic: TDBCheckBox;
    DBText3: TDBText;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    DBText4: TDBText;
    lbl_proc_evento: TLabel;
    msk_evento: TMaskEdit;
    btn_proc_vinc: TSpeedButton;
    mi_proc_vinc: TMenuItem;
    bvl_nm_usuario: TBevel;
    lbl_nm_usuario: TLabel;
    lbl_canal: TLabel;
    edt_nm_usuario: TEdit;
    dblkpcbox_canal: TDBLookupComboBox;
    lbl_Evento: TLabel;
    Label1: TLabel;
    lbl_aplic: TLabel;
    lbl_Aplicavel: TLabel;
    lbl_cd_evento: TLabel;
    Label4: TLabel;
    DBText5: TDBText;
    chkProcessos: TCheckBox;
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_obsClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    function habilitacao : Boolean;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure dbedt_realizaDblClick(Sender: TObject);
    procedure Grava;
    procedure dbedt_realizaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_realizaExit(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure dblkpcbox_canalExit(Sender: TObject);
    procedure dbedt_realizaEnter(Sender: TObject);
    procedure msk_eventoExit(Sender: TObject);
    procedure msk_eventoChange(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure btn_proc_vincClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    st_modificar, st_excluir, st_incluir : Boolean;
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina: String;
    nr_proc : String;
    { Private declarations }
  public
    cState : String[1];
    pesq_nr_proc, pesq_cd_unid_neg, pesq_cd_prod : String;
    procedure PesquisaProc;
    { Public declarations }
  end;

var
  frm_proc_realiza: Tfrm_proc_realiza;

implementation

uses GSMLIB, PGSM039, PGGA004, PGSM018, PGSM010, PGGP015, PGGP017, PGGP018,
     PGSM156, PGSM136, PGGA027, ConsOnlineEx;

{$R *.DFM}

procedure Tfrm_proc_realiza.btn_sairClick(Sender: TObject);
begin
  Close;
  str_cd_rotina_atalho := '';
  str_nr_processo := '';
end;

procedure Tfrm_proc_realiza.FormShow(Sender: TObject);
begin
  pnl_manut_cadastro.Color := clMenuBroker;
  if pesq_cd_unid_neg <> '' then
    msk_cd_unid_neg.Text := pesq_cd_unid_neg
  else
    msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  if pesq_cd_prod <> '' then
    msk_cd_produto.Text := pesq_cd_prod
  else
    msk_cd_produto.Text := str_cd_produto;
  msk_cd_produtoExit(nil);


  // Desabilitado e colocado no evento OnActivate, por causa
  //  da rotina de aviso de comunicado importante -> 16/12/2003
  (*
  if pesq_nr_proc <> '' then
  begin
    msk_nr_processo.Text := Copy( pesq_nr_proc, 5, 18 );
    msk_nr_processoExit(nil);

    if datm_proc_realiza.qry_tfollowup_.Active then
      dbg_evento_aplicavel.SetFocus;
  end
  else
    msk_nr_processo.SetFocus; *)
end;

procedure Tfrm_proc_realiza.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_proc_realiza, datm_proc_realiza );
  st_cd_modulo:= vStr_cd_modulo;
  st_cd_rotina:= vStr_cd_modulo;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  edt_nm_usuario.Text  := str_nm_usuario;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  if str_nr_processo <> str_proc_zeros then
     msk_nr_processo.Text := str_nr_processo;
  datm_proc_realiza.ds_tfollowup.AutoEdit := st_modificar;
end;

procedure Tfrm_proc_realiza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grava;
  datm_proc_realiza.qry_flp_pesq_ev_.Close;
  datm_proc_realiza.qry_tfollowup_.Close;
  datm_proc_realiza.Free;
  Action := caFree;
end;

procedure Tfrm_proc_realiza.btn_obsClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_follow_obs, frm_follow_obs);
  frm_follow_obs.lbl_proc.Caption := msk_nr_processo.Text;
  frm_follow_obs.lbl_evento.Caption := datm_proc_realiza.qry_tfollowup_Look_Evento.AsString;

  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT CD_EV_DIG_DI FROM TPARAMETROS WHERE ( CD_EV_DIG_DI = "'+ datm_proc_realiza.qry_tfollowup_CD_EVENTO.AsString +'" )');
    Prepare;
    Open;
    if recordcount > 0 then
    begin
      frm_follow_obs.dbchk_importante.Visible := True;

      datm_proc_realiza.qry_processo_aux_.Close;
      datm_proc_realiza.qry_processo_aux_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                                                 Trim( msk_cd_produto.Text  ) +
                                                                                 Trim( msk_nr_processo.Text ) ;
      datm_proc_realiza.qry_processo_aux_.Prepare;
      datm_proc_realiza.qry_processo_aux_.Open;
    end;
    Free;
  end;

  frm_follow_obs.ShowModal;
end;

procedure Tfrm_proc_realiza.msk_nr_processoExit(Sender: TObject);
var
  vNrEvento   : String[3];
  vNRProcesso : String[18];
begin
  if msk_nr_processo.Text = nr_proc then Exit;
  msk_nr_processo.Text   := UpperCase( msk_nr_processo.Text );
  btn_obs.Enabled        := st_modificar;
  dbedt_realiza.ReadOnly := Not st_modificar;
  with datm_proc_realiza do
  begin
    Grava;
    qry_processo_.Close;
    qry_tfollowup_.Close;
    qry_tevento_.Close;
    if Not processo_nulo( msk_nr_processo.Text ) then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;

      if qry_processo_.RecordCount = 0 then
      begin
        mi_manut_proc.Enabled  := False;
        btn_manut_proc.Enabled := False;
        mi_proc_vinc.Enabled   := False;
        btn_proc_vinc.Enabled  := False;
        BoxMensagem( 'Processo não encontrado!', 2 );
      end
      else
      begin
        // Habilita a tabela TFOLLOWUP
        mi_manut_proc.Enabled  := True;
        btn_manut_proc.Enabled := True;
        mi_proc_vinc.Enabled   := ( not( qry_processo_NR_PROCESSO_VINC.IsNull ) and ( qry_processo_NR_PROCESSO_VINC.asString <> '' ) );
        btn_proc_vinc.Enabled  := ( not( qry_processo_NR_PROCESSO_VINC.IsNull ) and ( qry_processo_NR_PROCESSO_VINC.asString <> '' ) );
                qry_tfollowup_.Close;
        qry_tfollowup_.ParamByName('nr_processo').AsString :=
                       msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_tfollowup_.ParamByName('cd_servico').AsString  := dbedt_cd_servico.Text;
        qry_tfollowup_.Prepare;
        qry_tfollowup_.Open;
        if qry_tfollowup_.RecordCount = 0 then
           dbedt_realiza.ReadOnly := True
        else
           dbedt_realiza.ReadOnly := False;
      end;

      if qry_processo_IN_LIBERADO.AsString <> '1' then
      begin
        BoxMensagem( 'Processo não esta liberado!', 2 );
        msk_nr_processo.SetFocus;
        Exit;
      end;
      if qry_processo_IN_CANCELADO.AsString <> '0' then
      begin
        BoxMensagem( 'Processo está cancelado!', 2 );
        msk_nr_processo.SetFocus;
        Exit;
      end;
      if qry_processo_IN_PRODUCAO.AsString <> '1' then
      begin
        BoxMensagem( 'Processo não esta em produção!', 2 );
        msk_nr_processo.SetFocus;
        Exit;
      end;

      if qry_processo_IN_IMPORTANTE.AsString = '1'  then
      begin
        BoxMensagem('Há informações importantes. Verifique!',3);

        with TQuery.Create(Application) do
        begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Add('SELECT CD_EV_DIG_DI FROM TPARAMETROS');
          Prepare;
          Open;
          vNrEvento := FieldByName('CD_EV_DIG_DI').AssTring;
          Free;
        end;

        vNrProcesso := qry_processo_NR_PROCESSO.AsString;

        qry_tfollowup_.Close;
        qry_tfollowup_.ParamByName('nr_processo').AsString :=
                       msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_tfollowup_.ParamByName('cd_servico').AsString  := dbedt_cd_servico.Text;
        qry_tfollowup_.Prepare;
        qry_tfollowup_.Open;
        qry_tfollowup_.Locate( 'NR_PROCESSO; CD_EVENTO',
                            VarArrayOf([ vNrProcesso, vNrEvento ] ), [] );

        btn_obsClick(nil);
      end;
    end
    else
    begin
      mi_manut_proc.Enabled  := False;
      btn_manut_proc.Enabled := False;
      mi_proc_vinc.Enabled   := False;
      btn_proc_vinc.Enabled  := False;
      btn_obs.Enabled        := False;
    end;
  end;
end;

procedure Tfrm_proc_realiza.msk_cd_unid_negExit(Sender: TObject);
begin
  Grava;
  ValCodEdt( msk_cd_unid_neg );
  if Not ( st_unid_neg = msk_cd_unid_neg.Text ) then
  begin
    with datm_proc_realiza do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;
        qry_unid_neg_.Close;
      end
      else
      begin
        edt_nm_unid_neg.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
      end;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
  end
end;

procedure Tfrm_proc_realiza.msk_cd_produtoExit(Sender: TObject);
begin
  Grava;
  ValCodEdt(msk_cd_produto);
  if Not ( st_produto = msk_cd_produto.Text ) then
  begin
    with datm_proc_realiza do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
        qry_produto_.Close;
      end
      else
      begin
        edt_nm_produto.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        msk_cd_produto.SetFocus;
        qry_produto_.Close;
      end;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_proc_realiza.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_proc_realiza.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

function Tfrm_proc_realiza.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_proc_realiza do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.UnPrepare;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem( 'A habilitação não esta ativa!', 2 );
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_proc_realiza.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_unidade.Cons_OnLine_Texto := msk_cd_unid_neg.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    frm_proc_realiza.msk_cd_unid_negExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_proc_realiza.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    frm_proc_realiza.msk_cd_produtoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_proc_realiza.btn_processoClick(Sender: TObject);
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
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;

  msk_nr_processoExit(nil);

(*  Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit (nil);
  end;*)
end;

procedure Tfrm_proc_realiza.dbedt_realizaDblClick(Sender: TObject);
begin
  if ( Not dbEdt_realiza.ReadOnly ) and ( datm_proc_realiza.qry_tfollowup_IN_BLOQUEADO.AsString = '0' ) then
  begin
    if Not ( datm_proc_realiza.qry_tfollowup_.State in [dsEdit, dsInsert] ) then
       datm_proc_realiza.qry_tfollowup_.Edit;
    dbedt_realiza.Text := DateToStr(date);
    Grava;
  end;
end;

procedure Tfrm_proc_realiza.Grava;
begin
  with datm_proc_realiza do
  begin
    if qry_tfollowup_.State in [dsEdit]  then qry_tfollowup_.Post;
    if qry_proc_edita_.State in [dsEdit] then qry_proc_edita_.Post;
  end;
end;

procedure Tfrm_proc_realiza.dbedt_realizaChange(Sender: TObject);
begin
  if dbedt_realiza.Text = '  /  /    ' then
     if datm_proc_realiza.qry_tfollowup_.State = dsEdit then
        datm_proc_realiza.qry_tfollowup_DT_REALIZACAO.AsVariant := Null;
end;

procedure Tfrm_proc_realiza.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    str_cd_rotina_atalho := '';
    str_nr_processo := '';
    Close;
  end
end;

procedure Tfrm_proc_realiza.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_nr_processo then btn_processoClick(nil);
  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    try
      if frm_pesq_proc.Tag < 1 then
      begin
        PesquisaProc;
      end;
    except
      PesquisaProc;
    end;
  end;
end;

procedure Tfrm_proc_realiza.dbedt_realizaExit(Sender: TObject);
begin
  Grava;
end;

procedure Tfrm_proc_realiza.btn_manut_procClick(Sender: TObject);
begin
  Grava;
  str_cd_rotina_atalho := '0102';
  nr_processo_gestao   := datm_proc_realiza.qry_processo_NR_PROCESSO.AsString;

  Close;
end;

procedure Tfrm_proc_realiza.dblkpcbox_canalExit(Sender: TObject);
begin
  if datm_proc_realiza.qry_proc_edita_.State in [dsEdit] then datm_proc_realiza.qry_proc_edita_.Post;
end;

procedure Tfrm_proc_realiza.dbedt_realizaEnter(Sender: TObject);
begin
  if datm_proc_realiza.qry_tfollowup_IN_BLOQUEADO.AsString = '1' then
  begin
    BoxMensagem( 'Evento Bloqueado', 2 );
    frm_proc_realiza.dbedt_realiza.Enabled := False;
    msk_nr_processo.SetFocus;
  end;
end;

procedure Tfrm_proc_realiza.msk_eventoExit(Sender: TObject);
begin
//  if datm_proc_realiza.qry_tfollowup_.Active then dbg_evento_aplicavel.SetFocus;
end;

procedure Tfrm_proc_realiza.msk_eventoChange(Sender: TObject);
begin
  with datm_proc_realiza do
  begin
    Localiza( qry_flp_pesq_ev_, msk_evento.Text, 'NM_EVENTO' );
    Localiza( qry_tfollowup_,   qry_flp_pesq_ev_CD_EVENTO.AsString, 'CD_EVENTO' );
    if qry_tfollowup_DT_REALIZACAO.IsNull Then
      dbedt_realiza.Text := '';
  end;
end;

procedure Tfrm_proc_realiza.msk_nr_processoEnter(Sender: TObject);
begin
  nr_proc := msk_nr_processo.Text;
end;

procedure Tfrm_proc_realiza.btn_proc_vincClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_proc_vinc_realiza, frm_proc_vinc_realiza);

  with frm_proc_vinc_realiza, datm_proc_realiza do
  begin
    str_processo := qry_processo_NR_PROCESSO.asString;
    str_servico  := qry_processo_CD_SERVICO.asString;

    ShowModal;
  end;
end;

procedure Tfrm_proc_realiza.PesquisaProc;
begin
  Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
  frm_pesq_proc.Tag := 2;
  frm_pesq_proc.ShowModal;

  if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
  begin
    msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
    msk_cd_produtoExit(nil);
    msk_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_proc_realiza.FormActivate(Sender: TObject);
begin
  if Trim( pesq_nr_proc ) <> '' then
  begin
    msk_nr_processo.Text := Copy( pesq_nr_proc, 5, 18 );
    msk_nr_processoExit(nil);

    if datm_proc_realiza.qry_tfollowup_.Active then
      dbg_evento_aplicavel.SetFocus;
  end
  else
  begin
    msk_nr_processo.SetFocus;
  end;

end;

end.
