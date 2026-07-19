unit PGPE037;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Funcoes, ConsOnlineEx,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, ppRegion, ppSubRpt, TXtraDev,
  ppParameter, Grids, DBGrids;
  
type
  Tfrm_exp_impr_instr_emb = class(TForm)
    shpAux: TShape;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    pnlAux: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    btn_co_proc_new: TSpeedButton;
    btn_cd_unid_neg: TSpeedButton;
    Destinatario: TRadioGroup;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Tipo_Descricao: TRadioGroup;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_nr_proc_exp : String[18];
    str_cd_unid_neg_exp : String[2];
    procedure pBeforePrint(Sender: TObject);
    procedure pBeforePrint2(Sender: TObject);    

  end;

var
  frm_exp_impr_instr_emb: Tfrm_exp_impr_instr_emb;
  ReportFileName : String;

implementation

uses PGPE038, GSMLIB, PGGP001, PGSM018, PGGP025, PGSM136, PGGP017, PGSM990;

{$R *.DFM}

procedure Tfrm_exp_impr_instr_emb.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then begin
    msk_cd_unid_neg.Text := Copy('00', 1, 2 - Length(msk_cd_unid_neg.Text)) +  msk_cd_unid_neg.Text;
    if edt_nm_unid_neg.Text = '' then begin
      ShowMessage('Unidade de Negócio inválida ou inexistente!');
      msk_cd_unid_neg.SetFocus;
    end;
  end;
end;

procedure Tfrm_exp_impr_instr_emb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_exp_impr_instr_emb do
  begin
    TUnid.Close;
    TProcesso.Close;
    TProc.Close;
    TProcI.Close;
    TExp.Close;
    TImp.Close;
    TConsig.Close;
    TDesp.Close;
    TEmb.Close;
    TAgente.Close;
    TViaTr.Close;
    TNotf1.Close;
    TNotf2.Close;
    TPais1.Close;
    TLocal1.Close;
    TLocal2.Close;
    TLocal3.Close;
    TReferencia.Close;
    TRE.Close;
    TCartaCred.Close;

    Free;
  end;

  Action := caFree ;
end;


procedure Tfrm_exp_impr_instr_emb.btn_co_proc_newClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT DISTINCT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('  INNER JOIN TPROCESSO_EXP E (NOLOCK) ON E.NR_PROCESSO = PR.NR_PROCESSO ');
  vListAux.Add('WHERE CD_PRODUTO  = "02" ');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
end;

procedure Tfrm_exp_impr_instr_emb.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_exp_impr_instr_emb, datm_exp_impr_instr_emb );
end;

procedure Tfrm_exp_impr_instr_emb.FormShow(Sender: TObject);
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
  end;
end;

procedure Tfrm_exp_impr_instr_emb.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo        then btn_co_proc_newClick(btn_co_proc_new);
    if Sender = msk_cd_unid_neg        then btn_cd_unid_negClick(btn_cd_unid_neg);
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


procedure Tfrm_exp_impr_instr_emb.btn_cd_unid_negClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
   msk_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG ' +
                                               '  FROM TUNID_NEG (NOLOCK) ' +
                                               ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                               '                         FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                               '                        WHERE CD_USUARIO = "'+ str_cd_usuario + '") ' ,
                                               'Unidades',
                                               ['CD_UNID_NEG','NM_UNID_NEG', 'AP_UNID_NEG'],['Código','Unidade', 'Apelido'],
                                               'CD_UNID_NEG',nil,msk_cd_unid_neg.Text);
   edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'AP_UNID_NEG');
 end
 else
   edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT AP_UNID_NEG ' +
                                             '  FROM TUNID_NEG (NOLOCK) ' +
                                             ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                             '                         FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                             '                        WHERE CD_USUARIO = "'+ str_cd_usuario + '") ' +
                                             ' AND CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ','AP_UNID_NEG');



end;


procedure Tfrm_exp_impr_instr_emb.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_exp_impr_instr_emb.btnImprimirClick(Sender: TObject);
var
  cSQL : String;
  nr_processo : String;
begin
  if not ConfereNF(msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text) then Exit;
  //try
  with datm_exp_impr_instr_emb do
    begin
      if Trim( msk_nr_processo.Text ) = '' then
      begin
        BoxMensagem( 'Informar Nr. do processo !', 2 ) ;
        msk_nr_processo.SetFocus ;
        Exit;
      end;
      TProcesso.Close;
      TProcesso.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TProcesso.Prepare;
      TProcesso.Open;
      if TProcesso.EOF then
      begin
        BoxMensagem( 'Processo não encontrado !', 2 );
        msk_nr_processo.SetFocus;
        Exit;
      end;

      TEmb.Close;
      TEmb.Prepare;
      TEmb.Open;

      // Filtra Processo
      TProc.Close;
      TProc.Prepare;
      TProc.Open;

      TProcI.Close;
      TprocI.Sql.Clear ;
      cSQL := 'select i.cd_unid_medida AS CD_UNID_MEDIDA, u.nm_sigla AS NM_SIGLA, i.cd_mercadoria AS CD_MERCADORIA, i.qt_mercadoria AS QT_MERCADORIA, '+
              'i.vl_tot_peso_liq AS VL_TOT_PESO_LIQ, '+
              'i.vl_tot_peso_bruto AS VL_TOT_PESO_BRUTO, '+
              'i.vl_unitario AS VL_UNITARIO, i.vl_tot_item AS VL_TOT_ITEM, i.TX_MERCADORIA AS NM_MERCADORIA, i.VL_CUBAGEM AS VL_CUBAGEM, '+
              'CASE ltrim(rtrim(isnull(i.nr_pedido_imp,""))) when "" then "" else "OD: " END + ltrim(rtrim(i.nr_pedido_imp)) + '+
              'CASE ltrim(rtrim(isnull(i.nr_pedido,""))) when "" then "" else " - " END + ltrim(rtrim(i.nr_pedido)) + '+
              'CASE ltrim(rtrim(isnull(i.nr_pedido,""))) when "" then "" else "" END + '+
              'CASE ltrim(rtrim(isnull(p.nm_pais_ing,""))) when "" then "" else " ORIGEN : " END + ltrim(rtrim(p.nm_pais_ing)) as NR_OC_REF_ORIGEM '+
              'from tprocesso_exp_item i '+
              'left join tmercadoria_exp m on m.cd_mercadoria=i.cd_mercadoria '+
              'left join tpais_broker p on p.cd_pais=i.cd_pais_origem '+
              'left join tunid_medida_broker u on u.cd_unid_medida = i.cd_unid_medida ';

      if Tipo_Descricao.ItemIndex = 0 then
         cSQL := cSQL + 'where i.nr_processo=""'
      else
         cSQL := cSQL + 'where i.nr_processo="' + msk_cd_unid_neg.text + '02' + msk_nr_processo.text+ '" ';
      TprocI.Sql.Add( cSQL );
      TprocI.Open;

      TRE.Close;
      TRE.Prepare;
      TRE.Open;

      // Filtra Exportador
      Texp.Close;
      Texp.Prepare;
      Texp.Open;

      // Filtra Importador
      Timp.Close;
      Timp.Sql.Clear ;
      if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
      begin
        Timp.Sql.Add(
        'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
        'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
        'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS, ' +
        'CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) WHEN "" THEN "" ELSE "( " END + LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) + ' +
        'CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) WHEN "" THEN "" ELSE " )" END AS NR_CLIENTE, E.CD_PAIS AS CD_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
        'FROM TEMPRESA_EST E ' +
        'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
        'WHERE CD_EMPRESA = "' + Tproc.FieldByName('CD_IMPORTADOR').AsString + '"' );
      end
      else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then   // espanhol
      begin
        Timp.Sql.Add(
        'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
        'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
        'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS, ' +
        'CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) WHEN "" THEN "" ELSE "( " END + LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) + ' +
        'CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) WHEN "" THEN "" ELSE " )" END AS NR_CLIENTE, E.CD_PAIS AS CD_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
        'FROM TEMPRESA_EST E ' +
        'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
        'WHERE CD_EMPRESA = "' + Tproc.FieldByName('CD_IMPORTADOR').AsString + '"' );
      end
      else      // portugues
      begin
        Timp.Sql.Add(
        'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
        'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
        'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
        'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, ' +
        'CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) WHEN "" THEN "" ELSE "( " END + LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) + ' +
        'CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, "" ) ) ) WHEN "" THEN "" ELSE " )" END AS NR_CLIENTE, E.CD_PAIS AS CD_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
        'FROM TEMPRESA_EST E ' +
        'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
        'WHERE CD_EMPRESA = "' + Tproc.FieldByName('CD_IMPORTADOR').AsString + '"' );
      end;
      Timp.Open;

      // Filtra Consignatário
      Tconsig.Close ;
      Tconsig.Sql.Clear ;
      if Tproc.FieldByName('tp_consignatario').asString = '2' then // Transportadora
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           Tconsig.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_ING AS CIDADE_PAIS, "" AS NR_TELEFONE, "" AS NR_FAX, "" AS NR_RUC, "" AS NR_NIT, "" AS NR_CUIT '+
                            'FROM TTRANSPORTADOR_ITL T ' +
                            'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                            'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_consignatario').AsString + '"' )
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           Tconsig.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_ESP AS CIDADE_PAIS, "" AS NR_TELEFONE, "" AS NR_FAX, "" AS NR_RUC, "" AS NR_NIT, "" AS NR_CUIT '+
                            'FROM TTRANSPORTADOR_ITL T '+
                            'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                            'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_consignatario').AsString + '"' )
        else
           Tconsig.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_PORT AS CIDADE_PAIS, "" AS NR_TELEFONE, "" AS NR_FAX, "" AS NR_RUC, "" AS NR_NIT, "" AS NR_CUIT '+
                            'FROM TTRANSPORTADOR_ITL T '+
                            'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                            'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_consignatario').AsString + '"' );
      end
      else if Tproc.FieldByName('TP_CONSIGNATARIO').AsString = '4' then // Despachante
         Tconsig.Sql.Add( 'SELECT CD_DESPACHANTE AS CODIGO, NM_DESPACHANTE AS NOME, "" NULL AS ENDERECO_NUM, "" NULL AS CIDADE_PAIS, "" AS NR_TELEFONE, "" AS NR_FAX, "" AS NR_RUC, "" AS NR_NIT, "" AS NR_CUIT '+
                          'FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' +  Tproc.FieldByName('cd_consignatario').asString+'"')
             else // Importador / Agente / Banco
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                            'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                            'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_CONSIGNATARIO').AsString + '"' )
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                            'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                            'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_CONSIGNATARIO').AsString + '"' )
        else     /// portugues
           Tconsig.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                            'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                            'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                            'E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
                            'FROM TEMPRESA_EST E ' +
                            'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                            'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_CONSIGNATARIO').AsString + '"' )
      end;
      Tconsig.Open ;

      // Filtra Agente de Carga
      TAgente.Close;
      TAgente.Prepare;
      TAgente.Open;

      // Filtra Via de Transporte
      TViaTr.Close;
      TviaTr.Sql.Clear ;
      if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
         TViaTr.Sql.Add( 'select NM_VIA_TRANSP_INGLES AS NM_VIA_TRANSP from tvia_transp_broker where cd_via_transp="'+Tproc.FieldByName('cd_via_transporte').asString+'"')
      else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
         TViaTr.Sql.Add( 'select NM_VIA_TRANSP_ESP AS NM_VIA_TRANSP from tvia_transp_broker where cd_via_transp="'+Tproc.FieldByName('cd_via_transporte').asString+'"')
      else
         TViaTr.Sql.Add( 'select NM_VIA_TRANSP AS NM_VIA_TRANSP from tvia_transp_broker where cd_via_transp="'+Tproc.FieldByName('cd_via_transporte').asString+'"');
      TViaTr.Open ;

      // Filtra Notify 1
      TNotf1.Close ;
      TNotf1.Sql.Clear ;
      if Tproc.FieldByName('tp_notify1').AsString = '2' then // Transportadora
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           TNotf1.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_ING AS CIDADE_PAIS, '+
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_notify1').AsString + '"' )
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TNotf1.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_ESP AS CIDADE_PAIS, '+
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_notify1').AsString + '"' )
        else
           TNotf1.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_PORT AS CIDADE_PAIS, '+
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT  ' +
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('cd_notify1').AsString + '"' );
      end
      else if Tproc.FieldByName('tp_notify1').asString = '4' then // Despachante
         TNotf1.Sql.Add('SELECT CD_DESPACHANTE AS CODIGO, NM_DESPACHANTE AS  NOME, "" NULL AS ENDERECO_NUM, "" NULL AS CIDADE_PAIS, "" AS NR_TELEFONE, "" AS NR_FAX, "" AS NR_RUC, "" AS NR_NIT, "" AS NR_CUIT '+
                        'FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' +  Tproc.FieldByName('cd_notify1').AsString + '"' )
      else if ( Tproc.FieldByName('tp_notify1').AsString = '0') or
              ( Tproc.FieldByName('tp_notify1').AsString = '1') or
              ( Tproc.FieldByName('tp_notify1').AsString = '3') then // Importador / Agente / Banco
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           TNotf1.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT,  ' +
                              ' ISNULL(E.NM_CONTATO, "") AS CONTATO_NOTIFY  ' +
                           'FROM TEMPRESA_EST E ' +
                           'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                           'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_NOTIFY1').AsString + '"' )
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TNotf1.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT,  ' +
                             ' ISNULL(E.NM_CONTATO, "") AS CONTATO_NOTIFY  ' +
                           'FROM TEMPRESA_EST E ' +
                           'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                           'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_NOTIFY1').AsString + '"' )
        else     /// portugues
           TNotf1.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS, ' +
                              'CASE isnull(e.nr_telefone,"") when "" then "" else "TEL: "+e.nr_telefone END AS NR_TELEFONE, ' +
                              'CASE isnull(e.nr_fax,"") when "" then "" else "FAX: "+e.nr_fax  END AS NR_FAX, ' +
                              'CASE isnull(e.nr_ruc,"") when "" then "" else "RUC: "+e.nr_ruc  END AS NR_RUC, ' +
                              'CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+e.nr_cuit  END AS NR_CUIT, ' +
                              'CASE isnull(e.nr_nit,"") when "" then "" else "NIT: "+e.nr_nit  END AS NR_NIT,  ' +
                              ' ISNULL(E.NM_CONTATO, "") AS CONTATO_NOTIFY  ' +
                           'FROM TEMPRESA_EST E ' +
                           'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                           'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_NOTIFY1').AsString + '"' )
      end
      else
      begin
        TNotf1.Sql.Add( 'SELECT "" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS, "" AS NR_TELEFONE, "" AS NR_FAX, "" AS NR_RUC, "" AS NR_NIT, "" AS NR_CUIT ' +
                        'FROM TEMPRESA_EST E ' +
                        'WHERE E.CD_EMPRESA = "@!@!"');
      end;
      TNotf1.Open;

      // Filtra Notify 2
      TNotf2.Close;
      TNotf2.Sql.Clear;
      if Tproc.FieldByName('tp_notify2').AsString = '2' then // Transportadora
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           TNotf2.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_ING AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('CD_NOTIFY2').AsString + '"' )
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TNotf2.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_ESP AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('CD_NOTIFY2').AsString + '"' )
        else
           TNotf2.Sql.Add( 'SELECT T.CODIGO AS CODIGO, T.DESCRICAO AS NOME, "" NULL AS ENDERECO_NUM, P.NM_PAIS_PORT AS CIDADE_PAIS '+
                           'FROM TTRANSPORTADOR_ITL T '+
                           'LEFT JOIN TPAIS_BROKER P ON T.CD_PAIS=P.CD_PAIS '+
                           'WHERE T.CODIGO = "' + Tproc.FieldByName('CD_NOTIFY2').AsString + '"' );
      end
      else if Tproc.FieldByName('tp_notify2').asString = '4' then // Despachante
         TNotf2.Sql.Add( 'SELECT CD_DESPACHANTE AS CODIGO, NM_DESPACHANTE AS NOME, NULL AS ENDERECO_NUM, NULL AS CIDADE_PAIS '+
                         'FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' +  Tproc.FieldByName('cd_notify2').asString+'"')
      else if ( Tproc.FieldByName('tp_notify2').AsString = '0' ) or
              ( Tproc.FieldByName('tp_notify2').AsString = '1' ) or
              ( Tproc.FieldByName('tp_notify2').AsString = '3' ) then // Importador / Agente / Banco
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then      // ingles
           TNotf2.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ' +
                           'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                           'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_NOTIFY2').AsString + '"' )
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then      // espanhol
           TNotf2.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ' +
                           'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                           'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_NOTIFY2').AsString + '"' )
        else     /// portugues
           TNotf2.Sql.Add( 'SELECT E.CD_EMPRESA AS CODIGO, LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NOME, ' +
                           'LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN "" THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_NUM, ' +
                           'CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) END + CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" THEN "" ELSE " - " END + ' +
                           'LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) WHEN "" THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_PAIS ' +
                           'FROM TEMPRESA_EST E ' +
                           'LEFT JOIN TPAIS_BROKER P ON E.CD_PAIS=P.CD_PAIS ' +
                           'WHERE E.CD_EMPRESA = "' + Tproc.FieldByName('CD_NOTIFY2').AsString + '"' )
      end
      else
      begin
        TNotf2.Sql.Add('SELECT "" AS CODIGO, "" AS NOME, "" AS ENDERECO_NUM, "" AS CIDADE_PAIS ' +
                       'FROM TEMPRESA_EST E ' +
                       'WHERE E.CD_EMPRESA = "@!@!"');
      end;
      TNotf2.Open;

      TPais1.Close;
      TPais1.Sql.Clear ;
      if TProc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais1.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"')
      else if tproc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais1.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"')
      else
         TPais1.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIGEM' ).AsString + '"');
      TPais1.Open;

      // Filtra local Origem
      TLocal2.Close;
      TLocal2.Sql.Clear ;
      TLocal2.Sql.Add(
      'select descricao from tlocal_embarque '+
      'where codigo="'+Tproc.FieldByName('cd_local_origem').asString+'"') ;
      TLocal2.Open ;

      // Pais de Origem
      TPais2.Close;
      TPais2.Sql.Clear ;
      if TProc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais2.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIG' ).AsString + '"')
      else if tproc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais2.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_ORIG' ).AsString + '"')
      else
         TPais2.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "'+ tproc.FieldByName( 'CD_PAIS_ORIG' ).AsString + '"');
      TPais2.Open;

      // Pagamento em qual local
      TLocal1.Close;
      TLocal1.Sql.Clear ;
      if Tproc.FieldByName('CD_TIPO_FRETE').AsString = '0' then        // Collect
        TLocal1.Sql.Add('SELECT DESCRICAO from tlocal_embarque where codigo="'+Tproc.FieldByName('cd_local_origem').asString+'"')
      else // Prepaid
        TLocal1.Sql.Add('SELECT DESCRICAO from tlocal_embarque where codigo="'+Tproc.FieldByName('cd_local_destino').asString+'"');
      Tlocal1.Open ;

      // Filtra local Destino Final
      TLocal3.Close;
      TLocal3.Sql.Clear ;
      TLocal3.Sql.Add('SELECT DESCRICAO from tlocal_embarque where codigo="'+Tproc.FieldByName('cd_local_destino').asString+'"');
      TLocal3.Open ;

      // Pais de Destino Final
      TPais3.Close;
      TPais3.Sql.Clear ;
      if tproc.FieldByName('cd_lingua_pedido').AsString = '1' then
         TPais3.Sql.Add('select nm_pais_ing as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"')
      else if tproc.FieldByName('cd_lingua_pedido').AsString = '2' then
         TPais3.Sql.Add('select nm_pais_esp as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"')
      else
         TPais3.Sql.Add('select nm_pais_port as descricao from tpais_broker where cd_pais = "' + tproc.FieldByName( 'CD_PAIS_DESTINO' ).AsString + '"');
      TPais3.Open;

      if TProc.FieldByName( 'IN_REFERENCIA_FAT_INST').AsString = '1' then
         nr_processo := ''
      else
         nr_processo := msk_cd_unid_neg.text + '02' + msk_nr_processo.Text;

      TReferencia.Close;
      TReferencia.Sql.Clear ;
      TReferencia.Sql.Add(
         'select a.nm_referencia AS REFER_NR_CLIENTE ' +
         'from tprocesso_exp p ' +
         'left join tempresa_est e on e.cd_empresa = p.cd_importador ' +
         'left join taux_exp_ref a on a.nr_processo = p.nr_processo ' +
         'where p.nr_processo = "' + Trim( nr_processo ) + '" ');
      TReferencia.Open;
      {
      if Tipo_Descricao.ItemIndex = 0 then
         ReportFileName := '\InstEmbA'
      else
         ReportFileName := '\InstEmbI';
      }
      TCartaCred.Close;
      TCartaCred.ParamByName('NR_PROCESSO').AsString := TProc.FieldByName('NR_PROCESSO').AsString;
      TCartaCred.Prepare;
      TCartaCred.Open;
      {
      if Not TCartaCred.EOF then
        ReportFileName := ReportFileName + 'CartaCred';
      ReportFileName := ReportFileName + '.rtm';

      ppRepInstEmb.Template.FileName := cDir_RPT + ReportFileName;
      ppRepInstEmb.Template.LoadFromFile;
      ppRepInstEmb.AllowPrintToFile  := True;
      case ( Sender as TSpeedButton ).Tag of
        1 : ppRepInstEmb.DeviceType  := 'Screen';
        2 : ppRepInstEmb.DeviceType  := 'PDFFile';
      end;
      ppRepInstEmb.TextFileName      := cDir_Rpt + '\Inst-' + Trim( Copy( Tproc.FieldByName('NR_PROCESSO').AsString, 5, 14 ) ) + '.PDF';
      if Texp.FieldByName('PATH_LOGO').AsString = '' then
         ppimg_logo_instemb.Picture.LoadFromFile( cDir_Rpt + '\figura.bmp')
      else
         ppimg_logo_instemb.Picture.LoadFromFile( cDir_Rpt + '\' + Trim( Texp.FieldByName('PATH_LOGO').AsString ) );
      ppRepInstEmb.Print ;
      }

    //chama o form de impressão!!
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
    frm_impressao.cd_produto    := '02';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_modulo     := '2007';
    frm_impressao.vApenas_email := false;
    frm_impressao.vBeforePrint  :=  pBeforePrint;
    frm_impressao.ShowModal;
    frm_impressao.Release;

    with TQuery.Create(Application) do begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = :DT_REALIZACAO, CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND ISNULL(DT_REALIZACAO, '''') = '''' AND CD_EVENTO = ''119'' ');
      ParamByName('DT_REALIZACAO').AsDateTime := Date();
      ParamByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
      ParamByName('NR_PROCESSO').AsString := nr_processo;
      ExecSQL;
    end;
  end;
 // finally
 // end;
end;

procedure Tfrm_exp_impr_instr_emb.pBeforePrint(Sender: TObject);
begin
  if (Tipo_Descricao.ItemIndex = 0) and
     (SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'Instembi.rtm') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'InstembiCartaCred.rtm')) then
    Application.MessageBox('Para imprimir relatório por Itens excolha a opção "Itens" na tela de Impressão!', 'Selecione o relatório correto...', MB_OK + MB_ICONERROR);
  if (Tipo_Descricao.ItemIndex = 1) and
     (SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'Instemba.rtm') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'InstembaCartaCred.rtm')) then
    Application.MessageBox('Para imprimir relatório Resumo excolha a opção "Resumo da Mercadoria" na tela de Impressão!', 'Selecione o relatório correto...', MB_OK + MB_ICONERROR);
   if (datm_exp_impr_instr_emb.TCartaCred.IsEmpty) and
      (SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'InstembiCartaCred.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'InstembaCartaCred.rtm')) then
    Application.MessageBox('Este processo não possui Carta de Crédito! Selecione outro tipo de relatório', 'Selecione o relatório correto...', MB_OK + MB_ICONERROR);

  // Só para o relatório Instemba.rtm
  if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'Instemba.rtm') then
  begin
    // TX_MERCADORIA
    TppSubReport(Frm_impressao.FindComponent('ppSubReport1')).Visible := (not datm_exp_impr_instr_emb.qryItensPO.Eof) and
       (datm_exp_impr_instr_emb.qryItensPOTX_MERCADORIA.AsString <> '');
    TppDBMemo(Frm_impressao.FindComponent('ppDBMemo2')).Visible := not TppSubReport(Frm_impressao.FindComponent('ppSubReport1')).Visible;

    // TX_INF_EMBALAGEM
    TppSubReport(Frm_impressao.FindComponent('ppSubReport2')).Visible := (not datm_exp_impr_instr_emb.qryItensPO.Eof) and
       (datm_exp_impr_instr_emb.qryItensPOTX_INF_EMBALAGEM.AsString <> '');
    TppDBMemo(Frm_impressao.FindComponent('ppDBMemo4')).Visible := not TppSubReport(Frm_impressao.FindComponent('ppSubReport2')).Visible;
  end;


  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand1')).BeforePrint := pBeforePrint2;

end;

procedure Tfrm_exp_impr_instr_emb.pBeforePrint2(Sender: TObject);
begin
  datm_exp_impr_instr_emb.qry_proc_exp_.Close;
  datm_exp_impr_instr_emb.qry_proc_exp_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
  datm_exp_impr_instr_emb.qry_proc_exp_.Prepare;
  datm_exp_impr_instr_emb.qry_proc_exp_.Open;
  TppDBMemo(Frm_impressao.FindComponent('ppDBMDeclAdic')).Visible := (datm_exp_impr_instr_emb.qry_proc_exp_.FieldByName('IN_DECL_AD_INSTR_EMB').AsString = '1' );
  datm_exp_impr_instr_emb.qry_proc_exp_.Close;

  if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'InstEmbi.rtm') then
    TppRegion(Frm_impressao.FindComponent('ppRegPag1')).Visible := (TppSystemVariable(Frm_impressao.FindComponent('ppPagina')).Text ='1');

  if datm_exp_impr_instr_emb.Texp.FieldByName('PATH_LOGO').AsString = '' then
    TppImage(Frm_impressao.FindComponent('ppimg_logo_instemb')).Picture.LoadFromFile( cDir_Rpt + '\figura.bmp')
  else
    TppImage(Frm_impressao.FindComponent('ppimg_logo_instemb')).Picture.LoadFromFile( cDir_Rpt + '\' + Trim( datm_exp_impr_instr_emb.Texp.FieldByName('PATH_LOGO').AsString ) );
end;


end.


