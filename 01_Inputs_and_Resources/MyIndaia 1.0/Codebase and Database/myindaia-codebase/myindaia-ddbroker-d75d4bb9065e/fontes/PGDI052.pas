unit PGDI052;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, DB, DBTables, ExtCtrls, Menus, ppStrtch,
  ppMemo, ppCtrls, ppVar, ppPrnabl, ppClass, ppBands, ppCache, ppRelatv,
  ppProd, ppReport, ppComm, ppEndUsr;

type
  Tfrm_erros_di = class(TForm)
    mem_erros: TMemo;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_imprimir: TSpeedButton;
    mi_menu: TMainMenu;
    mi_imprimir: TMenuItem;
    mi_sair: TMenuItem;
    ppDesigner: TppDesigner;
    ppRepDivergDI: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppTitulo: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppImage1: TppImage;
    ppmem_erros: TppMemo;
    ppVarRodapeEsq: TppVariable;
    ppVarRodapeDir: TppVariable;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppProcesso: TppLabel;
    btnProsseguir: TButton;
    lblMsgPermissaoUsuario: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppTitleBand1BeforePrint(Sender: TObject);
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure btnProsseguirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_processo : String[14];
  end;

var
  frm_erros_di: Tfrm_erros_di;

implementation

uses PGGP001, PGGP017, GSMLIB;

{$R *.DFM}

procedure Tfrm_erros_di.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_erros_di.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_erros_di.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_erros_di.btn_sairClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  Close;
end;

procedure Tfrm_erros_di.btn_imprimirClick(Sender: TObject);
begin
  ppRepDivergDI.Template.FileName := cDir_RPT + '\RBDI001.RTM';
  ppRepDivergDI.Template.LoadFromFile;
  ppRepDivergDI.AllowPrintToFile  := False;
  ppRepDivergDI.DeviceType        := 'Screen';
  ppRepDivergDI.Print;
end;

procedure Tfrm_erros_di.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure Tfrm_erros_di.ppTitleBand1BeforePrint(Sender: TObject);
var i: integer;
begin
  ppTitulo.Caption   := 'Divergências na Declaração de Importação';
  ppProcesso.Caption := 'Processo: ' + nr_processo;
  ppmem_erros.Lines.Clear;

  for i := 0 to mem_erros.Lines.Count - 1 do
  begin
    ppmem_erros.Lines.Add( mem_erros.Lines[i] );
  end;
end;

procedure Tfrm_erros_di.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tfrm_erros_di.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeEsq.AsString := 'RBDI001' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
end;

procedure Tfrm_erros_di.btnProsseguirClick(Sender: TObject);
begin
  close;
  Self.ModalResult := mrOk;

end;

end.
