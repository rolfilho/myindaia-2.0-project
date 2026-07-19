UNIT uGerarConsolidada;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, DBGrids, Buttons, Menus, ExtCtrls, Db, DBTables,
  DBCtrls, DBCGrids, Funcoes;

type
  Tfrm_gerar_consolidada = class(TForm)
    pnl_exp_aerea: TPanel;
    MainMenu1: TMainMenu;
    mi_gera_conso: TMenuItem;
    mi_sair: TMenuItem;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_liberar: TSpeedButton;
    msk_cd_unid_aerea: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    msk_cd_prod_aerea: TMaskEdit;
    Label3: TLabel;
    msk_cd_agente_aerea: TMaskEdit;
    lb_cia_arm: TLabel;
    msk_cd_cia_aerea: TMaskEdit;
    Label5: TLabel;
    msk_cd_orig_aerea: TMaskEdit;
    Label6: TLabel;
    msk_cd_dest_aerea: TMaskEdit;
    Label7: TLabel;
    msk_cd_moeda_aerea: TMaskEdit;
    edt_nm_unid_aerea: TEdit;
    edt_nm_agente_aerea: TEdit;
    edt_nm_prod_aerea: TEdit;
    edt_nm_cia_aerea: TEdit;
    edt_nm_orig_aerea: TEdit;
    edt_nm_dest_aerea: TEdit;
    edt_nm_moeda_aerea: TEdit;
    btn_unid: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btn_marcar: TSpeedButton;
    edt_master: TEdit;
    lb_master_book: TLabel;
    lb_voo: TLabel;
    edt_nr_voo: TEdit;
    lb_dt_voo: TLabel;
    msk_dt_voo: TMaskEdit;
    mi_marca: TMenuItem;
    edt_nr_book: TEdit;
    rdgroup_estufagem: TRadioGroup;
    msk_cd_navio: TMaskEdit;
    lb_navio: TLabel;
    edt_nm_navio: TEdit;
    btn_co_navio: TSpeedButton;
    pnl_lista_marit: TPanel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    dbgrid_maritimo: TDBGrid;
    pnl_master: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    pnl_selecao: TPanel;
    Label19: TLabel;
    dbgrid_aereo: TDBGrid;
    btn_inclir_house: TSpeedButton;
    Panel1: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    mi_incl_house: TMenuItem;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_marcarClick(Sender: TObject);
    procedure btn_liberarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrid_aereoCellClick(Column: TColumn);
    procedure dbgrid_aereoColEnter(Sender: TObject);
    procedure dbgrid_aereoColExit(Sender: TObject);
    procedure SaveBoolean();
    procedure dbgrid_aereoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrid_maritimoCellClick(Column: TColumn);
    procedure dbgrid_maritimoColEnter(Sender: TObject);
    procedure dbgrid_maritimoColExit(Sender: TObject);
    procedure dbgrid_maritimoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure msk_cd_navioExit(Sender: TObject);
    procedure btn_co_navioClick(Sender: TObject);
    procedure atz_inclui_house(const nr_conhec_master, cd_master:String; I:real);
    procedure btn_inclir_houseClick(Sender: TObject);
    procedure edt_nr_bookExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cd_via_transp, cd_master, nr_master:string;
    vl_gross, vl_charg, vl_qtde:Real;
    in_only_house, in_pre_alerta:boolean;
  end;

var
  frm_gerar_consolidada: Tfrm_gerar_consolidada;
  FOriginalOptions : TDBGridOptions;
implementation

uses dGerarConsolidada, uPedidoInstrucao, PGGP017, GSMLIB, PGGP001,
  uVeiculo;

{$R *.DFM}

procedure Tfrm_gerar_consolidada.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_gerar_consolidada.FormShow(Sender: TObject);
begin

 with datm_gerar_consolidada do
  begin
  qry_lista_proc_.Close;
  qry_lista_proc_.ParamByName('CD_UNID_NEG').AsString  :=msk_cd_unid_aerea.text;
  qry_lista_proc_.ParamByName('CD_PRODUTO').AsString   :=msk_cd_prod_aerea.text;
  qry_lista_proc_.ParamByName('CD_AGENTE').AsString    :=msk_cd_agente_aerea.text;
  qry_lista_proc_.ParamByName('CD_ORIGEM').AsString    :=msk_cd_orig_aerea.text;
  qry_lista_proc_.ParamByName('CD_DESTINO').AsString   :=msk_cd_dest_aerea.text;
  qry_lista_proc_.ParamByName('CD_MOEDA').AsString     :=msk_cd_moeda_aerea.text;
  qry_lista_proc_.ParamByName('CD_VIA_TRANSP').AsString:=cd_via_transp;
  if cd_via_transp = '04' then
    begin
       qry_lista_proc_.Sql[10] :=' AND TP.CD_CIA_TRANSP='+quotedstr(msk_cd_cia_aerea.text);
       lb_cia_arm.CAption      :='Companhia';
       lb_master_book.CAption  :='Master';
       lb_voo.CAption          :='Nr Vôo';
       lb_dt_voo.CAption       :='Data do Vôo';
       edt_nr_book.Visible     :=false;
       edt_master.Visible      :=true;
       msk_cd_navio.Visible    :=false;
       edt_nm_navio.Visible    :=false;
       btn_co_navio.Visible    :=false;
       lb_navio.Visible        :=false;
       pnl_lista_marit.SendToBack;
       pnl_selecao.BringToFront;
       pnl_master.SendToBack;
       rdgroup_estufagem.Visible  :=false;
       dbgrid_aereo.SelectedIndex :=  2;
    end
   else
     begin
        qry_lista_proc_.Sql[10]  :=' AND TP.CD_ARMADOR='+quotedstr(msk_cd_cia_aerea.text);
        lb_cia_arm.CAption       :='Armador';
        lb_master_book.CAption   :='Nr Booking';
        lb_voo.CAption           :='Nr Viagem';
        lb_dt_voo.CAption        :='Data da Viagem';
        edt_nr_book.Visible      :=true;
        edt_master.Visible       :=false;
        msk_cd_navio.Visible     :=True;
        edt_nm_navio.Visible     :=True;
        btn_co_navio.Visible     :=True;
        lb_navio.Visible         :=true;
        pnl_lista_marit.BringToFront;
        pnl_selecao.SendToBack;
        pnl_master.SendToBack;
        rdgroup_estufagem.Visible     :=true;
        dbgrid_maritimo.SelectedIndex :=  2;
     end;
  qry_lista_proc_.Prepare;
  qry_lista_proc_.Open;
  end;
  if (in_only_house) or (in_pre_alerta)then
   begin
    btn_inclir_house.Left      := btn_liberar.Left;
    btn_liberar.Visible        := false;
    btn_inclir_house.Visible   := true;
    edt_nr_voo.ReadOnly        := true;
    msk_dt_voo.ReadOnly        := true;
    edt_nr_voo.Color           := clMenu;
    msk_dt_voo.Color           := clMenu;
    edt_nr_book.Color          := clMenu;
    edt_nr_book.ReadOnly       := true;
    rdgroup_estufagem.ENABLED  := true;
    msk_cd_navio.Color         := clMenu;
    msk_cd_navio.ReadOnly      := true;
    btn_co_navio.Visible       := false;
    mi_incl_house.Visible      := true;
    mi_gera_conso.Visible      := false;
   end;




end;

procedure Tfrm_gerar_consolidada.btn_marcarClick(Sender: TObject);
begin
 with TQuery.Create(Application) do
  begin
   DataBaseName:='DBBROKER';
   Sql.Clear;
   Sql.Add('UPDATE TPROCESSO SET IN_SELECIONADO ="1" WHERE CD_UNID_NEG="'+msk_cd_unid_aerea.text+'" AND ');
   Sql.Add(' CD_PRODUTO="'+msk_cd_prod_aerea.text+'" AND CD_AGENTE = "'+msk_cd_agente_aerea.text+'"');
   Sql.Add(' AND CD_ORIGEM="'+msk_cd_orig_aerea.text+'" AND CD_DESTINO="'+msk_cd_dest_aerea.text+'"');
   Sql.Add(' AND CD_MOEDA_FRETE="'+msk_cd_moeda_aerea.text+'" ');
   if cd_via_transp = '04' then
   Sql.Add(' AND CD_CIA_TRANSP="'+msk_cd_cia_aerea.text+'"')
   else   Sql.Add(' AND CD_ARMADOR="'+msk_cd_cia_aerea.text+'"');
  // Showmessage(sql.text);
   ExecSql;
   Free;
  end;

 with datm_gerar_consolidada do
  begin
  qry_lista_proc_.Close;
  qry_lista_proc_.ParamByName('CD_UNID_NEG').AsString  :=msk_cd_unid_aerea.text;
  qry_lista_proc_.ParamByName('CD_PRODUTO').AsString   :=msk_cd_prod_aerea.text;
  qry_lista_proc_.ParamByName('CD_AGENTE').AsString    :=msk_cd_agente_aerea.text;
  qry_lista_proc_.ParamByName('CD_ORIGEM').AsString    :=msk_cd_orig_aerea.text;
  qry_lista_proc_.ParamByName('CD_DESTINO').AsString   :=msk_cd_dest_aerea.text;
  qry_lista_proc_.ParamByName('CD_MOEDA').AsString     :=msk_cd_moeda_aerea.text;
  qry_lista_proc_.ParamByName('CD_VIA_TRANSP').AsString:=cd_via_transp;
  if cd_via_transp = '04' then
       qry_lista_proc_.Sql[10]:=' AND TP.CD_CIA_TRANSP='+quotedstr(msk_cd_cia_aerea.text)
   else   qry_lista_proc_.Sql[10]:=' AND TP.CD_ARMADOR='+quotedstr(msk_cd_cia_aerea.text);
  qry_lista_proc_.Prepare;
  //Showmessage(qry_lista_proc_.sql.text);
  qry_lista_proc_.Open;
  end;
end;

procedure Tfrm_gerar_consolidada.btn_liberarClick(Sender: TObject);
var st_cd_master, nr_conhecimento, nr_conhec_house, tp_estufagem:string;
   cd_cia, cd_armador, prefixo:string;
   fl_cd_master, i:real;
begin
   I:=0;//evrifica se existe processos selecionados
   vl_gross:=0;  vl_charg:=0;  vl_qtde:=0;

   if datm_gerar_consolidada.qry_lista_proc_.State in[dsEdit] then
     begin
      datm_gerar_consolidada.qry_lista_proc_.Post;
      //boxmensagem('esta em modulo de edição ',2);
      //exit;
     end;


   nr_conhecimento:='';
   //----------------------------------------------
   datm_gerar_consolidada.qry_lista_proc_.First;
   while Not(datm_gerar_consolidada.qry_lista_proc_.EOF) do
     begin
      if datm_gerar_consolidada.qry_lista_proc_IN_SELECIONADO.AsString = '1' then
        begin
         I:=I + 1;
         if (cd_via_transp = '04' )then
            begin
              vl_gross:= vl_gross + datm_gerar_consolidada.qry_lista_proc_VL_PESO_BRUTO.AsFloat;
              vl_charg:= vl_charg + datm_gerar_consolidada.qry_lista_proc_CHARGEABLE.AsFloat;
              vl_qtde := vl_qtde  + datm_gerar_consolidada.qry_lista_proc_QTD_VOLUME.AsFloat;
            end;
        end;
      datm_gerar_consolidada.qry_lista_proc_.Next;
     end;

  if I = 0 then
   begin
    BoxMensagem('Não Existe Processos Selecionados!',2);
    Exit;
   end;
   //--------------------------------------------------
 if cd_via_transp = '04' then
  begin
     prefixo := 'EAM';
       if edt_master.text <>'' then
         begin
          BoxMensagem('Já foi gerado uma Consolidada para os Processos Selecionados!',2);
          Exit;
         end;

       if edt_nr_voo.text ='' then
         begin
          BoxMensagem('Necessário preencher o Numero do Vôo!',2);
          edt_nr_voo.Setfocus;
          Exit;
         end;

       if msk_dt_voo.text ='  /  /    ' then
         begin
          BoxMensagem('Necessário preencher a Data do Vôo!',2);
          msk_dt_voo.SetFocus;
          Exit;
         end;
       cd_cia:= msk_cd_cia_aerea.text;
       cd_armador:='';
   end;

 if cd_via_transp = '01' then
   begin
     prefixo := 'EMM';
     if edt_nr_book.text = '' then
         begin
         BoxMensagem('Necessário preencher o Numero de Booking!',2);
          Exit;
         end;

       if edt_nr_voo.text ='' then
         begin
          BoxMensagem('Necessário preencher o Numero do Viagem!',2);
          edt_nr_voo.Setfocus;
          Exit;
         end;

       if msk_dt_voo.text ='  /  /    ' then
         begin
          BoxMensagem('Necessário preencher a Data do Viagem!',2);
          msk_dt_voo.SetFocus;
          Exit;
         end;

       if rdgroup_estufagem.ItemIndex = 0  then
          tp_estufagem:='0';
       if rdgroup_estufagem.ItemIndex = 1  then
          tp_estufagem:='1';
       if rdgroup_estufagem.ItemIndex = 2  then
          tp_estufagem:='2';

       cd_cia:= '';
       cd_armador:=msk_cd_cia_aerea.text;;
    end;

   if strtodatetime(msk_dt_voo.text) < dt_server then
    begin
     BoxMensagem('A data do Vôo é inferior a Hoje!',3);
     msk_dt_voo.setFocus;
     Exit;
    end;

 if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
 try
  if cd_via_transp = '04' then
     begin
      nr_conhecimento:=frm_pedido_instrucao.busca_conhec_master(msk_cd_cia_aerea.text);
      if nr_conhecimento  = '' then
       begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Boxmensagem('Não existe conhecimento para esta companhia! Operação cancelada.',2);
        Exit;
       end;
     end;

      i:= 0;
     with TQuery.Create(Application) do
      begin
           DataBaseName:='DBBROKER';
           Sql.Clear;  //buscar numero de registro do master
           Sql.Add(' SELECT ISNULL(MAX(SUBSTRING(cd_master,8,4)), "0000") FROM TMASTER ');
           Sql.Add(' WHERE CD_UNID_NEG =  "'+msk_cd_unid_aerea.text+'"');
           Sql.Add('  AND CD_PRODUTO  =  "'+msk_cd_prod_aerea.text+'"');
           Sql.Add('  AND CD_VIA_TRANSP = "'+ cd_via_transp+'"');
           Open;
           if Fields[0].AsString = '' then
              st_cd_master:=msk_cd_unid_aerea.text + msk_cd_prod_aerea.text + prefixo +'0001/'+ copy(DateToStr(dt_server),9,2)
           else
           begin
            fl_cd_master:= (strtofloat(Fields[0].AsString)) + 1;//(strtofloat(copy(Fields[0].AsString,2,6))) + 1;
            st_cd_master:= msk_cd_unid_aerea.text + msk_cd_prod_aerea.text + prefixo + formatfloat('0000',fl_cd_master)+'/'+copy(DateToStr(dt_server),9,2);
           end;

           Close;
           Sql.Clear;
           Sql.Add('INSERT INTO TMASTER(CD_MASTER,CD_UNID_NEG, CD_PRODUTO,  NR_MASTER, CD_VIA_TRANSP, TP_MASTER, ');
           Sql.Add(' CD_AGENTE, CD_MOEDA, CD_CIA_TRANSP, CD_ORIGEM, CD_DESTINO, TP_FRETE_MASTER, CD_ARMADOR, ');
           Sql.Add(' TP_ESTUFAGEM, NR_VOO, DT_PREV_SAIDA, NR_BOOKING, VOL_MASTER, GROSS_MASTER,CHARG_MASTER, CD_VEICULO)');
           Sql.Add(' VALUES (:CD_MASTER,:CD_UNID_NEG, :CD_PRODUTO,  :NR_MASTER, :CD_VIA_TRANSP, :TP_MASTER, ');
           Sql.Add(' :CD_AGENTE, :CD_MOEDA, :CD_CIA_TRANSP, :CD_ORIGEM, :CD_DESTINO, ');
           Sql.Add(' :TP_FRETE_MASTER, :CD_ARMADOR, :TP_ESTUFAGEM, :NR_VOO, :DT_PREV_SAIDA,:NR_BOOKING,');
           Sql.Add(' :VOL_MASTER, :GROSS_MASTER, :CHARG_MASTER,:CD_VEICULO)');
           Params[0].AsString:= st_cd_master;
           Params[1].AsString:= msk_cd_unid_aerea.text;
           Params[2].AsString:= msk_cd_prod_aerea.text;
           Params[3].AsString:= nr_conhecimento;
           Params[4].AsString:= cd_via_transp;
           Params[5].AsString:= '1';
           Params[6].AsString:= msk_cd_agente_aerea.text;
           Params[7].AsString:= msk_cd_moeda_aerea.text;
           Params[8].AsString:= cd_cia;
           Params[9].AsString:= msk_cd_orig_aerea.text;
           Params[10].AsString:=msk_cd_dest_aerea.text;
           Params[11].AsString:='1';
           Params[12].AsString:= cd_armador;
           Params[13].AsString:=tp_estufagem;
           Params[14].AsString:=edt_nr_voo.text;
           Params[15].AsDateTime:=strtodatetime(msk_dt_voo.text);
           Params[16].AsString:=edt_nr_book.text;
           Params[17].AsFloat := vl_qtde;
           Params[18].AsFloat := vl_gross;
           Params[19].AsFloat := vl_charg;
           Params[20].AsString:= msk_cd_navio.TEXT;
           ExecSql;
           Free;
       end;

     atz_inclui_house(nr_conhecimento, st_cd_master, 0);

     datm_main.db_broker.Commit;
     except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        exit;
       end;
    end;
  edt_master.text:=nr_conhecimento;
  datm_gerar_consolidada.qry_proc_conhec_.Close;
  datm_gerar_consolidada.qry_proc_conhec_.ParamByName('CD_MASTER').AsString:=st_cd_master;
  datm_gerar_consolidada.qry_proc_conhec_.Prepare;
  datm_gerar_consolidada.qry_proc_conhec_.Open;

  pnl_selecao.SendToback;
  pnl_master.BringToFront;
  pnl_lista_marit.SendToback;
  rdgroup_estufagem.Enabled:=false;
  btn_marcar.Enabled:=false;
  mi_marca.Enabled:=false;
  btn_liberar.Enabled:=false;
  mi_gera_conso.Enabled:=false;
  edt_nr_voo.Enabled:=false;
  msk_dt_voo.Enabled:=false;
  edt_nr_book.Enabled:=false;

end;

procedure Tfrm_gerar_consolidada.FormCreate(Sender: TObject);
begin
 Application.CreateForm(Tdatm_gerar_consolidada, datm_gerar_consolidada );
 vl_gross:=0;
 vl_charg:=0;
 vl_qtde:=0;
end;

procedure Tfrm_gerar_consolidada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 datm_gerar_consolidada.qry_lista_proc_.close;
 datm_gerar_consolidada.qry_proc_conhec_.close;
 datm_gerar_consolidada.Free;
end;

procedure Tfrm_gerar_consolidada.dbgrid_aereoCellClick(Column: TColumn);
begin
 if dbgrid_aereo.SelectedIndex = 0  then

 //if grid_remessa.SelectedField.DataType = ftBoolean then
     SaveBoolean();
 dbgrid_aereo.Repaint;

end;

procedure Tfrm_gerar_consolidada.dbgrid_aereoColEnter(Sender: TObject);
begin
 if  dbgrid_aereo.SelectedIndex = 0 then
 //if grid_remessa.SelectedField.DataType = ftBoolean then

 begin

  FOriginalOptions := dbgrid_aereo.Options;

  dbgrid_aereo.Options := dbgrid_aereo.Options - [dgEditing];

 end;

end;

procedure Tfrm_gerar_consolidada.dbgrid_aereoColExit(Sender: TObject);
begin

 if  dbgrid_aereo.SelectedIndex = 0 then
 //if grid_remessa.SelectedField.DataType = ftBoolean then

  dbgrid_aereo.Options := FOriginalOptions;

end;

procedure Tfrm_gerar_consolidada.dbgrid_aereoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const

 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,

     DFCS_BUTTONCHECK or DFCS_CHECKED);

var

 CheckBoxRectangle : TRect;
 ctrl_booleano :Boolean;

begin

 if  Column.FieldName = 'IN_SELECIONADO' then

// if Column.Field.DataType = ftBoolean then

 begin
 if datm_gerar_consolidada.qry_lista_proc_IN_SELECIONADO.AsString = '0' then
   ctrl_booleano :=false
 else ctrl_booleano:= true;



 dbgrid_aereo.Canvas.FillRect(Rect);

 CheckBoxRectangle.Left := Rect.Left + 2;

 CheckBoxRectangle.Right := Rect.Right - 2;

 CheckBoxRectangle.Top := Rect.Top + 2;

 CheckBoxRectangle.Bottom := Rect.Bottom - 2;

 DrawFrameControl(dbgrid_aereo.Canvas.Handle,

      CheckBoxRectangle,

      DFC_BUTTON,

      CtrlState[ctrl_booleano]);

end;


end;

procedure Tfrm_gerar_consolidada.SaveBoolean;
begin
 if not(datm_gerar_consolidada.qry_lista_proc_.State in [dsEdit])then
   datm_gerar_consolidada.qry_lista_proc_.Edit;

 if datm_gerar_consolidada.qry_lista_proc_IN_SELECIONADO.AsString = '0' then
  datm_gerar_consolidada.qry_lista_proc_IN_SELECIONADO.AsString :='1'
 else datm_gerar_consolidada.qry_lista_proc_IN_SELECIONADO.AsString := '0' ;

 if in_pre_alerta then
   datm_gerar_consolidada.qry_lista_proc_IN_PEDIDO.AsString := '1';

 datm_gerar_consolidada.qry_lista_proc_.Post;
end;

procedure Tfrm_gerar_consolidada.dbgrid_maritimoCellClick(Column: TColumn);
begin
 if dbgrid_maritimo.SelectedIndex = 0  then

 //if grid_remessa.SelectedField.DataType = ftBoolean then
     SaveBoolean();
 dbgrid_maritimo.Repaint;

end;

procedure Tfrm_gerar_consolidada.dbgrid_maritimoColEnter(Sender: TObject);
begin
 if  dbgrid_maritimo.SelectedIndex = 0 then
 //if grid_remessa.SelectedField.DataType = ftBoolean then

 begin

  FOriginalOptions := dbgrid_maritimo.Options;

  dbgrid_maritimo.Options := dbgrid_maritimo.Options - [dgEditing];

 end;

end;

procedure Tfrm_gerar_consolidada.dbgrid_maritimoColExit(Sender: TObject);
begin

 if  dbgrid_maritimo.SelectedIndex = 0 then
 //if grid_remessa.SelectedField.DataType = ftBoolean then

  dbgrid_maritimo.Options := FOriginalOptions;

end;

procedure Tfrm_gerar_consolidada.dbgrid_maritimoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const

 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,

     DFCS_BUTTONCHECK or DFCS_CHECKED);

var

 CheckBoxRectangle : TRect;
 ctrl_booleano :Boolean;

begin

 if  Column.FieldName = 'IN_SELECIONADO' then

// if Column.Field.DataType = ftBoolean then

 begin
 if datm_gerar_consolidada.qry_lista_proc_IN_SELECIONADO.AsString = '0' then
   ctrl_booleano :=false
 else ctrl_booleano:= true;



 dbgrid_maritimo.Canvas.FillRect(Rect);

 CheckBoxRectangle.Left := Rect.Left + 2;

 CheckBoxRectangle.Right := Rect.Right - 2;

 CheckBoxRectangle.Top := Rect.Top + 2;

 CheckBoxRectangle.Bottom := Rect.Bottom - 2;

 DrawFrameControl(dbgrid_maritimo.Canvas.Handle,

      CheckBoxRectangle,

      DFC_BUTTON,

      CtrlState[ctrl_booleano]);

end;


end;

procedure Tfrm_gerar_consolidada.msk_cd_navioExit(Sender: TObject);
begin
if msk_cd_navio.text <> '' then
  begin
   ValCodEdt(msk_cd_navio);
   with Tquery.Create(Application) do
    begin
     DatabaseName:='DBBROKER';
     Sql.add('SELECT NM_EMBARCACAO FROM TEMBARCACAO WHERE CD_EMBARCACAO = "'+msk_cd_navio.text+'"');
     Open;
     if recordcount > 0 then
      edt_nm_navio.text:=Fields[0].AsString
     else
       begin
        Boxmensagem('Código do Navio Inválido!',2);
        msk_cd_navio.SetFocus;
        edt_nm_navio.text:='';
       end;
     Free;
    end;
  end
else  edt_nm_navio.text:='';
end;

procedure Tfrm_gerar_consolidada.btn_co_navioClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
  str_cd_rotina := '2269';
Application.CreateForm(Tfrm_veiculo, frm_veiculo);
  with frm_veiculo Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_veiculo.Cons_OnLine_Texto <> '' ) then
  begin
    msk_cd_navio.text:=frm_veiculo.Cons_OnLine_Texto;
    msk_cd_navioExit(Sender);
  end;
end;

procedure Tfrm_gerar_consolidada.atz_inclui_house(const nr_conhec_master, cd_master:String; I:real);
VAR nr_conhec_house:string[30];
   gross, charg, qtde:real;
   HOUSE:TQuery;
begin
 gross:=0;  charg:=0;  qtde:=0;

 datm_gerar_consolidada.qry_lista_proc_.First;

 HOUSE := TQuery.Create(Application);
 HOUSE.DataBaseName:='DBBROKER';

 while Not(datm_gerar_consolidada.qry_lista_proc_.EOF) do
  begin
   if datm_gerar_consolidada.qry_lista_proc_IN_SELECIONADO.AsString = '1' then
    begin
     I:= I + 1 ;
     if (cd_via_transp = '04' )then
      begin
       gross:= gross + datm_gerar_consolidada.qry_lista_proc_VL_PESO_BRUTO.AsFloat;
       charg:= charg + datm_gerar_consolidada.qry_lista_proc_CHARGEABLE.AsFloat;
       qtde := qtde  + datm_gerar_consolidada.qry_lista_proc_QTD_VOLUME.AsFloat;
      end;

     HOUSE.Sql.Clear;                 //verifica se o processo veio de um estorno do pre - alerta (GEstão do ag)
     HOUSE.Sql.Add('SELECT CD_MASTER, CD_HOUSE, NR_PROCESSO, IN_ESTORNO FROM THOUSE WHERE NR_PROCESSO = "'+datm_gerar_consolidada.qry_lista_proc_NR_PROCESSO.AsString+'"');
     HOUSE.Open;
     if HOUSE.Fields[3].AsString = '1' then
      begin
       HOUSE.Close;
       HOUSE.Sql.Clear;
       HOUSE.Sql.Add('UPDATE THOUSE SET CD_MASTER =:CD_MASTER, CD_HOUSE=:CD_HOUSE,NR_MASTER = :NR_MASTER,');
       HOUSE.  Sql.Add(' IN_ESTORNO = "0" WHERE NR_PROCESSO=:NR_PROCESSO');
       HOUSE.  Params[0].AsString:= cd_master;
       HOUSE.  Params[1].AsString:= cd_master + '/' + formatfloat('00',i);
       HOUSE.  Params[2].AsString:= nr_conhec_master;
       HOUSE.  Params[3].AsString:= datm_gerar_consolidada.qry_lista_proc_NR_PROCESSO.AsString;
       HOUSE.  ExecSql;
      end
     else
      begin
       if cd_via_transp = '04' then
        nr_conhec_house:=frm_pedido_instrucao.busca_conhec_house(msk_cd_unid_aerea.text)
       else
        nr_conhec_house:= copy(datm_gerar_consolidada.qry_lista_proc_NR_PROCESSO.AsString,5,10);
        
       HOUSE.Close;
       HOUSE.Sql.Clear;
       HOUSE.Sql.Add('INSERT INTO THOUSE (CD_MASTER, NR_MASTER, NR_HOUSE, CD_HOUSE, NR_PROCESSO)');
       HOUSE.Sql.Add('VALUES (:CD_MASTER, :NR_MASTER, :NR_HOUSE, :CD_HOUSE, :NR_PROCESSO)');
       HOUSE.Params[0].AsString:= cd_master;
       HOUSE.Params[1].AsString:= nr_conhec_master;
       HOUSE.Params[2].AsString:= nr_conhec_house;
       HOUSE.Params[3].AsString:= cd_master + '/' + formatfloat('00',i);
       HOUSE.Params[4].AsString:= datm_gerar_consolidada.qry_lista_proc_NR_PROCESSO.AsString;
       HOUSE.ExecSql;

       frm_pedido_instrucao.insere_tarifa_despesas(datm_gerar_consolidada.qry_lista_proc_NR_PROCESSO.AsString,
               datm_gerar_consolidada.qry_lista_proc_TP_ESTUFAGEM.AsString,
               datm_gerar_consolidada.qry_lista_proc_CD_INCOTERM.AsString,
               datm_gerar_consolidada.qry_lista_proc_NR_PROPOSTA.AsString,
               datm_gerar_consolidada.qry_lista_proc_CD_PRODUTO.AsString,
               datm_gerar_consolidada.qry_lista_proc_CD_SERVICO.AsString,
               datm_gerar_consolidada.qry_lista_proc_CD_TAB_FRETE_VENDA.AsString);
       end;
    end;
    datm_gerar_consolidada.qry_lista_proc_.Next;
   end;

   if (in_only_house or in_pre_alerta) and (cd_via_transp = '04')then
    begin
    HOUSE.Sql.Clear;
    HOUSE.Sql.Add(' UPDATE TMASTER SET VOL_MASTER = VOL_MASTER + :VOL_MASTER, GROSS_MASTER = GROSS_MASTER + :GROSS_MASTER, ');
    HOUSE.Sql.Add(' CHARG_MASTER = CHARG_MASTER + :CHARG_MASTER WHERE CD_MASTER = :CD_MASTER');
    HOUSE.Params[0].AsFloat := qtde;
    HOUSE.Params[1].Asfloat := gross;
    HOUSE.Params[2].Asfloat := charg;
    HOUSE.Params[3].AsString:= cd_master;
    HOUSE.ExecSql;
    end;
    HOUSE.Free;
 end;
procedure Tfrm_gerar_consolidada.btn_inclir_houseClick(Sender: TObject);
var MASTER:TQuery;
    cont:real;
begin

  MASTER:= Tquery.Create(Application);
  MASTER.DAtaBaseName := 'DBBROKER';
  MASTER.Sql.Add('SELECT COUNT(CD_HOUSE) FROM THOUSE WHERE CD_MASTER = "'+cd_master+'"');
  MASTER.Open;

  cont := MASTER.Fields[0].AsFloat ;

  MASTER.Free;

 // if cd_via_transp = '04'
    atz_inclui_house(edt_master.text, cd_master, cont);
 // else atz_inclui_house(nr_master, cd_master, cont)

  datm_gerar_consolidada.qry_proc_conhec_.Close;
  datm_gerar_consolidada.qry_proc_conhec_.ParamByName('CD_MASTER').AsString:= cd_master;
  datm_gerar_consolidada.qry_proc_conhec_.Prepare;
  datm_gerar_consolidada.qry_proc_conhec_.Open;

  pnl_selecao.SendToback;
  pnl_master.BringToFront;
  pnl_lista_marit.SendToback;

  rdgroup_estufagem.Enabled := false;
  btn_marcar.Enabled        := false;
  mi_marca.Enabled          := false;
  btn_liberar.Enabled       := false;
  mi_gera_conso.Enabled     := false;
  edt_nr_voo.Enabled        := false;
  msk_dt_voo.Enabled        := false;
  edt_nr_book.Enabled       := false;

end;

procedure Tfrm_gerar_consolidada.edt_nr_bookExit(Sender: TObject);
var BOOKING:TQuery;
begin

 if cd_via_transp <> '01' then exit;

 BOOKING := TQuery.Create(Application) ;
 BOOKING.DataBaseName := 'DBBROKER';
 BOOKING.Sql.Add('SELECT COUNT(CD_MASTER) FROM TMASTER WHERE NR_BOOKING = "'+edt_nr_book.text+'"');
 BOOKING.Open;

 if BOOKING.Fields[0].AsInteger > 0 then
  begin
   Boxmensagem('Já existe um Master aberto para este numero de Booking',2);
   edt_nr_book.SetFocus;
   BOOKING.Free;
   Exit;
  end;
  BOOKING.Free;

end;

end.
