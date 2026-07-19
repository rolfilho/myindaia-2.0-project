unit uPreparaArquivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Funcoes, StdCtrls, Buttons, ExtCtrls, StrUtils, DateUtils;

const
  _INVALIDOS        = '\/:*?"<>|'#9#10#13; // Substituir também as quebras de linha e tabulações
  _INDAIAMETA       = 'INDAIA-META';
  _PATH_ENVIO_EMAIL = 'C:\Envia_e-mail\';

type
  TProcEnviaEmail = procedure (const Anexo: string) of object;

  TfrmMyDigPreparaArquivos = class(TForm)
    Label1: TLabel;
    rdgTipos: TRadioGroup;
    btnGerar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlGerando: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    function CopyFile(lpExistingFileName, lpNewFileName: PChar; bFailIfExists: BOOL): BOOL;
  public
    function GeraArquivosLinks(ATabela: Int64; APathDestino, AProcesso: String; AArquivos: TStringArray;
       var AArquivosGerados: TStringArray; var ALinks: TLinkArray; out NomeArquivoMerge: string): Boolean;

    function GeraArquivos(ATabela: Int64; APathDestino, AProcesso: String; AArquivos: TStringArray;
       var AArquivosGerados: TStringArray; out NomeArquivoMerge: string; MergeFiles: Boolean = False; ProcEnviaEmail: TProcEnviaEmail = nil): Boolean;

    function GeraLinks(ATabela: Int64; AProcesso: String; AArquivos: TStringArray;
       var ALinks: TLinkArray): Boolean;

    function PegarSeniorKey(NomeArquivo: string): string;
  end;

  function GeraArquivosLinks(ATabela: Int64; APathDestino, AProcesso: String; AArquivos: TStringArray;
     var AArquivosGerados: TStringArray; var ALinks: TLinkArray; out NomeArquivoMerge: string): Boolean;

  function GeraArquivos(ATabela: Int64; APathDestino, AProcesso: String; AArquivos: TStringArray;
     var AArquivosGerados: TStringArray; out NomeArquivoMerge: string; MergeFiles: Boolean = False; ProcEnviaEmail: TProcEnviaEmail = nil): Boolean;

  function GeraLinks(ATabela: Int64; AProcesso: String; AArquivos: TStringArray;
     var ALinks: TLinkArray): Boolean;

  //function PegarSeniorKey(NomeArquivo :String) :string;
var
  frmMyDigPreparaArquivos: TfrmMyDigPreparaArquivos;

implementation

uses
  uConsultaOnline, dConsultaOnline, dPreparaArquivos, KrQuery,
  uDigitalizacao, KrFatura;

{$R *.dfm}

function GeraArquivosLinks(ATabela: Int64; APathDestino, AProcesso: String; AArquivos: TStringArray;
  var AArquivosGerados: TStringArray; var ALinks: TLinkArray; out NomeArquivoMerge: string): Boolean;
begin
  APathDestino := Trim(APathDestino);
  if APathDestino = '' then
    APathDestino := _PATH_ENVIO_EMAIL;
  if Copy(APathDestino, Length(APathDestino), 1) <> '\' then
    APathDestino := APathDestino + '\';

  if not DirectoryExists(APathDestino) then
    ForceDirectories(APathDestino);
  if not Assigned(frmMyDigPreparaArquivos) then
    Application.CreateForm(TfrmMyDigPreparaArquivos, frmMyDigPreparaArquivos);
  if not Assigned(dtmMyDigPreparaArquivos) then
    Application.CreateForm(TdtmMyDigPreparaArquivos, dtmMyDigPreparaArquivos);
  try
    Result := frmMyDigPreparaArquivos.GeraArquivosLinks(ATabela, APathDestino, AProcesso, AArquivos, AArquivosGerados, ALinks, NomeArquivoMerge);
  finally
    FreeAndNil(frmMyDigPreparaArquivos);
    FreeAndNil(dtmMyDigPreparaArquivos);
  end;
end;

function GeraArquivos(ATabela: Int64; APathDestino, AProcesso: String; AArquivos: TStringArray;
   var AArquivosGerados: TStringArray; out NomeArquivoMerge: string; MergeFiles: Boolean; ProcEnviaEmail: TProcEnviaEmail): Boolean;
begin
  APathDestino := Trim(APathDestino);
  if APathDestino = '' then
    APathDestino := _PATH_ENVIO_EMAIL;

  if Copy(APathDestino, Length(APathDestino), 1) <> '\' then
    APathDestino := APathDestino + '\';

  if not DirectoryExists(APathDestino) then
    ForceDirectories(APathDestino);

  if not Assigned(frmMyDigPreparaArquivos) then
    Application.CreateForm(TfrmMyDigPreparaArquivos, frmMyDigPreparaArquivos);

  if not Assigned(dtmMyDigPreparaArquivos) then
    Application.CreateForm(TdtmMyDigPreparaArquivos, dtmMyDigPreparaArquivos);

  try
    Result := frmMyDigPreparaArquivos.GeraArquivos(ATabela,
                                                   APathDestino,
                                                   AProcesso,
                                                   AArquivos,
                                                   AArquivosGerados,
                                                   NomeArquivoMerge,
                                                   MergeFiles,
                                                   ProcEnviaEmail);
  finally
    FreeAndNil(frmMyDigPreparaArquivos);
    FreeAndNil(dtmMyDigPreparaArquivos);
  end;
end;

function GeraLinks(ATabela: Int64; AProcesso: String; AArquivos: TStringArray;
   var ALinks: TLinkArray): Boolean;
begin
  if not Assigned(frmMyDigPreparaArquivos) then
    Application.CreateForm(TfrmMyDigPreparaArquivos, frmMyDigPreparaArquivos);
  if not Assigned(dtmMyDigPreparaArquivos) then
    Application.CreateForm(TdtmMyDigPreparaArquivos, dtmMyDigPreparaArquivos);
  try
    Result := frmMyDigPreparaArquivos.GeraLinks(ATabela, AProcesso, AArquivos, ALinks);
  finally
    FreeAndNil(frmMyDigPreparaArquivos);
    FreeAndNil(dtmMyDigPreparaArquivos);
  end;
end;

{ TfrmMyDigPreparaArquivos }

function TfrmMyDigPreparaArquivos.CopyFile(lpExistingFileName,
  lpNewFileName: PChar; bFailIfExists: BOOL): BOOL;
begin
  if not DirectoryExists(ExtractFileDir(lpNewFileName)) then
    ForceDirectories(ExtractFileDir(lpNewFileName));
  Result := Windows.CopyFile(lpExistingFileName, lpNewFileName, bFailIfExists);
  SetFileAttributes(lpNewFileName, GetFileAttributes(lpNewFileName) and not SysUtils.faReadOnly); // Retirar o atributo Somente Leitura do arquivo novo
end;

function TfrmMyDigPreparaArquivos.GeraArquivosLinks(ATabela: Int64; APathDestino, AProcesso: String;
  AArquivos: TStringArray; var AArquivosGerados: TStringArray; var ALinks: TLinkArray; out NomeArquivoMerge: string): Boolean;
begin
  Result := False;
  SetLength(AArquivosGerados, 0);
  SetLength(ALinks, 0);

  APathDestino := Trim(APathDestino);
  if APathDestino = '' then
    APathDestino := _PATH_ENVIO_EMAIL;
  if Copy(APathDestino, Length(APathDestino), 1) <> '\' then
    APathDestino := APathDestino + '\';
  LimpaPasta(APathDestino);

  try
    Position := poDesigned;
    Position := poDesktopCenter;
    rdgTipos.ItemIndex := 0;
    if ShowModal <> mrOk then
      Exit;

    // Prepara Arquivos
    if rdgTipos.ItemIndex = 0 then
      Result := GeraArquivos(ATabela, APathDestino, AProcesso, AArquivos, AArquivosGerados, NomeArquivoMerge)
    else // Prepara Links
      Result := GeraLinks(ATabela, AProcesso, AArquivos, ALinks);
  except
    on E: Exception do
    begin
      MessageDlg('Erro gerando arquivos.'#13 + E.Message, mtError, [mbOk], 0);
      Result := False;
    end;
  end;
end;

function TfrmMyDigPreparaArquivos.GeraArquivos(ATabela: Int64; APathDestino, AProcesso: String; AArquivos: TStringArray;
   var AArquivosGerados: TStringArray; out NomeArquivoMerge: string; MergeFiles: Boolean = False; ProcEnviaEmail: TProcEnviaEmail = nil): Boolean;
var
  A, I, C: Integer;
  Tipo: String;
  Path: string;
  Arquivos: string;
  qryEmailConfiguravel: TLocalSQLQuery;
  novoNomeArquivo : string;
  CaminhoNomeArquivoSemTipo,CaminhoNomeArquivo, NomeArquivo:string;
  TipoArquivo:string;
  DadosArquivo :TStringList;
  nomeArquivoFT :string;
  Aux: string;
  DadosFatura: TDadosFatura;
  NovoNome: string;
begin
  try
    nomeArquivoFT := '';

    for A := 0 to High(AArquivos) do
      with dtmMyDigPreparaArquivos do
      begin
         try
           DadosArquivo := TStringList.Create;
           DadosArquivo.clear;
           ExtractStrings([';'],[], PChar(AArquivos[A]), DadosArquivo);

           TipoArquivo               := DadosArquivo[0];
           CaminhoNomeArquivo        := DadosArquivo[1];
           NomeArquivo               := DadosArquivo[2];

         finally
          DadosArquivo.Free;
         end;

        { ----- Imagens ----- }
        if dtmMyDigPreparaArquivos.memArquivos.Active then
        begin
          dtmMyDigPreparaArquivos.memArquivos.EmptyTable;
          dtmMyDigPreparaArquivos.memArquivos.Close;
        end;

        try
          dtmMyDigPreparaArquivos.memArquivos.Open;
        except on e : exception do
          showmessage('Ocorreu o seguinte erro: '+ e.message);
        end;

        if qryImagens.Active then
          qryImagens.Close;

        qryImagens.Parameters.ParamByName('NR_PROCESSO').Value := AProcesso;
        qryImagens.Parameters.ParamByName('ID_TABELA').Value   := ATabela;
        qryImagens.Parameters.ParamByName('NM_ARQUIVO').Value  := ExtractFileName(NomeArquivo);
        qryImagens.Open;

        if not qryImagens.Eof then
        begin
          Tipo := Trim(qryImagensNM_TIPO_DOCTO.AsString);

          while not qryImagens.Eof do
          begin
            memArquivos.Append;
            memArquivosFileName.AsString := Trim(qryImagensNM_ARQUIVO.AsString);
            memArquivos.Post;

            qryImagens.Next;
          end;

          ppReport1.AllowPrintToArchive := False;
          ppReport1.AllowPrintToFile    := True;
          ppReport1.ShowPrintDialog     := False;
          ppReport1.ShowCancelDialog    := False;
          ppReport1.DeviceType          := 'PDFFile';
          ppReport1.SaveAsTemplate      := True;

          // Substituir caracteres inválidos
          for I := 1 to Length(_INVALIDOS) do
            Tipo := StringReplace(Tipo, _INVALIDOS[I], '-', [rfReplaceAll]);

          I := 0;
          repeat
            Inc(I);
        until not FileExists(APathDestino + Tipo + '_' + FormatFloat('00', I) + '.pdf');
        ppReport1.TextFileName := APathDestino + Tipo + '_' + FormatFloat('00', I) + '.pdf';
        ppReport1.Print;
          SetLength(AArquivosGerados, High(AArquivosGerados) + 2);
          AArquivosGerados[High(AArquivosGerados)] := APathDestino + Tipo + '_' + FormatFloat('00', I) + '.pdf';
        end;

        { ----- Demais Arquivos ----- }
        if qryOutros.Active then
          qryOutros.Close;

        qryOutros.Parameters.ParamByName('NR_PROCESSO').Value := AProcesso;
        qryOutros.Parameters.ParamByName('ID_TABELA').Value   := ATabela;
        qryOutros.Parameters.ParamByName('NM_ARQUIVO').Value  := ExtractFileName(NomeArquivo);
        qryOutros.Open;

        if not qryOutros.Eof then
        begin
          Tipo := Trim(qryOutrosNM_TIPO_DOCTO.AsString);
          // Substituir caracteres inválidos
          for I := 1 to Length(_INVALIDOS) do
            Tipo := StringReplace(Tipo, _INVALIDOS[I], '-', [rfReplaceAll]);

          //mudar aqui
          while not qryOutros.Eof do
          begin
            I := 0;
            repeat
              Inc(I);
            until not FileExists(APathDestino + Tipo + '_' + FormatFloat('00', I) + ExtractFileExt(NomeArquivo));

            // mudar nome do arquivo
            qryEmailConfiguravel := TLocalSQLQuery.Create(nil);
            qryEmailConfiguravel.close;
            qryEmailConfiguravel.sql.text := frmMyIndaiaDigitalizacao.GetSqlQueryEmailConfiguravel;

            try
              qryEmailConfiguravel.open;
            except on e : exception do
               showmessage('Ocorreu o seguinte erro: '+ e.message);
            end;
            // mudar nome do arquivo

            novoNomeArquivo := SomenteAlphaNumerico(Tipo);

            if (not qryEmailConfiguravel.IsEmpty) and Assigned(ProcEnviaEmail) then
            begin
              qryEmailConfiguravel.First;
              while not qryEmailConfiguravel.eof do
              begin
                if ((qryEmailConfiguravel.FieldByName('CD_ARQUIVO').asString = TipoArquivo) OR (qryEmailConfiguravel.FieldByName('CD_ARQUIVO').asString = '999')) then
                begin
                  if AnsiContainsText(NomeArquivo, qryEmailConfiguravel.FieldByName('NM_SIGLA').asString) then
                  begin
                    Aux := AnsiUpperCase(qryEmailConfiguravel.FieldByName('NM_NOVO_NOME_ARQUIVO').asString);
                    if Aux = '<NR_PROCESSO>' then
                    begin
                      novoNomeArquivo := AProcesso;
                      break;
                    end
                    else
                    begin
                      DadosFatura :=  PegarDadosFatura(StrToIntDef(SomenteNumero(NomeArquivo),0));
                      if (Aux = '<SENIOR_KEY>') then
                        novoNomeArquivo := IntToStr(DadosFatura.SeniorKey)
                      else
                      if (Aux = '<SENIOR_KEY_ANO>') then
                      begin
                        novoNomeArquivo := IntToStr(DadosFatura.SeniorKey)+'-'+FormatDateTime('yy', Now);
                        if DadosFatura.Total < 0 then
                          novoNomeArquivo := novoNomeArquivo + 'C';
                      end;
                      nomeArquivoFT := novoNomeArquivo;
                      if novoNomeArquivo <> '' then
                        break;
                    end;
                  end;
                end;
                qryEmailConfiguravel.Next;
              end;
            end;

            //AArquivos[A] := StringReplace(AArquivos[A], 'indaiaweb', '139.22.2.165', [rfReplaceAll]);

            if (Aux = '<SENIOR_KEY_ANO>') and (Length(AArquivos) = 1) then
            else
              novoNomeArquivo := novoNomeArquivo + FormatFloat('00', A+1);

            CopyFile(PAnsiChar(CaminhoNomeArquivo),
                     PAnsiChar(APathDestino + novoNomeArquivo + ExtractFileExt(CaminhoNomeArquivo)),
                     False);

            SetLength(AArquivosGerados, High(AArquivosGerados) + 2);
            AArquivosGerados[High(AArquivosGerados)] := APathDestino + novoNomeArquivo + ExtractFileExt(CaminhoNomeArquivo);

            qryOutros.Next;
          end; // WHILE
        end; // IF
      end; // WITH

      Path := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));

      if FileExists(Path + 'pdftk.exe') and MergeFiles then
      begin
        Arquivos := '';

        for I := Low(AArquivosGerados) to High(AArquivosGerados) do
          if UpperCase(ExtractFileExt(AArquivosGerados[I])) = '.PDF' then
            Arquivos := Arquivos + '"' + AArquivosGerados[I] + '" ';

        if Length(AArquivosGerados) > 1 then
        begin
          if nomeArquivoFT = '' then
            NomeArquivoMerge := APathDestino + SomenteAlphaNumerico(tipo +'_'+ AProcesso)+'.pdf'
          else
          begin
            if (Aux = '<SENIOR_KEY_ANO>') and (Length(AArquivosGerados) = 1) then
              NomeArquivoMerge := APathDestino + nomeArquivoFT+'.pdf'
            else
              NomeArquivoMerge := APathDestino + SomenteAlphaNumerico(nomeArquivoFT)+'.pdf';
          end;

          ExecAndWait('"' + Path + 'pdftk.exe"', Arquivos + ' cat output "'+NomeArquivoMerge+'"', Path);
          if (Aux = '<SENIOR_KEY_ANO>') then
          begin
            NovoNome := ExtractFileName(NomeArquivoMerge);
            NovoNome := AnsiLeftStr(NovoNome,Length(NovoNome)-4);

            if (AnsiRightStr(NovoNome,1)='C') then
            begin
               NovoNome := AnsiLeftStr(NovoNome,Length(NovoNome)-3)+'-'+AnsiRightStr(NovoNome, 3);
            end
            else
              NovoNome := AnsiLeftStr(NovoNome,Length(NovoNome)-2)+'-'+AnsiRightStr(NovoNome, 2);
            NovoNome := APathDestino + NovoNome + '.pdf';
          end;
          
          for I := Low(AArquivosGerados) to High(AArquivosGerados) do
            if UpperCase(ExtractFileExt(AArquivosGerados[I])) = '.PDF' then
              DeleteFile(PAnsiChar(AArquivosGerados[I]));

          if (Aux = '<SENIOR_KEY_ANO>') then
          begin
            RenameFile(NomeArquivoMerge, NovoNome);
            NomeArquivoMerge := NovoNome;
          end;
        end
        else
          NomeArquivoMerge := APathDestino + novoNomeArquivo + '.pdf';

          
        if Assigned(ProcEnviaEmail) then
          ProcEnviaEmail(NomeArquivoMerge);
      end;
    Result := True;
  except
    Result := False;
  end;
end;

function TfrmMyDigPreparaArquivos.GeraLinks(ATabela: Int64; AProcesso: String; AArquivos: TStringArray;
   var ALinks: TLinkArray): Boolean;
var
  A, I: Integer;
  Tipo: String;
  Link: RLink;
begin
  try
    for A := 0 to High(AArquivos) do
    begin
      with dtmMyDigPreparaArquivos do
      begin
        SetLength(ALinks, High(ALinks) + 2);
        if qryLinks.Active then
          qryLinks.Close;
        qryLinks.Parameters.ParamByName('NR_PROCESSO').Value := AProcesso;
        qryLinks.Parameters.ParamByName('ID_TABELA').Value   := ATabela;
        qryLinks.Parameters.ParamByName('NM_ARQUIVO').Value  := ExtractFileName(AArquivos[A]);
        qryLinks.Open;
        qryLinks.First;
        while not qryLinks.Eof do
        begin
          ALinks[High(ALinks)].Url  := Trim(qryLinksNM_LINK.AsString);
          ALinks[High(ALinks)].Nome := Trim(qryLinksNM_TIPO_DOCTO.AsString);
          qryLinks.Next;
        end;
        qryLinks.Close;
      end;
    end;
    {if High(ALinks) >= 0 then
      Tipo := '';
    for A := 0 to High(ALinks) do
    begin
      if not SameText(Tipo, ALinks[A].Nome) then
      begin
        N := 1;
        Tipo := ALinks[A].Nome;
      end
      else
        Inc(N);
      ALinks[A].Nome := ALinks[A].Nome + '_' + FormatFloat('00', N);
    end;}
    for A := 0 to High(ALinks) -1 do
      for I := A + 1 to High(ALinks) do
        if CompareText(ALinks[A].Nome, ALinks[I].Nome) > 0 then
        begin
          Link := ALinks[A];
          ALinks[A] := ALinks[I];
          ALinks[I] := Link;
        end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmMyDigPreparaArquivos.FormShow(Sender: TObject);
begin
  pnlGerando.Visible := False;
end;

procedure TfrmMyDigPreparaArquivos.btnGerarClick(Sender: TObject);
begin
  if rdgTipos.ItemIndex = 0 then
    pnlGerando.Caption := 'Gerando Arquivos...'
  else
    pnlGerando.Caption := 'Gerando Links...';
  pnlGerando.Visible := True;
  Update;
end;

function TfrmMyDigPreparaArquivos.PegarSeniorKey(NomeArquivo: string): string;
var
  novoNomeArquivo: string;
  qryAlterarNomeArquivo: TLocalSQLQuery;
begin
  novoNomeArquivo := '';
  qryAlterarNomeArquivo := TLocalSQLQuery.Create(nil);
  qryAlterarNomeArquivo.close;
  qryAlterarNomeArquivo.SQL.text := 'SELECT ISNULL(SENIORKEY,ID)  AS COD, TOTAL     '+ sLineBreak +
                                    ' FROM MYINDAIAV2.DBO.BILLING  (NOLOCK) '+ sLineBreak +
                                    ' WHERE ID = :ID '+ sLineBreak ;
  qryAlterarNomeArquivo.ParamByName('ID').value := SomenteNumero(NomeArquivo);
  try
    qryAlterarNomeArquivo.open;
  except on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;
  if not qryAlterarNomeArquivo.isempty then
  begin
    if qryAlterarNomeArquivo.FieldByName('COD').asString <> '' then
    begin
      novoNomeArquivo := qryAlterarNomeArquivo.FieldByName('COD').asString;
    end;
  end;
  Result := novoNomeArquivo;
end;

{function PegarSeniorKey(NomeArquivo: string):string;
begin
  if not Assigned(frmMyDigPreparaArquivos) then
    Application.CreateForm(TfrmMyDigPreparaArquivos, frmMyDigPreparaArquivos);
  if not Assigned(dtmMyDigPreparaArquivos) then
    Application.CreateForm(TdtmMyDigPreparaArquivos, dtmMyDigPreparaArquivos);
  try
    Result := frmMyDigPreparaArquivos.PegarSeniorKey(NomeArquivo);
  finally
    FreeAndNil(frmMyDigPreparaArquivos);
    FreeAndNil(dtmMyDigPreparaArquivos);
  end;
end;}

end.
