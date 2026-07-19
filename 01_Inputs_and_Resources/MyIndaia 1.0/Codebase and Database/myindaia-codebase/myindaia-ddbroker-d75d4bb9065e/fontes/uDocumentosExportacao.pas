unit uDocumentosExportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type

  TRelatorio = (trFaturaComercial, trPackingList);

  TfrmDocumentosExportacao = class(TForm)
    pnlTitulo: TPanel;
    SpeedButton1: TSpeedButton;
    lblNomeRelatorio: TLabel;
    pgPrincipal: TPageControl;
    tbProcesso: TTabSheet;
    lblNrProcesso: TLabel;
    lblUnidadeNeg: TLabel;
    Label2: TLabel;
    edtNrProcesso: TEdit;
    edUnidade: TEdit;
    cbUnidade: TDBLookupComboBox;
    edtProduto: TEdit;
    cbProduto: TDBLookupComboBox;
    pgDocumentos: TPageControl;
    tbsFaturaComercial: TTabSheet;
    tbsPackingList: TTabSheet;
    rgIdiomaFaturaComercial: TRadioGroup;
    pnlGerarRelatorio: TPanel;
    btnGerarRelatorio: TSpeedButton;
    rgIdiomaPackingList: TRadioGroup;
    rgTipoFatura: TRadioGroup;
    procedure edUnidadeExit(Sender: TObject);
    procedure edUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUnidadeCloseUp(Sender: TObject);
    procedure cbUnidadeExit(Sender: TObject);
    procedure cbUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoExit(Sender: TObject);
    procedure cbProdutoCloseUp(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure cbProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    path : String;
  procedure GerarRelatorio(tipoImpressao : String);
  procedure GeraPackingList(nr_processo,tipoImpressao : String);
  procedure GeraFaturaComercial(nr_processo,tipoImpressao : String);
  procedure PreencherCodigoUnidadeNeg;
  procedure PreencherCodigoProduto;
  procedure BuscarCodigoProduto;
  procedure BuscarCodigoUnidadeNeg;
  procedure ValidaNrProcesso;
    function GetGrupo(value: String): string;

  public
    { Public declarations }
    TipoRelatorio : TRelatorio;
  end;

var
  frmDocumentosExportacao: TfrmDocumentosExportacao;

implementation

uses
  udatm_DocumentosExportacao, uFaturaComercialPetronas, uPackingListPetronas,
  uPackingListApolo, uFaturaComercialApolo;

{$R *.dfm}

procedure TfrmDocumentosExportacao.edUnidadeExit(Sender: TObject);
begin
BuscarCodigoUnidadeNeg;
end;

procedure TfrmDocumentosExportacao.edUnidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoUnidadeNeg;
  end;
end;

procedure TfrmDocumentosExportacao.cbUnidadeCloseUp(Sender: TObject);
begin
PreencherCodigoUnidadeNeg;
end;

procedure TfrmDocumentosExportacao.cbUnidadeExit(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TfrmDocumentosExportacao.cbUnidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbUnidade.KeyValue := '';
end;

procedure TfrmDocumentosExportacao.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoProduto;
  end;
end;

procedure TfrmDocumentosExportacao.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto;
end;

procedure TfrmDocumentosExportacao.cbProdutoCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmDocumentosExportacao.cbProdutoExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmDocumentosExportacao.cbProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbProduto.KeyValue := '';
end;

procedure TfrmDocumentosExportacao.PreencherCodigoUnidadeNeg;
begin
  if not ((cbUnidade.KeyValue = '') or (cbUnidade.KeyValue = null)) then
    edUnidade.Text := datm_DocumentosExportacao.cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    edUnidade.Text := '';
end;

procedure TfrmDocumentosExportacao.PreencherCodigoProduto;
begin
 if not ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null)) then
    edtProduto.Text := datm_DocumentosExportacao.cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    edtProduto.Text := '';
end;

procedure TfrmDocumentosExportacao.BuscarCodigoProduto;
begin
  if datm_DocumentosExportacao.cdsProduto.Locate('CD_PRODUTO', edtProduto.Text, []) then
     cbProduto.KeyValue := datm_DocumentosExportacao.cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    cbProduto.KeyValue := '';
end;

procedure TfrmDocumentosExportacao.BuscarCodigoUnidadeNeg;
begin
  if datm_DocumentosExportacao.cdsUnidadeNeg.Locate('CD_UNID_NEG', edUnidade.Text, []) then
     cbUnidade.KeyValue := datm_DocumentosExportacao.cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    cbUnidade.KeyValue := '';
end;

procedure TfrmDocumentosExportacao.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmDocumentosExportacao.ValidaNrProcesso;
begin
  if (trim(edtNrProcesso.text) = '') or
     ((cbUnidade.KeyValue = '') or (cbUnidade.KeyValue = null)) or
     ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null))
  then
  begin
    ShowMessage('Preencha os filtros corretamente.');
    abort;
  end;
end;

procedure TfrmDocumentosExportacao.FormCreate(Sender: TObject);
begin
  Application.CreateForm(tdatm_DocumentosExportacao, datm_DocumentosExportacao );

  datm_DocumentosExportacao.cdsUnidadeNeg.close;
  datm_DocumentosExportacao.cdsUnidadeNeg.open;
  datm_DocumentosExportacao.cdsProduto.close;
  datm_DocumentosExportacao.cdsProduto.open;

  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'TEMP\') then
    CreateDir(path + 'TEMP\');
end;

procedure TfrmDocumentosExportacao.FormShow(Sender: TObject);
var i : integer;
begin
  for i := 0 to pgDocumentos.PageCount -1 do
  begin
    pgDocumentos.pages[i].TabVisible := false;
  end;

  if TipoRelatorio = trFaturaComercial then
  begin
    pgDocumentos.ActivePageIndex   := 0;
    pgDocumentos.visible           := true;
  end
  else
  if TipoRelatorio = TipoRelatorio then
  begin
    pgDocumentos.ActivePageIndex   := 1;
    pgDocumentos.visible           := true;
  end;
end;

procedure TfrmDocumentosExportacao.btnGerarRelatorioClick(Sender: TObject);
begin
  GerarRelatorio('Tela');
end;

procedure TfrmDocumentosExportacao.GerarRelatorio(tipoImpressao : String);
var
  nr_processo : string;
begin
  ValidaNrProcesso;
  nr_processo :=  cbUnidade.KeyValue + cbProduto.KeyValue +  trim(edtNrProcesso.text);

  case TipoRelatorio of
    trFaturaComercial :
      GeraFaturaComercial(nr_processo, tipoImpressao);
    trPackingList :
      GeraPackingList(nr_processo, tipoImpressao);
  end;
end;

procedure TfrmDocumentosExportacao.GeraPackingList(nr_processo, tipoImpressao : String);
var
  NomeArquivo : string;
begin

  if GetGrupo(nr_processo) = 'C53' then
  begin
    try
      frmPackingListApolo := tfrmPackingListApolo.Create(nil);

      if frmPackingListApolo.PrepararRelatorio(nr_processo, rgIdiomaPackingList.itemindex) then
      begin
        NomeArquivo := path + 'PL_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmPackingListApolo.RLPDFFilter1.FileName := NomeArquivo;

        if TipoImpressao = 'Tela' then
          frmPackingListApolo.RLReport1.PreviewModal
        else
        if TipoImpressao = 'Email' then
        begin
          frmPackingListApolo.RLReport1.SaveToFile(NomeArquivo);
          //EnviarEmail(NomeArquivo);
        end;
      end
      else
        ShowMessage('Não foram encontrados resultados para a consulta.');
    finally
      FreeAndNil(frmPackingListApolo);
    end;
  end else
  begin
    try
      frmPackingListPetronas := tfrmPackingListPetronas.Create(nil);

      if frmPackingListPetronas.PrepararRelatorio(nr_processo, rgIdiomaPackingList.itemindex) then
      begin
        NomeArquivo := path + 'PL_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmPackingListPetronas.RLPDFFilter1.FileName := NomeArquivo;

        if TipoImpressao = 'Tela' then
          frmPackingListPetronas.RLReport1.PreviewModal
        else
        if TipoImpressao = 'Email' then
        begin
          frmPackingListPetronas.RLReport1.SaveToFile(NomeArquivo);
          //EnviarEmail(NomeArquivo);
        end;
      end
      else
        ShowMessage('Não foram encontrados resultados para a consulta.');
    finally
      FreeAndNil(frmPackingListPetronas);
    end;
  end;
end;

procedure TfrmDocumentosExportacao.GeraFaturaComercial(nr_processo, tipoImpressao : String);
var
  NomeArquivo : string;
begin

  if GetGrupo(nr_processo) = 'C53' then
  begin
    try
      frmFaturaComercialApolo := tfrmFaturaComercialApolo.Create(nil);

      if frmFaturaComercialApolo.PrepararRelatorio(nr_processo, rgIdiomaFaturaComercial.itemindex, rgTipoFatura.ItemIndex) then
      begin
        NomeArquivo := path + 'FAT_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmFaturaComercialApolo.RLPDFFilter1.FileName := NomeArquivo;

        if TipoImpressao = 'Tela' then
          frmFaturaComercialApolo.RLReport1.PreviewModal
        else
        if TipoImpressao = 'Email' then
        begin
          frmFaturaComercialApolo.RLReport1.SaveToFile(NomeArquivo);
          //EnviarEmail(NomeArquivo);
        end;
      end
      else
        ShowMessage('Não foram encontrados resultados para a consulta.');
    finally
      FreeAndNil(frmFaturaComercialPetronas);
    end;
  end
  else
  begin
    try
      frmFaturaComercialPetronas := tfrmFaturaComercialPetronas.Create(nil);

      if frmFaturaComercialPetronas.PrepararRelatorio(nr_processo, rgIdiomaFaturaComercial.itemindex, rgTipoFatura.ItemIndex) then
      begin
        NomeArquivo := path + 'FAT_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmFaturaComercialPetronas.RLPDFFilter1.FileName := NomeArquivo;

        if TipoImpressao = 'Tela' then
          frmFaturaComercialPetronas.RLReport1.PreviewModal
        else
        if TipoImpressao = 'Email' then
        begin
          frmFaturaComercialPetronas.RLReport1.SaveToFile(NomeArquivo);
          //EnviarEmail(NomeArquivo);
        end;
      end
      else
        ShowMessage('Não foram encontrados resultados para a consulta.');
    finally
      FreeAndNil(frmFaturaComercialPetronas);
    end;
  end;
end;

function TfrmDocumentosExportacao.GetGrupo(value: String): string;
begin
  datm_DocumentosExportacao.qryGrupo.Close;
  datm_DocumentosExportacao.qryGrupo.SQL.Text := 'SELECT CD_GRUPO FROM TPROCESSO WHERE NR_PROCESSO = ' + QuotedStr(value);
  datm_DocumentosExportacao.qryGrupo.Open;
  Result := datm_DocumentosExportacao.qryGrupo.FieldByName('CD_GRUPO').AsString;
end;

procedure TfrmDocumentosExportacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(datm_DocumentosExportacao);
end;

end.

