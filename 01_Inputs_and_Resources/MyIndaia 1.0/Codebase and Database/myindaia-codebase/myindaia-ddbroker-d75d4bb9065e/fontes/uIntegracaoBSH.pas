unit uIntegracaoBSH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ByHLLAPI, ExtCtrls, Buttons, DBTables, FileText;

type
  TRe = Record
    iChave  : String;
    iChave2 : String;
    iValor  : String;
  end;

type
  TfrmIntegracaoBSH = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Label3: TLabel;
    edt_nm_file_: TEdit;
    btn_nr_processo: TSpeedButton;
    open_file_: TOpenDialog;
    MyTerminal: TByHLLAPI;
    captura_telas: TMemo;
    SaveDialog1: TSaveDialog;
    pbArquivo: TProgressBar;
    Label2: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure TransmiteProcessos(Usuario: String);
    function TransmiteRE(const pFileName, pCodigoUsuario: String): Boolean;
    function PosicionaTelaMapaBrasil: Boolean;
    function VerificaConexaoEmulador(Sessao: String): Boolean;
    procedure PosicaoPalavra(id_chave, tipo: String);
    function RetornaValor(pChave, pChave2 : String) : string;
    { Private declarations }
  public
    vInterrompe : Integer;
    { Public declarations }
  end;

var
  frmIntegracaoBSH: TfrmIntegracaoBSH;
  linha_palavra, coluna_palavra, tamanho : Integer;
  palavra : String;
  qry_param, qry_acesso           : TQuery;
  li_timeout, TempoEsperaEmulador : Integer;
  vProcesso : String;
  vSenhaSiscomex, vCpfUsuario, vCPFRepresentante, vCGCExportador : String;
  vLinhasRE : array of TRe;

const
  C_ENTER = '@E';
  C_PF3   = '@3';
  C_PF8   = '@8';

implementation

{$R *.dfm}

uses GSMLIB;

procedure TfrmIntegracaoBSH.SpeedButton2Click(Sender: TObject);
begin
//  MyTerminal.DesconectaPS;
  if vInterrompe = 0 then
  begin
    vInterrompe := 1;
    SpeedButton2.Caption := 'Fechar';
  end else Close;
end;

procedure TfrmIntegracaoBSH.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmIntegracaoBSH.btn_nr_processoClick(Sender: TObject);
begin
  if open_file_.Execute then
    edt_nm_file_.Text := open_file_.FileName;
end;

function TfrmIntegracaoBSH.TransmiteRE(const pFileName, pCodigoUsuario : String) : Boolean;
var
  F                               : TextFile;
  i, j, TempoEsperaEmulador       : integer;
  vProcesso, DataHora1, DataHora2,
  vSenhaSiscomex, vCpfUsuario,
  vCPFRepresentante               : String;
  Tempo, li_timeout               : Double;
  DataHoraLoop                    : TDateTime;
  CurrWnd                         : hWnd;
  pi                              : TProcessInformation;
  si                              : TStartupInfo;
  Emulador                        : THandle;
begin
  try
    qry_param := TQuery.Create(application);
    qry_param.DatabaseName := 'DBBROKER';
    qry_param.SQL.Clear;
    qry_param.SQL.Add('SELECT TP_EMULADOR, TIME_WAIT_EMULADOR, EXE_EMULADOR, PARAM_EMULADOR, TX_NOME_SESSION FROM TPARAMETROS');
    qry_param.Open;
    qry_acesso := TQuery.Create(application);
    qry_acesso.DatabaseName := 'DBBROKER';
    qry_acesso.SQL.Clear;
    //troca da tabela TACESSO_SCX_EXP pela view VW_DESPACHANTE_CLIENTE - carlos 18/09/2009
    qry_acesso.SQL.Add('SELECT DISTINCT CD_SENHA_SCX, CPF_USUARIO,  CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CD_ACESSO = ''' + pCodigoUsuario + '''');
    qry_acesso.Open;
    vSenhaSiscomex    := qry_acesso.FieldByName('CD_SENHA_SCX').AsString;
    vCpfUsuario       := qry_acesso.FieldByName('CPF_USUARIO').AsString;
    vCPFRepresentante := qry_acesso.FieldByName('CNPJ_REPRES').AsString;
//    vProcesso := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
//    datm_re_capa.qry_recapa.Open;
    TempoEsperaEmulador := qry_param.FieldByName('TIME_WAIT_EMULADOR').AsInteger;
    li_timeout := TempoEsperaEmulador;
    MyTerminal.ExePath    := ExtractFileDir( Application.ExeName );
    MyTerminal.ExeName    := 'BySrv16.EXE';
    try
      MyTerminal.TimeOut := ( TempoEsperaEmulador * 1000 );
      MyTerminal.CarregaDLL;
      MyTerminal.ResetaConectaPS( qry_param.FieldByName('TX_NOME_SESSION').AsString );
      TransmiteProcessos(  vCpfUsuario );
      if vInterrompe = 0 then
        if SaveDialog1.Execute then
          captura_telas.Lines.SaveToFile(SaveDialog1.FileName);
    Finally
      try
        vInterrompe := 0;
        MyTerminal.DesconectaPS;
        MyTerminal.DescarregaDLL;
      except

      end;
    end;
    qry_param.Close;
    qry_param.Free;
    qry_acesso.Close;
    qry_acesso.Free;
//    datm_re_capa.qry_recapa.Close;
  except
    Result := False;
  end;
  Result := True;
end;

function TfrmIntegracaoBSH.RetornaValor(pChave, pChave2 : String) : string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to Length(vLinhasRE)-1 do
  begin
    if ( vLinhasRE[i].iChave = pChave ) and ( vLinhasRE[i].iChave2 = pChave2 ) then begin
      Result := Result + vLinhasRE[i].iValor + '|';
//      Break;
    end;
  end;
end;

procedure TfrmIntegracaoBSH.TransmiteProcessos( Usuario : String );
var
   str_PesoBrutoTotal, str_ValorTotal, str_QtdeUnidadeMedida, str_QtdeUnidadeComerc, str_PesoLiquido,
   str_ValorMoeda, LinhaParaMemo, LinhaMemoDoc, LinhaMemoInfo : String;
   l_Retorna : Boolean;
   S : TStringList;
   strvalemb, vlrcom, fat, RC, enquadr, str_numero_re,
   Tela1, Tela2, naladi, dadosexp, obsexp, vStrAux, vUltimaChave, vUltimaChave2, vUltimaConsultada : String;
   i, v, j, x, ew, escape, Res, con_LinhaVol, TamLinhaMemo, vFileLinesCount,vOcorrencias, vMaiorChave2, vChave2 : Integer;
   f : TextFile;
begin

//****************************************************************************//
//  LEITURA DO ARQUIVO SELECIONADO, JOGANDO PRO ARRAY DE TREs                 //
//****************************************************************************//

  AssignFile( f, edt_nm_file_.text );
  {$i-}
  Reset( f );
  {$i+}
  if ioresult <> 0 then
  begin
    BoxMensagem( 'Ocorreu um erro quando o sistema tentou abrir o arquivo "' + edt_nm_file_.Text +'".', 2 );
    edt_nm_file_.SetFocus;
    Exit;
  end;
  while not EOF(f) do
  begin
    ReadLn(f, vStrAux);
    Inc(vFileLinesCount);
  end;
  SetLength(vLinhasRE, 0);
  SetLength(vLinhasRE, vFileLinesCount);
  pbArquivo.Visible := True;
  Label2.Visible := True;
  pbArquivo.Max := vFileLinesCount;
  pbArquivo.Min := 0;
  {$i-}
  Reset( f );
  {$i+}
  i := 0;
  while not EOF(f) do
  begin
    if vInterrompe = 1 then Exit;
    ReadLn(f, vStrAux);
    pbArquivo.StepIt;
    Application.ProcessMessages;
    vOcorrencias := 0;
    for j:=0 to Length(vLinhasRE)-1 do
    begin
      if vInterrompe = 1 then Exit;
      if ( vLinhasRE[j].iChave = Trim(Copy(vStrAux,1,4)) ) and ( vLinhasRE[j].iChave <> vUltimaChave ) and
         ( vUltimaConsultada <> vLinhasRE[j].iChave ) then
      begin
        vOcorrencias  := vOcorrencias + 1;
        vUltimaConsultada  := vLinhasRE[j].iChave;
        for x := 0 to Length(vLinhasRE)-1 do
          if ( vLinhasRE[x].iChave = Trim(Copy(vStrAux,1,4)) ) and ( StrToInt(vLinhasRE[x].iChave2) > vOcorrencias ) then
            vOcorrencias  := vOcorrencias + 1;
        break;
      end else if ( vLinhasRE[j].iChave = vUltimaChave ) and ( Length(vLinhasRE[j].iChave) = 2 ) then
        vOcorrencias := StrToInt(vLinhasRE[j].iChave2) - 1;
    end;
    vLinhasRE[i].iChave  := Trim(Copy(vStrAux,1,4));
    vUltimaChave         := Trim(Copy(vStrAux,1,4));
    vLinhasRE[i].iChave2 := IntToStr(vOcorrencias+1);
    if Trim(Copy(vStrAux,1,4)) = '17a' then
      vLinhasRE[i].iChave2 := IntToStr(vMaiorChave2);
    vMaiorChave2         := StrToInt(vLinhasRE[i].iChave2);

    if Trim(Copy(vStrAux,1,4)) = '1.00' then
      vLinhasRE[i].iValor := Trim(Copy(vStrAux,21,Length(vStrAux)))
    else vLinhasRE[i].iValor := Trim(Copy(vStrAux,5,Length(vStrAux)));
    vStrAux := ' ';
    Inc(i);
  end;
  CloseFile(f);
  pbArquivo.Visible := False;
  Label2.Visible := False;

//  for j:=0 to Length(vLinhasRE)-1 do
//    ShowMessage( vLinhasRE[j].iChave + ' - ' + vLinhasRE[j].iChave2 + ' - ' + vLinhasRE[j].iValor );

//  Exit;

//****************************************************************************//
//  COMECO DA TRANSMISSAO                                                     //
//****************************************************************************//

  if not PosicionaTelaMapaBrasil then begin
    BoxMensagem( 'Não conectado Siscomex!', 3 );
    Exit;
  end;

  vCpfUsuario := InputBox('CPF', 'Digite o CPF do Despachante', '');
  vSenhaSiscomex := InputBox('Senha', 'Digite a Senha para o CPF " ' + vCpfUsuario + ' "', '');

  escape := 0;
  PosicaoPalavra('REDESERPROBR','ENVRE');
  while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
    Sleep(1000);
    if vInterrompe = 1 then Exit;
  end;

  PosicaoPalavra('REDESERPROBR','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    MyTerminal.CopyString2PS( 16, 12, vCpfUsuario);// '16239665827'
    MyTerminal.CopyString2PS( 17, 12, vSenhaSiscomex);// 'INDAIA10'
    MyTerminal.CopyString2PS( 18, 12, 'SISCOMEX' );
  end;

  Res := MyTerminal.SendKey( C_ENTER, True );
  Res := MyTerminal.Wait( True );

  PosicaoPalavra('SEN0500','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 23, 2, 75, Res), 3 );
  PosicaoPalavra('SEN0501','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 23, 2, 75, Res), 3 );
  PosicaoPalavra('SEN0502','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 23, 2, 75, Res), 3 );
  PosicaoPalavra('SEN0504','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 23, 2, 75, Res), 3 );
  PosicaoPalavra('SEN0507','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 23, 2, 75, Res), 3 );

  TamLinhaMemo := 240;
  l_Retorna := False;
  captura_telas.Clear;

  PosicaoPalavra('COLETAIMPRLOC','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    Res := MyTerminal.SendKey( C_PF3, True );
    Res := MyTerminal.Wait( True );
    PosicaoPalavra('COLETAIMPRLOC','ENVRE');
    while ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
        Res := MyTerminal.SendKey( C_PF3, True );
        Res := MyTerminal.Wait( True );
        if vInterrompe = 1 then Exit;
    end;
  end;

  PosicaoPalavra('POSICURSOR','ENVRE');
  while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
  begin
    if vInterrompe = 1 then Exit;
    PosicaoPalavra('COLETAIMPRLOC','ENVRE');
    if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      Break;
    PosicaoPalavra('SEN0551','ENVRE');
    if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      BoxMensagem('Ocorreu um erro na transmissão : SEN0551 - VOCE ESTA UTILIZANDO ESTE SISTEMA EM OUTRO TERMINAL.',3 );
      Res := MyTerminal.SendKey( C_PF3, True );
      Res := MyTerminal.Wait( True );
      l_Retorna := True;
      Break;
    end;
    Sleep(1000);
    PosicaoPalavra('POSICURSOR','ENVRE');
  end;

  if l_Retorna  then
    l_Retorna := False;

  PosicaoPalavra('COLETAIMPRLOC','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    Res := MyTerminal.SendKey( C_PF3, True );
    Res := MyTerminal.Wait( True );
  end;

  PosicaoPalavra('POSICURSOR','ENVRE');
  while ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
  begin
    if vInterrompe = 1 then Exit;
    MyTerminal.CopyString2PS( 22, 15, 'REGI-OPER' );
    while not( MyTerminal.CopyPS2String( 22, 15, 9, Res) = 'REGI-OPER' ) do
    begin
      if vInterrompe = 1 then Exit;
      MyTerminal.CopyString2PS( 22, 15, 'REGI-OPER' );
      Sleep(1000);
    end;
    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
    Break;
    Sleep(1000);
  end;

  PosicaoPalavra('EXISTEMNOTI','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    MyTerminal.CopyString2PS( 16, 41, 'N' );
    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
  end;

  PosicaoPalavra('PREENCHASOLIC','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    MyTerminal.CopyString2PS( 17, 29, ExtractWord(1,RetornaValor('1.00','1'),'|'));
    MyTerminal.CopyString2PS( 17, 48, vCPFRepresentante );
    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
  end;

  PosicaoPalavra('REGOPEREXP','ENVRE');
  while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
  begin
    Sleep(1000);
    if vInterrompe = 1 then Exit;
  end;

  PosicaoPalavra('REGOPEREXP','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    MyTerminal.CopyString2PS( 22, 18, 'PCEX300' );
    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
    PosicaoPalavra('MCEX300','ENVRE');
    while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      if vInterrompe = 1 then Exit;
      PosicaoPalavra('ENTERSEGUE','ENVRE');
      if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        Res := MyTerminal.SendKey( C_ENTER, True );
        Res := MyTerminal.Wait( True );
        PosicaoPalavra('MCEX300','ENVRE');
        while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
             Sleep(1000);
      end;
      Sleep(1000);
      PosicaoPalavra('MCEX300','ENVRE');
    end;
  end;

  PosicaoPalavra('MCEX300','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    MyTerminal.CopyString2PS( 20, 20, '01' );
    MyTerminal.CopyString2PS( 20, 41, '         ' );
    MyTerminal.CopyString2PS( 20, 53, '   ' );
    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
    PosicaoPalavra('MCEX501A','ENVRE');
    while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      Sleep(1000);
      if vInterrompe = 1 then Exit;
    end;
    strvalemb := '';
    vlrcom := '';
  end;

//****************************************************************************//

  PosicaoPalavra('MCEX501A','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
//    fat := datm_re_capa.qry_recapa.FieldByName('NR_OUTRA_REF').AsString;
    {02}
    enquadr := ExtractWord(1,RetornaValor('02a','1'),'|');
    MyTerminal.CopyString2PS( 11, 26, ExtractWord(1,RetornaValor('02a','1'),'|'));
    MyTerminal.CopyString2PS( 11, 35, '');
    MyTerminal.CopyString2PS( 11, 44, '');
    MyTerminal.CopyString2PS( 11, 53, '');
    MyTerminal.CopyString2PS( 11, 62, '');
    MyTerminal.CopyString2PS( 11, 71, '');
    MyTerminal.CopyString2PS( 12, 26, '');
    MyTerminal.CopyString2PS( 13, 26, '');
    RC := ExtractWord(1,RetornaValor('02c','1'),'|');
    MyTerminal.CopyString2PS( 12, 65, ExtractWord(1,RetornaValor('02f','1'),'|') );
    MyTerminal.CopyString2PS( 13, 65, StringReplace(ExtractWord(1,RetornaValor('02g','1'),'|'),',','.',[]) );
    MyTerminal.CopyString2PS( 14, 26, ExtractWord(1,RetornaValor('02d','1'),'|') );
    MyTerminal.CopyString2PS( 14, 65, '               ' );
    MyTerminal.CopyString2PS( 15, 26, ExtractWord(1,RetornaValor('02e','1'),'|') );
    {03}
    MyTerminal.CopyString2PS( 16, 26, ExtractWord(1,RetornaValor('03','1'),'|') );
    {04}
    MyTerminal.CopyString2PS( 17, 26, ExtractWord(1,RetornaValor('04','1'),'|') );
    {05}
    MyTerminal.CopyString2PS( 19, 26, ExtractWord(1,RetornaValor('05a','1'),'|') );
    MyTerminal.CopyString2PS( 20, 26, ExtractWord(1,RetornaValor('05b','1'),'|') );
    MyTerminal.CopyString2PS( 21, 26, ExtractWord(1,RetornaValor('05c','1'),'|') );

    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
    i:=1;
    while i <= 25 do
    begin
      captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
      i:=i+1;
    end;
    Application.ProcessMessages;
    captura_telas.Lines.Add(' ');
    if ( MyTerminal.CopyPS2String( 1, 2, 10, Res) = '          ' ) then
    begin
      Res := MyTerminal.SendKey( C_PF8, True );
      Res := MyTerminal.Wait( True );
      PosicaoPalavra('MCEX501B','ENVRE');
      while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
        Sleep(1000);
    end;
    if ( MyTerminal.CopyPS2String( 1, 2, 10, Res) <> '          ' ) then
    begin
      BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 1, 2, 79, Res), 3 );
      PosicaoPalavra('REDE','ENVRE');
      while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
      begin
        Res := MyTerminal.SendKey( C_PF3, True );
        Res := MyTerminal.Wait( True );
        Sleep(1000);
      end;
      Exit;
    end;
    if vInterrompe = 1 then Exit;
  end;

  PosicaoPalavra('MCEX501B','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    if (RC = '') then
    begin
      MyTerminal.CopyString2PS( 7, 33, ExtractWord(1,RetornaValor('06','1'),'|') );
      MyTerminal.CopyString2PS( 9, 33, ExtractWord(1,RetornaValor('08','1'),'|') );
      if (enquadr <> '80113') then
        MyTerminal.CopyString2PS( 12, 33, ExtractWord(1,RetornaValor('09b','1'),'|') );
      MyTerminal.CopyString2PS( 19, 33, StringReplace(ExtractWord(1,RetornaValor('09j','1'),'|'),',','.',[]) );
      MyTerminal.CopyString2PS( 20, 33, StringReplace(ExtractWord(1,RetornaValor('09l','1'),'|'),',','.',[]) );
    end;
    MyTerminal.CopyString2PS( 8, 33, ExtractWord(1,RetornaValor('07','1'),'|') );
    MyTerminal.CopyString2PS( 11, 33, ExtractWord(1,RetornaValor('09a','1'),'|') );
    MyTerminal.CopyString2PS( 13, 33, StringReplace(ExtractWord(1,RetornaValor('09c','1'),'|'),',','.',[]) );
    MyTerminal.CopyString2PS( 14, 33, StringReplace(ExtractWord(1,RetornaValor('09d','1'),'|'),',','.',[]) );
    MyTerminal.CopyString2PS( 15, 33, ExtractWord(1,RetornaValor('09e','1'),'|') );
    MyTerminal.CopyString2PS( 15, 71, ExtractWord(1,RetornaValor('09g','1'),'|') );
    MyTerminal.CopyString2PS( 16, 33, ExtractWord(1,RetornaValor('09f','1'),'|') );
    MyTerminal.CopyString2PS( 17, 33, StringReplace(ExtractWord(1,RetornaValor('09h','1'),'|'),',','.',[]) );
    MyTerminal.CopyString2PS( 21, 33, StringReplace(ExtractWord(1,RetornaValor('09m','1'),'|'),',','.',[]) );
    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
    i:=1;
    while i <= 25 do
    begin
      captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
      i:=i+1;
    end;
    Application.ProcessMessages;
    captura_telas.Lines.Add(' ');
    if ( MyTerminal.CopyPS2String( 1, 2, 10, Res) = '          ' ) then
    begin
      Res := MyTerminal.SendKey( C_PF8, True );
      Res := MyTerminal.Wait( True );
      PosicaoPalavra('MCEX501C','ENVRE');
      while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
        Sleep(1000);
    end;
    if ( MyTerminal.CopyPS2String( 1, 2, 10, Res) <> '          ' ) then
    begin
      BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 1, 2, 79, Res), 3 );
      PosicaoPalavra('REDE','ENVRE');
      while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
      begin
        Res := MyTerminal.SendKey( C_PF3, True );
        Res := MyTerminal.Wait( True );
        Sleep(1000);
        if vInterrompe = 1 then Exit;
      end;
      Exit;
    end;
  end;

//  vMaiorChave2 := MaiorChave2;

  for vChave2 := 1 to vMaiorChave2 do
  begin

    PosicaoPalavra('MCEX501C','ENVRE');
    if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      j := 0;
      for v := 0 to 9 do
      begin
        MyTerminal.CopyString2PS( v + 11, 6, Trim(ExtractWord( j + 1 , RetornaValor('11',IntToStr(vChave2)),'|')) );
        j:= j+1;
      end;
      naladi := ExtractWord(1,RetornaValor('10b', IntToStr(vChave2)),'|');
      MyTerminal.CopyString2PS( 9, 20, ExtractWord(1,RetornaValor('10b', IntToStr(vChave2)),'|') );
      MyTerminal.CopyString2PS( 7, 12, Copy(ExtractWord(1,RetornaValor('10a', IntToStr(vChave2)),'|'),1,8) );
      MyTerminal.CopyString2PS( 7, 23, Copy(ExtractWord(1,RetornaValor('10a', IntToStr(vChave2)),'|'),9,2) ); // sulfixo ncm
      MyTerminal.CopyString2PS( 20, 23, ExtractWord(1,RetornaValor('12', IntToStr(vChave2)),'|') );
      MyTerminal.CopyString2PS( 21, 23, ExtractWord(1,RetornaValor('13', IntToStr(vChave2)),'|') );
      Res := MyTerminal.SendKey( C_ENTER, True );
      Res := MyTerminal.Wait( True );
      PosicaoPalavra('TABNALADI','ENVRE');
      if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        Tela1 := MyTerminal.CopyPS2String( 9, 20, 8, Res);
        Tela2 := MyTerminal.CopyPS2String( 9, 20, 8, Res);
        while Tela1 = Tela2 do
        begin
          Tela2 := MyTerminal.CopyPS2String( 9, 20, 8, Res);
          Sleep(1000);
          if vInterrompe = 1 then Exit;
        end;
      end;
      i:=1;
      while i <= 25 do
      begin
        captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
        i:=i+1;
      end;
      Application.ProcessMessages;
      captura_telas.Lines.Add(' ');

      if naladi = '' then
      begin
        Tela1 :=  MyTerminal.CopyPS2String( 3, 1, 80, Res);
        Tela2 :=  MyTerminal.CopyPS2String( 3, 1, 80, Res);
        Res := MyTerminal.SendKey( C_ENTER, True );
        Res := MyTerminal.Wait( True );
      end;
      if MyTerminal.CopyPS2String( 1, 2, 10, Res) = '          ' then
      begin
        Res := MyTerminal.SendKey( C_ENTER, True );
        Res := MyTerminal.Wait( True );
        PosicaoPalavra('MCEX501D','ENVRE');
        while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
          Sleep(1000);
      end;
      if ( MyTerminal.CopyPS2String( 1, 2, 10, Res) <> '          ' ) then
      begin
        BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 1, 2, 79, Res), 3 );
        PosicaoPalavra('REDE','ENVRE');
        while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
        begin
          Res := MyTerminal.SendKey( C_PF3, True );
          Res := MyTerminal.Wait( True );
          Sleep(1000);
          if vInterrompe = 1 then Exit;
        end;
        exit;
      end;
      PosicaoPalavra('MCEX501D','ENVRE');
      if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        MyTerminal.CopyString2PS( 8, 63, StringReplace(ExtractWord(1,RetornaValor('15', IntToStr(vChave2)),'|'),',','.',[]) );
        MyTerminal.CopyString2PS( 10, 25, StringReplace(ExtractWord(1,RetornaValor('16a', IntToStr(vChave2)),'|'),',','.',[]) );
        if enquadr <> '80113' then
          MyTerminal.CopyString2PS( 10, 61, ExtractWord(1,RetornaValor('16b', IntToStr(vChave2)),'|') );
        MyTerminal.CopyString2PS( 12, 25, StringReplace(ExtractWord(1,RetornaValor('17a', IntToStr(vChave2)),'|'),',','.',[]) );
        MyTerminal.CopyString2PS( 14, 25, StringReplace(ExtractWord(1,RetornaValor('18a', IntToStr(vChave2)),'|'),',','.',[]) );
        MyTerminal.CopyString2PS( 14, 63, StringReplace(ExtractWord(1,RetornaValor('18b', IntToStr(vChave2)),'|'),',','.',[]) );
        if RC = '' then
        begin
          MyTerminal.CopyString2PS( 19, 8,  Copy(RetornaValor('20a', IntToStr(vChave2)),1,2) );
          MyTerminal.CopyString2PS( 19, 11, Copy(RetornaValor('20a', IntToStr(vChave2)),4,2) );
        end;
        if Trim(RetornaValor('20a', IntToStr(vChave2))) <> '00.00' then
          MyTerminal.CopyString2PS( 19, 25, ExtractWord(1,RetornaValor('20b', IntToStr(vChave2)),'|') );
        MyTerminal.CopyString2PS( 20, 25, ExtractWord(1,RetornaValor('21', IntToStr(vChave2)),'|') );
        dadosexp := ExtractWord(1,RetornaValor('22', IntToStr(vChave2)),'|');
        MyTerminal.CopyString2PS( 21, 37, ExtractWord(1,RetornaValor('22', IntToStr(vChave2)),'|') );
        obsexp := ExtractWord(1,RetornaValor('23', IntToStr(vChave2)),'|');
        MyTerminal.CopyString2PS( 21, 74, ExtractWord(1,RetornaValor('23', IntToStr(vChave2)),'|') );
        Res := MyTerminal.SendKey( C_ENTER, True );
        Res := MyTerminal.Wait( True );

        strvalemb := MyTerminal.CopyPS2String( 8, 2, 35, Res);
        vlrcom := MyTerminal.CopyPS2String( 19, 42, 39, Res);

        i:=1;
        while i <= 25 do
        begin
          captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
        Application.ProcessMessages;
        captura_telas.Lines.Add(' ');

        if MyTerminal.CopyPS2String( 1, 2, 10, Res) = '          ' then
        begin
          Res := MyTerminal.SendKey( C_ENTER, True );
          Res := MyTerminal.Wait( True );
          PosicaoPalavra('REGVALDIV','ENVRE');
          if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
          begin
            BoxMensagem('Ocorreu um erro na transmissão : REGISTRO DE EXPORTACAO COM VALORES DIVERGENTES', 3 );
            TELA1 := MyTerminal.CopyPS2String( 8, 1, 50, Res);
            TELA2 := MyTerminal.CopyPS2String( 8, 1, 50, Res);

            i:=1;
            while i <= 25 do
            begin
              captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
              i:=i+1;
            end;
            Application.ProcessMessages;
            captura_telas.Lines.Add(' ');
            Res := MyTerminal.SendKey( C_PF8, True );
            Res := MyTerminal.Wait( True );
            while TELA1 = TELA2 do begin
              TELA2 := MyTerminal.CopyPS2String( 8, 1, 50, Res);
              if vInterrompe = 1 then Exit;
            end;
          end;
        end;
        if  MyTerminal.CopyPS2String( 1, 2, 10, Res) <> '          ' then
        begin
          PosicaoPalavra('FIMMERC','ENVRE');
          if not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
          begin
            BoxMensagem('Ocorreu um erro na transmissão : ' + MyTerminal.CopyPS2String( 1, 2, 79, Res), 3 );
            PosicaoPalavra('REDE','ENVRE');
            while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
            begin
              Res := MyTerminal.SendKey( C_PF3, True );
              Res := MyTerminal.Wait( True );
              Sleep(1000);
              if vInterrompe = 1 then Exit;
            end;
            exit;
          end;
        end;
      end;

      if MyTerminal.CopyPS2String( 1, 2, 10, Res) = '          ' then
      begin
        if dadosexp = 'N' then
        begin
          PosicaoPalavra('MCEX501E','ENVRE');
          while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
            Sleep(1000);
          PosicaoPalavra('MCEX501E','ENVRE');
          if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
          begin
            v  := 0;
            ew := 0;
            for v := 0 to 9 do
            begin
              MyTerminal.CopyString2PS( v + 11,  3, ExtractWord( ew + 1, RetornaValor('24',IntToStr(vChave2)), '|') );
              MyTerminal.CopyString2PS( v + 11, 18, ExtractWord( ew + 2, RetornaValor('24',IntToStr(vChave2)), '|') );
              MyTerminal.CopyString2PS( v + 11, 29, ExtractWord( ew + 3, RetornaValor('24',IntToStr(vChave2)), '|') );
              MyTerminal.CopyString2PS( v + 11, 32, ExtractWord( ew + 4, RetornaValor('24',IntToStr(vChave2)), '|') );
              MyTerminal.CopyString2PS( v + 11, 46, ExtractWord( ew + 5, RetornaValor('24',IntToStr(vChave2)), '|') );
              MyTerminal.CopyString2PS( v + 11, 63, ExtractWord( ew + 6, RetornaValor('24',IntToStr(vChave2)), '|') );
              Sleep(500);
              ew := ew + 6;
              if vInterrompe = 1 then Exit;
            end;

            TELA1 := MyTerminal.CopyPS2String( 3, 1, 80, Res);
            TELA2 := MyTerminal.CopyPS2String( 3, 1, 80, Res);

            i:=1;
            while i <= 25 do
            begin
              captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
              i:=i+1;
            end;
            Application.ProcessMessages;
            captura_telas.Lines.Add(' ');
            Res := MyTerminal.SendKey( C_ENTER, True );
            Res := MyTerminal.Wait( True );
            if (MyTerminal.CopyPS2String( 1, 2, 10, Res) <> '          ') and MyTerminal.ScrComp(3,72,'MCEX501E') then
            begin
              i:=1;
              while i <= 25 do begin
                captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
                i:=i+1;
              end;
              Application.ProcessMessages;
              captura_telas.Lines.Add(' ');

              v:=11;
              while v <= 20 do
              begin
                MyTerminal.CopyString2PS( v, 3, '              ' );
                MyTerminal.CopyString2PS( v, 18, '          ' );
                MyTerminal.CopyString2PS( v, 29, '  ' );
                MyTerminal.CopyString2PS( v, 32, '             ' );
                MyTerminal.CopyString2PS( v, 46, '                ' );
                MyTerminal.CopyString2PS( v, 63, '                  ' );
                v:=v+1;
                if vInterrompe = 1 then Exit;
              end;
              PosicaoPalavra('REDE','ENVRE');
              while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
              begin
                Res := MyTerminal.SendKey( C_PF3, True );
                Res := MyTerminal.Wait( True );
                Sleep(1000);
                if vInterrompe = 1 then Exit;
              end;
              dadosexp := 'S';
              obsexp := 'N';
              exit;
            end;
          end;
        end;
        if obsexp = 'S' then
        begin
          PosicaoPalavra('REDE','ENVRE');
          if not MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then
          begin
            PosicaoPalavra('MCEX501F','ENVRE');
            while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
              Sleep(1000);
            if MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then
            begin

              v  := 0;
              ew := 0;
              for v := 0 to 9 do
              begin
                MyTerminal.CopyString2PS( v + 9,  6, ExtractWord( ew + 1, RetornaValor('25',IntToStr(vChave2)), '|') );
                Sleep(500);
                ew := ew + 1;
                if vInterrompe = 1 then Exit;
              end;

              TELA1 := MyTerminal.CopyPS2String( 3, 1, 80, Res);
              TELA2 := MyTerminal.CopyPS2String( 3, 1, 80, Res);

              i:=1;
              while i <= 25 do
              begin
                captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
                i:=i+1;
              end;
              Application.ProcessMessages;
              captura_telas.Lines.Add(' ');

              Res := MyTerminal.SendKey( C_ENTER, True );
              Res := MyTerminal.Wait( True );
              if (MyTerminal.CopyPS2String( 1, 2, 10, Res) <> '          ') and MyTerminal.ScrComp(3,72,'MCEX501E') then
              begin
                i:=1;
                while i <= 25 do
                begin
                  captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
                  i:=i+1;
                end;
                Application.ProcessMessages;
                captura_telas.Lines.Add(' ');

                PosicaoPalavra('REDE','ENVRE');
                while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
                begin
                  Res := MyTerminal.SendKey( C_PF3, True );
                  Res := MyTerminal.Wait( True );
                  Sleep(1000);
                  if vInterrompe = 1 then Exit;
                end;
                exit;
              end;
            end;
          end;
        end;
      end;
    end;

    PosicaoPalavra('FIMMERC','ENVRE');
    if MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then
    begin
      i:=1;
      while i <= 25 do
      begin
        captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
        i:=i+1;
      end;
      Application.ProcessMessages;
      captura_telas.Lines.Add(' ');

      TELA1 := MyTerminal.CopyPS2String( 1, 1, 80, Res);
      TELA2 := MyTerminal.CopyPS2String( 1, 1, 80, Res);
      Res := MyTerminal.SendKey( C_PF8, True );
      Res := MyTerminal.Wait( True );

      i:=1;
      while i <= 25 do
      begin
        captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
        i:=i+1;
      end;
      Application.ProcessMessages;
      captura_telas.Lines.Add(' ');

      while TELA1 = TELA2 do
      begin
        TELA2 := MyTerminal.CopyPS2String( 1, 1, 80, Res);
        Sleep(1000);
        if vInterrompe = 1 then Exit;
      end;
      PosicaoPalavra('MCEX501C','ENVRE');
      if not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        if vInterrompe = 1 then Exit;
        if vChave2 > vMaiorChave2 then
          break;
        Res := MyTerminal.SendKey( C_ENTER, True );
        Res := MyTerminal.Wait( True );
        Sleep(1000);

        PosicaoPalavra('MCEX501G','ENVRE');
        if MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then
        begin
          TELA1 := MyTerminal.CopyPS2String( 15, 1, 80, Res);
          TELA2 := MyTerminal.CopyPS2String( 15, 1, 80, Res);
          Res := MyTerminal.SendKey( C_ENTER, True );
          Res := MyTerminal.Wait( True );
          while TELA1 = TELA2 do
          begin
            TELA2 := MyTerminal.CopyPS2String( 15, 1, 80, Res);
            Sleep(1000);
            if vInterrompe = 1 then Exit;
          end;
          i:=1;
          while i <= 25 do
          begin
            captura_telas.Lines.Add( MyTerminal.CopyPS2String( i, 1, 80, Res) );
            i:=i+1;
          end;
          Application.ProcessMessages;
          captura_telas.Lines.Add(' ');
          PosicaoPalavra('CONCLUIDO','ENVRE');
//          Break;
        end;
      end;
    end else begin
      PosicaoPalavra('REDE','ENVRE');
      if not MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then
      begin
//        BoxMensagem('Ocorreu um erro na transmissão : NÃO CONCLUÍDO', 3 );
        PosicaoPalavra('REDE','ENVRE');
        while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
        begin
          Res := MyTerminal.SendKey( C_PF3, True );
          Res := MyTerminal.Wait( True );
          Sleep(1000);
          if vInterrompe = 1 then Exit;
        end;
      end;
    end;
  end;

  PosicaoPalavra('MCEX501G','ENVRE');
  if MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then
  begin
    TELA1 := MyTerminal.CopyPS2String( 15, 1, 80, Res);
    TELA2 := MyTerminal.CopyPS2String( 15, 1, 80, Res);
    Res := MyTerminal.SendKey( C_ENTER, True );
    Res := MyTerminal.Wait( True );
    while TELA1 = TELA2 do
    begin
      TELA2 := MyTerminal.CopyPS2String( 15, 1, 80, Res);
      Sleep(1000);
      if vInterrompe = 1 then Exit;
    end;
  end;
  PosicaoPalavra('CONCLUIDO','ENVRE');

  Sleep(500);

  PosicaoPalavra('MCEX300','ENVRE');
  if ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    Res := MyTerminal.SendKey( C_PF3, True );
    Res := MyTerminal.Wait( True );
    Sleep(1000);
  end;
end;

function TFrmIntegracaoBSH.VerificaConexaoEmulador( Sessao : String ): Boolean;
var
   Res: Integer;
begin
     Result := False;

     try
        Res := MyTerminal.ResetaConectaPS( Sessao );
        if Res = 0 then begin
           Result := True
        end;
     except
     end;
end;


function TFrmIntegracaoBSH.PosicionaTelaMapaBrasil: Boolean;
var
   Tela1,
   Tela2 : String;
   Res : Integer;
   DataHora1,
   DataHora2 : String;
   Tempo : Double;
   DataHoraLoop : TDateTime;
   l_Abortar : Boolean;
   escape : Integer;
begin

//     Result := True;

     if VerificaConexaoEmulador( qry_param.FieldByName('TX_NOME_SESSION').AsString ) then
     begin
        l_Abortar := False;

        PosicaoPalavra('REDECOMSERPROBR','ENVRE');
        if MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then
        begin
           Res := MyTerminal.SendKey( C_ENTER, True );
           Res := MyTerminal.Wait( True );
           Result := True;
           Sleep(4000);
        end
        else begin
             escape := 0;
             PosicaoPalavra('REDESERPROBR','ENVRE');
             while not ( MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                 Tela1 := MyTerminal.CopyScreen2String( Res );
                 Tela2 := MyTerminal.CopyScreen2String( Res );
                 Res := MyTerminal.SendKey( C_PF3 );
                 DataHora1    := '01/12/2000 00:00:00';
                 DataHora2    := '01/12/2000 00:00:' + IntToStr( li_timeout );
                 Tempo        := StrToDateTime( DataHora2 ) - StrToDateTime( DataHora1 );
                 DataHoraLoop := Now;
                 while Tela1 = Tela2 do begin
                       Tela2 := MyTerminal.CopyScreen2String( Res );
                       Application.ProcessMessages;
                       if Now > ( DataHoraLoop + Tempo ) then begin
                          Result := False;
                          l_Abortar := True;
                          Break;
                       end;
                 end;
                 if l_Abortar then begin
                    Break;
                 end;
                 PosicaoPalavra('REDECOMSERPROBR','ENVRE');
                 if MyTerminal.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
                    Res := MyTerminal.SendKey( C_ENTER, True );
                    Res := MyTerminal.Wait( True );
                    Result := True;
                    {escape := escape + 1;
                    if escape > 30 then
                    begin
                        break;
                    end;}
                    Sleep(4000);
                    exit;
                 end;
                 PosicaoPalavra('REDECOMSERPROBR','ENVRE');
             end;
             Result := True;
        end;

     end;

end;

procedure TfrmIntegracaoBSH.PosicaoPalavra( id_chave, tipo : String );
begin
   with TQuery.Create(application) do
   begin
     DatabaseName := 'DBBROKER';
     SQL.Clear;
     SQL.Add('SELECT PALAVRA, LINHA_PALAVRA, COLUNA_PALAVRA, TAMANHO FROM TENVIA_EXP_SISCOMEX');
     SQL.Add('WHERE ID_CHAVE = ' + QuotedStr(id_chave) + ' AND TIPO = ' + QuotedStr(tipo));
     Open;
     palavra := FieldByName('PALAVRA').AsString;
     linha_palavra := FieldByName('LINHA_PALAVRA').AsInteger;
     coluna_palavra := FieldByName('COLUNA_PALAVRA').AsInteger;
     tamanho := FieldByName('TAMANHO').AsInteger;
     Close;
     Free;
   end;
end;

procedure TfrmIntegracaoBSH.SpeedButton1Click(Sender: TObject);
begin
  SpeedButton2.Caption := 'Interromper...';
  if MessageDlg('Antes de continuar, verifique se o I W W está sendo executado '+#13+#10+'na sua maquina. Clique ok para prosseguir.', mtInformation, [mbOK], 0) = mrOk then
    TransmiteRE(edt_nm_file_.Text,'0001');
  SpeedButton2.Caption := 'Fechar';
end;


procedure TfrmIntegracaoBSH.FormCreate(Sender: TObject);
begin
  vInterrompe := 0;
end;

end.
