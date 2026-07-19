unit PGCH044;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32, FILETEXT, ExtCtrls, Db, ComCtrls, Funcoes;

type
  Tfrm_sel_unid_prod_cli_arm = class(TForm)
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    crp_relat: TCrpe;
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    lbl_arm: TLabel;
    msk_cd_arm: TMaskEdit;
    edt_nm_arm: TEdit;
    btn_co_arm: TSpeedButton;
    Label5: TLabel;
    msk_cd_servico: TMaskEdit;
    edt_nm_servico: TEdit;
    btn_co_servico: TSpeedButton;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_armClick(Sender: TObject);
    procedure msk_cd_armExit(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    str_relatorio: integer;
    { Public declarations }
  end;

var
  frm_sel_unid_prod_cli_arm: Tfrm_sel_unid_prod_cli_arm;

implementation

{$R *.DFM}

uses GSMLIB, PGCH045, PGGP001, PGSM018, PGCH039, PGSM104, PGSM119, PGSM010,
  PGSM022, PGSM064;

procedure Tfrm_sel_unid_prod_cli_arm.btn_cd_unid_negClick(Sender: TObject);
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
    if (Cons_OnLine_Texto <> '' ) then msk_cd_unid_neg.Text := Cons_OnLine_Texto;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then
  begin
    if str_relatorio in [1] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Clear;
    Exit;
  end;

  ValCodEdt(msk_cd_unid_neg);
  With datm_sel_unid_prod_cli_arm.qry_unid_neg_ Do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_prod_cli_arm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_sel_unid_prod_cli_arm.Free;
  crp_relat.Free;
  Action:= cafree;
end;

procedure Tfrm_sel_unid_prod_cli_arm.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_unid_prod_cli_arm, datm_sel_unid_prod_cli_arm);
end;

procedure Tfrm_sel_unid_prod_cli_arm.OKBtnClick(Sender: TObject);
var
  nr_identificador : Integer;

begin
  nr_identificador := 0;

  if str_relatorio = 1 then
  begin
    if msk_cd_unid_neg.Text = '' then
    begin
      BoxMensagem('Informe uma Unidade!',2);
      if msk_cd_unid_neg.Enabled then msk_cd_unid_neg.SetFocus
      else msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if ( msk_cd_grupo.Text = '' ) and (msk_cd_grupo.Enabled = True) then
    begin
      BoxMensagem('Informe um Grupo !',2);
      if msk_cd_grupo.Enabled then msk_cd_grupo.SetFocus
      else msk_cd_cliente.SetFocus;
      Exit;
    end;

    if ( msk_cd_cliente.Text = '' ) and (msk_cd_cliente.Enabled = True) then
    begin
      BoxMensagem('Informe um Grupo !',2);
      if msk_cd_grupo.Enabled then msk_cd_grupo.SetFocus
      else msk_cd_cliente.SetFocus;
      Exit;
    end;

    if ( Trim(msk_cd_produto.Text) = '' ) then
    begin
      BoxMensagem('Informe um Produto!', 2);
      msk_cd_produto.SetFocus;
      Exit;
    end;

    if msk_dt_inicio.Date = 0 then
    begin
      BoxMensagem('Informe uma data de início para seleção!', 2);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with crp_relat do
  begin
    case str_relatorio of
    1: begin
         with datm_sel_unid_prod_cli_arm do
         begin
           ReportName  := cDir_Rpt + '\CRGI014.RPT';
           CloseStoredProc( sp_rel_cliente_arm );
           if Trim( msk_cd_unid_neg.Text ) = '' then
             sp_rel_cliente_arm.ParamByName('@cd_unid_neg').AsString   := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
           if Trim( msk_cd_produto.Text ) = '' then
             sp_rel_cliente_arm.ParamByName('@cd_produto').AsString    := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
           if Trim( msk_cd_grupo.Text ) = '' then
             sp_rel_cliente_arm.ParamByName('@cd_grupo').AsString      := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
           if Trim( msk_cd_cliente.Text ) = '' then
             sp_rel_cliente_arm.ParamByName('@cd_cliente').AsString    := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;

           if Trim( msk_cd_arm.Text ) = '' then
             sp_rel_cliente_arm.ParamByName('@cd_armazem').AsString    := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@cd_armazem').AsString    := msk_cd_arm.Text;
           if Trim( msk_cd_servico.Text ) = '' then
             sp_rel_cliente_arm.ParamByName('@cd_servico').AsString    := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@cd_servico').AsString    := msk_cd_servico.Text;

           if msk_dt_inicio.Date = 0 then
             sp_rel_cliente_arm.ParamByName('@dt_inicio').AsString    := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@dt_inicio').AsString    := FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );
           if msk_dt_fim.Date = 0 then
             sp_rel_cliente_arm.ParamByName('@dt_fim').AsString    := 'X'
           else
             sp_rel_cliente_arm.ParamByName('@dt_fim').AsString    := FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );

           ExecStoredProc( sp_rel_cliente_arm );
           nr_identificador := sp_rel_cliente_arm.ParamByName('@nr_identificador').AsInteger;
           CloseStoredProc( sp_rel_cliente_arm );

           ReportName  := cDir_Rpt + '\CRFI021.RPT';
         end;

       end;
    end;

    if str_relatorio = 1 then
       Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );

    if str_relatorio = 1 then
    begin
       Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
       Execute;
    end;
  end;
  Screen.Cursor := crDefault;

end;

procedure Tfrm_sel_unid_prod_cli_arm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then Exit;
  ValCodEdt(msk_cd_cliente);
  With datm_sel_unid_prod_cli_arm.qry_cliente_ Do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
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
end;

procedure Tfrm_sel_unid_prod_cli_arm.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if Cons_OnLine_Texto <> '' then msk_cd_cliente.Text := Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_sel_unid_prod_cli_arm.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  With datm_sel_unid_prod_cli_arm.qry_grupo_ Do
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
end;

procedure Tfrm_sel_unid_prod_cli_arm.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_arm      then btn_co_armClick(nil);
    if Sender = msk_cd_servico  then btn_co_servicoClick(nil);
  end;

end;

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.text = '' then
  begin
    if str_relatorio in [1] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_produto );
  with datm_sel_unid_prod_cli_arm do
  begin
    qry_produto_.Close;
    qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
    qry_produto_.Prepare;
    qry_produto_.Open;
    if qry_produto_.RecordCount > 0 then
    begin
      edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
    end
    else
    begin
      BoxMensagem('Produto não cadastrado!', 2);
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
      msk_cd_produto.SetFocus;
    end
  end;
end;

procedure Tfrm_sel_unid_prod_cli_arm.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto );
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if (Cons_OnLine_Texto <> '' ) then msk_cd_produto.Text := Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_sel_unid_prod_cli_arm.btn_co_armClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_amz.Cons_OnLine_Texto := msk_cd_arm.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_arm.Text := frm_amz.Cons_OnLine_Texto;
  end;
  msk_cd_armExit(nil);
  msk_cd_arm.SetFocus;
end;

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_armExit(Sender: TObject);
begin
  edt_nm_arm.Clear;

  if msk_cd_arm.Text = '' then
  begin
    if str_relatorio = 1 then edt_nm_arm.Text := 'Todos'
    else edt_nm_arm.Text := '';
  end
  else
  begin
    ValCodEdt(msk_cd_arm);
    with datm_sel_unid_prod_cli_arm.qry_amz_ do
    begin
      Close;
      ParamByName('CD_ARMAZEM').AsString := msk_cd_arm.Text;
      Prepare;
      Open;
      if Eof then
      begin
        BoxMensagem('Armazém não encontrado!',2);
        msk_cd_arm.Clear;
        edt_nm_arm.Clear;
        msk_cd_arm.SetFocus;
      end
      else edt_nm_arm.Text := FieldByName('NM_ARMAZEM').AsString;
      Close;
    end;
  end;

end;

procedure Tfrm_sel_unid_prod_cli_arm.btn_co_servicoClick(Sender: TObject);
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

procedure Tfrm_sel_unid_prod_cli_arm.msk_cd_servicoExit(Sender: TObject);
begin
    { Servico }
    if (msk_cd_servico.Text <> '') then
    begin
      ValCodEdt( msk_cd_servico );

      with datm_sel_unid_prod_cli_arm.qry_servico_ do
      begin
        Close;
        ParamByName('CD_SERVICO').AsString := msk_cd_servico.Text;
        Prepare;
        Open;
        if Eof then
        begin
          BoxMensagem('Serviço inexistente!', 2);
          msk_cd_servico.Text      := '';
          edt_nm_servico.Text      := '';
          msk_cd_servico.SetFocus;
        end
        else
        begin
          {Cliente X Serviço}

          edt_nm_servico.Text      := datm_sel_unid_prod_cli_arm.qry_servico_NM_SERVICO.AsString;

          datm_sel_unid_prod_cli_arm.qry_cliente_servico_.Close;
          if msk_cd_grupo.Text <> '' then
             datm_sel_unid_prod_cli_arm.qry_cliente_servico_.SQL[5] := 'AND E.CD_GRUPO = "' + msk_cd_grupo.Text + '"'
          else if msk_cd_cliente.Text <> '' then
             datm_sel_unid_prod_cli_arm.qry_cliente_servico_.SQL[5] := 'AND S.CD_CLIENTE = "' + msk_cd_cliente.Text + '"';

          datm_sel_unid_prod_cli_arm.qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          datm_sel_unid_prod_cli_arm.qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          datm_sel_unid_prod_cli_arm.qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.Text;
          datm_sel_unid_prod_cli_arm.qry_cliente_servico_.Prepare;
          datm_sel_unid_prod_cli_arm.qry_cliente_servico_.Open;

          if datm_sel_unid_prod_cli_arm.qry_cliente_servico_.EOF then
          begin
            BoxMensagem( 'Grupo/Cliente não tem habilitação para este serviço!', 2);
            msk_cd_servico.SetFocus;
            exit;
          end;
        end;
      end;
    end
    else
      edt_nm_servico.Text := 'Todos';

end;


procedure Tfrm_sel_unid_prod_cli_arm.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text  := str_cd_unid_neg;
  msk_cd_produto.Text   := str_cd_produto;
  msk_dt_inicio.Date    := dt_server;
  msk_dt_fim.Date       := dt_server;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
end;


end.
