unit uConsFrete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Grids, DBGrids, StdCtrls;

type
  Tfrm_cons_frete = class(TForm)
    btn_incluir: TButton;
    btn_sair: TButton;
    qry_pes_frete_: TQuery;
    ds_pesq_frete: TDataSource;
    qry_pes_frete_CD_TAB_FRETE: TStringField;
    qry_pes_frete_DESC_TAB_FRETE: TStringField;
    qry_pes_frete_CD_AGENTE_TAB_FRETE: TStringField;
    qry_pes_frete_CD_CIA_TRANSP_TAB_FRETE: TStringField;
    qry_pes_frete_CD_ARMADOR: TStringField;
    qry_pes_frete_NM_AGENTE: TStringField;
    qry_pes_frete_NM_CIA_TRANSP: TStringField;
    qry_pes_frete_NM_ARMADOR: TStringField;
    pnl_aereo: TPanel;
    dbgrid_tarifa_aerea: TDBGrid;
    qry_tarifas_: TQuery;
    ds_tarifas: TDataSource;
    qry_tarifas_PESO_TAB_FRETE: TFloatField;
    qry_tarifas_VOLUME_TAB_FRETE: TStringField;
    qry_tarifas_TTIPO_SIMBOLO_TAB_FRETE: TStringField;
    qry_tarifas_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_tarifas_VL_VENDA_TAB_FRETE: TFloatField;
    qry_tarifas_VL_COMPRA_CIA_ARMADOR: TFloatField;
    qry_tarifas_TP_FRETE: TStringField;
    dbgrid_despesa_aerea: TDBGrid;
    qry_despesa_: TQuery;
    ds_despesa: TDataSource;
    qry_despesa_CD_ITEM: TStringField;
    qry_despesa_TP_BASE_CALCULO: TStringField;
    qry_despesa_CD_MOEDA: TStringField;
    qry_despesa_TP_ORIGEM_DESPESA: TStringField;
    qry_despesa_VL_BASE_DESPESA: TFloatField;
    qry_despesa_VL_COMPRA_AG: TFloatField;
    qry_despesa_VL_COMPRA_CIA: TFloatField;
    qry_despesa_IN_DESPESA: TStringField;
    qry_despesa_TP_FRETE: TStringField;
    qry_despesa_TP_ESTUFAGEM: TStringField;
    qry_despesa_NM_ITEM: TStringField;
    qry_despesa_NM_BASE_CALC: TStringField;
    qry_despesa_NM_MOEDA: TStringField;
    qry_despesa_NM_ORIGEM_DESP: TStringField;
    qry_despesa_IN_NM_DESPESA: TStringField;
    ds_tarifa_FCL: TDataSource;
    qry_tarifa_FCL_: TQuery;
    qry_tarifa_FCL_CD_TAB_FRETE: TStringField;
    qry_tarifa_FCL_CD_ITEM_TAB_FRETE: TStringField;
    qry_tarifa_FCL_VOLUME_TAB_FRETE: TStringField;
    qry_tarifa_FCL_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_tarifa_FCL_VL_VENDA_TAB_FRETE: TFloatField;
    qry_tarifa_FCL_VL_COMPRA_CIA_ARMADOR: TFloatField;
    qry_tarifa_FCL_TP_FRETE: TStringField;
    qry_tarifa_FCL_CD_TAB_REF: TStringField;
    qry_despesa_calc_tp_estufagem: TStringField;
    pnl_maritima: TPanel;
    dbgrid_tarifa_lcl: TDBGrid;
    dbgrid_despesas_maritima: TDBGrid;
    dbgrid_tarifa_fcl: TDBGrid;
    pnl_principal: TPanel;
    dbgrid_resultado: TDBGrid;
    qry_despesa_VL_VENDA: TFloatField;
    qry_tarifa_FCL_NM_CNTR: TStringField;
    qry_tarifas_SIMBOLO_FRETE: TStringField;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qry_pes_frete_CD_MOEDA_TAB_FRETE: TStringField;
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrid_resultadoDblClick(Sender: TObject);
    procedure qry_despesa_CalcFields(DataSet: TDataSet);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgrupo_tp_freteClick(Sender: TObject);
  private
    procedure AbreQry_Pes_Frete;
    { Private declarations }
  public
    { Public declarations }
    ConsOnLine:Boolean;
    Mod_pes,via_transp,tp_frete, Tab_frete, tp_estufagem:string;
    origem, destino, st_rotina:string;
    CodArmador, codigo, cd_tab_frete, cd_moeda:string;
  end;

var
  frm_cons_frete: Tfrm_cons_frete;

implementation

{$R *.DFM}

procedure Tfrm_cons_frete.btn_sairClick(Sender: TObject);
begin
  if pnl_maritima.Visible then begin
     pnl_maritima.Visible:=false;
     pnl_principal.Visible:=true;
     exit;
  end;
  if pnl_aereo.Visible then  begin
     pnl_aereo.Visible:=false;
     pnl_principal.Visible:=true;
     exit;
  end;
  tab_frete:='';
  Close;
end;

procedure Tfrm_cons_frete.AbreQry_Pes_Frete;
begin
  qry_pes_frete_.Close;
  qry_pes_frete_.ParamByName('CD_ORIGEM').AsString     := Origem;
  qry_pes_frete_.ParamByName('CD_DESTINO').AsString    := Destino;
  qry_pes_frete_.ParamByName('CD_VIA_TRANSP').AsString := Via_transp;
  qry_pes_frete_.ParamByName('TP_FRETE').AsString      := '1';

  if cd_moeda <>'' then
    qry_pes_frete_.Sql[10]:=' AND TT.CD_MOEDA_TAB_FRETE = '+ Quotedstr(cd_moeda);

  if mod_pes = 'I' then begin //importação
    if codigo <> '' then
      qry_pes_frete_.Sql[8]:=' AND TT.CD_AGENTE_TAB_FRETE = '+ Quotedstr(codigo);

    if cd_tab_frete <> '' then
      qry_pes_frete_.Sql[9]:=' AND TT.CD_TAB_FRETE = '+ Quotedstr(cd_tab_frete);

    if cd_tab_frete <> '' then
      qry_pes_frete_.Sql[9]:=' AND TT.CD_TAB_FRETE = '+ Quotedstr(cd_tab_frete);

  end;

  if mod_pes = 'E' then begin //exportação

      if Codigo <> '' then
        qry_pes_frete_.Sql[8]:=' AND TT.CD_AGENTE_TAB_FRETE = '+ Quotedstr(codigo);

      if cd_tab_frete <>'' then
        qry_pes_frete_.Sql[9]:=' AND TT.CD_TAB_FRETE = '+ Quotedstr(cd_tab_frete);

  end;
  qry_pes_frete_.Prepare;
  qry_pes_frete_.Open;
end;

procedure Tfrm_cons_frete.FormShow(Sender: TObject);
begin
  AbreQry_Pes_Frete;
end;

procedure Tfrm_cons_frete.dbgrid_resultadoDblClick(Sender: TObject);

begin
   if tp_estufagem='0' then  begin //lcl
      dbgrid_tarifa_fcl.Visible:=false;
      dbgrid_tarifa_lcl.Visible:=True;
   end else begin //fcl
      dbgrid_tarifa_lcl.Visible:=false;
      dbgrid_tarifa_fcl.Visible:=true;
   end;



   if via_transp = '04'then begin //aereo
      dbgrid_tarifa_aerea.Columns.Items[2].Visible:=false;
      dbgrid_tarifa_aerea.Columns.Items[3].Visible:=true;
      dbgrid_tarifa_aerea.Columns.Items[4].Visible:=false;

      dbgrid_despesa_aerea.Columns.Items[3].Visible:=true;
      dbgrid_despesa_aerea.Columns.Items[4].Visible:=false;
      dbgrid_despesa_aerea.Columns.Items[5].Visible:=false;

      qry_tarifas_.close;
      qry_tarifas_.ParamByName('CD_TAB_FRETE').AsString:= qry_pes_frete_CD_TAB_FRETE.AsString;
      qry_tarifas_.Prepare;
      qry_tarifas_.Open;

      qry_despesa_.close;
      qry_despesa_.ParamByName('CD_TAB_FRETE').AsString:= qry_pes_frete_CD_TAB_FRETE.AsString;
      qry_despesa_.Prepare;
      qry_despesa_.Open;

      pnl_principal.Visible:=false;
      pnl_aereo.Visible    :=true;
      pnl_maritima.Visible :=false;

   end;

   if via_transp = '01' then begin //maritimo
      dbgrid_tarifa_lcl.Columns.Items[1].Visible:=false;
      dbgrid_tarifa_lcl.Columns.Items[2].Visible:=true;
      dbgrid_tarifa_lcl.Columns.Items[3].Visible:=false;

      dbgrid_tarifa_fcl.Columns.Items[1].Visible:=false;
      dbgrid_tarifa_fcl.Columns.Items[2].Visible:=true;
      dbgrid_tarifa_fcl.Columns.Items[3].Visible:=false;
      dbgrid_despesas_maritima.Columns.Items[5].Visible:=false;
      dbgrid_despesas_maritima.Columns.Items[4].Visible:=true;
      dbgrid_despesas_maritima.Columns.Items[6].Visible:=false;

      qry_tarifas_.close;
      qry_tarifas_.ParamByName('CD_TAB_FRETE').AsString:= qry_pes_frete_CD_TAB_FRETE.AsString;
      qry_tarifas_.Prepare;
      qry_tarifas_.Open;

      qry_tarifa_FCL_.close;
      qry_tarifa_FCL_.ParamByName('CD_TAB_FRETE').AsString:= qry_pes_frete_CD_TAB_FRETE.AsString;
      qry_tarifa_FCL_.Prepare;
      qry_tarifa_FCL_.Open;

      qry_despesa_.close;
      qry_despesa_.ParamByName('CD_TAB_FRETE').AsString:= qry_pes_frete_CD_TAB_FRETE.AsString;
      qry_despesa_.ParamByName('TP_ESTUFAGEM').AsString:= tp_estufagem;
      qry_despesa_.Prepare;
      qry_despesa_.Open;

      pnl_principal.Visible:=false;
      pnl_aereo.Visible    :=false;
      pnl_maritima.Visible :=true;
   end;


end;

procedure Tfrm_cons_frete.qry_despesa_CalcFields(DataSet: TDataSet);
begin
 if qry_despesa_TP_ESTUFAGEM.AsString='1' then
      qry_despesa_calc_tp_estufagem.AsString:='FCL'
  else qry_despesa_calc_tp_estufagem.AsString:='LCL/Break Bulk';
end;

procedure Tfrm_cons_frete.btn_incluirClick(Sender: TObject);
begin
 tab_frete:=qry_pes_frete_CD_TAB_FRETE.AsString;
 dbgrid_resultadoDblClick(sender);
// qry_pes_frete_.close;
 Close;
end;

procedure Tfrm_cons_frete.FormCreate(Sender: TObject);
begin
  cd_tab_frete:='';
end;

procedure Tfrm_cons_frete.rdgrupo_tp_freteClick(Sender: TObject);
begin
  AbreQry_Pes_Frete;
end;

end.
