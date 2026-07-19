unit PGPE033;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, Funcoes, DB, DBTables;

type
  Tfrm_exp_impr_packing = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlPedidos: TPanel;
    Panel4: TPanel;
    Ok_btn: TBitBtn;
    btn_arquivo: TBitBtn;
    Retorna: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    btn_co_proc_new: TSpeedButton;
    btn_cd_unid_neg: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Label2: TLabel;
    cbo_tipo: TComboBox;
    Button1: TButton;
    Quant: TRadioGroup;
    cbo_Pedidos: TComboBox;
    Label5: TLabel;
    procedure RetornaClick(Sender: TObject);
    procedure Ok_btnClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
  private
    procedure CarregaPedidos;
    { Private declarations }
  public
    { Public declarations }
    str_nr_proc_exp : String[18];
    str_cd_unid_neg_exp : String[2];
    Petronas: Boolean;
  end;

var
  frm_exp_impr_packing: Tfrm_exp_impr_packing;
  ReportFileName : String;

implementation

uses PGPE034, GSMLIB, PGSM018, PGGP001, PGGP025, PGSM136, PGSM990, ConsOnLineEx, PGGP017;

{$R *.DFM}

procedure Tfrm_exp_impr_packing.RetornaClick(Sender: TObject);
begin
   self.close ;
end;

procedure Tfrm_exp_impr_packing.Ok_btnClick(Sender: TObject);
begin
  if not ConfereNF(msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text) then Exit;
  try
    with datm_exp_impr_packing do
    begin
      if Trim(msk_nr_processo.Text) = '' then
      begin
        BoxMensagem('Informar Nr. do processo !', 2 ) ;
        msk_nr_processo.SetFocus ;
        Exit;
      end;

      Tprocesso.Close;
      Tprocesso.Sql.Clear ;
      Tprocesso.Sql.Add('SELECT CD_UNID_NEG, NR_PROCESSO, NR_DDE FROM TPROCESSO WHERE NR_PROCESSO = "' + msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text + '"');
      Tprocesso.Prepare;
      Tprocesso.Open;
      if Tprocesso.EOF then
      begin
        BoxMensagem('Processo não encontrado !', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end;

      {RE}
      TProcRE.Close;
      TProcRE.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TProcRE.Prepare;
      TProcRE.Open;

      // Filtra TProcesso_Exp Header
      Tproc.Close;
      Tproc.Sql.Clear ;
      Tproc.Sql.Add(
         'SELECT LTRIM( RTRIM( NM_SIGLA ) ) + "-" + SUBSTRING( E.NR_PROCESSO, 5, 14 ) AS CalcProcesso, '+
         'E.NR_PROCESSO,'+
         'P.CD_GRUPO,'+
         'E.DT_FATURA, '+
         'E.CD_EXPORTADOR, '+
         'E.CD_IMPORTADOR, '+
         'E.CD_LOCAL_ORIGEM, '+
         'E.CD_LOCAL_DESTINO, '+
         'P.CD_UNID_NEG,'+
         'E.TP_CONSIGNATARIO,'+
         'E.CD_CONSIGNATARIO, ' +
         'E.CD_VIA_TRANSPORTE, '+
         'E.TX_MARCACAO_VOLUME, ');

         if (cbo_Pedidos.Items.Count > 1) then
         begin
           Tproc.SQL.Add('PEP.NR_FATURA, ' +
                         'PEP.TX_INF_EMBALAGEM, ' +
                         'SI.PESO_LIQ AS VL_PESO_LIQUIDO, ' +
                         'SI.PESO_BRUTO AS VL_PESO_BRUTO, ' +
                         'SI.CUBAGEM AS VL_TOT_CUBAGEM,');
         end
         else
         begin
           Tproc.SQL.Add('E.NR_FATURA, ' +
                         'E.TX_INF_EMBALAGEM, '+
                         'E.VL_PESO_LIQUIDO, ' +
                         'E.VL_PESO_BRUTO, '+
                         'E.VL_TOT_CUBAGEM, ');
         end;

         Tproc.SQL.Add(
         'E.CD_LINGUA_PEDIDO, ' +
         'E.CD_PAIS_ORIG AS CD_PAIS_ORIGEM, '+
         'E.CD_PAIS_DESTINO AS CD_PAIS_DESTINO, '+
         'E.TX_DECL_ADICIONAL, '+
         'E.IN_DECL_AD_PACKING_LIST, ' +
         'CASE E.CD_LINGUA_PEDIDO ' +
         '   WHEN "0" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, DT_FATURA ) ), 2 ) + " de " + ' +
         '       CASE DATEPART( m, DT_FATURA ) ' +
         '          WHEN 1 THEN "Janeiro" ' +
         '          WHEN 2 THEN "Fevereiro" ' +
         '          WHEN 3 THEN "Março" ' +
         '          WHEN 4 THEN "Abril" ' +
         '          WHEN 5 THEN "Maio" ' +
         '          WHEN 6 THEN "Junho" ' +
         '          WHEN 7 THEN "Julho" ' +
         '          WHEN 8 THEN "Agosto" ' +
         '          WHEN 9 THEN "Setembro" ' +
         '          WHEN 10 THEN "Outubro" ' +
         '          WHEN 11 THEN "Novembro" ' +
         '          WHEN 12 THEN "Dezembro" ' +
         '       END + " de " + CONVERT(char(4), DATEPART( yyyy, DT_FATURA ) ) ' +
         '   WHEN "1" THEN ' +
         '       CASE DATEPART( m, DT_FATURA ) ' +
         '          WHEN 1 THEN "January" ' +
         '          WHEN 2 THEN "February" ' +
         '          WHEN 3 THEN "March" ' +
         '          WHEN 4 THEN "April" ' +
         '          WHEN 5 THEN "May" ' +
         '          WHEN 6 THEN "June" ' +
         '          WHEN 7 THEN "July" ' +
         '          WHEN 8 THEN "August" ' +
         '          WHEN 9 THEN "September" ' +
         '          WHEN 10 THEN "October" ' +
         '          WHEN 11 THEN "November" ' +
         '          WHEN 12 THEN "December" ' +
         '       END + " " + RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, DT_FATURA ) ), 2 ) + ' +
         '       CASE RIGHT( CONVERT( varchar(2), DATEPART( d, DT_FATURA ) ), 1 ) ' +
         '          WHEN "1" THEN "st" ' +
         '          WHEN "2" THEN "nd" ' +
         '          ELSE "th" ' +
         '       END + ", " + CONVERT(char(4), DATEPART( yyyy, DT_FATURA ) ) ' +
         '   WHEN "2" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPART( dd, DT_FATURA ) ), 2 ) + " de " + ' +
         '       CASE DATEPART( m, DT_FATURA ) ' +
         '          WHEN 1 THEN "Enero" ' +
         '          WHEN 2 THEN "Febrero" ' +
         '          WHEN 3 THEN "Marzo" ' +
         '          WHEN 4 THEN "Abril" ' +
         '          WHEN 5 THEN "Mayo" ' +
         '          WHEN 6 THEN "Junio" ' +
         '          WHEN 7 THEN "Julio" ' +
         '          WHEN 8 THEN "Agosto" ' +
         '          WHEN 9 THEN "Septiembre" ' +
         '          WHEN 10 THEN "Octubre" ' +
         '          WHEN 11 THEN "Noviembre" ' +
         '          WHEN 12 THEN "Diciembre" ' +
         '       END  + " de " + CONVERT(char(4), DATEPART( yyyy, DT_FATURA ) ) ' +
         'END AS DATA_FATURA, CD_CARTA_CREDITO, VL_TOT_QTDE_PROD ' +
         'FROM TPROCESSO_EXP E ' +
         'INNER JOIN TPROCESSO P ON P.NR_PROCESSO = E.NR_PROCESSO ' +
         'INNER JOIN TUNID_NEG U ON P.CD_UNID_NEG = U.CD_UNID_NEG ');

          if (cbo_Pedidos.Items.Count > 1) then
            Tproc.SQL.Add( 'LEFT JOIN TPROCESSO_EXP_PEDIDO PEP ON PEP.NR_PROCESSO = P.NR_PROCESSO AND PEP.NR_PEDIDO = '+ QuotedStr(cbo_Pedidos.text) + ' ' +
                           'OUTER APPLY ( ' +
                           '   SELECT ' +
                           '   SUM(I.VL_TOT_PESO_LIQ) PESO_LIQ, ' +
                           '   SUM(I.VL_TOT_PESO_BRUTO) PESO_BRUTO, ' +
                           '   SUM(I.VL_CUBAGEM) CUBAGEM ' +
                           '   FROM TPROCESSO_EXP_ITEM I ( NOLOCK ) ' +
                           '   WHERE ' +
                           '   I.NR_PROCESSO = E.NR_PROCESSO ' +
                           '   AND I.NR_PEDIDO = PEP.NR_PEDIDO ' +
                           ' ) SI ');

         Tproc.SQL.Add('WHERE E.NR_PROCESSO = "' + Trim( msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text + '"') );


      Tproc.Prepare;
      Tproc.Open;
      if Tproc.EOF then
      begin
        BoxMensagem('Processo não encontrado na Exportação !', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end;

      TProcI.Close;
      TprocI.Sql.Clear ;
      if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then       // ingles
      begin
        TprocI.Sql.Add(
          'SELECT i.cd_unid_medida AS CD_UNID_MEDIDA,'+
          'i.nr_item AS NR_ITEM,'+
          'i.cd_mercadoria AS CD_MERCADORIA,' +
          'I.QT_MERCADORIA AS QT_MERCADORIA, ' +
          'i.vl_tot_peso_liq AS VL_TOT_PESO_LIQ, '+
          'U.NM_SIGLA, '+
          'i.vl_tot_peso_bruto AS VL_TOT_PESO_BRUTO, '+
          'i.vl_unitario AS VL_UNITARIO,' +
          'i.vl_tot_item AS VL_TOT_ITEM,'+
          'I.TX_MERCADORIA AS NM_MERCADORIA, ' +
          'I.QT_EMBALAGEM AS QT_EMBALAGEM,'+
          'E.NM_DESCR_DETALHADA_INGLES AS NM_EMBALAGEM, '+
          'EM.NM_DESCR_DETALHADA_INGLES AS NM_EMB_SUP, ' +
          'CASE I.QT_EMBALAGEM_SUP WHEN 0 THEN "" ELSE STR( I.QT_EMBALAGEM_SUP, 8, 2 ) END AS QT_EMB_SUP, '+
          'E.NM_DESCR_DETALHADA AS NM_DESCR_DETALHADA, ' +
          'P.NM_PAIS_ING AS NM_PAIS_ORIGEM,'+
          'I.NR_PEDIDO_IMP AS NR_PEDIDO_COMPRA, '+
          'i.VL_CUBAGEM AS VL_CUBAGEM, ' +
          'isnull(u.NM_UNID_MEDIDA_ING,U.NM_UNID_MEDIDA) as NM_UNID_MEDIDA '+          
          'from tprocesso_exp_item       i ' +
          'left join tmercadoria_exp     m  on i.cd_mercadoria=m.cd_mercadoria ' +
          'left join tembalagem          e  on i.cd_embalagem=e.cd_embalagem ' +
          'left join tembalagem          em on i.cd_embalagem_sup=em.cd_embalagem ' +
          'left join tpais_broker        p  on m.cd_pais_origem=p.cd_pais ' +
          'LEFT JOIN TUNID_MEDIDA_BROKER U  ON U.CD_UNID_MEDIDA = I.CD_UNID_MEDIDA ' +
          'where nr_processo="' + Trim( msk_cd_unid_neg.Text + '02' + msk_nr_processo.text+ '"')) ;

          if (cbo_Pedidos.Items.Count > 1) then
            TprocI.SQL.Add('AND I.NR_PEDIDO = ' + QuotedStr(cbo_Pedidos.text));

          TprocI.SQL.Add('ORDER BY NR_PROCESSO, NR_ITEM' );
      end
      else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then     // espanhol
      begin
        TprocI.Sql.Add(
          'select i.cd_unid_medida AS CD_UNID_MEDIDA,  '+
          'i.nr_item AS NR_ITEM, '+
          'i.cd_mercadoria AS CD_MERCADORIA, '+
          'I.QT_MERCADORIA AS QT_MERCADORIA, ' +
          'i.vl_tot_peso_liq AS VL_TOT_PESO_LIQ, '+
          'U.NM_SIGLA, '+
          'i.vl_tot_peso_bruto AS VL_TOT_PESO_BRUTO, '+
          'i.vl_unitario AS VL_UNITARIO,'+
          'i.vl_tot_item AS VL_TOT_ITEM,'+
          'i.tx_mercadoria AS NM_MERCADORIA, ' +
          'I.QT_EMBALAGEM AS QT_EMBALAGEM, '+
          'e.NM_DESCR_DETALHADA_ESPANHOL AS NM_EMBALAGEM,'+
          'em.NM_DESCR_DETALHADA_ESPANHOL AS NM_EMB_SUP, ' +
          'CASE I.QT_EMBALAGEM_SUP WHEN 0 THEN "" ELSE STR( I.QT_EMBALAGEM_SUP, 8, 2 ) END AS QT_EMB_SUP,'+
          'E.NM_DESCR_DETALHADA AS NM_DESCR_DETALHADA, ' +
          'p.nm_pais_esp as NM_PAIS_ORIGEM,'+
          'i.nr_pedido_imp AS NR_PEDIDO_COMPRA, '+
          'i.VL_CUBAGEM AS VL_CUBAGEM, ' +
          'isnull(u.NM_UNID_MEDIDA_ESP,U.NM_UNID_MEDIDA) as NM_UNID_MEDIDA '+
          'from tprocesso_exp_item       i ' +
          'left join tmercadoria_exp     m  on i.cd_mercadoria=m.cd_mercadoria ' +
          'left join tembalagem          e  on i.cd_embalagem=e.cd_embalagem ' +
          'left join tembalagem          em on i.cd_embalagem_sup=em.cd_embalagem ' +
          'left join tpais_broker        p  on m.cd_pais_origem=p.cd_pais ' +
          'LEFT JOIN TUNID_MEDIDA_BROKER U  ON U.CD_UNID_MEDIDA = I.CD_UNID_MEDIDA ' +
          'where nr_processo="' + Trim( msk_cd_unid_neg.Text + '02' + msk_nr_processo.text+ '"')) ;

          if (cbo_Pedidos.Items.Count > 1) then
            TprocI.SQL.Add('AND I.NR_PEDIDO = ' + QuotedStr(cbo_Pedidos.text));

          TprocI.SQL.Add('ORDER BY NR_PROCESSO, NR_ITEM' );
      end
      else        // portugues
      begin
        TprocI.Sql.Add(
          'select i.cd_unid_medida AS CD_UNID_MEDIDA, '+
          'i.nr_item AS NR_ITEM, i.cd_mercadoria AS CD_MERCADORIA, '+
          'I.QT_MERCADORIA AS QT_MERCADORIA, ' +
          'i.vl_tot_peso_liq AS VL_TOT_PESO_LIQ, '+
          'U.NM_SIGLA, '+
          'i.vl_tot_peso_bruto AS VL_TOT_PESO_BRUTO, '+
          'i.vl_unitario AS VL_UNITARIO, '+
          'i.vl_tot_item AS VL_TOT_ITEM, '+
          'i.tx_mercadoria AS NM_MERCADORIA, ' +
          'I.QT_EMBALAGEM AS QT_EMBALAGEM, '+
          'E.NM_EMBALAGEM_S AS NM_EMBALAGEM, '+
          'EM.NM_EMBALAGEM_S AS NM_EMB_SUP, ' +
          'CASE I.QT_EMBALAGEM_SUP WHEN 0 THEN "" ELSE STR( I.QT_EMBALAGEM_SUP, 8, 2 ) END AS QT_EMB_SUP, ' +
          'E.NM_DESCR_DETALHADA AS NM_DESCR_DETALHADA, ' +
          'p.nm_pais_port as NM_PAIS_ORIGEM, '+
          'i.nr_pedido_imp AS NR_PEDIDO_COMPRA, '+
          'i.VL_CUBAGEM AS VL_CUBAGEM, ' +
          'U.NM_UNID_MEDIDA '+
          'from tprocesso_exp_item       i   ' +
          'left join tmercadoria_exp     m   on i.cd_mercadoria=m.cd_mercadoria ' +
          'left join tembalagem          e   on i.cd_embalagem=e.cd_embalagem ' +
          'left join tembalagem          em  on i.cd_embalagem_sup=em.cd_embalagem ' +
          'left join tpais_broker        p   on m.cd_pais_origem=p.cd_pais ' +
          'LEFT JOIN TUNID_MEDIDA_BROKER U   ON U.CD_UNID_MEDIDA = I.CD_UNID_MEDIDA ' +
          'where nr_processo="' + Trim( msk_cd_unid_neg.Text + '02' + msk_nr_processo.text+ '"')) ;

          if (cbo_Pedidos.Items.Count > 1) then
            TprocI.SQL.Add('AND I.NR_PEDIDO = ' + QuotedStr(cbo_Pedidos.text));

          TprocI.SQL.Add('ORDER BY NR_PROCESSO, NR_ITEM' );
      end;
      TprocI.Open ;

      // Filtra Exportador
      TExp.Close;
      TExp.ParamByName('CD_EMPRESA').AsString := Tproc.FieldByName('cd_exportador').AsString;
      Texp.Prepare;
      Texp.Open;

      // Filtra Importador
      Timp.Close;
      Timp.Sql.Clear ;
      if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
      begin
        Timp.Sql.Add(
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
        'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) )  AS ENDERECO_NUM, ' +
//        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS, E.CD_PAIS AS CD_PAIS ' +
        'LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
        'LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS, E.CD_PAIS AS CD_PAIS, "RUC: "+NR_RUC NR_RUC, "NIT: " +NR_NIT NR_NIT, "CUIT: "+NR_CUIT NR_CUIT ' +
        'FROM TEMPRESA_EST E ' +
        'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS = P.CD_PAIS ' +
        'WHERE CD_EMPRESA = "' + Tproc.FieldByName('CD_IMPORTADOR').AsString + '"' );
      end
      else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then   // espanhol
      begin
        Timp.Sql.Add(
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
        'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) )  AS ENDERECO_NUM, ' +
//        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS, E.CD_PAIS AS CD_PAIS ' +
        'LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
        'LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS, E.CD_PAIS AS CD_PAIS, "RUC: "+NR_RUC NR_RUC, "NIT: " +NR_NIT NR_NIT, "CUIT: "+NR_CUIT NR_CUIT ' +
        'FROM TEMPRESA_EST E ' +
        'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS = P.CD_PAIS ' +
        'WHERE CD_EMPRESA = "' + Tproc.FieldByName('CD_IMPORTADOR').AsString + '"' );
      end
      else      // portugues
      begin
        Timp.Sql.Add(
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
        'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) )  AS ENDERECO_NUM, ' +
//        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, E.CD_PAIS AS CD_PAIS ' +
        'LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
        'LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, E.CD_PAIS AS CD_PAIS, "RUC: "+NR_RUC NR_RUC, "NIT: " +NR_NIT NR_NIT, "CUIT: "+NR_CUIT NR_CUIT ' +
        'FROM TEMPRESA_EST E ' +
        'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS = P.CD_PAIS ' +
        'WHERE CD_EMPRESA = "' + Tproc.FieldByName('CD_IMPORTADOR').AsString + '"' );
      end;
      Timp.Prepare;
      Timp.Open;

      // Filtra local Origem
      Tlocal1.Close;
      Tlocal1.Sql.Clear ;
      Tlocal1.Sql.Add('select descricao from tlocal_embarque where codigo="'+Tproc.FieldByName('cd_local_origem').asString+'"') ;
      Tlocal1.Open ;

      // Filtra local Destino
      Tlocal2.Close;
      Tlocal2.Sql.Clear ;
      Tlocal2.Sql.Add('select descricao from tlocal_embarque where codigo="'+Tproc.FieldByName('cd_local_destino').asString+'"') ;
      Tlocal2.Open ;

      // Filtra Consignatário
      Tconsig.Close ;
      Tconsig.Sql.Clear ;
      if Tproc.FieldByName('tp_consignatario').AsString = '2' then // Transportadora
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           Tconsig.Sql.Add('SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, P.NM_PAIS_ING AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T ' +
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_consignatario').asString+'"')
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           Tconsig.Sql.Add('SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, P.NM_PAIS_ESP AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_consignatario').asString+'"')
        else
           Tconsig.Sql.Add('SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" AS ENDERECO_NUM, P.NM_PAIS_PORT AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_consignatario').asString+'"');
      end
      else if Tproc.FieldByName('tp_consignatario').AsString = '4' then // Despachante
         Tconsig.Sql.Add('SELECT CD_DESPACHANTE AS CODIGO, NM_DESPACHANTE AS NOME, "" AS ENDERECO_NUM, NULL AS CIDADE_PAIS '+
                         'FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' +  Tproc.FieldByName('cd_consignatario').AsString + '"')
      else if (Tproc.FieldByName('tp_consignatario').AsString = '0') or
              (Tproc.FieldByName('tp_consignatario').AsString = '1') or
              (Tproc.FieldByName('tp_consignatario').AsString = '3') then // Importador / Agente / Banco
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            //'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS ' +
                            ' LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
                            ' LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
                            ' LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS, "RUC: "+NR_RUC NR_RUC, "NIT: " +NR_NIT NR_NIT, "CUIT: "+NR_CUIT NR_CUIT ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('cd_consignatario').AsString + '"' )
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            //'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS ' +
                            ' LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
                            ' LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
                            ' LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS, "RUC: "+NR_RUC NR_RUC, "NIT: " +NR_NIT NR_NIT, "CUIT: "+NR_CUIT NR_CUIT ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('cd_consignatario').AsString + '"' )
        else     /// portugues
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, ' +  //estava faltando a virgula após o CIDADE_PAIS - by carlos 29/11/2011
                            ' LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
                            ' LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + '+
                            ' LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, "RUC: "+NR_RUC NR_RUC, "NIT: " +NR_NIT NR_NIT, "CUIT: "+NR_CUIT NR_CUIT ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('cd_consignatario').AsString + '"' )
      end
      else
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then       // Ingles
          Tconsig.Sql.Add('SELECT "TO ORDER" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS FROM TEMPRESA_EST')
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '0' then  // Portugues
          Tconsig.Sql.Add('SELECT "A ORDEM" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS FROM TEMPRESA_EST')
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then  // Espanhol
          Tconsig.Sql.Add('SELECT "A LA ORDEN" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS FROM TEMPRESA_EST');
      end;
      Tconsig.Open ;

      // Filtra Via de Transporte
      TViaTr.Close;
      TViaTr.Sql.Clear ;
      TViaTr.Sql.Add('select * from tvia_transporte where cd_via_transporte="'+Tproc.FieldByName('cd_via_transporte').asString+'"') ;
      TviaTr.Open ;

      TPais1.Close;
      TPais1.Sql.Clear ;
      if tproc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais1.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"')
      else if tproc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais1.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"')
      else
         TPais1.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"');
      TPais1.Open;

      TPais2.Close;
      TPais2.Sql.Clear ;
      if tproc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais2.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"')
      else if tproc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais2.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"')
      else
         TPais2.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"');
      TPais2.Open;

      ReportFileName := 'PackingList';

      TCartaCred.Close;
      TCartaCred.ParamByName('NR_PROCESSO').AsString := TProcesso.FieldByName('NR_PROCESSO').AsString;
      TCartaCred.Prepare;
      TCartaCred.Open;

//Rodrigo Capra - comecei a alterar para chamar o form de impressão
      //chama o form de impressão!!
{      Application.CreateForm(TFrm_impressao, Frm_impressao);
      frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
      frm_impressao.cd_produto    := '02';
      frm_impressao.cd_via_transp := '';
      frm_impressao.cd_modulo     := '2025'; //packing list
      Frm_impressao.cd_grupo      := ConsultaLookUPSQL('select CD_GRUPO from tprocesso where nr_processo = ''' + msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text + '''','CD_GRUPO');
      frm_impressao.vApenas_email := false;
//      frm_impressao.vBeforePrint  := pBeforePrint;
      frm_impressao.ShowModal;
      frm_impressao.Release;}


      if Not TCartaCred.EOF then
        ReportFileName := ReportFileName + 'CartaCred';
      if Petronas then
        ReportFileName := ReportFileName + 'Petronas.rtm'
      else
        ReportFileName := ReportFileName + '.rtm';
      ReportFileName := '\' + ReportFileName;
      ppRepPackList.Template.FileName := cDir_RPT + ReportFileName;
      ppRepPackList.Template.LoadFromFile;
      ppRepPackList.AllowPrintToFile  := True;
      case ( Sender as TButton ).Tag of
        1 : ppRepPackList.DeviceType  := 'Screen';
        2 : ppRepPackList.DeviceType  := 'PDFFile';
      end;
      ppRepPackList.TextFileName      := cDir_Rpt + '\Pack-' + Trim( Tproc.FieldByName('NR_PROCESSO').AsString ) + '.PDF';
      if Texp.FieldByName('PATH_LOGO').AsString = '' then
         ppimg_logo_packlist.Picture.LoadFromFile( cDir_Rpt + '\figura.bmp')
      else
         ppimg_logo_packlist.Picture.LoadFromFile( cDir_Rpt + '\' + Trim( TExp.FieldByName('PATH_LOGO').AsString ) );
      ppRepPackList.Print;
    end;
  finally
  end;
end;

procedure Tfrm_exp_impr_packing.msk_cd_unid_negExit(Sender: TObject);
begin
   if msk_cd_unid_neg.Text <> '' then begin
      with datm_exp_impr_packing do  begin
        Tunid.Close;
        TUnid.Sql.Clear ;
        TUnid.Sql.Add('select cd_unid_neg, nm_unid_neg from tunid_neg '+
                      'where cd_unid_neg = "' + msk_cd_unid_neg.Text + '" ');
        Tunid.Open;
        if TUnid.Eof then begin
           BoxMensagem('Unidade de Negócio não cadastrada!', 2);
           msk_cd_unid_neg.SetFocus;
        end;
        edt_nm_unid_neg.Text := tunid.FieldByName('NM_UNID_NEG').AsString;
     end;
   end else
     msk_cd_unid_neg.SetFocus;
end;

procedure Tfrm_exp_impr_packing.FormShow(Sender: TObject);
begin
  if Trim( str_cd_unid_neg_exp ) <> '' then
    msk_cd_unid_neg.Text := str_cd_unid_neg_exp
  else
    msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_nr_processo.SetFocus;

  if Trim( str_nr_proc_exp ) <> '' then
  begin
    msk_nr_processo.Text := str_nr_proc_exp;
    Ok_btn.SetFocus;
  end;

  cbo_tipo.ItemIndex := 0;
  if str_cd_cargo <> '001' then
    Button1.Visible := False;
end;

procedure Tfrm_exp_impr_packing.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_exp_impr_packing do
  begin
    TUnid.Close;
    TProcesso.Close;
    TProc.Close;
    TProcI.Close;
    TExp.Close;
    TImp.Close;
    TLocal1.Close;
    TLocal2.Close;
    TConsig.Close;
    TViaTr.Close;
    TProcRE.Close;
    TCartaCred.Close;
    Free;
  end;

  Action := caFree ;
end;


procedure Tfrm_exp_impr_packing.btn_co_proc_newClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_exp,frm_consulta_exp);
  frm_consulta_exp.str_cd_unid := frm_exp_impr_packing.msk_cd_unid_neg.Text;
  frm_consulta_exp.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_exp.Nr_Processo <> '') then
    msk_nr_processo.Text := copy( frm_consulta_exp.Nr_Processo, 5, 14 );
end;

procedure Tfrm_exp_impr_packing.FormCreate(Sender: TObject);
begin
  Petronas := False;
  Application.CreateForm(Tdatm_exp_impr_packing, datm_exp_impr_packing );
end;

procedure Tfrm_exp_impr_packing.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_exp_impr_packing.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo then btn_co_proc_newClick(nil);
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
    end;
  end;
end;

procedure Tfrm_exp_impr_packing.Button1Click(Sender: TObject);
begin
  ReportFileName := 'PackingList';
  ReportFileName := ReportFileName + 'CartaCred';
  if Petronas then
    ReportFileName := ReportFileName + 'Petronas.rtm'
  else
    ReportFileName := ReportFileName + '.rtm';
  ReportFileName := '\' + ReportFileName;

  datm_exp_impr_packing.ppRepPackList.Template.FileName := cDir_RPT + ReportFileName;
  datm_exp_impr_packing.ppRepPackList.AllowPrintToArchive :=False;
  datm_exp_impr_packing.ppRepPackList.AllowPrintToFile :=False;
  datm_exp_impr_packing.ppRepPackList.ShowPrintDialog := True;
  datm_exp_impr_packing.ppRepPackList.SaveAsTemplate := false;
  datm_exp_impr_packing.ppDesigner.ShowModal;
end;

procedure Tfrm_exp_impr_packing.msk_nr_processoChange(Sender: TObject);
begin
  if Length(msk_nr_processo.Text) = 12 then
    CarregaPedidos;
end;

procedure Tfrm_exp_impr_packing.CarregaPedidos;
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

end.
