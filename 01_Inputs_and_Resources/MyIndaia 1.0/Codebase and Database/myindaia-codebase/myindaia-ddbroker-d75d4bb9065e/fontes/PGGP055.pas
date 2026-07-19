unit PGGP055;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, UCRPE32;

type
  Tfrm_rel_com_ind_por = class(TForm)
    Panel1: TPanel;
    msk_cd_indicado: TMaskEdit;
    msk_cd_depto: TMaskEdit;
    edt_nm_indicado: TEdit;
    edt_nm_depto: TEdit;
    btn_co_indicado: TSpeedButton;
    btn_co_depto: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    btn_imprimir: TButton;
    btn_cancelar: TButton;
    crp_rel_com_ind_por: TCrpe;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    procedure btn_cancelarClick(Sender: TObject);
    procedure msk_cd_indicadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_indicadoExit(Sender: TObject);
    procedure btn_co_deptoClick(Sender: TObject);
    procedure btn_co_indicadoClick(Sender: TObject);
    procedure msk_cd_deptoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_com_ind_por: Tfrm_rel_com_ind_por;

implementation

uses GSMLIB, PGGP056, PGSM234, PGSM232, PGGP001;

{$R *.DFM}

procedure Tfrm_rel_com_ind_por.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_com_ind_por.msk_cd_indicadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_indicado then btn_co_indicadoClick(nil) else
    if Sender = msk_cd_depto    then btn_co_deptoClick(nil);
  end;
end;

procedure Tfrm_rel_com_ind_por.msk_cd_indicadoExit(Sender: TObject);
begin
  if Trim( msk_cd_indicado.Text ) = '' then Exit;

  ValCodEdt( msk_cd_indicado );
  with datm_rel_com_ind_por do
  begin
    qry_indicado_.Close;
    qry_indicado_.ParamByName( 'CD_CLIENTE_INDICADO' ).AsString := Trim( msk_cd_indicado.Text );
    qry_indicado_.Prepare;
    qry_indicado_.Open;

    edt_nm_indicado.Text := qry_indicado_NM_CLIENTE_INDICADO.AsString;
    msk_cd_depto.Text    := qry_indicado_CD_DEPTO.AsString;
    msk_cd_deptoExit(nil);

    qry_indicado_.Close;
    qry_indicado_.UnPrepare;
  end;
end;

procedure Tfrm_rel_com_ind_por.btn_co_deptoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_depto, frm_depto );
  with frm_depto do
  begin
    Cons_OnLine_Texto := msk_cd_depto.Text;
    Caption           := Caption + ' [Consulta On-Line]';
    lCons_OnLine      := True;
    ShowModal;
    msk_cd_depto.Text := Cons_OnLine_Texto;
    lCons_OnLine := False;
  end;
  msk_cd_deptoExit(nil);
end;

procedure Tfrm_rel_com_ind_por.btn_co_indicadoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_cliente_indicado,frm_cliente_indicado );
  with frm_cliente_indicado do
  begin
    Cons_OnLine_Texto := msk_cd_indicado.Text;
    Caption           := Caption + ' [Consulta On-Line]';
    lCons_OnLine      := True;
    ShowModal;
    msk_cd_indicado.Text := Cons_OnLine_Texto;
    lCons_OnLine := False;
  end;
  msk_cd_indicadoExit(nil);
end;

procedure Tfrm_rel_com_ind_por.msk_cd_deptoExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_depto );
  with datm_rel_com_ind_por do
  begin
    qry_depto_.Close;
    qry_depto_.ParamByName( 'CD_DEPTO' ).AsString := Trim( msk_cd_depto.Text );
    qry_depto_.Prepare;
    qry_depto_.Open;

    edt_nm_depto.Text := qry_depto_NM_DEPTO.AsString;

    qry_depto_.Close;
    qry_depto_.UnPrepare;
  end;
end;

procedure Tfrm_rel_com_ind_por.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_rel_com_ind_por,datm_rel_com_ind_por );
end;

procedure Tfrm_rel_com_ind_por.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_rel_com_ind_por.qry_indicado_.Close;
  datm_rel_com_ind_por.qry_indicado_.UnPrepare;

  datm_rel_com_ind_por.qry_depto_.Close;
  datm_rel_com_ind_por.qry_depto_.Unprepare;

  datm_rel_com_ind_por.Free;
  crp_rel_com_ind_por.Free;
  Action := caFree;
end;

procedure Tfrm_rel_com_ind_por.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_rel_com_ind_por.FormShow(Sender: TObject);
begin
  msk_cd_indicado.SetFocus;
end;

procedure Tfrm_rel_com_ind_por.btn_imprimirClick(Sender: TObject);
var
  nr_identificador : Integer;
begin

  with datm_rel_com_ind_por do
  begin
    CloseStoredProc( sp_rel_com_ind_por );

    if Trim( msk_cd_indicado.Text ) = '' then
      sp_rel_com_ind_por.ParamByName( '@CD_INDICADO' ).AsString := 'X'
    else
      sp_rel_com_ind_por.ParamByName( '@CD_INDICADO' ).AsString := Trim( msk_cd_indicado.Text );

    if Trim( msk_cd_depto.Text )    = '' then
      sp_rel_com_ind_por.ParamByName( '@CD_DEPTO' ).AsString    := 'X'
    else
      sp_rel_com_ind_por.ParamByName( '@CD_DEPTO' ).AsString    := Trim( msk_cd_indicado.Text );

    ExecStoredProc( sp_rel_com_ind_por );

    nr_identificador := sp_rel_com_ind_por.ParamByName( '@NR_IDENTIFICADOR' ).AsInteger;

    CloseStoredProc( sp_rel_com_ind_por );

    with crp_rel_com_ind_por do
    begin
      Connect     := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRES010.RPT';
      Formulas[0] := 'NrIdentificador = '+  IntToStr( nr_identificador );
      Execute;
    end;

    ApagaDados( 'TREL_COM_IND_POR', nr_identificador );
  end;
end;

end.
