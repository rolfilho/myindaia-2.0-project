unit OiValorPorAdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, ConsOnLineEx, RlDIValoresPorAdicao, DMLeiaute;

type
  TfrmOiValorPorAdicao = class(TForm)
    Panel1: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    btn_co_processo: TSpeedButton;
    lbl_nr_processo: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_nr_processo: TMaskEdit;
    Panel3: TPanel;
    btn_sair: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    btnGrupo: TSpeedButton;
    mskGrupo: TMaskEdit;
    edtGrupo: TEdit;
    Label2: TLabel;
    mskEmpresa: TMaskEdit;
    edtEmpresa: TEdit;
    btnEmpresa: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFin: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    mskDataFinCalc: TMaskEdit;
    mskDataIniCalc: TMaskEdit;
    Label7: TLabel;
    mskArea: TMaskEdit;
    edtArea: TEdit;
    btnArea: TSpeedButton;
    mskMercadoria: TMaskEdit;
    Label8: TLabel;
    edtMercadoria: TEdit;
    btnMercadoria: TSpeedButton;
    Label9: TLabel;
    mskNcm: TMaskEdit;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btnAreaClick(Sender: TObject);
    procedure btnMercadoriaClick(Sender: TObject);
  private
    { Private declarations }
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FDataInicialCalculo: TDateTime;
    FDataFinalCalculo: TDateTime;
    FNrProcesso: string;
    FGrupo : String;
    FEmpresa : String;
    FArea : String;
    FNcm : String;
    FMercadoria : String;    
  function ValidarDatas :Boolean;
  function ValidarDatasCalculo: Boolean;
  procedure Executa;
  function GetSQL : string;
  public
    { Public declarations }
  end;

var
  frmOiValorPorAdicao: TfrmOiValorPorAdicao;

implementation

uses PGGP001, Funcoes, uConsulta, dgLeiauteLista;

{$R *.dfm}


procedure TfrmOiValorPorAdicao.SpeedButton2Click(Sender: TObject);
var
  TemFiltroPorData, TemFiltroPorDataCalculo  : Boolean;
begin
  if (trim(msk_cd_unid_neg.Text) = '') or (trim(msk_cd_produto.Text) = '') or (trim(msk_nr_processo.Text) = '') then
    FNrProcesso := ''
  else
    FNrProcesso := UpperCase(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text);

  TemFiltroPorData := ValidarDatas;
  TemFiltroPorDataCalculo := ValidarDatasCalculo;

  if (FNrProcesso = '') and (not TemFiltroPorData) and (not TemFiltroPorDataCalculo) then
  begin
    ShowMessage('Necessário informar o filtro por número do processo, data  de registro ou data de cálculo');
    abort;
  end;

  FGrupo := Trim(mskGrupo.text);
  FEmpresa := Trim(mskEmpresa.text);
  FArea := Trim(mskArea.Text);
  FNcm := Trim(mskNcm.Text);
  FMercadoria := Trim(mskMercadoria.Text);

  Executa;
end;

procedure TfrmOiValorPorAdicao.Executa;
var
  Form: TfmConsulta;
  TemData : Boolean;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'DI - Valores por Adição';

	  Form.Titulocoluna.Add('NR_PROCESSO=Ref. Indaiá');

    Form.Titulocoluna.Add('NM_CLIENTE=Cliente');
    Form.Titulocoluna.Add('NM_GRUPO=Grupo');
    Form.Titulocoluna.Add('COD_INTERNO=BR');
    Form.Titulocoluna.Add('END_UF=UF (Cliente)');
    Form.Titulocoluna.Add('CGC_EMPRESA=CNPF (Cliente)');
    Form.Titulocoluna.Add('AREA=Area');
	  Form.Titulocoluna.Add('NR_PROC_PO=Nr. PO');

    Form.Titulocoluna.Add('NR_DECLARACAO_IMP=Nr. DI');
	  Form.Titulocoluna.Add('DT_REGISTRO_DI=Data DI');
    Form.Titulocoluna.Add('DT_DESEMBARACO=Data Desembaraco');
    Form.Titulocoluna.Add('DT_REALIZACAO=Data de Chegada');

    Form.Titulocoluna.Add('NM_EMPRESA=Exportador');
    Form.Titulocoluna.Add('EXP_COD_MY=Exportador - Cód. My');
    Form.Titulocoluna.Add('EXP_NIT=Exportador - Cód. TIN)');
    Form.Titulocoluna.Add('EXP_PAIS_SIGLA=Exportador - Sigla País)');
    Form.Titulocoluna.Add('EXPO_CIDADE=Exportador - Cidade)');
    Form.Titulocoluna.Add('EXPO_END=Exportador - Endereço)');
    Form.Titulocoluna.Add('EXPO_ESTADO=Exportador - Estado)');
    Form.Titulocoluna.Add('EXPO_COMPL=Exportador - Complemento)');

    Form.Titulocoluna.Add('FAB=Fabricante');
    Form.Titulocoluna.Add('FAB_COD_MY=Fabricante - Cód. My');
    Form.Titulocoluna.Add('FAB_NIT=Fabricante - Cód. TIN)');
    Form.Titulocoluna.Add('FAB_PAIS_SIGLA=Fabricante - Sigla País)');
    Form.Titulocoluna.Add('FAB_CIDADE=Fabricante - Cidade)');
    Form.Titulocoluna.Add('FAB_END=Fabricante - Endereço)');
    Form.Titulocoluna.Add('FAB_ESTADO=Fabricante - Estado)');
    Form.Titulocoluna.Add('FAB_COMPL=Fabricante - Complemento)');


    Form.Titulocoluna.Add('NR_ADICAO=Adição');
    Form.Titulocoluna.Add('NR_ITEM=Item');

    Form.Titulocoluna.Add('CD_MERCADORIA=Cod. Mercadoria');
    Form.Titulocoluna.Add('NM_MERCADORIA=Mercadoria');
    Form.Titulocoluna.Add('NCM=NCM');
    Form.Titulocoluna.Add('QTDE_COMERCIALIZADA=Qtde. Comercializada');
    Form.Titulocoluna.Add('UM_SIGLA=Unid. Medida Com. (Sigla)');
    Form.Titulocoluna.Add('PL_MERCADORIA=Peso Líquido');
    Form.Titulocoluna.Add('PESO_BRUTO_ITEM=Peso Bruto Item');
    Form.Titulocoluna.Add('CD_CFOP=CFOP');
    Form.Titulocoluna.Add('VL_UNITARIO=Preço Unitário');
    Form.Titulocoluna.Add('VA_UNITARIO=V.A. Unitário');
    Form.Titulocoluna.Add('UNID_MED_COMERC=Unid. Med. Comercializada');
    Form.Titulocoluna.Add('QT_UN_ESTAT=Qtde Uni. estatística');
    Form.Titulocoluna.Add('UN_ESTAT=Uni. estatística');

    Form.Titulocoluna.Add('CD_INCOTERM=Incoterm');
    Form.Titulocoluna.Add('CD_METOD_VALORACAO=Método de Valoração');
    Form.Titulocoluna.Add('NR_CONHECIMENTO=Nr. Conhecimento');

    Form.Titulocoluna.Add('MOEDA_MERCADORIA=Moeda Mercadoria');
    Form.Titulocoluna.Add('VL_ADUANEIRO_ITEM=Valor Aduaneiro');
    Form.Titulocoluna.Add('VL_ADUANEIRO_ITEM_USD=Valor Aduaneiro (USD)');
    Form.Titulocoluna.Add('VL_MLE=Valor MLE');
    Form.Titulocoluna.Add('VL_MLE_RS=Valor MLE (R$)');
    Form.Titulocoluna.Add('VL_FRETE_ITEM_MN=Frete');
    Form.Titulocoluna.Add('MOEDA_FRETE=Moeda Frete');
    Form.Titulocoluna.Add('VL_FRETE_MLE=Frete na moeda MLE');
    Form.Titulocoluna.Add('VL_SEGURO_ITEM_MN=Seguro');
    Form.Titulocoluna.Add('CD_MOEDA_SEGURO=Moeda Seguro');
    Form.Titulocoluna.Add('VL_TX_SCX_ITEM=TUS');
    Form.Titulocoluna.Add('VL_ACRESCIMO_ITEM_MN=Acréscimos');
    Form.Titulocoluna.Add('ACRESCIMOS=Descrição Acréscimos');
    Form.Titulocoluna.Add('VL_DEDUCAO_ITEM_MN=Deduções');
    Form.Titulocoluna.Add('DEDUCOES=Descrição Deduções');

    Form.Titulocoluna.Add('VL_II_ITEM=II');
    Form.Titulocoluna.Add('NR_EX=Nr. EX');
    Form.Titulocoluna.Add('ALIQUOTA_II=Alíquota II');
    Form.Titulocoluna.Add('VL_II_ITEM_CALCULADO=Valor Calculado II');
    Form.Titulocoluna.Add('VL_II_CALCULADO_RECOLHIDO=Diferença calculado e recolhido II');
    Form.Titulocoluna.Add('REG_TRIB_II=Regime de tributação II');
    Form.Titulocoluna.Add('FUND_LEGAL_II=Fundamento Legal II');
    Form.Titulocoluna.Add('VL_IPI_ITEM=IPI Item');
    Form.Titulocoluna.Add('ALIQUOTA_IPI=Alíquota IPI');
    Form.Titulocoluna.Add('VL_BASE_CALCULO_IPI=Base de cálculo IPI');
    Form.Titulocoluna.Add('VL_PIS_ITEM=PIS Item');
    Form.Titulocoluna.Add('ALIQ_PIS=PIS');
    Form.Titulocoluna.Add('BASE_PIS=Base PIS');
    Form.Titulocoluna.Add('VL_COFINS_ITEM=Cofins Item');
    Form.Titulocoluna.Add('ALIQ_COFINS=COFINS');
    Form.Titulocoluna.Add('BASE_COFINS=Base COFINS');
    Form.Titulocoluna.Add('VL_ANTIDUMPING_ITEM=ANTIDUMPING');

    Form.Titulocoluna.Add('VL_ICMS_A_RECOLHER_AFRMM_ITEM=ICMS');
    Form.Titulocoluna.Add('VL_FUNDO_ICMS_ITEM=ICMS - Fundo de pobreza');
    Form.Titulocoluna.Add('VL_AFRMM_ITEM=AFRMM');
    Form.Titulocoluna.Add('BASE_CALCULO_ICMS=Base de Cálculo ICMS');
    Form.Titulocoluna.Add('ALIQUOTA_ICMS=Alíquota ICMS');
    Form.Titulocoluna.Add('TAXA_MOEDA_MERCADORIA=Taxa Moeda Mercadoria');
    Form.Titulocoluna.Add('BASE_ICMS_REDUZIDA=Base ICMS Reduzida');

    Form.Titulocoluna.Add('DESPESAS=Despesas');

    Form.Titulocoluna.Add('NR_LI=Nr LI');
    Form.Titulocoluna.Add('PAIS_ORIGEM=Pais Origem');
    Form.Titulocoluna.Add('ARMADOR=Armador');
    Form.Titulocoluna.Add('NM_AGENTE=Agente de Carga');
    Form.Titulocoluna.Add('CANAL=Canal');
    Form.Titulocoluna.Add('MODAL=Modal');
    Form.Titulocoluna.Add('CD_VIA_TRANSP_SISCOMEX=Cód. Via Transporte');
    Form.Titulocoluna.Add('LOCAL_DESEMBARACO=Local Desembaraço');
    Form.Titulocoluna.Add('DANFE=Danfe');

	  Form.Titulocoluna.Add('PEDIDO_DI=Pedido DI');
    Form.Titulocoluna.Add('END_UF_URF=UF URF');
	  Form.Titulocoluna.Add('NR_EXPO=Cód. Cliente Exportador');
    Form.Titulocoluna.Add('FATURAS=Nr. da Fatura');


    Form.Titulocoluna.Add('VL_CIF_SHELL=CIF (Shell)');
    Form.Titulocoluna.Add('VALOR_MULTA_SHELL=Valor Multa (Shell)');
	  Form.Titulocoluna.Add('IOF_SHELL=IOF (Shell)');
	  Form.Titulocoluna.Add('TUP_SHELL=TUP (Shell)');
	  Form.Titulocoluna.Add('BASE_ICMS_ST_SHELL=Base ICMS ST (Shell)');
	  Form.Titulocoluna.Add('AL_ICMS_ST_SHELL=Al. ICMS ST (Shell)');
	  Form.Titulocoluna.Add('ICMS_ST_SHELL=ICMS ST (Shell)');
	  Form.Titulocoluna.Add('BASE_CIDE_SHELL=Base CIDE (Shell)');
	  Form.Titulocoluna.Add('AL_CIDE_SHELL=Al. CIDE (Shell)');
	  Form.Titulocoluna.Add('CIDE_SHELL=CIDE (Shell)');
	  Form.Titulocoluna.Add('Base_Isenta_ICMS_SHELL=Base Isenta ICMS (Shell)');
	  Form.Titulocoluna.Add('Base_Isenta_ST_SHELL=Base Isenta ST (Shell)');
	  Form.Titulocoluna.Add('Taxa_Pobreza_ICMS_SHELL=Tx Pobreza ICMS (Shell)');
	  Form.Titulocoluna.Add('Valor_Pobreza_ICMS_SHELL=Vl Pobreza ICMS (Shell)');
	  Form.Titulocoluna.Add('Taxa_Pobreza_ST_SHELL=Tx Pobreza ST (Shell)');
	  Form.Titulocoluna.Add('Valor_Pobreza_ST_SHELL=Vl Pobreza ST (Shell)');
    Form.Titulocoluna.Add('DESP_ADUANEIRAS_SHELL=Desp. Aduan. (Shell)');
    Form.Titulocoluna.Add('TIPO_NOTA_SHELL=Tipo Nota Fiscal (Shell)');

    Form.Titulocoluna.Add('HILTI_ITEM_CATEGORY=Hilti - Item Category');
    Form.Titulocoluna.Add('HILTI_DIR_ICMS=Hilti - Dir ICMS');
    Form.Titulocoluna.Add('HILTI_DIR_IPI=Hilti - Dir IPI');
    Form.Titulocoluna.Add('HILTI_LEI_COFINS=Hilti - Lei_COFINS');
    Form.Titulocoluna.Add('HILTI_LEI_PIS=Hilti - Lei PIS');
    Form.Titulocoluna.Add('HILTI_CC_RGN=Hilti - CC Rgn');
    Form.Titulocoluna.Add('HILTI_FOREIGN_MFG=Foreign Mfg');
    Form.Titulocoluna.Add('HILTI_DISCVAL=Hilti - DiscVal');
    Form.Titulocoluna.Add('HILTI_STATUS=Hilti - Status');
    Form.Titulocoluna.Add('HILTI_NF=Hilti - NF');
    Form.Titulocoluna.Add('HILTI_NDRAW=Hilti - Ndraw');
    Form.Titulocoluna.Add('HILTI_TPINTERMEDIO=Hilti - Tpintermedio');
    Form.Titulocoluna.Add('HILTI_OBS=Hilti - Obs');
    Form.Titulocoluna.Add('HILTI_DIF_COFINS=Hilti - DIF COFINS');
    Form.Titulocoluna.Add('HILTI_DT_REGISTRO_DI=Hilti - CC Date');

    Form.Titulocoluna.Add('VL_MULTA_II=FMA - Multa II');
    Form.Titulocoluna.Add('VL_JUROS_II=FMA - Juros II');
    Form.Titulocoluna.Add('VL_MULTA_IPI=FMA - Multa IPI');
    Form.Titulocoluna.Add('VL_JUROS_IPI=FMA - Juros IPI');
    Form.Titulocoluna.Add('VL_MULTA_PIS=FMA - Multa PIS');
    Form.Titulocoluna.Add('VL_JUROS_PIS=FMA - Juros PIS');
    Form.Titulocoluna.Add('VL_MULTA_COFINS=FMA - Multa COFINS');
    Form.Titulocoluna.Add('VL_JUROS_COFINS=FMA - Juros COFINS');


    Form.qryMain.SQL.Text := GetSQL;

    //opção para gravar layout do relatorio
    Form.ClasseRel := claValoresDIAdicao;
    Form.cxGridDBTableView.PopupMenu := Form.PopupMenu1;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TfrmOiValorPorAdicao.GetSQL: string;
var Sql : String;
 FiltroData, FiltroDataCalculo : Boolean;
begin
    FiltroData := ((FDataInicial <> 0) and (FDataFinal <> 0));
    FiltroDataCalculo := ((FDataInicialCalculo <> 0) and (FDataFinalCalculo <> 0));

    Sql :=
    ' WITH CTE AS(                                                                                                        ' + sLineBreak +
    '  SELECT  EN.NM_EMPRESA                                                            AS [NM_CLIENTE]                   ' + sLineBreak +
    '  	      ,G.NM_GRUPO                                                               AS [NM_GRUPO]                     ' + sLineBreak +
    '  	      ,EN.COD_INTERNO                                                           AS [COD_INTERNO]                  ' + sLineBreak +
    '         ,EE.NM_EMPRESA                                                            AS [NM_EMPRESA]                   ' + sLineBreak +
    '         ,A.NR_PROCESSO                                                            AS [NR_PROCESSO]                  ' + sLineBreak +
    '         ,AREA.NM_AREA                                                             AS [AREA]                         ' + sLineBreak +
    '         ,DI.NR_DECLARACAO_IMP                                                     AS [NR_DECLARACAO_IMP]            ' + sLineBreak +
    '         ,LEFT(DI.DT_REGISTRO_DI, 2) + ''/'' +                                                                       ' + sLineBreak +
    '          SUBSTRING(DI.DT_REGISTRO_DI, 3, 2) + ''/'' +                                                               ' + sLineBreak +
    '          RIGHT(DI.DT_REGISTRO_DI, 4)                                              AS [DT_REGISTRO_DI]               ' + sLineBreak +
    '         ,CONVERT(VARCHAR(10),EV088.DT_REALIZACAO, 103)                            AS [DT_DESEMBARACO]               ' + sLineBreak +
    '         ,DM.NR_PROC_PO                                                            AS [NR_PROC_PO]                   ' + sLineBreak +
    '         ,A.NR_ADICAO                                                              AS [NR_ADICAO]                    ' + sLineBreak +
    '         ,DM.NR_ITEM                                                               AS [NR_ITEM]                      ' + sLineBreak +
    '         ,PO.NM_PAIS                                                               AS [PAIS_ORIGEM]                  ' + sLineBreak +
    '         ,TRANSP.DESCRICAO                                                         AS [ARMADOR]                      ' + sLineBreak +
    '         ,DM.VL_BASE_CALC_II                                                       AS [VL_ADUANEIRO_ITEM]            ' + sLineBreak +
    '         ,DM.VL_BASE_CALC_II / DI.TX_DOLAR                                         AS [VL_ADUANEIRO_ITEM_USD]        ' + sLineBreak +
    '         ,DM.VL_MLE_ITEM                                                           AS [VL_MLE]                       ' + sLineBreak +
    '         ,CASE WHEN DI.TX_MLE=0 THEN 0 ELSE (DM.VL_MLE_ITEM * DI.TX_MLE)  END      AS [VL_MLE_RS]                    ' + sLineBreak +
    '         ,DM.VL_FRETE_ITEM_MN                                                      AS [VL_FRETE_ITEM_MN]             ' + sLineBreak +
    '         ,CASE WHEN DI.TX_MLE=0 THEN 0 ELSE (DM.VL_FRETE_ITEM_MN / DI.TX_MLE) END  AS [VL_FRETE_MLE]                 ' + sLineBreak +
    '         ,DM.VL_SEGURO_ITEM_MN                                                     AS [VL_SEGURO_ITEM_MN]            ' + sLineBreak +
    '         ,DI.CD_MOEDA_SEGURO                                                       AS [CD_MOEDA_SEGURO]              ' + sLineBreak +
    '         ,DM.VL_TX_SCX_ITEM                                                        AS [VL_TX_SCX_ITEM]               ' + sLineBreak +
    '         ,DM.VL_ACRESCIMO_ITEM_MN                                                  AS [VL_ACRESCIMO_ITEM_MN]         ' + sLineBreak +
    '         ,DM.VL_DEDUCAO_ITEM_MN                                                    AS [VL_DEDUCAO_ITEM_MN]           ' + sLineBreak +
    '         ,DM.VL_II_ITEM                                                            AS [VL_II_ITEM]                   ' + sLineBreak +
    '         ,AV.NR_EX_ATO_VINCUL                                                      AS [NR_EX]                        ' + sLineBreak +
    '         ,CASE                                                                                                       ' + sLineBreak +
		'	        WHEN ( T1.VL_CALC_IPT_ADVAL ) = 0 THEN 0                                                                    ' + sLineBreak +
		'	        ELSE ( T1.VL_CALC_IPT_ADVAL / A.VL_BASE_CALC_II)   * DM.VL_BASE_CALC_II END                                 ' + sLineBreak +
    '          * DM.VL_II_ITEM                                                          AS [VL_II_ITEM_CALCULADO]         ' + sLineBreak +
    '     		,(CASE                                                                                                      ' + sLineBreak +
		'	        WHEN ( T1.VL_CALC_IPT_ADVAL / A.VL_BASE_CALC_II) = 0 THEN 0                                              ' + sLineBreak +
		'	        ELSE ( T1.VL_CALC_IPT_ADVAL / A.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II END )                                   ' + sLineBreak +
    '             - DM.VL_II_ITEM                                                       AS [VL_II_CALCULADO_RECOLHIDO]    ' + sLineBreak +
    ' 			  ,RT.DESCRICAO										                                					AS [REG_TRIB_II]                  ' + sLineBreak +
    '  			  ,FL.Descricao															                                AS [FUND_LEGAL_II]                ' + sLineBreak +
    '         ,DM.VL_IPI_ITEM                                                           AS [VL_IPI_ITEM]                  ' + sLineBreak +
    '         ,DM.VL_PIS_ITEM                                                           AS [VL_PIS_ITEM]                  ' + sLineBreak +
    '         ,DM.VL_COFINS_ITEM                                                        AS [VL_COFINS_ITEM]               ' + sLineBreak +
    '         ,CAST(((A.VL_ICMS_A_RECOLHER_AFRMM /                                                                        ' + sLineBreak +
    '		        (CASE WHEN (SUM(DM.VL_BASE_CALC_II + DM.VL_II_ITEM +                                                      ' + sLineBreak +
    '                                DM.VL_IPI_ITEM + DM.VL_PIS_ITEM +                                                    ' + sLineBreak +
    '                                DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM +                                              ' + sLineBreak +
    '                                DM.VL_AFRMM_ITEM)                                                                    ' + sLineBreak +
    '                             OVER(PARTITION BY A.NR_PROCESSO, A.NR_ADICAO)) = 0                                      ' + sLineBreak +
    '                      THEN 1                                                                                         ' + sLineBreak +
    '                      ELSE (SUM(DM.VL_BASE_CALC_II + DM.VL_II_ITEM +                                                 ' + sLineBreak +
    '                                DM.VL_IPI_ITEM + DM.VL_PIS_ITEM +                                                    ' + sLineBreak +
    '                                DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM +                                              ' + sLineBreak +
    '                                DM.VL_AFRMM_ITEM)                                                                    ' + sLineBreak +
    '                             OVER(PARTITION BY A.NR_PROCESSO, A.NR_ADICAO))                                          ' + sLineBreak +
    '                 END )) * (DM.VL_BASE_CALC_II + DM.VL_II_ITEM +                                                      ' + sLineBreak +
    '                           DM.VL_IPI_ITEM + DM.VL_PIS_ITEM +                                                         ' + sLineBreak +
    '                           DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM +                                                   ' + sLineBreak +
    '                           DM.VL_AFRMM_ITEM))                                                                        ' + sLineBreak +
    '          AS NUMERIC(15,2))                                                        AS [VL_ICMS_A_RECOLHER_AFRMM_ITEM]' + sLineBreak +
    '         ,CAST(DM.VL_AFRMM_ITEM  AS NUMERIC(15,2))                                 AS [VL_AFRMM_ITEM]                ' + sLineBreak +
    '         ,(T3.VL_IPT_A_RECOLHER / A.PL_MERCADORIA) * DM.PL_MERCADORIA              AS [VL_ANTIDUMPING_ITEM]          ' + sLineBreak +
    '         ,DM.CD_MERCADORIA                                                         AS [CD_MERCADORIA]                ' + sLineBreak +
    '         ,DM.TX_DESC_DET_MERC                                                      AS [NM_MERCADORIA]                ' + sLineBreak +
    '         ,DM.CD_NCM_SH                                                             AS [NCM]                          ' + sLineBreak +
    '         ,A.CD_METOD_VALORACAO                                                     AS [CD_METOD_VALORACAO]           ' + sLineBreak +
    '         ,(A.VL_BASE_CALC_ICMS_AFRMM / A.VL_BASE_CALC_ICMS) * DM.VL_BASE_ICMS_ITEM  AS [BASE_CALCULO_ICMS]           ' + sLineBreak +
    '         ,((A.VL_BASE_CALC_ICMS_AFRMM / A.VL_BASE_CALC_ICMS) * DM.VL_BASE_ICMS_ITEM )                                ' + sLineBreak +
    '                 * ((SELECT PC_FUNDO_POBREZA_RJ FROM TPARAMETROS(NOLOCK) ) / 100)   AS [VL_FUNDO_ICMS_ITEM]          ' + sLineBreak +
    '         ,DM.QT_MERC_UN_COMERC                                                     AS [QTDE_COMERCIALIZADA]          ' + sLineBreak +
    '         ,A.PC_ICMS                                                                AS [ALIQUOTA_ICMS]                ' + sLineBreak +
    '         ,A.TX_MLE                                                                 AS [TAXA_MOEDA_MERCADORIA]        ' + sLineBreak +
    '         ,DM.vl_base_icms_item                                                     AS [BASE_ICMS_REDUZIDA]           ' + sLineBreak +
    '         ,T1.PC_ALIQ_NORM_ADVAL                                                    AS [ALIQUOTA_II]                  ' + sLineBreak +
    '         ,T2.PC_ALIQ_NORM_ADVAL                                                    AS [ALIQUOTA_IPI]                 ' + sLineBreak +
    '         ,C.NM_CANAL                                                               AS [CANAL]                        ' + sLineBreak +
    '         ,VT.NM_VIA_TRANSP                                                         AS [MODAL]                        ' + sLineBreak +
    '         ,URF.DESCRICAO                                                            AS [LOCAL_DESEMBARACO]            ' + sLineBreak +
    '         ,(Cast(ISNULL(STUFF((SELECT '', '' + LTRIM(RTRIM(PNF.NR_NOTA))                                              ' + sLineBreak +
    '                              FROM TPROCESSO_NF PNF WITH (NOLOCK)                                                    ' + sLineBreak +
    '                              WHERE PNF.NR_PROCESSO   = P.NR_PROCESSO                                                ' + sLineBreak +
    '                       FOR XML PATH('''')), 1, 1, '''')                                                              ' + sLineBreak +
    '                , '''')                                                                                              ' + sLineBreak +
    '           as Varchar(150)))                                                       AS [DANFE]                        ' + sLineBreak +
    '         ,DM.PL_MERCADORIA                                                         AS [PL_MERCADORIA]                ' + sLineBreak +
    '         ,A.ALIQ_PIS                                                               AS [ALIQ_PIS]                     ' + sLineBreak +
    '         ,A.ALIQ_COFINS                                                            AS [ALIQ_COFINS]                  ' + sLineBreak +
    '         ,1                                                                        AS HILTI_ITEM_CATEGORY            ' + sLineBreak +
    '         ,''ICO''                                                                  AS HILTI_DIR_ICMS                 ' + sLineBreak +
    '         ,''IP0''                                                                  AS HILTI_DIR_IPI                  ' + sLineBreak +
    '         ,''COJ''                                                                  AS HILTI_LEI_COFINS               ' + sLineBreak +
    '         ,''POJ''                                                                  AS HILTI_LEI_PIS                  ' + sLineBreak +
    '         ,''SP''                                                                   AS HILTI_CC_RGN                   ' + sLineBreak +
    '         ,''0230''                                                                 AS HILTI_FOREIGN_MFG              ' + sLineBreak +
    '         ,NULL                                                                     AS HILTI_DISCVAL                  ' + sLineBreak +
    '         ,NULL                                                                     AS HILTI_STATUS                   ' + sLineBreak +
    '         ,NULL                                                                     AS HILTI_NF                       ' + sLineBreak +
    '         ,0                                                                        AS HILTI_NDRAW                    ' + sLineBreak +
    '         ,1                                                                        AS HILTI_TPINTERMEDIO             ' + sLineBreak +
    '         ,LEFT(DI.DT_REGISTRO_DI, 2) + ''/'' +                                                                       ' + sLineBreak +
    '          SUBSTRING(DI.DT_REGISTRO_DI, 3, 2) + ''/'' +                                                               ' + sLineBreak +
    '          RIGHT(DI.DT_REGISTRO_DI, 4) as HILTI_DT_REGISTRO_DI                                                        ' + sLineBreak +
    '         ,DM.VL_BASE_CALC_II                                                       AS VL_CIF_SHELL                   ' + sLineBreak +
    '         ,0                                                                        AS VALOR_MULTA_SHELL              ' + sLineBreak +
		'	        ,0                                                                        AS IOF_SHELL                      ' + sLineBreak +
		'	        ,0                                                                        AS TUP_SHELL                      ' + sLineBreak +
		'	        ,0                                                                        AS BASE_ICMS_ST_SHELL             ' + sLineBreak +
		'	        ,0                                                                        AS AL_ICMS_ST_SHELL               ' + sLineBreak +
		'	        ,0                                                                        AS ICMS_ST_SHELL                  ' + sLineBreak +
		'	        ,0                                                                        AS BASE_CIDE_SHELL                ' + sLineBreak +
		'	        ,0                                                                        AS AL_CIDE_SHELL                  ' + sLineBreak +
		'	        ,0                                                                        AS CIDE_SHELL                     ' + sLineBreak +
		'	        ,0                                                                        AS Base_Isenta_ICMS_SHELL         ' + sLineBreak +
		'	        ,0                                                                        AS Base_Isenta_ST_SHELL           ' + sLineBreak +
		'	        ,0                                                                        AS Taxa_Pobreza_ICMS_SHELL        ' + sLineBreak +
		'	        ,0                                                                        AS Valor_Pobreza_ICMS_SHELL       ' + sLineBreak +
		'	        ,0                                                                        AS Taxa_Pobreza_ST_SHELL          ' + sLineBreak +
		'	        ,0                                                                        AS Valor_Pobreza_ST_SHELL         ' + sLineBreak +
		'	        ,A.NR_OPER_TRAT_PREV                                                      AS NR_LI                          ' + sLineBreak +
		'	        ,DM.NR_PROC_PO                                                            AS PEDIDO_DI                      ' + sLineBreak +
		'	        ,DM.VL_II_ITEM + DM.VL_TX_SCX_ITEM                                        AS DESP_ADUANEIRAS_SHELL          ' + sLineBreak +
 		'	        ,''Normal''                                                               AS TIPO_NOTA_SHELL                ' + sLineBreak +
		'	        ,URF.END_UF                                                               AS END_UF_URF                     ' + sLineBreak +
		'	        ,EE.NR_CLIENTE                                                            AS NR_EXPO                        ' + sLineBreak +
		'	        ,DM.PB_MERCADORIA                                                         AS PESO_BRUTO_ITEM                ' + sLineBreak +
 		'	        ,UM.NM_SIGLA                                                              AS UM_SIGLA                       ' + sLineBreak +
    '         ,DM.VL_BASE_CALC_II / DM.QT_MERC_UN_COMERC                                AS VA_UNITARIO                    ' + sLineBreak +
    '         ,DM.VL_UNITARIO                                                                                             ' + sLineBreak +
    '         ,DM.QT_MERC_UN_ESTAT                                                      AS QT_UN_ESTAT                    ' + sLineBreak +
    '         ,UMN.NM_UNID_MEDIDA                                                       AS UN_ESTAT                       ' + sLineBreak +
    '         ,A.CD_CFOP                                                                                                  ' + sLineBreak +
    '         ,DM.VL_BASE_PIS_COFINS                                                    AS BASE_PIS                       ' + sLineBreak +
    '         ,DM.VL_BASE_PIS_COFINS                                                    AS BASE_COFINS                    ' + sLineBreak +
    '         ,EN.END_UF                                                                                                  ' + sLineBreak +
    '         ,EN.CGC_EMPRESA                                                                                             ' + sLineBreak +
    '         ,VT.CD_VIA_TRANSP_SISCOMEX                                                                                  ' + sLineBreak +
    '         ,(VL_BASE_PIS_COFINS * 9.65) / 100                                        AS HILTI_OBS                      ' + sLineBreak +
    '         ,((VL_BASE_PIS_COFINS * 9.65) / 100) - DM.VL_COFINS_ITEM                  AS HILTI_DIF_COFINS               ' + sLineBreak +
    '         ,AD.CD_DESPESA                                                                                              ' + sLineBreak +
		'         ,AD.TP_DESPESA                                                                                              ' + sLineBreak +
		'         ,AD.VL_MOEDA                                                                                                ' + sLineBreak +
    '			    ,MF.AP_MOEDA                                                              AS [MOEDA_FRETE]                  ' + sLineBreak +
		'	        ,UM.NM_UNID_MEDIDA                                                        AS [UNID_MED_COMERC]              ' + sLineBreak +
		'	        ,MM.AP_MOEDA                                                              AS [MOEDA_MERCADORIA]             ' + sLineBreak +
		'	        ,AG.NM_AGENTE                                                                                               ' + sLineBreak +
 		'	        ,(A.VL_MULTA_II     / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_MULTA_II]                  ' + sLineBreak +
    '	        ,(A.VL_JUROS_II     / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_JUROS_II]                  ' + sLineBreak +
    '	        ,(A.VL_MULTA_IPI    / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_MULTA_IPI]                 ' + sLineBreak +
    '	        ,(A.VL_JUROS_IPI    / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_JUROS_IPI]                 ' + sLineBreak +
    '	        ,(A.VL_MULTA_PIS    / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_MULTA_PIS]                 ' + sLineBreak +
    '	        ,(A.VL_JUROS_PIS    / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_JUROS_PIS]                 ' + sLineBreak +
    '	        ,(A.VL_MULTA_COFINS / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_MULTA_COFINS]              ' + sLineBreak +
    '	        ,(A.VL_JUROS_COFINS / A.PL_MERCADORIA) * DM.PL_MERCADORIA                 AS [VL_JUROS_COFINS]              ' + sLineBreak +
		'	        ,Cast(ISNULL(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(FAT.NR_DCTO_INSTRUCAO))                             ' + sLineBreak +
		'	                            FROM BROKER.DBO.TDOCUMENTO_INSTRUCAO FAT WITH (NOLOCK)                                  ' + sLineBreak +
		'	                            WHERE FAT.NR_PROCESSO = P.NR_PROCESSO                                                   ' + sLineBreak +
		'	                            AND FAT.CD_TIPO_DCTO_INSTR = ''01''                                                     ' + sLineBreak +
		'	                     FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300))     AS [FATURAS]                      ' + sLineBreak +
		'	        ,P.CD_INCOTERM                                                                                              ' + sLineBreak +
		'	        ,P.NR_CONHECIMENTO                                                                                          ' + sLineBreak +
		'	        ,EV162.DT_REALIZACAO                                                                                        ' + sLineBreak +
    '         ,EE.CD_EMPRESA                                                            AS [EXP_COD_MY]                   ' + sLineBreak +
	  '         ,EE.NR_NIT                                                                AS [EXP_NIT]                      ' + sLineBreak +
	  '         ,PEE.NM_SIGLA_2L                                                          AS [EXP_PAIS_SIGLA]               ' + sLineBreak +
	  '         ,EE.END_CIDADE                                                            AS [EXPO_CIDADE]                  ' + sLineBreak +
	  '         ,EE.END_EMPRESA + (CASE WHEN EE.END_NUMERO='''' THEN '''' ELSE '', '' + EE.END_NUMERO END )  AS [EXPO_END]  ' + sLineBreak +
	  '         ,EE.END_ESTADO                                                            AS [EXPO_ESTADO]                  ' + sLineBreak +
	  '         ,EE.END_COMPL                                                             AS [EXPO_COMPL]                   ' + sLineBreak +
    '         ,FAB.NM_EMPRESA                                                           AS [FAB]                          ' + sLineBreak +
    '         ,FAB.CD_EMPRESA                                                           AS [FAB_COD_MY]                   ' + sLineBreak +
	  '         ,FAB.NR_NIT                                                               AS [FAB_NIT]                      ' + sLineBreak +
	  '         ,PEE1.NM_SIGLA_2L                                                         AS [FAB_PAIS_SIGLA]               ' + sLineBreak +
	  '         ,FAB.END_CIDADE                                                           AS [FAB_CIDADE]                   ' + sLineBreak +
	  '         ,FAB.END_EMPRESA + (CASE WHEN FAB.END_NUMERO='''' THEN '''' ELSE '', '' + FAB.END_NUMERO END) AS [FAB_END]  ' + sLineBreak +
	  '         ,FAB.END_ESTADO                                                           AS [FAB_ESTADO]                   ' + sLineBreak +
	  '         ,FAB.END_COMPL                                                            AS [FAB_COMPL]                    ' + sLineBreak +
    '  FROM       TPROCESSO              P      (NOLOCK)                                                                  ' + sLineBreak +
    '  INNER JOIN TAREA					         AREA   (NOLOCK) ON AREA.CD_AREA	        = P.CD_AREA                             ' + sLineBreak +
    '  INNER JOIN TDECLARACAO_IMPORTACAO DI     (NOLOCK) ON DI.NR_PROCESSO        = P.NR_PROCESSO                         ' + sLineBreak +
    '  INNER JOIN TADICAO_DE_IMPORTACAO  A      (NOLOCK) ON A.NR_PROCESSO         = P.NR_PROCESSO                         ' + sLineBreak +
    '  LEFT JOIN TATO_VINCULADO          AV     (NOLOCK) ON AV.NR_PROCESSO = P.NR_PROCESSO AND A.NR_ADICAO = AV.NR_ADICAO  ' + sLineBreak +
    '  INNER JOIN TDETALHE_MERCADORIA    DM     (NOLOCK) ON DM.NR_PROCESSO        = A.NR_PROCESSO                         ' + sLineBreak +
    '                                                   AND DM.NR_ADICAO          = A.NR_ADICAO                           ' + sLineBreak +
    ///'  INNER JOIN TMERCADORIA            M      (NOLOCK) ON M.CD_MERCADORIA       = DM.CD_MERCADORIA                      ' + sLineBreak +
    '  INNER JOIN TRIBUTO                T1     (NOLOCK) ON T1.NR_PROCESSO        = A.NR_PROCESSO                         ' + sLineBreak +
    '                                                   AND T1.NR_ADICAO          = A.NR_ADICAO                           ' + sLineBreak +
    '                                                   AND T1.CD_RECEITA_IMPOSTO = ''0001''                              ' + sLineBreak +
    '  INNER JOIN TRIBUTO                T2     (NOLOCK) ON T2.NR_PROCESSO        = A.NR_PROCESSO                         ' + sLineBreak +
    '                                                   AND T2.NR_ADICAO          = A.NR_ADICAO                           ' + sLineBreak +
    '                                                   AND T2.CD_RECEITA_IMPOSTO = ''0002''                              ' + sLineBreak +
    '  LEFT JOIN TRIBUTO                 T3     (NOLOCK) ON T3.NR_PROCESSO        = A.NR_PROCESSO                         ' + sLineBreak +
    '                                                   AND T3.NR_ADICAO          = A.NR_ADICAO                           ' + sLineBreak +
    '                                                   AND T3.CD_RECEITA_IMPOSTO = ''0003''                              ' + sLineBreak +
    '  INNER JOIN TEMPRESA_EST           EE     (NOLOCK) ON EE.CD_EMPRESA         = A.CD_FORNECEDOR                       ' + sLineBreak +
    '  INNER JOIN TPAIS_BROKER		    	 PEE    (NOLOCK) ON EE.CD_PAIS            = PEE.CD_PAIS                           ' + sLineBreak +
    '  INNER JOIN TEMPRESA_NAC           EN     (NOLOCK) ON EN.CD_EMPRESA         = P.CD_CLIENTE                          ' + sLineBreak +
    '  LEFT JOIN TEMPRESA_EST            FAB    (NOLOCK) ON FAB.CD_EMPRESA        = A.CD_FABRICANTE                       ' + sLineBreak +
    '  LEFT JOIN TPAIS_BROKER		    	 PEE1   (NOLOCK) ON FAB.CD_PAIS           = PEE1.CD_PAIS                          ' + sLineBreak +
    '  INNER JOIN TGRUPO                 G      (NOLOCK) ON G.CD_GRUPO            = P.CD_GRUPO                            ' + sLineBreak +
    '  INNER JOIN TFOLLOWUP              F      (NOLOCK) ON F.NR_PROCESSO         = P.NR_PROCESSO                         ' + sLineBreak +
    '                                                   AND F.CD_EVENTO           = ''021''                               ' + sLineBreak +
    '	 LEFT JOIN TFOLLOWUP               EV088  (NOLOCK) ON EV088.NR_PROCESSO     = P.NR_PROCESSO                         ' + sLineBreak +
    '                                                   AND EV088.CD_EVENTO        = ''088''                              ' + sLineBreak +
	  '  LEFT JOIN TFOLLOWUP               EV162  (NOLOCK) ON EV162.NR_PROCESSO     = P.NR_PROCESSO                         ' + sLineBreak +
    '                                                   AND EV162.CD_EVENTO        = ''162''                              ' + sLineBreak +
	  '  LEFT JOIN TPAIS_BROKER            PO     (NOLOCK) ON PO.CD_PAIS = ISNULL(A.CD_PAIS_ORIG_MERC,A.CD_PAIS_AQUIS_MERC) ' + sLineBreak +
    '  LEFT  JOIN TTRANSPORTADOR_ITL     TRANSP (NOLOCK) ON TRANSP.CODIGO         = P.CD_TRANSPORTADOR                    ' + sLineBreak +
    '  LEFT  JOIN TTP_CANAL              C      (NOLOCK) ON P.CD_CANAL            = C.CD_CANAL                            ' + sLineBreak +
    '  LEFT  JOIN VW_SERVICO_GERAL       SN              ON SN.CD_SERVICO         = P.CD_SERVICO                          ' + sLineBreak +
    '  LEFT  JOIN TVIA_TRANSP_BROKER     VT     (NOLOCK) ON VT.CD_VIA_TRANSP      = SN.CD_VIA_TRANSPORTE                  ' + sLineBreak +
    '  LEFT  JOIN TURF                   URF    (NOLOCK) ON URF.CODIGO            = DI.CD_URF_DESPACHO                    ' + sLineBreak +
    '  LEFT JOIN TMOEDA_BROKER		       MF	    (NOLOCK) ON MF.CD_MOEDA = DI.CD_MOEDA_FRETE                               ' + sLineBreak +
    '	 INNER JOIN TUNID_MEDIDA_BROKER	   UM	    (NOLOCK) ON UM.CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC                       ' + sLineBreak +
	  '  LEFT JOIN TMOEDA_BROKER		       MM	    (NOLOCK) ON MM.CD_MOEDA = A.CD_MOEDA_NEGOCIADA                            ' + sLineBreak +
    '  LEFT JOIN TACRESCIMO_DEDUCAO      AD     (NOLOCK) on AD.NR_PROCESSO = P.NR_PROCESSO                                ' + sLineBreak +
    '  LEFT JOIN TREG_TRIBUTARIO			   RT     (NOLOCK) ON RT.CODIGO = A.CD_REGIME_TRIBUTAR                              ' + sLineBreak +
    '  LEFT JOIN TFUND_LEG_REG_TRIBUT    FL     (NOLOCK) ON FL.Codigo = A.CD_FUND_LEG_REGIME                              ' + sLineBreak +
    '  LEFT JOIN TNCM                    NCM    (NOLOCK) ON NCM.CODIGO = DM.CD_NCM_SH                                     ' + sLineBreak +
	  '  LEFT JOIN TUNID_MEDIDA_BROKER     UMN    (NOLOCK) ON UMN.CD_UNID_MEDIDA = NCM.UNIDADE_MEDIDA                       ' + sLineBreak +
    '  LEFT JOIN TAGENTE             AG (NOLOCK) ON AG.CD_AGENTE = P.CD_AGENTE '+
    '   WHERE ((P.NR_PROCESSO = '+QuotedStr(FNrProcesso)+')  OR  ('+QuotedStr(FNrProcesso)+'  = '''')) ' + sLineBreak +
    '     AND ((P.CD_GRUPO    = '+QuotedStr(FGrupo)+')       OR  ('+QuotedStr(FGrupo)+'       = '''')) ' + sLineBreak +
    '     AND ((P.CD_CLIENTE  = '+QuotedStr(FEmpresa)+')     OR  ('+QuotedStr(FEmpresa)+'     = '''')) ' + sLineBreak +
    '     AND ((P.CD_AREA     = '+QuotedStr(FArea)+')        OR  ('+QuotedStr(FArea)+'        = '''')) ' + sLineBreak +
        '     AND ((DM.CD_NCM_SH     = '+QuotedStr(FNcm)+')        OR  ('+QuotedStr(FNcm)+'        = '''')) ' + sLineBreak +
    '     AND ((DM.CD_MERCADORIA = '+QuotedStr(FMercadoria)+') OR  ('+QuotedStr(FMercadoria)+'        = '''')) ' + sLineBreak ;

    if FiltroDataCalculo then
    Sql := Sql +
    '     AND ((DI.DT_CALCULO  >= '+QuotedStr(FormatDateTime('yyyy/mm/dd', FDataInicialCalculo))+')         ' +
    '     AND  (DI.DT_CALCULO  <= '+QuotedStr(FormatDateTime('yyyy/mm/dd', FDataFinalCalculo  ))+'))        ' + sLineBreak ;


    if FiltroData then
    Sql := Sql +
    '     AND ((F.DT_REALIZACAO  >= '+QuotedStr(FormatDateTime('yyyy/mm/dd', FDataInicial))+')         ' +
    '     AND  (F.DT_REALIZACAO  <= '+QuotedStr(FormatDateTime('yyyy/mm/dd', FDataFinal  ))+'))        ' + sLineBreak ;

//    Sql := Sql +
//    '   ORDER BY P.NR_PROCESSO, A.NR_ADICAO, DM.NR_ITEM                                                ' + sLineBreak ;

  Sql := Sql +
    ' )                                                          ' + sLineBreak +
    '  SELECT                                                    ' + sLineBreak +
    '   [NM_CLIENTE]                                             ' + sLineBreak +
    '  ,[NM_GRUPO]                                               ' + sLineBreak +
    '  ,[COD_INTERNO]                                            ' + sLineBreak +
    '  ,[NM_EMPRESA]                                             ' + sLineBreak +
    '  ,[EXP_COD_MY]                                             ' + sLineBreak +
    '  ,[EXP_NIT]                                                ' + sLineBreak +
    '  ,[EXP_PAIS_SIGLA]                                         ' + sLineBreak +
    '  ,[EXPO_CIDADE]                                            ' + sLineBreak +
    '  ,[EXPO_END]                                               ' + sLineBreak +
    '  ,[EXPO_ESTADO]                                            ' + sLineBreak +
    '  ,[EXPO_COMPL]                                             ' + sLineBreak +
    '  ,[FAB]                                                    ' + sLineBreak +
    '  ,[FAB_COD_MY]                                             ' + sLineBreak +
    '  ,[FAB_NIT]                                                ' + sLineBreak +
    '  ,[FAB_PAIS_SIGLA]                                         ' + sLineBreak +
    '  ,[FAB_CIDADE]                                             ' + sLineBreak +
    '  ,[FAB_END]                                                ' + sLineBreak +
    '  ,[FAB_ESTADO]                                             ' + sLineBreak +
    '  ,[FAB_COMPL]                                              ' + sLineBreak +
    '  ,[NR_PROCESSO]                                            ' + sLineBreak +
    '  ,[AREA]                                                   ' + sLineBreak +
    '  ,[NR_DECLARACAO_IMP]                                      ' + sLineBreak +
    '  ,[DT_REGISTRO_DI]                                         ' + sLineBreak +
    '  ,[DT_DESEMBARACO]                                         ' + sLineBreak +
    '  ,[NR_PROC_PO]                                             ' + sLineBreak +
    '  ,[NR_ADICAO]                                              ' + sLineBreak +
    '  ,[NR_ITEM]                                                ' + sLineBreak +
    '  ,[PAIS_ORIGEM]                                            ' + sLineBreak +
    '  ,[ARMADOR]                                                ' + sLineBreak +
    '  ,[VL_ADUANEIRO_ITEM]                                      ' + sLineBreak +
    '  ,[VL_ADUANEIRO_ITEM_USD]                                  ' + sLineBreak +
    '  ,[QT_UN_ESTAT]                                            ' + sLineBreak +
    '  ,[UN_ESTAT]                                               ' + sLineBreak +
    '  ,[VL_MLE]                                                 ' + sLineBreak +
    '  ,[VL_MLE_RS]                                              ' + sLineBreak +
    '  ,[VL_FRETE_ITEM_MN]                                       ' + sLineBreak +
    '  ,[VL_FRETE_MLE]                                           ' + sLineBreak +
    '  ,[VL_SEGURO_ITEM_MN]                                      ' + sLineBreak +
    '  ,[CD_MOEDA_SEGURO]                                        ' + sLineBreak +
    '  ,[VL_TX_SCX_ITEM]                                         ' + sLineBreak +
    '  ,[VL_ACRESCIMO_ITEM_MN]                                   ' + sLineBreak +
    '  ,CAST(STUFF((SELECT '', '' +  RTRIM(ISNULL(A.DESCRICAO, '''')) FROM TACRESCIMO_DEDUCAO AD (NOLOCK) '+
    '  LEFT JOIN TAB_ACRESCIMO A (NOLOCK) ON CAST(A.CODIGO AS INT) = CAST(AD.CD_DESPESA AS INT) AND AD.TP_DESPESA=''A'' '+
    '  WHERE AD.NR_PROCESSO = CTE.NR_PROCESSO FOR XML PATH('''')),1,2,'''') AS VARCHAR(1000)) AS ACRESCIMOS '+
    '  ,[VL_DEDUCAO_ITEM_MN] '+
    '  ,CAST(STUFF((SELECT '', '' +  RTRIM(ISNULL(D.DESCRICAO, '''')) FROM TACRESCIMO_DEDUCAO AD (NOLOCK) '+
    '  LEFT JOIN TDEDUCAO D (NOLOCK) ON CAST(D.CODIGO AS INT)= CAST(AD.CD_DESPESA AS INT) AND AD.TP_DESPESA=''D'' '+
    '  WHERE AD.NR_PROCESSO = CTE.NR_PROCESSO FOR XML PATH('''')),1,2,'''') AS VARCHAR(1000)) AS DEDUCOES '+
    '  ,[VL_II_ITEM]                                             ' + sLineBreak +
    '  ,[NR_EX]                                                  ' + sLineBreak +
    '  ,[VL_II_ITEM_CALCULADO]                                   ' + sLineBreak +
    '  ,[VL_II_CALCULADO_RECOLHIDO]                              ' + sLineBreak +
    '  ,[REG_TRIB_II]                                            ' + sLineBreak +
    '  ,[FUND_LEGAL_II]                                          ' + sLineBreak +
    '  ,[VL_IPI_ITEM]                                            ' + sLineBreak +
    '  ,[VL_PIS_ITEM]                                            ' + sLineBreak +
    '  ,[VL_COFINS_ITEM]                                         ' + sLineBreak +
    '  ,[ALIQ_PIS]                                               ' + sLineBreak +
    '  ,[ALIQ_COFINS]                                            ' + sLineBreak +
    '  ,[VL_ICMS_A_RECOLHER_AFRMM_ITEM]                          ' + sLineBreak +
    '  ,[VL_FUNDO_ICMS_ITEM]                                     ' + sLineBreak +
    '  ,[VL_AFRMM_ITEM]                                          ' + sLineBreak +
    '  ,[VL_ANTIDUMPING_ITEM]                                    ' + sLineBreak +
    '  ,[CD_MERCADORIA]                                          ' + sLineBreak +
    '  ,[NM_MERCADORIA]                                          ' + sLineBreak +
    '  ,[NCM]                                                    ' + sLineBreak +
    '  ,[CD_METOD_VALORACAO]                                     ' + sLineBreak +
    '  ,[BASE_CALCULO_ICMS]                                      ' + sLineBreak +
    '  ,[QTDE_COMERCIALIZADA]                                    ' + sLineBreak +
    '  ,[ALIQUOTA_ICMS]                                          ' + sLineBreak +
    '  ,[TAXA_MOEDA_MERCADORIA]                                  ' + sLineBreak +
    '  ,[BASE_ICMS_REDUZIDA]                                     ' + sLineBreak +
    '  ,[ALIQUOTA_II]                                            ' + sLineBreak +
    '  ,[ALIQUOTA_IPI]                                           ' + sLineBreak +
    '  ,[CANAL]                                                  ' + sLineBreak +
    '  ,[MODAL]                                                  ' + sLineBreak +
    '  ,[LOCAL_DESEMBARACO]                                      ' + sLineBreak +
    '  ,[DANFE]                                                  ' + sLineBreak +
    '  ,[PL_MERCADORIA]                                          ' + sLineBreak +
    '  ,[VL_TX_SCX_ITEM]  + [VL_AFRMM_ITEM] AS [DESPESAS]        ' + sLineBreak +
    '  ,[VL_ADUANEIRO_ITEM] + [VL_II_ITEM] [VL_BASE_CALCULO_IPI] ' + sLineBreak +
    '  ,[VL_UNITARIO] '+
    '  ,[CD_CFOP] '+
    '  ,[BASE_PIS] '+
    '  ,[BASE_COFINS] '+
    '  ,[END_UF] '+
    '  ,[CGC_EMPRESA]  '+
    '  ,[CD_VIA_TRANSP_SISCOMEX]  '+
    '  ,[HILTI_ITEM_CATEGORY]'+
    '  ,[HILTI_DIR_ICMS] '+
    '  ,[HILTI_DIR_IPI] '+
    '  ,[HILTI_LEI_COFINS] '+
    '  ,[HILTI_LEI_PIS] '+
    '  ,[HILTI_CC_RGN] '+
    '  ,[HILTI_FOREIGN_MFG] '+
    '  ,[HILTI_DISCVAL] '+
    '  ,[HILTI_STATUS] '+
    '  ,[HILTI_NF] '+
    '  ,[HILTI_NDRAW] '+
    '  ,[HILTI_TPINTERMEDIO] '+
    '  ,[HILTI_DT_REGISTRO_DI] '+
    '  ,[HILTI_OBS] '+
    '  ,[HILTI_DIF_COFINS]  '+
    '  ,[VALOR_MULTA_SHELL]  '+
  	'  ,[IOF_SHELL]  '+
	  '  ,[TUP_SHELL]  '+
	  '  ,[BASE_ICMS_ST_SHELL]  '+
	  '  ,[AL_ICMS_ST_SHELL]  '+
	  '  ,[ICMS_ST_SHELL]  '+
	  '  ,[BASE_CIDE_SHELL]  '+
	  '  ,[AL_CIDE_SHELL]  '+
	  '  ,[CIDE_SHELL]  '+
	  '  ,[Base_Isenta_ICMS_SHELL]  '+
	  '  ,[Base_Isenta_ST_SHELL]  '+
	  '  ,[Taxa_Pobreza_ICMS_SHELL]  '+
	  '  ,[Valor_Pobreza_ICMS_SHELL]  '+
	  '  ,[Taxa_Pobreza_ST_SHELL]  '+
	  '  ,[Valor_Pobreza_ST_SHELL]  '+
	  '  ,[NR_LI]  '+
	  '  ,[PEDIDO_DI]  '+
	  '  ,[DESP_ADUANEIRAS_SHELL]  '+
	  '  ,[END_UF_URF]  '+
	  '  ,[NR_EXPO]         '+
	  '  ,[PESO_BRUTO_ITEM]    '+
    '  ,[UM_SIGLA] '+
    '  ,[VA_UNITARIO] '+
    '  ,[TIPO_NOTA_SHELL] '+
    '  ,[VL_CIF_SHELL] '+
    '  ,[MOEDA_FRETE]   '+
    '  ,[UNID_MED_COMERC] '+
    '  ,[MOEDA_MERCADORIA]  '+
    '  ,[NM_AGENTE]  '+
    '  ,[VL_MULTA_II]  '+
    '  ,[VL_JUROS_II]  '+
    '  ,[VL_MULTA_IPI]  '+
    '  ,[VL_JUROS_IPI]  '+
    '  ,[VL_MULTA_PIS]  '+
    '  ,[VL_JUROS_PIS]  '+
    '  ,[VL_MULTA_COFINS]  '+
    '  ,[VL_JUROS_COFINS]  '+
    '  ,[FATURAS]  '+
    '  ,[CD_INCOTERM]  '+
    '  ,[NR_CONHECIMENTO]  '+
    '  ,[DT_REALIZACAO]  '+
    '   FROM CTE                                                  ' + sLineBreak +
    '  LEFT JOIN BROKER.DBO.TDEDUCAO D (NOLOCK) ON CAST(D.CODIGO AS int) = CAST(CTE.CD_DESPESA AS int) '+
    '  LEFT JOIN BROKER.DBO.TAB_ACRESCIMO A (NOLOCK) ON CAST(A.CODIGO AS int) = CAST(CTE.CD_DESPESA AS int) '+
    '  ORDER BY NR_PROCESSO, NR_ADICAO, NR_ITEM ';
  Result := Sql;
end;


procedure TfrmOiValorPorAdicao.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TfrmOiValorPorAdicao.btn_co_produtoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
end;

procedure TfrmOiValorPorAdicao.btnGrupoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    mskGrupo.Text := ConsultaOnLineEx('TGRUPO','Grupo de Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Descrição'],'CD_GRUPO',nil, 1,mskGrupo.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edtGrupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', mskGrupo.Text,'NM_GRUPO');
end;

procedure TfrmOiValorPorAdicao.btnEmpresaClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    mskEmpresa.Text := ConsultaOnLineEx('TEMPRESA_NAC','Empresa Nacional',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',nil, 1,mskEmpresa.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edtEmpresa.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', mskEmpresa.Text,'NM_EMPRESA');
end;

procedure TfrmOiValorPorAdicao.btn_co_processoClick(Sender: TObject);
var
  vListAux: TStringList;
  Ret: string;
begin
  if (msk_cd_unid_neg.Text = '') then
  begin
    MessageDlg('Unidade não informada.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if (msk_cd_produto.Text = '') then
  begin
    MessageDlg('Produto não informado.', mtWarning, [mbOK], 0);
    Exit;
  end;
  vListAux := TStringList.Create;
  try
    vListAux.Text := '  SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, '+
                     '         PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA '+
                     '  FROM       TPROCESSO    PR ( NOLOCK ) '+
                     '  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE '+
                     '  WHERE CD_PRODUTO  = '+ QuotedStr(msk_cd_produto.Text) +
                     '    AND CD_UNID_NEG = ' + QuotedStr(msk_cd_unid_neg.Text);
    Ret := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, Ret);
  finally
    vListAux.Free;
  end;
end;

procedure TfrmOiValorPorAdicao.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if (msk_cd_unid_neg.Text = '') then
    begin
      MessageDlg('Unidade não informada.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (msk_cd_produto.Text = '') then
    begin
      MessageDlg('Produto não informado.', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
end;

function TfrmOiValorPorAdicao.ValidarDatas : Boolean;
var
  DataInicial: TDateTime;
  DataFinal: TDateTime;
begin
  FDataInicial        := 0;
  FDataFinal          := 0;

  DataInicial         := StrToDateTimeDef(mskDataIni.Text,0);
  DataFinal           := StrToDateTimeDef(mskDataFin.Text,0);

  if (DataInicial = 0 ) and (DataFinal = 0) then
    result := false
  else
  begin
    if (DataInicial = 0) then
    begin
      ShowMessage('Data inicial não informada.');
      result := false;
    end
    else
    if (DataFinal = 0) then
    begin
      ShowMessage('Data final não informada.');
      result := false;
    end
    else
    if (DataInicial > DataInicial) then
    begin
      ShowMessage('Data inicial maior que data final.');
      result := false;
    end
    else
    begin
      FDataInicial := DataInicial;
      FDataFinal   := DataFinal;
      result := true;
    end;
  end;
end;

function TfrmOiValorPorAdicao.ValidarDatasCalculo: Boolean;
var
  DataInicial: TDateTime;
  DataFinal: TDateTime;
begin
  FDataInicialCalculo := 0;
  FDataFinalCalculo   := 0;

  DataInicial         := StrToDateTimeDef(mskDataIniCalc.Text,0);
  DataFinal           := StrToDateTimeDef(mskDataFinCalc.Text,0);

  if (DataInicial = 0 ) and (DataFinal = 0) then
    result := false
  else
  begin
    if (DataInicial = 0) then
    begin
      ShowMessage('Data inicial, do cálculo, não informada. ' + #13#10 + 'A data do cálculo não será considerada para o relatório.');
      result := false;
    end
    else
    if (DataFinal = 0) then
    begin
      ShowMessage('Data final, do cálculo, não informada. ' + #13#10 + 'A data do cálculo não será considerada para o relatório.');
      result := false;
    end
    else
    if (DataInicial > DataInicial) then
    begin
      ShowMessage('Data inicial, do cálculo, maior que data final. ' + #13#10 + 'A data do cálculo não será considerada para o relatório.');
      result := false;
    end
    else
    begin
      FDataInicialCalculo := DataInicial;
      FDataFinalCalculo   := DataFinal;
      result := true;
    end;
  end;
end;

procedure TfrmOiValorPorAdicao.FormActivate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  btn_co_unid_negClick(nil);
  msk_cd_produto.Text  := str_cd_produto;
  btn_co_produtoClick(nil);
end;

procedure TfrmOiValorPorAdicao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOiValorPorAdicao.btnAreaClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    mskArea.Text := ConsultaOnLineEx('TAREA', 'Área', ['CD_AREA','NM_AREA'], ['Código','Descrição'], 'CD_AREA', nil, 1, mskArea.text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edtArea.Text := ConsultaLookUP('TAREA','CD_AREA',mskArea.Text,'NM_AREA');
end;

procedure TfrmOiValorPorAdicao.btnMercadoriaClick(Sender: TObject);
var
  vFiltro: String;
begin

  if Sender Is TSpeedButton Then
  begin
    if (mskGrupo.Text = '') and (mskEmpresa.Text = '')then
    begin
      MessageDlg('Favor selecionar um Grupo ou Empresa para pesquisar uma mercadoria.', mtWarning, [mbOK], 0);
      Exit;
    end;
    vFiltro := '( ( CD_IMPORTADOR = ''' + Trim(mskEmpresa.text) + ''' AND ''' + Trim(mskEmpresa.text) + ''' <> '''' ) OR ( CD_GRUPO = ''' + Trim(mskGrupo.text) + ''' AND ''' + Trim(mskGrupo.text) + ''' <> '''') )';
    mskMercadoria.Text := ConsultaOnLineExFiltro('TMERCADORIA','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA'],['Código','Nome'],'CD_MERCADORIA',vFiltro,frm_main.mi_cad_merc);
  end    
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edtMercadoria.Text := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA', mskMercadoria.Text,'NM_MERCADORIA');
end;

end.
