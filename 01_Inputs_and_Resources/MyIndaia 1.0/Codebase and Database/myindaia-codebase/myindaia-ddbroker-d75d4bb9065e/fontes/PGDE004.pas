(*************************************************************************************************
Sistema: Controle de Demurrage
PROGRAMA: PGDE004.PAS - datm_dem_fat - Faturas
AUTOR: Leandro Stipanich
DATA: 15/07/2002
Manutenção:
*************************************************************************************************)
unit PGDE004;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_dem_fat = class(TDataModule)
    qry_fat_cntr_: TQuery;
    ds_fat_cntr: TDataSource;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_fat_cntr_NR_FATURA: TStringField;
    qry_fat_cntr_NR_CNTR: TStringField;
    qry_fat_cntr_NR_PROCESSO: TStringField;
    qry_fat_cntr_VL_DIARIA: TFloatField;
    qry_fat_cntr_VL_FATURA_MNEG: TFloatField;
    qry_fat_cntr_CD_MOEDA_FATURA: TStringField;
    qry_fat_cntr_TX_FATURA: TFloatField;
    qry_fat_cntr_VL_FATURA_MN: TFloatField;
    qry_fat_cntr_VL_DESCONTO: TFloatField;
    qry_fat_cntr_VL_DEPOSITO: TFloatField;
    qry_fat_cntr_VL_TOTAL: TFloatField;
    qry_fat_cntr_IN_PARCIAL: TStringField;
    qry_fat_cntr_DT_INICIO: TDateTimeField;
    qry_fat_cntr_DT_FIM: TDateTimeField;
    qry_fat_cntr_DT_VENCIMENTO: TDateTimeField;
    qry_fat_cntr_DT_PAGAMENTO: TDateTimeField;
    qry_fat_cntr_NR_SOLIC_PAGTO: TStringField;
    qry_fat_cntr_IN_RECIBO: TStringField;
    qry_fat_cntr_IN_FATURADO: TStringField;
    qry_fat_cntr_DT_FATURA: TDateTimeField;
    qry_moeda_: TQuery;
    qry_fat_cntr_LookMoeda: TStringField;
    qry_fat_cntr_LookParcial: TStringField;
    qry_fat_cntr_LookRecibo: TStringField;
    qry_fat_cntr_LookFaturado: TStringField;
    qry_fat_cntr_LookNrCheque: TStringField;
    qry_solic_pagto_: TQuery;
    qry_fat_cntr_CalcNrProcesso: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_USUARIO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_CD_REPRESENTANTE: TStringField;
    qry_processo_CD_TRANSP_NAC_DOC: TStringField;
    qry_processo_CD_TRANSP_NAC: TStringField;
    qry_processo_CD_AREA: TStringField;
    qry_processo_CD_RESTRICAO: TStringField;
    qry_processo_CD_LIBERADOR: TStringField;
    qry_processo_CD_DESPACHANTE: TStringField;
    qry_processo_DT_ABERTURA: TDateTimeField;
    qry_processo_DT_LIBERACAO: TDateTimeField;
    qry_processo_DT_PRESENCA_CARGA: TDateTimeField;
    qry_processo_DT_VENCTO_ARMAZENAGEM: TDateTimeField;
    qry_processo_DT_REG_DDE: TDateTimeField;
    qry_processo_IN_IMP_ARM: TStringField;
    qry_processo_IN_ETIQUETA: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_processo_IN_ENTREPOSTO: TStringField;
    qry_processo_NR_PRESENCA_CARGA: TStringField;
    qry_processo_NR_DI: TStringField;
    qry_processo_NR_DA: TStringField;
    qry_processo_NR_PERIODO_ARMAZENAGEM: TIntegerField;
    qry_processo_NR_DDE: TStringField;
    qry_processo_TX_MERCADORIA: TMemoField;
    qry_processo_TX_OBSERVACOES: TMemoField;
    qry_processo_TX_OBS_INT: TMemoField;
    qry_processo_LookUnidNeg: TStringField;
    qry_processo_LookProduto: TStringField;
    qry_processo_LookUsuario: TStringField;
    qry_processo_CalcNrProcesso: TStringField;
    qry_processo_LookCliente: TStringField;
    qry_processo_LookServico: TStringField;
    qry_processo_LookRepresentante: TStringField;
    qry_processo_LookViaTransporte: TStringField;
    qry_processo_LookTranspNac: TStringField;
    qry_processo_LookTranspNacDoc: TStringField;
    qry_processo_LookArea: TStringField;
    qry_processo_LookRestricao: TStringField;
    qry_processo_LookLiberador: TStringField;
    qry_processo_LookServicoAtivo: TStringField;
    qry_processo_LookDespachante: TStringField;
    qry_processo_LookImpArm: TStringField;
    qry_processo_LookEtiqueta: TStringField;
    qry_processo_LookEntreposto: TStringField;
    qry_processo_NR_PROCESSO_OR_ENTREPOSTO: TStringField;
    qry_produto_: TQuery;
    qry_usuario_habilitacao_: TQuery;
    qry_unid_neg_: TQuery;
    qry_fat_cntr_CD_UNID_NEG: TStringField;
    sp_calc_dias_cntr: TStoredProc;
    qry_proc_cntr_: TQuery;
    qry_fat_cntr_CalcDiasCobrar: TIntegerField;
    qry_fat_cntr_CalcDiasCorridos: TIntegerField;
    qry_fat_cntr_CalcVlTotal: TFloatField;
    qry_fat_cntr_VL_DESCONTO_MNEG: TFloatField;
    qry_fat_cntr_VL_ACRESCIMO_MNEG: TFloatField;
    qry_fat_cntr_VL_ACRESCIMO: TFloatField;
    qry_fat_: TQuery;
    ds_fat: TDataSource;
    qry_fat_CD_UNID_NEG: TStringField;
    qry_fat_NR_FATURA: TStringField;
    qry_fat_VL_FATURA: TFloatField;
    qry_fat_VL_DESCONTO: TFloatField;
    qry_fat_VL_DEPOSITO: TFloatField;
    qry_fat_VL_ACRESCIMO: TFloatField;
    qry_fat_DT_VENCTO: TDateTimeField;
    qry_fat_DT_PAGTO: TDateTimeField;
    qry_fat_IN_RECIBO: TStringField;
    qry_fat_IN_FATURADO: TStringField;
    qry_fat_DT_FATURA: TDateTimeField;
    qry_fat_LookRecibo: TStringField;
    qry_fat_LookFaturado: TStringField;
    qry_totais_: TQuery;
    qry_totais_VL_FATURA: TFloatField;
    qry_totais_VL_DESCONTO: TFloatField;
    qry_totais_VL_DEPOSITO: TFloatField;
    qry_totais_VL_ACRESCIMO: TFloatField;
    qry_totais_VL_TOTAL: TFloatField;
    qry_dias_: TQuery;
    qry_fat_VL_FATURA_TOTAL: TFloatField;
    qry_fat_NR_NF: TStringField;
    qry_soma_fat_: TQuery;
    qry_soma_fat_cntr_: TQuery;
    ds_soma_fat: TDataSource;
    ds_soma_fat_cntr: TDataSource;
    qry_lista_cntr_: TQuery;
    ds_lista_cntr: TDataSource;
    qry_lista_fat_: TQuery;
    ds_lista_fat: TDataSource;
    qry_lista_fat_NR_FATURA: TStringField;
    qry_lista_fat_DT_VENCTO: TDateTimeField;
    qry_lista_fat_VL_FATURA: TFloatField;
    qry_lista_fat_VL_DESCONTO: TFloatField;
    qry_lista_fat_VL_DEPOSITO: TFloatField;
    qry_lista_fat_VL_FATURA_TOTAL: TFloatField;
    qry_lista_fat_VL_ACRESCIMO: TFloatField;
    qry_lista_fat_CD_UNID_NEG: TStringField;
    qry_lista_cntr_CD_UNID_NEG: TStringField;
    qry_lista_cntr_NR_FATURA: TStringField;
    qry_lista_cntr_NR_CNTR: TStringField;
    qry_lista_cntr_NR_PROCESSO: TStringField;
    qry_lista_cntr_CalcNrProcesso: TStringField;
    qry_lista_cntr_VL_TOTAL: TFloatField;
    qry_lista_cntr_DT_VENCIMENTO: TDateTimeField;
    qry_lista_cntr_DT_PAGAMENTO: TDateTimeField;
    qry_soma_fat_VL_TOT_TELA: TFloatField;
    qry_soma_fat_cntr_VL_TOT_TELA: TFloatField;
    qry_lista_cntr_NR_PERIODO: TStringField;
    qry_fat_cntr_NR_PERIODO: TStringField;
    qry_vl_total_: TQuery;
    qry_vl_total_VL_TOTAL: TFloatField;
    qry_tp_fat_dem_: TQuery;
    qry_tp_fat_dem_TP_FAT_DEM: TStringField;
    qry_tp_fat_dem_NM_TP_FAT_DEM: TStringField;
    qry_fat_TP_FAT_DEM: TStringField;
    qry_fat_LookTpFatDem: TStringField;
    qry_lista_cntr_NR_DIAS_COBRADOS: TIntegerField;
    qry_dias_NR_DIAS_COBRADOS: TIntegerField;
    qry_fat_cntr_NR_DIAS_COBRADOS: TIntegerField;
    qry_fat_IN_DISPUTE: TStringField;
    qry_fat_VL_DISPUTE: TFloatField;
    qry_fat_OBS_DISPUTE: TMemoField;
    procedure qry_rel_processo_BeforeOpen(DataSet: TDataSet);
    procedure qry_fat_cntr_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qry_fat_cntr_CalcFields(DataSet: TDataSet);
    procedure qry_fat_cntr_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_cntr_BeforePost(DataSet: TDataSet);
    procedure qry_fat_cntr_AfterClose(DataSet: TDataSet);
    procedure qry_fat_cntr_AfterOpen(DataSet: TDataSet);
    procedure qry_fat_cntr_TX_FATURAChange(Sender: TField);
    procedure qry_fat_cntr_VL_FATURA_MNChange(Sender: TField);
    procedure qry_fat_cntr_VL_DIARIAChange(Sender: TField);
    procedure qry_fat_cntr_NR_CNTRChange(Sender: TField);
    procedure qry_fat_cntr_NR_PROCESSOChange(Sender: TField);
    procedure qry_fat_cntr_VL_DESCONTO_MNEGChange(Sender: TField);
    procedure qry_fat_cntr_VL_ACRESCIMO_MNEGChange(Sender: TField);
    procedure qry_fat_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_NR_FATURAChange(Sender: TField);
    procedure qry_lista_fat_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_cntr_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_AfterPost(DataSet: TDataSet);
    procedure qry_fat_cntr_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_dem_fat: Tdatm_dem_fat;

implementation

uses GSMLIB, PGGP001, PGGP017, PGDE003;

{$R *.DFM}

procedure Tdatm_dem_fat.qry_rel_processo_BeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor:=crHourGlass;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   TrataErro(E);
end;

procedure Tdatm_dem_fat.qry_fat_cntr_CalcFields(DataSet: TDataSet);
begin
  //Banco
  qry_fat_cntr_LookMoeda.AsString := Lookup( qry_moeda_, qry_fat_cntr_CD_MOEDA_FATURA, 'CD_MOEDA', 'NM_MOEDA' );
  //Nº Cheque
  qry_solic_pagto_.Close;
  qry_solic_pagto_.ParamByName('NR_PROCESSO').AsString   := qry_fat_cntr_NR_PROCESSO.AsString;
  qry_solic_pagto_.ParamByName('NR_LANCAMENTO').AsString := qry_fat_cntr_NR_SOLIC_PAGTO.AsString;
  qry_solic_pagto_.ParamByName('CD_ITEM').AsString       := str_cd_item_demurrage;
  qry_solic_pagto_.Prepare;
  qry_solic_pagto_.Open;
  qry_fat_cntr_LookNrCheque.AsString := qry_solic_pagto_.FieldByName('NR_DOCTO').AsString;
  qry_solic_pagto_.Close;

  //Dias Corridos
  CloseStoredProc( sp_calc_dias_cntr );
  sp_calc_dias_cntr.ParamByName('@nr_processo').AsString := qry_fat_cntr_NR_PROCESSO.AsString;
  sp_calc_dias_cntr.ParamByName('@nr_cntr').AsString     := qry_fat_cntr_NR_CNTR.AsString;
  ExecStoredProc( sp_calc_dias_cntr );
  qry_fat_cntr_CalcDiasCorridos.AsInteger := sp_calc_dias_cntr.ParamByName('@nr_dias_corridos').AsInteger;
  qry_fat_cntr_CalcDiasCobrar.AsInteger   := sp_calc_dias_cntr.ParamByName('@nr_dias_cobrar').AsInteger;
  CloseStoredProc( sp_calc_dias_cntr );

  //Processo
  qry_fat_cntr_CalcNrProcesso.AsString := Copy( qry_fat_cntr_NR_PROCESSO.AsString, 5, 14 );

  //Total
  qry_fat_cntr_CalcVlTotal.AsFloat := Arredondar( ( qry_fat_cntr_VL_FATURA_MN.AsFloat +
                                                    qry_fat_cntr_VL_ACRESCIMO.AsFloat -
                                                    qry_fat_cntr_VL_DESCONTO.AsFloat -
                                                    qry_fat_cntr_VL_DEPOSITO.AsFloat ), 2 );
end;

procedure Tdatm_dem_fat.qry_fat_cntr_AfterScroll(DataSet: TDataSet);
begin
  with frm_dem_fat do
  begin
    if Trim( qry_fat_cntr_NR_PROCESSO.AsString ) <> '' then
      msk_nr_processo.Text := Copy( Trim( qry_fat_cntr_NR_PROCESSO.AsString ), 5, 14 );

    if qry_fat_cntr_IN_PARCIAL.AsString = '1' then
    begin
      dbedt_dt_inicio.Enabled  := True;
      dbedt_dt_inicio.TabStop  := True;
      dbedt_dt_inicio.ReadOnly := False;
      dbedt_dt_inicio.Color    := clWindow;

      dbedt_dt_fim.Enabled     := True;
      dbedt_dt_fim.TabStop     := True;
      dbedt_dt_fim.ReadOnly    := False;
      dbedt_dt_fim.Color       := clWindow;
    end
    else
    begin
      dbedt_dt_inicio.Enabled  := False;
      dbedt_dt_inicio.TabStop  := False;
      dbedt_dt_inicio.ReadOnly := True;
      dbedt_dt_inicio.Color    := clMenu;

      dbedt_dt_fim.Enabled     := False;
      dbedt_dt_fim.TabStop     := False;
      dbedt_dt_fim.ReadOnly    := True;
      dbedt_dt_fim.Color       := clMenu;
    end;
  end;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_BeforePost(DataSet: TDataSet);
begin
  with frm_dem_fat do
  begin
    qry_fat_cntr_NR_PROCESSO.AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) +
                                         Trim( msk_nr_processo.Text );
    qry_fat_cntr_VL_TOTAL.AsFloat     := qry_fat_cntr_CalcVlTotal.AsFloat;
  end;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_AfterClose(DataSet: TDataSet);
begin
  frm_dem_fat.msk_nr_processo.Text := '';
end;

procedure Tdatm_dem_fat.qry_fat_cntr_AfterOpen(DataSet: TDataSet);
begin
  frm_dem_fat.var_nr_proc := '';
end;

procedure Tdatm_dem_fat.qry_fat_cntr_TX_FATURAChange(Sender: TField);
begin
  if ( Arredondar( qry_fat_cntr_TX_FATURA.AsFloat, 7 ) > 0 ) and
     ( Arredondar( qry_fat_cntr_VL_FATURA_MNEG.AsFloat, 2 ) > 0 ) then
  begin
    qry_fat_cntr_VL_FATURA_MN.AsFloat := Arredondar( ( Arredondar( qry_fat_cntr_TX_FATURA.AsFloat, 7 ) *
                                                       Arredondar( qry_fat_cntr_VL_FATURA_MNEG.AsFloat, 2 ) ), 2 );
  end;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_VL_FATURA_MNChange(Sender: TField);
begin
  if qry_fat_cntr_TX_FATURA.IsNull or
     ( Arredondar( qry_fat_cntr_VL_FATURA_MNEG.AsFloat, 2 ) = 0 ) then
  begin
    if Arredondar( qry_fat_cntr_VL_FATURA_MNEG.AsFloat, 2 ) <> 0 then
    begin
      qry_fat_cntr_TX_FATURA.AsFloat := Arredondar( ( Arredondar( qry_fat_cntr_VL_FATURA_MN.AsFloat, 7 ) /
                                                      Arredondar( qry_fat_cntr_VL_FATURA_MNEG.AsFloat, 2 ) ), 7 );
    end;
  end;

end;

procedure Tdatm_dem_fat.qry_fat_cntr_VL_DIARIAChange(Sender: TField);
begin
  if ( qry_fat_cntr_CalcDiasCobrar.AsInteger > 0 ) and
     ( Arredondar( qry_fat_cntr_VL_DIARIA.AsFloat, 2 ) > 0 ) then
  begin
    qry_fat_cntr_VL_FATURA_MNEG.AsFloat := Arredondar( ( qry_fat_cntr_NR_DIAS_COBRADOS.AsInteger *
                                                         Arredondar( qry_fat_cntr_VL_DIARIA.AsFloat, 2 ) ), 2 );
  end;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_NR_CNTRChange(Sender: TField);
begin
  qry_proc_cntr_.Close;
  qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString := qry_fat_cntr_NR_PROCESSO.AsString;
  qry_proc_cntr_.ParamByName('NR_CNTR').AsString     := qry_fat_cntr_NR_CNTR.AsString;
  qry_proc_cntr_.Prepare;
  qry_proc_cntr_.Open;
  if Not qry_proc_cntr_.EOF then
  begin
    if qry_proc_cntr_.FieldByName('IN_DEPOSITADO').AsString = '1' then
      qry_fat_cntr_.FieldByName('VL_DEPOSITO').AsFloat := qry_proc_cntr_.FieldbyName('VL_CHEQUE_CAUCAO').AsFloat;
  end;
  qry_proc_cntr_.Close;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_NR_PROCESSOChange(Sender: TField);
begin
  qry_proc_cntr_.Close;
  qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString := qry_fat_cntr_NR_PROCESSO.AsString;
  qry_proc_cntr_.ParamByName('NR_CNTR').AsString     := qry_fat_cntr_NR_CNTR.AsString;
  qry_proc_cntr_.Prepare;
  qry_proc_cntr_.Open;
  if Not qry_proc_cntr_.EOF then
  begin
    if qry_proc_cntr_.FieldByName('IN_DEPOSITADO').AsString = '1' then
      qry_fat_cntr_.FieldByName('VL_DEPOSITO').AsFloat := qry_proc_cntr_.FieldbyName('VL_CHEQUE_CAUCAO').AsFloat;
  end;
  qry_proc_cntr_.Close;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_VL_DESCONTO_MNEGChange(Sender: TField);
begin
  if ( Arredondar( qry_fat_cntr_TX_FATURA.AsFloat, 7 ) > 0 ) and
     ( Arredondar( qry_fat_cntr_VL_DESCONTO_MNEG.AsFloat, 2 ) > 0 ) then
  begin
    qry_fat_cntr_VL_DESCONTO.AsFloat := Arredondar( ( Arredondar( qry_fat_cntr_TX_FATURA.AsFloat, 7 ) *
                                                      Arredondar( qry_fat_cntr_VL_DESCONTO_MNEG.AsFloat, 2 ) ), 2 );
  end;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_VL_ACRESCIMO_MNEGChange(Sender: TField);
begin
  if ( Arredondar( qry_fat_cntr_TX_FATURA.AsFloat, 7 ) > 0 ) and
     ( Arredondar( qry_fat_cntr_VL_ACRESCIMO_MNEG.AsFloat, 2 ) > 0 ) then
  begin
    qry_fat_cntr_VL_ACRESCIMO.AsFloat := Arredondar( ( Arredondar( qry_fat_cntr_TX_FATURA.AsFloat, 7 ) *
                                                Arredondar( qry_fat_cntr_VL_ACRESCIMO_MNEG.AsFloat, 2 ) ), 2 );
  end;
end;

procedure Tdatm_dem_fat.qry_fat_AfterScroll(DataSet: TDataSet);
begin
  qry_totais_.Close;
  qry_totais_.ParamByName('CD_UNID_NEG').AsString := qry_fat_CD_UNID_NEG.AsString;
  qry_totais_.ParamByName('NR_FATURA').AsString   := qry_fat_NR_FATURA.AsString;
  qry_totais_.Prepare;
  qry_totais_.Open;
end;

procedure Tdatm_dem_fat.qry_fat_NR_FATURAChange(Sender: TField);
begin
  qry_totais_.Close;
  qry_totais_.ParamByName('CD_UNID_NEG').AsString := qry_fat_CD_UNID_NEG.AsString;
  qry_totais_.ParamByName('NR_FATURA').AsString   := qry_fat_NR_FATURA.AsString;
  qry_totais_.Prepare;
  qry_totais_.Open;

  qry_fat_VL_FATURA.AsFloat    := qry_totais_VL_FATURA.AsFloat;
  qry_fat_VL_DESCONTO.AsFloat  := qry_totais_VL_DESCONTO.AsFloat;
  qry_fat_VL_ACRESCIMO.AsFloat := qry_totais_VL_ACRESCIMO.AsFloat;
  qry_fat_VL_DEPOSITO.AsFloat  := qry_totais_VL_DEPOSITO.AsFloat;
end;

procedure Tdatm_dem_fat.qry_lista_fat_AfterScroll(DataSet: TDataSet);
begin
  with frm_dem_fat do
  begin
    qry_fat_.Close;
    qry_fat_.ParamByName('CD_UNID_NEG').AsString := qry_lista_fat_CD_UNID_NEG.AsString;
    qry_fat_.ParamByName('NR_FATURA').AsString   := qry_lista_fat_NR_FATURA.AsString;
    qry_fat_.Prepare;
    qry_fat_.Open;

    qry_soma_fat_.Close;
    qry_soma_fat_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    if ( Trim( msk_nr_fatura.Text ) <> '' ) then
      qry_soma_fat_.ParamByName('NR_FATURA').AsString := Trim( msk_nr_fatura.Text )
    else
      qry_soma_fat_.ParamByName('NR_FATURA').AsString := '';
    if ( Trim( msk_nr_cntr.Text ) <> '' ) then
      qry_soma_fat_.ParamByName('NR_CNTR').AsString := Trim( msk_nr_cntr.Text )
    else
      qry_soma_fat_.ParamByName('NR_CNTR').AsString := '';
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
       ( Trim( msk_cd_produto.Text ) <> '' ) and
       ( Trim( msk_nr_processo2.Text ) <> '' ) then
      qry_soma_fat_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                           Trim( msk_cd_produto.Text ) +
                                                           Trim( msk_nr_processo2.Text )
    else
      qry_soma_fat_.ParamByName('NR_PROCESSO').AsString := '';
    qry_soma_fat_.Prepare;
    qry_soma_fat_.Open;
  end;
end;

procedure Tdatm_dem_fat.qry_lista_cntr_AfterScroll(DataSet: TDataSet);
begin
  with frm_dem_fat do
  begin
    qry_fat_cntr_.Close;
    qry_fat_cntr_.ParamByName('CD_UNID_NEG').AsString := qry_lista_cntr_CD_UNID_NEG.AsString;
    qry_fat_cntr_.ParamByName('NR_FATURA').AsString   := qry_lista_cntr_NR_FATURA.AsString;
    qry_fat_cntr_.ParamByName('NR_CNTR').AsString     := qry_lista_cntr_NR_CNTR.AsString;
    qry_fat_cntr_.ParamByName('NR_PROCESSO').AsString := qry_lista_cntr_NR_PROCESSO.AsString;
    qry_fat_cntr_.ParamByName('NR_PERIODO').AsString  := qry_lista_cntr_NR_PERIODO.AsString;
    qry_fat_cntr_.Prepare;
    qry_fat_cntr_.Open;

    qry_soma_fat_cntr_.Close;
    qry_soma_fat_cntr_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    if ( Trim( msk_nr_fatura.Text ) <> '' ) then
      qry_soma_fat_cntr_.ParamByName('NR_FATURA').AsString := Trim( msk_nr_fatura.Text )
    else
      qry_soma_fat_cntr_.ParamByName('NR_FATURA').AsString := '';
    if ( Trim( msk_nr_cntr.Text ) <> '' ) then
      qry_soma_fat_cntr_.ParamByName('NR_CNTR').AsString := Trim( msk_nr_cntr.Text )
    else
      qry_soma_fat_cntr_.ParamByName('NR_CNTR').AsString := '';
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
       ( Trim( msk_cd_produto.Text ) <> '' ) and
       ( Trim( msk_nr_processo2.Text ) <> '' ) then
      qry_soma_fat_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                                Trim( msk_cd_produto.Text ) +
                                                                Trim( msk_nr_processo2.Text )
    else
      qry_soma_fat_cntr_.ParamByName('NR_PROCESSO').AsString := '';
    qry_soma_fat_cntr_.Prepare;
    qry_soma_fat_cntr_.Open;
  end;
end;

procedure Tdatm_dem_fat.qry_fat_AfterPost(DataSet: TDataSet);
begin
  with frm_dem_fat do
  begin
    if Trim( dbedt_nr_fat.Text ) <> '' then
    begin
      msk_nr_fatura.Text := qry_fat_NR_FATURA.AsString;
    end;
  end;
end;

procedure Tdatm_dem_fat.qry_fat_cntr_AfterPost(DataSet: TDataSet);
begin
  with frm_dem_fat do
  begin
    if Trim( dbedt_nr_fat_cntr.Text ) <> '' then
    begin
      msk_nr_fatura.Text := qry_fat_cntr_NR_FATURA.AsString;
      var_nr_fatura := '';
      VerFatura;
    end;
  end;
end;

end.
