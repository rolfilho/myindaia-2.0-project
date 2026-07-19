unit PGCH009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, ExtCtrls, Buttons, Db, DBTables, ComCtrls, Funcoes;

type
  Tfrm_sel_data = class(TForm)
    Panel1: TPanel;
    lbl_data: TLabel;
    btn_imprimir: TButton;
    crp_Relacao: TCrpe;
    btn_sair: TButton;
    lbl_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid: TSpeedButton;
    btn_co_prod: TSpeedButton;
    qry_unidade_: TQuery;
    qry_produto_: TQuery;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    msk_data: TDateTimePicker;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_unidClick(Sender: TObject);
    procedure btn_co_prodClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    str_cd_relatorio : String;
    nr_proc_di       : String[18];
    nr_proc_da       : String[18];
    nr_proc_nac      : String[18];
    { 1 e 8 excluídos }
    {16 - Cálculo da DI}
    {17 - Cálculo da DA}
    {18 - Cálculo da Nacionalização}
    { Public declarations }
  end;

var
  frm_sel_data: Tfrm_sel_data;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, GSMLIB, PGCH014, PGSM018, PGSM010, PGCH041;

procedure Tfrm_sel_data.btn_sairClick(Sender: TObject);
begin
  //Close;
  // Comentado acima e utilizando abaixo para haver um retorno - Michel - 11/07/2011
  ModalResult := mrCancel;
end;

procedure Tfrm_sel_data.btn_imprimirClick(Sender: TObject);
begin
  if msk_data.Date = 0 then
  begin
    BoxMensagem('Informe uma data para seleção!', 2);
    msk_data.SetFocus;
    Exit;
  end;

  if str_cd_relatorio = '2' then
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRNM002.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '3' then {Financeiro - Relação de Cheques}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRFI002.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'Selecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '4' then {Financeiro - Relação de Débitos em Conta}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRFI003.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'Selecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '5' then {Cheque em Branco - Relação de Prestados Conta}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRLQ009.RPT';
      Formulas[0] := 'Dt_Baixa = ' + DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '6' then {Diário Auxiliar}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      ReportName  := cDir_Rpt + '\CRFI005.RPT';
      Formulas[0] := 'DataBase = ' + DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '7' then {Saldo Geral de Clientes}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRFT008.RPT';
      ReportTitle := Caption + ' em ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date );
      Formulas[0] := 'Data_Base = ' + DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '9' then {Relação de Taxas Cambiais}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRCD001.RPT';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '10' then {Relação de Liquidações - Totais}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRLQ001.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '11' then {Cópias de Cheque}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRPG001.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Formulas[1] := 'UnidNeg = "'+ Trim( msk_cd_unid_neg.Text ) + '"';
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '12' then {Solicitações Feitas e Não Emitidas}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRPG003.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '13' then {Pagamentos Pendentes}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRPG004.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '  + DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Formulas[1] := 'cd_unid_neg = "' + msk_cd_unid_neg.Text + '"';
      Formulas[2] := 'cd_produto  = "' + msk_cd_produto.Text  + '"';
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '14' then {Solicitações Pendentes}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRGI018.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '15' then {Cópias de Cheque Administrativo}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRPG005.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
      Formulas[1] := 'UnidNeg = "'+ Trim( msk_cd_unid_neg.Text ) + '"';
      Execute;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '16' then {Cálculo da DI}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with datm_main do
    begin
      qry_atz_di_.Close;
      qry_atz_di_.ParamByName('NR_PROCESSO').AsString := nr_proc_di;
      qry_atz_di_.ParamByName('DT_CALCULO').AsDate    := msk_data.Date;
      qry_atz_di_.ExecSQL;
      qry_atz_di_.Close;
    end;
    Screen.Cursor := crDefault;
    //Close;
    // Comentado acima e utilizando abaixo para haver um retorno - Michel - 11/07/2011
    ModalResult := mrOk;
  end;

  if str_cd_relatorio = '17' then {Cálculo da DA}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with datm_main do
    begin
      qry_atz_da_.Close;
      qry_atz_da_.ParamByName('NR_PROCESSO').AsString := nr_proc_da;
      qry_atz_da_.ParamByName('DT_CALCULO').AsDate    := msk_data.Date;
      qry_atz_da_.ExecSQL;
      qry_atz_da_.Close;
    end;
    Screen.Cursor := crDefault;
    Close;
  end;

  if str_cd_relatorio = '18' then {Cálculo da Nacionalização}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with datm_main do
    begin
      qry_atz_nac_.Close;
      qry_atz_nac_.ParamByName('NR_PROCESSO').AsString := nr_proc_nac;
      qry_atz_nac_.ParamByName('DT_CALCULO').AsDate    := msk_data.Date;
      qry_atz_nac_.ExecSQL;
      qry_atz_nac_.Close;
    end;
    Screen.Cursor := crDefault;
    Close;
  end;
end;

procedure Tfrm_sel_data.FormShow(Sender: TObject);
begin
  msk_data.Date := dt_server;

  case StrToInt(str_cd_relatorio) of
    2: Caption := 'Relação de Recebimentos de Numerário - Totais';
    3: Caption := 'Financeiro - Relação de Cheques';
    4: Caption := 'Financeiro - Relação de Débitos em Conta';
    5: Caption := 'Impressão de Cheques em Branco Baixados';
    6: Caption := 'Diário Auxiliar';
    7: Caption := 'Saldo Geral dos Clientes';
    9: Caption  := 'Taxas Cambiais';
    10: Caption := 'Relação de Liquidações';
    11: begin
          Caption := 'Cópias de Cheque';
          lbl_unid_neg.Visible    := True;
          msk_cd_unid_neg.Visible := True;
          edt_nm_unid_neg.Visible := True;
          btn_co_unid.Visible     := True;
          msk_data.TabOrder       := msk_cd_unid_neg.TabOrder + 1;
          msk_cd_unid_neg.Text    := str_cd_unid_neg;
          msk_cd_unid_negExit(nil);
        end;
    12: Caption := 'Relação de Solicitações Feitas e Não Emitidas';
    13: begin
          Caption := 'Relação de Pagamentos Pendentes';
          lbl_data.Top            := lbl_data.Top + 50;
          msk_data.Top            := msk_data.Top + 50;
          lbl_unid_neg.Visible    := True;
          lbl_produto.Visible     := True;
          msk_cd_unid_neg.Visible := True;
          msk_cd_produto.Visible  := True;
          edt_nm_unid_neg.Visible := True;
          edt_nm_produto.Visible  := True;
          btn_co_unid.Visible     := True;
          btn_co_prod.Visible     := True;
          msk_data.TabOrder       := msk_cd_produto.TabOrder + 1;
        end;
    14: Caption := 'Minuta de Transporte';
    15: begin
          Caption := 'Cópias de Cheque Adm';
          lbl_unid_neg.Visible    := True;
          msk_cd_unid_neg.Visible := True;
          edt_nm_unid_neg.Visible := True;
          btn_co_unid.Visible     := True;
          msk_data.TabOrder       := msk_cd_unid_neg.TabOrder + 1;
          msk_cd_unid_neg.Text    := str_cd_unid_neg;
          msk_cd_unid_negExit(nil);
        end;
    16: begin
          Caption := 'Cálculo da DI';
          btn_imprimir.Caption := '&Calcular';
          btn_sair.Caption := 'C&ancelar';
        end;
    17: begin
          Caption := 'Cálculo da Pro Forma DA';
          btn_imprimir.Caption := '&Ok';
        end;
    18: begin
          Caption := 'Cálculo da Nacionalização';
          btn_imprimir.Caption := '&Ok';
        end;
  end;
  msk_data.SetFocus;
end;

procedure Tfrm_sel_data.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  crp_Relacao.Free;
  Action := caFree;
end;

procedure Tfrm_sel_data.btn_co_unidClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
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
    qry_unidade_.Close;
    qry_unidade_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
    if qry_unidade_.RecordCount > 0 then edt_nm_unid_neg.Text := qry_unidade_NM_UNID_NEG.AsString;
    qry_unidade_.Close;
  end;
end;

procedure Tfrm_sel_data.btn_co_prodClick(Sender: TObject);
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
  with qry_produto_ do
  begin
    Close;
    ParamByName('CD_PRODUTO').asString := msk_cd_produto.Text;
    Prepare;
    Open;
    edt_nm_produto.Text := FieldByName('NM_PRODUTO').asString
  end;
end;

procedure Tfrm_sel_data.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;
  ValCodEdt(msk_cd_unid_neg);
  with qry_unidade_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= FieldByName('NM_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_data.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_produto);
  with qry_produto_ do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Produto não encontrado!', 2 );
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
    end
    else edt_nm_produto.Text:= FieldByName('NM_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_data.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unidClick(nil);
    if Sender = msk_cd_produto  then btn_co_prodClick(nil);
  end;
end;

procedure Tfrm_sel_data.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_data_proc, datm_sel_data_proc);
end;

end.
