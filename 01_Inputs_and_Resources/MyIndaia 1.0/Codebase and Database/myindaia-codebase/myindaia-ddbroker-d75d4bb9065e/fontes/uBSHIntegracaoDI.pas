unit uBSHIntegracaoDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, DBTables, DB, StrUtils,
  DBCtrls;

type
  Tfrm_BSH_Integracao_DI = class(TForm)
    dlgOpenOpenFile: TOpenDialog;
    pnl1: TPanel;
    btn_importar_remessa: TSpeedButton;
    btn_sair: TSpeedButton;
    pnl2: TPanel;
    lbl1: TLabel;
    btn_file_remessa: TSpeedButton;
    edt_nm_file_remessa: TEdit;
    pnl_status_remessa: TPanel;
    lbl_nr_processo: TLabel;
    medt_nr_processo: TMaskEdit;
    btn_nr_processo: TSpeedButton;
    chkProcessos: TCheckBox;
    shp1: TShape;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    medt1: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    medt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    medt2: TMaskEdit;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    lbl_bl: TLabel;
    edt_bl: TEdit;
    edt_bl_master: TEdit;
    Label3: TLabel;
    procedure btn_file_remessaClick(Sender: TObject);
    procedure edt_nm_file_remessaExit(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_importar_remessaClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Identificador01;
    procedure Identificador03;
    procedure Identificador04;
    procedure Identificador05;
    procedure Identificador07;
    procedure Identificador08;
    procedure Identificador10;
    procedure Identificador11;
    procedure Identificador12;
    procedure Identificador13;
    procedure Identificador14;
    procedure Identificador15;
    procedure Identificador16;
    procedure Identificador17;
    procedure Identificador18;
    procedure Identificador19;
    procedure Identificador20;
    procedure Identificador21;
    procedure Identificador22;
    function AAAAMMDDtoDate(pAAAAMMDD: string): TDateTime;
    function SouN(pLetra: String): string;
    function StrToValor(pAntesCD, pDepoisCD: string): Real;
    function AAAAMMDDtoDDMMAAAA(pAAAAMMDD: string): String;
    function UltimoItem(pProcesso, pAdicao : String): string;
    function UltimoMais1(pTabela, pProcesso: String): string;
    { Private declarations }
  public
    F : TextFile;
    reg : String;
    vMemoInfoCompl : TMemo;
    vUltimoItem : string;
    vNCMAdicao, vCD_AUSENCIA_FABRICAdicao : string;
    vPL_MERCADORIAAdicao : Real;
    { Public declarations }
  end;

var
  frm_BSH_Integracao_DI: Tfrm_BSH_Integracao_DI;

implementation

uses PGGP001, Funcoes, ConsOnLineEx;

{$R *.dfm}

procedure Tfrm_BSH_Integracao_DI.btn_file_remessaClick(Sender: TObject);
begin
  if dlgOpenOpenFile.Execute then
    edt_nm_file_remessa.Text := dlgOpenOpenFile.FileName;
  edt_nm_file_remessaExit( nil );
end;

procedure Tfrm_BSH_Integracao_DI.edt_nm_file_remessaExit(Sender: TObject);
begin
  if edt_nm_file_remessa.Text = '' then
  begin
     pnl_status_remessa.Caption := 'Informe um nome para o arquivo a ser lido, e clique em importar dados...';
     Exit;
  end;
  if not FileExists( edt_nm_file_remessa.text ) then
  begin
    ShowMessage('O arquivo não existe.');
    edt_nm_file_remessa.SetFocus;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''01''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + medt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  medt_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure Tfrm_BSH_Integracao_DI.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    medt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  Else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', medt_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_BSH_Integracao_DI.Identificador01;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TDECLARACAO_IMPORTACAO(');
      SQL.Add('                        NR_PROCESSO, NR_DECLARACAO_IMP, DT_REGISTRO_DI, QT_ADICOES, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_IMPORTADOR,');
      SQL.Add('                        CD_PAIS_IMPORTADOR, CD_MODALIDADE_DESP, IN_OPERACAO_FUNDAP, CD_URF_ENTR_CARGA, CD_URF_DESPACHO,');
      SQL.Add('                        CD_TIPO_CONSIG, NR_CONSIGNATARIO, NM_CONSIGNATARIO, CD_PAIS_PROC_CARGA, CD_VIA_TRANSP_CARG,');
      SQL.Add('                        IN_MULTIMODAL, NR_VEICULO_TRANSP, NM_VEICULO_TRANSP, CD_BANDEIRA_TRANSP, NR_AGENTE_CARGA,');
      SQL.Add('                        CD_PRESENCA_CARGA, CD_LOCAL_EMBARQUE, DT_EMBARQUE, PB_CARGA, PL_CARGA, DT_CHEGADA_CARGA,');
      SQL.Add('                        CD_TIPO_MANIFESTO, NR_MANIFESTO, CD_RECINTO_ALFAND, VL_TOT_FRT_PREPAID, VL_TOT_FRT_COLLECT,');
      SQL.Add('                        VL_FRETE_TNAC_MNEG, CD_MOEDA_FRETE, VL_TOTAL_FRETE_MN, VL_TOT_SEGURO_MNEG, CD_MOEDA_SEGURO,');
      SQL.Add('                        VL_TOTAL_SEG_MN, CD_UTIL_DCTO_CARGA, CD_MOTIVO_RETIF, NR_SEQ_RETIFICACAO,');
      SQL.Add('                        CD_SETOR_ARMAZENAM, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB, CD_VEICULO_TRANSP, CD_TRANSPORTADOR)');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_DECLARACAO_IMP, :DT_REGISTRO_DI, :QT_ADICOES, :CD_TIPO_DECLARACAO, :CD_TIPO_IMPORTADOR, :CD_IMPORTADOR,');
      SQL.Add('                        :CD_PAIS_IMPORTADOR, :CD_MODALIDADE_DESP, :IN_OPERACAO_FUNDAP, :CD_URF_ENTR_CARGA, :CD_URF_DESPACHO,');
      SQL.Add('                        :CD_TIPO_CONSIG, :NR_CONSIGNATARIO, :NM_CONSIGNATARIO, :CD_PAIS_PROC_CARGA, :CD_VIA_TRANSP_CARG,');
      SQL.Add('                        :IN_MULTIMODAL, :NR_VEICULO_TRANSP, :NM_VEICULO_TRANSP, :CD_BANDEIRA_TRANSP, :NR_AGENTE_CARGA,');
      SQL.Add('                        :CD_PRESENCA_CARGA, :CD_LOCAL_EMBARQUE, :DT_EMBARQUE, :PB_CARGA, :PL_CARGA, :DT_CHEGADA_CARGA,');
      SQL.Add('                        :CD_TIPO_MANIFESTO, :NR_MANIFESTO, :CD_RECINTO_ALFAND, :VL_TOT_FRT_PREPAID, :VL_TOT_FRT_COLLECT,');
      SQL.Add('                        :VL_FRETE_TNAC_MNEG, :CD_MOEDA_FRETE, :VL_TOTAL_FRETE_MN, :VL_TOT_SEGURO_MNEG, :CD_MOEDA_SEGURO,');
      SQL.Add('                        :VL_TOTAL_SEG_MN, :CD_UTIL_DCTO_CARGA, :CD_MOTIVO_RETIF, :NR_SEQ_RETIFICACAO,');
      SQL.Add('                        :CD_SETOR_ARMAZENAM, :CD_TIPO_PGTO_TRIB, :NR_CONTA_PGTO_TRIB, :CD_VEICULO_TRANSP, :CD_TRANSPORTADOR )');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_DECLARACAO_IMP').AsString   := medt2.Text;
      ParamByName('DT_REGISTRO_DI').AsString      := medt1.Text;
      ParamByName('QT_ADICOES').AsString          := Copy(reg,28,3);
      ParamByName('CD_TIPO_DECLARACAO').AsString  := Copy(reg,31,2);
      ParamByName('CD_TIPO_IMPORTADOR').AsString  := Copy(reg,34,1);
      ParamByName('CD_IMPORTADOR').AsString       := ConsultaLookup('TEMPRESA_NAC','CGC_EMPRESA',Copy(reg,35,14),'CD_EMPRESA');
      ParamByName('CD_PAIS_IMPORTADOR').AsString  := Copy(reg,49,3);
      ParamByName('CD_MODALIDADE_DESP').AsString  := Copy(reg,265,1);
      ParamByName('IN_OPERACAO_FUNDAP').AsString  := SouN(Copy(reg,266,1));
      ParamByName('CD_URF_ENTR_CARGA').AsString   := Copy(reg,267,7);
      ParamByName('CD_URF_DESPACHO').AsString     := Copy(reg,274,7);
      ParamByName('CD_TIPO_CONSIG').AsString      := Copy(reg,281,1);
      ParamByName('NR_CONSIGNATARIO').AsString    := Copy(reg,282,14);
      ParamByName('NM_CONSIGNATARIO').AsString    := Copy(reg,296,60);
      ParamByName('CD_PAIS_PROC_CARGA').AsString  := Copy(reg,356,3);
      ParamByName('CD_VIA_TRANSP_CARG').AsString  := Copy(reg,359,2);
      ParamByName('IN_MULTIMODAL').AsString       := SouN(Copy(reg,361,1));
      ParamByName('NR_VEICULO_TRANSP').AsString   := Copy(reg,362,15);
      ParamByName('NM_VEICULO_TRANSP').AsString   := Copy(reg,377,30);
      ParamByName('CD_VEICULO_TRANSP').AsString   := ConsultaLookUPSQL('SELECT CD_EMBARCACAO FROM TEMBARCACAO WHERE NM_EMBARCACAO LIKE ''%' + Trim(Copy(reg,377,15)) + '%''','CD_EMBARCACAO');
      ParamByName('CD_TRANSPORTADOR').AsString    := ConsultaLookUPSQL('SELECT CODIGO FROM TTRANSPORTADOR_ITL WHERE DESCRICAO LIKE ''%' + Trim(Copy(reg,407,15)) + '%''','CODIGO');
      ParamByName('CD_BANDEIRA_TRANSP').AsString  := Copy(reg,467,3);
      ParamByName('NR_AGENTE_CARGA').AsString     := Copy(reg,471,14);
      ParamByName('CD_PRESENCA_CARGA').AsString   := Copy(reg,487,36);
      ParamByName('CD_LOCAL_EMBARQUE').AsString   := ConsultaLookUPSQL('SELECT CODIGO FROM TLOCAL_EMBARQUE WHERE DESCRICAO LIKE ''%' + Trim(Copy(reg,523,8)) + '%''','CODIGO');
      ParamByName('DT_EMBARQUE').AsString         := AAAAMMDDtoDDMMAAAA(Copy(reg,573,8));
      ParamByName('PB_CARGA').AsFloat             := StrToValor(Copy(reg,581,10),Copy(reg,591,5));
      ParamByName('PL_CARGA').AsFloat             := StrToValor(Copy(reg,596,10),Copy(reg,606,5));
      ParamByName('DT_CHEGADA_CARGA').AsString    := AAAAMMDDtoDDMMAAAA(Copy(reg,611,8));
      ParamByName('CD_TIPO_MANIFESTO').AsString   := Copy(reg,619,1);
      ParamByName('NR_MANIFESTO').AsString        := Copy(reg,620,15);
      ParamByName('CD_RECINTO_ALFAND').AsString   := Copy(reg,635,7);
      ParamByName('VL_TOT_FRT_PREPAID').AsFloat   := StrToValor(Copy(reg,642,13),Copy(reg,655,2));
      ParamByName('VL_TOT_FRT_COLLECT').AsFloat   := StrToValor(Copy(reg,657,13),Copy(reg,670,2));
      ParamByName('VL_FRETE_TNAC_MNEG').AsFloat   := StrToValor(Copy(reg,672,13),Copy(reg,685,2));
      ParamByName('CD_MOEDA_FRETE').AsString      := Copy(reg,687,3);
      ParamByName('VL_TOTAL_FRETE_MN').AsFloat    := StrToValor(Copy(reg,690,13),Copy(reg,703,2));
      ParamByName('VL_TOT_SEGURO_MNEG').AsFloat   := StrToValor(Copy(reg,705,13),Copy(reg,718,2));
      ParamByName('CD_MOEDA_SEGURO').AsString     := Copy(reg,720,3);
      ParamByName('VL_TOTAL_SEG_MN').AsFloat      := StrToValor(Copy(reg,723,13),Copy(reg,736,2));
      ParamByName('CD_UTIL_DCTO_CARGA').AsString  := Copy(reg,786,1);
      ParamByName('CD_MOTIVO_RETIF').AsString     := Copy(reg,789,2);
      ParamByName('NR_SEQ_RETIFICACAO').AsString  := Copy(reg,791,2);
      ParamByName('CD_SETOR_ARMAZENAM').AsString  := Copy(reg,803,3);
      ParamByName('CD_TIPO_PGTO_TRIB').AsString   := Copy(reg,806,1);
      ParamByName('NR_CONTA_PGTO_TRIB').AsString  := Copy(reg,807,19);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador03;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TDOCUMENTO_INSTRUCAO(NR_PROCESSO, NR_SEQUENCIA, CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO)');
      SQL.Add('               VALUES (:NR_PROCESSO, :NR_SEQUENCIA, :CD_TIPO_DCTO_INSTR, :NR_DCTO_INSTRUCAO)');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_SEQUENCIA').AsString        := UltimoMais1('TDOCUMENTO_INSTRUCAO', medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text);
      ParamByName('CD_TIPO_DCTO_INSTR').AsString  := Copy(reg,18,2);
      ParamByName('NR_DCTO_INSTRUCAO').AsString   := Copy(reg,20,25);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

function Tfrm_BSH_Integracao_DI.UltimoMais1(pTabela, pProcesso : String ) : string;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_SEQUENCIA),0) + 1 FROM ' + pTabela + ' WHERE NR_PROCESSO = ''' + pProcesso + '''');
    Open;
    Result := Fields[0].AsString;
    Close;
    Free;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador04;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TEMBALAGEM_CARGA(NR_PROCESSO, NR_SEQUENCIA, CD_TIPO_EMBALAGEM, QT_VOLUME_CARGA)');
      SQL.Add('               VALUES (:NR_PROCESSO, :NR_SEQUENCIA, :CD_TIPO_EMBALAGEM, :QT_VOLUME_CARGA)');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_SEQUENCIA').AsString        := '1';
      ParamByName('CD_TIPO_EMBALAGEM').AsString   := Copy(reg,18,2);
      ParamByName('QT_VOLUME_CARGA').AsString     := Copy(reg,20,5);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador05;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TCARGA_ARMAZEM(NR_PROCESSO, NR_SEQUENCIA, NM_ARMAZEM_CARGA)');
      SQL.Add('               VALUES (:NR_PROCESSO, :NR_SEQUENCIA, :NM_ARMAZEM_CARGA)');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_SEQUENCIA').AsString        := '1';
      ParamByName('NM_ARMAZEM_CARGA').AsString    := Copy(reg,18,10);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador07;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TPAGAMENTO_TRIBUTOS(NR_PROCESSO, CD_RECEITA_PGTO, CD_BANCO_PGTO_TRIB,');
      SQL.Add('                        NR_AGENC_PGTO_TRIB, VL_TRIBUTO_PAGO, DT_PGTO_TRIBUTO, VL_MULTA_PGTO_TRIB,');
      SQL.Add('                        VL_JUROS_PGTO_TRIB)');
      SQL.Add('               VALUES ( :NR_PROCESSO, :CD_RECEITA_PGTO, :CD_BANCO_PGTO_TRIB,');
      SQL.Add('                        :NR_AGENC_PGTO_TRIB, :VL_TRIBUTO_PAGO, :DT_PGTO_TRIBUTO, :VL_MULTA_PGTO_TRIB,');
      SQL.Add('                        :VL_JUROS_PGTO_TRIB)');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('CD_RECEITA_PGTO').AsString     := Copy(reg,18,4);
      ParamByName('CD_BANCO_PGTO_TRIB').AsString  := Copy(reg,22,3);
      ParamByName('NR_AGENC_PGTO_TRIB').AsString  := Copy(reg,25,4);
      ParamByName('VL_TRIBUTO_PAGO').AsFloat      := StrToValor(Copy(reg,29,13),Copy(reg,42,2));
      ParamByName('DT_PGTO_TRIBUTO').AsDateTime   := AAAAMMDDToDate(Copy(reg,44,8));
      ParamByName('VL_MULTA_PGTO_TRIB').AsFloat   := StrToValor(Copy(reg,52,7),Copy(reg,59,2));
      ParamByName('VL_JUROS_PGTO_TRIB').AsFloat   := StrToValor(Copy(reg,61,7),Copy(reg,68,2));
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador08;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TDECLARACAO_IMPORTACAO SET TX_INFO_COMPL = :TX_INFO_COMPL WHERE NR_PROCESSO = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + '''');
      ParamByName('TX_INFO_COMPL').AsMemo := vMemoInfoCompl.Text;
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador10;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TADICAO_DE_IMPORTACAO(');
      SQL.Add('             NR_PROCESSO, NR_ADICAO, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, IN_MULTIMODAL, NM_FORN_ESTR, CD_FORNECEDOR,');
      SQL.Add('             ED_LOGR_FORN_ESTR, ED_NR_FORN_ESTR, ED_COMPL_FORN_ESTR, ED_CIDAD_FORN_ESTR, ED_ESTAD_FORN_ESTR,');
      SQL.Add('             CD_PAIS_AQUIS_MERC, CD_NCM_SH, CD_MERCADORIA_NCM, CD_PAIS_PROC_MERC, CD_AUSENCIA_FABRIC, NM_FABRICANTE_MERC,');
      SQL.Add('             ED_LOGR_FABRIC, ED_NR_FABRIC, ED_COMPL_FABRIC, ED_CIDAD_FABRIC, ED_ESTADO_FABRIC, CD_PAIS_ORIG_MERC,');
      SQL.Add('             CD_MERC_NBM_SH, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, PL_MERCADORIA, QT_UN_ESTATISTICA,');
      SQL.Add('             CD_APLICACAO_MERC, CD_MOEDA_NEGOCIADA, CD_INCOTERMS_VENDA, CD_LOC_COND_VENDA, VL_MERC_COND_VENDA,');
      SQL.Add('             VL_MERC_VENDA_MN, VL_FRETE_MERC_MNEG, CD_MD_FRETE_MERC, VL_FRETE_MERC_MN, VL_SEG_MERC_MNEG,');
      SQL.Add('             CD_MOEDA_SEG_MERC, VL_SEG_MERC_MN, CD_METOD_VALORACAO, CD_VINC_IMPO_EXPO, CD_TIPO_ACORDO_TAR,');
      SQL.Add('             CD_ACORDO_ALADI, CD_REGIME_TRIBUTAR, CD_FUND_LEG_REGIME, NR_DCTO_REDUCAO, VL_MERC_LOC_EMB_MN,');
      SQL.Add('             PC_COEF_REDUC_II, VL_II_CALC_DCR_MN, VL_II_A_REC_ZFM, CD_COBERT_CAMBIAL, CD_MODALIDADE_PGTO,');
      SQL.Add('             CD_ORGAO_FIN_INTER, CD_MOTIVO_SEM_COB, QT_PARC_FINANC_360, CD_PERIOD_PGTO_360, QT_PERIOD_PGTO_360,');
      SQL.Add('             VL_TOT_FINANC_360, PC_TAXA_JUROS, CD_TAXA_JUROS, VL_FINANC_SUP_360, NR_ROF, IN_PGTO_VARIAV_360,');
      SQL.Add('             IN_JUROS_ATE_360, PC_COMISSAO_AG_IMP, VL_COMISSAO_AG_IMP, CD_TIPO_AGENTE_IMP, NR_AGENTE_IMP,');
      SQL.Add('             CD_BANC_AGENTE_IMP, CD_AGENC_AGENT_IMP, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, TX_COMPL_VL_ADUAN,');
      SQL.Add('             CD_MOTIVO_ADM_TEMP, VL_CALC_DCR_DOLAR, VL_II_DEVIDO_ZFM, NR_OPER_TRAT_PREV, CD_FUND_LEGAL_PISCOFINS, PC_ICMS)');
      SQL.Add('    VALUES ( :NR_PROCESSO, :NR_ADICAO, :CD_URF_ENTR_MERC, :CD_VIA_TRANSPORTE, :IN_MULTIMODAL, :NM_FORN_ESTR, :CD_FORNECEDOR,');
      SQL.Add('             :ED_LOGR_FORN_ESTR, :ED_NR_FORN_ESTR, :ED_COMPL_FORN_ESTR, :ED_CIDAD_FORN_ESTR, :ED_ESTAD_FORN_ESTR,');
      SQL.Add('             :CD_PAIS_AQUIS_MERC, :CD_NCM_SH, :CD_MERCADORIA_NCM, :CD_PAIS_PROC_MERC, :CD_AUSENCIA_FABRIC, :NM_FABRICANTE_MERC,');
      SQL.Add('             :ED_LOGR_FABRIC, :ED_NR_FABRIC, :ED_COMPL_FABRIC, :ED_CIDAD_FABRIC, :ED_ESTADO_FABRIC, :CD_PAIS_ORIG_MERC,');
      SQL.Add('             :CD_MERC_NBM_SH, :CD_MERC_NALADI_NCC, :CD_MERC_NALADI_SH, :PL_MERCADORIA, :QT_UN_ESTATISTICA,');
      SQL.Add('             :CD_APLICACAO_MERC, :CD_MOEDA_NEGOCIADA, :CD_INCOTERMS_VENDA, :CD_LOC_COND_VENDA, :VL_MERC_COND_VENDA,');
      SQL.Add('             :VL_MERC_VENDA_MN, :VL_FRETE_MERC_MNEG, :CD_MD_FRETE_MERC, :VL_FRETE_MERC_MN, :VL_SEG_MERC_MNEG,');
      SQL.Add('             :CD_MOEDA_SEG_MERC, :VL_SEG_MERC_MN, :CD_METOD_VALORACAO, :CD_VINC_IMPO_EXPO, :CD_TIPO_ACORDO_TAR,');
      SQL.Add('             :CD_ACORDO_ALADI, :CD_REGIME_TRIBUTAR, :CD_FUND_LEG_REGIME, :NR_DCTO_REDUCAO, :VL_MERC_LOC_EMB_MN,');
      SQL.Add('             :PC_COEF_REDUC_II, :VL_II_CALC_DCR_MN, :VL_II_A_REC_ZFM, :CD_COBERT_CAMBIAL, :CD_MODALIDADE_PGTO,');
      SQL.Add('             :CD_ORGAO_FIN_INTER, :CD_MOTIVO_SEM_COB, :QT_PARC_FINANC_360, :CD_PERIOD_PGTO_360, :QT_PERIOD_PGTO_360,');
      SQL.Add('             :VL_TOT_FINANC_360, :PC_TAXA_JUROS, :CD_TAXA_JUROS, :VL_FINANC_SUP_360, :NR_ROF, :IN_PGTO_VARIAV_360,');
      SQL.Add('             :IN_JUROS_ATE_360, :PC_COMISSAO_AG_IMP, :VL_COMISSAO_AG_IMP, :CD_TIPO_AGENTE_IMP, :NR_AGENTE_IMP,');
      SQL.Add('             :CD_BANC_AGENTE_IMP, :CD_AGENC_AGENT_IMP, :IN_BEM_ENCOMENDA, :IN_MATERIAL_USADO, :TX_COMPL_VL_ADUAN,');
      SQL.Add('             :CD_MOTIVO_ADM_TEMP, :VL_CALC_DCR_DOLAR, :VL_II_DEVIDO_ZFM, :NR_OPER_TRAT_PREV, :CD_FUND_LEGAL_PISCOFINS, :PC_ICMS)');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString           := Copy(reg,18,3);
      ParamByName('CD_URF_ENTR_MERC').AsString    := Copy(reg,21,7);
      ParamByName('CD_VIA_TRANSPORTE').AsString   := Copy(reg,28,2);
      ParamByName('IN_MULTIMODAL').AsString       := SouN(Copy(reg,30,1));
      ParamByName('NM_FORN_ESTR').AsString        := Copy(reg,31,60);
      ParamByName('CD_FORNECEDOR').AsString       := ConsultaLookUPSQL('SELECT CD_EMPRESA FROM TEMPRESA_EST WHERE IN_EXPORTADOR = ''1'' AND NM_EMPRESA LIKE ''%'' + SUBSTRING(''' + ParamByName('NM_FORN_ESTR').AsString + ''', 1, 20) + ''%''', 'CD_EMPRESA');
      ParamByName('ED_LOGR_FORN_ESTR').AsString   := Copy(reg,91,40);
      ParamByName('ED_NR_FORN_ESTR').AsString     := Copy(reg,131,6);
      ParamByName('ED_COMPL_FORN_ESTR').AsString  := Copy(reg,137,21);
      ParamByName('ED_CIDAD_FORN_ESTR').AsString  := Copy(reg,158,25);
      ParamByName('ED_ESTAD_FORN_ESTR').AsString  := Copy(reg,183,25);
      ParamByName('CD_PAIS_AQUIS_MERC').AsString  := Copy(reg,208,3);
      vNCMAdicao                                  := Copy(reg,211,8);
      ParamByName('CD_NCM_SH').AsString           := Copy(reg,211,8);
      ParamByName('CD_MERCADORIA_NCM').AsString   := Copy(reg,211,8);
      ParamByName('CD_PAIS_PROC_MERC').AsString   := Copy(reg,219,3);
      vCD_AUSENCIA_FABRICAdicao                   := Copy(reg,222,1);
      ParamByName('CD_AUSENCIA_FABRIC').AsString  := Copy(reg,222,1);
      ParamByName('NM_FABRICANTE_MERC').AsString  := Copy(reg,223,60);
      ParamByName('ED_LOGR_FABRIC').AsString      := Copy(reg,283,40);
      ParamByName('ED_NR_FABRIC').AsString        := Copy(reg,323,6);
      ParamByName('ED_COMPL_FABRIC').AsString     := Copy(reg,329,21);
      ParamByName('ED_CIDAD_FABRIC').AsString     := Copy(reg,350,25);
      ParamByName('ED_ESTADO_FABRIC').AsString    := Copy(reg,375,25);
      ParamByName('CD_PAIS_ORIG_MERC').AsString   := Copy(reg,400,3);
      ParamByName('CD_MERC_NBM_SH').AsString      := Copy(reg,405,8);
      ParamByName('CD_MERC_NALADI_NCC').AsString  := Copy(reg,413,7);
      ParamByName('CD_MERC_NALADI_SH').AsString   := Copy(reg,420,8);
      vPL_MERCADORIAAdicao                        := StrToValor(Copy(reg,428,10),Copy(reg,438,5));
      ParamByName('PL_MERCADORIA').AsFloat        := StrToValor(Copy(reg,428,10),Copy(reg,438,5));
      ParamByName('QT_UN_ESTATISTICA').AsFloat    := StrToValor(Copy(reg,443,9),Copy(reg,452,5));
      ParamByName('CD_APLICACAO_MERC').AsString   := Copy(reg,457,1);
      ParamByName('CD_MOEDA_NEGOCIADA').AsString  := Copy(reg,458,3);
      ParamByName('CD_INCOTERMS_VENDA').AsString  := Copy(reg,461,3);
      ParamByName('CD_LOC_COND_VENDA').AsString   := ConsultaLookup('TLOCAL_EMBARQUE','DESCRICAO',Copy(reg,464,60),'CODIGO');
      ParamByName('VL_MERC_COND_VENDA').AsFloat   := StrToValor(Copy(reg,524,13),Copy(reg,537,2));
      ParamByName('VL_MERC_VENDA_MN').AsFloat     := StrToValor(Copy(reg,539,13),Copy(reg,552,2));
      ParamByName('VL_FRETE_MERC_MNEG').AsFloat   := StrToValor(Copy(reg,554,13),Copy(reg,567,2));
      ParamByName('CD_MD_FRETE_MERC').AsString    := Copy(reg,569,3);
      ParamByName('VL_FRETE_MERC_MN').AsFloat     := StrToValor(Copy(reg,572,13),Copy(reg,585,2));
      ParamByName('VL_SEG_MERC_MNEG').AsFloat     := StrToValor(Copy(reg,587,13),Copy(reg,600,2));
      ParamByName('CD_MOEDA_SEG_MERC').AsString   := Copy(reg,602,3);
      ParamByName('VL_SEG_MERC_MN').AsFloat       := StrToValor(Copy(reg,605,13),Copy(reg,618,2));
      ParamByName('CD_METOD_VALORACAO').AsString  := Copy(reg,620,2);
      ParamByName('CD_VINC_IMPO_EXPO').AsString   := Copy(reg,622,1);
      ParamByName('CD_TIPO_ACORDO_TAR').AsString  := Copy(reg,623,1);
      ParamByName('CD_ACORDO_ALADI').AsString     := Copy(reg,624,3);
      ParamByName('CD_REGIME_TRIBUTAR').AsString  := Copy(reg,627,1);
      ParamByName('CD_FUND_LEG_REGIME').AsString  := Copy(reg,628,2);
      ParamByName('NR_DCTO_REDUCAO').AsString     := Copy(reg,630,8);
      ParamByName('VL_MERC_LOC_EMB_MN').AsFloat   := StrToValor(Copy(reg,638,13),Copy(reg,651,2));
      ParamByName('PC_COEF_REDUC_II').AsFloat     := StrToValor(Copy(reg,686,3),Copy(reg,689,2));
      ParamByName('VL_II_CALC_DCR_MN').AsFloat    := StrToValor(Copy(reg,691,13),Copy(reg,704,2));
      ParamByName('VL_II_A_REC_ZFM').AsFloat      := StrToValor(Copy(reg,706,13),Copy(reg,719,2));
      ParamByName('CD_COBERT_CAMBIAL').AsString   := Copy(reg,721,1);
      ParamByName('CD_MODALIDADE_PGTO').AsString  := Copy(reg,722,2);
      ParamByName('CD_ORGAO_FIN_INTER').AsString  := Copy(reg,724,2);
      ParamByName('CD_MOTIVO_SEM_COB').AsString   := Copy(reg,726,2);
      ParamByName('QT_PARC_FINANC_360').AsString  := Copy(reg,728,3);
      ParamByName('CD_PERIOD_PGTO_360').AsString  := Copy(reg,731,1);
      ParamByName('QT_PERIOD_PGTO_360').AsString  := Copy(reg,732,3);
      ParamByName('VL_TOT_FINANC_360').AsFloat    := StrToValor(Copy(reg,735,13),Copy(reg,748,2));
      ParamByName('PC_TAXA_JUROS').AsFloat        := StrToValor(Copy(reg,750,6),Copy(reg,756,7));
      ParamByName('CD_TAXA_JUROS').AsString       := Copy(reg,763,4);
      ParamByName('VL_FINANC_SUP_360').AsFloat    := StrToValor(Copy(reg,767,13),Copy(reg,780,2));
      ParamByName('NR_ROF').AsString              := Copy(reg,782,8);
      ParamByName('IN_PGTO_VARIAV_360').AsString  := SouN(Copy(reg,790,1));
      ParamByName('IN_JUROS_ATE_360').AsString    := SouN(Copy(reg,791,1));
      ParamByName('PC_COMISSAO_AG_IMP').AsFloat   := StrToValor(Copy(reg,792,3),Copy(reg,795,3));
      ParamByName('VL_COMISSAO_AG_IMP').AsFloat   := StrToValor(Copy(reg,798,13),Copy(reg,811,2));
      ParamByName('CD_TIPO_AGENTE_IMP').AsString  := Copy(reg,813,1);
      ParamByName('NR_AGENTE_IMP').AsString       := Copy(reg,814,14);
      ParamByName('CD_BANC_AGENTE_IMP').AsString  := Copy(reg,828,5);
      ParamByName('CD_AGENC_AGENT_IMP').AsString  := Copy(reg,833,4);
      ParamByName('IN_BEM_ENCOMENDA').AsString    := SouN(Copy(reg,837,1));
      ParamByName('IN_MATERIAL_USADO').AsString   := SouN(Copy(reg,838,1));
      ParamByName('TX_COMPL_VL_ADUAN').AsString   := Copy(reg,839,250);
      ParamByName('CD_MOTIVO_ADM_TEMP').AsString  := Copy(reg,1089,2);
      ParamByName('VL_CALC_DCR_DOLAR').AsFloat    := StrToValor(Copy(reg,1091,13),Copy(reg,1104,2));
      ParamByName('VL_II_DEVIDO_ZFM').AsFloat     := StrToValor(Copy(reg,1106,13),Copy(reg,1119,2));
      ParamByName('NR_OPER_TRAT_PREV').AsString   := Copy(reg,1121,10);
      ParambyName('PC_ICMS').AsString  := Copy(reg,1132,2);
      ParamBynAme('CD_FUND_LEGAL_PISCOFINS').AsString := Copy(reg, 1138, 2);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador11;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TPAGAMENTO_PREVISTO(NR_PROCESSO, NR_ADICAO, NR_SEQUENCIA, DT_PREV_PGTO_360, VL_PREV_PGTO_360)');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ADICAO, :NR_SEQUENCIA, :DT_PREV_PGTO_360, :VL_PREV_PGTO_360)');
      ParamByName('NR_PROCESSO').AsString      := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString        := Copy(reg,18,3);
      ParamByName('NR_SEQUENCIA').AsString     := UltimoMais1('TPAGAMENTO_PREVISTO', medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text);
      ParamByName('DT_PREV_PGTO_360').AsString := Copy(reg,25,2)+Copy(reg,21,4);
      ParamByName('VL_PREV_PGTO_360').AsFloat  := StrToValor(Copy(reg,27,13),Copy(reg,40,2));
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador12;
begin
(*  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TPAGAMENTO_VINCULADO(NR_PROCESSO, NR_ADICAO, NR_SEQUENCIA, IN_PAGAMENTO_MN, CD_BANCO_PAGAMENTO,');
      SQL.Add('                                 CD_PRACA_PAGAMENTO, NR_OP_CAMBIO, VL_VINC_MD_CAMBIO, CD_TP_COMPR_CAMBIO, NR_COMPR_CAMBIO )');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ADICAO, :IN_PAGAMENTO_MN, :CD_BANCO_PAGAMENTO,');
      SQL.Add('                                 :CD_PRACA_PAGAMENTO, :NR_OP_CAMBIO, :VL_VINC_MD_CAMBIO, :CD_TP_COMPR_CAMBIO, :NR_COMPR_CAMBIO )');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString           := Copy(reg,18,3);
      ParamByName('NR_SEQUENCIA').AsString        := '1';
      ParamByName('IN_PAGAMENTO_MN').AsString     := Copy(reg,21,1);
      ParamByName('CD_BANCO_PAGAMENTO').AsString  := Copy(reg,22,5);
      ParamByName('CD_PRACA_PAGAMENTO').AsString  := Copy(reg,27,4);
      ParamByName('NR_OP_CAMBIO').AsString        := Copy(reg,31,8);
      ParamByName('VL_VINC_MD_CAMBIO').AsFloat    := StrToValor(Copy(reg,39,13),Copy(reg,52,2));
      ParamByName('CD_TP_COMPR_CAMBIO').AsString  := Copy(reg,54,1);
      ParamByName('NR_COMPR_CAMBIO').AsString     := Copy(reg,55,14);
      ExecSQL;
    finally
      Free;
    end;
  end;*)
end;

procedure Tfrm_BSH_Integracao_DI.Identificador13;
begin
(*  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TPAGAMENTO_VINCULADO(NR_PROCESSO, NR_ADICAO, NR_SEQUENCIA, IN_PAGAMENTO_MN, CD_BANCO_PAGAMENTO,');
      SQL.Add('                                 CD_PRACA_PAGAMENTO, NR_OP_CAMBIO, VL_VINC_MD_CAMBIO, CD_TP_COMPR_CAMBIO, NR_COMPR_CAMBIO )');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ADICAO, :IN_PAGAMENTO_MN, :CD_BANCO_PAGAMENTO,');
      SQL.Add('                                 :CD_PRACA_PAGAMENTO, :NR_OP_CAMBIO, :VL_VINC_MD_CAMBIO, :CD_TP_COMPR_CAMBIO, :NR_COMPR_CAMBIO )');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString           := Copy(reg,18,3);
      ParamByName('NR_SEQUENCIA').AsString        := '1';
      ParamByName('IN_PAGAMENTO_MN').AsString     := Copy(reg,21,1);
      ParamByName('CD_BANCO_PAGAMENTO').AsString  := Copy(reg,22,5);
      ParamByName('CD_PRACA_PAGAMENTO').AsString  := Copy(reg,27,4);
      ParamByName('NR_OP_CAMBIO').AsString        := Copy(reg,31,8);
      ParamByName('VL_VINC_MD_CAMBIO').AsFloat    := StrToValor(Copy(reg,39,13),Copy(reg,52,2));
      ParamByName('CD_TP_COMPR_CAMBIO').AsString  := Copy(reg,54,1);
      ParamByName('NR_COMPR_CAMBIO').AsString     := Copy(reg,55,14);
      ExecSQL;
    finally
      Free;
    end;
  end;*)
end;

procedure Tfrm_BSH_Integracao_DI.Identificador14;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TATO_VINCULADO(NR_PROCESSO, NR_ADICAO, CD_ASSUNTO_VINCUL, SG_TIPO_ATO_VINCUL, SG_ORG_ATO_VINCUL,');
      SQL.Add('                           DT_ANO_ATO_VINCUL, NR_ATO_VINCULADO, NR_EX_ATO_VINCUL )');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ADICAO, :CD_ASSUNTO_VINCUL, :SG_TIPO_ATO_VINCUL, :SG_ORG_ATO_VINCUL,');
      SQL.Add('                           :DT_ANO_ATO_VINCUL, :NR_ATO_VINCULADO, :NR_EX_ATO_VINCUL )');
      ParamByName('NR_PROCESSO').AsString        := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString          := Copy(reg,18,3);
      ParamByName('CD_ASSUNTO_VINCUL').AsString  := Copy(reg,21,1);
      ParamByName('SG_TIPO_ATO_VINCUL').AsString := Copy(reg,22,5);
      ParamByName('SG_ORG_ATO_VINCUL').AsString  := Copy(reg,27,6);
      ParamByName('DT_ANO_ATO_VINCUL').AsString  := Copy(reg,33,4);
      ParamByName('NR_ATO_VINCULADO').AsString   := Copy(reg,37,6);
      ParamByName('NR_EX_ATO_VINCUL').AsString   := Copy(reg,43,3);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador15;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TRIBUTO(NR_PROCESSO, NR_ADICAO, CD_RECEITA_IMPOSTO, CD_TIPO_ALIQ_IPT, VL_BASE_CALC_ADVAL, PC_ALIQ_NORM_ADVAL,');
      SQL.Add('                    VL_CALC_IPT_ADVAL, NM_UN_ALIQ_ESP_IPT, QT_ML_RECIPIENTE, QT_MERC_UN_ALIQ_ES, VL_ALIQ_ESPEC_IPT,');
      SQL.Add('                    VL_CALC_IPT_ESPEC, CD_TIPO_BENEF_IPI, PC_ALIQ_REDUZIDA, PC_REDUCAO_IPT_BLI, PC_ALIQ_ACOR_TARIF,');
      SQL.Add('                    VL_CALC_II_AC_TARI, VL_IMPOSTO_DEVIDO, VL_IPT_A_RECOLHER, CD_TIPO_DIREITO, NR_NOTA_COMPL_TIPI, CD_TIPO_RECIPIENTE)');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ADICAO, :CD_RECEITA_IMPOSTO, :CD_TIPO_ALIQ_IPT, :VL_BASE_CALC_ADVAL, :PC_ALIQ_NORM_ADVAL,');
      SQL.Add('                    :VL_CALC_IPT_ADVAL, :NM_UN_ALIQ_ESP_IPT, :QT_ML_RECIPIENTE, :QT_MERC_UN_ALIQ_ES, :VL_ALIQ_ESPEC_IPT,');
      SQL.Add('                    :VL_CALC_IPT_ESPEC, :CD_TIPO_BENEF_IPI, :PC_ALIQ_REDUZIDA, :PC_REDUCAO_IPT_BLI, :PC_ALIQ_ACOR_TARIF,');
      SQL.Add('                    :VL_CALC_II_AC_TARI, :VL_IMPOSTO_DEVIDO, :VL_IPT_A_RECOLHER, :CD_TIPO_DIREITO, :NR_NOTA_COMPL_TIPI, :CD_TIPO_RECIPIENTE)');
      ParamByName('NR_PROCESSO').AsString           := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString             := Copy(reg,18,3);
      ParamByName('CD_RECEITA_IMPOSTO').AsString    := Copy(reg,21,4);
      ParamByName('CD_TIPO_ALIQ_IPT').AsString      := Copy(reg,25,1);
      ParamByName('VL_BASE_CALC_ADVAL').AsFloat     := StrToValor(Copy(reg,26,13),Copy(reg,39,2));
      ParamByName('PC_ALIQ_NORM_ADVAL').AsFloat     := StrToValor(Copy(reg,41,3),Copy(reg,44,2));
      ParamByName('VL_CALC_IPT_ADVAL').AsFloat      := StrToValor(Copy(reg,46,13),Copy(reg,59,2));
      ParamByName('NM_UN_ALIQ_ESP_IPT').AsString    := Copy(reg,61,15);
      ParamByName('QT_ML_RECIPIENTE').AsString      := Copy(reg,76,5);
      ParamByName('QT_MERC_UN_ALIQ_ES').AsString    := Copy(reg,81,9);
      ParamByName('VL_ALIQ_ESPEC_IPT').AsFloat      := StrToValor(Copy(reg,90,5),Copy(reg,95,5));
      ParamByName('VL_CALC_IPT_ESPEC').AsFloat      := StrToValor(Copy(reg,100,13),Copy(reg,113,2));
      ParamByName('CD_TIPO_BENEF_IPI').AsString     := Copy(reg,115,1);
      ParamByName('PC_ALIQ_REDUZIDA').AsFloat       := StrToValor(Copy(reg,116,3),Copy(reg,119,2));
      ParamByName('PC_REDUCAO_IPT_BLI').AsFloat     := StrToValor(Copy(reg,121,3),Copy(reg,124,2));
      ParamByName('PC_ALIQ_ACOR_TARIF').AsFloat     := StrToValor(Copy(reg,126,3),Copy(reg,129,2));
      ParamByName('VL_CALC_II_AC_TARI').AsFloat     := StrToValor(Copy(reg,131,13),Copy(reg,144,2));
      ParamByName('VL_IMPOSTO_DEVIDO').AsFloat      := StrToValor(Copy(reg,146,13),Copy(reg,159,2));
      ParamByName('VL_IPT_A_RECOLHER').AsFloat      := StrToValor(Copy(reg,161,13),Copy(reg,174,2));
      ParamByName('CD_TIPO_DIREITO').AsString       := Copy(reg,176,1);
      ParamByName('NR_NOTA_COMPL_TIPI').AsString    := Copy(reg,177,2);
      ParamByName('CD_TIPO_RECIPIENTE').AsString    := Copy(reg,179,2);
      ExecSQL;
      SQL.Clear;
      SQL.Add('UPDATE TADICAO_DE_IMPORTACAO SET VL_BASE_PIS = (SELECT VL_BASE_CALC_ADVAL FROM TRIBUTO WHERE CD_RECEITA_IMPOSTO = ''0005'' AND NR_PROCESSO = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + ''')');
      SQL.Add(', VL_PIS = (SELECT VL_CALC_IPT_ADVAL FROM TRIBUTO WHERE CD_RECEITA_IMPOSTO = ''0005'' AND NR_PROCESSO = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + ''')');
      SQL.Add(', VL_COFINS = (SELECT VL_CALC_IPT_ADVAL FROM TRIBUTO WHERE CD_RECEITA_IMPOSTO = ''0006'' AND NR_PROCESSO = '''+ medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + ''')');
      SQL.Add('WHERE NR_PROCESSO =''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + '''');
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador16;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TDETALHE_MERCADORIA(NR_PROCESSO, NR_ADICAO, NR_ITEM, QT_MERC_UN_COMERC, CD_UN_MED_COMERC,CD_FABR_EXPO,');
      SQL.Add('                                VL_UNID_COND_VENDA, VL_UNITARIO, VL_MLE_ITEM, CD_TIPO_CALCULO_ITEM, CD_NCM_SH, PL_MERCADORIA)');
      SQL.Add('               VALUES (:NR_PROCESSO, :NR_ADICAO, :NR_ITEM, :QT_MERC_UN_COMERC, :CD_UN_MED_COMERC,:CD_FABR_EXPO,');
      SQL.Add('                                :VL_UNID_COND_VENDA, :VL_UNITARIO, :VL_MLE_ITEM, :CD_TIPO_CALCULO_ITEM, :CD_NCM_SH, :PL_MERCADORIA)');
      ParamByName('NR_PROCESSO').AsString          := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString            := Copy(reg,18,3);
      vUltimoItem := UltimoItem(medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text,Copy(reg,18,3));
      ParamByName('NR_ITEM').AsString              := vUltimoItem; // pegar ultimo item dessa adição
      ParamByName('QT_MERC_UN_COMERC').AsFloat     := StrToValor(Copy(reg,21,9),Copy(reg,30,5));
      ParamByName('CD_UN_MED_COMERC').AsString     := ConsultaLookUp('TUNID_MEDIDA_BROKER','NM_UNID_MEDIDA', StringReplace(Copy(reg,35,20),'Ç','C',[rfReplaceAll]),'CD_UNID_MEDIDA');
      ParamByName('VL_UNID_COND_VENDA').AsFloat    := StrToValor(Copy(reg,55,13),Copy(reg,68,7));
      ParamByName('VL_UNITARIO').AsFloat           := StrToValor(Copy(reg,55,13),Copy(reg,68,7));//StrToValor(Copy(reg,75,11),Copy(reg,86,2));
      ParamByName('VL_MLE_ITEM').AsFloat           := StrToValor(Copy(reg,55,13),Copy(reg,68,7)) * StrToValor(Copy(reg,21,9),Copy(reg,30,5));//StrToValor(Copy(reg,75,11),Copy(reg,86,2));
      ParamByName('CD_TIPO_CALCULO_ITEM').AsString := '1';
      ParamByName('CD_NCM_SH').AsString            := vNCMAdicao;
      ParamByName('PL_MERCADORIA').AsFloat         := vPL_MERCADORIAAdicao;
      ParamByName('CD_FABR_EXPO').AsString         := vCD_AUSENCIA_FABRICAdicao;
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador19;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TDETALHE_MERCADORIA SET TX_DESC_DET_MERC = :TX_DESC_DET_MERC, CD_MERCADORIA = :CD_MERCADORIA');
      SQL.Add(' WHERE NR_PROCESSO = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + '''');
      SQL.Add('   AND NR_ADICAO   = ''' + Copy(reg,18,3) + '''');
      SQL.Add('   AND NR_ITEM     = ''' + vUltimoItem + '''');
      ParamByName('TX_DESC_DET_MERC').AsMemo := Copy(reg,21,Length(reg)-19);
      ParamByName('CD_MERCADORIA').AsString  := Copy(Trim(Copy(Copy(reg,21,Length(reg)-19),Pos('P/N:',Copy(reg,21,Length(reg)-19))+5,Length(Copy(reg,21,Length(reg)-19)))),1,Length(Trim(Copy(Copy(reg,21,Length(reg)-19),Pos('P/N:',Copy(reg,21,Length(reg)-19))+5,Length(Copy(reg,21,Length(reg)-19)))))-1);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador17;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TDEDUCAO_VALORACAO(NR_PROCESSO, NR_ADICAO, CD_MET_DEDUC_VALOR, VL_DEDUCAO_MNEG,');
      SQL.Add('                               CD_MD_NEGOC_DEDUC, VL_DEDUCAO_MN )');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ADICAO, :CD_MET_DEDUC_VALOR, :VL_DEDUCAO_MNEG,');
      SQL.Add('                               :CD_MD_NEGOC_DEDUC, :VL_DEDUCAO_MN )');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString           := Copy(reg,18,3);
      ParamByName('CD_MET_DEDUC_VALOR').AsString  := Copy(reg,21,2);
      ParamByName('VL_DEDUCAO_MNEG').AsFloat      := StrToValor(Copy(reg,23,13),Copy(reg,36,2));
      ParamByName('CD_MD_NEGOC_DEDUC').AsString   := Copy(reg,38,3);
      ParamByName('VL_DEDUCAO_MN').AsFloat        := StrToValor(Copy(reg,41,13),Copy(reg,54,2));
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador18;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TACRESCIMO_VALORACAO(NR_PROCESSO, NR_ADICAO, CD_MET_ACRES_VALOR, VL_ACRESCIMO_MOEDA,');
      SQL.Add('                               CD_MD_NEGOC_ACRES, VL_ACRESCIMO_MN )');
      SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ADICAO, :CD_MET_ACRES_VALOR, :VL_ACRESCIMO_MOEDA,');
      SQL.Add('                               :CD_MD_NEGOC_ACRES, :VL_ACRESCIMO_MN )');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString           := Copy(reg,18,3);
      ParamByName('CD_MET_ACRES_VALOR').AsString  := Copy(reg,21,2);
      ParamByName('VL_ACRESCIMO_MOEDA').AsFloat   := StrToValor(Copy(reg,23,13),Copy(reg,36,2));
      ParamByName('CD_MD_NEGOC_ACRES').AsString   := Copy(reg,38,3);
      ParamByName('VL_ACRESCIMO_MN').AsFloat      := StrToValor(Copy(reg,41,13),Copy(reg,54,2));
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador20;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TDESTAQUE_NCM(NR_PROCESSO, NR_ADICAO, NR_SEQUENCIA, NR_DESTAQUE_NCM)');
      SQL.Add('               VALUES (:NR_PROCESSO, :NR_ADICAO, :NR_SEQUENCIA, :NR_DESTAQUE_NCM)');
      ParamByName('NR_PROCESSO').AsString       := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString         := Copy(reg,18,3);
      ParamByName('NR_SEQUENCIA').AsString      := '1';
      ParamByName('NR_DESTAQUE_NCM').AsString   := Copy(reg,21,3);
      ExecSQL;
      SQL.Clear;
      SQL.Add('UPDATE TDETALHE_MERCADORIA SET NR_DESTAQUE_NCM = ''' + Copy(reg,21,3) + ''' WHERE NR_PROCESSO = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + ''' AND NR_ADICAO = ''' + Copy(reg,18,3) + '''');
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador21;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TDOCUMENTO_VINCULADO(NR_PROCESSO, NR_ADICAO, CD_TIPO_DCTO_VINC, NR_DCTO_VINCULADO)');
      SQL.Add('               VALUES (:NR_PROCESSO, :NR_ADICAO, :CD_TIPO_DCTO_VINC, :NR_DCTO_VINCULADO)');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString           := Copy(reg,18,3);
      ParamByName('CD_TIPO_DCTO_VINC').AsString   := Copy(reg,21,1);
      ParamByName('NR_DCTO_VINCULADO').AsString   := Copy(reg,22,15);
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_BSH_Integracao_DI.Identificador22;
begin
(*  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TDI_NVE(NR_PROCESSO, NR_ADICAO, CD_TIPO_DCTO_VINC, NR_DCTO_VINCULADO)');
      SQL.Add('               VALUES (:NR_PROCESSO, :NR_ADICAO, :CD_TIPO_DCTO_VINC, :NR_DCTO_VINCULADO)');
      ParamByName('NR_PROCESSO').AsString         := medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text;
      ParamByName('NR_ADICAO').AsString           := Copy(reg,18,3);
      ParamByName('CD_TIPO_DCTO_VINC').AsString   := Copy(reg,21,1);
      ParamByName('NR_DCTO_VINCULADO').AsString   := Copy(reg,22,15);
      ExecSQL;
    finally
      Free;
    end;
  end;*)
end;

function Tfrm_BSH_Integracao_DI.SouN(pLetra : String) : string;
begin
  if pLetra = 'S' then
    Result := '1'
  else Result := '0';
end;

function Tfrm_BSH_Integracao_DI.AAAAMMDDtoDate(pAAAAMMDD : string) : TDateTime;
begin
  if pAAAAMMDD <> '00000000' then
    Result := StrToDate(Copy(pAAAAMMDD,7,2)+'/'+Copy(pAAAAMMDD,5,2)+'/'+Copy(pAAAAMMDD,1,4))
  else Result := 0;
end;

function Tfrm_BSH_Integracao_DI.AAAAMMDDtoDDMMAAAA(pAAAAMMDD : string) : String;
begin
  if pAAAAMMDD <> '00000000' then
    Result := Copy(pAAAAMMDD,7,2)+Copy(pAAAAMMDD,5,2)+Copy(pAAAAMMDD,1,4)
  else Result := '';
end;

function Tfrm_BSH_Integracao_DI.StrToValor(pAntesCD, pDepoisCD : string) : Real;
begin
  Result := StrToFloat(pAntesCD+','+pDepoisCD);
  if Result = null then
    Result := 0;
end;

procedure Tfrm_BSH_Integracao_DI.btn_importar_remessaClick(Sender: TObject);
var vCd_moeda_mle : integer;
begin
  try
    AssignFile( f, edt_nm_file_remessa.text );
    {$i-}
    Reset( f );
    {$i+}
    if ioResult <> 0 then
    begin
      BoxMensagem( 'Não foi possível abrir o arquivo especificado.', 2 );
      Exit;
    end else
    begin
      vMemoInfoCompl          := TMemo.Create(Application);
      vMemoInfoCompl.Parent   := frm_BSH_Integracao_DI;
      vMemoInfoCompl.WordWrap := False;
      vMemoInfoCompl.Visible  := False;
      while Not EOF( f ) do
      begin
        ReadLn( f, reg );
        case StrToInt(Copy( reg, 1,2 )) of
          01 : Identificador01;
          03 : Identificador03;
          04 : Identificador04;
          05 : Identificador05;
          07 : Identificador07;
          08 : vMemoInfoCompl.Lines.Add('| ' + Copy(reg,17,Length(reg)-16));
          10 : Identificador10;
          11 : Identificador11;
          12 : Identificador12;
          13 : Identificador13;
          14 : Identificador14;
          15 : Identificador15;
          16 : Identificador16;
          17 : Identificador17;
          18 : Identificador18;
          19 : Identificador19;
          20 : Identificador20;
          21 : Identificador21;
          22 : Identificador22;
        end;
      end;
      Identificador08;
      CloseFile(f);
       //verifica nas adições se as moedas são as mesma
      with TQuery.Create(Application) do
      begin
       DatabaseName := 'DBBROKER';
       SQL.Clear;
       vCd_moeda_mle := SQL.Add('SELECT DISTINCT COUNT(CD_MOEDA_NEGOCIADA) FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + '''');
       ExecSQL;
       if vCd_moeda_mle <= 1 then
       begin
         SQL.Add('UPDATE TDECLARACAO_IMPORTACAO SET CD_MOEDA_MLE = (select CD_MOEDA_NEGOCIADA from tadicao_de_importacao WHERE NR_PROCESSO = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + ''')');
         SQL.Add(', QT_ADICOES = (select max(NR_ADICAO) from tadicao_de_importacao where nr_processo = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + ''' )');
         if edt_bl.Text <> '' then
         begin
           SQL.Add(', NR_DCTO_CARGA = ''' + edt_bl.Text + ''' ');
           SQL.Add(', CD_VIA_TRANSP_CARG = ''01'' ');
           SQL.Add(', NR_DCTO_CARGA_MAST = ''' + edt_bl_master.Text + ''' ');
         end;
         SQL.Add('where nr_processo = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + '''');
         ExecSQL;
       end;
        SQL.Add('update tadicao_de_importacao SET QT_ITENS_ADICAO = (select max(nr_item) from tdetalhe_mercadoria where nr_processo = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + ''' )');
        SQL.Add('where nr_processo = ''' + medt_cd_unid_neg.Text + '01' + medt_nr_processo.Text + '''');
        ExecSQL;
        Free;
      end;
      ShowMessage('Integração " BSH x myIndaiá " concluída.');
    end;
  except
    on e:Exception do
      ShowMessage('Ocorreu o seguinte erro ao tentar fazer a integração :' + #10#13 + e.message + #10#13 + 'Informe ao suporte');
  end;
end;

procedure Tfrm_BSH_Integracao_DI.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_BSH_Integracao_DI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function Tfrm_BSH_Integracao_DI.UltimoItem(pProcesso, pAdicao : String): string;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_ITEM),0)+1 FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_ADICAO = ''' + pAdicao + '''');
    Open;
    Result := Copy('000',1,3-Length(Fields[0].AsString))+Fields[0].AsString;
    Close;
    Free;
  end;
end;

end.

