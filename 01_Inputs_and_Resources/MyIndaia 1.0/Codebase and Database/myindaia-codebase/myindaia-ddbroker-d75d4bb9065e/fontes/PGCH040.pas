unit PGCH040;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Funcoes;

type
  Tfrm_sel_data_proc = class(TForm)
    Panel1: TPanel;
    lbl_data: TLabel;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    crp_Relacao: TCrpe;
    msk_data: TDateTimePicker;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    str_cd_relatorio : String;
    { Public declarations }
  end;

var
  frm_sel_data_proc: Tfrm_sel_data_proc;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, GSMLIB, PGCH014, PGCH041, PGGP015, PGFT010, PGSM136;

procedure Tfrm_sel_data_proc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_data_proc.btn_imprimirClick(Sender: TObject);
begin
  if ( msk_data.Date = 0 ) and ( Trim( msk_nr_processo.Text ) = '' ) then
  begin
    BoxMensagem( 'Informe uma data para seleção ou um processo!', 2 );
    msk_data.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_Relacao do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    ReportName  := cDir_Rpt + '\CRGI018.RPT';
    ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) + ' ]';

    if alltrim(msk_nr_processo.Text) <> '' then
      msk_data.Date := StrToDate( '01/01/' + FormatDateTime( 'yy', dt_server ) );
    Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_data.Date ) );
    Formulas[1] := 'Processo    = "'+ str_cd_unid_neg + str_cd_produto + msk_nr_processo.Text + '"';
    if alltrim(msk_nr_processo.Text) <> '' then
      Formulas[2] := 'Verifica = "P"'
    else
      Formulas[2] := 'Verifica = "D"';

    Execute;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_data_proc.FormShow(Sender: TObject);
begin
  msk_data.Date := dt_server;
end;

procedure Tfrm_sel_data_proc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  crp_Relacao.Free;
  Action := caFree;
end;


procedure Tfrm_sel_data_proc.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := str_cd_unid_neg;
  frm_consulta_processo.str_cd_prod := str_cd_produto;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy(frm_consulta_processo.Nr_Processo,5,14);
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_sel_data_proc.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_sel_data_proc do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := str_cd_unid_neg + str_cd_produto +
                                                           msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        msk_nr_processo.Text := '';
        BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_sel_data_proc.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_nr_processo then btn_co_processoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;


procedure Tfrm_sel_data_proc.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Recebimento}
  Application.CreateForm( Tdatm_sel_data_proc, datm_sel_data_proc );
end;

procedure Tfrm_sel_data_proc.DateTimePicker1Change(Sender: TObject);
begin
  if msk_data.Date <> 0 then
  begin
    msk_nr_processo.Enabled := False;
    btn_co_processo.Enabled := False;
  end
  else
  begin
    msk_nr_processo.Enabled := True;
    btn_co_processo.Enabled := True;
  end;
end;

end.
