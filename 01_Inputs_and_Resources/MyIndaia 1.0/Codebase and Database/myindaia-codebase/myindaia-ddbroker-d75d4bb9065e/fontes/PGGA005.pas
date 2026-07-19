unit PGGA005;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls, DBTABLES, Grids,
  DBGrids, DBCGrids, PGGP001, Funcoes;

type
  Tfrm_proc_inspec = class(TForm)
    menu_manut: TMainMenu;
    mi_sair: TMenuItem;
    pnl_entrada_de_dados: TPanel;
    pnl_manut_cadastro: TPanel;
    btn_sair: TSpeedButton;
    bvl_nm_usuario: TBevel;
    lbl_nm_usuario: TLabel;
    dbg_evento_aplicavel: TDBCtrlGrid;
    bvl_cabecalho_grid: TBevel;
    lbl_cd_evento: TLabel;
    lbl_Evento: TLabel;
    lbl_Aplicavel: TLabel;
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
    edt_nm_usuario: TEdit;
    dbedt_inspecao: TDBEdit;
    Label1: TLabel;
    dbckbx_cd_result_inspec: TDBCheckBox;
    Label2: TLabel;
    dbedt_rnc: TDBEdit;
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
    procedure dbedt_inspecaoDblClick(Sender: TObject);
    procedure Grava;
    procedure dbckbx_cd_result_inspecClick(Sender: TObject);
    procedure dbedt_inspecaoChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    st_modificar, st_excluir, st_incluir: Boolean;
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina, st_nr_processo, st_cd_cliente, st_cd_servico: String;
    { Private declarations }
  public
    cState : String[1];
    { Public declarations }
  end;

var
  frm_proc_inspec: Tfrm_proc_inspec;

implementation

uses GSMLIB,  PGSM039, PGGA006, PGSM018, PGSM010, PGGP015,
     PGGP017, PGSM136;

{$R *.DFM}

procedure Tfrm_proc_inspec.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_proc_inspec.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_nr_processo.setfocus;
end;

procedure Tfrm_proc_inspec.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_proc_inspec, datm_proc_inspec );
  st_cd_modulo:= vStr_cd_modulo;
  st_cd_rotina:= vStr_cd_modulo;


  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  edt_nm_usuario.Text:= str_nm_usuario;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  if str_nr_processo <> str_proc_zeros then
     msk_nr_processo.Text := str_nr_processo;
  datm_proc_inspec.ds_tfollowup.AutoEdit := st_modificar;
end;

procedure Tfrm_proc_inspec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grava;
  datm_proc_inspec.Free;
  Action:= cafree;
end;

procedure Tfrm_proc_inspec.btn_obsClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_observacoes_processo, frm_observacoes_processo);
  st_nr_processo := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
  st_cd_cliente  := dbedt_cd_cliente.Text;
  st_cd_servico  := dbedt_cd_servico.Text;

  frm_observacoes_processo.Configura('310', st_nr_processo, st_cd_cliente, st_cd_servico);
  frm_observacoes_processo.ShowModal;

end;

procedure Tfrm_proc_inspec.msk_nr_processoExit(Sender: TObject);
begin
  msk_nr_processo.Text             := UpperCase( msk_nr_processo.Text );
  btn_obs.Enabled                  := st_modificar;
  dbedt_inspecao.ReadOnly          := Not st_modificar;
  dbckbx_cd_result_inspec.ReadOnly := Not st_modificar;
  dbedt_rnc.ReadOnly               := Not st_modificar;
  with datm_proc_inspec do
  begin
    Grava;
    qry_processo_.Close;
    qry_tfollowup_.Close;
    qry_tevento_.Close;
    if Not processo_nulo( msk_nr_processo.Text ) then
    begin
        qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.RecordCount = 0 then
        begin
          BoxMensagem( 'Processo não encontrado!', 2 );
        end
        else
        begin
          {Habilita a tabela TFOLLOWUP}
          qry_tfollowup_.Prepare;
          qry_tfollowup_.ParamByName('nr_processo').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
          qry_tfollowup_.ParamByName('cd_servico').AsString  := dbedt_cd_servico.Text;
          qry_tfollowup_.Open;
          if qry_tfollowup_.RecordCount = 0 then
          begin
            dbedt_inspecao.ReadOnly:= True;
            dbckbx_cd_result_inspec.ReadOnly:= True
          end else
          begin
            dbedt_inspecao.ReadOnly:= False;
            dbckbx_cd_result_inspec.ReadOnly:= False;
          end;
        end;{if};
        if qry_processo_IN_LIBERADO.AsString <> '1' then
        begin
          BoxMensagem( 'Processo não esta liberado!', 2 );
          msk_nr_processo.SetFocus;
        end {if};
        if qry_processo_IN_CANCELADO.AsString <> '0' then
        begin
          BoxMensagem( 'Processo esta cancelado!', 2 );
          msk_nr_processo.SetFocus;
        end {if};
        if qry_processo_IN_PRODUCAO.AsString <> '1' then
        begin
          BoxMensagem( 'Processo não esta em produção!', 2 );
          msk_nr_processo.SetFocus;
        end {if};
      //end{if..else};
    end{if (Not Processo_Nulo)}
    else
    begin
      btn_obs.Enabled:= false;
    end;
  end {with};


end {procedure};


procedure Tfrm_proc_inspec.msk_cd_unid_negExit(Sender: TObject);
begin
  Grava;
  ValCodEdt(msk_cd_unid_neg);
  if Not (st_unid_neg = msk_cd_unid_neg.Text) then
  begin
    with datm_proc_inspec do
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

procedure Tfrm_proc_inspec.msk_cd_produtoExit(Sender: TObject);
begin
  Grava;
  ValCodEdt(msk_cd_produto);
  if Not (st_produto = msk_cd_produto.Text) then
  begin
    with datm_proc_inspec do
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

procedure Tfrm_proc_inspec.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_proc_inspec.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

function Tfrm_proc_inspec.Habilitacao : Boolean;
begin
  Habilitacao := true;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_proc_inspec do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não esta ativa!', 2);
      Habilitacao := false;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_proc_inspec.btn_cd_unid_negClick(Sender: TObject);
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
    frm_proc_inspec.msk_cd_unid_negExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;

end;

procedure Tfrm_proc_inspec.btn_cd_produtoClick(Sender: TObject);
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
    frm_proc_inspec.msk_cd_produtoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;

end;

procedure Tfrm_proc_inspec.btn_processoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy (frm_consulta_processo.Nr_Processo, 5, 14);
    msk_nr_processoExit (nil);
  end;
end;

procedure Tfrm_proc_inspec.dbedt_inspecaoDblClick(Sender: TObject);
begin
  if Not dbEdt_inspecao.ReadOnly then
  begin
    if datm_proc_inspec.qry_tfollowup_.state <> dsEdit then
       datm_proc_inspec.qry_tfollowup_.Edit;
    dbEdt_inspecao.Text:= DateToStr(date);
  end;
end;

procedure Tfrm_proc_inspec.Grava;
begin
  if datm_Proc_inspec.qry_tfollowup_.State = dsEdit then
     datm_Proc_inspec.qry_tfollowup_.Post;
end;

procedure Tfrm_proc_inspec.dbckbx_cd_result_inspecClick(Sender: TObject);
begin
  dbedt_rnc.Enabled := Not dbckbx_cd_result_inspec.checked;
end;

procedure Tfrm_proc_inspec.dbedt_inspecaoChange(Sender: TObject);
begin
  if dbedt_inspecao.Text = '  /  /    ' then
     if datm_proc_inspec.qry_tfollowup_.State = dsEdit then
        datm_proc_inspec.qry_tfollowup_DT_INSPECAO.AsVariant := Null;
end;

procedure Tfrm_proc_inspec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_proc_inspec.msk_cd_unid_negKeyDown(Sender: TObject;
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

end.


