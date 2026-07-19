unit PGSM030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons, ShellApi, ConsOnLineEx, StrUtils;

type
  Tfrm_duplica_param_cli = class(TForm)
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    btn_duplicar: TButton;
    btn_fechar: TButton;
    chk_num: TCheckBox;
    chk_fat: TCheckBox;
    chk_item: TCheckBox;
    chk_repres: TCheckBox;
    lbl_servico: TLabel;
    btn_co_servico: TSpeedButton;
    EditServico: TEdit;
    msk_cd_servico: TMaskEdit;
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
  private
    FServicoNovo: Boolean;
  public
    str_cliente, str_unid, str_produto, str_servico : String;
    property ServicoNovo: Boolean read FServicoNovo;
  end;

var
  frm_duplica_param_cli: Tfrm_duplica_param_cli;

implementation

uses PGGP001, PGSM104, PGSM031, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_duplica_param_cli.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    edt_nm_cliente.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  {if AnsiIndexText(Copy(qry_processo_.ParamByName('NR_PROCESSO').AsString, 3, 2), ['01', '03', '06', '17']) >= 0 then
    FNovoServico := ConsultaLookUPSQL(' SELECT ISNULL(G.IN_NOVO_FOLLOWUP_IMP, ''0'') AS IN_NOVO_FOLLOWUP ' +
                                      ' FROM TGRUPO G (NOLOCK) ' +
                                      '    INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_GRUPO = G.CD_GRUPO ' +
                                      ' WHERE EN.CD_EMPRESA = ''' + msk_cd_cliente.Text + '''', 'IN_NOVO_FOLLOWUP') = '1'
  else if AnsiIndexText(Copy(qry_processo_.ParamByName('NR_PROCESSO').AsString, 3, 2), ['02', '10', '18']) >= 0 then
    FNovoServico := ConsultaLookUPSQL(' SELECT ISNULL(G.IN_NOVO_FOLLOWUP_EXP, ''0'') AS IN_NOVO_FOLLOWUP ' +
                                      ' FROM TGRUPO G (NOLOCK) ' +
                                      '    INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_GRUPO = G.CD_GRUPO ' +
                                      ' WHERE EN.CD_EMPRESA = ''' + msk_cd_cliente.Text + '''', 'IN_NOVO_FOLLOWUP') = '1'
  else
    NovoServico := False;}
  with datm_duplica_param_cli.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_duplica_param_cli.btn_duplicarClick(Sender: TObject);
var
  in_num, in_fat, in_item, in_repres : Boolean;
begin
  if Trim(msk_cd_cliente.Text) = '' then
  begin
    BoxMensagem('Informe um Cliente!', 2);                                             
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  if Trim(msk_cd_servico.Text) = '' then
  begin
    BoxMensagem('Informe um Serviço!', 2);
    msk_cd_servico.SetFocus;
    Exit;
  end;

  if ( Not chk_num.Checked ) and ( Not chk_fat.Checked ) and ( Not chk_item.Checked ) and ( Not chk_repres.Checked ) then
  begin
    BoxMensagem('Selecione Parâmetros de Numerário e/ou Faturamento e/ou Fat. Itens Complementares para duplicar!', 2);
    chk_num.SetFocus;
    Exit;
  end;

  try
    if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected :=  True;
    datm_main.db_broker.StartTransaction;

    in_num    := chk_num.Checked;
    in_fat    := chk_fat.Checked;
    in_item   := chk_item.Checked;
    in_repres := chk_repres.Checked;

    with datm_duplica_param_cli do
    begin
      CloseStoredProc(sp_duplica_param_cli);
      sp_duplica_param_cli.ParamByName('@CD_CLIENTE_FONTE').AsString   := Trim( msk_cd_cliente.Text );
      sp_duplica_param_cli.ParamByName('@CD_CLIENTE_DESTINO').AsString := Trim( str_cliente );
      sp_duplica_param_cli.ParamByName('@CD_UNID_NEG').AsString        := Trim( str_unid );
      sp_duplica_param_cli.ParamByName('@CD_PRODUTO').AsString         := Trim( str_produto );
      sp_duplica_param_cli.ParamByName('@CD_SERVICO').AsString         := Trim( str_servico );
      sp_duplica_param_cli.ParamByName('@CD_SERVICO_FONTE').AsString   := Trim( msk_cd_servico.Text );
      sp_duplica_param_cli.ParamByName('@IN_NUM').AsBoolean            := in_num;
      sp_duplica_param_cli.ParamByName('@IN_FAT').AsBoolean            := in_fat;
      sp_duplica_param_cli.ParamByName('@IN_ITEM').AsBoolean           := in_item;
      sp_duplica_param_cli.ParamByName('@IN_REPRES').AsBoolean         := in_repres;
      ExecStoredProc(sp_duplica_param_cli);
      CloseStoredProc(sp_duplica_param_cli);
    end;

    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Exit;
    end;
  end;
  BoxMensagem('Duplicação executada com sucesso!', 3);

end;

procedure Tfrm_duplica_param_cli.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_duplica_param_cli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_duplica_param_cli do
  begin
    if qry_cliente_.Active  then qry_cliente_.Close;
    Free;
  end;
  Action := cafree;
end;

procedure Tfrm_duplica_param_cli.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_duplica_param_cli, datm_duplica_param_cli);
end;

procedure Tfrm_duplica_param_cli.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_servico  then btn_co_servicoClick(nil);
  end;
end;


procedure Tfrm_duplica_param_cli.FormShow(Sender: TObject);
begin
  chk_num.Checked    := True;
  chk_fat.Checked    := True;
  chk_item.Checked   := True;
  chk_repres.Checked := True;
end;

procedure Tfrm_duplica_param_cli.btn_co_servicoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if ServicoNovo then
      msk_cd_servico.Text := ConsultaOnLineEx('TSERVICO_NOVO', 'Serviços', ['CD_SERVICO', 'NM_SERVICO'], ['Código', 'Descrição'], 'CD_SERVICO', nil)
    else
      msk_cd_servico.Text := ConsultaOnLineEx('TSERVICO', 'Serviços', ['CD_SERVICO', 'NM_SERVICO'], ['Código', 'Descrição'], 'CD_SERVICO', nil);
  end
  else
  begin
    if ServicoNovo then
      EditServico.Text := ConsultaLookUP('TSERVICO_NOVO', 'CD_SERVICO', msk_cd_servico.Text, 'NM_SERVICO')
    else
      EditServico.Text := ConsultaLookUP('TSERVICO', 'CD_SERVICO', msk_cd_servico.Text, 'NM_SERVICO');
  end;
end;

procedure Tfrm_duplica_param_cli.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  With frm_cliente_co Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente_co.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_duplica_param_cli.msk_cd_servicoExit(Sender: TObject);
begin
  if Trim(msk_cd_servico.Text) <> '' then
    msk_cd_servico.Text := FStrZero(msk_cd_servico.Text, 3);
end;

end.
