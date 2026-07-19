unit PGNM009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, PGGP001;

type
  Tfrm_receb_nao_solic = class(TForm)
    Button1: TButton;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_novo_recebimento: TSpeedButton;
    btn_imprimir_recebimento: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_novo: TMenuItem;
    mi_imprimir: TMenuItem;
    mi_saida: TMenuItem;
    Bevel2: TBevel;
    lbl_cd_unid_neg: TLabel;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    Label1: TLabel;
    mskedt_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    SpeedButton1: TSpeedButton;
    lbl_nr_processo: TLabel;
    mskedt_nr_processo: TMaskEdit;
    SpeedButton2: TSpeedButton;
    lbl_cd_cliente: TLabel;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    lbl_cd_servico: TLabel;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    Bevel1: TBevel;
    procedure btn_sairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskedt_cd_clienteExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure mskedt_cd_produtoExit(Sender: TObject);
    procedure btn_novo_recebimentoClick(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    i_seletor : Integer;
    i_Height : Integer;
    i_Width : Integer;
    i_dif_Height : Integer;
    i_dif_Width : Integer;
    cState : String[1];
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    nr_solicitacao : string[3];
    lOperacaoCancelada : Boolean;    
    procedure AbreTabelas;
    procedure FechaTabelas;
    { Public declarations }
  end;

var
  frm_receb_nao_solic: Tfrm_receb_nao_solic;

implementation

uses gsmlib, PGNM019, PGGP017, PGNM010, PGNM012, PGSM018, PGSM010, PGNM018,
  PGGP015;

{$R *.DFM}

type
  EOperacaoCancelada = class(Exception);

procedure Tfrm_receb_nao_solic.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_receb_nao_solic.AbreTabelas;
begin
  datm_receb_num_nao_solic.tbl_banco_.Active              := true;
  datm_receb_num_nao_solic.tbl_unid_neg_produto_.active  := true;
  datm_receb_num_nao_solic.tbl_unid_neg_.active          := true;
  datm_receb_num_nao_solic.tbl_produto_.active           := true;
  datm_receb_num_nao_solic.tbl_empresa_.active            := true;
  datm_receb_num_nao_solic.tbl_servico_.active            := true;
  datm_receb_num_nao_solic.tbl_processo_w_.active        := true;
  datm_receb_num_nao_solic.qry_item_cd.active             := true;
  datm_receb_num_nao_solic.qry_item_nm.active             := true;
  datm_receb_num_nao_solic.tbl_recebimento_.active       := true;
end;

procedure Tfrm_receb_nao_solic.FechaTabelas;
begin
  datm_receb_num_nao_solic.tbl_unid_neg_produto_.active  := false;
  datm_receb_num_nao_solic.tbl_banco_.Active              := false;
  datm_receb_num_nao_solic.tbl_unid_neg_.active          := false;
  datm_receb_num_nao_solic.tbl_produto_.active           := false;
  datm_receb_num_nao_solic.tbl_empresa_.active            := false;
  datm_receb_num_nao_solic.tbl_servico_.active            := false;
  datm_receb_num_nao_solic.qry_item_cd.active             := false;
  datm_receb_num_nao_solic.qry_item_nm.active             := false;
  datm_receb_num_nao_solic.tbl_processo_w_.active        := false;
  datm_receb_num_nao_solic.tbl_recebimento_.active       := false;
end;                                         

procedure Tfrm_receb_nao_solic.FormResize(Sender: TObject);
begin
  i_dif_Height := Height - i_Height;
  i_dif_Width := Width - i_Width;
  pnl_cadastro.Width := pnl_cadastro.Width + i_dif_Width;
  { salva as dimensoes atuais }
  i_Height := Height;
  i_Width := Width;
end;

procedure Tfrm_receb_nao_solic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  FechaTabelas;

  datm_receb_num_nao_solic.destroy;

  Action := caFree;
end;

procedure Tfrm_receb_nao_solic.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine = True Then
  begin
     Close;
  end;
end;

procedure Tfrm_receb_nao_solic.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 27 then Close;
{  If (Key = 13) and (edt_cd_servico.text<>'') then
  begin
  end; }
end;

procedure Tfrm_receb_nao_solic.FormCreate(Sender: TObject);
begin
  { salva as dimensoes atuais }
  i_Height := Height;
  i_Width := Width;

  { Cria o DataModule de Dados de Recebimento de Numerario NÃO Solicitado }
  Application.CreateForm(Tdatm_receb_num_nao_solic, datm_receb_num_nao_solic );

end;

procedure Tfrm_receb_nao_solic.FormShow(Sender: TObject);
begin


  AbreTabelas;

  mskedt_cd_unid_neg.text := str_cd_unid_neg;
  mskedt_cd_produto.text := str_cd_produto;

  if datm_receb_num_nao_solic.tbl_unid_neg_.findkey([ mskedt_cd_unid_neg.text ]) then
     edt_nm_unid_neg.Text := datm_receb_num_nao_solic.tbl_unid_neg_AP_UNID_NEG.AsString;
  
  if datm_receb_num_nao_solic.tbl_produto_.findkey([ mskedt_cd_produto.text ]) then
     edt_nm_produto.Text := datm_receb_num_nao_solic.tbl_produto_NM_PRODUTO.AsString;

  mskedt_nr_processo.setfocus;
  
end;

procedure Tfrm_receb_nao_solic.mskedt_cd_clienteExit(Sender: TObject);
begin

  if mskedt_cd_unid_neg.text = '' then
  begin
    MessageDlg('Forneça o código da Unidade de Negócio.', mtError, [mbOk], 0);
    mskedt_cd_unid_neg.setfocus;
    Exit
  end;

  if mskedt_cd_produto.text = '' then
  begin
    MessageDlg('Forneça o código do Produto.', mtError, [mbOk], 0);
    mskedt_cd_produto.setfocus;
    Exit
  end;

end;

procedure Tfrm_receb_nao_solic.Button1Click(Sender: TObject);
begin
  Application.CreateForm( Tfrm_s_ref, frm_s_ref );
  frm_s_ref.showmodal;
end;

procedure Tfrm_receb_nao_solic.mskedt_cd_unid_negExit(Sender: TObject);
begin
  if datm_receb_num_nao_solic.tbl_unid_neg_.findkey([ mskedt_cd_unid_neg.text ]) then
     edt_nm_unid_neg.Text := datm_receb_num_nao_solic.tbl_unid_neg_AP_UNID_NEG.AsString
  else
     edt_nm_unid_neg.clear;
end;

procedure Tfrm_receb_nao_solic.mskedt_cd_produtoExit(Sender: TObject);
begin
  if datm_receb_num_nao_solic.tbl_produto_.findkey([ mskedt_cd_produto.text ]) then
     edt_nm_produto.Text := datm_receb_num_nao_solic.tbl_produto_NM_PRODUTO.AsString
  else
     edt_nm_produto.clear;
end;

procedure Tfrm_receb_nao_solic.btn_novo_recebimentoClick(
  Sender: TObject);
begin
  try
    datm_main.db_proc.StartTransaction;
    if not (datm_receb_num_nao_solic.tbl_processo_w_.State in [dsEdit,dsInsert]) then
       datm_receb_num_nao_solic.tbl_processo_w_.Edit;
    datm_receb_num_nao_solic.tbl_processo_w_QT_SOLINUM.AsInteger       := datm_receb_num_nao_solic.tbl_processo_w_QT_SOLINUM.AsInteger + 1 ;
    datm_receb_num_nao_solic.tbl_processo_w_QT_RECEBIMENTO.AsInteger   := datm_receb_num_nao_solic.tbl_processo_w_QT_RECEBIMENTO.AsInteger + 1 ;
    nr_solicitacao := StrZero( datm_receb_num_nao_solic.tbl_processo_w_QT_SOLINUM.AsFloat, 3  );
    datm_receb_num_nao_solic.tbl_recebimento_.Append;
    datm_receb_num_nao_solic.tbl_recebimento_NR_PROCESSO.AsString      := datm_receb_num_nao_solic.tbl_processo_w_NR_PROCESSO.AsString;
    datm_receb_num_nao_solic.tbl_recebimento_NR_RECEBIMENTO.AsString   := StrZero( datm_receb_num_nao_solic.tbl_processo_w_QT_RECEBIMENTO.AsFloat,3 );
    datm_receb_num_nao_solic.tbl_recebimento_DT_RECEBIMENTO.AsDateTime := date;
    datm_receb_num_nao_solic.tbl_recebimento_CD_CLIENTE.AsString       := edt_cd_cliente.Text;
    datm_receb_num_nao_solic.tbl_recebimento_CD_USUARIO.AsString       := str_cd_usuario;
    datm_receb_num_nao_solic.tbl_recebimento_IN_CANCELADO.AsBoolean    := False;
    Application.CreateForm( Tfrm_receb_nao_solic_lanc, frm_receb_nao_solic_lanc );
    frm_receb_nao_solic_lanc.nr_solicitacao := nr_solicitacao;
    frm_receb_nao_solic_lanc.ShowModal;
    If Not (lOperacaoCancelada) Then
      datm_main.db_proc.Commit
    Else
      raise EOperacaoCancelada.Create('Transação foi cancelada.');
  except
    datm_main.db_proc.Rollback;
    lOperacaoCancelada := False;
    datm_receb_num_nao_solic.tbl_processo_w_.Cancel;
    datm_receb_num_nao_solic.tbl_processo_w_.Refresh;
    datm_receb_num_nao_solic.tbl_processo_w_.FindKey([mskedt_cd_unid_neg.text+mskedt_cd_produto.text+mskedt_nr_processo.text])
  end
end;

procedure Tfrm_receb_nao_solic.mskedt_nr_processoExit(Sender: TObject);
begin

  if processo_nulo( mskedt_nr_processo.text ) then
  begin
    Exit
  end;

  if Not IsNumeric( mskedt_nr_processo.text ) then
  begin
    Exit
  end;
  
  if mskedt_cd_unid_neg.text = '' then
  begin
    MessageDlg('Forneça o código da Unidade de Negócio.', mtError, [mbOk], 0);
    mskedt_cd_unid_neg.setfocus;
    Exit
  end;

  if mskedt_cd_produto.text = '' then
  begin
    MessageDlg('Forneça o código do Produto.', mtError, [mbOk], 0);
    mskedt_cd_produto.setfocus;
    Exit
  end;
  
  If ( copy( mskedt_nr_processo.text, 7, 1 ) <>
       Gera_Digito_De_Verificacao( mskedt_cd_unid_neg.Text,
                                   mskedt_cd_produto.Text,
                             copy( mskedt_nr_processo.text, 1, 6 ) ) ) then
  begin
    btn_novo_recebimento.Enabled := False;
    btn_imprimir_recebimento.Enabled := False;
    MessageDlg('Digito inválido.', mtError, [mbOk], 0);
    mskedt_nr_processo.setfocus;
    Exit
  end;
  
  If mskedt_nr_processo.text <> '' then
  begin
    If datm_receb_num_nao_solic.tbl_processo_w_.FindKey([mskedt_cd_unid_neg.text+
                                     mskedt_cd_produto.text+
                                     mskedt_nr_processo.text]) = false then
    begin
      btn_novo_recebimento.Enabled := False;
      btn_imprimir_recebimento.Enabled := False;
      MessageDlg('Processo não encontrado. digite novamente.', mtError, [mbOk], 0);
      mskedt_nr_processo.setfocus;
      Exit
    end;
    edt_cd_cliente.text := datm_receb_num_nao_solic.tbl_processo_w_CD_CLIENTE.AsString;
    if datm_receb_num_nao_solic.tbl_empresa_.FindKey([datm_receb_num_nao_solic.tbl_processo_w_CD_CLIENTE.AsString]) then
       edt_nm_cliente.text := datm_receb_num_nao_solic.tbl_empresa_NM_EMPRESA.AsString;
    edt_cd_servico.text := datm_receb_num_nao_solic.tbl_processo_w_CD_SERVICO.AsString;
    if datm_receb_num_nao_solic.tbl_servico_.FindKey([datm_receb_num_nao_solic.tbl_processo_w_CD_SERVICO.AsString]) then
       edt_nm_servico.text := datm_receb_num_nao_solic.tbl_servico_NM_SERVICO.AsString;
    str_nr_processo := datm_receb_num_nao_solic.tbl_processo_w_NR_PROCESSO.AsString;
    btn_novo_recebimento.Enabled := True;
    btn_imprimir_recebimento.Enabled := True;
  end;

end;

procedure Tfrm_receb_nao_solic.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);

  With frm_unidade Do
  Begin
  Caption := Caption + ' [Consulta On-Line]';
  lCons_OnLine := True;
  ShowModal;
  lCons_OnLine := False;
  end;
  frm_unidade.Cons_OnLine_Texto := mskedt_cd_unid_neg.Text;  
  mskedt_cd_unid_negExit(Sender);
end;

procedure Tfrm_receb_nao_solic.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.mskedt_Cons_OnLine := mskedt_cd_produto;
  With frm_produto Do
  Begin
  Caption := Caption + ' [Consulta On-Line]';
  lCons_OnLine := True;
  ShowModal;
  lCons_OnLine := False;
  end;
  mskedt_cd_produtoExit(Sender);
end;

procedure Tfrm_receb_nao_solic.SpeedButton2Click(Sender: TObject);
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
      mskedt_cd_unid_neg.Text := copy (frm_consulta_processo.Nr_Processo,1,2);
      mskedt_cd_unid_negExit (Sender);
      mskedt_nr_processo.Text := copy (frm_consulta_processo.Nr_Processo,5,7);
      mskedt_nr_processoExit (Sender);
    end;
end;


end.
