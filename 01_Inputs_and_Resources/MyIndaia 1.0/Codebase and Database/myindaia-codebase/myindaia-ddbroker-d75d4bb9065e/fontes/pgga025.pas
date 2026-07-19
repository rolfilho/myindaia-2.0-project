unit PGGA025;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32, Db, Funcoes;

type
  Tfrm_rel_and_servico = class(TForm)
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    crp_rel_and_servico: TCrpe;
    Label3: TLabel;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_grupo: TSpeedButton;
    Label5: TLabel;
    msk_cd_servico: TMaskEdit;
    edt_nm_servico: TEdit;
    btn_co_servico: TSpeedButton;
    lbl_periodo: TLabel;
    msk_dt_inicio: TMaskEdit;
    lbl_a: TLabel;
    msk_dt_fim: TMaskEdit;
    cb_tipo: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    msk_cd_analista: TMaskEdit;
    edt_nm_analista: TEdit;
    btn_co_analista: TSpeedButton;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    function Consiste : Boolean;
    procedure btn_co_analistaClick(Sender: TObject);
    procedure msk_cd_analistaExit(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frm_rel_and_servico: Tfrm_rel_and_servico;

implementation

uses PGGP001, PGSM018, PGSM024, GSMLIB, PGSM010, PGGA026, PGGP017, PGSM119,
  PGSM022;

{$R *.DFM}

procedure Tfrm_rel_and_servico.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
  msk_cd_unid_neg.SetFocus;
end;

procedure Tfrm_rel_and_servico.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  With frm_cliente Do
  Begin
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

procedure Tfrm_rel_and_servico.msk_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_rel_and_servico.msk_cd_clienteExit(Sender: TObject);
begin
  Consiste;
end;


procedure Tfrm_rel_and_servico.btn_iniciarClick(Sender: TObject);
var nr_identificador: Integer;
begin
  Consiste;

  nr_identificador := 0;

  if msk_dt_inicio.Text = '  /  /    ' then
  begin
    BoxMensagem('A data Inicial é obrigatória!',2);
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if StrToDate(msk_dt_inicio.Text) > StrToDate(msk_dt_fim.Text) then
  begin
    BoxMensagem('Data Inicial deve ser menor ou igual a data de hoje!',2);
    msk_dt_inicio.Clear;
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if msk_dt_fim.Text = '  /  /    ' then
  begin
    BoxMensagem('A data Final é obrigatória!',2);
    msk_dt_fim.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with datm_rel_and_servico do
  begin
    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_rel_and_servico);
      sp_rel_and_servico.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      sp_rel_and_servico.ParamByName('@CD_PRODUTO').AsString  := msk_cd_produto.Text;
      sp_rel_and_servico.ParamByName('@CD_GRUPO').AsString    := msk_cd_grupo.Text;
      sp_rel_and_servico.ParamByName('@CD_CLIENTE').AsString  := msk_cd_cliente.Text;
      sp_rel_and_servico.ParamByName('@CD_SERVICO').AsString  := msk_cd_servico.Text;
      sp_rel_and_servico.ParamByName('@DT_INICIO').AsDateTime := StrToDate( msk_dt_inicio.Text );
      sp_rel_and_servico.ParamByName('@DT_FIM').AsDateTime    := StrToDate( msk_dt_fim.Text );
      sp_rel_and_servico.ParamByName('@TIPO').AsInteger       := cb_tipo.ItemIndex;
      sp_rel_and_servico.ParamByName('@CD_ANALISTA').AsString := msk_cd_analista.Text;
      ExecStoredProc(sp_rel_and_servico);
      nr_identificador := sp_rel_and_servico.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc(sp_rel_and_servico);

      sp_atz_obs_rel.ParamByName('@NR_IDENTIFICADOR').AsiNTEGER:= nr_identificador;
      ExecStoredProc(sp_atz_obs_rel);
      CloseStoredProc(sp_atz_obs_rel);

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with crp_rel_and_servico do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    ReportName    := cDir_Rpt + '\CRGA005.RPT';
    Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );
    Execute;
  end;

  ApagaDados( 'TREL_AND_SERVICOS', nr_identificador );

  Screen.Cursor := crDefault;

end;

procedure Tfrm_rel_and_servico.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_and_servico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_rel_and_servico.free;
  crp_rel_and_servico.Free;
  action:= cafree;
end;

procedure Tfrm_rel_and_servico.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_rel_and_servico, datm_rel_and_servico);

  datm_rel_and_servico.qry_servico_.Close;
  datm_rel_and_servico.qry_servico_.Prepare;
  datm_rel_and_servico.qry_servico_.Open;

end;

procedure Tfrm_rel_and_servico.msk_cd_produtoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_rel_and_servico.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_servico  then btn_co_servicoClick(nil);
    if Sender = msk_cd_analista then btn_co_analistaClick(nil);
  end;
end;

procedure Tfrm_rel_and_servico.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo        := '23';
  str_cd_rotina        := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_produto.Text  := frm_produto.Cons_OnLine_Texto;
  vStr_cd_modulo        := '15';
  str_cd_rotina        := '1555';

  msk_cd_produtoExit(nil);
end;

procedure Tfrm_rel_and_servico.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_dt_inicio.Text := FormatDateTime( 'dd/mm/yyyy', dt_server );
  msk_dt_fim.Text    := FormatDateTime( 'dd/mm/yyyy', dt_server );
  msk_cd_servico.Text:= '';
  msk_cd_servicoExit(nil);

  msk_cd_grupo.SetFocus;


end;



procedure Tfrm_rel_and_servico.msk_dt_inicioExit(Sender: TObject);
begin
  if msk_dt_inicio.Text = '  /  /    ' then Exit;
  try
    StrToDate(msk_dt_inicio.Text);
  Except
    On EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_inicio.clear;
      msk_dt_inicio.setfocus;
    end;
  end;

end;

procedure Tfrm_rel_and_servico.msk_dt_fimExit(Sender: TObject);
begin
  if msk_dt_fim.Text = '  /  /    ' then Exit;
  try
    StrToDate(msk_dt_fim.Text);
  Except
    On EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_fim.clear;
      msk_dt_fim.setfocus;
    end;
  end;


end;

procedure Tfrm_rel_and_servico.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_grupo.Cons_OnLine_Texto <> '' then msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);

end;

procedure Tfrm_rel_and_servico.msk_cd_grupoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_rel_and_servico.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_rel_and_servico.btn_co_servicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';

  Application.CreateForm(Tfrm_servico, frm_servico);
  with frm_servico do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_servico.Text := frm_servico.Cons_OnLine_Texto;

  vStr_cd_modulo := '15';
  str_cd_rotina := '1555';

  msk_cd_servicoExit(nil);
end;

procedure Tfrm_rel_and_servico.msk_cd_servicoExit(Sender: TObject);
begin
  Consiste;
end;

function Tfrm_rel_and_servico.Consiste : Boolean;
begin
  Consiste := True;

  with datm_rel_and_servico do
  begin

    { Unidade }
    edt_nm_unid_neg.Clear;
    if msk_cd_unid_neg.Text = '' then Exit;
    ValCodEdt(msk_cd_unid_neg);
    With datm_rel_and_servico.qry_unid_neg_ Do
    begin
      ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem('Unidade não encontrada!',2);
        msk_cd_unid_neg.Clear;
        msk_cd_unid_neg.SetFocus;
      end
      else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
      Close;
    end;

    { Produto }
    edt_nm_produto.Clear;
    if msk_cd_produto.Text = '' then Exit;
    ValCodEdt(msk_cd_produto);
    With datm_rel_and_servico.qry_produto_ Do
    begin
      ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem('Produto não encontrado!',2);
        msk_cd_Produto.Clear;
        msk_cd_Produto.SetFocus;
      end
      else edt_nm_produto.Text:= FieldByName('AP_PRODUTO').AsString;
      Close;
    end;

    {Grupo}
    if msk_cd_grupo.Text <> '' then
    begin
      edt_nm_grupo.Clear;
      if msk_cd_grupo.Text = '' then
      begin
        edt_nm_grupo.Text := 'Todos';
        Exit;
      end;
      ValCodEdt(msk_cd_grupo);
      with datm_rel_and_servico.qry_grupo_ do
      begin
        ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
        Open;
        if RecordCount = 0 then
        begin
          BoxMensagem('Grupo de Clientes não encontrado!',2);
          msk_cd_grupo.Clear;
          msk_cd_grupo.SetFocus;
        end
        else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
        Close;
      end;
    end
    else edt_nm_grupo.Text := '';

    {Cliente}
    if (msk_cd_cliente.Text <> '') and (msk_cd_cliente.Enabled = True) then
    begin
      edt_nm_cliente.Clear;
      if msk_cd_cliente.Text = '' then
      begin
        edt_nm_cliente.text:= 'Todos';
        Exit;
      end;
      ValCodEdt(msk_cd_cliente);
      With datm_rel_and_servico.qry_cliente_ Do
      begin
        ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
        Open;
        if RecordCount = 0 then
        begin
          BoxMensagem('Cliente não encontrado!',2);
          msk_cd_cliente.Clear;
          msk_cd_cliente.SetFocus;
        end
        else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
        Close;
      end;
    end
    else edt_nm_cliente.Text := '';

    {Analista}
    if msk_cd_analista.Text <> '' then
    begin
      edt_nm_analista.Clear;
      if Trim(msk_cd_analista.Text) = '' then
      begin
        edt_nm_analista.Text := 'Todos';
        Exit;
      end;
      ValCodEdt(msk_cd_analista);
      With datm_rel_and_servico.qry_analistas_ Do
      begin
        ParamByName('CD_ANALISTA').AsString := msk_cd_analista.Text;
        Open;
        if RecordCount = 0 then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          msk_cd_analista.Clear;
          msk_cd_analista.SetFocus;
        end
        else edt_nm_analista.Text:= FieldByName('NM_USUARIO').AsString;
        Close;
      end;
    end
    else edt_nm_analista.Text := '';


    { Servico }
    if (msk_cd_servico.Text <> '') then
    begin
      ValCodEdt( msk_cd_servico );

      if not ( qry_servico_.Locate('CD_SERVICO', msk_cd_servico.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Serviço inexistente!', 2);
        msk_cd_servico.Text      := '';
        edt_nm_servico.Text      := '';
        Consiste                 := False;
        msk_cd_servico.SetFocus;
      end
      else
      begin
        {Cliente X Serviço}

        edt_nm_servico.Text      := qry_servico_NM_SERVICO.AsString;

        qry_cliente_servico_.Close;
        if msk_cd_grupo.Text <> '' then
           qry_cliente_servico_.SQL[5] := 'AND E.CD_GRUPO = "' + msk_cd_grupo.Text + '"'
        else if msk_cd_cliente.Text <> '' then
           qry_cliente_servico_.SQL[5] := 'AND S.CD_CLIENTE = "' + msk_cd_cliente.Text + '"';

        qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.Text;
        qry_cliente_servico_.Prepare;
        qry_cliente_servico_.Open;

        if qry_cliente_servico_.EOF then
        begin
          BoxMensagem( 'Grupo/Cliente não tem habilitação para este serviço!', 2);
          Consiste := False;
          msk_cd_servico.SetFocus;
          exit;
        end;
      end;
    end
    else edt_nm_servico.Text := '';

  end;
end;

procedure Tfrm_rel_and_servico.btn_co_analistaClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TUSUARIO', msk_cd_analista, 'Analista Responsável', 45, '' );
  msk_cd_analistaExit(nil);

end;

procedure Tfrm_rel_and_servico.msk_cd_analistaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_rel_and_servico.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;

end.
