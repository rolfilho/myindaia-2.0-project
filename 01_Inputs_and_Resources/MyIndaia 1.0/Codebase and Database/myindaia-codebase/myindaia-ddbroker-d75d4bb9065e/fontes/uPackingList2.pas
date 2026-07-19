unit uPackingList2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCRPE32, StdCtrls, Mask, Buttons, ExtCtrls, Funcoes, DBTables,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, jpeg, ppDB, ppDBPipe, ppDBBDE, DB, ppStrtch, ppMemo,
  ppParameter, ppVar;

type
  Tfrm_packing_list2 = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_nr_processo: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    mskedt_nr_processo: TMaskEdit;
    mskedt_cd_unid_neg: TMaskEdit;
    rb_original: TRadioButton;
    rb_copia: TRadioButton;
    crp_packing: TCRPE;
    chkProcessos: TCheckBox;
    pprep_packing: TppReport;
    ds_total: TDataSource;
    ds_detalhe: TDataSource;
    qry_total_: TQuery;
    qry_detalhe_: TQuery;
    ppBDE_total: TppBDEPipeline;
    ppBDE_detalhe: TppBDEPipeline;
    qry_detalhe_CD_LINGUA_PEDIDO: TStringField;
    qry_detalhe_CD_EMBALAGEM_SUP: TStringField;
    qry_detalhe_CD_EMBALAGEM: TStringField;
    qry_detalhe_QT_EMBALAGEM_SUP: TFloatField;
    qry_detalhe_DESC_EMB_SUP: TStringField;
    qry_detalhe_NR_ITEM: TStringField;
    qry_detalhe_DESC_EMB: TStringField;
    qry_detalhe_CD_MERCADORIA: TStringField;
    qry_detalhe_TX_MERCADORIA: TMemoField;
    qry_detalhe_PESO_BRUTO: TFloatField;
    qry_detalhe_TARA: TFloatField;
    qry_detalhe_PESO_LIQUIDO: TFloatField;
    qry_detalhe_COMPRIMENTO: TFloatField;
    qry_detalhe_LARGURA: TFloatField;
    qry_detalhe_ALTURA: TFloatField;
    qry_total_calc_original: TStringField;
    qry_total_NR_PROCESSO: TStringField;
    qry_total_DIA_FATURA: TIntegerField;
    qry_total_MES_FATURA: TIntegerField;
    qry_total_ANO_FATURA: TIntegerField;
    qry_total_NM_EMPRESA: TStringField;
    qry_total_TX_MARCACAO_VOLUME: TMemoField;
    qry_total_VL_TOT_QTDE_EMBALAGEM: TFloatField;
    qry_total_PESO_BRUTO_TOTAL: TFloatField;
    qry_total_PESO_LIQ_TOTAL: TFloatField;
    qry_total_TX_DECL_ADICIONAL: TMemoField;
    qry_total_calc_dt_fatura: TStringField;
    qry_total_CD_LINGUA_PEDIDO: TStringField;
    qry_detalhe_NR_PROCESSO: TStringField;
    ppParameterList1: TppParameterList;
    qry_total_soma_tara: TFloatField;
    qry_total_CUSTOMER: TStringField;
    qry_total_SHIPPER: TStringField;
    qry_total_TX_LOGOMARCA_EMPRESA_NAC: TStringField;
    BDE_totalTX_LOGOMARCA_EMPRESA_NAC: TppField;
    ppHeBd1: TppHeaderBand;
    ppDtBd1: TppDetailBand;
    ppdbtxt2: TppDBText;
    ppDBtxtNivel: TppDBText;
    ppDBtxt26: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFtBd1: TppFooterBand;
    ppShape4: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine2: TppLine;
    ppDBText20: TppDBText;
    ppPageStyle2: TppPageStyle;
    ppshp3: TppShape;
    ppShape6: TppShape;
    ppshp2: TppShape;
    ppshp4: TppShape;
    ppLn2: TppLine;
    ppLn3: TppLine;
    ppLn4: TppLine;
    ppLn5: TppLine;
    ppLn6: TppLine;
    ppLn7: TppLine;
    ppLn1: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText26: TppDBText;
    ppLine1: TppLine;
    ppDBText27: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    ppImage1: TppImage;
    ppDBTxtNot2: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText32: TppDBText;
    ppDBText35: TppDBText;
    ppDBText34: TppDBText;
    ppDBText37: TppDBText;
    ppDBText30: TppDBText;
    ppDBText33: TppDBText;
    ppDBMemoIMP: TppDBMemo;
    ppDBtxt10: TppDBText;
    ppDBMemoNOT: TppDBMemo;
    ppDBText36: TppDBText;
    ppDBMemoCON: TppDBMemo;
    ppDBMemoNOT2: TppDBMemo;
    ppDBMemoEXP: TppDBMemo;
    ppDBMemo1: TppDBMemo;
    ppDBtxt1: TppDBText;
    ppDBtxt5: TppDBText;
    ppDBtxt6: TppDBText;
    ppDBtxt7: TppDBText;
    ppDBtxt9: TppDBText;
    ppDBtxt11: TppDBText;
    ppDBtxt12: TppDBText;
    ppDBtxt13: TppDBText;
    ppDBtxt14: TppDBText;
    ppDBtxt15: TppDBText;
    ppDBtxt18: TppDBText;
    ppDBtxt19: TppDBText;
    ppDBtxt23: TppDBText;
    ppDBtxt24: TppDBText;
    ppDBtxt25: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppPesoLiq: TppLabel;
    ppPesoBruto: TppLabel;
    ppCubagem: TppLabel;
    ppPg: TppSystemVariable;
    ppDBTextORIGEM: TppDBText;
    ppDBTextDESTINO: TppDBText;
    ppMerc: TppMemo;
    ppDBTxtNot2_1: TppDBText;
    ppDBTxtNot2_2: TppDBText;
    ppDBTxtNot2_3: TppDBText;
    ppDBText31: TppDBText;
    ppDBtxt8: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo5: TppDBMemo;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure qry_total_CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_packing_list2: Tfrm_packing_list2;
  qry_tara : tquery;

implementation

uses ConsOnLineEx, PGGP001, PGSM990;

{$R *.dfm}

procedure Tfrm_packing_list2.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    mskedt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',mskedt_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure Tfrm_packing_list2.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''02''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + mskedt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  mskedt_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure Tfrm_packing_list2.SpeedButton1Click(Sender: TObject);
var vStrAux, vStrAux2: string;
    qry: tquery;
begin
  if not ConfereNF(mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text) then Exit;
  //pesquisa se processo é Du Pont
  qry := TQuery.Create(Application);
  with qry do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT EN.CD_EMPRESA FROM TEMPRESA_NAC EN, TPROCESSO P');
    SQL.Add('WHERE P.NR_PROCESSO = ' + QuotedStr(mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text));
    SQL.Add('and P.CD_CLIENTE IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC WHERE CD_GRUPO = ''138'' ) ');
    Prepare;
    Open;
  end;

  if not qry.IsEmpty then //caso seja Du Pont
  begin
    with qry_total_ do
    begin
      Close;
      ParamByName('PROCESSO').AsString :=  mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      Prepare;
      Open;
    end;
    with qry_detalhe_ do
    begin
      Close;
      prepare;
      Open;
    end;
    //chama o form de impressão!!
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := mskedt_cd_unid_neg.Text;
    frm_impressao.cd_produto    := '02';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_modulo     := '2005';
    frm_impressao.vApenas_email := false;
    frm_impressao.ShowModal;
    frm_impressao.Release;
  end
  else
  begin  //outros cliente exceto Du Pont
    with crp_packing do
    begin
      Connect        := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName     := cDir_Rpt + '\PackingList2.RPT';
      ReportTitle    := 'PACKING LIST';
      ParamFields[0] := mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      if rb_original.Checked then
        ParamFields[1] := 'ORIGINAL';
      if rb_copia.Checked then
        ParamFields[1] := 'CÓPIA';
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT NR_PEDIDO FROM TPROCESSO_EXP_PEDIDO WHERE NR_PROCESSO = ''' + mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text + '''');
        Open;
        vStrAux  := '';
        vStrAux2 := '';
        while not EOF do
        begin
          if Length(vStrAux) > 45 then
            vStrAux2 := vStrAux2 + ' / ' + Trim(FieldByName('NR_PEDIDO').AsString)
          else
            vStrAux := vStrAux + ' / ' + Trim(FieldByName('NR_PEDIDO').AsString);
          Next;
        end;
        Close;
        Free;
      end;
      if vStrAux = '' then
        ParamFields[2] := '.'
      else ParamFields[2] := Copy(vStrAux,3, Length(vStrAux));
      if vStrAux2 = '' then
        ParamFields[3] := '.'
      else ParamFields[3] := Copy(vStrAux2,3,Length(vStrAux2));
      Execute;
    end;
  end;
end;

procedure Tfrm_packing_list2.mskedt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then begin
    if Sender = mskedt_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = mskedt_nr_processo then btn_nr_processoClick(btn_nr_processo);
  end;
end;

procedure Tfrm_packing_list2.FormShow(Sender: TObject);
begin
  mskedt_cd_unid_neg.Text := str_cd_unid_neg;
end;

procedure Tfrm_packing_list2.qry_total_CalcFields(DataSet: TDataSet);
var mes: string[20];
begin
  //original ou cópia
  if rb_original.Checked then
     qry_total_.FieldByName('calc_original').AsString := 'ORIGINAL'
  else
     Case qry_total_.FieldByName('CD_LINGUA_PEDIDO').AsInteger of
       0: qry_total_.FieldByName('calc_original').AsString := 'CÓPIA';
       1: qry_total_.FieldByName('calc_original').AsString := 'COPY';
       2: qry_total_.FieldByName('calc_original').AsString := 'COPIA';
     end;


  //data na lingua do pedido e no formato pedido
  Case qry_total_.FieldByName('CD_LINGUA_PEDIDO').AsInteger of
    0: begin
         Case qry_total_.FieldByName('MES_FATURA').AsInteger of
            1: mes := 'Janeiro';
            2: mes := 'Fevereiro';
            3: mes := 'Março';
            4: mes := 'Abril';
            5: mes := 'Maio';
            6: mes := 'Junho';
            7: mes := 'Julho';
            8: mes := 'Agosto';
            9: mes := 'Setembro';
           10: mes := 'Outubro';
           11: mes := 'Novembro';
           12: mes := 'Dezembro';
         end;
         qry_total_.FieldByName('calc_dt_fatura').AsString := qry_total_.FieldByName('DIA_FATURA').AsString + ' de ' +
                                                              mes + ' de ' +
                                                              qry_total_.FieldByName('ANO_FATURA').AsString;
       end;
    1: begin
         Case qry_total_.FieldByName('MES_FATURA').AsInteger of
            1: mes := 'January ';
            2: mes := 'February ';
            3: mes := 'March ';
            4: mes := 'April ';
            5: mes := 'May ';
            6: mes := 'June ';
            7: mes := 'July ';
            8: mes := 'August ';
            9: mes := 'September ';
           10: mes := 'Outubro ';
           11: mes := 'November ';
           12: mes := 'December ';
         end;
         if qry_total_.FieldByName('DIA_FATURA').AsInteger = 1 then
            qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                 ' st, ' + qry_total_.FieldByName('ANO_FATURA').AsString
         else
         if qry_total_.FieldByName('DIA_FATURA').AsInteger = 2 then
            qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString+
                                                                 ' rd, ' + qry_total_.FieldByName('ANO_FATURA').AsString
         else
           qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                 ' th, ' + qry_total_.FieldByName('ANO_FATURA').AsString;

       end;
    2: begin
         Case qry_total_.FieldByName('MES_FATURA').AsInteger of
            1: mes := 'Enero';
            2: mes := 'Febrero';
            3: mes := 'Marzo';
            4: mes := 'Abril';
            5: mes := 'Mayo';
            6: mes := 'Junio';
            7: mes := 'Julio';
            8: mes := 'Agosto';
            9: mes := 'Septiembre';
           10: mes := 'Octubre';
           11: mes := 'Noviembre';
           12: mes := 'Diciembre';
         end;
         qry_total_.FieldByName('calc_dt_fatura').AsString := qry_total_.FieldByName('DIA_FATURA').AsString + ' de ' +
                                                              mes + ' de ' +
                                                              qry_total_.FieldByName('ANO_FATURA').AsString;
       end;
  end;

  //calcula o total da tara
  qry_tara := TQuery.Create(Application);
  with qry_tara do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT SUM(CONVERT(DECIMAL(16,3), EI.VL_PESO_EMB)) SOMA_TARA');
    SQL.Add('FROM   TPROCESSO_EXP_ITEM EI');
    SQL.Add('WHERE  EI.NR_PROCESSO = ' + QuotedStr(mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text));
    Open;
  end;

  qry_total_.FieldByName('soma_tara').AsFloat :=  qry_tara.Fields[0].Value;
end;

procedure Tfrm_packing_list2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_Packing.Free;
end;

end.
