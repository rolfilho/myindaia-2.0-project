  {
   Programador: Carlos Alberto
   Data       : 18/11/2008
   Finalidade : Re-Organização do fonte e a
   criação do filtro por agencia e cia/armador
  }


unit uFreteServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, DBCtrls, ExtCtrls, RxDBComb, Mask, Grids,
  DBGrids, ComCtrls, Buttons, DB, DBTables, ToolEdit, RXDBCtrl;

type
  Tfrm_frete_serv = class(TForm)
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_duplica_frete: TSpeedButton;
    btn_iata: TSpeedButton;
    pcModulo: TPageControl;
    TabImportacao: TTabSheet;
    TabIATA: TTabSheet;
    pgctrl_frete: TPageControl;
    ts_lista: TTabSheet;
    dbGrid_Lista: TDBGrid;
    ts_dados_cia_armador: TTabSheet;
    pParametros: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    dbrgrpDesemb1: TDBRadioGroup;
    pcTarifas: TPageControl;
    TabTarifaAerea: TTabSheet;
    Label20: TLabel;
    dbgrid_tarifa_aerea: TDBGrid;
    Label21: TLabel;
    dbgrid_despesa_aerea: TDBGrid;
    TabTarifaMaritima: TTabSheet;
    PageControl1: TPageControl;
    TabLCL: TTabSheet;
    Label27: TLabel;
    Label29: TLabel;
    dbgrid_tarifas_LCL: TDBGrid;
    dbgrid_despesa_LCL: TDBGrid;
    TabFCL: TTabSheet;
    Label28: TLabel;
    Label30: TLabel;
    dbgrid_tarifas_FCL: TDBGrid;
    dbgrid_despesa_FCL: TDBGrid;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Shape2: TShape;
    Label19: TLabel;
    Shape3: TShape;
    Label24: TLabel;
    Shape1: TShape;
    Label33: TLabel;
    Panel7: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btn_co_origem_frete: TSpeedButton;
    btn_co_destino: TSpeedButton;
    Label9: TLabel;
    lblCia_Armador: TLabel;
    btn_co_armador_cia: TSpeedButton;
    btn_co_agencia: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    edt_nm_origem: TEdit;
    edt_nm_destino: TEdit;
    msk_cd_origem: TMaskEdit;
    msk_cd_destino: TMaskEdit;
    rgVIA_TRANSP: TRadioGroup;
    msk_cd_agencia: TMaskEdit;
    msk_nm_agencia: TEdit;
    msk_cd_cia_armador: TMaskEdit;
    msk_nm_cia_armador: TEdit;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lblOrigem: TLabel;
    lblDestino: TLabel;
    shp_tipo_frete: TShape;
    pmRepasse: TPopupMenu;
    miRepasseDados: TMenuItem;
    dbedt_dt_validade: TDBDateEdit;
    Label15: TLabel;
    DBText1: TDBText;
    rdgrupo_tp_frete: TRadioGroup;
    pAgente: TPanel;
    dbedt_cd_agencia: TDBEdit;
    dbedt_nm_agencia: TDBEdit;
    Label6: TLabel;
    btn_co_agencia_edt: TSpeedButton;
    pCia_Armador: TPanel;
    dbedt_cd_cia_armador: TDBEdit;
    dbedt_nm_cia_armador: TDBEdit;
    btn_co_armador_cia_edt: TSpeedButton;
    lblCia_Armador_Edt: TLabel;
    Label26: TLabel;
    dbOBS_FRETE: TDBMemo;
    pnl_moeda: TPanel;
    Label8: TLabel;
    dbedt_cd_moeda: TDBEdit;
    bnt_moeda: TSpeedButton;
    dbedt_nm_moeda: TDBEdit;
    Label11: TLabel;
    rxcombx_tp_carga_ag: TRxDBComboBox;
    Label32: TLabel;
    dbedt_nr_transit_ag: TDBEdit;
    look_tp_transit_ag: TRxDBComboBox;
    Label10: TLabel;
    dbedt_nr_freq_ag: TDBEdit;
    look_tp_freq_ag: TDBLookupComboBox;
    lblVia_Transp: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_origem_freteClick(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgVIA_TRANSPClick(Sender: TObject);
    procedure realiza_pesquisa;
    procedure btn_co_agenciaClick(Sender: TObject);
    procedure btn_co_armador_ciaClick(Sender: TObject);
    procedure dbGrid_ListaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure msk_cd_origemExit(Sender: TObject);
    procedure msk_cd_destinoExit(Sender: TObject);
    procedure pgctrl_freteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_agenciaExit(Sender: TObject);
    procedure msk_cd_cia_armadorExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure bnt_moedaClick(Sender: TObject);
    procedure msk_cd_origemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_incluirClick(Sender: TObject);
    procedure ts_listaShow(Sender: TObject);
    procedure ts_dados_cia_armadorShow(Sender: TObject);
    procedure dbrgrpDesemb1Change(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbedt_nr_freq_agChange(Sender: TObject);
    procedure btn_co_agencia_edtClick(Sender: TObject);
    procedure btn_co_armador_cia_edtClick(Sender: TObject);
    procedure dbGrid_ListaDblClick(Sender: TObject);
    procedure dbgrid_despesa_aereaEnter(Sender: TObject);
    procedure dbgrid_tarifas_LCLExit(Sender: TObject);
    procedure dbgrid_despesa_aereaColExit(Sender: TObject);
    procedure dbgrid_despesa_aereaDblClick(Sender: TObject);
    procedure dbgrid_despesa_aereaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_LCLKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_FCLKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_aereaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_tarifa_aereaExit(Sender: TObject);
    procedure dbgrid_tarifas_FCLExit(Sender: TObject);
    procedure Status_Botoes(Sender: TObject);
    procedure dbedt_cd_agenciaExit(Sender: TObject);
    procedure dbedt_cd_cia_armadorExit(Sender: TObject);
    procedure rdgrupo_tp_freteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_freteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
     procedure btn_mi(Inc, Salv, Canc, Exc: Boolean);
     procedure insere_tarifas(var tab: string);
     procedure Cancelar;
     function Consiste: Boolean;
     function VerAlt   : Boolean;
  public
    { Public declarations }
     Modulo,st_tp_frete,str_ap_origem,str_ap_destino,str_tp_carga :string;
     bl_IATA, lCons_OnLine :Boolean;
     st_modificar, st_incluir, st_excluir : Boolean;
     permissao:Boolean; { essa variaevel foi colocada pq verifiquei que para abrir o form a query da lista
                          abria varias vezes e isso foi para controlar a abertura da query apenas apos o showmodal }

     function Grava: Boolean;
  end;

var
  frm_frete_serv: Tfrm_frete_serv;
  tab_frete,st_via_transp :String;
  perc_iata               :Real;

implementation
Uses ConsOnLineEx, dFreteServ, GSMLIB, PGGP017, PGGP001;


{$R *.dfm}

procedure Tfrm_frete_serv.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_frete_serv.btn_co_origem_freteClick(Sender: TObject);
var
vTxtAux, vTitAux: string;
begin
  if st_via_transp = '01' then begin
    vTxtAux := ' TP_PORTO = "1" ';
    vTitAux := 'Cadastro de Portos';
  end else if st_via_transp = '04' then begin
    vTxtAux := ' TP_PORTO = "0" ';
    vTitAux := 'Cadastro de Aeroportos';
  end;

  if (in_trade = '0') and (modulo = 'E') then
   vTxtAux := ' CD_PAIS = "105" AND ' + vTxtAux;


  if Sender is TSpeedButton then
    msk_cd_origem.Text := ConsultaOnLineExSQL(' SELECT CD_PORTO, NM_PORTO, (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE ' +
                                              '  FROM TPORTO (NOLOCK) WHERE ' + vTxtAux, vTitAux,
                                              ['CD_PORTO', 'NM_PORTO', 'CIDADE'], ['Código', 'Porto/Aeroporto', 'Cidade'], 'CD_PORTO', nil, msk_cd_origem.Text)
  else
    edt_nm_origem.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', msk_cd_origem.Text, 'NM_PORTO');

end;

procedure Tfrm_frete_serv.btn_co_destinoClick(Sender: TObject);
var
    vTxtAux, vTitAux: string;
begin
  if st_via_transp = '01' then begin
    vTxtAux := ' TP_PORTO = "1" ';
    vTitAux := 'Cadastro de Portos';
  end else if st_via_transp = '04' then begin
    vTxtAux := ' TP_PORTO = "0" ';
    vTitAux := 'Cadastro de Aeroportos';
  end;


  if Sender is TSpeedButton then
    msk_cd_destino.Text := ConsultaOnLineExSQL(' SELECT CD_PORTO, NM_PORTO, (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE ' +
                                              '  FROM TPORTO (NOLOCK) WHERE ' + vTxtAux, vTitAux,
                                              ['CD_PORTO', 'NM_PORTO', 'CIDADE'], ['Código', 'Porto/Aeroporto', 'Cidade'], 'CD_PORTO', nil, msk_cd_origem.Text)
  else
    edt_nm_destino.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', msk_cd_destino.Text, 'NM_PORTO');



end;

procedure Tfrm_frete_serv.FormShow(Sender: TObject);
begin
  permissao:= true;

  rgVia_Transp.OnClick(sender);



  if (Modulo = 'I') or (Modulo='E') then begin
     pcModulo.Pages[1].TabVisible :=false;
     pcModulo.Pages[1].Highlighted:=false;
     pcModulo.Pages[0].TabVisible :=True;
     pcModulo.Pages[0].Highlighted:=True;
     if Modulo = 'I' then
        pcModulo.Pages[0].Caption:='IMPORTAÇÂO'
     else
        pcModulo.Pages[0].Caption:='EXPORTAÇÂO';
  end;
  if Modulo = 'A' then begin
     pcModulo.Pages[0].TabVisible :=False;
     pcModulo.Pages[0].Highlighted:=False;
     pcModulo.Pages[1].TabVisible :=True;
     pcModulo.Pages[1].Highlighted:=True;
  end;
  {fim}



  pnl_cadastro.Color := clMenuBroker;

  if modulo ='I' then  begin
//    rdgrupo_tp_frete.Visible              := false;
    st_via_transp                         := '04';
  end;

  realiza_pesquisa;


  rdgrupo_tp_frete.Visible    := (Modulo = 'E');

end;

procedure Tfrm_frete_serv.rgVIA_TRANSPClick(Sender: TObject);
var
i:Integer;
begin
  msk_cd_destino.text     := '';
  edt_nm_destino.text     := '';
  edt_nm_origem.text      := '';
  msk_cd_origem.text      := '';
  msk_cd_agencia.Text     := '';
  msk_nm_agencia.Text     := '';
  msk_cd_cia_armador.Text := '';
  msk_nm_cia_armador.Text := '';
 {
     limpa as colunas variaveis do Grid de Lista e
     Exibir as colunas pertinentes a Transporte Aereo ou Maritimo
  }
  //maritimo
  dbGrid_Lista.Columns[4].Visible:=False;
  dbGrid_Lista.Columns[5].Visible:=False;
  //aereo
  dbGrid_Lista.Columns[6].Visible:=False;
  dbGrid_Lista.Columns[7].Visible:=False;

  //Exibir a Guia Correspondente
  for i:=0 to pcTarifas.PageCount-1 do begin
     pcTarifas.Pages[i].TabVisible :=(rgVia_Transp.ItemIndex=i);
     pcTarifas.Pages[i].Highlighted:=(rgVia_Transp.ItemIndex=i);
  end;

  if rgVia_Transp.ItemIndex = 0 then begin
     lblCia_Armador.Caption     :='Compánhia';
     lblCia_Armador_Edt.Caption :='Compánhia';
     lblVia_Transp.Caption      :='(  Aéreo  )';
     dbGrid_Lista.Columns[4].Visible:=True;
     dbGrid_Lista.Columns[5].Visible:=True;

     dbedt_cd_cia_armador.DataField:='CD_CIA_TRANSP_TAB_FRETE';
     dbedt_nm_cia_armador.DataField:='NM_CIA_TRANSP';
  end else begin
     lblCia_Armador.Caption     :='Armador';
     lblCia_Armador_Edt.Caption :='Armador';
     lblVia_Transp.Caption      :='( Marítimo )';
     dbGrid_Lista.Columns[6].Visible:=True;
     dbGrid_Lista.Columns[7].Visible:=True;

     dbedt_cd_cia_armador.DataField:='CD_ARMADOR';
     dbedt_nm_cia_armador.DataField:='NM_ARMADOR';

  end;

  if permissao then
   realiza_pesquisa;

end;

procedure Tfrm_frete_serv.realiza_pesquisa;
begin
  datm_frete_serv.qry_lista_.Close;

  if Modulo ='I' then begin
    datm_frete_serv.qry_lista_.ParamByName('TP_EMP_FRETE').AsString:='1';
    st_tp_frete := '1';

    pnl_moeda.Enabled:=true;

  end;

  if Modulo ='E' then begin

     // *** CIA Custo ***
     if rdgrupo_tp_frete.ItemIndex = 0 then begin
        datm_frete_serv.qry_lista_.ParamByName('TP_EMP_FRETE').AsString := '0';

        // *** Frete Aereo ***
        if rgVia_Transp.itemIndex = 0 then begin
          { agente  }
           dbgrid_lista.Columns.Items[2].Visible := false;
           dbgrid_lista.Columns.Items[3].Visible := false;
          {   cia   }
           dbgrid_lista.Columns.Items[4].Visible := true;
           dbgrid_lista.Columns.Items[5].Visible := true;
          { armador }
           dbgrid_lista.Columns.Items[6].Visible := false;
           dbgrid_lista.Columns.Items[7].Visible := false;
        end;

        // *** Frete maritimo ***
        if rgVia_Transp.itemIndex = 1 then begin
          { agente  }
           dbgrid_lista.Columns.Items[2].Visible := false;
           dbgrid_lista.Columns.Items[3].Visible := false;
          {   cia   }
           dbgrid_lista.Columns.Items[4].Visible := false;
           dbgrid_lista.Columns.Items[5].Visible := false;
          { armador }
           dbgrid_lista.Columns.Items[6].Visible := true;
           dbgrid_lista.Columns.Items[7].Visible := true;
        end;

//        atz_grids('0');
//        ts_dados_cia_armador.TabVisible   := true;
        btn_duplica_frete.Visible         := True;
        st_tp_frete                       := '0';
        dbgrid_tarifa_aerea.SelectedIndex :=  2;
        dbgrid_tarifas_LCL.SelectedIndex  :=  1;
        dbgrid_tarifas_FCL.SelectedIndex  :=  2;

        pAgente.Visible:=False;
     end;

     // *** Agente Custo ***
     if rdgrupo_tp_frete.ItemIndex = 1 then begin
        datm_frete_serv.qry_lista_.ParamByName('TP_EMP_FRETE').AsString := '1';
//      datm_frete_serv.qry_lista_.Sql[1]                               := 'TT.CD_AGENTE_TAB_FRETE AS CODIGO,(SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TT.CD_AGENTE_TAB_FRETE = TA.CD_AGENTE) NM_REF';
//      dbgrid_lista.Columns.Items[1].Visible       := true;

//      atz_grids('1');
//      ts_dados_cia_armador.TabVisible   := false;

      // *** Frete Aereo ou Frete Maritimo ***
      { agente  }
      dbgrid_lista.Columns.Items[2].Visible := true;
      dbgrid_lista.Columns.Items[3].Visible := true;
      {   cia   }
      dbgrid_lista.Columns.Items[4].Visible := false;
      dbgrid_lista.Columns.Items[5].Visible := false;
      { armador }
      dbgrid_lista.Columns.Items[6].Visible := false;
      dbgrid_lista.Columns.Items[7].Visible := false;
      //
      btn_duplica_frete.Visible         := False;
      st_tp_frete                       := '1';
      dbgrid_tarifa_aerea.SelectedIndex := 3;
      dbgrid_tarifas_LCL.SelectedIndex  := 2;
      dbgrid_tarifas_FCL.SelectedIndex  := 3;

      pAgente.Visible:=True;
    end;

    pnl_moeda.Enabled:=False;
  end;

  datm_frete_serv.qry_lista_.ParamByName('CD_ORIGEM').AsString  := msk_cd_origem.text;
  datm_frete_serv.qry_lista_.ParamByName('CD_DESTINO').AsString := msk_cd_destino.text;
  datm_frete_serv.qry_lista_.ParamByName('CD_AGENCIA').AsString := msk_cd_Agencia.Text;

  // verifica a via de transporte
  datm_frete_serv.qry_lista_.ParamByName('CD_ARMADOR').AsString := '';
  datm_frete_serv.qry_lista_.ParamByName('CD_CIA').AsString     := '';

  if rgVIA_TRANSP.itemIndex = 0 then  begin
    datm_frete_serv.qry_lista_.ParamByName('CD_CIA').AsString      := msk_cd_cia_armador.Text;
    st_via_transp:= '04';
  end;

  if rgVIA_TRANSP.itemIndex = 1 then  begin
    datm_frete_serv.qry_lista_.ParamByName('CD_ARMADOR').AsString  := msk_cd_cia_armador.Text;
    st_via_transp:= '01';
  end;

  datm_frete_serv.qry_lista_.ParamByName('CD_VIA_TRANSP').AsString := st_via_transp;



  datm_frete_serv.qry_lista_.Prepare;
  datm_frete_serv.qry_lista_.Open;


end;



procedure Tfrm_frete_serv.btn_co_agenciaClick(Sender: TObject);
var
    vTxtAux, vTitAux: string;
begin
  if st_via_transp = '01' then begin
    vTxtAux := ' TP_PORTO = "1" ';
    vTitAux := 'Cadastro de Portos';
  end else if st_via_transp = '04' then begin
    vTxtAux := ' TP_PORTO = "0" ';
    vTitAux := 'Cadastro de Aeroportos';
  end;

  if Sender is TSpeedButton then
    msk_cd_Agencia.Text := ConsultaOnLineExFiltro('TAGENTE','Agente de Carga',['CD_AGENTE','NM_AGENTE'],['Código','Nome'],'CD_AGENTE','TP_AG = ''1''',nil, msk_CD_AGENCIA.Text)
  else
    msk_nm_agencia.Text := ConsultaLookUPSQL('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE = "'+ msk_CD_AGENCIA.Text + '" AND TP_AG = "1" ','NM_AGENTE');


end;

procedure Tfrm_frete_serv.btn_co_armador_ciaClick(Sender: TObject);
var
    vTxtAux, vTitAux: string;
begin
  if st_via_transp = '01' then begin
    vTxtAux := ' "1" ';
    vTitAux := 'Cadastro de Armadores';
  end else if st_via_transp = '04' then begin
    vTxtAux := ' "0" ';
    vTitAux := 'Cadastro de Companhias';
  end;

  if Sender is TSpeedButton then
    msk_cd_cia_armador.Text := ConsultaOnLineExSQL('SELECT CODIGO, DESCRICAO, APELIDO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux,vTitAux,['CODIGO','DESCRICAO', 'APELIDO'],['Código','Nome', 'Apelido'],'CODIGO',nil, msk_cd_cia_armador.Text )
  else
    msk_nm_cia_armador.Text := ConsultaLookUPSQL('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux+' AND CODIGO = "' + msk_cd_cia_armador.Text + '" ', 'DESCRICAO');


end;

procedure Tfrm_frete_serv.dbGrid_ListaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_DESEMBARACO').AsInteger = 0 then begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00B9FFB9;
    end else
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_DESEMBARACO').AsInteger = 1 then begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00FFC891;
    end else
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_DESEMBARACO').AsInteger = 2 then begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := clWhite;
    end;
    TDBGrid(Sender).Canvas.TextOut(Rect.Left + 2 ,Rect.Top+2, Column.Field.Text );
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrm_frete_serv.msk_cd_origemExit(Sender: TObject);
begin
  if msk_cd_origem.Text  <> '' then
     msk_cd_origem.Text := Copy('0000', 1, 4 - Length(msk_cd_origem.Text) ) + msk_cd_origem.Text;

  realiza_pesquisa;

end;

procedure Tfrm_frete_serv.msk_cd_destinoExit(Sender: TObject);
begin
  if msk_cd_destino.Text  <> '' then
     msk_cd_destino.Text := Copy('0000', 1, 4 - Length(msk_cd_destino.Text) ) + msk_cd_destino.Text;

  realiza_pesquisa;
end;

procedure Tfrm_frete_serv.pgctrl_freteChange(Sender: TObject);
begin
  if pgctrl_frete.ActivePageIndex=0 then
     btn_mi(st_incluir, false, false, false)
  else
     btn_mi(false, false, false, True);


  btn_duplica_frete.Enabled:= false;
  btn_iata.Visible         := false;

  with datm_frete_serv do  begin
    if pgctrl_frete.ActivePageIndex=1  then  begin
       qry_frete_.Close;
       if rgVia_Transp.ItemIndex = 0 then
         qry_frete_.ParamByName('CD_VIA_TRANSP').AsString := '04';

       if rgVia_Transp.ItemIndex = 1 then
         qry_frete_.ParamByName('CD_VIA_TRANSP').AsString := '01';


       qry_frete_.ParamByName('CD_ORIGEM').AsString    := msk_cd_origem.text;;
       qry_frete_.ParamByName('CD_DESTINO').AsString   := msk_cd_destino.text;;
       qry_frete_.ParamByName('TP_EMP_FRETE').AsString := datm_frete_serv.qry_lista_TP_EMP_FRETE.AsString;
//       qry_frete_.Sql[13] := ' AND TT.CD_AGENTE_TAB_FRETE = '+QuotedStr(datm_frete_serv.qry_lista_CODIGO.AsString)+
//       ' AND TT.CD_TAB_FRETE ='+QuotedStr(datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString);

       qry_frete_.Sql[13] :=  ' AND TT.CD_TAB_FRETE ='+QuotedStr(datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString);

       qry_frete_.Prepare;
       qry_frete_.Open;
       //
{
       dbedt_cd_moeda.ReadOnly     := false;
       bnt_moeda.Enabled           := true;
       rxcombx_tp_carga_ag.ReadOnly:= false;
       dbedt_nr_freq_ag.ReadOnly   := false;
       look_tp_freq_ag.ReadOnly    := false;
       dbedt_nr_transit_ag.ReadOnly:= false;
       look_tp_transit_ag.ReadOnly := false;
       dbedt_dt_validade.ReadOnly  := false;

       dbedt_cd_moeda.Color        := clWindow;
       rxcombx_tp_carga_ag.Color   := clWindow;
       dbedt_nr_freq_ag.Color      := clWindow;
       look_tp_freq_ag.Color       := clWindow;
       dbedt_nr_transit_ag.Color   := clWindow;
       look_tp_transit_ag.Color    := clWindow;
       dbedt_dt_validade.Color     := clWindow;
}
    end;
    //
    if pcTarifas.ActivePage = tabTarifaAerea then begin
       qry_item_.Close;
       qry_item_.ParamByName('CD_VIA_TRANSP').AsString := '04';
       qry_item_.Prepare;
       qry_item_.Open;
       //
       qry_tarifa_aerea_.Close;
       qry_tarifa_aerea_.ParamByName('CD_TAB_FRETE').AsString := datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString;//datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString;
       qry_tarifa_aerea_.ParamByName('TP_ESTUFAGEM').AsString := '0';
       qry_tarifa_aerea_.Prepare;
       qry_tarifa_aerea_.Open;
       //
       qry_frete_despesas_.close;
       qry_frete_despesas_.ParamByName('CD_TAB_FRETE').AsString := datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString; //datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString;
       qry_frete_despesas_.ParamByName('TP_ESTUFAGEM').AsString := '0';
       qry_frete_despesas_.Prepare;
       qry_frete_despesas_.Open;
       //
       qry_tp_base_calc_.Close;
       qry_tp_base_calc_.ParamByName('CD_VIA_TRANSP').AsString := '04';
       qry_tp_base_calc_.Prepare;
       qry_tp_base_calc_.Open;
       //
       dbgrid_tarifa_aerea.Columns.Items[0].ReadOnly := true;
       dbgrid_tarifa_aerea.Columns.Items[1].ReadOnly := true;
       if dbgrid_tarifa_aerea.Columns.Items[4].visible = true then
          btn_iata.Visible := true
       else
          btn_iata.Visible := false;

    end;

    if pcTarifas.ActivePage = tabTarifaMaritima then begin
       qry_item_.Close;
       qry_item_.ParamByName('CD_VIA_TRANSP').AsString := '01';
       qry_item_.Prepare;
       qry_item_.Open;
       //
       qry_tp_base_calc_.Close;
       qry_tp_base_calc_.ParamByName('CD_VIA_TRANSP').AsString := '01';
       qry_tp_base_calc_.Prepare;
       qry_tp_base_calc_.Open;
       //
       qry_tarifa_aerea_.Close;
       qry_tarifa_aerea_.ParamByName('CD_TAB_FRETE').AsString := datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString;
       qry_tarifa_aerea_.ParamByName('TP_ESTUFAGEM').AsString := '0';
       qry_tarifa_aerea_.Prepare;
       qry_tarifa_aerea_.Open;
       //
       qry_tarifas_FCL_.close;
       qry_tarifas_FCL_.ParamByName('CD_TAB_FRETE').AsString := datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString;
       qry_tarifas_FCL_.ParamByName('TP_ESTUFAGEM').AsString := '1';
       qry_tarifas_FCL_.Prepare;
       qry_tarifas_FCL_.Open;
       //
       qry_frete_despesas_.close;
       qry_frete_despesas_.ParamByName('CD_TAB_FRETE').AsString := datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString;
       qry_frete_despesas_.ParamByName('TP_ESTUFAGEM').AsString := '0';
       qry_frete_despesas_.Prepare;
       qry_frete_despesas_.Open;
       //
       qry_despesa_FCL_.close;
       qry_despesa_FCL_.ParamByName('CD_TAB_FRETE').AsString := datm_frete_serv.qry_lista_CD_TAB_FRETE.AsString;
       qry_despesa_FCL_.Prepare;
       qry_despesa_FCL_.Open;
    end;

  end;


{    if pgctrl_frete.ActivePage = ts_dados_iata then begin
       with datm_frete_serv do begin
         qry_item_iata_.close;
         qry_item_iata_.ParamByName('CD_TAB_FRETE').AsString := qry_lista_iataCD_TAB_FRETE.AsString;
         qry_item_iata_.Prepare;
         qry_item_iata_.Open;
         dbgrid_item_iata.Enabled := True;
       end;
    end;}

end;

procedure Tfrm_frete_serv.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_frete_serv, datm_frete_serv );

  ShortDateFormat   := 'DD/MM/YYYY';
  //
  tab_frete:='';
  st_modificar   := False;
  st_incluir     := False;
  st_excluir     := False;

  bl_IATA        := false;
  permissao      := True;



  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  with datm_frete_serv do begin
    qry_tipo_frequencia_.Close;
    qry_tipo_frequencia_.Prepare;
    qry_tipo_frequencia_.Open;
    //
    qry_moeda_broker_.close;
    qry_moeda_broker_.Prepare;
    qry_moeda_broker_.Open;
    //
    qry_origem_custo_.Close;
    qry_origem_custo_.Prepare;
    qry_origem_custo_.Open;
    //
    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;
    //
    qry_depesa_por_.close;
    qry_depesa_por_.Prepare;
    qry_depesa_por_.Open;
    //
    ds_frete.AutoEdit        := st_modificar;
    ds_tarifa_aerea.AutoEdit := st_modificar;
    ds_despesas.AutoEdit     := st_modificar;
    ds_tarifas_FCL.AutoEdit  := st_modificar;
    ds_desepsa_FCL.AutoEdit  := st_modificar;
  end;
  btn_mi(st_incluir, false, false, false);
  //
  pgctrl_frete.ActivePageIndex:=0;
  pgctrl_freteChange(sender);

end;

procedure Tfrm_frete_serv.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;
  mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;
  mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
//  dbgird_lista_1.Enabled   := not Salv;
//  dbgrid_lista_cia.Enabled := not Salv;
  if (pgctrl_frete.ActivePage = ts_dados_cia_armador)then
    btn_duplica_frete.Enabled := Not Salv;
end;


procedure Tfrm_frete_serv.msk_cd_agenciaExit(Sender: TObject);
begin
//  if msk_cd_agencia.Text = '' then exit;

  if msk_cd_agencia.Text <> '' then 
     msk_cd_agencia.Text := Copy('0000', 1, 4 - Length(msk_cd_agencia.Text) ) + msk_cd_agencia.Text;


  realiza_pesquisa;

{
  if msk_cd_agencia.Text <> '' then begin
     msk_cd_agencia.Text := Copy('0000', 1, 4 - Length(msk_cd_agencia.Text) ) + msk_cd_agencia.Text;

     with TQuery.Create(application) do begin
       DataBaseName := 'DBBROKER';
       Close;
       SQL.Clear;
       SQL.Add('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE = "'+ msk_CD_AGENCIA.Text + '" AND TP_AG = "1" ');

       Prepare;
       Open;
       if IsEmpty then begin
         ShowMessage('Código do Agente Inexistente!');
         msk_nm_agencia.text := '';
         msk_cd_agencia.Setfocus;
       end;

       Free;
    end;
  end;

  realiza_pesquisa;
 }
end;

procedure Tfrm_frete_serv.msk_cd_cia_armadorExit(Sender: TObject);
//var
//    vTxtAux: string;
begin
//  if msk_cd_cia_armador.Text = '' then exit;

  if msk_cd_cia_armador.Text <> '' then
     msk_cd_cia_armador.Text := Copy('0000', 1, 4 - Length(msk_cd_cia_armador.Text) ) + msk_cd_cia_armador.Text;

  realiza_pesquisa;

  {
  if st_via_transp = '01' then
    vTxtAux := ' "1" '
  else if st_via_transp = '04' then
    vTxtAux := ' "0" ';


  if msk_cd_cia_armador.Text <> '' then begin
     msk_cd_cia_armador.Text := Copy('0000', 1, 4 - Length(msk_cd_cia_armador.Text) ) + msk_cd_cia_armador.Text;

     with TQuery.Create(application) do begin
       DataBaseName := 'DBBROKER';
       Close;
       SQL.Clear;
       SQL.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux+' AND CODIGO = "' + msk_cd_cia_armador.Text + '" ');

       Prepare;
       Open;
       if IsEmpty then begin
         ShowMessage('Código Inexistente!');
         msk_nm_cia_armador.text := '';
         msk_cd_cia_armador.Setfocus;
       end;

       Free;
    end;
  end;


  realiza_pesquisa;}

end;

procedure Tfrm_frete_serv.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not consiste then exit;
  if not grava then exit;

end;

function Tfrm_frete_serv.Consiste: Boolean;
var
    vTxtAux: string;
begin

  if st_via_transp = '01' then
    vTxtAux := ' "1" '
  else if st_via_transp = '04' then
    vTxtAux := ' "0" ';



  Consiste := true;
  if pgctrl_frete.ActivePage = ts_dados_cia_armador then begin
     with TQuery.Create(application) do begin
       DataBaseName := 'DBBROKER';

       // checa origem
       Close;
       SQL.Clear;
       if st_via_transp = '01' then
         SQL.Add('SELECT NM_PORTO, CD_SIGLA_CIDADE  FROM TPORTO (NOLOCK) WHERE CD_PORTO = "'+ msk_cd_origem.text +'"  AND TP_PORTO = "1" ')
       else if st_via_transp = '04' then
         SQL.Add('SELECT NM_PORTO, CD_SIGLA FROM TPORTO (NOLOCK) WHERE CD_PORTO = "'+ msk_cd_origem.text +'" AND TP_PORTO = "0" ');

       Prepare;
       Open;
       if IsEmpty then begin
         ShowMessage('Código da Origem inválido!');
         consiste:=false;
       end;

       // checa destino
       SQL.Clear;
       if st_via_transp = '01' then
         SQL.Add('SELECT NM_PORTO, CD_SIGLA_CIDADE  FROM TPORTO (NOLOCK) WHERE CD_PORTO = "'+ msk_cd_destino.text +'"  AND TP_PORTO = "1" ')
       else if st_via_transp = '04' then begin
         SQL.Add('SELECT NM_PORTO, CD_SIGLA FROM TPORTO (NOLOCK) WHERE CD_PORTO = "'+ msk_cd_destino.text +'" AND TP_PORTO = "0" ');
         if (in_trade = '0') and (modulo = 'I') then
           SQL.Add(' AND CD_PAIS = "105" ');

       end;
       Prepare;
       Open;
       if IsEmpty then begin
         ShowMessage('Código do destino inválido!');
         consiste:=false;
       end;

       // checa moeda
       if dbedt_cd_moeda.text<>'' then begin
          SQL.Clear;
          SQL.Add('SELECT NM_MOEDA, CD_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = "'+ dbedt_cd_moeda.text +'"');
          Prepare;
          Open;
          if IsEmpty then begin
            ShowMessage('Código de Moeda inexistente!');
            consiste:=false;
          end;
       end;

       // checa Agente
       if dbedt_CD_AGENCIA.Text<>'' then begin
          SQL.Clear;
          SQL.Add('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE = "'+ dbedt_CD_AGENCIA.Text + '" AND TP_AG = "1" ');
          Prepare;
          Open;
          if IsEmpty then begin
             ShowMessage('Código do Agente Inexistente!');
             consiste:=false;
          end;

       end;

       // checa Armador ou CIA
       if dbedt_cd_cia_armador.Text<>'' then begin
          SQL.Clear;
          SQL.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux+' AND CODIGO = "' + dbedt_cd_cia_armador.Text + '" ');
          Prepare;
          Open;
          if IsEmpty then begin
            if rgVia_Transp.ItemIndex=0 then
               ShowMessage('Código da Cia Inexistente!')
            else
               ShowMessage('Código do Armador Inexistente!');

            consiste:=false;
          end;
       end;

       Free;
     end;

     if (Modulo='I') or (rdgrupo_tp_frete.ItemIndex=1) then
        if dbedt_cd_Agencia.text = '' then  begin
           BoxMensagem('O Agente deve ser preenchido!',2);
           dbedt_cd_Agencia.SetFocus;
           consiste := false;
           Exit;
        end;

     if dbedt_cd_cia_armador.Text = '' then begin
        if rgVia_Transp.ItemIndex=0 then
           BoxMensagem('A Companhia deve ser preenchida!',2)
        else
           BoxMensagem('O Armador deve ser preenchido!',2);


        dbedt_cd_cia_armador.SetFocus;
        consiste := false;
        Exit;
     end;

     if dbedt_cd_moeda.text = '' then begin
        BoxMensagem('A Moeda deve ser preenchido!',2);
        consiste := false;
        dbedt_cd_moeda.SetFocus;
        Exit;
     end;

     if dbedt_dt_validade.Text = '  /  /    ' then begin
        BoxMensagem('A Validade deve ser preenchida!',2);
        consiste := false;
        dbedt_dt_validade.SetFocus;
        Exit;
     end

  end;

  {
  if pcFrete.ActivePage = ts_dados_iata then begin
     if Trim(dbedt_cd_origem_iata.text) = '' then begin
        BoxMensagem('A Origem deve ser preenchido!',2);
        dbedt_cd_origem_iata.SetFocus;
        consiste := false;
        Exit;
     end;
     if dbedt_cd_destino_iata.text = '' then begin
        BoxMensagem('O Destino deve ser preenchido!',2);
        dbedt_cd_destino_iata.SetFocus;
        consiste := false;
        Exit;
     end;
     if dbedt_cd_moeda_iata.text = '' then begin
        BoxMensagem('A Moeda deve ser preenchido!',2);
        dbedt_cd_moeda_iata.SetFocus;
        consiste := false;
        Exit;
     end;
  end;
  }

end;

function Tfrm_frete_serv.Grava: Boolean;
var
gCD_TAB_FRETE:string;
begin
  try
    with datm_frete_serv do  begin
      str_tp_carga:=rxcombx_tp_carga_ag.Items.Strings[rxcombx_tp_carga_ag.ItemIndex];
//      str_tp_carga:=rxcombx_tp_carga_cia.Items.Strings[rxcombx_tp_carga_cia.ItemIndex];

      if not datm_main.db_broker.InTransaction then
        datm_main.db_broker.StartTransaction;

      if rgVia_Transp.itemIndex = 0 then
        qry_frete_CD_VIA_TRANSP.AsString := '04'
      else
        qry_frete_CD_VIA_TRANSP.AsString := '01';


      if qry_frete_.State in [dsInsert,dsEdit] then begin
         qry_frete_.Post;

         gCD_TAB_FRETE:=qry_frete_CD_TAB_FRETE.AsString;

         dbgrid_despesa_FCL.Columns.Items[4].Visible := (datm_frete_serv.qry_frete_IN_DESEMBARACO.AsInteger in [1,2]);
      end;

      if tab_frete <>'' then
         insere_tarifas(tab_frete);

      datm_main.db_broker.Commit;
      Grava := True;
    end;

  except
    on E: Exception do begin
      if datm_main.db_broker.InTransaction then
         datm_main.db_broker.Rollback;

      TrataErro(E);
      Grava := False;
    end;
  end;

  btn_mi(st_incluir,false,false,st_excluir);



  realiza_pesquisa;
  //
  { reposiciona sobre o registro previamente selecionado }
  datm_frete_serv.qry_lista_.Locate('CD_TAB_FRETE',gCD_TAB_FRETE,[]);

end;

procedure Tfrm_frete_serv.insere_tarifas(var tab: string);
var ITEM,DESPESA :TQuery;
               i :real;
begin

  with TQuery.Create(Application) do  begin
    Databasename := 'DBBROKER';
    Sql.Clear;
    Sql.Add('DELETE FROM TTAB_FRETE_ITEM WHERE CD_TAB_FRETE = "'+datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString+'"');
    ExecSql;
    Close;
    Sql.clear;
    Sql.Add('DELETE FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString+'"');
    ExecSql;
    Free;
  end;
  ITEM := TQuery.Create(Application);
  ITEM.DataBaseName:='DBBROKER';
  ITEM.Sql.Clear;
  ITEM.Sql.Add('SELECT CD_TAB_FRETE, CD_ITEM_TAB_FRETE, PESO_TAB_FRETE, VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE,');
  ITEM.Sql.Add('VL_COMPRA_TAB_FRETE, VL_VENDA_TAB_FRETE, VL_COMPRA_CIA_ARMADOR, TP_FRETE,TP_ESTUFAGEM');
  ITEM.Sql.Add(' FROM TTAB_FRETE_ITEM WHERE CD_TAB_FRETE = "'+tab+'" ');
  ITEM.Sql.Add(' ORDER BY  CD_ITEM_TAB_FRETE ');
  ITEM.Open;
  i := 0;
  while not(ITEM.EOF) do begin
    i:=i+ 1;
    with TQuery.Create(Application) do  begin
      Databasename := 'DBBROKER';
      Sql.Clear;
      Sql.Add('INSERT INTO TTAB_FRETE_ITEM (CD_TAB_FRETE, CD_ITEM_TAB_FRETE, PESO_TAB_FRETE, VOLUME_TAB_FRETE,  ');
      Sql.Add('TTIPO_SIMBOLO_TAB_FRETE,VL_COMPRA_TAB_FRETE, VL_VENDA_TAB_FRETE, VL_COMPRA_CIA_ARMADOR, TP_FRETE,CD_TAB_REF,TP_ESTUFAGEM )');
      Sql.Add('VALUES (:CD_TAB_FRETE, :CD_ITEM_TAB_FRETE, :PESO_TAB_FRETE, :VOLUME_TAB_FRETE,:TTIPO_SIMBOLO_TAB_FRETE,');
      Sql.Add(':VL_COMPRA_TAB_FRETE, :VL_VENDA_TAB_FRETE, :VL_COMPRA_CIA_ARMADOR, :TP_FRETE, :CD_TAB_REF, :TP_ESTUFAGEM )');
      Params[0].AsString:=datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString;
      Params[1].AsString:=ITEM.Fields[1].AsString;//formatfloat('0000',i);
      Params[2].AsFloat :=ITEM.Fields[2].AsFloat;
      Params[3].AsString:=ITEM.Fields[3].AsString;
      Params[4].AsString:=ITEM.Fields[4].AsString;
      if perc_iata <> 0 then
        Params[7].Asfloat :=(ITEM.Fields[7].AsFloat * 100 )/ (100 - perc_iata)
      else
        Params[7].Asfloat :=ITEM.Fields[7].AsFloat;

      //para o agente passao o mesmo valor que para a companhia
      Params[6].Asfloat :=Params[7].Asfloat;
      Params[5].AsFloat :=Params[7].Asfloat;//ITEM.Fields[5].AsFloat;
      //para o agente passao o mesmo valor que para a companhia
      Params[8].AsString:=ITEM.Fields[8].AsString;
      Params[9].AsString:=tab;
      Params[10].AsString:=ITEM.Fields[9].AsString;
      ExecSql;
      Free;
    end;
    ITEM.next;
  end;

  //DEPESAS
  DESPESA := TQuery.Create(Application);
  DESPESA.DataBaseName := 'DBBROKER';
  DESPESA.Sql.Clear;
  DESPESA.Sql.Add('SELECT CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA,VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA,');
  DESPESA.Sql.Add(' IN_DESPESA, IN_MENCIONADO, TP_FRETE, TP_ESTUFAGEM, CD_TAB_REF, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL');
  DESPESA.Sql.Add(' FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+tab+'" ');//AND IN_DESPESA = "4"');
  DESPESA.Open;
  i := 0;
  while not(DESPESA.EOF) do  begin
    with TQuery.Create(Application) do begin
      Databasename := 'DBBROKER';
      i := i+ 1;
      Sql.Clear;
      Sql.Add('INSERT INTO TTAB_FRETE_DESPESA (CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA,VL_BASE_DESPESA, VL_COMPRA_AG,');
      Sql.Add(' VL_COMPRA_CIA, VL_VENDA, IN_DESPESA, IN_MENCIONADO,TP_FRETE, TP_ESTUFAGEM, CD_TAB_REF, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, CODIGO)');
      Sql.Add(' VALUES (:CD_TAB_FRETE, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA,:VL_BASE_DESPESA, :VL_COMPRA_AG, ');
      Sql.Add(':VL_COMPRA_CIA, :VL_VENDA, :IN_DESPESA, :IN_MENCIONADO, :TP_FRETE,:TP_ESTUFAGEM, :CD_TAB_REF, :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL,:CODIGO)');
      Params[0].AsString  := datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString;
      Params[1].AsString  := DESPESA.Fields[1].AsString;
      Params[2].AsString  := DESPESA.Fields[2].AsString;
      Params[3].AsString  := DESPESA.Fields[3].AsString;
      Params[4].AsString  := DESPESA.Fields[4].AsString;
      Params[5].AsFloat   := DESPESA.Fields[5].AsFloat;
      Params[6].Asfloat   := DESPESA.Fields[7].AsFloat;
      Params[7].Asfloat   := DESPESA.Fields[7].AsFloat;
      Params[8].Asfloat   := DESPESA.Fields[8].Asfloat;
      Params[9].AsString  := DESPESA.Fields[9].AsString;
      Params[10].AsString := DESPESA.Fields[10].AsString;
      Params[11].AsString := DESPESA.Fields[11].AsString;
      Params[12].AsString := DESPESA.Fields[12].AsString;
      Params[13].AsString := tab;
      Params[14].AsString := DESPESA.Fields[14].AsString;
      Params[15].AsString := DESPESA.Fields[15].AsString;
      Params[16].AsString := formatfloat('000',i);
      ExecSql;
      Free;
    end;
    DESPESA.Next;
  end;
  tab:='';
  perc_iata:=0;
end;

procedure Tfrm_frete_serv.Cancelar;
begin
  { se estiver inserindo volta para a lista }
  if datm_frete_serv.qry_frete_.State in [dsInsert] then begin
     pgctrl_frete.ActivePageIndex:=0;
     pgctrl_freteChange(self);
  end else
    btn_mi(st_incluir,false,false,st_excluir);

  datm_frete_serv.qry_frete_.cancel;


  if datm_frete_serv.qry_lista_iata.State in [dsEdit,dsInsert] then  begin
    datm_frete_serv.qry_lista_iata.cancel;
    datm_frete_serv.qry_item_iata_.close;
    datm_frete_serv.qry_item_iata_.ParamByName('CD_TAB_FRETE').AsString := datm_frete_serv.qry_lista_iataCD_TAB_FRETE.AsString;
    datm_frete_serv.qry_item_iata_.Prepare;
    datm_frete_serv.qry_item_iata_.Open;
//    dbgrid_item_iata.Enabled := True;
  end;




end;



procedure Tfrm_frete_serv.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  tab_frete:='';

end;

procedure Tfrm_frete_serv.bnt_moedaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if (datm_frete_serv.qry_frete_.State = dsInactive) then begin
      Application.MessageBox('Após escolher a Origem e o Destino deve-se clicar no botão Incluir.','Atenção',MB_ICONWARNING);
      Exit;
    end;
    if not PoeEmEdicao(datm_frete_serv.qry_frete_) then Exit;

    datm_frete_serv.qry_frete_CD_MOEDA_TAB_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas', ['CD_MOEDA','NM_MOEDA'], ['Código','Descrição'], 'CD_MOEDA', frm_main.mi_cad_moeda, 1, dbedt_cd_moeda.Text);
  end else begin
    if not (datm_frete_serv.qry_frete_.State = dsEdit) then Exit;

    datm_frete_serv.qry_frete_NM_MOEDA.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', dbedt_cd_moeda.Text, 'AP_MOEDA');
  end;

end;

procedure Tfrm_frete_serv.msk_cd_origemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then begin
    if Sender = msk_cd_origem         then btn_co_origem_freteClick(btn_co_origem_frete);
    if Sender = msk_cd_destino        then btn_co_destinoClick(btn_co_destino);
//    if Sender = dbedt_cd_armador      then btn_co_armadorClick(btn_co_armador);
//    if Sender = dbedt_cd_agente       then btn_co_agenteClick(btn_co_agente);
    if Sender = dbedt_cd_moeda        then bnt_moedaClick(bnt_moeda);
//    if Sender = dbedt_cd_armador_cia  then btn_co_armador_ciaClick(btn_co_armador_cia);
//    if Sender = dbedt_cd_moeda_cia    then btn_co_moeda_ciaClick(btn_co_moeda_cia);
//    if Sender = dbedt_cd_cia_transp   then btn_co_cia_transpClick(btn_co_cia_transp);
//    if Sender = msk_dupl_origem       then btn_co_dupli_origClick(btn_co_dupli_orig);
//    if Sender = dbedt_cd_origem_iata  then btn_orig_iataClick(btn_orig_iata);
//    if Sender = dbedt_cd_destino_iata then btn_destino_iataClick(btn_destino_iata);
//    if Sender = dbedt_cd_moeda_iata   then btn_moeda_iataClick(btn_moeda_iata);
  end;

end;

procedure Tfrm_frete_serv.btn_incluirClick(Sender: TObject);
begin
//  if (pgctrl_frete.ActivePage = ts_lista_iata) or (pgctrl_frete.ActivePage = ts_dados_iata) then begin
//    insere_tarifa_iata;
//    exit;
//  end;

  if (edt_nm_origem.text = '') or (edt_nm_destino.text = '') then  begin
    BoxMensagem('Deve ser informado uma Rota (Origem e Destino) !',2);
    Exit;
  end;
  //
  if msk_CD_Origem.Text = msk_CD_Destino.Text then begin
     ShowMessage('Código da Origem deve ser Diferente do Código de Destino!');
     exit;
  end;


  //muda para a Tab de Dados
  pgctrl_frete.ActivePageIndex:=1;
  pgctrl_freteChange(sender);

{
  dbedt_cd_moeda.ReadOnly     := false;
  rxcombx_tp_carga_ag.ReadOnly:= false;
  dbedt_nr_freq_ag.ReadOnly   := false;
  look_tp_freq_ag.ReadOnly    := false;
  dbedt_nr_transit_ag.ReadOnly:= false;
  look_tp_transit_ag.ReadOnly := false;
  dbedt_dt_validade.ReadOnly  := false;

  dbedt_cd_moeda.Color        := clWindow;
  rxcombx_tp_carga_ag.Color   := clWindow;
  dbedt_nr_freq_ag.Color      := clWindow;
  look_tp_freq_ag.Color       := clWindow;
  dbedt_nr_transit_ag.Color   := clWindow;
  look_tp_transit_ag.Color    := clWindow;
  dbedt_dt_validade.Color     := clWindow;
}

  pnl_moeda.Enabled:=True;

  with datm_frete_serv do begin
    if qry_frete_.State in[dsBrowse, dsInactive] then begin
      qry_frete_.close;
      qry_frete_.ParamByName('CD_ORIGEM').AsString:='';
      qry_frete_.ParamByName('CD_DESTINO').AsString:='';
      qry_frete_.ParamByName('TP_EMP_FRETE').AsString:='';
      qry_frete_.ParamByName('CD_VIA_TRANSP').AsString:='';
      qry_frete_.Prepare;
      qry_frete_.Open;
      //
      //
      {limpa as tabelas de tarifas e despesas}
      qry_tarifa_aerea_.Close;
      qry_tarifa_aerea_.ParamByName('CD_TAB_FRETE').AsString := '';
      qry_tarifa_aerea_.ParamByName('TP_ESTUFAGEM').AsString := '0';
      qry_tarifa_aerea_.Prepare;
      qry_tarifa_aerea_.Open;
      //
      qry_frete_despesas_.close;
      qry_frete_despesas_.ParamByName('CD_TAB_FRETE').AsString := '';
      qry_frete_despesas_.ParamByName('TP_ESTUFAGEM').AsString := '0';
      qry_frete_despesas_.Prepare;
      qry_frete_despesas_.Open;
      //
      qry_tarifas_FCL_.close;
      qry_tarifas_FCL_.ParamByName('CD_TAB_FRETE').AsString := '';
      qry_tarifas_FCL_.ParamByName('TP_ESTUFAGEM').AsString := '1';
      qry_tarifas_FCL_.Prepare;
      qry_tarifas_FCL_.Open;
      //
      qry_despesa_FCL_.close;
      qry_despesa_FCL_.ParamByName('CD_TAB_FRETE').AsString := '';
      qry_despesa_FCL_.Prepare;
      qry_despesa_FCL_.Open;
    end;

    qry_frete_.Cancel;
    qry_frete_.Insert;


    // passa "2-AMBOS" como padrão
    qry_frete_IN_DESEMBARACO.AsInteger      := 2;
    qry_frete_CD_ORIGEM_TAB_FRETE.AsString  := msk_cd_origem.text;
    qry_frete_CD_DESTINO_TAB_FRETE.AsString := msk_cd_destino.text;

    if (Modulo = 'E') and (rdgrupo_tp_frete.ItemIndex = 0) then
      qry_frete_TP_EMP_FRETE.AsString:='0'
    else
      qry_frete_TP_EMP_FRETE.AsString:='1';


    qry_frete_IN_ATIVO.AsString := '1';
  end;

  btn_mi(false,st_modificar, st_modificar, false);

end;

procedure Tfrm_frete_serv.ts_listaShow(Sender: TObject);
begin
  pgctrl_frete.Pages[0].Highlighted:=true;
  pgctrl_frete.Pages[1].Highlighted:=False;
end;

procedure Tfrm_frete_serv.ts_dados_cia_armadorShow(Sender: TObject);
begin
  pgctrl_frete.Pages[0].Highlighted:=False;
  pgctrl_frete.Pages[1].Highlighted:=true;
  //
  {Preeenche os Labels com os Dados do Frete Selecionado}
  lblOrigem.Caption :=msk_cd_origem.Text+'-'+edt_nm_origem.Text;
  lblDestino.Caption:=msk_cd_destino.Text+'-'+edt_nm_destino.Text;
end;

procedure Tfrm_frete_serv.dbrgrpDesemb1Change(Sender: TObject);
begin
  if datm_frete_serv.qry_frete_.State in [dsEdit, dsInsert] then begin
    btn_mi(false,st_modificar, st_modificar, false);
//    if Sender = dbedt_cd_agente then btn_co_agenteClick(Sender);
//    if Sender = dbedt_cd_armador then btn_co_armadorClick(Sender);
//    if Sender = dbedt_cd_cia_transp then btn_co_cia_transpClick(Sender);
    if Sender = dbedt_cd_moeda then bnt_moedaClick(Sender);
//    if Sender = dbedt_cd_moeda_cia then btn_co_moeda_ciaClick(Sender);
//    if Sender = dbedt_cd_armador_cia then btn_co_armador_ciaClick(Sender);
//    if Sender = dbedt_cd_cia_transp_cia then btn_co_cia_transp_ciaClick(Sender);
  end;


  // pinta a legenda do frete atualmente selecionado
  case dbrgrpDesemb1.ItemIndex of
     0:shp_Tipo_Frete.Brush.Color:= $00B9FFB9;
     1:shp_Tipo_Frete.Brush.Color:= $00FFC891;
     2:shp_Tipo_Frete.Brush.Color:= clWhite;
  end;

end;

procedure Tfrm_frete_serv.btn_excluirClick(Sender: TObject);
begin
  if datm_frete_serv.qry_frete_.IsEmpty then begin
    BoxMensagem( 'Não existe Frete para ser excluído!', 2 );
    exit;
  end;

  if BoxMensagem( 'O Frete ( '+datm_frete_serv.qry_frete_cd_tab_frete.AsString+' ) será excluído!' + #13#13#10 + '      Confirma exclusão ?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      with TQuery.Create(Application) do begin
        Databasename:='DBBROKER';
        Sql.Clear;
        Sql.Add('DELETE FROM TTAB_FRETE_ITEM WHERE CD_TAB_FRETE = "'+datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString+'"');
        ExecSql;
        Close;
        Sql.clear;
        Sql.Add('DELETE FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString+'"');
        ExecSql;
        Free;
      end;
      datm_frete_serv.qry_frete_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        datm_frete_serv.qry_frete_.Cancel;
        TrataErro(E);
      end;
    end;

  pgctrl_frete.ActivePageIndex:=0;
  pgctrl_freteChange(sender);
  //
  realiza_pesquisa;
end;

procedure Tfrm_frete_serv.dbedt_nr_freq_agChange(Sender: TObject);
begin
  if datm_frete_serv.qry_frete_.State in [dsEdit, dsInsert] then begin
    btn_mi(false,st_modificar, st_modificar, false);
//    if Sender = dbedt_cd_agencia then btn_co_agencia_edtClick(Sender);
//    if Sender = dbedt_cd_agente then btn_co_agenteClick(Sender);
//    if Sender = dbedt_cd_armador then btn_co_armadorClick(Sender);
//    if Sender = dbedt_cd_cia_transp then btn_co_cia_transpClick(Sender);
    if Sender = dbedt_cd_moeda then bnt_moedaClick(Sender);
    
//    if Sender = dbedt_cd_moeda_cia then btn_co_moeda_ciaClick(Sender);
//    if Sender = dbedt_cd_armador_cia then btn_co_armador_ciaClick(Sender);
//    if Sender = dbedt_cd_cia_transp_cia then btn_co_cia_transp_ciaClick(Sender);
  end;

end;

procedure Tfrm_frete_serv.btn_co_agencia_edtClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_frete_serv.qry_frete_) then Exit;
    datm_frete_serv.qry_frete_CD_AGENTE_TAB_FRETE.AsString := ConsultaOnLineExFiltro('TAGENTE','Agente de Carga',['CD_AGENTE','NM_AGENTE'],['Código','Nome'],'CD_AGENTE','TP_AG = ''1''',nil, dbedt_CD_AGENCIA.Text);
  end else
    datm_frete_serv.qry_frete_NM_AGENTE.AsString           := ConsultaLookUPSQL('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE = "'+ dbedt_CD_AGENCIA.Text + '" AND TP_AG = "1" ','NM_AGENTE');


end;

procedure Tfrm_frete_serv.btn_co_armador_cia_edtClick(Sender: TObject);
var
    vTxtAux, vTitAux: string;
begin
  if st_via_transp = '01' then begin
    vTxtAux := ' "1" ';
    vTitAux := 'Cadastro de Armadores';
  end else if st_via_transp = '04' then begin
    vTxtAux := ' "0" ';
    vTitAux := 'Cadastro de Companhias';
  end;

  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_frete_serv.qry_frete_) then Exit;

    if rgVia_Transp.ItemIndex=0 then
       datm_frete_serv.qry_frete_CD_CIA_TRANSP_TAB_FRETE.AsString:=ConsultaOnLineExSQL('SELECT CODIGO, DESCRICAO, APELIDO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux,vTitAux,['CODIGO','DESCRICAO', 'APELIDO'],['Código','Nome', 'Apelido'],'CODIGO',nil, dbedt_cd_cia_armador.Text )
    else
       datm_frete_serv.qry_frete_CD_ARMADOR.AsString:=ConsultaOnLineExSQL('SELECT CODIGO, DESCRICAO, APELIDO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux,vTitAux,['CODIGO','DESCRICAO', 'APELIDO'],['Código','Nome', 'Apelido'],'CODIGO',nil, dbedt_cd_cia_armador.Text )

  end else
    if rgVia_Transp.ItemIndex=0 then
       datm_frete_serv.qry_frete_NM_CIA_TRANSP.AsString:=ConsultaLookUPSQL('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux+' AND CODIGO = "' + dbedt_cd_cia_armador.Text + '" ', 'DESCRICAO')
    else
       datm_frete_serv.qry_frete_NM_ARMADOR.AsString:=ConsultaLookUPSQL('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = '+vTxtAux+' AND CODIGO = "' + dbedt_cd_cia_armador.Text + '" ', 'DESCRICAO')





end;

procedure Tfrm_frete_serv.dbGrid_ListaDblClick(Sender: TObject);
begin
  pgctrl_frete.ActivePageIndex:=1;
  pgctrl_freteChange(sender);
end;

procedure Tfrm_frete_serv.dbgrid_despesa_aereaEnter(Sender: TObject);
begin
  if datm_frete_serv.qry_frete_CD_TAB_FRETE.AsString = '' then begin
    ShowMessage('Escolha uma tabela de Fretes antes de inserir despesas/terifas!');
    exit;
  end;

  if TDBGrid(Sender).dataSource.DataSet.IsEmpty then TDBGrid(Sender).dataSource.DataSet.Insert;
end;

procedure Tfrm_frete_serv.dbgrid_tarifas_LCLExit(Sender: TObject);
begin
  if dbgrid_tarifas_LCL.DataSource.DataSet.State in [dsInsert,dsEdit] then begin
    dbgrid_tarifas_LCL.DataSource.DataSet.Post;
    dbgrid_tarifas_LCL.DataSource.DataSet.Edit;
  end;

end;

procedure Tfrm_frete_serv.dbgrid_despesa_aereaColExit(Sender: TObject);
var vFiltro: string;
begin
  if datm_frete_serv.qry_frete_IN_DESEMBARACO.ASInteger = 0 then
    vFiltro := 'AND TP_ITEM = "1"'
  else
    vFiltro := '';

  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE IN_ATIVO = "1" AND CD_ITEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString +'" '+ vFiltro , 'NM_ITEM') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString <> '')  then begin
      ShowMessage('Item Inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA' then
    if (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA').AsString <> '')  then begin
      ShowMessage('Moeda Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;


end;

procedure Tfrm_frete_serv.dbgrid_despesa_aereaDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
       TDBGrid(Sender).dataSource.DataSet.Edit;

    if datm_frete_serv.qry_frete_IN_DESEMBARACO.AsInteger = 0 then
       TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString)
    else
       TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineEx('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM', nil, 1, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);

  end;

  if(TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA')  or
    (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcMoeda') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;

    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA', 'NM_MOEDA'], ['Código','Moeda'],'CD_MOEDA', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString);
  end;

end;

procedure Tfrm_frete_serv.dbgrid_despesa_aereaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then dbgrid_despesa_aereaDblClick(Sender);
  { grid = FCL, no campo LookTpCntr, apertando backspace, limpa campo}
  if (key = 8) and (Sender = dbgrid_despesa_FCL) and (dbgrid_despesa_FCL.Columns.Items[dbgrid_despesa_FCL.SelectedIndex].FieldName = 'lookTpCntr') then
     if dbgrid_despesa_FCL.DataSource.DataSet.State in [dsInsert, dsEdit] then
        dbgrid_despesa_FCL.DataSource.DataSet.FieldByName('TP_CNTR').AsString := '';

end;

procedure Tfrm_frete_serv.dbgrid_despesa_LCLKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_despesa_LCL.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_despesa_LCL.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then begin
    dbgrid_despesa_LCL.Columns.Items[5].visible:=true;
    dbgrid_despesa_LCL.Columns.Items[6].visible:=true;
  end else begin
    dbgrid_despesa_LCL.Columns.Items[5].visible:=false;
    dbgrid_despesa_LCL.Columns.Items[6].visible:=false;
  end;

end;

procedure Tfrm_frete_serv.dbgrid_despesa_FCLKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_despesa_FCL.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_despesa_FCL.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then begin
    dbgrid_despesa_FCL.Columns.Items[5].visible := true;
    dbgrid_despesa_FCL.Columns.Items[6].visible := true;
  end else begin
    dbgrid_despesa_FCL.Columns.Items[5].visible := false;
    dbgrid_despesa_FCL.Columns.Items[6].visible := false;
  end;

end;

procedure Tfrm_frete_serv.dbgrid_despesa_aereaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_despesa_aerea.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_despesa_aerea.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then begin
    dbgrid_despesa_aerea.Columns.Items[5].visible:=true;
    dbgrid_despesa_aerea.Columns.Items[6].visible:=true;
  end else begin
    dbgrid_despesa_aerea.Columns.Items[5].visible:=false;
    dbgrid_despesa_aerea.Columns.Items[6].visible:=false;
  end;

end;

procedure Tfrm_frete_serv.dbgrid_tarifa_aereaExit(Sender: TObject);
begin
  if dbgrid_tarifa_aerea.DataSource.DataSet.State in [dsInsert,dsEdit] then begin
    dbgrid_tarifa_aerea.DataSource.DataSet.Post;
    dbgrid_tarifa_aerea.DataSource.DataSet.Edit;
  end;

end;

procedure Tfrm_frete_serv.dbgrid_tarifas_FCLExit(Sender: TObject);
begin
  if dbgrid_tarifas_FCL.DataSource.DataSet.State in [dsInsert,dsEdit] then begin
    dbgrid_tarifas_FCL.DataSource.DataSet.Post;
    dbgrid_tarifas_FCL.DataSource.DataSet.Edit;
  end;
end;

procedure Tfrm_frete_serv.Status_Botoes(Sender: TObject);
begin
  if datm_frete_serv.qry_frete_.State in [dsEdit, dsInsert] then begin
    btn_mi(false,st_modificar, st_modificar, false);
    if Sender = dbedt_cd_agencia      then btn_co_agencia_edtClick(Sender);
    if Sender = dbedt_cd_cia_armador  then btn_co_armador_cia_edtClick(Sender);
    if Sender = dbedt_cd_moeda        then bnt_moedaClick(Sender);
  end;

end;

procedure Tfrm_frete_serv.dbedt_cd_agenciaExit(Sender: TObject);
begin
  if dbedt_cd_agencia.Text <> '' then
     dbedt_cd_agencia.Text := Copy('0000', 1, 4 - Length(dbedt_cd_agencia.Text) ) + dbedt_cd_agencia.Text;

end;

procedure Tfrm_frete_serv.dbedt_cd_cia_armadorExit(Sender: TObject);
begin
  if dbedt_cd_cia_armador.Text <> '' then
     dbedt_cd_cia_armador.Text := Copy('0000', 1, 4 - Length(dbedt_cd_cia_armador.Text) ) + dbedt_cd_cia_armador.Text;

end;

procedure Tfrm_frete_serv.rdgrupo_tp_freteClick(Sender: TObject);
begin
  realiza_pesquisa;
end;

procedure Tfrm_frete_serv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {
   se não fechar esta query antes de destruir o datamodule irá gerar uma
   exception violation
  }
  datm_frete_serv.qry_frete_.Close;

  if datm_frete_serv<>nil then
     FreeAndNil(datm_frete_serv);

end;

procedure Tfrm_frete_serv.pgctrl_freteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
// if pnl_duplica_frete.Visible = true then
//   AllowChange := false
// else
   AllowChange := VerAlt;

end;

function Tfrm_frete_serv.VerAlt: Boolean;
begin
  ActiveControl := nil;
  VerAlt := True;
  if ((datm_frete_serv.qry_frete_.State in [dsEdit,dsInsert]) and st_modificar) then begin
      if BoxMensagem('O Frete foi alterado.' + #13#10 +
                   'Deseja salvar as alterações?', 1) then begin
         if Not Consiste then begin
            VerAlt := False;
            Exit;
         end;

         if Not Grava then begin
            VerAlt := False;
            Exit;
         end;
      end else Cancelar;
  end;

end;


procedure Tfrm_frete_serv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se pressionar ESC encerra
  if Key = #27 then
     btn_SairClick(nil);

end;

end.


