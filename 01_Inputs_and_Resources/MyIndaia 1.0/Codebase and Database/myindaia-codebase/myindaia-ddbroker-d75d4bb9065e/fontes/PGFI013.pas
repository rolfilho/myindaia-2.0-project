unit PGFI013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, Funcoes;

type
  Tfrm_sel_moeda_periodo = class(TForm)
    Panel1: TPanel;
    msk_dt_inicio: TMaskEdit;
    btn_imprimir: TButton;
    btn_sair: TButton;
    crp_moeda_periodo: TCrpe;
    lbl_periodo: TLabel;
    msk_dt_fim: TMaskEdit;
    lbl_a: TLabel;
    lbl_cd_moeda: TLabel;
    msk_cd_moeda: TMaskEdit;
    edt_nm_moeda: TEdit;
    btn_cd_moeda: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_moedaExit(Sender: TObject);
    procedure msk_cd_moedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_moedaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
     str_cd_relatorio : String[1];
  end;

var
  frm_sel_moeda_periodo: Tfrm_sel_moeda_periodo;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGFI014, PGSM048;

procedure Tfrm_sel_moeda_periodo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_moeda_periodo.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then StrToDate(msk_dt_inicio.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_inicio.Clear;
    end;
  end;
end;

procedure Tfrm_sel_moeda_periodo.msk_dt_fimExit(Sender: TObject);
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

procedure Tfrm_sel_moeda_periodo.btn_imprimirClick(Sender: TObject);
begin
  if str_cd_relatorio = '1' then
  begin
    if ( msk_cd_moeda.Text = '' ) or
       ( edt_nm_moeda.Text = '' ) then
    begin
      BoxMensagem( 'Informe a Tabela de Juros!', 2 );
      msk_cd_moeda.SetFocus;
      Exit;
    end;
  end;

  if msk_dt_inicio.Text = '  /  /    ' then
  begin
    BoxMensagem( 'Informe a data de início!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if ( msk_dt_fim.Text = '  /  /    ' ) then
  begin
    BoxMensagem( 'Informe a data final!', 2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_moeda_periodo, datm_sel_moeda_periodo do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    case StrToInt(str_cd_relatorio ) of
      1: ReportName  := cDir_Rpt + '\CRFI012.RPT';
    end;
    if str_cd_relatorio = '1' then
    begin
      CloseStoredProc( sp_fin_gera_tab_juros );
      sp_fin_gera_tab_juros                  .ParamByName('@cd_unid_neg').AsString    := 'X';
      sp_fin_gera_tab_juros.ParamByName('@cd_produto').AsString     := 'X';
      sp_fin_gera_tab_juros.ParamByName('@cd_grupo').AsString       := 'X';
      sp_fin_gera_tab_juros.ParamByName('@cd_cliente').AsString     := 'X';
      sp_fin_gera_tab_juros.ParamByName('@dt_atual').AsDateTime     := StrToDate( msk_dt_inicio.Text );
      sp_fin_gera_tab_juros.ParamByName('@dt_final').AsDateTime     := StrToDate( msk_dt_fim.Text );
      sp_fin_gera_tab_juros.ParamByName('@cd_moeda_juros').AsString := msk_cd_moeda.Text;
      sp_fin_gera_tab_juros.ParamByName('@in_rel_reemb').AsString   := '0';
      ExecStoredProc( sp_fin_gera_tab_juros );
      CloseStoredProc( sp_fin_gera_tab_juros );

      if msk_dt_inicio.Text = msk_dt_fim.Text then
         ReportTitle := Caption + ' - ' + msk_dt_inicio.Text
      else
         ReportTitle := Caption + ' - De ' + msk_dt_inicio.Text + ' a ' + msk_dt_fim.Text;

      Formulas[0] := 'MoedaJuros = "'   + msk_cd_moeda.Text + '"';
    end;
    Execute;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_moeda_periodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_sel_moeda_periodo.Free;
  crp_moeda_periodo.Free;
  Action := caFree;
end;

procedure Tfrm_sel_moeda_periodo.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_sel_moeda_periodo, datm_sel_moeda_periodo);
end;

procedure Tfrm_sel_moeda_periodo.msk_cd_moedaExit(Sender: TObject);
begin
  if msk_cd_moeda.Text <> '' then
  begin
    ValCodEdt( msk_cd_moeda );
    with datm_sel_moeda_periodo do
    begin
      qry_moeda_.Close;
      qry_moeda_.SQL[2] := 'WHERE CD_MOEDA = "' + msk_cd_moeda.Text + '"';
      qry_moeda_.Prepare;
      qry_moeda_.Open;
      if Not qry_moeda_.EOF then
      begin
        edt_nm_moeda.Text := qry_moeda_.FieldByName('NM_MOEDA').AsString;
      end
      else
      begin
        BoxMensagem( 'Moeda não cadastrada!', 2 );
        msk_cd_moeda.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_moeda.Text := '';
  end;
end;

procedure Tfrm_sel_moeda_periodo.msk_cd_moedaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_moeda then btn_cd_moedaClick(nil);
  end;
end;

procedure Tfrm_sel_moeda_periodo.btn_cd_moedaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_moeda.Text := frm_moeda.Cons_OnLine_Texto;
    msk_cd_moedaExit(nil);
    if ( frm_moeda.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_moeda.Text := frm_moeda.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_moedaExit(nil);
end;

procedure Tfrm_sel_moeda_periodo.FormShow(Sender: TObject);
begin
  case StrToInt( str_cd_relatorio ) of
    1: begin
         Caption := 'Tabela de Juros';
         msk_dt_fim.Text := FormatDateTime( 'dd/mm/yyyy', Date );
       end;
  end;
  msk_cd_moeda.SetFocus;
end;

end.
