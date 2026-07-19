unit uImportarPlanilhaItensDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, comobj,
  DBTables, ComCtrls;

type
  TfrmImportarPlanilhaItensDI = class(TForm)
    Panel1: TPanel;
    cdsPlanilha: TClientDataSet;
    dsPlanilha: TDataSource;
    dsMercadorias: TDataSource;
    cdsItensDI: TClientDataSet;
    OpenDialog1: TOpenDialog;
    Panel6: TPanel;
    edtCaminho: TEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    btnImportar: TSpeedButton;
    Panel3: TPanel;
    btnImportarItens: TSpeedButton;
    dsItensDI: TDataSource;
    cdsMercadorias: TClientDataSet;
    btnSair: TSpeedButton;
    cdsPlanilhaCodigo_Principal: TStringField;
    cdsPlanilhaCodigo_Secundario: TStringField;
    cdsPlanilhaDescricao_Resumida_Produto: TStringField;
    cdsPlanilhaUnidade_Medida: TStringField;
    cdsPlanilhaNcm: TStringField;
    cdsPlanilhaQuantidade: TStringField;
    cdsPlanilhaPeso_Liquido_Unitario: TStringField;
    cdsPlanilhaPeso_Bruto_Unitario: TStringField;
    cdsPlanilhaCodigo_Exportador: TStringField;
    cdsPlanilhaDescricao_Portugues: TStringField;
    cdsPlanilhaValor_Unitario_Item: TStringField;
    cdsPlanilhaDestaque_Anuencia: TStringField;
    cdsPlanilhaCodigo_Fabricante: TStringField;
    cdsPlanilhaPais_Origem: TStringField;
    cdsPlanilhaNve: TStringField;
    cdsPlanilhaDescricao_Produto_Nf: TStringField;
    cdsPlanilhaFatura: TStringField;
    cdsPlanilhaQuebra_Aux: TStringField;
    cdsPlanilhaVazio1: TStringField;
    cdsPlanilhaVazio2: TStringField;
    cdsPlanilhaMoeda: TStringField;
    cdsPlanilhaArea: TStringField;
    cdsPlanilhaNecessita_Li: TStringField;
    cdsPlanilhaOrdem_Compra: TStringField;
    cdsPlanilhaCodigo_Gtin_Ean: TStringField;
    cdsPlanilhaData_Invoice: TStringField;
    cdsPlanilhaPais_Aquisicao: TStringField;
    cdsPlanilhaAplic_Mercadoria: TStringField;
    cdsPlanilhaAplic_Merc_Descricao: TStringField;
    cdsPlanilhaIncoterm: TStringField;
    cdsPlanilhaForma_Pagamento: TStringField;
    cdsPlanilhaIcms: TStringField;
    cdsPlanilhaRecolhimento_Icms: TStringField;
    cdsPlanilhaMva: TStringField;
    cdsMercadoriasCD_MERCADORIA: TStringField;
    cdsMercadoriasAP_MERCADORIA: TStringField;
    cdsMercadoriasCD_UN_MED_COMERC: TStringField;
    cdsMercadoriasCD_NCM_SH: TStringField;
    cdsMercadoriasNM_MERCADORIA: TStringField;
    cdsMercadoriasNR_DESTAQUE_NCM: TStringField;
    cdsMercadoriasIN_NECESSITA_LI: TStringField;
    cdsMercadoriasPC_ICMS: TFloatField;
    cdsMercadoriasCD_TRIBUTACAO_ICMS: TStringField;
    cdsMercadoriasAREA: TStringField;
    cdsMercadoriasIN_TIPO_M_E: TStringField;
    cdsNVE: TClientDataSet;
    dsNVE: TDataSource;
    cdsNVECD_MERCADORIA: TStringField;
    cdsNVECD_NCM_ATRIBUTO: TStringField;
    cdsNVECD_NCM_ESPECIF: TStringField;
    cdsNVECD_NIVEL_NVE: TStringField;
    cdsNVECD_ATRIBUTO_NCM: TStringField;
    cdsNVECD_ESPECIF_NCM: TStringField;
    cdsItensDICD_MERCADORIA: TStringField;
    cdsItensDICD_UN_MED_COMERC: TStringField;
    cdsItensDICD_NCM_SH: TStringField;
    cdsItensDIQT_MERC_UN_COMERC: TFloatField;
    cdsItensDICD_EXPORTADOR: TStringField;
    cdsItensDITX_DESC_DET_MERC: TStringField;
    cdsItensDIVL_UNITARIO: TFloatField;
    cdsItensDINR_DESTAQUE_NCM: TStringField;
    cdsItensDICD_FABRICANTE: TStringField;
    cdsItensDICD_PAIS_ORIGEM: TStringField;
    cdsItensDINM_EXPORTADOR: TStringField;
    cdsItensDIDS_UNID_MEDIDA: TStringField;
    cdsPlanilhaID: TIntegerField;
    cdsItensDIID: TIntegerField;
    cdsMercadoriasID: TIntegerField;
    cdsNVEID: TIntegerField;
    cdsNVEDS_MERCADORIA: TStringField;
    pgDados: TPageControl;
    tbsPlanilha: TTabSheet;
    tbsMercadoria: TTabSheet;
    tbsItens: TTabSheet;
    tbsNVE: TTabSheet;
    dbgridMercadorias: TDBGrid;
    nilha: TDBGrid;
    dbgridNVE: TDBGrid;
    dbgridPlanilha: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    lblTotalPlan: TLabel;
    lblTotalItens: TLabel;
    lblTotalMercadorias: TLabel;
    lblTotalNVE: TLabel;
    cdsUnidadesMedida: TClientDataSet;
    dsUnidadesMedida: TDataSource;
    cdsUnidadesMedidaCOD_CLIENTE: TStringField;
    cdsUnidadesMedidaNOME: TStringField;
    cdsUnidadesMedidaCOD_BROKER: TStringField;
    cdsItensDINM_FABRICANTE: TStringField;
    cdsItensDINM_PAIS_ORIGEM: TStringField;
    cdsItensDICD_MOEDA_NEGOCIADA: TStringField;
    cdsItensDICD_INCOTERMS_VENDA: TStringField;
    cdsItensDIPC_ICMS: TFloatField;
    tbsResultado: TTabSheet;
    rMemo: TRichEdit;
    qryTemp: TQuery;
    lblNrProcesso: TLabel;
    lblGrupo: TLabel;
    cdsItensDICD_FABRICANTE_CLI: TStringField;
    cdsItensDICD_EXPORTADOR_CLI: TStringField;
    ProgressBar1: TProgressBar;
    lblInfo: TLabel;
    lblCliente: TLabel;
    cdsItensDINR_ORDEM: TStringField;
    cdsItensDINR_FATURA: TStringField;
    qryItensInseridos: TQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImportarItensClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rMemoChange(Sender: TObject);
  private
    { Private declarations }
  procedure CarregarPlanilha;
  procedure CarregarItens;
  procedure CarregarMercadorias;
  procedure CarregarNVEs;
  procedure popularUnidadeMedida;
  function Distinct(CDS: TClientDataSet; FieldName: string): TStringList;
  procedure AbrirQueryItensInseridos;  
  procedure IniciarProgressBar(total : integer);
  procedure AtualizaProgress;  

  function SqlInsertMercadoria : String;
  function SqlInsertNVEMercadoria : string;
  function SqlInsertDetalheMercadoria : String;
  function SqlInsertDINVE : String;
  function SqlInsertRefCliente : String;
  function SqlDeleteTDETALHE_MERCADORIA : String;
  function SqlDeleteTDI_NVE : String;
  function SqlDeleteTADICAO_DE_IMPORTACAO : String;
  function SqlDeleteTREF_CLIENTE : String;  
  function SqlUpdateTADICAO_DE_IMPORTACAO : String;
  function SqlConsultaNVE : String;
  function SqlConsultaMercadoria : String;
  function SqlConsultaMercadoriaSemNCM : String;
  function SqlConsultaAdicao : String;
  function SqlConsultaItensInseridos : String;
  function SqlConsultaNVEDetalheMercadoria : String;

  procedure ImportarMercadorias;
  procedure ImportarNVEMercadorias;
  procedure ImportarDetalheMercadoria;
  procedure ImportarDetalheMercadoriaNVE;
  procedure ImportarReferencia(NrOrdem, ItemCliente : String; ItemParcial :Integer);

  procedure LimparTabelasDI;
  procedure LimparReferencias;

  procedure CriarAdicaoItem(Mercadoria, NCM : String);
  procedure InserirNVEDI(descMercadoria, item, adicao, nivel, atributo, espcificacao , ncm : string);  
  procedure AtualizarIncotermMoedaAdicao;
  function VerificaNVEMercadoriaCadastrado(CodMercadoria, Nivel, Atributo, Especificacao : String) : Boolean;
  function VerificaNVEDetalheMercadoriaCadastrado(NrItem, NrAdicao, Nivel, Atributo, Especificacao,  NCM : String) : Boolean;
  procedure DefineParamType(var Query : TQuery);
  procedure DefineDataTypeString(var Query : TQuery);
  procedure Log(msg : String);
  procedure EnviarEmailLog;  

  public
    { Public declarations }

  end;
  const REF_PEDIDO = '01';
var
  frmImportarPlanilhaItensDI: TfrmImportarPlanilhaItensDI;

implementation

uses
  ConsOnLineEx, PGGP017, PGDI020, GSMLIB;

{$R *.dfm}

procedure TfrmImportarPlanilhaItensDI.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtCaminho.text := OpenDialog1.FileName;
end;

procedure TfrmImportarPlanilhaItensDI.CarregarPlanilha;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, id, c: Integer;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    vPlanilhaExcel.WorkBooks.Add(edtCaminho.text);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i  := 2;
    id := 0;
    cdsPlanilha.DisableControls;
    cdsPlanilha.EmptyDataSet;
    try
      while vSheet.Cells[I, 1].Value <> '' do
      begin
        inc(id);
        cdsPlanilha.Append;
        cdsPlanilhaid.value                         := id;
        cdsPlanilhaCODIGO_PRINCIPAL.value           := vSheet.Cells[i,1].value;
        cdsPlanilhaCODIGO_SECUNDARIO.value          := vSheet.Cells[i,2].value;
        cdsPlanilhaDESCRICAO_RESUMIDA_PRODUTO.value := vSheet.Cells[i,3].value;
        cdsPlanilhaUNIDADE_MEDIDA.value             := vSheet.Cells[i,4].value;
        cdsPlanilhaNCM.value                        := vSheet.Cells[i,5].value;
        cdsPlanilhaQUANTIDADE.value                 := vSheet.Cells[i,6].value;
        cdsPlanilhaPESO_LIQUIDO_UNITARIO.value      := vSheet.Cells[i,7].value;
        cdsPlanilhaPESO_BRUTO_UNITARIO.value        := vSheet.Cells[i,8].value;
        cdsPlanilhaCODIGO_EXPORTADOR.value          := vSheet.Cells[i,9].value;
        cdsPlanilhaDESCRICAO_PORTUGUES.value        := vSheet.Cells[i,10].value;
        cdsPlanilhaVALOR_UNITARIO_ITEM.value        := vSheet.Cells[i,11].value;
        cdsPlanilhaDESTAQUE_ANUENCIA.value          := vSheet.Cells[i,12].value;
        cdsPlanilhaCODIGO_FABRICANTE.value          := vSheet.Cells[i,13].value;
        cdsPlanilhaPAIS_ORIGEM.value                := vSheet.Cells[i,14].value;
        cdsPlanilhaNVE.value                        := vSheet.Cells[i,15].value;
        cdsPlanilhaDESCRICAO_PRODUTO_NF.value       := vSheet.Cells[i,16].value;
        cdsPlanilhaFATURA.value                     := vSheet.Cells[i,17].value;
        cdsPlanilhaQUEBRA_AUX.value                 := vSheet.Cells[i,18].value;
        cdsPlanilhaVAZIO1.value                     := vSheet.Cells[i,19].value;
        cdsPlanilhaVAZIO2.value                     := vSheet.Cells[i,20].value;
        cdsPlanilhaMOEDA.value                      := vSheet.Cells[i,21].value;
        cdsPlanilhaAREA.value                       := vSheet.Cells[i,22].value;
        cdsPlanilhaNECESSITA_LI.value               := Uppercase(vSheet.Cells[i,23].value);
        cdsPlanilhaORDEM_COMPRA.value               := vSheet.Cells[i,24].value;
        cdsPlanilhaCODIGO_GTIN_EAN.value            := vSheet.Cells[i,25].value;
        cdsPlanilhaDATA_INVOICE.value               := vSheet.Cells[i,26].value;
        cdsPlanilhaPAIS_AQUISICAO.value             := vSheet.Cells[i,27].value;
        cdsPlanilhaAPLIC_MERCADORIA.value           := vSheet.Cells[i,28].value;
        case strtoint(trim(cdsPlanilhaAPLIC_MERCADORIA.asstring)) of
          1 : cdsPlanilhaAPLIC_MERC_DESCRICAO.value := 'MATERIA PRIMA';
          2 : cdsPlanilhaAPLIC_MERC_DESCRICAO.value := 'REVENDA';
          3 : cdsPlanilhaAPLIC_MERC_DESCRICAO.value := 'ATIVO IMOBILIZADO';
          4 : cdsPlanilhaAPLIC_MERC_DESCRICAO.value := 'AMOSTRA';
          5 : cdsPlanilhaAPLIC_MERC_DESCRICAO.value := 'USO/CONSUMO';
        else cdsPlanilhaAPLIC_MERC_DESCRICAO.value  := 'NÃO LOCALIZADO';
        end;
        cdsPlanilhaRECOLHIMENTO_ICMS.value          := vSheet.Cells[i,29].value;
        cdsPlanilhaINCOTERM.value                   := vSheet.Cells[i,30].value;
        cdsPlanilhaFORMA_PAGAMENTO.value            := vSheet.Cells[i,31].value;
        cdsPlanilhaICMS.value                       := vSheet.Cells[i,32].value;
        cdsPlanilhaMVA.value                        := vSheet.Cells[i,33].value;
        cdsPlanilha.post;

        Inc(i, 1);
      end;
    finally
      cdsPlanilha.First;
      cdsPlanilha.EnableControls;
      lblTotalPlan.Caption := 'Total :' + inttostr(id);
    end;
  finally
    vPlanilhaExcel.WorkBooks.Close;
  end;
end;
procedure TfrmImportarPlanilhaItensDI.FormCreate(Sender: TObject);
begin
  cdsPlanilha.CreateDataSet;
  cdsItensDI.CreateDataSet;
  cdsMercadorias.CreateDataSet;
  cdsNVE.CreateDataSet;
  cdsUnidadesMedida.CreateDataSet;
  popularUnidadeMedida;
  lblInfo.caption := '';
  pgDados.ActivePage := tbsPlanilha;  

  Application.CreateForm( Tdatm_DI_Itens, datm_DI_Itens );
end;

procedure TfrmImportarPlanilhaItensDI.btnImportarClick(
  Sender: TObject);
begin
  try
    btnImportarItens.enabled := false;    
    CarregarPlanilha;
    CarregarItens;
    CarregarMercadorias;
    CarregarNVEs;
  finally
    btnImportarItens.enabled := true;
  end;
end;

procedure TfrmImportarPlanilhaItensDI.CarregarItens;
var id : integer;
 Exportador, Fabricante , FabricantePais:string;
begin
  try
    cdsPlanilha.DisableControls;
    cdsItensDI.DisableControls;

    id := 0;
    cdsItensDI.EmptyDataSet;
    cdsPlanilha.first;
    while not cdsPlanilha.Eof do
    begin
      inc(id);
      cdsItensDI.Append;
      cdsItensDIid.value                  := id;
      cdsItensDICD_MERCADORIA.value       := cdsPlanilhaCODIGO_PRINCIPAL.value;
      cdsItensDITX_DESC_DET_MERC.value    := cdsPlanilhaDESCRICAO_PORTUGUES.value;
      cdsItensDICD_NCM_SH.value           := cdsPlanilhaNCM.Value;
      cdsItensDIQT_MERC_UN_COMERC.value   := strtofloat(cdsPlanilhaQUANTIDADE.value);
      cdsItensDICD_MOEDA_NEGOCIADA.Value  := cdsPlanilhaMOEDA.value;
      cdsItensDICD_INCOTERMS_VENDA.value  := cdsPlanilhaINCOTERM.value;
      cdsItensDIPC_ICMS.value             := strtofloat(cdsPlanilhaICMS.value);
      cdsItensDINR_ORDEM.value            := cdsPlanilhaOrdem_Compra.asstring;
      cdsItensDINR_FATURA.value           := cdsPlanilhaFATURA.asstring;

      if cdsUnidadesMedida.locate('COD_CLIENTE', trim(cdsPlanilhaUNIDADE_MEDIDA.asstring), [loCaseInsensitive]) then
      begin
        cdsItensDICD_UN_MED_COMERC.value  := cdsUnidadesMedidaCOD_BROKER.asstring;
        cdsItensDIDS_UNID_MEDIDA.value    := cdsUnidadesMedidaNOME.asstring;
      end
      else
      begin
        cdsItensDICD_UN_MED_COMERC.value  := '';
        cdsItensDIDS_UNID_MEDIDA.value    := '';
      end;

      cdsItensDICD_EXPORTADOR_CLI.value   := cdsPlanilhaCODIGO_EXPORTADOR.value;
      Exportador := ConsultaLookUPMaisCampos('TEMPRESA_EST','NR_CLIENTE',cdsPlanilhaCODIGO_EXPORTADOR.value,' CD_EMPRESA, NM_EMPRESA ');
      if Exportador <> '||' then
      begin
        cdsItensDICD_EXPORTADOR.value     := copy(Exportador, 1, Pos('|',Exportador)-1);
        cdsItensDINM_EXPORTADOR.value     := copy(Exportador, Pos('|',Exportador)+ 1, length(Exportador)-1);
      end;

      cdsItensDIVL_UNITARIO.value       := strtofloat(cdsPlanilhaVALOR_UNITARIO_ITEM.value);
      cdsItensDINR_DESTAQUE_NCM.value   := cdsPlanilhaDESTAQUE_ANUENCIA.Value;

      cdsItensDICD_FABRICANTE_CLI.value := cdsPlanilhaCodigo_Fabricante.value;
      Fabricante   := ConsultaLookUPMaisCampos('TEMPRESA_EST','NR_CLIENTE',cdsPlanilhaCodigo_Fabricante.value,' CD_EMPRESA, NM_EMPRESA , CD_PAIS');
      if Fabricante <> '|||' then
      begin
        cdsItensDICD_FABRICANTE.value    := copy(Fabricante, 1, Pos('|', fabricante) -1);
        cdsItensDINM_FABRICANTE.value    := copy(Fabricante, Pos('|', fabricante) +1,Pos('|',copy( fabricante, Pos('|', fabricante) +1, length(fabricante)-1))-1);
        cdsItensDICD_PAIS_ORIGEM.value   := copy( copy( fabricante, Pos('|', fabricante) +1, length(fabricante)-1),
                                            Pos('|',copy( fabricante, Pos('|', fabricante) +1, length(fabricante)-1))+1,
                                            length(copy( fabricante, Pos('|', fabricante) +1, length(fabricante)-1))-1);
        FabricantePais                   := ConsultaLookUP('TPAIS_BROKER','CD_PAIS',cdsItensDICD_PAIS_ORIGEM.value,'NM_PAIS');
        cdsItensDINM_PAIS_ORIGEM.value   := FabricantePais;
      end;
      
      cdsItensDI.post;
      cdsPlanilha.next;
    end;
  finally
    cdsPlanilha.first;
    cdsPlanilha.EnableControls;
    cdsItensDI.First;
    cdsItensDI.EnableControls;
    lblTotalItens.Caption := 'Total :' + inttostr(id);
  end;
end;

procedure TfrmImportarPlanilhaItensDI.CarregarMercadorias;
var id : integer;
begin
  try
    cdsPlanilha.DisableControls;
    cdsMercadorias.DisableControls;

    id := 0;
    cdsMercadorias.EmptyDataSet;
    cdsPlanilha.first;
    while not cdsPlanilha.Eof do
    begin
      if not cdsMercadorias.Locate('CD_MERCADORIA;CD_NCM_SH',
                                   VarArrayOf([cdsPlanilhaCODIGO_PRINCIPAL.value,cdsPlanilhaNCM.Value]), [loCaseInsensitive]) then
      begin
        inc(id);
        cdsMercadorias.Append;
        cdsMercadoriasid.value                 := id;
        cdsMercadoriasCD_MERCADORIA.value      := cdsPlanilhaCODIGO_PRINCIPAL.value;
        cdsMercadoriasAP_MERCADORIA.value      := cdsPlanilhaCODIGO_PRINCIPAL.value;
        cdsMercadoriasCD_UN_MED_COMERC.value   := cdsPlanilhaUNIDADE_MEDIDA.value;
        cdsMercadoriasCD_NCM_SH.Value          := cdsPlanilhaNCM.Value;
        cdsMercadoriasNM_MERCADORIA.Value      := cdsPlanilhaDESCRICAO_PORTUGUES.value;
        cdsMercadoriasNR_DESTAQUE_NCM.Value    := cdsPlanilhaDESTAQUE_ANUENCIA.Value;
        cdsMercadoriasIN_NECESSITA_LI.Value    := cdsPlanilhaNECESSITA_LI.value;   
        cdsMercadoriasPC_ICMS.Value            := strtofloat(cdsPlanilhaICMS.value);
        cdsMercadoriasCD_TRIBUTACAO_ICMS.Value := cdsPlanilhaRECOLHIMENTO_ICMS.value;
        cdsMercadoriasAREA.Value               := '58';

        case strtoint(trim(cdsPlanilhaAPLIC_MERCADORIA.asstring)) of
          1 : cdsMercadoriasIN_TIPO_M_E.value := 'M';
          2 : cdsMercadoriasIN_TIPO_M_E.value := 'R';
          3 : cdsMercadoriasIN_TIPO_M_E.value := 'A';
          4 : cdsMercadoriasIN_TIPO_M_E.value := 'O';
          5 : cdsMercadoriasIN_TIPO_M_E.value := 'C';
        else  cdsMercadoriasIN_TIPO_M_E.value := '';
        end;
        cdsMercadorias.post;
      end;
      cdsPlanilha.next;
    end;
  finally
    cdsPlanilha.first;
    cdsPlanilha.EnableControls;
    cdsMercadorias.First;
    cdsMercadorias.EnableControls;
    lblTotalMercadorias.Caption := 'Total :' + inttostr(id);
  end;
end;

procedure TfrmImportarPlanilhaItensDI.CarregarNVEs;
var NVE : String;
ListaNVE : tstringlist;
ListaNVE_Item : tstringlist;
i ,id: integer;
begin
  try
    cdsPlanilha.DisableControls;
    cdsNVE.DisableControls;

    id := 0;
    ListaNVE := TStringList.Create;
    ListaNVE_Item := TStringList.CREATE;

    cdsNVE.EmptyDataSet;
    cdsPlanilha.first;
    while not cdsPlanilha.Eof do
    begin
      NVE := cdsPlanilhaNVE.AsString;
      ListaNVE.clear;
      ExtractStrings(['/'],[], PChar(NVE), ListaNVE);
      for i := 0 to ListaNVE.Count -1 do
      begin
        ListaNVE_Item.CLEAR;
        ExtractStrings([','],[], PChar(ListaNVE[i]), ListaNVE_Item);
        if listaNVE_ITEM.count = 3 then //tem os 3 campos, então está completo
        begin
          if not cdsNVE.Locate('CD_MERCADORIA;CD_NCM_ATRIBUTO;CD_NIVEL_NVE;CD_ATRIBUTO_NCM;CD_ESPECIF_NCM',
                               VarArrayOf([cdsPlanilhaCODIGO_PRINCIPAL.value,
                               cdsPlanilhaNCM.Value,listaNVE_ITEM[0],listaNVE_ITEM[1],listaNVE_ITEM[2]]),[loCaseInsensitive]) then
          begin
            inc(id);
            cdsNVE.Append;
            cdsNVEid.value              := id;
            cdsNVECD_MERCADORIA.value   := cdsPlanilhaCODIGO_PRINCIPAL.value;
            cdsNVEDS_MERCADORIA.value   := cdsPlanilhaDescricao_Portugues.value;
            cdsNVECD_NCM_ATRIBUTO.value := cdsPlanilhaNCM.Value;
            cdsNVECD_NCM_ESPECIF.value  := cdsPlanilhaNCM.Value;
            cdsNVECD_NIVEL_NVE.value    := listaNVE_ITEM[0];
            cdsNVECD_ATRIBUTO_NCM.value := listaNVE_ITEM[1];
            cdsNVECD_ESPECIF_NCM.value  := listaNVE_ITEM[2];
            cdsNVE.post;
          end;
        end;
      end;   
      cdsPlanilha.next;
    end;
  finally
    ListaNVE.Free;
    ListaNVE_Item.free;
    cdsPlanilha.First;
    cdsPlanilha.EnableControls;
    cdsNVE.First;
    cdsNVE.EnableControls;
    lblTotalNVE.Caption := 'Total :' + inttostr(id);
  end;
end;

procedure TfrmImportarPlanilhaItensDI.btnImportarItensClick(Sender: TObject);
begin
  pgDados.ActivePage := tbsResultado;
  IniciarProgressBar(0);
  rMemo.Clear;

  ImportarMercadorias;
  ImportarNVEMercadorias;
  LimparTabelasDI;
  LimparReferencias;
  ImportarDetalheMercadoria;
  ImportarDetalheMercadoriaNVE;

  EnviarEmailLog;

  lblInfo.caption := 'Ok';
end;

procedure TfrmImportarPlanilhaItensDI.EnviarEmailLog;
var
  pPara, pAssunto : String;
  Body : TStringList;
  i:integer;
begin
  pPara :=  Trim(ConsultaLookUp('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_EMAIL'));;
  pAssunto := 'Resultado Integração - Itens DI - ' + lblNrProcesso.caption;

  Body := TStringList.Create;
  Body.Add('<br><br>');

  for i := 0 to rMemo.lines.count-1 do
    Body.Add(rMemo.Lines[i] + '<br>');

  Body.Add('<br><br>');
  Body.Add('<br><br>');

  try
    if EnviaEmailHtmlDe(pAssunto, Body.Text, pPara, '', []) then
      Log('Email enviado com sucesso!')
    else
      Log('Erro ao enviar e-mail.')
  except on e:exception do
    Log('Erro ao enviar e-mail. '+ e.Message);
  end;
end;

procedure TfrmImportarPlanilhaItensDI.ImportarMercadorias;
var countMercadoriasInseridas : integer;
begin
  cdsMercadorias.disableControls;
  countMercadoriasInseridas := 0;

  lblInfo.caption := 'Inserindo Mercadorias Novas';
  log(lblInfo.caption);
  IniciarProgressBar(cdsMercadorias.recordcount);

  cdsMercadorias.first;
  while not cdsMercadorias.eof do
  begin
    qryTemp.Close;
    qryTemp.SQL.text := SqlConsultaMercadoria;
    DefineParamType(qryTemp);
    DefineDataTypeString(qryTemp);
    qryTemp.ParamByName('CD_MERCADORIA').value     := cdsMercadoriasCD_MERCADORIA.AsString;
    qryTemp.ParamByName('CD_NCM_SH').value         := cdsMercadoriasCD_NCM_SH.asstring;
    qryTemp.ParamByName('CD_GRUPO').value          := lblGrupo.Caption;
    qryTemp.Open;

    //se não existe mercadoria com esse codigo, ncm e grupo, verifica se existe só com codigo e grupo.
    if qryTemp.IsEmpty then
    begin
      qryTemp.Close;
      qryTemp.SQL.text := SqlConsultaMercadoriaSemNCM;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('CD_MERCADORIA').value     := cdsMercadoriasCD_MERCADORIA.AsString;
      qryTemp.ParamByName('CD_GRUPO').value          := lblGrupo.Caption;
      qryTemp.Open;
      if not qryTemp.IsEmpty then
      begin
        Log('Mercadoria já existe com NCM diferente :' + cdsMercadoriasCD_MERCADORIA.asstring + ' ' + cdsMercadoriasNM_MERCADORIA.asstring);
      end;
    end;

    if qryTemp.IsEmpty then
    begin
      Log('Inserindo Mercadoria :' + cdsMercadoriasCD_MERCADORIA.asstring + ' ' +cdsMercadoriasNM_MERCADORIA.asstring);

      qryTemp.close;
      qryTemp.sql.text := SqlInsertMercadoria; 
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('IN_NECESSITA_LI').DataType := ftBoolean;

      qryTemp.ParamByName('CD_USUARIO_CRIACAO').value := Str_cd_usuario;
      qryTemp.ParamByName('CD_GRUPO').value           := lblGrupo.Caption;
      qryTemp.ParamByName('CD_MERCADORIA').value      := cdsMercadoriasCD_MERCADORIA.asstring;
      qryTemp.ParamByName('AP_MERCADORIA').value      := cdsMercadoriasAP_MERCADORIA.asstring;
      qryTemp.ParamByName('CD_UN_MED_COMERC').value   := cdsMercadoriasCD_UN_MED_COMERC.asstring;
      qryTemp.ParamByName('CD_NCM_SH').value          := cdsMercadoriasCD_NCM_SH.asstring;
      qryTemp.ParamByName('NM_MERCADORIA').value      := cdsMercadoriasNM_MERCADORIA.asstring;
      qryTemp.ParamByName('NR_DESTAQUE_NCM').value    := cdsMercadoriasNR_DESTAQUE_NCM.asstring;
      qryTemp.ParamByName('PC_ICMS').value            := cdsMercadoriasPC_ICMS.asstring;
      qryTemp.ParamByName('CD_TRIBUTACAO_ICMS').value := cdsMercadoriasCD_TRIBUTACAO_ICMS.asstring;
      qryTemp.ParamByName('CD_AREA').value            := cdsMercadoriasAREA.asstring;
      qryTemp.ParamByName('IN_TIPO_M_E').value        := cdsMercadoriasIN_TIPO_M_E.asstring; 
      qryTemp.ParamByName('IN_NECESSITA_LI').value    := (cdsMercadoriasIN_NECESSITA_LI.asstring = 'S');
      qryTemp.ExecSQL;

      inc(countMercadoriasInseridas);
    end;
    AtualizaProgress;
    cdsMercadorias.next;
  end;

  log(inttoStr(countMercadoriasInseridas) + ' mercadorias novas inseridas');

  cdsMercadorias.enableControls;
end;

procedure TfrmImportarPlanilhaItensDI.ImportarNVEMercadorias;
procedure LogarAtual;
begin
  Log('Inserindo NVE Mercadoria :' + cdsMercadoriasCD_MERCADORIA.asstring + ' ' +  cdsMercadoriasNM_MERCADORIA.asstring );
  Log('                     NVE :' + cdsNVECD_NIVEL_NVE.asstring     + ', ' +
                                     cdsNVECD_ATRIBUTO_NCM.asstring  +', ' +
                                     cdsNVECD_ESPECIF_NCM.asstring);
end;
var countNVEsInseridos : Integer;
begin
  cdsNVE.disableControls;
  countNVEsInseridos := 0;
  lblInfo.caption := 'Inserindo NVE Novos - Mercadorias';
  log(lblInfo.caption);
  IniciarProgressBar(cdsNVE.recordcount);

  cdsNVE.first;
  while not cdsNVE.eof do
  begin
    if not VerificaNVEMercadoriaCadastrado(cdsNVECD_MERCADORIA.AsString, cdsNVECD_NIVEL_NVE.asstring,
                                           cdsNVECD_ATRIBUTO_NCM.asstring, cdsNVECD_ESPECIF_NCM.asstring) then
    begin
      LogarAtual;

      qryTemp.close;
      qryTemp.sql.text := SqlInsertNVEMercadoria;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('CD_MERCADORIA').value       := cdsNVECD_MERCADORIA.asstring;
      qryTemp.ParamByName('CD_NIVEL_NVE').value        := cdsNVECD_NIVEL_NVE.asstring;
      qryTemp.ParamByName('CD_ATRIBUTO_NCM').value     := cdsNVECD_ATRIBUTO_NCM.asstring;
      qryTemp.ParamByName('CD_ESPECIF_NCM').value      := cdsNVECD_ESPECIF_NCM.asstring;
      qryTemp.ParamByName('CD_NCM_ATRIBUTO').value     := cdsNVECD_NCM_ATRIBUTO.asstring;
      qryTemp.ParamByName('CD_NCM_ESPECIF').value      := cdsNVECD_NCM_ESPECIF.asstring;
      qryTemp.ExecSQL;

      inc(countNVEsInseridos);
    end;

    AtualizaProgress;
    cdsNVE.next;
  end;
  Log(inttoStr(countNVEsInseridos) + ' NVEs novos inseridos');
  cdsNVE.enableControls;
end;

function TfrmImportarPlanilhaItensDI.VerificaNVEDetalheMercadoriaCadastrado(NrItem, NrAdicao, Nivel, Atributo, Especificacao,  NCM : String) : Boolean;
begin
  qryTemp.Close;
  qryTemp.SQL.text := SqlConsultaNVEDetalheMercadoria;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value         := lblNrProcesso.caption;
  qryTemp.ParamByName('NR_ITEM').value             := NrItem;
  qryTemp.ParamByName('NR_ADICAO').value           := NrAdicao;
  qryTemp.ParamByName('CD_NIVEL_NVE').value        := Nivel;
  qryTemp.ParamByName('CD_ATRIBUTO_NCM').value     := Atributo;
  qryTemp.ParamByName('CD_ESPECIF_NCM').value      := Especificacao;
  qryTemp.ParamByName('CD_NCM_ATRIBUTO').value     := NCM;
  qryTemp.Open;
  result := not qryTemp.isempty;
end;

function TfrmImportarPlanilhaItensDI.VerificaNVEMercadoriaCadastrado(CodMercadoria, Nivel, Atributo, Especificacao : String) : Boolean;
begin
  qryTemp.Close;
  qryTemp.SQL.text := SqlConsultaNVE;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('CD_MERCADORIA').value       := CodMercadoria;
  qryTemp.ParamByName('CD_NIVEL_NVE').value        := Nivel;
  qryTemp.ParamByName('CD_ATRIBUTO_NCM').value     := Atributo;
  qryTemp.ParamByName('CD_ESPECIF_NCM').value      := Especificacao;
  qryTemp.Open;
  result := not qryTemp.isempty;
end;

procedure TfrmImportarPlanilhaItensDI.ImportarDetalheMercadoria;
var Nr_Adicao : string;
countItensInseridos : integer;
const NUM_ITEM = '0000';
begin
  cdsItensDI.disableControls;
  countItensInseridos := 0;
  lblInfo.caption := 'Inserindo Itens DI';
  Log(lblInfo.caption);
  IniciarProgressBar(cdsItensDI.recordcount);

  cdsItensDI.first;
  while not cdsItensDI.eof do
  begin
    lblInfo.caption := 'Inserindo Itens DI - ' + inttostr(cdsItensDI.recno);
    Application.ProcessMessages;
    qryTemp.close;
    qryTemp.sql.text := SqlInsertDetalheMercadoria;  
    DefineParamType(qryTemp);
    DefineDataTypeString(qryTemp);
    qryTemp.ParamByName('QT_MERC_UN_COMERC').DataType      := ftFloat;
    qryTemp.ParamByName('VL_UNITARIO').DataType            := ftFloat;
    qryTemp.ParamByName('VL_UNID_COND_VENDA').DataType     := ftfloat;
    qryTemp.ParamByName('VL_MCV_ITEM').DataType            := ftfloat;
    qryTemp.ParamByName('VL_SEGURO_ITEM').DataType         := ftfloat;
    qryTemp.ParamByName('VL_FRETE_ITEM').DataType          := ftfloat;
    qryTemp.ParamByName('QT_MERC_UN_ESTAT').DataType       := ftfloat;
    qryTemp.ParamByName('PL_MERCADORIA').DataType          := ftfloat;
    qryTemp.ParamByName('PC_DESCONTO_MERC').DataType       := ftfloat;
    qryTemp.ParamByName('VL_DESCONTO_MERC').DataType       := ftfloat;
    qryTemp.ParamByName('VL_MLE_ITEM').DataType            := ftfloat;
    qryTemp.ParamByName('NR_PARCIAL').DataType             := ftInteger;

    qryTemp.ParamByName('NR_PROCESSO').value           := lblNrProcesso.caption;
    qryTemp.ParamByName('NR_ITEM').value               := '***';
    qryTemp.ParamByName('NR_ADICAO').value             := 0;
    qryTemp.ParamByName('CD_MERCADORIA').value         := cdsItensDICD_MERCADORIA.asstring;
    qryTemp.ParamByName('CD_UN_MED_COMERC').value      := cdsItensDICD_UN_MED_COMERC.asstring;
    qryTemp.ParamByName('CD_NCM_SH').value             := cdsItensDICD_NCM_SH.asstring;
    qryTemp.ParamByName('QT_MERC_UN_COMERC').value     := cdsItensDIQT_MERC_UN_COMERC.asFloat;
    qryTemp.ParamByName('CD_EXPORTADOR').value         := cdsItensDICD_EXPORTADOR.asstring;
    qryTemp.ParamByName('TX_DESC_DET_MERC').value      := cdsItensDITX_DESC_DET_MERC.asstring;
    qryTemp.ParamByName('VL_UNITARIO').value           := cdsItensDIVL_UNITARIO.asFloat;
    qryTemp.ParamByName('NR_DESTAQUE_NCM').value       := cdsItensDINR_DESTAQUE_NCM.asstring;
    qryTemp.ParamByName('CD_FABRICANTE').value         := cdsItensDICD_FABRICANTE.asstring;
    qryTemp.ParamByName('CD_PAIS_ORIGEM').value        := cdsItensDICD_PAIS_ORIGEM.asstring;

    qryTemp.ParamByName('CD_TIPO_CALCULO_ITEM').value  := '1';
    qryTemp.ParamByName('CD_FABR_EXPO').value          := '1';
    qryTemp.ParamByName('VL_UNID_COND_VENDA').value    := 0;
    qryTemp.ParamByName('VL_MCV_ITEM').value           := 0;
    qryTemp.ParamByName('VL_SEGURO_ITEM').value        := 0;
    qryTemp.ParamByName('VL_FRETE_ITEM').value         := 0;
    qryTemp.ParamByName('QT_MERC_UN_ESTAT').value      := 0;
    qryTemp.ParamByName('PL_MERCADORIA').value         := 0;
    qryTemp.ParamByName('PC_DESCONTO_MERC').value      := 0;
    qryTemp.ParamByName('VL_DESCONTO_MERC').value      := 0;
    qryTemp.ParamByName('VL_MLE_ITEM').value           := 0;
    qryTemp.ParamByName('CD_EMPRESA').value            := lblCliente.caption;
    qryTemp.ParamByName('NR_PARCIAL').value            := cdsItensDI.recno;
    qryTemp.ParamByName('NR_FATURA').value             := cdsItensDINR_FATURA.asstring;
    qryTemp.ParamByName('NR_ITEM_PO').value            := NUM_ITEM;
    qryTemp.ParamByName('NR_PROC_PO').value            := cdsItensDINR_ORDEM.asstring;
    qryTemp.ExecSQL;
    inc(countItensInseridos);


    ImportarReferencia(cdsItensDINR_ORDEM.asstring, NUM_ITEM, cdsItensDI.recno);
    CriarAdicaoItem(cdsItensDICD_MERCADORIA.asstring, cdsItensDICD_NCM_SH.asstring);

    AtualizaProgress;
    Application.ProcessMessages;
    cdsItensDI.next;
  end;
  Log(inttoStr(countItensInseridos) + ' itens inseridos');
  cdsItensDI.enableControls;

  AtualizarIncotermMoedaAdicao;
end;

procedure TfrmImportarPlanilhaItensDI.ImportarReferencia(NrOrdem, ItemCliente : String; ItemParcial :Integer);
begin
  qryTemp.close;
  qryTemp.sql.text := SqlInsertRefCliente;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('CD_EMPRESA').DataType         := ftInteger;

  qryTemp.ParamByName('NR_PROCESSO').value           := lblNrProcesso.Caption;
  qryTemp.ParamByName('CD_REFERENCIA').value         := NrOrdem;
  qryTemp.ParamByName('TP_REFERENCIA').value         := REF_PEDIDO;
  qryTemp.ParamByName('NR_ITEM_PO').value            := ItemCliente;
  qryTemp.ParamByName('NR_PARCIAL').value            := ItemParcial;
  qryTemp.ParamByName('CD_EMPRESA').value            := lblCliente.caption;
  qryTemp.ExecSQL;
end;

procedure TfrmImportarPlanilhaItensDI.CriarAdicaoItem(Mercadoria, NCM : String);
var Nr_Item, Nr_Adicao  :String;
resultadoProcedure : integer;
begin
  with datm_DI_Itens do
  begin
    CloseStoredProc(sp_di_classifica_item);
    sp_di_classifica_item.ParamByName('@NR_PROCESSO').AsString := lblNrProcesso.caption;
    ExecStoredProc(sp_di_classifica_item);
    resultadoProcedure := sp_di_classifica_item.ParamByName('Result').AsInteger;
    if resultadoProcedure = 0 then
    begin
      Nr_Adicao := sp_di_classifica_item.ParamByName('@NR_ADICAO').AsString;
      Nr_Item   := sp_di_classifica_item.ParamByName('@NR_ITEM').AsString;
    end;
    CloseStoredProc(sp_di_classifica_item);    

    CloseStoredProc(sp_di_reclassifica_item);
    sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := lblNrProcesso.caption;
    sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := Nr_Adicao;
    sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := Nr_Item;
    ExecStoredProc(sp_di_reclassifica_item);
    resultadoProcedure := sp_di_reclassifica_item.ParamByName('Result').AsInteger;
    if resultadoProcedure = 0 then
    begin
      nr_adicao := sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
      nr_item   := sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
    end;
    CloseStoredProc(sp_di_reclassifica_item);

    CloseStoredProc(sp_di_renumera_itens_adicao);
    sp_di_renumera_itens_adicao.ParamByName('@NR_PROCESSO').AsString := lblNrProcesso.caption;
    sp_di_renumera_itens_adicao.ParamByName('@NR_ADICAO').AsString   := Nr_Adicao;
    ExecStoredProc(sp_di_renumera_itens_adicao);
    CloseStoredProc(sp_di_renumera_itens_adicao);
  end;
end;

procedure TfrmImportarPlanilhaItensDI.LimparTabelasDI;
begin
  lblInfo.caption := 'Limpando tabelas DI (Itens, Adições, NVEs)';
  Log(lblInfo.caption);
  IniciarProgressBar(3);
  
  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTDI_NVE;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
  AtualizaProgress;

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTADICAO_DE_IMPORTACAO;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
  AtualizaProgress;

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTDETALHE_MERCADORIA;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
  AtualizaProgress;
end;

procedure TfrmImportarPlanilhaItensDI.LimparReferencias;
var listaOrdens : TStringList;
 i : integer;
begin
  lblInfo.caption := 'Limpando referencias ';
  Log(lblInfo.caption);
  IniciarProgressBar(1);

  listaOrdens := TStringList.create;
  listaOrdens := Distinct(cdsPlanilha, 'Ordem_Compra');

  for i := 0 to listaOrdens.count -1 do
  begin
    qryTemp.Close;
    qryTemp.SQL.text := SqlDeleteTREF_CLIENTE;
    DefineParamType(qryTemp);
    DefineDataTypeString(qryTemp);  
    qryTemp.ParamByName('NR_PROCESSO').value       := lblNrProcesso.caption;
    qryTemp.ParamByName('CD_REFERENCIA').value     := listaOrdens[i];
    qryTemp.ParamByName('TP_REFERENCIA').value     := REF_PEDIDO;
    qryTemp.ExecSQL;
  end;

  listaOrdens.free;  
  AtualizaProgress;
end;    

procedure TfrmImportarPlanilhaItensDI.AtualizarIncotermMoedaAdicao;
var NR_ADICAO : string;
begin
  cdsItensDI.DisableControls;
  lblInfo.caption := 'Atualizando Adições';
  IniciarProgressBar(cdsItensDI.recordcount);

  cdsItensDI.first;
  while not cdsItensDI.eof do
  begin
    qryTemp.Close;
    qryTemp.SQL.text := SqlConsultaAdicao;
    DefineParamType(qryTemp);
    DefineDataTypeString(qryTemp);
    qryTemp.ParamByName('NR_PROCESSO').value     := lblNrProcesso.caption;
    qryTemp.ParamByName('CD_MERCADORIA').value   := cdsItensDICD_MERCADORIA.asstring;
    qryTemp.ParamByName('CD_NCM_SH').value       := cdsItensDICD_NCM_SH.asstring;
    qryTemp.ParamByName('NR_DESTAQUE_NCM').value := cdsItensDINR_DESTAQUE_NCM.asstring;
    qryTemp.open;

    if not qryTemp.isempty then
    begin
      NR_ADICAO := qryTemp.FieldByName('NR_ADICAO').asstring;

      qryTemp.Close;
      qryTemp.SQL.text := SqlUpdateTADICAO_DE_IMPORTACAO;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('NR_PROCESSO').value        := lblNrProcesso.caption;
      qryTemp.ParamByName('NR_ADICAO').value          := NR_ADICAO;
      qryTemp.ParamByName('CD_INCOTERMS_VENDA').value := cdsItensDICD_INCOTERMS_VENDA.asstring;
      qryTemp.ParamByName('CD_MOEDA_NEGOCIADA').value := cdsItensDICD_MOEDA_NEGOCIADA.asstring;
      qryTemp.execSql;
    end;
    AtualizaProgress;
    cdsItensDI.next;
  end;
  cdsItensDI.enableControls;
end;
                
procedure TfrmImportarPlanilhaItensDI.ImportarDetalheMercadoriaNVE;
var countNvesInseridos:integer;
begin
  lblInfo.caption := 'Inserindo NVE - Item DI';
  cdsNVE.disableControls;
  AbrirQueryItensInseridos;
  IniciarProgressBar(qryItensInseridos.recordcount);

  qryItensInseridos.first;
  while not qryItensInseridos.eof do
  begin
    countNvesInseridos := 0;

    cdsNVE.filtered := false;
    cdsNVE.Filter   := ' CD_MERCADORIA   = ''' + qryItensInseridos.fieldByName('CD_MERCADORIA').asString
              +  ''' AND CD_NCM_ATRIBUTO = ''' + qryItensInseridos.fieldByName('CD_NCM_SH').asString + '''';
    cdsNVE.filtered := true;

    cdsNVE.first;
    while not cdsNVE.eof do
    begin
      if not VerificaNVEDetalheMercadoriaCadastrado(qryItensInseridos.fieldByName('NR_ITEM').asString,
                                                    qryItensInseridos.fieldByName('NR_ADICAO').asString,
                                                    cdsNVECD_NIVEL_NVE.asString,
                                                    cdsNVECD_ATRIBUTO_NCM.asString,
                                                    cdsNVECD_ESPECIF_NCM.asstring,
                                                    cdsNVECD_NCM_ATRIBUTO.asString) then
      begin
        InserirNVEDI(cdsNVECD_MERCADORIA.asstring + ' ' +cdsNVEDS_MERCADORIA.asstring ,
                     qryItensInseridos.fieldByName('NR_ITEM').asString,
                     qryItensInseridos.fieldByName('NR_ADICAO').asString,
                     cdsNVECD_NIVEL_NVE.asstring,
                     cdsNVECD_ATRIBUTO_NCM.asstring,
                     cdsNVECD_ESPECIF_NCM.asstring,
                     cdsNVECD_NCM_ATRIBUTO.asstring);

        inc(countNvesInseridos);
      end;
      cdsNVE.next;
    end;
    if countNvesInseridos <> 0 then
      Log(inttoStr(countNvesInseridos) + ' NVEs inseridos no item ' + qryItensInseridos.fieldByName('NR_ITEM').asString +
                                         ' da adição ' + qryItensInseridos.fieldByName('NR_ADICAO').asString);

    AtualizaProgress;
    qryItensInseridos.next;
  end;
  cdsNVE.filter   := '';
  cdsNVE.filtered := false;
  cdsNVE.enableControls;
end;

procedure TfrmImportarPlanilhaItensDI.InserirNVEDI(descMercadoria, item, adicao, nivel, atributo, espcificacao , ncm : string);
begin
  Log('Inserindo NVE - Item DI :' + descMercadoria );
  Log('                    NVE :' + nivel  + ', ' + atributo + ', ' + espcificacao);

  qryTemp.close;
  qryTemp.sql.text := SqlInsertDINVE;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value      := lblNrProcesso.caption;
  qryTemp.ParamByName('NR_ITEM').value          := item;
  qryTemp.ParamByName('NR_ADICAO').value        := adicao;
  qryTemp.ParamByName('CD_NIVEL_NVE').value     := nivel;
  qryTemp.ParamByName('CD_ATRIBUTO_NCM').value  := atributo;
  qryTemp.ParamByName('CD_ESPECIF_NCM').value   := espcificacao;
  qryTemp.ParamByName('CD_NCM_ATRIBUTO').value  := ncm;
  qryTemp.ParamByName('CD_NCM_ESPECIF').value   := ncm;
  qryTemp.ExecSQL;
end;


procedure TfrmImportarPlanilhaItensDI.AbrirQueryItensInseridos;
begin
  qryItensInseridos.close;
  qryItensInseridos.sql.text := SqlConsultaItensInseridos;
  DefineParamType(qryItensInseridos);
  DefineDataTypeString(qryItensInseridos);
  qryItensInseridos.ParamByName('NR_PROCESSO').value  := lblNrProcesso.caption;
  qryItensInseridos.open;
end;

procedure TfrmImportarPlanilhaItensDI.popularUnidadeMedida;
var
  Dados : String;
  ListaDados, ListaDadosItens : TStringList;
  i : integer;
begin
  try
    Dados :=  '23,     BILHAO DE UNIDADE INTERNACIONAL, 023/ '+
              'CT,     CAIXA,                           085/ '+
              '08,     CILINDROS,                       182/ '+
              '25,     CONJUNTO,                        088/ '+
              '05,     CONJUNTOS,                       088/ '+
              '20,     DUZIA,                           020/ '+
              '22,     GRAMA,                           022/ '+
              '04,     KILOGRAMA,                       161/ '+
              '50,     KI,                              071/ '+
              '17,     LITRO,                           017/ '+
              '18,     MEGAWATT HORA,                   018/ '+
              '14,     METRO,                           014/ '+
              '16,     METRO CUBICO,                    016/ '+
              '15,     METRO QUADRADO,                  015/ '+
              '06,     METROS,                          101/ '+
              '12,     MIL UNIDADES,                    012/ '+
              'PT,     PACOTES,                         190/ '+
              '13,     PARES,                           013/ '+
              '03,     PEÇA,                            103/ '+
              '01,     PECAS,                           110/ '+
              '19,     QUILATE,                         019/ '+
              '24,     QUILOGRAMA BRUTO,                024/ '+
              '10,     QUILOGRAMA LIQUIDO,              156/ '+
              '000010, QUILOGRAMALIQUIDO,               263/ '+
              '000008, QUILOGRAMALIQUIDO,               263/ '+
              '000006, QUILOS,                          136/ '+
              '53,     ROLOS,                           072/ '+
              '21,     TONEL.METR.LIQ.,                 196/ '+
              '11,     UNIDADE,                         011/ '+
              '05,     UNIDADES,                        142  ';

    ListaDados := TStringList.Create;
    ListaDadosItens := TStringList.Create;
    ListaDados.clear;
    ExtractStrings(['/'],[], PChar(Dados), ListaDados);
    cdsUnidadesMedida.EmptyDataSet;
    for i := 0 to ListaDados.count -1 do
    begin
      ListaDadosItens.CLEAR;
      ExtractStrings([','],[], PChar(ListaDados[i]), ListaDadosItens);
      cdsUnidadesMedida.Append;
      cdsUnidadesMedidaCOD_CLIENTE.value := trim(ListaDadosItens[0]);
      cdsUnidadesMedidaNOME.value        := trim(ListaDadosItens[1]);
      cdsUnidadesMedidaCOD_BROKER.value  := trim(ListaDadosItens[2]);
      cdsUnidadesMedida.post;
    end;
  finally
  begin
    ListaDados.free;
    ListaDadosItens.free;
  end;
  end;
end;

function TfrmImportarPlanilhaItensDI.SqlConsultaAdicao : String;
begin
  result :=
  ' SELECT TOP 1 NR_ADICAO                     ' + sLineBreak +
  '   FROM TDETALHE_MERCADORIA                 ' + sLineBreak +
  '  WHERE NR_PROCESSO     = :NR_PROCESSO      ' + sLineBreak +
  '    AND CD_MERCADORIA   = :CD_MERCADORIA    ' + sLineBreak +
  '    AND CD_NCM_SH       = :CD_NCM_SH        ' + sLineBreak +
  '    AND NR_DESTAQUE_NCM = :NR_DESTAQUE_NCM  ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlConsultaMercadoria : String;
begin
  result :=
  ' SELECT CD_MERCADORIA                   ' + sLineBreak +
  '   FROM TMERCADORIA                     ' + sLineBreak +
  '  WHERE CD_MERCADORIA = :CD_MERCADORIA  ' + sLineBreak +
  '    AND CD_NCM_SH     = :CD_NCM_SH      ' + sLineBreak +
  '    AND CD_GRUPO      = :CD_GRUPO       ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlConsultaMercadoriaSemNCM : String;
begin
  result :=
  ' SELECT CD_MERCADORIA                   ' + sLineBreak +
  '   FROM TMERCADORIA                     ' + sLineBreak +
  '  WHERE CD_MERCADORIA = :CD_MERCADORIA  ' + sLineBreak +
  '    AND CD_GRUPO      = :CD_GRUPO       ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlInsertMercadoria : string;
begin
  result :=
    '  INSERT INTO TMERCADORIA    ' + sLineBreak +
    '  (                          ' + sLineBreak +
    '   CD_MERCADORIA             ' + sLineBreak +
    '  ,DT_CRIACAO                ' + sLineBreak +
    '  ,CD_USUARIO_CRIACAO        ' + sLineBreak +
    '  ,CD_GRUPO                  ' + sLineBreak +
    '  ,AP_MERCADORIA             ' + sLineBreak +
    '  ,CD_UN_MED_COMERC          ' + sLineBreak +
    '  ,CD_NCM_SH                 ' + sLineBreak +
    '  ,NM_MERCADORIA             ' + sLineBreak +
    '  ,NR_DESTAQUE_NCM           ' + sLineBreak +
    '  ,IN_NECESSITA_LI           ' + sLineBreak +
    '  ,PC_ICMS                   ' + sLineBreak +
    '  ,CD_TRIBUTACAO_ICMS        ' + sLineBreak +
    '  ,CD_AREA                   ' + sLineBreak +
    '  ,IN_TIPO_M_E               ' + sLineBreak +    
    '  )                          ' + sLineBreak +
    '  VALUES                     ' + sLineBreak +
    '  (                          ' + sLineBreak +
    '   :CD_MERCADORIA            ' + sLineBreak +
    '  ,GETDATE()                 ' + sLineBreak +
    '  ,:CD_USUARIO_CRIACAO       ' + sLineBreak +
    '  ,:CD_GRUPO                 ' + sLineBreak +
    '  ,:AP_MERCADORIA            ' + sLineBreak +
    '  ,:CD_UN_MED_COMERC         ' + sLineBreak +
    '  ,:CD_NCM_SH                ' + sLineBreak +
    '  ,:NM_MERCADORIA            ' + sLineBreak +
    '  ,:NR_DESTAQUE_NCM          ' + sLineBreak +
    '  ,:IN_NECESSITA_LI          ' + sLineBreak +
    '  ,:PC_ICMS                  ' + sLineBreak +
    '  ,:CD_TRIBUTACAO_ICMS       ' + sLineBreak +
    '  ,:CD_AREA                  ' + sLineBreak +
    '  ,:IN_TIPO_M_E              ' + sLineBreak +
    '  )                          ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlConsultaNVE : String;
begin
  result :=
    ' SELECT CD_MERCADORIA                                   ' + sLineBreak +
    ' FROM TMERCAD_NVE                                       ' + sLineBreak +
    ' WHERE CD_MERCADORIA                 = :CD_MERCADORIA   ' + sLineBreak +
    '   AND ISNULL(CD_NIVEL_NVE,'''')     = :CD_NIVEL_NVE    ' + sLineBreak +
    '   AND ISNULL(CD_ATRIBUTO_NCM,'''')  = :CD_ATRIBUTO_NCM ' + sLineBreak +
    '   AND ISNULL(CD_ESPECIF_NCM,'''')   = :CD_ESPECIF_NCM  ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlInsertNVEMercadoria : string;
begin
  result :=
  '  INSERT INTO TMERCAD_NVE  ' + sLineBreak +
  '  (                        ' + sLineBreak +
  '   CD_MERCADORIA           ' + sLineBreak +
  '  ,CD_NIVEL_NVE            ' + sLineBreak +
  '  ,CD_ATRIBUTO_NCM         ' + sLineBreak +
  '  ,CD_ESPECIF_NCM          ' + sLineBreak +
  '  ,CD_NCM_ATRIBUTO         ' + sLineBreak +
  '  ,CD_NCM_ESPECIF          ' + sLineBreak +
  '  )                        ' + sLineBreak + 
  '  VALUES                   ' + sLineBreak + 
  '  (                        ' + sLineBreak + 
  '   :CD_MERCADORIA          ' + sLineBreak + 
  '  ,:CD_NIVEL_NVE           ' + sLineBreak + 
  '  ,:CD_ATRIBUTO_NCM        ' + sLineBreak + 
  '  ,:CD_ESPECIF_NCM         ' + sLineBreak + 
  '  ,:CD_NCM_ATRIBUTO        ' + sLineBreak + 
  '  ,:CD_NCM_ESPECIF         ' + sLineBreak +
  '  )                        ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlInsertDetalheMercadoria : String;
begin
  result :=
  '  INSERT INTO TDETALHE_MERCADORIA ' + sLineBreak +
  '  (                               ' + sLineBreak +
  '   NR_PROCESSO                    ' + sLineBreak +
  '  ,NR_ADICAO                      ' + sLineBreak +
  '  ,NR_ITEM                        ' + sLineBreak +
  '  ,CD_MERCADORIA                  ' + sLineBreak +
  '  ,CD_UN_MED_COMERC               ' + sLineBreak +
  '  ,CD_NCM_SH                      ' + sLineBreak +
  '  ,QT_MERC_UN_COMERC              ' + sLineBreak +
  '  ,CD_EXPORTADOR                  ' + sLineBreak +
  '  ,TX_DESC_DET_MERC               ' + sLineBreak +
  '  ,VL_UNITARIO                    ' + sLineBreak +
  '  ,NR_DESTAQUE_NCM                ' + sLineBreak +
  '  ,CD_FABRICANTE                  ' + sLineBreak +
  '  ,CD_PAIS_ORIGEM                 ' + sLineBreak +
  '  ,CD_TIPO_CALCULO_ITEM           ' + sLineBreak +
  '  ,CD_FABR_EXPO                   ' + sLineBreak +
  '  ,VL_UNID_COND_VENDA             ' + sLineBreak +
  '  ,VL_MCV_ITEM                    ' + sLineBreak +
  '  ,VL_SEGURO_ITEM                 ' + sLineBreak +
  '  ,VL_FRETE_ITEM                  ' + sLineBreak +
  '  ,QT_MERC_UN_ESTAT               ' + sLineBreak +
  '  ,PL_MERCADORIA                  ' + sLineBreak +
  '  ,PC_DESCONTO_MERC               ' + sLineBreak +
  '  ,VL_DESCONTO_MERC               ' + sLineBreak +
  '  ,VL_MLE_ITEM                    ' + sLineBreak +
  '  ,NR_FATURA                      ' + sLineBreak +
  '  ,NR_ITEM_PO                     ' + sLineBreak +
  '  ,NR_PROC_PO                     ' + sLineBreak +
  '  ,CD_EMPRESA                     ' + sLineBreak +
  '  ,NR_PARCIAL                     ' + sLineBreak +
  '  )                               ' + sLineBreak +
  '  VALUES                          ' + sLineBreak +
  '  (                               ' + sLineBreak +
  '   :NR_PROCESSO                   ' + sLineBreak +
  '  ,:NR_ADICAO                     ' + sLineBreak +
  '  ,:NR_ITEM                       ' + sLineBreak +
  '  ,:CD_MERCADORIA                 ' + sLineBreak +
  '  ,:CD_UN_MED_COMERC              ' + sLineBreak +
  '  ,:CD_NCM_SH                     ' + sLineBreak +
  '  ,:QT_MERC_UN_COMERC             ' + sLineBreak +
  '  ,:CD_EXPORTADOR                 ' + sLineBreak +
  '  ,:TX_DESC_DET_MERC              ' + sLineBreak +
  '  ,:VL_UNITARIO                   ' + sLineBreak +
  '  ,:NR_DESTAQUE_NCM               ' + sLineBreak +
  '  ,:CD_FABRICANTE                 ' + sLineBreak +
  '  ,:CD_PAIS_ORIGEM                ' + sLineBreak +
  '  ,:CD_TIPO_CALCULO_ITEM          ' + sLineBreak +
  '  ,:CD_FABR_EXPO                  ' + sLineBreak +
  '  ,:VL_UNID_COND_VENDA            ' + sLineBreak +
  '  ,:VL_MCV_ITEM                   ' + sLineBreak +
  '  ,:VL_SEGURO_ITEM                ' + sLineBreak +
  '  ,:VL_FRETE_ITEM                 ' + sLineBreak +
  '  ,:QT_MERC_UN_ESTAT              ' + sLineBreak +
  '  ,:PL_MERCADORIA                 ' + sLineBreak +
  '  ,:PC_DESCONTO_MERC              ' + sLineBreak +
  '  ,:VL_DESCONTO_MERC              ' + sLineBreak +
  '  ,:VL_MLE_ITEM                   ' + sLineBreak +
  '  ,:NR_FATURA                     ' + sLineBreak +
  '  ,:NR_ITEM_PO                    ' + sLineBreak +
  '  ,:NR_PROC_PO                    ' + sLineBreak +
  '  ,:CD_EMPRESA                    ' + sLineBreak +
  '  ,:NR_PARCIAL                     ' + sLineBreak +  
  '  )                               ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlConsultaItensInseridos : String;
begin
  result :=
  '  SELECT NR_PROCESSO, NR_ITEM, NR_ADICAO, CD_MERCADORIA, CD_NCM_SH ' + slineBreak +
  '  FROM TDETALHE_MERCADORIA                                         ' + slineBreak +
  '  WHERE NR_PROCESSO = :NR_PROCESSO                                 ' + slineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlInsertDINVE : String;
begin
  result :=
  '  INSERT INTO TDI_NVE(    ' + sLineBreak +
  '   NR_PROCESSO            ' + sLineBreak +
  '  ,NR_ADICAO              ' + sLineBreak +
  '  ,NR_ITEM                ' + sLineBreak +
  '  ,CD_NIVEL_NVE           ' + sLineBreak +
  '  ,CD_ATRIBUTO_NCM        ' + sLineBreak +
  '  ,CD_ESPECIF_NCM         ' + sLineBreak +
  '  ,CD_NCM_ATRIBUTO        ' + sLineBreak +
  '  ,CD_NCM_ESPECIF         ' + sLineBreak +
  '  )                       ' + sLineBreak +
  '  VALUES                  ' + sLineBreak +
  '  (                       ' + sLineBreak +
  '   :NR_PROCESSO           ' + sLineBreak +
  '  ,:NR_ADICAO             ' + sLineBreak +
  '  ,:NR_ITEM               ' + sLineBreak +
  '  ,:CD_NIVEL_NVE          ' + sLineBreak +
  '  ,:CD_ATRIBUTO_NCM       ' + sLineBreak +
  '  ,:CD_ESPECIF_NCM        ' + sLineBreak +
  '  ,:CD_NCM_ATRIBUTO       ' + sLineBreak +
  '  ,:CD_NCM_ESPECIF        ' + sLineBreak +
  '  )                       ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlConsultaNVEDetalheMercadoria : String;
begin
  result :=
    ' SELECT NR_PROCESSO                                      ' + sLineBreak +
    '   FROM TDI_NVE                                          ' + sLineBreak +
    '  WHERE NR_PROCESSO                   = :NR_PROCESSO     ' + sLineBreak +
    '    AND NR_ITEM                       = :NR_ITEM         ' + sLineBreak +
    '    AND NR_ADICAO                     = :NR_ADICAO       ' + sLineBreak +
    '    AND ISNULL(CD_NIVEL_NVE,'''')     = :CD_NIVEL_NVE    ' + sLineBreak +
    '    AND ISNULL(CD_ATRIBUTO_NCM,'''')  = :CD_ATRIBUTO_NCM ' + sLineBreak +
    '    AND ISNULL(CD_ESPECIF_NCM,'''')   = :CD_ESPECIF_NCM  ' + sLineBreak +
    '    AND ISNULL(CD_NCM_ATRIBUTO,'''')  = :CD_NCM_ATRIBUTO ' ;
end;

function TfrmImportarPlanilhaItensDI.SqlInsertRefCliente : String;
begin
  result :=
  '  DECLARE @NR_SEQUENCIA VARCHAR(5)                                      ' + sLineBreak +
  '  DECLARE @CD_AREA CHAR(3)                                              ' + sLineBreak +
  '  DECLARE @NR_PROCESSO CHAR(18)                                         ' + sLineBreak +
  '  SET @NR_PROCESSO = :NR_PROCESSO                                       ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  SELECT @CD_AREA = CD_AREA                                             ' + sLineBreak +
  '  FROM TPROCESSO                                                        ' + sLineBreak +
  '  WHERE NR_PROCESSO = @NR_PROCESSO                                      ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  SET @NR_SEQUENCIA = ISNULL((SELECT MAX(CONVERT(INT, NR_SEQUENCIA))    ' + sLineBreak +
  '                                FROM TREF_CLIENTE                       ' + sLineBreak +
  '                               WHERE NR_PROCESSO = @NR_PROCESSO), 0)+1  ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  SET @NR_SEQUENCIA = RIGHT(''00000'' + @NR_SEQUENCIA ,5 )              ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  INSERT INTO TREF_CLIENTE                                              ' + sLineBreak +
  '  (                                                                     ' + sLineBreak +
  '  NR_PROCESSO,                                                          ' + sLineBreak +
  '  NR_SEQUENCIA,                                                         ' + sLineBreak +
  '  CD_REFERENCIA,                                                        ' + sLineBreak +
  '  DT_REFERENCIA,                                                        ' + sLineBreak +
  '  TP_REFERENCIA,                                                        ' + sLineBreak +
  '  CD_AREA,                                                              ' + sLineBreak +
  '  NR_ITEM_PO,                                                           ' + sLineBreak +
  '  NR_PARCIAL,                                                           ' + sLineBreak +
  '  CD_EMPRESA                                                            ' + sLineBreak +
  '  )                                                                     ' + sLineBreak +
  '  VALUES                                                                ' + sLineBreak +
  '  (                                                                     ' + sLineBreak +
  '  @NR_PROCESSO,                                                         ' + sLineBreak +
  '  @NR_SEQUENCIA,                                                        ' + sLineBreak +
  '  :CD_REFERENCIA,                                                       ' + sLineBreak +
  '  GETDATE(),                                                            ' + sLineBreak +
  '  :TP_REFERENCIA,                                                       ' + sLineBreak +
  '  @CD_AREA,                                                             ' + sLineBreak +
  '  :NR_ITEM_PO,                                                          ' + sLineBreak +
  '  :NR_PARCIAL,                                                          ' + sLineBreak +
  '  :CD_EMPRESA)                                                          ' + sLineBreak ;
end;

function TfrmImportarPlanilhaItensDI.SqlUpdateTADICAO_DE_IMPORTACAO : String;
begin
  result := '  UPDATE TADICAO_DE_IMPORTACAO                     ' + sLineBreak +
            '     SET CD_INCOTERMS_VENDA = :CD_INCOTERMS_VENDA, ' + sLineBreak +
            '         CD_MOEDA_NEGOCIADA = :CD_MOEDA_NEGOCIADA  ' + sLineBreak +
            '    FROM TADICAO_DE_IMPORTACAO                     ' + sLineBreak +
            '   WHERE NR_PROCESSO = :NR_PROCESSO                ' + sLineBreak +
            '     AND NR_ADICAO   = :NR_ADICAO                  ';
end;

function TfrmImportarPlanilhaItensDI.SqlDeleteTDETALHE_MERCADORIA : String;
begin
  result := '  DELETE FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarPlanilhaItensDI.SqlDeleteTDI_NVE : String;
begin
  result := '  DELETE FROM TDI_NVE WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarPlanilhaItensDI.SqlDeleteTADICAO_DE_IMPORTACAO : String;
begin
  result := '  DELETE FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarPlanilhaItensDI.SqlDeleteTREF_CLIENTE : String;
begin
  result := '  DELETE TREF_CLIENTE                   ' + sLineBreak +
            '    FROM TREF_CLIENTE                   ' + sLineBreak +
            '   WHERE NR_PROCESSO   = :NR_PROCESSO   ' + sLineBreak +
            '     AND CD_REFERENCIA = :CD_REFERENCIA ' + sLineBreak +
            '     AND TP_REFERENCIA = :TP_REFERENCIA ';
end;

procedure TfrmImportarPlanilhaItensDI.DefineParamType(var Query : TQuery);
var i: integer;
begin
  for i := 0 to Query.ParamCount -1 do
  begin
    Query.Params[i].ParamType := ptInput;
  end;
end;

procedure TfrmImportarPlanilhaItensDI.DefineDataTypeString(var Query : TQuery);
var i: integer;
begin
  for i := 0 to Query.ParamCount -1 do
  begin
    Query.Params[i].DataType := ftString;
  end;
end;

procedure TfrmImportarPlanilhaItensDI.FormClose(Sender: TObject;
  var Action: TCloseAction);
var   Cont : integer;
begin
  with datm_DI_Itens do
  begin
    for Cont := 0 to ComponentCount - 1 do
    begin
      if Components[Cont] is TTable then
         ( Components[Cont] as TTable ).Close;
      if Components[Cont] is TQuery then
         ( Components[Cont] as TQuery ).Close;
    end;
    Free;
    Action := caFree;
  end;
end;

function TfrmImportarPlanilhaItensDI.Distinct(CDS: TClientDataSet; FieldName: string): TStringList;
var
  Clone: TClientDataSet;
begin
  Result := TStringList.Create;
  Clone  := TClientDataSet.Create(nil);
  try
    Clone.CloneCursor(CDS,False);
    Clone.IndexFieldNames := FieldName;
    Clone.First;
    while not Clone.Eof do
    begin
      if Result.IndexOf( Clone.FieldByName(FieldName).AsString ) < 0 then
        Result.Add(Clone.FieldByName(FieldName).AsString);

      Clone.Next;
    end;
  finally
    Clone.Destroy;
  end;
end;

procedure TfrmImportarPlanilhaItensDI.IniciarProgressBar(total : integer);
begin
  ProgressBar1.Max      := total;
  ProgressBar1.Position := 0;
  Application.ProcessMessages;
end;

procedure TfrmImportarPlanilhaItensDI.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportarPlanilhaItensDI.rMemoChange(Sender: TObject);
begin
  SendMessage(rMemo.Handle, EM_LINESCROLL, 0,rMemo.Lines.Count);
end;

procedure TfrmImportarPlanilhaItensDI.Log(msg : String);
begin
  rMemo.Lines.Add(formatdatetime('dd/mm/yyyy hh:mm:ss ', now) + msg);
  Application.ProcessMessages;
end;

procedure TfrmImportarPlanilhaItensDI.AtualizaProgress;
begin
  ProgressBar1.Position := ProgressBar1.Position +1;
end;

end.




