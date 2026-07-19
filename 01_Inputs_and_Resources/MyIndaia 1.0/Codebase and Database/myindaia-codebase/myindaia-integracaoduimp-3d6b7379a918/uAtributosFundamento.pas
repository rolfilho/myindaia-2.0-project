unit uAtributosFundamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.JSON,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dmDuimp, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Grids, Vcl.DBGrids, uIntegracaoAPIs;

type

  TAtributoPreenchido = record
    Codigo: string;
    Nome: string;
    Valor: string;
    ValorDescricao: string;
  end;

  TfrmAtributosFundamento = class(TForm)
    panel2: TPanel;
    pnlmenu: TPanel;
    Panel1: TPanel;
    lblAdicao: TLabel;
    lblProcesso: TLabel;
    lblFundamento: TLabel;
    Panel3: TPanel;
    btnSair: TPanel;
    scrCampos: TScrollBox;
    idHttp: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Panel4: TPanel;
    grdItens: TDBGrid;
    qryAtributosFundamentoItem: TFDQuery;
    dsAtributosFundamentoItem: TDataSource;
    qryAtributosFundamentoItemNR_ITEM: TStringField;
    qryAtributosFundamentoItemCD_MERCADORIA: TStringField;
    qryAtributosFundamentoItemTX_DESC_DET_MERC: TStringField;
    btnSalvar: TPanel;
    pnlConexaoAntiga: TPanel;
    btnConsultar: TPanel;
    chkConexaoAntiga: TCheckBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure grdItensCellClick(Column: TColumn);
    procedure btnConsultarClick(Sender: TObject);
  private
    FItemAtual: Integer;
    function GetAtributosFundamento: String;
    function Conectar_old(var vMensagem: String): Boolean;
    function GetApi_old(uri: String): String; overload;
    procedure CriarCamposDinamicos(const JSON: string; painel: TScrollBox);
    procedure ExibirAtributosNoMemo(const JSON: string; painel: TScrollBox;
      memo: TMemo);
    function ObterAtributosPreenchidos(const JSON: string;
      painel: TScrollBox): TArray<TAtributoPreenchido>;
    procedure GravarAtributosNoBanco(const JSON: string; painel: TScrollBox;
      const NrProcesso, NrAdicao, FundamentoCodigo: string);
    procedure Fechar;
    procedure InserirAtributosNoBanco(const JSON: string);
    procedure SalvarAtributo;
    { Private declarations }
  public
    { Public declarations }
    Token_old: String;
    CSRF_old: String;
    NrProcesso: String;
    NrAdicao: String;
    vFundamentoLegal: String;
    JsonString: String;
    procedure ConsultarAtributosFundamento;

  end;

var
  frmAtributosFundamento: TfrmAtributosFundamento;

implementation

uses
  System.Generics.Collections, Vcl.ComCtrls;

{$R *.dfm}

{ TfrmAtributosFundamento }

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure GravaJsonTeste(json: String);
var
  vstring:  TStringList;
begin
  vString := TStringList.Create;
  try
    vString.text := json;
    vString.SaveToFile(GetLocalPath + 'TesteAttFund_'+formatDatetime('ddmmyy.hhnn', now)+'.json');
  finally
    vString.Free;
  end;
end;

procedure TfrmAtributosFundamento.Fechar;
var
  ParentForm: TCustomForm;
begin
  Self.Close;

  ParentForm := GetParentForm(Self);
  if ParentForm <> nil then
    ParentForm.Close;
end;

function TfrmAtributosFundamento.GetAtributosFundamento: String;
var
  vMensagem: String;
  vResultText: String;
  uri: String;
  urlIndaia: String;
  vNCM, vRegime: String;

  function TemFundamentoLegal: Boolean;
  var
    vQuery: TFDQuery;
  begin
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := dtmDuimp.FDConnection1;
      vQuery.SQL.Text := 'SELECT AD.CD_MERCADORIA_NCM, CD_FUND_LEGAL_II_DUIMP, CD_FUND_LEGAL_IPI_DUIMP, AD.CD_REGIME_TRIBUTAR '+
                         'FROM TADICAO_DE_IMPORTACAO AD '+
                         'WHERE AD.NR_PROCESSO = :NrProcesso AND AD.NR_ADICAO = :NrAdicao ';
      vQuery.ParamByName('NrProcesso').AsString := NrProcesso;
      vQuery.ParamByName('NrAdicao').AsString := NrAdicao;
      vQuery.Open;

      vNCM := vQuery.FieldByName('CD_MERCADORIA_NCM').AsString;
      vRegime := vQuery.FieldByName('CD_REGIME_TRIBUTAR').AsString;
      vFundamentoLegal := vQuery.FieldByName('CD_FUND_LEGAL_II_DUIMP').AsString; //'1009';

      result := vFundamentoLegal <> '';

    finally
      vQuery.Free;
    end;
  end;

begin

  if not TemFundamentoLegal then
    raise Exception.Create('Não existe Fundamento Legal de II');

  lblProcesso.Caption := 'Processo: ' + NrProcesso;
  lblAdicao.Caption := 'Adição: ' + NrAdicao;
  lblFundamento.Caption := 'Fundamento: ' + vFundamentoLegal;

  uri := 'https://portalunico.siscomex.gov.br/cadatributos/api/ext/atributo-fundamento-legal/' + vFundamentoLegal;

  if not chkConexaoAntiga.Checked then
  begin
//    if system.DebugHook = 1 then
//      urlIndaia := 'http://localhost:2001/ApiProxyPortalUnico'
//    else
      urlIndaia := 'https://api.myindaia.com.br/ApiProxyPortalUnico';

    if  Api_viaServidor(urlIndaia, 'edgar', Get, uri, vResultText, '') then
    begin
      pnlConexaoAntiga.Visible := false;
    end
    else
    begin
      pnlConexaoAntiga.Visible := true;
      raise Exception.Create('Tentativa de conexão pelo proxy interno: ' + vResultText );
    end;
  end
  else
  begin
    if not Conectar(vMensagem) then
    begin
      ShowMessage('Não foi possível conectar ao portal.');
      pnlConexaoAntiga.Visible := true;
      raise Exception.Create('Tentativa de conexão pelo método antigo');
    end;
    vResultText := GetApi(uri);
    pnlConexaoAntiga.Visible := false;
  end;

  Result := vResultText;
end;

procedure TfrmAtributosFundamento.ConsultarAtributosFundamento;
begin

  vPastaCertificados := 'C:\DDBROKER\Certificados\';

  qryAtributosFundamentoItem.ParamByName('NrProcesso').AsString := NrProcesso;
  qryAtributosFundamentoItem.ParamByName('NrAdicao').AsString := NrAdicao;
  qryAtributosFundamentoItem.Open;

  try
    JsonString := GetAtributosFundamento;
    GravaJsonTeste(JsonString);
    if jsonString <> '' then
    begin
      InserirAtributosNoBanco(JsonString);
      CriarCamposDinamicos(JsonString, scrCampos);
    end;
  except
    on E: Exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

function TfrmAtributosFundamento.ObterAtributosPreenchidos(const JSON: string; painel: TScrollBox): TArray<TAtributoPreenchido>;
var
  LParser: TJSONObject;
  LAtributos: TJSONArray;
  LAtributo: TJSONObject;
  i, j: Integer;
  Codigo, Nome, Forma: string;
  ComboBox: TComboBox;
  RadioGroup: TRadioGroup;
  EditCampo: TEdit;
  DatePicker: TDateTimePicker;
  DominioArray: TJSONArray;
  DominioItem: TJSONObject;
  Atributo: TAtributoPreenchido;
  descricaoSelecionada: string;
begin
  SetLength(Result, 0);

  LParser := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  try
    if not Assigned(LParser) then
      Exit;

    LAtributos := LParser.GetValue<TJSONArray>('detalhesAtributos');
    if not Assigned(LAtributos) then
      Exit;

    for i := 0 to LAtributos.Count - 1 do
    begin
      if not (LAtributos.Items[i] is TJSONObject) then
        Continue;

      LAtributo := LAtributos.Items[i] as TJSONObject;

      Codigo := LAtributo.GetValue<string>('codigo');
      Nome   := LAtributo.GetValue<string>('nome');
      Forma  := LAtributo.GetValue<string>('formaPreenchimento');

      Atributo.Codigo := Codigo;
      Atributo.Nome := Nome;
      Atributo.Valor := '';
      Atributo.ValorDescricao := '';

      if SameText(Forma, 'LISTA_ESTATICA') then
      begin
        ComboBox := painel.FindChildControl('cmb_' + Codigo) as TComboBox;
        if Assigned(ComboBox) and (ComboBox.ItemIndex >= 0) then
        begin
          descricaoSelecionada := ComboBox.Items[ComboBox.ItemIndex];

          if LAtributo.TryGetValue<TJSONArray>('dominio', DominioArray) then
          begin
            for j := 0 to DominioArray.Count - 1 do
            begin
              if not (DominioArray.Items[j] is TJSONObject) then
                Continue;

              DominioItem := DominioArray.Items[j] as TJSONObject;

              if DominioItem.GetValue<string>('descricao') = descricaoSelecionada then
              begin
                Atributo.Valor := DominioItem.GetValue<string>('codigo');
                Atributo.ValorDescricao := descricaoSelecionada;
                Break;
              end;
            end;
          end;
        end;
      end
      else if SameText(Forma, 'BOOLEANO') then
      begin
        RadioGroup := painel.FindChildControl('rdg_' + Codigo) as TRadioGroup;
        if Assigned(RadioGroup) then
        begin
          if RadioGroup.ItemIndex = 0 then
            Atributo.Valor := 'true'
          else if RadioGroup.ItemIndex = 1 then
            Atributo.Valor := 'false';
        end;
      end
      else if SameText(Forma, 'DATA') then
      begin
        DatePicker := painel.FindChildControl('dtp_' + Codigo) as TDateTimePicker;
        if Assigned(DatePicker) then
        begin
          // Envia no formato ISO padrão (yyyy-mm-dd)
          Atributo.Valor := FormatDateTime('yyyy"-"mm"-"dd', DatePicker.Date);
        end;
      end
      else if Forma.StartsWith('NUMERO') or Forma.StartsWith('TEXTO') then
      begin
        EditCampo := painel.FindChildControl('edt_' + Codigo) as TEdit;
        if Assigned(EditCampo) then
          Atributo.Valor := EditCampo.Text;
      end;

      // Adiciona o atributo à lista
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Atributo;
    end;

  finally
    LParser.Free;
  end;
end;

procedure TfrmAtributosFundamento.ExibirAtributosNoMemo(const JSON: string; painel: TScrollBox; memo: TMemo);
var
  Atributos: TArray<TAtributoPreenchido>;
  i: Integer;
  Linha: string;
begin
  memo.Clear;
  Atributos := ObterAtributosPreenchidos(JSON, painel);

  for i := 0 to High(Atributos) do
  begin
    Linha := Format(
      'Código: %s | Nome: %s | Valor: %s | Valor Descrição: %s',
      [Atributos[i].Codigo, Atributos[i].Nome, Atributos[i].Valor, Atributos[i].ValorDescricao]
    );
    memo.Lines.Add(Linha);
  end;
end;

procedure TfrmAtributosFundamento.CriarCamposDinamicos(const JSON: string; painel: TScrollBox);
const
  PrefixCombo = 'cmb_';
  PrefixEdit  = 'edt_';
  PrefixRadio = 'rdg_';
  PrefixLabel = 'lbl_';
  PrefixDate  = 'dtp_';
var
  LParser: TJSONObject;
  LAtributos: TJSONArray;
  LAtributo: TJSONObject;
  i, j, yPos: Integer;
  LabelCampo: TLabel;
  ComboBox: TComboBox;
  RadioGroup: TRadioGroup;
  EditCampo: TEdit;
  DatePicker: TDateTimePicker;
  DominioArray: TJSONArray;
  DominioItem: TJSONObject;
  CodigoAtributo, Forma, NomeApresentacao: string;

  qSel: TFDQuery;
  vItem: Integer;
  MapValor: TDictionary<string, string>;
  MapDesc : TDictionary<string, string>;
  ValorAttr, DescAttr: string;
  idx: Integer;
begin
  if (painel = nil) then
    Exit;

  btnSalvar.Parent := nil;

  // Limpa controles anteriores do painel com segurança
  while painel.ControlCount > 0 do
    painel.Controls[0].Free;

  MapValor := TDictionary<string, string>.Create;
  MapDesc  := TDictionary<string, string>.Create;
  qSel := TFDQuery.Create(nil);
  try
    if (dtmDuimp = nil) or (dtmDuimp.FDConnection1 = nil) or (not dtmDuimp.FDConnection1.Connected) then
      raise Exception.Create('Conexão do banco não está ativa.');

    qSel.Connection := dtmDuimp.FDConnection1;

    if (qryAtributosFundamentoItem = nil) or (not qryAtributosFundamentoItem.Active) then
      raise Exception.Create('Dataset qryAtributosFundamentoItem não está ativo.');

    if qryAtributosFundamentoItem.FindField('NR_ITEM') = nil then
      raise Exception.Create('Campo NR_ITEM não encontrado em qryAtributosFundamentoItem.');

    vItem := qryAtributosFundamentoItem.FieldByName('NR_ITEM').AsInteger;

    qSel.SQL.Text :=
      'SELECT AtributoCodigo, AtributoValor, AtributoDescricaoValor ' +
      'FROM TDuimpAtributosFundamento ' +
      'WHERE NrProcesso = :p1 AND NrAdicao = :p2 AND NrItem = :p3';
    qSel.ParamByName('p1').AsString  := NrProcesso;
    qSel.ParamByName('p2').AsString  := NrAdicao;
    qSel.ParamByName('p3').AsInteger := vItem;
    qSel.Open;

    while not qSel.Eof do
    begin
      MapValor.AddOrSetValue(
        qSel.FieldByName('AtributoCodigo').AsString,
        qSel.FieldByName('AtributoValor').AsString
      );
      MapDesc.AddOrSetValue(
        qSel.FieldByName('AtributoCodigo').AsString,
        qSel.FieldByName('AtributoDescricaoValor').AsString
      );
      qSel.Next;
    end;
  finally
    qSel.Free;
  end;

  // Parse do JSON com verificação
  if (JSON = '') then
  begin
    painel.VertScrollBar.Range := 0;
    MapValor.Free;
    MapDesc.Free;
    Exit;
  end;

  LParser := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  try
    if not Assigned(LParser) then
    begin
      painel.VertScrollBar.Range := 0;
      Exit;
    end;

    LAtributos := LParser.GetValue<TJSONArray>('detalhesAtributos');
    if (LAtributos = nil) or (LAtributos.Count = 0) then
    begin
      painel.VertScrollBar.Range := 0;
      Exit;
    end;

    yPos := 10;

    for i := 0 to LAtributos.Count - 1 do
    begin
      if not (LAtributos.Items[i] is TJSONObject) then
        Continue;
      LAtributo := TJSONObject(LAtributos.Items[i]);

      CodigoAtributo := LAtributo.GetValue<string>('codigo', '');
      if CodigoAtributo = '' then
        Continue;

      // Só cria controles se existir registro para este atributo no item selecionado
      if not MapValor.TryGetValue(CodigoAtributo, ValorAttr) then
        Continue;
      MapDesc.TryGetValue(CodigoAtributo, DescAttr);

      Forma := LAtributo.GetValue<string>('formaPreenchimento', '');
      NomeApresentacao := LAtributo.GetValue<string>('nomeApresentacao', CodigoAtributo);

      // Label
      LabelCampo := TLabel.Create(painel);
      LabelCampo.Parent := painel;
      LabelCampo.Caption := NomeApresentacao;
      LabelCampo.Name := PrefixLabel + CodigoAtributo;
      LabelCampo.Top := yPos;
      LabelCampo.Left := 10;

      yPos := yPos + 20;

      // LISTA_ESTATICA
      if SameText(Forma, 'LISTA_ESTATICA') then
      begin
        ComboBox := TComboBox.Create(painel);
        ComboBox.Parent := painel;
        ComboBox.Name := PrefixCombo + CodigoAtributo;
        ComboBox.Top := yPos;
        ComboBox.Left := 10;
        ComboBox.Width := 900;
        ComboBox.Text := '';

        DominioArray := LAtributo.GetValue<TJSONArray>('dominio');
        if Assigned(DominioArray) then
        begin
          for j := 0 to DominioArray.Count - 1 do
          begin
            if DominioArray.Items[j] is TJSONObject then
            begin
              DominioItem := TJSONObject(DominioArray.Items[j]);
              ComboBox.Items.Add(DominioItem.GetValue<string>('descricao', ''));
            end;
          end;

          // Seleciona por descrição preferencialmente
          if DescAttr <> '' then
          begin
            idx := ComboBox.Items.IndexOf(DescAttr);
            if idx >= 0 then
              ComboBox.ItemIndex := idx
            else
              ComboBox.Text := DescAttr;
          end
          else if ValorAttr <> '' then
          begin
            idx := ComboBox.Items.IndexOf(ValorAttr);
            if idx >= 0 then
              ComboBox.ItemIndex := idx
            else
              ComboBox.Text := ValorAttr;
          end;
        end;

        yPos := yPos + ComboBox.Height;
      end
      // BOOLEANO
      else if SameText(Forma, 'BOOLEANO') then
      begin
        RadioGroup := TRadioGroup.Create(painel);
        RadioGroup.Parent := painel;
        RadioGroup.Name := PrefixRadio + CodigoAtributo;
        RadioGroup.Caption := '';
        RadioGroup.Top := yPos;
        RadioGroup.Left := 10;
        RadioGroup.Width := 150;
        RadioGroup.Height := 45;
        RadioGroup.Columns := 2;
        RadioGroup.Items.Add('Sim');
        RadioGroup.Items.Add('Não');

        if SameText(ValorAttr, 'true') or SameText(ValorAttr, '1') or SameText(ValorAttr, 'S') or SameText(ValorAttr, 'Sim') then
          RadioGroup.ItemIndex := 0
        else if SameText(ValorAttr, 'false') or SameText(ValorAttr, '0') or SameText(ValorAttr, 'N') or SameText(ValorAttr, 'Não') then
          RadioGroup.ItemIndex := 1
        else
          RadioGroup.ItemIndex := -1;

        yPos := yPos + RadioGroup.Height;
      end
      // DATA
      else if SameText(Forma, 'DATA') then
      begin
        DatePicker := TDateTimePicker.Create(painel);
        DatePicker.Parent := painel;
        DatePicker.Name := PrefixDate + CodigoAtributo;
        DatePicker.Top := yPos;
        DatePicker.Left := 10;
        DatePicker.Width := 250;

        DatePicker.Kind := dtkDate;
        DatePicker.Format := 'dd/MM/yyyy';

        // Conservador: se não conseguir converter, mantém a data de hoje
        DatePicker.Date := Date;

        if Trim(ValorAttr) <> '' then
        begin
          try
            // ISO yyyy-mm-dd
            if (Length(ValorAttr) >= 10) and (ValorAttr[5] = '-') and (ValorAttr[8] = '-') then
            begin
              DatePicker.Date := EncodeDate(
                StrToInt(Copy(ValorAttr, 1, 4)),
                StrToInt(Copy(ValorAttr, 6, 2)),
                StrToInt(Copy(ValorAttr, 9, 2))
              );
            end
            else
            begin
              // fallback (ex.: dd/mm/yyyy)
              DatePicker.Date := StrToDate(ValorAttr);
            end;
          except
            // se falhar, mantém Date := Date
          end;
        end;

        yPos := yPos + DatePicker.Height;
      end
      // NUMERO / TEXTO (usa StartsText para evitar string helper inexistente)
      else if StartsText('NUMERO', Forma) or StartsText('TEXTO', Forma) then
      begin
        EditCampo := TEdit.Create(painel);
        EditCampo.Parent := painel;
        EditCampo.Name := PrefixEdit + CodigoAtributo;
        EditCampo.Top := yPos;
        EditCampo.Left := 10;
        EditCampo.Width := 250;
        EditCampo.Text := ValorAttr;

        yPos := yPos + EditCampo.Height;
      end;

      yPos := yPos + 20;
    end;

    btnSalvar.Parent := painel;
    btnSalvar.Top := yPos;
    btnSalvar.Left := 10;

    painel.VertScrollBar.Range := yPos + 20;

  finally
    LParser.Free;
    MapValor.Free;
    MapDesc.Free;
  end;
end;

procedure TfrmAtributosFundamento.btnConsultarClick(Sender: TObject);
begin
  ConsultarAtributosFundamento;
end;

procedure TfrmAtributosFundamento.btnSairClick(Sender: TObject);
begin
  Fechar;
end;

procedure TfrmAtributosFundamento.btnSalvarClick(Sender: TObject);
begin
//  GravarAtributosNoBanco(
//    JsonString,
//    scrCampos,
//    NrProcesso,
//    NrAdicao,
//    vFundamentoLegal
//  );
//  Fechar;
  SalvarAtributo;
end;

procedure TfrmAtributosFundamento.SalvarAtributo;
var
  AtributosItem: TArray<TAtributoPreenchido>;
  i: Integer;
  qUp: TFDQuery;
  vItem: Integer;

  procedure SafeParamStr(const P: TFDParam; const V: string);
  begin
    if V = '' then
    begin
      P.Clear;
    end
    else
    begin
      P.AsString := V;
    end;
  end;

  procedure SafeParamInt(const P: TFDParam; const V: Integer);
  begin
    P.AsInteger := V;
  end;

begin

  try
    // 0) Pré-checs do dataset selecionado
    if (qryAtributosFundamentoItem = nil) then
    begin
      Exit;
    end;

    if qryAtributosFundamentoItem.IsEmpty then
    begin
      Exit;
    end;

    if qryAtributosFundamentoItem.FindField('NR_ITEM') = nil then
    begin
      Exit;
    end;

    vItem := qryAtributosFundamentoItem.FieldByName('NR_ITEM').AsInteger;

    // 1) Lê os valores da tela
    if JsonString = '' then
    begin
      ShowMessage('Os dados não foram carregados, não é possível salvar.');
      exit;
    end;
    AtributosItem := ObterAtributosPreenchidos(JsonString, scrCampos);

    if Length(AtributosItem) = 0 then
    begin
      Exit;
    end;

    // 2) Conexão
    qUp := TFDQuery.Create(nil);
    try
      if (dtmDuimp = nil) or (dtmDuimp.FDConnection1 = nil) then
      begin
        Exit;
      end;

      if not dtmDuimp.FDConnection1.Connected then
      begin
        dtmDuimp.FDConnection1.Connected := True;
      end;

      qUp.Connection := dtmDuimp.FDConnection1;

      // 3) Transação
      dtmDuimp.FDConnection1.StartTransaction;
      try
        // 4) SQL e tipos
        qUp.SQL.Text :=
          'UPDATE TDuimpAtributosFundamento SET '+
          '  AtributoValor = :v, '+
          '  AtributoDescricaoValor = :vd '+
          'WHERE NrProcesso = :p1 AND NrAdicao = :p2 AND NrItem = :p3 '+
          '  AND FundamentoCodigo = :f AND AtributoCodigo = :c';

        qUp.Params.ParamByName('v').DataType   := ftString;  qUp.Params.ParamByName('v').Size  := 50;
        qUp.Params.ParamByName('vd').DataType  := ftString;  qUp.Params.ParamByName('vd').Size := 200;

        qUp.Params.ParamByName('p1').DataType  := ftString;  qUp.Params.ParamByName('p1').Size := 18;
        qUp.Params.ParamByName('p2').DataType  := ftString;  qUp.Params.ParamByName('p2').Size := 3;
        qUp.Params.ParamByName('p3').DataType  := ftInteger;

        qUp.Params.ParamByName('f').DataType   := ftString;  qUp.Params.ParamByName('f').Size  := 10;
        qUp.Params.ParamByName('c').DataType   := ftString;  qUp.Params.ParamByName('c').Size  := 50;

        qUp.Prepare;

        // 5) Loop de updates
        for i := 0 to High(AtributosItem) do
        begin
          try
            // Valores
            SafeParamStr(qUp.ParamByName('v'),  AtributosItem[i].Valor);
            SafeParamStr(qUp.ParamByName('vd'), AtributosItem[i].ValorDescricao);

            // Chave
            SafeParamStr(qUp.ParamByName('p1'), NrProcesso);
            SafeParamStr(qUp.ParamByName('p2'), NrAdicao);
            SafeParamInt(qUp.ParamByName('p3'), vItem);
            SafeParamStr(qUp.ParamByName('f'),  vFundamentoLegal);
            SafeParamStr(qUp.ParamByName('c'),  AtributosItem[i].Codigo);

            qUp.ExecSQL;
          except
            on E: Exception do
            begin
              Showmessage(Format('EXCEPTION no item %d (Codigo="%s"): %s',[i, AtributosItem[i].Codigo, E.Message]));
              raise;
            end;
          end;
        end;

        dtmDuimp.FDConnection1.Commit;
      except
        on E: Exception do
        begin
          dtmDuimp.FDConnection1.Rollback;
          raise;
        end;
      end;
    finally
      qUp.Free;
    end;
  except
    on E: Exception do
    begin
      Showmessage('ERRO em SalvarAtributo: ' + E.ClassName + ' - ' + E.Message);
    end;
  end;
end;

procedure TfrmAtributosFundamento.GravarAtributosNoBanco(const JSON: string; painel: TScrollBox;
  const NrProcesso, NrAdicao, FundamentoCodigo: string);
var
  Atributos: TArray<TAtributoPreenchido>;
  i: Integer;
  qry: TFDQuery;
begin
  Atributos := ObterAtributosPreenchidos(JSON, painel);

  qry := TFDQuery.Create(nil);
  try
    qry.Connection := dtmDuimp.FDConnection1;

    qry.SQL.Text := 'DELETE FROM TDuimpAtributosFundamento WHERE NrProcesso = :p1 AND NrAdicao = :p2';
    qry.ParamByName('p1').AsString := NrProcesso;
    qry.ParamByName('p2').AsString := NrAdicao;
    qry.ExecSQL;

    qry.SQL.Text :=
      'INSERT INTO TDuimpAtributosFundamento ' +
      '(NrProcesso, NrAdicao, FundamentoCodigo, AtributoCodigo, AtributoNome, AtributoValor, AtributoDescricaoValor) ' +
      'VALUES (:NrProcesso, :NrAdicao, :FundamentoCodigo, :AtributoCodigo, :AtributoNome, :AtributoValor, :AtributoDescricaoValor)';

    for i := 0 to High(Atributos) do
    begin
      qry.ParamByName('NrProcesso').AsString := NrProcesso;
      qry.ParamByName('NrAdicao').AsString := NrAdicao;
      qry.ParamByName('FundamentoCodigo').AsString := FundamentoCodigo;
      qry.ParamByName('AtributoCodigo').AsString := Atributos[i].Codigo;
      qry.ParamByName('AtributoNome').AsString := Atributos[i].Nome;
      qry.ParamByName('AtributoValor').AsString := Atributos[i].Valor;
      qry.ParamByName('AtributoDescricaoValor').AsString := Atributos[i].ValorDescricao;
      qry.ExecSQL;
    end;

  finally
    qry.Free;
  end;
end;

procedure TfrmAtributosFundamento.grdItensCellClick(Column: TColumn);
begin
  if JsonString = '' then
    exit;

  if not qryAtributosFundamentoItem.IsEmpty then
  begin
    CriarCamposDinamicos(JsonString, scrCampos);
  end;
end;

function TfrmAtributosFundamento.Conectar_old(var vMensagem: String): Boolean;
var
  URL: String;
  StringList: TStringList;

begin
  inherited;

  URL := 'https://portalunico.siscomex.gov.br/portal/api/autenticar';

  StringList := TStringList.Create;
  try

    idHttp.Request.Clear;
    idHttp.Request.ContentType := 'application/xml';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    idHttp.Request.BasicAuthentication := False;
    idHttp.Response.ResponseText := 'UTF-8';
    idHttp.BoundPortMax := 5000;
    idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + 'Edgar.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + 'Edgar.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + 'Edgar.key';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + NomeDespachante + '.key';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method       := sslvSSLv23;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode         := sslmClient;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth  := 2;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode   := [];
    idHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

    idHttp.Request.Referer := URL;
    idHttp.Request.CustomHeaders.Values['Role-Type']:= 'IMPEXP';

    try
      idHttp.Post(URL, StringList);
    except
      on E:EIdHTTPProtocolException do
      begin
        result := false;
        vMensagem := e.ErrorMessage;
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      result :=  true;
      vMensagem := 'Conectado';
      Token := idHttp.Response.RawHeaders.Values['Set-Token'];
      CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
    end
    else
    begin
      result := false;
      vMensagem := idHttp.ResponseText;
    end;

  finally
    FreeAndNil(StringList);
  end;
end;

function TfrmAtributosFundamento.GetApi_old(uri: String): String overload;
var
  Response: TStringStream;
  vString: TStringStream;
  URL: String;
  RespostaCod, RespostaMsg: String;
begin

  URL := uri;

  Response := TStringStream.Create('');
  try
    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Response.ContentType := 'application/zip';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    IdHTTP.Request.Referer := URL;

    try
        idHTTP.get(URL ,Response);
    except
    on E:EIdHTTPProtocolException do
      begin
        ShowMessage(e.ErrorMessage + #13);
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      result := Utf8ToString(Response.DataString);
    end;

  finally
    FreeAndNil(Response);
  end;
end;

procedure TfrmAtributosFundamento.InserirAtributosNoBanco(const JSON: string);
var
  i: Integer;
  qryIns: TFDQuery;
  qrySel: TFDQuery;
  LParser: TJSONObject;
  LAtributos: TJSONArray;
  LAtributo: TJSONObject;
  CodigoAtributo, NomeAtributo: string;
begin

  qryIns := TFDQuery.Create(nil);
  qrySel := TFDQuery.Create(nil);
  LParser := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  try
    LAtributos := LParser.GetValue<TJSONArray>('detalhesAtributos');
    if (LAtributos = nil) or (LAtributos.Count = 0) then
    begin
      showmessage('Não existe atributos para o fundamento ' + vFundamentoLegal + '.') ;
      Exit;
    end;

    qryIns.Connection := dtmDuimp.FDConnection1;
    qrySel.Connection := dtmDuimp.FDConnection1;

    qryIns.SQL.Text :=
      'INSERT INTO TDuimpAtributosFundamento ' +
      '(NrProcesso, NrAdicao, NrItem, FundamentoCodigo, AtributoCodigo, AtributoNome) ' +
      'VALUES (:NrProcesso, :NrAdicao, :NrItem, :FundamentoCodigo, :AtributoCodigo, :AtributoNome)';

    qrySel.SQL.Text := 'SELECT * ' +
                       'FROM TDETALHE_MERCADORIA DM ' +
                       'WHERE DM.NR_PROCESSO = :NR_PROCESSO AND DM.NR_ADICAO   = :NR_ADICAO ' +
                       'AND NOT EXISTS ( SELECT 1 FROM TDuimpAtributosFundamento AF ' +
                                        'WHERE AF.NrProcesso = DM.NR_PROCESSO ' +
                                        'AND AF.NrAdicao   = DM.NR_ADICAO ' +
                                        'AND AF.NrItem     = DM.NR_ITEM)';
    qrySel.paramByName('NR_PROCESSO').AsString := nrProcesso;
    qrySel.paramByName('NR_ADICAO').AsString := nrAdicao;
    qrySel.Open;

    qryIns.ParamByName('NrProcesso').AsString := NrProcesso;
    qryIns.ParamByName('NrAdicao').AsString := NrAdicao;
    qryIns.ParamByName('FundamentoCodigo').AsString := vFundamentoLegal;

    While not qrySel.Eof do
    begin

      qryIns.ParamByName('NrItem').AsString := qrySel.FieldByName('NR_ITEM').AsString;
      for i := 0 to LAtributos.Count - 1 do
      begin
        LAtributo := LAtributos.Items[i] as TJSONObject;
        CodigoAtributo := LAtributo.GetValue<string>('codigo');
        NomeAtributo := LAtributo.GetValue<string>('nomeApresentacao');

        qryIns.ParamByName('AtributoCodigo').AsString := CodigoAtributo;
        qryIns.ParamByName('AtributoNome').AsString := NomeAtributo;
        qryIns.ExecSQL;
      end;
      qrySel.Next;
    end;

  finally
    qryIns.Free;
    qrySel.Free;
    LParser.Free;
  end;
end;

end.
