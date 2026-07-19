(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM269.PAS - frm_instrucao_embarque

AUTOR: José Roberto

DATA: 10/09/02

Titulo: Itens de Cubagem


********************************************************************************)


unit uEmissaoRemessa;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls,
  Menus,DB, ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, jpeg, ppParameter, ConsOnLineEx;

type
  Tfrm_emissao_remessa = class(TForm)
    pgctrl_emissao_remessa: TPageControl;
    ts_lista: TTabSheet;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    DBGrid1: TDBGrid;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_remeter: TSpeedButton;
    ts_dados_basicos: TTabSheet;
    DBGrid2: TDBGrid;
    rdgrp_tp_remessa: TRadioGroup;
    mi_remeter: TMenuItem;
    ppDesigner1: TppDesigner;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lb_vl_moeda: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lb_dt_remessa: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    dbedt_vl_moeda: TDBEdit;
    DBEdit9: TDBEdit;
    dbedt_dt_emissao: TDBEdit;
    dbedt_nr_contrato: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    HeaderBand1: TppHeaderBand;
    ppReport1Label2: TppLabel;
    Shape1: TppShape;
    ppReport1Shape7: TppShape;
    ppReport1DBText4: TppDBText;
    ppReport1DBText1: TppDBText;
    ppReport1Shape12: TppShape;
    ppReport1Shape11: TppShape;
    ppReport1Shape10: TppShape;
    ppReport1Shape9: TppShape;
    ppReport1Label5: TppLabel;
    ppReport1Label10: TppLabel;
    ppReport1DBText11: TppDBText;
    ppReport1Label4: TppLabel;
    ppdb1: TppDBText;
    ppImage1: TppImage;
    ppShape1: TppShape;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppShape4: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    DetailBand1: TppDetailBand;
    Shape13: TppShape;
    Shape14: TppShape;
    Shape15: TppShape;
    Shape16: TppShape;
    Shape17: TppShape;
    Shape18: TppShape;
    ppDBText1: TppDBText;
    ppDBText13: TppDBText;
    ppDBText26: TppDBText;
    ppDBText38: TppDBText;
    ppDBText51: TppDBText;
    ppShape2: TppShape;
    ppDBText66: TppDBText;
    ppDBText82: TppDBText;
    ppShape5: TppShape;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppReport1Shape6: TppShape;
    ppReport1Label14: TppLabel;
    ppReport1Label11: TppLabel;
    ppReport1Memo1: TppMemo;
    DBText2: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    DBText3: TppDBText;
    DBText4: TppDBText;
    DBText5: TppDBText;
    DBText6: TppDBText;
    DBText1: TppDBText;
    DBText7: TppDBText;
    ppDBText50: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppLine1: TppLine;
    ppDBText8: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape3: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLine2: TppLine;
    ppLine3: TppLine;
    Label1: TLabel;
    edt_chave: TEdit;
    Label2: TLabel;
    cb_ordem: TComboBox;
    shp1: TShape;
    procedure dbedt_vl_moedaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgrp_tp_remessaClick(Sender: TObject);
    procedure pgctrl_emissao_remessaChange(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_remeterClick(Sender: TObject);
    procedure pgctrl_emissao_remessaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_salvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    a_str_indices : Array[0..2] Of String[15]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    function VerAlt: Boolean;
    function consiste: Boolean;
    function Grava    : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    { Private declarations }
  public
    lCons_OnLine      : Boolean;
    Cons_OnLine       : TStringField;
    Cons_OnLine_Texto : real;
    { Public declarations }
  end;

var
  frm_emissao_remessa: Tfrm_emissao_remessa;

implementation

uses dEmissaoRemessa, GSMLIB, PGGP017, PGGP001, PGSM990;

{$R *.DFM}

procedure Tfrm_emissao_remessa.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;


function Tfrm_emissao_remessa.Grava: Boolean;
begin
 try
   datm_main.db_broker.StartTransaction;
   if ( datm_emissao_remessa.qry_remessa_.State in [dsEdit] ) then
      datm_emissao_remessa.qry_remessa_.Post;
   datm_main.db_broker.Commit;
   Grava := True;
   except
    on E: Exception do
      begin
       if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
       datm_emissao_remessa.qry_remessa_.Cancel;
       TrataErro(E);
       Grava := False;
      end;
    end;
    btn_mi(st_incluir,false, false, st_excluir);
end;

function Tfrm_emissao_remessa.consiste: Boolean;
begin

end;

function Tfrm_emissao_remessa.VerAlt: Boolean;
begin
 VerAlt := True;
  if ( ( datm_emissao_remessa.qry_remessa_.State in [dsEdit] ) and st_modificar ) or
     ( datm_emissao_remessa.qry_remessa_.State in [dsInsert] ) then
    begin
    if BoxMensagem('O valor da Moeda foi alterado' + #13#10 +
       'Deseja salvar a alteração?', 1) then
    begin
     if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;





end;


procedure Tfrm_emissao_remessa.dbedt_vl_moedaChange(Sender: TObject);
begin
if datm_emissao_remessa.qry_remessa_.State in[dsEdit] then
     btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_emissao_remessa.FormCreate(Sender: TObject);
begin
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_emissao_remessa, datm_emissao_remessa);

  with datm_emissao_remessa do
  begin
   qry_remessa_.Close;
   qry_remessa_.Sql[6] := ' WHERE TR.IN_EMISSAO = "0"';
   qry_remessa_.Prepare;
   qry_remessa_.Open;
  end;

  pgctrl_emissao_remessa.ActivePage:=ts_lista;
  a_str_indices[0] := 'NR_REMESSA';
  a_str_indices[1] := 'NM_AGENTE';
  a_str_indices[2] := 'AP_MOEDA';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Remessa');
    Items.Add('Agente');
    Items.Add('Moeda');
    ItemIndex := 0;
  end;

end;

procedure Tfrm_emissao_remessa.rdgrp_tp_remessaClick(Sender: TObject);
begin

   datm_emissao_remessa.qry_remessa_.Close;

   if rdgrp_tp_remessa.ItemIndex = 0 then
     datm_emissao_remessa.qry_remessa_.Sql[6] := ' WHERE TR.IN_EMISSAO = "0"';

   if rdgrp_tp_remessa.ItemIndex = 1 then
     datm_emissao_remessa.qry_remessa_.Sql[6] := ' WHERE TR.IN_EMISSAO = "1"';

    if rdgrp_tp_remessa.ItemIndex = 2 then
     datm_emissao_remessa.qry_remessa_.Sql[6] := ' WHERE TR.IN_EMISSAO IN("0","1") ';

   datm_emissao_remessa.qry_remessa_.Prepare;
   datm_emissao_remessa.qry_remessa_.Open;

end;

procedure Tfrm_emissao_remessa.pgctrl_emissao_remessaChange(Sender: TObject);
begin

  if pgctrl_emissao_remessa.ActivePage = ts_lista then
    begin
    edt_chave.Enabled:=true;
    cb_ordem.Enabled:=true;
    rdgrp_tp_remessa.Enabled:=true;
    btn_remeter.Enabled:=true;
    mi_remeter.Enabled:=true;
    end
  else
    begin
     edt_chave.Enabled:=false;
     cb_ordem.Enabled:=false;
     rdgrp_tp_remessa.Enabled:=false;
     btn_remeter.Enabled:=false;
     mi_remeter.Enabled:=false;
     
     datm_emissao_remessa.qry_processo_.Close;
     datm_emissao_remessa.qry_processo_.ParamByName('NR_REMESSA').AsString :=datm_emissao_remessa.qry_remessa_NR_REMESSA.AsString;
     datm_emissao_remessa.qry_processo_.Prepare;
     datm_emissao_remessa.qry_processo_.Open;

    end;
end;

procedure Tfrm_emissao_remessa.cb_ordemChange(Sender: TObject);
begin
    Pesquisa := datm_emissao_remessa.qry_remessa_NR_REMESSA.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    datm_emissao_remessa.qry_remessa_.Close;
    datm_emissao_remessa.qry_remessa_.SQL[9] := a_str_indices[cb_ordem.ItemIndex];
    datm_emissao_remessa.qry_remessa_.Prepare;
    datm_emissao_remessa.qry_remessa_.Open;
    Localiza(datm_emissao_remessa.qry_remessa_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
end;

procedure Tfrm_emissao_remessa.edt_chaveChange(Sender: TObject);
begin
 Localiza (datm_emissao_remessa.qry_remessa_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_emissao_remessa.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_emissao_remessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
datm_emissao_remessa.qry_remessa_.Close;
datm_emissao_remessa.Free;
end;

procedure Tfrm_emissao_remessa.btn_cancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure Tfrm_emissao_remessa.Cancelar;
begin
 if datm_emissao_remessa.qry_remessa_.State in [dsEdit] then
   datm_emissao_remessa.qry_remessa_.Cancel;
 btn_mi(st_incluir,false,false,st_excluir);

end;

procedure Tfrm_emissao_remessa.btn_remeterClick(Sender: TObject);
begin
  if datm_emissao_remessa.qry_remessa_IN_EMISSAO.AsString = '1' then
  begin
    BoxMensagem('Esta Remessa já foi remetida!',2);
    Exit;
  end;

  datm_emissao_remessa.qry_processo_.Close;
  datm_emissao_remessa.qry_processo_.ParamByName('NR_REMESSA').AsString :=datm_emissao_remessa.qry_remessa_NR_REMESSA.AsString;
  datm_emissao_remessa.qry_processo_.Prepare;
  datm_emissao_remessa.qry_processo_.Open;

  if  datm_emissao_remessa.qry_processo_.recordcount = 0 then
  begin
    BoxMensagem('Não Existe processos!',2);
    Exit;
  end;

  if not(datm_emissao_remessa.qry_remessa_.State in [dsEdit]) then
    datm_emissao_remessa.qry_remessa_.Edit;
  datm_emissao_remessa.qry_remessa_IN_EMISSAO.AsString:='1';
  datm_emissao_remessa.qry_remessa_DT_ENVIO_REMESSA.AsDateTime:= dt_server;
  datm_emissao_remessa.qry_remessa_.Post;

  with datm_emissao_remessa do
  begin
    CloseStoredProc(sp_distribui_remessa_AG);
    sp_distribui_remessa_AG.ParamByName('@dt_movimento').AsDatetime:= dt_server;
    sp_distribui_remessa_AG.ParamByName('@nr_remessa').AsString    := qry_remessa_NR_REMESSA.AsString;
    sp_distribui_remessa_AG.ParamByName('@cd_agente').AsString     := qry_remessa_CD_AGENTE.AsString;
    sp_distribui_remessa_AG.ParamByName('@vl_banco').AsFloat       := qry_remessa_VL_BANCO.AsFloat / qry_processo_.RecordCount;
    sp_distribui_remessa_AG.ParamByName('@cd_banco').AsString      := qry_remessa_CD_BANCO.AsString;
    sp_distribui_remessa_AG.ParamByName('@vl_taxa').AsFloat        := qry_remessa_VL_MOEDA.AsFloat;
    ExecStoredProc( sp_distribui_remessa_AG );
    CloseStoredProc( sp_distribui_remessa_AG );
  end;
  datm_emissao_remessa.qry_remessa_.Close;
  datm_emissao_remessa.qry_remessa_.Prepare;
  datm_emissao_remessa.qry_remessa_.Open;

  BoxMensagem('Remessa finalizada com Sucesso!',3);
end;

procedure Tfrm_emissao_remessa.pgctrl_emissao_remessaChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_emissao_remessa.btn_salvarClick(Sender: TObject);
begin
  if not Grava then exit;
end;

procedure Tfrm_emissao_remessa.SpeedButton1Click(Sender: TObject);
begin
  with datm_emissao_remessa do
  begin
    qryRelER.close;
    qryRelER.ParamByname('NR_REMESSA').AsString := qry_remessa_NR_REMESSA.asString;
    qryRelER.Prepare;
    qryRelER.Open;
    if qryRelER.IsEmpty then
      ShowMessage('Não há dados para Exibir!')
    else begin
      qryRelERTotal.close;
      qryRelERTotal.ParamByname('NR_REMESSA').AsString := qry_remessa_NR_REMESSA.asString;
      qryRelERTotal.Prepare;
      qryRelERTotal.Open;
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      Frm_impressao.cd_unid_neg   := ConsultaLookUPSQL('SELECT TOP 1 SUBSTRING(NR_PROCESSO, 1, 2) AS UNIDADE FROM TREMESSA_PROCESSO WHERE NR_REMESSA = "' + qry_remessa_NR_REMESSA.AsString + '" ', 'Unidade');
      Frm_impressao.cd_modulo     := '3805';
      Frm_impressao.ShowModal;
    end;
  end;

end;

procedure Tfrm_emissao_remessa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_emissao_remessa.FormShow(Sender: TObject);
begin
  shp1.Brush.Color := clPnlClaroBroker;
  pnl_manut_proc.Color := clMenuBroker;
end;

end.





