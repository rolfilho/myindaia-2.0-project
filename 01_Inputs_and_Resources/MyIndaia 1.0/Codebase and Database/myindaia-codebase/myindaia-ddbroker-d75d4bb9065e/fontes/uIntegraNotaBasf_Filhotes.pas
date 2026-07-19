unit uIntegraNotaBasf_Filhotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTables, Grids, DBGrids,
  Menus, ConsOnlineEx, ToolEdit, CurrEdit, DBCtrls, DBClient, ComObj,
  Provider;

type
  Tfrm_integra_nota_basf_filhotes = class(TForm)
    pnlFilhote: TPanel;
    dbgrd_filhote: TDBGrid;
    Panel1: TPanel;
    lblTipoRel: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblCNTR_FILHOTE: TLabel;
    btnOk: TBitBtn;
    btnCancelBaixaEstorno: TBitBtn;
    edtQtd_Filhote: TEdit;
    edtEspecie_Filhote: TEdit;
    cbCNTR_FILHOTE: TComboBox;
    Panel2: TPanel;
    shpTopoFilhote: TShape;
    lblnrItem: TLabel;
    lblMercadoria: TLabel;
    lblQtdeDisp: TLabel;
    lblPesoLiq: TLabel;
    lblNrNota: TLabel;
    Label3: TLabel;
    btn_co_natureza_op_filhote: TSpeedButton;
    DBText1: TDBText;
    Label5: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    edt_cd_natureza_op_filhote: TEdit;
    edt_nm_natureza_op_filhote: TEdit;
    dbnav_filhote: TDBNavigator;
    dbedt_qtde: TDBEdit;
    dbedt_nm_mercadoria: TDBEdit;
    dbedt_qtde_disponivel: TDBEdit;
    procedure btn_co_natureza_op_filhoteClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelBaixaEstornoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrd_filhoteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure geraFilhoteEXCEL;
    { Private declarations }
  public
    { Public declarations }
    prmCD_CFOP:String;
    nFilhote:Integer;
  end;

const
  xlPortrait = 1;
  xlLandscape = 2;


var
  frm_integra_nota_basf_filhotes: Tfrm_integra_nota_basf_filhotes;

implementation
uses uIntegraNotaBasf, GSMLIB, Funcoes, PGGP001, MaskUtils ;

{$R *.dfm}

procedure Tfrm_integra_nota_basf_filhotes.btn_co_natureza_op_filhoteClick( Sender: TObject);
begin
  if Sender is TSpeedButton then
    edt_cd_natureza_op_filhote.Text := ConsultaOnLineEx('TNATUREZA_OPERACAO_BASF','Natureza da Operação',['CD_NATUREZA_OP','NM_NATUREZA_OP'],['Código','Nome'],'CD_NATUREZA_OP',nil)
  else
    edt_nm_natureza_op_filhote.Text := ConsultaLookUp('TNATUREZA_OPERACAO_BASF','CD_NATUREZA_OP', edt_cd_natureza_op_filhote.Text,'NM_NATUREZA_OP');
end;

procedure Tfrm_integra_nota_basf_filhotes.btnOkClick(Sender: TObject);
begin
  geraFilhoteEXCEL;

  //cbCNTR_FILHOTE.DeleteSelected;
  //cbCNTR_FILHOTE.ItemIndex:=0;
end;

procedure Tfrm_integra_nota_basf_filhotes.btnCancelBaixaEstornoClick(
  Sender: TObject);
begin
  FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = "'+frm_integra_nota_basf.vNrProcesso+'" and CD_CFOP="'+prmCD_CFOP+'"');

  close
end;

procedure Tfrm_integra_nota_basf_filhotes.FormShow(Sender: TObject);
var
  vCdItem : integer;
begin
  if frm_integra_nota_basf.chk_Entrada.Checked then
    vCdItem := StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TNOTA_FILHOTE WHERE NR_PROCESSO = "'+frm_integra_nota_basf.vNrProcesso+'"  and CD_CFOP=  "'+prmCD_CFOP+'"', 'BLABLA'))
  else
    vCdItem := StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TNOTA_FILHOTE WHERE NR_PROCESSO = "'+frm_integra_nota_basf.vNrProcesso+'"', 'BLABLA'));

  if vCdItem = 0 then
     vCdItem := 1
  else
    Inc(vCdItem);


  if frm_integra_nota_basf.chk_Entrada.Checked = True then
    btnOk.Caption := 'Gerar Nota'
  else
    btnOk.Caption := 'Gerar Filhote';

  edt_cd_natureza_op_filhote.Text := '3949AB';
  edt_nm_natureza_op_filhote.Text := 'REMESSA';

  // na procedure AtualizaTela incluo os registros no cds
  with frm_integra_nota_basf.qry_mercadoria_filhote_ do
  begin
    Close;
    ParamByName('NR_PROCESSO').AsString :=  frm_integra_nota_basf.msk_cd_unid_neg.Text + '01' + frm_integra_nota_basf.qry_di_nota_.Fields[0].AsString;
    Open;

    while not Eof do
    begin
      if (qry_di_filtros.FieldByName('CD_CHAVE').AsString=FieldByName('CD_CFOP').AsString) or (frm_integra_nota_basf.chk_Entrada.Checked=false) then
      begin
         FastExecSQL( 'INSERT TNOTA_FILHOTE (CD_ITEM, CD_MERCADORIA, AP_MERCADORIA, QTDE_COMERC,PL_MERCADORIA, QTDE_BAIXADA, NM_UNID_MEDIDA, NR_PROC_PO, NR_ITEM_PO, NR_ADICAO, NR_PARCIAL, NR_PROCESSO, CD_CFOP ) ' +
                      ' VALUES ( ''' + IntToStr(vCdItem) + ''', ''' + FieldByName('CD_MERCADORIA').AsString + ''',''' + StringReplace( FieldByName('AP_MERCADORIA').AsString, #39,' ', [] ) + ''' ' +
                      ', ''' + StringReplace( FieldByName('QTDE_COMERC').AsString, ',', '.', [rfReplaceAll]) +
                      ''',''' + StringReplace( FieldByName('PL_MERCADORIA').AsString, ',', '.', [rfReplaceAll]) + ''',0,''' +
                      FieldByName('NM_UNID_MEDIDA').AsString + ''',''' + FieldByName('NR_PROC_PO').AsString +
                      ''',''' + FieldByName('NR_ITEM_PO').AsString + ''',''' + FieldByName('NR_ADICAO').AsString + ''',''' +FieldByName('NR_PARCIAL').AsString+
                      ''',''' + FieldByName('NR_PROCESSO').AsString +''','''+prmCD_CFOP+''')');
         Inc(vCdItem);
      end;
      Next;
    end;
  end;

  frm_integra_nota_basf.AtualizaTela_Excel(prmCD_CFOP);
end;


procedure Tfrm_integra_nota_basf_filhotes.geraFilhoteEXCEL;
var
  i, lin : integer;
  vQtde, vQtdeBaixar, AFRMM_Item: Real;
  vPesoLiqItem, vPesoLiqFilhote, vPesoBrutoFilhote,
  vPesoBrutoDi, vPesoLiqDi, vQtdeComerc, vPl_Mercadoria,
  vCalcBaseIcms, vCalcBaseIPI, vCalcBaseIPIItem, vVL_PIS_ITEM,
  vVL_COFINS_ITEM, vBASE_PIS_COFINS, vAliqPis, vVL_MLE, vVL_FOB, vVL_MLE_ITEM, vVL_FOB_ITEM : Double;
  vVL_TX_SCX_ITEM,  vVL_BASE_CALC_II, vVL_II_ITEM, vVL_FRETE_ITEM, vVL_SEGURO_ITEM : Double;
  vBaseIcms,  vAliqIcms, vIcms, vBaseIpi, vIpi, vProc_Po, vCdItemPo, vNrParcialPo, vVlMercadoriaFilhote, strLin : String;
  Excel, oSheet : OleVariant;
  IN_EMBUT_FRT, IN_EMBUT_SEG : Boolean;

  function ReConverteToExcel(valor:String ; Casas_Decimais:Integer):String;
  begin
    System.Insert('.',Valor,Length(Valor)-(Casas_Decimais-1));
    Result:= Valor;
  end;
begin
  if ConsultaLookUPSQL(' SELECT COUNT(*) COUNT FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = '''+frm_integra_nota_basf.vNrProcesso+'''', 'COUNT') <>
     ConsultaLookUPSQL(' SELECT COUNT(*) COUNT FROM (SELECT NR_PROC_PO, NR_ITEM_PO, NR_PARCIAL FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = '''+frm_integra_nota_basf.vNrProcesso+''''+
                                                      ' GROUP BY NR_PROC_PO, NR_ITEM_PO, NR_PARCIAL) AS TABELA', 'COUNT') then  begin
    ShowMessage( 'Existem mercadorias com as mesmas informações de PO.'+#13+'Contate o responsável pela DI.');
    Exit;
  end;

  Excel := GetActiveOleObject('Excel.Application');

  if dbgrd_filhote.SelectedRows.Count > 0 then
  begin
    vPesoLiqFilhote := 0;
    for i := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
    begin
      TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
      vCdItemPo      := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('NR_ITEM_PO').AsString;
      vQtdeComerc    := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_COMERC').AsFloat;
      vPl_Mercadoria := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('PL_MERCADORIA').AsFloat;
      vQtdeBaixar    := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat;
      vPesoLiqItem   := (vQtdeBaixar * vPl_Mercadoria / vQtdeComerc); // * 1000;

      vPesoLiqFilhote := vPesoLiqFilhote + vPesoLiqItem;

      if vQtdeBaixar = 0 then
      begin
        ShowMessage( ' A qtde baixada não pode estar zerada.');
        Exit;
      end
      else
      if  vQtdeBaixar > frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_DISPONIVEL').AsFloat then
      begin
        ShowMessage( ' A qtde baixada não pode ser superior a qtde disponível.');
        Exit;
      end;
    end;

    { copia a planilha mãe para a(s) filhote(s) }
    Excel.WorkBooks[1].Worksheets[1].Cells.Cells.Copy;

    /////////////////////////////////////////////////////////////
    //                                                         //
    //   Cmmt: 11012012_01                                     //
    //                                                         //
    //                                                         //
    //    Atendendo à ocorrência 23926/11, é feita a inclusão  //
    //    de uma coluna com o valor "Base IPI por Item". Com   //
    //    isso, são remanejadas todas as outras colunas após   //
    //    a adicionada. Não foi alterado o modelo de planilhas //
    //    da Saint-Gobain, sendo este um caso especial.        //
    //                                                         //
    //    Aqui são feitas as alterações para as planilhas      //
    //    filhotes.                                            //
    //                                                         //
    //                          Eric, 17:04, 11/01/2012        //
    /////////////////////////////////////////////////////////////

    { Cria as Filhotes }
    inc(nFilhote);
    Excel.WorkBooks[1].Worksheets.Add;
    Excel.WorkBooks[1].ActiveSheet.Paste;
    Excel.WorkBooks[1].ActiveSheet.Range['A1'].Select;
    if frm_integra_nota_basf.chk_entrada.Checked then
      Excel.WorkBooks[1].ActiveSheet.Name:='Filhote '+qry_di_filtros.FieldByName('CD_CHAVE').AsString+'_'+intTostr(nFilhote)
    else
      Excel.WorkBooks[1].ActiveSheet.Name:=intTostr(nFilhote);

    {redimensiona a impressão}
    Excel.WorkBooks[1].ActiveSheet.PageSetup.Zoom               := 70;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.LeftMargin         := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.RightMargin        := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.TopMargin          := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.BottomMargin       := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.HeaderMargin       := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.FooterMargin       := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.CenterHorizontally := True;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.CenterVertically   := True;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.Orientation        := xlLandscape;
    {fim - redimensiona a impressão}

    //limpar conteudo da planilha recem colada
    strLin := intToStr(vUlt_Lin_Merc_Excel);
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'B12:B' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'C12:C' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'D12:D' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'E12:E' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'F12:F' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'K12:K' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'L12:L' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'M12:M' + strLin)].ClearContents;
    Excel.WorkBooks[1].ActiveSheet.Range[AdjustCellsCliente(Excel.WorkBooks[1].ActiveSheet, 'O12:O' + strLin)].ClearContents;

    //Limpa as colunas remanejadas.
    //                 Eric,    16:44h     11/01/2012

    oSheet  := Excel.WorkBooks[1].ActiveSheet;
    oSheet.Range[AdjustCellsCliente(oSheet, 'U12:AC' + strLin)].ClearContents;
    oSheet.Range[AdjustCellsCliente(oSheet, 'AE12:AE' + strLin)].ClearContents;
    oSheet.Range[AdjustCellsCliente(oSheet, 'AG12:AG' + strLin)].ClearContents;

    if vUlt_Lin_Merc_Excel>28 then
      frm_integra_nota_basf.Preenche_IMO_EXCEL(oSheet ,51+(vUlt_Lin_Merc_Excel-28))
    else
      frm_integra_nota_basf.Preenche_IMO_EXCEL(oSheet ,51); 

    vPesoLiqDi        := (frm_integra_nota_basf.qry_di_adicao_.FieldByName('PESO_LIQ_XLS').AsFloat);
    vPesoBrutoDi      := (frm_integra_nota_basf.qry_di_adicao_.FieldByName('PESO_BRUTO_XLS').AsFloat);

    IN_EMBUT_FRT       := frm_integra_nota_basf.qry_di_adicao_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean;
    IN_EMBUT_SEG       := frm_integra_nota_basf.qry_di_adicao_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean;

    vPesoBrutoFilhote :=  (vPesoLiqFilhote * vPesoBrutoDi)/vPesoLiqDi; //*1000);

    oSheet.Cells[5, GetColunaCliente(oSheet, 'C')].Value := edt_cd_natureza_op_filhote.Text;
    oSheet.Cells[5, GetColunaCliente(oSheet, 'H')].Value := edt_nm_natureza_op_filhote.Text;

    //Reajusta as colunas remanejadas.
    //                         Eric, 16:48h    11/01/2012

    // Adicionado por Michel em 18/12/2012 para colocar por Sheet o Pedido do item
    oSheet.Cells[4, GetColunaCliente(oSheet, 'L')].Value := Trim(frm_integra_nota_basf.cds_nota_filhote_.FieldByName('NR_PROC_PO').AsString);

    oSheet.Cells[5, GetColunaCliente(oSheet, 'U')].Value := edtQtd_Filhote.Text;
    oSheet.Cells[5, GetColunaCliente(oSheet, 'V')].Value := edtEspecie_Filhote.Text;

    if (frm_integra_nota_basf.qry_di_adicao_TP_ESTUFAGEM.AsString='1') and not frm_integra_nota_basf.tem_desova  then
    begin
      if cbCNTR_FILHOTE.Text<>'' then
      begin
        oSheet.Cells[5, GetColunaCliente(oSheet, 'W')].Value :=copy(cbCNTR_FILHOTE.Text,1,4) ; //marca
        oSheet.Cells[5, GetColunaCliente(oSheet, 'X')].Value :=copy(cbCNTR_FILHOTE.Text,5,3)+'.'+
                                                               copy(cbCNTR_FILHOTE.Text,8,3)+'-'+
                                                               copy(cbCNTR_FILHOTE.Text,11,1); //numero
      end
      else
      begin
        oSheet.Cells[5, GetColunaCliente(oSheet, 'W')].Value :=' '; //marca
        oSheet.Cells[5, GetColunaCliente(oSheet, 'X')].Value :=' '; //numero
      end;
    end
    else
    begin
      oSheet.Cells[5, GetColunaCliente(oSheet, 'W')].Value := ' ';
      oSheet.Cells[5, GetColunaCliente(oSheet, 'X')].Value := ' ';
    end;


    oSheet.Cells[5, GetColunaCliente(oSheet, 'Y')].Value := MyRound(vPesoBrutoFilhote,5);
    oSheet.Cells[5, GetColunaCliente(oSheet, 'Z')].Value := MyRound(vPesoLiqFilhote,5);
    oSheet.Cells[5, GetColunaCliente(oSheet, 'AA')].Value := 'N';  // NF NÃO É MÃE

    lin:=12;
    for i := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
    begin
      TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
      vQtde        := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_COMERC').AsFloat;
      vQtdeBaixar  := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat;
      vProc_Po     := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('NR_PROC_PO').AsString;
      vCdItemPo    := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('NR_ITEM_PO').AsString;
      vNrParcialPo := frm_integra_nota_basf.cds_nota_filhote_.FieldByName('NR_PARCIAL').AsString;

      FastExecSQL( ' UPDATE TNOTA_FILHOTE SET QTDE_BAIXADA = QTDE_BAIXADA + ' + StringReplace( frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsString, ',', '.', [rfReplaceAll]) + ' WHERE NR_PROCESSO="'+frm_integra_nota_basf.vNrProcesso+'" AND CD_ITEM = "' + frm_integra_nota_basf.cds_nota_filhote_.FieldByName('CD_ITEM').AsString + '" and CD_CFOP="'+prmCD_CFOP+'"');

      // N2 Mercadorias
      with frm_integra_nota_basf.qry_di_mercadoria_ do
      begin
        if Locate('PO;NR_ITEM_PO;NR_PARCIAL', VarArrayOf([trim(vProc_Po),vCdItemPo,vNrParcialPo]), []) then
        begin

          // Valor total da Base de IPI e ICMS calculados de acordo com a quantidade baixada
          vCalcBaseIPI  := MyRound(FieldByName('VL_BASE_IPI_UNITARIO').AsFloat  * frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat,2);
          vCalcBaseIcms := MyRound(FieldByName('VL_BASE_ICMS_UNITARIO').AsFloat * frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat,2);
          vCalcBaseIPIItem := MyRound(FieldByName('VL_BASE_IPI_UNITARIO').AsFloat * frm_integra_nota_basf.cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat, 2);

          // IPI
          vBaseIpi  := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);

      {    if  (FieldByName('IN_IPI_NAO_TRIBUT').AsString='True')  or
              (FieldByName('CD_REGIME_TRIBUTAR').AsString='6' ) or
              (FieldByName('CD_TIPO_BENEF_IPI').AsString='1' ) or (FieldByName('CD_TIPO_BENEF_IPI').AsString='5' ) then
            vIpi:='0'
          else
            vIpi:= PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);    }

          vIpi:= PoeZeros(StringReplace(FormatFloat('0.00',(FieldByName('VL_IPI').AsFloat/100)), ',', '', [rfReplaceAll]),3);

          //ICMS
          if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
          begin
            vIcms     := '0';
            vAliqIcms:='0';
          end
          else
          begin
            vIcms     := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
            vAliqIcms := FieldByName('ALIQ_ICMS').AsString;
            if trim(vAliqIcms)='' then
              vAliqIcms:='0';
          end;

          vAliqPIS          :=  MyRound(FieldByName('ALIQ_PIS').AsFloat,3);
          vVL_PIS_ITEM      :=  ( ( ( FieldByName('VL_PIS_ITEM').AsFloat     / 100 ) / vQtde ) * vQtdeBaixar ) * 100;
          vVL_COFINS_ITEM   :=  ( ( ( FieldByName('VL_COFINS_ITEM').AsFloat  / 100 ) / vQtde ) * vQtdeBaixar ) * 100;
          vVL_TX_SCX_ITEM   :=  ( ( ( FieldByName('VL_TX_SCX_ITEM').AsFloat  / 100 ) / vQtde ) * vQtdeBaixar ) * 100;
          vVL_BASE_CALC_II  :=  ( ( ( FieldByName('VL_BASE_CALC_II').AsFloat / 100 ) / vQtde ) * vQtdeBaixar ) * 100;
          vVL_II_ITEM       :=  ( ( ( FieldByName('VL_II_ITEM').AsFloat      / 100 ) / vQtde ) * vQtdeBaixar ) * 100;
          vVL_MLE_ITEM      :=  ( ( ( FieldByName('VL_MLE_ITEM_MN').AsFloat  / 100 ) / vQtde ) * vQtdeBaixar ) * 100;
          vVL_FRETE_ITEM    :=  ( ( ( FieldByName('VL_FRETE_ITEM_MN').AsFloat  / 100 ) / vQtde ) * vQtdeBaixar ) * 100;
          vVL_SEGURO_ITEM   :=  ( ( ( FieldByName('VL_SEGURO_ITEM_MN').AsFloat / 100 ) / vQtde ) * vQtdeBaixar ) * 100;

          if (vVL_PIS_ITEM=0) or  (vAliqPIS=0) then
            vBASE_PIS_COFINS:=0
          else
            vBASE_PIS_COFINS :=  ( vVL_PIS_ITEM / vAliqPIS ) * 100;

          vVlMercadoriaFilhote := FloatToStr(MyRound(vQtdeBaixar * FieldByName('VL_MERCADORIA').AsFloat/100/vQtde, 2) * 100);

          oSheet.Cells[lin, GetColunaCliente(oSheet, 'B')].Value := FieldByName('CD_MERCADORIA').AsString;

          if frm_integra_nota_basf.rgDescricao.ItemIndex=0 then
            oSheet.Cells[lin, GetColunaCliente(oSheet, 'C')].Value := FieldByName('AP_MERCADORIA').AsString
          else
            oSheet.Cells[lin, GetColunaCliente(oSheet, 'C')].Value := FieldByName('MERCADORIA_DI').AsString;

          {quando o texto é muito grande, evitar que o excel ative a quebra de linha na celula}
          oSheet.Range[AdjustCellsCliente(oSheet, 'C' + IntToStr(lin))].WrapText := False;

          oSheet.Cells[lin, GetColunaCliente(oSheet, 'D')].Value := FieldByName('NCM').AsString;
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'E')].Value := FieldByName('UNID_MEDIDA').AsString;

          {re-converter valores usados na geração do TXT para serem usados no Excel corretamente }
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'F')].Value  := vQtdeBaixar;
          if vIpi='0' then
          begin
            oSheet.Cells[lin, GetColunaCliente(oSheet, 'K')].Value := '';
            oSheet.Cells[lin, GetColunaCliente(oSheet, 'M')].Value := '';
          end
          else
          begin
            oSheet.Cells[lin, GetColunaCliente(oSheet, 'K')].Value := ReConverteToExcel( vIpi, 2);
            oSheet.Cells[lin, GetColunaCliente(oSheet, 'M')].Value := ReConverteToExcel( FieldByName('ALIQ_IPI').AsString, 2);
          end;
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'L')].Value  := ReConverteToExcel( vAliqIcms, 2);
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'O')].Value  := vBASE_PIS_COFINS;

          {celulas ocultas}
          vVL_FOB:=vVL_MLE_ITEM;
          if IN_EMBUT_FRT then
            vVL_FOB:=vVL_FOB-vVL_FRETE_ITEM;

          if IN_EMBUT_SEG then
            vVL_FOB:=vVL_FOB-vVL_SEGURO_ITEM;


          //    Campos das colunas T até AD deslocados à frente 1 célula,
          // Agora são colunas U até AE.
          //    É adicionada também a coluna 'Base IPI por Item', pedida
          // na ocorrência.
          //                     Eric 11/01/2012 16:54h
          //

          oSheet.Cells[lin, GetColunaCliente(oSheet, 'T')].Value := vCalcBaseIPIItem; // Base IPI por Item
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'U')].Value := vVL_MLE_ITEM; //Valor vVL_MLE
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'V')].Value := vVL_FOB; //Fob
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'W')].Value := vVL_FRETE_ITEM; //Frete
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'X')].Value := vVL_SEGURO_ITEM; //Seguro
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'Y')].Value := ( ( ( FieldByName('VL_ACRESCIMO_ITEM_MN').AsFloat / 100 ) / vQtde ) * vQtdeBaixar ) * 100; //Acrescimos
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'Z')].Value := ( ( ( FieldByName('VL_DEDUCAO_ITEM_MN').AsFloat / 100 ) / vQtde ) * vQtdeBaixar ) * 100; //Deduções

          oSheet.Cells[lin, GetColunaCliente(oSheet, 'AA')].Value := vVL_TX_SCX_ITEM; //TX SISCOMEX
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'AB')].Value := vVL_PIS_ITEM;
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'AC')].Value := vVL_COFINS_ITEM;
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'AE')].Value := vVL_II_ITEM;      // II
          //oSheet.Cells[lin, GetColunaCliente(oSheet, 'AF')].Value  := ReConverteToExcel( vIcms, 2);
          //oSheet.Cells[lin, GetColunaCliente(oSheet, 'AG')].Value := ( ( ( frm_integra_nota_basf.vTOT_MARINHA_MAE  / 100 ) / frm_integra_nota_basf.vTOT_PESO_LIQ ) * vQtdeBaixar ) * 100;
          AFRMM_Item := ((frm_integra_nota_basf.vTOT_MARINHA_MAE / frm_integra_nota_basf.vTOT_PESO_LIQ) * FieldByName('PL_MERCADORIA').AsFloat);
          oSheet.Cells[lin, GetColunaCliente(oSheet, 'AG')].Value := (AFRMM_Item / vQtde) * vQtdeBaixar;

        end;
        inc(lin);
      end;// with mercadoria
    end; // for

    { Re-Ordena as Planilhas em Ordem Crescente a Partir da Mãe }
{
    For i := 1 To Excel.WorkBooks[1].Worksheets.count do begin
       For x := 1 To Excel.WorkBooks[1].Worksheets.count-1 do begin
         If Excel.WorkBooks[1].Worksheets[x].Name  >  Excel.WorkBooks[1].Worksheets[x+1].Name Then
             Excel.WorkBooks[1].Worksheets[x].Move [ after:=Excel.WorkBooks[1].Worksheets[x+1] ];
       End;
    end;
    Excel.WorkBooks[1].Worksheets[1].select;

}

{
    Excel.WorkBooks[1].Worksheets['MÃE'].Move [ Before := Excel.WorkBooks[1].Worksheets[1] ] ;
    for x:=1 to Excel.WorkBooks[1].Worksheets.count-1 do begin
      Excel.WorkBooks[1].Worksheets[intTostr(x)].Move   [ After  := Excel.WorkBooks[1].Worksheets[x] ] ;
      //Protege as Filhotes
      Excel.WorkBooks[1].Worksheets[intTostr(x)].protect(Password:=vPW, Contents:=True );
    end;
    Excel.WorkBooks[1].Worksheets['MÃE'].select;
 }


    ShowMessage('Filhote Gerada com Sucesso.');

    frm_integra_nota_basf.AtualizaTela_Excel(qry_di_filtros.FieldByName('CD_CHAVE').AsString);
    lblNrNota.Caption := FStrZero(IntToStr(StrToInt(lblNrNota.Caption) + 1),3);
    frm_integra_nota_basf.pnlTopo.Enabled := True;

    if frm_integra_nota_basf.qry_nota_filhote_.RecordCount=0 then
      Close;
  end
  else
    ShowMessage('Selecione um item.');
end;

procedure Tfrm_integra_nota_basf_filhotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = "'+frm_integra_nota_basf.vNrProcesso+'" ');
  close
end;

procedure Tfrm_integra_nota_basf_filhotes.dbgrd_filhoteMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if frm_integra_nota_basf.cds_nota_filhote_.recordcount > 0 then
  begin
    if  dbgrd_filhote.SelectedIndex = 7 then
    begin
      if Button = mbRight then
      begin
        frm_integra_nota_basf.cds_nota_filhote_.edit;
        frm_integra_nota_basf.cds_nota_filhote_QTDE_BAIXAR.value :=  frm_integra_nota_basf.cds_nota_filhote_QTDE_DISPONIVEL.Value;
        frm_integra_nota_basf.cds_nota_filhote_.post;
      end;
    end;
  end;
end;

end.
