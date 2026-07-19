unit PGPE031;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DBTables, Funcoes, ppBands;

type
  Tfrm_exp_impr_cert_orig = class(TForm)
    Label1: TLabel;
    processo: TMaskEdit;
    Ok_btn: TBitBtn;
    Retorna: TBitBtn;
    Modelo: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    btn_co_proc_new: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    msk_nr_ordem: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    msk_data: TMaskEdit;
    procedure Ok_btnClick(Sender: TObject);
    procedure RetornaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    lHabilita_NCM_DOC, lHabilita_NALADI_DOC : Boolean;
  public
    { Public declarations }
    str_nr_proc_exp : String[18];
    str_cd_unid_neg_exp : String[2];
  end;

var
  frm_exp_impr_cert_orig: Tfrm_exp_impr_cert_orig;
  ReportFileName : String;

implementation

uses PGPE032, GSMLIB, PGGP001, PGGP025, PGSM018, PGGP017, PGSM990, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_exp_impr_cert_orig.Ok_btnClick(Sender: TObject);
var cAcordo : String[10];
    cProcesso : String[18];
    cProcAcordo : String;
    //variaveis para obs
    qry : TQuery;
    qry2: TQuery;
    qry3: TQuery;
    vIdentificador: string[1];
    vNaladiAtual  : string[8];
    vCodMercAtual : string[15];
    vValorAtual   : real;
    vItem         : string[100];
    vMerc         : string;
    vMenorItem    : integer;

begin
  if not ConfereNF(msk_cd_unid_neg.Text + '02' + Processo.Text) then
    Exit;
  with datm_exp_impr_cert_orig do
  begin
    if Trim( msk_nr_ordem.Text ) = '' then
    begin
      BoxMensagem( 'Nº de Ordem para Quebra inválido!', 2 );
      msk_nr_ordem.SetFocus;
      Exit;
    end;

    try
      datm_main.db_broker.StartTransaction;
      qry_exec_sp_.SQL.Clear;
      if StrToInt( Trim( msk_nr_ordem.Text ) ) < 1 then
        qry_exec_sp_.SQL.Add( 'EXEC sp_exp_calc_ncm "' + msk_cd_unid_neg.Text + '02' + Processo.Text + '", 0 ' )
      else
        qry_exec_sp_.SQL.Add( 'EXEC sp_exp_calc_ncm "' + msk_cd_unid_neg.Text + '02' + Processo.Text + '", ' +
                              Trim( msk_nr_ordem.Text ) );
        qry_exec_sp_.ExecSQL;

        qry_exec_sp_.SQL.Clear;
      if StrToInt( Trim( msk_nr_ordem.Text ) ) < 1 then
        qry_exec_sp_.SQL.Add( 'EXEC sp_exp_calc_naladi "' + msk_cd_unid_neg.Text + '02' + Processo.Text + '", 0 ' )
      else
        qry_exec_sp_.SQL.Add( 'EXEC sp_exp_calc_naladi "' + msk_cd_unid_neg.Text + '02' + Processo.Text + '", ' +
                              Trim( msk_nr_ordem.Text ) );
        qry_exec_sp_.ExecSQL;
 
        datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Exit;
      end;
    end;

    try
      // Filtra Processo Header
      TProc.Close;
      TProc.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + Processo.Text;
      TProc.ParamByName('DT_ATUAL').AsDateTime  := StrToDate( msk_data.Text );
      TProc.Prepare;
      TProc.Open;
      if TProc.EOF then
      begin
        BoxMensagem('Processo não encontrado !', 2 );
        Processo.SetFocus;
        Exit;
      end;

      TProc_FormA.Close;
      TProc_FormA.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + Processo.Text;
      TProc_FormA.Prepare;
      TProc_FormA.Open;

      TGrupoNCM.Close;
      TGrupoNCM.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + Processo.Text;
      TGrupoNCM.Prepare;
      TGrupoNCM.Open;


      Application.CreateForm(TFrm_impressao, Frm_impressao);
      frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
      frm_impressao.cd_produto    := '02';
      frm_impressao.cd_modulo     := '2024';
      frm_impressao.cd_via_transp := '';
      frm_impressao.vApenas_email := False;
      Frm_impressao.cd_grupo      := '';

      ReportFileName := '' ;
      if Modelo.ItemIndex = 0 then
      begin

        // Ace18
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '063' ) or     // Argentina
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '845' ) or     // Uruguai
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '586' ) then   // Paraguai
           ReportFileName := '\Ace18' ;

        // Ace 35
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '158' ) or   // Chile
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '431' ) or   // Libano
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '240' ) or   // Egito
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '244' ) then // Emirados Arabes
           ReportFileName := '\Ace35' ;

        // Ace 36
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '097' ) then   // Bolivia
           ReportFileName := '\Ace36' ;

        (* Inibido em 14/04/2005
        // Ace 39
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '169' ) or     // Colombia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '239' ) or     // Equador
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '850' ) or     // Venezuela
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '850' ) then   // Cuba
           ReportFileName := '\Ace39' ;*)

        // Ace 59
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '169' ) or     // Colombia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '239' ) or     // Equador
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '850' ) then   // Venezuela
           ReportFileName := '\Ace59' ;

        // PAR-04
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' ) or     // Peru
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '493' ) then   // Mexico
           ReportFileName := '\Par-04' ;

        // Comum
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '289' ) or     // Ghana
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '750' ) or     // SriLanka
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '756' ) or     // Africa do Sul
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '741' ) or     // Cingapura
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '735' ) or     // Serra Leoa
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '687' ) or     // El Salvador
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '434' ) or     // Liberia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '770' ) or     // Suriname
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '285' ) or     // Gambia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '329' ) or     // Nova Guine
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '611' ) then   // Porto Rico
           ReportFileName := '\Comum' ;

        // FormA
        if ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '023' ) or   // Alemanha
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '069' ) or   // Australia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '149' ) or   // Canada
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '399' ) or   // Japao
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '548' ) or   // Nova Zelandia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '249' ) or   // USA
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '072' ) or   // Austria
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '087' ) or   // Belgica
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '271' ) or   // Finlandia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '275' ) or   // Franca
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '301' ) or   // Grecia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '767' ) or   // Suica
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '607' ) or   // Portugual
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '245' ) or   // Espanha
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '764' ) or   // Suecia
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '445' ) or   // Luxemburgo
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '676' ) or   // Russia (Fed.)
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '603' ) or   // Polonia (Rep.)
           ( TProc.FieldByName('CD_PAIS_DESTINO').AsString = '247' ) then // Eslova
           ReportFileName := '\FormA' ;
      end
      else
        ReportFileName := '\' + Trim(Modelo.Items[Modelo.ItemIndex]);

      if ReportFileName = '' then
      begin
        BoxMensagem('Selecionar modelo de relatório para impressão !', 2) ;
        Exit;
      end;

      TCarta_Cred.Close;
      TCarta_Cred.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + Processo.Text;
      TCarta_Cred.ParamByName('DT_ATUAL').AsDateTime  := StrToDate( msk_data.Text );
      TCarta_Cred.Prepare;
      TCarta_Cred.Open;
      if Not TCarta_Cred.EOF then
      begin
        ReportFileName := ReportFileName + 'CartaCred';
      end;

      // Filtra Exportador
      Texp.Close;
      Texp.ParamByName('CD_EXPORTADOR').AsString := TProc.FieldByName('CD_EXPORTADOR').AsString;
      Texp.Prepare;
      Texp.Open;

      TFabr.Close;
      TFabr.ParamByName('CD_FABRICANTE').AsString := TProc.FieldByName('CD_FABRICANTE').AsString;
      TFabr.Prepare;
      TFabr.Open;

      // Filtra Importador
      Timp.Close;
      Timp.ParamByName('NR_PROCESSO').AsString := TProc.FieldByName('NR_PROCESSO').AsString;
      Timp.Prepare;
      Timp.Open;

      // Filtra Consignatário
      Tconsig.Close ;
      Tconsig.Sql.Clear ;
      if TProc.FieldByName('tp_consignatario').AsString = '2' then // Transportadora
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           Tconsig.Sql.Add('SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, NULL AS ENDERECO_NUM, P.NM_PAIS_ING AS CIDADE_PAIS, NM_PAIS_ING AS NM_PAIS, '' AS NM_COMPLEMENTO ' +
                           'FROM   TTRANSPORTADOR_ITL T ' +
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + TProc.FieldByName('cd_consignatario').asString+'"')
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           Tconsig.Sql.Add('SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, NULL AS ENDERECO_NUM, P.NM_PAIS_ESP AS CIDADE_PAIS, NM_PAIS_ESP AS NM_PAIS, '' AS NM_COMPLEMENTO  ' +
                           'FROM   TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + TProc.FieldByName('cd_consignatario').asString+'"')
        else
           Tconsig.Sql.Add('SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, NULL AS ENDERECO_NUM, P.NM_PAIS_PORT AS CIDADE_PAIS, NM_PAIS_PORT AS NM_PAIS, '' AS NM_COMPLEMENTO  ' +
                           'FROM   TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + TProc.FieldByName('cd_consignatario').asString+'"');
      end
      else if TProc.FieldByName('tp_consignatario').asString = '4' then // Despachante
         Tconsig.Sql.Add('SELECT CD_DESPACHANTE AS CODIGO, NM_DESPACHANTE AS  NOME, NULL AS ENDERECO_NUM, NULL AS CIDADE_PAIS, '' AS NM_COMPLEMENTO  '+
                         'FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' +  TProc.FieldByName('cd_consignatario').asString+'"')

      else if ( TProc.FieldByName('TP_CONSIGNATARIO').AsString = '0' ) or
              ( TProc.FieldByName('TP_CONSIGNATARIO').AsString = '1' ) or
              ( TProc.FieldByName('TP_CONSIGNATARIO').AsString = '3' ) then // Importador / Agente / Banco
      begin
        if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( E.NM_EMPRESA ) ) AS NOME, LTRIM( RTRIM( E.END_EMPRESA ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + RTRIM( LTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM, ' +
                            'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + RTRIM( LTRIM( P.NM_PAIS_ING ) ) AS CIDADE_PAIS, NM_PAIS_ING AS NM_PAIS, ISNULL( E.END_COMPL, "" ) AS NM_COMPLEMENTO  ' +
                            'FROM   TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + TProc.FieldByName('CD_CONSIGNATARIO').AsString + '"' )
        else if TProc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( E.NM_EMPRESA ) ) AS NOME, LTRIM( RTRIM( E.END_EMPRESA ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + RTRIM( LTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM, ' +
                            'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + RTRIM( LTRIM( P.NM_PAIS_ESP ) ) AS CIDADE_PAIS, NM_PAIS_ESP AS NM_PAIS, ISNULL( E.END_COMPL, "" ) AS NM_COMPLEMENTO ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + TProc.FieldByName('CD_CONSIGNATARIO').AsString + '"' )
        else   /// Português
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( E.NM_EMPRESA ) ) AS NOME, LTRIM( RTRIM( E.END_EMPRESA ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + RTRIM( LTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM, ' +
                            'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + RTRIM( LTRIM( P.NM_PAIS_PORT ) ) AS CIDADE_PAIS, NM_PAIS_PORT AS NM_PAIS, ISNULL( E.END_COMPL, "" ) AS NM_COMPLEMENTO ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + TProc.FieldByName('CD_CONSIGNATARIO').AsString + '"');
        Tconsig.Prepare;
        Tconsig.Open;
      end
      else
        BoxMensagem('O campo "Consignatário" na Capa do Processo não está preenchido!!', 3 );


      // Filtra Via de Transporte
      TViaTr.Close;
      TViaTr.ParamByName('CD_VIA_TRANSP').AsString := TProc.FieldByName('CD_VIA_TRANSPORTE').AsString;
      TViaTr.Prepare;
      TViaTr.Open;

      // Filtra local de origem
      Tlocal1.Close;
      Tlocal1.Sql.Clear;
      if Trim(Modelo.Items[Modelo.ItemIndex]) <> 'Ace59' then
        Tlocal1.Sql.Add('SELECT LTRIM( RTRIM( ISNULL( DESCRICAO, "" ) ) ) + " - BRASIL " AS DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = "' + TProc.FieldByName('CD_LOCAL_ORIGEM').AsString + '"' )
      else
        Tlocal1.Sql.Add('SELECT LTRIM( RTRIM( ISNULL( DESCRICAO, "" ) ) ) AS DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = "' + TProc.FieldByName('CD_LOCAL_ORIGEM').AsString + '"' );
      Tlocal1.Prepare;
      Tlocal1.Open;

      // Filtra pais de destino
      TLocal2.Close;
      Tlocal2.Sql.Clear;
      Tlocal2.Sql.Add('SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO="' + TProc.FieldByName('CD_LOCAL_DESTINO').AsString + '"') ;
      Tlocal2.Prepare;
      Tlocal2.Open;

      cAcordo := '';

      if(Copy( ReportFileName, 1, 6 ) = '\Ace35' )        then
        cAcordo := 'ACE 35'
      else if ( Copy( ReportFileName, 1, 6 ) = '\Ace36' ) then
        cAcordo := 'ACE 36'
      else if ( Copy( ReportFileName, 1, 6 ) = '\Ace39' ) then
        cAcordo := 'ACE 39'
      else if ( Copy( ReportFileName, 1, 6 ) = '\Ace43' ) then
        cAcordo := 'ACE 43'
      else if ( Copy( ReportFileName, 1, 6 ) = '\Ace53' ) then
        cAcordo := 'ACE 53'
      else if ( Copy( ReportFileName, 1, 6 ) = '\Ace59' ) then
        cAcordo := 'ACE 59'
      else if ( Copy( ReportFileName, 1, 7 ) = '\Par-04') then
        cAcordo := 'PAR-04'
      else if ( Copy( ReportFileName, 1, 6 ) = '\Ace18' ) then
        cAcordo := 'ACE 18'
      else if ( Copy( ReportFileName, 1, 6 ) = '\FormA' ) then
        cAcordo := 'FORM-A'
      else if ( Copy( ReportFileName, 1, 6 ) = '\Comum' ) then
        cAcordo := 'COMUM';

      cProcesso := msk_cd_unid_neg.Text + '02' + processo.Text;

      TProcI.Close;
      TProcI.Sql.Clear ;
      if lHabilita_NCM_DOC then
      begin
        cProcAcordo := '"' + cProcesso + '" and i.cd_acordo= "' + cAcordo + '"';
        TProcI.Sql.Add(
           'SELECT I.NR_PROCESSO, I.NR_ITEM, I.CD_MERCADORIA, I.CD_NCM_DOC AS CD_NCM, M.NM_MERCADORIA, I.VL_TOT_PESO_LIQ, I.NR_PEDIDO, I.CD_ACORDO ' +
           'FROM TPROCESSO_EXP_ITEM I '+
           'LEFT JOIN TMERCADORIA_EXP M ON I.CD_MERCADORIA=M.CD_MERCADORIA ' +
           'WHERE I.NR_PROCESSO= ' + cProcAcordo );
      end
      else
      begin
        cProcAcordo := '"' + cProcesso + '" AND I.CD_ACORDO= "' + cAcordo + '"';
        TProcI.Sql.Add(
           'SELECT I.NR_PROCESSO, I.NR_ITEM, I.CD_MERCADORIA, I.CD_NCM AS CD_NCM, M.NM_MERCADORIA, I.VL_TOT_PESO_LIQ, I.NR_PEDIDO, I.CD_ACORDO ' +
           'FROM TPROCESSO_EXP_ITEM I '+
           'LEFT JOIN TMERCADORIA_EXP M ON I.CD_MERCADORIA=M.CD_MERCADORIA '+
           'WHERE I.NR_PROCESSO= ' + cProcAcordo );
      end;
      TProcI.Prepare;
      TProcI.Open;                                       

      // Filtra Normas
      if ( Copy( ReportFileName, 1, 6 ) = '\Ace35' ) or
         ( Copy( ReportFileName, 1, 6 ) = '\Ace36' ) or
         ( Copy( ReportFileName, 1, 6 ) = '\Ace39' ) or
         ( Copy( ReportFileName, 1, 6 ) = '\Ace43' ) or
         ( Copy( ReportFileName, 1, 6 ) = '\Ace53' ) or
         ( Copy( ReportFileName, 1, 6 ) = '\Ace59' ) or
         ( Copy( ReportFileName, 1, 7 ) = '\Par-04') then
      begin
        TProcI1.Close;
        TProcI1.Sql.Clear ;
        if lHabilita_NALADI_DOC then
        begin
          cProcAcordo := '"' + msk_cd_unid_neg.Text + '02' + processo.text+'" and i.cd_acordo="'+ cAcordo +'" ';
          TProcI1.Sql.Add(
             'select i.cd_naladi_doc as NALADI, na.descricao as DESC_NALADI, i.cd_normas AS NORMAS, no.nm_descricao as DESC_NORMAS, SUM( i.vl_tot_peso_liq ) as TOTAL_PESO_LIQ, SUM( i.qt_mercadoria ) as QT_MERCADORIA, SUM( i.vl_mle ) as TOTAL_ITEM, ' +
             'i.nr_ordem_cert_origem AS SEQ_NALADI ' +
             'from tprocesso_exp_item i '+
             'inner join tnaladish_exp na on na.codigo = i.cd_naladi_doc and na.nr_seq = i.nr_seq_naladi_doc ' + 
             'left join tnormas no on i.cd_normas=no.codigo '+
             'where i.nr_processo= ' + cProcAcordo +
             'group by i.nr_ordem_cert_origem, i.cd_naladi_doc, na.descricao, i.cd_normas, no.nm_descricao, i.nr_seq_naladi_doc ' +
             'order by i.nr_ordem_cert_origem ');
        end
        else
        begin
          cProcAcordo := '"' + msk_cd_unid_neg.Text + '02' + processo.text +'" and i.cd_acordo="' + cAcordo + '" ';
          TProcI1.Sql.Add(
             'select i.cd_naladi_sh as NALADI, na.descricao as DESC_NALADI, i.cd_normas AS NORMAS, no.nm_descricao as DESC_NORMAS, SUM( i.vl_tot_peso_liq ) as TOTAL_PESO_LIQ, SUM( i.qt_mercadoria ) as QT_MERCADORIA, SUM( i.vl_mle ) as TOTAL_ITEM, ' +
             'i.nr_ordem_cert_origem AS SEQ_NALADI ' +
             'from tprocesso_exp_item i ' +
             'inner join tnaladish na on i.cd_naladi_sh=na.codigo ' +
             'left join tnormas no on i.cd_normas=no.codigo ' +
             'where i.nr_processo='+ cProcAcordo +
             'group by i.nr_ordem_cert_origem, i.cd_naladi_sh, na.descricao, i.cd_normas, no.nm_descricao, i.nr_seq_naladi_doc ' +
             'order by i.nr_ordem_cert_origem  ');
        end;
        TProcI1.Prepare;
        TProcI1.Open;

        TNormas.Close;
        TNormas.Sql.Clear ;
        cProcAcordo := '"' + msk_cd_unid_neg.Text + '02' + Trim(processo.text) + '" and nm_desc_nal <> "" and cd_acordo = "' + cAcordo + '"';
        TNormas.Sql.Add(
             'select * from taux_exp_normas ' +
             'where nr_processo =' + cProcAcordo + ' and nr_seq_normas_nal <> ""' + ' order by NR_SEQ_NORMAS_NAL, NM_DESC_NAL ' );
        TNormas.Prepare;
        TNormas.Open;
      end                           //Ace18
      else if ( Copy( ReportFileName,1, 6 ) = '\Ace18' ) then
      begin
        TProcI2.Close;
        TProcI2.Sql.Clear ;
        cProcAcordo := '"'+ msk_cd_unid_neg.Text + '02' + processo.text +'" and i.cd_acordo="'+ cAcordo +'" ';
        if lHabilita_NCM_DOC then
        begin
          TProcI2.Sql.Add(
             'select i.cd_ncm_doc as NCM, n.descricao as DESC_NCM, i.cd_normas AS NORMAS, no.nm_descricao as DESC_NORMAS, SUM( i.vl_tot_peso_liq ) as TOTAL_PESO_LIQ, SUM( i.qt_mercadoria ) as QT_MERCADORIA, SUM( i.vl_mle ) as TOTAL_ITEM, ' +
             'i.nr_ordem_cert_origem AS SEQ_NCM ' +
             'from tprocesso_exp_item i ' +
             'inner join tncm_exp n on n.codigo = i.cd_ncm_doc and n.nr_seq = i.nr_seq_ncm_doc ' +
             'left join tnormas no on i.cd_normas=no.codigo ' +
             'where i.nr_processo= ' + cProcAcordo +
             'group by i.nr_ordem_cert_origem, i.cd_ncm_doc, n.descricao, i.cd_normas, no.nm_descricao, i.nr_seq_ncm_doc ' +
             'order by i.nr_ordem_cert_origem ');
        end
        else
        begin
          TProcI2.Sql.Add(
             'select i.cd_ncm as NCM, n.descricao as DESC_NCM, i.cd_normas AS NORMAS, no.nm_descricao as DESC_NORMAS, SUM( i.vl_tot_peso_liq ) as TOTAL_PESO_LIQ, SUM( i.qt_mercadoria ) as QT_MERCADORIA, SUM( i.vl_mle ) as TOTAL_ITEM, ' +
             'i.nr_ordem_cert_origem AS SEQ_NCM ' +
             'from tprocesso_exp_item i ' +
             'inner join tncm n on i.cd_ncm=n.codigo ' +
             'left join tnormas no on i.cd_normas=no.codigo ' +
             'where i.nr_processo='+ cProcAcordo +
             'group by i.nr_ordem_cert_origem, i.cd_ncm, n.descricao, i.cd_normas, no.nm_descricao, i.nr_seq_ncm ' +
             'order by i.nr_ordem_cert_origem ');
        end;
        TProcI2.Prepare;
        TProcI2.Open;

        TNormas.Close;
        TNormas.Sql.Clear ;
        cProcAcordo := '"' + msk_cd_unid_neg.Text + '02' + processo.text + '" and nm_desc_ncm <> "" and cd_acordo = "' + cAcordo + '"';
        TNormas.Sql.Add( 'select * from taux_exp_normas ' +
                         'where nr_processo =' + cProcAcordo + ' and nr_seq_normas_ncm <> ""' + ' order by nr_seq_normas_ncm, nr_seq_normas_nal ' );
        TNormas.Prepare;
        TNormas.Open;
      end;

      TProcesso.Close;
      TProcesso.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + Trim(processo.Text);
      TProcesso.Prepare;
      TProcesso.Open;

      TPais1.Close;
      TPais1.Sql.Clear ;
      if TProc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais1.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + TProc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"')
      else if TProc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais1.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + TProc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"')
      else
         TPais1.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "' + TProc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"');
      TPais1.Prepare;
      TPais1.Open;

      TPais2.Close;
      TPais2.Sql.Clear ;
      if TProc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais2.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + TProc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"')
      else if TProc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais2.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + TProc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"')
      else
         TPais2.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "' + TProc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"');
      TPais2.Prepare;
      TPais2.Open;

      TPais3.Close;
      TPais3.Sql.Clear ;
      if TProc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais3.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + TImp.FieldByName( 'CD_PAIS' ).AsString + '"')
      else if TProc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais3.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + TImp.FieldByName( 'CD_PAIS' ).AsString + '"')
      else
      TPais3.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "' + TImp.FieldByName( 'CD_PAIS' ).AsString + '"');
      TPais3.Prepare;
      TPais3.Open;

      TProcesso_Re.Close;
      TProcesso_Re.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + Trim( processo.Text );
      TProcesso_Re.Prepare;
      TProcesso_Re.Open;

      TData_Embarque.Close;
      TData_Embarque.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + Trim( processo.Text );
      TData_Embarque.Prepare;
      TData_Embarque.Open;

      if ( Copy( ReportFileName, 1, 6 ) = '\Ace39' ) or
         ( Copy( ReportFileName, 1, 6 ) = '\Ace43' ) or
         ( Copy( ReportFileName, 1, 6 ) = '\Ace53' ) or
         ( Copy( ReportFileName, 1, 7 ) = '\Par-04') then
      begin
        if Pos( 'CartaCred', ReportFileName ) > 0 then
          ReportFileName := '\AladiCartaCred'
        else
          ReportFileName := '\Aladi';
      end;

      qry_parametros_.Open;
      if qry_parametros_.FieldByName('CD_LOCAL_EMISSAO_SP').AsString =
         TProc.FieldByName('CD_LOCAL_EMISSAO').AsString then
      begin
        if ReportFileName = '\Ace35'          then
          ReportFileName := '\Ace35-SP'
        else if ( ReportFileName = '\Aladi' ) then
          ReportFileName := '\Aladi-SP'
        else if ( ReportFileName = '\Ace18' ) then
          ReportFileName := '\Ace18-SP'
        else if ( ReportFileName = '\Ace36' ) then
          ReportFileName := '\Ace36-SP';

        if ReportFileName = '\Ace35CartaCred' then
          ReportFileName := '\Ace35CartaCred-SP'
        else if ( ReportFileName = '\AladiCartaCred' ) then
          ReportFileName := '\AladiCartaCred-SP'
        else if ( ReportFileName = '\Ace18CartaCred' ) then
          ReportFileName := '\Ace18CartaCred-SP'
        else if ( ReportFileName = '\Ace36CartaCred' ) then
          ReportFileName := '\Ace36CartaCred-SP';
      end;
        qry_parametros_.Close;

    //Inclui as mercadorias nas observações do Ace39 (Contato: Soraia)
    //kleber guedes 20/12/2005
      if (TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589') and (Modelo.Items[Modelo.ItemIndex] = 'Ace39') and
         (BoxMensagem('Você deseja incluir a descrição das mercadorias nas observações?', 1)) then //Ace39
      begin
        //define os rtm´s a serem chamados
        if ReportFileName = '\Aladi' then
          ReportFileName := '\AladiPeru'
        else if ReportFileName = '\AladiCartaCred' then
          ReportFileName := '\AladiPeruCartaCred'
        else if ReportFileName = '\AladiCartaCred-SP' then
          ReportFileName := '\AladiPeruCartaCred-SP'
        else if ReportFileName = '\Aladi-SP' then
          ReportFileName := '\AladiPeru-SP';
        //insere os valores necessários para incluir as observações
        qry := TQuery.Create(Application);
        with qry do
        begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Add('INSERT INTO TREL_ACE39 (NR_IDENTIFICADOR, CD_NALADI_SH, CD_MERCADORIA, VL_UNITARIO, NR_ITEM,TX_MERCADORIA)');
          SQL.Add('SELECT   (SELECT ISNULL(MAX(NR_IDENTIFICADOR), 0) + 1 FROM TREL_ACE39) NR_IDENTIFICADOR,');
          SQL.Add('         EI.CD_NALADI_SH, EI.CD_MERCADORIA, EI.VL_UNITARIO, EI.NR_ITEM,EI.TX_MERCADORIA');
          SQL.Add('FROM     TPROCESSO_EXP_ITEM EI (NOLOCK)');
          SQL.Add('WHERE    EI.NR_PROCESSO =' + QuotedStr(msk_cd_unid_neg.Text + '02' + processo.Text));
          SQL.Add('ORDER BY NR_IDENTIFICADOR DESC, EI.CD_NALADI_SH, EI.CD_MERCADORIA, EI.VL_UNITARIO');
          ExecSQL;
        end;

        //consulta os valores
        with qry do
        begin
          SQL.Clear;
          SQL.Add('SELECT CD_NALADI_SH, CD_MERCADORIA, VL_UNITARIO, NR_ITEM, TX_MERCADORIA, NR_IDENTIFICADOR');
          sql.Add('FROM TREL_ACE39');
          SQL.Add('WHERE NR_IDENTIFICADOR IN (SELECT MAX(NR_IDENTIFICADOR) FROM TREL_ACE39)');
          SQL.Add('ORDER BY NR_IDENTIFICADOR DESC, CD_NALADI_SH, CD_MERCADORIA, VL_UNITARIO');
          Prepare;
          Open;
        end;
        //inicia as variáveis auxiliares

        qry.Prior;
        vIdentificador:= qry.Fields[5].value;
        vNaladiAtual  := qry.Fields[0].Value;
        vCodMercAtual := qry.Fields[1].value;
        vValorAtual   := qry.Fields[2].value;
        vItem         := '';
        vMerc         := '';
        vMenorItem    := qry.Fields[3].Value;
        //realiza as consistências para alimentar a tabela de observações
        while not qry.Eof do
        begin
          if (vNaladiAtual  = qry.Fields[0].Value) and
             (vCodMercAtual = qry.Fields[1].value) and
             (vValorAtual   = qry.Fields[2].value) then
          begin
            if vItem = '' then
              vItem := qry.Fields[3].value
            else
              vItem := vItem + '/' + qry.Fields[3].value;

            if qry.Fields[3].Value < vMenorItem then
               vMenorItem := qry.Fields[3].Value;

            if vMerc = '' then
               if Pos(chr(13), qry.Fields[4].Value) <> 0 then
                 vMerc := Copy(qry.Fields[4].Value, 1, Pos(chr(13), qry.Fields[4].Value) - 1)
               else
                 vMerc := qry.Fields[4].Value;

            qry.Next;
          end
          else
          begin
            qry2 := TQuery.Create(Application);
            with qry2 do
            begin
              DataBaseName := 'DBBROKER';
              SQL.Clear;
              SQL.Add('INSERT INTO  TREL_OBS_ACE39 (DESCRICAO, NR_IDENTIFICADOR, ITEM)');
              SQL.Add('VALUES (' + QuotedStr('Item ' + vItem + ': ' + vMerc + ';') + ', ' + QuotedStr(vIdentificador) + ', ' + QuotedStr(IntToStr(vMenorItem)) + ')');
              ExecSQL;
              Close;
              Free;
            end;

             vNaladiAtual  := qry.Fields[0].Value;
             vCodMercAtual := qry.Fields[1].value;
             vValorAtual   := qry.Fields[2].value;
             vItem         := qry.Fields[3].value;
             vMerc         := qry.Fields[4].Value;
             vMenorItem    := qry.Fields[3].value;
             qry.Next;
          end;
        end;
      //salva o último registro
      qry2 := TQuery.Create(Application);
      with qry2 do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('INSERT INTO  TREL_OBS_ACE39 (DESCRICAO, NR_IDENTIFICADOR, ITEM)');
        SQL.Add('VALUES (' + QuotedStr('Item ' + vItem + ': ' + vMerc + ';') + ', ' + QuotedStr(vIdentificador) + ', ' + QuotedStr(IntToStr(vMenorItem)) + ')');
        ExecSQL;
        Close;
      end;

      with Tobs_ace39 do
      begin
        Close;
        Prepare;
        Open;
      end;
    end;

    qry3 := TQuery.Create(application);
    with qry3 do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO ');
      SQL.Add('WHERE  NR_PROCESSO = ' + QuotedStr(msk_cd_unid_neg.Text + '02' +  processo.Text));
      SQL.Add('AND    CD_CLIENTE IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC WHERE CD_GRUPO = ''002'') ');
      Prepare;
      Open;
    end;

    if (TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589') and (not qry3.isEmpty) then
    begin
      if ReportFileName = '\Aladi' then
        aladi_logo.Visible := true;
      if ReportFileName = '\AladiCartaCred' then
        aladiC_logo.Visible := true;
      if ReportFileName = '\Aladi-SP' then
        aladiSP_logo.Visible := true;
      if ReportFileName = '\AladiCartaCred-SP' then
        aladiCSP_logo.Visible := true;
      if ReportFileName = '\AladiPeru' then
        aladiP_logo.Visible := true;
      if ReportFileName = '\AladiPeruCartaCred' then
        aladiPC_logo.Visible := true;
      if ReportFileName = '\AladiPeru-SP' then
        aladiPSP_logo.Visible := true;
      if ReportFileName = '\AladiPeruCartaCred-SP' then
        aladiPCSP_logo.Visible := true;
    end;

    qry3.Free;

//    ReportFileName := '\AladiPeruCartaCred-SP';
       //-------------------------------chama os ppReport
       //Ace18
      if ReportFileName = '\Ace18' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce18
      else if ReportFileName = '\Ace18CartaCred' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce18Carta
      else if (ReportFileName = '\Ace18-SP') then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce18SP
      else if (ReportFileName = '\Ace18CartaCred-SP') then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce18CartaSP
      else if ReportFileName = '\Ace18-Fiesp' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce18Fiesp;

      //Ace35
      if ReportFileName = '\Ace35' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce35
      else if (ReportFileName = '\Ace35CartaCred') then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce35Carta
      else if (ReportFileName = '\Ace35-SP') then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce35SP
      else if (ReportFileName = '\Ace35CartaCred-SP') then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce35CartaSP
      else if ReportFileName = '\Ace35-Fiesp' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce35Fiesp;

      //Ace36
      if ReportFileName = '\Ace36' then
        frm_impressao.vBeforePrint := datm_exp_impr_cert_orig.pBeforePrintAce36
      else if (ReportFileName = '\Ace36CartaCred') then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce36CartaCred
      else if ReportFileName = '\Ace36-SP' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce36SP
      else if ReportFileName = '\Ace36CartaCred-SP' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce36CartaSP
      else if ReportFileName = '\Ace36-Fiesp' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce36Fiesp;


      //Ace59
      if ReportFileName = '\Ace59' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce59
      else if ReportFileName = '\Ace59CartaCred' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAce59Carta;

      //Aladi
      if ReportFileName = '\Aladi' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladi
      else if ReportFileName = '\AladiCartaCred' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladiCarta
      else if ReportFileName = '\Aladi-SP' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladiSP
      else if ReportFileName = '\AladiCartaCred-SP' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladiCartaSP;

      //Aladi peru
      if ReportFileName = '\AladiPeru' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladiPeru
      else if ReportFileName = '\AladiPeruCartaCred' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladiPeruCarta
      else if ReportFileName = '\AladiPeru-SP' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladiPeruSP
      else if ReportFileName = '\AladiPeruCartaCred-SP' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintAladiPeruCartaSP;

      //Comum
      if ReportFileName = '\Comum' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintComum
      else if ReportFileName = '\ComumCartaCred' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintComumCarta;

      //FormA
      if ReportFileName = '\FormA' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintFormA
      else if ReportFileName = '\FormACartaCred' then
        frm_impressao.vBeforePrint      := datm_exp_impr_cert_orig.pBeforePrintFormACarta;

      frm_impressao.vPathCertifOrigem := cDir_RPT + ReportFileName + '.rtm';
      frm_impressao.ShowModal;
      frm_impressao.Release;

{      // Ace18 - Ace18CartaCred
      if Pos( '\Ace18', ReportFileName ) > 0 then
      begin
        ppRepACE18.Reset;
      //  ppRepACE18.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE18.Template.LoadFromFile;
        ppRepACE18.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE18.Print;
      end;

      // Ace35 - Ace35CartaCred
      if Pos( '\Ace35', ReportFileName ) > 0 then
      begin
        ppRepACE35.Reset;
        ppRepACE35.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE35.Template.LoadFromFile;
        ppRepACE35.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE35.Print;
      end;          }

     { // Ace36 - Ace36CartaCred
      if Pos( '\Ace36', ReportFileName ) > 0 then
      begin
        ppRepACE36.Reset;
        ppRepACE36.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE36.Template.LoadFromFile;
        ppRepACE36.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE36.Print;
      end;

      // Aladi - AladiCartaCred - Aladi Peru
      if Pos( '\Aladi', ReportFileName ) > 0 then
      begin
        ppRepAladi.Reset;
        ppRepAladi.Template.FileName := cDir_RPT + ReportFileName;
        ppRepAladi.Template.LoadFromFile;
        ppRepAladi.Template.FileName := cDir_RPT + ReportFileName;
        ppRepAladi.Print;
      end;

      // FormA - FormACartaCred
      if Pos( '\FormA', ReportFileName ) > 0 then
      begin
        ppRepFormA.Reset;
        ppRepFormA.Template.FileName := cDir_RPT + ReportFileName;
        ppRepFormA.Template.LoadFromFile;
        ppRepFormA.Template.FileName := cDir_RPT + ReportFileName;
        ppRepFormA.Print;
      end;

      // Comum - ComumCartaCred
      if Pos( '\Comum', ReportFileName  ) > 0 then
      begin
        ppRepComum.Reset;
        ppRepComum.Template.FileName := cDir_RPT + ReportFileName;
        ppRepComum.Template.LoadFromFile;
        ppRepComum.Template.FileName := cDir_RPT + ReportFileName;
        ppRepComum.Print;
      end;

      // Ace59 - Ace59CartaCred
      if Pos( '\Ace59', ReportFileName ) > 0 then
      begin
        ppRepACE18.Reset;
        ppRepACE18.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE18.Template.LoadFromFile;
        ppRepACE18.Template.FileName := cDir_RPT + ReportFileName;
        ppRepACE18.Print;
      end;}

    finally
    end;

    // Realizar Evento Certificado de Origem
    CloseStoredProc( sp_atz_evento );
    sp_atz_evento.ParamByName('@NR_PROCESSO').AsString       := TProc.FieldByName('NR_PROCESSO').AsString;
    sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString     := 'CD_EV_CERT_ORIGEM';
    sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime   := StrToDate( msk_data.text);
    ExecStoredProc( sp_atz_evento );
    CloseStoredProc( sp_atz_evento );

    //exclui as tabelas das observações
    qry := TQuery.Create(Application);
    qry2 := TQuery.Create(Application);
    with qry2 do
    begin
      Close;
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('DELETE FROM TREL_OBS_ACE39');
      SQL.Add('WHERE NR_IDENTIFICADOR = ' + QuotedStr(vIdentificador)) ;
      ExecSQL;
      Free;
    end;
    with qry do
    begin
      Close;
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('DELETE FROM TREL_ACE39');
      SQL.Add('WHERE NR_IDENTIFICADOR = ' + QuotedStr(vIdentificador));
      ExecSQL;
      Free;
    end;

  end;
end;


procedure Tfrm_exp_impr_cert_orig.RetornaClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tfrm_exp_impr_cert_orig.FormShow(Sender: TObject);
begin
  Modelo.ItemIndex := 0;
  msk_nr_ordem.Text := '0';

  if Trim( str_cd_unid_neg_exp ) <> '' then
    msk_cd_unid_neg.Text := str_cd_unid_neg_exp
  else
    msk_cd_unid_neg.Text := str_cd_unid_neg;

  msk_cd_unid_negExit(nil);
  Processo.SetFocus;

  if Trim( str_nr_proc_exp ) <> '' then
  begin
    Processo.Text := str_nr_proc_exp;
    Ok_btn.SetFocus;
  end;

  msk_data.Text := FormatDateTime( FData, dt_server );
end;

procedure Tfrm_exp_impr_cert_orig.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_exp_impr_cert_orig do
    begin
      TUnid.Close;
      TUnid.Sql.Clear ;
      TUnid.Sql.Add('SELECT CD_UNID_NEG, NM_UNID_NEG FROM TUNID_NEG '+
                    'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ');
      TUnid.Prepare;
      TUnid.Open;
      if TUnid.EOF then
      begin
         BoxMensagem('Unidade de Negócio não cadastrada!', 2);
         msk_cd_unid_neg.SetFocus;
      end;
      edt_nm_unid_neg.Text := Tunid.FieldByName('NM_UNID_NEG').AsString;
    end;
  end;
end;

procedure Tfrm_exp_impr_cert_orig.btn_co_proc_newClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_exp,frm_consulta_exp);
  frm_consulta_exp.str_cd_unid := frm_exp_impr_cert_orig.msk_cd_unid_neg.Text;
  frm_consulta_exp.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_exp.Nr_Processo <> '') then
    processo.Text := copy( frm_consulta_exp.Nr_Processo, 5, 14 );
end;

procedure Tfrm_exp_impr_cert_orig.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_exp_impr_cert_orig, datm_exp_impr_cert_orig );

  lHabilita_NCM_DOC    := False;
  lHabilita_NALADI_DOC := False;

  datm_exp_impr_cert_orig.qry_parametros_.Open;

  if datm_exp_impr_cert_orig.qry_parametros_TP_NCM.AsString <> '0' then
     lHabilita_NCM_DOC := True;

  if datm_exp_impr_cert_orig.qry_parametros_TP_NALADI.AsString <> '0' then
     lHabilita_NALADI_DOC := True;

  datm_exp_impr_cert_orig.qry_parametros_.Close;

end;

procedure Tfrm_exp_impr_cert_orig.processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = processo then btn_co_proc_newClick(nil);
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_exp_impr_cert_orig.btn_cd_unid_negClick(Sender: TObject);
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

procedure Tfrm_exp_impr_cert_orig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_exp_impr_cert_orig do
  begin
    TUnid.Close;
    TProc.Close;
    TProc_FormA.Close;
    TGrupoNCM.Close;
    TExp.Close;
    TImp.Close;
    TConsig.Close;
    TViaTr.Close;
    TLocal1.Close;
    TLocal2.Close;
    TProcI.Close;
    TProcI1.Close;
    TProcI2.Close;
    TNormas.Close;
    TProcesso.Close;
    TPais1.Close;
    TPais2.Close;
    TPais3.Close;
    TData_Embarque.Close;
    TCarta_Cred.Close;
    TSoma_Itens.Close;
    Destroy;
  end;

  Action := caFree;
end;


end.

