unit FrmProcessoExportacaoItensCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DMLeiaute;

type
  TFormProcessoExportacaoItensCtx = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    Label1: TLabel;
    msk_nr_processoDestino: TMaskEdit;
    btn_nr_processoDestino: TSpeedButton;
    lbxProcessoDestino: TListBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_nr_processoDestinoClick(Sender: TObject);
    procedure msk_nr_processoDestinoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_processoDestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function ConsultaProcesso: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProcessoExportacaoItensCtx: TFormProcessoExportacaoItensCtx;

implementation

uses
  uConsulta, ConsOnLineEx, KrQuery, PGGP001, Funcoes, dgLeiauteLista;

{$R *.dfm}

procedure TFormProcessoExportacaoItensCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function GetSQL: string;
begin
  Result := '  SELECT  PE.NR_PROCESSO, '+
            '  PE.CD_MERCADORIA, '+
            '  ME.NM_MERCADORIA, '+
            '  PE.CD_NCM, '+
            '  PE.TX_MERCADORIA, '+
            '  PE.QT_MERCADORIA, '+
            '  UM.NM_UNID_MEDIDA, '+
            '  PE.VL_TOT_PESO_LIQ, '+
            '  PE.VL_TOT_PESO_BRUTO, '+
            '  PE.VL_TOT_ITEM '+
            ' ,CAST(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) WHERE RC.NR_PROCESSO = PE.NR_PROCESSO AND RC.TP_REFERENCIA = ''02'' FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(MAX) ) AS ORDEM     '+
            ' ,CAST(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(PC.NR_CNTR)) FROM BROKER.DBO.TPROCESSO_CNTR PC WITH (NOLOCK) WHERE PC.NR_PROCESSO = PE.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(MAX)) AS CONTAINER                                   '+
            ' ,CAST(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) WHERE RC.NR_PROCESSO = PE.NR_PROCESSO AND RC.TP_REFERENCIA = ''08'' FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(MAX) ) AS EMBARQUE    '+
            ' ,CAST(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) WHERE RC.NR_PROCESSO = PE.NR_PROCESSO AND RC.TP_REFERENCIA = ''01'' FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(MAX) ) AS PEDIDO     '+
            ' ,ME.AP_MERCADORIA AS MERCADORIA_APELIDO     '+
            ' ,RL.CD_LOTE AS LOTE                          '+
            ' ,RL.QT_MERCADORIA AS QTDE_LOTE                '+
            ' ,CONVERT(VARCHAR(10),RL.DT_FABRICACAO,103) AS DATA_FAB    '+
            ' ,CONVERT(VARCHAR(10),RL.DT_VENCIMENTO,103) AS DATA_VAL    '+
            ' ,EE.NM_EMPRESA AS IMPORTADOR         '+
            ' ,EEC.NM_EMPRESA AS CONSIGNATARIO      '+
            '  FROM BROKER.dbo.TPROCESSO_EXP_ITEM       PE (NOLOCK)'+
            '  LEFT JOIN BROKER.DBO.TUNID_MEDIDA_BROKER UM (NOLOCK)ON UM.CD_UNID_MEDIDA=PE.CD_UNID_MEDIDA '+
            '  LEFT JOIN BROKER.DBO.TPROCESSO_EXP PEX (NOLOCK) ON PEX.NR_PROCESSO = PE.NR_PROCESSO       '+
            '  LEFT JOIN BROKER.DBO.TRAP_FORNECIMENTO_LOTE RL (NOLOCK) ON RL.CD_FORNECIMENTO = PE.NR_PEDIDO_IMP    '+
            '  LEFT JOIN BROKER.DBO.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = PEX.CD_IMPORTADOR     '+
            '  LEFT JOIN BROKER.DBO.TEMPRESA_EST EEC (NOLOCK) ON EEC.CD_EMPRESA = PEX.CD_CONSIGNATARIO   '+
            '  LEFT JOIN BROKER.DBO.TMERCADORIA_EXP     ME (NOLOCK)ON ME.CD_MERCADORIA = PE.CD_MERCADORIA ';
end;

procedure TFormProcessoExportacaoItensCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Where: string;
  List: TStrings;
  I: Integer;
begin
  Form := TfmConsulta.Create(nil);
  List := TStringList.Create;
  try
    Form.TituloRelatorio := 'Processo de Exportação(Itens)';
    Form.Titulocoluna.Add('NR_PROCESSO=Processo');
    Form.Titulocoluna.Add('CD_MERCADORIA=Código Mercadoria');
    Form.Titulocoluna.Add('NM_MERCADORIA=Descrição Cadastro de Mercadoria');
    Form.Titulocoluna.Add('CD_NCM=NCM');
    Form.Titulocoluna.Add('TX_MERCADORIA=Descrição Comercial da Mercadoria');
    Form.Titulocoluna.Add('QT_MERCADORIA=Quantidade');
    Form.Titulocoluna.Add('NM_UNID_MEDIDA=Unid. Medida');
    Form.Titulocoluna.Add('VL_TOT_PESO_LIQ=Peso Líquido');
    Form.Titulocoluna.Add('VL_TOT_PESO_BRUTO=Peso Bruto');
    Form.Titulocoluna.Add('VL_TOT_ITEM=Valor Total do Item');
    Form.Titulocoluna.Add('ORDEM=Ordem');
    Form.Titulocoluna.Add('CONTAINER=Container');
    Form.Titulocoluna.Add('EMBARQUE=Embarque');
    Form.Titulocoluna.Add('PEDIDO=Pedido');
    Form.Titulocoluna.Add('MERCADORIA_APELIDO=Mercadoria (Apelido)');
    Form.Titulocoluna.Add('LOTE=Lote');
    Form.Titulocoluna.Add('QTDE_LOTE=Qtde Lote');
    Form.Titulocoluna.Add('DATA_FAB= Data Fabricação');
    Form.Titulocoluna.Add('DATA_VAL=Data Vencimento');
    Form.Titulocoluna.Add('IMPORTADOR=Importador');
    Form.Titulocoluna.Add('CONSIGNATARIO=Consignatário');

    Form.FormatacaoEspecial.Add('QT_MERCADORIA=,0.000');
    Form.FormatacaoEspecial.Add('VL_TOT_PESO_LIQ=,0.000');
    Form.FormatacaoEspecial.Add('VL_TOT_PESO_BRUTO=,0.00');
    Form.FormatacaoEspecial.Add('VL_TOT_ITEM=,0.00');
    for I := 0 to lbxProcessoDestino.Items.Count -1 do
      List.Add(QuotedStr(lbxProcessoDestino.Items[I]));
    Where := ' where PE.NR_PROCESSO  in (' + List.CommaText + ')';
    Form.qryMain.SQL.Text := GetSQL + Where;;


    Form.ClasseRel := claExpoItens;
    Form.cxGridDBTableView.PopupMenu := Form.PopupMenu1;


    Form.Executa;
  finally
    Form.Free;
    List.Free;
  end;
end;

procedure TFormProcessoExportacaoItensCtx.btn_co_unid_negClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
    msk_cd_unid_negExit(nil);
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TFormProcessoExportacaoItensCtx.msk_cd_unid_negExit(
  Sender: TObject);
begin
  btn_co_unid_negClick(Sender);
end;

procedure TFormProcessoExportacaoItensCtx.btn_co_produtoClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormProcessoExportacaoItensCtx.msk_cd_produtoExit(
  Sender: TObject);
begin
  btn_co_produtoClick(Sender);
end;

function TFormProcessoExportacaoItensCtx.ConsultaProcesso: string;
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  try
    vListAux.Add('SELECT SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, DT_ABERTURA, ' );
    vListAux.Add('  CD_CLIENTE,    (SELECT AP_EMPRESA    FROM TEMPRESA_NAC ( NOLOCK ) WHERE CD_EMPRESA    = PR.CD_CLIENTE)    AS NM_CLIENTE,    ' );
    vListAux.Add('  CD_SERVICO,    (SELECT NM_SERVICO    FROM TSERVICO     ( NOLOCK ) WHERE CD_SERVICO    = PR.CD_SERVICO)    AS NM_SERVICO,    ' );
    vListAux.Add('  CD_EMBARCACAO, (SELECT NM_EMBARCACAO FROM TEMBARCACAO  ( NOLOCK ) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, ' );
    vListAux.Add('  NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER, NR_DI, NR_MANIFESTO    ' );
    vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ' );
    vListAux.Add('WHERE CD_UNID_NEG  = ' + QuotedStr(msk_cd_unid_neg.Text) );
    vListAux.Add('  AND CD_PRODUTO   = ' + QuotedStr(msk_cd_produto.Text)  );
    vListAux.Add('  AND IN_CANCELADO = ''0''' );

    Result := ConsultaOnLineExSQLList(vListAux,'Processos',
        ['NR_PROCESSO' ,'DT_ABERTURA'     ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_SERVICO'  ,'NM_SERVICO','CD_EMBARCACAO'  ,'NM_EMBARCACAO','NR_CONHECIMENTO' ,'NR_CONHECIMENTO_MASTER' ,'NR_DI','NR_MANIFESTO' ],
        ['Nr. Processo','Data de Abertura','Cód. Cliente','Cliente'   ,'Cód. Serviço','Serviço'   ,'Cod. Embarcação','Embarcação'   ,'Nr. Conhecimento','Nr. Conhecimento Master','DI'   ,'Nr. Manifesto'],
         'NR_PROCESSO',nil);
  finally
    vListAux.Free;
  end;
end;

procedure TFormProcessoExportacaoItensCtx.btn_nr_processoDestinoClick(
  Sender: TObject);
begin
  msk_nr_processoDestino.Text := ConsultaProcesso;
  msk_nr_processoDestinoExit(nil);
end;

procedure TFormProcessoExportacaoItensCtx.msk_nr_processoDestinoExit(
  Sender: TObject);
var
  Processo: string;
begin
  if Length(msk_nr_processoDestino.Text) >= 12 then
  begin
    Processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processoDestino.Text );
    if lbxProcessoDestino.Items.IndexOf(Processo) >= 0 then
    begin
      ShowMessage('Processo já se encontra na lista.');
      Exit;
    end;
    lbxProcessoDestino.Items.Add(Processo);
    msk_nr_processoDestino.Clear;
    msk_nr_processoDestino.SetFocus;
  end;
end;

procedure TFormProcessoExportacaoItensCtx.FormCreate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  btn_co_unid_negClick(Sender);
  btn_co_produtoClick(Sender);
end;

procedure TFormProcessoExportacaoItensCtx.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFormProcessoExportacaoItensCtx.msk_nr_processoDestinoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    msk_nr_processoDestinoExit(nil);
end;

end.
