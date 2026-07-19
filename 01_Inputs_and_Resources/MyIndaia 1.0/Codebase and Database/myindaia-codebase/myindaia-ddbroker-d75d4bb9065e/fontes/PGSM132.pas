unit PGSM132;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, Funcoes;

type
  Tfrm_lib_proc = class(TForm)
    pgctrl_lib_proc: TPageControl;
    ts_lista: TTabSheet;
    dbg_lib_proc: TDBGrid;
    pnl_btn_lb: TPanel;
    btn_liberar: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_liberar: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel2: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_liberarClick(Sender: TObject);
    procedure dbg_lib_procKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Pesquisa : String;
    a_str_indices : Array[0..1] Of String[60];
  public
    procedure AbreProc;
  end;

var
  frm_lib_proc: Tfrm_lib_proc;

implementation

uses PGGP001, PGGP017, PGSM133, GSMLIB, PGSM018, PGSM010;

{$R *.DFM}

procedure Tfrm_lib_proc.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_lib_proc, datm_lib_proc );
end;

procedure Tfrm_lib_proc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_lib_proc.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  with datm_lib_proc Do
  begin
    qry_rel_processo_.Close;
    qry_processo_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_usuario_.Close;
    qry_tp_pend_.Close;
    tbl_yesno_.Close;
  end;
//  datm_lib_proc.Destroy;
  datm_lib_proc.Free;
  Action := caFree;
end;

procedure Tfrm_lib_proc.btn_liberarClick(Sender: TObject);
begin
  try
    if ( datm_lib_proc.qry_processo_IN_CANCELADO.AsString = '0' ) then
    begin
    {  datm_lib_proc.qry_processo_.Edit;
      datm_lib_proc.qry_processo_IN_LIBERADO.AsString    := '1';
      datm_lib_proc.qry_processo_CD_LIBERADOR.AsString   := str_cd_usuario;
      datm_lib_proc.qry_processo_DT_LIBERACAO.AsDateTime := Now;
      datm_lib_proc.qry_processo_.Post; }

      datm_lib_proc.qryUpdateProcesso.close;
      datm_lib_proc.qryUpdateProcesso.paramByName('NR_PROCESSO').asString :=  datm_lib_proc.qry_processo_NR_PROCESSO.AsString;
      datm_lib_proc.qryUpdateProcesso.paramByName('CD_USUARIO').asString  := str_cd_usuario;
      datm_lib_proc.qryUpdateProcesso.execSql;
      if datm_lib_proc.qryUpdateProcesso.RowsAffected <> 0 then
        BoxMensagem( 'Processo foi liberado com êxito!', 3)
      else
        BoxMensagem( 'Erro ao liberar o processo', 3);

      datm_lib_proc.qry_rel_processo_.Close;
      datm_lib_proc.qry_rel_processo_.Prepare;
      datm_lib_proc.qry_rel_processo_.Open;
    end
    else
       BoxMensagem( 'Processo Cancelado não pode ser liberado!', 2);
  except
  on E:Exception do
  begin
    datm_lib_proc.qry_processo_.Cancel;
   // TrataErro(E);
    SHOWMESSAGE(E.MESSAGE)
  end;
  end;
end;

procedure Tfrm_lib_proc.dbg_lib_procKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btn_liberarClick(Sender);
end;

procedure Tfrm_lib_proc.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex= 0 then
     Localiza(datm_lib_proc.qry_rel_processo_, msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else
     Localiza(datm_lib_proc.qry_rel_processo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

procedure Tfrm_lib_proc.cb_ordemClick(Sender: TObject);
begin
  with datm_lib_proc do
  begin
    Screen.Cursor := crHourGlass;
    Pesquisa      := qry_rel_processo_NR_PROCESSO.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    qry_rel_processo_.Close;
    qry_rel_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_rel_processo_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_rel_processo_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_rel_processo_.SQL[14]                             := a_str_indices[cb_ordem.ItemIndex];
    qry_rel_processo_.Prepare;
    qry_rel_processo_.Open;
    Localiza( qry_rel_processo_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_lib_proc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_lib_proc.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_lib_proc do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        AbreProc;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_lib_proc.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_lib_proc do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
        AbreProc;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_lib_proc.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_lib_proc do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
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

procedure Tfrm_lib_proc.btn_co_produtoClick(Sender: TObject);
begin
  with datm_lib_proc do
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

procedure Tfrm_lib_proc.AbreProc();
begin
  Application.ProcessMessages;
  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
  begin
    with datm_lib_proc do
    begin
      qry_rel_processo_.Close;
      qry_rel_processo_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
      qry_rel_processo_.ParamByName('CD_PRODUTO').AsString   := msk_cd_produto.Text;
      qry_rel_processo_.ParamByName('CD_USUARIO').AsString   := str_cd_usuario;

      msk_cd_produto.Text;
      qry_rel_processo_.Prepare;
      qry_rel_processo_.Open;

      qry_processo_.Close;
      qry_processo_.Prepare;
      qry_processo_.Open;
    end;
  end;
end;

procedure Tfrm_lib_proc.FormShow(Sender: TObject);
begin
  vStr_cd_modulo := '01';
  str_cd_rotina := '0108';

  with datm_lib_proc do
  begin
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text  := str_cd_produto;
    msk_cd_produtoExit(nil);
  end;

  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'AP_EMPRESA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    ItemIndex := 0;
  end;

  edt_chave.SetFocus;
end;

procedure Tfrm_lib_proc.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

end.
