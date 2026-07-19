unit uPedidosAbertosBASF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, StdCtrls, ExtCtrls, ShellApi, ComObj, DB,
  DBTables, Gauges;

type
  TfrmPedidosAbertosBASF = class(TForm)
    pnlMenu: TPanel;
    lbl1: TLabel;
    edtPath: TEdit;
    btnDialog: TSpeedButton;
    btnIntegra: TSpeedButton;
    btnSair: TSpeedButton;
    mmAtalho: TMainMenu;
    Integrar1: TMenuItem;
    lblAviso: TLabel;
    lblSimbolo: TLabel;
    dlgOpen: TOpenDialog;
    dsProcura: TDataSource;
    qryProcura: TQuery;
    qryProcuraUNIDADE: TStringField;
    qryProcuraPRODUTO: TStringField;
    qryProcuraPROCESSO: TStringField;
    qryProcuraREALIZACAO_BL: TDateTimeField;
    ggProgresso: TGauge;
    procedure btnIntegraClick(Sender: TObject);
    procedure btnDialogClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ModificaScreen(pTerminouRotina: boolean);
  public
    { Public declarations }
  end;

var
  frmPedidosAbertosBASF: TfrmPedidosAbertosBASF;

implementation

uses
  PGGP017, ConsOnLineEx, GSMLIB;

{$R *.dfm}

procedure TfrmPedidosAbertosBASF.btnIntegraClick(Sender: TObject);
var
  Excel, xlWorkB, oSheet: OleVariant;
  i: Integer;

  function ExcelRowCount: Integer;
  begin
    Result := 1;
    while (Result <= 65239) and (oSheet.Cells[Result, 1].Text <> '') and (oSheet.Cells[Result, 2].Text <> '') do
      Inc(Result);
    Dec(Result);
  end;
begin
  try
    ModificaScreen(False);
    Excel := CreateOLEObject('Excel.Application');
    xlWorkB := Excel.Workbooks.Open(Trim(edtPath.Text));
    oSheet :=  Excel.WorkBooks[1].Worksheets[1];
  except
    Application.MessageBox('Erro na abertura da Planilha! Verifique o arquivo!', 'MyIndaiá', MB_OK + MB_ICONERROR);
    ModificaScreen(true);
    Exit;
  end;

  try
    //insere três colunas no arquivo
    oSheet.Columns['C'].Insert;
    oSheet.ColumnS['C'].Insert;
    oSheet.ColumnS['C'].Insert;
    oSheet.ColumnS['O'].Insert;

    //passa os títulos da coluna
    oSheet.Cells[1, 3].Value  :=  'Unidade';
    oSheet.Cells[1, 4].Value  :=  'Produto';
    oSheet.Cells[1, 5].Value  :=  'Processo';
    oSheet.Cells[1, 15].Value :=  'Recebimento B/L';

    osheet.Range[ 'C1', 'E1'].Font.Name := 'Tahoma';
    osheet.Range[ 'C1', 'E1'].Font.Size := 10;
    osheet.Range[ 'C1', 'E1'].Font.Bold := True;

    osheet.Range[ 'O1', 'O1'].Font.Name := 'Tahoma';
    osheet.Range[ 'O1', 'O1'].Font.Size := 10;
    osheet.Range[ 'O1', 'O1'].Font.Bold := True;

    oSheet.Columns[15].NumberFormat := '@';
  except
    Application.MessageBox('Erro na preparação da Planilha!', 'MyIndaiá', MB_OK + MB_ICONERROR);
    ModificaScreen(true);
    Exit;
  end;

  ggProgresso.MaxValue := ExcelRowCount;
  for i := 2 to ggProgresso.MaxValue do
  begin
    ggProgresso.Progress := i;
    ggProgresso.Update;
    //if ((oSheet.Cells[IntToStr(i), 1].Text = '') and (oSheet.Cells[IntToStr(i), 2].Text = '')) or
    //   ((oSheet.Cells[IntToStr(i+1), 1].Text = '') and (oSheet.Cells[IntToStr(i+1), 2].Text = '')) or
    //   ((oSheet.Cells[IntToStr(i+2), 1].Text = '') and (oSheet.Cells[IntToStr(i+2), 2].Text = '')) then
    //  Break;
    //procura dados no banco
    qryProcura.Close;
    qryProcura.ParamByName('REFERENCIA').AsString := oSheet.Cells[i,1].Value;
    qryProcura.ParamByName('ITEMPO').AsString     := Copy('0000', 1, 4 - Length(IntToStr(StrToInt(oSheet.Cells[i,2].Value)))) + IntToStr(StrToInt(oSheet.Cells[i,2].Value));
    qryProcura.Open;
    //insere dados na planilha
    if qryProcura.IsEmpty then
      oSheet.Range['A'+IntToStr(i),'P'+ IntToStr(i)].Font.Bold := True
    else
    begin
      oSheet.Cells[i, 3].Value := qryProcuraUNIDADE.AsString;
      oSheet.Cells[i, 4].Value := qryProcuraPRODUTO.AsString;
      oSheet.Cells[i, 5].Value := qryProcuraPROCESSO.AsString;
      if qryProcuraREALIZACAO_BL.AsDateTime > 0 then
        oSheet.Cells[i, 15].Value := DateToStr(qryProcuraREALIZACAO_BL.AsDateTime);
    end;
    qryProcura.Close;
  end;

  Application.MessageBox('Planilha gerada com sucesso', 'MyIndaiá', MB_OK + MB_ICONEXCLAMATION);
  Excel.Visible := True;
  ModificaScreen(true);
end;

procedure TfrmPedidosAbertosBASF.ModificaScreen(pTerminouRotina: boolean);
begin
  lblAviso.Visible     := not pTerminouRotina;
  lblSimbolo.Visible   := not pTerminouRotina;
  btnSair.Enabled      :=     pTerminouRotina;
  ggProgresso.Progress := 0;
  ggProgresso.Visible  := not pTerminouRotina;
  Application.ProcessMessages;
end;

procedure TfrmPedidosAbertosBASF.btnDialogClick(Sender: TObject);
begin
  if dlgOpen.Execute then edtPath.Text := dlgOpen.FileName;
end;

procedure TfrmPedidosAbertosBASF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 27) and (btnSair.Enabled) then Close;
end;

procedure TfrmPedidosAbertosBASF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPedidosAbertosBASF.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidosAbertosBASF.FormCreate(Sender: TObject);
var
  vModificar, vIncluir, vExcluir: Boolean;
begin
  AtribuiDireitos(vModificar, vIncluir, vExcluir);

  if not vIncluir then
    btnIntegra.Enabled := False;
end;

end.
