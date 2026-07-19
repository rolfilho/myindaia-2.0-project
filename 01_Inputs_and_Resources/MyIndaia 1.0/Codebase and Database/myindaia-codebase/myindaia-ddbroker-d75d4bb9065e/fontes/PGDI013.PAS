unit PGDI013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, DBTables, Db;

type
  Tfrm_Integracao_Risc = class(TForm)
    Panel1: TPanel;
    Mensagem: TStatusBar;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    procedure btn_iniciarClick(Sender: TObject);
    function IntegraComRISC: Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Integracao_Risc: Tfrm_Integracao_Risc;
  Saida : String;
  Txt :  TextFile;

implementation

uses PGGP001, GSMLIB, PGDI016;

{$R *.DFM}

function Tfrm_Integracao_Risc.IntegraComRISC : Boolean;
Var
  str_nr_importador  : String[14];
  dbl_pc_aliq_ii     : Double;
  dbl_pc_aliq_ipi    : Double;
  dbl_pc_aliq_icms   : Double;
  dbl_base_calc_ii   : Double;
  dbl_base_calc_ipi  : Double;
  dbl_base_calc_icms : Double;
  dbl_vl_ii          : Double;
  dbl_vl_ipi         : Double;
  dbl_vl_icms        : Double;
  str_nr_armazem     : String[10];
  str_cd_unidade     : String[2];
  dbl_vl_cif         : Double;
  dbl_vl_cif_ad_mn   : Double;
  str_cd_pais_procedencia : String[3];
begin

  IntegraComRISC := True;

  With datm_integracao_risc Do
  Begin

    tbl_di_w_.Open;

    If Not(  tbl_di_w_.FindKey([str_nr_processo]) ) Then
    begin
       tbl_di_w_.Close;
       Mensagem.SimpleText := 'Não encontrada DI para este processo. processo abortado.';
       IntegraComRISC := False; {Abortar}
    end;

    { Traz os dados do importador }
    qry_empresa_nac_.Close;
    qry_empresa_nac_.ParamByName('CD_EMPRESA').AsString := tbl_di_w_CD_IMPORTADOR.AsString;
    qry_empresa_nac_.Open;
    If ( qry_empresa_nac_.RecordCount > 0 ) Then
      begin
        If qry_empresa_nac_CGC_EMPRESA.AsString <> '' Then
          str_nr_importador   := FStrSpace(qry_empresa_nac_CGC_EMPRESA.AsString, 14 )
        else
          str_nr_importador   := FStrSpace(qry_empresa_nac_CPF_EMPRESA.AsString, 14 );
      end
    else
      begin
        str_nr_importador      := Space( 14 );
      end;

    qry_empresa_nac_.Close;

    // armazem
    qry_armazem_.Close;
    qry_armazem_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_armazem_.Open;
    If qry_armazem_.RecordCount > 0 Then
      str_nr_armazem := qry_armazem_NM_ARMAZEM_CARGA.AsString
    else
      str_nr_armazem := '';
    qry_armazem_.Close;
    // fim rotina armazem

    qry_adicao_.Close;
    qry_adicao_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_adicao_.Open;

    If qry_adicao_.RecordCount > 0 Then
    begin

       While Not ( qry_adicao_.EOF) Do
       begin

         dbl_pc_aliq_ii      := 0;
         dbl_pc_aliq_ipi     := 0;
         dbl_base_calc_ii    := 0;
         dbl_base_calc_ipi   := 0;
         dbl_vl_ii           := 0;
         dbl_vl_ipi          := 0;

         qry_trib_ii_.Close;
         qry_trib_ii_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
         qry_trib_ii_.ParamByName('NR_ADICAO').AsString := qry_adicao_NR_ADICAO.AsString;
         qry_trib_ii_.Open;

         If qry_trib_ii_.RecordCount > 0 Then
         begin
           dbl_pc_aliq_ii   := qry_trib_ii_PC_ALIQ_NORM_ADVAL.AsFloat;
           dbl_base_calc_ii := qry_trib_ii_VL_BASE_CALC_ADVAL.AsFloat;
           dbl_vl_ii        := qry_trib_ii_VL_IPT_A_RECOLHER.AsFloat;
         end;

         qry_trib_ipi_.Close;
         qry_trib_ipi_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
         qry_trib_ipi_.ParamByName('NR_ADICAO').AsString := qry_adicao_NR_ADICAO.AsString;
         qry_trib_ipi_.Open;

         If qry_trib_ipi_.RecordCount > 0 Then
         begin
           dbl_pc_aliq_ipi   := qry_trib_ipi_PC_ALIQ_NORM_ADVAL.AsFloat;
           dbl_base_calc_ipi := qry_trib_ipi_VL_BASE_CALC_ADVAL.AsFloat;
           dbl_vl_ipi        := qry_trib_ipi_VL_IPT_A_RECOLHER.AsFloat;
         end;

         dbl_pc_aliq_icms   := tbl_di_w_PC_ICMS.AsFloat;
         dbl_base_calc_icms := dbl_base_calc_ipi + qry_trib_ipi_VL_IPT_A_RECOLHER.AsFloat;
         dbl_vl_icms        := dbl_base_calc_icms * dbl_pc_aliq_icms / 100;

         // NCM
         qry_ncm_.Close;
         qry_ncm_.ParamByName('CODIGO').AsString := qry_adicao_CD_NCM_SH.AsString;
         qry_ncm_.Open;
         If qry_ncm_.RecordCount > 0 Then
            str_cd_unidade := Copy( qry_ncm_UNIDADE_MEDIDA.AsString, 1 , 2 )
         else
            str_cd_unidade := '';
         qry_ncm_.Close;
         // fim NCM

         dbl_vl_cif := tbl_di_w_VL_TOT_MLE_MNEG.AsFloat +
                       tbl_di_w_VL_TOT_FRT_PREPAID.AsFloat +
                       tbl_di_w_VL_TOT_FRT_COLLECT.AsFloat;

         dbl_vl_cif_ad_mn := qry_adicao_vl_merc_loc_emb_mn.AsFloat +
                             qry_adicao_VL_FRETE_MERC_MN.AsFloat +
                             qry_adicao_VL_SEG_MERC_MN.AsFloat;

         If qry_adicao_CD_PAIS_PROC_MERC.AsString <> '' Then
            str_cd_pais_procedencia := qry_adicao_CD_PAIS_PROC_MERC.AsString
         Else
            str_cd_pais_procedencia := tbl_di_w_CD_PAIS_PROC_CARGA.AsString;

         Saida :=
         FStrSpace( ( Copy( str_nr_processo, 1, 2 ) +
                      qry_processo_NR_PROC_RISC.AsString ) , 10 )        + {01-NUMERO DO REGISTRO}
         FStrZero(    qry_adicao_NR_ADICAO.AsString, 3 )                 + {02-NUMERO DA ADICAO}
         FStrZero(    qry_adicao_NR_OPER_TRAT_PREV.AsString, 10 )        + {03-NUMERO DA LI}
         FStrZero(    qry_adicao_CD_REGIME_TRIBUTAR.AsString, 1 )        + {04-REG.TRIBUTACAO DO II}
         FStrZero(    qry_trib_ipi_CD_TIPO_BENEF_IPI.AsString, 1 )       + {05-REG.TRIBUTACAO DO IPI}
         FFloatToStr( dbl_pc_aliq_ii  , 3, 2 )                           + {06-ALIQUOTA DO II}
         FFloatToStr( dbl_pc_aliq_ipi , 3, 2 )                           + {07-ALIQUOTA DO IPI}
         FFloatToStr( dbl_pc_aliq_icms, 2, 2 )                           + {08-ALIQUOTA DO ICMS}
         FFloatToStr( dbl_base_calc_ii  , 11, 2 )                        + {09-BASE CALCULO II}
         FFloatToStr( dbl_base_calc_ipi , 11, 2 )                        + {10-BASE CALCULO IPI}
         FFloatToStr( dbl_base_calc_icms, 11, 2 )                        + {11-BASE CALCULO ICMS}
         FFloatToStr( dbl_vl_ii  , 11, 2 )                               + {12-VALOR DO II}
         FFloatToStr( dbl_vl_ipi , 11, 2 )                               + {13-VALOR DO IPI}
         FFloatToStr( dbl_vl_icms, 11, 2 )                               + {14-VALOR DO ICMS}
         FStrZero(    tbl_di_w_CD_MOEDA_MLE.AsString, 3 )                + {15-MOEDA FOB}
{.}      FFloatToStr( qry_adicao_vl_merc_loc_emb_mneg.AsFloat ,11, 2 )   + {16-FOB ADICAO NA MOEDA}
{.}      FFloatToStr( qry_adicao_vl_merc_loc_emb_mn.AsFloat   ,11, 2 )   + {17-FOB ADICAO EM R$}
{.}      FStrZero(    tbl_di_w_CD_MOEDA_FRETE.AsString , 3 )             + {18-MOEDA FRETE}
         FFloatToStr( qry_adicao_VL_FRETE_MERC_MNEG.AsFloat   ,11, 2 )   + {19-FRETE ADICAO NA MOEDA}
         FFloatToStr( qry_adicao_VL_FRETE_MERC_MN.AsFloat     ,11, 2 )   + {20-FRETE ADICAO EM R$}
{.}      FStrZero(    tbl_di_w_CD_MOEDA_SEGURO.AsString, 3 )             + {21-MOEDA SEGURO}
         FFloatToStr( qry_adicao_VL_SEG_MERC_MNEG.AsFloat     ,11, 2 )   + {22-SEG.ADICAO NA MOEDA}
         FFloatToStr( qry_adicao_VL_SEG_MERC_MN.AsFloat       ,11, 2 )   +  {23-SEG.ADICAO EM R$}
         '000'                                                           + {24-MOEDA ACRESCIMO}
         FFloatToStr(                                        0,11, 2 )   + {25-VALOR ACRESC.NA MOEDA}
         '000'                                                           + {26-MOEDA DESCONTO}
         FFloatToStr(                                        0,11, 2 )   + {27-VALOR DESC.NA MOEDA}
{.}      FFloatToStr( dbl_vl_cif_ad_mn                        ,11, 2 )   + {28-CIF ADICAO EM R$}
{.}      FFloatToStr( tbl_di_w_TX_MLE.AsFloat                 , 6, 7 )   + {29-TAXA CONVERSAO FOB}
{.}      FFloatToStr( tbl_di_w_TX_FRETE.AsFloat               , 6, 7 )   + {30-TAXA CONVERSAO FRETE}
{.}      FFloatToStr( tbl_di_w_TX_SEGURO.AsFloat              , 6, 7 )   + {31-TAXA CONVERSAO SEGURO}
{.}      FFloatToStr( tbl_di_w_TX_DOLAR.AsFloat               , 6, 7 )   + {32-TAXA DOLAR}
{.}      FStrZero(    qry_adicao_CD_NCM_SH.AsString, 8 )                 + {33-NCM}
{.}      FStrSpace(    str_cd_unidade, 18 )                              + {34-UNIDADE DE MEDIDA}
         FFloatToStr( qry_adicao_QT_UN_ESTATISTICA.AsFloat, 9, 4 )       + {35-QUANTIDADE NA ADICAO}
         FFloatToStr( qry_adicao_PL_MERCADORIA.AsFloat, 9, 4 )           + {36-PESO LIQUIDO (DA ADICAO) }
         FStrSpace(   qry_adicao_NM_FABRICANTE_MERC.AsString, 60 )       + {37-FABRICANTE}
{.}      FStrZero(    qry_adicao_CD_PAIS_ORIG_MERC.AsString, 3 )         + {38-PAIS DE ORIGEM}
         FStrSpace(   qry_adicao_NM_FORN_ESTR.AsString, 60 )             + {39-EXPORTADOR}
{.}      FStrZero(    str_cd_pais_procedencia              , 3 )         + {40-PAIS DE PROCEDENCIA}
         FStrZero( IntToStr( tbl_di_w_CD_VIA_TRANSP_CARG.AsInteger ), 1) + {41-VIA DE TRANSPORTE}
{.}      '00'                                                            + {42-REGIME ADUANEIRO}
         str_nr_importador                                               + {43-CGC DO IMPORTADOR}
         Space(15)                                                       + {44-REFERENCIA IMPORTADOR}
{.}      Copy( FAAAAMMDD( tbl_di_w_DT_REGISTRO_DI.AsString ), 3, 8 )     + {45-DATA DA DI}
         FStrZero(    tbl_di_w_NR_DECLARACAO_IMP.AsString, 10 )          + {46-REGISTRO NO SISCOMEX}
{.}      FAAAAMMDD( tbl_di_w_DT_REGISTRO_DI.AsString )                   + {47-DATA REGISTRO NO DI}
         Space(45)                                                       + {48-DESCRICAO DA MERCADORIA}
         Space(200)                                                      + {49-FATURA COMERCIAL}
         FStrSpace( tbl_di_w_NR_DCTO_CARGA.AsString, 18 )                + {50-BL}
         FStrSpace( tbl_di_w_NR_DCTO_CARGA_MAST.AsString, 18 )           + {51-HBL}
{.}      Copy( FAAAAMMDD( tbl_di_w_DT_EMBARQUE.AsString ), 3 , 8 )       + {52-DATA DO BL}
         FStrSpace( tbl_di_w_NR_MANIFESTO.AsString, 15 )                 + {53-MANIFESTO}
         FStrSpace( tbl_di_w_NM_VEICULO_TRANSP.AsString, 24 )            + {54-VEICULO}
{.}      Copy( FAAAAMMDD( tbl_di_w_DT_CHEGADA_CARGA.AsString ), 3 , 8 )  + {55-DATA ENTRADA}
         FStrSpace( str_nr_armazem, 10 )                                 + {56-ARMAZEM}
         FFloatToStr( tbl_di_w_PB_CARGA.AsFloat, 9, 4)                   + {57-PESO BRUTO TOTAL}
{.}      FFloatToStr( dbl_vl_cif                              , 11, 2 )  + {58-FOB DA DI NA MOEDA}
         FFloatToStr( tbl_di_w_VL_FRETE_TNAC_MNEG.AsFloat     , 11, 2 )  + {59-FRETE INT/DESP NA MOEDA}
         FFloatToStr( tbl_di_w_VL_TOT_FRT_PREPAID.AsFloat +
                      tbl_di_w_VL_TOT_FRT_COLLECT.AsFloat     , 11, 2 )  + {60-FRETE DA DI NA MOEDA}
         FFloatToStr( tbl_di_w_VL_TOT_SEGURO_MNEG.AsFloat     , 11, 2 )  + {61-SEGURO DA DI NA MOEDA}
         #13#10;

         Write( Txt, Saida );

         qry_trib_ii_.Close;
         qry_trib_ipi_.Close;

         qry_adicao_.Next;

       end;

    end;

    qry_adicao_.Close;

    tbl_di_w_.Close;

  End;

end;


procedure Tfrm_Integracao_Risc.btn_iniciarClick(Sender: TObject);
Var
  cNomeTxt : String;
begin

  With datm_integracao_risc Do
  Begin

    Mensagem.SimpleText := 'Gerando arquivo para o RISC ...';

    Application.ProcessMessages;

    { Montar o nome do Txtuivo }
    cNomeTxt := cDir_Risc + '\EXPORT.TXT';

    { Variável global de controle do Pascal }
    FileMode := 2;

    qry_proc_risc_.Close;
    qry_proc_risc_.Open;

    If qry_proc_risc_.RecordCount = 0 Then
    begin
       Mensagem.SimpleText := 'Não há processos de DI para atualizar no RISC.';
       Exit;
    end;

    Try
      AssignFile( Txt, cNomeTxt );
      ReWrite( Txt );
    Except
      Mensagem.SimpleText := 'Erro na criação do Arquivo.';
      Exit
    End;

    While Not ( qry_proc_risc_.EOF ) Do
    begin

      str_nr_processo := qry_proc_risc_NR_PROCESSO.AsString;

      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_processo_.Open;

      Try
        IntegraComRISC
      Except
        Mensagem.SimpleText := 'Erro na geração do Arquivo para RISC.';
        qry_processo_.Close;
        qry_proc_risc_.Close;
        CloseFile( Txt );
        Exit
      End;

      Try
        if qry_proc_risc_.State <> dsEdit then qry_proc_risc_.Edit;
        qry_proc_risc_IN_RISC_ATUALIZADO.AsString := '1';
        qry_proc_risc_.Post;
      Except
        Mensagem.SimpleText := 'Erro na geração do Arquivo para RISC.';
      End;

      qry_proc_risc_.Next;

    end;

    qry_processo_.Close;
    qry_proc_risc_.Close;

    CloseFile( Txt );


    Mensagem.SimpleText := 'Arquivo gerado com sucesso.';

  End;

end;


procedure Tfrm_Integracao_Risc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_Integracao_Risc.Destroy;
  Action := caFree;
end;

procedure Tfrm_Integracao_Risc.btn_fecharClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_Integracao_Risc.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_Integracao_Risc,datm_Integracao_Risc);
end;

end.
