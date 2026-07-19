unit uCartaConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DB, Grids, DBGrids, DBTables,  Registry,
  ComCtrls, ShellCtrls, Mask, ToolEdit, ComObj, Provider, DBClient;

type
  TfrmCartaConfig = class(TForm)
    Panel1: TPanel;
    dbgrdVariaveis: TDBGrid;
    qryCartasConfig: TQuery;
    qryCartasConfigcalcNomeVariavel: TStringField;
    qryCartasConfigCD_CARTAS_CONFIG: TIntegerField;
    qryCartasConfigTX_CARTAS_CONFIG: TStringField;
    qryCartasConfigNM_CAMPO: TStringField;
    qryCartasConfigNM_TABELA: TStringField;
    qryCartasConfigNM_JOIN: TStringField;
    qryCartasConfigIN_TABELA: TStringField;
    qryCartasConfigcalcTabela: TStringField;
    qryCartasConfigIN_VARIOS_REGISTROS: TStringField;
    qryCartasConfigTP_PRODUTO: TStringField;
    qryCartasConfigcalcProduto: TStringField;
    qryCartasConfigcalcVarios: TStringField;
    qryCartasConfigNM_SQL_MANUAL: TMemoField;
    dsCartasConfig: TDataSource;
    Panel2: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    shp4: TShape;
    shp5: TShape;
    Shape2: TShape;
    Panel3: TPanel;
    Panel4: TPanel;
    btn_sair: TSpeedButton;
    pnlTop: TPanel;
    btnOpen: TSpeedButton;
    btnSave: TSpeedButton;
    lblArquivo: TLabel;
    docArquivos: TFilenameEdit;
    edtVariavelSelecionada: TEdit;
    cdsCartasConfig: TClientDataSet;
    dspCartasConfig: TDataSetProvider;
    cdsCartasConfigcalcNomeVariavel: TStringField;
    cdsCartasConfigCD_CARTAS_CONFIG: TIntegerField;
    cdsCartasConfigTX_CARTAS_CONFIG: TStringField;
    cdsCartasConfigNM_CAMPO: TStringField;
    cdsCartasConfigNM_TABELA: TStringField;
    cdsCartasConfigNM_JOIN: TStringField;
    cdsCartasConfigIN_TABELA: TStringField;
    cdsCartasConfigcalcTabela: TStringField;
    cdsCartasConfigIN_VARIOS_REGISTROS: TStringField;
    cdsCartasConfigTP_PRODUTO: TStringField;
    cdsCartasConfigcalcProduto: TStringField;
    cdsCartasConfigcalcVarios: TStringField;
    cdsCartasConfigNM_SQL_MANUAL: TMemoField;
    Panel5: TPanel;
    btnInserir: TSpeedButton;
    lbl2: TLabel;
    lblFiltro: TEdit;
    Label1: TLabel;
    btnPesquisar: TBitBtn;
    procedure btnOpenClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure qryCartasConfigCalcFields(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdVariaveisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btn_sairClick(Sender: TObject);
    procedure dbgrdVariaveisTitleClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
  private
    ConfigEmailGrupo : Boolean;
    function PreencheCampo(pValor: String): Boolean;
    function ProcuraOffice: string;
    function GetSql :String;
    function GetOrderBy :String;
    { Private declarations }
  public
    { Public declarations }
    vNomeDoc : string;
    procedure ConfiguraTelaParaCadEmailGrupo;
  end;

var
  frmCartaConfig: TfrmCartaConfig;

implementation

{$R *.dfm}

procedure TfrmCartaConfig.btnOpenClick(Sender: TObject);
var vPathWord: string;
begin
  vPathWord := ProcuraOffice;

  if not FileExists(docArquivos.Text) then
  begin
    vNomeDoc := InputBox('Nova Carta','Você está criando um novo documento. Digite o nome desejado:','myIndaiáLetter');
    docArquivos.Text := 'H:\DDBroker\DocumentosWORD\' + StringReplace(vNomeDoc,'.doc','',[rfReplaceAll]) + '.doc';
    WinExec(PChar(vPathWord + 'WINWORD.EXE'),SW_RESTORE);
  end
  else
  begin
    vNomeDoc := '';
    WinExec(PChar(vPathWord + 'WINWORD.EXE ' + docArquivos.Text),SW_RESTORE);
  end;

  Self.Left := 20;
  Self.Top  := 20;
  btnSave.Enabled    := True;
  btnInserir.Enabled := True;
end;

function TfrmCartaConfig.ProcuraOffice: string;
var Reg: TRegistry;
    x  : string;
begin
  Reg := TRegistry.Create;           //Consulta de registro no Regedit
  with Reg do begin
    RootKey := HKEY_LOCAL_MACHINE;

    if KeyExists('\SOFTWARE\Microsoft\Office\9.0\Word\InstallRoot') then begin //office 2000
      OpenKey( '\SOFTWARE\Microsoft\Office\9.0\Word\InstallRoot', False );
      Result := Reg.ReadString('Path');
    end else if KeyExists('\SOFTWARE\Microsoft\Office\10.0\Word\InstallRoot') then begin //office XP
      OpenKey( '\SOFTWARE\Microsoft\Office\10.0\Word\InstallRoot', False );
      Result := Reg.ReadString('Path');
   end else if KeyExists('\SOFTWARE\Microsoft\Office\11.0\Word\InstallRoot') then begin //office 2003
      OpenKey( '\SOFTWARE\Microsoft\Office\11.0\Word\InstallRoot', False );
      Result := Reg.ReadString('Path');
   end else
      Result := 'c:\Arquivos de programas\Microsoft Office\Office\'; //pasta padrão

    CloseKey;
  end;
end;

procedure TfrmCartaConfig.btnInserirClick(Sender: TObject);
var
  vWord : THandle;
begin
  if not ConfigEmailGrupo then
  begin
    //  if vNomeDoc = '' then
    //    vWord := FindWindow(nil,PChar(ExtractFilename(docArquivos.text) + ' - Microsoft Word'))
    //  else vWord := FindWindow(nil,PChar('Documento1 - Microsoft Word'));
      vWord := FindWindow(PChar('OpusApp'), nil);
      if vWord > 0 then
      begin
        ShowWindow(vWord,SW_SHOWMAXIMIZED);
        ShowWindow(vWord,SW_RESTORE);
        if GetKeyState(VK_CAPITAL) = 1 then
          keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
        PreencheCampo('123'+Copy(cdsCartasConfig.FieldByName('TX_CARTAS_CONFIG').AsString,2,Length(cdsCartasConfig.FieldByName('TX_CARTAS_CONFIG').AsString)-2)+'321');
      end;
  end
  else
  begin
    edtVariavelSelecionada.text := '123'+Copy(cdsCartasConfig.FieldByName('TX_CARTAS_CONFIG').AsString,2,Length(cdsCartasConfig.FieldByName('TX_CARTAS_CONFIG').AsString)-2)+'321';
    ModalResult := mrOk;
  end;
end;

function TfrmCartaConfig.PreencheCampo ( pValor : String) : Boolean;

  function PreencheStr ( pString : Char) : Boolean;
  var
    i : Integer;
  begin
    keybd_event(Byte(pString), 0, 0, 0);
    Sleep(100);
  end;

var
  vTestaCaracter : Integer;
  i : Integer;
  Word: OleVariant;
begin
  try
    Word := GetActiveOleObject('Word.Application');
    Word.Selection.TypeText(Text:=AnsiLowerCase(pValor));
    Exit;
  except
  end;
  for i := 1 to Length(pValor) do
    PreencheStr(pValor[i]);
end;

procedure TfrmCartaConfig.qryCartasConfigCalcFields(DataSet: TDataSet);
begin
  // nome da variável
  qryCartasConfig.FieldByName('calcNomeVariavel').AsString := Copy(qryCartasConfig.FieldByName('TX_CARTAS_CONFIG').AsString,2,Length(qryCartasConfig.FieldByName('TX_CARTAS_CONFIG').AsString)-2);

  // tabela base
  if qryCartasConfig.FieldByName('IN_TABELA').AsString = '0' then
    qryCartasConfig.FieldByName('calcTabela').AsString := 'Processo'
  else if qryCartasConfig.FieldByName('IN_TABELA').AsString = '1' then
    qryCartasConfig.FieldByName('calcTabela').AsString := 'Proposta';

  // produto
  if qryCartasConfig.FieldByName('TP_PRODUTO').AsString = '01' then
    qryCartasConfig.FieldByName('calcPRODUTO').AsString := 'Importação'
  else if qryCartasConfig.FieldByName('TP_PRODUTO').AsString = '02' then
    qryCartasConfig.FieldByName('calcPRODUTO').AsString := 'Exportação'
  else if qryCartasConfig.FieldByName('TP_PRODUTO').AsString = 'AM' then
    qryCartasConfig.FieldByName('calcPRODUTO').AsString := 'Ambos';

  // vários registros (sim ou não)
  if qryCartasConfig.FieldByName('IN_VARIOS_REGISTROS').AsString = '0' then
    qryCartasConfig.FieldByName('calcVARIOS').AsString := 'Não'
  else if qryCartasConfig.FieldByName('IN_VARIOS_REGISTROS').AsString = '1' then
    qryCartasConfig.FieldByName('calcVARIOS').AsString := 'Sim';
end;

procedure TfrmCartaConfig.btnSaveClick(Sender: TObject);
var
  vWord : THandle;
begin
//  if vNomeDoc = '' then
//    vWord := FindWindow(nil,PChar(ExtractFilename(docArquivos.text) + ' - Microsoft Word'))
//  else vWord := FindWindow(nil,PChar('Documento1 - Microsoft Word'));
  vWord := FindWindow(PChar('OpusApp'), nil);
  if vWord > 0 then
  begin
    ShowWindow(vWord,SW_SHOWMAXIMIZED);
    ShowWindow(vWord,SW_RESTORE);
    sleep(200);
    // clicando no ok
    keybd_event(VK_LCONTROL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(Ord(66), 0, 0, 0);
    keybd_event(VK_LCONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    sleep(500);
    if vNomeDoc <> '' then
    begin
      docArquivos.SelectAll;
      docArquivos.CopyToClipboard;
      // clicando no ok
      keybd_event(VK_LCONTROL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
      keybd_event(Ord(86), 0, 0, 0);
      keybd_event(VK_LCONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      sleep(200);
      keybd_event(VK_LMENU, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
      keybd_event(Ord(83), 0, 0, 0);
      keybd_event(VK_LMENU, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      sleep(500);
    end;
  end;
  // saindo
  keybd_event(VK_LMENU, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
  keybd_event(Ord(65), 0, 0, 0);
  keybd_event(VK_LMENU, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  keybd_event(Ord(82), 0, 0, 0);
  btnSave.Enabled := False;
  btnInserir.Enabled := False;
  docArquivos.Clear;
end;

procedure TfrmCartaConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCartaConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TfrmCartaConfig.dbgrdVariaveisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsCartasConfigTP_PRODUTO.AsString = '01') then
  begin
    dbgrdvariaveis.Canvas.Brush.Color := $00B7FFFF;
    dbgrdvariaveis.Canvas.Font.Color := clBlack;
    dbgrdvariaveis.DefaultDrawDataCell(Rect, dbgrdvariaveis.Columns[datacol].field, State);
  end;
  if (cdsCartasConfigTP_PRODUTO.AsString = '02') then
  begin
    dbgrdvariaveis.Canvas.Brush.Color := $00FFEFC4;
    dbgrdvariaveis.Canvas.Font.Color := clBlack;
    dbgrdvariaveis.DefaultDrawDataCell(Rect, dbgrdvariaveis.Columns[datacol].field, State);
  end;
end;

procedure TfrmCartaConfig.ConfiguraTelaParaCadEmailGrupo;
begin
  pnlTop.Visible     := False;
  lbl2.visible       := false;
  btnInserir.enabled := true;
  ConfigEmailGrupo   := true;
end;

procedure TfrmCartaConfig.btn_sairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmCartaConfig.dbgrdVariaveisTitleClick(Column: TColumn);
begin
  cdsCartasConfig.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCartaConfig.FormShow(Sender: TObject);
begin
  qryCartasConfig.sql.text := GetSql + sLineBreak + GetOrderBy;
  cdsCartasConfig.Open;
end;

function TfrmCartaConfig.GetSql :String;
begin
  Result := ' SELECT * FROM TCARTAS_CONFIG (NOLOCK) ' ;
end;

function TfrmCartaConfig.GetOrderBy :String;
Begin
  Result := ' ORDER BY TX_CARTAS_CONFIG';
end;

procedure TfrmCartaConfig.btnPesquisarClick(Sender: TObject);
var filtro : string;
begin
  cdsCartasConfig.disableControls;
  qryCartasConfig.close;
  cdsCartasConfig.close;

  filtro := '';
  if trim(lblFiltro.text) <> '' then
  filtro := ' WHERE TX_CARTAS_CONFIG LIKE '+QuotedStr('%' + lblFiltro.text + '%');

  qryCartasConfig.sql.text := GetSql + sLineBreak  + filtro + sLineBreak + GetOrderBy;
  cdsCartasConfig.open;
  cdsCartasConfig.enableControls;
end;

end.
