unit GSMLIB;

interface

uses
  Variants,   sysutils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls,
  ComCtrls, Tabnotbk, dbtables, Registry, Printers, Funcoes, DateUtils, PGGP001,
  IdMessage, IdSMTP, IdSSLOpenSSL, ServicoNovo, DBClient, cxMaskEdit;

// Funções de Uso Geral

type
  TStringArray = array of String;

function VerImp : String;
function Commit(DataSet: DBTables.TQuery) : Boolean;
procedure ApagaDados( Tabela : String; nr_identificador: Integer );
function FastLookup( Tabela : String; Campo : TStringField; Codigo: String; Nome: String; Filtro: String ) : String;
function FastEdit( Tabela : String; Campo : TcxMaskEdit; Codigo: String; Nome: String ) : String;overload;
function FastEdit( Tabela : String; Campo : TMaskEdit; Codigo: String; Nome: String ) : String;overload;
function Lookup( Query : DBTables.TQuery; Campo : TStringField; Codigo: String; Nome: String ) : String;
function Num_To_Str(nValor : Double; nTamTotal : Integer; nFracao : Integer) : String;
function Tipo_Importador( cTipo : String ) : String;
function Replicate(cLetra : String; nNum : Integer ) : String;
function FAAAAMMDD( dt : String ) : String;
function NtoSouN( b : String ) : String;
function BtoSouN( b : Boolean ) : String;
function FStrZero(s : String; i : Integer) : String;
function FFloatToStr( n : Double; i, d : Integer) : String;
function Processo( str_processo : string ) : string;
function Processo_Nulo( sProcesso : string ) : boolean;
function Space(i : Integer) : String;
function FStrSpace( Str : String; i : Integer) : String;
function StrZero(nNumero : Double; i : Integer) : String;
function PoeZeros(s : string; i : Integer) : String;
function AllTrim( cstring : string ) : string;
function PoePic( cNumero : String; cMascara : String ) : String;
function TiraPic( cNumero : String ) : String;
function TiraVirg( cNumero : String ) : String;
function TiraPonto( cNumero : String ) : String;
function TrocaStr( cMasc : string; cCaracter : string; i : integer ): string;
procedure ValidCodigo( dbedit_Codigo : TDbEdit );
procedure ValCodEdt( Edit_Codigo : TMaskEdit );overload;
procedure ValCodEdt( Edit_Codigo : TcxMaskEdit ); overload;
function Tab_Descricao( tabela : TTable; codigo : string; str_campo : string ) : String;
procedure NovoCodigo( Codigo : TStringField; Tabela : TTable; cIndice : String );
function UltCod( Query  : DBTables.TQuery; NovoCodigo : TStringField ) : String; overload;
function UltCod( Query  : DBTables.TQuery; NovoCodigo : TIntegerField ) : Integer; overload;
procedure SalvaMensagensDeErros(DBx: EDBEngineError; ErrorMemo: TMemo);
function GeraDigitoBoleto( nr_boleto : String ) : String;
function Gera_Digito_De_Verificacao( str_unid_neg, str_produto, str_processo : String ) : String;
function At( Arg1, Arg2: string ) : Boolean;
function nAt( Arg1, Arg2: string ) : Integer;
function nAtr( Arg1, Arg2: string; inicio: Integer; fim: Integer ) : Integer;
function BoxMensagem( s_Mensagem : string; nTipo : integer ) : Boolean;
function DateToStr8( dt_Data : TDateTime ) : String;
function Arredondar( nNumero : Double; nCasas : Integer ) : Double;
function MyRound( nNumero : Double; nCasas : Integer ) : Double;
procedure NullToZero( oCampo : TField );
procedure SetPrinter( cComando : String );
function fLocaliza( Query : DBTables.TQuery; Chave : String; Campo : String ) : Boolean;
procedure Localiza( Query : DBTables.TQuery; Chave : String; Campo : String );
procedure Filtra( Query : DBTables.TQuery; Chave : String; Campo : String );
function FFloatToMsk( m : string; n : Double) : String;
function FUF( uf : string) : String;
function DigitoRisc( Numero : string) : String;
procedure TrataErro(E: Exception );
function CNPJ(cCodigo: string) : Boolean;
function CPF(cCodigo: string) : Boolean;
function CodBarra1DV( cCodigo: String; lAvisa: Boolean ): Boolean;
function CodBarra3DV( cCodigo: String; lAvisa: Boolean ): Boolean;
function SaltaLinhas(nLinhas : Integer) : String;
procedure AtribuiDireitos(var st_modificar: Boolean; var st_incluir: Boolean;
                          var st_excluir: Boolean);
function DataCrystal( str_data : String) : String;
function Emite( Campo : TField; Tam : Byte ) : String;
function Zonar( Valor : Double ) : String;

function Extenso(wvalorexte : Double) : String;
function Extensao(windice : Integer; wparte : String) : String;
procedure EncheMatriz;
function FormataData(const S: String): String;
procedure FormataMemo(Campo : TField; Largura : Integer);
procedure Cons_On_line( cNomeBanco:String;   cNomeTabela:String;
                        fcampo:TStringField; cCaption:String;
                        nCodigo:Integer;     Filter : String;
                        TypeDataSet:String );
procedure Cons_On_line_Texto( cNomeBanco:String; cNomeTabela:String;
                              fcampo:TMaskEdit;  cCaption:String;
                              nCodigo:Integer;   Filter : String );

procedure Contabiliza( qry_contab_: DBTables.TQuery; qry_contab_lanc_: DBTables.TQuery;
                       qry_contab_gerencial_: DBTables.TQuery; nr_contab: String;
                       str_cd_colig : String );
procedure ContabilizaContMaster( qry_contab_contmaster_: DBTables.TQuery;
                                 qry_contab_lanc_contmaster_: DBTables.TQuery;
                                 qry_contab_gerencial_contmaster_: DBTables.TQuery;
                                 nr_contab: String );
procedure ContabilizaSI( qry_contab_si_: DBTables.TQuery; qry_contab_lanc_si_: DBTables.TQuery; nr_contab: String );
function fsp_DI_calculo( nr_processo: String; at_taxa: Boolean ):AnsiString;
function fsp_DA_calculo( nr_processo: String ):AnsiString;
function fsp_Nac_calculo( nr_processo: String ):AnsiString;
procedure AtInfoCompl( nr_processo: String );
procedure HabDes(Sender : TObject; Op : Boolean );
function FormataFloat(s : String; i : Double) : String;
procedure ExibeErro( nm_sp: String; cd_erro: Integer; Item : String; vl_sd : Double );
function Sequencia( Identificador: String; Chave : String ) : Integer;
function LeFloat(Inteiro : String; Decimal: String) : Double;
function VerIntegridade : Boolean;
function CampoTXT( Campo : TField; Tam : Byte ) : String;
function CampoTXTNum( Campo : TField; Tam : Byte ): String;
function ConvAscii( Texto : String ): String;
procedure CloseStoredProc( Componente : TStoredProc );
procedure ExecStoredProc( Componente : TStoredProc );
procedure CloseQuery( Componente : DBTables.TQuery );
procedure OpenQuery( Componente : DBTables.TQuery );
function JustificaString(Campo : String; Tamanho : Integer): String;
function achou_( Arg1, Arg2: string ) : Boolean;
function FNullToZero( Campo : String ) : String;
function IE(const UF, IE: String):Boolean;
procedure Cria_SQL( TEXTO : String );
function PoeEmEdicao(vTable : DBTables.TQuery) : Boolean;
procedure CopyFileLpt1(const FileName, DestName: TFileName);
function CheckDate(Sender: TField; Text: String): Boolean;
function ExtractWord(pPosicao : Integer; pTexto,pBusca : String) : string;
function ContaOcorrencias(pTexto,pSubString : string) : Integer;
Procedure DesmontaLancContasPagar(Const DtLanc : TDateTime; Const NrRef : String);
function VerificaCAT63 (pMetodo : Integer; pProcesso, pAdicao, pMercadoria : String) : Boolean;
function OpenAddressBook(pTop, pLeft : Integer) : string;
function ValidaInsPreEmbarque(NR_PROCESSO: String): String;
function GeraArquivoDigital(APrefixo, AExt, ANR_PROCESSO: String): String;
function EnviaEmail(Assunto, Corpo, Destinatario: String; Anexos: array of String): Boolean; overload;
function EnviaEmail(Assunto, Corpo, Destinatario: String): Boolean; overload;
function EnviaEmailDe(Assunto, Corpo, Destinatario, Remetente: String; Anexos: array of String): Boolean; overload;
function EnviaEmailDe(Assunto, Corpo, Destinatario, Remetente: String): Boolean; overload;
function EnviaEmailHtml(Assunto, Html, Destinatarios: String; Anexos: array of String): Boolean; overload;
function EnviaEmailHtml(Assunto, Html, Destinatarios: String): Boolean; overload;
function EnviaEmailHtmlDe(Assunto, Html, Destinatarios, Remetente: String; Anexos: array of String): Boolean; overload;
function EnviaEmailHtmlDe(Assunto, Html, Destinatarios, Remetente: String): Boolean; overload;
function StringsToArray(Strings: TStrings): TStringArray;
Procedure Altera_Reg_Win(Path, Param, Valor, Tipo : String);
procedure LocalizaCds( Query : TClientDataSet; Chave : String; Campo : String );
function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; stdcall;

function VersaoTeste: Boolean;

function GetLocalComputerName : string;

var
  ServidorEmUso: String;

implementation

uses PGCH009, PGGP017, PGSM096, PGSM148, FileText, uCatalogoEnderecos, PGGA012,
  StrUtils, IniFiles, DelRun;

var
  acentena : Array[1..10] Of String[20];
  adezena  : Array[1..10] Of String[20];
  aunidade : Array[1..10] Of String[20];
  lPassouMil, lPassouMilhao, lPassouBilhao : Boolean;
  vTipoLocal: Integer = 0; {0: Não definido; 1: Produção; 2: Teste}

function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; external 'C:\DDBROKER\MYEMAIL.DLL';

{$HINTS OFF}
function JustificaString(Campo : String; Tamanho : Integer): String;
var
  cTexto, cTexto2 : String;
  i, j : Integer;
begin
  if Tamanho <= 0 then
  begin
    JustificaString := Campo;
  end
  else
  begin
    cTexto2 := '';
    Campo   := Campo + ' ';
    while Length(Campo) > 0 do
    begin
      if Length(Campo)<=Tamanho then
      begin
        cTexto2 := cTexto2 + FStrSpace( Trim(Campo), Tamanho);
        Campo   := '';
      end
      else
      begin
        cTexto := Copy(Campo,1,(Tamanho + 1));
        i      := Length(cTexto);
        j      := i;
        while i > 0 do
        begin
          if ( Copy(cTexto, i, 1) = ' ' ) or ( Copy(cTexto, i, 1) = #13 ) then
          begin
            j := i;
            break;
          end;
          i := i - 1;
        end;
        cTexto2 := cTexto2 + FStrSpace( Trim( Copy( cTexto,1,(j-1))), Tamanho );
        Campo   := Copy(Campo,(j),Length(Campo)-i);
      end;
    end;
    JustificaString := cTexto2;
  end;
end;
{$HINTS ON}

procedure SetPrinter( cComando : String );
var
  PrintText: TextFile;	// declare a text-file variable
begin
  AssignFile( PrintText, 'LPT1' ); // associate text file to printer device
  Rewrite(PrintText);	  // create and open output file
  try
    Write(PrintText, cComando );	 // write each line to printer
  finally
    CloseFile(PrintText);	         // close output file when done
  end;
end;

procedure NullToZero( oCampo : TField );
begin
  if oCampo.IsNull then
  begin
     if oCampo is TFloatField then
     begin
        oCampo.AsFloat := 0;
        Exit;
     end;
     if oCampo is TIntegerField then
     begin
        oCampo.AsInteger := 0;
     end
  end;
end;

function Arredondar( nNumero : Double; nCasas : Integer ) : Double;
Var
  cNumero : String[40];
  cInteiro : String[20];
  cFracao : String[20];
  //  Mascara : String;
  nPosicaoPonto : Integer;
  nDigito : Integer;
begin

  cNumero := FloatToStr( nNumero );
(*
  if nAt( 'E', cNumero ) > 0 then
  begin
    Mascara := '#0,.' + Replicate( '0', nCasas );
    cNumero := FormatFloat( Mascara, nNumero );
  end;
*)

  nPosicaoPonto := nAt( ',', cNumero );

  if nPosicaoPonto > 0 then
  begin
    cInteiro := Copy( cNumero, 1, nPosicaoPonto - 1 );
    cFracao := Copy( cNumero, nPosicaoPonto + 1, Length( cNumero ) );

    if Length(cFracao) <> nCasas then

    if Length(cFracao) < nCasas then
       begin
         cFracao := cFracao + Copy( '000000000000', 1, nCasas - Length( cFracao ) )
       end
    Else
       begin
         cFracao := Copy( cFracao, 1, nCasas + 1 );
         nDigito := StrToInt( Copy( cFracao, nCasas + 1, 1 ) );
         if nDigito >= 5 then
           cFracao := StrZero(StrToFloat( Copy( cFracao, 1, nCasas ) ) + 1 , ncasas)
         Else
           cFracao := Copy(cFracao, 1, nCasas);
       end;

    if length (cFracao) <> ncasas then
    begin
      cInteiro := FloattoStr(StrtoFloat(cInteiro) + 1 );
      cFracao  := Copy(cFracao,2,Length(cFracao));
    end;

    cNumero := cInteiro + ',' + cFracao;
    nNumero := StrToFloat( cNumero );

  end;

  Result := nNumero;

end;

function FAAAAMMDD( dt : String ) : String;
begin
  if dt <> '' then
    FAAAAMMDD := Copy( dt, 5, 4 ) + Copy( dt, 3, 2) + Copy( dt, 1, 2)
  else
    FAAAAMMDD := '00000000';
end;

function NtoSouN( b : String ) : String;
begin
  if b = '1' then
     NtoSouN := 'S'
  Else
     NtoSouN := 'N';
end;

function BtoSouN( b : Boolean ) : String;
begin
  if b = True then
     BtoSouN := 'S'
  Else
     BtoSouN := 'N';
end;

function Tab_Descricao( tabela : TTable; codigo : string; str_campo : string ) : String;
begin
  if Tabela.FindKey([codigo]) then
     Result := Tabela.fieldByName( str_campo ).AsString
  else
     Result := '';
end;

function BoxMensagem( s_Mensagem : string; nTipo : integer ) : Boolean;
begin
  BoxMensagem := False;
  case nTipo of
    1: begin   // Janela para mensagem de Confirmação 
         BoxMensagem := MessageDlg( s_Mensagem, mtConfirmation, [mbYes, mbNo], 1 ) = mrYes;
       end;
    2: begin   // Janela para mensagem de Erro 
         BoxMensagem := MessageDlg( s_Mensagem, mtError, [mbOk], 0 ) = mrOk;
       end;
    3: begin   // Janela para mensagem de Aviso 
         BoxMensagem := MessageDlg( s_Mensagem, mtWarning, [mbOk], 0 ) = mrOk;
       end;
  end;
end;

function Processo( str_processo : string ) : string;
begin
  Processo := str_processo;
end;

function Processo_Nulo( sProcesso : string ) : boolean;
begin
  Result := False;
  if sProcesso = ''        then Result := True;
  if sProcesso = ''        then Result := True;
  if sProcesso = Space(18) then Result := True;
end;

function At( Arg1, Arg2: string ) : Boolean;
Var
  nTamanho1 : Integer;
  nTamanho2 : Integer;
  i : Integer;
begin
  Result := false;
  nTamanho1 := length( Arg1 );
  nTamanho2 := length( Arg2 );
  if nTamanho1 > 0 then
    for i := 1 to nTamanho2 do
      if ( Copy( Arg2, i, nTamanho1 ) = Arg1 ) then
         begin
           Result := True;
           Exit
         end;
end;

function achou_( Arg1, Arg2: string ) : Boolean;
begin
  Result := false;
  if length( Arg1 ) > 0 then
  if Uppercase( Copy( Arg2, 1, length( Arg1 ))) = Uppercase( Arg1 ) then
  begin
     Result := True;
     Exit;
  end;
end;

function nAt( Arg1, Arg2: string ) : Integer;
Var
  nTamanho1 : Integer;
  nTamanho2 : Integer;
  i : Integer;
begin
  Result := 0;
  nTamanho1 := length( Arg1 );
  nTamanho2 := length( Arg2 );
  if nTamanho1 > 0 then
    for i := 1 to nTamanho2 do
      if ( Copy( Arg2, i, nTamanho1 ) = Arg1 ) then
         begin
           Result := i;
           Exit
         end;
end;

function Gera_Digito_De_Verificacao( str_unid_neg, str_produto, str_processo : String ) : String;
Const
  Pesos = '9739179379';
Var
  i : byte;
  str_digito : string[10];
  dbl_soma : double;
begin
  str_digito := str_unid_neg +
                str_produto +
                str_processo;
  dbl_soma := 0;
  for i := 1 to 10 do
  begin
    dbl_soma := dbl_soma +
    (
    StrToFloat( copy( str_digito, i, 1 ) ) *
    StrToFloat( copy( Pesos, i, 1 ) )
    );
  end;
  str_digito := FloatToStr( dbl_soma );
  Result := copy( str_digito, length(str_digito), 1 )
end;

procedure SalvaMensagensDeErros(DBx: EDBEngineError; ErrorMemo: TMemo);
var
  I:           Integer;
begin
 with ErrorMemo do
 begin
  // Esvaziar o Memo 
  Clear;
  // Display the number of error messages.
  Lines.Add('Number Of Messages = ' +
    IntToStr(DBx.ErrorCount));
  Lines.Add('---------------------------');
  // Display all of the messages on the BDE error stack.
  for I := 0 to DBx.ErrorCount - 1 do
  begin
    Lines.Add('Message: ' + DBx.Errors[i].Message);
    Lines.Add('Category: ' +
      IntToStr(DBx.Errors[i].Category));
    Lines.Add('Error Code: ' +
      IntToStr(DBx.Errors[i].ErrorCode));
    Lines.Add('SubCode: ' +
      IntToStr(DBx.Errors[i].SubCode));
    Lines.Add('Native Error: ' +
      IntToStr(DBx.Errors[i].NativeError));
    Lines.Add('---------------------------');
  end; // for
 end;
end;

function AllTrim( cstring : string ) : string;
var
  i : byte;            //  byte 0..255 
  s : string;
begin
  s := '';
  for i := 1 to Length( cstring ) do
  begin
    if Copy( cstring, i, 1 ) <> ' ' then
       s := s + Copy( cstring, i, 1 );
  end;
  AllTrim := s;
end;

(*
  O Código abaixo é reaproveitável
  s := '';
  while Pos(' ', cstring ) > 0 do
  begin
     i := Pos(' ', cstring);
     if i = 1 then
        cstring := Copy(cstring,i+2,length( cstring ));
     if i = length( cstring ) then
        cstring := Copy(cstring,1,length( cstring )-1);
     while pos( ' ', cstring ) > 0 do
     begin
       i := Pos(' ', cstring);
       cstring := Copy( cstring,  1, i-1 ) +
                  Copy( cstring,i+1, length(cstring) );
     end
  end;

    s : array[0..20] of char;
  n : Double;
  Code : Integer;
begin
  n := StrToFloat( cNumero );
  StrPCopy( s, cNumero );
  Format( 'm%', [s] );
*)


// Sistema nacional 999.999.999,99
function PoePic( cNumero : String; cMascara : String ) : String;
var
  c : String[1];
  i : Integer;
  nTam : Integer;
  nPos : Integer;
  cFrac : string;
  nFrac : Integer;
  cInt : string;
  nInt : Integer;
  cMasc1 : string;
  cMasc2 : string;
begin
  cNumero := AllTrim( cNumero );
  if IsNumeric(cNumero) then
     begin

       nPos := Pos( ',', cMascara );
       cMasc1 := Copy( cMascara, 1, nPos - 1 );
       cMasc2 := Copy( cMascara, nPos + 1, Length( cMascara ) );

       //  1o. Passo - Separar a parte inteira a fracionaria 
       nPos := Pos( ',' , cNumero );
       if nPos > 0 then
         begin
            nTam := Length( cNumero ) - nPos + 1;
            cFrac := Copy( cNumero, nPos + 1, nTam );
            cInt := Copy( cNumero, 1, nPos - 1 );
            if Length(cFrac) > Length(cMasc2) then
               cFrac := copy( cFrac, 1, Length(cMasc2) )
            else
               cFrac := PoeZeros( cFrac, Length(cMasc2) );
         end
       else
         begin
           cFrac := '';
           cInt := cNumero;
         end;

       // Encaixa o Valor Inteiro na Mascara
       nInt := length( cInt );
       nFrac := length( cFrac );
       For i := Length( cMasc1 ) downto 1 do
       begin
          // Pega o último caracter na sequência
          if (Copy( cMasc1, i, 1 ) <> '.') and (nInt > 0) then
            begin
              c := Copy( cInt, nInt, 1 );
              cMasc1 := TrocaStr( cMasc1, c, i );
              Dec( nInt );
            end
          else
            begin
              if nInt = 0 then cMasc1 := TrocaStr( cMasc1, ' ', i );
            end;
       end;

       // Encaixa o Valor Fracionario na Mascara 
       For i := Length( cMasc2 ) downto 1 do
       begin
          // Pego o Ultimo caracter na sequencia 
          if nFrac > 0 then
            begin
              c := Copy( cFrac, nFrac, 1 );
              cMasc2 := TrocaStr( cMasc2, c, i );
              Dec( nFrac );
            end
          else
            begin
              cMasc2 := TrocaStr( cMasc2, '0', i );
            end;
       end;
       if Copy(cMasc1,length(cMasc1),1) = ' ' then
          cMasc1 := Copy( cMasc1, 1, length(cMasc1) - 1 ) + '0';
       PoePic := cMasc1 + ',' + cMasc2;
     end
   else
     PoePic := '0,00';
     // n := StrToFloat( cNumero );
end;


function Space( i : Integer) : String;
var
  s : string;
begin
  s := '';
  While Length( s ) < i do s := s + ' ';
  Space := s;
end;

function FStrSpace( Str : String; i : Integer) : String;
Var
  nr_posicoes : integer;
begin
  { retira ENTERS e PARAGRAFOS do TEXTO }
  str:=StringReplace(str, #13, '', [rfReplaceAll] );
  str:=StringReplace(str, #10, ' ', [rfReplaceAll] );
  //
  nr_posicoes := Length( str );
  if nr_posicoes < i then
    begin
      FStrSpace := str + Space( i - nr_posicoes );  // Completa com espaços
    end
  Else if nr_posicoes > i then
    begin
      FStrSpace := copy( str, 1, i );   // Trunca a string
    end
  Else
    FStrSpace := Str;
end;

function StrZero(nNumero : double; i : Integer) : String;
var
  s : string;
begin
  try
    s := FloatToStr( nNumero )
  except
    s := ''
  end;
  While Length( s ) < i do s := '0' + s;
  StrZero := s
end;

function FStrZero(s : String; i : Integer) : String;
begin
  While Length( s ) < i do s := '0' + s;
  FStrZero := s
end;

function FFloatToStr( n : Double; i, d : Integer) : String;
Var
  s_parte_inteira : string;
  s_parte_decimal : string;
  s : string;
begin
  if n > 0 then
    begin
      s := FloatToStr( ( n + 0.00000001 ) );
      if nAt ( ',', s ) > 0 then
         begin
           s_parte_inteira := Copy( s, 1, nAt( ',', s ) - 1 );
           if d > 0 then
              s_parte_decimal := Copy( s, nAt( ',', s ) + 1, d );
           Result := FStrZero( s_parte_inteira, i );
           if d > 0 then
              Result := Result + FStrZero( s_parte_decimal, d );
         end
      else
         Result := FStrZero ( s , i ) + FStrZero ( '' , d );
    end
  else
    begin
      Result := FStrZero( '', i );
      if d > 0 then
         Result := Result + FStrZero( '', d );
    end;
end;

function PoeZeros(s : string; i : Integer) : String;
begin
  While Length( s ) < i do
    s := s + '0';
  PoeZeros := s
end;

function TrocaStr( cMasc : string; cCaracter : string; i : integer ): string;
begin
  TrocaStr := Copy( cMasc, 1, i-1 ) +
              cCaracter +
              Copy( cMasc, i+1, length( cMasc ) );
end;

function TiraPic( cNumero : String ) : String;
begin
  While Pos('.',cNumero) > 0 do
    cNumero := TrocaStr( cNumero, ' ', Pos('.',cNumero) );
  TiraPic := Alltrim(cNumero)
end;

function TiraVirg( cNumero : String ) : String;
begin
  while Pos(',',cNumero) > 0 do
    cNumero := TrocaStr( cNumero, ' ', Pos( ',', cNumero ) );
  TiraVirg := Alltrim( cNumero )
end;

function TiraPonto( cNumero : String ) : String;
begin
  while Pos('.',cNumero) > 0 do
    cNumero := TrocaStr( cNumero, ' ', Pos( '.', cNumero ) );
  TiraPonto := Alltrim( cNumero )
end;

procedure ValidCodigo( dbedit_Codigo : TDbEdit );
Var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin
  try
    lDigitouLetras := False;
    if (dbedit_Codigo.Field = nil) or (dbedit_Codigo.Field.Size = 0) then
      Exit;
    nFim := Length(Trim(dbedit_Codigo.Text));
    if (nFim > 0) and (nFim <> dbedit_Codigo.Field.Size)then
    begin
      //  VERIFICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO 
      nLoop := 1;
      Repeat
        if Not (dbedit_Codigo.Text[nLoop] In ['0'..'9'] ) then
           lDigitouLetras := True;
        nLoop := nLoop + 1;
      Until (lDigitouLetras) or ( nLoop > nFim );

      //  SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO 
      if Not( lDigitouLetras ) then
      begin
        nNumero := StrToFloat(dbedit_Codigo.Text);
        if Not dbedit_codigo.ReadOnly then
        dbedit_Codigo.field.AsString := StrZero( nNumero, dbedit_Codigo.Field.Size );
      end;
    end;
  except
    Exit;
  end;
end;

procedure ValCodEdt( Edit_Codigo : TMaskEdit );
var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin

  lDigitouLetras := False;

  if Length(Trim(Edit_Codigo.Text)) = 0 then Exit;

  nFim := length(Edit_Codigo.Text)-1;

  // VERifICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO
  nLoop := 0;
  Repeat
    if (Edit_Codigo.Text[nLoop]
    In ['a'..'z','A'..'Z']) then lDigitouLetras := True;
    nLoop := nLoop + 1;
  Until (lDigitouLetras = True) or ( nLoop > nFim );

  // SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO
  if Not( lDigitouLetras ) then
  begin
    nNumero := StrToFloat(Edit_Codigo.Text);
    if Edit_codigo.readonly = false then
    Edit_Codigo.Text := StrZero( nNumero, Edit_Codigo.MaxLength );
  end;
end;

procedure ValCodEdt( Edit_Codigo : TcxMaskEdit );
var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin

  lDigitouLetras := False;

  if Length(Trim(Edit_Codigo.Text)) = 0 then Exit;

  nFim := length(Edit_Codigo.Text)-1;

  // VERifICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO
  nLoop := 0;
  Repeat
    if (Edit_Codigo.Text[nLoop]
    In ['a'..'z','A'..'Z']) then lDigitouLetras := True;
    nLoop := nLoop + 1;
  Until (lDigitouLetras = True) or ( nLoop > nFim );

  // SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO
  if Not( lDigitouLetras ) then
  begin
    nNumero := StrToFloat(Edit_Codigo.Text);
    if Edit_codigo.properties.readonly = false then
    Edit_Codigo.Text := StrZero( nNumero, Edit_Codigo.properties.MaxLength );
  end;
end;

procedure NovoCodigo( Codigo : TStringField; Tabela : TTable; cIndice : String );
Var
  nCodigo : Integer;
  cNovoCodigo : String;
  cIndOld : String;
  lFiltrado : Boolean;
begin
  // Inicializa variáveis
  nCodigo := 1;
  cNovoCodigo := StrZero( nCodigo, Codigo.Size );
  With Tabela Do
  begin
    DisableControls;
    cIndOld := IndexFieldNames;
    IndexFieldNames := cIndice;
    lFiltrado  := Filtered;
    Filtered := False;
    First;
    While FindKey( [cNovoCodigo] ) Do
    begin
      Inc(nCodigo);
      cNovoCodigo := StrZero( nCodigo, Codigo.Size );
    end;
    Filtered := lFiltrado;
    IndexFieldNames := cIndOld;
    Append;
    EnableControls;
    Codigo.AsString  := cNovoCodigo;
  end
end;

function UltCod( Query  : DBTables.TQuery; NovoCodigo : TStringField ) : String; overload;
var
  nCodigo, Code : Integer;
begin
  Query.Close;
  if Query is TQuery then
    TQuery(Query).Open
  else
    Query.Open;
  Val(NovoCodigo.AsString, nCodigo, Code);
  Inc(nCodigo);
  Result := StrZero( nCodigo, NovoCodigo.Size );
  Query.Close;
end;

function UltCod( Query  : DBTables.TQuery; NovoCodigo : TIntegerField ) : Integer; overload;
var
  nCodigo, Code : Integer;
begin
  Query.Close;
  if Query is TQuery then
    TQuery(Query).Open
  else
    Query.Open;
  Val(IntToStr(NovoCodigo.AsInteger), nCodigo, Code);
  Inc(nCodigo);
  Result := nCodigo;
  Query.Close;
end;

function DateToStr8( dt_Data : TDateTime ) : String;
Var
  cdia : String[10];
begin
  cDia := Copy( DateTimeToStr( dt_Data ), 1, 10 );
  Result := Copy( cDia, 1, 2 ) + Copy( cDia, 4, 2 ) + Copy( cDia, 7, 4 );
end;

function FFloatToMsk( m : String; n : Double ) : String;
Var
  s : string;
  i : integer;
begin
  i := length ( m );
  s := FormatFloat ( m , n );
  While Length( s ) < i do s := ' ' + s;
  FFloatToMsk := s;
end;

function FUF( uf : String ) : String;
begin
  if uf = 'AC' then FUF := 'Acre' else
  if uf = 'AP' then FUF := 'Amapa' else
  if uf = 'AL' then FUF := 'Alagoas' else
  if uf = 'AM' then FUF := 'Amazonas' else
  if uf = 'BA' then FUF := 'Bahia' else
  if uf = 'CE' then FUF := 'Ceara' else
  if uf = 'ES' then FUF := 'Espirito Santo' else
  if uf = 'GO' then FUF := 'Goias' else
  if uf = 'MA' then FUF := 'Maranhao' else
  if uf = 'MG' then FUF := 'Minas Gerais' else
  if uf = 'MT' then FUF := 'Mato Grosso' else
  if uf = 'MS' then FUF := 'Mato Grosso do Sul' else
  if uf = 'PA' then FUF := 'Para' else
  if uf = 'PB' then FUF := 'Paraiba' else
  if uf = 'PE' then FUF := 'Pernambuco' else
  if uf = 'PI' then FUF := 'Piaui' else
  if uf = 'PR' then FUF := 'Parana' else
  if uf = 'RJ' then FUF := 'Rio de Janeiro' else
  if uf = 'RS' then FUF := 'Rio Grande do Sul' else
  if uf = 'RO' then FUF := 'Rondonia' else
  if uf = 'RR' then FUF := 'Roraima' else
  if uf = 'RJ' then FUF := 'Rio de Janeiro' else
  if uf = 'RN' then FUF := 'Rio Grande do Norte' else
  if uf = 'SC' then FUF := 'Santa Catarina' else
  if uf = 'SE' then FUF := 'Sergipe' else
  if uf = 'SP' then FUF := 'Sao Paulo' else
  if uf = 'TO' then FUF := 'Tocantins' else
  FUF := '';
end;

function DigitoRisc( Numero : string) : String;
var ndigito : double;
begin
  if Numero <> '' then
     if IsNumeric(Numero) then
     begin
       ndigito := (strtofloat(copy(Numero,1,1)))   +
                  (strtofloat(copy(Numero,2,1))*7) +
                  (strtofloat(copy(Numero,3,1))*3) +
                  (strtofloat(copy(Numero,4,1)))   +
                  (strtofloat(copy(Numero,5,1))*7);
       ndigito := strtofloat(copy(floattostr(ndigito),length(floattostr(ndigito)),1));
       ndigito := 10 - ndigito;
       ndigito := strtofloat(copy(floattostr(ndigito),length(floattostr(ndigito)),1));
       DigitoRisc := floattoStr(ndigito);
     end
     else
       DigitoRisc := ' '
  else
       DigitoRisc := ' '
end;

procedure Localiza( Query : DBTables.TQuery; Chave : String; Campo : String );
begin
  if Chave = '' then Query.First
  else
  begin
    try

      Query.Locate(Campo, Chave, [loCaseInsensitive, loPartialKey]);
    except
      BoxMensagem('Chave inválida!', 2);
    end;
  end;
end;

procedure LocalizaCds( Query : TClientDataSet; Chave : String; Campo : String );
begin
  if Chave = '' then Query.First
  else
  begin
    try

      Query.Locate(Campo, Chave, [loCaseInsensitive, loPartialKey]);
    except
      BoxMensagem('Chave inválida!', 2);
    end;
  end;
end;

procedure TrataErro(E: Exception);
var
  i : Integer;
begin
  if E is EDBEngineError then
  begin
    for i := 0 to EDBEngineError(E).ErrorCount - 1 do
    begin
      case EDBEngineError(E).Errors[i].NativeError of
        0:     ;
        547:   MessageDlg('Erro de Chave estrangeira!' + #13#10 +
                          'Operação cancelada!', mtError, [mbOk], 0);
        2627:  MessageDlg('Código do registro já cadastrado!' + #13#10 +
                          'Tente outro código!', mtError, [mbOk], 0);
        515:   MessageDlg('Algum campo chave está em branco.' + #13#10 +
                          'Verifique novamente as informações digitadas.', mtError, [mbOk], 0);
      else
        MessageDlg('Código do Erro : " ' + IntToStr(EDBEngineError(E).Errors[i].NativeError) + ' ".' + #13#10 + 'Entre em contato com o suporte e informe este código.',
                    mtError, [mbOk], 0);
      end;
    end;
  end
  else
  begin
    if E is EConvertError then
    begin
      ShowMessage( EConvertError(E).Message);
    end;
  end;
end;

procedure AtribuiDireitos(var st_modificar:boolean; var st_incluir:boolean; var st_excluir:boolean);
begin

  try
    with datm_main.qry_direito_acesso_ do
    begin
      Close;
      UnPrepare;
      ParamByName('cd_cargo').AsString  := str_cd_cargo;
      ParamByName('cd_modulo').AsString := vStr_cd_modulo;
      ParamByName('cd_rotina').AsString := str_cd_rotina;
      Prepare;
      Open;
      st_modificar := FieldByName('IN_MODIFICAR').AsBoolean;
      st_incluir   := FieldByName('IN_INCLUIR').AsBoolean;
      st_excluir   := FieldByName('IN_EXCLUIR').AsBoolean;
      Close;
    end;
  except
    raise Exception.Create('Não foi possível atribuir direitos a esse usuário!');
    st_modificar := False;
    st_incluir   := False;
    st_excluir   := False;
  end;

  if str_cd_cargo = '000' then
  begin
    st_modificar := True;
    st_incluir   := True;
    st_excluir   := True;
  end;

end;

function Replicate(cLetra:String; nNum:Integer ) : String;
var i : integer;
    cString : String;
begin
   cString := '';
   for i:=1 to nNum do begin
       cString := cString + cLetra;
   end;

   Result := cString;
end;

{$HINTS OFF}
function CNPJ( cCodigo: String ): Boolean;
var
  lRetorno  : Boolean;
  cResto, cPeso, cDigito : String;
  nContador, nSoma, nNum0, nResto, nNum1, nNum2, nNum3, Code : Integer;

begin
  lRetorno  := True;
  cPeso     := '543298765432';
  cDigito   := cCodigo;
  nContador := 1;
  nSoma     := 0;
  nNum0     := 0;
  nResto    := 0;
  nNum1     := 13;

  if Trim(cCodigo) <> '' then
  begin
    while ( nContador < 3 ) do
    begin
      nSoma := 0;
      for nNum0 := 1 to 14 do
      begin
        Val( Copy( cDigito, nNum0, 1 ), nNum2, Code );
        Val( Copy( cPeso, nNum0, 1 ), nNum3, Code );
        nSoma := nSoma + ( nNum2 * nNum3 );
      end;
      nResto := ( nSoma mod 11 );
      if ( nResto < 2 ) then
      begin
        cDigito := Copy( cDigito, 1, nNum1 - 1 ) + '0' + Copy( cDigito, nNum1 + 1, 1 );
      end
      else
      begin
        nResto := ( 11 - nResto );
        Str( nResto, cResto );
        cDigito := Copy( cDigito, 1, nNum1 - 1 ) + cResto + Copy( cDigito, nNum1 + 1, 1 );
      end;
      cPeso := ( '6' + cPeso );
      nNum1 := nNum1+ 1;
      nContador := nContador + 1;
    end;
    if Copy( cCodigo, 13, 2 ) <> Copy( cDigito, 13, 2 ) then
    begin
      BoxMensagem( 'C.N.P.J. Inválido!', 2 );
      lRetorno := False;
    end;
  end;
  Result := lRetorno;
end;
{$HINTS ON}

{$HINTS OFF}
function CPF( cCodigo: String ) : Boolean;
var
  nNum0, nNum1, nDigito, nDigito1, nDigito2, Code : Integer;
  lRetorno : Boolean;
  cDigito1, cDigito2 : String;
begin
  nNum0    := 1;  nNum1    := 11;  nDigito  := 0;   nDigito1 := 0;
  nDigito2 := 0;  lRetorno := True;

  if Trim(cCodigo) <> '' then
  begin
    for nNum0 := 1 to 9 do
    begin
      Val( Copy( cCodigo, nNum0, 1 ), nDigito, Code );
      nDigito2 := nDigito2 + ( nDigito * nNum1 );
      nNum1    := nNum1 - 1;
      nDigito1 := nDigito1 + ( nDigito * nNum1 );
    end;

    nDigito1 := ( nDigito1 mod 11 );
    if nDigito1 < 2 then
       nDigito1 := 0
    else
       nDigito1 := 11 - nDigito1;

    nDigito2 := nDigito2 + ( nDigito1 * 2 );
    nDigito2 := ( nDigito2 mod 11 );
    if nDigito2 < 2 then
       nDigito2 := 0
    else
       nDigito2 := 11 - nDigito2;

    Str( nDigito1, cDigito1 );
    Str( nDigito2, cDigito2 );
    if Copy( cCodigo, 10, 2 ) <> ( cDigito1 + cDigito2 ) then
    begin
      BoxMensagem( 'C.P.F. incorreto!', 2 );
      lRetorno := False;
    end;
  end;
  Result := lRetorno;
end;
{$HINTS ON}

{$HINTS OFF}
function CodBarra1DV( cCodigo: String; lAvisa: Boolean ): Boolean;
var
  lRetorno : Boolean;
  cDigito1, cDigito2 : String;
  nPeso, nSoma, nNum0, nResto, nNum1, nNum2, nNum3, Code : Integer;

begin
  lRetorno  := True;
  nNum3     := 1;
  cDigito1  := Copy( cCodigo, 5, 1 );
  cDigito2  := '';
  nSoma     := 0;
  nNum0     := 0;
  nResto    := 0;

  if Trim(cCodigo) <> '' then
  begin
    nSoma     := 0;
    for nNum0 := Length( cCodigo ) downto 1 do
    begin
      if nNum0 <> 5 then
      begin
        Val( Copy( cCodigo, nNum0, 1 ), nNum2, Code );
        nNum3 := nNum3 + 1;
        if nNum3 = 10 then nNum3 := 2;
        nSoma := nSoma + ( nNum2 * nNum3 );
      end;
    end;
    nResto := ( nSoma mod 11 );
    if ( nResto < 2 ) then
    begin
      cDigito2 := '1';
    end
    else
    begin
      nResto   := ( 11 - nResto );
      Str( nResto, cDigito2 );
    end;

    if cDigito1 <> cDigito2 then
    begin
      if lAvisa then BoxMensagem( 'Cód Barra inválido!', 2 );
      lRetorno := False;
    end;
  end;
  Result := lRetorno;
end;
{$HINTS ON}

{$HINTS OFF}
function CodBarra3DV( cCodigo: String; lAvisa: Boolean ): Boolean;
var
  lRetorno : Boolean;
  cValor, cCampo, cCampo1, cCampo2, cCampo3 : String;
  cDigCalc, cDig1, cDig1Calc, cDig2, cDig2Calc, cDig3, cDig3Calc, cDigGeral : String[1];
  i, nMult, nSoma, nNum0, nResto, nNum1, nNum2, nNum3, Code : Integer;

begin
  lRetorno := True;
  if Trim(cCodigo) <> '' then
  begin
    cCampo1   := Copy( cCodigo, 1,  9 );
    cDig1     := Copy( cCodigo, 10, 1 );
    cCampo2   := Copy( cCodigo, 11, 10 );
    cDig2     := Copy( cCodigo, 21, 1 );
    cCampo3   := Copy( cCodigo, 22, 10);
    cDig3     := Copy( cCodigo, 32, 1 );
    cDigGeral := Copy( cCodigo, 33, 1 );
    cValor    := Copy( cCodigo, 34, Length( cCodigo ) - 33 );

    cDig1Calc := '';
    cDig2Calc := '';
    cDig3Calc := '';

    {Campos}
    for i := 1 to 3 do
    begin
      case i of
        1 : cCampo := cCampo1;
        2 : cCampo := cCampo2;
        3 : cCampo := cCampo3;
      end;

      nSoma     := 0;
      nNum0     := 0;
      nResto    := 0;
      nSoma     := 0;
      nNum3     := 2;
      for nNum0 := Length( cCampo ) downto 1 do
      begin
        Val( Copy( cCampo, nNum0, 1 ), nNum2, Code );
        nMult := ( nNum2 * nNum3 );
        if nMult > 9 then nSoma := nSoma +
                                   StrToInt( Copy( IntToStr(nMult), 1, 1 ) ) +
                                   StrToInt( Copy( IntToStr(nMult), 2, 1 ) )
        else nSoma := nSoma + nMult;
        if nNum3 = 2 then nNum3 := 1
        else nNum3 := 2;
      end;
      nResto       := ( nSoma mod 10 );
      if ( nResto < 1 ) then
      begin
        cDigCalc  := '0';
      end
      else
      begin
        nResto    := ( 10 - nResto );
        Str( nResto, cDigCalc );
      end;
      case i of
        1 : cDig1Calc := cDigCalc;
        2 : cDig2Calc := cDigCalc;
        3 : cDig3Calc := cDigCalc;
      end;
    end;

    {Calculando Dígito Geral}
    cCampo := Copy( cCodigo, 1, 4) + cDigGeral + Replicate('0', 14 - Length(cValor) ) + cValor + Copy( cCampo1, 5, 5 ) + cCampo2 + cCampo3;

    if ( cDig1 <> cDig1Calc) or ( cDig2 <> cDig2Calc ) or ( cDig3 <> cDig3Calc ) or ( Not CodBarra1DV(cCampo, False) ) then
    begin
      if lAvisa then BoxMensagem( 'Cód Barra inválido!', 2 );
      lRetorno := False;
    end;
  end;
  Result := lRetorno;
end;
{$HINTS ON}

function SaltaLinhas(nLinhas : Integer) : String;
var
  i : Integer;
  CRLF, Retorno : String;
begin
  Retorno := '';
  CRLF := #13#10;
  {Número de linhas a saltar}
  for i := 1 to nLinhas do
  begin
    Retorno := Retorno + CRLF;
  end;
  Result := Retorno;
end;

{$HINTS OFF}
function Extenso(wvalorexte : Double) : String;
var
  wmilhares, wunidades : Boolean;
  pedaco, wcentena, wdecimais, wextenso, svalorexte : String;
  wTipo, wcontador, ncentena, Code : Integer;
begin
  lPassouMil    := False;
  lPassouMilhao := False;
  lPassouBilhao := False;
  wmilhares := True;
  wunidades := True;
  wextenso  := '';
  wcontador := 1;
  wdecimais := 'CENTAVOS';
  wTipo := 1; //Verificar a função do parâmetro wTipo
  EncheMatriz;

  svalorexte := FormatFloat('###########0.00', wvalorexte );
  svalorexte := Space(15 - Length(svalorexte)) + svalorexte; // Str(wvalorexte, 15, 2);

  if Trim(Copy(svalorexte, 7, 3)) <> '' then wmilhares := True
  else wmilhares := False;

  if Trim(Copy(svalorexte, 10, 3)) <> '' then wunidades := True
  else wunidades := False;

  while (wcontador < 13) do
  begin
    pedaco := Trim(Copy(svalorexte, wcontador, 3));
    if (pedaco <> '') or (wcontador = 10) then
       wextenso:= wextenso + Extensao(wcontador, Copy(svalorexte, wcontador, 3) ) + ' ';
    wcontador := wcontador + 3;
  end;
  wextenso:= Trim(wextenso);
  if wtipo = 1 then
  begin
    if (Not wmilhares ) and ( Not wunidades ) then wextenso:= wextenso + ' ' + 'DE';
    pedaco := Trim(Copy(svalorexte, 1, 12));
    if wextenso = 'UM' then wextenso:= 'UM REAL'  {1,00}
    else
    begin
      if pedaco <> '' then
      begin
        if Copy(wextenso, 1, 1) = 'U' then wextenso := 'H' + wextenso;
        if ( Copy(wextenso, Length(wExtenso) - 2, 3) = 'OES' ) or
           ( Copy(wextenso, Length(wExtenso) - 1, 2) = 'AO' ) then
          wextenso := wextenso + ' DE REAIS'
        else
        if wextenso <> '' then wextenso := wextenso + ' REAIS';
      end;
    end;

    wcentena := ' ' + Copy(svalorexte, 14, 2);
    Val(wcentena, ncentena, Code);
    if ( Trim(wcentena) <> '' ) and ( ncentena > 0 ) then
    begin
      if (pedaco <> '') and (pedaco <> '0') then wextenso:= wextenso + ' E ' + extensao(10, wcentena) + ' ' + Trim(wdecimais)
      else wextenso:= extensao(10, wcentena) + ' ' + Trim(wdecimais);
    end;
    Result := '( ' + wextenso + ' )';
  end
  else
  begin
    Result := wextenso;
  end;
end;
{$HINTS ON}

{$HINTS OFF}
function Extensao(windice : Integer; wparte:String) : String;
var
  acasa10 : array[1..10] Of String[10];
  nvalor : Double;
  wsai, wunidade, wdezena, wcentena : Boolean;
  nunidade, ndezena, ncentena, Code, wTipo, nparte : Integer;
  wextensao, sufixo : String;
begin
  wTipo := 1; //Verificar a função do parâmetro wTipo
  Val(wparte, nvalor, Code);
  wcentena:= True;
  wdezena := True;
  wunidade := True;
  acasa10[1]:= 'ONZE';
  acasa10[2]:= 'DOZE';
  acasa10[3]:= 'TREZE';
  acasa10[4]:= 'QUATORZE';
  acasa10[5]:= 'QUINZE';
  acasa10[6]:= 'DEZESSEIS';
  acasa10[7]:= 'DEZESSETE';
  acasa10[8]:= 'DEZOITO';
  acasa10[9]:= 'DEZENOVE';
  //  !Empty(Val(SubStr(wparte, 1, 1)))
  Val(Trim(Copy(wparte, 1, 1)), ncentena, Code);
  if ( Trim(Copy(wparte, 1, 1)) <> '') and ( ncentena > 0 ) then wcentena := True
  else wcentena := False;

  Val(Trim(Copy(wparte, 2, 1)), ndezena, Code);
  if ( Trim(Copy(wparte, 2, 1)) <> '') and ( ndezena > 0 ) then wdezena := True
  else wdezena := False;

  Val(Trim(Copy(wparte, 3, 1)), nunidade, Code);
  if ( Trim(Copy(wparte, 3, 1)) <> '') and ( nunidade > 0 ) then wunidade := True
  else wunidade := False;
  wextensao := '';
  wsai:= False;

  Val(Copy(wparte, 1, 1), nparte, Code);
  if wcentena then
  begin
    if nparte = 1 then
    begin
      if wdezena or wunidade then wextensao:= 'CENTO E '
      else
      begin
        if ( Copy(wparte, 2, 2) = '00' ) and
           ( lPassouBilhao or lPassouMilhao or lPassouMil ) then wextensao := 'E CEM'
        else wextensao := 'CEM';
      end;
    end
    else
    begin
       if ( Copy(wparte, 2, 2) = '00' ) and
          ( lPassouBilhao or lPassouMilhao or lPassouMil ) then wextensao := 'E ' + acentena[nparte]
       else wextensao := acentena[nparte];
       if wdezena or wunidade then wextensao := wextensao + ' E ';
    end;
  end;

  Val(Copy(wparte, 2, 1), nparte, Code);
  if wdezena then
  begin
    if nparte = 1 then
    begin
      if wunidade then
      begin
        Val(Copy(wparte, 3, 1), nparte, Code);
        if Copy(wparte, 1, 1) = '0' then
           wextensao := wextensao + 'E ' + acasa10[nparte]
        else
           wextensao := wextensao + acasa10[nparte];
        wsai := True;
      end
      else
      begin
        if Copy(wparte, 1, 1) = '0' then
           wextensao := wextensao + 'E DEZ '
        else
           wextensao := wextensao + 'DEZ ';
      end;
    end
    else
    begin
      if Copy(wparte, 1, 1) = '0' then
         wextensao := wextensao + 'E ' + adezena[nparte]
      else
         wextensao := wextensao + adezena[nparte];
      if wunidade then wextensao := wextensao + ' E ';
    end
  end;

  Val(Copy(wparte, 3, 1), nparte, Code);
  if wunidade and (Not wsai) then
  begin
    if wtipo = 1 then
    begin
      if Copy(wparte, 1, 2) = '00' then
         wextensao := wextensao + 'E ' + aunidade[nparte]
      else
         wextensao := wextensao + aunidade[nparte];
    end
    else
    begin
      case nparte of
        1: wextensao := wextensao + 'UMA';
        2: wextensao := wextensao + 'DUAS';
      else wextensao := wextensao + aunidade[nparte];
      end;
    end;
  end;

  if Trim(wparte) <> '' then
  begin
     case windice of
     1: begin
          if nvalor = 1 then sufixo := 'AO '
          else sufixo := 'OES ';
          lPassouBilhao := True;
          wextensao := wextensao + ' BILH' + sufixo;
        end;
     4: begin
          if nvalor = 1 then sufixo := 'AO '
          else sufixo := 'OES ';
          lPassouMilhao := True;
          if Trim(wparte) <> '000' then
             wextensao := wextensao + ' MILH' + sufixo
          else
          begin
             if ( Not lPassouBilhao ) then
                wextensao := wextensao + ' MILH' + sufixo;
          end;
     end;
     7: begin
          lPassouMil := True;
          if Trim(wparte) <> '000' then
             wextensao := wextensao + ' MIL '
          else
          begin
             if ( Not lPassouBilhao ) and ( Not lPassouMilhao ) then
               wextensao := wextensao + ' MIL ';
          end;
        end;
     end;
  end;
  Result := Trim(wextensao);
end;
{$HINTS ON}

{$HINTS OFF}
procedure EncheMatriz;
begin
  acentena[1]:= 'CEM';
  acentena[2]:= 'DUZENTOS';
  acentena[3]:= 'TREZENTOS';
  acentena[4]:= 'QUATROCENTOS';
  acentena[5]:= 'QUINHENTOS';
  acentena[6]:= 'SEISCENTOS';
  acentena[7]:= 'SETECENTOS';
  acentena[8]:= 'OITOCENTOS';
  acentena[9]:= 'NOVECENTOS';
  adezena[1]:= 'DEZ';
  adezena[2]:= 'VINTE';
  adezena[3]:= 'TRINTA';
  adezena[4]:= 'QUARENTA';
  adezena[5]:= 'CINQUENTA';
  adezena[6]:= 'SESSENTA';
  adezena[7]:= 'SETENTA';
  adezena[8]:= 'OITENTA';
  adezena[9]:= 'NOVENTA';
  aunidade[1]:= 'UM';
  aunidade[2]:= 'DOIS';
  aunidade[3]:= 'TRES';
  aunidade[4]:= 'QUATRO';
  aunidade[5]:= 'CINCO';
  aunidade[6]:= 'SEIS';
  aunidade[7]:= 'SETE';
  aunidade[8]:= 'OITO';
  aunidade[9]:= 'NOVE';
end;
{$HINTS ON}

function DataCrystal( str_data : String) : String;
begin
  Result := 'Date( ' + Copy(str_data, 7, 4) + ',' + Copy(str_data, 4, 2) + ',' +
            Copy(str_data, 1, 2) + ' )';
end;

procedure Cons_On_line( cNomeBanco:String;   cNomeTabela:String;
                        fcampo:TStringField; cCaption:String;
                        nCodigo:Integer;     Filter : String;
                        TypeDataSet:String );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);
  frm_consulta_padrao.nCodigo := nCodigo;
  if TypeDataSet = 'TTable' then
  begin
    datm_consulta_padrao.Tabela.DatabaseName := cNomeBanco;
    datm_consulta_padrao.Tabela.TableName    := cNomeTabela;
    if Filter <> '' then
    begin
      datm_consulta_padrao.Tabela.Filter     := Filter;
      datm_consulta_padrao.Tabela.Filtered   := True;
    end
    else
      datm_consulta_padrao.Tabela.Filtered   := False;
      datm_consulta_padrao.Tabela.Open;
  end
  else if TypeDataSet = 'TQuery' then
  begin
    datm_consulta_padrao.Query.Close;
    datm_consulta_padrao.Query.SQL.Clear;
    datm_consulta_padrao.Query.DatabaseName  := cNomeBanco;
    datm_consulta_padrao.ds_Tabela.DataSet   := datm_consulta_padrao.Query;
    if Filter <> '' then
      datm_consulta_padrao.Query.SQL.Add(Filter) // 'Variável Filter já possui as cláusulas SELECT e WHERE'
    else
      datm_consulta_padrao.Query.SQL.Add('SELECT * FROM ' + cNomeTabela );

    datm_consulta_padrao.Query.Prepare;
    datm_consulta_padrao.Query.Open;
  end;
  frm_consulta_padrao.Cons_OnLine  := fCampo;
  frm_consulta_padrao.st_modificar := True; // st_modificar;
  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Cons_On_line_Texto( cNomeBanco:String;   cNomeTabela:String;
                              fcampo:TMaskEdit;    cCaption:String;
                              nCodigo:Integer;     Filter : String);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := nCodigo;
  datm_consulta_padrao.Tabela.DatabaseName := cNomeBanco;
  datm_consulta_padrao.Tabela.TableName    := cNomeTabela;

  if Filter <> '' then
  begin
    datm_consulta_padrao.Tabela.Filter     := Filter;
    datm_consulta_padrao.Tabela.Filtered   := True;
  end
  else
    datm_consulta_padrao.Tabela.Filtered   := False;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := True; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  fCampo.Text := frm_consulta_padrao.Cons_OnLine_Texto;
end;

procedure FormataMemo(Campo: TField; Largura : Integer);
var
  cTexto, cTexto2 : AnsiString;
  cLinha : String;
  i, j, nPos, Tamanho : Integer;
begin
  cTexto  := Campo.AsString;
  Tamanho := Length(cTexto);
  cTexto2 := '';
  i := 1;
  while i <= Tamanho do
  begin
    if ( i + Largura ) > Tamanho then
    begin
       cTexto2 := cTexto2 + Copy(cTexto, i, Tamanho );
       Exit;
    end
    else cLinha := Copy(cTexto, i, Largura );
    nPos := nAt ( #13 , cLinha );
    if ( nPos = 0 ) then
    begin
       if Length(cLinha) = 0 then Continue;
       for j := Length(cLinha) downto 0 do
       begin
         if ( Copy(cLinha, j, 1) = #32 ) then
         begin
           cTexto2 := cTexto2 + Copy(cLinha, i, j - 1) + #13#10;
           i := i + j;
           Break;
         end;
       end;
    end
    else
    begin
      nPos := nPos + 1;
      cTexto2 := cTexto2 + Copy( cLinha, i, nPos );
      i := i + nPos;
    end;
  end;
  Campo.AsString := cTexto2;
end;

{$HINTS OFF}
function nAtr( Arg1, Arg2: string; inicio: integer; fim: integer ) : Integer;
var
  nTamanho1 : Integer;
  nTamanho2 : Integer;
  i : Integer;
begin
  Result := 0;
  nTamanho1 := length( Arg1 );
  nTamanho2 := length( Arg2 );
  if fim > nTamanho2 then fim := nTamanho2;
  if inicio > nTamanho2 then inicio := nTamanho2;
  if fim < 1 then fim := 1;
  if inicio < 1 then inicio := 1;
  if nTamanho1 > 0 then
    if inicio < fim then
    begin
      for i := inicio to fim do
        if ( Copy( Arg2, i, nTamanho1 ) = Arg1 ) then
        begin
          Result := i;
          Exit
        end
    end
    else
    begin
      for i := inicio downto fim do
        if ( Copy( Arg2, i, nTamanho1 ) = Arg1 ) then
        begin
          Result := i;
          Exit
        end;
    end;
end;
{$HINTS ON}

procedure Contabiliza( qry_contab_: DBTables.TQuery; qry_contab_lanc_: DBTables.TQuery;
                       qry_contab_gerencial_: DBTables.TQuery; nr_contab: String;
                       str_cd_colig : String );
var
  Arquivo : TFileText;
  Arq_Log : TFileText;
  Size, i : Integer;
  historico, hist : AnsiString;
  c1 : String;
  p1: Array[0..1024] of Char;
begin

  qry_contab_.Close;
  qry_contab_lanc_.Close;
  qry_contab_gerencial_.Close;

  qry_contab_.ParamByName('CD_COLIGADA').AsString := str_cd_colig;
  qry_contab_.ParamByName('NR_CONTAB').AsString   := nr_contab;

  qry_contab_.Prepare;
  qry_contab_lanc_.Prepare;
  qry_contab_gerencial_.Prepare;
  qry_contab_.Open;
  qry_contab_lanc_.Open;
  qry_contab_gerencial_.Open;

  if qry_contab_.RecordCount > 0 then
  begin
    Arquivo := TFileText.Create;
    Arquivo.Name := cDir_Contab + '\LT' + qry_contab_.FieldByName('CD_COLIGADA').AsString + nr_contab;
    Arquivo.CreateFile;
    Arq_Log := TFileText.Create;
    Arq_log.Name := cDir_Contab + '\LT' + qry_contab_.FieldByName('CD_COLIGADA').AsString + nr_contab + '.LOG';
    Arq_Log.CreateFile;
    c1 := 'Arquivo:                 ' + Arquivo.Name + #13#10;
    c1 := c1 + 'Usuario:                 ' + str_nm_usuario + #13#10;
    c1 := c1 + 'Data do Movimento:       ' + DateToStr(qry_contab_.FieldByName('DT_MOVIMENTO').AsDateTime) + #13#10;
    c1 := c1 + 'Data da Contabilizacao:  ' + DateTimeToStr(qry_contab_.FieldByName('DT_CONTAB').AsDateTime) + #13#10;
    StrPCopy( p1, c1);
    Arq_Log.Write( p1 );
    if qry_contab_.FieldByName('TP_CONTAB').AsString = 'C' then
    begin
       c1 := 'Tipo:                    Financeiro'  + #13#10;
       c1 := c1 + 'Coligada:                ' + qry_contab_.FieldByName('CD_COLIGADA').AsString + #13#10;
       c1 := c1 + 'Unidade:                 ' + qry_contab_.FieldByName('CD_UNID_NEG').AsString + #13#10;
    end
    else if qry_contab_.FieldByName('TP_CONTAB').AsString = 'F' then
    begin
       c1 := 'Tipo:                    Faturamento' + #13#10;
       c1 := c1 + 'Unidade:                 ' + qry_contab_.FieldByName('CD_UNID_NEG').AsString + #13#10;
       c1 := c1 + 'Produto:                 ' + qry_contab_.FieldByName('CD_PRODUTO').AsString + #13#10;
    end
    else
    begin
       c1 := 'Tipo:                    Contas a Pagar' + #13#10;
       c1 := c1 + 'Coligada:                ' + qry_contab_.FieldByName('CD_COLIGADA').AsString + #13#10;
    end;
    StrPCopy( p1, c1);
    Arq_Log.Write( p1 );
    while Not qry_contab_lanc_.EOF do
    begin
      {Data do Lançamento}
      c1 := FormatDateTime('ddmmyy', qry_contab_lanc_.FieldByName('DT_MOVIMENTO').AsDateTime );
      {Nº do Documento}
      c1 := c1 + Space(8);
      {Conta Devedora}
      c1 := c1 + Trim(qry_contab_lanc_.FieldByName('CD_CT_DEVEDORA').AsString ) +
            Space( 20 - Length( Trim(qry_contab_lanc_.FieldByName('CD_CT_DEVEDORA').AsString ) ) );
      {Conta Credora}
      c1 := c1 + Trim(qry_contab_lanc_.FieldByName('CD_CT_CREDORA').AsString ) +
            Space( 20 - Length( Trim(qry_contab_lanc_.FieldByName('CD_CT_CREDORA').AsString ) ) );
      {Contra Partida}
      c1 := c1 + Space(20);
      {Valor do Lançamento}
      c1 := c1 + FormatFloat('000000000000000.00', qry_contab_lanc_.FieldByName('VL_LANCAMENTO').AsFloat );
      {Código do Histórico}
      c1 := c1 + qry_contab_lanc_.FieldByName('CD_HISTORICO').AsString +
            space( 8 - Length(qry_contab_lanc_.FieldByName('CD_HISTORICO').AsString));
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      {Complemento do Histórico}
      historico := Trim(qry_contab_lanc_.FieldByName('NM_HISTORICO').AsString);
      hist := '';
      for i := 1 to Length(historico) do
      begin
        if ( ord(historico[i]) >= 32 ) and
           ( ord(historico[i]) <= 126 ) then
          hist := hist + historico[i]
        else
          hist := hist + ' ';
      end;
      Size := Length( hist );

      if  Size > 186 then
         c1 := Copy( hist, 1, 186 )
      else
         c1 := hist + Space( 186 - Size );
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      {Filial do Lançamento}
      c1 := qry_contab_lanc_.FieldByName('CD_FILIAL').AsString;
      {Centro de Custo }
      if qry_contab_lanc_.FieldByName('CD_CUSTO').AsString = '' then
        c1 := c1 + Space(12)
      else
        c1 := c1 + Copy(qry_contab_lanc_.FieldByName('CD_CUSTO').AsString,1,1)+'.'+
                   Copy(qry_contab_lanc_.FieldByName('CD_CUSTO').AsString,2,2)+ Space(8);
      {2ª Data - 2º Valor - Tabela Livre - Nº Conc. Banc e CH - Conc. Banc.}
//      c1 := c1 + Replicate('0', 26) + Space(10) + 'N' + Replicate('0', 6);
      c1 := c1 + '000000000000000.00';
      {Distribuição Gerencial}
      while Not qry_contab_gerencial_.EOF do
      begin
        {Conta Gerencial}
        c1 := c1 + Trim(qry_contab_gerencial_.FieldByName('CT_GERENCIAL').AsString ) +
              Space( 20 - Length( Trim(qry_contab_gerencial_.FieldByName('CT_GERENCIAL').AsString ) ) );
        {Vl. Distribuído}
        c1 := c1 + FormataFloat('000000000000000.00', qry_contab_gerencial_.FieldByName('VL_GERENCIAL').AsFloat );
        qry_contab_gerencial_.Next;
      end;

      {Grava Tipo 1}
      c1 := c1 + #13#10;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      qry_contab_lanc_.Next;
    end;

    BoxMensagem('Arquivo de contabilização ' + Arquivo.Name + #13#10 + ' gerado com sucesso!', 3);

    Arquivo.Close;
    Arquivo.Free;

    Arq_Log.Close;
    Arq_Log.Free;

  end;
  qry_contab_.Close;
  qry_contab_lanc_.Close;
  qry_contab_gerencial_.Close;
end;

procedure ContabilizaContMaster( qry_contab_contmaster_: DBTables.TQuery;
                                 qry_contab_lanc_contmaster_: DBTables.TQuery;
                                 qry_contab_gerencial_contmaster_: DBTables.TQuery;
                                 nr_contab: String );
var
  Arquivo : TFileText;
  Arq_Log : TFileText;
  Size, i : Integer;
  historico, hist : AnsiString;
  c1 : String;
  p1: Array[0..1024] of Char;
begin

  qry_contab_contmaster_.Close;
  qry_contab_lanc_contmaster_.Close;
  qry_contab_gerencial_contmaster_.Close;

  qry_contab_contmaster_.ParamByName('NR_CONTAB').AsString   := nr_contab;

  qry_contab_contmaster_.Prepare;
  qry_contab_lanc_contmaster_.Prepare;
  qry_contab_gerencial_contmaster_.Prepare;
  qry_contab_contmaster_.Open;
  qry_contab_lanc_contmaster_.Open;
  qry_contab_gerencial_contmaster_.Open;

  if qry_contab_contmaster_.RecordCount > 0 then
  begin
    Arquivo := TFileText.Create;
    Arquivo.Name := cDir_Contab + '\LT' + nr_contab + '.' + FormatDateTime( 'mm', Date );
    Arquivo.CreateFile;
    Arq_Log := TFileText.Create;
    Arq_log.Name := cDir_Contab + '\LT' + nr_contab + '.LOG';
    Arq_Log.CreateFile;
    c1 := 'Arquivo:                 ' + Arquivo.Name + #13#10;
    c1 := c1 + 'Usuario:                 ' + str_nm_usuario + #13#10;
    c1 := c1 + 'Data do Movimento:       ' + DateToStr(qry_contab_contmaster_.FieldByName('DT_MOVIMENTO').AsDateTime) + #13#10;
    c1 := c1 + 'Data da Contabilizacao:  ' + DateTimeToStr(qry_contab_contmaster_.FieldByName('DT_CONTAB').AsDateTime) + #13#10;
    StrPCopy( p1, c1);
    Arq_Log.Write( p1 );
    if qry_contab_contmaster_.FieldByName('TP_CONTAB').AsString = 'C' then
    begin
       c1 := 'Tipo:                    Financeiro'  + #13#10;
       c1 := c1 + 'Unidade:                 ' + qry_contab_contmaster_.FieldByName('CD_UNID_NEG').AsString + #13#10;
    end
    else if qry_contab_contmaster_.FieldByName('TP_CONTAB').AsString = 'F' then
    begin
       c1 := 'Tipo:                    Faturamento' + #13#10;
       c1 := c1 + 'Unidade:                 ' + qry_contab_contmaster_.FieldByName('CD_UNID_NEG').AsString + #13#10;
       c1 := c1 + 'Produto:                 ' + qry_contab_contmaster_.FieldByName('CD_PRODUTO').AsString + #13#10;
    end
    else
    begin
       c1 := 'Tipo:                    Contas a Pagar' + #13#10;
       c1 := c1 + 'Coligada:                ' + qry_contab_contmaster_.FieldByName('CD_COLIGADA').AsString + #13#10;
    end;
    StrPCopy( p1, c1);
    Arq_Log.Write( p1 );
    while Not qry_contab_lanc_contmaster_.EOF do
    begin
      {Vazio}
      c1 := Space( 5 );
      {Conta Débito}
      c1 := c1 + Trim(qry_contab_lanc_contmaster_.FieldByName('CD_CT_DEVEDORA').AsString ) +
            Space( 18 - Length( Trim(qry_contab_lanc_contmaster_.FieldByName('CD_CT_DEVEDORA').AsString ) ) );
      {Conta Crédito}
      c1 := c1 + Trim(qry_contab_lanc_contmaster_.FieldByName('CD_CT_CREDORA').AsString ) +
            Space( 18 - Length( Trim(qry_contab_lanc_contmaster_.FieldByName('CD_CT_CREDORA').AsString ) ) );
      {Código do Histórico}
      c1 := c1 + qry_contab_lanc_contmaster_.FieldByName('CD_HISTORICO').AsString +
            Space( 3 - Length(qry_contab_lanc_contmaster_.FieldByName('CD_HISTORICO').AsString));
      {Valor do Lançamento}
      c1 := c1 + Copy( FormatFloat( '0000000000.00', qry_contab_lanc_contmaster_.FieldByName('VL_LANCAMENTO').AsFloat ), 1, 10 ) +
                 Copy( FormatFloat( '0000000000.00', qry_contab_lanc_contmaster_.FieldByName('VL_LANCAMENTO').AsFloat ), 12, 2 );
      {Data do Lançamento}
      c1 := c1 + FormatDateTime('dd/mm/yy', qry_contab_contmaster_.FieldByName('DT_MOVIMENTO').AsDateTime );
      {Nº da Nota}
      c1 := c1 + Space(6);
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      {Complemento do Histórico}
      historico := Trim(qry_contab_lanc_contmaster_.FieldByName('NM_HISTORICO').AsString);
      hist := '';
      for i := 1 to Length(historico) do
      begin
        if ( ord(historico[i]) >= 32 ) and
           ( ord(historico[i]) <= 126 ) then
          hist := hist + historico[i]
        else
          hist := hist + ' ';
      end;
      Size := Length( hist );

      if  Size > 186 then
         c1 := Copy( hist, 1, 186 )
      else
         c1 := hist + Space( 186 - Size );
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      {Nome Fornecedor}
      c1 := qry_contab_lanc_contmaster_.FieldByName('NM_FORNECEDOR').AsString;
      c1 := c1 + #13#10;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      qry_contab_lanc_contmaster_.Next;
    end;

    BoxMensagem('Arquivo de contabilização ' + Arquivo.Name + #13#10 + ' gerado com sucesso!', 3);

    Arquivo.Close;
    Arquivo.Free;

    Arq_Log.Close;
    Arq_Log.Free;

  end;
  qry_contab_contmaster_.Close;
  qry_contab_lanc_contmaster_.Close;
  qry_contab_gerencial_contmaster_.Close;
end;

procedure ContabilizaSI2( qry_contab_si_: TQuery; qry_contab_lanc_si_: TQuery; nr_contab: String );
var
  ArqCapa : TFileText;
  ArqLancto : TFileText;
  ArqLog : TFileText;
  c1 : String;
  p1: Array[0..1024] of Char;
begin

  qry_contab_si_.Close;
  qry_contab_lanc_si_.Close;

  qry_contab_si_.ParamByName('NR_CONTAB').AsString := nr_contab;

  qry_contab_si_.Prepare;
  qry_contab_lanc_si_.Prepare;

  qry_contab_si_.Open;
  qry_contab_lanc_si_.Open;

  if Not qry_contab_si_.EOF then
  begin
    ArqCapa := TFileText.Create;
    ArqCapa.Name := cDir_Contab + '\CAPA.TXT';
    ArqCapa.CreateFile;

    ArqLancto := TFileText.Create;
    ArqLancto.Name := cDir_Contab + '\LANCTO.TXT';
    ArqLancto.CreateFile;

    ArqLog := TFileText.Create;
    Arqlog.Name := cDir_Contab + '\CAPA.LOG';
    ArqLog.CreateFile;

    c1 :=      'Arquivo:                 ' + ArqCapa.Name + #13#10;
    c1 := c1 + 'Usuario:                 ' + str_nm_usuario + #13#10;
    c1 := c1 + 'Nº Lote:                 ' + qry_contab_si_.FieldByName('NR_CONTAB').AsString + #13#10;
    c1 := c1 + 'Data do Movimento:       ' + DateToStr( Date ) + #13#10;
    c1 := c1 + 'Data da Contabilizacao:  ' + DateTimeToStr(qry_contab_si_.FieldByName('DT_CONTAB').AsDateTime) + #13#10;
    StrPCopy( p1, c1);
    ArqLog.Write( p1 );
    if qry_contab_si_.FieldByName('TP_CONTAB').AsString = 'C' then
    begin
       c1 := 'Tipo:                    Financeiro'  + #13#10;
       c1 := c1 + 'Unidade:                 ' + qry_contab_si_.FieldByName('CD_UNID_NEG').AsString + #13#10;
    end
    else if qry_contab_si_.FieldByName('TP_CONTAB').AsString = 'F' then
    begin
       c1 := 'Tipo:                    Faturamento' + #13#10;
       c1 := c1 + 'Unidade:                 ' + qry_contab_si_.FieldByName('CD_UNID_NEG').AsString + #13#10;
       c1 := c1 + 'Produto:                 ' + qry_contab_si_.FieldByName('CD_PRODUTO').AsString + #13#10;
    end
    else
    begin
       c1 := 'Tipo:                    Contas a Pagar' + #13#10;
       c1 := c1 + 'Coligada:                ' + qry_contab_si_.FieldByName('CD_COLIGADA').AsString + #13#10;
    end;
    StrPCopy( p1, c1);
    ArqLog.Write( p1 );

    {Gravação da Capa}
    {Data do Lote}
    c1 := FormatDateTime( 'dd/mm/yyyy', qry_contab_si_.FieldByName('DT_CONTAB').AsDateTime ) + ';';
    {Nº do Lote}
    c1 := c1 + Trim( qry_contab_si_.FieldByName('NR_CONTAB').AsString ) + ';';
    {Valor do Lote - Débito}
    c1 := c1 + FormatFloat( '000000000.00', qry_contab_si_.FieldByName('VL_DEBITO').AsFloat ) + ';';
    {Valor do Lote - Crédito}
    c1 := c1 + FormatFloat( '000000000.00', qry_contab_si_.FieldByName('VL_CREDITO').AsFloat ) + ';';
    {Valor dos Lançamentos a Débito}
    c1 := c1 + FormatFloat( '000000000.00', qry_contab_si_.FieldByName('VL_DEBITO').AsFloat ) + ';';
    {Valor dos Lançamentos a Crédito}
    c1 := c1 + FormatFloat( '000000000.00', qry_contab_si_.FieldByName('VL_CREDITO').AsFloat ) + ';';
    {Código do Usuário}
    c1 := c1 + '1';
    StrPCopy( p1, c1);
    ArqCapa.Write( p1 );

    {Gravação dos Lançamentos}
    while Not qry_contab_lanc_si_.EOF do
    begin
      c1 := '';
      {Nº do Lote}
      c1 := c1 + Trim( qry_contab_lanc_si_.FieldByName('NR_CONTAB').AsString ) + ';';
      {Nº do Lançamento}
      c1 := c1 + Trim( qry_contab_lanc_si_.FieldByName('NR_LANCAMENTO').AsString ) + ';';
      {Data do Lançamento}
      c1 := c1 + FormatDateTime( 'dd/mm/yyyy', qry_contab_lanc_si_.FieldByName('DT_LANCAMENTO').AsDateTime ) + ';';
      {Simbologia do Documento}
      c1 := c1 + Trim( qry_contab_lanc_si_.FieldByName('CD_SIMBOLOGIA').AsString ) + ';';
      {Número do Documento}
      c1 := c1 + Trim(qry_contab_lanc_si_.FieldByName('NR_DOCTO').AsString ) +
            Space( 8 - Length( Trim( qry_contab_lanc_si_.FieldByName('NR_DOCTO').AsString ) ) ) + ';';
      {Conta Débito}
      c1 := c1 + Copy( qry_contab_lanc_si_.FieldByName('CD_CT_DEVEDORA').AsString, 1, 7 ) + ';';
      {Dígito da Conta Débito}
      c1 := c1 + Copy( qry_contab_lanc_si_.FieldByName('CD_CT_DEVEDORA').AsString, 8, 1 ) + ';';
      {Conta Crédito}
      c1 := c1 + Copy( qry_contab_lanc_si_.FieldByName('CD_CT_CREDORA').AsString, 1, 7 ) + ';';
      {Dígito da Conta Crédito}
      c1 := c1 + Copy( qry_contab_lanc_si_.FieldByName('CD_CT_CREDORA').AsString, 8, 1 ) + ';';
      {Valor do Lançamento}
      c1 := c1 + FormatFloat( '000000000.00', qry_contab_lanc_si_.FieldByName('VL_LANCAMENTO').AsFloat ) + ';';
      {Código do Centro de Custo}
      c1 := c1 + '0000' + ';';
      {1ª Linha de Histórico}
      c1 := c1 + Trim( Copy( qry_contab_lanc_si_.FieldByName('NM_HISTORICO').AsString, 1, 45 ) ) +
            Space( 45 - Length( Trim( Copy( qry_contab_lanc_si_.FieldByName('NM_HISTORICO').AsString, 1, 45 ) ) ) ) + ';';
      {2ª Linha de Histórico}
      if Length( Trim( qry_contab_lanc_si_.FieldByName('NM_HISTORICO').AsString ) ) > 45 then
      begin
        c1 := c1 + Trim( Copy( qry_contab_lanc_si_.FieldByName('NM_HISTORICO').AsString, 46, 45 ) ) + ';';
      end
      else
      begin
        c1 := c1 + ';'
      end;
      {Indicador de Atualização}
      c1 := c1 + '*' + ';';
      {Indicador de origem de Lançamento}
      c1 := c1 + 'FT' + #13#10;
      StrPCopy( p1, c1);
      ArqLancto.Write( p1 );

      qry_contab_lanc_si_.Next;
    end;

    BoxMensagem( 'Arquivo de contabilização gerado com sucesso!', 3 );

    ArqCapa.Close;
    ArqCapa.Free;

    ArqLancto.Close;
    ArqLancto.Free;

    ArqLog.Close;
    ArqLog.Free;

  end;
  qry_contab_si_.Close;
  qry_contab_lanc_si_.Close;

  
end;

procedure ContabilizaSI( qry_contab_si_: DBTables.TQuery; qry_contab_lanc_si_: DBTables.TQuery; nr_contab: String );
var
  DBSI : TDataBase;
  qry_capalote_insert : TQuery;
  qry_lancto_insert : TQuery;
  ArqLog : TFileText;
  c1 : String;
  p1: Array[0..1024] of Char;
begin
  DBSI := TDatabase.Create(nil);
  qry_capalote_insert := TQuery.Create(nil);
  qry_lancto_insert := TQuery.Create(nil);
  try
    with DBSI do
    begin
      AliasName    := 'DBSI';
      DatabaseName := 'DBSIInterno';
      LoginPrompt  := False;
      SessionName  := 'Default';
      Open;
    end;
    with qry_capalote_insert do
    begin
      DatabaseName := 'DBSIInterno';
      SQL.Text := 'DELETE FROM capalote';
      Prepare;
      ExecSQL;
      SQL.Text := 'INSERT INTO capalote ( capdtlote, caplote, capdebito, capcredito, capvldeb, capvlcred, capusuari ) '+
                  'VALUES ( :capdtlote, :caplote, :capdebito, :capcredito, :capvldeb, :capvlcred, :capusuari )';
    end;

    with qry_lancto_insert do
    begin
      DatabaseName := 'DBSIInterno';
      SQL.Text := 'DELETE FROM lancto';
      Prepare;
      ExecSQL;
      SQL.Text := 'INSERT INTO lancto ( lctlote, lctlancto, lctdata, lctsimb, lctdoc, lctctadeb, lctdigctadeb, lctctacred, lctdigctacred, lctvalor, lctccusto, lctatual, lctct, lcthistor ) '+
                  'VALUES ( :lctlote, :lctlancto, :lctdata, :lctsimb, :lctdoc, :lctctadeb, :lctdigctadeb, :lctctacred, :lctdigctacred, :lctvalor, :lctccusto, :lctatual, :lctct, :lcthistor )';
    end;

    qry_contab_si_.Close;
    qry_contab_lanc_si_.Close;

    qry_contab_si_.ParamByName('NR_CONTAB').AsString := nr_contab;

    qry_contab_si_.Prepare;
    qry_contab_lanc_si_.Prepare;

    qry_contab_si_.Open;
    qry_contab_lanc_si_.Open;

    if Not qry_contab_si_.EOF then
    begin

      ArqLog := TFileText.Create;
      Arqlog.Name := cDir_Contab + '\CAPA.LOG';
      ArqLog.CreateFile;

      c1 :=      'Arquivo:                 BYSOFT.MDB' + #13#10;
      c1 := c1 + 'Usuario:                 ' + str_nm_usuario + #13#10;
      c1 := c1 + 'Nº Lote:                 ' + qry_contab_si_.FieldByName('NR_CONTAB').AsString + #13#10;
      c1 := c1 + 'Data do Movimento:       ' + DateToStr( Date ) + #13#10;
      c1 := c1 + 'Data da Contabilizacao:  ' + DateTimeToStr(qry_contab_si_.FieldByName('DT_CONTAB').AsDateTime) + #13#10;
      StrPCopy( p1, c1);
      ArqLog.Write( p1 );
      if qry_contab_si_.FieldByName('TP_CONTAB').AsString = 'C' then
      begin
        c1 := 'Tipo:                    Financeiro'  + #13#10;
        c1 := c1 + 'Unidade:                 ' + qry_contab_si_.FieldByName('CD_UNID_NEG').AsString + #13#10;
      end
      else if qry_contab_si_.FieldByName('TP_CONTAB').AsString = 'F' then
      begin
        c1 := 'Tipo:                    Faturamento' + #13#10;
        c1 := c1 + 'Unidade:                 ' + qry_contab_si_.FieldByName('CD_UNID_NEG').AsString + #13#10;
        c1 := c1 + 'Produto:                 ' + qry_contab_si_.FieldByName('CD_PRODUTO').AsString + #13#10;
      end
      else
      begin
        c1 := 'Tipo:                    Contas a Pagar' + #13#10;
        c1 := c1 + 'Coligada:                ' + qry_contab_si_.FieldByName('CD_COLIGADA').AsString + #13#10;
      end;
      StrPCopy( p1, c1);
      ArqLog.Write( p1 );

      DBSI.StartTransaction;

      {Gravação da Capa}
      with qry_capalote_insert do
      begin
        {Data do Lote}
        ParamByName('capdtlote').DataType := ftDateTime;
        ParamByName('capdtlote').AsDateTime := qry_contab_si_.FieldByName('DT_CONTAB').AsDateTime;

        {Nº do Lote}
        ParamByName('caplote').DataType := ftInteger;
        ParamByName('caplote').AsInteger := qry_contab_si_.FieldByName('NR_CONTAB').AsInteger;

        {Valor do Lote - Débito}
        ParamByName('capdebito').DataType := ftCurrency;
        ParamByName('capdebito').AsCurrency := qry_contab_si_.FieldByName('VL_DEBITO').AsCurrency;

        {Valor do Lote - Crédito}
        ParamByName('capcredito').DataType := ftCurrency;
        ParamByName('capcredito').AsCurrency := qry_contab_si_.FieldByName('VL_CREDITO').AsCurrency;

        {Valor dos Lançamentos a Débito}
        ParamByName('capvldeb').DataType := ftCurrency;
        ParamByName('capvldeb').AsCurrency := qry_contab_si_.FieldByName('VL_DEBITO').AsCurrency;

        {Valor dos Lançamentos a Crédito}
        ParamByName('capvlcred').DataType := ftCurrency;
        ParamByName('capvlcred').AsCurrency := qry_contab_si_.FieldByName('VL_CREDITO').AsCurrency;

        {Código do Usuário}
        ParamByName('capusuari').DataType := ftBytes;
        ParamByName('capusuari').AsInteger := 1;
        Prepare;
        ExecSQL;
      end;

      {Gravação dos Lançamentos}
      with qry_lancto_insert do
      begin
        while Not qry_contab_lanc_si_.EOF do
        begin
          {Nº do Lote}
          ParamByName('lctlote').DataType := ftInteger;
          ParamByName('lctlote').AsInteger := qry_contab_lanc_si_.FieldByName('NR_CONTAB').AsInteger;

          {Nº do Lançamento}
          ParamByName('lctlancto').DataType := ftInteger;
          ParamByName('lctlancto').AsInteger := qry_contab_lanc_si_.FieldByName('NR_LANCAMENTO').AsInteger;

          {Data do Lançamento}
          ParamByName('lctdata').DataType := ftDateTime;
          ParamByName('lctdata').AsDateTime := qry_contab_lanc_si_.FieldByName('DT_LANCAMENTO').AsDateTime;

          {Simbologia do Documento}
          ParamByName('lctsimb').DataType := ftString;
          ParamByName('lctsimb').AsString := Trim(qry_contab_lanc_si_.FieldByName('CD_SIMBOLOGIA').AsString);

          {Número do Documento}
          ParamByName('lctdoc').DataType := ftString;
          ParamByName('lctdoc').AsString := Trim(qry_contab_lanc_si_.FieldByName('NR_DOCTO').AsString );

          {Conta Débito}
          ParamByName('lctctadeb').DataType := ftInteger;
//          ParamByName('lctctadeb').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_DEVEDORA').AsString, 1, 7));
          ParamByName('lctctadeb').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_DEVEDORA').AsString, 1, 9));

          {Dígito da Conta Débito}
          ParamByName('lctdigctadeb').DataType := ftInteger;
//          ParamByName('lctdigctadeb').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_DEVEDORA').AsString, 8, 1 ));
          ParamByName('lctdigctadeb').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_DEVEDORA').AsString, 10, 1 ));

          {Conta Crédito}
          ParamByName('lctctacred').DataType := ftInteger;
//          ParamByName('lctctacred').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_CREDORA').AsString, 1, 7 ));
          ParamByName('lctctacred').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_CREDORA').AsString, 1, 9 ));

          {Dígito da Conta Crédito}
          ParamByName('lctdigctacred').DataType := ftInteger;
//          ParamByName('lctdigctacred').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_CREDORA').AsString, 8, 1 ));
          ParamByName('lctdigctacred').AsInteger := StrToInt('0'+Copy( qry_contab_lanc_si_.FieldByName('CD_CT_CREDORA').AsString, 10, 1 ));

          {Valor do Lançamento}
          ParamByName('lctvalor').DataType := ftCurrency;
          ParamByName('lctvalor').AsCurrency := qry_contab_lanc_si_.FieldByName('VL_LANCAMENTO').AsCurrency;

          {Código do Centro de Custo}
          ParamByName('lctccusto').DataType := ftInteger;
          ParamByName('lctccusto').AsInteger := 0;

          {Indicador de Atualização}
          ParamByName('lctatual').DataType := ftString;
          ParamByName('lctatual').AsString := '*';

          {Indicador de origem de Lançamento}
          ParamByName('lctct').DataType := ftString;
          ParamByName('lctct').AsString := 'FT';

          {Histórico}
          ParamByName('lcthistor').DataType := ftString;
          ParamByName('lcthistor').AsString := qry_contab_lanc_si_.FieldByName('NM_HISTORICO').AsString;

          Prepare;
          ExecSQL;

          qry_contab_lanc_si_.Next;
        end;
      end;

      DBSI.Commit;

      BoxMensagem( 'Arquivo de contabilização gerado com sucesso!', 3 );

      ArqLog.Close;
      ArqLog.Free;

    end;
    qry_contab_si_.Close;
    qry_contab_lanc_si_.Close;
  except
    DBSI.Rollback;
    BoxMensagem( 'Erro ao gerar arquivo de contabilização.', 2 );
  end;
  qry_capalote_insert.Free;
  qry_lancto_insert.Free;
  if DBSI.Connected then
  DBSI.Close;
  DBSI.Free;
end;

function Emite( Campo : TField; Tam : Byte ) : String;
var
  c : String;
begin
  if Campo.IsNull then
    c := c + Space(Tam)
  else
  begin
  if Length( Campo.AsString ) < Tam then
    c := c + Campo.AsString +
          Space( Tam - Length( Campo.AsString ) )
  else
    c := c + Copy( Campo.AsString, 1, Tam );
  end;
  Result := c;
end;

function Zonar( Valor : Double ) : String;
begin
  Result := Copy( FormatFloat( '0000000000000.00', Valor ), 1, 13 ) +
            Copy( FormatFloat( '0000000000000.00', Valor ), 15, 2 );
end;

function fsp_DI_calculo( nr_processo: String; at_taxa: Boolean ):AnsiString;
var vl_total_mle,          {DI}
    vl_mle_item,
    vl_cif_dolar,
    vl_min_di,
    vl_frete,
    tx_mle,           {Detalhe Mercadoria}
    pl_carga,              {DI}
    pl_mercadoria: Double; {Detalhe Mercadoria}
    in_moeda_unica: Boolean;
    contador : integer;
    // Variáveis 'in_calculou_afrmm' e 'in_cliente_usa_afrmm' criadas para armazenar se o processo usou a AFRMM ou não na hora do cálculo.    Eric 03/09/2012      10:32h
    saudacao, nm_cliente, destinatarios, vMyIndaiaEmail, in_calculou_afrmm, in_cliente_usa_afrmm : string;
    vFreteEmbutido: Boolean;
begin

  with datm_main.qry_verifica_integrid_ do
  begin
     Close;
     ParamByName('NR_PROCESSO').AsString := nr_processo;
     Open;
     if FieldByName('PB_CARGA').AsFloat < FieldByName('PL_CARGA').AsFloat then
     begin
        fsp_DI_calculo := 'Não foi possível concluir o cálculo,' + #13 +
                          'pois o peso bruto total da DI é menor do que o peso liquido total da DI.';
        Close;
        Exit;
     end;
     Close;
  end;

  try
    datm_main.db_broker.StartTransaction;
    with datm_main do
    begin
      CloseStoredProc(sp_di_calculo);
      sp_di_calculo.ParamByName('@NR_PROCESSO').AsString := nr_processo;
      ExecStoredProc(sp_di_calculo);
      CloseStoredProc(sp_di_calculo);
      datm_main.db_broker.Commit;
    end;

    // Realiza automaticamente o evento '419' - Confecção de DI
    with TQuery.Create(Application) Do
    begin
      DataBaseName := 'DBBROKER';
      Close;
      Sql.Clear;
      Sql.Text :=
      '  UPDATE F                                                                                                       '+
      '  SET DT_REALIZACAO = CASE ISNULL(CS.IN_HORA_EVENTOS, 0)                                                         '+
      '                           WHEN 0                                                                                '+
      '                            THEN CONVERT(DATETIME, CONVERT(VARCHAR, ISNULL(DT_REALIZACAO, GETDATE()), 103), 103) '+
      '                      ELSE ISNULL(DT_REALIZACAO, GETDATE())                                                      '+
      '                      END,                                                                                       '+
      '      CD_RESP_REALIZACAO = ISNULL(CD_RESP_REALIZACAO, :CD_USUARIO)                                               '+
      '  FROM TFOLLOWUP              F  (NOLOCK)                                                                        '+
      '  INNER JOIN TPROCESSO        P  (NOLOCK) ON P.NR_PROCESSO = F.NR_PROCESSO                                       '+
      '  LEFT JOIN TCLIENTE_SERVICO  CS (NOLOCK) ON CS.CD_CLIENTE  = P.CD_CLIENTE                                       '+
      '                                         AND CS.CD_SERVICO  = P.CD_SERVICO                                       '+
      '                                         AND CS.CD_UNID_NEG = P.CD_UNID_NEG                                      '+
      '                                         AND CS.CD_PRODUTO  = P.CD_PRODUTO                                       '+
      '  WHERE F.NR_PROCESSO = :NR_PROCESSO                                                                             '+
      '    AND F.CD_EVENTO   = :CD_EVENTO                                                                               '+
      '    AND IN_APLICAVEL = ''1''                                                                                     ';
      ParamByName('NR_PROCESSO').AsString    := nr_processo;
      ParamByName('CD_USUARIO').AsString     := str_cd_usuario;
      ParamByName('CD_EVENTO').AsString      := '419';
      ExecSql;
      Free;
    end;

    //Adicionado por que em alguns casos o datamodule não estava criado - Michel - 27/11/2008
    if not Assigned(datm_evento_realizacao) then
      Application.CreateForm(Tdatm_evento_realizacao, datm_evento_realizacao);

    with datm_evento_realizacao do
    begin
      if sp_atz_followup.Active then
        CloseStoredProc(sp_atz_followup);

      sp_atz_followup.ParamByName('@nr_processo').AsString := qry_tfollowup_NR_PROCESSO.AsString;
      ExecStoredProc(sp_atz_followup);
      CloseStoredProc(sp_atz_followup);
    end;

    // Grava a hora do cálculo, se não estiver preenchido
    with TQuery.Create(Application) Do
    begin
      DataBaseName := 'DBBROKER';
      Close;
      Sql.Clear;
      Sql.text := ' UPDATE TDECLARACAO_IMPORTACAO  '+
                  '    SET HR_CALCULO = ISNULL(HR_CALCULO, ''' + FormatDateTime('hh:mm:ss', Now) + ''') '+
                  '  WHERE NR_PROCESSO =:NR_PROCESSO ';
      ParamByName('NR_PROCESSO').AsString := nr_processo;
      ExecSql;
      Free;
    end;

   except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      ShowMessage(E.Message);
    end;
  end;

  with datm_main.qry_di_calculo_, datm_main do
  begin
    ParamByName('NR_PROCESSO').AsString:= nr_processo;
    Prepare;
    Open;
    in_moeda_unica := qry_di_calculo_IN_MOEDA_UNICA.Value;
    pl_carga       := strtofloat(format('%8.3f',[qry_di_calculo_PL_CARGA.Value]));
    pl_mercadoria  := strtofloat(format('%8.3f',[qry_di_calculo_SUM_PL_MERCADORIA.Value]));


    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      Close;
      SQL.Clear;
      SQL.text := '  SELECT (((VL_TOT_FRT_COLLECT + VL_TOT_FRT_PREPAID) - VL_FRETE_TNAC_MNEG) * TX_FRETE) AS FRETE, '+
                  '          TX_MLE, CD_INCOTERM, IN_EMBUT_FRT_ITENS                                                '+
                  '    FROM TDECLARACAO_IMPORTACAO                                                                  '+
                  '   WHERE NR_PROCESSO = '+QuotedStr(nr_processo);
      Open;

      vl_frete := FieldbyName('FRETE').AsFloat;
      tx_mle := FieldbyName('TX_MLE').AsFloat;
      vFreteEmbutido := FieldbyName('IN_EMBUT_FRT_ITENS').AsBoolean;
      Close;
      SQL.Clear;
      //Recupera o valor do frete, para comparar, logo abaixo, com o da mercadoria - Eric - 07/05/2012   Ocorr: 01586/12
      //E recupera o incoterm, como sendo também uma condição - Eric - 11/05/2012 0corr: RETRABALHO da ocorrência acima.
      SQL.text := ' SELECT COUNT(*) AS CONTADOR                    '+
                  '   FROM TADICAO_DE_IMPORTACAO       AD (nolock) '+
                  '  INNER JOIN TDECLARACAO_IMPORTACAO DI (nolock) ON DI.NR_PROCESSO = AD.NR_PROCESSO '+
                  '  WHERE AD.NR_PROCESSO = '+QuotedStr(nr_processo) +
                  '    AND ((AD.CD_INCOTERMS_VENDA IN (''EXW'',''FOB'',''FAS'',''FCA'')) OR DI.IN_EMBUT_FRT_ITENS = ''1'')';
      Open;
      contador := FieldbyName('CONTADOR').AsInteger;   //O Count do Select retorna 1 ou mais caso alguma adição tenha um dos 4 incoterms - Eric 11/05/2012
      Free;
    end;

    //Verifica na query se o cliente está habilitado para usar a AFRMM, e se estiver, verifica se na DI calculada foi usada a AFRMM     Eric 03/09/2012   10:34h
    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.text :=' SELECT P.NR_PROCESSO,  '+
                 ' ISNULL(G.IN_MARINHA_MERCANTE_ICMS, ''0'') AS IN_MARINHA_MERCANTE_ICMS '+
                 '   FROM TPROCESSO   P (nolock) '+
                 '  INNER JOIN TGRUPO G (nolock) ON G.CD_GRUPO = P.CD_GRUPO '+
                 '                              AND G.IN_ATIVO = ''1'' '+
                 '                              AND P.NR_PROCESSO = '+QuotedStr(nr_processo);
      Open;
      in_cliente_usa_afrmm := FieldbyName('IN_MARINHA_MERCANTE_ICMS').AsString;
      If in_cliente_usa_afrmm = '1' then
      begin
        Close;
        SQL.Clear;
        SQL.text :=   ' SELECT DI.NR_PROCESSO, '+
                      '        DI.IN_CALCULOU_COM_AFRMM '+
                      '   FROM TDECLARACAO_IMPORTACAO DI (nolock) '+
                      '  INNER JOIN TPROCESSO P ON P.NR_PROCESSO = DI.NR_PROCESSO '+
                      '  WHERE DI.NR_PROCESSO = '+QuotedStr(nr_processo);
        Open;
        in_calculou_afrmm := FieldbyName('IN_CALCULOU_COM_AFRMM').AsString;
        Close;
        Free;
      end
      else
      begin
        in_calculou_afrmm := '0';
        Close;
        Free;
      end;
    end;

    if sp_di_calculo.ParamByName('Result').AsString = '6' then
      fsp_DI_calculo := 'Neste processo há Acordo ALADI não preenchido para País do Mercosul.'#13 +
                        'Verifique a necessidade do seu preenchimento.'#13 +
                        'Calculo concluído.'
    else
    if in_moeda_unica then
    begin
      vl_total_mle := Arredondar( qry_di_calculo_VL_TOT_MLE_MNEG.AsCurrency, 2 );
      vl_mle_item  := Arredondar( qry_di_calculo_SUM_VL_MLE_ITEM.AsCurrency, 2 );

      if sp_di_calculo.ParamByName('Result').AsString = '4' then
      begin
        fsp_DI_calculo := 'Não foi possível concluir o cálculo,' + #13 +
                          'Moeda MLE não informada !!';
      end
      else
      if (vl_mle_item <> vl_total_mle) and (pl_carga <> pl_mercadoria) then
      begin
        fsp_DI_calculo := 'Não foi possível concluir o cálculo,' + #13 +
                          'pois o valor total da DI é diferente da somatória dos valores dos Itens e' + #13 +
                          'o peso líquido da DI é diferente da somatória dos pesos líquido dos Itens.' + #13 +
                          'Valor total da DI = '   +  Format('%1.2f', [vl_total_mle])  + #13 +
                          'Somatória dos Itens = ' +  Format('%1.2f',[vl_mle_item])    + #13 +
                          'Peso líquido da DI = '  +  Format('%1.7f', [pl_carga])      + #13 +
                          'Somatória dos pesos líquido dos itens = ' + Format('%1.7f', [pl_mercadoria]);
      {3}
      end
      else if (vl_mle_item <> vl_total_mle) then
      begin
        fsp_DI_calculo := 'Não foi possível concluir o cálculo,' + #13 +
                          'pois o valor total da DI é diferente da somatória dos valores dos Itens.' + #13 +
                          'Valor total da DI = '   + Format('%1.2f', [vl_total_mle]) + #13 +
                          'Somatória dos Itens = ' + Format('%1.2f',[vl_mle_item]);
      {2}
      end
      else
      if (pl_carga <> pl_mercadoria) then
      begin
        fsp_DI_calculo := 'Não foi possível concluir o cálculo,' + #13 +
                          'pois o peso líquido da DI é diferente da somatória dos pesos líquido dos Itens.' + #13 +
                          'Peso líquido da DI = ' + Format('%1.7f', [pl_carga]) + #13 +
                          'Somatória dos pesos líquido dos itens = ' + Format('%1.7f', [pl_mercadoria]);
      {1}
      end
      else
      begin

        // Verifica, no momento do cálculo, se o valor do frete é maior que o valor da mercadoria - Eric - 07/05/2012   Ocorr: 01586/12
        // E verifica também o incoterm, como sendo também uma condição - Eric - 11/05/2012 0corr: RETRABALHO da ocorrência acima.
        if contador >= 1 then   // Variável que retorna 1 ou mais se alguma adição do processo possuir um dos INCOTERMs e/ou Frete Embutido - Eric 11/05/2012
         Begin
          if vFreteEmbutido and (vl_frete > (vl_total_mle * tx_mle))  then
            begin
              MessageDlg('Atenção,' + #13 +
                          'O valor do frete é maior do que o valor da mercadoria.' + #13 +
                          'Valor do frete = ' + Format('%1.2f', [vl_frete]) + #13 +
                          'Valor da mercadoria = ' + Format('%1.2f', [vl_total_mle * tx_mle]), mtWarning, [mbOK], 0);
            end;
         End;

        if sp_di_calculo.ParamByName('Result').AsString = '7' then
        begin
          ShowMessage('Atenção! A DI deste processo excedeu o valor máximo parametrizado.' + #13 +
                            ' Favor analisar o processo.');

          If HourOf(Now) in [6..11] then
               saudacao := 'Bom dia, '
          else
          if HourOf(Now) in [12..17] then
               saudacao := 'Boa tarde, '
          else
          if HourOf(Now) in [18..24] then
               saudacao := 'Boa noite, ';

          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            Close;
            SQL.text := ' SELECT E.NM_EMPRESA                                             '+
                        '   FROM TEMPRESA_NAC   E (nolock)                                '+
         		            '  INNER JOIN TPROCESSO P (nolock)ON P.CD_CLIENTE = E.CD_EMPRESA  '+
                        '  WHERE P.NR_PROCESSO = '+ QuotedStr(nr_processo);
            Open;
            nm_cliente := FieldbyName('NM_EMPRESA').AsString;

            Close;
            SQL.Clear;
            SQL.text := 'SELECT ISNULL(P.VL_CIF_DOLAR, 0) AS VL_CIF_DOLAR,  '+
                        '       ISNULL(H.VL_MIN_DI,0)     AS VL_MIN_DI      '+
                        '  FROM TPROCESSO P (NOLOCK),                       '+
                        '       TCLIENTE_HABILITACAO H (NOLOCK)             '+
           	            ' WHERE P.CD_UNID_NEG = H.CD_UNID_NEG               '+
                        '   AND P.CD_PRODUTO  = H.CD_PRODUTO                '+
                        '   AND P.CD_CLIENTE  = H.CD_CLIENTE                '+
                        '   AND P.NR_PROCESSO = '+ QuotedStr(nr_processo);
            Open;
            vl_cif_dolar := FieldbyName('VL_CIF_DOLAR').AsFloat;
            vl_min_di    := FieldbyName('VL_MIN_DI').AsFloat;

            Close;
            SQL.Clear;
            SQL.Add('');

            with TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini') do
            begin
              destinatarios := ReadString('Emails', 'Importação', 'ti@myindaia.com.br') + ';';
              Free;
            end;
            // Incluído o WITH acima para poder alterar o destino dos e-mails sem precisar mexer no fonte novamente - Michel - 10/12/2012

            SQL.text := ' SELECT DISTINCT RTRIM(U.NM_EMAIL) AS NM_EMAIL                   '+
                        '   FROM TCONTROLE_ACESSO CA (NOLOCK)                             '+
                        '  INNER JOIN TCARGO      C  (NOLOCK) ON C.CD_CARGO = CA.CD_CARGO '+
                        '  INNER JOIN TUSUARIO    U  (NOLOCK) ON U.CD_CARGO = C.CD_CARGO  '+
                        '  WHERE CD_MODULO  = ''02''                                      '+
                        '    AND CD_ROTINA  = ''0203''                                    '+
                        '    AND IN_ACESSO  = ''1''                                       '+
                        '    AND C.IN_ATIVO = ''1''                                       '+
                        '    AND U.IN_ATIVO = ''1''                                       '+
                        '    AND C.CD_CARGO NOT IN (''001'', ''124'')                     '+
                        '    AND U.CD_USUARIO NOT IN (''0087'', ''2330'')                 ';
            Open;
            First;
            while not Eof do
            begin
              destinatarios := destinatarios + FieldbyName('NM_EMAIL').AsString + ';';
              Next;
            end;

            while Copy(destinatarios, 1, 1) = ';' do
              System.Delete(destinatarios, 1, 1);
            while Pos(';;', destinatarios) > 0 do
              destinatarios := StringReplace(destinatarios, ';;', ';', [rfReplaceAll]);

            Close;
            SQL.Clear;
            Free;
          end;

          vMyIndaiaEmail := '<br><br><i>Este e-mail é gerado automaticamente pelo MyIndaiá.</i>';
          EnviaEmailHtml('[myIndaiáMail] Aviso de DI para Liberação (valor excedido)', saudacao +'<br><br> A DI do processo ' + nr_processo + ' do cliente '+ nm_cliente + ' excedeu em USD ' + FormatFloat('0.00',vl_cif_dolar-vl_min_di) + ' o valor máximo parametrizado (USD ' + FormatFloat('0.00', vl_min_di) +') para registro sem qualquer aprovação. Se você for o responsável por esse cliente, favor analisar o processo e caso deseje, pode fazer a liberação para registro através da tela de Liberação de DI (Valores Altos).'+vMyIndaiaEmail, destinatarios);
        end;

        // 10/02/2005       --- Alterado para verificar se a AFRMM foi inclusa no cálculo da DI          Eric    03/09/2012   11:17h
        if sp_di_calculo.ParamByName('Result').AsString = '5' then
        begin
          if ((in_calculou_afrmm = '1') and (in_cliente_usa_afrmm = '1')) or ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '0')) then
          begin
            fsp_DI_calculo := 'Cálculo concluído.' + #13 +
                              'Solicitar a Diretoria a Liberação do processo.';
          end
          else if ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '1')) then
          begin
            fsp_DI_calculo := 'Cálculo concluído.' + #13 +
                              'Solicitar a Diretoria a Liberação do processo.' + #13#13 +
                              'Este cliente está configurado para ter na sua base de cálculo do ICMS' + #13 +
                              'o valor da AFRMM, no entanto esta DI não calculou a base do ICMS com a AFRMM.' + #13 +
                              'Caso isto esteja incorreto, verifique e efetue o cálculo novamente.';
          end;
        end
        else
          If ((in_calculou_afrmm = '1') and (in_cliente_usa_afrmm = '1')) or ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '0')) then
          begin
            //fsp_DI_calculo := 'Cálculo concluído.'
            fsp_DI_calculo := '';
          end
          else
          if ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '1')) then
          begin
            fsp_DI_calculo := 'Cálculo concluído.' + #13#13 +
                              'Este cliente está configurado para ter na sua base de cálculo do ICMS' + #13 +
                              'o valor da AFRMM, no entanto esta DI não calculou a base do ICMS com a AFRMM.' + #13 +
                              'Caso isto esteja incorreto, verifique e efetue o cálculo novamente.';
          end;
      end;
    end
    else
    begin
      if (pl_carga <> pl_mercadoria) then
      begin
        fsp_DI_calculo := 'Não foi possível concluir o cálculo,' + #13 +
                          'pois o peso líquido da DI é diferente da somatória dos pesos líquido dos Itens.' + #13 +
                          'Peso líquido da DI = ' +  Format('%1.7f', [pl_carga]) + #13 +
                          'Somatória dos pesos líquido dos itens = ' + Format('%1.7f', [pl_mercadoria]);
      {1}
      end
      else
      begin
        // 10/02/2005     --- Alterado para verificar se a AFRMM foi inclusa no cálculo da DI          Eric    03/09/2012   11:17h
        if sp_di_calculo.ParamByName('Result').AsString = '5' then
        begin
          if ((in_calculou_afrmm = '1') and (in_cliente_usa_afrmm = '1')) or ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '0')) then
          begin
            fsp_DI_calculo := 'Cálculo concluído.' + #13 +
                              'Solicitar a Diretoria a Liberação do processo.';
          end
          else if ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '1')) then
          begin
            fsp_DI_calculo := 'Cálculo concluído.' + #13 +
                              'Solicitar a Diretoria a Liberação do processo.' + #13#13 +
                              'Este cliente está configurado para ter na sua base de cálculo do ICMS' + #13 +
                              'o valor da AFRMM, no entanto esta DI não calculou a base do ICMS com a AFRMM.' + #13 +
                              'Caso isto esteja incorreto, verifique e efetue o cálculo novamente.';
          end;
        end
        else
          If ((in_calculou_afrmm = '1') and (in_cliente_usa_afrmm = '1')) or ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '0')) then
          begin
          //  fsp_DI_calculo := 'Cálculo concluído.'
              fsp_DI_calculo := '';
          end
          else
          if ((in_calculou_afrmm = '0') and (in_cliente_usa_afrmm = '1')) then
          begin
            fsp_DI_calculo := 'Cálculo concluído.' + #13#13 +
                              'Este cliente está configurado para ter na sua base de cálculo do ICMS' + #13 +
                              'o valor da AFRMM, no entanto esta DI não calculou a base do ICMS com a AFRMM.' + #13 +
                              'Caso isto esteja incorreto, verifique e efetue o cálculo novamente.';
          end;
      end;
    end;
    Close;
    if at_taxa then AtInfoCompl(nr_processo);
  end;
end;

function fsp_DA_calculo( nr_processo: String ):AnsiString;
begin
  {Nova rotina de data de cálculo}
  Application.CreateForm( Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '17';
  frm_sel_data.nr_proc_da       := nr_processo;
  frm_sel_data.ShowModal;

  try
    datm_main.db_broker.StartTransaction;
    with datm_main do
    begin
      CloseStoredProc(sp_da_calculo);
      sp_da_calculo.ParamByName('@NR_PROCESSO').AsString := nr_processo;
      ExecStoredProc(sp_da_calculo);
      CloseStoredProc(sp_da_calculo);
      datm_main.db_broker.Commit;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  fsp_DA_calculo := 'Cálculo concluído.';
end;

function fsp_Nac_calculo( nr_processo: String ):AnsiString;
begin
  {Nova rotina de data de cálculo}
  Application.CreateForm( Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '18';
  frm_sel_data.nr_proc_nac      := nr_processo;
  frm_sel_data.ShowModal;

  try
    datm_main.db_broker.StartTransaction;
    with datm_main do
    begin
      CloseStoredProc(sp_nac_calculo);
      sp_nac_calculo.ParamByName('@NR_PROCESSO').AsString := nr_processo;
      ExecStoredProc(sp_nac_calculo);
      CloseStoredProc(sp_nac_calculo);
      datm_main.db_broker.Commit;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  fsp_Nac_calculo := 'Cálculo concluído.';
end;

procedure AtInfoCompl( nr_processo: String );
var cTexto, str_cd_moeda  : String;
    i :Byte;
    str_hist_taxa : array [1..10] of string;
    tx_inf_compl, cTexto1, cTexto2 : AnsiString;
    npos          : integer;
    str_hist_vmle, str_hist_fr_seg, str_hist_cif : String;
    dbl_cif_mn, dbl_vmle_mn, dbl_fr_seg_mn, dbl_cif_mneg, dbl_vmle_mneg, dbl_fr_seg_mneg : Double;
begin
  with datm_main do
  begin
    {Abrindo Query}
    qry_di_taxa_.Close;
    qry_adicao_taxa_.Close;

    qry_di_taxa_.ParamByName('NR_PROCESSO').AsString := nr_processo;
    qry_di_taxa_.Prepare;
    qry_di_taxa_.Open;

    qry_adicao_taxa_.Prepare;
    qry_adicao_taxa_.Open;

    dbl_vmle_mn      := qry_di_taxa_VL_TOTAL_MLE_MN.AsFloat +
                        qry_di_taxa_VL_TOT_DESPS_MN.AsFloat;
    if qry_di_taxa_CD_MOEDA_MLE.AsString = '220' then
      dbl_vmle_mneg  := qry_di_taxa_VL_TOT_MLE_MNEG.AsFloat +
                        qry_di_taxa_VL_TOT_DESPS_MNEG.AsFloat
    else
    begin
      if qry_di_taxa_TX_DOLAR.AsFloat <> 0 then
        dbl_vmle_mneg   := dbl_vmle_mn / qry_di_taxa_TX_DOLAR.AsFloat
      else
        dbl_vmle_mneg   := 0
    end;

    dbl_fr_seg_mn     := qry_di_taxa_VL_TOTAL_FRETE_MN.AsFloat +
                         qry_di_taxa_VL_TOTAL_SEG_MN.AsFloat;
    if qry_di_taxa_CD_MOEDA_FRETE.AsString = '220' then
    begin
      dbl_fr_seg_mneg := qry_di_taxa_VL_TOT_FRT_COLLECT.AsFloat +
                         qry_di_taxa_VL_TOT_FRT_PREPAID.AsFloat -
                         qry_di_taxa_VL_FRETE_TNAC_MNEG.AsFloat;
      if qry_di_taxa_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_di_taxa_VL_TOT_SEGURO_MNEG.AsFloat
      else
         if qry_di_taxa_TX_DOLAR.AsFloat <> 0 then
            dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                               (qry_di_taxa_VL_TOTAL_SEG_MN.AsFloat / qry_di_taxa_TX_DOLAR.AsFloat)
    end
    else
    begin
      if qry_di_taxa_TX_DOLAR.AsFloat <> 0 then
         dbl_fr_seg_mneg := (qry_di_taxa_VL_TOTAL_FRETE_MN.AsFloat / qry_di_taxa_TX_DOLAR.AsFloat)
      else
         dbl_fr_seg_mneg := 0;
      if qry_di_taxa_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_di_taxa_VL_TOT_SEGURO_MNEG.AsFloat
      else
         if qry_di_taxa_TX_DOLAR.AsFloat <> 0 then
            dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                               (qry_di_taxa_VL_TOTAL_SEG_MN.AsFloat / qry_di_taxa_TX_DOLAR.AsFloat)
    end;

    dbl_cif_mn   := dbl_vmle_mn   + dbl_fr_seg_mn;
    dbl_cif_mneg := dbl_vmle_mneg + dbl_fr_seg_mneg;

    str_hist_vmle   := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mneg ) +
                       '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mn );
    str_hist_fr_seg := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mneg ) +
                       '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mn );
    str_hist_cif    := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mneg ) +
                       '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mn );

    for i:=1 to 10 do
    begin
      str_hist_taxa[i] := '';
    end;
    str_cd_moeda := '(220)';
    str_hist_taxa[1] := FFloatToMsk ( '#,###,##0.0000000', qry_di_taxa_TX_DOLAR.AsFloat ) + '(220)';
    if ( Pos(qry_di_taxa_CD_MOEDA_MLE.AsString, str_cd_moeda) = 0 ) and ( qry_di_taxa_CD_MOEDA_MLE.AsString <> '' ) then
    begin
      str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_di_taxa_TX_MLE.AsFloat ) + '(' + qry_di_taxa_CD_MOEDA_MLE.AsString + ')';
      str_cd_moeda := str_cd_moeda + '(' + qry_di_taxa_CD_MOEDA_MLE.AsString + ')';
    end;
    if ( Pos(qry_di_taxa_CD_MOEDA_FRETE.AsString, str_cd_moeda) = 0 )  and ( qry_di_taxa_CD_MOEDA_FRETE.AsString <> '' ) then
    begin
      str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_di_taxa_TX_FRETE.AsFloat ) + '(' + qry_di_taxa_CD_MOEDA_FRETE.AsString + ')';
      str_cd_moeda := str_cd_moeda + '(' + qry_di_taxa_CD_MOEDA_FRETE.AsString + ')';
    end;
    if ( Pos(qry_di_taxa_CD_MOEDA_SEGURO.AsString, str_cd_moeda) = 0 ) and ( qry_di_taxa_CD_MOEDA_SEGURO.AsString <> '' )  then
    begin
      str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_di_taxa_TX_MLE.AsFloat ) + '(' + qry_di_taxa_CD_MOEDA_SEGURO.AsString + ')';
      str_cd_moeda := str_cd_moeda + '(' + qry_di_taxa_CD_MOEDA_SEGURO.AsString + ')';
    end;
    if not qry_di_taxa_IN_MOEDA_UNICA.AsBoolean then
    begin
      qry_adicao_taxa_.Close;
      qry_adicao_taxa_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_adicao_taxa_.Prepare;
      qry_adicao_taxa_.Open;
      while not qry_adicao_taxa_.EOF do
      begin
        if (pos(qry_adicao_taxa_CD_MOEDA_MLE.AsString, str_cd_moeda) = 0) and
           (((length(str_cd_moeda) div 5)+1) < 10 ) then
        begin
          str_hist_taxa[((length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_adicao_taxa_TX_MLE.AsFloat ) + '(' + qry_adicao_taxa_CD_MOEDA_MLE.AsString + ')';
          str_cd_moeda := str_cd_moeda + '(' + qry_adicao_taxa_CD_MOEDA_MLE.AsString + ')';
        end;
        qry_adicao_taxa_.Next;
      end;
      qry_adicao_taxa_.Close;
    end;
  end;

  tx_inf_compl := '';
  cTexto1      := datm_main.qry_di_taxa_TX_INFO_COMPL.AsString; {Leandro}
  npos         := length( cTexto1 );
  while npos > 0 do
  begin
    npos  := nAt ( #13 , cTexto1 );
    if npos > 0 then
    begin
      cTexto2 := Copy ( cTexto1 , 1 , ( npos + 1 ) );
      cTexto1 := Copy ( cTexto1 , ( npos + 1 ) , ( length( cTexto1 ) - npos ) );
    end
    else
    begin
      cTexto2 := cTexto1;
      cTexto1 := '';
    end;
    if Copy ( cTexto1 , 1 , 1 ) = #10 then cTexto1 := Copy ( cTexto1 , 2 , ( length (cTexto1) - 1 ) );
    npos := length( cTexto2 );
    if npos < 25 then
       cTexto := Copy ( cTexto2 , 1, npos)
    else
       cTexto := Copy ( cTexto2 , 1, 25);

    if ( cTexto <> 'VMLE....................:' ) and
       ( cTexto <> 'FRETE + SEGURO..........:' ) and
       ( cTexto <> 'VMLE + FRETE + SEGURO...:' ) and
       ( cTexto <> 'TAXA CAMBIAL............:' ) then
    begin
      tx_inf_compl := tx_inf_compl + cTexto2;
    end;
  end;

  if Copy(tx_inf_compl, length(tx_inf_compl)-1, 2) <> #13#10 then
     tx_inf_compl := tx_inf_compl + #13#10;
  if str_hist_vmle     <> '' then
     tx_inf_compl := tx_inf_compl + 'VMLE....................: ' + str_hist_vmle    + #13#10;
  if str_hist_fr_seg   <> '' then
     tx_inf_compl := tx_inf_compl + 'FRETE + SEGURO..........: ' + str_hist_fr_seg  + #13#10;
  if str_hist_cif      <> '' then
     tx_inf_compl := tx_inf_compl + 'VMLE + FRETE + SEGURO...: ' + str_hist_cif     + #13#10;
  for i := 1 to 10 do
  begin
    if str_hist_taxa[i]  <> '' then
      tx_inf_compl := tx_inf_compl + 'TAXA CAMBIAL............: ' + str_hist_taxa[i] + #13#10
    else
      break;
  end;
  try
    datm_main.db_broker.StartTransaction;
    datm_main.qry_di_taxa_.Edit;
    datm_main.qry_di_taxa_TX_INFO_COMPL.AsString := tx_inf_compl;
    datm_main.qry_di_taxa_.Post;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  datm_main.qry_di_taxa_.Close;
  datm_main.qry_di_taxa_.UnPrepare;
end;

procedure HabDes(Sender : TObject; Op : Boolean );
begin
  if ( Not ( Sender is TSpeedButton ) ) then
  begin
    if Op then TDBEdit(Sender).Color := clWindow
    else TDBEdit(Sender).Color       := clMenu;
    TDBEdit(Sender).TabStop          := Op;
  end
  else
  begin
    TDBEdit(Sender).Enabled          := Op;
  end;
  if ( Not ( Sender is TRadioButton ) ) and ( Not ( Sender is TSpeedButton ) ) then
     TDBEdit(Sender).ReadOnly := Not Op;
end;

function fLocaliza( Query : DBTables.TQuery; Chave : String; Campo : String ) : Boolean;
begin
  fLocaliza := False;
  if Chave = '' then
  begin
    Query.First;
    fLocaliza := True;
  end
  else
  begin
    try
      if Query.Locate(Campo, Chave, [loCaseInsensitive, loPartialKey]) then
      begin
        fLocaliza := True;
      end;
    except
      BoxMensagem('Chave inválida!', 2);
      fLocaliza := False;
    end;
  end;
end;

function FormataFloat(s : String; i : Double) : String;
begin
  if i < 0 then s := Copy( s, 2, Length(s) - 1 );
  FormataFloat := FormatFloat(s,i);
  if i = 0 then
    FormataFloat := '0' + FormatFloat(s,i);
end;

procedure ExibeErro( nm_sp: String; cd_erro: Integer; Item : String; vl_sd : Double );
begin
  with datm_main do
  begin
    qry_calculo_erro_.Close;
    qry_calculo_erro_.ParamByName('NM_STORED_PROCEDURE').AsString := nm_sp;
    qry_calculo_erro_.ParamByName('CD_ERRO').AsInteger            := cd_erro;
    qry_calculo_erro_.Prepare;
    qry_calculo_erro_.Open;
    if qry_calculo_erro_.RecordCount > 0 then
    begin
      if Trim( Item ) = '' then
      begin
        if vl_sd > 0 then
          BoxMensagem( qry_calculo_erro_NM_MENSAGEM.AsString + '.' + #13#10 + FormatFloat( '########0.00',vl_sd ), 2)
        else
          BoxMensagem( qry_calculo_erro_NM_MENSAGEM.AsString, 2 );
      end
      else
        BoxMensagem( qry_calculo_erro_NM_MENSAGEM.AsString + ' ao calcular item ' + Item, 2);
    end;
    qry_calculo_erro_.Close;
  end;
end;

function Sequencia( Identificador: String; Chave : String ) : Integer;
begin
  with datm_main do
  begin
    try
//      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_ult_sequencia);
      sp_ult_sequencia.ParamByName('@IDENTIFICADOR').AsString := Identificador;
      sp_ult_sequencia.ParamByName('@CHAVE').AsString         := Chave;
      ExecStoredProc(sp_ult_sequencia);
      Result := sp_ult_sequencia.ParamByName('@NR_SEQUENCIA').AsInteger;
      CloseStoredProc(sp_ult_sequencia);
//      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
//        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Result := 0;
      end;
    end;
  end;
end;

function LeFloat(Inteiro : String; Decimal: String) : Double;
begin
  Result := StrToFloat(Inteiro + ',' + Decimal);
end;

function VerIntegridade : Boolean;
var Origem, Destino: String;
    Relatorios, Plans: TSearchRec;
    Relatorio_Encontrado, Plan_Encontrado: Integer;
    Erro: Boolean;
begin
  Result := True;
  Exit;


  
  Erro           := False;
  if Not datm_main.tbl_parametro_.Active then datm_main.tbl_parametro_.Open;
  datm_main.tbl_parametro_.First;

  Origem         := datm_main.tbl_parametro_PATH_GSM_SERVER.AsString;
  Destino        := datm_main.tbl_parametro_PATH_GSM_CLIENT.AsString;

  if ( Not FileExists(Destino + '\DDBROKER.EXE') ) or
     ( FileAge( Origem + '\DDBROKER.EXE' ) > FileAge(Destino + '\DDBROKER.EXE') ) or
     ( Not FileExists( Destino + '\RAS.EXE' ) ) or
     ( FileAge( Origem + '\RAS.EXE' ) > FileAge( Destino + '\RAS.EXE' ) ) then
  begin
//    BoxMensagem('DD Broker desatualizado!', 3);
    Erro := True;
  end;

  {Crystal Reports}
  Relatorio_Encontrado := FindFirst(Origem + '\*.rpt', faAnyFile, Relatorios);
  while Relatorio_Encontrado = 0 do
  begin
    if ( Not FileExists( Destino + '\' + Relatorios.Name ) ) or
       ( FileAge ( Origem + '\' + Relatorios.Name ) > FileAge( Destino + '\' + Relatorios.Name ) ) then
    begin
//      BoxMensagem(Relatorios.Name + ' desatualizado!', 3);
      Erro := True;
    end;
    Relatorio_Encontrado := FindNext(Relatorios);
  end;
  FindClose(Relatorio_Encontrado);

  {Planilhas Excel}
  Plan_Encontrado := FindFirst(Origem + '\*.xls', faAnyFile, Plans);
  while Plan_Encontrado = 0 do
  begin
    if ( Not FileExists(Destino + '\' + Plans.Name) ) or
       ( FileAge ( Origem + '\' + Plans.Name ) > FileAge( Destino + '\' + Plans.Name ) ) then
    begin
//      BoxMensagem(Plans.Name + ' desatualizado!', 3);
      Erro := True;
    end;
    Plan_Encontrado := FindNext(Plans);
  end;
  FindClose(Plan_Encontrado);
  if Erro then BoxMensagem( 'Atenção! Sua versão do DDBroker está desatualizada!', 2 );
  Result := Not Erro;
end;

function CampoTXT( Campo : TField; Tam : Byte ): String;
begin
  if Campo.IsNull then
    Result := Space(Tam)
  else
  begin
    if Length( Campo.AsString ) < Tam then
       Result := Campo.AsString + Space( Tam - Length( Campo.AsString ) )
    else
       Result := Copy( Campo.AsString, 1, Tam );
  end;
end;

function CampoTXTNum( Campo : TField; Tam : Byte ): String;
begin
  if Campo.IsNull then
    Result := Replicate( '0', Tam )
  else
    Result := Replicate( '0', Tam - Length( Trim( Campo.AsString ) ) ) +
               Campo.AsString;
end;

function ConvAscii( Texto : String ): String;
var i: integer;
begin
  for i := 1 to length( Texto ) do
  begin
    if not ( Texto[i] in ['A'..'Z', 'a'..'z', '0'..'9', '.', '/'] ) then
    begin
      if Texto[i] in ['À', 'Á', 'Ä', 'Â', 'Ã'] then Texto[i] := 'A' else
      if Texto[i] in ['È', 'É', 'Ë', 'Ê']      then Texto[i] := 'E' else
      if Texto[i] in ['Ì', 'Í', 'Ï', 'Î']      then Texto[i] := 'I' else
      if Texto[i] in ['Ò', 'Ó', 'Ö', 'Ô', 'Õ'] then Texto[i] := 'O' else
      if Texto[i] in ['Ù', 'Ú', 'Ü', 'Û']      then Texto[i] := 'U' else
      if Texto[i] in ['Ç']                     then Texto[i] := 'C' else
      if Texto[i] in ['à', 'á', 'ä', 'â', 'ã'] then Texto[i] := 'a' else
      if Texto[i] in ['è', 'é', 'ë', 'ê']      then Texto[i] := 'e' else
      if Texto[i] in ['ì', 'í', 'ï', 'î']      then Texto[i] := 'i' else
      if Texto[i] in ['ò', 'ó', 'ö', 'ô', 'õ'] then Texto[i] := 'o' else
      if Texto[i] in ['ù', 'ú', 'ü', 'û']      then Texto[i] := 'u' else
      if Texto[i] in ['ç']                     then Texto[i] := 'c' else
                                                    Texto[i] := ' ';
    end;
  end;
  ConvAscii := Texto;
end;

procedure CloseStoredProc( Componente : TStoredProc );
begin
  Componente.Close;
  Componente.Unprepare;
end;

procedure CloseQuery( Componente : DBTables.TQuery );
begin
  Componente.Close;
  Componente.Unprepare;
end;

procedure ExecStoredProc( Componente : TStoredProc );
begin
  Componente.Prepare;
  Componente.ExecProc;
end;

procedure OpenQuery( Componente : DBTables.TQuery );
begin
  Componente.Prepare;
  if Componente is ServicoNovo.TQuery then
    ServicoNovo.TQuery(Componente).Open
  else
    Componente.Open;
end;

function Tipo_Importador( cTipo : String ) : String;
begin
   if cTipo = 'J' then begin
     Tipo_Importador := '1';   { Pessoa Jurídica }
     end
   else if cTipo = 'F' then begin
     Tipo_Importador := '2';   { Pessoa Física   }
     end
   else if cTipo = 'M' then begin
     Tipo_Importador := '4';   { Missão Diplomática }
     end
   else if cTipo = 'E' then begin
     Tipo_Importador := '3';   { Exterior ( Pessoa Física ) }
     end
   else begin
     Tipo_Importador := '';   { Nada }
   end;
end;

function Num_To_Str(nValor : Double; nTamTotal : Integer; nFracao : Integer) : String;
var
   nInteiros, nInt : String;
   nFracaoNum : String;
   cFracaoNum : string;
   i,nPos     : integer;
begin
   cFracaoNum := '';
   if nValor < 0 then begin     {Proteção de Código p/ Evitar erro!}
      nValor := Abs(nValor);
   End;
   nInteiros := Replicate('0', nTamTotal-nFracao );
   nInt := nInteiros;
   nInteiros := FormatFloat(nInteiros,Int(nValor));

   cFracaoNum := FormatFloat( '#0.' + Replicate( '0', nFracao ), Frac(nValor) );

   nFracaoNum := '';
   nPos := Pos(',',cFracaoNum);
   if nPos > 0 then begin
      for i := 1 to nFracao do begin
         if cFracaoNum[nPos+i] <> #0 then begin
            nFracaoNum := nFracaoNum + cFracaoNum[nPos+i];
            end
         else begin
            break;
         end;
      end;
      nFracaoNum := nFracaoNum+Replicate('0',nFracao-i+1 );
      end
   else begin
      // nFracaoNum := FormatFloat(nInteiros,0);
      nFracaoNum := FormatFloat(nInt,0);
   end;
   Result := nInteiros+nFracaoNum
end;

function FormataData(const S: String): string;
begin
  FormataData := Copy( s, 1, 2 ) + Copy( s, 4, 2 ) + Copy( s, 7, 4); {ddmmyyyy}
end;

function GeraDigitoBoleto( nr_boleto : String ) : String;
Const
  Pesos = '32765432765432';
Var
  i, nDigito : byte;
  dbl_soma : Double;
begin
  dbl_soma := 0;
  for i := 1 to 14 do
  begin
    dbl_soma := dbl_soma +
    ( StrToFloat( copy( nr_boleto, i, 1 ) ) *
      StrToFloat( copy( Pesos, i, 1 ) ) );
  end;
  nDigito := Trunc( dbl_soma ) mod 11;
  if nDigito = 0 then Result := IntToStr( nDigito )
  else if nDigito = 1 then Result := 'P'
  else Result := IntToStr( 11 - nDigito );
end;

function FNullToZero( Campo : String ) : String;
begin
  if Trim(Campo) = '' then
     Campo := '0';
  Result := Campo;
end;

// Valida IE (Todos os Estados, inclusive DF)
function IE(const UF, IE: String):Boolean;

  function IESPCOM(const IE: String): Boolean; // IE de SP para Comércio e indústria
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
    Peso2: array[0..10] of Integer;
  begin
    Peso1[0] := 1;
    Peso1[1] := 3;
    Peso1[2] := 4;
    Peso1[3] := 5;
    Peso1[4] := 6;
    Peso1[5] := 7;
    Peso1[6] := 8;
    Peso1[7] := 10;

    Peso2[0] := 3;
    Peso2[1] := 2;
    Peso2[2] := 10;
    Peso2[3] := 9;
    Peso2[4] := 8;
    Peso2[5] := 7;
    Peso2[6] := 6;
    Peso2[7] := 5;
    Peso2[8] := 4;
    Peso2[9] := 3;
    Peso2[10] := 2;

    cIE := Copy(IE, 1, 8);
    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := nSoma mod 11;
    if nD = 10 then nD := 0;
    cIE := cIE + IntToStr(nD) + Copy(IE,10,2);
    nSoma := 0;
    for I := 1 to 11 do
     Inc(nSoma,StrToInt(cIE[I])*Peso2[I-1]);
    nD := nSoma mod 11;
    if nD = 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IESPRURAL(const IE: String): Boolean; // IE de SP para produtor rural
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 1;
    Peso1[1] := 3;
    Peso1[2] := 4;
    Peso1[3] := 5;
    Peso1[4] := 6;
    Peso1[5] := 7;
    Peso1[6] := 8;
    Peso1[7] := 10;

    cIE := Copy(IE, 2, 8);
    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := nSoma mod 11;
    if nD = 10 then nD := 0;
    cIE := 'P' + cIE + IntToStr(nD) + Copy(IE,11,3);
    result := IE = cIE;
  end;

  function IERS(const IE: String): Boolean; // IE do RS
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..8] of Integer;
  begin
    Peso1[0] := 2;
    Peso1[1] := 9;
    Peso1[2] := 8;
    Peso1[3] := 7;
    Peso1[4] := 6;
    Peso1[5] := 5;
    Peso1[6] := 4;
    Peso1[7] := 3;
    Peso1[8] := 2;

    cIE := Copy(IE, 1, 9);
    if not ((Length(IE)=10) and (StrToInt(Copy(cIE,1,3)) >= 1)
       and (StrToInt(Copy(cIE,1,3)) <= 467)) then
    begin
      result := false;
      exit;
    end;
    nSoma := 0;
    for I := 1 to 9 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;


  function IEAC(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..11] of Integer;
  begin
    Peso1[0] := 5;
    Peso1[1] := 4;
    Peso1[2] := 3;
    Peso1[3] := 2;
    Peso1[4] := 9;
    Peso1[5] := 8;
    Peso1[6] := 7;
    Peso1[7] := 6;
    Peso1[8] := 5;
    Peso1[9] := 4;
    Peso1[10] := 3;
    Peso1[11] := 2;

    cIE := Copy(IE, 1, 11);
    if not ((Copy(cIE,1,2) = '01') and (Length(IE)=13)) then
    begin
      result := false;
      exit;
    end;
    nSoma := 0;
    for I := 1 to 11 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    nSoma := 0;
    for I := 1 to 12 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);

    result := IE = cIE;
  end;

  function IEAL(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not ((Copy(cIE,1,2) = '24') and (Length(IE)=9)) then
    begin
      result := false;
      exit;
    end;
    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nSoma := nSoma * 10;
    nD := nSoma mod 11;
    if nD = 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEAP(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
    P, D: Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not ((Copy(cIE,1,2) = '03') and (Length(IE)=9)) then
    begin
      result := false;
      exit;
    end;
    case StrToInt(Copy(IE,3,6)) of
      1..17000 : begin p := 5; d := 0 end;
      17001..19022 : begin p := 9; d := 1 end;
    else
      p := 0;
      d := 0;
    end;

    nSoma := p;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD = 10 then nD := 0
    else if nD = 11 then nD := D;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEAM(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEBAM10(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 8;
    Peso1[1] := 7;
    Peso1[2] := 6;
    Peso1[3] := 5;
    Peso1[4] := 4;
    Peso1[5] := 3;
    Peso1[6] := 2;

    cIE := Copy(IE, 1, 7);

    nSoma := 0;
    for I := 1 to 7 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);

    nD := 10 - (nSoma mod 10);

    if nD = 10 then
      nD := 0;

    cIE := cIE + IntToStr(nD);

    nSoma := 0;
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);

    nD := 10 - (nSoma mod 10);

    if nD = 10 then
      nD := 0;

    Insert(IntToStr(nD),cIE,8);
    result := IE = cIE;
  end;

  function IEBAM11(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 8;
    Peso1[1] := 7;
    Peso1[2] := 6;
    Peso1[3] := 5;
    Peso1[4] := 4;
    Peso1[5] := 3;
    Peso1[6] := 2;

    cIE := Copy(IE, 1, 7);

    nSoma := 0;
    for I := 1 to 7 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
     
    nD := 11 - (nSoma mod 11);

    if nD >= 10 then
      nD := 0;

    cIE := cIE + IntToStr(nD);

    nSoma    := 0;
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);

    nD := 11 - (nSoma mod 11);

    if nD >= 10 then
      nD := 0;

    Insert(IntToStr(nD),cIE,8);
    result := IE = cIE;
  end;

  function IECE(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEDF(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..11] of Integer;
  begin
    Peso1[0] := 5;
    Peso1[1] := 4;
    Peso1[2] := 3;
    Peso1[3] := 2;
    Peso1[4] := 9;
    Peso1[5] := 8;
    Peso1[6] := 7;
    Peso1[7] := 6;
    Peso1[8] := 5;
    Peso1[9] := 4;
    Peso1[10] := 3;
    Peso1[11] := 2;

    cIE := Copy(IE, 1, 11);
    if not ((Length(IE)=13) and (Copy(cIE,1,2)='07')) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 11 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    nSoma := 0;
    for I := 1 to 12 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEES(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEGO(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not ((Length(cIE)=8) and (pos(Copy(cIE, 1, 2),'10,11,15') > 0)) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);

    nD := nSoma mod 11;

    case nD of
     0: nD := 0;
     1: if ((StrToInt(cIE) >= 10103105)
        and (StrToInt(cIE)  <= 10119997)) then
          nD := 1
        else
          nD := 0;
     2..10: nD := 11 - nD;
    end;

    cIE := cIE + IntToStr(nD);

    result := IE = cIE;
  end;

  function IEMA(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not ((Length(IE)=9) and (Copy(cIE,1,2) = '12')) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEMT(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..9] of Integer;
  begin
    Peso1[0] := 3;
    Peso1[1] := 2;
    Peso1[2] := 9;
    Peso1[3] := 8;
    Peso1[4] := 7;
    Peso1[5] := 6;
    Peso1[6] := 5;
    Peso1[7] := 4;
    Peso1[8] := 3;
    Peso1[9] := 2;

    cIE := Copy(IE, 1, 10);
    if not (Length(IE)=11) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 10 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEMS(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not ((Length(IE)=9) and (Copy(cIE,1,2) = '28')) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEMG(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    cSoma: String;
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..10] of Integer;
    Peso2: array[0..11] of Integer;
  begin
    Peso1[0] := 1;
    Peso1[1] := 2;
    Peso1[2] := 1;
    Peso1[3] := 1;
    Peso1[4] := 2;
    Peso1[5] := 1;
    Peso1[6] := 2;
    Peso1[7] := 1;
    Peso1[8] := 2;
    Peso1[9] := 1;
    Peso1[10] := 2;
    Peso2[0] := 3;
    Peso2[1] := 2;
    Peso2[2] := 11;
    Peso2[3] := 10;
    Peso2[4] := 9;
    Peso2[5] := 8;
    Peso2[6] := 7;
    Peso2[7] := 6;
    Peso2[8] := 5;
    Peso2[9] := 4;
    Peso2[10] := 3;
    Peso2[11] := 2;

    cIE := Copy(IE, 1, 11);
    if not (Length(IE)=13) then
    begin
      result := false;
      exit;
    end;

    cSoma := '';
    for I := 1 to 11 do
     cSoma := cSoma + IntToStr(StrToInt(cIE[I])*Peso1[I-1]);
    nSoma := 0;
    for I := 1 to length(cSoma) do
     Inc(nSoma,StrToInt(cSoma[I]));
    nD := 10 - (nSoma mod 10);
    if nD = 10 then nD := 0;
    cIE := cIE + IntToStr(nD);

    nSoma := 0;
    for I := 1 to 12 do
     Inc(nSoma,StrToInt(cIE[I])*Peso2[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);



    result := IE = cIE;
  end;

  function IEPA(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not ((Length(IE)=9) and (Copy(cIE,1,2) = '15')) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEPB(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEPR(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..8] of Integer;
  begin
    Peso1[0] := 4;
    Peso1[1] := 3;
    Peso1[2] := 2;
    Peso1[3] := 7;
    Peso1[4] := 6;
    Peso1[5] := 5;
    Peso1[6] := 4;
    Peso1[7] := 3;
    Peso1[8] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=10) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    nSoma := 0;
    for I := 1 to 9 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEPE(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 8;
    Peso1[1] := 7;
    Peso1[2] := 6;
    Peso1[3] := 5;
    Peso1[4] := 4;
    Peso1[5] := 3;
    Peso1[6] := 2;

    cIE := Copy(IE, 1, 7);

    nSoma := 0;
    for I := 1 to 7 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);

    nD := 11 - (nSoma mod 11);

    if nD >= 10 then
      nD := 0;

    cIE := cIE + IntToStr(nD);

    nSoma    := 0;
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);

    nD := (nSoma mod 11);

    if (nD = 1) or (nD = 0) then
      nD := 0
    else
      nD := 11 - nD;

    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IEPI(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IERJ(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..6] of Integer;
  begin
    Peso1[0] := 2;
    Peso1[1] := 7;
    Peso1[2] := 6;
    Peso1[3] := 5;
    Peso1[4] := 4;
    Peso1[5] := 3;
    Peso1[6] := 2;

    cIE := Copy(IE, 1, 7);
    if not (Length(IE)=8) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 7 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IERN(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nSoma := nSoma * 10;
    nD := nSoma mod 11;
    if nD = 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IERO(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..12] of Integer;
  begin
    Peso1[0] := 6;
    Peso1[1] := 5;
    Peso1[2] := 4;
    Peso1[3] := 3;
    Peso1[4] := 2;
    Peso1[5] := 9;
    Peso1[6] := 8;
    Peso1[7] := 7;
    Peso1[8] := 6;
    Peso1[9] := 5;
    Peso1[10] := 4;
    Peso1[11] := 3;
    Peso1[12] := 2;

    cIE := Copy(IE, 1, 13);
    if not (Length(IE)=14) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 13 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IERR(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
  begin
    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*I);
    nD := nSoma mod 9;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IESC(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IESE(const IE: String): Boolean;
  var
    nD: Integer;  // Digito Verificador
    cIE: String;  // IE a ser comparado
    nSoma: Integer; // Soma dos pesos
    I: Integer;
    Peso1: array[0..7] of Integer;
  begin
    Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 8);
    if not (Length(IE)=9) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    result := IE = cIE;
  end;

  function IETO(const IE: String): Boolean;
  var
   // nD: Integer;  // Digito Verificador
   // cIE: String;  // IE a ser comparado
   // nSoma: Integer; // Soma dos pesos
   // I: Integer;
   // Peso1: array[0..7] of Integer;
   D1,D2,D5,D6,D7,D8,D9,D10,D11,X1,X2,PriDig : integer;
   novaie : string;
  begin
  { Peso1[0] := 9;
    Peso1[1] := 8;
    Peso1[2] := 7;
    Peso1[3] := 6;
    Peso1[4] := 5;
    Peso1[5] := 4;
    Peso1[6] := 3;
    Peso1[7] := 2;

    cIE := Copy(IE, 1, 10);
    delete(cIE,3,2);
    if not (Length(IE)=11) then
    begin
      result := false;
      exit;
    end;

    nSoma := 0;
    for I := 1 to 8 do
     Inc(nSoma,StrToInt(cIE[I])*Peso1[I-1]);
    nD := 11 - (nSoma mod 11);
    if nD >= 10 then nD := 0;
    cIE := cIE + IntToStr(nD);
    Insert(Copy(IE,3,2),cIE,3);
    result := IE = cIE; }

    if Length(IE) = 9  then
      novaie := Copy(IE,1,2) + '00' + Copy(IE,3,7)
    else
      novaie := IE;

    if  (Length(novaie)=11)
    and (Copy(novaie,1,2)  = '29')
    {and ((Copy(IE,3,2) = '01') or (Copy(IE,3,2) = '02') or (Copy(IE,3,2) = '03') or (Copy(IE,3,2) = '99'))} then
    begin
      D1  := StrToInt(Copy(novaie,1,1));
      D2  := StrToInt(Copy(novaie,2,1));
      //  D3 := StrToInt(Copy(IE,3,1));
      //  D4 := StrToInt(Copy(IE,4,1));
      D5  := StrToInt(Copy(novaie,5,1));
      D6  := StrToInt(Copy(novaie,6,1));
      D7  := StrToInt(Copy(novaie,7,1));
      D8  := StrToInt(Copy(novaie,8,1));
      D9  := StrToInt(Copy(novaie,9,1));
      D10 := StrToInt(Copy(novaie,10,1));
      D11 := StrToInt(Copy(novaie,11,1));
      X1  := (D1*9)+(D2*8)+(D5*7)+(D6*6)+(D7*5)+(D8*4)+(D9*3)+(D10*2);
      X2  := X1 - Trunc(X1 / 11) * 11;

      if X2 <= 1 then
        PriDig := 0
      else
        PriDig := 11 - X2;

      if PriDig = D11 then
        Result := True
      else
        result := false;
    end
    else
      result :=false;
  end;

var
  I: Integer;
  cIE: String;
begin
  result := false;
  if (Pos('ISENT',Trim(UpperCase(IE))) > 0) or (Pos('BRANC',Trim(UpperCase(IE))) > 0) then
  begin
    result := true;
    exit;
  end;
  cIE := '';
  for I := 1 to Length(IE) do
    if (IE[I] in ['0'..'9']) or (UpperCase(IE[I]) = 'P') then
      cIE := cIE + UpperCase(IE[I]);

  if UpperCase(UF) = 'SP' then
  begin
    case Length(cIE) of
      12: result := IESPCOM(cIE); // IE de SP para Comércio e indústria
      13: result := IESPRURAL(cIE); // IE de SP para produtor rural
    else
      result := false;
    end;
  end else if UpperCase(UF) = 'RS' then
    result := IERS(cIE)
  else if UpperCase(UF) = 'AC' then
    result := IEAC(cIE)
  else if UpperCase(UF) = 'AL' then
    result := IEAL(cIE)
  else if UpperCase(UF) = 'AP' then
    result := IEAP(cIE)
  else if UpperCase(UF) = 'AM' then
    result := IEAM(cIE)
  else if UpperCase(UF) = 'BA' then
  begin
  {  if not (Length(cIE)=8) then
      result := false
    else   }
      case StrToInt(Copy(cIE,2,1)) of
        0..5,8 : result := IEBAM10(cIE);
        6,7,9  : result := IEBAM11(cIE);
      end;
  end
  else if UpperCase(UF) = 'CE' then
    result := IECE(cIE)
  else if UpperCase(UF) = 'DF' then
    result := IEDF(cIE)
  else if UpperCase(UF) = 'ES' then
    result := IEES(cIE)
  else if UpperCase(UF) = 'GO' then
    result := IEGO(cIE)
  else if UpperCase(UF) = 'MA' then
    result := IEMA(cIE)
  else if UpperCase(UF) = 'MT' then
    result := IEMT(cIE)
  else if UpperCase(UF) = 'MS' then
    result := IEMS(cIE)
  else if UpperCase(UF) = 'MG' then
    result := IEMG(cIE)
  else if UpperCase(UF) = 'PA' then
    result := IEPA(cIE)
  else if UpperCase(UF) = 'PB' then
    result := IEPB(cIE)
  else if UpperCase(UF) = 'PR' then
    result := IEPR(cIE)
  else if UpperCase(UF) = 'PE' then
    result := IEPE(cIE)
  else if UpperCase(UF) = 'PI' then
    result := IEPI(cIE)
  else if UpperCase(UF) = 'RJ' then
    result := IERJ(cIE)
  else if UpperCase(UF) = 'RN' then
    result := IERN(cIE)
  else if UpperCase(UF) = 'RO' then
    result := IERO(cIE)
  else if UpperCase(UF) = 'RR' then
    result := IERR(cIE)
  else if UpperCase(UF) = 'SC' then
    result := IESC(cIE)
  else if UpperCase(UF) = 'SE' then
    result := IESE(cIE)
  else if UpperCase(UF) = 'TO' then
    result := IETO(cIE);
end;
// FIM - Valida IE (Todos os Estados, inclusive DF)

function MyRound( nNumero : Double; nCasas : Integer ) : Double;
var
  cNumero : String[40];
  cInteiro : String[20];
  cFracao : String[20];
  nPosicao, nPosicaoPonto, nPosicaoVirgula : Integer;
  nDigito : Integer;
  Separador : String;
begin

  cNumero := FloatToStr( nNumero );
{
  if nAt( 'E', cNumero ) > 0 then
  begin
    Mascara := '#0,.' + Replicate( '0', nCasas );
    cNumero := FormatFloat( Mascara, nNumero );
  end;
  }

  nPosicao        := 0;
  nPosicaoPonto   := nAt( '.', cNumero );
  nPosicaoVirgula := nAt( ',', cNumero );
  if nPosicaoPonto   > 0 then
  begin
    nPosicao  := nPosicaoPonto;
    Separador := '.';
  end;
  if nPosicaoVirgula > 0 then
  begin
    nPosicao := nPosicaoVirgula;
    Separador := ',';
  end;
  if nPosicao > 0 then
  begin
    cInteiro := Copy( cNumero, 1, nPosicao - 1 );
    cFracao := Copy( cNumero, nPosicao + 1, Length( cNumero ) );

    if Length(cFracao) <> nCasas then

    if Length(cFracao) < nCasas then
       begin
         cFracao := cFracao + Copy( '000000000000', 1, nCasas - Length( cFracao ) )
       end
    else
       begin
         cFracao := Copy( cFracao, 1, nCasas + 1 );
         nDigito := StrToInt( Copy( cFracao, nCasas + 1, 1 ) );
         if nDigito >= 5 then
           cFracao := StrZero( StrToFloat( Copy( cFracao, 1, nCasas ) ) + 1 , ncasas )
         else
           cFracao := Copy( cFracao, 1, nCasas );
       end;

    if length (cFracao) <> ncasas then
    begin
      cInteiro := FloattoStr( StrtoFloat( cInteiro ) + 1 );
      cFracao  := Copy( cFracao, 2, Length( cFracao ) );
    end;

    cNumero := cInteiro + Separador + cFracao;
    nNumero := StrToFloat( cNumero );

  end;

  Result := nNumero;
end;

function Lookup( Query : DBTables.TQuery; Campo : TStringField; Codigo: String; Nome: String ) : String;
begin
  if Trim( Campo.AsString ) <> '' then
  begin
    Query.Close;
    Query.ParamByName( Codigo ).AsString := Trim( Campo.AsString );
    Query.Prepare;
    if Query is TQuery then
      TQuery(Query).Open
    else
      Query.Open;
    if Query.RecordCount > 0 then
       Lookup := Trim( Query.FieldByName( Nome ).AsString )
    else
       Lookup := '';
    Query.Close;
  end
  else
  begin
    Lookup := '';
  end;
end;

function FastEdit( Tabela: String; Campo : TMaskEdit; Codigo: String; Nome: String ) : String;
var Qry: TQuery;
begin
  if Trim( Campo.Text ) <> '' then
  begin
    Qry := TQuery.Create(nil);
    with Qry do
    begin
      Close;
      DataBaseName := 'DBBroker';
      RequestLive := False;
      Sql.Clear;
      Sql.Add( 'SELECT ' + Nome + ' FROM ' + Tabela + ' WHERE ' + Codigo + ' = ' + QuotedStr( Trim( Campo.Text ) ) );
      Prepare;
      Open;
      if Qry.RecordCount > 0 then
        result := Trim( Qry.FieldByName( Nome ).AsString )
      else
        result := '';
      Close;
      Free;
    end;
  end
  else
  begin
    result := '';
  end;
end;


function FastEdit( Tabela: String; Campo : TcxMaskEdit; Codigo: String; Nome: String ) : String;
var Qry: TQuery;
begin
  if Trim( Campo.Text ) <> '' then
  begin
    Qry := TQuery.Create(nil);
    with Qry do
    begin
      Close;
      DataBaseName := 'DBBroker';
      RequestLive := False;
      Sql.Clear;
      Sql.Add( 'SELECT ' + Nome + ' FROM ' + Tabela + ' WHERE ' + Codigo + ' = ' + QuotedStr( Trim( Campo.Text ) ) );
      Prepare;
      Open;
      if Qry.RecordCount > 0 then
        result := Trim( Qry.FieldByName( Nome ).AsString )
      else
        result := '';
      Close;
      Free;
    end;
  end
  else
  begin
    result := '';
  end;
end;


function FastLookup( Tabela: String; Campo : TStringField; Codigo: String; Nome: String; Filtro: String ) : String;
var Qry: TQuery;
begin
  if Trim( Campo.AsString ) <> '' then
  begin
    Qry := TQuery.Create(nil);
    with Qry do
    begin
      Close;
      DataBaseName := 'DBBroker';
      RequestLive := False;
      Sql.Clear;
      Sql.Add( 'SELECT ' + Nome + ' FROM ' + Tabela + ' WHERE ' + Codigo + ' = ' + QuotedStr( Trim( Campo.AsString ) ) );
      if Trim( Filtro ) <> '' then
        Sql.Add( ' AND ' + Filtro );
      Prepare;
      Open;
      if Qry.RecordCount > 0 then
      begin
        if Copy( Nome, 1, 3 ) = 'VL_' then
          if Not Qry.FieldByName( Nome ).IsNull then
            FastLookup := FloatToStr( Qry.FieldByName( Nome ).AsFloat )
          else
            FastLookup := '0'
        else
          FastLookup := Trim( Qry.FieldByName( Nome ).AsString );
      end
      else
        if Copy( Nome, 1, 3 ) = 'VL_' then
          FastLookup := '0'
        else
          FastLookup := '';
      Close;
      Free;
    end;
  end
  else
  begin
    if Copy( Nome, 1, 3 ) = 'VL_' then
      FastLookup := '0'
    else
      FastLookup := '';
  end;
end;

procedure Cria_SQL( TEXTO : String );
var Qry: TQuery;
begin
  Qry := TQuery.Create(nil);
  with Qry do
  begin
     Close;
     DataBaseName := 'DBBroker';
     RequestLive := False;
     Sql.Clear;
     Sql.Add( ' '+TEXTO+' ');
     Prepare;
     ExecSQL;
     Free;
  end;
end;

procedure ApagaDados( Tabela : String; nr_identificador: Integer );
var
  qry_apaga_dados_ : TQuery;
begin
  qry_apaga_dados_ := TQuery.Create(nil);
  qry_apaga_dados_.DatabaseName := 'DBBROKER';
  qry_apaga_dados_.RequestLive := False;
  qry_apaga_dados_.SQL.Clear;
  qry_apaga_dados_.SQL.Add( 'DELETE ' + Tabela + ' WHERE NR_IDENTIFICADOR = ' + IntToStr( nr_identificador ) );
  qry_apaga_dados_.Prepare;
  qry_apaga_dados_.ExecSQL;
  qry_apaga_dados_.Free;
end;

procedure Filtra( Query : DBTables.TQuery; Chave : String; Campo : String );
begin

  if Chave = '' then
  begin
    Query.SQL[3] := '1 = 0';
    Query.Close;
    Query.Prepare;
    if Query is TQuery then
      TQuery(Query).Open
    else
      Query.Open;
    Query.First;
  end
  else
  begin
    try
      Query.SQL[3] := Campo + ' LIKE "%' + Chave + '%"';
      Query.Close;
      Query.Prepare;
      if Query is TQuery then
        TQuery(Query).Open
      else
        Query.Open;
    except
      BoxMensagem('Chave inválida!', 2);
    end;
  end;

end;

function Commit(DataSet: DBTables.TQuery) : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    DataSet.ApplyUpdates;
    datm_main.db_broker.Commit;

  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Commit := False;
      Exit;
    end;
  end;
  Commit := True;
end;

{$HINTS ON}
function VerImp : String;
var
  imp : String;
  reg : TRegistry;
  indimp : Integer;
  indimp1 : Integer;
begin
  if Printer.Printers.Count <= 0 then
  begin
    BoxMensagem( 'Você não tem nenhuma impressora definida!', 3 );
    VerImp := '';
    Exit;
  end;

  {Le o registro do Windows}
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey( '\Software\DDBROKER', False ) then
    begin
      imp := Reg.ReadString('NM_Imp');
    end
    else
    begin
      imp := '';
    end;

  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  if imp <> '' then
  begin
    indimp := Printer.Printers.IndexOf( imp );
    Printer.PrinterIndex := indimp;
  end;

  if Not frm_main.open_print.Execute then
  begin
    VerImp := '';
    Exit;
  end;

  indimp1 := Printer.PrinterIndex;
  imp     := Printer.Printers[indimp1];
  if Pos( 'on', imp ) > 0 then
    imp := Trim( Copy( imp, 1, Length( imp ) - ( Length( imp ) - Pos( 'on', imp ) + 1 ) ) )
  else if Pos( 'em', imp ) > 0 then
    imp := Trim( Copy( imp, 1, Length( imp ) - ( Length( imp ) - Pos( 'em', imp ) + 1 ) ) );

  VerImp := imp;

  {Grava no registro do Windows}
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey( '\Software\DDBROKER', True ) then
    begin
      if Pos('on', imp) <> 0 then
        imp := Trim( Copy( imp, 1, Length( imp) - ( Length( imp ) - Pos( 'on', imp ) + 1 ) ) )
      else if Pos('em', imp) <> 0 then
        imp := Trim( Copy( imp, 1, Length( imp) - ( Length( imp ) - Pos( 'em', imp ) + 1 ) ) );
      Reg.WriteString( 'NM_Imp', imp );
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
//    inherited;
  end;
end;

function PoeEmEdicao(vTable : DBTables.TQuery) : Boolean;
begin
  try
    if not (vTable.State in [dsEdit, dsInsert]) then
      vTable.Edit;
    Result := True;
  except
    Result := False;
    BoxMensagem('Ocorreu um problema ao colocar a tabela em edição, informe o desenvolvedor.',2);
  end;
end;

procedure CopyFileLpt1(const FileName, DestName: TFileName);
var
  CopyBuffer: Pointer; { buffer for copying }
  BytesCopied: Longint;
  Source, Dest: Integer; { handles }
  Destination: TFileName; { holder for expanded destination name }
const
  ChunkSize: Longint = 8192; { copy in 8K chunks }
begin
  Destination := DestName; { expand the destination path }
  GetMem(CopyBuffer, ChunkSize); { allocate the buffer }
  try
    Source := FileOpen(FileName, fmShareDenyWrite); { open source file }
    if Source < 0 then raise EFOpenError.CreateFmt('O arquivo a ser impresso está vazio.', [FileName]);
    try
      Dest := FileCreate(Destination); { create output file; overwrite existing }
      if Dest < 0 then raise EFCreateError.CreateFmt('Não existe impressora conectada ao computador.', [Destination]);
      try
        repeat
          BytesCopied := FileRead(Source, CopyBuffer^, ChunkSize); { read chunk }
          if BytesCopied > 0 then { if we read anything... }
            FileWrite(Dest, CopyBuffer^, BytesCopied); { ...write chunk }
        until BytesCopied < ChunkSize; { until we run out of chunks }
      finally
        FileClose(Dest); { close the destination file }
      end;
    finally
      FileClose(Source); { close the source file }
    end;
  finally
    FreeMem(CopyBuffer, ChunkSize); { free the buffer }
  end;
end;

function CheckDate(Sender: TField; Text: String): Boolean;
begin
  Result := False;
  if (Text = '  /  /  ') or (Text = '  /  /    ') then
  begin
    Sender.Clear;
    Result := False;
  end else begin
    try
      Sender.AsString := Text;
      Result := True;
    except
      messagedlg('Data Inválida !!!', mtInformation,[mbOk],0 );
      if Screen.Cursor = crHourGlass then begin
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

function ExtractWord(pPosicao : Integer; pTexto,pBusca : String) : string;
var
  i, vIntAux : Integer;
begin
  vIntAux := 0;
  for i := 0 to pPosicao - 1 do
  begin
    Result := Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 );
    vIntAux := vIntAux + Length(Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 )) + 1;
  end;
end;

function ContaOcorrencias(pTexto,pSubString : string) : Integer;
var
  vIntAux, i : Integer;
begin
  vIntAux := 0;
  Result := 0;
  for i := 0 to Length(pTexto) do
  begin
    if Pos(pSubString, Copy(pTexto,vIntAux+1,Length(pTexto))) > 0 then
    begin
      vIntAux := vIntAux + Pos(pSubString,Copy(pTexto,vIntAux+1,Length(pTexto)));
      Result := Result + 1;
    end;
  end;
end;

Procedure DesmontaLancContasPagar(Const DtLanc : TDateTime; Const NrRef : String);
Begin
  With TQuery.Create(Application) Do
  Begin
    DAtaBaseName := 'DBBROKER';
    Close;
    Sql.Clear;
    Sql.Add('update TCTAAPAGAR SET NR_REF = NULL, DT_MONTAGEM = NULL, IN_DISTRIBUICAO = ''0'', DT_PAGAMENTO = NULL, IN_LIBERADO = ''0'', IN_TRANSFERIDO = ''0'', STATUS = ''0''');
    Sql.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_REF =:NR_REF');
    ParamByName('NR_REF').AsString         := NrRef;
    ParamByName('DT_CTAAPAGAR').AsDateTime := DtLanc;
    ExecSql;
    Free;
  End;
End;

function VerificaCAT63 (pMetodo : Integer; pProcesso, pAdicao, pMercadoria : String) : Boolean;

  function ProcessoCAT63(pForca:Boolean) : String;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TADICAO_DE_IMPORTACAO (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND IN_PERMITE_CAT63 = ''1''');
      Open;
      if ( Fields[0].AsInteger > 0 ) or ( pForca ) then
        Result := 'INSERT'
      else
        Result := 'DELETE';
      Close;
      if Result = 'INSERT' then
      begin
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) FROM TPROCESSO_STATUS_ICMS (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + '''');
        Open;
        if Fields[0].AsInteger = 0 then
          Result := 'INSERT'
        else
          Result := '';
        Close;
      end;
      Free;
    end;
  end;

var
  vMercadoriaPermitido, vClientePermitido, vQtdeDiasPermitido, vBeneficioPermitido, vAplicacaoPermitido : Boolean;
  vProcessoCAT63 : string;
  Ano, Mes, Dia : Word;
begin
  Result := False;
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';

    // verifica autorização do cliente
    SQL.Clear;
    SQL.Add('SELECT ISNULL(IN_CAT63,0) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ( SELECT CD_CLIENTE FROM TPROCESSO WHERE NR_PROCESSO = ''' + pProcesso + ''')');
    Open;
    vClientePermitido := ( Fields[0].AsInteger = 1 );
    Close;

    // verifica prazo de dias
    DecodeDate(now, Ano, Mes, Dia);
    SQL.Clear;
    SQL.Add('SELECT QT_DIAS_CAT63 FROM TPARAMETROS (NOLOCK)');
    Open;
    vQtdeDiasPermitido := ( date <= PoeOuTiraDiasUteis(Fields[0].AsInteger,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(Ano,Mes)))) );
 //   if pMetodo = 1 then // na hora da digitação
  ///  begin
    //  vQtdeDiasPermitido := ( now < PoeOuTiraDiasUteis(Fields[0].AsInteger,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(Ano,Mes)))) );
//    end else begin // na hora da transmissão ( mexer ainda - Vitor Zanin )
//    vQtdeDiasPermitido := ( now < PoeOuTiraDiasUteis(Fields[0].AsInteger,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(Ano,Mes)))) );
//    end;
    Close;

    // verifica mercadoria desde item
    SQL.Clear;
    if pMercadoria = '' then
    begin
      SQL.Add('SELECT COUNT(*)');
      SQL.Add('  FROM TDETALHE_MERCADORIA DM (NOLOCK), TMERCADORIA ME (NOLOCK)');
      SQL.Add(' WHERE DM.NR_PROCESSO = ''' + pProcesso + '''');
      SQL.Add('   AND DM.NR_ADICAO = ''' + pAdicao + '''');
      SQL.Add('   AND ME.CD_MERCADORIA = DM.CD_MERCADORIA');
      SQL.Add('   AND ME.IN_CAT63 = ''0''');
    end else begin
      SQL.Add('SELECT COUNT(*)');
      SQL.Add('  FROM TMERCADORIA ME (NOLOCK)');
      SQL.Add(' WHERE ME.CD_MERCADORIA = ''' + pMercadoria + '''');
      SQL.Add('   AND ME.IN_CAT63 = ''0''');
    end;
    Open;
    vMercadoriaPermitido := ( Fields[0].AsInteger = 0 );
    Close;


    if (pMetodo = 1) then  //incluído André 10/10/2008
    begin
      if vClientePermitido and vQtdeDiasPermitido and vMercadoriaPermitido then
        Result := True
      else
        Result := False;
    end
    else
    begin //fim inclusão André
      // verifica outros beneficios
      SQL.Clear;
      SQL.Add('SELECT CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, CD_FUND_LEG_REGIME, CD_APLICACAO_MERC');
      SQL.Add('  FROM TADICAO_DE_IMPORTACAO (NOLOCK) ');
      SQL.Add(' WHERE NR_PROCESSO = ''' + pProcesso + '''');
      SQL.Add('   AND NR_ADICAO = ''' + pAdicao + '''');
      Open;
      vBeneficioPermitido := ( ( Fields[0].AsString = '1' ) and ( Fields[2].AsString <> '16' ) ) or ( ( Fields[0].AsString = '5' ) and ( Fields[1].AsString = '055' ) );
      vAplicacaoPermitido := ( Fields[3].AsString = '1' );
      Close;

  //    if pMetodo = 1 then vBeneficioPermitido := False; comentado André 10/10/2008

      // grava na adicao se a mesma esta aprovada como CAT63
      SQL.Clear;
      if vClientePermitido and vQtdeDiasPermitido and vMercadoriaPermitido and vBeneficioPermitido and vAplicacaoPermitido then
      begin
        if pMetodo = 2 then
        begin
          if Application.MessageBox(PChar('A adição "'+pAdicao+'" do processo "'+pProcesso+'" pode ser registrado como CAT 63. Deseja realmente que ela seja uma adição CAT 63 ?'), 'CAT 63', MB_YESNO + MB_ICONQUESTION) = IDYES then
          begin
            SQL.Add('UPDATE TADICAO_DE_IMPORTACAO SET IN_PERMITE_CAT63 = ''1'', CD_TRIBUTACAO_ICMS = ''5'', CD_FUND_LEGAL_ICMS = ''055''');
            SQL.Add('WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_ADICAO = ''' + pAdicao + '''');
            Result := True;
          end;
        end;
      end
      else
      begin
        if vClientePermitido and vQtdeDiasPermitido and vMercadoriaPermitido and vAplicacaoPermitido then
        begin
          if not vBeneficioPermitido then
          begin
            if pMetodo = 2 then
            begin
              if MessageDlg('Neste processo ( adição "'+pAdicao+'" ), a empresa, o produto e a data da'+#13#10+'transmissão permitem o benefício CAT63, mas o Regime de Tributação do ICMS e/ou II,'+#13#10+'estão impedindo esse benefício.'+#13#10+#13#10+'Gostaria de transformar essa adição em CAT63 ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then // DESCOMENTADO ANDRÉ
              begin
                SQL.Add('UPDATE TADICAO_DE_IMPORTACAO SET IN_PERMITE_CAT63 = ''1'', CD_TRIBUTACAO_ICMS = ''5'', CD_FUND_LEGAL_ICMS = ''055''');
                SQL.Add('WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_ADICAO = ''' + pAdicao + '''');
               Result := True;
              end else begin       // FIM DA PARTE DESCOMENTADA ANDRÉ
                SQL.Add('UPDATE TADICAO_DE_IMPORTACAO SET IN_PERMITE_CAT63 = ''0''');//, CD_TRIBUTACAO_ICMS = ''5'', CD_FUND_LEGAL_ICMS = ''055''');
                SQL.Add('WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_ADICAO = ''' + pAdicao + '''');
                Result := False;
              end;
            end;
  //          if pMetodo = 1 then COMENTADO ANDRÉ 13/10/2008
  //          begin COMENTADO ANDRÉ 13/10/2008
  //            if MessageDlg('Neste item que você está gravando, a empresa, o produto e a data atual'+#13#10+'permitem o benefício CAT63, mas o Regime de Tributação do ICMS e/ou II,'+#13#10+'estão impedindo esse benefício.'+#13#10+#13#10+'Deseja automaticamente permitir o CAT63 para este item/adição ?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
  //              Result := False
  //            else
  //            if Application.MessageBox(PChar('A adição "'+pAdicao+'" do processo "'+pProcesso+'" pode ser registrado como CAT 63. Deseja realmente que ela seja uma adição CAT 63 ?'), 'CAT 63', MB_YESNO + MB_ICONQUESTION) = IDYES then COMENTADO ANDRÉ 13/10/2008
  //              Result := True; COMENTADO ANDRÉ 13/10/2008
  //          end;
          end;
        end
        else
        begin
          SQL.Add('UPDATE TADICAO_DE_IMPORTACAO SET IN_PERMITE_CAT63 = ''0'' WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_ADICAO = ''' + pAdicao + '''');
          Result := False;
        end;
      end;
    end;

    if Trim(SQL.Text) <> '' then
      ExecSQL;

    SQL.Clear;
    vProcessoCAT63 := ProcessoCAT63(Result);
    if vProcessoCAT63 = 'INSERT' then
      SQL.Add('INSERT INTO TPROCESSO_STATUS_ICMS VALUES ('''+pProcesso+''',0,0,0)')
    else if vProcessoCAT63 = 'DELETE' then
      SQL.Add('DELETE FROM TPROCESSO_STATUS_ICMS WHERE NR_PROCESSO = '''+pProcesso+'''');

    if Trim(vProcessoCAT63) <> '' then
      ExecSQL;

    Free;
  end;
end;

function OpenAddressBook(pTop, pLeft : Integer) : string;
begin
  Result := '';
  frmCatalogoEnderecos := TfrmCatalogoEnderecos.Create(Application);
//  frmCatalogoEnderecos.Top := pTop;
//  frmCatalogoEnderecos.Left := pLeft;
  frmCatalogoEnderecos.ShowModal;
  Result := frmCatalogoEnderecos.vMailSelecionado;
  frmCatalogoEnderecos.Free;
end;

function ValidaInsPreEmbarque(NR_PROCESSO: String): String;
begin
  // Verifica o preenchimento dos evento 317 e 337 - Michel - 01/12/2008
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.text :=   '  SELECT PR.NR_PROCESSO, P.IN_INSP_PRE_EMBARQUE,                                                                '+
                  '         ISNULL(CONVERT(VARCHAR, F317.DT_REALIZACAO, 103), "") AS DT_EVENTO_317,                                '+
                  '         ISNULL(CONVERT(VARCHAR, F337.DT_REALIZACAO, 103), "") AS DT_EVENTO_337                                 '+
                  '  FROM         TPROCESSO PR   (nolock)                                                                          '+
                  '    INNER JOIN TFOLLOWUP F317 (nolock)ON F317.NR_PROCESSO   = PR.NR_PROCESSO AND F317.CD_EVENTO         = "317" '+
                  '    INNER JOIN TFOLLOWUP F337 (nolock)ON F337.NR_PROCESSO   = PR.NR_PROCESSO AND F337.CD_EVENTO         = "337" '+
                  '    INNER JOIN TPAIS     P    (nolock)ON PR.CD_PAIS_DESTINO = P.CODIGO       AND P.IN_INSP_PRE_EMBARQUE = "1"   '+
                  '  WHERE PR.NR_PROCESSO = :NR_PROCESSO                                                                           '+
                  '    AND ISNULL(PR.IN_CANCELADO, "0") = "0"                                                                      ';
    ParamByName('NR_PROCESSO').AsString := NR_PROCESSO;
    Open;

    Result := '';
    if RecordCount > 0 then
    begin
      First;
      if FieldByName('DT_EVENTO_317').AsString = '' then
        Result := #13'» Evento 317 não preenchido no Followup.';

      if FieldByName('DT_EVENTO_337').AsString = '' then
        Result := Result + #13'» Evento 337 não preenchido no Followup.';
    end;

    Close;
    Free;
  end;

  if Result <> '' then
    Result := 'Alerta de eventos:'#13 + Result + #13;
end;


{
Finalidade : Enviar emails Simples ( com Assunto e Corpo )
Programador: Carlos
Data       : Jun/2009
}
function EnviaEmail(Assunto, Corpo, Destinatario: String; Anexos: array of String): Boolean;
{var
  IdMsgSend : TIDMessage;
  SMTP      : TIDSmtp;}
begin
  Corpo := StringReplace(Corpo, #13#10, '<br>', [rfReplaceAll]);
  Corpo := StringReplace(Corpo, #13, '<br>', [rfReplaceAll]);
  Corpo := StringReplace(Corpo, #10, '<br>', [rfReplaceAll]);
  Result := EnviaEmailHtml(Assunto, '<HTML>' +
                                    '<body>' +
                                    '<img src=file:///C|/DDBROKER/logopeq.jpg>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                    '<br>' +
                                    '<br>' +
                                    '<table width=100% border=0 cellpadding="2" cellspacing="2">' +
                                    '<tr>' +
                                    '  <td align=left>' +
                                    '    <font size=2><b> '+ Corpo + '</b></font><br>' +
                                    '  </td>' +
                                    '</tr>' +
                                    '</table>' +
                                    '<small><B>' +
                                    '<br>' +
                                    '<br>' +
                                    '<br>' +
                                    '<br>' +
                                    ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -' +
                                    '<br>' +
                                    '<br>' +
                                    ' Este é um email gerado automaticamente pelo MyIndaiá.' +
                                    '<br>' +
                                    ' Dúvidas: myindaia@myindaia.com.br' +
                                    '<br>' +
                                    '<br>' +
                                    ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -' +
                                    '<br>' +
                                    '</B></small>' +
                                    '</BODY>' +
                                    '</HTML>', Destinatario, Anexos);
  {IdMsgSend     := TidMessage.Create(nil);
  SMTP          := TidSmtp.Create(nil);
  with IdMsgSend do begin
     //cabeçalho
     ContentType := 'text/html' ;
     Body.Add('<HTML>');
     Body.Add('<body>');
     Body.Add('<img src=file:///C|/DDBROKER/logopeq.jpg>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
     Body.Add('<br>');
     Body.Add('<br>');
     Body.Add('<table width=100% border=0 cellpadding="2" cellspacing="2">');
     //
     Body.Add('<tr>');
     Body.Add('  <td align=left>');
     Body.Add('    <font size=2><b> '+ Corpo+ '</b></font><br>');
     Body.Add('  </td>');
     Body.Add('</tr>');
     Body.Add('</table>');
     Body.Add('<small><B>');
     Body.Add('<br>');
     Body.Add('<br>');
     Body.Add('<br>');
     Body.Add('<br>');
     Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
     Body.Add('<br>');
     Body.Add('<br>');
     Body.Add(' Este é um email gerado automaticamente pelo MyIndaiá.');
     Body.Add('<br>');
     Body.Add(' Dúvidas: myindaia@myindaia.com.br');
     Body.Add('<br>');
     Body.Add('<br>');
     Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
     Body.Add('<br>');
     Body.Add('</B></small>');
     Body.Add('</BODY>');
     Body.Add('</HTML>');

//     BccList.EMailAddresses    := 'carlos.alberto@myindaia.com.br'; //copia oculta
     Recipients.EMailAddresses := Destinatario;
     From.Text                 := 'ti@myindaia.com.br';
     Subject                   := assunto;

   end;
   SMTP.Host := 'mail.indaialogistica.com.br';
   SMTP.Port := 25;
   SMTP.Connect;
   try
     SMTP.Send(IdMsgSend);
   finally
     SMTP.Disconnect;
   end;
   IdMsgSend.Free;
   SMTP.free;}
end;

function EnviaEmail(Assunto, Corpo, Destinatario: String): Boolean;
begin
  Result := EnviaEmailDe(Assunto, Corpo, Destinatario, '', []);
end;

{procedure EnviaEmailHtml(Assunto, Html, Destinatarios: String);
var
  IdMsgSend : TIDMessage;
  SMTP      : TIDSmtp;
begin
  IdMsgSend     := TidMessage.Create(nil);
  SMTP          := TidSmtp.Create(nil);
  with IdMsgSend do
  begin
     //cabeçalho
     ContentType               := 'text/html' ;
     Body.Text                 := Html;
     Recipients.EMailAddresses := Destinatarios;
     From.Text                 := 'ti@myindaia.com.br';
     Subject                   := Assunto;
   end;
   SMTP.Host := 'mail.indaialogistica.com.br';
   SMTP.Port := 25;
   SMTP.Connect;
   try
     SMTP.Send(IdMsgSend);
   finally
     SMTP.Disconnect;
   end;
   IdMsgSend.Free;
   SMTP.free;
end;}

function EnviaEmailDe(Assunto, Corpo, Destinatario, Remetente: String; Anexos: array of String): Boolean; overload;
begin
  Corpo := StringReplace(Corpo, #13#10, '<br>', [rfReplaceAll]);
  Corpo := StringReplace(Corpo, #13, '<br>', [rfReplaceAll]);
  Corpo := StringReplace(Corpo, #10, '<br>', [rfReplaceAll]);
  Corpo := '<HTML><body>' + Corpo + '</body></html>';
  Result := EnviaEmailHtmlDe(Assunto, Corpo, Destinatario, Remetente, Anexos);
end;

function EnviaEmailDe(Assunto, Corpo, Destinatario, Remetente: String): Boolean; overload;
begin
  Result := EnviaEmailDe(Assunto, Corpo, Destinatario, Remetente, []);
end;

function EnviaEmailHtml(Assunto, Html, Destinatarios: String; Anexos: array of String): Boolean;
begin
  Result := EnviaEmailHtmlDe(Assunto, Html, Destinatarios, '', Anexos);
end;

function EnviaEmailHtml(Assunto, Html, Destinatarios: String): Boolean;
begin
  Result := EnviaEmailHtml(Assunto, Html, Destinatarios, []);
end;

function EnviaEmailHtmlDe(Assunto, Html, Destinatarios, Remetente: String; Anexos: array of String): Boolean; overload;
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  NewText : TIdText;
  Query: TQuery;
  I: Integer;
  strAnexos: String;
  pAssunto, pHtml, pDestinatarios, pRemetente, pAnexos: PWideChar;
begin
  if VersaoTeste then
  begin
    Result := True;
    Exit;
  end;

  strAnexos := '';
  for I := 0 to High(Anexos) do
    strAnexos := strAnexos + Anexos[I] + ';';
  if Remetente = '' then
    Remetente := 'ti@myindaia.com.br';
  pRemetente := PWideChar(WideString(Remetente));
  pDestinatarios := PWideChar(WideString(Destinatarios));
  pAssunto := PWideChar(WideString(Assunto));
  pHtml := PWideChar(WideString(Html));
  pAnexos := PWideChar(WideString(strAnexos));
  Result := MySendMail(pRemetente, pDestinatarios, '', '', pAssunto, pHtml, pAnexos);
  Exit;

  if CompareText(Copy(Trim(Html), 1, 6), '<html>') <> 0 then
  begin
    Html := StringReplace(Html, #13#10, '<br>', [rfReplaceAll]);
    Html := StringReplace(Html, #13, '<br>', [rfReplaceAll]);
    Html := StringReplace(Html, #10, '<br>', [rfReplaceAll]);
    Html := '<html><body>' + Html + '</html></body>';
  end;

  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);
  Query := TQuery.Create(nil);

  try
    Query.Databasename := 'DBBROKER';
    Query.SQL.Add('SELECT *');
    Query.SQL.Add('FROM VW_CONFIG_MAIL');
    Query.Open;
    SMTP.Host     := Query.FieldByName('NM_HOST').AsString;
    SMTP.Port     := Query.FieldByName('NR_PORTA').AsInteger;
    SMTP.Username := Query.FieldByName('NM_LOGIN').AsString;
    SMTP.Password := Query.FieldByName('NM_SENHA').AsString;
    SMTP.AuthenticationType := atLogin;

    Msg.ContentType := 'text/html' ;
    Msg.Body.Text := Html;

    if High(Anexos) >= 0 then
    begin
      NewText := TIdText.Create(Msg.MessageParts);
      NewText.ContentType := 'text/html' ;
      NewText.Body.Text := Html;

      NewText := TIdText.Create(Msg.MessageParts);
      NewText.ContentType := 'text/plain';
    end;

    for I := 0 to High(Anexos) do
      TIdAttachment.Create(Msg.MessageParts, Anexos[I]);

    if Remetente = '' then
      Remetente := SMTP.Username;
    if not AnsiContainsText(Remetente, '@') then
      Remetente := 'ti@myindaia.com.br';
    Msg.From.Text := Remetente;
    Msg.ReplyTo.EMailAddresses := Remetente;
    Msg.Recipients.EMailAddresses := Destinatarios;
    Msg.Subject := Assunto;
    try
      SMTP.Connect;
      SMTP.Send(Msg);
      Result := True;
    except
      Result := False;
    end;
  finally
    if Query.Active then
      Query.Close;
    FreeAndNil(Query);
    FreeAndNil(Msg);
    if SMTP.Connected then
      SMTP.Disconnect;
    FreeAndNil(SMTP);
  end;
end;

function EnviaEmailHtmlDe(Assunto, Html, Destinatarios, Remetente: String): Boolean; overload;
begin
  Result := EnviaEmailHtmlDe(Assunto, Html, Destinatarios, Remetente, []);
end;

function StringsToArray(Strings: TStrings): TStringArray;
var
  I: Integer;
begin
  SetLength(Result, Strings.Count);
  for I := 0 to Strings.Count - 1 do
    Result[I] := Strings[I];
end;

{ função para incremetntar o nome do arquivo digitalizado - by carlos 08/10/2010 }
function GeraArquivoDigital(APrefixo, AExt, ANR_PROCESSO: String): String;
var
 A: Integer;
 DigPath  : String;
begin
 with TQuery.Create(Application) do
 begin
   DatabaseName := 'DBBROKER';
   SQL.Clear;
   SQL.Add(' SELECT PATH_DIGITALIZACAO from TPARAMETROS (nolock)' );
   open;
   DigPath:=TRIM(Fields[0].AsString) + 'TPROCESSO\'+ANR_PROCESSO+'\';
   close;
   //
   ForceDirectories(DigPath);
   //
   SQL.Clear;
   SQL.Add(' SELECT TOP 1 NM_ARQUIVO ' );
   SQL.Add(' FROM TPROCESSO_DOCTOS (NOLOCK) ');
   SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
   SQL.Add('  AND NM_ARQUIVO LIKE :PREFIXO ');
   SQL.Add('  AND ISNUMERIC(SUBSTRING(NM_ARQUIVO, LEN(:PREFIXO)+1, 2)) = 1 ');
   SQL.Add(' ORDER BY NM_ARQUIVO DESC ');
   ParamByName('NR_PROCESSO').AsString := ANR_PROCESSO;
   ParamByName('PREFIXO').AsString     := APrefixo + '%';
   Open;
   if RecordCount = 0 then
     A := 0
   else
     A := StrToInt(Copy(Fields[0].AsString, Length(APrefixo) +1, 2)) + 1;

   Close;
   Free;
 end;
 repeat
   Inc(A);
   Result := APrefixo + FormatFloat('00', A);
 until not FileExists(DigPath + Result + AExt);

 Result := AnsiUpperCase(Result + AExt);
end;


{ by Carlos - 29/06/2011

 Altera o registro do Windows, conforme valores enviados ...
 Path : Caminho do parâmetro a ser alterado ; (Chave)
 Param: Parâmetro a ser alterado ;
 Valor: Valor a ser alterado na chave ; (True, False, ...)

 Tipo : Tipo do valor a ser alterado, sendo :
 "Str" => String ;
 "Int" => Integer ;
 "Bin" => Binário ;
 "Boo" => Boolean ;
 "Cur" => Currency; (moeda)
 "Dat" => Date ;
 "Dti" => DateTime ;
 "Tim" => Time ;
 "Flo" => Float ; (Real)

 Exemplo de uso ...: (Alterando o localshare do BDE para True)
 Altera_Reg_Win( 'SOFTWARE\Borland\Database Engine\Settings\SYSTEM\INIT', 'LOCAL SHARE', 'TRUE', 'STR');

}
Procedure Altera_Reg_Win(Path, Param, Valor, Tipo : String);
var
Reg: TRegistry;
begin
   Reg := TRegistry.Create;
   Tipo:= uppercase(Tipo);

   try
      { Define a chave-raiz do registro }
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      { Abre a chave (path). Se não existir, cria e abre. }
      Reg.OpenKey(Path, true);

      // "Str" => String ;
      If Tipo='STR' then begin
         if reg.ReadString(param)<>Valor then
            Reg.WriteString(Param, Valor);
      end;


      // "Int" => Integer ;
      If Tipo='INT' then begin
         if reg.ReadInteger(param)<>strToInt(Valor) then
            Reg.WriteInteger(Param, StrToInt(Valor) );
      end;


      // "BOO" => Boolean ;
      If Tipo='Boo' then
        If Uppercase(Valor)='TRUE' then
           Reg.WriteBool(Param, True)
        else
           Reg.WriteBool(Param, False);

      // "CUR" => Currency; (moeda)
      If Tipo='Cur' then
         Reg.WriteCurrency(Param, StrToFloat(Valor));

      // "DAT" => Date ;
      If Tipo='Dat' then
         Reg.WriteDate(Param, StrToDate(Valor));

      // "DTI" => DateTime ;
      If Tipo='Dti' then
         Reg.WriteDateTime(Param, StrToDateTime(Valor));

      // "TIM" => Time ;
      If Tipo='Tim' then
         Reg.WriteTime(Param, StrToTime(Valor));

      // "FLO" => Float ; (Real)
      If Tipo='Flo' then
         Reg.WriteFloat(Param, StrToFloat(Valor));

   finally
      Reg.Free;
   end;
end;

function VersaoTeste: Boolean;
begin
  if vTipoLocal = 0 then
  begin
    if RunningUnderDelphi then
    begin
      if MessageDlg('Deseja se conectar pelo Ambiente de Homologação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        vTipoLocal := 2
      else
        vTipoLocal := 1;
    end
    else if SameText(ExtractFileName(Application.ExeName), 'DDBroker_h.exe') then
      vTipoLocal := 2
    else
      vTipoLocal := 1;
  end;
  Result := vTipoLocal = 2;
end;

function GetLocalComputerName : string;
    var c1    : dword;
    arrCh : array [0..MAX_PATH] of char;
begin
  c1 := MAX_PATH;
  GetComputerName(arrCh, c1);
  if c1 > 0 then
    result := arrCh
  else
    result := '';
end;

end.

