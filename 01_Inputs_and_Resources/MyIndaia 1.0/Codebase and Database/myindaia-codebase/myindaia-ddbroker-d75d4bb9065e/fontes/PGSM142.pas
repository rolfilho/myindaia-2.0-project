unit PGSM142;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, UCRPE32, Funcoes;

type
  Tfrm_sel_col_data = class(TForm)
    Panel1: TPanel;
    lbl_data: TLabel;
    msk_data: TMaskEdit;
    btn_recontab: TButton;
    btn_sair: TButton;
    lbl_coligada: TLabel;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    btn_co_coligada: TSpeedButton;
    lbl_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    lbl_produto: TLabel;
    lbl_data_fim: TLabel;
    msk_data_fim: TMaskEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_recontabClick(Sender: TObject);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_coligadaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_coligadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
  private
    { Private declarations }
  public
    str_cd_relatorio : String;
    { Public declarations }
  end;

var
  frm_sel_col_data: Tfrm_sel_col_data;

implementation

{$R *.DFM}
uses GSMLIB, PGGP001, PGGP017, PGSM143, PGSM010, PGSM018, PGSM096, PGSM148;

procedure Tfrm_sel_col_data.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_col_data.btn_recontabClick(Sender: TObject);
begin
  if msk_data.Text = '  /  /    ' then
  begin
    if msk_data_fim.Visible then
      BoxMensagem('Informe uma data inicial para seleção!', 2)
    else
      BoxMensagem('Informe uma data para seleção!', 2);
    msk_data.SetFocus;
    Exit;
  end;

  if msk_data_fim.Visible then
  begin
    if msk_data_fim.Text = '  /  /    ' then
    begin
      BoxMensagem('Informe uma data final para seleção!', 2);
      msk_data.SetFocus;
      Exit;
    end;
  end;

  if Trim(msk_cd_unid_neg.Text) = '' then
  begin
    BoxMensagem('Informe uma Unidade de Negócio!', 2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if str_cd_relatorio = '1' then
  begin
    if Trim(msk_cd_produto.Text) = '' then
    begin
      BoxMensagem('Informe um Produto!', 2);
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end;

  if str_cd_relatorio = '2' then
  begin
    if msk_cd_coligada.Visible then
    begin
      if Trim( msk_cd_coligada.Text ) = '' then
      begin
        BoxMensagem( 'Informe uma Empresa Coligada!', 2 );
        msk_cd_coligada.SetFocus;
        Exit;
      end;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with datm_sel_col_data do
  begin
    if str_cd_relatorio = '1' then {Faturamento}
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_contabiliza_si);
        sp_contabiliza_si.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        sp_contabiliza_si.ParamByName('@CD_PRODUTO').AsString  := msk_cd_produto.Text;
        sp_contabiliza_si.ParamByName('@DT_INICIO').AsDate     := StrToDate(msk_data.Text);
        sp_contabiliza_si.ParamByName('@DT_FIM').AsDate        := StrToDate(msk_data_fim.Text);
        sp_contabiliza_si.ParamByName('@TP_CONTAB').AsString   := 'F';
        sp_contabiliza_si.ParamByName('@CD_USUARIO').AsString  := str_cd_usuario;
        ExecStoredProc(sp_contabiliza_si);
        //ContabilizaSI( qry_contab_si_, qry_contab_lanc_si_, sp_contabiliza_contmaster.ParamByName('@NR_CONT').AsString );
        CloseStoredProc(sp_contabiliza_si);

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end
    else if str_cd_relatorio = '2' then {Financeiro}
    begin
      try
        Screen.Cursor := crHourGlass;
        datm_main.db_broker.StartTransaction;

        CloseStoredProc(sp_contabiliza_si);
        sp_contabiliza_si.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        sp_contabiliza_si.ParamByName('@DT_INICIO').AsDate     := StrToDate(msk_data.Text);
        sp_contabiliza_si.ParamByName('@DT_FIM').AsDate        := StrToDate(msk_data_fim.Text);
        sp_contabiliza_si.ParamByName('@TP_CONTAB').AsString   := 'C';
        sp_contabiliza_si.ParamByName('@CD_USUARIO').AsString  := str_cd_usuario;
        ExecStoredProc(sp_contabiliza_si);
        //ContabilizaSI( qry_contab_si_, qry_contab_lanc_si_, sp_contabiliza_si.ParamByName('@NR_CONT').AsString );
        CloseStoredProc(sp_contabiliza_si);
        datm_main.db_broker.Commit;

        qry_limpa_si_.Close;
        qry_limpa_si_.ParamByName('DT_INICIO').AsDate   := StrToDate(msk_data.Text);
        qry_limpa_si_.ParamByName('DT_FIM').AsDate      := StrToDate(msk_data_fim.Text);
        qry_limpa_si_.Prepare;
        qry_limpa_si_.ExecSQL;

        Screen.Cursor := crDefault;
        BoxMensagem( 'Integração realizada com sucesso!', 3 );
      except
        on E: Exception do
        begin
          Screen.Cursor := crDefault;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_col_data.msk_cd_coligadaExit(Sender: TObject);
begin
  if msk_cd_coligada.Text <> '' then
  begin
    ValCodEdt( msk_cd_coligada );
    with datm_sel_col_data do
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

procedure Tfrm_sel_col_data.FormShow(Sender: TObject);
begin
  with datm_sel_col_data do
  begin
    { Inicializa o Data Module}
    Application.CreateForm( Tdatm_sel_col_data, datm_sel_col_data );
    if str_cd_relatorio = '1' then
    begin
      Caption := 'Recontabiliza Faturamento';
      lbl_coligada.Visible    := False;
      msk_cd_coligada.Visible := False;
      edt_nm_coligada.Visible := False;
      btn_co_coligada.Visible := False;

      lbl_produto.Visible     := True;
      msk_cd_produto.Visible  := True;
      edt_nm_produto.Visible  := True;
      btn_co_produto.Visible  := True;

      msk_cd_unid_neg.Text   := str_cd_unid_neg;
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text    := str_cd_produto;
      msk_cd_produtoExit(nil);

      lbl_data.Caption     := 'Início';
      lbl_data_fim.Visible := True;
      msk_data_fim.Visible := True;
    end
    else
    begin
      Caption := 'Recontabiliza Financeiro';

      lbl_produto.Visible     := False;
      msk_cd_produto.Visible  := False;
      edt_nm_produto.Visible  := False;
      btn_co_produto.Visible  := False;

      lbl_coligada.Visible    := False;
      msk_cd_coligada.Visible := False;
      edt_nm_coligada.Visible := False;
      btn_co_coligada.Visible := False;
      msk_cd_coligada.Text    := '01';
      msk_cd_coligadaExit(nil);

      lbl_data.Caption     := 'Início';
      lbl_data_fim.Visible := True;
      msk_data_fim.Visible := True;
    end;

    msk_cd_unid_neg.Text   := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
  end;
end;

procedure Tfrm_sel_col_data.btn_co_coligadaClick(Sender: TObject);
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

procedure Tfrm_sel_col_data.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_sel_col_data do
  begin
    if str_cd_relatorio = '1' then qry_coligada_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sel_col_data.msk_cd_coligadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_coligada then btn_co_coligadaClick(nil);
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_sel_col_data.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_col_data do
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

procedure Tfrm_sel_col_data.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_col_data do
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
      msk_cd_produtoExit(Sender);
    end;
  end;
end;

procedure Tfrm_sel_col_data.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
  end
  else
  begin
    ValCodEdt( msk_cd_unid_neg );
    if msk_cd_unid_neg.Text <> '' then
    begin
      with datm_sel_col_data do
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

procedure Tfrm_sel_col_data.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.text = '' then
  begin
    edt_nm_produto.Text := '';
  end
  else
  begin
    ValCodEdt( msk_cd_produto );
    if msk_cd_produto.Text <> '' then
    begin
      with datm_sel_col_data do
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
          msk_cd_produto.SetFocus;
        end
      end;
    end
  end;
end;


end.
