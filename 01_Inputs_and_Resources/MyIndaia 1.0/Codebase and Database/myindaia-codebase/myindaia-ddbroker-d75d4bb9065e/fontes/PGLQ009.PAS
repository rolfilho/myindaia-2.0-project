unit PGLQ009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask;

type
  Tfrm_imp_cheque_branco_baixado = class(TForm)
    mskedt_dt_baixa: TMaskEdit;
    Label1: TLabel;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Crp_Cheque_Brancos_Baixados: TCrpe;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure mskedt_dt_baixaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_imp_cheque_branco_baixado: Tfrm_imp_cheque_branco_baixado;

implementation

uses GSMLIB, PGGP001;
{$R *.DFM}


procedure Tfrm_imp_cheque_branco_baixado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure Tfrm_imp_cheque_branco_baixado.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_cheque_branco_baixado.btn_iniciarClick(Sender: TObject);
begin
  try
    StrToDate(mskedt_dt_baixa.text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      mskedt_dt_baixa.Clear;
      Exit;
    end;
  end;

  With Crp_Cheque_Brancos_Baixados Do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=PROCESSO';
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=CAD';
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=GSM';

    Formulas[0] := 'Dt_Baixa = ' + DataCrystal(mskedt_dt_baixa.Text);
    Execute;
  end;

end;

procedure Tfrm_imp_cheque_branco_baixado.mskedt_dt_baixaExit(
  Sender: TObject);
begin
  try
    StrToDate(mskedt_dt_baixa.text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      mskedt_dt_baixa.Clear;
    end;
  end;
end;

end.
