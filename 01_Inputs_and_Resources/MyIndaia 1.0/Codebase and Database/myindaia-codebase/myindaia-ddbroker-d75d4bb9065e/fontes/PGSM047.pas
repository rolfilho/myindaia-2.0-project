unit PGSM047;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ShellApi;

type
  Tfrm_duplica_ct_contabil_gerencial = class(TForm)
    lbl_ct_contabil: TLabel;
    btn_co_ct_contabil: TSpeedButton;
    edt_nm_ct_contabil: TEdit;
    msk_cd_ct_contabil: TMaskEdit;
    btn_duplicar: TButton;
    btn_fechar: TButton;
    lbl_mes: TLabel;
    btn_co_mes: TSpeedButton;
    edt_nm_mes: TEdit;
    msk_cd_mes: TMaskEdit;
    Label2: TLabel;
    msk_cd_ano: TMaskEdit;
    lbl_acesso: TLabel;
    msk_cd_acesso: TMaskEdit;
    lbl_aux: TLabel;
    msk_cd_aux: TMaskEdit;
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure msk_cd_ct_contabilExit(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_acessoEnter(Sender: TObject);
    procedure msk_cd_auxEnter(Sender: TObject);
    procedure msk_cd_acessoExit(Sender: TObject);
    procedure msk_cd_auxExit(Sender: TObject);
    procedure msk_cd_mesExit(Sender: TObject);
    procedure msk_cd_ct_contabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_mesClick(Sender: TObject);
  private
    { Private declarations }
    cd_acesso, cd_aux : String[1];
  public
    str_cd_ct_contabil_destino : String[10];
  end;

var
  frm_duplica_ct_contabil_gerencial: Tfrm_duplica_ct_contabil_gerencial;

implementation

uses PGGP001, PGSM168, PGSM167, GSMLIB, PGGP017, PGSM096;

{$R *.DFM}

procedure Tfrm_duplica_ct_contabil_gerencial.btn_co_ct_contabilClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TCT_CONTABIL', msk_cd_ct_contabil, 'Contas Contábeis', 37, '' );
  msk_cd_ct_contabilExit(nil);
end;

procedure Tfrm_duplica_ct_contabil_gerencial.msk_cd_ct_contabilExit(Sender: TObject);
begin
  edt_nm_ct_contabil.Clear;
  if Trim( msk_cd_ct_contabil.Text ) = '' then
  begin
    edt_nm_ct_contabil.Text := '';
    Exit;
  end;

  with datm_duplica_ct_contabil_gerencial.qry_ct_contabil_ do
  begin
    ParamByName('CD_CT_CONTABIL').AsString := msk_cd_ct_contabil.Text;
    Prepare;
    Open;

    if RecordCount = 0 then
    begin
      BoxMensagem( 'Conta Contábil não encontrado!', 2 );
      msk_cd_ct_contabil.Clear;
      edt_nm_ct_contabil.Clear;
      msk_cd_ct_contabil.SetFocus;
    end
    else
    begin
      msk_cd_acesso.Text      := FieldByName('CD_ACESSO').AsString;
      msk_cd_aux.Text         := FieldByName('CD_AUX').AsString;
      edt_nm_ct_contabil.Text := FieldByName('NM_CT_CONTABIL').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.btn_duplicarClick(Sender: TObject);
begin
  if Trim( msk_cd_ct_contabil.Text ) = '' then
  begin
    BoxMensagem('Informe uma Conta Contábil!', 2);
    msk_cd_ct_contabil.SetFocus;
    Exit;
  end;

  if Trim( msk_cd_ano.Text ) = '' then
  begin
    BoxMensagem('Informe um Ano!', 2);
    msk_cd_ano.SetFocus;
    Exit;
  end;

  if Trim( msk_cd_mes.Text ) = '' then
  begin
    BoxMensagem('Informe um Mês!', 2);
    msk_cd_mes.SetFocus;
    Exit;
  end;

  try
    if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected :=  True;
    datm_main.db_broker.StartTransaction;

    with datm_duplica_ct_contabil_gerencial do
    begin
      CloseStoredProc(sp_duplica_ct_contabil_gerencial);
      sp_duplica_ct_contabil_gerencial.ParamByName('@CD_CT_CONTABIL_FONTE').AsString   := Trim( msk_cd_ct_contabil.Text );
      sp_duplica_ct_contabil_gerencial.ParamByName('@CD_CT_CONTABIL_DESTINO').AsString := str_cd_ct_contabil_destino;
      sp_duplica_ct_contabil_gerencial.ParamByName('@CD_MES_FONTE').AsString           := Trim( msk_cd_mes.Text );
      sp_duplica_ct_contabil_gerencial.ParamByName('@CD_ANO_FONTE').AsString           := Trim( msk_cd_ano.Text );
      ExecStoredProc( sp_duplica_ct_contabil_gerencial );
      if sp_duplica_ct_contabil_gerencial.ParamByName('Result').AsInteger = 0 then BoxMensagem('Duplicação executada com sucesso!', 3);
      if sp_duplica_ct_contabil_gerencial.ParamByName('Result').AsInteger = 1 then
      begin
        BoxMensagem('Não existem Contas Contábeis X Gerenciais ' + #13#10 + ' para esta Conta Contábil neste período!', 2);
        msk_cd_acesso.SetFocus;
      end;
      CloseStoredProc( sp_duplica_ct_contabil_gerencial );
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
end;

procedure Tfrm_duplica_ct_contabil_gerencial.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_duplica_ct_contabil_gerencial do
  begin
    if qry_ct_contabil_.Active then qry_ct_contabil_.Close;
    if qry_meses_.Active       then qry_meses_.Close;
    Free;
  end;
  Action := cafree;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_duplica_ct_contabil_gerencial, datm_duplica_ct_contabil_gerencial );
end;

procedure Tfrm_duplica_ct_contabil_gerencial.msk_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := msk_cd_acesso.Text;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.msk_cd_auxEnter(
  Sender: TObject);
begin
  cd_aux := msk_cd_aux.Text;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.msk_cd_acessoExit(
  Sender: TObject);
begin
  if msk_cd_acesso.Text = cd_acesso then Exit;
  with datm_duplica_ct_contabil_gerencial do
  begin
    if ( Trim( msk_cd_acesso.Text ) <> '' ) and ( Trim( msk_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( msk_cd_acesso.Text ) + Trim( msk_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        msk_cd_ct_contabil.Text := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
        msk_cd_ct_contabilExit(nil);
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.msk_cd_auxExit(
  Sender: TObject);
begin
  if msk_cd_aux.Text = cd_aux then Exit;
  with datm_duplica_ct_contabil_gerencial do
  begin
    if ( Trim( msk_cd_acesso.Text ) <> '' ) and ( Trim( msk_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( msk_cd_acesso.Text ) + Trim( msk_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        msk_cd_ct_contabil.Text := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
        msk_cd_ct_contabilExit(nil);
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.msk_cd_mesExit(
  Sender: TObject);
begin
  edt_nm_mes.Clear;
  if Trim( msk_cd_mes.Text ) = '' then
  begin
    edt_nm_mes.Text := '';
    Exit;
  end;

  ValCodEdt(msk_cd_mes);

  with datm_duplica_ct_contabil_gerencial.qry_meses_ do
  begin
    ParamByName('CD_MES').AsString := msk_cd_mes.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Mês não encontrado!', 2);
      msk_cd_mes.Clear;
      edt_nm_mes.Clear;
      msk_cd_mes.SetFocus;
    end
    else edt_nm_mes.Text:= FieldByName('NM_MES').AsString;
    Close;
  end;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.msk_cd_ct_contabilKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_ct_contabil then btn_co_ct_contabilClick(nil);
    if Sender = msk_cd_mes         then btn_co_mesClick(nil);
  end;
end;

procedure Tfrm_duplica_ct_contabil_gerencial.btn_co_mesClick(
  Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TMESES', msk_cd_mes, 'Meses', 36, '' );
  msk_cd_mesExit(nil);
end;

end.
