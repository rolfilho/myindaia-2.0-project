unit PGPO025;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, PGGP001,
  StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls, Menus, DB, DBCtrls, DBTables,
  Funcoes, PGGP017;

type
  Tfrm_evento_critico = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    men_sair: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    btn_sair: TSpeedButton;
    lbl_nm_usuario: TLabel;
    edt_nm_usuario: TEdit;
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    Label6: TLabel;
    btn_cd_produto: TSpeedButton;
    Label7: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    lbl_cd_servico: TLabel;
    Label8: TLabel;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    msk_dt_realizacao: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    msk_cd_evento: TMaskEdit;
    edt_nm_evento: TEdit;
    procedure FormShow(Sender: TObject);
    procedure msk_cd_eventoExit(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure men_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure msk_cd_eventoEnter(Sender: TObject);
    procedure msk_dt_realizacaoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina, st_nr_processo, st_cd_cliente, st_cd_servico, st_cd_evento, st_dt_realizacao: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_evento_critico: Tfrm_evento_critico;

implementation

uses PGSM039, PGSM018, PGSM010, PGGP015, PGSM036, GSMLIB, PGSM136, PGPO026;

{$R *.DFM}

procedure Tfrm_evento_critico.FormShow(Sender: TObject);
begin
  Application.CreateForm(Tdatm_evento_critico, datm_evento_critico );

  st_cd_modulo:= vStr_cd_modulo;
  st_cd_rotina:= vStr_cd_modulo;

  edt_nm_usuario.Text    := str_nm_usuario;
  msk_cd_unid_neg.Text   := str_cd_unid_neg;
  msk_cd_produto.Text    := str_cd_produto;
  msk_dt_realizacao.Text := Copy(DateToStr8(date),1,2)+'/'+Copy(DateToStr8(date),3,2)+'/'+Copy(DateToStr8(date),5,4);
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  msk_cd_evento.setfocus;

end;


procedure Tfrm_evento_critico.msk_cd_eventoExit(Sender: TObject);
var st_cd_evento_l:String;
begin
  st_cd_evento_l:= st_cd_evento;
  try
    msk_cd_evento.Text := StrZero(StrToInt(msk_cd_evento.Text), 3);
  except
     on EConvertError do
  end;
  if (st_cd_evento <> msk_cd_evento.Text) then
  begin
    with datm_evento_critico do
    begin
      qry_tevento_.Close;
      qry_tevento_.ParamByName('CD_EVENTO').AsString := msk_cd_evento.Text;
      qry_tevento_.Prepare;
      qry_tevento_.Open;
      if qry_tevento_.Recordcount > 0 then
      begin
        if qry_tevento_IN_INSPECIONAVEL.Value = '1' then
           edt_nm_evento.Text := qry_tevento_nm_evento.AsString
        else
        begin
          BoxMensagem('Evento não inspecionável.', 2);
          edt_nm_evento.Clear;
          msk_cd_evento.SetFocus;
          st_cd_evento := st_cd_evento_l;
        end;
      end;
      if qry_tevento_.Recordcount = 0 then
      begin
        BoxMensagem('Evento não encontrado.',2);
        edt_nm_evento.clear;
        msk_cd_evento.setfocus;
        st_cd_evento:= st_cd_evento_l;
      end;
    qry_verifica_evento_.Close;
    qry_verifica_evento_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_verifica_evento_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_verifica_evento_.ParamByName('CD_EVENTO').AsString   := msk_cd_evento.Text;
    qry_verifica_evento_.ParamByName('DT_PREVISTA').AsDate := StrToDate( msk_dt_realizacao.Text );
    qry_verifica_evento_.Prepare;
    qry_verifica_evento_.Open;

    end;

  end;
{
    with datm_evento_critico do
    begin
    qry_verifica_evento_.Close;
    qry_verifica_evento_.ParamByName('CD_UNID_NEG').AsString := '01';
    qry_verifica_evento_.ParamByName('CD_PRODUTO').AsString  := '01';
    qry_verifica_evento_.ParamByName('CD_EVENTO').AsString   := '264';
    qry_verifica_evento_.ParamByName('DT_PREVISTA').AsDateTime := StrToDate( msk_dt_realizacao.Text );
    qry_verifica_evento_.Prepare;
    qry_verifica_evento_.Open;

    end;
 }
end;

procedure Tfrm_evento_critico.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_evento_critico.men_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_evento_critico.msk_cd_unid_negExit(Sender: TObject);
begin
  if Not ( st_unid_neg = msk_cd_unid_neg.Text ) then
  begin
    with datm_evento_critico do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
      end
      else
      begin
        edt_nm_unid_neg.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
      end;
      qry_unid_neg_.Close;
    end;
  end;
end;

procedure Tfrm_evento_critico.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_evento_critico.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_evento_critico.msk_cd_produtoExit(Sender: TObject);
var foco: Boolean;
begin
  if Not ( st_produto = msk_cd_produto.Text ) then
  begin
    with datm_evento_critico do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
      end
      else
      begin
        edt_nm_produto.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        foco := True;
      end;
      qry_produto_.Close;
    end;
    if foco then msk_cd_produto.SetFocus;
  end;
end;

procedure Tfrm_evento_critico.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_evento_critico.btn_cd_produtoClick(Sender: TObject);
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
    msk_cd_produtoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_evento_critico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_evento_critico.Free;
  Action := cafree;
end;

procedure Tfrm_evento_critico.SpeedButton3Click(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_evento.Text := frm_evento.Cons_OnLine_Texto;
    msk_cd_eventoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_evento_critico.msk_cd_eventoEnter(Sender: TObject);
begin
  st_cd_evento:= msk_cd_evento.Text;
end;

procedure Tfrm_evento_critico.msk_dt_realizacaoExit(Sender: TObject);
begin
  if ( msk_dt_realizacao.Text = '  /  /    ' ) then
  begin
    Exit;
  end;
  try
    StrToDate(msk_dt_realizacao.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data inválida.',2);
      Exit;
    end;
  end;

end;

procedure Tfrm_evento_critico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_evento_critico.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_cd_evento   then SpeedButton3Click(nil);
  end;
end;

end.
