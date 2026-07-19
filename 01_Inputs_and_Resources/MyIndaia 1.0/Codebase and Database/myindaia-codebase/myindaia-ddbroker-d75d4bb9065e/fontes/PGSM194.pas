 unit PGSM194;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, UCRPE32, Funcoes;

type
  Tfrm_rel_extrato_cc = class(TForm)
    Panel1: TPanel;
    btn_imprimir: TButton;
    btn_sair: TButton;
    lbl_coligada: TLabel;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    btn_co_coligada: TSpeedButton;
    lbl_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_co_banco: TSpeedButton;
    edt_nm_banco: TEdit;
    msk_cd_banco: TMaskEdit;
    lbl_banco: TLabel;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    msk_dt_inicio: TMaskEdit;
    msk_dt_fim: TMaskEdit;
    crp_extrato_cc: TCrpe;
    rd_conc: TRadioGroup;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_coligadaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_coligadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure rd_concExit(Sender: TObject);
  private
    { Private declarations }
  public
    str_cd_relatorio : String;
    { Public declarations }
  end;

var
  frm_rel_extrato_cc: Tfrm_rel_extrato_cc;
  conciliado : String;

implementation

{$R *.DFM}
uses GSMLIB, PGGP001, PGGP017, PGSM195, PGSM041, PGSM018, PGSM096, PGSM148;

procedure Tfrm_rel_extrato_cc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_extrato_cc.btn_imprimirClick(Sender: TObject);
var nr_identificador: Integer;
begin
  nr_identificador := 0;

  if str_cd_relatorio = '1' then
  begin
    if Trim(msk_cd_coligada.Text) = '' then
    begin
      BoxMensagem('Informe uma Empresa Coligada!', 2);
      msk_cd_coligada.SetFocus;
      Exit;
    end;

    if (Trim(msk_cd_unid_neg.Text) = '') and (str_cd_relatorio <> '1') then
    begin
      BoxMensagem('Informe uma Unidade de Negócio!', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if Trim(msk_cd_banco.Text) = '' then
    begin
      BoxMensagem('Informe uma Conta Bancária!', 2);
      msk_cd_banco.SetFocus;
      Exit;
    end;

    if msk_dt_inicio.Text = '  /  /    ' then
    begin
      BoxMensagem('Informe a data de início!', 2);
      msk_dt_inicio.SetFocus;
      Exit;
    end;

    if ( msk_dt_fim.Text = '  /  /    ' ) then
    begin
      BoxMensagem('Informe a data final!', 2);
      msk_dt_fim.SetFocus;
      Exit;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with datm_rel_extrato_cc do
  begin
    if str_cd_relatorio = '1' then // Faturamento
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_rel_extrato_cc);
        sp_rel_extrato_cc.ParamByName('@CD_COLIGADA').AsString := msk_cd_coligada.Text;
        sp_rel_extrato_cc.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        sp_rel_extrato_cc.ParamByName('@CD_BANCO').AsString    := msk_cd_banco.Text;
        sp_rel_extrato_cc.ParamByName('@DT_INICIO').AsString   := msk_dt_inicio.Text;
        sp_rel_extrato_cc.ParamByName('@DT_FIM').AsString      := msk_dt_fim.Text;
        sp_rel_extrato_cc.ParamByName('@IN_CONCILIACAO').AsString := conciliado;
        ExecStoredProc(sp_rel_extrato_cc);
        nr_identificador := sp_rel_extrato_cc.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_rel_extrato_cc);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_extrato_cc do
  begin
//    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER'; //by carlos - logar com SA - 06/12/2011
    Connect := 'DSN=BROKER; UID=sa; PWD=123; DSQ=BROKER';
    if str_cd_relatorio = '1' then
    begin
      ReportName  := cDir_Rpt + '\CRFI009.RPT';
      if conciliado = '0' then
        ReportTitle := 'Relatório de Itens Não Conciliados'
      else if conciliado = '2' then
        ReportTitle := 'Relatório de Itens Conciliados'
      else ReportTitle := 'Relatório Extrato de Conta Corrente';
      ParamFields[0] := Trim( IntToStr( nr_identificador ) );
      Execute;
    end;
    ApagaDados( 'TREL_EXTRATO_CC', nr_identificador );
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_rel_extrato_cc.msk_cd_coligadaExit(Sender: TObject);
begin
  if msk_cd_coligada.Text <> '' then
  begin
    ValCodEdt( msk_cd_coligada );
    with datm_rel_extrato_cc do
    begin
      qry_coligada_.Close;
      qry_coligada_.SQL[2] := 'WHERE CD_COLIGADA = "' + msk_cd_coligada.Text + '"';
      qry_coligada_.Prepare;
      qry_coligada_.Open;
      if qry_coligada_.RecordCount > 0 then
      begin
        edt_nm_coligada.Text := qry_coligada_NM_COLIGADA.AsString;
      end
      else
      begin
        BoxMensagem('Empresa Coligada não cadastrada!', 2);
        msk_cd_coligada.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_coligada.Text := '';
  end;
end;

procedure Tfrm_rel_extrato_cc.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Text := FormatDateTime( 'dd/mm/yyyy', dt_server );
  msk_dt_fim.Text    := FormatDateTime( 'dd/mm/yyyy', dt_server );
  // Inicializa o Data Module
  Application.CreateForm( Tdatm_rel_extrato_cc, datm_rel_extrato_cc );

  if str_cd_relatorio = '1' then
  begin
    Caption := 'Relatório Extrato de Conta Corrente';
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_coligada.Text := '01';
    msk_cd_coligadaExit(nil);
    msk_cd_banco.SetFocus
  end;
  conciliado := '3';
end;

procedure Tfrm_rel_extrato_cc.btn_co_coligadaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 14;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TCOLIGADA';

  datm_consulta_padrao.Tabela.Filtered     := False;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := True; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' Contas Contábeis ';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_coligada.Text := frm_consulta_padrao.Cons_OnLine_Texto;
  msk_cd_coligadaExit(msk_cd_coligada);

end;

procedure Tfrm_rel_extrato_cc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_rel_extrato_cc do
  begin
    if str_cd_relatorio = '1' then qry_coligada_.Close;
    Free;
  end;
  crp_extrato_cc.Free;
  Action := caFree;
end;

procedure Tfrm_rel_extrato_cc.msk_cd_coligadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_coligada then btn_co_coligadaClick(nil);
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_banco    then btn_co_bancoClick(nil);
  end;
end;

procedure Tfrm_rel_extrato_cc.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_rel_extrato_cc do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
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
      msk_cd_unid_negExit(Sender);
    end;
  end;
end;

procedure Tfrm_rel_extrato_cc.btn_co_bancoClick(Sender: TObject);
begin
  with datm_rel_extrato_cc do
  begin
    Application.CreateForm(Tfrm_banco, frm_banco );
    with frm_banco do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_banco.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_banco.Text := frm_banco.Cons_OnLine_Texto;
      msk_cd_bancoExit(Sender);
    end;
  end;
end;

procedure Tfrm_rel_extrato_cc.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.text = '' then
  begin
    edt_nm_unid_neg.Text := '';
  end
  else
  begin
    ValCodEdt( msk_cd_unid_neg );
    if msk_cd_unid_neg.Text <> '' then
    begin
      with datm_rel_extrato_cc do
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;
        if qry_unid_neg_.RecordCount > 0 then
        begin
          edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        end
        else
        begin
          BoxMensagem('Unidade de Negócio não cadastrada!', 2);
          msk_cd_unid_neg.SetFocus;
        end
      end;
    end
  end;
end;

procedure Tfrm_rel_extrato_cc.msk_cd_bancoExit(Sender: TObject);
begin
  if msk_cd_banco.Text = '' then
  begin
    edt_nm_banco.Text := '';
  end
  else
  begin
    ValCodEdt( msk_cd_banco );
    if msk_cd_banco.Text <> '' then
    begin
      with datm_rel_extrato_cc do
      begin
        qry_banco_.Close;
        qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
        qry_banco_.Prepare;
        qry_banco_.Open;
        if qry_banco_.RecordCount > 0 then
        begin
          edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
        end
        else
        begin
          BoxMensagem('Banco não cadastrado!', 2);
          msk_cd_banco.SetFocus;
        end
      end;
    end
  end;
end;


procedure Tfrm_rel_extrato_cc.rd_concExit(Sender: TObject);
begin
  case rd_conc.ItemIndex of
   0 : conciliado := '2';   // Conciliado
   1 : conciliado := '0';   // Não Conciliado
   2 : conciliado := '3';   // Todos
  end;

end;

end.
