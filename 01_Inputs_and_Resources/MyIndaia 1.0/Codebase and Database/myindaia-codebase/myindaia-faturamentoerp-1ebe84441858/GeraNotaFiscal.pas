unit GeraNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, ADODB,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, ExtCtrls, Buttons, cxCheckBox, DBCtrls, ComCtrls, cxDBLookupComboBox,
  Grids, DBGrids, cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit,Math, cxNavigator, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmGeraNotaFiscal = class(TForm)
    pnlOpcoes: TPanel;
    btnVoltar: TBitBtn;
    btnAvançar: TBitBtn;
    btnConcluir: TBitBtn;
    nbTelas: TNotebook;
    rdbNotaFiscalServico: TRadioButton;
    rdbNotaFiscalDespesa: TRadioButton;
    cxgItensFaturar: TcxGrid;
    cxgdbtvItensFaturar: TcxGridDBTableView;
    cxgdbtvItensFaturarSelecionado: TcxGridDBColumn;
    cxgdbtvItensFaturarTipo: TcxGridDBColumn;
    cxgdbtvItensFaturarparentID: TcxGridDBColumn;
    cxgdbtvItensFaturarid: TcxGridDBColumn;
    cxgdbtvItensFaturarstatus: TcxGridDBColumn;
    cxgdbtvItensFaturaritem_id: TcxGridDBColumn;
    cxgdbtvItensFaturarValor: TcxGridDBColumn;
    cxgdbtvItensFaturarValorSelecionado: TcxGridDBColumn;
    cxgdbtvItensFaturarItemFixo: TcxGridDBColumn;
    cxgdbtvItensFaturarcustomID: TcxGridDBColumn;
    cxgdbtvTipoFaturar: TcxGridDBTableView;
    cxgdbtvTipoFaturarTipo: TcxGridDBColumn;
    cxglItensFaturar: TcxGridLevel;
    cxgItensNota: TcxGrid;
    cxgdbtvTipoItensNota: TcxGridDBTableView;
    cxgdbtvTipoItensNotaTipo: TcxGridDBColumn;
    cxgdbtvItensNota: TcxGridDBTableView;
    cxgdbtvItensNotaTipo: TcxGridDBColumn;
    cxgdbtvItensNotaparentID: TcxGridDBColumn;
    cxgdbtvItensNotaid: TcxGridDBColumn;
    cxgdbtvItensNotastatus: TcxGridDBColumn;
    cxgdbtvItensNotaitem_id: TcxGridDBColumn;
    cxgdbtvItensNotaValor: TcxGridDBColumn;
    cxgdbtvItensNotaValorTotal: TcxGridDBColumn;
    cxgdbtvItensNotaValorNumerarios: TcxGridDBColumn;
    cxgdbtvItensNotaValorPagamentos: TcxGridDBColumn;
    cxgdbtvItensNotaValorReceitas: TcxGridDBColumn;
    cxglTipoItensNota: TcxGridLevel;
    cxglItensNota: TcxGridLevel;
    reLog: TRichEdit;
    cxgdbtvItensNotaCustomId: TcxGridDBColumn;
    cxgdbtvItensFaturarcustomClearance_id: TcxGridDBColumn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText5: TDBText;
    Label11: TLabel;
    DBText6: TDBText;
    Label12: TLabel;
    DBText7: TDBText;
    DBText8: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cxgdbtvItensFaturarValor_Cliente: TcxGridDBColumn;
    cxgdbtvItensNotaValor_Cliente: TcxGridDBColumn;
    cxgdbtvItensFaturardestino: TcxGridDBColumn;
    pnlAgrupar: TPanel;
    Processo: TLabel;
    Label3: TLabel;
    btnAgruparProcesso: TSpeedButton;
    edtProcessoAgrupado: TEdit;
    procedure nbTelasPageChanged(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvançarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure cxgdbtvTipoFaturarStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxgdbtvTipoItensNotaStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure AdvShapeButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtProcessoAgrupadoKeyPress(Sender: TObject; var Key: Char);
    procedure cxgdbtvItensFaturarSelecionadoPropertiesChange(Sender: TObject);
    procedure btnAgruparProcessoClick(Sender: TObject);
  private
    procedure EscreveMensagem(AMsg: String; ACor: TColor);

    function GrupoBasf: Boolean;
    function GrupoINB: Boolean;
    function GrupoAvlisHaws :Boolean;
    function GrupoEmbraco: Boolean;
    function GrupoFesto: Boolean;
    function GrupoFoseco: Boolean;
    Function GrupoAirProducts : Boolean;
    Function GrupoChemetall : Boolean;
    Function GrupoSaintGobainAbrasivos : Boolean;
    Function GrupoMetalfrio : Boolean;
    Function GrupoFigwall : Boolean;
    function GrupoFirmenich: Boolean;
    function GrupoPrometeon: Boolean;
    function GrupoPirelli: Boolean;
    function GrupoYara: Boolean;
    function GrupoMBS: Boolean;
    function GrupoCaldic: Boolean;

    //não é pra ir
    function GrupoNestle: Boolean;
    function GrupoSeb: Boolean;
  public
    function Execute: Boolean;
  end;

var
  frmGeraNotaFiscal: TfrmGeraNotaFiscal;

implementation

uses
  DadosFaturamentoERP, Funcoes, DebugDataset,Global, ClassesERP;

{$R *.dfm}

{ TfrmGeraNotaFiscal }

procedure TfrmGeraNotaFiscal.AdvShapeButton1Click(Sender: TObject);
begin
 pnlAgrupar.Visible := false;
end;

procedure TfrmGeraNotaFiscal.btnAvançarClick(Sender: TObject);
var
Total: double;
begin
  nbTelas.PageIndex := nbTelas.PageIndex +1;
  Panel1.Visible :=true;

  with dtmFaturamentoERP do
    if nbTelas.PageIndex = 1 then
    begin
      pnlAgrupar.Visible      := true;
      qryTipoFaturar.Filtered := False;

      if qryItensV2.Active then
        qryItensV2.Close;
      qryItensV2.Parameters.ParamValues['customClearance_id'] := qryCustomClearanceid.AsInteger;

      if not cdsItensFaturar.Active then
        cdsItensFaturar.Open;
      cdsItensFaturar.EmptyDataSet;

      if qryItensFaturar.Active then
        qryItensFaturar.Close;
      qryItensFaturar.Parameters.ParamValues['customClearance_id'] := qryCustomClearanceid.AsInteger;

      if rdbNotaFiscalServico.Checked then
      begin
        qryTipoFaturar.Filter := StringReplace(qryTipoFaturar.Filter, '=', '<>', []);

        cxgdbtvItensFaturar.DataController.KeyFieldNames := 'Tipo;id;status;item_id;item_name;Valor';
        cxgdbtvItensFaturar.OptionsData.Appending        := True;
        cxgdbtvItensFaturar.OptionsData.Inserting        := True;
        cxgdbtvItensFaturar.OptionsData.Deleting         := True;

        qryItensV2.Parameters.ParamValues['type']        := 'R';
        qryItensFaturar.Parameters.ParamValues['tipo']   := 0;
      //  qryItensFaturar.Parameters.ParamValues['tipo2']  := 0;
      //  qryItensFaturar.Parameters.ParamValues['tipo3']  := 0;
      end
      else
      begin
        qryTipoFaturar.Filter := StringReplace(qryTipoFaturar.Filter, '=', '<>', []);

        cxgdbtvItensFaturar.DataController.KeyFieldNames := 'Tipo;id;status;item_id;item_name;Valor';
        cxgdbtvItensFaturar.OptionsData.Appending        := False;
        cxgdbtvItensFaturar.OptionsData.Inserting        := False;
        cxgdbtvItensFaturar.OptionsData.Deleting         := False;

        qryItensV2.Parameters.ParamValues['type']        := 'D';
        qryItensFaturar.Parameters.ParamValues['tipo']   := 1;
      //  qryItensFaturar.Parameters.ParamValues['tipo2']  := 1;
      //  qryItensFaturar.Parameters.ParamValues['tipo3']  := 1;
      end;
      qryTipoFaturar.Filtered := True;

      qryItensV2.Open;

      cdsItensFaturar.DisableControls;
      qryItensFaturar.DisableControls;
      qryItensFaturar.Open;
      qryItensFaturar.EnableControls;
      cdsItensFaturar.EnableControls;

      AtualizaItensFaturar;

      cxgdbtvTipoFaturar.ViewData.Collapse(True);
      cxgdbtvTipoFaturar.ViewData.Expand(False);
    end
    else
    if nbTelas.PageIndex = 2 then
    begin
      pnlAgrupar.Visible:=false;
      if not cdsItensNota.Active then
        cdsItensNota.Open;

      cdsItensNota.EmptyDataSet;

      AtualizaItensNota;
      cxgdbtvTipoItensNota.ViewData.Expand(False);
      cdsItensFaturar.EnableControls;
      cdsItensNota.EnableControls;
      cdsItensFaturar.First;
      cdsItensNota.First;
    end;
end;

procedure TfrmGeraNotaFiscal.btnConcluirClick(Sender: TObject);
var
  QtdItens,NumerarioGravado: Integer;
  qryInserir: TADOQuery;
  OldBillingId, BillingId, parentID, Filial: Integer;
  dueInvoiceDate: tdatetime;
  IR: Double;
  sSql, TipoCliente, sFilial : string;
  DevolucaoNumerario : Boolean;
begin

  nbTelas.PageIndex   := 2;
  btnVoltar.Enabled   := False;
  btnAvançar.Enabled  := False;
  btnConcluir.Enabled := False;
  reLog.Clear;
  DevolucaoNumerario := False;

  with dtmFaturamentoERP do
    if dtmFaturamentoERP.cdsItensNota.RecordCount = 0 then
    begin
      EscreveMensagem('Não há itens para gerar Nota', clRed);
      Update;
      btnVoltar.Enabled := True; // Habilita para poder gerar novamente
    end
    else
    begin
      try
        if not rdbNotaFiscalServico.Checked  then
        begin
          cdsItensNota.First;
          if cdsItensNotaValorPagamentos.AsFloat = 0 then
          begin
            if MessageDlg('Nenhuma despesa selecionada.'#13+
                          'Continuar como devolução de numerário?', mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrNo then
            begin
             Abort;
            end
            else
              DevolucaoNumerario := True;
          end;
        end;

        EscreveMensagem('Inicializando geração da Nota...', clGreen);
        Update;
        cdsItensNota.DisableControls;
        qryInserir := GetQuery;
        BeginTransaction;
        try
          // Gravar Capa
         EscreveMensagem('Gravando Capa da Nota...', clWindowText);
         cdsItensNota.First;

         TipoCliente :=
         ConsultaSQL('SELECT C.TYPE                                                               '+
                     '  FROM MYINDAIAV2.DBO.CUSTOMCLEARANCE P (NOLOCK)                            '+
                     '  JOIN MYINDAIAV2.DBO.CUSTOMER        C (NOLOCK) ON C.ID = P.CUSTOMER_ID  '+
                     ' WHERE P.ID = :PROCESSO ', [Parametros.Processoid],'TYPE');


          dueInvoiceDate := date + ConsultaSQL('Select dueInvoiceDay                                                      '+
                                               '  from PaymentDefinition     pd (nolock)                                  '+
                                               '  inner join CustomClearance cc (nolock) on cc.customer_id=pd.customer_id '+
                                               '  inner join Product         p  (nolock) on p.id=pd.product_id            '+
                                               '  inner join Branch          b  (nolock) on b.id=pd.Branch_id             '+
                                               '  where p.aKey = :Produto                                                 '+
                                               '    and b.aKey = :Unidade                                                 '+
                                               '    and cc.id  = :ProcessoId',
                                               [Parametros.Produto,Parametros.Unidade,Parametros.Processoid], 0)  ;

          qryUnidadeV2.First;

          sFilial := '0';
{*         if GrupoNestle then
        begin
           sFilial := ConsultaSQL('  SELECT CASE WHEN ISNULL(CD_FRONTEIRA, '''')  = ''0523'' /*URUGUAIANA*/   '+
                                  '              THEN ''08'' /*FILIAL URUGUAIANA*/                            '+
                                  '              ELSE CD_UNID_NEG                                             '+
                                  '         END                                                               '+
                                  '    FROM BROKER.DBO.TPROCESSO (NOLOCK)                                     '+
                                  '  WHERE NR_PROCESSO = :ProcessoId                                          ',
                                 [qryCustomClearancecustomID.AsString], '01');
           if sFilial = '0' then
            sFilial := '01';

           if qryUnidadeV2.Locate('aKey',sFilial,[]) then
             Filial := qryUnidadeV2id.AsInteger
           else
             Filial := 1;
        end
        else*}

          begin
            if qryUnidadeV2.Locate('aKey', Copy(qryCustomClearancecustomID.AsString, 1, 2), []) then
              Filial := qryUnidadeV2id.AsInteger
            else
              Filial := 1;
          end;

          OldBillingId := ConsultaSQL('SELECT MAX(id)              ' +
                                      'FROM MYINDAIAV2.dbo.Billing '
                                      , [], 0);

          qryInserir.SQL.Clear;
          sSql :='';
          sSql :=  ' DECLARE @VALOR_TOTAL NUMERIC(15,2)                                                  '+ sLineBreak +
                   '     SET @VALOR_TOTAL = :VALOR_TOTAL                                                   '+ sLineBreak +
                   ' DECLARE @VALOR_TOTAL_IR NUMERIC(15,2)                                               '+ sLineBreak +
                   '     SET @VALOR_TOTAL_IR = :VALOR_TOTAL_IR                                             '+ sLineBreak +
                   ' INSERT INTO MYINDAIAV2.dbo.Billing(created,                                         '+ sLineBreak +
                   '                                   dueDate,                                          '+ sLineBreak +
                   '                                   total,                                            '+ sLineBreak +
                   '                                   branch_id,                                        '+ sLineBreak +
                   '                                   user_id,                                          '+ sLineBreak +
                   '                                   status,                                           '+ sLineBreak +
                   '                                   type,                                             '+ sLineBreak +
                   '                                   invoiceReceiverType,                              '+ sLineBreak +
                   '                                   valorTibutavel,                                   '+ sLineBreak +
                   '                                   cofins,                                           '+ sLineBreak +
                   '                                   ir)                                               '+ sLineBreak +
                   '                            VALUES(GETDATE(),                                        '+ sLineBreak +
                   '                                   :dueDate ,                                        '+ sLineBreak +
                   '                                   :total,                                           '+ sLineBreak +
                   '                                   :branch_id,                                       '+ sLineBreak +
                   '                                   :user_id,                                         '+ sLineBreak +
                   '                                   :status,                                          '+ sLineBreak +
                   '                                   :type,                                            '+ sLineBreak +
                   '                                   :invoiceReceiverType,                             '+ sLineBreak +
                   '                                   :valorTibutavel,                                  '+ sLineBreak ;
               if TipoCliente = 'JURIDICA' then
                  sSql := sSql +
                   '                               CONVERT(NUMERIC(15,2),                                '+ sLineBreak +
                   '                                       ROUND(((@VALOR_TOTAL/100) * 3),2) +           '+ sLineBreak +
                   '                                       ROUND(((@VALOR_TOTAL/100) * 0.65),2) +        '+ sLineBreak +
                   '                                       ROUND(((@VALOR_TOTAL/100) * 1),2)),           '+ sLineBreak +
                   '                               CONVERT(NUMERIC(15,2),                                '+ sLineBreak +
                   '                                       ROUND(((@VALOR_TOTAL_IR/100) * 1.50),2)) )    '+ sLineBreak
              else
                  sSql := sSql +
                   '                               0,           '+ sLineBreak +
                   '                               0       )    '+ sLineBreak ;

          qryInserir.SQL.text := ssql;

          qryInserir.Parameters.ParamValues['total']     := cdsItensNotaValorTotal.AsFloat;
          qryInserir.Parameters.ParamValues['dueDate']   := dueInvoiceDate;
          qryInserir.Parameters.ParamValues['branch_id'] := Filial;
          qryInserir.Parameters.ParamValues['user_id']   := qryUsuarioV2id.AsInteger;

          if DevolucaoNumerario then
            qryInserir.Parameters.ParamValues['status']    := _NotaFiscal_Faturada            {_NotaFiscal_Faturada}
          else
            qryInserir.Parameters.ParamValues['status']    := _NotaFiscal_Aberta;             {_NotaFiscal_Faturada}

          qryInserir.Parameters.ParamValues['valorTibutavel'] := cdsItensNotaValorReceitas.AsFloat;

          if rdbNotaFiscalServico.Checked then
          begin
            qryInserir.Parameters.ParamValues['type']                 := _NotaFiscal_Servico;
            qryInserir.Parameters.ParamValues['invoiceReceiverType']  := 'CUSTOMER';
            qryInserir.Parameters.ParamValues['VALOR_TOTAL']          := dtmFaturamentoERP.cdsItensNotaValorReceitas.AsFloat;

            if GrupoBasf or
               GrupoINB or
               GrupoAvlisHaws or
               GrupoEmbraco or
               GrupoFesto or
               GrupoFoseco or
               GrupoAirProducts or
               GrupoChemetall or
               GrupoSaintGobainAbrasivos or
               GrupoMetalfrio or
               GrupoFigwall or
               GrupoFirmenich or
               GrupoPrometeon or
               GrupoPirelli or
               GrupoYara or
               GrupoMBS or
               GrupoCaldic or
               GrupoSeb or
               (IR >= 10) then
              qryInserir.Parameters.ParamValues['VALOR_TOTAL_IR']       := dtmFaturamentoERP.cdsItensNotaValorReceitas.AsFloat
            else
              qryInserir.Parameters.ParamValues['VALOR_TOTAL_IR']       := 0;
          end
          else
          begin
            qryInserir.Parameters.ParamValues['type']                 := _NotaFiscal_Despesa;
            qryInserir.Parameters.ParamValues['invoiceReceiverType']  := '';
            qryInserir.Parameters.ParamValues['VALOR_TOTAL']          := 0;
            qryInserir.Parameters.ParamValues['VALOR_TOTAL_IR']       := 0;
           // qryInserir.Parameters.ParamValues['cofins']             := 0;
           //  qryInserir.Parameters.ParamValues['ir']                := 0;
          end;

          qryInserir.ExecSQL;


          BillingId := ConsultaSQL('SELECT MAX(id)                ' +
                                   '  FROM MYINDAIAV2.dbo.Billing '
                                   , [], 0);

          if BillingId = OldBillingId then
            raise Exception.Create('Ocorreu um erro criando capa da Nota.');


          if rdbNotaFiscalServico.Checked then
          begin
            // Gravar Receitas
            if cdsItensNotaValorReceitas.AsFloat > 0 then
            begin
              EscreveMensagem('Gravando Receitas na Nota...', clWindowText);
              cdsItensNota.First;
              QtdItens := 0;
              qryInserir.SQL.Clear;
              qryInserir.SQL.text :=  '  DECLARE @Billing_id         BIGINT         = :Billing_id                       '+ sLineBreak +
                                      '  DECLARE @price              NUMERIC(19, 2) = :price                            '+ sLineBreak +
                                      '  DECLARE @item_id            BIGINT         = :item_id                          '+ sLineBreak +
                                      '  DECLARE @CustomClearance_id NUMERIC(19, 2) = :CustomClearance_id               '+ sLineBreak +

                                      '  INSERT INTO MYINDAIAV2.dbo.ItemInvoiced(price, item_id,CustomClearance_id)     '+ sLineBreak +
                                      '  VALUES(@price, @item_id,@CustomClearance_id)                                   '+ sLineBreak +

                                      '  INSERT INTO MYINDAIAV2.dbo.Billing_ItemInvoiced(Billing_id, itensInvoiced_id)  '+ sLineBreak +
                                      '  SELECT @Billing_id, MAX(id)                                                    '+ sLineBreak +
                                      '  FROM MYINDAIAV2.dbo.ItemInvoiced                                               '+ sLineBreak ;


              while not cdsItensNota.Eof do
              begin
                if CharInSet(cdsItensNotaTipo.AsString[1], ['R', 'r']) then
                begin
                  if cdsItensFaturarTipo.AsString<>'Numerário' then
                  begin
                    qryInserir.Parameters.ParamValues['Billing_id'] := BillingId;
                    qryInserir.Parameters.ParamValues['item_id']    := cdsItensNotaitem_id.AsInteger;
                    qryInserir.Parameters.ParamValues['price']      := cdsItensNotaValor.AsFloat;
                    qryInserir.Parameters.ParamValues['CustomClearance_id'] := cdsItensNotaCustomClearance_id.AsInteger;
                    qryInserir.ExecSQL;
                  end;
                end;
                cdsItensNota.Next;
              end;
              EscreveMensagem(IntToStr(QtdItens) + ' Receitas', clWindowText);
            end;

         //   begin
              cdsItensNota.First;
              NumerarioGravado:=0;
              while not cdsItensNota.Eof do
              begin
                parentID := cdsItensNotaparentID.AsInteger;
                if CharInSet(cdsItensNotaTipo.AsString[1], ['N', 'n']) then
                begin
                  if NumerarioGravado <> cdsItensNotaparentID.AsInteger then
                  begin
                    NumerarioGravado:=cdsItensNotaparentID.AsInteger;
                    qryInserir.SQL.Clear;
                    qryInserir.SQL.text := ' INSERT INTO MYINDAIAV2.dbo.Billing_CashRequested(Billing_id, cashRequests_id) '+ sLineBreak +
                                           ' VALUES(:Billing_id, :cashRequests_id)                                         '+ sLineBreak ;
                    qryInserir.Parameters.ParamValues['Billing_id'] := BillingId;
                    qryInserir.Parameters.ParamValues['cashRequests_id'] := cdsItensNotaparentID.AsInteger;
                    qryInserir.ExecSQL;
                  end;
                  cdsItensNota.Next;
                end
                else
                  cdsItensNota.Next;
              end;
                EscreveMensagem(IntToStr(QtdItens) + ' Numerários', clWindowText);
          //  end;
          end
          else
          begin
            // Gravar Numerários
            //if cdsItensNotaValorNumerarios.AsFloat > 0 then
           // begin
              QtdItens := 0;
              cdsItensNota.First;
              NumerarioGravado:=0;
              while not dtmFaturamentoERP.cdsItensNota.Eof do
              begin
                parentID := cdsItensNotaparentID.AsInteger;
                if CharInSet(cdsItensNotaTipo.AsString[1], ['N', 'n']) then
                begin
                  if NumerarioGravado <> dtmFaturamentoERP.cdsItensNotaparentID.AsInteger then
                  begin
                    NumerarioGravado:=cdsItensNotaparentID.AsInteger;
                    qryInserir.SQL.Clear;
                    qryInserir.SQL.text := ' INSERT INTO MYINDAIAV2.dbo.Billing_CashRequested(Billing_id, cashRequests_id) '+ sLineBreak +
                                           ' VALUES(:Billing_id, :cashRequests_id)                                         '+ sLineBreak ;
                    qryInserir.Parameters.ParamValues['Billing_id']      := BillingId;
                    qryInserir.Parameters.ParamValues['cashRequests_id'] := cdsItensNotaparentID.AsInteger;
                    qryInserir.ExecSQL;
                  end;
                  cdsItensNota.Next;
                end
                else
                  cdsItensNota.Next;
              end;
                EscreveMensagem(IntToStr(QtdItens) + ' Numerários', clWindowText);
           // end;

            // Gravar Pagamentos
            if cdsItensNotaValorPagamentos.AsFloat > 0 then
            begin
              EscreveMensagem('Gravando Pagamentos na Nota...', clWindowText);

              cdsItensNota.First;
              QtdItens := 0;
              qryInserir.SQL.Clear;
              qryInserir.SQL.text :=  '  DECLARE @Billing_id         BIGINT         = :Billing_id                       '+ sLineBreak +
                                      '  DECLARE @price              NUMERIC(19, 2) = :price                            '+ sLineBreak +
                                      '  DECLARE @item_id            BIGINT         = :item_id                          '+ sLineBreak +
                                      '  DECLARE @CustomClearance_id NUMERIC(19, 2) = :CustomClearance_id               '+ sLineBreak +

                                      '  INSERT INTO MYINDAIAV2.dbo.ItemInvoiced(price, item_id,CustomClearance_id)     '+ sLineBreak +
                                      '  VALUES(@price, @item_id,@CustomClearance_id)                                   '+ sLineBreak +

                                      '  INSERT INTO MYINDAIAV2.dbo.Billing_ItemInvoiced(Billing_id, itensInvoiced_id)  '+ sLineBreak +
                                      '  SELECT @Billing_id, MAX(id)                                                    '+ sLineBreak +
                                      '  FROM MYINDAIAV2.dbo.ItemInvoiced                                               '+ sLineBreak ;

              while not cdsItensNota.Eof do
              begin
                  if cdsItensNotaTipo.AsString <> 'Numerários' then
                  begin
                    qryInserir.Parameters.ParamValues['Billing_id']         := BillingId;
                    qryInserir.Parameters.ParamValues['item_id']            := cdsItensNotaitem_id.AsInteger;
                    qryInserir.Parameters.ParamValues['price']              := cdsItensNotaValor.AsFloat;
                    qryInserir.Parameters.ParamValues['CustomClearance_id'] := cdsItensNotaCustomClearance_id.AsInteger;
                    qryInserir.ExecSQL;
                  end;
                  cdsItensNota.Next;
              end;

              cdsItensNota.First;
              QtdItens := 0;

              qryInserir.SQL.Clear;
              qryInserir.SQL.text := ' INSERT INTO MYINDAIAV2.dbo.Billing_PaymentRequested(Billing_id, payments_id)   '+ sLineBreak +
                                     ' VALUES(:Billing_id, :payments_id)                                              '+ sLineBreak ;
              while not cdsItensNota.Eof do
              begin
                if CharInSet(cdsItensNotaTipo.AsString[1], ['P', 'p']) then
                begin
                  qryInserir.Parameters.ParamValues['Billing_id']  := BillingId;
                  qryInserir.Parameters.ParamValues['payments_id'] := cdsItensNotaparentID.AsInteger;
                  qryInserir.ExecSQL;

                  parentID := cdsItensNotaparentID.AsInteger;
                  while (not cdsItensNota.Eof) and (parentID = cdsItensNotaparentID.AsInteger) do
                    cdsItensNota.Next;
                end
                else
                  cdsItensNota.Next;
              end;
              EscreveMensagem(IntToStr(QtdItens) + ' Pagamentos', clWindowText);
            end;
          end;
        finally
          //cdsItensNota.EnableControls;
        end;
        EscreveMensagem('Nota gerada com sucesso', clBlue);
        Commit;

        if DevolucaoNumerario then
        begin
          dtmFaturamentoERP.ExecSQL(' exec sp_SaldoProcesso :nr_processo' , [dtmFaturamentoERP.qryCustomClearancecustomID.AsString]);
        end;

        ShowMessage('Nota gerada com sucesso');
        ModalResult := mrOk;
      except
        on E: Exception do
        begin
          EscreveMensagem('Erro gerando a Nota: ' + E.Message, clRed);
          btnVoltar.Enabled := True; // Habilita para poder gerar novamente
          if InTransaction then
            Rollback;
        end;
      end;
    end;
end;

procedure TfrmGeraNotaFiscal.btnVoltarClick(Sender: TObject);
begin
 if nbTelas.PageIndex < 3 then
    nbTelas.PageIndex := nbTelas.PageIndex -1
  else
    nbTelas.PageIndex := 1;

  if nbTelas.PageIndex = 0  then
    Panel1.Visible :=false
  else
    Panel1.Visible :=true;

  if nbTelas.PageIndex = 1  then
  begin
    pnlAgrupar.Visible:=true;
  end
  else
  begin
    pnlAgrupar.Visible:=false;
  end;

end;

procedure TfrmGeraNotaFiscal.cxgdbtvItensFaturarSelecionadoPropertiesChange(
  Sender: TObject);
var
  ValorTotal,ValorNumerarios,ValorPagamentos,ValorReceitas :double ;
begin
    if dtmFaturamentoERP.cdsItensFaturarSelecionado.AsString='True' then
    begin
      if CharinSet(dtmFaturamentoERP.cdsItensFaturarTipo.AsString[1], ['N', 'n']) then
      begin
        ValorNumerarios := strtofloat(Label13.Caption)  + dtmFaturamentoERP.cdsItensFaturarValor_Item.AsFloat;
        Label13.Caption  := floattostr(roundto((ValorNumerarios),-2));
      end
      else if CharinSet(dtmFaturamentoERP.cdsItensFaturarTipo.AsString[1], ['P', 'p']) then
      begin
        ValorPagamentos := strtofloat(Label14.Caption) + dtmFaturamentoERP.cdsItensFaturarValor_Item.AsFloat;
        Label14.Caption  := floattostr(roundto((ValorPagamentos),-2));
      end
      else if CharinSet(dtmFaturamentoERP.cdsItensFaturarTipo.AsString[1], ['R', 'r']) then
      begin
        ValorReceitas := strtofloat(Label15.Caption) + dtmFaturamentoERP.cdsItensFaturarValor.AsFloat;
        Label15.Caption  := floattostr(roundto((ValorReceitas),-2));
      end;
      ValorTotal := strtofloat(Label15.Caption)  + strtofloat(Label14.Caption)  - strtofloat(Label13.Caption) ;
      Label16.Caption  := floattostr(roundto((ValorTotal),-2));
    end;
        if dtmFaturamentoERP.cdsItensFaturarSelecionado.AsString='False' then
    begin
      if CharinSet(dtmFaturamentoERP.cdsItensFaturarTipo.AsString[1], ['N', 'n']) then
      begin
        ValorNumerarios := strtofloat(Label13.Caption)  - dtmFaturamentoERP.cdsItensFaturarValor_Item.AsFloat;
        Label13.Caption  := floattostr(roundto((ValorNumerarios),-2));
      end
      else if CharinSet(dtmFaturamentoERP.cdsItensFaturarTipo.AsString[1], ['P', 'p']) then
      begin
        ValorPagamentos := strtofloat(Label14.Caption) - dtmFaturamentoERP.cdsItensFaturarValor_Item.AsFloat;
        Label14.Caption  := floattostr(roundto((ValorPagamentos),-2));
      end
      else if CharinSet(dtmFaturamentoERP.cdsItensFaturarTipo.AsString[1], ['R', 'r']) then
      begin
        ValorReceitas := strtofloat(Label15.Caption) - dtmFaturamentoERP.cdsItensFaturarValor_Item.AsFloat;
        Label15.Caption  := floattostr(roundto((ValorReceitas),-2));
      end;
      ValorTotal := strtofloat(Label15.Caption)  + strtofloat(Label14.Caption)  - strtofloat(Label13.Caption) ;
      Label16.Caption  := floattostr(roundto((ValorTotal),-2));
    end;

end;

procedure TfrmGeraNotaFiscal.cxgdbtvTipoFaturarStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  S: String;
begin
  if not VarIsNull(ARecord.Values[0]) then
    S := ARecord.Values[0]
  else
    S := '';
  if CharInSet(S[1], ['N', 'n']) then
    AStyle := dtmFaturamentoERP.cxsTipoNumerario
  else if CharInSet(S[1], ['P', 'p']) then
    AStyle := dtmFaturamentoERP.cxsTipoPagamento
  else if CharInSet(S[1], ['R', 'r']) then
    AStyle := dtmFaturamentoERP.cxsTipoReceita;
end;

procedure TfrmGeraNotaFiscal.cxgdbtvTipoItensNotaStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  S: String;
begin
  if not VarIsNull(ARecord.Values[0]) then
    S := ARecord.Values[0]
  else
    S := '';
  if CharInSet(S[1], ['N', 'n']) then
    AStyle := dtmFaturamentoERP.cxsTipoNumerario
  else if CharInSet(S[1], ['P', 'p']) then
    AStyle := dtmFaturamentoERP.cxsTipoPagamento
  else if CharInSet(S[1], ['R', 'r']) then
    AStyle := dtmFaturamentoERP.cxsTipoReceita;
end;

procedure TfrmGeraNotaFiscal.edtProcessoAgrupadoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
    btnAgruparProcessoClick(Sender);
end;

procedure TfrmGeraNotaFiscal.EscreveMensagem(AMsg: String; ACor: TColor);
begin
  reLog.SelStart := Length(reLog.Lines.Text);
  reLog.SelAttributes.Color := ACor;
  reLog.Lines.Add(AMsg);
  Update;
end;

function TfrmGeraNotaFiscal.Execute: Boolean;
begin
  with dtmFaturamentoERP do
  begin
    if not qryTipoFaturar.Active then
      qryTipoFaturar.Open;

    nbTelas.PageIndex := 0;
    nbTelasPageChanged(nbTelas);
    cxgdbtvTipoFaturar.ViewData.Expand(False);
    cxgdbtvItensFaturar.ViewData.Expand(False);
    Result := ShowModal = mrOk;
  end;
end;

procedure TfrmGeraNotaFiscal.FormShow(Sender: TObject);
begin
  pnlAgrupar.Visible:=false;
end;

Function TfrmGeraNotaFiscal.GrupoNestle : Boolean;
begin
  Result := (Parametros.GrupoBroker = '155');
end;

function TfrmGeraNotaFiscal.GrupoBasf: Boolean;
begin
  Result := (Parametros.GrupoBroker = '002') or (Parametros.GrupoBroker = '013') or (Parametros.GrupoBroker = 'D28');
end;

function TfrmGeraNotaFiscal.GrupoAvlisHaws: Boolean;
begin
  Result := (Parametros.GrupoBroker = 'B45');
end;

function TfrmGeraNotaFiscal.GrupoINB: Boolean;
begin
  Result := (Parametros.GrupoBroker = '154');
end;

function TfrmGeraNotaFiscal.GrupoEmbraco: Boolean;
begin
  Result := (Parametros.GrupoBroker = 'A88');
end;

function TfrmGeraNotaFiscal.GrupoFesto: Boolean;
begin
  Result := (Parametros.GrupoBroker = 'B35');
end;

function TfrmGeraNotaFiscal.GrupoFoseco: Boolean;
begin
  Result := (Parametros.GrupoBroker = '653');
end;

function TfrmGeraNotaFiscal.GrupoAirProducts: Boolean;
begin
  Result := (Parametros.GrupoBroker = '895');
end;

Function TfrmGeraNotaFiscal.GrupoChemetall : Boolean;
begin
  Result := (Parametros.GrupoBroker = '559');
end;

Function TfrmGeraNotaFiscal.GrupoSaintGobainAbrasivos : Boolean;
begin
  Result := (Parametros.GrupoBroker = '028');
end;

Function TfrmGeraNotaFiscal.GrupoMetalfrio : Boolean;
begin
  Result := (Parametros.GrupoBroker = '069');
end;

Function TfrmGeraNotaFiscal.GrupoFigwall : Boolean;
begin
  Result := (Parametros.GrupoBroker = '479');
end;

function TfrmGeraNotaFiscal.GrupoFirmenich  : Boolean;
begin
  Result := (Parametros.GrupoBroker = '118');
end;

function TfrmGeraNotaFiscal.GrupoPrometeon  : Boolean;
begin
  Result := (Parametros.GrupoBroker = 'C11');
end;

function TfrmGeraNotaFiscal.GrupoPirelli  : Boolean;
begin
  Result := (Parametros.GrupoBroker = 'C22');
end;

function TfrmGeraNotaFiscal.GrupoYara  : Boolean;
begin
  Result := (Parametros.GrupoBroker = 'C05');
end;

function TfrmGeraNotaFiscal.GrupoSeb  : Boolean;
begin
  Result := (Parametros.GrupoBroker = 'C27');
end;

function TfrmGeraNotaFiscal.GrupoMBS  : Boolean;
begin
  Result := (Parametros.GrupoBroker = 'C33');
end;

function TfrmGeraNotaFiscal.GrupoCaldic  : Boolean;
begin
  Result := (Parametros.GrupoBroker = 'D03');
end;

procedure TfrmGeraNotaFiscal.nbTelasPageChanged(Sender: TObject);
begin
  if (nbTelas.PageIndex <> 3) then
  begin
    btnVoltar.Enabled   := nbTelas.PageIndex > 0;
    btnAvançar.Enabled  := nbTelas.PageIndex < 2;
    btnConcluir.Enabled := nbTelas.PageIndex = 2;
  end;
end;

procedure TfrmGeraNotaFiscal.btnAgruparProcessoClick(Sender: TObject);
var
   customClearance_id,ProcessoADD : string ;
   Total:double;
begin
with dtmFaturamentoERP do
begin
    customClearance_id := dtmFaturamentoERP.ConsultaSQL('select id from CustomClearance where customID = :customID', [Parametros.Unidade + Parametros.Produto + edtProcessoAgrupado.Text], '');

    if customClearance_id = '' then
    begin
      MessageDlg('Erro processo não encontrado.'#13 + customClearance_id, mtError, [mbOk], 0) ;
      exit;
    end;

    if dtmfaturamentoErp.qryClienteLocal.Active then
      dtmfaturamentoErp.qryClienteLocal.Close;
    dtmfaturamentoErp.qryClienteLocal.Parameters.ParamByName('NR_PROCESSO').Value := Parametros.Unidade +Parametros.Produto + StringReplace(edtProcessoAgrupado.Text, ' ', '', [rfReplaceAll]);
    dtmfaturamentoErp.qryClienteLocal.Open;

    if Parametros.CNPJ <> dtmfaturamentoErp.qryClienteLocalCGC_EMPRESA.AsString  then
    begin
      MessageDlg('Erro CNPJ de clientes diferente!.'#13 + customClearance_id, mtError, [mbOk], 0) ;
      if dtmfaturamentoErp.qryClienteLocal.Active then
      dtmfaturamentoErp.qryClienteLocal.Close;
      dtmfaturamentoErp.qryClienteLocal.Parameters.ParamByName('NR_PROCESSO').Value :=  Parametros.Unidade + Parametros.Produto + Parametros.Processo;
      dtmfaturamentoErp.qryClienteLocal.Open;
      exit;
    end;
    cdsItensFaturar.First;
    ProcessoADD:= trim(Parametros.Unidade) + trim(Parametros.Produto) + trim(edtProcessoAgrupado.Text);
    while not cdsItensFaturar.Eof do
    begin
     if dtmfaturamentoErp.cdsItensFaturarcustomID.AsString = AnsiUpperCase(ProcessoADD)  then
     begin
       ShowMessage('Processo já adicionado!');
       exit;
     end;
       cdsItensFaturar.Next
    end;



      if qryItensFaturar.Active then
        qryItensFaturar.Close;

      qryItensFaturar.Parameters.ParamValues['customClearance_id'] := customClearance_id;

      if rdbNotaFiscalServico.Checked then
      begin
        qryItensFaturar.Parameters.ParamValues['tipo'] := 0;
    //    qryItensFaturar.Parameters.ParamValues['tipo2'] := 0;
    //    qryItensFaturar.Parameters.ParamValues['tipo3'] := 0;
      end
      else
      begin
        qryItensFaturar.Parameters.ParamValues['tipo'] := '1';
    //    qryItensFaturar.Parameters.ParamValues['tipo2'] := 1;
    //    qryItensFaturar.Parameters.ParamValues['tipo3'] := 1;
      end;
      qryItensFaturar.Open;
      AtualizaItensFaturar;
      edtProcessoAgrupado.Text:='';
      ShowMessage('Processo adicionado!');
      cdsItensFaturar.first;
      Total:=0 ;
      while not cdsItensFaturar.Eof do
      begin
        Total:= Total + cdsItensFaturarValor.AsFloat;
        cdsItensFaturar.next;
      end;
end;
end;

end.
