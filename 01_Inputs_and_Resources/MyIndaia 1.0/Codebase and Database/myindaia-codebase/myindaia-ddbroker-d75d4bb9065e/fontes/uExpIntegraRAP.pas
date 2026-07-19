unit uExpIntegraRAP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls, ExtCtrls, Mask,
  StrUtils, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExpIntegraRAP = class(TForm)
    pnl1: TPanel;
    lblTit: TLabel;
    pnl2: TPanel;
    Panel1: TPanel;   
    btnEstornar: TSpeedButton;
    qryAutorizados: TQuery;
    dsAutorizados: TDataSource;
    Panel2: TPanel;
    qryAutorizadoscalcRapsEnvolvidas: TStringField;
    qryAutorizadosEMBARQUE: TStringField;
    qryAutorizadosDT_INSERCAO: TDateTimeField;
    edtProcesso: TEdit;
    Label1: TLabel;
    Label43: TLabel;
    Label84: TLabel;
    edtNmUnidade: TEdit;
    edtNmProduto: TEdit;
    edtCdUnidade: TEdit;
    mskCdProduto: TMaskEdit;
    btn_sair: TSpeedButton;
    qryAutorizadosCD_EMBARQUE: TStringField;
    qryAutorizadosCD_EMBARQUE_ANO: TStringField;
    btnEstornarDoc: TSpeedButton;
    btnIntegrarDoc: TSpeedButton;
    qryAutorizadosDoc: TQuery;
    dsAutorizadosDoc: TDataSource;
    qryAutorizadosDocEMBARQUE: TStringField;
    qryAutorizadosDocDT_INSERCAO: TDateTimeField;
    qryAutorizadosDocNR_AUT_DOCTO: TStringField;
    qryAutorizadosDocNR_AUT_DOCTO_ANO: TStringField;
    qryAutorizadosDoccalcRapsEnvolvidas: TStringField;
    Button1: TButton;
    qry_acordos_normas: TQuery;
    qry_acordos_normasCD_PAIS: TStringField;
    qry_acordos_normasCD_ACORDO: TStringField;
    qry_acordos_normasCD_NORMA: TStringField;
    qry_acordos_normasCD_IDIOMA: TStringField;
    ds_acordos_normas: TDataSource;
    qry_acordos_normasPais: TStringField;
    qry_acordos_normasIdioma: TStringField;
    qry_acordos_normasNorma: TStringField;
    qryAutorizadosCD_GRUPO: TStringField;
    qryAutorizadosDocCD_GRUPO: TStringField;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridDBTableViewcalcRapsEnvolvidas: TcxGridDBColumn;
    cxGridDBTableViewEMBARQUE: TcxGridDBColumn;
    cxGridDBTableViewDT_INSERCAO: TcxGridDBColumn;
    cxGridDBTableViewCD_EMBARQUE: TcxGridDBColumn;
    cxGridDBTableViewCD_EMBARQUE_ANO: TcxGridDBColumn;
    cxGridDBTableViewCD_GRUPO: TcxGridDBColumn;
    qryGeral: TQuery;
    cxGridDBTableViewFORNECIMENTOS: TcxGridDBColumn;
    qryAutorizadosFORNECIMENTOS: TStringField;
    qryTemp: TQuery;
    btnIntegrar: TSpeedButton;
    procedure qryAutorizadosCalcFields(DataSet: TDataSet);
    procedure btnIntegrarClick(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure edtCdUnidadeChange(Sender: TObject);
    procedure mskCdProdutoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIntegrarDocClick(Sender: TObject);
    procedure qryAutorizadosDocCalcFields(DataSet: TDataSet);
    procedure btnEstornarDocClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  procedure ProcessamentoNestle(NrProcesso : String);
  procedure PreencheNumeroRuc(NrProcesso, CdGrupo : String);
    function ValidaCNPJ(cdEmbarque, cdEmbarqueAno, cdGrupo, nrProcesso: String): Boolean;
  public
    { Public declarations }
    flag_existe_drawback:Boolean;
    flag_existe_anuencia_exercito:Boolean;
  end;

var
  frmExpIntegraRAP: TfrmExpIntegraRAP;

implementation

{$R *.dfm}

uses Funcoes, ConsOnLineEx, PGGP001, PGGP017, uExpIntegraRAP_Normas,
  PGPE021, DateUtils, PGPE017, PGGP019;

procedure TfrmExpIntegraRAP.qryAutorizadosCalcFields(DataSet: TDataSet);
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_RAP+''/''+CD_RAP_ANO');
    SQL.Add('  FROM MYINDAIA.DBO.TRAP_EMBARQUE (nolock)');
    SQL.Add(' WHERE CD_EMBARQUE = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''');
    SQL.Add('   AND CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString  + '''');
    SQL.Add('   AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''');
    Open;
    while not EOF do
    begin
      qryAutorizados.FieldByName('calcRapsEnvolvidas').AsString := qryAutorizados.FieldByName('calcRapsEnvolvidas').AsString + ', ' + Fields[0].AsString;
      Next;
    end;
    qryAutorizados.FieldByName('calcRapsEnvolvidas').AsString := Copy(qryAutorizados.FieldByName('calcRapsEnvolvidas').AsString,3,Length(qryAutorizados.FieldByName('calcRapsEnvolvidas').AsString));
    Close;
    Free;
  end;
end;

procedure TfrmExpIntegraRAP.btnIntegrarClick(Sender: TObject);
var
  v486, v369,  v113 : TDateTime;
  vNrProcesso : String[18];
  vAuxMercadoria, vCodUserFimRap, str_cd_rap, str_cd_rap_ano, str_mostra_followup, str_cd_contato : string;
  vPesoLiquido, vPesoBruto, vFrete, vSeguro, vAcrescimo, vDesconto, vCubagem, vComissao, vFob, vQtdeProduto : Real;
  vQtReg: integer;
  vQryAux: TQuery;
  vInHoraEventos: Boolean;
  aSQL:String;

  function InsereMercadorias(pMercadorias : String) : Boolean;
  var
    vMercAux, vMercOldAux, vRAP, vTextoPort, vTextoIng, vTextoEsp, vTextoCJ,
    vCD_MERCADORIA, vTX_DESC, vTX_DESC_ING, vTX_DESC_ESP, vImportado : string;
    i : Integer;
  begin
    Result := True;
    for i:= 0 to ContaOcorrencias(pMercadorias,',')-1 do
    begin
      vMercAux := Trim(ExtractWord(i+1,pMercadorias,','));
      // se tem na DePara
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';

        SQL.Clear;
        SQL.Text := 'SELECT TOP 1 RE.CD_RAP+RE.CD_RAP_ANO+RE.CD_GRUPO RAP                                                           ' + sLineBreak +
                    '  FROM MYINDAIA.DBO.TRAP_EMBARQUE     RE (NOLOCK),                                                                          ' + sLineBreak +
                    '       MYINDAIA.DBO.TRAP_FORNECIMENTO RF (NOLOCK)                                                                           ' + sLineBreak +
                    ' WHERE RE.CD_EMBARQUE+RE.CD_EMBARQUE_ANO   = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString
                                                                      + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''' + sLineBreak +
                    '   AND RE.CD_GRUPO                         = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString    + '''    ' + sLineBreak +
                    '   AND RF.CD_MERCADORIA                    = ''' + vMercAux + '''                                              ' + sLineBreak +
                    '   AND RF.CD_RAP+RF.CD_RAP_ANO+RF.CD_GRUPO = RE.CD_RAP+RE.CD_RAP_ANO+RE.CD_GRUPO                               ' + sLineBreak ;
        Open;
        vRAP := Fields[0].AsString;
        Close;
        Free;
      end;

      vMercOldAux := ConsultaLookupsql(' SELECT TOP 1 MATERIALOLD               ' + sLineBreak +
                                       '   FROM XLS_SGA_MERC_EXP (NOLOCK)       ' + sLineBreak +
                                       '  WHERE MATERIAL = ''' + vMercAux + ''' ' + sLineBreak +
                                       '    AND IN_ANTIGO_CADASTRADO = ''1''    ',
                                       'MATERIALOLD');

      // somente para grupo SGA
      if (vMercOldAux <> '') and (qryAutorizadosCD_GRUPO.AsString = '028') then
      begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          // busca descrições integradas na RAP
          SQL.Clear;
          sql.text := ' SELECT TOP 1 REPLACE(TX_DESC,"''",""),                    ' + sLineBreak +
                      '        REPLACE(TX_DESC_ING,"''",""),                      ' + sLineBreak +
                      '        REPLACE(TX_DESC_ESP,"''",""),                      ' + sLineBreak +
                      '        REPLACE(TX_DESC_CJ,"''","")                        ' + sLineBreak +
                      '   FROM MYINDAIA.DBO.TRAP_FORNECIMENTO (NOLOCK)            ' + sLineBreak +
                      '  WHERE CD_MERCADORIA              = ''' + vMercAux + '''  ' + sLineBreak +
                      '    AND CD_RAP+CD_RAP_ANO+CD_GRUPO = ''' + vRAP + '''      ' + sLineBreak ;
          Open;

          vTextoPort := Fields[0].AsString;
          vTextoIng  := Fields[1].AsString;
          vTextoEsp  := Fields[2].AsString;
          vTextoCJ   := Fields[3].AsString;
          // SG e IMP = 1 - Michel - 06/06/2012
          vImportado := IfThen(SameText(RightStr(Trim(vTextoPort), 3), 'IMP'), '1', '0');
          if ( trim(vTextoPort) = '' ) or ( trim(vTextoIng) = '' ) or ( trim(vTextoEsp) = '' ) then
          begin
            Result := False;
            vAuxMercadoria := StringReplace(vAuxMercadoria,vMercAux+',','',[rfReplaceAll]);
            exit;
          end;
          Close;

          // replica com o novo codigo e as descrições da RAP
          {by carlos, criado o CD_SULF_NCM como '00' provisoriamente até que a integração passe a trazer este campo tbem - 23/07/2010}
          SQL.Clear;
          SQL.Text := ' INSERT INTO TMERCADORIA_EXP ( CD_MERCADORIA,                          ' + sLineBreak +
                      '                               NM_MERCADORIA,                          ' + sLineBreak +
                      '                               AP_MERCADORIA,                          ' + sLineBreak +
                      '                               VL_UNITARIO,                            ' + sLineBreak +
                      '                               CD_UN_MED_COMERC,                       ' + sLineBreak +
                      '                               CD_NCM_SH,                              ' + sLineBreak +
                      '                               CD_SULF_NCM,                            ' + sLineBreak +
                      '                               CD_NALADI_SH,                           ' + sLineBreak +
                      '                               CD_NALADI_NCCA,                         ' + sLineBreak +
                      '                               PL_MERCADORIA,                          ' + sLineBreak +
                      '                               CD_EXPORTADOR,                          ' + sLineBreak +
                      '                               CD_PAIS_AQUISICAO,                      ' + sLineBreak +
                      '                               CD_PAIS_ORIGEM,                         ' + sLineBreak +
                      '                               CD_FABRICANTE,                          ' + sLineBreak +
                      '                               CD_IMPORTADOR,                          ' + sLineBreak +
                      '                               CD_GRUPO,                               ' + sLineBreak +
                      '                               CD_FABR_EXPO,                           ' + sLineBreak +
                      '                               CD_TIPO_CALCULO,                        ' + sLineBreak +
                      '                               CD_MATERIAL,                            ' + sLineBreak +
                      '                               IN_NECESSITA_LI,                        ' + sLineBreak +
                      '                               CD_FAMILIA_PROD,                        ' + sLineBreak +
                      '                               CD_MOEDA,                               ' + sLineBreak +
                      '                               CD_EMBALAGEM,                           ' + sLineBreak +
                      '                               QT_POR_EMBALAGEM,                       ' + sLineBreak +
                      '                               CD_CATEGORIA_TEXTIL,                    ' + sLineBreak +
                      '                               CD_FINALIDADE_MERC,                     ' + sLineBreak +
                      '                               CD_UF_PRODUTOR,                         ' + sLineBreak +
                      '                               TX_DESC_INGLES,                         ' + sLineBreak +
                      '                               TX_DESC_ESP,                            ' + sLineBreak +
                      '                               PB_MERCADORIA,                          ' + sLineBreak +
                      '                               NR_LINHA,                               ' + sLineBreak +
                      '                               CD_COR,                                 ' + sLineBreak +
                      '                               CD_AREA,                                ' + sLineBreak +
                      '                               IN_DRAWBACK_INDAIA,                     ' + sLineBreak +
                      '                               CD_USUARIO_CRIACAO,                     ' + sLineBreak +
                      '                               DT_CRIACAO,                             ' + sLineBreak +
                      '                               CD_USUARIO_ULT_ALTERACAO,               ' + sLineBreak +
                      '                               DT_ULT_ALTERACAO,                       ' + sLineBreak +
                      '                               IN_ATIVO,                               ' + sLineBreak +
                      '                               IN_IMPORTADO)                           ' + sLineBreak +
                      '                       SELECT ''' + vMercAux + '''                     ' + sLineBreak +
                      '                            , ''' + vTextoPort + '''                   ' + sLineBreak +
                      '                            , ''' + Copy(vTextoPort,1,25) + '''        ' + sLineBreak +
                      '                            , VL_UNITARIO                              ' + sLineBreak +
                      '                            , CD_UN_MED_COMERC                         ' + sLineBreak +
                      '                            , CD_NCM_SH                                ' + sLineBreak +
                      '                            , "00"                                     ' + sLineBreak +
                      '                            , CD_NALADI_SH                             ' + sLineBreak +
                      '                            , CD_NALADI_NCCA                           ' + sLineBreak +
                      '                            , PL_MERCADORIA                            ' + sLineBreak +
                      '                            , CD_EXPORTADOR                            ' + sLineBreak +
                      '                            , CD_PAIS_AQUISICAO                        ' + sLineBreak +
                      '                            , CD_PAIS_ORIGEM                           ' + sLineBreak +
                      '                            , CD_FABRICANTE                            ' + sLineBreak +
                      '                            , CD_IMPORTADOR                            ' + sLineBreak +
                      '                            , ''028''                                  ' + sLineBreak +
                      '                            , CD_FABR_EXPO                             ' + sLineBreak +
                      '                            , CD_TIPO_CALCULO                          ' + sLineBreak +
                      '                            , CD_MATERIAL                              ' + sLineBreak +
                      '                            , IN_NECESSITA_LI                          ' + sLineBreak +
                      '                            , CD_FAMILIA_PROD                          ' + sLineBreak +
                      '                            , CD_MOEDA                                 ' + sLineBreak +
                      '                            , CD_EMBALAGEM                             ' + sLineBreak +
                      '                            , QT_POR_EMBALAGEM                         ' + sLineBreak +
                      '                            , CD_CATEGORIA_TEXTIL                      ' + sLineBreak +
                      '                            , CD_FINALIDADE_MERC                       ' + sLineBreak +
                      '                            , CD_UF_PRODUTOR                           ' + sLineBreak +
                      '                            ,''' + vTextoIng + '''                     ' + sLineBreak +
                      '                            ,''' + vTextoEsp + '''                     ' + sLineBreak +
                      '                            , PB_MERCADORIA                            ' + sLineBreak +
                      '                            , NR_LINHA                                 ' + sLineBreak +
                      '                            , CD_COR                                   ' + sLineBreak +
                      '                            , CD_AREA                                  ' + sLineBreak +
                      '                            , IN_DRAWBACK_INDAIA                       ' + sLineBreak +
                      '                            , ''0707''                                 ' + sLineBreak +
                      '                            , GETDATE()                                ' + sLineBreak +
                      '                            , null                                     ' + sLineBreak +
                      '                            , null                                     ' + sLineBreak +
                      '                            , ''1''                                    ' + sLineBreak +
                      '                            , ' + QuotedStr(vImportado)                  + sLineBreak +
                      '                         FROM TMERCADORIA_EXP (nolock)                 ' + sLineBreak +
                      '                        WHERE CD_MERCADORIA = ''' + vMercOldAux + '''  ' + sLineBreak ;
          try
            ExecSQL;
          except
          end;
          Free;
        end;
      end
      else
      begin // se não tem
        // cadastra com as descrições e o código novo, vindos da RAP
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Text := ' SELECT DISTINCT CD_MERCADORIA, REPLACE(TX_DESC,"''","") TX_DESC,     ' + sLineBreak +
                      '                 REPLACE(TX_DESC_ING,"''","")            TX_DESC_ING, ' + sLineBreak +
                      '                 REPLACE(TX_DESC_ESP,"''","")            TX_DESC_ESP  ' + sLineBreak +
                      '   FROM MYINDAIA.DBO.TRAP_FORNECIMENTO (nolock)                       ' + sLineBreak +
                      '  WHERE CD_MERCADORIA              = ''' + vMercAux + '''             ' + sLineBreak +
                      '    AND CD_RAP+CD_RAP_ANO+CD_GRUPO = ''' + vRAP + '''                 ' + sLineBreak ;
          Open;

          vCD_MERCADORIA := FieldByName('CD_MERCADORIA').AsString;
          vTX_DESC       := FieldByName('TX_DESC').AsString;
          vTX_DESC_ING   := FieldByName('TX_DESC_ING').AsString;
          vTX_DESC_ESP   := FieldByName('TX_DESC_ESP').AsString;
          // SG e IMP = 1 - Michel - 06/06/2012
          vImportado := IfThen((qryAutorizadosCD_GRUPO.AsString = '028') and SameText(RightStr(Trim(vTextoPort), 3), 'IMP'), '1', '0');

          if ( trim(vTX_DESC) = '' ) or ( trim(vTX_DESC_ING) = '' ) or ( trim(vTX_DESC_ESP) = '' ) then
          begin
            Result := False;
            exit;
          end;

          Close;
          SQL.Clear;
          SQL.Text := ' INSERT INTO TMERCADORIA_EXP ( CD_MERCADORIA,                            ' + sLineBreak +
                      '                               NM_MERCADORIA,                            ' + sLineBreak +
                      '                               AP_MERCADORIA,                            ' + sLineBreak +
                      '                               CD_GRUPO,                                 ' + sLineBreak +
                      '                               TX_DESC_INGLES,                           ' + sLineBreak +
                      '                               TX_DESC_ESP,                              ' + sLineBreak +
                      '                               CD_USUARIO_CRIACAO,                       ' + sLineBreak +
                      '                               DT_CRIACAO,                               ' + sLineBreak +
                      '                               IN_ATIVO,                                 ' + sLineBreak +
                      '                               IN_IMPORTADO)                             ' + sLineBreak +
                      '                     VALUES ( ''' + vCD_MERCADORIA                  + '''' + sLineBreak +
                      '                             ,''' + vTX_DESC                        + '''' + sLineBreak +
                      '                             ,''' + Copy(vTX_DESC,1,25)             + '''' + sLineBreak +
                      '                             ,''' +qryAutorizadosCD_GRUPO.AsString  + '''' + sLineBreak +
                      '                             ,''' + vTX_DESC_ING                    + '''' + sLineBreak +
                      '                             ,''' + vTX_DESC_ESP                    + '''' + sLineBreak +
                      '                             ,''0707''                                   ' + sLineBreak +
                      '                             ,GETDATE()                                  ' + sLineBreak +
                      '                             ,''1''                                      ' + sLineBreak +
                      '                             ,' + QuotedStr(vImportado) + ')             ' + sLineBreak ;

          try
            ExecSQL;
          except
          end;
          Free;
        end;
      end;
    end;
  end;

  function InsereAcordos(pMercadorias : String) : Boolean;
  var
    vMercAux, vPaisAux, vRAP, vTX_DESC_IDIOMA,vTX_DESC, vTX_DESC_ING, vTX_DESC_ESP : string;
    i, qtd_acordos_normas, qtd_mercadorias : Integer;
    
  begin
    qry_acordos_normas.Close;
    //
    Result := True;
    qtd_mercadorias := ContaOcorrencias(pMercadorias,',')-1;
    for i:= 0 to qtd_mercadorias do
    begin
      vMercAux := Trim(ExtractWord(i+1,pMercadorias,','));
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Text := ' SELECT TOP 1 RE.CD_RAP+RE.CD_RAP_ANO+RE.CD_GRUPO RAP                                                           ' + sLineBreak +
                    '   FROM MYINDAIA.DBO.TRAP_EMBARQUE     RE (NOLOCK),                                                                          ' + sLineBreak +
                    '        MYINDAIA.DBO.TRAP_FORNECIMENTO RF (NOLOCK)                                                                           ' + sLineBreak +
                    '  WHERE RE.CD_EMBARQUE+RE.CD_EMBARQUE_ANO  = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString +
                                                                        qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + ''' ' + sLineBreak +
                    '    AND RE.CD_GRUPO                        = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''        ' + sLineBreak +
                    '    AND RF.CD_MERCADORIA                   = ''' + vMercAux + '''                                               ' + sLineBreak +
                    '    AND RF.CD_RAP+RF.CD_RAP_ANO+RF.CD_GRUPO = RE.CD_RAP+RE.CD_RAP_ANO+RE.CD_GRUPO                               ' + sLineBreak ;
        Open;
        vRAP := Fields[0].AsString;
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT CD_PAIS FROM MYINDAIA.DBO.TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO+CD_GRUPO = ''' + vRAP + '''');
        Open;
        vPaisAux := Fields[0].AsString;
        Close;
        Free;
      end;

      // agora cadastra os acordos/normas necessários
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        // busca na TCONFIG_PAIS_ACORDO_NORMA_PADRAO os registros para o pais e
        // insere na TMERC_EXP_ACORDO os acordos necessários com as descrições nos idiomas da tabela acima
        SQL.Clear;
        SQL.Text := ' SELECT REPLACE(TX_DESC,"''","")           TX_DESC,            ' + sLineBreak +
                    '        REPLACE(TX_DESC_ING,"''","")       TX_DESC_ING,        ' + sLineBreak +
                    '        REPLACE(TX_DESC_ESP,"''","")       TX_DESC_ESP,        ' + sLineBreak +
                    '        REPLACE(TX_MARCACAO,"''","")       TX_MARCACAO,        ' + sLineBreak +
                    '        REPLACE(TX_MARCACAO_COMPL,"''","") TX_MARCACAO_COMPL   ' + sLineBreak +
                    '   FROM MYINDAIA.DBO.TRAP_FORNECIMENTO (NOLOCK)                ' + sLineBreak +
                    '  WHERE CD_MERCADORIA              = ''' + vMercAux + '''      ' + sLineBreak +
                    '    AND CD_RAP+CD_RAP_ANO+CD_GRUPO = ''' + vRAP + '''          ' + sLineBreak ;
        Open;

        vTX_DESC           := FieldByName('TX_DESC').AsString     + ' ' + FieldByName('TX_MARCACAO').AsString + ' ' + FieldByName('TX_MARCACAO_COMPL').AsString;
        vTX_DESC_ING       := FieldByName('TX_DESC_ING').AsString + ' ' + FieldByName('TX_MARCACAO').AsString + ' ' + FieldByName('TX_MARCACAO_COMPL').AsString;
        vTX_DESC_ESP       := FieldByName('TX_DESC_ESP').AsString + ' ' + FieldByName('TX_MARCACAO').AsString + ' ' + FieldByName('TX_MARCACAO_COMPL').AsString;
        if ( trim(vTX_DESC) = '' ) or ( trim(vTX_DESC_ING) = '' ) or ( trim(vTX_DESC_ESP) = '' ) then
        begin
          Result := False;
          exit;
        end;

        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO CP (NOLOCK) WHERE CD_PAIS = ''' + vPaisAux + '''');
        Open;
        if Fields[0].AsInteger = 0 then
        begin
          Application.MessageBox(PChar('Não existe o país "'+vPaisAux+'" na tabela de acordos padrões e provavelmente esse país também' + #10#13 +
                                       'não esteja nas tabelas de ligação entre acordos e normas. Informe ao suporte!'),
                                       'Problemas na Integração!', MB_OK + MB_ICONSTOP);
          Result := False;
        end;
        Close;

        if qry_acordos_normas.Active = false then
        begin
           qry_acordos_normas.Close;
           qry_acordos_normas.ParamByName('CD_PAIS').AsString:=vPaisAux;
           qry_acordos_normas.Open;
        end;


        qtd_acordos_normas:=qry_acordos_normas.RecordCount;
        if qtd_acordos_normas > 1 then
        begin
           case StrToInt(qry_acordos_normasCD_IDIOMA.AsString) of
              0:vTX_DESC_IDIOMA:=vTX_DESC;
              1:vTX_DESC_IDIOMA:=vTX_DESC_ING;
              2:vTX_DESC_IDIOMA:=vTX_DESC_ESP;
           else
              vTX_DESC_IDIOMA:='';
           end;

           frmExpIntegraRAP_Normas:=TfrmExpIntegraRAP_Normas.Create(nil);
           frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Close;
           frmExpIntegraRAP_Normas.qry_acordos_normas_geral.ParamByName('CD_MERCADORIA').AsString:=vMercAux;
           frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Open;

           frmExpIntegraRAP_Normas.edt_cd_mercadoria.Text        := vMercAux;
           frmExpIntegraRAP_Normas.lbl_mercadoria.Caption        := '  '+vTX_DESC;
           frmExpIntegraRAP_Normas.lbl_mercadoria_idioma.Caption := '  '+vTX_DESC_IDIOMA;
           frmExpIntegraRAP_Normas.lProcessando.Caption          := inttostr(i+1)+' / '+inttostr(qtd_mercadorias+1);
           frmExpIntegraRAP_Normas.Showmodal;

           FreeAndNil(frmExpIntegraRAP_Normas);
           //
           frmExpIntegraRAP.Refresh;
           sleep(1000);
        end;


        SQL.Clear;
        SQL.Text := '  INSERT INTO TMERC_EXP_ACORDO (CD_MERCADORIA,                                    ' + sLineBreak +
                    '                                CD_ACORDO,                                        ' + sLineBreak +
                    '                                CD_NORMA,                                         ' + sLineBreak +
                    '                                TX_MERCADORIA)                                    ' + sLineBreak +
                    '  SELECT TOP 1 ''' + vMercAux + '''                                               ' + sLineBreak +
                    '       , CD_ACORDO                                                                ' + sLineBreak +
                    '       , CD_NORMA                                                                 ' + sLineBreak +
                    '       , CASE CD_IDIOMA                                                           ' + sLineBreak +
                    '           WHEN ''0'' THEN ''' +AcertaAspas( vTX_DESC ) + '''                     ' + sLineBreak +
                    '           WHEN ''1'' THEN ''' +AcertaAspas( vTX_DESC_ING ) + '''                 ' + sLineBreak +
                    '           WHEN ''2'' THEN ''' +AcertaAspas( vTX_DESC_ESP ) + '''                 ' + sLineBreak +
                    '         END TX_MERCADORIA                                                        ' + sLineBreak +
                    '    FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO CP (NOLOCK)                             ' + sLineBreak +
                    '   WHERE CD_PAIS   = :CD_PAIS                                                     ' + sLineBreak +
                    '     and CD_ACORDO = :CD_ACORDO                                                   ' + sLineBreak +
                    '     and CD_NORMA  = :CD_NORMA                                                    ' + sLineBreak +
                    '     AND CD_ACORDO+CD_NORMA NOT IN ( SELECT CD_ACORDO+CD_NORMA                    ' + sLineBreak +
                    '                                       FROM TMERC_EXP_ACORDO (NOLOCK)             ' + sLineBreak +
                    '                                      WHERE CD_MERCADORIA = ''' + vMercAux + ''' )' + sLineBreak ;
        ParamByName('CD_PAIS').AsString   := vPaisAux;
        ParamByName('CD_ACORDO').AsString := qry_acordos_normasCD_ACORDO.AsString;
        ParamByName('CD_NORMA').AsString  := qry_acordos_normasCD_NORMA.AsString;
        ExecSQL;
        Free;
      end;

    end;
  end;

begin

  vNrProcesso := Trim(edtCdUnidade.Text) + Trim(mskCdProduto.Text) + Trim(edtProcesso.Text);

  if not ValidaCNPJ(qryAutorizados.FieldByName('CD_EMBARQUE').AsString,
                    qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString,
                    qryAutorizados.FieldByName('CD_GRUPO').AsString,
                    vNrProcesso) then
  begin
    ShowMessage('Não é possível continuar, pois o ' + #13#10 + 'Exportador da RAP é diferente do Exportador do Processo de Exportação. ');
    Exit;
  end;

  if qryautorizados.RecordCount=0 then
  begin
     showmessage('Não existe Fatura para Integração!!!');
     exit;
  end;

  flag_existe_drawback           :=  False;
  flag_existe_anuencia_exercito  :=  False;

 // with TQuery.Create(application) do
  with qryGeral do
  begin
    try
      Databasename := 'DBBROKER';

      { Verifica se existe uma ou mais mercadorias com anuencia do exercito neste fornecimento - By Carlos em 25/03/2010 }
      SQL.Clear;
      SQL.text := ' SELECT DISTINCT RF.CD_NCM                                                                                  ' + sLineBreak +
                  '   FROM MYINDAIA.DBO.TRAP_FORNECIMENTO RF (NOLOCK)                                                                       ' + sLineBreak +
                  '   JOIN BROKER.DBO.TNCM   N  (NOLOCK) ON N.CODIGO              = RF.CD_NCM                                  ' + sLineBreak +
                  '                                     AND N.IN_ANUENCIA_EXERCITO= "1"                                        ' + sLineBreak +
                  '   JOIN MYINDAIA.DBO.TRAP_EMBARQUE     E  (NOLOCK) ON E.CD_RAP              = RF.CD_RAP                                  ' + sLineBreak +
                  '                                     AND E.CD_RAP_ANO          = RF.CD_RAP_ANO                              ' + sLineBreak +
                  '                                     AND E.CD_GRUPO            = RF.CD_GRUPO                                ' + sLineBreak +
                  '  WHERE E.CD_EMBARQUE + E.CD_EMBARQUE_ANO = "'+ qryAutorizados.FieldByName('CD_EMBARQUE').AsString
                                                                 + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString +'"  ' + sLineBreak +
                  '    AND E.CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''                            ' + sLineBreak ;
      Open;
      flag_existe_anuencia_exercito := IIF(RecordCount > 0,TRUE,FALSE);
      Close;
      {****}

      if qryAutorizadosCD_GRUPO.AsString = '028' then
      begin
        // faz algumas checagens obrigatórias antes de começar a integração
        SQL.Clear;
        SQL.Text := '  SELECT COUNT(*)                                                                                                    ' + sLineBreak +
                    '    FROM MYINDAIA.DBO.TRAP_FORNECIMENTO RF (NOLOCK)                                                                               ' + sLineBreak +
                    '   WHERE RF.CD_RAP     +                                                                                             ' + sLineBreak +
                    '         RF.CD_RAP_ANO +                                                                                             ' + sLineBreak +
                    '         RF.CD_GRUPO IN ( SELECT TOP 1 CD_RAP + CD_RAP_ANO + CD_GRUPO                                                ' + sLineBreak +
                    '                            FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                              ' + sLineBreak +
                    '                           WHERE CD_EMBARQUE +                                                                       ' + sLineBreak +
                    '                                 CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString     +
                                                                              qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''' + sLineBreak +
                    '                             AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''')             ' + sLineBreak +
                    '     AND    ( TX_MOEDA NOT IN ( SELECT CD_EXTERNO                                                                    ' + sLineBreak +
                    '                                  FROM BROKER.DBO.TDE_PARA (NOLOCK)                                                  ' + sLineBreak +
                    '                                 WHERE CD_TABELA = ''21'')                                                           ' + sLineBreak +
                    '           OR TX_UNID_MEDIDA NOT IN (SELECT CD_EXTERNO                                                               ' + sLineBreak +
                    '                                       FROM BROKER.DBO.TDE_PARA (NOLOCK)                                             ' + sLineBreak +
                    '                                      WHERE CD_TABELA = ''20''))                                                     ' + sLineBreak ;
        Open;
        if Fields[0].AsInteger > 0 then
        begin
          Application.MessageBox('Foram encontrados alguns problemas na integração, relacionados a tabela DePara.' + #13#10 +
                                 'Verifique se existe DePara cadastrado para as Unidades de Medida e Moedas nessa(s) RAP(s).',
                                 'Problemas na Integração!', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        Close;
      end;

      if (qryAutorizadosCD_GRUPO.AsString = '155') then
      begin
        // atualiza a tprocesso
        SQL.Clear;
        // Linha alterada - Michel em 08/10/2008             V CAMPO ADICIONADO PARA ATUALIZAÇÃO DA TPROCESSO
        SQL.Text := ' UPDATE PR                                                                                                          ' + sLineBreak +
                    '    SET PR.CD_LOCAL_EMBARQUE    = isnull(R.CD_LOCAL_ORIGEM,PR.CD_LOCAL_EMBARQUE),                                   ' + sLineBreak +
                    '        PR.CD_LOCAL_DESEMBARQUE = isnull(R.CD_LOCAL_DESTINO,PR.CD_LOCAL_DESEMBARQUE),                               ' + sLineBreak +
                    '        PR.CD_PAIS_DESTINO      = isnull(R.CD_PAIS, PR.CD_PAIS_DESTINO),                                            ' + sLineBreak +
                    '        PR.CD_PAIS_ORIGEM       = 105,                                                                              ' + sLineBreak +
                    '        PR.VL_M3                = (SELECT SUM(VL_CUBAGEM ) AS VL_CUBAGEM                                            ' + sLineBreak +
                    '                                     FROM MYINDAIA.DBO.TRAP_FORNECIMENTO B (NOLOCK)                                              ' + sLineBreak +
                    '                                    WHERE B.CD_RAP          = R.CD_RAP                                              ' + sLineBreak +
                    '                                      AND B.CD_RAP_ANO      = R.CD_RAP_ANO                                          ' + sLineBreak +
                    '                                      AND B.CD_FORNECIMENTO = R.NR_FORNECIMENTO)                                    ' + sLineBreak +
                    '   FROM BROKER.DBO.TPROCESSO PR (NOLOCK),                                                                           ' + sLineBreak +
                    '        MYINDAIA.DBO.TRAP                 R  (NOLOCK),                                                                           ' + sLineBreak +
                    '        MYINDAIA.DBO.TRAP_EMBARQUE        RE (NOLOCK)                                                                            ' + sLineBreak +
                    '  WHERE R.CD_RAP     +                                                                                              ' + sLineBreak +
                    '        R.CD_RAP_ANO +                                                                                              ' + sLineBreak +
                    '        R.CD_GRUPO   = RTRIM(LTRIM(RE.CD_RAP)) + RTRIM(LTRIM(RE.CD_RAP_ANO)) + RE.CD_GRUPO                          ' + sLineBreak +
                    '    AND RE.CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''                         ' + sLineBreak +
                    '    AND RE.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''                     ' + sLineBreak +
                    '    AND RE.CD_GRUPO        = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''                            ' + sLineBreak +
                    '    AND PR.NR_PROCESSO     = ''' + Trim(edtCdUnidade.Text) + Trim(mskCdProduto.Text) + Trim(edtProcesso.Text) + ''' ' + sLineBreak ;
        ExecSQL;
        Close;
      end
      else
      begin
        // atualiza a tprocesso
        SQL.Clear;
        // Linha alterada - Michel em 08/10/2008             V CAMPO ADICIONADO PARA ATUALIZAÇÃO DA TPROCESSO
        SQL.Text := ' UPDATE PR                                                                                                          ' + sLineBreak +
                    '    SET PR.IN_COURRIER          = R.IN_COURRIER,                                                                    ' + sLineBreak +
                    '        PR.CD_AGENTE            = R.CD_EMBARCADOR,                                                                  ' + sLineBreak +
                    '        PR.CD_EMBARCACAO        = R.CD_EMBARCACAO,                                                                  ' + sLineBreak + //by Carlos - 27/08/2010
                    '        PR.CD_LOCAL_EMBARQUE    = R.CD_LOCAL_ORIGEM,                                                                ' + sLineBreak +
                    '        PR.CD_LOCAL_DESEMBARQUE = R.CD_LOCAL_DESTINO,                                                               ' + sLineBreak +
                    '        PR.CD_PAIS_DESTINO      = R.CD_PAIS,                                                                        ' + sLineBreak +
                    '        PR.CD_PAIS_ORIGEM       = 105                                                                               ' + sLineBreak +
                    '   FROM BROKER.DBO.TPROCESSO PR (NOLOCK),                                                                           ' + sLineBreak +
                    '        MYINDAIA.DBO.TRAP                 R  (NOLOCK),                                                                           ' + sLineBreak +
                    '        MYINDAIA.DBO.TRAP_EMBARQUE        RE (NOLOCK)                                                                            ' + sLineBreak +
                    '  WHERE R.CD_RAP     +                                                                                              ' + sLineBreak +
                    '        R.CD_RAP_ANO +                                                                                              ' + sLineBreak +
                    '        R.CD_GRUPO   = RTRIM(LTRIM(RE.CD_RAP)) + RTRIM(LTRIM(RE.CD_RAP_ANO)) + RE.CD_GRUPO                          ' + sLineBreak +
                    '    AND RE.CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''                         ' + sLineBreak +
                    '    AND RE.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''                     ' + sLineBreak +
                    '    AND RE.CD_GRUPO        = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''                            ' + sLineBreak +
                    '    AND PR.NR_PROCESSO     = ''' + Trim(edtCdUnidade.Text) + Trim(mskCdProduto.Text) + Trim(edtProcesso.Text) + ''' ' + sLineBreak ;
        ExecSQL;
        Close;
      end;


      {verifica se já existem itens no processo}
      SQL.Clear;
      SQL.Text := 'SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_EXP_ITEM (NOLOCK) WHERE NR_PROCESSO = ''' + vNrProcesso + '''';
      Open;
      vQtReg := Fields[0].AsInteger;
      Close;

      {verifica se itens não vieram da mesma RAP quando os mesmos foram autorizados para documentação}
      if vQtReg > 0 then
      begin
        SQL.Clear;
        SQL.Text := ' SELECT R.NR_PROCESSO                                                                                               ' + sLineBreak +
                    '   FROM MYINDAIA.DBO.TRAP R (NOLOCK)                                                                                             ' + sLineBreak +
                    '  WHERE R.CD_RAP     +                                                                                              ' + sLineBreak +
                    '        R.CD_RAP_ANO +                                                                                              ' + sLineBreak +
                    '        R.CD_GRUPO IN (SELECT TOP 1 CD_RAP + CD_RAP_ANO + CD_GRUPO                                                  ' + sLineBreak +
                    '                         FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                                ' + sLineBreak +
                    '                        WHERE CD_EMBARQUE     +                                                                     ' + sLineBreak +
                    '                              CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString     +
                                                                           qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''  ' + sLineBreak +
                    '                          AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''')               ' + sLineBreak ;
        Open;
        if Trim(Fields[0].AsString) <> vNrProcesso then
        begin
          Application.MessageBox('Já existem itens para esse processo, não será possível continuar a Integração!',
                                 'Error',
                                 MB_OK + MB_ICONSTOP);
          Exit;
        end;
      end;
      {***}


      { verifica se as mercadorias estão cadastradas}
      Close;
      SQL.Clear;
      SQL.Text := ' SELECT DISTINCT CD_MERCADORIA                                                                                                 ' + sLineBreak +
                  '   FROM MYINDAIA.DBO.TRAP_FORNECIMENTO (NOLOCK)                                                                                             ' + sLineBreak +
                  '  WHERE CD_MERCADORIA NOT IN (SELECT CD_MERCADORIA                                                                             ' + sLineBreak +
                  '                                FROM BROKER.DBO.TMERCADORIA_EXP (NOLOCK)                                                       ' + sLineBreak +
                  '                               WHERE CD_GRUPO = ''' + qryAutorizadosCD_GRUPO.AsString + ''')                                   ' + sLineBreak +
                  '    AND CD_RAP     +                                                                                                           ' + sLineBreak +
                  '        CD_RAP_ANO +                                                                                                           ' + sLineBreak +
                  '        CD_GRUPO IN (SELECT CD_RAP + CD_RAP_ANO + CD_GRUPO                                                                     ' + sLineBreak +
                  '                       FROM MYINDAIA.DBO.TRAP_EMBARQUE (nolock)                                                                             ' + sLineBreak +
                  '			                 WHERE CD_EMBARQUE + CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString +
                                                                                     qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + ''' ' + sLineBreak +
                  '             AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''')                                       ' + sLineBreak ;
      Open;
      if not IsEmpty then
      begin
        vAuxMercadoria := '';
        while not eof do
        begin
          vAuxMercadoria := vAuxMercadoria + Fields[0].AsString + ',';
          Next;
        end;

        {*}
        if not InsereMercadorias(vAuxMercadoria) then
        begin
          Application.MessageBox(PChar('Existem mercadorias sem descrição em um ou mais idiomas. '+ #13#10+
                                       'Favor estornar e solicitar ao cliente o reenvio das informações.'),
                                       'Error',
                                        MB_OK + MB_ICONSTOP);
          Exit;
        end;
      end;
      {***}

      
      { verifica se os acordos/normas estão cadastrados - By Vitor Zanin}
      Close;
      SQL.clear;
      SQL.Text :=
      ' SELECT DISTINCT CD_MERCADORIA                                                                                                                            ' + sLineBreak +
      '   FROM MYINDAIA.DBO.TRAP_FORNECIMENTO (NOLOCK)                                                                                                                        ' + sLineBreak +
      '  WHERE CD_RAP     +                                                                                                                                      ' + sLineBreak +
      '        CD_RAP_ANO +                                                                                                                                      ' + sLineBreak +
      '        CD_GRUPO IN (                                                                                                                                     ' + sLineBreak +
      '       SELECT CD_RAP + CD_RAP_ANO + CD_GRUPO                                                                                                              ' + sLineBreak +
      '         FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                                                                                      ' + sLineBreak +
      '        WHERE CD_EMBARQUE + CD_EMBARQUE_ANO= ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString
                                                        + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''                                           ' + sLineBreak +
      '          AND CD_MERCADORIA NOT IN (                                                                                                                      ' + sLineBreak +
      '             SELECT DISTINCT CD_MERCADORIA                                                                                                                ' + sLineBreak +
      '               FROM BROKER.DBO.TMERC_EXP_ACORDO                 X (NOLOCK),                                                                               ' + sLineBreak +
      '                    BROKER.DBO.TCONFIG_PAIS_ACORDO_NORMA_PADRAO A (NOLOCK)                                                                                ' + sLineBreak +
      '              WHERE A.CD_PAIS = ( SELECT DISTINCT CD_PAIS                                                                                                 ' + sLineBreak +
      '                                    FROM MYINDAIA.DBO.TRAP (NOLOCK)                                                                                                    ' + sLineBreak +
      '                                   WHERE CD_RAP     +                                                                                                     ' + sLineBreak +
      '                                         CD_RAP_ANO +                                                                                                     ' + sLineBreak +
      '                                         CD_GRUPO IN (SELECT CD_RAP + CD_RAP_ANO + CD_GRUPO                                                               ' + sLineBreak +
      '                                                        FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                                       ' + sLineBreak +
      '                                                       WHERE CD_EMBARQUE +                                                                                ' + sLineBreak +
      '                                                             CD_EMBARQUE_ANO= ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString
                                                                                         + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''          ' + sLineBreak +
      '                                                         AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''))                     ' + sLineBreak +
      '                AND X.CD_MERCADORIA IN ( SELECT DISTINCT CD_MERCADORIA                                                                                    ' + sLineBreak +
      '                                           FROM MYINDAIA.DBO.TRAP_FORNECIMENTO (NOLOCK)                                                                                ' + sLineBreak +
      '                                          WHERE CD_RAP     +                                                                                              ' + sLineBreak +
      '                                                CD_RAP_ANO +                                                                                              ' + sLineBreak +
      '                                                CD_GRUPO IN ( SELECT CD_RAP + CD_RAP_ANO + CD_GRUPO                                                       ' + sLineBreak +
      '                                                                FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                               ' + sLineBreak +
      '                                                               WHERE CD_EMBARQUE +                                                                        ' + sLineBreak +
      '                                                                     CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString +
                                                                                                    qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + ''' ' + sLineBreak +
      '                                                                 AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''))             ' + sLineBreak +
      '                AND X.CD_NORMA  = A.CD_NORMA                                                                                                              ' + sLineBreak +
      '                AND X.CD_ACORDO = A.CD_ACORDO ))                                                                                                          ' + sLineBreak ;
      Open;
      vAuxMercadoria := '';
      if NOT isEmpty then
      begin
        while not eof do
        begin
          vAuxMercadoria := vAuxMercadoria + Fields[0].AsString + ',';
          Next;
        end;

        {*}
        if not InsereAcordos(vAuxMercadoria) then
        begin
          Application.MessageBox(PChar('Existem mercadorias sem descrição em um ou mais idiomas.'+ #13#10+
                                       'Favor estornar e solicitar ao cliente o reenvio das informações.'),
                                       'Error',
                                       MB_OK + MB_ICONSTOP);
          Exit;
        end;
      end;
      {***}

      { verifica se existe DRAWBACK para Alertar usuário.  by Carlos 07/01/2010 }
      SQL.Clear;
      SQL.Text := ' SELECT ISNULL(R.TP_DRAWBACK,"0")                                                                                                 ' + sLineBreak +
                  '   FROM MYINDAIA.DBO.TRAP R (NOLOCK)                                                                                                           ' + sLineBreak +
                  '  WHERE R.CD_RAP     +                                                                                                            ' + sLineBreak +
                  '        R.CD_RAP_ANO +                                                                                                            ' + sLineBreak +
                  '        R.CD_GRUPO IN (SELECT TOP 1 CD_RAP + CD_RAP_ANO + CD_GRUPO                                                                ' + sLineBreak +
                  '                         FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                                              ' + sLineBreak +
                  '                        WHERE CD_EMBARQUE + CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString +
                                                                                       qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''  ' + sLineBreak +
                  '    AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''')                                                   ' + sLineBreak ;
      Open;
      flag_existe_drawback := (Fields[0].AsString<>'0');
      close;
      {***}

      { PEGA O CONTATO DA RAP E ATUALIZA NA MANUTENÇÃO DO PROCESSO  -  by Carlos 13/08/2010 }
      SQL.Clear;
      SQL.Text := ' SELECT ISNULL(CC.CD_CONTATO,"")                                                                                                  ' + sLineBreak +
                  '   FROM MYINDAIA.DBO.TRAP             R  (NOLOCK)                                                                                              ' + sLineBreak +
                  '   JOIN TCLIENTE_CONTATO CC (NOLOCK) ON CC.CD_USUARIO=R.CD_USUARIO_CRIADOR                                                        ' + sLineBreak +
                  '  WHERE R.CD_RAP     +                                                                                                            ' + sLineBreak +
                  '        R.CD_RAP_ANO +                                                                                                            ' + sLineBreak +
                  '        R.CD_GRUPO IN (SELECT TOP 1 CD_RAP + CD_RAP_ANO + CD_GRUPO                                                                ' + sLineBreak +
                  '                         FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                                              ' + sLineBreak +
                  '                        WHERE CD_EMBARQUE + CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString +
                                                                                       qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''  ' + sLineBreak +
                  '    AND CD_GRUPO       = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''')                                             ' + sLineBreak +
                  '    AND CC.CD_CLIENTE  = R.CD_EXPORTADOR                                                                                          ' + sLineBreak +
                  '    AND CC.CD_UNID_NEG = :CD_UNID_NEG                                                                                             ' + sLineBreak +
                  '    AND CC.CD_PRODUTO  = :CD_PRODUTO                                                                                              ' + sLineBreak ;
      parambyname('CD_UNID_NEG').AsString := edtCdUnidade.Text;
      parambyname('CD_PRODUTO').AsString  := mskCdProduto.Text;
      Open;
      str_cd_contato:=fields[0].AsString;
      Close;

      if str_cd_contato <> '' then
      begin
         SQL.Clear;
         SQL.text := ' UPDATE BROKER.DBO.TPROCESSO                   ' + sLineBreak +
                     '    SET CD_CONTATO  = "'+str_cd_contato+'"     ' + sLineBreak +
                     '  WHERE NR_PROCESSO = ''' + vNrProcesso + '''  ' + sLineBreak ;
         ExecSQL;
      end;
      {***}


      // começando a integração, primeiro deletando qualquer coisa que tenha la no processo
      SQL.Clear;
      SQL.Add('  DELETE FROM BROKER.DBO.TPROCESSO_EXP        WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
      SQL.Add('  DELETE FROM BROKER.DBO.TPROCESSO_EXP_PEDIDO WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
      SQL.Add('  DELETE FROM BROKER.DBO.TPROCESSO_EXP_ITEM   WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
      ExecSQL;
      {***}


      // aqui vai fazer a integração da CAPA do processo
      aSQL := '';
      SQL.Clear;
      aSQL := ' INSERT INTO BROKER.DBO.TPROCESSO_EXP( NR_PROCESSO,             ' + sLineBreak +
              '                                       CD_EXPORTADOR,           ' + sLineBreak +
              '                                       TX_LOGOMARCA,            ' + sLineBreak +
              '                                       IN_FABR_EXPO,            ' + sLineBreak +
              '                                       CD_FABRICANTE,           ' + sLineBreak +
              '                                       CD_PAIS_DESTINO,         ' + sLineBreak +
              '                                       NR_FATURA,               ' + sLineBreak +
              '                                       VL_COMISSAO_PERCENT,     ' + sLineBreak +
              '                                       DT_FATURA,               ' + sLineBreak +
              '                                       DT_AVISO_EMBARQUE,       ' + sLineBreak +
              '                                       CD_TERMO_PAGTO,          ' + sLineBreak +
              '                                       CD_CONSIGNATARIO,        ' + sLineBreak +
              '                                       CD_NOTIFY1,              ' + sLineBreak +
              '                                       CD_SEGURADORA,           ' + sLineBreak +
              '                                       CD_VIA_TRANSPORTE,       ' + sLineBreak +
              '                                       CD_LOCAL_ORIGEM,         ' + sLineBreak +
              '                                       CD_LOCAL_DESTINO,        ' + sLineBreak +
              '                                       CD_INCOTERM,             ' + sLineBreak +
              '                                       CD_AGENTE,               ' + sLineBreak +
              '                                       TX_DECL_ADIC_INST_EMB,   ' + sLineBreak +
              '                                       TX_MARCACAO_VOLUME,      ' + sLineBreak +
              '                                       CD_LOCAL_DESPACHO,       ' + sLineBreak +
              '                                       CD_BANCO_SAQUE_BORDERO,  ' + sLineBreak +
              '                                       TP_NOTIFY1,              ' + sLineBreak +
              '                                       TP_CONSIGNATARIO,        ' + sLineBreak +
              '                                       CD_IMPORTADOR,           ' + sLineBreak +
              '                                       DT_REGISTRO_PEDIDO,      ' + sLineBreak +
              '                                       CD_MOEDA,                ' + sLineBreak +
              '                                       CD_TRANSPORTADORA )      ' + sLineBreak +

              ' SELECT TOP 1 ' + QuotedStr(vNrProcesso)  + sLineBreak +
              '      , R.CD_EXPORTADOR                   ' + sLineBreak +
              '      ,''logo_sg''+CD_LOGOMARCA+''.jpg''  ' + sLineBreak +
              '      , R.IN_FABR_EXPO,                   ' + sLineBreak ;

      if (qryAutorizadosCD_GRUPO.AsString = '241') or (qryAutorizadosCD_GRUPO.AsString = '155') then
      begin
        aSQL := aSQL +
                '      CD_FABRICANTE       ' + sLineBreak +
                '     ,CD_PAIS             ' + sLineBreak +
                '     ,F.CD_FORNECIMENTO   ' + sLineBreak +
                '     ,VL_COMISSAO         ' + sLineBreak +
                '     ,R.DT_FATURA         ' + sLineBreak +
                '     ,R.DT_EMBARQUE       ' + sLineBreak +
                '     ,R.CD_TERMO_PAGTO    ' + sLineBreak +
                '     ,CD_CONSIGNATARIO    ' + sLineBreak ;
      end
      else
        aSQL := aSQL +
                '      CD_FABRICANTE                   ' + sLineBreak +
                '     ,CD_PAIS                         ' + sLineBreak +
                '     ,R.CD_RAP +''/''+ R.CD_RAP_ANO   ' + sLineBreak +
                '     ,VL_COMISSAO                     ' + sLineBreak +
                '     ,R.DT_FATURA                     ' + sLineBreak +
                '     ,R.DT_EMBARQUE                   ' + sLineBreak +
                '     ,R.CD_TERMO_PAGTO                ' + sLineBreak +
                '     ,CD_CONSIGNATARIO                ' + sLineBreak ;


        aSQL := aSQL +
                '       ,CD_NOTIFY                                                                       ' + sLineBreak +
                '       ,CD_AGENTE_COMISSAO                                                              ' + sLineBreak +
                '       ,CD_VIA_TRANSPORTE                                                               ' + sLineBreak +
                '       ,CD_LOCAL_ORIGEM                                                                 ' + sLineBreak +
                '       ,CD_LOCAL_DESTINO                                                                ' + sLineBreak +
                '       ,R.CD_INCOTERM                                                                   ' + sLineBreak +
                '       ,P.CD_AGENTE                                                                     ' + sLineBreak +
               // '       ,CD_EMBARCADOR                                                                   ' + sLineBreak +
                '       ,TX_INST_EMB                                                                     ' + sLineBreak +
                '       ,R.TX_MARCACAO                                                                   ' + sLineBreak +
                '       ,CD_TERMINAL                                                                     ' + sLineBreak +
                '       ,CD_BANCO                                                                        ' + sLineBreak +
                '       ,TP_NOTIFY                                                                       ' + sLineBreak +
                '       ,R.TP_CONSIGNEE                                                                    ' + sLineBreak +
                '       ,R.CD_CLIENTE                                                                      ' + sLineBreak +
                '       ,CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103),103)                         ' + sLineBreak +
                '       ,R.CD_MOEDA_MLE                                                                  ' + sLineBreak +
                '       ,CD_TRANSPORTADORA                                                               ' + sLineBreak +
                '  FROM MYINDAIA.DBO.TRAP              R (NOLOCK)                                                     ' + sLineBreak +
                '     , MYINDAIA.DBO.TRAP_EMBARQUE     E (NOLOCK)                                                     ' + sLineBreak +
                '     , MYINDAIA.DBO.TRAP_FORNECIMENTO F (NOLOCK)                                                     ' + sLineBreak +
                '     , BROKER.DBO.TPROCESSO P (NOLOCK)                                                  ' + sLineBreak +
                ' WHERE R.CD_RAP           = E.CD_RAP                                                    ' + sLineBreak +
                '   AND R.CD_RAP_ANO       = E.CD_RAP_ANO                                                ' + sLineBreak +
                '   AND R.CD_GRUPO         = E.CD_GRUPO                                                  ' + sLineBreak +
                '   AND F.CD_RAP           = R.CD_RAP                                                    ' + sLineBreak +
                '   AND F.CD_RAP_ANO       = R.CD_RAP_ANO                                                ' + sLineBreak +
                '   AND F.CD_GRUPO         = R.CD_GRUPO                                                  ' + sLineBreak +
                '   AND E.CD_EMBARQUE      = ''' + qryAutorizadosCD_EMBARQUE.AsString + '''              ' + sLineBreak +
                '   AND E.CD_EMBARQUE_ANO  = ''' + qryAutorizadosCD_EMBARQUE_ANO.AsString + '''          ' + sLineBreak +
                '   AND E.CD_GRUPO         = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''' ' + sLineBreak +
                '   AND P.NR_PROCESSO      = ''' + vNrProcesso                                     + ''' ' + sLineBreak ;

      SQL.Text := aSQL;
      ExecSQL;
      {***}


      // aqui faz o update dos totais da capa, não tem como fazer junto por motivos de group by ( nao da pra agrupar por causa de alguns campos )
      SQL.Clear;
      SQL.Text := ' SELECT SUM(RA.VL_PESO_LIQ),                                                                          ' + sLineBreak +
                  '        SUM(RA.VL_PESO_BRUTO),                                                                        ' + sLineBreak +
                  '        SUM(RA.VL_FRETE_INT),                                                                         ' + sLineBreak +
                  '        SUM(RA.VL_SEGURO),                                                                            ' + sLineBreak +
                  '	       SUM(RA.VL_ACRESCIMO),                                                                         ' + sLineBreak +
                  '        SUM(RA.VL_DESCONTO),                                                                          ' + sLineBreak +
                  '        SUM(RA.VL_CUBAGEM),                                                                           ' + sLineBreak +
                  '        SUM(RA.VL_COMISSAO),                                                                          ' + sLineBreak +
                  '  	     SUM(RA.VL_MLE),                                                                               ' + sLineBreak +
                  '        SUM(RA.VL_QTDE_PROD)                                                                          ' + sLineBreak +
                  '   FROM MYINDAIA.DBO.TRAP RA (NOLOCK)                                                                              ' + sLineBreak +
                  '  WHERE EXISTS( SELECT CD_RAP,                                                                        ' + sLineBreak +
                  '                       CD_RAP_ANO,                                                                    ' + sLineBreak +
                  '                       CD_GRUPO                                                                       ' + sLineBreak +
                  '                  FROM MYINDAIA.DBO.TRAP_EMBARQUE RE (NOLOCK)                                                      ' + sLineBreak +
                  '		   	          WHERE RE.CD_RAP       = RA.CD_RAP                                                    ' + sLineBreak +
                  '                   AND RE.CD_RAP_ANO   = RA.CD_RAP_ANO                                                ' + sLineBreak +
                  '                   AND RE.CD_GRUPO     = RA.CD_GRUPO                                                  ' + sLineBreak +
                  '                   AND CD_EMBARQUE     = ''' + qryAutorizadosCD_EMBARQUE.AsString + '''               ' + sLineBreak +
                  '                   AND CD_EMBARQUE_ANO = ''' + qryAutorizadosCD_EMBARQUE_ANO.AsString + '''           ' + sLineBreak +
                  '                   AND RE.CD_GRUPO     = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''') ' + sLineBreak ;
      Open;

      vPesoLiquido := Fields[0].AsFloat;
      vPesoBruto   := Fields[1].AsFloat;
      vFrete       := Fields[2].AsFloat;
      vSeguro      := Fields[3].AsFloat;
      vAcrescimo   := Fields[4].AsFloat;
      vDesconto    := Fields[5].AsFloat;
      vCubagem     := Fields[6].AsFloat;
      vComissao    := Fields[7].AsFloat;
      vFob         := Fields[8].AsFloat;
      vQtdeProduto := Fields[9].AsFloat;

      Close;
      SQL.Clear;
      SQL.Text := '  UPDATE BROKER.DBO.TPROCESSO_EXP                 ' + sLineBreak +
                  '     SET VL_PESO_LIQUIDO   = :VL_PESO_LIQUIDO,    ' + sLineBreak +
                  '         VL_PESO_BRUTO     = :VL_PESO_BRUTO,      ' + sLineBreak +
                  '         VL_FRETE          = :VL_FRETE,           ' + sLineBreak +
                  '         VL_SEGURO         = :VL_SEGURO,          ' + sLineBreak +
                  '         VL_ACRESCIMO      = :VL_ACRESCIMO,       ' + sLineBreak +
                  '         VL_DESCONTO       = :VL_DESCONTO,        ' + sLineBreak +
                  '         VL_TOT_CUBAGEM    = :VL_TOT_CUBAGEM,     ' + sLineBreak +
                  '         VL_TOT_COM_AGENTE = :VL_TOT_COM_AGENTE,  ' + sLineBreak +
                  '         VL_TOT_FOB        = :VL_TOT_FOB,         ' + sLineBreak +
                  '         VL_TOT_QTDE_PROD  = :VL_TOT_QTDE_PROD,   ' + sLineBreak +
                  '         IN_DRAWBACK       = :IN_DRAWBACK         ' + sLineBreak +
                  '  WHERE NR_PROCESSO = ' + QuotedStr(vNrProcesso) + sLineBreak ;
      Params[0].AsFloat   := vPesoLiquido;
      Params[1].AsFloat   := vPesoBruto  ;
      Params[2].AsFloat   := vFrete      ;
      Params[3].AsFloat   := vSeguro     ;
      Params[4].AsFloat   := vAcrescimo  ;
      Params[5].AsFloat   := vDesconto   ;
      Params[6].AsFloat   := vCubagem    ;
      Params[7].AsFloat   := vComissao   ;
      Params[8].AsFloat   := vFob        ;
      Params[9].AsFloat   := vQtdeProduto;
      Params[10].AsString := IIF(flag_existe_drawback=true,'1','0'); //by carlos 07/01/2010 ( atualiza a informação de DRAWBACK Myindaia )
      ExecSQL;
      {***}         


      //aqui vai integrar as faturas, pedido e marcação
      SQL.Clear;
      if (qryAutorizadosCD_GRUPO.AsString = '241' ) or (qryAutorizadosCD_GRUPO.AsString = '155' ) then
      begin
        SQL.TEXT := '  INSERT INTO BROKER.DBO.TPROCESSO_EXP_PEDIDO (NR_PROCESSO         ' + sLineBreak +
                    '                                             , NR_PEDIDO           ' + sLineBreak +
                    '                                             , NR_FATURA           ' + sLineBreak +
                    '                                             , TX_MARCACAO_VOLUME  ' + sLineBreak +
                    '                                             , TX_INF_EMBALAGEM    ' + sLineBreak +
                    '                                             , VL_PESO_LIQUIDO     ' + sLineBreak +
                    '                                             , VL_PESO_BRUTO       ' + sLineBreak +
                    '                                             , VL_CUBAGEM )        ' + sLineBreak +
                    '  SELECT ' + QuotedStr(vNrProcesso)                                  + sLineBreak +
                    '       , R.CD_RAP +''/''+ R.CD_RAP_ANO                             ' + sLineBreak +
                    '       , F.CD_FORNECIMENTO                                         ' + sLineBreak +
                    '       , R.TX_MARCACAO                                             ' + sLineBreak +
                    '       , TX_EMBALAGEM                                              ' + sLineBreak +
                    '       , R.VL_PESO_LIQ                                             ' + sLineBreak +
                    '       , R.VL_PESO_BRUTO                                           ' + sLineBreak +
                    '       , R.VL_CUBAGEM                                              ' + sLineBreak +
                    '  FROM MYINDAIA.DBO.TRAP              R (NOLOCK),                               ' + sLineBreak +
                    '       MYINDAIA.DBO.TRAP_EMBARQUE     E (NOLOCK),                               ' + sLineBreak +
                    '       MYINDAIA.DBO.TRAP_FORNECIMENTO F (NOLOCK)                                ' + sLineBreak +
                    '  WHERE R.CD_RAP           = E.CD_RAP                              ' + sLineBreak +
                    '    AND R.CD_RAP_ANO       = E.CD_RAP_ANO                          ' + sLineBreak +
                    '    AND R.CD_GRUPO         = E.CD_GRUPO                            ' + sLineBreak +
                    '    AND F.CD_RAP           = R.CD_RAP                              ' + sLineBreak +
                    '    AND F.CD_RAP_ANO       = R.CD_RAP_ANO                          ' + sLineBreak +
                    '    AND F.CD_GRUPO         = R.CD_GRUPO                            ' + sLineBreak +
                    '    AND E.CD_EMBARQUE      = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''      ' + sLineBreak +
                    '    AND E.CD_EMBARQUE_ANO  = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''  ' + sLineBreak +
                    '    AND E.CD_GRUPO         = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''         ' + sLineBreak +
                    '  GROUP BY R.NR_CDE,                                               ' + sLineBreak +
                    '           R.TX_MARCACAO,                                          ' + sLineBreak +
                    '           R.TX_EMBALAGEM,                                         ' + sLineBreak +
                    '           R.CD_RAP,                                               ' + sLineBreak +
                    '           R.CD_RAP_ANO,                                           ' + sLineBreak +
                    '           F.CD_FORNECIMENTO,                                      ' + sLineBreak +
                    '           R.VL_PESO_LIQ,                                          ' + sLineBreak +
                    '           R.VL_PESO_BRUTO,                                        ' + sLineBreak +
                    '           R.VL_CUBAGEM                                            ' + sLineBreak ;
      end
      else
      begin
        SQL.Text := '  INSERT INTO BROKER.DBO.TPROCESSO_EXP_PEDIDO ( NR_PROCESSO,        ' + sLineBreak +
                    '                                                NR_PEDIDO,          ' + sLineBreak +
                    '                                                NR_FATURA,          ' + sLineBreak +
                    '                                                TX_MARCACAO_VOLUME, ' + sLineBreak +
                    '                                                TX_INF_EMBALAGEM,   ' + sLineBreak +
                    '                                                VL_PESO_LIQUIDO,    ' + sLineBreak +
                    '                                                VL_PESO_BRUTO,      ' + sLineBreak +
                    '                                                VL_CUBAGEM )        ' + sLineBreak +
                    '  SELECT ' + QuotedStr(vNrProcesso)                                   + sLineBreak +
                    '       , R.CD_RAP + ''/'' + R.CD_RAP_ANO                            ' + sLineBreak +
                    '       , R.CD_RAP+''/''+R.CD_RAP_ANO                                ' + sLineBreak +
                    '       , TX_MARCACAO                                                ' + sLineBreak +
                    '       , TX_EMBALAGEM                                               ' + sLineBreak +
                    '       , R.VL_PESO_LIQ                                              ' + sLineBreak +
                    '       , R.VL_PESO_BRUTO                                            ' + sLineBreak +
                    '       , R.VL_CUBAGEM                                               ' + sLineBreak +
                    '  FROM MYINDAIA.DBO.TRAP          R (NOLOCK),                                    ' + sLineBreak +
                    '       MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK)                                     ' + sLineBreak +
                    '  WHERE R.CD_RAP + R.CD_RAP_ANO + R.CD_GRUPO = E.CD_RAP + E.CD_RAP_ANO + E.CD_GRUPO   ' + sLineBreak +
                    '    AND E.CD_EMBARQUE + E.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString
                                                                     + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''' + sLineBreak +
                    '    AND E.CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''                              ' + sLineBreak +
                    '  GROUP BY R.NR_CDE,          ' + sLineBreak +
                    '           TX_MARCACAO,       ' + sLineBreak +
                    '           TX_EMBALAGEM,      ' + sLineBreak +
                    '           R.CD_RAP,          ' + sLineBreak +
                    '           R.CD_RAP_ANO,      ' + sLineBreak +
                    '           R.VL_PESO_LIQ,     ' + sLineBreak +
                    '           R.VL_PESO_BRUTO,   ' + sLineBreak +
                    '           R.VL_CUBAGEM       ' + sLineBreak ;
      end;
      ExecSQL;
      {***}


      // aqui vai fazer a integração dos ITENS do processo
      SQL.Clear;
      ASql := '';
      if qryAutorizadosCD_GRUPO.AsString = '028' then
      begin
       ASql := 'INSERT INTO BROKER.DBO.TPROCESSO_EXP_ITEM ( NR_PROCESSO,                     ' + sLineBreak +
               '                                            NR_ITEM,                         ' + sLineBreak +
               '                                            NR_PEDIDO,                       ' + sLineBreak +
               '                                            CD_MERCADORIA,                   ' + sLineBreak +
               '                                            TX_MERCADORIA,                   ' + sLineBreak +
               '                                            CD_UNID_MEDIDA,                  ' + sLineBreak +
               '                                            QT_MERCADORIA,                   ' + sLineBreak +
               '                                            VL_UNITARIO,                     ' + sLineBreak +
               '                                            VL_MCV,                          ' + sLineBreak +
               '                                            VL_TOT_ITEM,                     ' + sLineBreak +
               '                                            CD_NCM,                          ' + sLineBreak +
               '                                            CD_NALADI_SH,                    ' + sLineBreak +
               '                                            CD_ACORDO,                       ' + sLineBreak +
               '                                            CD_NORMAS,                       ' + sLineBreak +
               '                                            CD_NCM_DOC,                      ' + sLineBreak +
               '                                            NR_SEQ_NCM_DOC,                  ' + sLineBreak +
               '                                            CD_NALADI_DOC,                   ' + sLineBreak +
               '                                            NR_SEQ_NALADI_DOC,               ' + sLineBreak +
               '                                            CD_FABR_EXPO,                    ' + sLineBreak +
               '                                            CD_FABRICANTE,                   ' + sLineBreak +
               '                                            QT_BAIXADA,                      ' + sLineBreak +
               '                                            NR_PEDIDO_IMP,                   ' + sLineBreak +
               '                                            NR_ORDER,                        ' + sLineBreak +
               '                                            NR_PROC_PE,                      ' + sLineBreak +
               '                                            NR_ITEM_PE,                      ' + sLineBreak +
               '                                            VL_TOT_PESO_LIQ,                 ' + sLineBreak +
               '                                            TX_DELIVERY_NOTE,                ' + sLineBreak +
               '                                            CD_SULF_NCM,                     ' + sLineBreak +
               '                                            CD_UNID_MEDIDA_ESTAT)            ' + sLineBreak +
               ' SELECT  ' + QuotedStr(vNrProcesso)                                            + sLineBreak +
             //   '        ,ROW_NUMBER() OVER(ORDER BY R.CD_RAP, F.CD_FORNECIMENTO ASC),                         '   + sLineBreak +
               '        ,F.CD_ITEM,                                                          ' + sLineBreak +
               '         R.CD_RAP+''/''+R.CD_RAP_ANO,                                        ' + sLineBreak +
               '         F.CD_MERCADORIA,                                                    ' + sLineBreak +
               '         ISNULL(X.TX_MERCADORIA, M.NM_MERCADORIA),                           ' + sLineBreak +
               '        ( SELECT TOP 1 CD_DDBROKER                                           ' + sLineBreak +
               '            FROM BROKER.DBO.TDE_PARA (nolock)                                ' + sLineBreak +
               '           WHERE CD_TABELA = ''20''                                          ' + sLineBreak +
               '             AND CD_EXTERNO = F.TX_UNID_MEDIDA ),                            ' + sLineBreak +
               '         F.VL_QTDE,                                                          ' + sLineBreak +
               '         F.VL_PRECO_UNIT,                                                    ' + sLineBreak +
               '         F.VL_PRECO_TOT,                                                     ' + sLineBreak +
               '         F.VL_PRECO_TOT,                                                     ' + sLineBreak +
               '         M.CD_NCM_SH,                                                        ' + sLineBreak +
               '         M.CD_NALADI_SH,                                                     ' + sLineBreak +
               '         X.CD_ACORDO,                                                        ' + sLineBreak +
               '         X.CD_NORMA,                                                         ' + sLineBreak +
               '         X.CD_NCM_DOC,                                                       ' + sLineBreak +
               '         X.NR_SEQ_NCM,                                                       ' + sLineBreak +
               '         X.CD_NALADI_SH_DOC,                                                 ' + sLineBreak +
               '         X.NR_SEQ_NALADI,                                                    ' + sLineBreak +
               '         R.IN_FABR_EXPO,                                                     ' + sLineBreak +
               '         R.CD_FABRICANTE,                                                    ' + sLineBreak +
               '         0,                                                                  ' + sLineBreak +
               '         F.CD_REFERENCIA,                                                    ' + sLineBreak +
               '         F.NR_PO,                                                            ' + sLineBreak +
               '         F.CD_REFERENCIA,                                                    ' + sLineBreak +
               '         F.NR_ITEM_CLIENTE,                                                  ' + sLineBreak +
               '         ( SELECT SUM(VL_PESO_LIQ)/(SELECT COUNT(*)                          ' + sLineBreak +
               '                                      FROM MYINDAIA.DBO.TRAP_FORNECIMENTO RP (NOLOCK)     ' + sLineBreak +
               '                                     WHERE CD_RAP        = E.CD_RAP          ' + sLineBreak +
               '                                       AND CD_RAP_ANO    = E.CD_RAP_ANO      ' + sLineBreak +
               '                                       AND CD_GRUPO      = E.CD_GRUPO        ' + sLineBreak +
               '                                       AND CD_MERCADORIA = F.CD_MERCADORIA)  ' + sLineBreak +
               '             FROM MYINDAIA.DBO.TRAP_PACK_LIST RP (NOLOCK)                                 ' + sLineBreak +
               '            WHERE CD_RAP        = E.CD_RAP                                   ' + sLineBreak +
               '              AND CD_RAP_ANO    = E.CD_RAP_ANO                               ' + sLineBreak +
               '              AND CD_GRUPO      = E.CD_GRUPO                                 ' + sLineBreak +
               '              AND CD_MERCADORIA = F.CD_MERCADORIA ) VL_PL_TOT,               ' + sLineBreak +
               '         F.CD_FORNECIMENTO,                                                  ' + sLineBreak +
               '         M.CD_SULF_NCM,                                                      ' + sLineBreak +
               '         NCM.UNIDADE_MEDIDA                                                  ' + sLineBreak ;
      end;

      if (qryAutorizadosCD_GRUPO.AsString = '241') or (qryAutorizadosCD_GRUPO.AsString = '155') then
      begin
        ASql := 'INSERT INTO BROKER.DBO.TPROCESSO_EXP_ITEM ( NR_PROCESSO,          ' + sLineBreak +
                '                                            NR_ITEM,              ' + sLineBreak +
                '                                            NR_PEDIDO,            ' + sLineBreak +
                '                                            CD_MERCADORIA,        ' + sLineBreak +
                '                                            TX_MERCADORIA,        ' + sLineBreak +
                '                                            CD_UNID_MEDIDA,       ' + sLineBreak +
                '                                            CD_EMBALAGEM,         ' + sLineBreak +
                '                                            QT_MERCADORIA,        ' + sLineBreak +
                '                                            VL_UNITARIO,          ' + sLineBreak +
                '                                            VL_MCV,               ' + sLineBreak +
                '                                            VL_TOT_ITEM,          ' + sLineBreak +
                '                                            CD_NCM,               ' + sLineBreak +
                '                                            CD_NALADI_SH,         ' + sLineBreak +
                '                                            CD_ACORDO,            ' + sLineBreak +
                '                                            CD_NORMAS,            ' + sLineBreak +
                '                                            CD_NCM_DOC,           ' + sLineBreak +
                '                                            NR_SEQ_NCM_DOC,       ' + sLineBreak +
                '                                            CD_NALADI_DOC,        ' + sLineBreak +
                '                                            NR_SEQ_NALADI_DOC,    ' + sLineBreak +
                '                                            CD_FABR_EXPO,         ' + sLineBreak +
                '                                            CD_FABRICANTE,        ' + sLineBreak +
                '                                            QT_BAIXADA,           ' + sLineBreak +
                '                                            NR_PEDIDO_IMP,        ' + sLineBreak +
                '                                            NR_ORDER,             ' + sLineBreak +
                '                                            NR_PROC_PE,           ' + sLineBreak +
                '                                            NR_ITEM_PE,           ' + sLineBreak +
                '                                            VL_TOT_PESO_LIQ,      ' + sLineBreak +
                '                                            TX_DELIVERY_NOTE,     ' + sLineBreak +
                '                                            VL_TOT_PESO_BRUTO,    ' + sLineBreak +
                '                                            CD_SULF_NCM,          ' + sLineBreak +
                '                                            CD_UNID_MEDIDA_ESTAT, ' + sLineBreak +
                '                                            VL_CUBAGEM)           ' + sLineBreak ;

          if (qryAutorizadosCD_GRUPO.AsString = '241') then
            ASql := ASql +
                ' SELECT ' + QuotedStr(vNrProcesso)                                                                                               + sLineBreak +
                '        ,ROW_NUMBER() OVER(ORDER BY R.CD_RAP, F.CD_FORNECIMENTO ASC),                                                                      '   + sLineBreak +
            //  '      -- ,F.CD_ITEM,                                                                                                           ' + sLineBreak +
                '        F.CD_FORNECIMENTO,                                                                                                     ' + sLineBreak +
                '        F.CD_MERCADORIA,                                                                                                       ' + sLineBreak +
                '        ISNULL(X.TX_MERCADORIA, M.NM_MERCADORIA),                                                                              ' + sLineBreak +
                '        ''015'',                                                                                                               ' + sLineBreak +
                '        NULL,                                                                                                                  ' + sLineBreak +
                '        CONVERT(FLOAT, MASTER.DBO.CALCULAMEDIDAS_CEBRACE(F.TX_DESC, F.QT_CAIXAS, ISNULL(F.QT_CHAPA_PERDIDA,0))),               ' + sLineBreak +
                '        (F.VL_PRECO_TOT / CONVERT(FLOAT,                                                                                       ' + sLineBreak +
                '                                  MASTER.DBO.CALCULAMEDIDAS_CEBRACE(F.TX_DESC, F.QT_CAIXAS, ISNULL(F.QT_CHAPA_PERDIDA,0))) ),  ' + sLineBreak +
                '        F.VL_PRECO_TOT,                                                                                                        ' + sLineBreak +
                '        F.VL_PRECO_TOT,                                                                                                        ' + sLineBreak +
                '        M.CD_NCM_SH,                                                                                                           ' + sLineBreak +
                '        M.CD_NALADI_SH,                                                                                                        ' + sLineBreak +
                '        X.CD_ACORDO,                                                                                                           ' + sLineBreak +
                '        X.CD_NORMA,                                                                                                            ' + sLineBreak +
                '        X.CD_NCM_DOC,                                                                                                          ' + sLineBreak +
                '        X.NR_SEQ_NCM,                                                                                                          ' + sLineBreak +
                '        X.CD_NALADI_SH_DOC,                                                                                                    ' + sLineBreak +
                '        X.NR_SEQ_NALADI,                                                                                                       ' + sLineBreak +
                '        R.IN_FABR_EXPO,                                                                                                        ' + sLineBreak +
                '        R.CD_FABRICANTE,                                                                                                       ' + sLineBreak +
                '        0,                                                                                                                     ' + sLineBreak +
                '        F.CD_REFERENCIA,                                                                                                       ' + sLineBreak +
                '        F.NR_PO,                                                                                                               ' + sLineBreak +
                '        F.CD_REFERENCIA,                                                                                                       ' + sLineBreak +
                '        F.NR_ITEM_CLIENTE,                                                                                                     ' + sLineBreak +
                '        F.VL_PESO_LIQ_UN,                                                                                                      ' + sLineBreak +
                '        F.CD_FORNECIMENTO,                                                                                                     ' + sLineBreak +
                '        VL_PESO_BRUTO_UN,                                                                                                      ' + sLineBreak +
                '        M.CD_SULF_NCM,                                                                                                         ' + sLineBreak +
                '        NCM.UNIDADE_MEDIDA,                                                                                                    ' + sLineBreak +
                '        F.VL_CUBAGEM                                                                                                           ' + sLineBreak 
          else
          if  (qryAutorizadosCD_GRUPO.AsString = '155') then
            ASql := ASql +
                ' SELECT ' + QuotedStr(vNrProcesso)                                                  + sLineBreak +
                '        ,ROW_NUMBER() OVER(ORDER BY R.CD_RAP, F.CD_FORNECIMENTO ASC),             ' + sLineBreak +
                '        F.CD_FORNECIMENTO,                                                        ' + sLineBreak +
                '        F.CD_MERCADORIA,                                                          ' + sLineBreak +
                '        M.NM_MERCADORIA,                                                          ' + sLineBreak +
                '       ( SELECT TOP 1 CD_UNID_MEDIDA                                              ' + sLineBreak +
                '           FROM BROKER.DBO.TUNID_MEDIDA_BROKER (NOLOCK)                           ' + sLineBreak +
                '          WHERE NM_UNID_MEDIDA = F.TX_UNID_MEDIDA ),                              ' + sLineBreak +
                '       ( SELECT TOP 1 CD_EMBALAGEM                                                ' + sLineBreak +
                '           FROM BROKER.DBO.TEMBALAGEM (NOLOCK)                                    ' + sLineBreak +
                '          WHERE NM_EMBALAGEM_S = F.TX_UNID_MEDIDA ),                              ' + sLineBreak +
                '        F.VL_QTDE,                                                                ' + sLineBreak +
                '        F.VL_PRECO_UNIT,                                                          ' + sLineBreak +
                '        F.VL_PRECO_TOT,                                                           ' + sLineBreak +
                '        F.VL_PRECO_TOT,                                                           ' + sLineBreak +
                '        M.CD_NCM_SH,                                                              ' + sLineBreak +
                '        M.CD_NALADI_SH,                                                           ' + sLineBreak +
                '        X.CD_ACORDO,                                                              ' + sLineBreak +
                '        X.CD_NORMA,                                                               ' + sLineBreak +
                '        X.CD_NCM_DOC,                                                             ' + sLineBreak +
                '        X.NR_SEQ_NCM,                                                             ' + sLineBreak +
                '        X.CD_NALADI_SH_DOC,                                                       ' + sLineBreak +
                '        X.NR_SEQ_NALADI,                                                          ' + sLineBreak +
                '        R.IN_FABR_EXPO,                                                           ' + sLineBreak +
                '        R.CD_FABRICANTE,                                                          ' + sLineBreak +
                '        0,                                                                        ' + sLineBreak +
                '        F.CD_REFERENCIA,                                                          ' + sLineBreak +
                '        F.NR_PO,                                                                  ' + sLineBreak +
                '        F.CD_REFERENCIA,                                                          ' + sLineBreak +
                '        F.NR_ITEM_CLIENTE,                                                        ' + sLineBreak +
                '        (F.VL_PESO_LIQ_UN * F.VL_QTDE),                                           ' + sLineBreak +
                '        F.CD_FORNECIMENTO,                                                        ' + sLineBreak +
                '        (VL_PESO_BRUTO_UN * F.VL_QTDE ),                                          ' + sLineBreak +
                '        M.CD_SULF_NCM,                                                            ' + sLineBreak +
                '        NCM.UNIDADE_MEDIDA,                                                       ' + sLineBreak +
                '        F.VL_CUBAGEM                                                              ' + sLineBreak ;
      end;


      ASql :=
      ASql +
              '       FROM MYINDAIA.DBO.TRAP                                        R   (NOLOCK),               ' + sLineBreak +
              '            MYINDAIA.DBO.TRAP_EMBARQUE                               E   (NOLOCK),               ' + sLineBreak +
              '            MYINDAIA.DBO.TRAP_FORNECIMENTO                           F   (NOLOCK),               ' + sLineBreak +
              '            BROKER.DBO.TMERCADORIA_EXP                  M   (NOLOCK),               ' + sLineBreak +
              '            BROKER.DBO.TCONFIG_PAIS_ACORDO_NORMA_PADRAO A   (NOLOCK),               ' + sLineBreak +
              '            BROKER.DBO.TMERC_EXP_ACORDO                 X   (NOLOCK),               ' + sLineBreak +
              '            BROKER.DBO.TNCM                             NCM (NOLOCK)                ' + sLineBreak +
              '       WHERE R.CD_RAP          = E.CD_RAP                                           ' + sLineBreak +
              '         AND R.CD_RAP_ANO      = E.CD_RAP_ANO                                       ' + sLineBreak +
              '         AND R.CD_GRUPO        = E.CD_GRUPO                                         ' + sLineBreak +
              '         AND E.CD_EMBARQUE     = ''' + qryAutorizadosCD_EMBARQUE.AsString + '''     ' + sLineBreak +
              '         AND E.CD_EMBARQUE_ANO = ''' + qryAutorizadosCD_EMBARQUE_ANO.AsString + ''' ' + sLineBreak +
              '         AND R.CD_RAP          = F.CD_RAP                                           ' + sLineBreak +
              '         AND R.CD_RAP_ANO      = F.CD_RAP_ANO                                       ' + sLineBreak +
              '         AND R.CD_GRUPO        = F.CD_GRUPO                                         ' + sLineBreak +
              '         AND F.CD_MERCADORIA   = M.CD_MERCADORIA                                    ' + sLineBreak +
              '         AND A.CD_PAIS         = R.CD_PAIS                                          ' + sLineBreak +
              '         AND A.CD_NORMA        = X.CD_NORMA                                         ' + sLineBreak +
              '         AND X.CD_ACORDO       = A.CD_ACORDO                                        ' + sLineBreak +
              '         AND X.CD_MERCADORIA   = M.CD_MERCADORIA                                    ' + sLineBreak +
              '         AND M.CD_NCM_SH      *= NCM.CODIGO                                         ' + sLineBreak ;

      SQL.Text := ASql;
      ExecSQL;
      {***}

     { atualiza a mercadoria na TPROCESSO - by carlos 30/08/2010 }
     if qryAutorizadosCD_GRUPO.AsString = '155' then
     begin
      SQL.Clear;
      SQL.Text := ' UPDATE BROKER.DBO.TPROCESSO                                                                                                             ' + sLineBreak +
                  '    SET TX_MERCADORIA = (SELECT STUFF((SELECT CHAR(10) + REPLACE(LTRIM(REPLACE(ISNULL(M.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'')  ' + sLineBreak +
                  '                                                       + '' '' + RTRIM(LTRIM(M.AP_MERCADORIA))                                           ' + sLineBreak +
                  '                                        FROM BROKER.DBO.TPROCESSO_EXP_ITEM PEI (NOLOCK)                                                  ' + sLineBreak +
                  '                                        JOIN BROKER.DBO.TMERCADORIA_EXP    M   (NOLOCK) ON PEI.CD_MERCADORIA = M.CD_MERCADORIA           ' + sLineBreak +
                  '                                       WHERE PEI.NR_PROCESSO   = ' +QuotedStr(vNrProcesso)                                                 + sLineBreak +
                  '                                      FOR XML PATH('''') ), 1, 1, ''''))                                                                 ' + sLineBreak +
                  ' WHERE NR_PROCESSO = ' +QuotedStr(vNrProcesso)                                                                                             + sLineBreak +
                  '  /* AND ISNULL(CONVERT(VARCHAR,TX_MERCADORIA),'''')=''''  */                                                                            ' + sLineBreak ;
     end
     else
     begin
      SQL.Clear;
      SQL.Text := ' UPDATE BROKER.DBO.TPROCESSO                                                                        ' + sLineBreak +
                  '    SET TX_MERCADORIA = ( SELECT MASTER.DBO.ROWCONCAT(DISTINCT RTRIM(LTRIM(M.AP_MERCADORIA))+'';'') ' + sLineBreak +  { RTRIM E LTRIM BY GUILHERME/CARLOS - 01/03/2011}
                  '                            FROM BROKER.DBO.TPROCESSO_EXP_ITEM PEI (NOLOCK),                        ' + sLineBreak +
                  '                                 BROKER.DBO.TMERCADORIA_EXP M (NOLOCK)                              ' + sLineBreak +
                  '                           WHERE PEI.NR_PROCESSO   = ' +QuotedStr(vNrProcesso)                        + sLineBreak +
                  '                             AND PEI.CD_MERCADORIA = M.CD_MERCADORIA )                              ' + sLineBreak +
                  ' WHERE NR_PROCESSO = ' +QuotedStr(vNrProcesso)                                                        + sLineBreak +
                  '   AND ISNULL(CONVERT(VARCHAR,TX_MERCADORIA),"")=""                                                 ' + sLineBreak ;
     end;
      ExecSQL;
     {***}

     { Verifica se existe alguma mercadoria com Anuencia do Exercito - By Carlos }

      // ATUALIZA PESO LIQUIDO UNITARIO
      //o peso da nestle é unitario. nao precisa dividir!
        SQL.Clear;
        SQL.Text := ' UPDATE BROKER.DBO.TPROCESSO_EXP_ITEM                  ' + sLineBreak +
                  '    SET VL_PESO_LIQ_UNIT = VL_TOT_PESO_LIQ/QT_MERCADORIA ' + sLineBreak +
                  '  WHERE NR_PROCESSO = '''+ vNrProcesso +'''              ' + sLineBreak ;
        ExecSQL;
        {***}

      // atualiza a qtde total de itens
      SQL.Clear;
      SQL.Text := ' UPDATE BROKER.DBO.TPROCESSO_EXP                                           ' + sLineBreak +
                  '    SET QT_TOTAL_ITENS = (SELECT COUNT(*)                                  ' + sLineBreak +
                  '                            FROM BROKER.DBO.TPROCESSO_EXP_ITEM (NOLOCK)    ' + sLineBreak +
                  '                           WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso)+') ' + sLineBreak +
                  '  WHERE NR_PROCESSO = '''+ vNrProcesso +'''                                ' + sLineBreak ;
      ExecSQL;
     {***}

      // aqui vai criar a paletização dos itens do processo
      if qryAutorizadosCD_GRUPO.AsString = '028' then
      begin
        SQL.Clear;
        SQL.Add('EXEC MYINDAIA.DBO.SP_RAP_MONTA_PALET '''+ vNrProcesso +''',' + sLineBreak +
                '                        '''+ qryAutorizados.FieldByName('CD_EMBARQUE').AsString
                                            + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString +''' ');
        ExecSQL;
      end;
     {***}

     {*****}
     // Validar se usa hora aqui para não validar em todos os IFs abaixo - Michel - 12/05/2010
     vInHoraEventos := ConsultaLookUPSQL(' SELECT ISNULL(CS.IN_HORA_EVENTOS, ''0'') AS IN_HORA_EVENTOS                    ' +
                                         '   FROM      TCLIENTE_SERVICO CS WITH(NOLOCK)                                   ' +
                                         '  INNER JOIN TPROCESSO        P  WITH(NOLOCK) ON P.CD_SERVICO  = CS.CD_SERVICO  ' +
                                         '                                             AND P.CD_CLIENTE  = CS.CD_CLIENTE  ' +
                                         '                                             AND P.CD_UNID_NEG = CS.CD_UNID_NEG ' +
                                         '                                             AND P.CD_PRODUTO  = CS.CD_PRODUTO  ' +
                                         ' WHERE P.NR_PROCESSO = ' + QuotedStr(vNrProcesso),
                                         'IN_HORA_EVENTOS') = '1';

      // guarda as datas em variáveis
      SQL.Clear;
      SQL.Text := ' SELECT CD_USUARIO_FIM,                                                                                      ' + sLineBreak +
                  '        DT_EMBARQUE,                                                                                         ' + sLineBreak +
                  '        DT_INSPECAO,                                                                                         ' + sLineBreak +
                  '        DT_FATURAMENTO,                                                                                      ' + sLineBreak +
                  '        DT_FECHAMENTO,                                                                                       ' + sLineBreak +
                  '        DT_DDL_DRAFT,                                                                                        ' + sLineBreak +
                  '        DT_DDL_CARGA,                                                                                        ' + sLineBreak +
                  '        DT_PREV_SAIDA,                                                                                       ' + sLineBreak +
                  '        DT_FINALIZADO                                                                                        ' + sLineBreak +
                  '   FROM MYINDAIA.DBO.TRAP (NOLOCK)                                                                                        ' + sLineBreak +
                  '  WHERE CD_RAP+CD_RAP_ANO+CD_GRUPO =                                                                         ' + sLineBreak +
                  '        ( SELECT TOP 1 CD_RAP+CD_RAP_ANO+CD_GRUPO                                                            ' + sLineBreak +
                  '            FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                                      ' + sLineBreak +
                  '           WHERE CD_EMBARQUE+CD_EMBARQUE_ANO  = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString
                                                                       + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString
                                                                       + '''                                                    ' + sLineBreak +
                  '             AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''')                     ' + sLineBreak ;
      Open;

      vCodUserFimRap := Fields[0].AsString; //usuario que autorizou a rap

      if qryAutorizadosCD_GRUPO.AsString = '028' then
        v486 := Fields[1].AsDateTime; // embarque
      // Incluir a hora atual caso não tenha hora no campo - Michel - 06/04/2010

      if TimeOf(v486) = 0 then
        v486 := v486 + Time;
//      v317 := Fields[2].AsDateTime; // inspeção

      v369 := Fields[3].AsDateTime; // faturamento
      // Incluir a hora atual caso não tenha hora no campo - Michel - 06/04/2010

      if TimeOf(v369) = 0 then
        v369 := v369 + Time;
//      v506 := Fields[4].AsDateTime; // fechamento
//      v270 := Fields[5].AsDateTime; // ddl draft
//      v271 := Fields[6].AsDateTime; // ddl carga
//      v131 := Fields[7].AsDateTime; // prev saída
      v113 := Fields[8].AsDateTime; // liberação proc

      // aqui vai alimentar os eventos do FUP
      Close;
      SQL.Clear;
      if (qryAutorizadosCD_GRUPO.AsString = '241') or (qryAutorizadosCD_GRUPO.AsString = '155') then
      begin
        SQL.Text := '  SELECT DT_REALIZACAO,                                                                                           ' + sLineBreak +
                    '         CD_USUARIO_REALIZACAO                                                                                    ' + sLineBreak +
                    '    FROM MYINDAIA.DBO.TRAP_FOLLOWUP (NOLOCK)                                                                                   ' + sLineBreak +
                    '   WHERE CD_EVENTO = ''006''                                                                                      ' + sLineBreak +
                    '     AND CD_RAP+CD_RAP_ANO+CD_GRUPO =                                                                             ' + sLineBreak +
                    '        ( SELECT TOP 1 CD_RAP+CD_RAP_ANO+CD_GRUPO                                                                 ' + sLineBreak +
                    '            FROM MYINDAIA.DBO.TRAP_EMBARQUE (NOLOCK)                                                                           ' + sLineBreak +
                    '           WHERE CD_EMBARQUE+CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString +
                                                                          qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + ''' ' + sLineBreak +
                    '             AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + ''')                          ' + sLineBreak ;
        Open;
        vCodUserFimRap := Fields[1].AsString;   //usuario que autorizou a rap
        v486           := Fields[0].AsDateTime; // embarque

        Close;
        SQL.Clear;
      end;

      if (not (qryAutorizadosCD_GRUPO.AsString = '155')) then
      begin
        aSql := '';
        if vInHoraEventos then
        begin
          aSql := ' UPDATE BROKER.DBO.TFOLLOWUP                            ' + sLineBreak +
                  '    SET DT_REALIZACAO      = :DATA,                     ' + sLineBreak +
                  '        CD_RESP_REALIZACAO = ''' + vCodUserFimRap + ''' ' + sLineBreak;
        end
        else
          aSql := ' UPDATE BROKER.DBO.TFOLLOWUP                                                       ' + sLineBreak +
                  '    SET DT_REALIZACAO      = CONVERT(DATETIME, CONVERT(VARCHAR, :DATA, 103), 103), ' + sLineBreak +
                  '        CD_RESP_REALIZACAO = ''' + vCodUserFimRap + '''                            ' + sLineBreak ;

        aSql := aSql + '  WHERE NR_PROCESSO = ''' + vNrProcesso + ''' ' + sLineBreak +
                       '    AND CD_EVENTO   = :EVENTO                 ' + sLineBreak ;

        SQL.Text := aSql;
        // Evento 113
        if (v113 > 0) then
        begin
          ParamByName('DATA').AsDateTime := v113;
          ParamByName('EVENTO').AsString := '113';
          ExecSQL;
        end;
        // Evento 369
        if v369 > 0 then
        begin
          ParamByName('DATA').AsDateTime := v369;
          ParamByName('EVENTO').AsString := '369';
          ExecSQL;
        end;
        // Evento 486
        if v486 > 0 then
        begin
          ParamByName('DATA').AsDateTime := v486;
          ParamByName('EVENTO').AsString := '486';
          ExecSQL;
        end;


        // recalcula previstas no FUP
        SQL.Clear;
        SQL.Add('EXEC BROKER.DBO.SP_ATZ_FOLLOWUP ''' + vNrProcesso + '''');
        ExecSQL;
        {***}
      end;

      // altera o status da tabela de rap e vincula o processo
      SQL.Clear;
      SQL.Text :=  ' UPDATE R                                                                                       ' + sLineBreak +
                   '    SET R.CD_STATUS    = ''3'',                                                                 ' + sLineBreak + // status de Integrado, pois aí mostra o número do processo vinculado la no site
                   '        R.NR_PROCESSO  = '''+ vNrProcesso+'''                                                   ' + sLineBreak +
                   '   FROM MYINDAIA.DBO.TRAP          R (NOLOCK),                                                               ' + sLineBreak +
                   '        MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK)                                                                ' + sLineBreak +
                   '  WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = E.CD_RAP+E.CD_RAP_ANO+E.CD_GRUPO                     ' + sLineBreak +
                   '    AND E.CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''      ' + sLineBreak +
                   '    AND E.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''  ' + sLineBreak +
                   '    AND E.CD_GRUPO        = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''         ' + sLineBreak ;
      ExecSQL;

      SQL.Clear;
      SQL.Text := 'UPDATE MYINDAIA.DBO.TRAP_EMBARQUE                                                                        ' + sLineBreak +
                  '   SET CD_STATUS       = ''3'',                                                             ' + sLineBreak + // para sumir da listagem de RAPs autorizadas para embarcar
                  '       CD_USUARIO_FIM  = '''+str_cd_usuario+''',                                            ' + sLineBreak +
                  '       DT_FINALIZADO   = GETDATE()                                                          ' + sLineBreak +
                  ' WHERE CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString     + ''' ' + sLineBreak +
                  '   AND CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + ''' ' + sLineBreak +
                  '   AND CD_GRUPO        = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString        + ''' ' + sLineBreak ;
      ExecSQL;
      {***}


      //caso seja um reemissão de Documentos
      Close;
      SQL.Clear;
      SQL.Text := ' SELECT R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO                                                                ' + sLineBreak +
                  '   FROM MYINDAIA.DBO.TRAP          R (NOLOCK),                                                                       ' + sLineBreak +
                  '        MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK)                                                                        ' + sLineBreak +
                  '  WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(E.CD_RAP))+RTRIM(LTRIM(E.CD_RAP_ANO))+E.CD_GRUPO ' + sLineBreak +
                  '    AND E.CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString     + '''          ' + sLineBreak +
                  '    AND E.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''          ' + sLineBreak +
                  '    AND E.CD_GRUPO        = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString        + '''          ' + sLineBreak ;
      Open;

      //no caso de consolidado são várias RAP´s
      while not Eof do
      begin
        //é uma reemissão
        vQryAux              := TQuery.Create(application);
        vQryAux.Databasename := 'DBBROKER';
        vQryAux.Close;
        vQryAux.SQL.Clear;
        vQryAux.SQL.Text := ' UPDATE MYINDAIA.DBO.TRAP_DOCUMENTACAO                                                                     ' + sLineBreak +
                            '    SET CD_STATUS = ''0''                                                                     ' + sLineBreak +
                            '  WHERE RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO = '''+ Fields[0].AsString +''' ' + sLineBreak +
                            '    AND CD_STATUS IN (''1'', ''2'')                                                           ' + sLineBreak ;
        vQryAux.ExecSQL;
        vQryAux.Close;
        vQryAux.Free;
        Next;
      end;
      {***}

      //Insere na TRAP_FOLLOWUP - Guilherme 11/02/2010
      Close;
      SQL.Clear;
      SQL.Text := ' SELECT R.CD_RAP,                                                                                                                ' + sLineBreak +
                  '        R.CD_RAP_ANO,                                                                                                            ' + sLineBreak +
                  '        G.IN_MOSTRA_FOLLOWUP                                                                                                     ' + sLineBreak +
                  '   FROM       MYINDAIA.DBO.TRAP          R (NOLOCK)                                                                                           ' + sLineBreak +
                  '   INNER JOIN MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK) ON R.CD_RAP + R.CD_RAP_ANO + R.CD_GRUPO = RTRIM(LTRIM(E.CD_RAP))+                         ' + sLineBreak +
                  '                                                                                 RTRIM(LTRIM(E.CD_RAP_ANO))+                     ' + sLineBreak +
                  '                                                                                 E.CD_GRUPO                                      ' + sLineBreak +
                  '   INNER JOIN BROKER.DBO.TGRUPO        G (NOLOCK) ON G.CD_GRUPO = R.CD_GRUPO                                                                ' + sLineBreak +
                  '                                      AND E.CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''     ' + sLineBreak +
                  '                                      AND E.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + ''' ' + sLineBreak +
                  '                                      AND E.CD_GRUPO        = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''        ' + sLineBreak ;
      Open;
      str_cd_rap          := Fields[0].asString;
      str_cd_rap_ano      := Fields[1].asString;
      str_mostra_followup := Fields[2].asString;
      Close;

      if str_mostra_followup = '1' then
      begin
        SQL.Clear;
        SQL.Text := 'INSERT INTO MYINDAIA.DBO.TRAP_FOLLOWUP (CD_RAP,                  ' + sLineBreak +
                    '                           CD_RAP_ANO,              ' + sLineBreak +
                    '                           CD_GRUPO,                ' + sLineBreak +
                    '                           CD_EVENTO,               ' + sLineBreak +
                    '                           DT_REALIZACAO,           ' + sLineBreak +
                    '                           CD_USUARIO_REALIZACAO)   ' + sLineBreak +
                    ' VALUES('''+ str_cd_rap                       +''', ' + sLineBreak +
                    '        '''+ str_cd_rap_ano                   +''', ' + sLineBreak +
                    '        '''+ qryAutorizadosCD_GRUPO.AsString  +''', ' + sLineBreak +
                    '        ''007'',                                    ' + sLineBreak +
                    '        GETDATE(),                                  ' + sLineBreak +
                    '        '''+str_cd_usuario+''')                     ';
        ExecSQL;

        //Evento 608 - Guilherme 15/09/2010
        SQL.Clear;
        SQL.Text := '  UPDATE F                                                              ' + sLineBreak +
                    '     SET F.DT_REALIZACAO      = R.DT_EVENTO,                            ' + sLineBreak +
                    '         F.CD_RESP_REALIZACAO = R.CD_RESP                               ' + sLineBreak +
                    '  FROM BROKER.DBO.TFOLLOWUP F,                                          ' + sLineBreak +
                    '      (SELECT MAX(DT_REALIZACAO)    AS DT_EVENTO                        ' + sLineBreak +
                    '            , CD_USUARIO_REALIZACAO AS CD_RESP                          ' + sLineBreak +
                    '         FROM MYINDAIA.DBO.TRAP_FOLLOWUP (nolock)                                    ' + sLineBreak +
                    '        WHERE CD_RAP     = '''+ str_cd_rap +'''                         ' + sLineBreak +
                    '          AND CD_RAP_ANO = ''' + str_cd_rap_ano + '''                   ' + sLineBreak +
                    '          AND CD_GRUPO   = ''' + qryAutorizadosCD_GRUPO.AsString + '''  ' + sLineBreak +
                    '          AND CD_EVENTO  = ''005''                                      ' + sLineBreak +
                    '     GROUP BY CD_USUARIO_REALIZACAO ) R                                 ' + sLineBreak +
                    '  WHERE F.CD_EVENTO   = ''608''                                         ' + sLineBreak +
                    '    AND F.NR_PROCESSO = ''' + vNrProcesso + '''                         ' + sLineBreak ;
        ExecSQL;

        //Evento 609 - Guilherme 15/09/2010
        SQL.Clear;
        SQL.Text :=  '  UPDATE F                                                             ' + sLineBreak +
                     '     SET F.DT_REALIZACAO      = R.DT_EVENTO,                           ' + sLineBreak +
                     '         F.CD_RESP_REALIZACAO = R.CD_RESP                              ' + sLineBreak +
                     '  FROM BROKER.DBO.TFOLLOWUP F,                                         ' + sLineBreak +
                     '      (SELECT MAX(DT_REALIZACAO)    AS DT_EVENTO,                      ' + sLineBreak +
                     '              CD_USUARIO_REALIZACAO AS CD_RESP                         ' + sLineBreak +
                     '         FROM MYINDAIA.DBO.TRAP_FOLLOWUP (nolock)                                   ' + sLineBreak +
                     '        WHERE CD_RAP     = ''' + str_cd_rap +'''                       ' + sLineBreak +
                     '          AND CD_RAP_ANO = ''' + str_cd_rap_ano + '''                  ' + sLineBreak +
                     '          AND CD_GRUPO   = ''' + qryAutorizadosCD_GRUPO.AsString + ''' ' + sLineBreak +
                     '          AND CD_EVENTO  = ''006''                                     ' + sLineBreak +
                     '     GROUP BY CD_USUARIO_REALIZACAO ) R                                ' + sLineBreak +
                     '  WHERE F.CD_EVENTO = ''609''                                          ' + sLineBreak +
                     '    AND F.NR_PROCESSO = ''' + vNrProcesso + '''                        ' + sLineBreak ;
        ExecSQL;
      end;
      {***}

      //Cria Nr Fatura Nestle.
      ProcessamentoNestle(vNrProcesso);

      Application.MessageBox('Embarque integrado com sucesso!',
                             'Integração com sucesso',
                              MB_OK + MB_ICONINFORMATION);

      //Alerta de Drawback - by Carlos 07/01/2010
      if qryAutorizadosCD_GRUPO.AsString = '028' then
         if flag_existe_drawback then
            ShowMessage('ATENÇÃO: Integração com "DRAWBACK" ');

      if flag_existe_anuencia_exercito then
         ShowMessage('ATENÇÃO: Existe(m) mercadoria(s) com "Anuência do Exército" !!');

    except
      on e:exception do
      begin
        if datm_main.db_broker.intransaction then
          datm_main.db_broker.RollBack;

        MessageDlg('Erro executando operação!'#13+ e.Message,mtError,[mbOk],0);
      end;
    end;

    //Free;
    close;
    qryAutorizados.Close;
    qryAutorizados.Open;
  end;
end;

procedure TfrmExpIntegraRAP.btnEstornarClick(Sender: TObject);
var
  vNrCont : integer;
  vQuery : TQuery;
begin
  if qryautorizados.RecordCount=0 then
  begin
     showmessage('Não existe Fatura para Estornar!!!');
     exit;
  end;


  if Application.MessageBox('Deseja realmente estornar esta Instrução?', 'Estorno de Instrução de Embarque!', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    vQuery := TQuery.Create(Application);
    vQuery.DatabaseName := 'DBBROKER';
    vQuery.Name         := 'qyrRenumFornec';

    // altera o status da tabela de rap e vincula o processo
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      //caso fatura já tenha sido emitida, é considerado um estorno, caso não, apenas volta a rap para em aberto
      SQL.Clear;
      SQL.Add('UPDATE R SET');
      SQL.Add('  R.IN_DOCTO_ESTORNO   = ''1'' '); // status de edição, ou seja, ele volta pro site como se não tivesse sido autorizado
      SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK), BROKER.DBO.TFOLLOWUP F (NOLOCK)');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(E.CD_RAP))+RTRIM(LTRIM(E.CD_RAP_ANO))+E.CD_GRUPO');
      SQL.Add('  AND E.CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''');
      SQL.Add('  AND E.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''');
      SQL.Add('  AND E.CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''');
      SQL.Add('  AND F.CD_EVENTO = ''117'' AND F.NR_PROCESSO = R.NR_PROCESSO AND ISNULL(DT_REALIZACAO, '''') <> '''' ');
      ExecSQL;
      SQL.Clear;
      SQL.Add('UPDATE R SET');
      SQL.Add('  R.CD_STATUS   = ''1'','); // status de edição, ou seja, ele volta pro site como se não tivesse sido autorizado
      SQL.Add('  R.NR_PROCESSO = null');
      SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK)');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = E.CD_RAP+E.CD_RAP_ANO+E.CD_GRUPO');
      SQL.Add('  AND E.CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''');
      SQL.Add('  AND E.CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''');
      SQL.Add('  AND E.CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''');
      ExecSQL;
      SQL.Clear;
      SQL.Add('UPDATE MYINDAIA.DBO.TRAP_EMBARQUE SET');
      SQL.Add('  CD_STATUS       = ''0'','); // para sumir da listagem de RAPs autorizadas para embarcar
      SQL.Add('  CD_USUARIO_CANC = '''+str_cd_usuario+''',');
      SQL.Add('  DT_CANCELADO    = CONVERT(datetime, CONVERT(varchar, GETDATE(), 103),103)');
      SQL.Add('WHERE CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''');
      SQL.Add('  AND CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''');
      SQL.Add('  AND CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''');
      ExecSQL;
      //renumera os itens do fornecimento que forem de raps diferentes
      SQL.Clear;
      SQL.Add('SELECT COUNT(*), E.CD_RAP+E.CD_RAP_ANO+E.CD_GRUPO');
      SQL.Add('FROM MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK), MYINDAIA.DBO.TRAP_FORNECIMENTO F (NOLOCK)');
      SQL.Add('WHERE CD_EMBARQUE     = ''' + qryAutorizados.FieldByName('CD_EMBARQUE').AsString + '''');
      SQL.Add('  AND CD_EMBARQUE_ANO = ''' + qryAutorizados.FieldByName('CD_EMBARQUE_ANO').AsString + '''');
      SQL.Add('  AND E.CD_GRUPO = ''' + qryAutorizados.FieldByName('CD_GRUPO').AsString + '''');
      SQL.Add('  AND E.CD_RAP+E.CD_RAP_ANO+E.CD_GRUPO = F.CD_RAP+F.CD_RAP_ANO+F.CD_GRUPO');
      SQL.Add('GROUP BY E.CD_RAP+E.CD_RAP_ANO+E.CD_GRUPO');
      SQL.Add('ORDER BY COUNT(*) DESC');
      Open;
      if RecordCount > 1 then begin
        vNrCont := Fields[0].AsInteger;
        Next;
        while not Eof do begin
          vQuery.SQL.Clear;
          vQuery.SQL.Add('UPDATE MYINDAIA.DBO.TRAP_FORNECIMENTO SET');
          vQuery.SQL.Add('  CD_ITEM = RIGHT(''000''+(CD_ITEM - '+IntToStr(vNrCont)+'), 3)');
          vQuery.SQL.Add('WHERE CD_RAP+CD_RAP_ANO+CD_GRUPO = '''+Fields[1].AsString+'''');
          vQuery.ExecSQL;
          vNrCont := vNrCont + Fields[0].AsInteger;
          Next;
        end;
      end;
      Close;
      Free;
    end;
    vQuery.Free;
    qryAutorizados.Close;
    qryAutorizados.Open;
  end;
end;

procedure TfrmExpIntegraRAP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //dbWeb.Connected := false;
 // dbWeb.Free;
 // ssnWebz.Close;
 // ssnWebz.free;
  Action := caFree;    
end;

procedure TfrmExpIntegraRAP.btn_sairClick(Sender: TObject);
begin
  qryAutorizados.Close;
  Close;
end;

procedure TfrmExpIntegraRAP.edtCdUnidadeChange(Sender: TObject);
begin
  edtNmUnidade.Text := ConsultaLookUp('TUNID_NEG','CD_UNID_NEG',edtCdUnidade.Text,'NM_UNID_NEG');
end;

procedure TfrmExpIntegraRAP.mskCdProdutoChange(Sender: TObject);
begin
  edtNmProduto.Text := ConsultaLookUp('TPRODUTO','CD_PRODUTO',mskCdProduto.Text,'NM_PRODUTO');
end;

procedure TfrmExpIntegraRAP.FormCreate(Sender: TObject);
//var
 // BDEParams: TStrings;
 // Server: String;
begin
  {ssnWebz.Open;
  BDEParams := TStringList.Create;

  datm_main.db_broker.Session.GetAliasParams('DBBROKER', BDEParams);
  Server := BDEParams.Values['SERVER NAME'];

  dbWeb.Session.GetAliasParams('MYINDAIA', BDEParams);

  if (not SameText(BDEParams.Values['SERVER NAME'], Server)) then
  begin
   BDEParams.Values['SERVER NAME'] := Server;
   dbWeb.Close;
   dbWeb.Session.ModifyAlias('MYINDAIA', BDEParams);
  end;  }

  {
  if CriaAlias('MYINDAIA',BDEParams.Values['SERVER NAME'],ssnWeb) then begin
    dbWeb.Connected := true;
    qryAutorizados.Open;
  end
  else
    Application.MessageBox('Erro ao verificar embarques disponíveis para integração!'
      + #13#10 + 'Entre em contato com o suporte.', 'Erro', MB_OK + MB_ICONSTOP);
  }
  //FreeAndNil(BDEParams);
end;

procedure TfrmExpIntegraRAP.btnIntegrarDocClick(Sender: TObject);
var
  vNrProcesso : String[18];
  vAuxMercadoria : string;
  vPesoLiquido, vPesoBruto, vFrete, vSeguro, vAcrescimo, vDesconto, vCubagem, vComissao, vFob, vQtdeProduto : Real;
  vQryAux: Tquery;
  vNrItem: integer;

  function InsereMercadorias(pMercadorias : String) : Boolean;
  var
    vMercAux, vMercOldAux, vRAP, vTextoPort, vTextoIng, vTextoEsp, vTextoCJ : string;
    i : Integer;
  begin
    Result := True;
    for i:= 0 to ContaOcorrencias(pMercadorias,',') do
    begin
      vMercAux := Trim(ExtractWord(i+1,pMercadorias,','));
      // se tem na DePara
//      vRAP := ConsultaLookUpSQL('SELECT TOP 1 CD_RAP+CD_RAP_ANO RAP FROM TRAP_DOCUMENTACAO (nolock) WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''','RAP');
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';

        SQL.Clear;
        SQL.Add('SELECT TOP 1 LTRIM(RTRIM(RD.CD_RAP))+LTRIM(RTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO RAP');
        SQL.Add('  FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (nolock), MYINDAIA.DBO.TPE_ITEM PEI (NOLOCK)');
        SQL.Add(' WHERE RD.NR_AUT_DOCTO+RD.NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
        SQL.Add('   AND PEI.CD_PRODUTO = ''' + vMercAux + ''' AND LTRIM(RTRIM(PEI.CD_RAP))+LTRIM(RTRIM(PEI.CD_RAP_ANO))+PEI.CD_GRUPO = RD.CD_RAP+RD.CD_RAP_ANO+RD.CD_GRUPO');
        Open;
        vRAP := Fields[0].AsString;
        Close;
        Free;
      end;

      with TQuery.Create(application) do
      begin
        // busca descrições integradas na RAP
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT TOP 1 REPLACE(TX_DESC,"''",""), REPLACE(TX_DESC_ING,"''",""), REPLACE(TX_DESC_ESP,"''",""), REPLACE(TX_DESC_CJ,"''","")');
        SQL.Add('  FROM MYINDAIA.DBO.TPE_ITEM (nolock)');
        SQL.Add(' WHERE CD_PRODUTO = ''' + vMercAux + '''');
        SQL.Add('   AND LTRIM(RTRIM(CD_RAP))+LTRIM(RTRIM(CD_RAP_ANO))+CD_GRUPO = ''' + vRAP + '''');
        Open;
        vTextoPort := Fields[0].AsString;
        vTextoIng  := Fields[1].AsString;
        vTextoEsp  := Fields[2].AsString;
        vTextoCJ   := Fields[3].AsString;
        if ( trim(vTextoPort) = '' ) or ( trim(vTextoIng) = '' ) or ( trim(vTextoEsp) = '' ) then
        begin
          Result := False;
          exit;
        end;
        Close;
        Free;
      end;

      vMercOldAux := ConsultaLookupsql('SELECT TOP 1 MATERIALOLD FROM XLS_SGA_MERC_EXP (nolock) WHERE MATERIAL = ''' + vMercAux + ''' AND IN_ANTIGO_CADASTRADO = ''1''','MATERIALOLD');

      if vMercOldAux <> '' then
      begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          // replica com o novo codigo e as descrições da RAP
          SQL.Clear;
          SQL.Add('INSERT INTO TMERCADORIA_EXP ( CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, VL_UNITARIO, CD_UN_MED_COMERC, CD_NCM_SH, CD_NALADI_SH, CD_NALADI_NCCA, PL_MERCADORIA,');
          SQL.Add('                              CD_EXPORTADOR, CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_FABRICANTE, CD_IMPORTADOR, CD_GRUPO, CD_FABR_EXPO, CD_TIPO_CALCULO, CD_MATERIAL,');
          SQL.Add('                              IN_NECESSITA_LI, CD_FAMILIA_PROD, CD_MOEDA, CD_EMBALAGEM, QT_POR_EMBALAGEM, CD_CATEGORIA_TEXTIL, CD_FINALIDADE_MERC, CD_UF_PRODUTOR,');
          SQL.Add('                              TX_DESC_INGLES, TX_DESC_ESP, PB_MERCADORIA, NR_LINHA, CD_COR, CD_AREA, IN_DRAWBACK_INDAIA, CD_USUARIO_CRIACAO, DT_CRIACAO,');
          SQL.Add('                              CD_USUARIO_ULT_ALTERACAO, DT_ULT_ALTERACAO, IN_ATIVO )');
          SQL.Add('                       SELECT ''' + vMercAux + ''', ''' + vTextoPort + ''', ''' + Copy(vTextoPort,1,25) + ''', VL_UNITARIO, CD_UN_MED_COMERC, CD_NCM_SH, CD_NALADI_SH, CD_NALADI_NCCA, PL_MERCADORIA,');
          SQL.Add('                              CD_EXPORTADOR, CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_FABRICANTE, CD_IMPORTADOR, ''028'', CD_FABR_EXPO, CD_TIPO_CALCULO, CD_MATERIAL,');
          SQL.Add('                              IN_NECESSITA_LI, CD_FAMILIA_PROD, CD_MOEDA, CD_EMBALAGEM, QT_POR_EMBALAGEM, CD_CATEGORIA_TEXTIL, CD_FINALIDADE_MERC, CD_UF_PRODUTOR,');
          SQL.Add('                              ''' + vTextoIng + ''', ''' + vTextoEsp + ''', PB_MERCADORIA, NR_LINHA, CD_COR, CD_AREA, IN_DRAWBACK_INDAIA, ''0707'', GETDATE(),');
          SQL.Add('                              null, null, ''1''');
          SQL.Add('                         FROM TMERCADORIA_EXP (nolock)');
          SQL.Add('                        WHERE CD_MERCADORIA = ''' + vMercOldAux + '''');
          ExecSQL;
          Free;
        end;
      end
      else
      begin // se não tem
        // cadastra com as descrições e o código novo, vindos da RAP
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          // busca descrições integradas na RAP
          SQL.Clear;
          SQL.Add('INSERT INTO TMERCADORIA_EXP ( CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, ');
          SQL.Add('                              CD_GRUPO, TX_DESC_INGLES, TX_DESC_ESP, CD_USUARIO_CRIACAO, DT_CRIACAO,');
          SQL.Add('                              CD_USUARIO_ULT_ALTERACAO, DT_ULT_ALTERACAO, IN_ATIVO )');
          SQL.Add('                     VALUES (''' + vMercAux + ''',''' + vTextoPort + ''',''' + Copy(vTextoPort,1,25) + ''',');
          SQL.Add('                             ''028'',''' + vTextoIng + ''',''' + vTextoEsp + ''',''0707'',GETDATE(),');
          SQL.Add('                             null, null, ''1'')');
          try
            ExecSQL;
          except
          end;
          Free;
        end;
      end;
    end;
  end;

  function InsereAcordos(pMercadorias : String) : Boolean;
  var
    vMercAux, vPaisAux, vRAP, vTX_DESC, vTX_DESC_ING, vTX_DESC_ESP : string;
    i : Integer;
  begin
    Result := True;
    for i:= 0 to ContaOcorrencias(pMercadorias,',') do
    begin
      vMercAux := Trim(ExtractWord(i+1,pMercadorias,','));
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';

        SQL.Clear;
        SQL.Add('SELECT TOP 1 LTRIM(RTRIM(RD.CD_RAP))+LTRIM(RTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO RAP');
        SQL.Add('  FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (nolock), MYINDAIA.DBO.TPE_ITEM PEI (NOLOCK)');
        SQL.Add(' WHERE RD.NR_AUT_DOCTO+RD.NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
        SQL.Add('   AND PEI.CD_PRODUTO = ''' + vMercAux + ''' AND LTRIM(RTRIM(PEI.CD_RAP))+LTRIM(RTRIM(PEI.CD_RAP_ANO))+PEI.CD_GRUPO = LTRIM(RTRIM(RD.CD_RAP))+LTRIM(RTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO');
        Open;
        vRAP := Fields[0].AsString;
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT CD_PAIS FROM MYINDAIA.DBO.TRAP (nolock) WHERE CD_RAP+CD_RAP_ANO+CD_GRUPO = ''' + vRAP + '''');
        Open;
        vPaisAux := Fields[0].AsString;
        Close;
        Free;
      end;
      // agora cadastra os acordos/normas necessários
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        // busca na TCONFIG_PAIS_ACORDO_NORMA_PADRAO os registros para o pais e
        // insere na TMERC_EXP_ACORDO os acordos necessários com as descrições nos idiomas da tabela acima
        SQL.Clear;
        SQL.Add(' SELECT REPLACE(TX_DESC,"''","") TX_DESC, REPLACE(TX_DESC_ING,"''","") TX_DESC_ING, REPLACE(TX_DESC_ESP,"''","") TX_DESC_ESP, REPLACE(TX_MARCACAO,"''","") TX_MARCACAO, REPLACE(TX_MARCACAO_COMPL,"''","") TX_MARCACAO_COMPL');
        SQL.Add('   FROM MYINDAIA.DBO.TPE_ITEM (nolock)');
        SQL.Add('  WHERE CD_PRODUTO = ''' + vMercAux + '''');
        SQL.Add('    AND LTRIM(RTRIM(CD_RAP))+LTRIM(RTRIM(CD_RAP_ANO))+CD_GRUPO = ''' + vRAP + '''');
        Open;
        vTX_DESC           := FieldByName('TX_DESC').AsString + ' ' + FieldByName('TX_MARCACAO').AsString + ' ' + FieldByName('TX_MARCACAO_COMPL').AsString;
        vTX_DESC_ING       := FieldByName('TX_DESC_ING').AsString + ' ' + FieldByName('TX_MARCACAO').AsString + ' ' + FieldByName('TX_MARCACAO_COMPL').AsString;
        vTX_DESC_ESP       := FieldByName('TX_DESC_ESP').AsString + ' ' + FieldByName('TX_MARCACAO').AsString + ' ' + FieldByName('TX_MARCACAO_COMPL').AsString;
        if ( trim(vTX_DESC) = '' ) or ( trim(vTX_DESC_ING) = '' ) or ( trim(vTX_DESC_ESP) = '' ) then
        begin
          Result := False;
          exit;
        end;
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TMERC_EXP_ACORDO (CD_MERCADORIA, CD_ACORDO, CD_NORMA, TX_MERCADORIA)');
        SQL.Add('SELECT TOP 1 ''' + vMercAux + ''', CD_ACORDO, CD_NORMA,');
        SQL.Add('       CASE CD_IDIOMA');
        SQL.Add('         WHEN ''0'' THEN ''' + vTX_DESC     + '''');
        SQL.Add('         WHEN ''1'' THEN ''' + vTX_DESC_ING + '''');
        SQL.Add('         WHEN ''2'' THEN ''' + vTX_DESC_ESP + '''');
        SQL.Add('       END TX_MERCADORIA');
        SQL.Add('  FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO CP (nolock)');
        SQL.Add(' WHERE CD_PAIS = ''' + vPaisAux + '''');
        SQL.Add('   AND CD_ACORDO+CD_NORMA NOT IN ( SELECT CD_ACORDO+CD_NORMA FROM TMERC_EXP_ACORDO (nolock) WHERE CD_MERCADORIA = ''' + vMercAux + ''' )');
        ExecSQL;
        Free;
      end;
    end;
  end;

begin
  vNrProcesso := edtCdUnidade.Text + mskCdProduto.Text + edtProcesso.Text;
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';

      // faz algumas checagens obrigatórias antes de começar a integração
      SQL.Clear;
      SQL.Add('SELECT COUNT(*)');
      SQL.Add('  FROM MYINDAIA.DBO.TPE_ITEM PE (NOLOCK)');
      SQL.Add(' WHERE RTRIM(LTRIM(PE.CD_RAP))+RTRIM(LTRIM(PE.CD_RAP_ANO))+PE.CD_GRUPO IN ');
      SQL.Add('       (SELECT TOP 1 RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO ');
      SQL.Add('          FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK)');
      SQL.Add('         WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''')');
      SQL.Add('   AND ( CD_MOEDA NOT IN ( SELECT CD_EXTERNO FROM BROKER.DBO.TDE_PARA (NOLOCK) WHERE CD_TABELA = ''21'') OR');
      SQL.Add('         CD_UNID_MEDIDA NOT IN ( SELECT CD_EXTERNO FROM BROKER.DBO.TDE_PARA (NOLOCK) WHERE CD_TABELA = ''20'') )');
      Open;
      if Fields[0].AsInteger > 0 then
      begin
        Application.MessageBox('Foram encontrados alguns problemas na autorização, relacionados a tabela DePara.' + #13#10 +
                               'Verifique se existe DePara cadastrado para as Unidades de Medida e Moedas nessa(s) RAP(s).',
                               'Problemas na Integração!', MB_OK + MB_ICONSTOP);
        Exit;
      end;
      Close;
      // atualiza a tprocesso campo IN_COURRIER
      SQL.Clear;
      SQL.Add('UPDATE PR SET PR.IN_COURRIER = R.IN_COURRIER');
      SQL.Add('FROM BROKER.DBO.TPROCESSO PR, MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_DOCUMENTACAO RD  (NOLOCK)');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO');
      SQL.Add('  AND RD.NR_AUT_DOCTO    = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
      SQL.Add('  AND RD.NR_AUT_DOCTO_ANO = = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
      SQL.Add('  AND PR.NR_PROCESSO = ''' + Trim(edtCdUnidade.Text) + Trim(mskCdProduto.Text) + Trim(edtProcesso.Text) + '''');
      ExecSQL;
      Close;

      //verifica se já existem itens no processo
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_EXP_ITEM (nolock) WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
      Open;
      if Fields[0].AsInteger > 0 then
      begin
        Application.MessageBox('Já existem itens para esse processo, não será possível continuar a Integração!',
          'Error', MB_OK + MB_ICONSTOP);
        Exit;
      end;
      Close;
      // verifica se as mercadorias estão cadastradas
      SQL.Clear;
      SQL.Add('SELECT DISTINCT PE.CD_PRODUTO' );
      SQL.Add('  FROM MYINDAIA.DBO.TPE_ITEM PE (NOLOCK)' );
      SQL.Add(' WHERE PE.CD_PRODUTO NOT IN (SELECT CD_MERCADORIA FROM BROKER.DBO.TMERCADORIA_EXP (NOLOCK))' );
      SQL.Add('   AND RTRIM(LTRIM(PE.CD_RAP))+RTRIM(LTRIM(PE.CD_RAP_ANO))+PE.CD_GRUPO IN (SELECT RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO' );
      SQL.Add('			      WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''')' );
      Open;
      if not IsEmpty then
      begin
        vAuxMercadoria := '';
        while not eof do
        begin
          vAuxMercadoria := vAuxMercadoria + Fields[0].AsString + ',';
          Next;
        end;
        if not InsereMercadorias(vAuxMercadoria) then
        begin
          Application.MessageBox(PChar('Existem mercadorias sem descrição em um ou mais idiomas. Fvr estornar e solicitar ao cliente o reenvio das informações.'), 'Error', MB_OK + MB_ICONSTOP);
          Exit;
        end;
      end;

      Close;

      // verifica se os acordos/normas estão cadastrados
      SQL.Clear;
      SQL.Add('SELECT DISTINCT PE.CD_PRODUTO FROM MYINDAIA.DBO.TPE_ITEM PE (NOLOCK)');
      SQL.Add(' WHERE RTRIM(LTRIM(PE.CD_RAP))+RTRIM(LTRIM(PE.CD_RAP_ANO))+PE.CD_GRUPO IN ( SELECT RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO ');
      SQL.Add(' FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO (nolock) WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''')' );
      SQL.Add('   AND PE.CD_PRODUTO NOT IN ( SELECT CD_MERCADORIA');
      SQL.Add('                                FROM BROKER.DBO.TMERC_EXP_ACORDO M (NOLOCK),');
      SQL.Add('                                     BROKER.DBO.TNORMAS N (NOLOCK),');
      SQL.Add('                                     BROKER.DBO.TACORDO_PAIS A (NOLOCK)');
      SQL.Add('                               WHERE M.CD_NORMA  = N.CODIGO');
      SQL.Add('                                 AND N.CD_PAIS   = (SELECT DISTINCT CD_PAIS');
      SQL.Add('                                                      FROM MYINDAIA.DBO.TRAP (nolock)');
      SQL.Add('                                                     WHERE CD_RAP+CD_RAP_ANO+CD_GRUPO IN ( SELECT RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO (nolock) WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''))' );
      SQL.Add('                                 AND M.CD_MERCADORIA IN (SELECT DISTINCT CD_PRODUTO');
      SQL.Add('                                                           FROM MYINDAIA.DBO.TPE_ITEM (nolock)');
      SQL.Add('                                                          WHERE RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO IN ( SELECT RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO (nolock) ');
      SQL.Add('                                                                                                                         WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''))' );
      SQL.Add('                                 AND M.CD_ACORDO = A.CD_ACORDO');
      SQL.Add('                                 AND A.CD_PAIS   = N.CD_PAIS )');
      Open;
      vAuxMercadoria := '';
      if NOT isEmpty then
      begin
        while not eof do
        begin
          vAuxMercadoria := vAuxMercadoria + Fields[0].AsString + ',';
          Next;
        end;
        if not InsereAcordos(vAuxMercadoria) then
        begin
          Application.MessageBox(PChar('Existem mercadorias sem descrição em um ou mais idiomas. Fvr estornar e solicitar ao cliente o reenvio das informações.'), 'Error', MB_OK + MB_ICONSTOP);
          Exit;
        end;
      end;

      Close;
      // verifica se o processo integrado não é diferente do que já foi integrado
      SQL.Clear;
      SQL.Add('SELECT ISNULL(R.NR_PROCESSO, '''') AS PROCESSO FROM MYINDAIA.DBO.TRAP R (NOLOCK) WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO IN ( SELECT RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO ');
      SQL.Add(' FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO (nolock) WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''')' );
      Open;
      if Fields[0].AsString <> '' then
      begin
        if Fields[0].AsString <> vNrProcesso then
        begin
          Application.MessageBox(PChar('A instrução não será autorizada pois a mesma foi previamente autorizada para o Processo: ' + Copy(Fields[0].AsString,5,10)),
          'Error', MB_OK + MB_ICONSTOP);
          Exit;
        end;
      end;

      Close;
      // começando a integração, primeiro deletando qualquer coisa que tenha la no processo
      SQL.Clear;
      SQL.Add('DELETE FROM BROKER.DBO.TPROCESSO_EXP WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
      SQL.Add('DELETE FROM BROKER.DBO.TPROCESSO_EXP_PEDIDO WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
      ExecSQL;
      // aqui vai fazer a integração da CAPA do processo
      SQL.Clear;
      SQL.Add('INSERT INTO BROKER.DBO.TPROCESSO_EXP ( NR_PROCESSO, CD_EXPORTADOR, TX_LOGOMARCA, IN_FABR_EXPO, ');
      SQL.Add('       CD_FABRICANTE, CD_PAIS_DESTINO, NR_FATURA, VL_COMISSAO_PERCENT, DT_FATURA, DT_AVISO_EMBARQUE, ');
      SQL.Add('       CD_TERMO_PAGTO, CD_CONSIGNATARIO, CD_NOTIFY1, CD_SEGURADORA, CD_VIA_TRANSPORTE, CD_LOCAL_ORIGEM, ');
      SQL.Add('       CD_LOCAL_DESTINO, CD_INCOTERM, CD_TRANSPORTADORA, TX_DECL_ADIC_INST_EMB, TX_MARCACAO_VOLUME, ');
      SQL.Add('       CD_LOCAL_DESPACHO, CD_BANCO_SAQUE_BORDERO, TP_NOTIFY1, TP_CONSIGNATARIO, CD_IMPORTADOR, DT_REGISTRO_PEDIDO, CD_MOEDA ) ');
      SQL.Add('SELECT TOP 1 ''' + vNrProcesso + ''', CD_EXPORTADOR, ''logo_sg''+CD_LOGOMARCA+''.jpg'', IN_FABR_EXPO, ');
      SQL.Add('       CD_FABRICANTE, CD_PAIS, R.CD_RAP+''/''+R.CD_RAP_ANO, VL_COMISSAO, DT_FATURA, DT_EMBARQUE, CD_TERMO_PAGTO, CD_CONSIGNATARIO, ');
      SQL.Add('       CD_NOTIFY, CD_AGENTE_COMISSAO, CD_VIA_TRANSPORTE, CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_INCOTERM, ');
      SQL.Add('       CD_EMBARCADOR, TX_INST_EMB, TX_MARCACAO, CD_TERMINAL, CD_BANCO, TP_NOTIFY, TP_CONSIGNEE, CD_CLIENTE, CONVERT(datetime, CONVERT(varchar, GETDATE(), 103),103), R.CD_MOEDA_MLE ');
      SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK) ');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO ');
      SQL.Add('  AND NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''' ');
      ExecSQL;
      // aqui faz o update dos totais da capa, não tem como fazer junto por motivos de group by ( nao da pra agrupar por causa de alguns campos )
      SQL.Clear;
      SQL.Add(' SELECT SUM(RA.VL_PESO_LIQ), SUM(RA.VL_PESO_BRUTO), SUM(RA.VL_FRETE_INT), SUM(RA.VL_SEGURO),');
      SQL.Add('	       SUM(RA.VL_ACRESCIMO), SUM(RA.VL_DESCONTO), SUM(RA.VL_CUBAGEM), SUM(RA.VL_COMISSAO),');
      SQL.Add('  	     SUM(RA.VL_MLE), SUM(RA.VL_QTDE_PROD)');
      SQL.Add('   FROM MYINDAIA.DBO.TRAP RA (NOLOCK)');
      SQL.Add('  WHERE RA.CD_RAP+RA.CD_RAP_ANO+RA.CD_GRUPO IN ( SELECT RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO ');
      SQL.Add('                                       FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK)');
      SQL.Add('		   	                               WHERE NR_AUT_DOCTO+NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''')');
      Open;
      vPesoLiquido := Fields[0].AsFloat;
      vPesoBruto   := Fields[1].AsFloat;
      vFrete       := Fields[2].AsFloat;
      vSeguro      := Fields[3].AsFloat;
      vAcrescimo   := Fields[4].AsFloat;
      vDesconto    := Fields[5].AsFloat;
      vCubagem     := Fields[6].AsFloat;
      vComissao    := Fields[7].AsFloat;
      vFob         := Fields[8].AsFloat;
      vQtdeProduto := Fields[9].AsFloat;
      Close;
      SQL.Clear;
      SQL.Add('UPDATE BROKER.DBO.TPROCESSO_EXP ');
      SQL.Add('      SET VL_PESO_LIQUIDO = :VL_PESO_LIQUIDO, VL_PESO_BRUTO     = :VL_PESO_BRUTO,');
      SQL.Add('          VL_FRETE        = :VL_FRETE       , VL_SEGURO         = :VL_SEGURO,');
      SQL.Add('	         VL_ACRESCIMO    = :VL_ACRESCIMO   , VL_DESCONTO       = :VL_DESCONTO,');
      SQL.Add('	         VL_TOT_CUBAGEM  = :VL_TOT_CUBAGEM , VL_TOT_COM_AGENTE = :VL_TOT_COM_AGENTE,');
      SQL.Add('  	       VL_TOT_FOB      = :VL_TOT_FOB     , VL_TOT_QTDE_PROD  = :VL_TOT_QTDE_PROD');
      SQL.Add(' WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
      Params[0].AsFloat := vPesoLiquido;
      Params[1].AsFloat := vPesoBruto  ;
      Params[2].AsFloat := vFrete      ;
      Params[3].AsFloat := vSeguro     ;
      Params[4].AsFloat := vAcrescimo  ;
      Params[5].AsFloat := vDesconto   ;
      Params[6].AsFloat := vCubagem    ;
      Params[7].AsFloat := vComissao   ;
      Params[8].AsFloat := vFob        ;
      Params[9].AsFloat := vQtdeProduto;
      ExecSQL;
      //aqui vai integrar as faturas, pedido e marcação
      SQL.Clear;
      SQL.Add('INSERT INTO BROKER.DBO.TPROCESSO_EXP_PEDIDO ( NR_PROCESSO, NR_PEDIDO, NR_FATURA, TX_MARCACAO_VOLUME, TX_INF_EMBALAGEM, VL_PESO_LIQUIDO, VL_PESO_BRUTO, VL_CUBAGEM ) ');
      SQL.Add('SELECT ''' + vNrProcesso + ''', R.CD_RAP+''/''+R.CD_RAP_ANO, R.CD_RAP+''/''+R.CD_RAP_ANO, TX_MARCACAO, TX_EMBALAGEM, R.VL_PESO_LIQ, R.VL_PESO_BRUTO, R.VL_CUBAGEM ');
      SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK) ');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO ');
      SQL.Add('  AND RD.NR_AUT_DOCTO+RD.NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''' ');
      SQL.Add('GROUP BY R.CD_RAP, R.CD_RAP_ANO, TX_MARCACAO, TX_EMBALAGEM, R.VL_PESO_LIQ, R.VL_PESO_BRUTO, R.VL_CUBAGEM');
      ExecSQL;
      // aqui vai fazer a integração dos ITENS do processo
      SQL.Clear;
      SQL.Add('SELECT PE.NR_PEDIDO, PE.NR_ITEM, PE.CD_FORNECIMENTO FROM MYINDAIA.DBO.TPE_ITEM PE (NOLOCK), MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK), MYINDAIA.DBO.TRAP R (NOLOCK) ');
      SQL.Add(' WHERE RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO = RTRIM(LTRIM(PE.CD_RAP))+RTRIM(LTRIM(PE.CD_RAP_ANO))+PE.CD_GRUPO ');
      SQL.Add('   AND RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO = RTRIM(LTRIM(R.CD_RAP))+RTRIM(LTRIM(R.CD_RAP_ANO))+PE.CD_GRUPO ');
      SQL.Add('   AND RD.NR_AUT_DOCTO+RD.NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + ''' ');
      SQL.Add(' ORDER BY R.NR_CDE, PE.CD_PRODUTO ');
      Open;
      vNrItem := 1;
      vQryAux := TQuery.Create(application);
      vQryAux.DatabaseName := 'DBBROKER';

      while not Eof do
      begin
        vQryAux.Close;
        vQryAux.SQL.Clear;
        vQryAux.SQL.Add('INSERT INTO BROKER.DBO.TPROCESSO_EXP_ITEM ( NR_PROCESSO, NR_ITEM, NR_PEDIDO, CD_MERCADORIA, TX_MERCADORIA, ');
        vQryAux.SQL.Add('  CD_UNID_MEDIDA, QT_MERCADORIA, VL_UNITARIO, VL_MCV, VL_TOT_ITEM, CD_NCM, CD_NALADI_SH, ');
        vQryAux.SQL.Add('  CD_ACORDO, CD_NORMAS, CD_NCM_DOC, NR_SEQ_NCM_DOC, CD_NALADI_DOC, NR_SEQ_NALADI_DOC, CD_FABR_EXPO, CD_FABRICANTE, ');
        vQryAux.SQL.Add('  QT_BAIXADA, NR_PEDIDO_IMP, NR_ORDER, VL_PESO_LIQ_UNIT, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, NR_PROC_PE, NR_ITEM_PE )');
        vQryAux.SQL.Add('SELECT '''+ vNrProcesso +''', RIGHT(''000'' + ''' + IntToStr(vNrItem) + ''', 3) , R.CD_RAP+''/''+R.CD_RAP_ANO, PE.CD_PRODUTO, ISNULL(X.TX_MERCADORIA, M.NM_MERCADORIA), ');
        vQryAux.SQL.Add('  ( SELECT TOP 1 CD_DDBROKER FROM BROKER.DBO.TDE_PARA WHERE CD_TABELA = ''20'' AND CD_EXTERNO = PE.CD_UNID_MEDIDA ), ');
        vQryAux.SQL.Add('  PE.QT_FORN_PEDIDO, PE.VL_UNITARIO, PE.VL_TOTAL, PE.VL_TOTAL, M.CD_NCM_SH, M.CD_NALADI_SH, ');
        vQryAux.SQL.Add('  A.CD_ACORDO, X.CD_NORMA, X.CD_NCM_DOC, X.NR_SEQ_NCM, X.CD_NALADI_SH_DOC, X.NR_SEQ_NALADI, ''2'', R.CD_FABRICANTE, ');
        vQryAux.SQL.Add('  0, PE.NR_PEDIDO, PE.NR_PEDIDO, 0, 0, 0, PE.NR_PEDIDO, PE.NR_ITEM ');
        vQryAux.SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TPE_ITEM PE (NOLOCK), BROKER.DBO.TMERCADORIA_EXP M (NOLOCK), ');
        vQryAux.SQL.Add('  BROKER.DBO.TACORDO_PAIS A (NOLOCK), BROKER.DBO.TNORMAS N (NOLOCK), BROKER.DBO.TMERC_EXP_ACORDO X (NOLOCK) ');
        vQryAux.SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+CD_GRUPO = RTRIM(LTRIM(PE.CD_RAP))+RTRIM(LTRIM(PE.CD_RAP_ANO))+PE.CD_GRUPO');
        vQryAux.SQL.Add('  AND PE.CD_PRODUTO = M.CD_MERCADORIA');
        vQryAux.SQL.Add('  AND A.CD_PAIS = R.CD_PAIS');
        vQryAux.SQL.Add('  AND N.CD_PAIS = R.CD_PAIS');
        vQryAux.SQL.Add('  AND X.CD_ACORDO = A.CD_ACORDO');
        vQryAux.SQL.Add('  AND X.CD_NORMA = N.CODIGO');
        vQryAux.SQL.Add('  AND X.CD_MERCADORIA = M.CD_MERCADORIA ');
        vQryAux.SQL.Add('  AND PE.NR_PEDIDO = ''' + Trim(Fields[0].AsString) + ''' ');
        vQryAux.SQL.Add('  AND PE.NR_ITEM   = ''' + Trim(Fields[1].AsString) + ''' ');
        vQryAux.SQL.Add('  AND PE.CD_FORNECIMENTO = ''' + Trim(Fields[2].AsString) + ''' ');

        vQryAux.ExecSQL;

        Next;
        vNrItem := vNrItem + 1;
      end;

      // atualiza a qtde total de itens
      SQL.Clear;
      SQL.Add('UPDATE BROKER.DBO.TPROCESSO_EXP SET ');
      SQL.Add('  QT_TOTAL_ITENS = RIGHT(''000'' + (SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_EXP_ITEM (NOLOCK) WHERE NR_PROCESSO = '''+ vNrProcesso +'''), 3)');
      SQL.Add('WHERE NR_PROCESSO = '''+ vNrProcesso +''' ');
      ExecSQL;
      // altera o status da tabela de rap e vincula o processo
      SQL.Clear;
      SQL.Add('UPDATE R SET');
      SQL.Add('  R.CD_STATUS_DOCTO = ''3'','); // status de Integrado, pois aí mostra o número do processo vinculado la no site
      SQL.Add('  R.NR_PROCESSO     = '''+ vNrProcesso+'''');
      SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK)');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO');
      SQL.Add('  AND RD.NR_AUT_DOCTO     = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
      SQL.Add('  AND RD.NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('UPDATE MYINDAIA.DBO.TRAP_DOCUMENTACAO SET');
      SQL.Add('  CD_STATUS      = ''3'','); // para sumir da listagem de RAPs autorizadas para embarcar
      SQL.Add('  CD_USUARIO_FIM = '''+str_cd_usuario+''',');
      SQL.Add('  DT_FINALIZADO  = GETDATE()');
      SQL.Add('WHERE NR_AUT_DOCTO     = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
      SQL.Add('  AND NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
      ExecSQL;
      Application.MessageBox('Autorização de Documentos integrada com sucesso!', 'Integração com sucesso', MB_OK + MB_ICONINFORMATION);
    finally
      Free;
      qryAutorizadosDoc.Close;
      qryAutorizadosDoc.Open;
    end;
  end;

end;

procedure TfrmExpIntegraRAP.qryAutorizadosDocCalcFields(DataSet: TDataSet);
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';

    SQL.Clear;
//    SQL.Add('SELECT R.NR_CDE');
//    SQL.Add('  FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO RD, MYINDAIA.DBO.TRAP R(NOLOCK)');
//    SQL.Add(' WHERE R.CD_RAP+R.CD_RAP_ANO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))');
//    SQL.Add('   AND NR_AUT_DOCTO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
//    SQL.Add('   AND NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString  + '''');
    SQL.Add('SELECT RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO))+CD_GRUPO');
    SQL.Add('  FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO (nolock)');
    SQL.Add(' WHERE NR_AUT_DOCTO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
    SQL.Add('   AND NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString  + '''');
    Open;
    while not EOF do
    begin
      DataSet.FieldByName('calcRapsEnvolvidas').AsString := DataSet.FieldByName('calcRapsEnvolvidas').AsString + ', ' + Fields[0].AsString;
      Next;
    end;
    DataSet.FieldByName('calcRapsEnvolvidas').AsString := Copy(DataSet.FieldByName('calcRapsEnvolvidas').AsString,3,Length(DataSet.FieldByName('calcRapsEnvolvidas').AsString));
    Close;
    Free;
  end;
end;

procedure TfrmExpIntegraRAP.btnEstornarDocClick(Sender: TObject);
var
  vQuery : TQuery;
begin
  if Application.MessageBox(Pchar('Deseja realmente estornar esta Instrução de autorização para emissão de documentos?' ) ,
                            'Estorno de Instrução de autorização para emissão de documentos!', MB_YESNO + MB_ICONQUESTION) = mrYes then begin

    vQuery := TQuery.Create(Application);
    vQuery.DatabaseName := 'DBBROKER';

    vQuery.Name := 'qyrRenumFornec';
    // altera o status da tabela de rap e vincula o processo
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';


      //caso fatura já tenha sido emitida, é considerado um estorno, caso não, apenas volta a rap para em aberto
      SQL.Clear;
      SQL.Add('UPDATE R SET');
      SQL.Add('  R.IN_DOCTO_ESTORNO   = ''1'' '); // status de edição, ou seja, ele volta pro site como se não tivesse sido autorizado
      SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK), BROKER.DBO.TFOLLOWUP F (NOLOCK)');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO');
      SQL.Add('  AND RD.NR_AUT_DOCTO     = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
      SQL.Add('  AND RD.NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
      SQL.Add('  AND F.CD_EVENTO = ''117'' AND F.NR_PROCESSO = R.NR_PROCESSO AND ISNULL(DT_REALIZACAO, '''') <> '''' ');
      ExecSQL;
      //volta a RAP para em aberto
      Close;
      SQL.Clear;
      SQL.Add('UPDATE R SET');
      SQL.Add('  R.CD_STATUS_DOCTO   = ''1'', '); // status de edição, ou seja, ele volta pro site como se não tivesse sido autorizado
      SQL.Add('  R.CD_STATUS  = ''1'' '); // status de edição, ou seja, ele volta pro site como se não tivesse sido autorizado
      SQL.Add('FROM MYINDAIA.DBO.TRAP R (NOLOCK), MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK)');
      SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO))+RD.CD_GRUPO');
      SQL.Add('  AND RD.NR_AUT_DOCTO     = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
      SQL.Add('  AND RD.NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('UPDATE MYINDAIA.DBO.TRAP_DOCUMENTACAO SET');
      SQL.Add('  CD_STATUS       = ''0'','); // para sumir da listagem de RAPs autorizadas para embarcar
      SQL.Add('  CD_USUARIO_CANC = '''+str_cd_usuario+''',');
      SQL.Add('  DT_CANCELADO    = CONVERT(datetime, CONVERT(varchar, GETDATE(), 103),103)');
      SQL.Add('WHERE NR_AUT_DOCTO     = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO').AsString + '''');
      SQL.Add('  AND NR_AUT_DOCTO_ANO = ''' + qryAutorizadosDoc.FieldByName('NR_AUT_DOCTO_ANO').AsString + '''');
      ExecSQL;

      Close;
      Free;
    end;
    vQuery.Free;
    qryAutorizadosDoc.Close;
    qryAutorizadosDoc.Open;
  end;

end;

procedure TfrmExpIntegraRAP.Button1Click(Sender: TObject);
var
  vMercadorias, vMercAux, vPaisAux, vRAP, vTX_DESC, vTX_DESC_ING, vTX_DESC_ESP, vTX_MARCACAO, vTX_MARCACAO_COMPL : string;
  i : Integer;
begin
  vMercadorias := '000000060157673965,000000060157634012,000000060157608786,000000060157609688,' +
                  '000000060157613379,000000060157601071,000000060157608879,000000060157610260,' +
                  '000000060157612470,000000060157629112,000000060157613042,000000060157623615,' +
                  '000000060157657094,000000060157611541,000000060157634349,000000060157662707,' +
                  '000000060157601176,000000060157608679,000000060157612562,000000060157623636,' +
                  '000000060157612790,000000060157613111,000000060157612441,000000060157634011,' +
                  '000000066260322542,000000060157603013,000000066260322723,000000066260321221,' +
                  '000000060157628852,000000060157623542,000000060157610260,000000060157629112,' +
                  '000000060157625123,000000060157623605,000000060157624434,000000060157623910,' +
                  '000000060157601430,000000060157602667,000000060157623643,000000060157623603,' +
                  '000000060157612564,000000060157602666,000000060157624181,000000060157608679,' +
                  '000000060157631864,000000060157631774,000000060157629402,000000060157623955,' +
                  '000000060157623673,000000060157612281,000000060157602908,000000060157608846,' +
                  '000000060157668157,000000060157602769,000000066260321014,000000060157645082,' +
                  '000000060157608894,000000060157609096,000000060157609172,000000060157623711,' +
                  '000000060157608976,000000060157609735,000000060157629112,000000060157602932,' +
                  '000000060157611694,000000060157624843,000000060157634377,000000060157624306,' +
                  '000000060157608684,000000060157608880,000000060157608748,';

  for i:= 0 to ContaOcorrencias(vMercadorias,',')-1 do
  begin
    vMercAux := Trim(ExtractWord(i+1,vMercadorias,','));
    vRAP := '00002208';
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';

      SQL.Clear;
      SQL.Add('SELECT DISTINCT CD_PAIS FROM MYINDAIA.DBO.TRAP (nolock) WHERE CD_RAP+CD_RAP_ANO+CD_GRUPO = ''' + vRAP + '''');
      Open;
      vPaisAux := Fields[0].AsString;
      Close;
      Free;
    end;
    // agora cadastra os acordos/normas necessários
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      // busca na TCONFIG_PAIS_ACORDO_NORMA_PADRAO os registros para o pais e
      // insere na TMERC_EXP_ACORDO os acordos necessários com as descrições nos idiomas da tabela acima
      SQL.Clear;
      SQL.Add(' SELECT TX_DESC, TX_DESC_ING, TX_DESC_ESP, TX_MARCACAO, TX_MARCACAO_COMPL');
      SQL.Add('   FROM MYINDAIA.DBO.TRAP_FORNECIMENTO (nolock)');
      SQL.Add('  WHERE CD_MERCADORIA = ''' + vMercAux + '''');
      SQL.Add('    AND CD_RAP+CD_RAP_ANO+CD_GRUPO = ''' + vRAP + '''');
      Open;
      vTX_DESC           := FieldByName('TX_DESC').AsString;
      vTX_DESC_ING       := FieldByName('TX_DESC_ING').AsString;
      vTX_DESC_ESP       := FieldByName('TX_DESC_ESP').AsString;
      vTX_MARCACAO       := FieldByName('TX_MARCACAO').AsString;
      vTX_MARCACAO_COMPL := FieldByName('TX_MARCACAO_COMPL').AsString;
      Close;

      SQL.Clear;
      SQL.Add('INSERT INTO TMERC_EXP_ACORDO (CD_MERCADORIA, CD_ACORDO, CD_NORMA, TX_MERCADORIA)');
      SQL.Add('SELECT TOP 1 ''' + vMercAux + ''', CD_ACORDO, CD_NORMA,');
      SQL.Add('       CASE CD_IDIOMA');
      SQL.Add('         WHEN ''0'' THEN ''' + vTX_DESC     + ' ' + vTX_MARCACAO + ' ' + vTX_MARCACAO_COMPL + '''');
      SQL.Add('         WHEN ''1'' THEN ''' + vTX_DESC_ING + ' ' + vTX_MARCACAO + ' ' + vTX_MARCACAO_COMPL + '''');
      SQL.Add('         WHEN ''2'' THEN ''' + vTX_DESC_ESP + ' ' + vTX_MARCACAO + ' ' + vTX_MARCACAO_COMPL + '''');
      SQL.Add('       END ''TX_MERCADORIA''');
      SQL.Add('  FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO CP (nolock)');
      SQL.Add(' WHERE CD_PAIS = ''' + vPaisAux + '''');
      SQL.Add('   AND CD_ACORDO+CD_NORMA NOT IN ( SELECT CD_ACORDO+CD_NORMA FROM TMERC_EXP_ACORDO (nolock) WHERE CD_MERCADORIA = ''' + vMercAux + ''' )');
      ExecSQL;
      Free;
    end;
  end;
end;

procedure TfrmExpIntegraRAP.Button2Click(Sender: TObject);
begin
  ShowMessage(qryAutorizados.Params[0].Value);
end;

procedure TfrmExpIntegraRAP.ProcessamentoNestle(NrProcesso : String);
var
vsql :string;
lotes_ordem_ok : boolean;
sTx_MarcacaoIng, sTx_MarcacaoEsp :string;
begin
  qryGeral.Close;
  qryGeral.Databasename := 'DBBROKER';
  if (qryAutorizadosCD_GRUPO.AsString = '155') then
  begin
    {gera numero fatura}
    qryGeral.Close;
    qryGeral.SQL.Clear;
    qryGeral.Sql.Text := 'EXEC broker.dbo.SP_NR_FATURA_NESTLE '+QuotedStr(NrProcesso)+ ' ';
    qryGeral.ExecSQL;
    {gera numero fatura}

    {Preenche Marcação}
    sTx_MarcacaoIng := frm_exp_capa.CarregaMarcacaoNestle(NrProcesso, 'ING');
    sTx_MarcacaoEsp := frm_exp_capa.CarregaMarcacaoNestle(NrProcesso, 'ESP');

    qryGeral.Close;
    qryGeral.SQL.Clear;
    vsql :=
    '  UPDATE BROKER.DBO.TPROCESSO_EXP                              ' + sLineBreak +
    '     SET TX_MARCACAO_VOLUME     =  '+QuotedStr(sTx_MarcacaoIng)  + sLineBreak +
    '     ,   TX_MARCACAO_VOLUME_ESP =  '+QuotedStr(sTx_MarcacaoEsp)  + sLineBreak +
    '   FROM BROKER.DBO.TPROCESSO_EXP   A (NOLOCK)                  ' + sLineBreak +
    '   WHERE A.NR_PROCESSO        =  '+QuotedStr(NrProcesso);
    qryGeral.Sql.Text := vSql;
    qryGeral.ExecSQL;
    {Preenche Marcação}


    {Preenche Informação Geral das Embalagens}
    qryGeral.Close;
    qryGeral.SQL.Clear;
    vsql :=
    '  UPDATE BROKER.DBO.TPROCESSO_EXP                                                     ' + sLineBreak +
    '     SET TX_INF_EMBALAGEM = CASE CD_IMPORTADOR                                        ' + sLineBreak +
    '                                WHEN ''12794'' THEN ''CONTRACT #85 dated 19.03.2018'' ' + sLineBreak + //PJSC Lviv confectionary factory Svitoch
    '                                WHEN ''06827'' THEN ''CONTRACT #84 dated 19.03.2018'' ' + sLineBreak + //NESTLE UKRAINE LLC
    '                                ELSE TX_INF_EMBALAGEM                                 ' + sLineBreak +
    '                            END                                                       ' + sLineBreak +
    '   FROM BROKER.DBO.TPROCESSO_EXP   A (NOLOCK)                                         ' + sLineBreak +
    '   WHERE A.NR_PROCESSO        =  '+QuotedStr(NrProcesso) +
    '     AND A.CD_PAIS_DESTINO = ''831'' --Ucrania                                        ' + sLineBreak +
    '     AND CD_IMPORTADOR in (''12794'',''06827'')                                       ' + sLineBreak ;
    qryGeral.Sql.Text := vSql;
    qryGeral.ExecSQL;
    {Preenche Informação Geral das Embalagens}

    {gera referencia OIC}
    qryGeral.Close;
    qryGeral.SQL.Clear;
    qryGeral.Sql.Text := 'EXEC broker.dbo.SP_INSERE_REF_OIC_NESTLE '+QuotedStr(NrProcesso)+ ' ';
    qryGeral.ExecSQL;
    {gera numero fatura}

    {Valida recebimento Lotes}
    lotes_ordem_ok := false;
    qryGeral.Close;
    qryGeral.SQL.Clear;
    qryGeral.SQL.Text :=  ' SELECT * '+
                          '   FROM BROKER.DBO.FN_DIVERGENCIAS_LOTES_RAP('+QuotedStr(qryAutorizadosCD_GRUPO.AsString)+', '+
                                                               QuotedStr(NrProcesso)+', '''' )';
    qryGeral.Open;
    while not qryGeral.eof do
    begin
      if qryGeral.FieldByName('STATUS_ANALISE').asInteger = 3 then
      begin
        lotes_ordem_ok := true ;
        break;
      end;
      qryGeral.next;
    end;

    if lotes_ordem_ok then
    begin
      //Atualiza FollowUp
      qryGeral.Close;
      qryGeral.SQL.Clear;
      vsql :=  ' UPDATE BROKER.DBO.TFOLLOWUP                                             '+
               '    SET DT_REALIZACAO = (SELECT MAX(DT_RECEBIMENTO_LOTES)                '+
               '                           FROM MYINDAIA.DBO.TRAP A (NOLOCK)             '+
               '                          WHERE NR_PROCESSO ='+QuotedStr(NrProcesso)+' ) '+
               '   FROM BROKER.DBO.TFOLLOWUP A (NOLOCK)                                  '+
               '  WHERE NR_PROCESSO = '+QuotedStr(NrProcesso) +
               '    AND CD_EVENTO   = ''671'' ';
      qryGeral.Sql.Text := vSql;
      qryGeral.ExecSQL;
    end;
    {Valida recebimento Lotes}

    PreencheNumeroRuc(NrProcesso, qryAutorizadosCD_GRUPO.AsString);
  end;
end;

procedure TfrmExpIntegraRAP.PreencheNumeroRuc(NrProcesso, CdGrupo : String);
var  vsql, NrRuc : string;
begin
  {Gera Numero Ruc}
  qryGeral.Close;
  qryGeral.Databasename := 'DBBROKER';
  qryGeral.SQL.Clear;
  qryGeral.SQL.Text :=  ' SELECT CD_RUC               '+
                        '   FROM BROKER.DBO.TPROCESSO ' +
                        '  WHERE NR_PROCESSO = '+ QuotedStr(NrProcesso);
  qryGeral.Open;
  if not qryGeral.IsEmpty then
  begin
    if trim(qryGeral.FieldByName('CD_RUC').asstring) = '' then
    begin
      try
        datm_manut_proc := Tdatm_manut_proc.Create(Application);
        NrRuc := datm_manut_proc.GeraNumeroRuc(NrProcesso, CdGrupo);
      finally
        FreeAndNil(datm_manut_proc);
      end;

      if NrRuc <> '' then
      begin
        qryGeral.Close;
        qryGeral.SQL.Clear;
        vsql :=  ' UPDATE BROKER.DBO.TPROCESSO            '+
                 '    SET CD_RUC = '+ QuotedStr(NrRuc) +
                 '   FROM BROKER.DBO.TPROCESSO P (NOLOCK) '+
                 '  WHERE NR_PROCESSO = '+QuotedStr(NrProcesso) ;
        qryGeral.Sql.Text := vSql;
        qryGeral.ExecSQL;
      end;
    end;
    qryGeral.close;
  end;
  {Gera Numero Ruc}
end;

function TfrmExpIntegraRAP.ValidaCNPJ(cdEmbarque, cdEmbarqueAno, cdGrupo, nrProcesso : String): Boolean;
var
  vQuery1: TQuery;
  vQuery2: TQuery;
begin
  result := False;

  vQuery1 := TQuery.Create(Application);
  vQuery2 := TQuery.Create(Application);
  try
    vQuery1.DatabaseName := 'DBBROKER';
    vQuery2.DatabaseName := 'DBBROKER';

    vQuery1.SQL.Text := ' SELECT TOP 1 R.CD_EXPORTADOR ' + sLineBreak +
                        ' FROM MYINDAIA.DBO.TRAP_EMBARQUE RE (NOLOCK) ' + sLineBreak +
                        ' INNER JOIN MYINDAIA.DBO.TRAP R ON R.CD_RAP = RE.CD_RAP AND R.CD_RAP_ANO = RE.CD_RAP_ANO AND R.CD_GRUPO = RE.CD_GRUPO ' + sLineBreak +
                        ' WHERE RE.CD_EMBARQUE = :CD_EMBARQUE ' + sLineBreak +
                        '   AND RE.CD_EMBARQUE_ANO = :CD_EMBARQUE_ANO ' + sLineBreak +
                        '   AND RE.CD_GRUPO = :CD_GRUPO ';
    vQuery1.ParamByName('CD_EMBARQUE').AsString := cdEmbarque ;
    vQuery1.ParamByName('CD_EMBARQUE_ANO').AsString := cdEmbarqueAno ;
    vQuery1.ParamByName('CD_GRUPO').AsString := cdGrupo ;
    vQuery1.Open;


    vQuery2.SQL.Text := ' SELECT CD_CLIENTE ' + sLineBreak +
                        ' FROM BROKER.DBO.TPROCESSO ' + sLineBreak +
                        ' WHERE NR_PROCESSO = :NR_PROCESSO ';
    vQuery2.ParamByName('NR_PROCESSO').AsString := nrProcesso;
    vQuery2.Open;

    result := (vQuery1.FieldByName('CD_EXPORTADOR').AsString = vQuery2.FieldByName('CD_CLIENTE').AsString);
  finally
    vQuery1.Free;
    vQuery2.Free;
  end;

end;

end.
