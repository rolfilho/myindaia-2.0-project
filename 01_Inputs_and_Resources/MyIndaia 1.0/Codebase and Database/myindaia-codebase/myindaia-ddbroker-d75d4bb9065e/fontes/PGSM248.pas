(*************************************************************************************************

Sistema: DDBroker - Indaiá Logística

PROGRAMA: PGSM248.PAS - frm_int_mesquita

AUTOR:

DATA:  02/12/2002

Manutenção: 12/12/2002
            15/01/2003 - DataRetFabrica contém campos vararquivo[28] -> Data Entr Fabrica

*************************************************************************************************)
unit PGSM248;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Menus, StdCtrls, ComCtrls, Db, FileText;

type
  Tfrm_int_mesquita = class(TForm)
    pnl_file_: TPanel;
    menu_: TMainMenu;
    mi_atualizar_: TMenuItem;
    mi_sair_: TMenuItem;
    pnl_integra: TPanel;
    btn_integrar: TSpeedButton;
    speed_sair_: TSpeedButton;
    edt_nm_file_: TEdit;
    Speed_file_: TSpeedButton;
    open_file_: TOpenDialog;
    Label1: TLabel;
    Panel1: TPanel;
    progress_file_: TProgressBar;
    procedure Speed_file_Click(Sender: TObject);
    procedure btn_integrarClick(Sender: TObject);
    procedure speed_sair_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mi_sair_Click(Sender: TObject);
    procedure edt_nm_file_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_atualizar_Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GravaLinha005;
    procedure GravaLinha009;
    procedure GravaLinha003;
    procedure GravaLinha007;
    procedure GravaLinha008;
    procedure GravaLinha013;
    procedure GravaArquivo;
  private
    { Private declarations }
  public
    { Public declarations }
    tp_leitura : Byte;
  end;

type
texto = array[1..31] of String;

var
  frm_int_mesquita : Tfrm_int_mesquita;
  vararquivo       : texto;
  Arquivo          : TFileText;
  NaoGravados      : TextFile;
  NaoGravPath      : String;
  cItem            : String[3];
  Linha            : String;
  LinhaD           : String;
  nr_itens         : LongInt;
  nr_identificador : Integer;
  ngravados        : Integer;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM249;


procedure Tfrm_int_mesquita.Speed_file_Click(Sender: TObject);
begin
  if open_file_.Execute then edt_nm_file_.Text := open_file_.FileName;
end;

procedure Tfrm_int_mesquita.btn_integrarClick(Sender: TObject);
var
  f, ArqMerc: TextFile;
  Entrada, NovoArquivo, registro: string;
  ind, i, posicao, nlinha: integer;
begin
  if Length( edt_nm_file_.Text ) = 0 then
  begin
    edt_nm_file_.SetFocus;
    BoxMensagem( 'O nome do arquivo texto para atualização deverá ser informado.', 2 );
    edt_nm_file_.SetFocus;
    Exit;
  end
  else
  begin
    if Not FileExists( edt_nm_file_.Text ) then
    begin
      BoxMensagem( 'O arquivo "'+ edt_nm_file_.Text +'" não existe ou não está disponível. Tente novamente.', 2 );
      edt_nm_file_.SetFocus;
      Exit;
    end
    else
    begin
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
    end;
  end;
  if ( ( Copy( edt_nm_file_.Text, ( length( edt_nm_file_.Text) - 9), 10 ) ) <> 'TBE005.TXT' ) then
  begin
    BoxMensagem( 'Arquivo selecionado não é arquivo para a integração Mesquita ( TBE005.TXT ).', 2 );
    edt_nm_file_.SetFocus;
    Exit;
 end;

  { Pega número do identificador }
  with datm_int_mesquita do
  begin
    qry_ultimo_.Close;
    qry_ultimo_.Prepare;
    qry_ultimo_.Open;
    if qry_ultimo_.RecordCount > 0 then
    begin
      nr_identificador := qry_ultimo_.FieldByName('NR_IDENTIFICADOR').AsInteger + 1;
    end
    else
    begin
      nr_identificador := 1;
    end;
  end;

  ngravados := 0;

  try
    { Cria arq. Mesquita.txt onde são gravadas as divergências }
    NaoGravPath := cDir_Rpt + '\MESQUITA.TXT';
    FileMode := 1;
    AssignFile( NaoGravados, NaoGravPath );
    ReWrite( NaoGravados );

    { TBE005 }
    Application.ProcessMessages;
    Arquivo := TFileText.Create;
    Arquivo.Name := edt_nm_file_.Text;

    // Verif nº de linhas
    nlinha := 0;
    Arquivo.Open;
    AssignFile( ArqMerc, edt_nm_file_.Text );
    Reset(ArqMerc);

    while Not EOF(ArqMerc) do
    begin
      ReadLn(ArqMerc, Entrada);
      nlinha := nlinha + 1;
    end;
    CloseFile (ArqMerc);
    Arquivo.Close;

    progress_file_.Max := nlinha;
    progress_file_.Step := 1;

    // Lê arquivo TBE005
    Arquivo.Open;
    AssignFile( ArqMerc, edt_nm_file_.Text );
    Reset(ArqMerc);
    ind := 1;
    //    datm_main.db_broker.StartTransaction;

    while Not EOF(ArqMerc) do
    begin
      ReadLn(ArqMerc, Entrada);
      progress_file_.StepIt;
      i := 1;
      registro := Entrada;
      while Pos( ';', registro ) > 0 do
      begin
        posicao := Pos( ';', registro );
        vararquivo[ind] :=  copy( registro, ( i + 1 ), ( posicao - 3 ) );
        ind := ind + 1;
        registro := copy( registro, ( posicao + 1 ), ( length(registro) - posicao ) );
      end;
      vararquivo[ind] := Copy( registro, 2, ( length( registro ) - 2) );

      GravaLinha005;
      for i := ind downto 1 do
        vararquivo[i] := '';

      ind := 1;
      Application.ProcessMessages;
    end;
    CloseFile (ArqMerc);
    Arquivo.Close;
    Arquivo.Free;
    progress_file_.Position := 0;
    Application.ProcessMessages;

    { TBE009 }
    Application.ProcessMessages;
    Arquivo := TFileText.Create;
    NovoArquivo := Copy( edt_nm_file_.Text, 1, ( length( edt_nm_file_.Text ) - 10 ) ) + 'TBE009.TXT';
    edt_nm_file_.Text := NovoArquivo;
    if FileExists( NovoArquivo ) then
    begin
      Arquivo.Name := NovoArquivo;

      // Verif nº de linhas
      nlinha := 0;
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);

      while Not EOF(ArqMerc) do
      begin
        ReadLn(ArqMerc, Entrada);
        nlinha := nlinha + 1;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;

      progress_file_.Max := nlinha;
      progress_file_.Step := 1;

      // Lê arquivo TBE009
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);
      ind := 1;

      while Not EOF(ArqMerc) do
      begin
        ReadLn( ArqMerc, Entrada );
        progress_file_.StepIt;
        i := 1;
        registro := Entrada;
        while Pos( ';', registro ) > 0 do
        begin
          posicao := Pos( ';', registro );
          vararquivo[ind] :=  copy( registro, ( i + 1 ), ( posicao - 3 ) );
          ind := ind + 1;
          registro := copy( registro, ( posicao + 1 ), ( length(registro) - posicao ) );
        end;
        vararquivo[ind] := Copy( registro, 2, ( length( registro ) - 2) );
        GravaLinha009;
        for i := ind downto 1 do
          vararquivo[i] := '';

        ind := 1;
        Application.ProcessMessages;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;
      Arquivo.Free;
      progress_file_.Position := 0;
      Application.ProcessMessages;
    end;

    { TBE003 }
    Application.ProcessMessages;
    Arquivo := TFileText.Create;
    NovoArquivo := Copy( edt_nm_file_.Text, 1, ( length( edt_nm_file_.Text ) - 10 ) ) + 'TBE003.TXT';
    edt_nm_file_.Text := NovoArquivo;
    if FileExists( NovoArquivo ) then
    begin
      Arquivo.Name := NovoArquivo;

      // Verif nº de linhas
      nlinha := 0;
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);

      while Not EOF(ArqMerc) do
      begin
        ReadLn(ArqMerc, Entrada);
        nlinha := nlinha + 1;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;

      progress_file_.Max := nlinha;
      progress_file_.Step := 1;

      // Lê arquivo TBE003
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);
      ind := 1;

      while Not EOF(ArqMerc) do
      begin
        ReadLn( ArqMerc, Entrada );
        progress_file_.StepIt;
        i := 1;
        registro := Entrada;
        while Pos( ';', registro ) > 0 do
        begin
          posicao := Pos( ';', registro );
          vararquivo[ind] :=  copy( registro, ( i + 1 ), ( posicao - 3 ) );
          ind := ind + 1;
          registro := copy( registro, ( posicao + 1 ), ( length(registro) - posicao ) );
        end;
        vararquivo[ind] := Copy( registro, 2, ( length( registro ) - 2) );
        GravaLinha003;
        for i := ind downto 1 do
          vararquivo[i] := '';
        ind := 1;
        Application.ProcessMessages;
      end;

      CloseFile (ArqMerc);
      Arquivo.Close;
      Arquivo.Free;
      progress_file_.Position := 0;
      Application.ProcessMessages;
    end;

    {TBE007}
    Application.ProcessMessages;
    Arquivo := TFileText.Create;
    NovoArquivo := Copy( edt_nm_file_.Text, 1, ( length( edt_nm_file_.Text ) - 10 ) ) + 'TBE007.TXT';
    edt_nm_file_.Text := NovoArquivo;
    if FileExists( NovoArquivo ) then
    begin
      Arquivo.Name := NovoArquivo;

      // Verif nº de linhas
      nlinha := 0;
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);

      while Not EOF(ArqMerc) do
      begin
        ReadLn(ArqMerc, Entrada);
        nlinha := nlinha + 1;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;

      progress_file_.Max := nlinha;
      progress_file_.Step := 1;

      // Lê arquivo TBE007
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);
      ind := 1;

      while Not EOF(ArqMerc) do
      begin
        ReadLn( ArqMerc, Entrada );
        progress_file_.StepIt;
        i := 1;
        registro := Entrada;
        while Pos( ';', registro ) > 0 do
        begin
          posicao := Pos( ';', registro );
          vararquivo[ind] :=  copy( registro, ( i + 1 ), ( posicao - 3 ) );
          ind := ind + 1;
          registro := copy( registro, ( posicao + 1 ), ( length(registro) - posicao ) );
        end;
        vararquivo[ind] := Copy( registro, 2, ( length( registro ) - 2) );
        GravaLinha007;
        for i := ind downto 1 do
          vararquivo[i] := '';

        ind := 1;
        Application.ProcessMessages;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;
      Arquivo.Free;
      progress_file_.Position := 0;
      Application.ProcessMessages;
    end;

    {TBE008}
    Application.ProcessMessages;
    Arquivo := TFileText.Create;
    NovoArquivo := Copy( edt_nm_file_.Text, 1, ( length( edt_nm_file_.Text ) - 10 ) ) + 'TBE008.TXT';
    edt_nm_file_.Text := NovoArquivo;
    if FileExists( NovoArquivo ) then
    begin
      Arquivo.Name := NovoArquivo;

      // Verif nº de linhas
      nlinha := 0;
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);

      while Not EOF(ArqMerc) do
      begin
        ReadLn(ArqMerc, Entrada);
        nlinha := nlinha + 1;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;

      progress_file_.Max := nlinha;
      progress_file_.Step := 1;

      // Lê arquivo TBE008
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);
      ind := 1;

      while Not EOF(ArqMerc) do
      begin
        ReadLn( ArqMerc, Entrada );
        progress_file_.StepIt;
        i := 1;
        registro := Entrada;
        while Pos( ';', registro ) > 0 do
        begin
          posicao := Pos( ';', registro );
          vararquivo[ind] :=  copy( registro, ( i + 1 ), ( posicao - 3 ) );
          ind := ind + 1;
          registro := copy( registro, ( posicao + 1 ), ( length(registro) - posicao ) );
        end;
        vararquivo[ind] := Copy( registro, 2, ( length( registro ) - 2) );
        GravaLinha008;
        for i := ind downto 1 do
          vararquivo[i] := '';

        ind := 1;
        Application.ProcessMessages;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;
      Arquivo.Free;
      progress_file_.Position := 0;
      Application.ProcessMessages;
    end;

     {TBE013}
    Application.ProcessMessages;
    Arquivo := TFileText.Create;
    NovoArquivo := Copy( edt_nm_file_.Text, 1, ( length( edt_nm_file_.Text ) - 10 ) ) + 'TBE013.TXT';
    edt_nm_file_.Text := NovoArquivo;
    if FileExists( NovoArquivo ) then
    begin
      Arquivo.Name := NovoArquivo;

      // Verif nº de linhas
      nlinha := 0;
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);

      while Not EOF(ArqMerc) do
      begin
        ReadLn(ArqMerc, Entrada);
        nlinha := nlinha + 1;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;

      progress_file_.Max := nlinha;
      progress_file_.Step := 1;

      // Lê arquivo TBE013
      Arquivo.Open;
      AssignFile( ArqMerc, NovoArquivo );
      Reset(ArqMerc);
      ind := 1;

      while Not EOF(ArqMerc) do
      begin
        ReadLn( ArqMerc, Entrada );
        progress_file_.StepIt;
        i := 1;
        registro := Entrada;
        while Pos( ';', registro ) > 0 do
        begin
          posicao := Pos( ';', registro );
          vararquivo[ind] :=  copy( registro, ( i + 1 ), ( posicao - 3 ) );
          ind := ind + 1;
          registro := copy( registro, ( posicao + 1 ), ( length(registro) - posicao ) );
        end;
        vararquivo[ind] := Copy( registro, 2, ( length( registro ) - 2) );
        GravaLinha013;
        for i := ind downto 1 do
          vararquivo[i] := '';

        ind := 1;
        Application.ProcessMessages;
      end;
      CloseFile (ArqMerc);
      Arquivo.Close;
      Arquivo.Free;
      progress_file_.Position := 0;
      Application.ProcessMessages;
    end;

    edt_nm_file_.Text := ' ';
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    with datm_int_mesquita do
    begin
      sp_integracao_mesquita.ParamByName('@nr_identificador').AsInteger    := nr_identificador;
      ExecStoredProc( sp_integracao_mesquita );
      ngravados := sp_integracao_mesquita.ParamByName('@ident').AsInteger;
      CloseStoredProc( sp_integracao_mesquita );
    end;

    Screen.Cursor := crDefault;
    Application.ProcessMessages;

    //    datm_main.db_broker.Commit;

    // Limpa as tabelas auxiliares
      ApagaDados( 'TINT_MESQUITA005', nr_identificador );
      ApagaDados( 'TINT_MESQUITA007', nr_identificador );
      ApagaDados( 'TINT_MESQUITA009', nr_identificador );

    if ngravados = 0 then
    begin
      CloseFile( NaoGravados );
      BoxMensagem( 'Integração realizada com sucesso!', 3 );
    end
    else
    begin
      GravaArquivo;
      CloseFile( NaoGravados );
      BoxMensagem( 'Integração terminada. Arquivo de divergência gerado ' + cDir_Rpt + '\MESQUITA.TXT .', 3 );
    end;
  except
    on E: Exception do
    begin
      BoxMensagem( 'Erro na leitura de arquivos!', 2);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  edt_nm_file_.text := '';
end;

procedure Tfrm_int_mesquita.speed_sair_Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_int_mesquita.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_int_mesquita, datm_int_mesquita );
end;

procedure Tfrm_int_mesquita.mi_sair_Click(Sender: TObject);
begin
  speed_sair_Click(nil);
end;

procedure Tfrm_int_mesquita.edt_nm_file_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
     if Sender = edt_nm_file_ then Speed_file_Click(Nil);
end;

procedure Tfrm_int_mesquita.mi_atualizar_Click(Sender: TObject);
begin
  btn_integrarClick(Nil);
end;

procedure Tfrm_int_mesquita.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;


procedure Tfrm_int_mesquita.GravaLinha005;
var
  nr_cnpj, DataPresenca: String;
begin
  if length( Trim( vararquivo[13] ) ) <> 0 then
  begin
  nr_cnpj := Copy( vararquivo[23], 1, 2 ) + Copy( vararquivo[23], 4, 3 ) +
             Copy( vararquivo[23], 8, 3 ) + Copy( vararquivo[23], 12, 4 ) +
             Copy( vararquivo[23], 17, 2 );

  with datm_int_mesquita.qry_atz_mesquita005_ do
  begin
    DataPresenca := 'Null';
    if length( Trim( vararquivo[24] ) ) = 10 then
      DataPresenca := 'CONVERT( datetime, "' + vararquivo[24] + '", 103 )';

    SQL.Clear;
    if length( Trim( vararquivo[24] ) ) = 10 then
    SQL.Add( 'INSERT INTO TINT_MESQUITA005' +
             ' VALUES( ' + IntToStr( nr_identificador ) + ',"' + vararquivo[1] + '",' +
                       '"' + vararquivo[2] + '","' + vararquivo[3] + '","' + vararquivo[4] + '",' +
                       '"' + vararquivo[5] + '","' + vararquivo[6] + '","' + nr_cnpj + '",' +
                       '"' + vararquivo[13] + '",' + DataPresenca + ' )' );
    Prepare;
    ExecSQL;

  end;
  end;
end;

{CARGA SOLTA}
procedure Tfrm_int_mesquita.GravaLinha007;
var
  Qtde_Mercadoria, Saldo, Peso, ch_pres : String;
begin

with datm_int_mesquita do
  begin
    qry_int_mesquita005c_.Close;
    qry_int_mesquita005c_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_int_mesquita005c_.ParamByName('NM_CNPJ').AsString           := vararquivo[1];
    qry_int_mesquita005c_.ParamByName('NM_NAVIO').AsString          := vararquivo[2];
    qry_int_mesquita005c_.ParamByName('NR_VIAGEM').AsString         := vararquivo[3];
    qry_int_mesquita005c_.ParamByName('NR_BL').AsString             := vararquivo[4];
    qry_int_mesquita005c_.ParamByName('NM_PORTO').AsString          := vararquivo[5];
    qry_int_mesquita005c_.ParamByName('NM_ARMADOR').AsString        := vararquivo[6];
    qry_int_mesquita005c_.Prepare;
    qry_int_mesquita005c_.Open;

    if qry_int_mesquita005c_.RecordCount <> 0 then
    begin
      ch_pres := qry_int_mesquita005c_CH_PRESENCA.AsString;

      // Se a embalagem for diferente de conteiner, é carga solta
     if ( Copy( vararquivo[10], 1, 9) <> 'CONTEINER') then
      begin
        Qtde_Mercadoria := 'CAST (REPLACE("' + vararquivo[11] + '", ".", "") AS FLOAT)';
        Saldo           := 'CAST (REPLACE("' + vararquivo[12] + '", ".", "") AS FLOAT)';
        Peso            := 'CAST (REPLACE("' + vararquivo[13] + '", ".", "") AS FLOAT)';

        qry_atz_mesquita009_.SQL.Clear;
        qry_atz_mesquita009_.SQL.Add( 'INSERT INTO TINT_MESQUITA007 ' +
                                      ' VALUES( ' + IntToStr( nr_identificador ) + ',"' + vararquivo[1] + '",' +
                                      '"' + vararquivo[2] + '","' + vararquivo[3] + '","' + vararquivo[4] + '",' +
                                      '"' + vararquivo[5] + '","' + vararquivo[6] + '","' + vararquivo[7] + '",'  +
                                      '"' + ch_pres + '", "' + vararquivo[10] + '",' + Qtde_Mercadoria +
                                      ',' + Saldo + ',' + Peso + ', Null )' );
        qry_atz_mesquita009_.Prepare;
        qry_atz_mesquita009_.ExecSQL;
      end;
    end;
    qry_int_mesquita005c_.Close;
  end;
end;

{CARGA SOLTA - ATUALIZA AVARIA}
procedure Tfrm_int_mesquita.GravaLinha008;
begin
  { Grava Avaria na tabela TINT_MESQUITA007 }
  with datm_int_mesquita.qry_atz_mesquita009_ do
  begin
    if length( Trim( vararquivo[8] ) ) > 0 then
    begin
      SQL.Clear;
      SQL.Add( 'UPDATE TINT_MESQUITA007' +
               ' SET OBS_AVARIA = "' + vararquivo[8] + '"' +
               ' WHERE NR_IDENTIFICADOR = ' + IntToStr( nr_identificador ) +
               ' AND NM_CNPJ = "' + vararquivo[1] + '"' +
               ' AND NM_NAVIO = "' + vararquivo[2] + '"' +
               ' AND NR_VIAGEM = "' + vararquivo[3] + '"' +
               ' AND NR_BL = "' + vararquivo[4] + '"' +
               ' AND NM_PORTO = "' + vararquivo[5] + '"' +
               ' AND NM_ARMADOR = "'+ vararquivo[6] + '"' +
               ' AND NR_SEQUENCIA = "'+ vararquivo[7] + '"');
      Prepare;
      ExecSQL;
    end;
  end;
end;

procedure Tfrm_int_mesquita.GravaLinha009;
var
  Tp_CNTR, nr_cnpj, ch_pres, nr_cntr : String;
  DataDesova, DataCarregamento, DataEntrPatio, DataEntFabrica, DataRetFabrica, DataDevCNTR : String;

begin
  { Grava dados na tab TINT_MESQUITA009 - Se houver divergência grava no Mesquita.txt }
  Tp_CNTR := '';
  with datm_int_mesquita do
  begin
    qry_int_mesquita005c_.Close;
    qry_int_mesquita005c_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_int_mesquita005c_.ParamByName('NM_CNPJ').AsString           := vararquivo[1];
    qry_int_mesquita005c_.ParamByName('NM_NAVIO').AsString          := vararquivo[2];
    qry_int_mesquita005c_.ParamByName('NR_VIAGEM').AsString         := vararquivo[3];
    qry_int_mesquita005c_.ParamByName('NR_BL').AsString             := vararquivo[4];
    qry_int_mesquita005c_.ParamByName('NM_PORTO').AsString          := vararquivo[5];
    qry_int_mesquita005c_.ParamByName('NM_ARMADOR').AsString        := vararquivo[6];
    qry_int_mesquita005c_.Prepare;
    qry_int_mesquita005c_.Open;

    if qry_int_mesquita005c_.RecordCount <> 0 then
    begin
      nr_cnpj := qry_int_mesquita005c_NR_CNPJ.AsString;
      ch_pres := qry_int_mesquita005c_CH_PRESENCA.AsString;
      nr_cntr := Copy( vararquivo[7], 1, 10 ) + Copy( vararquivo[7], 12, 1 );
      DataDesova := 'NULL';

      if length( Trim( vararquivo[17] ) ) =  10 then
        DataDesova := 'CONVERT( datetime, "' + vararquivo[17] + '", 103 )';
        DataCarregamento := 'NULL';
      if length( Trim( vararquivo[26] ) ) =  10 then
        DataCarregamento := 'CONVERT( datetime, "' + vararquivo[26] + '", 103 )';
//      DataRetFabrica := 'Null';
      if length( Trim( vararquivo[28] ) ) =  10 then
        DataRetFabrica := 'CONVERT( datetime, "' + vararquivo[28] + '", 103 )' else
        DataRetFabrica := 'NULL';
      if length( Trim( vararquivo[29] ) ) =  10 then
        DataEntFabrica := 'CONVERT( datetime, "' + vararquivo[29] + '", 103 )' else
        DataEntFabrica := 'NULL';
//      DataDevCNTR := 'Null';
      if length ( Trim( vararquivo[30] ) ) = 10 then
        DataEntrPatio := 'CONVERT (datetime, "' + vararquivo[30] + '", 103 )' else
        DataEntrPatio:= 'NULL';
      if length( Trim( vararquivo[31] ) ) =  10 then
        DataDevCNTR := 'CONVERT( datetime, "' + vararquivo[31] + '", 103 )' else
        DataDevCNTR:= 'NULL';
//      DataAtracacao := Null;

      { Define tipo de CNTR }
      Tp_CNTR := 'CNTR ' + Trim( vararquivo[19] ) + '"';
      if ( Trim( vararquivo[21] ) = 'TK' ) or ( Trim( vararquivo[21] ) = 'TANK' ) then
        Tp_CNTR := 'TANK ' + Trim( vararquivo[19] ) + '"';

      qry_tp_cntr_.Close;
      qry_tp_cntr_.ParamByName('NM_TP_CNTR').AsString := Tp_CNTR;
      qry_tp_cntr_.Prepare;
      qry_tp_cntr_.Open;

      Tp_CNTR := '00';
      if not qry_tp_cntr_.EOF then
        Tp_CNTR := qry_tp_cntr_TP_CNTR.AsString;

      qry_atz_tmesquita009_.SQL.Clear;

      qry_atz_tmesquita009_.SQL.Add( 'INSERT INTO TINT_MESQUITA009 ' +
               ' VALUES( ' + IntToStr( nr_identificador ) + ',"' + vararquivo[1] + '",' +
                         '"' + vararquivo[2] + '","' + vararquivo[3] + '","' + vararquivo[4] + '",' +
                         '"' + vararquivo[5] + '","' + vararquivo[6] + '","' + nr_cnpj + '",' +
                         '"' + ch_pres + '","' + nr_cntr + '","' +  Tp_CNTR + '",' + DataDesova +
                         ',' + DataCarregamento + ',' + DataRetFabrica + ',' + DataDevCNTR +
                         ', NULL, NULL, ' + DataEntFabrica + ',' + DataEntrPatio + ', NULL)' );

      qry_atz_tmesquita009_.Prepare;
      qry_atz_tmesquita009_.ExecSQL;
      
    end
    else
    begin
     ngravados := 1;
     LinhaD := 'DIV;1;Registro ( do arq.TBE009.TXT ) não gravado - não há correspondente no TBE005.TXT;Cliente:;'+
                vararquivo[1] + ';Navio:;' + vararquivo[2] + ';Viagem:;' + vararquivo[3] + ';BL:;' +
                vararquivo[4] + ';Porto:;' + vararquivo[5] + ';Armador:;' + vararquivo[6] + #13#10;
     Write( NaoGravados, LinhaD );
    end;
    qry_int_mesquita005c_.Close;
  end;
end;


procedure Tfrm_int_mesquita.GravaLinha003;
begin
  { Grava Data_Atracação na tab TINT_MESQUITA009 }
  with datm_int_mesquita.qry_atz_mesquita009_ do
  begin
    if length( Trim( vararquivo[4] ) ) > 9 then
    begin
      SQL.Clear;
      SQL.Add( 'UPDATE TINT_MESQUITA009' +
               ' SET DT_ATRACACAO = CONVERT( datetime, "' + vararquivo[4] + '", 103 )' +
               ' WHERE NR_IDENTIFICADOR = ' + IntToStr( nr_identificador ) +
               ' AND NM_CNPJ = "' + vararquivo[1] + '"' +
               ' AND NM_NAVIO = "' + vararquivo[2] + '"' +
               ' AND NR_VIAGEM = "' + vararquivo[3] + '"' );
      Prepare;
      ExecSQL;
    end;
  end;
end;

procedure Tfrm_int_mesquita.GravaLinha013;
var ComplAvaria, ObsAvaria, ObsAvaria2, ObsTotal, nr_cntr: String;
begin
  { Grava Avaria na tabela TINT_MESQUITA009 }
  ObsTotal := '"' +  vararquivo[8];

  with datm_int_mesquita.qry_atz_mesquita009_ do
  begin
    nr_cntr := '"' + Copy( vararquivo[7], 1, 10 ) + Copy( vararquivo[7], 12, 1 ) + '"';

    if length( Trim(vararquivo[9]) ) > 0 then
    begin
      ComplAvaria := ' - ' + vararquivo[9];
      ObsTotal := ObsTotal + ComplAvaria;
    end
    else
    begin
      ObsTotal := ObsTotal ;
    end;

    if length ( Trim(vararquivo[10]) ) > 0 then
    begin
      ObsAvaria := ' - ' + vararquivo[10] ;
      ObsTotal := ObsTotal + ObsAvaria;
    end
    else
    begin
      ObsTotal :=ObsTotal;
    end;

    if length ( Trim(vararquivo[11]) ) > 0 then
    begin
      ObsAvaria2 := ' - ' + vararquivo[11];
      ObsTotal := ObsTotal + ObsAvaria2;
    end
    else
    begin
      ObsTotal := ObsTotal;
    end;

    SQL.Clear;
    SQL.Add( 'UPDATE TINT_MESQUITA009' +
             ' SET TX_OBS_AVARIA = ' + ObsTotal + '"' +
             ' WHERE NR_IDENTIFICADOR = ' + IntToStr( nr_identificador ) +
             ' AND NM_CNPJ = "' + vararquivo[1] + '"' +
             ' AND NM_NAVIO = "' + vararquivo[2] + '"' +
             ' AND NR_VIAGEM = "' + vararquivo[3] + '"' +
             ' AND NR_BL = "' + vararquivo[4] + '"' +
             ' AND NM_PORTO = "' + vararquivo[5] + '"' +
             ' AND NM_ARMADOR = "'+ vararquivo[6] + '"' +
             ' AND NR_CNTR = '+ nr_cntr );
    Prepare;
    ExecSQL;

  end;
end;

procedure Tfrm_int_mesquita.GravaArquivo;
begin
  // Grava divergências no arq. Mesquita.txt
  with datm_int_mesquita do
  begin
    qry_arq_integracao_.Close;
    qry_arq_integracao_.ParamByName('NR_IDENTIFICADOR').AsInteger := ngravados;
    qry_arq_integracao_.Prepare;
    qry_arq_integracao_.Open;

    While not qry_arq_integracao_.EOF do
    begin
      linhad := qry_arq_integracao_TX_MOTIVO.AsString +  #13#10;
      write( naogravados, linhad );
      qry_arq_integracao_.Next;
    end;
    nr_identificador := ngravados;
    ApagaDados( 'TDIVERGENCIA', nr_identificador );
  end;
end;

end.

