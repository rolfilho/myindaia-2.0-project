unit uFrmIntegracaoDrawBackIsencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, udmMain, uIntegracaoWebServiceRest, utils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, uManipulacaoArquivos;

type
  TFrmIntegracaoDrawBackIsencao = class(TForm)
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    btnTransmitirFila: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    lblStatus1: TLabel;
    dsDrawbackIsencaoFila: TDataSource;
    qryDrawbackIsencaoFila: TFDQuery;
    qryDrawbackIsencaoFilaNR_DUE: TStringField;
    dsEnviado: TDataSource;
    qryEnviado: TFDQuery;
    dsErro: TDataSource;
    qryErro: TFDQuery;
    qryErroNR_DUE: TStringField;
    qryErroSTR_RESPOSTA: TStringField;
    qryDataInclusao: TFDQuery;
    dsDataInclusao: TDataSource;
    DBGrid1: TDBGrid;
    qryEnviadoNR_DUE: TStringField;
    qryEnviadoIN_XML_GERADO: TBooleanField;
    qryEnviadoIN_XML_ENVIADO: TBooleanField;
    qryEnviadoIN_FILA: TBooleanField;
    qryEnviadoIN_ERRO: TBooleanField;
    qryEnviadoRESPOSTA: TMemoField;
    qryEnviadoSTR_RESPOSTA: TStringField;
    DBGrid3: TDBGrid;
    cmbDataInclusao: TComboBox;
    Label1: TLabel;
    DBGrid4: TDBGrid;
    Label5: TLabel;
    dsDrawbackIsencaoItens: TDataSource;
    qryDrawbackIsencaoItens: TFDQuery;
    qryDrawbackIsencaoItensNR_DUE: TStringField;
    qryDrawbackIsencaoItensNR_ITEM: TStringField;
    qryDrawbackIsencaoItensNR_ATO_CONCESSORIO: TStringField;
    qryDrawbackIsencaoItensQTD_ESTATISTICA: TStringField;
    qryDrawbackIsencaoItensTOTAL_MLE: TStringField;
    qryDrawbackIsencaoItensNCM: TStringField;
    qryDrawbackIsencaoItensCNPJ: TStringField;
    qryDrawbackIsencaoItensENQUADRAMENTO_1: TStringField;
    qryDrawbackIsencaoItensENQUADRAMENTO_2: TStringField;
    lblLinhasFila: TLabel;
    lblLinhasTransmitidos: TLabel;
    lblLinhasItens: TLabel;
    lblLinhasErro: TLabel;
    qryDataInclusaoDATA_INCLUSAO: TStringField;
    qryUpdateTransmissao: TFDQuery;
    chkCertificado: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTransmitirFilaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbDataInclusaoChange(Sender: TObject);
  private
    procedure AbrirQuerys(DataInclusao: String);
    function GerarXml: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIntegracaoDrawBackIsencao: TFrmIntegracaoDrawBackIsencao;

implementation

{$R *.dfm}

procedure TFrmIntegracaoDrawBackIsencao.btnTransmitirFilaClick(Sender: TObject);
var
  enderecoTransmissao: String;
  caminhoArquivo, CaminhoTransmitidos: String;
  arquivoTransmissao: TStringList;
  i: Integer;
  Resposta: String;
  ListaResposta: TStringList;
begin
  ListaResposta := TStringList.Create;
  if qryDrawbackIsencaoFila.RecordCount = 0 then
  begin
    ShowMessage('Não há itens para envio na data selecionada.');
    exit;
  end;

  CaminhoTransmitidos := (GetPath + 'Arquivos\Transmitidos\' + cmbDataInclusao.Text + '\');
  FileExistsForce(CaminhoTransmitidos);
  arquivoTransmissao := TStringList.Create;
  IntegradorWebServiceRest := TIntegradorWebServiceRest.Create;

  qryUpdateTransmissao.Close;

  qryDrawbackIsencaoFila.DisableControls;
  qryDrawbackIsencaoItens.DisableControls;
  try
    if IntegradorWebServiceRest.Conectar('https://portalunico.siscomex.gov.br/portal/api/autenticar', chkCertificado.ItemIndex) then
//    if true then
    begin
      qryDrawbackIsencaoFila.First;
      while not qryDrawbackIsencaoFila.Eof do
      begin
        inc(i,1);
        lblStatus1.Caption :=  'Transmitindo: ' + IntToStr(i) + ' / ' + IntToStr(qryDrawbackIsencaoFila.RecordCount) + ' itens' ;
        application.ProcessMessages;

        enderecoTransmissao := 'https://portalunico.siscomex.gov.br/due/api/ext/due/'+ qryDrawbackIsencaoFila.FieldByName('NR_DUE').AsString +'/ato-concessorio-isencao';

        if GerarXml then
        begin
          caminhoArquivo := (GetPath + 'Arquivos\' + qryDrawbackIsencaoFila.FieldByName('NR_DUE').AsString + '.xml');
          arquivoTransmissao.LoadFromFile(caminhoArquivo);

          qryUpdateTransmissao.ParamByName('NR_DUE').AsString := qryDrawbackIsencaoFila.FieldByName('NR_DUE').AsString;
          if IntegradorWebServiceRest.Transmitir(Resposta, enderecoTransmissao, arquivoTransmissao) then
//          if true then
          begin
            MoverArquivo(caminhoArquivo, CaminhoTransmitidos+'\' + qryDrawbackIsencaoFila.FieldByName('NR_DUE').AsString + '.xml');

            qryUpdateTransmissao.ParamByName('IN_XML_ENVIADO').AsBoolean := true;
            qryUpdateTransmissao.ParamByName('IN_ERRO').AsBoolean := false;
            qryUpdateTransmissao.ParamByName('IN_FILA').AsBoolean := false;
          end
          else
          begin
            qryUpdateTransmissao.ParamByName('IN_XML_ENVIADO').AsBoolean := false;
            qryUpdateTransmissao.ParamByName('IN_ERRO').AsBoolean := true;
            qryUpdateTransmissao.ParamByName('IN_FILA').AsBoolean := true;
          end;
          ListaResposta.Clear;
          ListaResposta.add(Resposta);
//          ListaResposta.SaveToFile(GetPath + 'Arquivos\Resposta_' + qryDrawbackIsencaoFila.FieldByName('NR_DUE').AsString + '.xml');
          qryUpdateTransmissao.ParamByName('RESPOSTA').AsString := Copy(Resposta, 0, 1000);
          qryUpdateTransmissao.ExecSQL;
        end
        else
        begin
          qryUpdateTransmissao.ParamByName('IN_XML_ENVIADO').AsBoolean := false;
          qryUpdateTransmissao.ParamByName('IN_ERRO').AsBoolean := true;
          qryUpdateTransmissao.ParamByName('IN_FILA').AsBoolean := true;
          qryUpdateTransmissao.ParamByName('RESPOSTA').AsString := 'Erro ao gerar o xml';
          qryUpdateTransmissao.ExecSQL;
        end;

        qryDrawbackIsencaoFila.Next;
      end;
    end
    else
      ShowMessage('Não foi possível conectar ao endereço: https://portalunico.siscomex.gov.br/portal/api/autenticar ');


    AbrirQuerys(cmbDataInclusao.Text);

  finally
    FreeAndNil(IntegradorWebServiceRest);
    FreeAndNil(arquivoTransmissao);
    FreeAndNil(ListaResposta);
    qryDrawbackIsencaoFila.EnableControls;
    qryDrawbackIsencaoItens.EnableControls;
  end;

end;

function TFrmIntegracaoDrawBackIsencao.GerarXml: Boolean;
var
  vStringXml: TStringList;
  vStringXmlitemTeste: TStringList;
  i: integer;
  vNomeArquivo: string;
  vStringItem: string;
  vStringItemWagner: string;
  vqtdDues: Integer;
begin
  FileExistsForce(GetPath + 'Arquivos\');
  vStringXml := TStringList.Create;
  vStringXmlitemTeste := TStringList.Create;
  try

    vStringXml.Clear;
    vStringXml.Add('<?xml version="1.0" encoding="UTF-8"?>');
    vStringXml.Add('<Declaration xmlns:ds="urn:wco:datamodel:WCO:GoodsDeclaration_DS:1" xmlns="urn:wco:datamodel:WCO:GoodsDeclaration:1" ');
    vStringXml.Add('xmlns:xsi="htt//www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:wco:datamodel:WCO:GoodsDeclaration:1 GoodsDeclaration_1p0_DUE.xsd ">');
    vStringXml.Add('<DeclarationDrawbackIsencao>');

    qryDrawbackIsencaoItens.Filter := 'NR_DUE = ' + QuotedStr(qryDrawbackIsencaoFilaNR_DUE.AsString);
    qryDrawbackIsencaoItens.Filtered := true;
    qryDrawbackIsencaoItens.first;

    while not qryDrawbackIsencaoItens.Eof do
    begin
//        lblStatus1.Caption :=  'Due: ' + dmMain.qryDueDraftIsencaoPrincipal.FieldByName('NR_DUE').AsString + ' com ' + IntToStr(dmMain.qryDueDraftIsencaiItens.RecordCount) + ' itens' ;
      application.ProcessMessages;

      vStringXml.Add('<GoodsShipment>');
      vStringXml.Add('<GovernmentAgencyGoodsItem>');
      vStringXml.Add('<SequenceNumeric>' + qryDrawbackIsencaoItens.FieldByName('NR_ITEM').AsString  + '</SequenceNumeric>');
      vStringXml.Add('<AdditionalDocument>');
      vStringXml.Add('<CategoryCode>DBI</CategoryCode>');
      vStringXml.Add('<ID>' + qryDrawbackIsencaoItens.FieldByName('NR_ATO_CONCESSORIO').AsString  + '</ID>');
      vStringXml.Add('<ItemID></ItemID>');
      vStringXml.Add('<QuantityQuantity>' + qryDrawbackIsencaoItens.FieldByName('QTD_ESTATISTICA').AsString  + '</QuantityQuantity>');
      vStringXml.Add('<ValueWithExchangeCoverAmount>' + qryDrawbackIsencaoItens.FieldByName('TOTAL_MLE').AsString  + '</ValueWithExchangeCoverAmount>');
      vStringXml.Add('<DrawbackHsClassification>' + qryDrawbackIsencaoItens.FieldByName('NCM').AsString  + '</DrawbackHsClassification>');
      vStringXml.Add('<DrawbackRecipientId>' + qryDrawbackIsencaoItens.FieldByName('CNPJ').AsString  + '</DrawbackRecipientId>');
      vStringXml.Add('</AdditionalDocument>');
      vStringXml.Add('<GovernmentProcedure>');
      vStringXml.Add('<CurrentCode>' + qryDrawbackIsencaoItens.FieldByName('ENQUADRAMENTO_1').AsString  + '</CurrentCode>');
      vStringXml.Add('</GovernmentProcedure>');
      vStringXml.Add('<GovernmentProcedure>');
      vStringXml.Add('<CurrentCode>' + qryDrawbackIsencaoItens.FieldByName('ENQUADRAMENTO_2').AsString  + '</CurrentCode>');
      vStringXml.Add('</GovernmentProcedure>');
      vStringXml.Add('</GovernmentAgencyGoodsItem>');
      vStringXml.Add('</GoodsShipment>');

      qryDrawbackIsencaoItens.Next;
    end;

    vStringXml.Add('</DeclarationDrawbackIsencao>');
    vStringXml.Add('</Declaration>');

    vNomeArquivo := GetPath + 'Arquivos\' + qryDrawbackIsencaoFila.FieldByName('NR_DUE').AsString + '.xml';
    vStringXml.SaveToFile(vNomeArquivo);
    sleep(1000);

    result := FileExists(vNomeArquivo);

  finally
    FreeAndNil(vStringXml);
  end;
end;

procedure TFrmIntegracaoDrawBackIsencao.cmbDataInclusaoChange(Sender: TObject);
begin
  AbrirQuerys(cmbDataInclusao.Text);
end;

procedure TFrmIntegracaoDrawBackIsencao.FormActivate(Sender: TObject);
begin
  qryDataInclusao.Open;
  qryDataInclusao.first;

  AbrirQuerys(qryDataInclusaoDATA_INCLUSAO.AsString);

  while not qryDataInclusao.Eof do
  begin
    cmbDataInclusao.Items.Add(qryDataInclusaoDATA_INCLUSAO.AsString);
    qryDataInclusao.Next;
  end;
  cmbDataInclusao.ItemIndex := 0;

end;

procedure TFrmIntegracaoDrawBackIsencao.AbrirQuerys(DataInclusao: String);
begin
  qryDrawbackIsencaoFila.Close;
  qryDrawbackIsencaoFila.Params[0].AsString := DataInclusao;
  qryDrawbackIsencaoFila.Open;
  lblLinhasFila.Caption := '(Linhas: ' + IntToStr(qryDrawbackIsencaoFila.RecordCount) + ')';

  qryDrawbackIsencaoItens.Close;
  qryDrawbackIsencaoItens.Params[0].AsString := DataInclusao;
  qryDrawbackIsencaoItens.Open;
  lblLinhasItens.Caption := '(Linhas: ' + IntToStr(qryDrawbackIsencaoItens.RecordCount) + ')';

  qryEnviado.Close;
  qryEnviado.ParamByName('DATA_INCLUSAO').AsString := DataInclusao;
  qryEnviado.Open;
  lblLinhasTransmitidos.Caption := '(Linhas: ' + IntToStr(qryEnviado.RecordCount) + ')';

  qryErro.Close;
  qryErro.Params[0].AsString := DataInclusao;
  qryErro.Open;
  lblLinhasErro.Caption := '(Linhas: ' + IntToStr(qryErro.RecordCount) + ')';

end;

procedure TFrmIntegracaoDrawBackIsencao.FormCreate(Sender: TObject);
begin
  dmMain := TdmMain.Create(self);
end;

procedure TFrmIntegracaoDrawBackIsencao.FormDestroy(Sender: TObject);
begin
  if assigned(dmMain) then
    FreeAndNil(dmMain);
end;

end.
