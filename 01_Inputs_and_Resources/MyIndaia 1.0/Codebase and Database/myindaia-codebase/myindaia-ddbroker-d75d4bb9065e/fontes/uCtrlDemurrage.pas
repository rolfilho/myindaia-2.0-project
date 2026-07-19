unit uCtrlDemurrage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls, Buttons, ExtCtrls, ToolEdit,
  Mask, Menus, ConsOnLineEx,DB;

type
  Tfrm_ctrl_demurrage = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_consulta: TSpeedButton;
    pgctrl_demurrage: TPageControl;
    ts_pesquisa: TTabSheet;
    dbgrid_lista: TDBGrid;
    Panel3: TPanel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_unid: TEdit;
    ts_dados_basicos: TTabSheet;
    Label13: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    mi_pesquisa: TMenuItem;
    Label2: TLabel;
    Label10: TLabel;
    msk_nr_cntr: TMaskEdit;
    msk_nr_house: TMaskEdit;
    msk_cd_unid: TMaskEdit;
    msk_dt_inicial: TMaskEdit;
    msk_dt_final: TMaskEdit;
    rdgrp_devolvido: TRadioGroup;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    dbedt_cd_armador: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit11: TDBEdit;
    dbedt_dt_cheg: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit1: TDBEdit;
    edt_cd_unid: TEdit;
    edt_unid: TEdit;
    dbedt_dt_devolucao: TDBEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit2: TDBEdit;
    dbedt_desc: TDBEdit;
    dbedt_vl_corrigido: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label24: TLabel;
    dbedt_vl_venda: TDBEdit;
    DBEdit15: TDBEdit;
    GroupBox3: TGroupBox;
    Label23: TLabel;
    DBEdit8: TDBEdit;
    shp1: TShape;
    procedure btn_co_masterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unidExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_armadorChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_demurrageChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_consultaClick(Sender: TObject);
    procedure pgctrl_demurrageChange(Sender: TObject);
    procedure dbgrid_listaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbedt_dt_devolucaoExit(Sender: TObject);
    procedure dbedt_descExit(Sender: TObject);
    procedure dbedt_vl_corrigidoExit(Sender: TObject);
    procedure dbedt_vl_vendaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
     lNaoConsiste: Boolean;
    a_str_indices : Array[0..5] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
   // procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    { Public declarations }

     consulta:Boolean;
  end;

var
  frm_ctrl_demurrage: Tfrm_ctrl_demurrage;
  st_dia_semana,st_ano_numero:string;//variaveis para o verificar o
  int_dia_numero:integer;          //intervalo da semana da data desejada
  int_mes_numero:integer;

implementation

uses PGGP001, Funcoes, GSMLIB, PGGP017, PGSM290, PGSM249, PGSM048,
  dCtrlDemurrage;

{$R *.DFM}

procedure Tfrm_ctrl_demurrage.btn_co_masterClick(Sender: TObject);
var registro:string;
begin

end;

procedure Tfrm_ctrl_demurrage.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;



  Application.CreateForm( Tdatm_ctrl_demurrage, datm_ctrl_demurrage );

  with datm_ctrl_demurrage do
  begin

      qry_traz_default_.Close;
      qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_traz_default_.Open;

      msk_cd_unid.text:= qry_traz_default_CD_UNID_NEG.AsString;
      edt_nm_unid.text:=qry_traz_default_NM_UNID_NEG.AsString;

 //    qry_demurrage_.Close;
 //     qry_demurrage_.ParamByName('CD_UNID_NEG').AsString:= qry_traz_default_CD_UNID_NEG.AsString;
  //    qry_demurrage_.Prepare;
   //   qry_demurrage_.Open;


  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  btn_mi(st_incluir,false, false, st_excluir);

end;

procedure Tfrm_ctrl_demurrage.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin

  btn_cancelar.Enabled   := CAnc;  mi_cancelar.Enabled    := CAnc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;

end;

procedure Tfrm_ctrl_demurrage.Cancelar;
begin
 if datm_ctrl_demurrage.qry_demurrage_.State in [dsEdit, dsInsert] then
    datm_ctrl_demurrage.qry_demurrage_.Cancel;
btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_ctrl_demurrage.Consiste: Boolean;
begin
consiste:=true;

end;



function Tfrm_ctrl_demurrage.Grava: Boolean;
begin
try
  with datm_ctrl_demurrage do
      begin
       if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
       if qry_demurrage_.State in [dsInsert,dsEdit]then
            qry_demurrage_.Post;

      datm_main.db_broker.Commit;
      Grava := True;
      end;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
 btn_mi(st_incluir,false,false,st_excluir);

end;

function Tfrm_ctrl_demurrage.VerAlt: Boolean;
begin
VerAlt := True;
  if ( ( datm_ctrl_demurrage.qry_demurrage_.State in [dsEdit] ) and st_modificar ) or
       ( datm_ctrl_demurrage.qry_demurrage_.State in [dsInsert] ) then
    begin
      if BoxMensagem('O cadastro de Controle de Demurrage não foi salvo.' + #13#10 +
         'Deseja salvar as informações?', 1) then
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

procedure Tfrm_ctrl_demurrage.msk_cd_unidExit(Sender: TObject);
begin
{ if msk_cd_unid.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid );
    datm_ctrl_demurrage.qry_pesquisa_.Active:=false;
    datm_ctrl_demurrage.qry_pesquisa_.Sql.Clear;
    datm_ctrl_demurrage.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid.Text+'"');
    datm_ctrl_demurrage.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_ctrl_demurrage.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_ctrl_demurrage.qry_pesquisa_.Active:=true;
    if datm_ctrl_demurrage.qry_pesquisa_.RecordCount > 0 then
        begin
           edt_nm_unid.text:= datm_ctrl_demurrage.qry_pesquisa_.Fields[0].AsString;
           datm_ctrl_demurrage.qry_pesquisa_.Close;

           datm_ctrl_demurrage.qry_demurrage_.Close;
           datm_ctrl_demurrage.qry_demurrage_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
           datm_ctrl_demurrage.qry_demurrage_.Prepare;
           datm_ctrl_demurrage.qry_demurrage_.Open;
        end
        else
        begin
          datm_ctrl_demurrage.qry_pesquisa_.Close;
          edt_nm_unid.Text := '';
          BoxMensagem('Código da Unidade de Negócio inválido!', 2);
          msk_cd_unid.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('A Unidade de Negócio deve ser informado!',2);
      msk_cd_unid.SetFocus;
     end; }

  if msk_cd_unid.Text <> '' then begin
    msk_cd_unid.Text := Copy('00', 1, 2 - Length(msk_cd_unid.Text)) +  msk_cd_unid.Text;
    edt_nm_unid.Text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid.Text+'" ' +
                                          ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                          '                     WHERE CD_USUARIO ="'+str_cd_usuario+'") ', 'NM_UNID_NEG');
    if edt_nm_unid.Text = '' then begin
      edt_nm_unid.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_cd_unid.SetFocus;
      Exit;
    end else begin
      datm_ctrl_demurrage.qry_demurrage_.Close;
      datm_ctrl_demurrage.qry_demurrage_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
      datm_ctrl_demurrage.qry_demurrage_.Prepare;
      datm_ctrl_demurrage.qry_demurrage_.Open;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_cd_unid.SetFocus;
  end;


end;

procedure Tfrm_ctrl_demurrage.btn_co_unid_negClick(Sender: TObject);
begin
{ Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_cd_unid, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );


 msk_cd_unidExit(Sender); }

  if Sender is TSpeedButton then begin
    msk_cd_unid.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_cd_unid.text);
    msk_cd_unidExit(Sender);
  end else
    edt_nm_unid.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid.text, 'NM_UNID_NEG' );




end;

procedure Tfrm_ctrl_demurrage.btn_sairClick(Sender: TObject);
begin
datm_ctrl_demurrage.Free;
Close;
end;

procedure Tfrm_ctrl_demurrage.dbedt_cd_armadorChange(Sender: TObject);
begin
  if datm_ctrl_demurrage.qry_demurrage_.State in [dsEdit,dsInsert] then
       btn_mi(false,st_modificar, st_modificar, false);
end;

procedure Tfrm_ctrl_demurrage.btn_salvarClick(Sender: TObject);
begin
if not consiste then exit;
if not grava then exit;
end;

procedure Tfrm_ctrl_demurrage.btn_cancelarClick(Sender: TObject);
begin
cancelar;
end;

procedure Tfrm_ctrl_demurrage.pgctrl_demurrageChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:=VerAlt;
end;

procedure Tfrm_ctrl_demurrage.btn_consultaClick(Sender: TObject);
begin
  with datm_ctrl_demurrage do
    begin
      qry_demurrage_.Close;
      if (msk_dt_inicial.text <> '  /  /    ') and (msk_dt_final.text <> '  /  /    ') then
       begin
        qry_demurrage_.Sql[7]:='AND (DT_DEMURRAGE BETWEEN :DT_INICIAL AND :DT_FINAL)';
        qry_demurrage_.ParamByName('DT_INICIAL').AsDatetime:=strtodate(msk_dt_inicial.text);
        qry_demurrage_.ParamByName('DT_FINAL').AsDatetime:=strtodate(msk_dt_final.text);
       end
       else
         qry_demurrage_.Sql[7]:='';

       if rdgrp_devolvido.ItemIndex = 0 then
         qry_demurrage_.Sql[8]:='AND TPC.IN_DEVOLVIDO = "0"';
       if rdgrp_devolvido.ItemIndex = 1 then
         qry_demurrage_.Sql[8]:='AND TPC.IN_DEVOLVIDO = "1"';
       if rdgrp_devolvido.ItemIndex = 2 then
         qry_demurrage_.Sql[8]:='AND (TPC.IN_DEVOLVIDO = "0" OR TPC.IN_DEVOLVIDO = "1") ';

       if msk_nr_cntr.text <> '' then
        qry_demurrage_.Sql[9]:=' AND TPC.NR_CNTR="'+msk_nr_cntr.text+'"'
        else qry_demurrage_.Sql[9]:=' ';

       if msk_nr_house.text <> '' then
         qry_demurrage_.Sql[10]:=' AND TH.NR_HOUSE="'+msk_nr_house.text+'"'
       else qry_demurrage_.Sql[10]:=' ';
      qry_demurrage_.Prepare;
     // showmessage(qry_demurrage_.Sql.text);
      qry_demurrage_.Open;
    end;
end;

procedure Tfrm_ctrl_demurrage.pgctrl_demurrageChange(Sender: TObject);
begin
edt_cd_unid.text:=msk_cd_unid.text;
edt_unid.text   :=edt_nm_unid.text;
end;

procedure Tfrm_ctrl_demurrage.dbgrid_listaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (datm_ctrl_demurrage.qry_demurrage_DT_DEVOLUCAO_CNTR.AsDateTime < dt_server) and
   (datm_ctrl_demurrage.qry_demurrage_IN_DEVOLVIDO.AsString = '0') then
    begin
    dbgrid_lista.Canvas.Font.Color:= clred;
    dbgrid_lista.DefaultDrawDataCell(Rect, dbgrid_lista.columns[datacol].field, State);

    end
   else
     begin
      dbgrid_lista.Canvas.Font.Color:= clblack;
      dbgrid_lista.DefaultDrawDataCell(Rect, dbgrid_lista.columns[datacol].field, State);
     end;

end;

procedure Tfrm_ctrl_demurrage.dbedt_dt_devolucaoExit(Sender: TObject);
begin
  if (datm_ctrl_demurrage.qry_demurrage_.State in [dsEdit])
     and (dbedt_dt_devolucao.text <> '  /  /    ')then
     datm_ctrl_demurrage.qry_demurrage_IN_DEVOLVIDO.AsString :='1';
end;

procedure Tfrm_ctrl_demurrage.dbedt_descExit(Sender: TObject);
var dias:integer;//Extended;
begin
    if not(datm_ctrl_demurrage.qry_demurrage_.State in [dsEdit]) then exit;

    if dbedt_dt_devolucao.text = '  /  /    ' then
      begin
       boxmensagem('Deve ser preenchido a data de devolução!',2);
       dbedt_dt_devolucao.SetFocus;
       datm_ctrl_demurrage.qry_demurrage_VL_CORRIGIDO.Clear;
       datm_ctrl_demurrage.qry_demurrage_VL_DESC_DEMURRAGE.Clear;
       Exit;
      end;

    if dbedt_desc.text <> '0.00' then
      begin
       datm_ctrl_demurrage.qry_demurrage_VL_CORRIGIDO.Asfloat:=datm_ctrl_demurrage.qry_demurrage_VL_DEMURRAGE.AsFloat  -
                        (datm_ctrl_demurrage.qry_demurrage_VL_DESC_DEMURRAGE.Asfloat *
                        datm_ctrl_demurrage.qry_demurrage_VL_DEMURRAGE.AsFloat)/100;
       //datm_ctrl_demurrage.qry_demurrage_DT_DEV_EFETIVA.AsInteger -
       dias:= datm_ctrl_demurrage.get_dia;// datm_ctrl_demurrage.qry_demurrage_DT_DEVOLUCAO_CNTR.AsInteger;
       datm_ctrl_demurrage.qry_demurrage_VL_CUSTO_TOTAL.AsFloat:= strtofloat(inttostr(dias)) *datm_ctrl_demurrage.qry_demurrage_VL_CORRIGIDO.Asfloat;
      end;


end;

procedure Tfrm_ctrl_demurrage.dbedt_vl_corrigidoExit(Sender: TObject);
begin
 if not(datm_ctrl_demurrage.qry_demurrage_.State in [dsEdit]) then exit;

    if dbedt_dt_devolucao.text = '  /  /    ' then
      begin
       boxmensagem('Deve ser preenchido a data de devolução!',2);
       dbedt_dt_devolucao.SetFocus;
       datm_ctrl_demurrage.qry_demurrage_VL_CORRIGIDO.Clear;
       datm_ctrl_demurrage.qry_demurrage_VL_DESC_DEMURRAGE.Clear;
       Exit;
      end;

    if dbedt_vl_corrigido.text <> '0.00' then
      begin
         datm_ctrl_demurrage.qry_demurrage_VL_DESC_DEMURRAGE.Asfloat:=100 - ((datm_ctrl_demurrage.qry_demurrage_VL_CORRIGIDO.Asfloat* 100)/
                                                               datm_ctrl_demurrage.qry_demurrage_VL_DEMURRAGE.AsFloat);

       datm_ctrl_demurrage.qry_demurrage_VL_CUSTO_TOTAL.AsFloat:= strtofloat(inttostr(datm_ctrl_demurrage.get_dia))
                           *datm_ctrl_demurrage.qry_demurrage_VL_CORRIGIDO.Asfloat;
      end;
end;

procedure Tfrm_ctrl_demurrage.dbedt_vl_vendaExit(Sender: TObject);
begin
 if not(datm_ctrl_demurrage.qry_demurrage_.State in [dsEdit]) then exit;

    if dbedt_dt_devolucao.text = '  /  /    ' then
      begin
       boxmensagem('Deve ser preenchido a data de devolução!',2);
       dbedt_dt_devolucao.SetFocus;
       datm_ctrl_demurrage.qry_demurrage_VL_VENDA_DEMURRAGE.Clear;
       Exit;
      end;

    if dbedt_vl_venda.text <> '0.00' then
      begin
           datm_ctrl_demurrage.qry_demurrage_VL_VENDA_TOTAL.AsFloat:= strtofloat(inttostr(datm_ctrl_demurrage.get_dia))
                           * datm_ctrl_demurrage.qry_demurrage_VL_VENDA_DEMURRAGE.Asfloat;
          datm_ctrl_demurrage.qry_demurrage_TT_DEMURRAGE.AsFloat:=datm_ctrl_demurrage.qry_demurrage_VL_VENDA_TOTAL.AsFloat -
                                          datm_ctrl_demurrage.qry_demurrage_VL_CUSTO_TOTAL.AsFloat
      end;

end;

procedure Tfrm_ctrl_demurrage.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  shp1.Brush.Color   := clPnlClaroBroker;
end;

procedure Tfrm_ctrl_demurrage.msk_cd_unidKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_unid_negClick(btn_co_unid_neg);
end;

end.
