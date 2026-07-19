(*************************************************************************************************

Sistema: DD Broker Cargo - Bysoft

PROGRAMA: PGSM318.PAS - Solicitação de Faturamento - frm_proc_iata

AUTOR: BYSOFT

DATA: dd/mm/yyyy

Manutenção: J.Roberto

Data: 09/12/2003

*************************************************************************************************)
unit uProcIata;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, Menus, DBCtrls, Buttons, ExtCtrls,Db, DBTables,
  ComCtrls;

type
  Tfrm_proc_iata = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_desmarca: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_Salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    btn_marcar: TSpeedButton;
    btn_pesq: TSpeedButton;
    mi_marca: TMenuItem;
    mi_desmarca: TMenuItem;
    Pesquisar1: TMenuItem;
    btn_imprimir: TSpeedButton;
    btn_solic_fat: TSpeedButton;
    edt_nm_unid_pesq: TEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    edt_nm_produto: TEdit;
    SpeedButton2: TSpeedButton;
    msk_unid_pesq: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    pgctrl_proc: TPageControl;
    ts_iata: TTabSheet;
    ts_lista_maritima: TTabSheet;
    ts_dados_maritimo: TTabSheet;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label7: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    dbedt_vl_com_real: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ts_montado: TTabSheet;
    dbgrdProcIata: TDBGrid;
    Panel2: TPanel;
    btn_co_cia: TSpeedButton;
    lb_cia: TLabel;
    lb_periodo: TLabel;
    lb_ate: TLabel;
    edt_nm_cia: TEdit;
    msk_cd_cia: TMaskEdit;
    msk_dt_inicio: TMaskEdit;
    msk_dt_fim: TMaskEdit;
    edt_vl_tt_sel: TEdit;
    Label8: TLabel;
    pnl_pagto_cia: TPanel;
    Panel5: TPanel;
    grbx_pagto_cia: TGroupBox;
    Label13: TLabel;
    btn_co_banco: TSpeedButton;
    rdgp_destino: TRadioGroup;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    Button1: TButton;
    Button2: TButton;
    msk_dt_vencto: TMaskEdit;
    msk_nr_docto: TMaskEdit;
    Bevel1: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    pgctrl_montado: TPageControl;
    ts_pendente: TTabSheet;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    msk_cd_banco2: TMaskEdit;
    Label16: TLabel;
    edt_nm_banco2: TEdit;
    SpeedButton3: TSpeedButton;
    msk_dt_receb1: TMaskEdit;
    Label17: TLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    msk_cia2: TMaskEdit;
    Label18: TLabel;
    edt_nm_cia2: TEdit;
    btn_co_cia2: TSpeedButton;
    Label19: TLabel;
    msk_dt_montagem1: TMaskEdit;
    Bevel2: TBevel;
    SpeedButton4: TSpeedButton;
    Imprimir1: TMenuItem;
    Previex1: TMenuItem;
    Relatrio1: TMenuItem;
    Label20: TLabel;
    edt_vl_tt_ir: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure msk_unid_pesqExit(Sender: TObject);
    procedure btn_pesqClick(Sender: TObject);
    procedure msk_cd_ciaExit(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_marcarClick(Sender: TObject);
    procedure btn_desmarcaClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_procChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbedt_vl_com_realChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure abre_lista_maritima;
    procedure dbgrdProcIataCellClick(Column: TColumn);
    procedure SaveBoolean();
    procedure dbgrdProcIataDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btn_solic_fatClick(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rdgp_destinoClick(Sender: TObject);
    procedure exec_rebto_iata;
    procedure msk_cia2Exit(Sender: TObject);
    procedure msk_dt_montagem1Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure msk_cd_banco2Exit(Sender: TObject);
    procedure btn_co_ciaClick(Sender: TObject);
    procedure btn_co_cia2Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
    function verifica_nr_relatorio:Boolean;
    procedure Previex1Click(Sender: TObject);
    procedure sp_fat_relatorio(ref, relatorio:String; Operacao:Pchar);
  private
    { Private declarations }
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    { Public declarations }
    cd_via_transp:String[2];
  end;

var
  frm_proc_iata: Tfrm_proc_iata;
  FOriginalOptions : TDBGridOptions;
  NR_FATURA :String;


implementation

uses PGGP001, ConsOnLineEx, PGGP017, PGSM019, PGSM990, GSMLIB, Funcoes,
  dProcIata;

{$R *.DFM}

procedure Tfrm_proc_iata.FormCreate(Sender: TObject);
begin

//  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_proc_iata, datm_proc_iata);

  with datm_proc_iata do
   begin
   qry_traz_default_.Close;
   qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
   qry_traz_default_.Open;


   msk_unid_pesq.text    := qry_traz_default_CD_UNID_NEG.AsString;
   edt_nm_unid_pesq.text := qry_traz_default_NM_UNID_NEG.AsString;


   msk_cd_produto.text   := qry_traz_default_CD_PRODUTO.AsString;
   edt_nm_produto.text   := qry_traz_default_NM_PRODUTO.AsString;

   msk_dt_montagem1.text   := datetimetostr(dt_server);
  end;

end;

procedure Tfrm_proc_iata.SpeedButton1Click(Sender: TObject);
begin
 Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );


 msk_unid_pesqExit(Sender);

end;

procedure Tfrm_proc_iata.msk_unid_pesqExit(Sender: TObject);
begin
 if msk_unid_pesq.Text <> '' then
  begin
    ValCodEdt( msk_unid_pesq );
    datm_proc_iata.qry_pesquisa_.Active:=false;
    datm_proc_iata.qry_pesquisa_.Sql.Clear;
    datm_proc_iata.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'"');
    datm_proc_iata.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_proc_iata.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_proc_iata.qry_pesquisa_.Active:=true;
    if datm_proc_iata.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_unid_pesq.text:= datm_proc_iata.qry_pesquisa_.Fields[0].AsString;
          datm_proc_iata.qry_pesquisa_.Close;
          abre_lista_maritima
        end
        else
        begin
          datm_proc_iata.qry_pesquisa_.Close;
          edt_nm_unid_pesq.Text := '';
          BoxMensagem('Código da Unidade de Negócio inválido!', 2);
          msk_unid_pesq.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('A Unidade de Negócio deve ser informado!',2);
      msk_unid_pesq.SetFocus;
     end;

end;

procedure Tfrm_proc_iata.btn_pesqClick(Sender: TObject);
begin
 datm_proc_iata.vl_tt_frete  := 0 ;
 datm_proc_iata.vl_tt_ir     := 0 ;
 edt_vl_tt_ir.text := Formatfloat('0.00',0);
 datm_proc_iata.qry_lista_cia_.Close;
 datm_proc_iata.qry_lista_cia_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
 datm_proc_iata.qry_lista_cia_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
 datm_proc_iata.qry_lista_cia_.ParamByName('CD_CIA').AsString      := msk_cd_cia.text;
 datm_proc_iata.qry_lista_cia_.ParamByName('DT_INICIO').AsString   := msk_dt_inicio.text;
 datm_proc_iata.qry_lista_cia_.ParamByName('DT_FIM').AsString      := msk_dt_fim.text;
 datm_proc_iata.qry_lista_cia_.Prepare;
 datm_proc_iata.qry_lista_cia_.Open;
 edt_vl_tt_sel.text := Formatfloat('0.00',datm_proc_iata.vl_tt_frete);

 if (datm_proc_iata.vl_tt_ir >= datm_proc_iata.qry_param_VL_MIN_IR.AsFloat) or
     (datm_proc_iata.qry_lista_cia_IN_IRRF_MIN.AsString = '1') then
   edt_vl_tt_ir.text := Formatfloat('0.00',datm_proc_iata.vl_tt_ir);



 //dbgrdProcIata.
// dbgrdProcIata.SelectedIndex :=  2;
end;

procedure Tfrm_proc_iata.msk_cd_ciaExit(Sender: TObject);
begin
 if msk_cd_cia.Text <> '' then
  begin
    ValCodEdt( msk_cd_cia );
    datm_proc_iata.qry_pesquisa_.Active:=false;
    datm_proc_iata.qry_pesquisa_.Sql.Clear;
    datm_proc_iata.qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL ');
    datm_proc_iata.qry_pesquisa_.Sql.Add(' WHERE CODIGO = "'+msk_cd_cia.text+'" AND TP_TRANSPORTADOR = "0" ');
    datm_proc_iata.qry_pesquisa_.Active:=true;
    if datm_proc_iata.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_cia.text:= datm_proc_iata.qry_pesquisa_.Fields[0].AsString;
          datm_proc_iata.qry_pesquisa_.Close;
        end
        else
        begin
          datm_proc_iata.qry_pesquisa_.Close;
          edt_nm_cia.Text := '';
          BoxMensagem('Código da Companhia inválido!', 2);
          msk_cd_cia.SetFocus;
          Exit;
        end;
    end;

end;

procedure Tfrm_proc_iata.btn_sairClick(Sender: TObject);
begin
datm_proc_iata.qry_lista_cia_.Close;
datm_proc_iata.Free;
close
end;

procedure Tfrm_proc_iata.btn_marcarClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marcar.Visible         := False;
  mi_marca.Visible           := False;
  btn_desmarca.Visible       := True;
  mi_desmarca.Visible        := True;
  btn_desmarca.Left          := btn_marcar.Left;
  datm_proc_iata.qry_lista_cia_.First;
  for i := 0 to datm_proc_iata.qry_lista_cia_.RecordCount - 1 do
  begin
    dbgrdProcIata.SelectedRows.CurrentRowSelected := True;
    datm_proc_iata.qry_lista_cia_.Next;
  end;

end;

procedure Tfrm_proc_iata.btn_desmarcaClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marcar.Visible         := True;
  mi_marca.Visible           := True;
  mi_desmarca.Visible        := False;
  btn_desmarca.Visible := False;
  if dbgrdProcIata.SelectedRows.Count > 0 then
     TTable(dbgrdProcIata.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdProcIata.SelectedRows[0]));
  for i := 0 to dbgrdProcIata.SelectedRows.Count - 1 do
  begin
    dbgrdProcIata.SelectedRows.CurrentRowSelected := False;
    if dbgrdProcIata.SelectedRows.Count > 0 then
      TTable(dbgrdProcIata.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdProcIata.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_proc_iata.msk_cd_produtoExit(Sender: TObject);
begin
 if msk_cd_produto.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    datm_proc_iata.qry_pesquisa_.Active:=false;
    datm_proc_iata.qry_pesquisa_.Sql.Clear;
    datm_proc_iata.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    datm_proc_iata.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_proc_iata.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_proc_iata.qry_pesquisa_.Active:=true;
    if datm_proc_iata.qry_pesquisa_.RecordCount > 0 then
        begin
           edt_nm_produto.text:= datm_proc_iata.qry_pesquisa_.Fields[0].AsString;
           datm_proc_iata.qry_pesquisa_.Close;
           abre_lista_maritima
        end
        else
        begin
          datm_proc_iata.qry_pesquisa_.Close;
          edt_nm_produto.Text := '';
          BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
          msk_cd_produto.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('O Produto deve ser informado!',2);
      msk_cd_produto.SetFocus;
     end;                          

end;

procedure Tfrm_proc_iata.SpeedButton2Click(Sender: TObject);

var produto:string[2];
begin
produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO');
 if produto <>'' then
   begin
    msk_cd_produto.text:=produto;
    msk_cd_produtoExit(Sender);
   end;

end;

procedure Tfrm_proc_iata.FormShow(Sender: TObject);
begin
 if cd_via_transp = '04' then
  begin
  ts_lista_maritima.TabVisible := false;
  ts_dados_maritimo.TabVisible := false;
  ts_iata.TAbVisible           := true;
  lb_cia.Caption               := 'Companhia';
  msk_dt_inicio.Visible        := true;
  msk_dt_fim.Visible           := true;
  lb_periodo.Visible           := true;
  lb_ate.Visible               := true;
  msk_dt_inicio.Visible        := true;
  msk_cd_cia.Visible           := true;
  edt_nm_cia.Visible           := true;
  end
 else
  begin
  ts_lista_maritima.TabVisible := true;
  ts_dados_maritimo.TabVisible := true;
  ts_iata.TabVisible           := false;
  lb_cia.Caption               := 'Armador';
  msk_dt_inicio.Visible        := false;
  msk_dt_fim.Visible           := false;
  lb_periodo.Visible           := false;
  lb_ate.Visible               := false;
  msk_dt_inicio.Visible        := false;
  msk_cd_cia.Visible           := false;
  edt_nm_cia.Visible           := false;
  abre_lista_maritima;
 
  end;
end;

procedure Tfrm_proc_iata.pgctrl_procChange(Sender: TObject);
begin
  if pgctrl_proc.ActivePage =  ts_dados_maritimo then
   begin
    datm_proc_iata.qry_house_.Close;
    datm_proc_iata.qry_house_.ParamByName('CD_MASTER').AsString :=datm_proc_iata.qry_lista_armador_CD_MASTER.AsString;
    datm_proc_iata.qry_house_.Prepare;
    datm_proc_iata.qry_house_.Open;
   end;

end;


procedure Tfrm_proc_iata.btn_salvarClick(Sender: TObject);
begin
 if pgctrl_proc.ActivePage =  ts_dados_maritimo then
  begin
   try
    if datm_proc_iata.qry_lista_armador_.State in [dsEdit] then
     begin
      datm_proc_iata.qry_lista_armador_.Post;
      with TQuery.Create(Application) do
       begin
        DataBaseName := 'DBBROKER';
        Sql.Add('UPDATE TPROCESSO SET VL_COMISS_IATA = (VL_OVER * :TOTAL_COMISSAO) / :TOTAL_COMISSAO_MASTER ');
        Sql.Add('  FROM TPROCESSO P, THOUSE H');
        Sql.Add('  WHERE H.CD_MASTER = "'+datm_proc_iata.qry_lista_armador_CD_MASTER.AsString+'"');
        Sql.Add('  AND H.NR_PROCESSO = P.NR_PROCESSO ');
        Params[0].AsFloat := datm_proc_iata.qry_lista_armador_TARIFA_AUX.AsFloat;
        Params[1].AsFloat := datm_proc_iata.qry_lista_armador_VL_COMISSAO.AsFloat;
        ExecSql;
        Free;
       end;
      datm_proc_iata.qry_house_.Close;
      datm_proc_iata.qry_house_.ParamByName('CD_MASTER').AsString :=datm_proc_iata.qry_lista_armador_CD_MASTER.AsString;
      datm_proc_iata.qry_house_.Prepare;
      datm_proc_iata.qry_house_.Open;
     end;
   except
    on E: Exception do
    begin
     if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
     TrataErro(E);
    end;
   end;
 end;
btn_mi(false, false, false, false);
end;

procedure Tfrm_proc_iata.dbedt_vl_com_realChange(Sender: TObject);
begin
  if datm_proc_iata.qry_lista_armador_.State in [dsEdit] then
   btn_mi(false, true, true, false);
end;

procedure Tfrm_proc_iata.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_proc_iata.btn_cancelarClick(Sender: TObject);
begin
 if datm_proc_iata.qry_lista_armador_.State in [dsEdit] then
      datm_proc_iata.qry_lista_armador_.Cancel;
 btn_mi(false, false, false, false);
end;

procedure Tfrm_proc_iata.abre_lista_maritima;
begin
  if cd_via_transp = '01' then
   begin

    datm_proc_iata.qry_lista_armador_.Close;
    datm_proc_iata.qry_lista_armador_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
    datm_proc_iata.qry_lista_armador_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
    datm_proc_iata.qry_lista_armador_.Prepare;
    datm_proc_iata.qry_lista_armador_.Open;

   end;
end;

procedure Tfrm_proc_iata.dbgrdProcIataCellClick(Column: TColumn);
begin
 if dbgrdProcIata.SelectedIndex = 0  then

 //if grid_remessa.SelectedField.DataType = ftBoolean then
     SaveBoolean();

end;

procedure Tfrm_proc_iata.SaveBoolean;
var vl_frete, vl_ir:Real;
    TEMP:Tquery;
begin
 vl_frete := strtofloat(edt_vl_tt_sel.text);
 vl_ir    := datm_proc_iata.vl_tt_ir;

 if not(datm_proc_iata.qry_lista_cia_.State in [dsEdit])then
   datm_proc_iata.qry_lista_cia_.Edit;

 if datm_proc_iata.qry_lista_cia_IN_SEL_IATA.AsString = '0' then
  begin
   datm_proc_iata.qry_lista_cia_IN_SEL_IATA.AsString :='1';
   vl_frete := vl_frete + (datm_proc_iata.qry_lista_cia_calc_tt_prepaid.AsFloat - datm_proc_iata.qry_lista_cia_calc_tt_collect.AsFloat);

   vl_ir    := vl_ir + datm_proc_iata.qry_lista_cia_calc_vl_ir.AsFloat ;

   TEMP := TQuery.Create(application);
   TEMP.DatabaseName := 'DBBROKER';
   TEMP.Sql.Add('  INSERT INTO TTEMP_RELATORIO_IATA(CD_MASTER, CD_USUARIO, VALOR)  ');
   TEMP.Sql.Add('  VALUES (:CD_MASTER, :CD_USUARIO, :VALOR) ');
   TEMP.Params[0].AsString := datm_proc_iata.qry_lista_cia_CD_MASTER.AsString;
   TEMP.Params[1].AsString := str_cd_usuario;
   TEMP.Params[2].AsFloat  := datm_proc_iata.qry_lista_cia_calc_tt_prepaid.AsFloat;
   TEMP.ExecSql;
   TEMP.Free;
  end
 else
  begin
   datm_proc_iata.qry_lista_cia_IN_SEL_IATA.AsString := '0' ;
   vl_frete := vl_frete - (datm_proc_iata.qry_lista_cia_calc_tt_prepaid.AsFloat - datm_proc_iata.qry_lista_cia_calc_tt_collect.AsFloat);
   vl_ir    := vl_ir - datm_proc_iata.qry_lista_cia_calc_vl_ir.AsFloat ;

   TEMP := TQuery.Create(application);
   TEMP.DatabaseName := 'DBBROKER';
   TEMP.Sql.Add('DELETE FROM TTEMP_RELATORIO_IATA WHERE CD_MASTER = "'+datm_proc_iata.qry_lista_cia_CD_MASTER.AsString+'" ');
   TEMP.Sql.Add(' AND CD_USUARIO = "'+str_cd_usuario+'"');
   TEMP.ExecSql;
   TEMP.Free;
  end;

 datm_proc_iata.qry_lista_cia_.Post;
 edt_vl_tt_sel.text := FormatFloat('0.00', vl_frete);
 datm_proc_iata.vl_tt_ir    := vl_ir;

 if (vl_ir >= datm_proc_iata.qry_param_VL_MIN_IR.AsFloat) or
     (datm_proc_iata.qry_lista_cia_IN_IRRF_MIN.AsString = '1') then
    edt_vl_tt_ir.text  := FormatFloat('0.00', vl_ir)
 else
   edt_vl_tt_ir.text  := FormatFloat('0.00', 0);

end;

procedure Tfrm_proc_iata.dbgrdProcIataDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const

 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,

     DFCS_BUTTONCHECK or DFCS_CHECKED);

var

 CheckBoxRectangle : TRect;
 ctrl_booleano :Boolean;

begin

 if  Column.FieldName = 'IN_SEL_IATA' then

// if Column.Field.DataType = ftBoolean then

 begin
 if datm_proc_iata.qry_lista_cia_IN_SEL_IATA.AsString = '0' then
   ctrl_booleano :=false
 else ctrl_booleano:= true;



 dbgrdProcIata.Canvas.FillRect(Rect);

 CheckBoxRectangle.Left := Rect.Left + 0;

 CheckBoxRectangle.Right := Rect.Right - 0;

 CheckBoxRectangle.Top := Rect.Top + 0;

 CheckBoxRectangle.Bottom := Rect.Bottom - 0;

 DrawFrameControl(dbgrdProcIata.Canvas.Handle,

      CheckBoxRectangle,

      DFC_BUTTON,

      CtrlState[ctrl_booleano]);

end;


end;

procedure Tfrm_proc_iata.btn_solic_fatClick(Sender: TObject);

begin

 if not(verifica_nr_relatorio) then Exit;

if strtofloat(edt_vl_tt_sel.text ) > 0 then //pagto para cia aerea
 begin
   with TQuery.Create(application) do
    begin
     DataBaseName := 'DBBROKER';
     Sql.Add('SELECT F.CD_FAVORECIDO FROM TFAVORECIDO F, TTRANSPORTADOR_ITL T');
     Sql.Add(' WHERE T.CODIGO = "'+msk_cd_cia.text+'"');
     Sql.Add(' AND T.CGC_TRANSPORTADOR = F.CGC_EMPRESA ' );
     Open;
      if RecordCount = 0 then
       begin
        Boxmensagem('Não existe um favorecido para esta Cia Aérea.',2);
        Free;
        Exit;
       end;
      Free;
    end;

   msk_cd_banco.Text  := '';
   edt_nm_banco.Text  := '';
   msk_dt_vencto.Text := '';
   msk_nr_docto.Text  := '';
   pnl_pagto_cia.Visible := true;
 end;

 if strtofloat(edt_vl_tt_sel.text ) < 0 then //receb para cia aerea
  begin
    exec_rebto_iata;
  end;
end;

procedure Tfrm_proc_iata.msk_cd_bancoExit(Sender: TObject);
begin
 if msk_cd_banco.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    datm_proc_iata.qry_pesquisa_.Active:=false;
    datm_proc_iata.qry_pesquisa_.Sql.Clear;
    datm_proc_iata.qry_pesquisa_.Sql.Add('SELECT NM_BANCO FROM TBANCO ');
    datm_proc_iata.qry_pesquisa_.Sql.Add(' WHERE CD_BANCO = "'+msk_cd_banco.text+'"  ');
    datm_proc_iata.qry_pesquisa_.Active:=true;
    if datm_proc_iata.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_banco.text:= datm_proc_iata.qry_pesquisa_.Fields[0].AsString;
          datm_proc_iata.qry_pesquisa_.Close;
        end
        else
        begin
          datm_proc_iata.qry_pesquisa_.Close;
          edt_nm_banco.Text := '';
          BoxMensagem('Código do Banco inválido!', 2);
          msk_cd_banco.SetFocus;
          Exit;
        end;
    end;

end;

procedure Tfrm_proc_iata.Button2Click(Sender: TObject);
begin
pnl_pagto_cia.Visible := false;
end;

procedure Tfrm_proc_iata.Button1Click(Sender: TObject);
var
  tp_destino, nr_fatura, nr_ref, nr_relatorio :String;
  Vencto :TDatetime;
begin
 //validações
  if msk_cd_banco.text  = '' then
   begin
    Boxmensagem('Deve ser informado um Banco',2);
    msk_cd_banco.SetFocus;
    Exit;
   end;
 if (rdgp_destino.ItemIndex = 1) and (msk_dt_vencto.text = '  /  /    ') then
  begin
   BoxMensagem('Deve ser informado uma data de Vencimento',2);
   msk_dt_vencto.setfocus;
   Exit;
  end;

 if (rdgp_destino.ItemIndex = 1) and (msk_nr_docto.text = '') then
  begin
   BoxMensagem('Deve ser informado o numero da Fatura',2);
   msk_nr_docto.setfocus;
   Exit;
  end;

 if rdgp_destino.ItemIndex = 0 then
  begin
   Vencto     := DT_server;
   tp_destino := '2';
  end;
 if rdgp_destino.ItemIndex = 1 then
   begin
   Vencto     := strtodatetime(msk_dt_vencto.text);
   tp_destino := '4';
  end;

 if rdgp_destino.ItemIndex = 2 then
   begin
   Vencto     := DT_server;
   tp_destino := '3';
  end;


 try
  datm_main.db_broker.StartTransaction;

  with Datm_proc_iata do
   begin
    if tp_destino <> '3' then
     begin
      qry_ult_ref_.Close;
      qry_ult_ref_.parambyname ('dt_montagem').AsString := datetimetostr(dt_server);
      qry_ult_ref_.Prepare;
      qry_ult_ref_.Open;
     end;

    case strtoint(tp_destino) of
     2: nr_ref := qry_ult_ref_ULT_REF.AsString;
     3: nr_ref := 'C';
     4: nr_ref := qry_ult_ref_ULT_REF.AsString;
     end;

    qry_lista_cia_.First;
    while not(qry_lista_cia_.Eof) do
     begin
      if qry_lista_cia_IN_SEL_IATA.AsString = '1' then
       begin
         nr_fatura := qry_lista_cia_NR_RELATORIO.AsString;
         CloseStoredProc(sp_pagto_cia_aerea);
         sp_pagto_cia_aerea.ParamByName('@cd_master').AsString     := qry_lista_cia_CD_MASTER.AsString;
         sp_pagto_cia_aerea.ParamByName('@tp_destino').AsString    := tp_destino;
         sp_pagto_cia_aerea.ParamByName('@vl_pagto').AsFloat       := qry_lista_cia_FRETE_REAL.AsFloat;
         sp_pagto_cia_aerea.ParamByName('@cd_banco').AsString      := msk_cd_banco.text;
         sp_pagto_cia_aerea.ParamByName('@nr_ref').AsString        := nr_ref;
         sp_pagto_cia_aerea.ParamByName('@peso_master').AsFloat    := qry_lista_cia_VL_PESO_BRUTO.AsFloat;
         sp_pagto_cia_aerea.ParamByName('@cd_cia').AsString        := msk_cd_cia.text;
         sp_pagto_cia_aerea.ParamByName('@dt_vencto').AsDateTime   := Vencto;
         sp_pagto_cia_aerea.ParamByName('@docto').AsString         := msk_nr_docto.text;
         sp_pagto_cia_aerea.ParamByName('@vl_ir_iata').AsFloat     := qry_lista_cia_calc_ir_iata.AsFloat;
         sp_pagto_cia_aerea.ParamByName('@vl_ir_over').AsFloat     := qry_lista_cia_calc_ir_over.AsFloat;
         sp_pagto_cia_aerea.ParamByName('@nr_relatorio').AsString  := qry_lista_cia_NR_RELATORIO.AsString;
         sp_pagto_cia_aerea.ParamByName('@vl_iata').AsFloat        := qry_lista_cia_COM_IATA.AsFloat;
         sp_pagto_cia_aerea.ParamByName('@vl_over').AsFloat        := qry_lista_cia_VL_OVER.AsFloat;
         ExecStoredProc(sp_pagto_cia_aerea);
         CloseStoredProc(sp_pagto_cia_aerea);
         nr_relatorio := qry_lista_cia_NR_RELATORIO.AsString;
         IF not (datm_main.db_broker.InTransaction) then
           BoxMensagem('sp_pagto_cia_aerea',3);
       end;

      qry_lista_cia_.Next;
     end;

    if tp_destino = '4' then
     begin
      CloseStoredProc( sp_monta_pagto_ctapagar );
      sp_monta_pagto_ctapagar.ParamByName('@dt_montagem').AsDateTime := Dt_server;
      sp_monta_pagto_ctapagar.ParamByName('@nr_ref').AsString        := qry_ult_ref_ULT_REF.AsString;
      sp_monta_pagto_ctapagar.ParamByName('@dt_vencto').AsDateTime   := Vencto;
      sp_monta_pagto_ctapagar.ParamByName('@cd_usuario').AsString    := str_cd_usuario;
      sp_monta_pagto_ctapagar.ParamByName('@cd_unid_neg').AsString   := msk_unid_pesq.text;
      sp_monta_pagto_ctapagar.ParamByName('@cd_banco').AsString      := msk_cd_banco.text;
      sp_monta_pagto_ctapagar.ParamByName('@tp_pagto').AsInteger     := 2;
      ExecStoredProc( sp_monta_pagto_ctapagar );
      CloseStoredProc( sp_monta_pagto_ctapagar );
     end;


     sp_fat_relatorio( nr_ref, nr_relatorio, '-');

{    CloseStoredProc( sp_fatura_relatorio_cia );
    sp_fatura_relatorio_cia.ParamByName('@nr_ref').AsString          := nr_ref;
    sp_fatura_relatorio_cia.ParamByName('@dt_movimento').AsDateTime  := dt_server;
    sp_fatura_relatorio_cia.ParamByName('@nr_relatorio').AsString    := nr_relatorio;
    sp_fatura_relatorio_cia.ParamByName('@cd_cia').AsString          := msk_cd_cia.text;;
    sp_fatura_relatorio_cia.ParamByName('@cd_unid_neg').AsString     := msk_unid_pesq.text;
    sp_fatura_relatorio_cia.ParamByName('@cd_produto').AsString      := msk_cd_produto.text;;
    ExecStoredProc( sp_fatura_relatorio_cia );
    CloseStoredProc( sp_fatura_relatorio_cia );}
      IF not (datm_main.db_broker.InTransaction) then
           BoxMensagem('sp_fatura_relatorio_cia',3);

   end;

  datm_main.db_broker.Commit;

pnl_pagto_cia.Visible := false;
Boxmensagem('Operação realizado com Sucesso',3);
datm_proc_iata.qry_lista_cia_.Close;
except
  on E: Exception do
  begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    TrataErro(E);
  end;
end;


end;

procedure Tfrm_proc_iata.rdgp_destinoClick(Sender: TObject);
begin

  if rdgp_destino.ItemIndex = 0 then
   begin
    msk_dt_vencto.Color    := ClMenu;
    msk_nr_docto.Color     := ClMenu;
    msk_dt_vencto.ReadOnly := True;
    msk_nr_docto.ReadOnly  := True;
    msk_dt_vencto.Text     := '';
   msk_nr_docto.Text       := '';
   end
  else
   begin
    msk_dt_vencto.Color    := ClWindow;
    msk_nr_docto.Color     := ClWindow;
    msk_dt_vencto.ReadOnly := False;
    msk_nr_docto.ReadOnly  := False;
   end;

end;

procedure Tfrm_proc_iata.exec_rebto_iata;
var  nr_relatorio:String;
begin
 try
  //datm_main.db_broker.StartTransaction;
  with Datm_proc_iata do
   begin
    qry_ult_ref_receb_.Close;
    qry_ult_ref_receb_.parambyname ('dt_montagem').AsString := datetimetostr(dt_server);
    qry_ult_ref_receb_.Prepare;
    qry_ult_ref_receb_.Open;

    qry_lista_cia_.First;
    while not(qry_lista_cia_.Eof) do
     begin
      if qry_lista_cia_IN_SEL_IATA.AsString = '1' then
       begin
         nr_relatorio :=qry_lista_cia_NR_RELATORIO.AsString;
         CloseStoredProc(sp_receb_cia_aerea);
         sp_receb_cia_aerea.ParamByName('@cd_master').AsString     := Datm_proc_iata.qry_lista_cia_CD_MASTER.AsString;
         sp_receb_cia_aerea.ParamByName('@vl_pagto').AsFloat       := Datm_proc_iata.qry_lista_cia_FRETE_REAL.AsFloat;
         sp_receb_cia_aerea.ParamByName('@nr_ref').AsString        := Datm_proc_iata.qry_ult_ref_receb_ULT_REF.AsString;
         sp_receb_cia_aerea.ParamByName('@peso_master').AsFloat    := Datm_proc_iata.qry_lista_cia_VL_PESO_BRUTO.AsFloat;
         sp_receb_cia_aerea.ParamByName('@cd_cia').AsString        := msk_cd_cia.text;
         sp_receb_cia_aerea.ParamByName('@nr_relatorio').AsString  := Datm_proc_iata.qry_lista_cia_NR_RELATORIO.AsString;
         sp_receb_cia_aerea.ParamByName('@vl_ir_iata').AsFloat     := Datm_proc_iata.qry_lista_cia_calc_ir_iata.AsFloat;
         sp_receb_cia_aerea.ParamByName('@vl_ir_over').AsFloat     := Datm_proc_iata.qry_lista_cia_calc_ir_over.AsFloat;
         sp_receb_cia_aerea.ParamByName('@vl_iata').AsFloat        := Datm_proc_iata.qry_lista_cia_COM_IATA.AsFloat;
         sp_receb_cia_aerea.ParamByName('@vl_over').AsFloat        := Datm_proc_iata.qry_lista_cia_VL_OVER.AsFloat;
         ExecStoredProc(sp_receb_cia_aerea);
         CloseStoredProc(sp_receb_cia_aerea);
       end;
      qry_lista_cia_.Next;
     end;

     sp_fat_relatorio( qry_ult_ref_receb_ULT_REF.AsString, nr_relatorio,'+');
    {CloseStoredProc( sp_fatura_relatorio_cia );
    sp_fatura_relatorio_cia.ParamByName('@cd_cia').AsString          := msk_cd_cia.TExt;
    sp_fatura_relatorio_cia.ParamByName('@dt_movimento').AsDateTime  := dt_server;
    sp_fatura_relatorio_cia.ParamByName('@vl_comissao_iata').AsFloat := vl_iata;
    sp_fatura_relatorio_cia.ParamByName('@cd_unid_neg').AsString     := msk_unid_pesq.text;
    sp_fatura_relatorio_cia.ParamByName('@vl_comissao_over').AsFloat := vl_over;
    sp_fatura_relatorio_cia.ParamByName('@vl_ir').AsFloat            := vl_ir;
    sp_fatura_relatorio_cia.ParamByName('@vl_relatorio').AsFloat     := strtofloat(edt_vl_tt_sel.text);
    sp_fatura_relatorio_cia.ParamByName('@nr_relatorio').AsString    := nr_fatura;
    ExecStoredProc( sp_fatura_relatorio_cia );
    CloseStoredProc( sp_fatura_relatorio_cia );}


   end;
//  datm_main.db_broker.Commit;
 BoxMensagem('Operação realizada com sucesso',3);
 datm_proc_iata.qry_lista_cia_.Close;

 datm_proc_iata.qry_receb_pendente_.Close;
 datm_proc_iata.qry_receb_pendente_.ParamByName('DT_MOTAGEM').AsString := datetimetostr(dt_server);
 datm_proc_iata.qry_receb_pendente_.ParamByName('CD_CIA').AsString     := msk_cd_cia.text;
 datm_proc_iata.qry_receb_pendente_.Open;

 datm_proc_iata.qry_receb_item_pendente_.Close;
 datm_proc_iata.qry_receb_item_pendente_.Prepare;
 datm_proc_iata.qry_receb_item_pendente_.open;

 msk_cia2.text         := msk_cd_cia.text;
 edt_nm_cia2.text      := edt_nm_cia.text;
 msk_dt_montagem1.text := datetimetostr(dt_server);;

 pgctrl_proc.ActivePage    := ts_montado;
 pgctrl_montado.ActivePage := ts_pendente;



except
  on E: Exception do
  begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    TrataErro(E);
  end;
end;
end;

procedure Tfrm_proc_iata.msk_cia2Exit(Sender: TObject);
begin
 if msk_cia2.Text <> '' then
  begin
    ValCodEdt( msk_cia2 );
    datm_proc_iata.qry_pesquisa_.Active:=false;
    datm_proc_iata.qry_pesquisa_.Sql.Clear;
    datm_proc_iata.qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL ');
    datm_proc_iata.qry_pesquisa_.Sql.Add(' WHERE CODIGO = "'+msk_cia2.text+'" AND TP_TRANSPORTADOR = "0" ');
    datm_proc_iata.qry_pesquisa_.Active:=true;
    if datm_proc_iata.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_cia2.text:= datm_proc_iata.qry_pesquisa_.Fields[0].AsString;
          datm_proc_iata.qry_pesquisa_.Close;

          datm_proc_iata.qry_receb_pendente_.Close;
          datm_proc_iata.qry_receb_pendente_.ParamByName('DT_MOTAGEM').AsString := msk_dt_montagem1.text;
          datm_proc_iata.qry_receb_pendente_.ParamByName('CD_CIA').AsString     := msk_cia2.text;
          datm_proc_iata.qry_receb_pendente_.Open;

          datm_proc_iata.qry_receb_item_pendente_.Close;
          datm_proc_iata.qry_receb_item_pendente_.Prepare;
          datm_proc_iata.qry_receb_item_pendente_.open;


        end
        else
        begin
          datm_proc_iata.qry_pesquisa_.Close;
          edt_nm_cia2.Text := '';
          BoxMensagem('Código da Companhia inválido!', 2);
          msk_cia2.SetFocus;
          Exit;
        end;
    end;

end;

procedure Tfrm_proc_iata.msk_dt_montagem1Exit(Sender: TObject);
begin
  datm_proc_iata.qry_receb_pendente_.Close;
  datm_proc_iata.qry_receb_pendente_.ParamByName('DT_MOTAGEM').AsString := msk_dt_montagem1.text;
  datm_proc_iata.qry_receb_pendente_.ParamByName('CD_CIA').AsString     := msk_cia2.text;
  datm_proc_iata.qry_receb_pendente_.Open;

  datm_proc_iata.qry_receb_item_pendente_.Close;
  datm_proc_iata.qry_receb_item_pendente_.Prepare;
  datm_proc_iata.qry_receb_item_pendente_.open;

end;

procedure Tfrm_proc_iata.SpeedButton4Click(Sender: TObject);
begin

 if msk_cd_banco2.text = '' then
  begin
   Boxmensagem('Deve ser Informado um Banco',2);
   msk_cd_banco2.SetFocus;
   Exit;
  end;

 if msk_dt_receb1.text = '  /  /    ' then
  begin
   Boxmensagem('Deve ser Informado uma Data de Recebimento',2);
   msk_dt_receb1.SetFocus;
   Exit;
  end;

  with datm_proc_iata do
   begin
    CloseStoredProc(sp_efetua_recebimento_iata);
    sp_efetua_recebimento_iata.ParamByName('@dt_montagem').AsDatetime := strtodatetime(msk_dt_montagem1.text);
    sp_efetua_recebimento_iata.ParamByName('@cd_unid_neg').AsString   := msk_unid_pesq.text;
    sp_efetua_recebimento_iata.ParamByName('@nr_ref').AsString        := qry_receb_pendente_NR_REF.AsString;
    sp_efetua_recebimento_iata.ParamByName('@cd_banco').AsString      := msk_cd_banco2.text;
    sp_efetua_recebimento_iata.ParamByName('@dt_receb').AsDatetime    := strtodatetime(msk_dt_receb1.text);
    ExecStoredProc(sp_efetua_recebimento_iata);
    CloseStoredProc(sp_efetua_recebimento_iata);

    qry_receb_pendente_.Close;
    qry_receb_pendente_.ParamByName('DT_MOTAGEM').AsString := msk_dt_montagem1.text;
    qry_receb_pendente_.ParamByName('CD_CIA').AsString     := msk_cia2.text;
    qry_receb_pendente_.Open;

    qry_receb_item_pendente_.Close;
    qry_receb_item_pendente_.Prepare;
    qry_receb_item_pendente_.open;
   end;
end;

procedure Tfrm_proc_iata.msk_cd_banco2Exit(Sender: TObject);
begin
 if msk_cd_banco2.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco2 );
    datm_proc_iata.qry_pesquisa_.Active:=false;
    datm_proc_iata.qry_pesquisa_.Sql.Clear;
    datm_proc_iata.qry_pesquisa_.Sql.Add('SELECT NM_BANCO FROM TBANCO ');
    datm_proc_iata.qry_pesquisa_.Sql.Add(' WHERE CD_BANCO = "'+msk_cd_banco2.text+'"  ');
    datm_proc_iata.qry_pesquisa_.Active:=true;
    if datm_proc_iata.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_banco2.text:= datm_proc_iata.qry_pesquisa_.Fields[0].AsString;
          datm_proc_iata.qry_pesquisa_.Close;
        end
        else
        begin
          datm_proc_iata.qry_pesquisa_.Close;
          edt_nm_banco2.Text := '';
          BoxMensagem('Código do Banco inválido!', 2);
          msk_cd_banco2.SetFocus;
          Exit;
        end;
    end;
end;
procedure Tfrm_proc_iata.btn_co_ciaClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2207';
  Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    dbgoup_tp_transp.Enabled:=false;
    in_aerea:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cd_cia.text:=frm_Transportador_itl.Cons_OnLine_Texto;
   msk_cd_ciaExit(Sender);
  end;
end;
procedure Tfrm_proc_iata.btn_co_cia2Click(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2207';
  Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    dbgoup_tp_transp.Enabled:=false;
    in_aerea:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cia2.text:=frm_Transportador_itl.Cons_OnLine_Texto;
   msk_cia2Exit(Sender);
  end;
end;

procedure Tfrm_proc_iata.Relatrio1Click(Sender: TObject);
var IMPRESSAO:TQuery;
    nr_fatura :String[6];
    Qtde_conhecimento, Qtde_relatorio :Integer;
begin
    IMPRESSAO:= TQuery.Create(Application);
    IMPRESSAO.DatabaseName := 'DBBROKER';   //quatidade de master selecionados
    IMPRESSAO.Sql.Add('SELECT COUNT(NR_RELATORIO) FROM TMASTER ');
    IMPRESSAO.Sql.Add(' WHERE CD_CIA_TRANSP = :CD_CIA_TRANSP ');
    IMPRESSAO.Sql.Add(' AND DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DATA1, 103) AND CONVERT(DATETIME, :DATA2, 103) ');
    IMPRESSAO.Sql.Add(' AND IN_SEL_IATA = "1" ');
    IMPRESSAO.Params[0].AsString := msk_cd_cia.text;
    IMPRESSAO.Params[1].AsString := msk_dt_inicio.text;
    IMPRESSAO.Params[2].AsString := msk_dt_fim.text;
    IMPRESSAO.Open;
    Qtde_conhecimento := IMPRESSAO.Fields[0].AsInteger;

    IMPRESSAO.Sql.Clear;
    IMPRESSAO.Sql.Add('SELECT COUNT(NR_RELATORIO) FROM TMASTER ');  //quantidade de master sem nr relatorio
    IMPRESSAO.Sql.Add(' WHERE CD_CIA_TRANSP = :CD_CIA_TRANSP ');
    IMPRESSAO.Sql.Add(' AND DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DATA1, 103) AND CONVERT(DATETIME, :DATA2, 103) ');
    IMPRESSAO.Sql.Add(' AND IN_SEL_IATA = "1" AND ISNULL(NR_RELATORIO, "") = ""');
    IMPRESSAO.Params[0].AsString := msk_cd_cia.text;
    IMPRESSAO.Params[1].AsString := msk_dt_inicio.text;
    IMPRESSAO.Params[2].AsString := msk_dt_fim.text;
    IMPRESSAO.Open;

    Qtde_relatorio    := IMPRESSAO.Fields[0].AsInteger;

    IMPRESSAO.Sql.Clear;
    if (Qtde_conhecimento - Qtde_relatorio) = 0   then
     begin
        IMPRESSAO.Sql.Add( 'SELECT RIGHT( "000000" + CONVERT( varchar, ISNULL (MAX(NR_RELATORIO)+ 1 , 1 ) ), 6 ) ');
        IMPRESSAO.Sql.Add( 'FROM TNUMERO_REL_IATA ') ;
        IMPRESSAO.Open;

        nr_fatura := IMPRESSAO.Fields[0].AsString;

        IMPRESSAO.Sql.Clear;
        IMPRESSAO.Sql.Add('INSERT INTO TNUMERO_REL_IATA VALUES(:NR_RELATORIO, :CD_USUARIO, :DT_ABERTURA)');
        IMPRESSAO.Params[0].AsString  := nr_fatura;
        IMPRESSAO.Params[1].AsString  := str_cd_usuario;
        IMPRESSAO.Params[2].AsDAtetime:= dt_server;
        IMPRESSAO.ExecSql;


     end
    else
     begin
        IMPRESSAO.Sql.Add('SELECT TOP 1 NR_RELATORIO FROM TMASTER ');  //quantidade de master sem nr relatorio
        IMPRESSAO.Sql.Add(' WHERE CD_CIA_TRANSP = :CD_CIA_TRANSP ');
        IMPRESSAO.Sql.Add(' AND DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DATA1, 103) AND CONVERT(DATETIME, :DATA2, 103) ');
        IMPRESSAO.Sql.Add(' AND IN_SEL_IATA = "1" AND ISNULL(NR_RELATORIO, "") <> ""');
        IMPRESSAO.Params[0].AsString := msk_cd_cia.text;
        IMPRESSAO.Params[1].AsString := msk_dt_inicio.text;
        IMPRESSAO.Params[2].AsString := msk_dt_fim.text;
        IMPRESSAO.Open;

        nr_fatura := IMPRESSAO.Fields[0].AsString;
     end;


    IMPRESSAO.Close;
    IMPRESSAO.Sql.Clear;
    IMPRESSAO.Sql.Add('UPDATE TMASTER SET  NR_RELATORIO = :NR_RELATORIO ');
    IMPRESSAO.Sql.Add(' WHERE CD_CIA_TRANSP = :CD_CIA_TRANSP ');
    IMPRESSAO.Sql.Add(' AND DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DATA1, 103) AND CONVERT(DATETIME, :DATA2, 103) ');
    IMPRESSAO.Sql.Add(' AND IN_SEL_IATA = "1" AND ISNULL(NR_RELATORIO, "") = ""');
    IMPRESSAO.Params[0].AsString := nr_fatura;
    IMPRESSAO.Params[1].AsString := msk_cd_cia.text;
    IMPRESSAO.Params[2].AsString := msk_dt_inicio.text;
    IMPRESSAO.Params[3].AsString := msk_dt_fim.text;
    IMPRESSAO.ExecSql;

    IMPRESSAO.Close;
    IMPRESSAO.Sql.Clear;
    IMPRESSAO.Sql.Add('UPDATE TMASTER SET  NR_RELATORIO = :NR_RELATORIO ');
    IMPRESSAO.Sql.Add(' WHERE CD_CIA_TRANSP = :CD_CIA_TRANSP ');
    IMPRESSAO.Sql.Add(' AND DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DATA1, 103) AND CONVERT(DATETIME, :DATA2, 103) ');
    IMPRESSAO.Sql.Add(' AND IN_SEL_IATA = "0" AND ISNULL(NR_RELATORIO, "") <> ""');
    IMPRESSAO.Params[0].AsString := '';
    IMPRESSAO.Params[1].AsString := msk_cd_cia.text;
    IMPRESSAO.Params[2].AsString := msk_dt_inicio.text;
    IMPRESSAO.Params[3].AsString := msk_dt_fim.text;
    IMPRESSAO.ExecSql;


    IMPRESSAO.Free;

    btn_pesqClick(NIL);

    with datm_proc_iata do
     begin
      qry_impressao_rel_.Close;
      qry_impressao_rel_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
      qry_impressao_rel_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
      qry_impressao_rel_.ParamByName('CD_CIA').AsString      := msk_cd_cia.text;
      qry_impressao_rel_.ParamByName('DT_INICIO').AsString   := msk_dt_inicio.text;
      qry_impressao_rel_.ParamByName('DT_FIM').AsString      := msk_dt_fim.text;
      qry_impressao_rel_.Prepare;
      qry_impressao_rel_.Open;
     end;

    Application.CreateForm(TFrm_impressao, Frm_impressao );
    Frm_impressao.cd_unid_neg   := msk_unid_pesq.TExt;
    Frm_impressao.cd_produto    := msk_cd_produto.TExt;
    Frm_impressao.cd_cia        := msk_cd_cia.Text;
    Frm_impressao.cd_via_transp := '04';
    Frm_impressao.cd_modulo     := '3206';
    Frm_impressao.ShowModal;






end;

function Tfrm_proc_iata.verifica_nr_relatorio:Boolean;
var RELATORIO: TQuery;
begin
    verifica_nr_relatorio := true;
    RELATORIO:= TQuery.Create(Application);
    RELATORIO.DatabaseName := 'DBBROKER';
    RELATORIO.Sql.Add('SELECT COUNT(*) FROM TMASTER ');
    RELATORIO.Sql.Add(' WHERE CD_CIA_TRANSP = :CD_CIA_TRANSP ');
    RELATORIO.Sql.Add(' AND DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DATA1, 103) AND CONVERT(DATETIME, :DATA2, 103) ');
    RELATORIO.Sql.Add(' AND IN_SEL_IATA = "1" AND ISNULL(NR_RELATORIO, "") = ""');
    RELATORIO.Params[0].AsString := msk_cd_cia.text;
    RELATORIO.Params[1].AsString := msk_dt_inicio.text;
    RELATORIO.Params[2].AsString := msk_dt_fim.text;
    RELATORIO.Open;

    if RELATORIO.Fields[0].AsInteger >  0 then
    begin
     Boxmensagem('Deve ser emitido o relatório',2);
     verifica_nr_relatorio := false;
    end;

    RELATORIO.Free;

end;

procedure Tfrm_proc_iata.Previex1Click(Sender: TObject);
begin
  with datm_proc_iata do
     begin
      qry_impressao_rel_.Close;
      qry_impressao_rel_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
      qry_impressao_rel_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
      qry_impressao_rel_.ParamByName('CD_CIA').AsString      := msk_cd_cia.text;
      qry_impressao_rel_.ParamByName('DT_INICIO').AsString   := msk_dt_inicio.text;
      qry_impressao_rel_.ParamByName('DT_FIM').AsString      := msk_dt_fim.text;
      qry_impressao_rel_.Prepare;
      qry_impressao_rel_.Open;
     end;

    Application.CreateForm(TFrm_impressao, Frm_impressao );
    Frm_impressao.cd_unid_neg   := msk_unid_pesq.TExt;
    Frm_impressao.cd_produto    := msk_cd_produto.TExt;
    Frm_impressao.cd_cia        := msk_cd_cia.Text;
    Frm_impressao.cd_via_transp := '04';
    Frm_impressao.cd_modulo     := '3206';
    Frm_impressao.ShowModal;

end;

procedure Tfrm_proc_iata.sp_fat_relatorio(ref, relatorio:String; Operacao:Pchar);
var st_name_proc: String;
begin
 if Operacao = '+' then //recebimento
   st_name_proc := 'sp_fat_receb_iata'
 else
   st_name_proc := 'sp_fat_pagto_iata';

with datm_proc_iata do
 begin
  CloseStoredProc(sp_fatura_relatorio_cia);
  sp_fatura_relatorio_cia.StoredProcName := '';
  sp_fatura_relatorio_cia.StoredProcName := st_name_proc;
  sp_fatura_relatorio_cia.Params.CreateParam( ftString,  '@nr_ref', ptInput ).AsString           := ref;
  sp_fatura_relatorio_cia.Params.CreateParam( ftDateTime,'@dt_movimento',    ptInput ).AsDAteTime:= dt_server;
  sp_fatura_relatorio_cia.Params.CreateParam( ftString,  '@nr_relatorio',     ptInput ).AsString    := relatorio;
  sp_fatura_relatorio_cia.Params.CreateParam( ftString,  '@cd_cia',     ptInput ).AsString       := msk_cd_cia.text;
  sp_fatura_relatorio_cia.Params.CreateParam( ftString,  '@cd_unid_neg',     ptInput ).AsString  := msk_unid_pesq.text;
  sp_fatura_relatorio_cia.Params.CreateParam( ftString,  '@cd_produto',     ptInput ).AsString   := msk_cd_produto.text;
  sp_fatura_relatorio_cia.Params.CreateParam( ftInteger, 'Result',       ptResult );
  ExecStoredProc(sp_fatura_relatorio_cia);
 end;


end;

end.


