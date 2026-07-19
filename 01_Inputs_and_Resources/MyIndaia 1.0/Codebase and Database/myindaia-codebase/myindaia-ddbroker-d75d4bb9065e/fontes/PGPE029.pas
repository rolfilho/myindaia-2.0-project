unit PGPE029;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, DBTables, Db,
  ppViewr, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppReport, ppPrnabl,
  ppClass, ppStrtch, ppSubRpt, ppBands, ppCache, ppProd, ppModule, raCodMod,
  ppRegion, ppMemo, ppParameter, ppVar, PGPE030;

type
  Tfrm_exp_impr_fatura = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    btn_nr_processo: TSpeedButton;
    SpeedButton1: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Quant: TRadioGroup;
    chkbox_venda_incoterm: TCheckBox;
    cbo_tipo: TComboBox;
    chk_grupo_emb_sup: TCheckBox;
    msk_espaco: TEdit;
    chkbox_remessa: TCheckBox;
    Panel3: TPanel;
    Ok_btn: TBitBtn;
    Retorna: TBitBtn;
    pnlPedidos: TPanel;
    cbo_Pedidos: TComboBox;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ok_btnClick(Sender: TObject);
    procedure RetornaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure QuantClick(Sender: TObject);
    procedure QuantExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
  private
    { Private declarations }
    lHabilita_NCM_DOC, lHabilita_NALADI_DOC : Boolean;

    function NomeArquivo : String;
    procedure pBeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppFooterFaturaBeforePrint(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure CarregaPedidos;

  public
    { Public declarations }
    str_nr_proc_exp : String[18];
    str_cd_unid_neg_exp : String[2];
    lVendaIncoterm : Boolean;
    cDir_RPT : String;
  end;

var
  frm_exp_impr_fatura: Tfrm_exp_impr_fatura;
  ReportFileName : String;

implementation

uses ConsOnLineEx, PGSM990;

{$R *.DFM}

procedure Tfrm_exp_impr_fatura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_exp_impr_fatura do
  begin
    TUnidNeg.Close;
    TInstNeg.Close;
    TProcesso.Close;
    TProc.Close;
    TProcI.Close;
    TConsig.Close;
    TViaTr.Close;
    TExp.Close;
    TImp.Close;
    TLocal1.Close;
    TLocal2.Close;
    TNotf1.Close;
    TNotf2.Close;
    TDoc.Close;
    TCopia.Close;
    TReferencia.Close;
    TAnalistas.Close;
    TPais1.Close;
    TPais2.Close;
    TPais3.Close;
    TProcEmb.Close;
    TEmb.Close;
    TBancoExp.Close;
    TMoeda.Close;
    TSoma_Itens.Close;
    TSomaProcEmb.Close;
    TVerif_Pais_Item.Close;
    TCartaCred.Close;
    Free;
  end;
//  Action := caFree;
end;

procedure Tfrm_exp_impr_fatura.Ok_btnClick(Sender: TObject);
var
  lCorresponde : Boolean;
  str_exw, str_exw2, str_exw3 : String;
  vGrupo: string;

begin
  Screen.Cursor := crHourGlass;

  try
    vGrupo := ConsultaLookUPSQL('select CD_GRUPO from tprocesso where nr_processo = ''' + msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text + '''','CD_GRUPO');

    with datm_exp_impr_fatura do
    begin
      if Trim( msk_nr_processo.Text ) = '' then
      begin
        ShowMessage('Informar Nº do processo !');
        msk_nr_processo.SetFocus ;
        Exit;
      end;

      TProcesso.Close;
      TProcesso.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TProcesso.Prepare;
      TProcesso.Open;

      if TProcesso.EOF then
      begin
        Screen.Cursor := crArrow;
        ShowMessage('Processo não encontrado !');
        msk_nr_processo.SetFocus;
        Exit;
      end;

      // Filtra TProcesso_Exp Header e  Filtra Termo de Pagto
      if lVendaIncoterm = chkbox_venda_incoterm.Checked then
      begin
        str_exw := 'E.VL_TOT_EXW, '
      end
      else // São diferentes
      begin
        if frm_exp_impr_fatura.chkbox_venda_incoterm.Checked then
        begin // Soma
          str_exw := '( ISNULL( E.VL_TOT_EXW, 0 ) + ISNULL( E.VL_FRETE + , 0 ) + ISNULL( E.VL_SEGURO, 0 ) + ISNULL( E.VL_ACRESCIMO, 0 ) - ISNULL( E.VL_DESCONTO, 0 ) - ISNULL( E.VL_TOT_DESPESA, 0 ) ) AS VL_TOT_EXW, '
        end
        else
        begin // Subtrai
          str_exw := '( ISNULL( E.VL_TOT_EXW, 0 ) - ISNULL( E.VL_FRETE, 0 ) - ISNULL( E.VL_SEGURO, 0 ) + ISNULL( E.VL_ACRESCIMO, 0 ) - ISNULL( E.VL_DESCONTO, 0 ) - ISNULL( E.VL_TOT_DESPESA, 0 ) ) AS VL_TOT_EXW, '
        end;
      end;

//      if chkbox_venda_incoterm.Checked then
//         str_exw := '( E.VL_TOT_EXW + E.VL_FRETE + E.VL_SEGURO + E.VL_ACRESCIMO - E.VL_DESCONTO - E.VL_TOT_DESPESA ) AS VL_TOT_EXW, '
//      else str_exw := 'E.VL_TOT_EXW, ';

      TProcVerifica.Close;
      TProcVerifica.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TProcVerifica.Prepare;
      TProcVerifica.Open;

      TProc.Close;
      TProc.SQL.Clear;
      if ( TProcVerifica.FieldByName('CD_PAIS_DESTINO').AsString = '081' ) or   // Bangladesh
//         ( TProcVerifica.FieldByName('CD_PAIS_DESTINO').AsString = '317' ) or   // Guatemala
         ( TProcVerifica.FieldByName('CD_PAIS_DESTINO').AsString = '249' ) then // USA
      begin
        if lVendaIncoterm = chkbox_venda_incoterm.Checked then
        begin
          str_exw := '( SELECT SUM( ISNULL( I.VL_TOT_ITEM, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_TOT_EXW, ';
          str_exw2 := '';
        end
        else // São diferentes
        begin
          if frm_exp_impr_fatura.chkbox_venda_incoterm.Checked then
          begin // Soma
            str_exw  := '( SELECT SUM( ISNULL( I.VL_TOT_ITEM, 0 ) +  ISNULL( I.VL_FRETE, 0 ) + ISNULL( I.VL_SEGURO, 0 ) + ISNULL( I.VL_ACRESCIMO, 0 ) - ISNULL( I.VL_DESCONTO, 0 ) - ISNULL( I.VL_DESPESA, 0 ) ) ';
            str_exw2 := 'FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE E.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_TOT_EXW, ';
          end
          else
          begin // Subtrai
            str_exw  := '( SELECT SUM( ISNULL( I.VL_TOT_ITEM, 0 ) - ( ISNULL( I.VL_FRETE, 0 ) + ISNULL( I.VL_SEGURO, 0 ) + ISNULL( I.VL_ACRESCIMO, 0 ) - ISNULL( I.VL_DESCONTO, 0 ) - ISNULL( I.VL_DESPESA, 0 ) ) ) ';
            str_exw2 := 'FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE E.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_TOT_EXW, ';
          end;
        end;

        TProc.SQL.Add(
          'SELECT E.NR_PROCESSO, P.NR_PEDIDO, P.NR_FATURA, E.DT_FATURA, E.CD_CARTA_CREDITO, ' +
          '( SELECT SUM( ISNULL( I.VL_TOT_PESO_LIQ, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_PESO_LIQUIDO, ' +
          '( SELECT SUM( ISNULL( I.VL_TOT_PESO_BRUTO, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_PESO_BRUTO, ' +
          '( SELECT SUM( ISNULL( I.VL_CUBAGEM, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_TOT_CUBAGEM, ' +
          str_exw + str_exw2 +
          '( SELECT SUM( ISNULL( I.VL_MLE, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_TOT_FOB, ' +
          '( SELECT SUM( ISNULL( I.VL_FRETE, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_FRETE, ' +
          '( SELECT SUM( ISNULL( I.VL_SEGURO, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_SEGURO, ' +
          '( SELECT SUM( ISNULL( I.VL_MCV, 0 ) ) FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) WHERE P.NR_PROCESSO = I.NR_PROCESSO AND P.NR_PEDIDO = I.NR_PEDIDO ) AS VL_TOT_MCV, '+
          'P.TX_INF_EMBALAGEM, P.TX_MARCACAO_VOLUME, E.TX_DECL_EXPORTADOR, '+
          'E.CD_EXPORTADOR, isnull(E.VL_INLAND_FREIGHT,0) VL_INLAND_FREIGHT , E.CD_IMPORTADOR, E.CD_LOCAL_DESTINO, E.CD_LOCAL_ORIGEM, E.CD_VIA_TRANSPORTE, E.CD_TERMO_PAGTO, E.TP_CONSIGNATARIO, E.CD_LINGUA_PEDIDO, '+
          'E.CD_CONSIGNATARIO, E.TP_NOTIFY1, E.CD_NOTIFY1, E.TP_NOTIFY2, E.CD_NOTIFY2, E.TP_DOCUMENTO, E.CD_DOCUMENTO, E.TP_COPIA, E.CD_COPIA, E.CD_MOEDA, E.TP_POS_AD, '+
          'ISNULL( E.CD_LOCAL_DESPACHO, "" ) AS CD_LOCAL_DESPACHO, E.CD_INCOTERM, '+
          'CASE E.CD_INCOTERM WHEN "EXW" THEN "TOTAL EXW" ELSE ' +
          'CASE WHEN E.CD_VIA_TRANSPORTE IN ("04","07") THEN "TOTAL FCA" '+
          'ELSE "TOTAL FOB" END END AS TOTAL, E.TX_DECL_ADICIONAL, '+
          'E.CD_PAIS_ORIG AS CD_PAIS_ORIGEM, E.CD_PAIS_DESTINO AS CD_PAIS_DESTINO, E.CD_TIPO_FRETE, '+
          'CASE E.CD_LINGUA_PEDIDO WHEN "0" THEN ISNULL( T.TX_TERMO_PORT, "" ) WHEN "1" THEN ISNULL( T.TX_TERMO_INGLES, "" ) WHEN "2" THEN ISNULL( T.TX_TERMO_ESP, "" ) '+
          'END AS NM_TERMO_PAGTO,  '+
          'CASE E.CD_LINGUA_PEDIDO '+
          '   WHEN "0" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, E.DT_FATURA ) ), 2 ) + " de " +'+
          '       CASE DATEPART( m, E.DT_FATURA )'+
          '          WHEN 1 THEN "Janeiro"'+
          '          WHEN 2 THEN "Fevereiro"'+
          '          WHEN 3 THEN "Março"'+
          '          WHEN 4 THEN "Abril"'+
          '          WHEN 5 THEN "Maio"'+
          '          WHEN 6 THEN "Junho"'+
          '          WHEN 7 THEN "Julho"'+
          '          WHEN 8 THEN "Agosto"'+
          '          WHEN 9 THEN "Setembro"'+
          '          WHEN 10 THEN "Outubro"'+
          '          WHEN 11 THEN "Novembro"'+
          '          WHEN 12 THEN "Dezembro"'+
          '       END + " de " + CONVERT( char(4), DATEPART( yyyy, E.DT_FATURA ) )'+
          '   WHEN "1" THEN'+
          '       CASE DATEPART( m, E.DT_FATURA )'+
          '          WHEN 1 THEN "January"'+
          '          WHEN 2 THEN "February"'+
          '          WHEN 3 THEN "March"'+
          '          WHEN 4 THEN "April"'+
          '          WHEN 5 THEN "May"'+
          '          WHEN 6 THEN "June"'+
          '          WHEN 7 THEN "July"'+
          '          WHEN 8 THEN "August"'+
          '          WHEN 9 THEN "September"'+
          '          WHEN 10 THEN "October"'+
          '          WHEN 11 THEN "November"'+
          '          WHEN 12 THEN "December"'+
          '       END + " " + RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, E.DT_FATURA ) ), 2 ) +'+
          '       CASE RIGHT( CONVERT( varchar(2), DATEPART( d, E.DT_FATURA ) ), 1 )'+
          '          WHEN "1" THEN "st"'+
          '          WHEN "2" THEN "nd"'+
          '          ELSE "th"'+
          '       END + ", " + CONVERT(char(4), DATEPART( yyyy, E.DT_FATURA ) )'+
          '   WHEN "2" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, E.DT_FATURA ) ), 2 ) + " de " +'+
          '       CASE DATEPART( m, E.DT_FATURA )'+
          '          WHEN 1 THEN "Enero"'+
          '          WHEN 2 THEN "Febrero"'+
          '          WHEN 3 THEN "Marzo"'+
          '          WHEN 4 THEN "Abril"'+
          '          WHEN 5 THEN "Mayo"'+
          '          WHEN 6 THEN "Junio"'+
          '          WHEN 7 THEN "Julio"'+
          '          WHEN 8 THEN "Agosto"'+
          '          WHEN 9 THEN "Septiembre"'+
          '          WHEN 10 THEN "Octubre"'+
          '          WHEN 11 THEN "Noviembre"'+
          '          WHEN 12 THEN "Diciembre"'+
          '       END  + " de " + CONVERT(char(4), DATEPART( yyyy, E.DT_FATURA ) )'+
          'END AS DATA_FATURA, E.VL_ACRESCIMO, E.VL_DESCONTO, IN_REFERENCIA_FAT_INST, E.CD_INST_NEGOC, '+
          ' Upper( CASE substring(E.CD_INCOTERM,1,1) '+
          ' when ''E'' THEN (SELECT END_CIDADE FROM TEMPRESA_NAC WHERE CD_EMPRESA= E.CD_EXPORTADOR ) '+
          ' WHEN ''F'' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.CD_LOCAL_ORIGEM) '+
          ' WHEN ''C'' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.CD_LOCAL_DESTINO) '+
          ' WHEN ''D'' THEN (SELECT EE1.END_CIDADE FROM TEMPRESA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA *= E.CD_IMPORTADOR) '+
          ' END) AS LOCAL_TOTAL '+
          'FROM   TPROCESSO_EXP E ( NOLOCK ), TTERMO_PAGTO T ( NOLOCK ), TPROCESSO_EXP_PEDIDO P ( NOLOCK )' +
          'WHERE  E.CD_TERMO_PAGTO *= T.CD_TERMO_PAGTO AND ' +
          'E.NR_PROCESSO *= P.NR_PROCESSO AND ' +
          'E.NR_PROCESSO = :NR_PROCESSO ' );

        if (cbo_Pedidos.Items.Count > 1) then
          TProc.SQL.Add('AND P.NR_PEDIDO = :NR_PEDIDO');

      end
      else
      begin
        TProc.SQL.Add(
          'SELECT E.NR_PROCESSO, P.NR_PEDIDO, E.DT_FATURA, E.CD_CARTA_CREDITO,');

        if vGrupo = 'C39' then //Culligan
        begin
          str_exw := 'SI.VL_TOT_EXW AS VL_TOT_EXW, ';

          TProc.SQL.Add(
            'P.NR_PEDIDO AS NR_FATURA, ' +
            'SI.PESO_LIQ AS VL_PESO_LIQUIDO, ' +
            'SI.PESO_BRUTO AS VL_PESO_BRUTO, ' +
            'SI.CUBAGEM AS VL_TOT_CUBAGEM, ' +
            'SI.FOB AS VL_TOT_FOB, ' +
            'SI.FRETE AS VL_FRETE, ' +
            'SI.SEGURO AS VL_SEGURO, ' +
            'SI.MCV AS VL_TOT_MCV, ' +
            'SI.ACRESCIMO AS VL_ACRESCIMO, ' +
            'SI.DESCONTO AS VL_DESCONTO, ' +
            'P.TX_INF_EMBALAGEM, ');
        end
        else
        begin
          TProc.SQL.Add( 'E.NR_FATURA, ' +
            'E.VL_PESO_LIQUIDO, E.VL_PESO_BRUTO, E.VL_TOT_CUBAGEM, '+
            'E.VL_TOT_FOB, E.VL_FRETE, E.VL_SEGURO, ' +
            'E.VL_TOT_MCV, E.VL_ACRESCIMO, E.VL_DESCONTO,' +
            'E.TX_INF_EMBALAGEM, ');
        end;

        TProc.SQL.Add(
          str_exw +  'isnull(E.VL_INLAND_FREIGHT,0) VL_INLAND_FREIGHT, '+
          'E.TX_MARCACAO_VOLUME, E.TX_DECL_EXPORTADOR, '+
          'E.CD_EXPORTADOR, E.CD_IMPORTADOR, E.CD_LOCAL_DESTINO, E.CD_LOCAL_ORIGEM, E.CD_VIA_TRANSPORTE, E.CD_TERMO_PAGTO, E.TP_CONSIGNATARIO, E.CD_LINGUA_PEDIDO, '+
          'E.CD_CONSIGNATARIO, E.TP_NOTIFY1, E.CD_NOTIFY1, E.TP_NOTIFY2, E.CD_NOTIFY2, E.TP_DOCUMENTO, E.CD_DOCUMENTO, E.TP_COPIA, E.CD_COPIA, E.CD_MOEDA, E.TP_POS_AD, '+
          'ISNULL( E.CD_LOCAL_DESPACHO, "" ) AS CD_LOCAL_DESPACHO, E.CD_INCOTERM, '+
          'CASE E.CD_INCOTERM WHEN "EXW" THEN "TOTAL EXW" ELSE ' +
          'CASE WHEN E.CD_VIA_TRANSPORTE IN ("04","07") THEN "TOTAL FCA" '+
          'ELSE "TOTAL FOB" END END AS TOTAL, E.TX_DECL_ADICIONAL, '+
          'E.CD_PAIS_ORIG AS CD_PAIS_ORIGEM, E.CD_PAIS_DESTINO AS CD_PAIS_DESTINO, E.CD_TIPO_FRETE, '+
          'CASE E.CD_LINGUA_PEDIDO WHEN "0" THEN ISNULL( T.TX_TERMO_PORT, "" ) WHEN "1" THEN ISNULL( T.TX_TERMO_INGLES, "" ) WHEN "2" THEN ISNULL( T.TX_TERMO_ESP, "" ) '+
          'END AS NM_TERMO_PAGTO,  '+
          'CASE E.CD_LINGUA_PEDIDO '+
          '   WHEN "0" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, E.DT_FATURA ) ), 2 ) + " de " +'+
          '       CASE DATEPART( m, E.DT_FATURA )'+
          '          WHEN 1 THEN "Janeiro"'+
          '          WHEN 2 THEN "Fevereiro"'+
          '          WHEN 3 THEN "Março"'+
          '          WHEN 4 THEN "Abril"'+
          '          WHEN 5 THEN "Maio"'+
          '          WHEN 6 THEN "Junho"'+
          '          WHEN 7 THEN "Julho"'+
          '          WHEN 8 THEN "Agosto"'+
          '          WHEN 9 THEN "Setembro"'+
          '          WHEN 10 THEN "Outubro"'+
          '          WHEN 11 THEN "Novembro"'+
          '          WHEN 12 THEN "Dezembro"'+
          '       END + " de " + CONVERT(char(4), DATEPART( yyyy, E.DT_FATURA ) )'+
          '   WHEN "1" THEN'+
          '       CASE DATEPART( m, E.DT_FATURA )'+
          '          WHEN 1 THEN "January"'+
          '          WHEN 2 THEN "February"'+
          '          WHEN 3 THEN "March"'+
          '          WHEN 4 THEN "April"'+
          '          WHEN 5 THEN "May"'+
          '          WHEN 6 THEN "June"'+
          '          WHEN 7 THEN "July"'+
          '          WHEN 8 THEN "August"'+
          '          WHEN 9 THEN "September"'+
          '          WHEN 10 THEN "October"'+
          '          WHEN 11 THEN "November"'+
          '          WHEN 12 THEN "December"'+
          '       END + " " + RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, E.DT_FATURA ) ), 2 ) +'+
          '       CASE RIGHT( CONVERT( varchar(2), DATEPART( d, E.DT_FATURA ) ), 1 )'+
          '          WHEN "1" THEN "st"'+
          '          WHEN "2" THEN "nd"'+
          '          ELSE "th"'+
          '       END + ", " + CONVERT(char(4), DATEPART( yyyy, E.DT_FATURA ) )'+
          '   WHEN "2" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, E.DT_FATURA ) ), 2 ) + " de " +'+
          '       CASE DATEPART( m, E.DT_FATURA )'+
          '          WHEN 1 THEN "Enero"'+
          '          WHEN 2 THEN "Febrero"'+
          '          WHEN 3 THEN "Marzo"'+
          '          WHEN 4 THEN "Abril"'+
          '          WHEN 5 THEN "Mayo"'+
          '          WHEN 6 THEN "Junio"'+
          '          WHEN 7 THEN "Julio"'+
          '          WHEN 8 THEN "Agosto"'+
          '          WHEN 9 THEN "Septiembre"'+
          '          WHEN 10 THEN "Octubre"'+
          '          WHEN 11 THEN "Noviembre"'+
          '          WHEN 12 THEN "Diciembre"'+
          '       END  + " de " + CONVERT(char(4), DATEPART( yyyy, E.DT_FATURA ) )'+
          'END AS DATA_FATURA, IN_REFERENCIA_FAT_INST, E.CD_INST_NEGOC, '+
          ' Upper( CASE substring(E.CD_INCOTERM,1,1) '+
          ' when ''E'' THEN (SELECT END_CIDADE FROM TEMPRESA_NAC WHERE CD_EMPRESA= E.CD_EXPORTADOR ) '+
          ' WHEN ''F'' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.CD_LOCAL_ORIGEM) '+
          ' WHEN ''C'' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.CD_LOCAL_DESTINO) '+
          ' WHEN ''D'' THEN (SELECT EE1.END_CIDADE FROM TEMPRESA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = E.CD_IMPORTADOR) '+
          ' END) AS LOCAL_TOTAL '+

          'FROM   TPROCESSO_EXP E ( NOLOCK ) ' +
          'LEFT JOIN TPROCESSO_EXP_PEDIDO P ( NOLOCK ) ON E.NR_PROCESSO = P.NR_PROCESSO ' +
          'LEFT JOIN TTERMO_PAGTO T ( NOLOCK )ON E.CD_TERMO_PAGTO = T.CD_TERMO_PAGTO ');

        if vGrupo = 'C39' then //Culligan
        begin

          if lVendaIncoterm = chkbox_venda_incoterm.Checked then
          begin
            str_exw3 := 'SUM( ISNULL( I.VL_TOT_ITEM, 0 ) ) AS VL_TOT_EXW';
          end
          else // Incoterms diferentes
          begin
            if frm_exp_impr_fatura.chkbox_venda_incoterm.Checked then
            begin // Soma
              str_exw3  :=
              ' SUM( ISNULL( I.VL_TOT_ITEM, 0 ) + ' +
              '       ISNULL( I.VL_FRETE, 0 ) + ' +
              '       ISNULL( I.VL_SEGURO, 0 ) + ' +
              '       ISNULL( I.VL_ACRESCIMO, 0 ) - ' +
              '       ISNULL( I.VL_DESCONTO, 0 ) - ' +
              '       ISNULL( I.VL_DESPESA, 0 ) ' +
              '      ) AS VL_TOT_EXW ';
            end
            else
            begin // Subtrai
              str_exw3  :=
                'SUM( ISNULL( I.VL_TOT_ITEM, 0 ) - ' +
                '      ( ISNULL( I.VL_FRETE, 0 ) + ' +
                '    ISNULL( I.VL_SEGURO, 0 ) + ' +
                '    ISNULL( I.VL_ACRESCIMO, 0 ) - ' +
                '    ISNULL( I.VL_DESCONTO, 0 ) - ' +
                '    ISNULL( I.VL_DESPESA, 0 ) ' +
                '     ) ' +
                '  ) AS VL_TOT_EXW ';
            end;
          end;

          TProc.SQL.Add(
            'OUTER APPLY ( ' +
            '  SELECT ' +
            '  SUM(ISNULL(I.VL_TOT_PESO_LIQ, 0 )) PESO_LIQ, ' +
            '  SUM(ISNULL(I.VL_TOT_PESO_BRUTO, 0 )) PESO_BRUTO, ' +
            '  SUM(ISNULL(I.VL_CUBAGEM, 0 )) CUBAGEM, ' +
            '  SUM(ISNULL(I.VL_MLE, 0 )) FOB, ' +
            '  SUM(ISNULL(I.VL_FRETE, 0 )) FRETE, ' +
            '  SUM(ISNULL(I.VL_SEGURO, 0 )) SEGURO, ' +
            '  SUM(ISNULL(I.VL_MCV, 0 )) MCV, ' +
            '  SUM(ISNULL(I.VL_ACRESCIMO, 0 )) ACRESCIMO, ' +
            '  SUM(ISNULL(I.VL_DESCONTO, 0 )) DESCONTO, ' +
            str_exw3 +
            '  FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) ' +
            '  WHERE ' +
            '  I.NR_PROCESSO = E.NR_PROCESSO ' +
            '  AND I.NR_PEDIDO = P.NR_PEDIDO ' +
            ') SI ' );
        end;

        TProc.SQL.Add(
          'WHERE    ' +
          'E.NR_PROCESSO = :NR_PROCESSO ');

        if (cbo_Pedidos.Items.Count > 1) then
          TProc.SQL.Add('AND P.NR_PEDIDO = :NR_PEDIDO');

      end;
      TProcVerifica.Close;
      TProc.ParamByName( 'NR_PROCESSO' ).AsString := Trim( msk_cd_unid_neg.Text ) + '02' + Trim( msk_nr_processo.Text );
      if (cbo_Pedidos.Items.Count > 1) and (cbo_Pedidos.Text <> 'TODOS') then
        TProc.ParamByName( 'NR_PEDIDO' ).AsString := cbo_Pedidos.Text;
      TProc.Prepare;
      TProc.Open;
      if TProc.EOF then
      begin
        Screen.Cursor := crArrow;
        ShowMessage( 'Processo não encontrado na Exportação !');
        msk_nr_processo.SetFocus;
        Exit;
      end;

      TProcPed.Close;
      TProcPed.ParamByName('NR_PROCESSO').AsString := TProc.FieldByName('NR_PROCESSO').AsString;
      TProcPed.ParamByName('NR_PEDIDO').AsString   := TProc.FieldByName('NR_PEDIDO').AsString;
      TProcPed.Prepare;
      TProcPed.Open;



      // Referência do Cliente
      TReferencia.Close;
      TReferencia.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TReferencia.Prepare;
      TReferencia.Open;



      // Filtra Exportador
      TExp.Close;
      TExp.ParamByName('CD_EXPORTADOR').AsString := TProc.FieldByName('CD_EXPORTADOR').AsString;
      TExp.Prepare;
      TExp.Open;



      // Filtra Processo Itens
      TProcI.Close;
      TProcI.SQL.Clear;
      TProcI.SQL.Add(
            'SELECT I.NR_ITEM, I.CD_UNID_MEDIDA AS CD_UNID_MEDIDA, U.NM_SIGLA AS NM_SIGLA, I.CD_MERCADORIA AS CD_MERCADORIA, I.QT_MERCADORIA AS QT_MERCADORIA, ' +
            'ISNULL( I.VL_TOT_PESO_LIQ, 0 )   AS VL_TOT_PESO_LIQ, ' +
            'ISNULL( I.VL_TOT_PESO_BRUTO, 0 ) AS VL_TOT_PESO_BRUTO, ' +
            'I.VL_UNITARIO AS VL_UNITARIO, I.VL_TOT_ITEM AS VL_TOT_ITEM, I.TX_MERCADORIA AS NM_MERCADORIA, E.NM_EMBALAGEM_S AS NM_EMBALAGEM, ' +
            'CASE EX.CD_LINGUA_PEDIDO ' +
            'WHEN "1" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_INGLES ) ) ' +
            'WHEN "2" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_ESPANHOL ) ) ' +
            'ELSE LTRIM( RTRIM( EM.NM_DESCR_DETALHADA ) ) END AS NM_EMB_SUP, ' +
            'CASE EX.CD_LINGUA_PEDIDO ' +
            '  WHEN "1" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_INGLES ) ) ' +
            '  WHEN "2" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_ESPANHOL ) ) ' +
            '  ELSE LTRIM( RTRIM( EM.NM_DESCR_DETALHADA ) ) ' +
            'END + " " + ISNULL( CD_CLASSIF_EMBALAGEM_SUP, "" ) AS NM_GRUPO_EMB, ' +
            'CASE I.QT_EMBALAGEM_SUP WHEN 0 THEN I.QT_EMBALAGEM ELSE I.QT_EMBALAGEM_SUP END AS QT_EMB_SUP, ' +
            'CASE EX.CD_LINGUA_PEDIDO ' +
            'WHEN "1" THEN E.NM_DESCR_DETALHADA_INGLES ' +
            'WHEN "2" THEN E.NM_DESCR_DETALHADA_ESPANHOL ' +
            'ELSE E.NM_DESCR_DETALHADA END AS NM_DESCR_DETALHADA, ' +
            'CASE LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) WHEN "" THEN "" ELSE ' +
            'CASE EX.CD_LINGUA_PEDIDO ' +
            'WHEN "1" THEN "S: " ELSE "R: " END END + LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) + ' +
            'CASE LTRIM( RTRIM( ISNULL( I.NR_PEDIDO, "" ) ) ) WHEN "" THEN "" ELSE ' +
            'CASE LTRIM( RTRIM( ISNULL( I.NR_PEDIDO, "" ) ) ) WHEN "" THEN "" ELSE ' +
            'CASE LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
            'LTRIM( RTRIM( ISNULL( I.NR_PEDIDO, "" ) ) ) END END + ' +
            'CASE EX.CD_LINGUA_PEDIDO ' +
            'WHEN "1" THEN CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " FROM: " + LTRIM( RTRIM( P.NM_PAIS_ING ) ) END ' +
            'WHEN "2" THEN CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " ORIGEN: " + LTRIM( RTRIM( P.NM_PAIS_ESP ) ) END ' +
            'ELSE CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " ORIGEM: " + LTRIM( RTRIM( P.NM_PAIS_PORT ) ) END END ' +
            'AS NR_OC_REF_ORIGEM, ' +
            'I.VL_CUBAGEM AS VL_CUBAGEM, M.CD_MATERIAL AS CD_MATERIAL, M.NR_LINHA AS NR_LINHA, ' +
            'CASE LTRIM( RTRIM( ISNULL( M.CD_COR, "" ) ) ) WHEN "" THEN "" ELSE "COLOR: " END + LTRIM( RTRIM( M.CD_COR ) ) AS CD_COR, ' +
            'ISNULL( N.TX_NCM_FATURA, "" ) AS DESCR_NCM, ' );
      if ( lHabilita_NCM_DOC ) and ( lHabilita_NALADI_DOC ) then
        TProcI.SQL.Add(
            'CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_DOC, "" ) ) ) WHEN "" THEN "" ELSE "NALADI: " + LTRIM( RTRIM( ISNULL( I.CD_NALADI_DOC, "" ) ) ) END + ' +
            'CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_DOC, "" ) ) ) WHEN "" THEN "" ELSE " - " + LTRIM( RTRIM( ISNULL( NA.DESCRICAO, "" ) ) ) END AS DESCR_NALADI, ' )
      else
        TProcI.SQL.Add(
            'CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_SH, "" ) ) ) WHEN "" THEN "" ELSE "NALADI: " + I.CD_NALADI_SH END + '+
            'CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_SH, "" ) ) ) WHEN "" THEN "" ELSE " - " + NA.DESCRICAO END AS DESCR_NALADI, ' );
      TProcI.SQL.Add(
            'I.VL_FRETE, I.VL_SEGURO, I.VL_ACRESCIMO, I.VL_DESCONTO, EX.NR_PROCESSO ' +
            'FROM  TPROCESSO_EXP_ITEM I ( NOLOCK ), TPROCESSO_EXP EX ( NOLOCK ), TMERCADORIA_EXP M ( NOLOCK ), ' +
            'TEMBALAGEM E ( NOLOCK ), TEMBALAGEM EM ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ), ' +
            'TUNID_MEDIDA_BROKER U ( NOLOCK ), TNCM_EXP N ( NOLOCK ), TNALADISH_EXP NA ( NOLOCK ) ' +
            'WHERE I.NR_PROCESSO = EX.NR_PROCESSO AND ' +
            'I.CD_MERCADORIA *= M.CD_MERCADORIA AND ' +
            'I.CD_EMBALAGEM *= E.CD_EMBALAGEM AND ' +
            'I.CD_EMBALAGEM_SUP *= EM.CD_EMBALAGEM AND ' +
            'I.CD_PAIS_ORIGEM *= P.CD_PAIS AND ' +
            'I.CD_UNID_MEDIDA *= U.CD_UNID_MEDIDA AND ' +
            'I.CD_NCM_DOC *= N.CODIGO AND ISNULL( I.NR_SEQ_NCM_DOC, 1 ) *= N.NR_SEQ AND ' +
            'I.CD_NALADI_DOC *= NA.CODIGO AND ISNULL( I.NR_SEQ_NALADI_DOC, 1 ) *= NA.NR_SEQ AND ' +
            'I.NR_PROCESSO = :NR_PROCESSO ' );
      if (cbo_Pedidos.Items.Count > 1) and (cbo_Pedidos.Text <> 'TODOS') then
        TProcI.SQL.Add('AND I.NR_PEDIDO = ' + QuotedStr(cbo_Pedidos.Text));

      if ( lHabilita_NCM_DOC ) and ( lHabilita_NALADI_DOC ) then
        TProcI.SQL.Add(
//        'ORDER BY NR_ITEM DESC')
           'ORDER BY ISNULL( CD_NCM_DOC, "" ), ISNULL( CD_NALADI_DOC, "" ), NR_ITEM' )
      else
        TProcI.SQL.Add(
           'ORDER BY NR_ITEM' );
      TProcI.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TProcI.Prepare;
      TProcI.Open;

      // Filtra Importador
      TImp.Close;
      TImp.ParamByName('CD_LINGUA_PEDIDO').AsString := TProc.FieldByName('CD_LINGUA_PEDIDO').AsString;
      TImp.ParamByName('CD_IMPORTADOR').AsString    := TProc.FieldByName('CD_IMPORTADOR').AsString;
      TImp.Prepare;
      TImp.Open;

      // Filtra local Destino Final
      Tlocal1.Close;
      Tlocal1.ParamByName('CD_LOCAL_DESTINO').AsString := TProc.FieldByName('CD_LOCAL_DESTINO').AsString;
      Tlocal1.Prepare;
      Tlocal1.Open;

      // Filtra local Origem
      Tlocal2.Close;
      Tlocal2.ParamByName('CD_LOCAL_ORIGEM').AsString := TProc.FieldByName('CD_LOCAL_ORIGEM').AsString;
      Tlocal2.Prepare;
      Tlocal2.Open;

      // Valor Total de acordo com incoterm e tipo de frete - Se existir Local_Despacho este deve ser impresso
      if ((TProc.FieldByName('CD_TIPO_FRETE').AsString <> '0') and (TProc.FieldByName('CD_TIPO_FRETE').AsString <> '1')) then
        ShowMessage( 'Informar Tipo de Frete!');

      {TLocal3.Close;
      if TProc.FieldByName('CD_LOCAL_DESPACHO').AsString <> '' then
      begin
        TLocal3.ParamByName('CD_LOCAL').AsString := TProc.FieldByName('CD_LOCAL_DESPACHO').AsString
      end
      else
      begin
        if TProc.FieldByName('CD_TIPO_FRETE').AsString = '0' then        // Collect
          TLocal3.ParamByName('CD_LOCAL').AsString := TProc.FieldByName('CD_LOCAL_ORIGEM').AsString
        else if TProc.FieldByName('CD_TIPO_FRETE').AsString = '1' then   // Prepaid
          TLocal3.ParamByName('CD_LOCAL').AsString := TProcesso.FieldByName('CD_LOCAL_DESEMBARQUE').AsString
        else
        begin
          ShowMessage( 'Informar Tipo de Frete!');
          Exit;
        end
      end;
      TLocal3.Prepare;
      TLocal3.Open;}

      // Filtra Instrumento de Negociação
      TInstNeg.Close;
      TInstNeg.ParamByName('CD_INST_NEGOC').AsString := TProc.FieldByName('CD_INST_NEGOC').AsString;
      TInstNeg.Prepare;
      TInstNeg.Open;

      // Filtra Via de Transporte
      TViaTr.Close;
      TViaTr.ParamByName('CD_VIA_TRANSPORTE').AsString := TProc.FieldByName('CD_VIA_TRANSPORTE').AsString;
      TViaTr.ParamByName('NR_PROCESSO').AsString       := TProc.FieldByName('NR_PROCESSO').AsString;
      TViaTr.Prepare;
      TViaTr.Open;

      // Filtra Consignatário
      Tconsig.Close ;
      Tconsig.SQL.Clear ;
      if TProc.FieldByName('TP_CONSIGNATARIO').AsString = '2' then // Transportadora
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // Inglês
           Tconsig.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS '+
                            'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                            'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                            'T.CODIGO = :CD_CONSIGNATARIO ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // Espanhol
           Tconsig.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) AS CIDADE_PAIS '+
                            'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) '+
                            'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                            'T.CODIGO = :CD_CONSIGNATARIO ' )
        else // Português
           Tconsig.SQL.Add('SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) '+
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_CONSIGNATARIO ' );
      end
      else if TProc.FieldByName('TP_CONSIGNATARIO').AsString = '4' then // Despachante
      begin
        Tconsig.SQL.Add( 'SELECT CD_DESPACHANTE AS CODIGO, NM_DESPACHANTE AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS '+
                         'FROM TDESPACHANTE ( NOLOCK ) WHERE CD_DESPACHANTE = :CD_CONSIGNATARIO ' );
      end
      else if ( TProc.FieldByName('TP_CONSIGNATARIO').AsString = '0' ) or
              ( TProc.FieldByName('TP_CONSIGNATARIO').AsString = '1' ) or
              ( TProc.FieldByName('TP_CONSIGNATARIO').AsString = '3' ) then // Importador / Agente / Banco
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // Inglês
           Tconsig.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                            'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS, ' +
                            'END_COMPL, END_CIDADE, END_ESTADO, '+
                            '''PHONE: ''+NR_TELEFONE NR_TELEFONE, ''FAX: ''+ NR_FAX NR_FAX, ''RUC: ''+NR_RUC NR_RUC, ''NIT: ''+NR_NIT NR_NIT, ''CUIT: ''+NR_CUIT NR_CUIT '+
                            'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                            'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                            'E.CD_EMPRESA = :CD_CONSIGNATARIO ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // Espanhol
           Tconsig.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                            'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS, ' +
                            'END_COMPL, END_CIDADE, END_ESTADO, '+
                            '''TEL: ''+NR_TELEFONE NR_TELEFONE, ''FAX: ''+ NR_FAX NR_FAX, ''RUC: ''+NR_RUC NR_RUC, ''NIT: ''+NR_NIT NR_NIT, ''CUIT: ''+NR_CUIT NR_CUIT '+
                            'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                            'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                            'E.CD_EMPRESA = :CD_CONSIGNATARIO ' )
        else     /// Português
           Tconsig.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                            'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, ' +
                            'END_COMPL, END_CIDADE, END_ESTADO, '+
                            '''TEL: ''+NR_TELEFONE NR_TELEFONE, ''FAX: ''+ NR_FAX NR_FAX, ''RUC: ''+NR_RUC NR_RUC, ''NIT: ''+NR_NIT NR_NIT, ''CUIT: ''+NR_CUIT NR_CUIT '+
                            'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                            'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                            'E.CD_EMPRESA = :CD_CONSIGNATARIO ' );
      end
      else
      begin
        // Nas queries abaixo foi incluído ", END_COMPL, END_CIDADE, END_ESTADO, NR_TELEFONE, NR_FAX, NR_RUC, NR_NIT, NR_CUIT", pois estava gerando erro ao abrir a query - Michel - 13/08/2012
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then       // Inglês
          Tconsig.SQL.Add( 'SELECT TOP 1 "TO ORDER" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS, END_COMPL, END_CIDADE, END_ESTADO, NR_TELEFONE, NR_FAX, NR_RUC, NR_NIT, NR_CUIT ' +
                           'FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = :CD_CONSIGNATARIO OR 1 = 1 ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '0' then  // Português
          Tconsig.SQL.Add( 'SELECT TOP 1 "A ORDEM" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS, END_COMPL, END_CIDADE, END_ESTADO, NR_TELEFONE, NR_FAX, NR_RUC, NR_NIT, NR_CUIT ' +
                           'FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = :CD_CONSIGNATARIO OR 1 = 1 ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then  // Espanhol
          Tconsig.SQL.Add( 'SELECT TOP 1 "A LA ORDEN" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS, END_COMPL, END_CIDADE, END_ESTADO, NR_TELEFONE, NR_FAX, NR_RUC, NR_NIT, NR_CUIT ' +
                           'FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = :CD_CONSIGNATARIO OR 1 = 1 ' );
      end;
      Tconsig.ParamByName('CD_CONSIGNATARIO').AsString := TProc.FieldByName('CD_CONSIGNATARIO').AsString;
      Tconsig.Prepare;
      Tconsig.Open;

      // Filtra Notify 1
      TNotf1.Close;
      TNotf1.SQL.Clear;
      if TProc.FieldByName('TP_NOTIFY1').AsString = '2' then // Transportadora
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           TNotf1.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( P.NM_PAIS_ING ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_NOTIFY1 ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TNotf1.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( P.NM_PAIS_ESP ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_NOTIFY1 ' )
        else
           TNotf1.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( P.NM_PAIS_PORT ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_NOTIFY1 ' );
      end
      else if TProc.FieldByName('TP_NOTIFY1').AsString = '4' then // Despachante
        TNotf1.SQL.Add( 'SELECT CD_DESPACHANTE AS CODIGO, NM_DESPACHANTE AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS '+
                        'FROM TDESPACHANTE ( NOLOCK ) WHERE CD_DESPACHANTE = :CD_NOTIFY1 ' )
      else if ( TProc.FieldByName('TP_NOTIFY1').AsString = '0' ) or
              ( TProc.FieldByName('TP_NOTIFY1').AsString = '1' ) or
              ( TProc.FieldByName('TP_NOTIFY1').AsString = '3' ) then // Importador / Agente / Banco
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           TNotf1.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_NOTIFY1 ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then     // espanhol
           TNotf1.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_NOTIFY1 ' )
        else     /// portugues
           TNotf1.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_NOTIFY1 ' )
      end
      else
      begin
        TNotf1.SQL.Add( 'SELECT "" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS ' +
                        'FROM TEMPRESA_EST E ( NOLOCK ) ' +
                        'WHERE E.CD_EMPRESA = :CD_NOTIFY1 AND 1 = 0' );
      end;
      TNotf1.ParamByName('CD_NOTIFY1').AsString := TProc.FieldByName('CD_NOTIFY1').AsString;
      TNotf1.Prepare;
      TNotf1.Open;



      // Filtra Notify 2
      TNotf2.Close;
      TNotf2.SQL.Clear;
      if TProc.FieldByName('TP_NOTIFY2').AsString = '2' then // Transportadora
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then     // ingles
           TNotf2.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_NOTIFY2 ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TNotf2.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_NOTIFY2 ' )
        else
           TNotf2.SQL.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'WHERE T.CODIGO = :CD_NOTIFY2 ' )
      end
      else if TProc.FieldByName('TP_NOTIFY2').AsString = '4' then // Despachante
         TNotf2.SQL.Add( 'SELECT CD_DESPACHANTE AS CODIGO, LTRIM( RTRIM( ISNULL( NM_DESPACHANTE, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS '+
                         'FROM TDESPACHANTE ( NOLOCK ) WHERE CD_DESPACHANTE = :CD_NOTIFY2 ' )
      else if ( TProc.FieldByName('TP_NOTIFY2').AsString = '0' ) or
              ( TProc.FieldByName('TP_NOTIFY2').AsString = '1' ) or
              ( TProc.FieldByName('TP_NOTIFY2').AsString = '3' ) then // Importador / Agente / Banco
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then     // ingles
           TNotf2.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_NOTIFY2 ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TNotf2.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_NOTIFY2 ' )
        else     /// portugues
           TNotf2.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_NOTIFY2 ' )
      end
      else
      begin
        TNotf2.SQL.Add( 'SELECT "" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS ' +
                        'FROM TEMPRESA_EST E ( NOLOCK ) ' +
                        'WHERE E.CD_EMPRESA = :CD_NOTIFY2 AND 1 = 0' );
      end;
      TNotf2.ParamByName('CD_NOTIFY2').AsString := TProc.FieldByName('CD_NOTIFY2').AsString;
      TNotf2.Prepare;
      TNotf2.Open;

      // Filtra Documento
      TDoc.Close ;
      TDoc.SQL.Clear ;
      if TProc.FieldByName('TP_DOCUMENTO').AsString = '2' then // Transportadora
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // Inglês
           TDoc.SQL.Add( 'SELECT T.CODIGO AS CODIGO, LTRIM( RTRIM( ISNULL( T.DESCRICAO, "" ) ) ) AS NOME,  "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS '+
                         'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                         'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                         'T.CODIGO = :CD_DOCUMENTO ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then     // Espanhol
           TDoc.SQL.Add( 'SELECT T.CODIGO AS CODIGO, LTRIM( RTRIM( ISNULL( T.DESCRICAO, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS '+
                         'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                         'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                         'T.CODIGO = :CD_DOCUMENTO ' )
        else //Português
           TDoc.SQL.Add( 'SELECT T.CODIGO AS CODIGO, LTRIM( RTRIM( ISNULL( T.DESCRICAO, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS '+
                         'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                         'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                         'T.CODIGO = :CD_DOCUMENTO ' );
      end
      else if TProc.FieldByName('TP_DOCUMENTO').AsString = '4' then // Despachante
         TDoc.SQL.Add( 'SELECT CD_DESPACHANTE AS CODIGO, LTRIM( RTRIM( ISNULL( NM_DESPACHANTE, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS '+
                       'FROM TDESPACHANTE ( NOLOCK ) WHERE CD_DESPACHANTE = :CD_DOCUMENTO ' )
      else if ( TProc.FieldByName('TP_DOCUMENTO').AsString = '0' ) or
              ( TProc.FieldByName('TP_DOCUMENTO').AsString = '1' ) or
              ( TProc.FieldByName('TP_DOCUMENTO').AsString = '3' ) then // Importador / Agente / Banco
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // Inglês
           TDoc.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                         'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) )  + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                         'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                         'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS ' +
                         'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                         'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                         'E.CD_EMPRESA = :CD_DOCUMENTO ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // Espanhol
           TDoc.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                         'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) )  + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                         'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                         'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS ' +
                         'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                         'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                         'E.CD_EMPRESA = :CD_DOCUMENTO ' )
        else     /// Português
           TDoc.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                         'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) )  + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                         'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                         'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS ' +
                         'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                         'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                         'E.CD_EMPRESA = :CD_DOCUMENTO ' )
      end
      else
      begin
        TDoc.SQL.Add( 'SELECT "" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS ' +
                      'FROM TEMPRESA_EST E ( NOLOCK ) ' +
                      'WHERE E.CD_EMPRESA = :CD_DOCUMENTO AND 1 = 0 ' );
      end;
      TDoc.ParamByName('CD_DOCUMENTO').AsString := TProc.FieldByName('CD_DOCUMENTO').AsString;
      TDoc.Prepare;
      TDoc.Open;

      // Filtra Copias
      TCopia.Close;
      TCopia.Prepare;
      TCopia.SQL.Clear;
      if TProc.FieldByName('TP_COPIA').AsString = '2' then // Transportadora
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // Inglês
           TCopia.SQL.Add( 'SELECT T.CODIGO AS CODIGO, LTRIM( RTRIM( ISNULL( T.DESCRICAO, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_COPIA' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // Espanhol
           TCopia.SQL.Add( 'SELECT T.CODIGO AS CODIGO, LTRIM( RTRIM( ISNULL( T.DESCRICAO, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_COPIA ' )
        else// Português
           TCopia.SQL.Add( 'SELECT T.CODIGO AS CODIGO, LTRIM( RTRIM( ISNULL( T.DESCRICAO, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE T.CD_PAIS *= P.CD_PAIS AND ' +
                           'T.CODIGO = :CD_COPIA ' );
      end
      else if TProc.FieldByName('TP_COPIA').AsString = '4' then // Despachante
         TCopia.SQL.Add('SELECT CD_DESPACHANTE AS CODIGO, LTRIM( RTRIM( ISNULL( NM_DESPACHANTE, "" ) ) ) AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS '+
                        'FROM   TDESPACHANTE ( NOLOCK ) WHERE CD_DESPACHANTE = :CD_COPIA ' )
      else if ( TProc.FieldByName('TP_COPIA').AsString = '0' ) or
              ( TProc.FieldByName('TP_COPIA').AsString = '1' ) or
              ( TProc.FieldByName('TP_COPIA').AsString = '3' ) then // Importador / Agente / Banco
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           TCopia.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_COPIA ' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TCopia.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_COPIA ' )
        else     /// portugues
           TCopia.SQL.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ) ' +
                           'WHERE E.CD_PAIS *= P.CD_PAIS AND ' +
                           'E.CD_EMPRESA = :CD_COPIA ' )
      end
      else
      begin
        TCopia.SQL.Add( 'SELECT "" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS ' +
                        'FROM TEMPRESA_EST E ( NOLOCK ) ' +
                        'WHERE E.CD_EMPRESA = :CD_COPIA AND 1 = 0 ' );
      end;
      TCopia.ParamByName('CD_COPIA').AsString := TProc.FieldByName('CD_COPIA').AsString;
      TCopia.Prepare;
      TCopia.Open;

      TAnalistas.Close;
      TAnalistas.ParamByName('CD_ANALISTA_CLIENTE').AsString := TProcesso.FieldByName('CD_ANALISTA_CLIENTE').AsString;
      TAnalistas.Prepare;
      TAnalistas.Open;

      TPais1.Close;
      TPais1.ParamByName('CD_LINGUA_PEDIDO').AsString := TProc.FieldByName('CD_LINGUA_PEDIDO').AsString;
      TPais1.ParamByName('CD_PAIS_DESTINO').AsString  := TProc.FieldByName('CD_PAIS_DESTINO' ).AsString;
      TPais1.Prepare;
      TPais1.Open;

      TPais2.Close;
      TPais2.ParamByName('CD_LINGUA_PEDIDO').AsString := TProc.FieldByName('CD_LINGUA_PEDIDO').AsString;
      TPais2.ParamByName('CD_PAIS_ORIGEM').AsString   := TProc.FieldByName('CD_PAIS_ORIGEM').AsString;
      TPais2.Prepare;
      TPais2.Open;

      TPais3.Close;
      TPais3.ParamByName('CD_LINGUA_PEDIDO').AsString := TProc.FieldByName('CD_LINGUA_PEDIDO').AsString;
      TPais3.ParamByName('CD_PAIS').AsString          := TImp.FieldByName('CD_PAIS').AsString;
      TPais3.Prepare;
      TPais3.Open;

      TProcEmb.Close;
      TProcEmb.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TProcEmb.Prepare;
      TProcEmb.Open;

      qry_CUIT.Close;
      qry_CUIT.ParamByName('PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      qry_CUIT.Prepare;
      qry_CUIT.Open;

      TEmb.Close;
      TEmb.ParamByName('CD_EMBALAGEM').AsString := TProcEmb.FieldByName( 'CD_EMBALAGEM' ).AsString;
      TEmb.Prepare;
      TEmb.Open;

      // Filtra Banco do Processo
      TBancoExp.Close;
      TBancoExp.ParamByName('CD_BANCO_EXP').AsString := TProcesso.FieldByName('CD_BANCO_EXP').AsString;
      TBancoExp.Prepare;
      TBancoExp.Open;

      // Filtra Moeda
      TMoeda.Close;
      TMoeda.ParamByName('CD_MOEDA').AsString := TProc.FieldByName('CD_MOEDA').AsString;
      TMoeda.Prepare;
      TMoeda.Open;

      TCliente_Contato.Close;
      TCliente_Contato.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      TCliente_Contato.ParamByName('CD_CLIENTE').AsString  := TProcesso.FieldByName('CD_CLIENTE').AsString;
      TCliente_Contato.ParamByName('CD_CONTATO').AsString  := TProcesso.FieldByName('CD_CONTATO').AsString;
      TCliente_Contato.Prepare;
      TCliente_Contato.Open;

      TVerif_Pais_Item.Close;
      TVerif_Pais_Item.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TVerif_Pais_Item.Prepare;
      TVerif_Pais_Item.Open;

      lCorresponde   := False;
      ReportFileName := '';

      Screen.Cursor := crArrow;


//      ReportFileName := NomeArquivo;
//      if Trim(ReportFileName) <> '' then
//         lCorresponde := True;


      TCartaCred.Close;
      TCartaCred.ParamByName('NR_PROCESSO').AsString := TProc.FieldByName('NR_PROCESSO').AsString;
      TCartaCred.Prepare;
      TCartaCred.Open;

      TSoma_Itens.Close;
      TSoma_Itens.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TSoma_Itens.Prepare;
      TSoma_Itens.Open;

      //chama o form de impressão!!
      Application.CreateForm(TFrm_impressao, Frm_impressao);
      frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
      frm_impressao.cd_produto    := '02';
      frm_impressao.cd_via_transp := '';
      frm_impressao.cd_modulo     := '2003';
      Frm_impressao.cd_grupo      := vGrupo;
      frm_impressao.vApenas_email := false;
      frm_impressao.vBeforePrint  := pBeforePrint;


{      ppRepFatExp.Template.FileName := cDir_RPT + ReportFileName;
      ppRepFatExp.Template.LoadFromFile;
      ppRepFatExp.Template.FileName := cDir_RPT + ReportFileName;
      ppRepFatExp.AllowPrintToFile  := True;
}
//      ppRepFatExp.TextFileName      := cDir_Rpt + '\Fat-' + Trim( Copy( TProc.FieldByName('NR_PROCESSO').AsString, 5, 14 ) ) + '.PDF';

//      if Texp.FieldByName('LOGO').AsString <> '' then
//         ppimg_logo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim( Texp.FieldByName('LOGO').AsString ) );

      frm_impressao.ShowModal;
      frm_impressao.Release;



//        ppRepFatExp.Print;




//******************************************************************************

{     Comentado por Rodrigo Capra - 14/11/2007


      ReportFileName := NomeArquivo;

      if Trim(ReportFileName) <> '' then
         lCorresponde := True;

      if lCorresponde then
      begin
        ppRepFatExp.Template.FileName := cDir_RPT + ReportFileName;
        ppRepFatExp.Template.LoadFromFile;
        ppRepFatExp.Template.FileName := cDir_RPT + ReportFileName;
        ppRepFatExp.AllowPrintToFile  := True;
        case ( Sender as TButton ).Tag of
          1 : ppRepFatExp.DeviceType  := 'Screen';
          2 : ppRepFatExp.DeviceType  := 'PDFFile';
        end;

        ppRepFatExp.TextFileName      := cDir_Rpt + '\Fat-' + Trim( Copy( TProc.FieldByName('NR_PROCESSO').AsString, 5, 14 ) ) + '.PDF';

        if Texp.FieldByName('LOGO').AsString <> '' then
           ppimg_logo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim( Texp.FieldByName('LOGO').AsString ) );

        ppRepFatExp.Print;
      end
      else
      begin
        ShowMessage( 'Código do País do Importador inválido para Impressão da Fatura !!');
        Exit;
      end; }
//******************************************************************************
    end;
  except
    on e:exception do
      ShowMessage(e.message);
  end;
end;

procedure Tfrm_exp_impr_fatura.RetornaClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tfrm_exp_impr_fatura.FormShow(Sender: TObject);
begin
  if Trim( str_cd_unid_neg_exp ) <> '' then
    msk_cd_unid_neg.Text := str_cd_unid_neg_exp
  else
    msk_cd_unid_neg.Text := '01';
  msk_cd_unid_negExit(nil);
  msk_nr_processo.SetFocus;

  if Trim( str_nr_proc_exp ) <> '' then
  begin
    msk_nr_processo.Text := str_nr_proc_exp;
    msk_nr_processoExit(nil);
    Ok_btn.SetFocus;
  end;

  cbo_tipo.ItemIndex := 0;
end;

procedure Tfrm_exp_impr_fatura.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
     with datm_exp_impr_fatura do
     begin
       TUnidNeg.Close;
       TUnidNeg.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
       TUnidNeg.Prepare;
       TUnidNeg.Open;
       if TUnidNeg.Eof then
       begin
          ShowMessage( 'Unidade de Negócio não cadastrada!');
          msk_cd_unid_neg.SetFocus;
       end;
       edt_nm_unid_neg.Text := TUnidNeg.FieldByName('NM_UNID_NEG').AsString;
    end;
  end;
  cDir_RPT := ConsultaLookUpSQL('SELECT PATH_RELATORIOS FROM TUNID_NEG WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''','PATH_RELATORIOS');
end;

procedure Tfrm_exp_impr_fatura.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_exp_impr_fatura, datm_exp_impr_fatura );

  lHabilita_NCM_DOC    := False;
  lHabilita_NALADI_DOC := False;

  with datm_exp_impr_fatura do
  begin
    qry_parametros_.Close;
    qry_parametros_.Prepare;
    qry_parametros_.Open;
    if qry_parametros_TP_NCM.AsString <> '0' then
       lHabilita_NCM_DOC := True;

    if qry_parametros_TP_NALADI.AsString <> '0' then
       lHabilita_NALADI_DOC := True;

    qry_parametros_.Close;
  end;
end;

procedure Tfrm_exp_impr_fatura.msk_nr_processoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
//    if Sender = msk_nr_processo        then btn_co_proc_newClick(nil);
//    if Sender = msk_cd_unid_neg        then btn_cd_unid_negClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
//    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
//    frm_pesq_proc.ShowModal;
//    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
//    begin
//      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
//    end;
  end;
end;

function Tfrm_exp_impr_fatura.NomeArquivo:String;
begin
  with datm_exp_impr_fatura do
  begin


{  Comentado por Rodrigo Capra - 16/11/2007

    if Not TCartaCred.EOF then
    begin
      ReportFileName := 'FatCartaCred.rtm';
      NomeArquivo    := '\' + ReportFileName;
      Exit;
    end;
    if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '081' ) or   // Bangladesh
       ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '317' ) or   // Guatemala
       ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '249' ) then // USA
    begin
      if Quant.ItemIndex = 0 then
         ReportFileName := 'FatEUA.rtm'
    end
    else
    begin
      if chk_grupo_emb_sup.Visible and chk_grupo_emb_sup.Checked then
        ReportFileName := 'FaturaEmb.rtm'
      else
        ReportFileName := 'Fatura.rtm';
    end;
}
    (*
    if ( TProc.FieldByName('cd_pais_destino').AsString = '063' ) or   // Argentina
       ( TProc.FieldByName('cd_pais_destino').AsString = '580' ) or   // Panamá
       ( TProc.FieldByName('cd_pais_destino').AsString = '187' ) or   // Coréia do Norte
       ( TProc.FieldByName('cd_pais_destino').AsString = '190' ) or   // Coréia do Sul
       ( TProc.FieldByName('cd_pais_destino').AsString = '845' ) or   // Uruguai
       ( TProc.FieldByName('cd_pais_destino').AsString = '493' ) or   // México
       ( TProc.FieldByName('cd_pais_destino').AsString = '365' ) or   // Indonésia
       ( TProc.FieldByName('cd_pais_destino').AsString = '647' ) or   // República Dominicana
       ( TProc.FieldByName('cd_pais_destino').AsString = '586' ) then // Paraguai
    begin
      if quant.itemindex = 0 then
         ReportFileName := 'PadFaBAI.rtm'
    end
    else if ( TProc.FieldByName('cd_pais_destino').AsString = '850' ) or   // Venezuela
            ( TProc.FieldByName('cd_pais_destino').AsString = '589' ) or   // Perú
            ( TProc.FieldByName('cd_pais_destino').AsString = '493' ) or   // México
            ( TProc.FieldByName('cd_pais_destino').AsString = '341' ) or   // Haiti
            ( TProc.FieldByName('cd_pais_destino').AsString = '239' ) or   // Equador
            ( TProc.FieldByName('cd_pais_destino').AsString = '097' ) or   // Bolívia
            ( TProc.FieldByName('cd_pais_destino').AsString = '196' ) or   // Costa Rica
            ( TProc.FieldByName('cd_pais_destino').AsString = '169' ) or   // Colômbia
            ( TProc.FieldByName('cd_pais_destino').AsString = '345' ) or   // Honduras
            ( TProc.FieldByName('cd_pais_destino').AsString = '245' ) then // Espanha
    begin
      if ( quant.itemindex = 0 ) then
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then // Espanhol
           ReportFileName := 'VenFaBAI.rtm'
        else if ( TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' ) then    // Inglês
           ReportFileName := 'PadFaBAI.rtm'
      end;
    end
    else if ( TProc.FieldByName('cd_pais_destino').AsString = '023' ) or   // Alemanha
            ( TProc.FieldByName('cd_pais_destino').AsString = '728' ) or   // Senegal
            ( TProc.FieldByName('cd_pais_destino').AsString = '069' ) or   // Austrália
            ( TProc.FieldByName('cd_pais_destino').AsString = '434' ) or   // Libéria
            ( TProc.FieldByName('cd_pais_destino').AsString = '386' ) or   // Itália
            ( TProc.FieldByName('cd_pais_destino').AsString = '160' ) or   // China
            ( TProc.FieldByName('cd_pais_destino').AsString = '337' ) or   // Guiana
            ( TProc.FieldByName('cd_pais_destino').AsString = '770' ) or   // Suriname
            ( TProc.FieldByName('cd_pais_destino').AsString = '329' ) or   // Nova Guiné
            ( TProc.FieldByName('cd_pais_destino').AsString = '611' ) or   // Porto Rico
            ( TProc.FieldByName('cd_pais_destino').AsString = '069' ) or   // Austrália
            ( TProc.FieldByName('cd_pais_destino').AsString = '149' ) or   // Canadá
            ( TProc.FieldByName('cd_pais_destino').AsString = '399' ) or   // Japão
            ( TProc.FieldByName('cd_pais_destino').AsString = '548' ) or   // Nova Zelândia
            ( TProc.FieldByName('cd_pais_destino').AsString = '072' ) or   // Áustria
            ( TProc.FieldByName('cd_pais_destino').AsString = '087' ) or   // Bélgica
            ( TProc.FieldByName('cd_pais_destino').AsString = '271' ) or   // Finlândia
            ( TProc.FieldByName('cd_pais_destino').AsString = '275' ) or   // França
            ( TProc.FieldByName('cd_pais_destino').AsString = '301' ) or   // Grécia
            ( TProc.FieldByName('cd_pais_destino').AsString = '767' ) or   // Suíça
            ( TProc.FieldByName('cd_pais_destino').AsString = '607' ) or   // Portugual
            ( TProc.FieldByName('cd_pais_destino').AsString = '764' ) or   // Suécia
            ( TProc.FieldByName('cd_pais_destino').AsString = '445' ) or   // Luxemburgo
            ( TProc.FieldByName('cd_pais_destino').AsString = '676' ) or   // Rússia (Fed.)
            ( TProc.FieldByName('cd_pais_destino').AsString = '603' ) or   // Polônia (Rep.)
            ( TProc.FieldByName('cd_pais_destino').AsString = '247' ) then // Eslova
    begin
      if quant.itemindex = 0 then
         ReportFileName := 'AleFaBAI.rtm'
    end
    else if ( TProc.FieldByName('cd_pais_destino').AsString = '735' ) or   // Serra Leoa Form-A
            ( TProc.FieldByName('cd_pais_destino').AsString = '776' ) or   // Tailândia
            ( TProc.FieldByName('cd_pais_destino').AsString = '800' ) or   // Togo
            ( TProc.FieldByName('cd_pais_destino').AsString = '756' ) or   // África do Sul
            ( TProc.FieldByName('cd_pais_destino').AsString = '576' ) or   // Paquistão
            ( TProc.FieldByName('cd_pais_destino').AsString = '193' ) or   // Costa do Marfim
            ( TProc.FieldByName('cd_pais_destino').AsString = '145' ) or   // Camarões
            ( TProc.FieldByName('cd_pais_destino').AsString = '431' ) or   // Líbano
            ( TProc.FieldByName('cd_pais_destino').AsString = '289' ) or   // Gana
            ( TProc.FieldByName('cd_pais_destino').AsString = '391' ) or   // Jamaica
            ( TProc.FieldByName('cd_pais_destino').AsString = '285' ) or   // Gâmbia
            ( TProc.FieldByName('cd_pais_destino').AsString = '331' ) or   // Guiné-Equatorial
            ( TProc.FieldByName('cd_pais_destino').AsString = '455' ) or   // Malásia
            ( TProc.FieldByName('cd_pais_destino').AsString = '741' ) or   // Singapura
            ( TProc.FieldByName('cd_pais_destino').AsString = '687' ) then // El Savador
    begin
      if quant.itemindex = 0 then
         ReportFileName := 'SerFaBAI.rtm'
    end
    else if ( TProc.FieldByName('cd_pais_destino').AsString = '158' ) or   // Chile
            ( TProc.FieldByName('cd_pais_destino').AsString = '431' ) or   // Libano
            ( TProc.FieldByName('cd_pais_destino').AsString = '240' ) or   // Egito
            ( TProc.FieldByName('cd_pais_destino').AsString = '687' ) or   // El Salvador
            ( TProc.FieldByName('cd_pais_destino').AsString = '827' ) or   // Turquia
            ( TProc.FieldByName('cd_pais_destino').AsString = '244' ) then // Emirados Árabes
    begin
      if TProc.FieldByName('CD_INCOTERM').AsString = 'FOB' then
         ppAnalista.Visible := False;

      if quant.itemindex = 0 then
        ReportFileName := 'ChiFaBAI.rtm'
    end;
    if ReportFileName = '' then
    begin
      if ( TProc.FieldByName('cd_pais_destino').AsString = '063' ) or        // Argentina
         ( TProc.FieldByName('cd_pais_destino').AsString = '580' ) or        // Panamá
         ( TProc.FieldByName('cd_pais_destino').AsString = '187' ) or        // Coréia do Norte
         ( TProc.FieldByName('cd_pais_destino').AsString = '190' ) or        // Coréia do Sul
         ( TProc.FieldByName('cd_pais_destino').AsString = '845' ) or        // Uruguai
         ( TProc.FieldByName('cd_pais_destino').AsString = '586' ) then      // Paraguai
      begin
        if quant.itemindex = 1 then
           ReportFileName := 'PadFaBAE.rtm'
      end
      else if ( TProc.FieldByName('cd_pais_destino').AsString = '158' ) or   // Chile
              ( TProc.FieldByName('cd_pais_destino').AsString = '431' ) or   // Libano
              ( TProc.FieldByName('cd_pais_destino').AsString = '240' ) or   // Egito
              ( TProc.FieldByName('cd_pais_destino').AsString = '244' ) then // Emirados Árabes
      begin
        if quant.itemindex = 1 then
           ReportFileName := 'ChiFaBAE.rtm'
      end
      else
      begin
        if quant.itemindex = 1 then
          ReportFileName := 'DifFaBAE.rtm';
        if quant.itemindex = 0 then
          ReportFileName := 'DifFaBAI.rtm'
      end;
    end;
*)

{    if ReportFileName = '' then
    begin
       NomeArquivo := '';
       Exit;
    end;
 }
  end;

  NomeArquivo := '\' + ReportFileName;

  if Not FileExists( cDir_RPT + '\' + ReportFileName ) then
  begin
    ShowMessage( 'Verifique o Processo de Exportação !! Erro em Língua do Pedido ou País de Destino !!! ')
  end;
end;

procedure Tfrm_exp_impr_fatura.msk_nr_processoExit(Sender: TObject);
begin
  if Trim(msk_nr_processo.text) = '' then
    exit;
  with datm_exp_impr_fatura do
  begin
    TProcVerifica.Close;
    TProcVerifica.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
    TProcVerifica.Prepare;
    TProcVerifica.Open;
    if TProcVerifica.EOF then
    begin
      Screen.Cursor := crArrow;
      ShowMessage( 'Processo não encontrado !');
      msk_nr_processo.SetFocus;
      Exit;
    end
    else
    begin
      lVendaIncoterm := TProcVerifica.FieldByName('IN_VENDA_INCOTERM').AsBoolean;
      chkbox_venda_incoterm.Checked := lVendaIncoterm;

      // Linha em Branco entre Itens
      TCliente_Habilitacao.Close;
      TCliente_Habilitacao.ParamByName('CD_CLIENTE').AsString  := TProcVerifica.FieldByName('CD_CLIENTE').AsString;
      TCliente_Habilitacao.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      TCliente_Habilitacao.ParamByName('CD_PRODUTO').AsString  := '02';
      TCliente_Habilitacao.Prepare;
      TCliente_Habilitacao.Open;
      if Not ( TCliente_Habilitacao.FieldByName('NR_ALT_LINHA_FAT_EXP').IsNull ) then
        msk_espaco.Text := IntToStr( TCliente_Habilitacao.FieldByName('NR_ALT_LINHA_FAT_EXP').AsInteger )
      else
        msk_espaco.Text := '0';
      TCliente_Habilitacao.Close;
    end;
    TProcVerifica.Close;
  end;
end;

procedure Tfrm_exp_impr_fatura.CarregaPedidos;
var
  vQryPedidos: TQuery;
  vUnidade: String;
  vGrupo: string;
begin
  cbo_Pedidos.Items.Clear;
  vQryPedidos := TQuery.Create(application);
  try
    if Trim(msk_cd_unid_neg.Text) <> '' then
      vUnidade := msk_cd_unid_neg.Text
    else if Trim( str_cd_unid_neg_exp ) <> '' then
      vUnidade := str_cd_unid_neg_exp
    else
      vUnidade := '01';

    vGrupo := ConsultaLookUPSQL('select CD_GRUPO from tprocesso where nr_processo = ''' + vUnidade + '02' + msk_nr_processo.Text + '''','CD_GRUPO');

    if vGrupo = 'C39' then //Culligan
    begin
      vQryPedidos.DataBaseName := 'DBBROKER';
      vQryPedidos.sql.Text := 'SELECT NR_PEDIDO FROM TPROCESSO_EXP_PEDIDO (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO';
      vQryPedidos.ParamByName('NR_PROCESSO').AsString :=  vUnidade + '02' + msk_nr_processo.Text;
      vQryPedidos.open;

      vQryPedidos.First;
      if not vQryPedidos.eof then
      begin
        pnlPedidos.Visible := True;
        while not vQryPedidos.Eof do
        begin
          cbo_Pedidos.Items.Add(vQryPedidos.fieldByName('NR_PEDIDO').AsString);
          vQryPedidos.Next;
        end;
        cbo_Pedidos.ItemIndex := 0;
      end
      else
      begin
        pnlPedidos.Visible := False;
        cbo_Pedidos.Items.Clear;
      end;

    end
    else
    begin
      pnlPedidos.Visible := False;
      cbo_Pedidos.Items.Clear;
    end;

  finally
    vQryPedidos.Free;
  end;
end;

procedure Tfrm_exp_impr_fatura.QuantClick(Sender: TObject);
begin
  chk_grupo_emb_sup.Visible := Quant.ItemIndex = 0;
end;

procedure Tfrm_exp_impr_fatura.QuantExit(Sender: TObject);
begin
  chk_grupo_emb_sup.Visible := Quant.ItemIndex = 0;
end;

procedure Tfrm_exp_impr_fatura.SpeedButton1Click(Sender: TObject);
begin
  msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG');
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_exp_impr_fatura.msk_cd_unid_negChange(Sender: TObject);
begin
  edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'NM_UNID_NEG');
end;

procedure Tfrm_exp_impr_fatura.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''02''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  msk_nr_processo.Text := ConsultaOnLineExSQL(vListAux.Text,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO');
  vListAux.Free;
end;

procedure Tfrm_exp_impr_fatura.pBeforePrint;
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand1')).BeforePrint  := ppHeaderBand1BeforePrint;
  TppHeaderBand(Frm_impressao.FindComponent('ppDetailBand1')).BeforePrint  := ppDetailBand1BeforePrint;
  TppHeaderBand(Frm_impressao.FindComponent('ppFooterFatura')).BeforePrint := ppFooterFaturaBeforePrint;
end;

procedure Tfrm_exp_impr_fatura.ppDetailBand1BeforePrint(Sender: TObject);
begin
  with frm_exp_impr_fatura do
  begin
    if Trim( msk_espaco.Text ) <> '' then
      TppGroupFooterBand(Frm_impressao.FindComponent('ppGroupFooterBand2')).BottomOffset := StrToInt( msk_espaco.Text )
    else
      TppGroupFooterBand(Frm_impressao.FindComponent('ppGroupFooterBand2')).BottomOffset := 0;
  end;
end;

procedure Tfrm_exp_impr_fatura.ppFooterFaturaBeforePrint(Sender: TObject);
begin
  TppLabel(Frm_impressao.FindComponent('ppAcrescimo')).Visible        := ( datm_exp_impr_fatura.TProc.FieldByName( 'VL_ACRESCIMO' ).AsFloat <> 0 );
  TppDBText(Frm_impressao.FindComponent('ppdbtxt_acrescimo')).Visible := ( datm_exp_impr_fatura.TProc.FieldByName( 'VL_ACRESCIMO' ).AsFloat <> 0 );

  TppLabel(Frm_impressao.FindComponent('ppDesconto')).Visible        := ( datm_exp_impr_fatura.TProc.FieldByName( 'VL_DESCONTO' ).AsFloat <> 0 );
  TppDBText(Frm_impressao.FindComponent('ppdbtxt_desconto')).Visible := ( datm_exp_impr_fatura.TProc.FieldByName( 'VL_DESCONTO' ).AsFloat <> 0 );
end;

procedure Tfrm_exp_impr_fatura.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  with frm_exp_impr_fatura do
  begin
    if datm_exp_impr_fatura.Texp.FieldByName('LOGO').AsString <> '' then
      TppImage(Frm_impressao.FindComponent('ppimg_logo')).Picture.LoadFromFile( cDir_Rpt + '\' + Trim( datm_exp_impr_fatura.Texp.FieldByName('LOGO').AsString ) );

    // Idioma da Fatura
    if datm_exp_impr_fatura.TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '0' then    // Portugues
    begin
      TppLabel(Frm_impressao.FindComponent('ppFatura')).Caption := 'FATURA COMERCIAL Nº';
      TppLabel(Frm_impressao.FindComponent('ppProcesso')).Caption := 'EMBARQUE Nº';
      TppLabel(Frm_impressao.FindComponent('ppDtFatura')).Caption := 'DATA';
      TppLabel(Frm_impressao.FindComponent('ppAEmpresa')).Caption := 'À';
      TppLabel(Frm_impressao.FindComponent('ppConsig')).Caption := 'CONSIGNATÁRIO';
      TppLabel(Frm_impressao.FindComponent('ppQtde')).Caption := 'QTD';
      TppLabel(Frm_impressao.FindComponent('ppCod')).Caption := 'CÓDIGO';
      TppLabel(Frm_impressao.FindComponent('ppDesc')).Caption := 'DESCRIÇÃO';
      TppLabel(Frm_impressao.FindComponent('ppPesoLiq')).Caption := 'PESO LÍQUIDO';
      TppLabel(Frm_impressao.FindComponent('ppPesoBruto')).Caption := 'PESO BRUTO';
      TppLabel(Frm_impressao.FindComponent('ppPrecoUnit')).Caption := 'PREÇO UNIT';
      TppLabel(Frm_impressao.FindComponent('ppTotalValor')).Caption := 'PREÇO TOTAL';
      TppLabel(Frm_impressao.FindComponent('ppEmbalagem')).Caption := 'EMBALAGEM';
      TppLabel(Frm_impressao.FindComponent('ppPaisOrigem')).Caption := 'PAÍS DE ORIGEM';
      TppLabel(Frm_impressao.FindComponent('ppPesoLiqTotal')).Caption := 'PESO LÍQUIDO';
      TppLabel(Frm_impressao.FindComponent('ppPesoBrutoTotal')).Caption := 'PESO BRUTO';
      TppLabel(Frm_impressao.FindComponent('ppCubagem')).Caption := 'CUBAGEM';
      TppLabel(Frm_impressao.FindComponent('ppViaTransp')).Caption := 'VIA DE TRANSPORTE';
      TppLabel(Frm_impressao.FindComponent('ppMarcas')).Caption := 'MARCAS';
      TppLabel(Frm_impressao.FindComponent('ppLocalDestino')).Caption := 'LOCAL DE DESTINO';
      TppLabel(Frm_impressao.FindComponent('ppLocalOrigem')).Caption := 'LOCAL DE ORIGEM';

      TppLabel(Frm_impressao.FindComponent('ppPais')).Caption := 'PAÍS';
      TppLabel(Frm_impressao.FindComponent('ppPais2')).Caption := 'PAÍS';
      TppLabel(Frm_impressao.FindComponent('ppAcrescimo')).Caption := 'ACRÉSCIMO';
      TppLabel(Frm_impressao.FindComponent('ppDesconto')).Caption := 'DESCONTO';
      TppLabel(Frm_impressao.FindComponent('ppFrete')).Caption := 'FRETE';
      TppLabel(Frm_impressao.FindComponent('ppInlandFreight')).Caption := 'FRETE INTERNO';
      TppLabel(Frm_impressao.FindComponent('ppSeguro')).Caption := 'SEGURO';
      TppLabel(Frm_impressao.FindComponent('ppCondPagto')).Caption := 'COND. PAGTO';
      TppLabel(Frm_impressao.FindComponent('ppNotif1')).Caption := 'NOTIFICAR (1)';
      TppLabel(Frm_impressao.FindComponent('ppNotif2')).Caption := 'NOTIFICAR (2)';
      TppLabel(Frm_impressao.FindComponent('ppDoctos')).Caption := 'DOCTOS';
      TppLabel(Frm_impressao.FindComponent('ppCopias')).Caption := 'CÓPIAS';
      TppLabel(Frm_impressao.FindComponent('ppCartaCred')).Caption := 'L/C Nº';
      TppLabel(Frm_impressao.FindComponent('ppBL')).Caption := 'CONHECIMENTO DE EMBARQUE';
    end;
    if datm_exp_impr_fatura.TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then    // Inglês
    begin
      TppLabel(Frm_impressao.FindComponent('ppFatura')).Caption        := 'COMMERCIAL INVOICE NR';
      TppLabel(Frm_impressao.FindComponent('ppProcesso')).Caption      := 'SHIPMENT NR';
      TppLabel(Frm_impressao.FindComponent('ppDtFatura')).Caption      := 'DATE';
      TppLabel(Frm_impressao.FindComponent('ppAEmpresa')).Caption      := 'TO';
      TppLabel(Frm_impressao.FindComponent('ppConsig')).Caption        := 'CONSIGNEE';
      TppLabel(Frm_impressao.FindComponent('ppQtde')).Caption          := 'QTY';
      TppLabel(Frm_impressao.FindComponent('ppCod')).Caption           := 'CODE';
      TppLabel(Frm_impressao.FindComponent('ppDesc')).Caption          := 'DESCRIPTION OF GOODS';
      TppLabel(Frm_impressao.FindComponent('ppPesoLiq')).Caption        := 'NET WEIGHT';
      TppLabel(Frm_impressao.FindComponent('ppPesoBruto')).Caption      := 'GROSS WEIGHT';
      TppLabel(Frm_impressao.FindComponent('ppPrecoUnit')).Caption      := 'UNIT PRICE';
      TppLabel(Frm_impressao.FindComponent('ppTotalValor')).Caption     := 'TOTAL';
      TppLabel(Frm_impressao.FindComponent('ppEmbalagem')).Caption      := 'PACKING';
      TppLabel(Frm_impressao.FindComponent('ppPaisOrigem')).Caption     := 'COUNTRY OF ORIGIN';
      TppLabel(Frm_impressao.FindComponent('ppPesoLiqTotal')).Caption   := 'NET WEIGHT';
      TppLabel(Frm_impressao.FindComponent('ppPesoBrutoTotal')).Caption := 'GROSS WEIGHT';
      TppLabel(Frm_impressao.FindComponent('ppCubagem')).Caption        := 'MEASUREMENT';
      TppLabel(Frm_impressao.FindComponent('ppViaTransp')).Caption      := 'COMPANY VIA';
      TppLabel(Frm_impressao.FindComponent('ppMarcas')).Caption         := 'MARKS';
      TppLabel(Frm_impressao.FindComponent('ppLocalDestino')).Caption   := 'PORT OF UNLOADING';
      TppLabel(Frm_impressao.FindComponent('ppLocalOrigem')).Caption    := 'PORT OF LOADING';
      TppLabel(Frm_impressao.FindComponent('ppPais')).Caption           := 'COUNTRY';
      TppLabel(Frm_impressao.FindComponent('ppPais2')).Caption          := 'COUNTRY';
      TppLabel(Frm_impressao.FindComponent( 'ppAcrescimo')).Caption     := 'INTERNAL FEES';
      TppLabel(Frm_impressao.FindComponent('ppDesconto')).Caption       := 'DISCOUNT';
      TppLabel(Frm_impressao.FindComponent('ppFrete')).Caption          := 'FREIGHT';
      TppLabel(Frm_impressao.FindComponent('ppInlandFreight')).Caption  := 'INLAND FREIGHT';
      TppLabel(Frm_impressao.FindComponent('ppSeguro')).Caption         := 'INSURANCE';
      TppLabel(Frm_impressao.FindComponent('ppCondPagto')).Caption      := 'PAYMENT TERMS';
      TppLabel(Frm_impressao.FindComponent('ppNotif1')).Caption         := 'NOTIFY (1)';
      TppLabel(Frm_impressao.FindComponent('ppNotif2')).Caption         := 'NOTIFY (2)';
      TppLabel(Frm_impressao.FindComponent('ppDoctos')).Caption         := 'DOCUMENTS';
      TppLabel(Frm_impressao.FindComponent('ppCopias')).Caption         := 'COPIES';
      TppLabel(Frm_impressao.FindComponent('ppCartaCred')).Caption      := 'L/C Nr';
      TppLabel(Frm_impressao.FindComponent('ppBL')).Caption := 'BILL OF LADING';
    end;
    if datm_exp_impr_fatura.TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then    // Espanhol
    begin
      TppLabel(Frm_impressao.FindComponent('ppFatura')).Caption         := 'FACTURA COMERCIAL Nº';
      TppLabel(Frm_impressao.FindComponent('ppProcesso')).Caption       := 'EMBARQUE Nº';
      TppLabel(Frm_impressao.FindComponent('ppDtFatura')).Caption       := 'FECHA';
      TppLabel(Frm_impressao.FindComponent('ppAEmpresa')).Caption       := 'A';
      TppLabel(Frm_impressao.FindComponent('ppConsig')).Caption         := 'CONSIGNATARIO';
      TppLabel(Frm_impressao.FindComponent('ppQtde')).Caption           := 'CTD';
      TppLabel(Frm_impressao.FindComponent('ppCod')).Caption            := 'CÓDIGO';
      TppLabel(Frm_impressao.FindComponent('ppDesc')).Caption           := 'DESCRIPCIÓN';
      TppLabel(Frm_impressao.FindComponent('ppPesoLiq')).Caption        := 'PESO NETO';
      TppLabel(Frm_impressao.FindComponent('ppPesoBruto')).Caption      := 'PESO BRUTO';
      TppLabel(Frm_impressao.FindComponent('ppPrecoUnit')).Caption      := 'PRECIO UNIT';
      TppLabel(Frm_impressao.FindComponent('ppTotalValor')).Caption     := 'TOTAL';
      TppLabel(Frm_impressao.FindComponent('ppEmbalagem')).Caption      := 'EMPAQUE';
      TppLabel(Frm_impressao.FindComponent('ppPaisOrigem')).Caption     := 'PAÍS DE ORIGEN';
      TppLabel(Frm_impressao.FindComponent('ppPesoLiqTotal')).Caption   := 'PESO NETO';
      TppLabel(Frm_impressao.FindComponent('ppPesoBrutoTotal')).Caption := 'PESO BRUTO';
      TppLabel(Frm_impressao.FindComponent('ppCubagem')).Caption        := 'CUBAJE';
      TppLabel(Frm_impressao.FindComponent('ppViaTransp')).Caption      := 'TRANSPORTE VIA';
      TppLabel(Frm_impressao.FindComponent('ppMarcas')).Caption         := 'MARCAS';
      TppLabel(Frm_impressao.FindComponent('ppLocalDestino')).Caption   := 'LOCAL DESTINO';
      TppLabel(Frm_impressao.FindComponent('ppLocalOrigem')).Caption    := 'LOCAL EMBARQUE';
      TppLabel(Frm_impressao.FindComponent('ppPais')).Caption           := 'PAÍS';
      TppLabel(Frm_impressao.FindComponent('ppPais2')).Caption          := 'PAÍS';
      TppLabel(Frm_impressao.FindComponent('ppAcrescimo')).Caption      := 'ACRESCIMO';
      TppLabel(Frm_impressao.FindComponent('ppDesconto')).Caption       := 'DESCUENTO';
      TppLabel(Frm_impressao.FindComponent('ppFrete')).Caption          := 'FLETE';
      //TppLabel(Frm_impressao.FindComponent('ppInlandFreight')).Caption  := 'FLETE INTERNO';
      TppLabel(Frm_impressao.FindComponent('ppSeguro')).Caption         := 'SEGURO';
      TppLabel(Frm_impressao.FindComponent('ppCondPagto')).Caption      := 'COND. PAGO';
      TppLabel(Frm_impressao.FindComponent('ppNotif1')).Caption         := 'NOTIFICAR (1)';
      TppLabel(Frm_impressao.FindComponent('ppNotif2')).Caption         := 'NOTIFICAR (2)';
      TppLabel(Frm_impressao.FindComponent('ppDoctos')).Caption         := 'DOCTOS';
      TppLabel(Frm_impressao.FindComponent('ppCopias')).Caption         := 'COPIAS';
      TppLabel(Frm_impressao.FindComponent('ppCartaCred')).Caption      := 'L/C Nº';
      TppLabel(Frm_impressao.FindComponent('ppBL')).Caption := 'CONOCIMIENTO DE EMBARQUE';
    end;

    case cbo_tipo.ItemIndex of
      0 : begin
            TppLabel(Frm_impressao.FindComponent('ppTipo')).Caption := 'ORIGINAL';
          end;
      1 : begin
          if datm_exp_impr_fatura.Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then    // Inglês
            TppLabel(Frm_impressao.FindComponent('ppTipo')).Caption := 'COPY';
          if datm_exp_impr_fatura.Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '0' then    // Portugues
            TppLabel(Frm_impressao.FindComponent('ppTipo')).Caption := 'CÓPIA';
          if datm_exp_impr_fatura.Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then    // Espanhol
            TppLabel(Frm_impressao.FindComponent('ppTipo')).Caption := 'COPIA';
          end;

      2 : TppLabel(Frm_impressao.FindComponent('ppTipo')).Caption := '';
    end;

//    alterado para aparecer o peso bruto quando tirado por embalagem
//    pppeso_bruto.Visible := ( Quant.ItemIndex = 0 );

    TppDBMemo(Frm_impressao.FindComponent('Calc_Decl_Ini')).Visible := datm_exp_impr_fatura.TProc.FieldByName('TP_POS_AD').AsString = '0';
    TppDBMemo(Frm_impressao.FindComponent('Calc_Decl_Fim')).Visible := datm_exp_impr_fatura.TProc.FieldByName('TP_POS_AD').AsString <> '0';


    if TppLabel(Frm_impressao.FindComponent('ppPagina')).Text <> '1' then
    begin
      TppFooterBand(Frm_impressao.FindComponent('ppFooterFatura')).Visible := False;
      TppDBMemo(Frm_impressao.FindComponent('Calc_Decl_Ini')).Visible := False
    end
    else
    begin
      TppFooterBand(Frm_impressao.FindComponent('ppFooterFatura')).Visible := True;
      if datm_exp_impr_fatura.TProc.FieldByName('TP_POS_AD').AsString = '0' then
        TppDBMemo(Frm_impressao.FindComponent('Calc_Decl_Ini')).Visible := True;
    end;

    TppDBText(Frm_impressao.FindComponent('ppDBText24')).Visible := (datm_exp_impr_fatura.TProc.FieldByName('VL_INLAND_FREIGHT').AsString <> '0');
    TppLabel(Frm_impressao.FindComponent('ppInlandFreight')).Visible := (datm_exp_impr_fatura.TProc.FieldByName('VL_INLAND_FREIGHT').AsString <> '0' );

    if (datm_exp_impr_fatura.TProc.FieldByName('VL_INLAND_FREIGHT').AsString = '0' ) then
    begin
      TppDBText(Frm_impressao.FindComponent('ppDBText100')).Top := 481;
      TppLabel(Frm_impressao.FindComponent('ppSeguro')).Top := 481;
      TppDBText(Frm_impressao.FindComponent('ppLocalIncoterm')).Top := 575;
      TppDBText(Frm_impressao.FindComponent('ppDBText101')).Top := 575;
      TppDBText(Frm_impressao.FindComponent('ppDBText32')).Top := 575;

      if Assigned(Frm_impressao.FindComponent('ppDBText38')) then // IF incluído porque nem todos os relatórios tem esse campo - Michel - 02/01/2012
        TppDBText(Frm_impressao.FindComponent('ppDBText38')).Top := 575;      //by carlos - 30/09/2011 - coloquei tbem IsNull nas querys onde aparecia o VL_INLAND_FREIGHT
      if Assigned(Frm_impressao.FindComponent('ppLabel8')) then // IF incluído porque nem todos os relatórios tem esse campo - Michel - 02/01/2012
        TppDBText(Frm_impressao.FindComponent('ppLabel8')).Top := 575;
    end;

    if datm_exp_impr_fatura.TPais1.FieldByName('IN_NCM_FATURA').AsString = '1' then
      TppDBMemo(Frm_impressao.FindComponent('ppDBMNalNCM')).DataField := 'DESCR_NCM'
    else if datm_exp_impr_fatura.TPais1.FieldByName('IN_NALADI_FATURA').AsString = '1' then
      TppDBMemo(Frm_impressao.FindComponent('ppDBMNalNCM')).DataField := 'DESCR_NALADI'
    else
      TppDBMemo(Frm_impressao.FindComponent('ppDBMNalNCM')).DataField := ''
  end;
end;

procedure Tfrm_exp_impr_fatura.msk_nr_processoChange(Sender: TObject);
begin
  if Length(msk_nr_processo.Text) = 12 then
    CarregaPedidos;
end;

end.


