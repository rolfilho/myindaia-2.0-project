{
Finalidade : Gerar arquivo de remessa do Certificado de origem para a FIESP
Programador: Carlos Alberto
Data       : Mar/2009
}


unit uSistema_Cool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, DB, DBTables,
  ComCtrls, RXDBCtrl, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxMemo, Mask, DBCtrls, ToolEdit, Menus, RXCtrls, DBClient;

type
  Tfrm_sistema_cool = class(TForm)
    pTopo: TPanel;
    qry_processo_exp: TQuery;
    ds_processo_exp: TDataSource;
    pc_cool: TPageControl;
    qry_processo_expNR_PROCESSO: TStringField;
    ds_faturas_exportador: TDataSource;
    qry_faturas_exportador: TQuery;
    qry_faturas_exportadorNR_FATURA: TStringField;
    qry_faturas_exportadorTX_MARCACAO_VOLUME: TMemoField;
    qry_faturas_exportadorTX_INF_EMBALAGEM: TMemoField;
    ds_faturas_itens: TDataSource;
    qry_faturas_exportador_itens: TQuery;
    qry_processo_expcd_acordo_cool: TStringField;
    qry_processo_expDT_FATURA: TDateTimeField;
    qry_processo_expNM_IMPORTADOR: TStringField;
    qry_processo_expEND_IMPORTADOR: TStringField;
    qry_processo_expCD_PAIS_IMPORTADOR: TStringField;
    qry_processo_expCD_IMPORTADOR: TStringField;
    qry_processo_expcd_pais_importador_COOL: TStringField;
    qry_faturas_exportadorVL_PESO_LIQUIDO: TFloatField;
    qry_faturas_exportadorVL_PESO_BRUTO: TFloatField;
    qry_faturas_exportador_itenscd_unidade_medida_COOL: TStringField;
    qry_processo_expnome_consignatario: TStringField;
    qry_processo_expend_pais_consignatario: TStringField;
    qry_processo_expEND_PAIS_EXPORTADOR: TStringField;
    qry_processo_expCIDADE_DESTINO: TStringField;
    qry_processo_expPais_Destino: TStringField;
    qry_processo_expMEIO_TRANSPORTE: TStringField;
    qry_processo_exppais_consignatario: TStringField;
    qry_certificados: TQuery;
    ds_certificados: TDataSource;
    qry_processo_expLOCAL_EMBARQUE: TStringField;
    qry_faturas_exportador_itensCD_DECLARACAO: TStringField;
    qry_faturas_exportador_itensCD_NCM_NALADI: TStringField;
    qry_faturas_exportador_itensEMBALAGEM: TStringField;
    qry_faturas_exportador_itensDENOMINACAO_NCM_NALADI: TStringField;
    qry_faturas_exportador_itensCD_UNID_MEDIDA: TStringField;
    qry_faturas_exportador_itensCD_MEDIDA_NUMERICO: TIntegerField;
    qry_faturas_exportador_itensCD_NORMAS: TStringField;
    qry_faturas_exportador_itensNR_PEDIDO: TStringField;
    qry_faturas_exportador_itensQT_MERCADORIA: TFloatField;
    qry_faturas_exportador_itensVL_TOT_ITEM: TFloatField;
    Tab_Certificados: TTabSheet;
    pnl_certificado: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Panel4: TPanel;
    dbg_normas: TDBGrid;
    Label22: TLabel;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    lbl_nr_processo: TLabel;
    btn_sair: TSpeedButton;
    btn_co_processo: TBitBtn;
    cb_agrupa: TCheckBox;
    edt_exportador: TEdit;
    edt_end_exportador: TEdit;
    edt_importador: TEdit;
    edt_end_importador: TEdit;
    edt_consignatario: TEdit;
    edt_embarque: TEdit;
    edt_pais_destino: TEdit;
    edt_pais_consignatario: TEdit;
    edt_meio_transporte: TEdit;
    edt_numero_fatura: TEdit;
    edt_data_fatura: TDateEdit;
    pop_normas: TPopupMenu;
    AlterarNorma1: TMenuItem;
    edt_OBS: TMemo;
    rx_acordo: TRxLabel;
    qry_faturas_exportadorOBS: TStringField;
    Shape24: TShape;
    Label34: TLabel;
    Shape25: TShape;
    Label53: TLabel;
    btn_Zoom_mais: TSpeedButton;
    btn_Zoom_menos: TSpeedButton;
    pnl_bottom: TPanel;
    edt_cgc_empresa: TEdit;
    eAssinante: TEdit;
    bGera: TBitBtn;
    Label9: TLabel;
    Label23: TLabel;
    cb_exibir_produto: TCheckBox;
    Shape1: TShape;
    Label10: TLabel;
    upd_certificados: TUpdateSQL;
    rgCO: TRadioGroup;
    qry_processo_expNM_EMPRESA: TStringField;
    qry_processo_expCGC_EMPRESA: TStringField;
    qry_processo_expAP_EMPRESA: TStringField;
    txtRemessa: TMemo;
    pnl_descricao: TPanel;
    btn_salvar: TButton;
    lbl_altera_titulo: TLabel;
    lbl_fecha_titulo: TLabel;
    dbmm_descricao: TMemo;
    qry_processo_expCD_CLIENTE: TStringField;
    cb_descricao_fiesp: TCheckBox;
    btn_cd_obs: TSpeedButton;
    rgTipo_Medida: TRadioGroup;
    qry_acordos: TQuery;
    ds_acordos: TDataSource;
    qry_acordosCD_ACORDO: TStringField;
    pnl_faturas: TPanel;
    dblc_faturas: TDBLookupComboBox;
    Label1: TLabel;
    pnl_acordos: TPanel;
    dblc_acordos: TDBLookupComboBox;
    Label2: TLabel;

    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bGeraClick(Sender: TObject);
    function Header_Arquivo:Boolean;
    function Header_Processo:Boolean;
    function Header_Fatura_Exportador:Boolean;
    function Detail_Fatura_Exportador_Item:Boolean;
    function Trailler_Fatura_Exportador:Boolean;
    function Trailler_Processo:Boolean;
    function Trailler_Arquivo:Boolean;
    function Trailler_Certificado:Boolean;
    procedure Header_Certificado(pCD_ACORDO: String);
    function Header_Certificado_Exportador(pRegras_Acordo:Integer):Boolean;
    function Header_Certificado_Consignatario(pRegras_Acordo:Integer):Boolean;
    function Header_Certificado_Observacao(pRegras_Acordo:Integer):Boolean;
    function Registro_Certificado_Itens(pRegras_Acordo:Integer):Boolean;
    function Registro_Certificado_Itens_Denominacao(pRegras_Acordo:Integer):Boolean;
    function consiste:boolean;
    //
    procedure qry_processo_expCalcFields(DataSet: TDataSet);
    procedure Exibe_Memo(Sender: TObject);
    procedure qry_faturas_exportador_itensCalcFields(DataSet: TDataSet);
    procedure qry_certificadosAfterOpen(DataSet: TDataSet);
    procedure cb_agrupaClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure pc_coolExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoKeyPress(Sender: TObject; var Key: Char);
    procedure seleciona_todos(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure AlterarNorma1Click(Sender: TObject);
    procedure dbg_normasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cgc_empresaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_Zoom_maisClick(Sender: TObject);
    procedure btn_Zoom_menosClick(Sender: TObject);
    procedure cb_exibir_produtoClick(Sender: TObject);
    procedure rgCOClick(Sender: TObject);
    procedure lbl_fecha_tituloClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbg_normasDblClick(Sender: TObject);
    procedure cb_descricao_fiespClick(Sender: TObject);
    procedure btn_cd_obsClick(Sender: TObject);
    procedure salva_declaracao(Sender: TObject);
    procedure dbg_normasColExit(Sender: TObject);
    procedure rgTipo_MedidaClick(Sender: TObject);
    procedure dblc_faturasExit(Sender: TObject);
    procedure dblc_acordosExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure dblc_faturasEnter(Sender: TObject);
    procedure dbg_normasCellClick(Column: TColumn);
    procedure qry_certificadosBeforeScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    nRegras_Acordo,nNumero_Ordem,a : Integer;
    tx_nr_processo,vDescricao    : string;
    st_modificar ,     st_incluir  ,  st_excluir : Boolean;
  end;

var
  frm_sistema_cool: Tfrm_sistema_cool;


implementation
uses GSMLIB,  PGGP001, PGGP017, FUNCOES, ConsOnLineEx, ShellApi, ComObj,
  PGSM185,MaskUtils;

{$R *.dfm}

procedure Tfrm_sistema_cool.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_sistema_cool.FormCreate(Sender: TObject);
begin
  frm_sistema_cool.WindowState:=wsMaximized;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
end;

procedure Tfrm_sistema_cool.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  qry_processo_exp.Close;
//  qry_exportador.Close;
end;



procedure Tfrm_sistema_cool.qry_processo_expCalcFields(DataSet: TDataSet);
var
cd_acordo,cd_pais_importador:string;
begin
//  cd_acordo          :=dePara('01','02','26',qry_processo_expCD_ACORDO.AsString);
  cd_acordo          :=dePara('01','02','26',trim(dblc_acordos.Text));
  cd_pais_importador :=dePara('01','02','27',qry_processo_expCD_PAIS_IMPORTADOR.AsString);

  { Acordo Inexistente na FIESP }
  if (cd_acordo=null) or (cd_acordo='') then
     cd_acordo:='0';

  { Pais Inexistente na FIESP }
  if (cd_pais_importador=null) or (cd_pais_importador='') then
     cd_pais_importador:='0';

  qry_processo_expCD_ACORDO_Cool.AsString          := cd_acordo;
  qry_processo_expCD_PAIS_IMPORTADOR_Cool.AsString := cd_pais_importador;
end;

procedure Tfrm_sistema_cool.Exibe_Memo(Sender: TObject);
begin
  if TDBGrid(sender).SelectedField.IsBlob then
     showmessage(TDBGrid(sender).SelectedField.AsString);

end;

procedure Tfrm_sistema_cool.qry_certificadosAfterOpen(DataSet: TDataSet);
begin
//  nNumero_Ordem:=0; by carlos em 12/09/2011 não estava resetando quando o usuario clicava varias vezes no botão para gerar o TXT
end;

procedure Tfrm_sistema_cool.qry_faturas_exportador_itensCalcFields(
  DataSet: TDataSet);
var
cd_medida:string;
begin
  cd_medida:=dePara('01','02','28','100');

  { Medida Inexistente na FIESP }
  if (cd_medida=null) or ( cd_medida='') then
     cd_medida:='0';


  qry_faturas_exportador_itensCD_UNIDADE_MEDIDA_COOL.AsInteger:= StrToInt(cd_medida);
end;


procedure Tfrm_sistema_cool.bGeraClick(Sender: TObject);
var
txtArquivo,cFatura  : String;
cd_acordo_comercial : String;
begin
//   if not consiste then exit;

   nNumero_Ordem:=0;
   cfatura:=Stringreplace(dblc_faturas.Text,'/','-',[rfReplaceAll]);

   if not DirectoryExists('C:\DDBROKER\FIESP') then
      if not CreateDir('C:\DDBROKER\FIESP') then
         raise Exception.Create('Erro ao Criar Pasta da FIESP!!!');

   if not DirectoryExists('C:\DDBROKER\FIESP\'+msk_nr_processo.Text) then
      if not CreateDir('C:\DDBROKER\FIESP\'+msk_nr_processo.Text) then
         raise Exception.Create('Erro ao Criar Pasta do Processo  FIESP!!!');



   if not DirectoryExists('C:\DDBROKER\FIESP\'+msk_nr_processo.Text+'\'+cFatura) then
      if not CreateDir('C:\DDBROKER\FIESP\'+msk_nr_processo.Text+'\'+cfatura) then
         raise Exception.Create('Erro ao Criar Pasta da Fatura do Processo  FIESP!!!');



//   qry_exportador.DisableControls;
   qry_processo_exp.DisableControls;
   qry_faturas_exportador.DisableControls;
   qry_faturas_exportador_itens.DisableControls;
   qry_certificados.DisableControls;

   txtArquivo:='C:\DDBROKER\FIESP\'+trim(msk_nr_processo.Text)+'\'+cFatura+'\'+qry_processo_expCGC_EMPRESA.AsString+'CO.REM';
   txtRemessa.Clear;

   { 010 }
   Header_Arquivo;
   cd_acordo_comercial := qry_processo_expCD_ACORDO_COOL.AsString;

//   qry_faturas_exportador.First;
//   while not(qry_faturas_exportador.eof) do begin
      { 020 }
      Header_Processo;

      { 030 }
      Header_Fatura_Exportador();

      qry_faturas_exportador_itens.First;
      while not(qry_faturas_exportador_itens.Eof) do begin
         { 040 }
         Detail_Fatura_Exportador_Item;

         qry_faturas_exportador_itens.next;
      end;

      { 050 }
      Trailler_Fatura_Exportador();


      { Para o Certificado Existem Algumas regras na Estrutura dependentes do Acordo }
      Header_Certificado(cd_acordo_comercial);

      { 110 }
      Trailler_Certificado();

      { 120 }
      Trailler_Processo();

//      qry_faturas_exportador.next;
//   end;
   { 130 }
   Trailler_Arquivo();

   { Salva o arquivo Remessa na pasta do processo}
   txtRemessa.Lines.SaveToFile(txtArquivo);

   qry_certificados.EnableControls;
   qry_faturas_exportador.EnableControls;
   qry_faturas_exportador_itens.EnableControls;
//   qry_exportador.EnableControls;
   qry_processo_exp.EnableControls;
(*

   {ataulizar declaração preferencial}
   qry_certificados.DisableControls;
   //
   qry_certificados.First;
   while not qry_certificados.Eof do begin

      if trim(qry_certificados.FieldByName('CD_DECLARACAO').AsString)<>'' then begin
         with TQuery.Create(Application) do begin
           SQL.Clear;
           DataBaseName := 'DBBROKER';
           SQL.ADD(' Update TMERCADORIA_EXP set CD_DECLARACAO_PREFERENCIAL = "'+ trim(qry_certificados.FieldByName('CD_DECLARACAO').AsString)+'"' ) ;
           SQL.Add(' WHERE CD_MERCADORIA = "'+trim(qry_certificados.FieldByName('CD_MERCADORIA').AsString)+'"'  );
           ExecSQL;
           free;
         end;
      end;

     qry_certificados.next;
   end;
   qry_certificados.EnableControls;
*)

   ShowMessage('Arquivo Gerado em: '+#13+txtArquivo);


//   msk_nr_processo.SetFocus;
end;

procedure Tfrm_sistema_cool.Header_Certificado(pCD_ACORDO: String);
begin
   nRegras_Acordo:=0;
   //
   if (pCD_ACORDO = 'CO') then
      nRegras_Acordo:=1;

   if (pCD_ACORDO = '18') or (pCD_ACORDO= '35') or (pCD_ACORDO='36') or (pCD_ACORDO='A3') or (pCD_ACORDO='59') then
      nRegras_Acordo:=2;

   if (pCD_ACORDO = 'PT') or (pCD_ACORDO= '58') or (pCD_ACORDO='53') or (pCD_ACORDO='55') or (pCD_ACORDO='62') then
      nRegras_Acordo:=3;


   { por enquanto os acordos abaixo não serão usados ( 12/01/2009 ) }
//   if (pCD_ACORDO = 'CP') then
//      nRegras_Acordo:=4;

//   if (pCD_ACORDO = 'AN') then
//      nRegras_Acordo:=5;

//   if (pCD_ACORDO = 'SG') or (pCD_ACORDO= 'GT') then
//      nRegras_Acordo:=6;


   if nRegras_Acordo=0 then begin
      ShowMessage('Código de Acordo não previsto nas Regras de Certificados: '+pCD_ACORDO);
      exit;
   end;

   Header_Certificado_Exportador(nRegras_Acordo);
//          Header_Certificado_Produtor(nRegras_Acordo);
   Header_Certificado_Consignatario(nRegras_Acordo);
   Header_Certificado_Observacao(nRegras_Acordo);
//          Header_Certificado_Transporte(nRegras_Acordo);

   qry_certificados.First;
   while not(qry_certificados.Eof) do begin
      Registro_Certificado_Itens(nRegras_Acordo);
      Registro_Certificado_Itens_denominacao(nRegras_Acordo);
      qry_certificados.Next;
   end;

end;


function Tfrm_sistema_cool.Header_Arquivo : Boolean;
var
cID,cTipo,cCNPJ,cRAZAO_SOCIAL,cVAZIO,cLinha:String;
begin
  result        := true;
  cID           := '010';
  cTipo         := '00003';
//  cCNPJ         := qry_exportadorCGC_EMPRESA.AsString;
  cCNPJ         := qry_processo_expCGC_EMPRESA.AsString;
  cRAZAO_SOCIAL := FStrSpace(edt_exportador.Text,60);
  cVAZIO        := space(418);
  cLinha        := cID+cTipo+cCNPJ+cRAZAO_SOCIAL+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Header_Processo:Boolean;
var
cLinha,cID,cVAZIO,cAcordo,cTriangular:String;
begin
  result        := true;
  cID           := '020';
  cAcordo       := qry_processo_expCD_ACORDO_COOL.AsString;
  cTriangular   := '0';
  cVAZIO        := space(494);
  cLinha        := cID+cAcordo+cTriangular+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Header_Fatura_Exportador:Boolean;
var
cLinha,cID,cVAZIO,  cImportador,  cEnd_Importador,  cPais_Importador, cNumero_Fatura,
cData_Fatura,  cPeso_Liquido,  cPeso_Bruto,  cVL_Total_Fatura :String;
vVL_Total_Fatura:Double;
begin

  result           := true;
  cID              := '030';
  cImportador      := FstrSpace(edt_importador.Text,60);
  cEnd_Importador  := FstrSpace(edt_end_importador.Text,150);
  cPais_Importador := StrZero(qry_processo_expCD_PAIS_IMPORTADOR_COOL.AsInteger,3);
  cNumero_Fatura   := FstrSpace(edt_numero_fatura.Text,30);
  cData_Fatura     := FormatDateTime('DD/MM/YYYY',edt_data_fatura.Date);

  vVL_Total_Fatura:=0;
  qry_faturas_exportador_Itens.First;
  while not(qry_faturas_exportador_Itens.Eof) do begin
    vVL_Total_Fatura:=vVL_Total_Fatura+qry_faturas_exportador_ItensVL_TOT_ITEM.AsFloat;
    qry_faturas_exportador_Itens.Next;
  end;

  cPeso_Bruto := FFloatToStr( qry_faturas_exportadorVL_PESO_BRUTO.AsFloat,9,3 );
  cPeso_Liquido  := FFloatToStr( qry_faturas_exportadorVL_PESO_LIQUIDO.AsFloat,9,3 );
  cVL_Total_Fatura := FFloatToStr( vVL_Total_Fatura ,9,3 );

  cVazio           := space(208);
  cLinha           := cID+cImportador+cEnd_Importador+ cPais_Importador+ cNumero_Fatura+ cData_Fatura+ cPeso_Liquido+ cPeso_Bruto+cVL_Total_Fatura+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;


function Tfrm_sistema_cool.Detail_Fatura_Exportador_Item:Boolean;
var
cLinha,cID,cVAZIO,  cQtd,  cCD_Medida,  cDenominacao,
cValor_Fob, cCODIGO_DECLARACAO:String;
begin

  result             := true;
  cID                := '040';
  cQtd               := FFloatToStr(qry_faturas_exportador_itensQT_MERCADORIA.asFloat,9,3 );
  cCD_Medida         := StrZero(qry_faturas_exportador_itensCD_UNIDADE_MEDIDA_COOL.AsInteger,3 );
  cDenominacao       := FstrSpace(qry_faturas_exportador_itensDENOMINACAO_NCM_NALADI.AsString ,300);
  cCodigo_Declaracao := FstrSpace(qry_faturas_exportador_itensCD_DECLARACAO.AsString,10);
  cValor_Fob         := FFloatToStr(qry_faturas_exportador_ItensVL_TOT_ITEM.AsFloat,9,3 );
  cVazio             := space(160);
  cLinha             := cID+cQtd+cCD_Medida+ cDenominacao+ cValor_Fob+ cCodigo_Declaracao+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;


function Tfrm_sistema_cool.Trailler_Fatura_Exportador:Boolean;
var
cLinha, cID,cVAZIO, cNumero_Fatura:String;
begin

  result           := true;
  cID              := '050';
  cNumero_Fatura   := FstrSpace(edt_numero_fatura.Text,30);
  cVazio           := space(467);
  cLinha           := cID+cNumero_Fatura+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Trailler_Processo:Boolean;
var
cLinha,cID,cVAZIO, cAcordo:String;
begin

  result           := true;
  cID              := '120';
  cAcordo          := qry_processo_expCD_ACORDO_COOL.AsString;
  cVazio           := space(495);
  cLinha           := cID+cAcordo+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Trailler_Arquivo:Boolean;
var
cLinha,cID,cVAZIO, cQtd_Processos:String;
begin

  result           := true;
  cID              := '130';
  cQtd_Processos   := '0001'; //strZero(qry_faturas_exportador.recordcount,4) ; // qtd de faturas   strzero(qry_processo_exp.RecordCount,4);
  cVazio           := space(493);
  cLinha           := cID+cQtd_Processos+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;


function Tfrm_sistema_cool.Header_Certificado_Exportador(pRegras_Acordo:Integer):Boolean;
var
cLinha,cID,cVAZIO:String;
{ Regra = 1 }
cEnd_Pais_Exportador, cCidade_Destino, cPais_Destino:String;
{ Regra = 2 }
cLocal_Embarque, cMeio_Transporte, cAssinante:String;
begin

  result               := true;
  cID                  := '090';
  cLinha               := '';

  if pRegras_Acordo=1 then begin
     cEnd_Pais_Exportador := FstrSpace(edt_end_exportador.Text,300);
     cCidade_Destino      := FstrSpace(qry_processo_expCidade_Destino.AsString,30);
     cPais_Destino        := FstrSpace(edt_pais_destino.Text,50);
     cMeio_Transporte     := FstrSpace(edt_meio_transporte.Text,60);
     cAssinante           := FstrSpace(eAssinante.Text,56);
     cVazio               := space(1);
     cLinha               := cID+cEnd_Pais_Exportador+cCidade_Destino+cPais_Destino+cMeio_Transporte+cAssinante+cVazio;
  end;

  if pRegras_Acordo=2 then begin
     cEnd_Pais_Exportador := FstrSpace(edt_end_exportador.Text,300);
     cLocal_Embarque      := FstrSpace(edt_embarque.Text,60);
     cMeio_Transporte     := FstrSpace(edt_meio_transporte.Text,60);
     cAssinante           := FstrSpace(eAssinante.Text,77);
     cLinha               := cID+cEnd_Pais_Exportador+cLocal_Embarque+cMeio_Transporte+cAssinante;
  end;

  if pRegras_Acordo=3 then begin
     cEnd_Pais_Exportador := FstrSpace(edt_end_exportador.Text,300);
     cAssinante           := FstrSpace(eAssinante.Text,77);
     cVazio               := space(120);
     cLinha               := cID+cEnd_Pais_Exportador+cAssinante+cVAZIO;
  end;

  if cLinha<>'' then
     txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Header_Certificado_Consignatario(pRegras_Acordo:Integer):Boolean;
var
cLinha,cID,cVAZIO:String;
cNome_Consignatario ,cEnd_Pais_Consignatario:String;
cPais_Consignatario:String;
begin

  result                  := true;
  cID                     := '092';
  cLinha                  := '';
  if pRegras_Acordo=1 then begin
     cNome_Consignatario     := FstrSpace(edt_consignatario.Text,60);
     cEnd_Pais_Consignatario := FstrSpace(qry_processo_expEND_PAIS_Consignatario.AsString,300);
     cVazio                  := space(137);
     cLinha                  := cID+cNome_Consignatario+cEnd_Pais_Consignatario+cVAZIO;
  end;

  if pRegras_Acordo=2 then begin
     cNome_Consignatario     := FstrSpace(edt_consignatario.Text,60);
     cPais_Consignatario     := FstrSpace(edt_pais_consignatario.Text,300);
     cVazio                  := space(137);
     cLinha                  := cID+cNome_Consignatario+cPais_Consignatario+cVAZIO;
  end;

  if cLinha<>'' then
     txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Header_Certificado_Observacao(pRegras_Acordo:Integer):Boolean;
var
cLinha,cID:String;
cOBS:String;
begin

  result                  := true;
  cID                     := '093';
  cLinha                  := '';
  if (pRegras_Acordo=1) or (pRegras_Acordo=2) or (pRegras_Acordo=3)  then begin
     cOBS   := FstrSpace(edt_OBS.Text,497);

     cLinha := cID+cOBS;
  end;

  if cLinha<>'' then
     txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Registro_Certificado_Itens(pRegras_Acordo:Integer):Boolean;
var
cLinha,cID,cVAZIO:String;
cQtd , cEmbalagem , cPeso_Liquido , cPeso_Bruto , cCodigo_Declaracao:String;
cNumero_Ordem,cClassificacao,cNorma,cValor_FOB:String;
begin
  result                  := true;
  cID                     := '100';
  cLinha                  := '';

  if pRegras_Acordo=1 then begin
     nNumero_Ordem        := nNumero_Ordem+1;
     cNumero_Ordem        := StrZero(nNumero_Ordem,4);
     cQtd                 := FFloatToStr(qry_certificados.FieldByName('QTD_MERCADORIA').AsFloat,9,3);
     cEmbalagem           := FstrSpace(qry_certificados.FieldByName('EMBALAGEM').AsString,60);
     cPeso_Liquido        := FFloatToStr(qry_certificados.FieldByName('PESO_LIQUIDO').AsFloat,9,3);
     cPeso_Bruto          := FFloatToStr(qry_certificados.FieldByName('PESO_BRUTO').AsFloat,9,3);
     cCodigo_Declaracao   := FstrSpace(qry_certificados.FieldByName('CD_DECLARACAO').AsString,10);
     cVazio               := space(387);
     cLinha               := cID+cNumero_Ordem+cQtd+cEmbalagem+cPeso_Liquido+cPeso_Bruto+cCodigo_Declaracao+cVAZIO;
  end;
  if pRegras_Acordo=2 then begin
     nNumero_Ordem        := nNumero_Ordem+1;
     cNumero_Ordem        := StrZero(nNumero_Ordem,4);
     cClassificacao       := FstrSpace(FormatMaskText('9999\.99\.99;0',qry_certificados.FieldByName('CD_NCM_NALADI').AsString),20);
     cNorma               := StrZero(qry_certificados.FieldByName('CD_NORMAS').AsInteger,3);
     cQtd                 := FFloatToStr(qry_certificados.FieldByName('QTD_MERCADORIA').AsFloat,9,3);
     cValor_FOB           := FFloatToStr(qry_certificados.FieldByName('VALOR_FOB').AsFloat,9,3);
     cCodigo_Declaracao   := FstrSpace(qry_certificados.FieldByName('CD_DECLARACAO').AsString,10);
     cVazio               := space(436);
     cLinha               := cID+cNumero_Ordem+cClassificacao+cNorma+cQtd+cValor_FOB+cCodigo_Declaracao+cVAZIO;
  end;

  if pRegras_Acordo=3 then begin
     nNumero_Ordem        := nNumero_Ordem+1;
     cNumero_Ordem        := StrZero(nNumero_Ordem,4);
     cClassificacao       := FstrSpace(FormatMaskText('9999\.99\.99;0',qry_certificados.FieldByName('CD_NCM_NALADI').AsString),20);
     cNorma               := StrZero(qry_certificados.FieldByName('CD_NORMAS').AsInteger,3);
     cCodigo_Declaracao   := FstrSpace(qry_certificados.FieldByName('CD_DECLARACAO').AsString,10);
     cVazio               := space(460);
     cLinha               := cID+cNumero_Ordem+cClassificacao+cNorma+cCodigo_Declaracao+cVAZIO;
  end;
  if cLinha<>'' then
     txtRemessa.Lines.Add(cLinha);

end;

function Tfrm_sistema_cool.Registro_Certificado_Itens_Denominacao(pRegras_Acordo:Integer):Boolean;
var
cLinha,cID,cVazio:String;
cDenominacao:String;
begin
  result                  := true;
  cID                     := '101';

  cLinha                  := '';
  if (pRegras_Acordo=1) or (pRegras_Acordo=3) then begin
     cDenominacao         := FstrSpace(qry_certificados.FieldByName('DENOMINACAO_NCM_NALADI').AsString,497);
     cLinha               := cID+cDenominacao;
  end;

  if pRegras_Acordo=2 then begin
     cDenominacao         := FstrSpace(qry_certificados.FieldByName('DENOMINACAO_NCM_NALADI').AsString,300);
     cVazio               := space(197);
     cLinha               := cID+cDenominacao+cVazio;
  end;

  if cLinha<>'' then
     txtRemessa.Lines.Add(cLinha);
end;


function Tfrm_sistema_cool.Trailler_Certificado:Boolean;
var
cLinha,cID,cVAZIO:String;
begin
  result           := true;
  cID              := '110';
  cVazio           := space(497);
  cLinha           := cID+cVAZIO;

  txtRemessa.Lines.Add(cLinha);

end;


procedure Tfrm_sistema_cool.cb_agrupaClick(Sender: TObject);

   function checa_agrupamento:boolean;
   begin
      result:=true;
      qry_certificados.DisableControls;
      qry_certificados.First;
      while not qry_certificados.Eof do begin
        if qry_certificados.FieldByName('CD_DECLARACAO').AsString='' then begin
           Result:=false;
           break;
        end;
        qry_certificados.Next;
      end;
      qry_certificados.EnableControls;
   end;

begin

  if cb_agrupa.Checked then
     if not checa_agrupamento then begin
        showmessage('Agrupamento não permitido, existe uma ou mais declarações não informada(s)');
        cb_agrupa.Checked:=false;
        abort;
     end;

  { ITENS DA FATURA }
  with qry_faturas_exportador_itens do begin
     close;
     SQL.Clear;
     SQL.Add(' select CD_DECLARACAO ');
     SQL.Add(' ,NR_PEDIDO  ');
     SQL.Add(' ,DT_VALIDADE  ');
     SQL.Add(' ,CD_NCM_NALADI ');
     SQL.Add(' ,CD_UNID_MEDIDA');
     SQL.Add(' ,isNull(cast(CD_UNID_MEDIDA as Int),0) CD_MEDIDA_NUMERICO  ');
//     SQL.Add(' ,''QUILOGRAMA LÍQUIDO'' EMBALAGEM, ');
     SQL.Add(' ,NM_UNID_MEDIDA EMBALAGEM, ');
     if cb_exibir_produto.Checked then begin
        SQL.Add(' "COD-"+ltrim(rtrim(cd_mercadoria))+"-(Nr Fatura) "+rtrim(cast(nm_mercadoria as varchar(8000))) + "-" ');
        SQL.Add(' + ');
     end;

     if cb_descricao_fiesp.Checked then
        SQL.Add(' NM_DECLARACAO ')
     else
        SQL.Add(' DESCRICAO_NCM_NALADI ');

     SQL.Add(' DENOMINACAO_NCM_NALADI ');
     SQL.Add(' ,CD_NORMAS ');
     SQL.Add(' ,NM_NORMA ');
     if cb_agrupa.Checked then begin
        if rgTipo_Medida.ItemIndex=0 then
           SQL.Add(' ,ROUND(sum(Peso_Liquido),6) QT_MERCADORIA ')
        else
           SQL.Add(' ,sum(Qtd_MERCADORIA) QT_MERCADORIA ');

        SQL.Add(' ,ROUND(sum(Peso_Liquido),6) Peso_Liquido ');
        SQL.Add(' ,ROUND(sum(Peso_Bruto),6)   Peso_Bruto ');
        SQL.Add(' ,sum(Valor_FOB ) VL_TOT_ITEM ');
        dbg_normas.Columns[0].Visible := false;
     end else begin
        if rgTipo_Medida.ItemIndex=0 then
           SQL.Add(' ,Peso_Liquido QT_MERCADORIA ')
        else
           SQL.Add(' ,Qtd_MERCADORIA  QT_MERCADORIA ');
        SQL.Add(' ,Peso_Liquido ');
        SQL.Add(' ,Peso_Bruto ');
        SQL.Add(' ,Valor_FOB VL_TOT_ITEM ');
        SQL.Add(' ,CD_MERCADORIA ');

        dbg_normas.Columns[0].Visible:=True;
     end;
     SQL.Add(' from FN_CO_FIESP(:NR_PROCESSO, :NR_PEDIDO,  :CD_ACORDO, :IN_CLIENTE_EXPORTADOR)  ');
     if cb_agrupa.Checked then begin
        SQL.Add(' Group By  ');
        SQL.Add('  CD_NCM_NALADI');
        SQL.Add(' , CD_UNID_MEDIDA ');
        SQL.Add(' , NM_UNID_MEDIDA ');

        if cb_descricao_fiesp.Checked then
           SQL.Add(' , NM_DECLARACAO ')
        else
           SQL.Add(' , DESCRICAO_NCM_NALADI ');

        SQL.Add(' , CD_NORMAS ');
        SQL.Add(' , NM_NORMA ');
        SQL.Add(' , NR_PEDIDO ');
        SQL.Add(' , CD_DECLARACAO ');
        SQL.Add(' , DT_VALIDADE  ');
     end;
     SQL.Add(' Order By CD_DECLARACAO ');
     SQL.Add(' , CD_NCM_NALADI ');
     SQL.Add(' , NM_UNID_MEDIDA ');

     ParamByName('NR_PROCESSO').AsString := qry_Processo_expNR_PROCESSO.AsString;
     ParamByName('NR_PEDIDO').AsString   := qry_Faturas_ExportadorNR_FATURA.AsString;
     ParamByName('CD_ACORDO').AsString   := trim(dblc_acordos.Text);
     ParamByName('IN_CLIENTE_EXPORTADOR').AsString   := intToStr(rgCO.ItemIndex);
     Open;
  end;


  { ITENS CERTIFICADO }
  with qry_certificados do begin
     close;
     SQL.Clear;
     SQL.Add(' select CD_DECLARACAO ');
     SQL.Add(' ,DT_VALIDADE  ');
     SQL.Add(' ,CD_NCM_NALADI ');
     SQL.Add(' ,CD_UNID_MEDIDA');
//     SQL.Add(' ,''QUILOGRAMA LÍQUIDO'' EMBALAGEM, ');
     SQL.Add(' ,NM_UNID_MEDIDA EMBALAGEM, ');
     if cb_exibir_produto.Checked then begin
        SQL.Add(' "COD-"+ltrim(rtrim(cd_mercadoria))+"-(Nr Fatura) "+rtrim(cast(nm_mercadoria as varchar(8000))) + "-" ');
        SQL.Add(' + ');
     end;

     if cb_descricao_fiesp.Checked then
        SQL.Add(' NM_DECLARACAO ')
     else
        SQL.Add(' DESCRICAO_NCM_NALADI ');

     SQL.Add(' DENOMINACAO_NCM_NALADI ');
     SQL.Add(' ,CD_NORMAS ');
     SQL.Add(' ,NM_NORMA ');
     if cb_agrupa.Checked then begin
        if rgTipo_Medida.ItemIndex=0 then
           SQL.Add(' ,ROUND(sum(Peso_Liquido),6) QTD_MERCADORIA ')
        else
           SQL.Add(' ,ROUND(sum(Qtd_MERCADORIA),6) QTD_MERCADORIA ');

        SQL.Add(' ,ROUND(sum(Peso_Liquido),6) Peso_Liquido ');
        SQL.Add(' ,ROUND(sum(Peso_Bruto),6) Peso_Bruto ');
        SQL.Add(' ,sum(Valor_FOB ) Valor_FOB ');
        dbg_normas.Columns[0].Visible := false;
     end else begin
        if rgTipo_Medida.ItemIndex=0 then
           SQL.Add(' ,Peso_Liquido Qtd_MERCADORIA')
        else
           SQL.Add(' ,Qtd_MERCADORIA ');

        SQL.Add(' ,Peso_Liquido ');
        SQL.Add(' ,Peso_Bruto ');
        SQL.Add(' ,Valor_FOB ');
        SQL.Add(' ,CD_MERCADORIA ');

        dbg_normas.Columns[0].Visible:=True;
     end;
     SQL.Add(' from FN_CO_FIESP(:NR_PROCESSO, :NR_PEDIDO, :CD_ACORDO,  :IN_CLIENTE_EXPORTADOR)  ');
     if cb_agrupa.Checked then begin
        SQL.Add(' Group By  ');
        SQL.Add('  CD_NCM_NALADI');
        SQL.Add(' , CD_UNID_MEDIDA ');
        SQL.Add(' , NM_UNID_MEDIDA ');

        if cb_descricao_fiesp.Checked then
           SQL.Add(' , NM_DECLARACAO ')
        else
           SQL.Add(' , DESCRICAO_NCM_NALADI ');

        SQL.Add(' , CD_NORMAS ');
        SQL.Add(' , NM_NORMA ');
        SQL.Add(' , CD_DECLARACAO ');
        SQL.Add(' , DT_VALIDADE  ');
     end;
     SQL.Add(' Order By CD_DECLARACAO ');
     SQL.Add(' , CD_NCM_NALADI ');
     SQL.Add(' , NM_UNID_MEDIDA ');

     ParamByName('NR_PROCESSO').AsString := qry_Processo_expNR_PROCESSO.AsString;
     ParamByName('NR_PEDIDO').AsString   := qry_Faturas_ExportadorNR_FATURA.AsString;
     ParamByName('CD_ACORDO').AsString   := trim(dblc_acordos.Text);
     ParamByName('IN_CLIENTE_EXPORTADOR').AsString   := intToStr(rgCO.ItemIndex);
     Open;
  end;

  nNumero_Ordem:=0;
end;

procedure Tfrm_sistema_cool.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then  begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG','AP_UNID_NEG'],['Código','Nome','Apelido'],'CD_UNID_NEG');
  end else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'AP_UNID_NEG');

  if edt_nm_unid_neg.Text<>'' then
     msk_nr_processo.SetFocus;


end;

procedure Tfrm_sistema_cool.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('  SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO,  EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA ');
  vListAux.Add('  FROM TPROCESSO_EXP PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_EXPORTADOR ');
  vListAux.Add('  WHERE EN.IN_EXPORTADOR = "1" ');
  vListAux.Add('  AND IsNull(EN.TX_SENHA_FIESP,"")<>"" ');
  vListAux.Add('  AND EN.IN_ATIVO = "1" ');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO',  'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA'],['Processo', 'Cliente', 'Apelido', 'CNPJ'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  msk_nr_processoExit(msk_nr_processo);
  vListAux.Free;


end;

procedure Tfrm_sistema_cool.pc_coolExit(Sender: TObject);
begin
  pc_cool.Visible:=False;
end;

procedure Tfrm_sistema_cool.FormShow(Sender: TObject);
begin
  pnl_descricao.Visible:= false;
  msk_cd_unid_neg.Text := '01';
  tx_nr_processo       := '';
  if trim(str_nr_processo)<>'' then begin
     msk_nr_processo.Color    := clMenu;
     msk_nr_processo.TabStop  := False;
     msk_nr_processo.ReadOnly := true;
     msk_nr_processo.Text     := trim(copy(str_nr_processo,5,12));
     btn_co_processo.Visible  := false;
     msk_nr_processoExit(sender);
  end else  msk_nr_processo.SetFocus;
end;

procedure Tfrm_sistema_cool.msk_nr_processoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
     btn_co_processo.SetFocus;
//    msk_nr_processoExit(sender);

end;

procedure Tfrm_sistema_cool.seleciona_todos(Sender: TObject);
begin
 TEdit(sender).SelectAll;
end;

procedure Tfrm_sistema_cool.msk_nr_processoExit(Sender: TObject);
var
strErro:String;
begin
  if Trim(msk_nr_processo.Text)='' then exit;


  if msk_cd_unid_neg.Text='' then begin
     ShowMessage('informe o Numero da Unidade');
     msk_nr_processo.Text:='';
     msk_cd_unid_neg.SetFocus;
     abort;
  end;


  tx_nr_processo := Trim( msk_cd_unid_neg.Text ) + '02' + Trim( msk_nr_processo.Text );

  strErro:='';
  with TQuery.Create(Application) do begin
    SQL.Clear;
    DataBaseName := 'DBBROKER';

    // CHECA SE EXISTE ITENS CADASTRADOS
    SQL.ADD(' SELECT COUNT(*) ') ;
    SQL.ADD(' from TPROCESSO_EXP pe  ') ;
    SQL.ADD(' where pe.NR_PROCESSO = :NR_PROCESSO ') ;
    SQL.ADD(' and pe.NR_PROCESSO in (select pei.NR_PROCESSO from TPROCESSO_EXP_ITEM pei where IsNull(pei.NR_PROCESSO,"")<>"" and IsNull(pei.NR_PEDIDO,"")<>"") ') ;
    ParamByName('NR_PROCESSO').AsString:=tx_NR_PROCESSO;
    Open;
    if fields[0].AsInteger=0 then
       strErro:=strErro+' - Não Consta Item Cadastrado para este processo'+#13;
    Close;



    //  CHECA SE EXISTE CONSIGNATARIO
    SQL.ADD(' SELECT COUNT(*) ') ;
    SQL.ADD(' from TPROCESSO_EXP pe  ') ;
    SQL.ADD(' where pe.NR_PROCESSO = :NR_PROCESSO ') ;
    SQL.ADD(' and isNull(pe.cd_consignatario,"")<>"" ') ;
    ParamByName('NR_PROCESSO').AsString:=tx_NR_PROCESSO;
    Open;
    if fields[0].AsInteger=0 then
       strErro:=strErro+' - Não Consta Consignatario Cadastrado para este processo'+#13;
    Close;

    Free;
  end;

  if strErro<>'' then begin
     Showmessage(strErro);
     exit;
  end;   

  //
  pnl_faturas.Visible:=True;
  qry_faturas_exportador.Close;
  qry_faturas_exportador.ParamByName('NR_PROCESSO').AsString:=tx_NR_PROCESSO;
  qry_faturas_exportador.Open;
  if qry_faturas_exportadorNR_FATURA.AsString='' then begin
     Showmessage('Numero da Fatura não encontrado!');
     msk_nr_processo.SetFocus;
     exit;
  end;

  dblc_faturas.KeyValue:=qry_faturas_exportadorNR_FATURA.AsString;


  dblc_faturas.SetFocus;

end;

function Tfrm_sistema_cool.consiste:boolean;
var
txt_msg  : string;
VL_GERAL : Double;
begin
  result  := true;
  txt_msg := '';
  if  eAssinante.Text='' then begin
     txt_msg := txt_msg+'Nome de quem Assina não informado'+#13;
     eAssinante.SetFocus;
     result  := false;
  end;

  { 010 }
  if  qry_processo_expCGC_EMPRESA.AsString='' then begin
     txt_msg := txt_msg+'CNPJ do Exportador não informado'+#13;
     result  := false;
  end;
  if edt_exportador.Text='' then begin
     txt_msg := txt_msg+'Nome do Exportador não informado'+#13;
     result  := false;
  end;

  { 020 }
  if qry_processo_expCD_ACORDO_COOL.AsString='' then begin
     txt_msg := txt_msg+'Acordo não informado'+#13;
     result  := false;
  end;

  { 030 }
  if edt_importador.Text='' then begin
     txt_msg := txt_msg+'Nome do Importador não informado'+#13;
     result  := false;
  end;
  if edt_end_importador.Text='' then begin
     txt_msg := txt_msg+'Endereço do Importador não informado'+#13;
     result  := false;
  end;
  if qry_processo_expCD_PAIS_IMPORTADOR_COOL.AsString='' then begin
     txt_msg := txt_msg+'Codigo do País do Importador Inválido'+#13;
     result  := false;
  end;
  if edt_numero_fatura.Text='' then begin
     txt_msg := txt_msg+'Numero da Fatura Inexistente'+#13;
     result  := false;
  end;
  if edt_data_fatura.Text='  /  /    ' then begin
     txt_msg := txt_msg+'Data da Fatura Inválida'+#13;
     result  := false;
  end;

  VL_GERAL:=0;
  qry_faturas_exportador_Itens.First;
  while not(qry_faturas_exportador_Itens.Eof) do begin
    VL_GERAL:=VL_GERAL+qry_faturas_exportador_ItensVL_TOT_ITEM.AsFloat;
    qry_faturas_exportador_Itens.Next;
  end;

  if VL_GERAL=0 then begin
     txt_msg := txt_msg+'Valor total da Fatura está zerado'+#13;
     result  := false;
  end;
  if qry_faturas_exportadorVL_PESO_BRUTO.AsFloat=0 then begin
     txt_msg := txt_msg+'Peso bruto está zerado'+#13;
     result  := false;
  end;
  if qry_faturas_exportadorVL_PESO_LIQUIDO.AsFloat=0 then begin
     txt_msg := txt_msg+'Peso Liquido está zerado'+#13;
     result  := false;
  end;

  { 040 }
  if qry_faturas_exportador_itensQT_MERCADORIA.asFloat=0 then begin
     txt_msg := txt_msg+'Qtd mercadoria está zerada'+#13;
     result  := false;
  end;
  if qry_faturas_exportador_itensCD_UNIDADE_MEDIDA_COOL.AsString='' then begin
     txt_msg := txt_msg+'Codigo da Unidade de medida inválido'+#13;
     result  := false;
  end;
  if qry_faturas_exportador_itensDENOMINACAO_NCM_NALADI.AsString='' then begin
     txt_msg := txt_msg+'Denominação da Classificação está em branco'+#13;
     result  := false;
  end;
  if qry_faturas_exportador_itensCD_DECLARACAO.AsString='' then begin
     txt_msg := txt_msg+'Código da Declaração Inválido'+#13;
     result  := false;
  end;
  if qry_faturas_exportador_ItensVL_TOT_ITEM.AsFloat=0 then begin
     txt_msg := txt_msg+'Valor FOB está zerado';
     result  := false;
  end;


  if not result then
    showmessage(txt_msg);


end;


procedure Tfrm_sistema_cool.AlterarNorma1Click(Sender: TObject);
Var
cCD_NORMA,cCD_NORMA_ANTERIOR,cCaption_Tela:String;
begin

  showmessage('Favor fazer a alteração da norma no cadastro.');

  exit;

  cCD_NORMA_ANTERIOR:=qry_certificados.FieldByName('CD_NORMAS').AsString;
  //
  cCaption_Tela:='Classificação: '+qry_certificados.FieldByName('CD_NCM_NALADI').AsString+' - '+qry_certificados.FieldByName('NM_NORMA').AsString;
  cCD_NORMA:=ConsultaOnLineExSQL(
      'SELECT distinct N.CODIGO, N.NM_DESCRICAO FROM TNORMAS N (NOLOCK), TCONFIG_PAIS_ACORDO_NORMA_PADRAO AN (NOLOCK) ' +
      'WHERE N.CODIGO = AN.CD_NORMA ' +
      '  AND IN_ATIVO = ''1'' ' +
      '  AND AN.CD_ACORDO =  '''+ trim(dblc_acordos.Text) + ''' ',
      cCaption_Tela  ,['CODIGO', 'NM_DESCRICAO'],['Código', 'Descrição'], 'CODIGO');

  if cCD_NORMA='' then
     exit;

  { Efetiva a Alteração da Norma }
  with TQuery.Create(Application) do begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' update TPROCESSO_EXP_ITEM set CD_NORMAS = :CD_NORMA_NOVA ');
      SQL.Add(' where NR_PROCESSO      = :NR_PROCESSO        ');
      SQL.Add(' and  CD_ACORDO         = :CD_ACORDO          ');
      SQL.Add(' and  CD_NORMAS         = :CD_NORMA           ');
      SQL.Add(' and  CD_UNID_MEDIDA    = :CD_UNIDADE_MEDIDA  ');
      SQL.Add(' and  :CD_NCM_NALADI =                        ');
      SQL.Add(' case                                         ');
      SQL.Add('   when CD_ACORDO="ACE 18" then               ');
      SQL.Add('       CD_NCM                                 ');
      SQL.Add('   else                                       ');
      SQL.Add('       CD_NALADI_SH                           ');
      SQL.Add(' end                                          ');
      if not(cb_Agrupa.Checked) then
        SQL.Add(' and  CD_MERCADORIA = :CD_MERCADORIA        ');

      ParamByName('CD_NORMA_NOVA').AsString     := cCD_NORMA;
      ParamByName('NR_PROCESSO').AsString       := qry_processo_expNR_PROCESSO.AsString;
      ParamByName('CD_ACORDO').AsString         := trim(dblc_acordos.Text);
      ParamByName('CD_NORMA').AsString          := cCD_NORMA_ANTERIOR;
      ParamByName('CD_UNIDADE_MEDIDA').AsString := qry_certificados.FieldByName('CD_UNID_MEDIDA').AsString;
      ParamByName('CD_NCM_NALADI').AsString     := qry_certificados.FieldByName('CD_NCM_NALADI').AsString ;
      if not(cb_Agrupa.Checked) then
        ParamByName('CD_MERCADORIA').AsString         := qry_certificados.FieldByName('CD_MERCADORIA').AsString;

      ExecSQL;


      if (MessageDlg('Deseja Alterar Tambem no Cadastro de Mercadorias'+#13+
                 'para que seja sempre utilizada essa nova Norma ?',mtConfirmation,[mbNo,mbYes],0)=mrYes) then begin

          SQL.Clear;
          SQL.Add(' update TMERC_EXP_ACORDO set CD_NORMA = :CD_NORMA_NOVA ');
          SQL.Add(' where CD_MERCADORIA IN                                ');
          SQL.Add(' (                                                     ');
          SQL.Add('     select i.CD_MERCADORIA from TPROCESSO_EXP_ITEM i  ');
          SQL.Add('     where i.NR_PROCESSO      = :NR_PROCESSO           ');
          SQL.Add('     and  i.CD_ACORDO         = :CD_ACORDO             ');
          SQL.Add('     and  i.CD_NORMAS         = :CD_NORMA_NOVA         ');
          SQL.Add('     and  i.CD_UNID_MEDIDA    = :CD_UNIDADE_MEDIDA     ');
          SQL.Add('     and  :CD_NCM_NALADI =                             ');
          SQL.Add('     case                                              ');
          SQL.Add('        when i.CD_ACORDO="ACE 18" then                 ');
          SQL.Add('            i.CD_NCM                                   ');
          SQL.Add('        else                                           ');
          SQL.Add('            i.CD_NALADI_SH                             ');
          SQL.Add('     end                                               ');
          if not(cb_Agrupa.Checked) then
            SQL.Add('   and  i.CD_MERCADORIA = :CD_MERCADORIA             ');
          SQL.Add(' )                                                     ');
          SQL.Add(' and cd_acordo = :CD_ACORDO                            ');
          SQL.Add(' and CD_NORMA  = :CD_NORMA                            ');
          ParamByName('CD_NORMA_NOVA').AsString     := cCD_NORMA;
          ParamByName('NR_PROCESSO').AsString       := qry_processo_expNR_PROCESSO.AsString;
          ParamByName('CD_ACORDO').AsString         := trim(dblc_acordos.Text);
          ParamByName('CD_NORMA').AsString          := cCD_NORMA_ANTERIOR;
          ParamByName('CD_UNIDADE_MEDIDA').AsString := qry_certificados.FieldByName('CD_UNID_MEDIDA').AsString;
          ParamByName('CD_NCM_NALADI').AsString     := qry_certificados.FieldByName('CD_NCM_NALADI').AsString ;
          if not(cb_Agrupa.Checked) then
            ParamByName('CD_MERCADORIA').AsString   := qry_certificados.FieldByName('CD_MERCADORIA').AsString;

          ExecSQL;
      end;

      Free;

      cb_agrupaClick(self);


  end;

end;

procedure Tfrm_sistema_cool.dbg_normasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dbg_normas.SelectedRows.CurrentRowSelected=true then begin
     dbg_normas.Canvas.Brush.Color := clBlue;
     dbg_normas.Canvas.Font.Color  := clWhite;
  end else begin
     if qry_certificados.FieldByName('DT_VALIDADE').AsDateTime=date then begin
       dbg_normas.Canvas.Brush.Color := clYellow;
       dbg_normas.Canvas.Font.Color  := clBlack;
     end;

     if rx_acordo.Caption<>'COMUM' then
        if qry_certificados.FieldByName('DT_VALIDADE').AsDateTime < date then begin
          dbg_normas.Canvas.Brush.Color := $00404080;
          dbg_normas.Canvas.Font.Color  := clWhite;
        end;

     if length(qry_certificados.FieldByName('DENOMINACAO_NCM_NALADI').AsString)>300 then begin
       dbg_normas.Canvas.Brush.Color := clRed;
       dbg_normas.Canvas.Font.Color  := clWhite;
     end;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State );
end;

procedure Tfrm_sistema_cool.edt_cgc_empresaClick(Sender: TObject);
begin
  edt_cgc_empresa.SelectAll;
end;

procedure Tfrm_sistema_cool.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se pressionar ESC encerra
//  if Key = #27 then
//    btn_SairClick(nil);

end;

procedure Tfrm_sistema_cool.btn_Zoom_maisClick(Sender: TObject);
begin
  pnl_certificado.Height:=41;
  btn_zoom_menos.BringToFront;
end;

procedure Tfrm_sistema_cool.btn_Zoom_menosClick(Sender: TObject);
begin
  pnl_certificado.Height:=241;
  btn_zoom_mais.BringToFront;  
end;

procedure Tfrm_sistema_cool.cb_exibir_produtoClick(Sender: TObject);
begin
  if cb_exibir_produto.Checked then begin
    cb_descricao_fiesp.Enabled:=False;
    cb_agrupa.Checked:=false;
    cb_agrupa.Enabled:=false;
  end else begin
     cb_descricao_fiesp.Enabled:=True;
     cb_agrupa.Enabled:=true;
  end;

  cb_agrupaClick(sender);
end;

procedure Tfrm_sistema_cool.rgCOClick(Sender: TObject);
begin
  if (pnl_faturas.Visible) and (pnl_acordos.Visible) then
     dblc_acordosExit(sender);
end;

procedure Tfrm_sistema_cool.lbl_fecha_tituloClick(Sender: TObject);
begin
  edt_exportador.SetFocus;
  pnl_descricao.Visible := False;
end;

procedure Tfrm_sistema_cool.btn_salvarClick(Sender: TObject);
begin
//  vDescricao:= dbmm_descricao.Text;
  if qry_certificados.State <> dsEdit then
    qry_certificados.Edit;
  qry_certificados.FieldByName('DENOMINACAO_NCM_NALADI').AsString := dbmm_descricao.Text;
  qry_certificados.Post;
  edt_exportador.SetFocus;

  //dbg_normas.Options:= [dgediting];
  pnl_descricao.Visible:=false;
  //dbg_normas.SetFocus;
  //frm_sistema_cool.msk_nr_processoExit(nil);
end;

procedure Tfrm_sistema_cool.dbg_normasDblClick(Sender: TObject);
var
strCD_DECLARACAO:String;
vListAux : TStringList;
begin
  if dbg_normas.Columns.Items[dbg_normas.SelectedIndex].FieldName = 'DENOMINACAO_NCM_NALADI' then begin
    a:= dbg_normas.SelectedIndex;
    pnl_descricao.Visible := True;
    dbmm_descricao.Text:= FstrSpace(qry_certificados.FieldByName('DENOMINACAO_NCM_NALADI').AsString,300);
    qry_certificados.Edit;
  end;

  if dbg_normas.Columns.Items[dbg_normas.SelectedIndex].FieldName = 'CD_DECLARACAO' then begin
     if cb_agrupa.Checked then begin
        ShowMessage('Favor desagrupar os itens antes de escolher uma Declaração!!!');
        exit;
     end;

//     dbg_normas.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowSelect,dgAlwaysShowSelection];
//     dbg_normas.SelectedRows.CurrentRowSelected:=true;
     //
     vListAux := TStringList.Create;
     vListAux.Add('  SELECT CD_DECLARACAO,DT_VALIDADE, NM_DECLARACAO ');
     vListAux.Add('  FROM TDECLARACOES_FIESP ( NOLOCK ) ');
     vListAux.Add('  WHERE                              ');
     vListAux.Add('  CD_EMPRESA           = '+ QuotedStr(qry_processo_expCD_CLIENTE.AsString) );
     vListAux.Add('  AND CD_ACORDO_FIESP  = '+ QuotedStr(qry_processo_expCD_ACORDO_COOL.AsString) );
     vListAux.Add('  AND CD_NCM_NALADI    = '+ QuotedStr(qry_certificados.FieldByName('CD_NCM_NALADI').asstring) );
     vListAux.Add('  AND IN_ATIVO         = '+ QuotedStr('1') );
     strCD_DECLARACAO := ConsultaOnLineExSQLList(vListAux,'Declarações por NCM/NALADI',['CD_DECLARACAO',  'DT_VALIDADE', 'NM_DECLARACAO'],['Código', 'Validade', 'Descrição'],'CD_DECLARACAO',nil, strCD_DECLARACAO, trim(qry_certificados.FieldByName('DENOMINACAO_NCM_NALADI').AsString)  );
     vListAux.Free;
     //
//     dbg_normas.SelectedRows.CurrentRowSelected:=false;
//     dbg_normas.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines];

     if strCD_DECLARACAO<>'' then begin
        if not (dbg_normas.DataSource.DataSet.State in [dsEdit,dsInsert]) then
           dbg_normas.DataSource.DataSet.Edit;

        dbg_normas.DataSource.DataSet.FieldByName('CD_DECLARACAO').AsString:=strCD_DECLARACAO;
        dbg_normas.DataSource.DataSet.Post;

        //grava a declaração preferencial na tmercadoria_exp
        salva_declaracao(sender);
     end;
  end;


end;

procedure Tfrm_sistema_cool.cb_descricao_fiespClick(Sender: TObject);
begin
  if cb_descricao_fiesp.Checked then
     cb_exibir_produto.Enabled:=False
  else
     cb_exibir_produto.Enabled:=True;

  cb_agrupaClick(sender);
end;

procedure Tfrm_sistema_cool.btn_cd_obsClick(Sender: TObject);
var
newTexto:String;
begin
   newTexto:=ConsultaLookUp('TOBSERVACOES','CD_OBS', ConsultaOnlineExFiltro('TOBSERVACOES','Observações',['CD_OBS', 'TX_DESCRICAO'],['Código','Descrição'],'CD_OBS','CD_PRODUTO="02"',nil),'TX_OBS') + newTexto;
   if trim(newTexto)<>'' then
      edt_OBS.Lines.Add( newTexto );
end;

procedure Tfrm_sistema_cool.salva_declaracao(Sender: TObject);
begin
  if dbg_normas.Columns.Items[dbg_normas.SelectedIndex].FieldName = 'CD_DECLARACAO' then
     if trim(qry_certificados.FieldByName('CD_DECLARACAO').AsString)<>'' then begin
        with TQuery.Create(Application) do begin
          SQL.Clear;
          DataBaseName := 'DBBROKER';
          SQL.ADD(' Update TMERCADORIA_EXP set CD_DECLARACAO_PREFERENCIAL = "'+ trim(qry_certificados.FieldByName('CD_DECLARACAO').AsString)+'"' ) ;
          SQL.Add(' WHERE CD_MERCADORIA = "'+trim(qry_certificados.FieldByName('CD_MERCADORIA').AsString)+'"'  );
          ExecSQL;
          free;
        end;
        cb_agrupaClick(sender);
        dbg_normas.DataSource.DataSet.Last;
     end;

end;

procedure Tfrm_sistema_cool.dbg_normasColExit(Sender: TObject);
begin
  //grava a declaração preferencial na tmercadoria_exp
  if dbg_normas.Columns.Items[dbg_normas.SelectedIndex].FieldName = 'CD_DECLARACAO' then 
     salva_declaracao(sender);



end;

procedure Tfrm_sistema_cool.rgTipo_MedidaClick(Sender: TObject);
begin
  cb_agrupaClick(sender);
end;

procedure Tfrm_sistema_cool.dblc_faturasExit(Sender: TObject);
begin
  pnl_acordos.Visible:=true;

  qry_acordos.Close;
  qry_acordos.ParamByName('NR_PROCESSO').AsString:=tx_NR_PROCESSO;
  qry_acordos.ParamByName('NR_PEDIDO').AsString:=dblc_faturas.Text;
  qry_acordos.Open;

  if qry_acordosCD_ACORDO.AsString='' then begin
     Showmessage('Acordo não encontrado!');
     dblc_faturas.SetFocus;
     exit;
  end;


  dblc_acordos.KeyValue:=qry_acordosCD_ACORDO.AsString;

  dblc_acordos.Setfocus;
end;

procedure Tfrm_sistema_cool.dblc_acordosExit(Sender: TObject);
begin
  qry_processo_exp.Close;
  qry_processo_exp.ParamByName('NR_PROCESSO').AsString := tx_nr_processo;
  qry_processo_exp.ParamByname('param').AsString:=inttostr(rgCO.ItemIndex);
  qry_processo_exp.Open;

  //
  if qry_processo_exp.RecordCount=0 then begin

     ShowMessage('Processo Inválido ou Inexistente!!');
     msk_nr_processo.Text:='';
     msk_nr_processo.SetFocus;

     if trim(str_nr_processo)<>'' then
        close;

     abort;
  end;
  edt_cgc_empresa.Text := FormatMaskText('99\.999\.999\/9999\-99;0',qry_processo_expCGC_EMPRESA.AsString);

  //
  { Associa as colunas do banco nos EDITs }
  edt_exportador.Text         := qry_processo_expNM_EMPRESA.AsString;
  edt_end_exportador.Text     := qry_processo_expEND_PAIS_EXPORTADOR.AsString;
  edt_importador.Text         := qry_processo_expNM_IMPORTADOR.AsString;
  edt_end_importador.Text     := qry_processo_expEND_IMPORTADOR.AsString;
  edt_consignatario.Text      := qry_processo_expnome_consignatario.AsString;
  edt_pais_consignatario.Text := qry_processo_expPais_consignatario.AsString;
  edt_embarque.Text           := qry_processo_expLOCAL_EMBARQUE.AsString;
  edt_pais_destino.Text       := qry_processo_expPais_Destino.AsString;
  edt_meio_transporte.Text    := qry_processo_expMEIO_TRANSPORTE.AsString;
  edt_data_fatura.Date        := qry_processo_expDT_FATURA.AsDateTime;

  rgCO.Visible       :=True;

  pc_cool.Refresh;
  pc_cool.Visible := True;

  pTopo.Refresh;
  {alimenta os dados da fatura nos Edit ´ s}
  edt_numero_fatura.Text      := qry_faturas_exportadorNR_FATURA.AsString;
  edt_OBS.Text                := qry_faturas_exportadorOBS.AsString;


  if trim(dblc_acordos.Text)='ACE 18' then
     dbg_normas.Columns[3].Title.Caption:='Descrição do NCM'
  else
     dbg_normas.Columns[3].Title.Caption:='Descrição do NALADI';

  if trim(dblc_acordos.Text)='' then begin
     rx_acordo.Caption:='Sem Acordo';
     dbg_normas.Columns[3].Title.Caption:='Descrição';
  end else
     rx_acordo.Caption:=trim(dblc_acordos.Text);



  if trim(dblc_acordos.Text)='COMUM' then begin
     cb_exibir_produto.Checked     := true;
     dbg_normas.Columns[1].Visible := false;
     dbg_normas.Columns[6].Visible := false;
     dbg_normas.Columns[7].Visible := false;
     dbg_normas.Columns[8].Visible := false;
     cb_descricao_fiesp.Visible    := false;
  end else begin
     cb_exibir_produto.Checked     := False;
     dbg_normas.Columns[1].Visible := true;
     dbg_normas.Columns[6].Visible := true;
     dbg_normas.Columns[7].Visible := true;
     dbg_normas.Columns[8].Visible := true;
     cb_descricao_fiesp.Visible    := true;
  end;

  //atualiza o grid do certificado e a query dos itens da fatura
  cb_agrupaClick(self);


  eAssinante.SetFocus;

end;

procedure Tfrm_sistema_cool.msk_nr_processoEnter(Sender: TObject);
begin
  pnl_faturas.Visible:=False;
  pnl_acordos.Visible:=false;
//  rgCO.Visible       :=false;
end;

procedure Tfrm_sistema_cool.dblc_faturasEnter(Sender: TObject);
begin
  pnl_acordos.Visible:=false;
//  rgCO.Visible:=false;
end;

procedure Tfrm_sistema_cool.dbg_normasCellClick(Column: TColumn);
begin
  dbg_normas.SelectedRows.CurrentRowSelected:=true;
end;

procedure Tfrm_sistema_cool.qry_certificadosBeforeScroll(
  DataSet: TDataSet);
begin
   dbg_normas.SelectedRows.CurrentRowSelected:=false;
end;

end.


