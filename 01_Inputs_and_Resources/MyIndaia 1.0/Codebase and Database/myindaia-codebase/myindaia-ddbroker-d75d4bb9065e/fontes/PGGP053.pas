(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGP053.PAS - Relatório Comercial - Importação/Exportação

AUTOR: Leandro Stipanich

Data: 28/09/2001

*************************************************************************************************)
unit PGGP053;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, UCRPE32, Funcoes;

type
  Tfrm_rel_com_imp_exp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    msk_cd_grupo: TMaskEdit;
    msk_dt_conhecimento: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    edt_nm_grupo: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    btn_co_grupo: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    edt_nm_cliente: TEdit;
    edt_nm_servico: TEdit;
    msk_cd_servico: TMaskEdit;
    msk_cd_cliente: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    btn_co_cliente: TSpeedButton;
    btn_co_servico: TSpeedButton;
    edt_prefixo: TEdit;
    crp_rel_com_imp_exp: TCrpe;
    Shape1: TShape;
    Shape2: TShape;
    Label8: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_com_imp_exp: Tfrm_rel_com_imp_exp;

implementation

uses PGSM119, PGGP052, PGSM010, PGSM018, GSMLIB, PGGP001, PGSM024, PGSM022,
  PGGP054;

{$R *.DFM}

procedure Tfrm_rel_com_imp_exp.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Enabled := False;
    btn_co_cliente.Enabled := False;
  end
  else
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    btn_co_cliente.Enabled := True;
  end;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Enabled := False;
    btn_co_grupo.Enabled := False;
  end
  else
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    btn_co_grupo.Enabled := True;
  end;
end;

procedure Tfrm_rel_com_imp_exp.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_grupo.Cons_OnLine_Texto := msk_cd_grupo.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if Trim( msk_cd_grupo.Text ) = '' then Exit;
  ValCodEdt( msk_cd_grupo );
  with datm_rel_com_imp_exp.qry_grupo_ do
  begin
    ParamByName( 'CD_GRUPO' ).AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Grupo não encontrado!',2 );
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
    end
    else edt_nm_grupo.Text := FieldByName( 'NM_GRUPO' ).AsString;
    Close;
  end;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg  then btn_co_unid_negClick(nil)  else
    if Sender = msk_cd_produto   then btn_co_produtoClick(nil)   else
    if Sender = msk_cd_grupo     then btn_co_grupoClick(nil)     else
    if Sender = msk_cd_cliente   then btn_co_clienteClick(nil)   else
    if Sender = msk_cd_servico   then btn_co_servicoClick(nil);
  end;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if Trim( msk_cd_produto.Text ) = '' then
  begin
    edt_nm_produto.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  With datm_rel_com_imp_exp.qry_produto_ do
  begin
    ParamByName( 'CD_PRODUTO' ).AsString := msk_cd_produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Produto não encontrado!',2 );
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
    end
    else edt_nm_produto.Text:= FieldByName( 'NM_PRODUTO' ).AsString;
    Close;
  end;
end;

procedure Tfrm_rel_com_imp_exp.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_produto.Text  := frm_produto.Cons_OnLine_Texto;
  with datm_rel_com_imp_exp.qry_produto_ do
  begin
    Close;
    ParamByName('CD_PRODUTO').asString := msk_cd_produto.Text;
    Prepare;
    Open;
    edt_nm_produto.Text := FieldByName('NM_PRODUTO').asString
  end;
end;

procedure Tfrm_rel_com_imp_exp.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_rel_com_imp_exp do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade);
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
      qry_unidade_.Close;
      qry_unidade_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unidade_.Prepare;
      qry_unidade_.Open;
      if qry_unidade_.RecordCount > 0 then edt_nm_unid_neg.Text := qry_unidade_NM_UNID_NEG.AsString;
      qry_unidade_.Close;
    end;
  end;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if Trim( msk_cd_unid_neg.Text ) = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;
  ValCodEdt(msk_cd_unid_neg);
  With datm_rel_com_imp_exp.qry_unidade_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= FieldByName('NM_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if Trim( msk_cd_cliente.Text ) = '' then Exit;
  ValCodEdt( msk_cd_cliente );
  with datm_rel_com_imp_exp.qry_cliente_ do
  begin
    ParamByName( 'CD_CLIENTE' ).AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Cliente não encontrado!',2 );
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName( 'AP_EMPRESA' ).AsString;
    Close;
  end;
end;

procedure Tfrm_rel_com_imp_exp.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_rel_com_imp_exp, datm_rel_com_imp_exp );
end;

procedure Tfrm_rel_com_imp_exp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_rel_com_imp_exp.Free;
  crp_rel_com_imp_exp.Free;
  Action := caFree;
end;

procedure Tfrm_rel_com_imp_exp.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_rel_com_imp_exp.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_cd_unid_neg.SetFocus;
end;

procedure Tfrm_rel_com_imp_exp.Button1Click(Sender: TObject);
var
  nr_identificador : Integer;
begin
  try
    msk_dt_conhecimento.Text := DateToStr( StrToDate( msk_dt_conhecimento.Text ) );
  except
    BoxMensagem( 'Data do Conhecimento Inválida',2 );
    msk_dt_conhecimento.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with datm_rel_com_imp_exp do
  begin
    CloseStoredProc( sp_rel_com_imp_exp );
    { Unidade }
    if Trim( msk_cd_unid_neg.Text ) = '' then
      sp_rel_com_imp_exp.ParamByName( '@cd_unid_neg' ).AsString := 'X'
    else
      sp_rel_com_imp_exp.ParamByName( '@cd_unid_neg' ).AsString := msk_cd_unid_neg.Text;
    { Produto }
    if Trim( msk_cd_produto.Text ) = '' then
      sp_rel_com_imp_exp.ParamByName( '@cd_produto' ).AsString  := 'X'
    else
      sp_rel_com_imp_exp.ParamByName( '@cd_produto' ).AsString  := msk_cd_produto.Text;
    { Grupo }
    if Trim( msk_cd_grupo.Text ) = '' then
      sp_rel_com_imp_exp.ParamByName( '@cd_grupo' ).AsString    := 'X'
    else
      sp_rel_com_imp_exp.ParamByName( '@cd_grupo' ).AsString    := msk_cd_grupo.Text;
    { Cliente }
    if Trim( msk_cd_cliente.Text ) = '' then
      sp_rel_com_imp_exp.ParamByName( '@cd_cliente' ).AsString  := 'X'
    else
      sp_rel_com_imp_exp.ParamByName( '@cd_cliente' ).AsString  := msk_cd_cliente.Text;
    { Serviço }
    if Trim( msk_cd_servico.Text ) = '' then
      sp_rel_com_imp_exp.ParamByName( '@cd_servico' ).AsString  := 'X'
    else
      sp_rel_com_imp_exp.ParamByName( '@cd_servico' ).AsString  := msk_cd_servico.Text;
    { Prefixo }
    if Trim( edt_prefixo.Text ) = '' then
      sp_rel_com_imp_exp.ParamByName( '@prefixo' ).AsString     := 'X'
    else
      sp_rel_com_imp_exp.ParamByName( '@prefixo' ).AsString     := edt_prefixo.Text;
    { Data do Conhecimento }
    sp_rel_com_imp_exp.ParamByName( '@dt_conhec' ).AsdateTime   := StrToDateTime( msk_dt_conhecimento.Text );
    ExecStoredProc( sp_rel_com_imp_exp );
    nr_identificador := sp_rel_com_imp_exp.ParamByName( '@nr_identificador' ).AsInteger;
    CloseStoredProc( sp_rel_com_imp_exp );

    with crp_rel_com_imp_exp do
    begin
      Connect     := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRES009.RPT';
      Formulas[0] := 'Nr_Identificador = '+  IntToStr( nr_identificador );
      Execute;
    end;

    { Apaga Dados da Tabela Temporária }
    ApagaDados( 'TREL_COM_IMP_EXP', nr_identificador );
  end;
end;

procedure Tfrm_rel_com_imp_exp.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_rel_com_imp_exp.btn_co_servicoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_servico, frm_servico);
  with frm_servico do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_servico.Cons_OnLine_Texto := msk_cd_servico.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_servico.Text := frm_servico.Cons_OnLine_Texto;
  end;
  msk_cd_servicoExit(nil);
  msk_cd_servico.SetFocus;
end;

procedure Tfrm_rel_com_imp_exp.msk_cd_servicoExit(Sender: TObject);
begin
  edt_nm_servico.Clear;
  if Trim( msk_cd_servico.Text ) = '' then
  begin
    edt_nm_servico.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_servico );
  with datm_rel_com_imp_exp.qry_servico_ do
  begin
    ParamByName( 'CD_SERVICO' ).AsString := msk_cd_servico.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Serviço não encontrado!',2 );
      msk_cd_servico.Clear;
      msk_cd_servico.SetFocus;
    end
    else edt_nm_servico.Text:= FieldByName( 'NM_SERVICO' ).AsString;
    Close;
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

end.
