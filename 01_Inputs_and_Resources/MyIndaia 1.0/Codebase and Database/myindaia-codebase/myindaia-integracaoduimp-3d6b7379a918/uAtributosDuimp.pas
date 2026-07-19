unit uAtributosDuimp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.JSON, System.Generics.Collections, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmDuimp, MyDialog, uJsonAtributosAdicionaisTributos, uIntegracaoAPIs;

type

  TObjetivo = record
    Codigo: Integer;
    Descricao: string;
  end;

  TCondicao = record
    Operador: string;
    Valor: string;
  end;

  TAtributoCondicionado = record
    AtributoCondicionante: Boolean;
    Codigo: string;
    Condicionados: TArray<TAtributoCondicionado>;
    DataFimVigencia: string;
    DataInicioVigencia: string;
    FormaPreenchimento: string;
    ListaSubatributos: TArray<string>;
    Multivalorado: Boolean;
    Nome: string;
    NomeApresentacao: string;
    Objetivos: TArray<TObjetivo>;
    Obrigatorio: Boolean;
    Orgaos: TArray<string>;
    TamanhoMaximo: Integer;
  end;

  TCondicionado = record
    Atributo: TAtributoCondicionado;
    Condicao: TCondicao;
    DataFimVigencia: string;
    DataInicioVigencia: string;
    DescricaoCondicao: string;
    Multivalorado: Boolean;
    Obrigatorio: Boolean;
  end;

  TDominio = record
    Codigo: string;
    Descricao: string;
  end;

  TAtributo = record
    AtributoCondicionante: Boolean;
    Codigo: string;
    Condicionados: TArray<TCondicionado>;
    DataFimVigencia: string;
    DataInicioVigencia: string;
    FormaPreenchimento: string;
    ListaSubatributos: TArray<string>;
    Modalidade: string;
    Multivalorado: Boolean;
    Nome: string;
    NomeApresentacao: string;
    Objetivos: TArray<TObjetivo>;
    Obrigatorio: Boolean;
    Orgaos: TArray<string>;
    OrientacaoPreenchimento: string;
    TamanhoMaximo: Integer;
    Dominio: TArray<TDominio>;
  end;

  TListaAtributo = record
    Codigo: string;
    DataFimVigencia: string;
    DataInicioVigencia: string;
    Modalidade: string;
    Multivalorado: Boolean;
    Obrigatorio: Boolean;
  end;

  TNcm = record
    CodigoNcm: string;
    ListaAtributos: TArray<TListaAtributo>;
  end;

  TAtributosNCM = record
    DetalhesAtributos: TArray<TAtributo>;
    ListaNcm: TArray<TNcm>;
  end;

  TfrmAtributosDuimp = class(TForm)
    idHttp: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    panel2: TPanel;
    qryNcmItensProcesso: TFDQuery;
    qryNcmItensProcessoNR_PROCESSO: TStringField;
    qryNcmItensProcessoNR_ADICAO: TStringField;
    qryNcmItensProcessoNR_ITEM: TStringField;
    qryNcmItensProcessoCD_NCM_SH: TStringField;
    Panel1: TPanel;
    txtResposta: TMemo;
    pnlmenu: TPanel;
    btnNcm: TBitBtn;
    edtTexto: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    edtNrProcesso: TEdit;
    Label2: TLabel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    pnlConexaoAntiga: TPanel;
    chkConexaoAntiga: TCheckBox;
    btnTentarNovamente: TBitBtn;
    procedure btnNcmClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnTentarNovamenteClick(Sender: TObject);
  private
    function GetApi(uri: String): String;
    function Conectar(var vMensagem: String): Boolean;
    function GetAtributosDaDuimp(ncm: String): TAtributosNCM;
    procedure GravarRecordNoBanco(const RecordEstrutura: TAtributosNCM);
    function GetAtributosAdicionaisTributos(ncm: String): TAtributosNCM;
    { Private declarations }
  public
    Token: String;
    CSRF: String;
    mfila: TFDMemTable;
    function ConsultarItensProcesso(nrProcesso: String): Boolean;
    procedure InserirItemNumeroDuimp(nrProcesso: String);
    { Public declarations }
  end;

var
  frmAtributosDuimp: TfrmAtributosDuimp;
  Processo: String;

implementation

{$R *.dfm}


function JSONToRecordAtributosDaDuimp(const JSON: string): TAtributosNCM;
var
  JSONObject: TJSONObject;
  DominioArray, AtributosArray, CondicionadosArray, OrgaosArray, SubatributosArray, ObjetivosArray: TJSONArray;
  DominioObj, AtributoObj, CondicionadoObj, ObjetivoObj: TJSONObject;
  i, j, k: Integer;
  AtributosNCM: TAtributosNCM;
begin
  JSONObject := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  try
    // Processar DetalhesAtributos
    AtributosArray := JSONObject.GetValue<TJSONArray>('detalhesAtributos');
    SetLength(AtributosNCM.DetalhesAtributos, AtributosArray.Count);
    for i := 0 to AtributosArray.Count - 1 do
    begin
      AtributoObj := AtributosArray.Items[i] as TJSONObject;

      AtributosNCM.DetalhesAtributos[i].Codigo := AtributoObj.GetValue<string>('codigo');
      AtributosNCM.DetalhesAtributos[i].Nome := AtributoObj.GetValue<string>('nome');
      AtributosNCM.DetalhesAtributos[i].NomeApresentacao := AtributoObj.GetValue<string>('nomeApresentacao');
      AtributosNCM.DetalhesAtributos[i].Modalidade := AtributoObj.GetValue<string>('modalidade');
      AtributosNCM.DetalhesAtributos[i].DataInicioVigencia := AtributoObj.GetValue<string>('dataInicioVigencia');
      AtributosNCM.DetalhesAtributos[i].DataFimVigencia := AtributoObj.GetValue<string>('dataFimVigencia');
      AtributosNCM.DetalhesAtributos[i].FormaPreenchimento := AtributoObj.GetValue<string>('formaPreenchimento');
      AtributosNCM.DetalhesAtributos[i].Obrigatorio := AtributoObj.GetValue<Boolean>('obrigatorio');
      AtributosNCM.DetalhesAtributos[i].Multivalorado := AtributoObj.GetValue<Boolean>('multivalorado');
      AtributosNCM.DetalhesAtributos[i].AtributoCondicionante := AtributoObj.GetValue<Boolean>('atributoCondicionante');
      AtributosNCM.DetalhesAtributos[i].OrientacaoPreenchimento := AtributoObj.GetValue<string>('orientacaoPreenchimento', '');
      AtributosNCM.DetalhesAtributos[i].TamanhoMaximo := AtributoObj.GetValue<Integer>('tamanhoMaximo', 0);

      // Processar Objetivos
      if AtributoObj.TryGetValue<TJSONArray>('objetivos', ObjetivosArray) then
      begin
        SetLength(AtributosNCM.DetalhesAtributos[i].Objetivos, ObjetivosArray.Count);
        for k := 0 to ObjetivosArray.Count - 1 do
        begin
          ObjetivoObj := ObjetivosArray.Items[k] as TJSONObject;
          AtributosNCM.DetalhesAtributos[i].Objetivos[k].Codigo := ObjetivoObj.GetValue<integer>('codigo');
          AtributosNCM.DetalhesAtributos[i].Objetivos[k].Descricao := ObjetivoObj.GetValue<string>('descricao');
        end;
      end;

      // Processar Dominio
      if AtributoObj.TryGetValue<TJSONArray>('dominio', DominioArray) then
      begin
        SetLength(AtributosNCM.DetalhesAtributos[i].Dominio, DominioArray.Count);
        for k := 0 to DominioArray.Count - 1 do
        begin
          DominioObj := DominioArray.Items[k] as TJSONObject;
          AtributosNCM.DetalhesAtributos[i].Dominio[k].Codigo := DominioObj.GetValue<string>('codigo');
          AtributosNCM.DetalhesAtributos[i].Dominio[k].Descricao := DominioObj.GetValue<string>('descricao');
        end;
      end;

      // Processar Órgãos
      if AtributoObj.TryGetValue<TJSONArray>('orgaos', OrgaosArray) then
      begin
        SetLength(AtributosNCM.DetalhesAtributos[i].Orgaos, OrgaosArray.Count);
        for k := 0 to OrgaosArray.Count - 1 do
          AtributosNCM.DetalhesAtributos[i].Orgaos[k] := OrgaosArray.Items[k].Value;
      end;

      // Processar Condicionados
      if AtributoObj.TryGetValue<TJSONArray>('condicionados', CondicionadosArray) then
      begin
        SetLength(AtributosNCM.DetalhesAtributos[i].Condicionados, CondicionadosArray.Count);
        for j := 0 to CondicionadosArray.Count - 1 do
        begin
          CondicionadoObj := CondicionadosArray.Items[j] as TJSONObject;

          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.AtributoCondicionante := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<Boolean>('atributoCondicionante');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Codigo := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<string>('codigo');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.DataInicioVigencia := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<string>('dataInicioVigencia');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.DataFimVigencia := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<string>('dataFimVigencia');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.FormaPreenchimento := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<string>('formaPreenchimento', '');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Multivalorado := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<Boolean>('multivalorado', False);
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Nome := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<string>('nome');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.NomeApresentacao := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<string>('nomeApresentacao', '');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.TamanhoMaximo := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<Integer>('tamanhoMaximo', 0);
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Obrigatorio := CondicionadoObj.GetValue<TJSONObject>('atributo').GetValue<Boolean>('obrigatorio', False);

          // Processar Órgãos
          if CondicionadoObj.GetValue<TJSONObject>('atributo').TryGetValue<TJSONArray>('orgaos', OrgaosArray) then
          begin
            SetLength(AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Orgaos, OrgaosArray.Count);
            for k := 0 to OrgaosArray.Count - 1 do
              AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Orgaos[k] := OrgaosArray.Items[k].Value;
          end;

          // Processar Objetivos
          if CondicionadoObj.GetValue<TJSONObject>('atributo').TryGetValue<TJSONArray>('objetivos', ObjetivosArray) then
          begin
            SetLength(AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Objetivos, ObjetivosArray.Count);
            for k := 0 to ObjetivosArray.Count - 1 do
            begin
              ObjetivoObj := ObjetivosArray.Items[k] as TJSONObject;
              AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Objetivos[k].Codigo := ObjetivoObj.GetValue<Integer>('codigo');
              AtributosNCM.DetalhesAtributos[i].Condicionados[j].Atributo.Objetivos[k].Descricao := ObjetivoObj.GetValue<string>('descricao');
            end;
          end;

          // Processar Condição
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Condicao.Operador := CondicionadoObj.GetValue<TJSONObject>('condicao').GetValue<string>('operador');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Condicao.Valor := CondicionadoObj.GetValue<TJSONObject>('condicao').GetValue<string>('valor');

          // Outros campos do Condicionado
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].DataInicioVigencia := CondicionadoObj.GetValue<string>('dataInicioVigencia');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].DataFimVigencia := CondicionadoObj.GetValue<string>('dataFimVigencia');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].DescricaoCondicao := CondicionadoObj.GetValue<string>('descricaoCondicao');
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Obrigatorio := CondicionadoObj.GetValue<Boolean>('obrigatorio', False);
          AtributosNCM.DetalhesAtributos[i].Condicionados[j].Multivalorado := CondicionadoObj.GetValue<Boolean>('multivalorado', False);
        end;
      end;
    end;
    result := AtributosNCM;
  finally
    JSONObject.Free;
  end;
end;

procedure GravarRecordNoMemo(const RecordEstrutura: TAtributosNCM; Memo: TMemo);
var
  i, j, k, l: Integer;
begin
//Memo.Clear;

  // Exibir DetalhesAtributos
  Memo.Lines.Add('Detalhes dos Atributos:');
  for i := 0 to High(RecordEstrutura.DetalhesAtributos) do
  begin
    with RecordEstrutura.DetalhesAtributos[i] do
    begin
      Memo.Lines.Add('Código: ' + Codigo);
      Memo.Lines.Add('Nome: ' + Nome);
      Memo.Lines.Add('Nome Apresentação: ' + NomeApresentacao);
      Memo.Lines.Add('Modalidade: ' + Modalidade);
      Memo.Lines.Add('Data Início Vigência: ' + DataInicioVigencia);
      Memo.Lines.Add('Data Fim Vigência: ' + DataFimVigencia);
      Memo.Lines.Add('Forma de Preenchimento: ' + FormaPreenchimento);
      Memo.Lines.Add('Orientação Preenchimento: ' + OrientacaoPreenchimento);
      Memo.Lines.Add('Tamanho Máximo: ' + TamanhoMaximo.ToString);
      Memo.Lines.Add('Obrigatório: ' + BoolToStr(Obrigatorio, True));
      Memo.Lines.Add('Multivalorado: ' + BoolToStr(Multivalorado, True));
      Memo.Lines.Add('Atributo Condicionante: ' + BoolToStr(AtributoCondicionante, True));

      // Exibir Objetivos
      Memo.Lines.Add('Objetivos:');
      for j := 0 to High(Objetivos) do
      begin
        Memo.Lines.Add('  Código: ' + Objetivos[j].Codigo.ToString);
        Memo.Lines.Add('  Descrição: ' + Objetivos[j].Descricao);
      end;

      // Exibir Órgãos
      Memo.Lines.Add('Órgãos:');
      if Length(Orgaos) = 0 then
        Memo.Lines.Add('  Nenhum órgão especificado.')
      else
        for j := 0 to High(Orgaos) do
          Memo.Lines.Add('  ' + Orgaos[j]);

      // Exibir Domínio
      Memo.Lines.Add('Domínio:');
      for j := 0 to High(Dominio) do
      begin
        Memo.Lines.Add('  Código: ' + Dominio[j].Codigo);
        Memo.Lines.Add('  Descrição: ' + Dominio[j].Descricao);
      end;

      // Exibir Condicionados
      Memo.Lines.Add('Condicionados:');
      if Length(Condicionados) = 0 then
        Memo.Lines.Add('  Nenhum condicionado especificado.')
      else
        for j := 0 to High(Condicionados) do
        begin
          with Condicionados[j] do
          begin
            Memo.Lines.Add('  Atributo:');
            Memo.Lines.Add('    Atributo Condicionante: ' + BoolToStr(Atributo.AtributoCondicionante, True));
            Memo.Lines.Add('    Código: ' + Atributo.Codigo);
            Memo.Lines.Add('    Nome: ' + Atributo.Nome);
            Memo.Lines.Add('    Nome Apresentação: ' + Atributo.NomeApresentacao);
            Memo.Lines.Add('    Data Início Vigência: ' + Atributo.DataInicioVigencia);
            Memo.Lines.Add('    Data Fim Vigência: ' + Atributo.DataFimVigencia);
            Memo.Lines.Add('    Forma de Preenchimento: ' + Atributo.FormaPreenchimento);
            Memo.Lines.Add('    Tamanho Máximo: ' + Atributo.TamanhoMaximo.ToString);
            Memo.Lines.Add('    Obrigatório: ' + BoolToStr(Atributo.Obrigatorio, True));
            Memo.Lines.Add('    Multivalorado: ' + BoolToStr(Atributo.Multivalorado, True));

            // Exibir Objetivos do Atributo
            Memo.Lines.Add('    Objetivos:');
            for k := 0 to High(Atributo.Objetivos) do
            begin
              Memo.Lines.Add('      Código: ' + Atributo.Objetivos[k].Codigo.ToString);
              Memo.Lines.Add('      Descrição: ' + Atributo.Objetivos[k].Descricao);
            end;

            // Exibir Órgãos do Atributo
            Memo.Lines.Add('    Órgãos:');
            for k := 0 to High(Atributo.Orgaos) do
              Memo.Lines.Add('      ' + Atributo.Orgaos[k]);

            // Exibir Subatributos do Condicionado
            Memo.Lines.Add('    Subatributos:');
            for k := 0 to High(Atributo.ListaSubatributos) do
              Memo.Lines.Add('      ' + Atributo.ListaSubatributos[k]);

            // Exibir Condição
            Memo.Lines.Add('  Condição:');
            Memo.Lines.Add('    Operador: ' + Condicao.Operador);
            Memo.Lines.Add('    Valor: ' + Condicao.Valor);

            Memo.Lines.Add('  dataFimVigencia: ' + dataFimVigencia);
            Memo.Lines.Add('  dataInicioVigencia: ' + dataInicioVigencia);
            Memo.Lines.Add('  descricaoCondicao: ' + descricaoCondicao);
            Memo.Lines.Add('  Multivalorado: ' + BoolToStr(Multivalorado, True));
            Memo.Lines.Add('  obrigatorio: ' + BoolToStr(Obrigatorio, True));

          end;
        end;
      Memo.Lines.Add('------------------------');
    end;
  end;

  // Exibir ListaNcm
  Memo.Lines.Add('Lista NCM:');
  for i := 0 to High(RecordEstrutura.ListaNcm) do
  begin
    Memo.Lines.Add('Código NCM: ' + RecordEstrutura.ListaNcm[i].CodigoNcm);

    // Exibir ListaAtributos
    Memo.Lines.Add('Atributos do NCM:');
    for j := 0 to High(RecordEstrutura.ListaNcm[i].ListaAtributos) do
    begin
      with RecordEstrutura.ListaNcm[i].ListaAtributos[j] do
      begin
        Memo.Lines.Add('  Código: ' + Codigo);
        Memo.Lines.Add('  Data Início Vigência: ' + DataInicioVigencia);
        Memo.Lines.Add('  Data Fim Vigência: ' + DataFimVigencia);
        Memo.Lines.Add('  Modalidade: ' + Modalidade);
        Memo.Lines.Add('  Multivalorado: ' + BoolToStr(Multivalorado, True));
        Memo.Lines.Add('  Obrigatório: ' + BoolToStr(Obrigatorio, True));
      end;
    end;
    Memo.Lines.Add('------------------------');
  end;
end;

//procedure GravarRecordNoMemo(const RecordEstrutura: TDetalhesAtributos; Memo: TMemo);
//var
//  i, j, k, l: Integer;
//begin
//  Memo.Clear;
//
//  // Exibir DetalhesAtributos
//  Memo.Lines.Add('Detalhes dos Atributos:');
//  for i := 0 to High(RecordEstrutura.DetalhesAtributos) do
//  begin
//    with RecordEstrutura.DetalhesAtributos[i] do
//    begin
//      Memo.Lines.Add('Código: ' + Codigo);
//      Memo.Lines.Add('Nome: ' + Nome);
//      Memo.Lines.Add('Nome Apresentação: ' + NomeApresentacao);
//      Memo.Lines.Add('Modalidade: ' + Modalidade);
//      Memo.Lines.Add('Data Início Vigência: ' + DataInicioVigencia);
//      Memo.Lines.Add('Data Fim Vigência: ' + DataFimVigencia);
//      Memo.Lines.Add('Forma de Preenchimento: ' + FormaPreenchimento);
//      Memo.Lines.Add('Orientação Preenchimento: ' + OrientacaoPreenchimento);
//      Memo.Lines.Add('Tamanho Máximo: ' + TamanhoMaximo.ToString);
//      Memo.Lines.Add('Obrigatório: ' + BoolToStr(Obrigatorio, True));
//      Memo.Lines.Add('Multivalorado: ' + BoolToStr(Multivalorado, True));
//      Memo.Lines.Add('Atributo Condicionante: ' + BoolToStr(AtributoCondicionante, True));
//
//      // Exibir Objetivos
//      Memo.Lines.Add('Objetivos:');
//      if Length(Objetivos) = 0 then
//        Memo.Lines.Add('  Nenhum objetivo especificado.')
//      else
//        for j := 0 to High(Objetivos) do
//        begin
//          Memo.Lines.Add('  Código: ' + Objetivos[j].Codigo.ToString);
//          Memo.Lines.Add('  Descrição: ' + Objetivos[j].Descricao);
//        end;
//
//      // Exibir Órgãos
//      Memo.Lines.Add('Órgãos:');
//      if Length(Orgaos) = 0 then
//        Memo.Lines.Add('  Nenhum órgão especificado.')
//      else
//        for j := 0 to High(Orgaos) do
//          Memo.Lines.Add('  ' + Orgaos[j]);
//
//      // Exibir Domínio
//      Memo.Lines.Add('Domínio:');
//      for j := 0 to High(Dominio) do
//      begin
//        Memo.Lines.Add('  Código: ' + Dominio[j].Codigo);
//        Memo.Lines.Add('  Descrição: ' + Dominio[j].Descricao);
//      end;
//
//      // Exibir Condicionados
//      Memo.Lines.Add('Condicionados:');
//      if Length(Condicionados) = 0 then
//        Memo.Lines.Add('  Nenhum condicionado especificado.')
//      else
//        for j := 0 to High(Condicionados) do
//        begin
//          with Condicionados[j] do
//          begin
//            Memo.Lines.Add('  Atributo Código: ' + Atributo.Codigo);
//            Memo.Lines.Add('  Nome: ' + Atributo.Nome);
//            Memo.Lines.Add('  Nome Apresentação: ' + Atributo.NomeApresentacao);
//            Memo.Lines.Add('  Data Início Vigência: ' + Atributo.DataInicioVigencia);
//            Memo.Lines.Add('  Data Fim Vigência: ' + Atributo.DataFimVigencia);
//            Memo.Lines.Add('  Forma de Preenchimento: ' + Atributo.FormaPreenchimento);
//            Memo.Lines.Add('  Tamanho Máximo: ' + Atributo.TamanhoMaximo.ToString);
//            Memo.Lines.Add('  Obrigatório: ' + BoolToStr(Atributo.Obrigatorio, True));
//            Memo.Lines.Add('  Multivalorado: ' + BoolToStr(Atributo.Multivalorado, True));
//
//            // Exibir Objetivos do Atributo
//            Memo.Lines.Add('  Objetivos:');
//            for k := 0 to High(Atributo.Objetivos) do
//            begin
//              Memo.Lines.Add('    Código: ' + Atributo.Objetivos[k].Codigo.ToString);
//              Memo.Lines.Add('    Descrição: ' + Atributo.Objetivos[k].Descricao);
//            end;
//
//            // Exibir Órgãos do Atributo
//            Memo.Lines.Add('  Órgãos:');
//            for k := 0 to High(Atributo.Orgaos) do
//              Memo.Lines.Add('    ' + Atributo.Orgaos[k]);
//
//            // Exibir Condição
//            Memo.Lines.Add('  Condição:');
//            Memo.Lines.Add('    Operador: ' + Condicao.Operador);
//            Memo.Lines.Add('    Valor: ' + Condicao.Valor);
//          end;
//        end;
//      Memo.Lines.Add('------------------------');
//    end;
//  end;
////
//   Exibir ListaNcm
//  Memo.Lines.Add('Lista NCM:');
//  for i := 0 to High(RecordEstrutura.ListaNcm) do
//  begin
//    with RecordEstrutura.ListaNcm[i] do
//    begin
//      Memo.Lines.Add('Código NCM: ' + CodigoNcm);
//
//      // Exibir ListaAtributos
//      Memo.Lines.Add('Atributos do NCM:');
//      for j := 0 to High(ListaAtributos) do
//      begin
//        with ListaAtributos[j] do
//        begin
//          Memo.Lines.Add('  Código: ' + Codigo);
//          Memo.Lines.Add('  Data Início Vigência: ' + DataInicioVigencia);
//          Memo.Lines.Add('  Data Fim Vigência: ' + DataFimVigencia);
//          Memo.Lines.Add('  Modalidade: ' + Modalidade);
//          Memo.Lines.Add('  Multivalorado: ' + BoolToStr(Multivalorado, True));
//          Memo.Lines.Add('  Obrigatório: ' + BoolToStr(Obrigatorio, True));
//        end;
//      end;
//      Memo.Lines.Add('------------------------');
//    end;
//  end;
//end;

procedure TfrmAtributosDuimp.GravarRecordNoBanco(const RecordEstrutura: TAtributosNCM);
var
  i, j: Integer;

  procedure Gravar(pAtributo: String);
  var
    vQuery: TFDQuery;
  begin
    vQuery := TFDQuery.Create(nil);
    vQuery.Connection := dtmDuimp.FDConnection1;
    try
      vQuery.Close;
      vQuery.SQL.Text := 'SELECT * FROM TNCM_ATRIBUTO_DUIMP WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ADICAO = :NR_ADICAO AND NR_ITEM = :NR_ITEM AND CD_ATRIBUTO = :CD_ATRIBUTO';
      vQuery.ParamByName('NR_PROCESSO').AsString := mFila.FieldByName('NR_PROCESSO').AsString;
      vQuery.ParamByName('NR_ADICAO').AsString := mFila.FieldByName('NR_ADICAO').AsString;
      vQuery.ParamByName('NR_ITEM').AsString := mFila.FieldByName('NR_ITEM').AsString;
      vQuery.ParamByName('CD_ATRIBUTO').AsString := pAtributo;
      vquery.Open;

      if vQuery.RecordCount < 1 then
      begin
        try
          vQuery.Close;
          vQuery.SQL.Text :=
          'INSERT INTO TNCM_ATRIBUTO_DUIMP (NR_PROCESSO, NR_ADICAO, NR_ITEM, CD_ATRIBUTO) ' +
          'VALUES (:NR_PROCESSO, :NR_ADICAO, :NR_ITEM, :CD_ATRIBUTO) ';
          vQuery.ParamByName('NR_PROCESSO').AsString := mFila.FieldByName('NR_PROCESSO').AsString;
          vQuery.ParamByName('NR_ADICAO').AsString := mFila.FieldByName('NR_ADICAO').AsString;
          vQuery.ParamByName('NR_ITEM').AsString := mFila.FieldByName('NR_ITEM').AsString;
          vQuery.ParamByName('CD_ATRIBUTO').AsString := pAtributo;
          vquery.ExecSQL;
          except
            on E: Exception do
            begin
              txtResposta.Lines.Add(
                FormatDateTime('hh:nn:ss', Now) + ' - ' +
                'Adição: ' + mFila.FieldByName('NR_ADICAO').AsString +
                ', Item: '  + mFila.FieldByName('NR_ITEM').AsString +
                ', Atributo: ' + pAtributo +
                ' - ERRO GRAVANDO ATRIBUTO! ' +  E.Message
              );
            end;
          end;

        txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              'Adição: ' + mFila.FieldByName('NR_ADICAO').AsString +
                              ', Item: ' + mFila.FieldByName('NR_ITEM').AsString +
                              ', Atributo: ' + pAtributo + ' - Ok');
      end
      else
      begin
        txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              'Adição: ' + mFila.FieldByName('NR_ADICAO').AsString +
                              ', Item: ' + mFila.FieldByName('NR_ITEM').AsString +
                              ', Atributo: ' + pAtributo + ' - Já existe');
      end;

    finally
      vQuery.Free;
    end;
  end;
begin

  for i := 0 to High(RecordEstrutura.DetalhesAtributos) do
  begin
    Gravar(RecordEstrutura.DetalhesAtributos[i].Codigo);
//    if Length(RecordEstrutura.DetalhesAtributos[i].Condicionados) > 0 then
//    begin
//      for j := 0 to High(RecordEstrutura.DetalhesAtributos[i].Condicionados) do
//      begin
//        Gravar(RecordEstrutura.DetalhesAtributos[i].Condicionados[j].Atributo.Codigo);
//
//        if (RecordEstrutura.DetalhesAtributos[i].Condicionados[j].Atributo.AtributoCondicionante) then
//          ShowMessage('Novo atributo condicionado e condicionante. Favor pedir para o TI cadastrar.');
//      end;
//    end;
  end;
end;

procedure TfrmAtributosDuimp.BitBtn1Click(Sender: TObject);
begin
  ConsultarItensProcesso(edtNrProcesso.Text);
  InserirItemNumeroDuimp(edtNrProcesso.Text);
end;

procedure TfrmAtributosDuimp.InserirItemNumeroDuimp(nrProcesso: String);
var
  vQuery: TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dtmDuimp.FDConnection1;

    //Preenche o número dos itens Duimp
    vQuery.Close;
    vQuery.SQL.Text :=
    'SELECT NR_ITEM_DUIMP FROM TDETALHE_MERCADORIA WHERE  ' + #13#10 +
    'NR_PROCESSO = :NR_PROCESSO AND  ' + #13#10 +
    'ISNULL(NR_ITEM_DUIMP, '''') = '''' ';
    vQuery.ParamByName('NR_PROCESSO').AsString := nrProcesso;
    vquery.Open;

    if vQuery.RecordCount > 0 then
    begin
      vQuery.Close;
      vQuery.SQL.Text := 'WITH CTE AS ( ' + #13#10 +
                          '    SELECT ' + #13#10 +
                          '        NR_ITEM_DUIMP, NR_ADICAO, NR_ITEM, ' + #13#10 +
                          '        ROW_NUMBER() OVER (ORDER BY NR_ADICAO, NR_ITEM) AS RN ' + #13#10 +
                          '    FROM TDETALHE_MERCADORIA ' + #13#10 +
                          '    WHERE NR_PROCESSO = :NR_PROCESSO ' + #13#10 +
                          ') ' + #13#10 +
                          'UPDATE TDETALHE_MERCADORIA ' + #13#10 +
                          'SET NR_ITEM_DUIMP = CTE.RN ' + #13#10 +
                          'FROM TDETALHE_MERCADORIA D ' + #13#10 +
                          'INNER JOIN CTE ON D.NR_ADICAO = CTE.NR_ADICAO AND D.NR_ITEM = CTE.NR_ITEM ' + #13#10 +
                          'WHERE D.NR_PROCESSO = :NR_PROCESSO ';
      vQuery.ParamByName('NR_PROCESSO').AsString := nrProcesso;
      vquery.ExecSQL;
      txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - Número dos itens da Duimp atualizados com sucesso');
    end;


    //Preenche a tabela de Itens da Duimp (Onde é controlado o envio dos itens).
    vQuery.SQL.Text :=
      'SELECT 1 FROM TDETALHE_MERCADORIA_DUIMP ' +
      'WHERE NR_PROCESSO = :NR_PROCESSO AND IN_ITEM_ENVIADO_DUIMP = 1';

    vQuery.ParamByName('NR_PROCESSO').AsString := nrProcesso;
    vQuery.Open;

    if not vQuery.IsEmpty then
    begin
      Warning('Não é possível prosseguir, pois existe item já enviado para o portal único. Exclua os itens da Duimp antes de prosseguir.');
      vQuery.Close;
      Exit;
    end;

    vQuery.Close;

    // Se há itens com IN_ITEM_ENVIADO = 0, excluir diretamente
    vQuery.SQL.Text :=
      'DELETE FROM TDETALHE_MERCADORIA_DUIMP ' +
      'WHERE NR_PROCESSO = :NR_PROCESSO AND EXISTS (' +
      'SELECT 1 FROM TDETALHE_MERCADORIA_DUIMP WHERE NR_PROCESSO = :NR_PROCESSO AND IN_ITEM_ENVIADO_DUIMP = 0)';

    vQuery.ParamByName('NR_PROCESSO').AsString := nrProcesso;
    vQuery.ExecSQL;

    vQuery.Close;
    vQuery.SQL.Text :=  'INSERT INTO TDETALHE_MERCADORIA_DUIMP ( ' + #13#10 +
                        '    NR_PROCESSO, ' + #13#10 +
                        '    NR_ADICAO, ' + #13#10 +
                        '    NR_ITEM, ' + #13#10 +
                        '    NR_ITEM_DUIMP, ' + #13#10 +
                        '    CD_MERCADORIA, ' + #13#10 +
                        '    IN_ITEM_ENVIADO_DUIMP, ' + #13#10 +
                        '    TX_STATUS_DUIMP ' + #13#10 +
                        ') ' + #13#10 +
                        'SELECT ' + #13#10 +
                        '    NR_PROCESSO, ' + #13#10 +
                        '    NR_ADICAO, ' + #13#10 +
                        '    NR_ITEM, ' + #13#10 +
                        '    NR_ITEM_DUIMP, ' + #13#10 +
                        '    CD_MERCADORIA, ' + #13#10 +
                        '    0,  -- Definindo como "não enviado" por padrão ' + #13#10 +
                        '    NULL ' + #13#10 +
                        'FROM TDETALHE_MERCADORIA ' + #13#10 +
                        'WHERE NR_PROCESSO = :NR_PROCESSO';

    vQuery.ParamByName('NR_PROCESSO').AsString := nrProcesso;
    vquery.ExecSQL;

  finally
    vQuery.Free;
  end;
end;

function TfrmAtributosDuimp.ConsultarItensProcesso(nrProcesso: String): Boolean;
var
  RecordEstrutura: TAtributosNCM;
begin
  result := true;
  Processo := nrProcesso;
  mfila := TFDMemTable.Create(nil);
  try
    try

      qryNcmItensProcesso.Close;
      qryNcmItensProcesso.ParamByName('NR_PROCESSO').AsString := nrProcesso;
      qryNcmItensProcesso.Open;

      qryNcmItensProcesso.FetchAll;
      mFila.Data := qryNcmItensProcesso.Data;

      qryNcmItensProcesso.close;
      qryNcmItensProcesso.UnPrepare;

      if mfila.IsEmpty then
        exit;

      mFila.First;

      txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' Preenchendo os atributos do processo:  ' + nrProcesso);
      txtResposta.Lines.Add('');

      while (not mFila.Eof) do
      begin
        RecordEstrutura := GetAtributosDaDuimp( mfila.FieldByName('CD_NCM_SH').AsString);
        if Length(RecordEstrutura.DetalhesAtributos) > 0 then
          GravarRecordNoBanco(RecordEstrutura)
        else
          txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' + 'NÃO EXISTE ATRIBUTO PARA A NCM ' + mfila.FieldByName('CD_NCM_SH').AsString);
        mFila.next;
      end;

      txtResposta.Lines.Add('');
      txtResposta.Lines.Add('INTEGRAÇÃO FINALIZADA!');
      sleep(3000);

    finally
      mFila.Free;
    end;
  except
    on E: Exception do
    begin
      txtResposta.Lines.Add(
        ' ERRO ao tentar conectar ou integrar com a API do Portal Único.! ' +  E.Message
      );
      result := false;
    end;
  end;
end;

procedure TfrmAtributosDuimp.BitBtn2Click(Sender: TObject);
var
  ParentForm: TCustomForm;
begin
  Self.Close;

  ParentForm := GetParentForm(Self);
  if ParentForm <> nil then
    ParentForm.Close;
end;

procedure TfrmAtributosDuimp.btnNcmClick(Sender: TObject);
var
  RecordEstrutura: TAtributosNCM;
begin
  RecordEstrutura := GetAtributosDaDuimp(edtTexto.text);
  GravarRecordNoMemo(RecordEstrutura, txtResposta);

end;

procedure TfrmAtributosDuimp.btnTentarNovamenteClick(Sender: TObject);
begin
  ConsultarItensProcesso(processo);
end;

function TfrmAtributosDuimp.GetAtributosDaDuimp(ncm: String): TAtributosNCM;
var
  vMensagem: String;
  vResultText: String;
  vEnviada: Boolean;
  uri: String;
  urlIndaia: String;
//  txtTeste: TStringList;

begin

  uri := 'https://portalunico.siscomex.gov.br/cadatributos/api/ext/atributo-ncm/'+ncm +
         '?' +
         'modalidade=IMPORTACAO' +
         '&objetivos=DUIMP'
         ;

  if not chkConexaoAntiga.Checked then
  begin
    if system.DebugHook = 1 then
      urlIndaia := 'http://localhost:2001/ApiProxyPortalUnico'
    else
      urlIndaia := 'https://api.myindaia.com.br/ApiProxyPortalUnico';

    if  Api_viaServidor(urlIndaia, 'edgar', Get, uri, vResultText, '') then
    begin
      pnlConexaoAntiga.Visible := false;
    end
    else
    begin
      pnlConexaoAntiga.Visible := true;
      raise Exception.Create('Tentativa de conexão pelo proxy interno');
    end;
  end
  else
  begin
    if not Conectar(vMensagem) then
    begin
      txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      txtResposta.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);
      ShowMessage('Não foi possível conectar ao portal. Confira o Log');
      raise Exception.Create('Tentativa de conexão pelo método antigo');
      pnlConexaoAntiga.Visible := true;
    end;
    vResultText := GetApi(uri);
    pnlConexaoAntiga.Visible := false;
  end;

//teste
//  try
//    txtTeste := TStringList.Create;
//    txtTeste.Text := vResultText;
//    txtTeste.SaveToFile('D:\Indaiá\Temp\010725.txt');
//  except
//    txtTeste.Free;
//  end;

  result := JSONToRecordAtributosDaDuimp(vResultText);
end;

function TfrmAtributosDuimp.GetAtributosAdicionaisTributos(ncm: String): TAtributosNCM;
var
  vMensagem: String;
  vResultText: String;
  vEnviada: Boolean;
  uri: String;

begin
  if Conectar(vMensagem) then
  begin
//    txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now));
//    txtResposta.Lines.Add('Conectado com sucesso.');
  end
  else
  begin
    txtResposta.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtResposta.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);
    ShowMessage('Não foi possível conectar ao portal. Confira o Log');
    Exit;
  end;

  uri := 'https://portalunico.siscomex.gov.br/cadatributos/api/ext/atributo-ncm/'+ncm +
         '?' +
         'modalidade=IMPORTACAO' +
         '&objetivos=DUIMP'
         ;

  vResultText := GetApi(uri);
//  result := JSONToRecord(vResultText);
end;

function TfrmAtributosDuimp.GetApi(uri: String): String;
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
    IdHTTP.Response.ContentType := 'application/json';
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
        txtResposta.Lines.Add(e.ErrorMessage + #13);
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

function TfrmAtributosDuimp.Conectar(var vMensagem: String): Boolean;
var
  URL: String;
  StringList: TStringList;
  vPastaCertificados: string;
begin
  inherited;

  if CSRF <> '' then
    exit(true);

  URL := 'https://portalunico.siscomex.gov.br/portal/api/autenticar';

  StringList := TStringList.Create;
  try
    vPastaCertificados := 'C:\DDBROKER\Certificados\';
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

end.
