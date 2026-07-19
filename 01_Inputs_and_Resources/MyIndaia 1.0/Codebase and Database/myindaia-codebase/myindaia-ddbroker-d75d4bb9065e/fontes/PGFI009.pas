unit PGFI009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ToolEdit, DBTables, Funcoes;

type
  Tfrm_sel_col_periodo = class(TForm)
    Panel1: TPanel;
    btn_imprimir: TButton;
    btn_sair: TButton;
    crp_col_periodo: TCrpe;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cd_coligada: TLabel;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    btn_cd_coligada: TSpeedButton;
    Label1: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    Label3: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid: TSpeedButton;
    btn_co_prod: TSpeedButton;
    msk_dt_inicio: TDateEdit;
    msk_dt_fim: TDateEdit;
    qry_coligada_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure msk_cd_coligadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_coligadaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unidClick(Sender: TObject);
    procedure btn_co_prodClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
     str_cd_relatorio : String[1];
     //  1 - Relação de Pagamentos com retenção de IR
     //  2 - Relação de Contas a Pagar
     //  3 - Relação de Pagamentos Liberados
  end;

var
  frm_sel_col_periodo: Tfrm_sel_col_periodo;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM096, PGSM148, PGSM018, PGSM010, ConsOnLineEx;


procedure Tfrm_sel_col_periodo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_col_periodo.msk_dt_fimExit(Sender: TObject);
begin
  try
    if msk_dt_fim.Text <> '  /  /    ' then StrToDate(msk_dt_fim.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_fim.Clear;
    end;
  end;
end;

procedure Tfrm_sel_col_periodo.btn_imprimirClick(Sender: TObject);
begin
  if str_cd_relatorio = '1' then
  begin
    if ( msk_cd_coligada.Text = '' ) or
       ( edt_nm_coligada.Text = '' ) then
    begin
      BoxMensagem('Informe a Coligada!', 2);
      msk_cd_coligada.SetFocus;
      Exit;
    end;
  end;

  if ( msk_dt_inicio.Text = '  /  /    ' ) and ( str_cd_relatorio <> '2' ) then
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

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_col_periodo do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    case StrToInt(str_cd_relatorio ) of
      1: ReportName  := cDir_Rpt + '\CRFI008.RPT';
      2: ReportName  := cDir_Rpt + '\CRCT001.RPT';
      3: ReportName  := cDir_Rpt + '\CRCT002.RPT';
    end;
    if str_cd_relatorio = '1' then
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      Formulas[0]    := 'CD_COLIGADA    = "' + msk_cd_coligada.Text + '"';
      Formulas[1]    := 'Periodo_inicio = '  + DataCrystal(msk_dt_inicio.Text);
      Formulas[2]    := 'Periodo_fim    = '  + DataCrystal(msk_dt_fim.Text);
      Formulas[3]    := 'Unidade        = "'  + msk_cd_unid_neg.Text + '"';
      Formulas[4]    := 'Produto        = "'  + msk_cd_produto.Text  + '"';
    end
    else if str_cd_relatorio = '2' then
    begin
      Formulas[0] := 'Unidade = "' + msk_cd_unid_neg.Text + '"';
      if ( msk_dt_inicio.Text <> '  /  /    ' ) then
        Formulas[1]  := 'DataInicial = ' + DataCrystal( msk_dt_inicio.Text )
      else
        Formulas[1]  := 'DataInicial = ' + DataCrystal( '01/01/1900' );

      Formulas[2] := 'DataFinal = ' + DataCrystal(msk_dt_fim.Text);

      if msk_dt_inicio.Text = msk_dt_fim.Text then
        ReportTitle := Caption + ' - ' + msk_dt_inicio.Text
      else
        ReportTitle := Caption + ' - De ' + msk_dt_inicio.Text + ' a ' + msk_dt_fim.Text;
    end
    Else
    Begin
      Formulas[0] := 'Coligada = "'   + msk_cd_coligada.Text + '"';
      Formulas[1] := 'DataInicial = ' + DataCrystal( msk_dt_inicio.Text );
      Formulas[2] := 'DataFinal = '   + DataCrystal(msk_dt_fim.Text);
      Formulas[3] := 'Unidade   = "'  + msk_cd_unid_neg.Text + '"';
    End;
    Execute;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_col_periodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_col_periodo.Free;
  Action := caFree;
end;

procedure Tfrm_sel_col_periodo.FormCreate(Sender: TObject);
begin
  msk_cd_coligada.Text := str_cd_coligada;
  msk_cd_coligadaExit(nil);
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_sel_col_periodo.msk_cd_coligadaExit(Sender: TObject);
begin
  if msk_cd_coligada.Text <> '' then
  begin
    ValCodEdt( msk_cd_coligada );
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
  end
  else
  begin
    edt_nm_coligada.Text := '';
  end;
end;

procedure Tfrm_sel_col_periodo.msk_cd_coligadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unidClick(btn_co_unid);
    if Sender = msk_cd_produto  then btn_co_prodClick(btn_co_prod);
    if Sender = msk_cd_coligada then btn_cd_coligadaClick(btn_cd_coligada);
  end;
end;

procedure Tfrm_sel_col_periodo.btn_cd_coligadaClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    msk_cd_coligada.Text := ConsultaOnLineEx('TCOLIGADA','Coligada',['CD_COLIGADA','NM_COLIGADA'],['Código','Descrição'],'CD_COLIGADA',nil)
  Else
    edt_nm_coligada.Text := ConsultaLookUP('TCOLIGADA','CD_COLIGADA', msk_cd_coligada.Text,'NM_COLIGADA');
end;

procedure Tfrm_sel_col_periodo.FormShow(Sender: TObject);
begin
  case StrToInt(str_cd_relatorio) of
    1:
    begin
      Caption := 'Relação de Pagamentos com retenção de IR';
      Label1.Visible          := True;
      msk_cd_unid_neg.Visible := True;
      edt_nm_unid_neg.Visible := True;
      btn_co_unid.Visible     := True;
      Label3.Visible          := True;
      msk_cd_produto.Visible  := True;
      edt_nm_produto.Visible  := True;
      btn_co_prod.Visible     := True;
    end;
    2:
    begin
      Caption := 'Relação de Contas a Pagar';
      lbl_cd_coligada.Visible := False;
      msk_cd_coligada.Visible := False;
      edt_nm_coligada.Visible := False;
      btn_cd_coligada.Visible := False;
      Label1.Visible          := True;
      msk_cd_unid_neg.Visible := True;
      edt_nm_unid_neg.Visible := True;
      btn_co_unid.Visible     := True;
      lbl_periodo.Top     := lbl_periodo.Top - 87;
      msk_dt_inicio.Top   := msk_dt_inicio.Top - 87;
      lbl_a.Top           := lbl_a.Top - 87;
      msk_dt_fim.Top      := msk_dt_fim.Top - 87;
    end;
    3:
    begin
      Caption := 'Relação de Pagamentos Liberados';
      Label1.Visible          := True;
      msk_cd_unid_neg.Visible := True;
      edt_nm_unid_neg.Visible := True;
      btn_co_unid.Visible     := True;
      lbl_cd_coligada.Top     := lbl_cd_coligada.Top - 43;
      msk_cd_coligada.Top     := msk_cd_coligada.Top - 43;
      edt_nm_coligada.Top     := edt_nm_coligada.Top - 43;
      btn_cd_coligada.Top     := btn_cd_coligada.Top - 43;
      lbl_periodo.Top         := lbl_periodo.Top - 43;
      msk_dt_inicio.Top       := msk_dt_inicio.Top - 43;
      lbl_a.Top               := lbl_a.Top - 43;
      msk_dt_fim.Top          := msk_dt_fim.Top - 43;
    end;
  end;
end;


procedure Tfrm_sel_col_periodo.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with qry_unidade_ do
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

procedure Tfrm_sel_col_periodo.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  With qry_produto_ do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
    end
    else edt_nm_produto.Text:= FieldByName('NM_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_col_periodo.btn_co_unidClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'NM_UNID_NEG')
end;

procedure Tfrm_sel_col_periodo.btn_co_prodClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto)
  Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_sel_col_periodo.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

end.
