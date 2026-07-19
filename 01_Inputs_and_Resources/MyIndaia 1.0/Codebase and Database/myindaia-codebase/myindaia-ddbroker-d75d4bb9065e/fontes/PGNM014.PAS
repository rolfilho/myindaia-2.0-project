unit PGNM014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, PGGP001;

type
  Tfrm_devolucao = class(TForm)
    pnl_cadastro: TPanel;
    btn_nova: TSpeedButton;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_nova_solinum: TMenuItem;
    lbl_nr_processo: TLabel;
    mskedt_nr_processo: TMaskEdit;
    SpeedButton2: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    lbl_cd_cliente: TLabel;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    lbl_cd_servico: TLabel;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    btn_cancelar: TSpeedButton;
    mi_saida: TMenuItem;
    Label1: TLabel;
    mi_excluir_solinum: TMenuItem;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    mskedt_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    SpeedButton1: TSpeedButton;
    btn_abrir: TSpeedButton;
    Itens1: TMenuItem;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    sp_cancela_devolucao_: TStoredProc;
    procedure btn_sairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure mskedt_cd_produtoExit(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_novaClick(Sender: TObject);
    procedure btn_abrirClick(Sender: TObject);
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
    nr_devolucao : string[3];
    lOperacaoCancelada : Boolean;
    procedure AbreTabelas;
    procedure FechaTabelas;
    { Public declarations }
  end;

var
  frm_devolucao: Tfrm_devolucao;

implementation

uses gsmlib, PGNM020, PGNM015, PGSM018, PGSM010, PGGP015, PGGP017;

{$R *.DFM}


type
  EOperacaoCancelada = class(Exception);

procedure Tfrm_devolucao.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_devolucao.AbreTabelas;
begin
  datm_devolucao.tbl_unid_neg_produto_.active  := true;
  datm_devolucao.tbl_unid_neg_.active          := true;
  datm_devolucao.tbl_produto_.active           := true;
  datm_devolucao.tbl_empresa_.active            := true;
  datm_devolucao.tbl_servico_.active            := true;
  datm_devolucao.tbl_processo_w_.active        := true;
  datm_devolucao.qry_item_cd.active             := true;
  datm_devolucao.qry_item_nm.active             := true;
end;

procedure Tfrm_devolucao.FechaTabelas;
begin
  datm_devolucao.tbl_unid_neg_produto_.active  := false;
  datm_devolucao.tbl_unid_neg_.active          := false;
  datm_devolucao.tbl_produto_.active           := false;
  datm_devolucao.tbl_empresa_.active            := false;
  datm_devolucao.tbl_servico_.active            := false;
  datm_devolucao.qry_item_cd.active             := false;
  datm_devolucao.qry_item_nm.active             := false;
  datm_devolucao.tbl_processo_w_.active        := false;
end;

procedure Tfrm_devolucao.FormResize(Sender: TObject);
begin
  i_dif_Height := Height - i_Height;
  i_dif_Width := Width - i_Width;
  pnl_cadastro.Width := pnl_cadastro.Width + i_dif_Width;
  { salva as dimensoes atuais }
  i_Height := Height;
  i_Width := Width;
end;

procedure Tfrm_devolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FechaTabelas;
  datm_devolucao.Destroy;
  Action := caFree;
end;

procedure Tfrm_devolucao.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine = True Then
  begin
     Close;
  end;
end;

procedure Tfrm_devolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 27 then Close;
{  If (Key = 13) and (edt_cd_servico.text<>'') then
  begin
  end; }
end;

procedure Tfrm_devolucao.FormCreate(Sender: TObject);
begin
  { salva as dimensoes atuais }
  i_Height := Height;
  i_Width := Width;

  { Cria o DataModule de Dados de Recebimento de Numerario }
  Application.CreateForm(Tdatm_devolucao, datm_devolucao );

  AbreTabelas;

  If str_nr_processo <> str_proc_zeros Then
     mskedt_nr_processo.Text := Copy( str_nr_processo, 5, 7 );

end;

procedure Tfrm_devolucao.mskedt_nr_processoExit(Sender: TObject);
begin

  edt_cd_cliente.text := '';
  edt_nm_cliente.text := '';
  
  edt_cd_servico.text := '';
  edt_nm_servico.text := '';
                            
  datm_devolucao.qry_devolucao_.close;

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
    MessageDlg('Digito inválido.', mtError, [mbOk], 0);
    mskedt_nr_processo.setfocus;
    Exit
  end;
  
  If mskedt_nr_processo.text <> '' then
  begin
  
    If datm_devolucao.tbl_processo_w_.FindKey([mskedt_cd_unid_neg.text+
                                     mskedt_cd_produto.text+
                                     mskedt_nr_processo.text]) = false then
    begin
      btn_abrir.Enabled := False;
      btn_nova.Enabled := False;
      btn_cancelar.Enabled := False;
      MessageDlg('Processo não encontrado. digite novamente.', mtError, [mbOk], 0);
      mskedt_nr_processo.setfocus;
      Exit
    end;

    btn_abrir.Enabled := True;
    btn_nova.Enabled := True;
    btn_cancelar.Enabled := True;

    edt_cd_cliente.text := datm_devolucao.tbl_processo_w_CD_CLIENTE.AsString;
    edt_cd_servico.text := datm_devolucao.tbl_processo_w_CD_SERVICO.AsString;

    if datm_devolucao.tbl_empresa_.FindKey([datm_devolucao.tbl_processo_w_CD_CLIENTE.AsString]) then
       edt_nm_cliente.text := datm_devolucao.tbl_empresa_NM_EMPRESA.AsString;
    edt_cd_servico.text := datm_devolucao.tbl_processo_w_CD_SERVICO.AsString;

    if datm_devolucao.tbl_servico_.FindKey([datm_devolucao.tbl_processo_w_CD_SERVICO.AsString]) then
       edt_nm_servico.text := datm_devolucao.tbl_servico_NM_SERVICO.AsString;

    str_nr_processo := datm_devolucao.tbl_processo_w_NR_PROCESSO.AsString;
    
    datm_devolucao.qry_devolucao_.close;
    datm_devolucao.qry_devolucao_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_devolucao.qry_devolucao_.Open;

  end;

end;

procedure Tfrm_devolucao.FormShow(Sender: TObject);
begin

  AbreTabelas;

  mskedt_cd_unid_neg.text := str_cd_unid_neg;
  mskedt_cd_produto.text := str_cd_produto;

  if datm_devolucao.tbl_unid_neg_.findkey([ mskedt_cd_unid_neg.text ]) then
     edt_nm_unid_neg.Text := datm_devolucao.tbl_unid_neg_AP_UNID_NEG.AsString;
  
  if datm_devolucao.tbl_produto_.findkey([ mskedt_cd_produto.text ]) then
     edt_nm_produto.Text := datm_devolucao.tbl_produto_NM_PRODUTO.AsString;
  
  mskedt_nr_processo.setfocus;

end;

procedure Tfrm_devolucao.mskedt_cd_unid_negExit(Sender: TObject);
begin
  if datm_devolucao.tbl_unid_neg_.findkey([ mskedt_cd_unid_neg.text ]) then
     edt_nm_unid_neg.Text := datm_devolucao.tbl_unid_neg_AP_UNID_NEG.AsString
  else
     edt_nm_unid_neg.clear;
end;

procedure Tfrm_devolucao.mskedt_cd_produtoExit(Sender: TObject);
begin
  if datm_devolucao.tbl_produto_.findkey([ mskedt_cd_produto.text ]) then
     edt_nm_produto.Text := datm_devolucao.tbl_produto_NM_PRODUTO.AsString
  else
     edt_nm_produto.clear;
end;

procedure Tfrm_devolucao.btn_cancelarClick(Sender: TObject);
begin

  If datm_devolucao.qry_devolucao_IN_CANCELADO.AsBoolean = True Then
  begin
    MessageDlg('Esta devolução já foi cancelada anteriormente!',  mtError, [mbOk], 0);
    Exit
  end;

  if MessageDlg('Esta devolução será cancelada! Confirma cancelamento?',
     mtConfirmation,
     [mbYes, mbNo], 0) = mrYes then
  begin
  
    Try

      With sp_cancela_devolucao_ Do
      begin

         if Not ( datm_devolucao.qry_devolucao_.State in [dsEdit,dsInsert] ) Then datm_devolucao.qry_devolucao_.Edit;

         datm_devolucao.qry_devolucao_DT_CANCELAMENTO.AsDateTime := Date;
         datm_devolucao.qry_devolucao_CD_USUARIO_CANC.AsString := str_cd_usuario;
         datm_devolucao.qry_devolucao_.Post;
  
         ParamByName('@NR_DEVOLUCAO').AsString := datm_devolucao.qry_devolucao_NR_DEVOLUCAO.AsString;
         ParamByName('@NR_PROCESSO').AsString := datm_devolucao.qry_devolucao_NR_PROCESSO.AsString;
    
         datm_devolucao.qry_devolucao_.close;
    
         ExecProc;

         datm_devolucao.qry_devolucao_.Open;
    
      end;
    
    Except                             
    
      if MessageDlg('O cancelamento não foi bem sucedido.', mtError, [mbOk], 0) = mrOk then Exit;
         
    end;

  end;

end;

procedure Tfrm_devolucao.btn_novaClick(Sender: TObject);
begin

  try
    datm_main.db_proc.StartTransaction;
    if not (datm_devolucao.tbl_processo_w_.State in [dsEdit,dsInsert]) then
       datm_devolucao.tbl_processo_w_.Edit;
    If datm_devolucao.qry_devolucao_.RecordCount = 0 Then
      datm_devolucao.tbl_processo_w_QT_DEVOLUCOES.AsInteger := 1
    else
      datm_devolucao.tbl_processo_w_QT_DEVOLUCOES.AsInteger := datm_devolucao.tbl_processo_w_QT_DEVOLUCOES.AsInteger + 1 ;
    datm_devolucao.tbl_processo_w_.post;
    nr_devolucao := StrZero( datm_devolucao.tbl_processo_w_QT_DEVOLUCOES.AsFloat, 3  );
    datm_devolucao.qry_itens_devolucao_.Close;
    datm_devolucao.qry_itens_devolucao_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
    datm_devolucao.qry_itens_devolucao_.ParamByName('NR_DEVOLUCAO').AsString := nr_devolucao;
    datm_devolucao.qry_itens_devolucao_.Open;
    datm_devolucao.qry_devolucao_.Append;
    datm_devolucao.qry_devolucao_NR_PROCESSO.AsString    := datm_devolucao.tbl_processo_w_NR_PROCESSO.AsString;
    datm_devolucao.qry_devolucao_NR_DEVOLUCAO.AsString   := nr_devolucao;
    datm_devolucao.qry_devolucao_DT_DEVOLUCAO.AsDateTime := date;
    datm_devolucao.qry_devolucao_CD_USUARIO.AsString     := str_cd_usuario;
    datm_devolucao.qry_devolucao_CD_CLIENTE.AsString     := datm_devolucao.tbl_processo_w_CD_CLIENTE.AsString;
    datm_devolucao.qry_devolucao_.Post;
    Application.CreateForm( Tfrm_devolucao_itens, frm_devolucao_itens );
    frm_devolucao_itens.nr_devolucao := nr_devolucao;
    If Not (lOperacaoCancelada) Then
      datm_main.db_proc.Commit
    Else
      raise EOperacaoCancelada.Create('Transação foi cancelada.');
  except
    begin
      datm_main.db_proc.Rollback;
      lOperacaoCancelada := False;
      datm_devolucao.tbl_processo_w_.Cancel;
      datm_devolucao.tbl_processo_w_.Refresh;
    end
  end;

  datm_devolucao.qry_devolucao_.Close;
  datm_devolucao.qry_devolucao_.Open;

  If datm_devolucao.qry_devolucao_.Active Then
     datm_devolucao.qry_devolucao_.Locate('NR_DEVOLUCAO', nr_devolucao, [loPartialKey]);

end;

procedure Tfrm_devolucao.btn_abrirClick(Sender: TObject);
begin

  Application.CreateForm( Tfrm_devolucao_itens, frm_devolucao_itens );
  frm_devolucao_itens.nr_devolucao := datm_devolucao.qry_devolucao_NR_DEVOLUCAO.AsString;
  frm_devolucao_itens.ShowModal;                         

  If datm_devolucao.qry_devolucao_.Active Then
     datm_devolucao.qry_devolucao_.Locate('NR_DEVOLUCAO', nr_devolucao, [loPartialKey]);

end;

procedure Tfrm_devolucao.btn_co_unid_negClick(Sender: TObject);
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

procedure Tfrm_devolucao.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);
{ frm_produto.mskedt_Cons_OnLine := mskedt_cd_produto;}
  With frm_produto Do
  Begin
  Caption := Caption + ' [Consulta On-Line]';
  lCons_OnLine := True;
  ShowModal;
  lCons_OnLine := False;
  end;
  mskedt_cd_produtoExit(Sender);
end;

procedure Tfrm_devolucao.SpeedButton2Click(Sender: TObject);
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
