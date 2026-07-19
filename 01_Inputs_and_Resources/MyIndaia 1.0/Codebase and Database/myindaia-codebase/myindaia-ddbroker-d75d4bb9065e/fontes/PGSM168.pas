unit PGSM168;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, UCRPE32, Funcoes, DateUtils;

type
  Tfrm_ct_contabil = class(TForm)
    pgctrl_ct_contabil: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_descricao: TLabel;
    dbedt_nm_ct_contabil: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbg_cadastro: TDBGrid;
    ts_ct_contabil_gerencial: TTabSheet;
    pgctrl_ct_contabil_gerencial: TPageControl;
    ts_lista2: TTabSheet;
    dbg_ct_gerencial: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    pnl_ct_contabil_gerencial: TPanel;
    lbl_ct_gerencial: TLabel;
    btn_co_ct_gerencial: TSpeedButton;
    lbl_ct_contabil2: TLabel;
    dbedt_cd_ct_gerencial: TDBEdit;
    dbedt_nm_ct_gerencial: TDBEdit;
    dbedt_cd_ct_contabil3: TDBEdit;
    dbedt_nm_ct_contabil3: TDBEdit;
    lbl_ct_contabil: TLabel;
    dbedt_cd_ct_contabil2: TDBEdit;
    dbedt_nm_ct_contabil2: TDBEdit;
    lbl_codigo: TLabel;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_cd_acesso: TDBEdit;                          
    lbl_acesso: TLabel;
    lbl_grau: TLabel;
    dbedt_cd_grau: TDBEdit;
    lbl_aux: TLabel;
    dbedt_cd_aux: TDBEdit;
    lblAtivo: TLabel;
    dblkpcbox_distribui: TDBLookupComboBox;
    Label4: TLabel;
    dblckp_box_indicador: TDBLookupComboBox;
    tvw_grafico: TTreeView;
    Label3: TLabel;
    dbedt_cd_ct_contabil_pai: TDBEdit;
    dbedt_vl_porcentagem: TDBEdit;
    Label5: TLabel;
    lbl_in_embarque: TLabel;
    dblckpbox_embarque: TDBLookupComboBox;
    lbl_contabiliza: TLabel;
    dblckpbox_in_contabiliza: TDBLookupComboBox;
    lbl_mes2: TLabel;
    btn_co_mes: TSpeedButton;
    dbedt_cd_mes: TDBEdit;
    dbedt_nm_mes: TDBEdit;
    lbl_ano2: TLabel;
    dbedt_cd_ano: TDBEdit;
    mi_duplicar: TMenuItem;
    lbl_reemb: TLabel;
    dblckpbox_reembolso: TDBLookupComboBox;
    crp_ct_contabil: TCrpe;
    mi_imprimir: TMenuItem;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_duplicar: TSpeedButton;
    btn_imprimir: TSpeedButton;
    dbnvg: TDBNavigator;
    lbl1: TLabel;
    dbedtCtContabilFluxo: TDBEdit;
    lbl_cd_ct_custo: TLabel;
    btn_rateio: TSpeedButton;
    dbedt_nm_rateio: TEdit;
    dbedt_cd_rateio: TDBEdit;
    Label6: TLabel;
    dbedt_Ano: TDBEdit;
    ts_grafico: TTabSheet;
    Query1: TQuery;
    DataSource1: TDataSource;
    lbl_fluxo_caixa: TLabel;
    lbl_fluxo_banco: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    dbedt_ct_old: TDBEdit;
    dbedt_ct_new: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    btn_incluir_ct_nova: TSpeedButton;
    btn_salva_ct_nova: TSpeedButton;
    btn_cancela_ct_nova: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_ct_contabilChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_classifExit(Sender: TObject);
    procedure dbedt_cd_via_transpExit(Sender: TObject);
    procedure pgctrl_ct_contabilChange(Sender: TObject);
    procedure dbedt_cd_ct_gerencialChange(Sender: TObject);
    procedure dbedt_cd_ct_gerencialExit(Sender: TObject);
    procedure btn_co_ct_gerencialClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_ct_contabilChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Cancelar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_classifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_ct_contabil_gerencialChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_co_mesClick(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure Atualiza_Duplica;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_rateioClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure dbedt_ct_newChange(Sender: TObject);
    procedure btn_incluir_ct_novaClick(Sender: TObject);
    procedure btn_salva_ct_novaClick(Sender: TObject);
    procedure btn_cancela_ct_novaClick(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_Online_Texto : String;
  end;

var
  frm_ct_contabil: Tfrm_ct_contabil;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM047, PGSM169, PGSM170, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_ct_contabil.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ct_contabil.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
     ( pgctrl_ct_contabil.ActivePage = ts_lista ) then
  begin
    with datm_ct_contabil do
    begin
      qry_ct_contabil_.DisableControls;
      qry_ct_contabil_.Cancel;
      qry_ct_contabil_.Append;

      dbedt_cd_ct_contabil.Color    := clWindow;
      dbedt_cd_acesso.Color         := clWindow;
      dbedt_cd_aux.Color            := clWindow;

      dbedt_cd_ct_contabil.TabStop  := True;
      dbedt_cd_acesso.TabStop       := True;
      dbedt_cd_aux.TabStop          := True;

      dbedt_cd_ct_contabil.ReadOnly := False;
      dbedt_cd_acesso.ReadOnly      := False;
      dbedt_cd_aux.ReadOnly         := False;

      qry_ct_contabil_IN_DISTRIBUI.AsString     := '0';
      qry_ct_contabil_IN_EMBARQUE.AsString      := '0';
      qry_ct_contabil_IN_CONTABILIZA.AsString   := '1';
      qry_ct_contabil_CD_IDENTIFICADOR.AsString := 'A';
      qry_ct_contabil_IN_FLUXO_CAIXA_FLUXO.AsString      := '0';
      qry_ct_contabil_IN_FLUXO_CAIXA_BANCO.AsString      := '0';
      qry_ct_contabil_.EnableControls;
    end;
    pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil.SetFocus;
  end
  else if pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial then {Conta Contábil X Conta Gerencial}
  begin
    with datm_ct_contabil do
    begin
      if qry_ct_contabil_.RecordCount = 0  then
      begin
        BoxMensagem('Selecione uma Conta Contábil!', 2);
        Cancelar;
        pgctrl_ct_contabil.ActivePage := ts_lista;
        Exit;
      end;

      pgctrl_ct_contabil_gerencial.Enabled := True;
      qry_ct_contabil_gerencial_.DisableControls;
      qry_ct_contabil_gerencial_.Cancel;
      qry_ct_contabil_gerencial_.Append;
      qry_ct_contabil_gerencial_.EnableControls;

      qry_ct_contabil_gerencial_CD_CT_CONTABIL.AsString := qry_ct_contabil_CD_CT_CONTABIL.AsString;
      qry_ct_contabil_gerencial_CD_MES.AsString         := Copy( DateToStr( Date ), 4, 2 );
      qry_ct_contabil_gerencial_CD_ANO.AsString         := Copy( DateToStr( Date ), 7, 4 );

    end;
    pgctrl_ct_contabil_gerencial.ActivePage             := ts_dados_basicos2;
    pnl_ct_contabil_gerencial.Enabled                   := True;
    dbedt_cd_ct_gerencial.SetFocus;
  end;
  datm_ct_contabil.qry_contabil_novo.DisableControls;
  datm_ct_contabil.qry_contabil_novo.Cancel;
  datm_ct_contabil.qry_contabil_novo.Append;
  datm_ct_contabil.qry_contabil_novo.EnableControls;

  btn_mi( False, True, True, False );

  dbnvg.Enabled     := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled  := False;

end;

procedure Tfrm_ct_contabil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  crp_ct_contabil.Free;
  if VerAlt then
  begin
    with datm_ct_contabil do
    begin
      tbl_yesno_.Close;
      qry_tp_indicador_.Close;
      qry_ct_contabil_.Close;
      qry_ct_gerencial_.Close;
      qry_ct_contabil_gerencial_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_ct_contabil.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
    except
      try
         Cons_Online_Texto := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código da Conta Contábil!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_ct_contabil.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_ct_contabil.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Conta Contábil}
  Application.CreateForm( Tdatm_ct_contabil, datm_ct_contabil );

  with datm_ct_contabil do
  begin
    ds_ct_contabil.AutoEdit           := st_modificar;
    ds_ct_contabil_gerencial.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_tp_indicador_.Close;
    qry_tp_indicador_.Prepare;
    qry_tp_indicador_.Open;

    qry_ct_gerencial_.Close;
    qry_ct_gerencial_.Prepare;
    qry_ct_gerencial_.Open;

    qry_ct_contabil_.Close;
    qry_ct_contabil_.SQL[2] := 'CD_CT_CONTABIL';
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;

    qry_ct_contabil_gerencial_.Close;
    qry_ct_contabil_gerencial_.ParamByName('CD_CT_CONTABIL').AsString := qry_ct_contabil_CD_CT_CONTABIL.AsString;
    qry_ct_contabil_gerencial_.Prepare;
    qry_ct_contabil_gerencial_.Open;

    qry_contabil_novo.Close;
    qry_contabil_novo.ParamByName('CD_CT_CONTABIL').AsString := qry_ct_contabil_CD_CT_CONTABIL.AsString;
    qry_contabil_novo.Prepare;
    qry_contabil_novo.Open;
  end;

  a_str_indices[0] := 'CD_CT_CONTABIL';
  a_str_indices[1] := 'NM_CT_CONTABIL';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_ct_contabil.btn_excluirClick(Sender: TObject);
begin
  with datm_ct_contabil do
  begin
    if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
       ( pgctrl_ct_contabil.ActivePage = ts_lista ) then
    begin
      if BoxMensagem( 'Esta Conta Contábil será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        {Conta Contábil X Conta Gerencial}
        CloseStoredProc(sp_exclui_conta_contabil);
        sp_exclui_conta_contabil.ParamByName('@CD_CT_CONTABIL').AsString := qry_ct_contabil_CD_CT_CONTABIL.AsString;
        ExecStoredProc(sp_exclui_conta_contabil);
        CloseStoredProc(sp_exclui_conta_contabil);
        {Conta Contábil}
        qry_ct_contabil_.Delete;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          qry_ct_contabil_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_ct_contabil.ActivePage := ts_lista;
    end
    else if pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial then
    begin
      if qry_ct_contabil_gerencial_.RecordCount = 0 then Exit;
      if BoxMensagem( 'Esta Conta Contábil x Conta Gerencial será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_ct_contabil_gerencial_.Delete;
        datm_main.db_broker.Commit;
        qry_ct_contabil_gerencial_.Close;
        qry_ct_contabil_gerencial_.Prepare;
        qry_ct_contabil_gerencial_.Open;
      except
        on E: Exception do
        begin
          qry_ct_contabil_gerencial_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_ct_contabil.ActivePage := ts_lista2;
    end;
  end;
  Atualiza_Duplica;
end;

procedure Tfrm_ct_contabil.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  lNaoConsiste                        := False;
  pgctrl_ct_contabil.ActivePage       := ts_lista;
  ts_ct_contabil_gerencial.TabVisible := False;
  edt_chave.SetFocus;
end;

procedure Tfrm_ct_contabil.dbedt_nm_ct_contabilChange(Sender: TObject);
begin
 if ( datm_ct_contabil.qry_ct_contabil_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ct_contabil.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  btn_cancela_ct_nova.Click;
end;

procedure Tfrm_ct_contabil.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_ct_contabil.qry_ct_contabil_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ct_contabil.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_ct_contabil.qry_ct_contabil_.Close;
  datm_ct_contabil.qry_ct_contabil_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_ct_contabil.qry_ct_contabil_.Prepare;
  datm_ct_contabil.qry_ct_contabil_.Open;
  Localiza(datm_ct_contabil.qry_ct_contabil_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_ct_contabil.dbedt_cd_classifExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ct_contabil.dbedt_cd_via_transpExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

{$HINTS OFF}
procedure Tfrm_ct_contabil.pgctrl_ct_contabilChange(Sender: TObject);
var
  Arv1 : TTreeNode;
  nr_graus, i, j : Integer;
begin
  if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
     ( pgctrl_ct_contabil.ActivePage = ts_lista ) then
  begin
    dbnvg.DataSource     := datm_ct_contabil.ds_ct_contabil;
  end
  else if pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial then
  begin
    dbnvg.DataSource := datm_ct_contabil.ds_ct_contabil_gerencial;
  end;

  if (   pgctrl_ct_contabil.ActivePage = ts_lista ) or
     ( ( pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial ) and
       ( pgctrl_ct_contabil_gerencial.ActivePage = ts_lista2 ) ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;

  if ( pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial ) and
     ( datm_ct_contabil.qry_ct_contabil_IN_DISTRIBUI.AsString = '0' ) then
  begin
    btn_mi( False, False, False, False );
  end
  else
  begin
    btn_mi( st_incluir, False, False, st_excluir );
  end;

  if ( pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial ) and
     ( datm_ct_contabil.qry_ct_contabil_gerencial_.RecordCount = 0 ) then
  begin
    pgctrl_ct_contabil_gerencial.Enabled := False;
  end
  else
  begin
    pgctrl_ct_contabil_gerencial.Enabled := True;
  end;
  If ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) then
  begin
    datm_ct_contabil.qry_contabil_novo.Close;
    datm_ct_contabil.qry_contabil_novo.ParamByName('CD_CT_CONTABIL').AsString := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
    datm_ct_contabil.qry_contabil_novo.Prepare;
    datm_ct_contabil.qry_contabil_novo.Open;
  end;
  Atualiza_Duplica;
  if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) then
  begin
    btn_salva_ct_nova.enabled:=false;
    btn_cancela_ct_nova.enabled:=false;
    if dbedt_ct_new.Text='' then
    begin
      btn_incluir_ct_nova.Enabled:=True;
      dbedt_ct_new.enabled:=False;
    end
    else
    begin
      btn_incluir_ct_nova.Enabled:=false;
      dbedt_ct_new.enabled:=true;
    end;
  end;

  {Montagem do gráfico}
  if pgctrl_ct_contabil.ActivePage = ts_grafico then
  begin
    {btn_mi( False, False, False, False );
    with tvw_grafico.Items do
    begin
      Clear;
      with datm_ct_contabil do
      begin
        qry_graus_.Close;
        qry_graus_.Prepare;
        qry_graus_.Open;
        if qry_graus_.RecordCount > 0 then
        begin
          nr_graus := qry_graus_NR_GRAUS.AsInteger;
          for i := 1 to nr_graus do
          begin
            qry_arv_.Close;
            qry_arv_.ParamByName('CD_GRAU').AsString := IntToStr( i );
            qry_arv_.Prepare;
            qry_arv_.Open;
            qry_arv_.First;
            while Not qry_arv_.EOF do
            begin
              if i = 1 then
              begin
                Arv1 := Add(nil, '(' + qry_arv_CalcCtContabil.AsString + ') ' + qry_arv_NM_CT_CONTABIL.AsString );
              end
              else
              begin
                for j := 0 to ( tvw_grafico.Items.Count - 1 ) do
                begin                               //12       Rodrigo
                  if Copy( tvw_grafico.Items[j].Text, 2, length(datm_ct_contabil.qry_arv_CalcCtContabilPai.AsString) ) = datm_ct_contabil.qry_arv_CalcCtContabilPai.AsString then
                  begin
                    Arv1 := tvw_grafico.Items[j];
                    AddChild( Arv1, '(' + qry_arv_CalcCtContabil.AsString + ') ' + qry_arv_NM_CT_CONTABIL.AsString );
                    Break;
                  end;
                end;
              end;
              qry_arv_.Next;
            end;
            qry_arv_.Close;
          end;
        end;
      end;
    end;}
  end;
end;
{$HINTS ON}

procedure Tfrm_ct_contabil.dbedt_cd_ct_gerencialChange(Sender: TObject);
begin
  if ( datm_ct_contabil.qry_ct_contabil_gerencial_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ct_contabil.dbedt_cd_ct_gerencialExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ct_contabil.btn_co_ct_gerencialClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2246';
  Application.CreateForm(Tfrm_ct_gerencial, frm_ct_gerencial);
  frm_ct_gerencial.Cons_OnLine := datm_ct_contabil.qry_ct_contabil_gerencial_CD_CT_GERENCIAL;
  with frm_ct_gerencial do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ct_contabil.qry_ct_contabil_gerencial_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_ct_contabil.qry_ct_contabil_gerencial_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ct_contabil do
  begin
    qry_ct_gerencial_.Close;
    qry_ct_gerencial_.Prepare;
    qry_ct_gerencial_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2245';
  dbedt_cd_ct_gerencialExit(nil);
end;

procedure Tfrm_ct_contabil.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_ct_contabil.Consiste : Boolean;
begin

  if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
     ( pgctrl_ct_contabil.ActivePage = ts_lista ) then
  begin
    {Código da Conta Contábil}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_ct_contabil.Text = '   .  .     ' then
      begin
        BoxMensagem('Campo Código da Conta Contábil deve ser preenchido!', 2);
        pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
        dbedt_cd_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;

      {if Length(Trim(dbedt_cd_ct_contabil.Text) ) <> 12 then
      begin
        BoxMensagem('Campo Código da Conta Contábil inválido!', 2);
        pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
        dbedt_cd_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;  }

      // Inibido em 23/10/2002
      {
      with datm_ct_contabil do
      begin
        CloseStoredProc( sp_si_digito );
        sp_si_digito.ParamByName('@CD_CT_CONTABIL').AsString := dbedt_cd_ct_contabil.Text;
        ExecStoredProc( sp_si_digito );
        if sp_si_digito.ParamByName('@DIGITO').AsInteger <> StrToInt( Copy( dbedt_cd_ct_contabil.Text, 10, 1 ) ) then
        begin
          CloseStoredProc( sp_si_digito );
          BoxMensagem( 'Dígito da Conta Contábil inválido!', 2 );
          pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
          dbedt_cd_ct_contabil.SetFocus;
          Consiste := False;
          Exit;
        end;
        CloseStoredProc( sp_si_digito );
      end;
      }
    end;

    if ( datm_ct_contabil.qry_ct_contabil_.State in [dsInsert] ) and
       ( datm_ct_contabil.qry_ct_contabil_CD_IDENTIFICADOR.AsString = 'A') then
    begin
      {Acesso}
      if Not lNaoConsiste then
      begin
        // Inibido em 23/10/2002
        {
        if dbedt_cd_acesso.Text = '' then
        begin
          BoxMensagem('Campo Acesso deve ser preenchido!', 2);
          pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
          dbedt_cd_acesso.SetFocus;
          Consiste := False;
          Exit;
        end;
        }

        {Aux}
        // Inibido em 23/10/2002
        {
        if dbedt_cd_aux.Text = '' then
        begin
          BoxMensagem('Campo Aux. deve ser preenchido!', 2);
          pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
          dbedt_cd_aux.SetFocus;
          Consiste := False;
          Exit;
        end;
        }
        If ( dbedt_cd_acesso.Text <> '' ) and ( dbedt_cd_aux.Text <> '' ) then
        begin
          with datm_ct_contabil do
          begin
            qry_acesso_aux_.Close;
            qry_acesso_aux_.ParamByName('CD_ACESSO').AsString := dbedt_cd_acesso.Text;
            qry_acesso_aux_.ParamByName('CD_AUX').AsString    := dbedt_cd_aux.Text;
            qry_acesso_aux_.Prepare;
            qry_acesso_aux_.Open;
            if qry_acesso_aux_TOT.AsInteger > 0 then
            begin
              BoxMensagem('Cód Acesso + Cód Aux. já cadastrado!', 2);
              pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
              dbedt_cd_acesso.SetFocus;
              Consiste := False;
              qry_acesso_aux_.Close;
              Exit;
            end;
            qry_acesso_aux_.Close;
          end;
        end;
      end;
    end
    else
    begin
      if ( datm_ct_contabil.qry_ct_contabil_.State in [dsInsert] ) and
         ( datm_ct_contabil.qry_ct_contabil_CD_IDENTIFICADOR.AsString = 'S') then
      begin
        if Not lNaoConsiste then
        begin
          if dbedt_cd_acesso.Text <> '' then
          begin
            BoxMensagem('Para Conta Sintéticas o Campo Acesso não deve ser preenchido!', 2);
            pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
            dbedt_cd_acesso.SetFocus;
            Consiste := False;
            Exit;
          end;

          {Aux}
          if dbedt_cd_aux.Text <> '' then
          begin
            BoxMensagem('Para Conta Sintéticas o Campo Aux. não deve ser preenchido!', 2);
            pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
            dbedt_cd_aux.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    {Ano}
    if Not lNaoConsiste then
    begin
      if dbedt_Ano.Text = '' then
      begin
        BoxMensagem('Campo Ano deve ser preenchido!', 2);
        pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
        dbedt_Ano.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;


    {Grau}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_grau.Text = '' then
      begin
        BoxMensagem('Campo Grau deve ser preenchido!', 2);
        pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
        dbedt_cd_grau.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Descrição da Conta Contábil}
    if Not lNaoConsiste then
    begin
      if dbedt_nm_ct_contabil.Text = '' then
      begin
        BoxMensagem('Campo Descrição deve ser preenchido!', 2);
        pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
        dbedt_nm_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Existência de uma hierarquia}
    if Not lNaoConsiste then
    begin
      with datm_ct_contabil do
      begin
        qry_ct_pai_.Close;
        qry_ct_pai_.ParamByName('CD_CT_CONTABIL_PAI').AsString := qry_ct_contabil_CD_CT_CONTABIL_PAI.AsString;
        qry_ct_pai_.Prepare;
        qry_ct_pai_.Open;
        if qry_ct_pai_.RecordCount > 0 then
        begin
          if StrToInt( qry_ct_pai_CD_GRAU.AsString ) <> ( StrToInt( qry_ct_contabil_CD_GRAU.AsString ) - 1 ) then
          begin
            BoxMensagem('Conta Contábil Pai não é de um grau imediatamente superior!!', 2);
            pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
            dbedt_cd_grau.SetFocus;
            Consiste := False;
            qry_ct_pai_.Close;
            Exit;
          end;
        end;
        qry_ct_pai_.Close;
      end;
    end;
  end
  else if pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial then  {Conta Contábil X Gerencial}
  begin
    {Conta Gerencial}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_ct_gerencial.Text = '' then
      begin
        BoxMensagem('Campo Conta Gerencial deve ser preenchido!', 2);
        pgctrl_ct_contabil.ActivePage           := ts_ct_contabil_gerencial;
        pgctrl_ct_contabil_gerencial.ActivePage := ts_dados_basicos2;
        dbedt_cd_ct_gerencial.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if datm_ct_contabil.qry_ct_contabil_gerencial_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_ct_gerencial );

    if dbedt_cd_ct_gerencial.Text <> '' then
    begin
      if dbedt_nm_ct_gerencial.Text = '' then
      begin
        BoxMensagem('Código da Conta Gerencial inválido!',2);
        pgctrl_ct_contabil.ActivePage           := ts_ct_contabil_gerencial;
        pgctrl_ct_contabil_gerencial.ActivePage := ts_dados_basicos2;
        dbedt_cd_ct_gerencial.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Meses}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_mes.Text = '' then
      begin
        BoxMensagem('Campo Mês deve ser preenchido!', 2);
        pgctrl_ct_contabil.ActivePage           := ts_ct_contabil_gerencial;
        pgctrl_ct_contabil_gerencial.ActivePage := ts_dados_basicos2;
        dbedt_cd_mes.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if datm_ct_contabil.qry_ct_contabil_gerencial_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_mes );

    if dbedt_cd_mes.Text <> '' then
    begin
      if dbedt_nm_mes.Text = '' then
      begin
        BoxMensagem('Código do Mês inválido!',2);
        pgctrl_ct_contabil.ActivePage           := ts_ct_contabil_gerencial;
        pgctrl_ct_contabil_gerencial.ActivePage := ts_dados_basicos2;
        dbedt_cd_mes.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

  end;
  Consiste := True;
end;

function Tfrm_ct_contabil.Grava : Boolean;
var
  cd_ano, cd_mes, cd_ct_gerencial : String;
begin
  Grava := True;
  if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
     ( pgctrl_ct_contabil.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_ct_contabil.qry_ct_contabil_.State in [dsInsert, dsEdit] ) then
      begin
        datm_ct_contabil.qry_ct_contabil_.Post;
        Pesquisa := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
        datm_ct_contabil.qry_ct_contabil_.Close;
        datm_ct_contabil.qry_ct_contabil_.Prepare;
        datm_ct_contabil.qry_ct_contabil_.Open;
        Localiza(datm_ct_contabil.qry_ct_contabil_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_ct_contabil.qry_ct_contabil_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else if pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial then  {Conta Contábil X Gerencial}
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_ct_contabil.qry_ct_contabil_gerencial_.State in [dsInsert, dsEdit] ) then
      begin
        datm_ct_contabil.qry_ct_contabil_gerencial_.Post;

        cd_ano          := datm_ct_contabil.qry_ct_contabil_gerencial_CD_ANO.AsString;
        cd_mes          := datm_ct_contabil.qry_ct_contabil_gerencial_CD_MES.AsString;
        cd_ct_gerencial := datm_ct_contabil.qry_ct_contabil_gerencial_CD_CT_GERENCIAL.AsString;

        datm_ct_contabil.qry_ct_contabil_gerencial_.Close;
        datm_ct_contabil.qry_ct_contabil_gerencial_.ParamByName('CD_CT_CONTABIL').AsString := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
        datm_ct_contabil.qry_ct_contabil_gerencial_.Prepare;
        datm_ct_contabil.qry_ct_contabil_gerencial_.Open;

        datm_ct_contabil.qry_ct_contabil_gerencial_.Locate('CD_MES;CD_ANO;CD_CT_GERENCIAL',
           VarArrayOf ([cd_mes, cd_ano, cd_ct_gerencial]), [loCaseInsensitive]);

        Atualiza_Duplica;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_ct_contabil.qry_ct_contabil_gerencial_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ct_contabil.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if dbedt_ct_new.Text ='' then
  begin
    BoxMensagem('Conta Contabil reduzida deve ser inserido!', 2);
    pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
    btn_incluir_ct_nova.Click;
    dbedt_ct_new.SetFocus;
    exit;
  end;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
  if ( datm_ct_contabil.qry_contabil_novo.State in [dsInsert, dsEdit] ) then
  begin
      datm_ct_contabil.qry_contabil_novo.Post;
  end;
  datm_ct_contabil.qry_contabil_novo.Close;
  datm_ct_contabil.qry_contabil_novo.ParamByName('CD_CT_CONTABIL').AsString := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
  datm_ct_contabil.qry_contabil_novo.Prepare;
  datm_ct_contabil.qry_contabil_novo.Open;

  dbedt_cd_ct_contabil.Color    := clMenu;
  dbedt_cd_acesso.Color         := clMenu;
  dbedt_cd_aux.Color            := clMenu;

  dbedt_cd_ct_contabil.TabStop  := False;
  dbedt_cd_acesso.TabStop       := False;
  dbedt_cd_aux.TabStop          := False;

  dbedt_cd_ct_contabil.ReadOnly := True;
  dbedt_cd_acesso.ReadOnly      := True;
  dbedt_cd_aux.ReadOnly         := True;

end;

procedure Tfrm_ct_contabil.pgctrl_ct_contabilChanging(Sender: TObject;
var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
  if pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial then
  begin
    with datm_ct_contabil do
    begin
      qry_por_mes_ano_.Close;
      qry_por_mes_ano_.ParamByName('CD_CT_CONTABIL').AsString := qry_ct_contabil_CD_CT_CONTABIL.AsString;
      qry_por_mes_ano_.Prepare;
      qry_por_mes_ano_.Open;
      while Not qry_por_mes_ano_.EOF do
      begin
        qry_soma_ct_gerencial_.Close;
        qry_soma_ct_gerencial_.ParamByName('CD_CT_CONTABIL').AsString := qry_ct_contabil_CD_CT_CONTABIL.AsString;
        qry_soma_ct_gerencial_.ParamByName('CD_MES').AsString         := Copy( qry_por_mes_ano_PERIODO.AsString, 1, 2 );
        qry_soma_ct_gerencial_.ParamByName('CD_ANO').AsString         := Copy( qry_por_mes_ano_PERIODO.AsString, 3, 4 );
        qry_soma_ct_gerencial_.Prepare;
        qry_soma_ct_gerencial_.Open;
        if ( Arredondar( qry_soma_ct_gerencial_SOMA.AsFloat, 2 ) <> Arredondar( 100, 2 ) ) and
           ( Arredondar( qry_soma_ct_gerencial_SOMA.AsFloat, 2 ) <> 0 ) then
        begin
          BoxMensagem( 'Soma das porcentagens atingem ' +
                       FloatToStr( Arredondar( qry_soma_ct_gerencial_SOMA.AsFloat, 2 ) ) + '%' + #13#10 +
                       'Soma das porcentagens devem atingir 100%', 2);
          AllowChange := False;
        end
        else
        begin
          AllowChange := True;
        end;

        if Not AllowChange then Break;

        qry_por_mes_ano_.Next;
      end;
    end;
  end;
end;

function Tfrm_ct_contabil.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_ct_contabil.qry_ct_contabil_.State in [dsEdit] ) and st_modificar ) or
       ( datm_ct_contabil.qry_ct_contabil_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Contas contábeis foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
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
  if (pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial) and
     (pgctrl_ct_contabil_gerencial.ActivePage = ts_dados_basicos2) then
  begin
    if ( ( datm_ct_contabil.qry_ct_contabil_gerencial_.State in [dsEdit] ) and st_modificar ) or
       ( datm_ct_contabil.qry_ct_contabil_gerencial_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Contas contábeis X Gerencial foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
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
end;

procedure Tfrm_ct_contabil.Cancelar;
begin
  try
    if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
       ( pgctrl_ct_contabil.ActivePage = ts_lista ) then
    begin
      {Conta Contábil}
      if datm_ct_contabil.qry_ct_contabil_.State in [dsInsert, dsEdit] then
        datm_ct_contabil.qry_ct_contabil_.Cancel;
      pgctrl_ct_contabil.ActivePage := ts_dados_basicos;

      dbedt_cd_ct_contabil.Color    := clMenu;
      dbedt_cd_acesso.Color         := clMenu;
      dbedt_cd_aux.Color            := clMenu;

      dbedt_cd_ct_contabil.TabStop  := False;
      dbedt_cd_acesso.TabStop       := False;
      dbedt_cd_aux.TabStop          := False;

      dbedt_cd_ct_contabil.ReadOnly := True;
      dbedt_cd_acesso.ReadOnly      := True;
      dbedt_cd_aux.ReadOnly         := True;

      dbedt_nm_ct_contabil.SetFocus;
    end
    else if (pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial) then
    begin
      {Conta Contábil X Gerencial}
      if datm_ct_contabil.qry_ct_contabil_gerencial_.State in [dsInsert, dsEdit] then
        datm_ct_contabil.qry_ct_contabil_gerencial_.Cancel;
      pgctrl_ct_contabil_gerencial.ActivePage := ts_dados_basicos2;
      dbedt_cd_ct_gerencial.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  if ( pgctrl_ct_contabil.ActivePage = ts_ct_contabil_gerencial ) and
     ( datm_ct_contabil.qry_ct_contabil_gerencial_.RecordCount = 0 ) then
  begin
    pgctrl_ct_contabil_gerencial.Enabled := False;
  end
  else
  begin
    pgctrl_ct_contabil_gerencial.Enabled := True;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ct_contabil.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_ct_contabil.dbedt_cd_classifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_ct_gerencial then btn_co_ct_gerencialClick(nil);
    if Sender = dbedt_cd_rateio       then btn_rateioClick(btn_rateio);
  end;
end;

procedure Tfrm_ct_contabil.pgctrl_ct_contabil_gerencialChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_ct_contabil.btn_co_mesClick(Sender: TObject);
var Sql : String;
begin
  Sql := 'SELECT * FROM TMESES';
  Sql := Sql + 'ORDER BY NM_MES';
  Cons_On_line('DBBROKER','TMESES', datm_ct_contabil.qry_ct_contabil_gerencial_CD_MES,'Meses',28,Sql,'TQuery' );
end;

procedure Tfrm_ct_contabil.btn_duplicarClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_duplica_ct_contabil_gerencial, frm_duplica_ct_contabil_gerencial );
  frm_duplica_ct_contabil_gerencial.str_cd_ct_contabil_destino := datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
  frm_duplica_ct_contabil_gerencial.ShowModal;

  datm_ct_contabil.qry_ct_contabil_gerencial_.Close;
  datm_ct_contabil.qry_ct_contabil_gerencial_.Prepare;
  datm_ct_contabil.qry_ct_contabil_gerencial_.Open;

  if datm_ct_contabil.qry_ct_contabil_gerencial_.RecordCount = 0 then
  begin
    btn_duplicar.Enabled := True;
    mi_duplicar.Enabled  := True;
  end
  else
  begin
    btn_duplicar.Enabled := False;
    mi_duplicar.Enabled  := False;
  end;
end;

procedure Tfrm_ct_contabil.Atualiza_Duplica;
begin
  if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
     ( pgctrl_ct_contabil.ActivePage = ts_lista ) or
     ( pgctrl_ct_contabil.ActivePage = ts_grafico ) then
  begin
    dbnvg.DataSource     := datm_ct_contabil.ds_ct_contabil;
    btn_duplicar.Enabled := False;
    mi_duplicar.Enabled  := False;
  end
  else
  begin
    dbnvg.DataSource := datm_ct_contabil.ds_ct_contabil_gerencial;
    if datm_ct_contabil.qry_ct_contabil_IN_DISTRIBUI.AsString = '1' then
    begin
      btn_duplicar.Enabled := True;
      mi_duplicar.Enabled  := True;
    end
    else
    begin
      btn_duplicar.Enabled := False;
      mi_duplicar.Enabled  := False;
    end;
  end;                  
end;




procedure Tfrm_ct_contabil.btn_imprimirClick(Sender: TObject);
begin
  with crp_ct_contabil do
  begin
    ReportName  := cDir_Rpt + '\CRCD004.RPT';
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    SortFields[0] := '+{TCT_CONTABIL.' + Trim( a_str_indices[cb_ordem.ItemIndex] ) + '}';
    Execute;
  end;
end;


procedure Tfrm_ct_contabil.btn_rateioClick(Sender: TObject);
begin
 if ( datm_ct_contabil.qry_ct_contabil_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ct_contabil.qry_ct_contabil_) then Exit;
    datm_ct_contabil.qry_ct_contabil_CD_RATEIO.AsString := ConsultaOnLineEx('TRATEIO','Rateios',['CD_RATEIO','NM_RATEIO'],['Código','Descrição'],'CD_RATEIO',frm_main.mi_cad_fin_conta_gerencial)
  end
  else
  begin
    dbedt_nm_rateio.Text := ConsultaLookUP('TRATEIO','CD_RATEIO',dbedt_cd_rateio.Text,'NM_RATEIO')
  end;
end;

procedure Tfrm_ct_contabil.DBLookupComboBox1Click(Sender: TObject);
begin
 if ( datm_ct_contabil.qry_ct_contabil_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ct_contabil.DBLookupComboBox2Click(Sender: TObject);
begin
 if ( datm_ct_contabil.qry_ct_contabil_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ct_contabil.dbedt_ct_newChange(Sender: TObject);
begin
  btn_salva_ct_nova.Enabled:=True;
  btn_cancela_ct_nova.Enabled:=True;
end;

procedure Tfrm_ct_contabil.btn_incluir_ct_novaClick(Sender: TObject);
begin
  if dbedt_ct_new.Text <> '' then
  begin
      BoxMensagem('Conta Contabil já existe,para salvar as alterações clique em salvar!', 2);
      pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
      dbedt_ct_new.SetFocus;
      Exit;
  end;
   datm_ct_contabil.qry_contabil_novo.DisableControls;
   datm_ct_contabil.qry_contabil_novo.Cancel;
   datm_ct_contabil.qry_contabil_novo.Append;
   datm_ct_contabil.qry_contabil_novo.EnableControls;
   dbedt_ct_old.Text:= datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
   dbedt_ct_new.enabled:=true;
   btn_salva_ct_nova.Enabled:=True;
   dbedt_ct_new.enabled:=true;
   btn_incluir_ct_nova.Enabled:=false;
   btn_cancela_ct_nova.Enabled:=true;
   dbedt_ct_new.SetFocus;
end;

procedure Tfrm_ct_contabil.btn_salva_ct_novaClick(Sender: TObject);
begin
  if dbedt_ct_new.Text = '' then
  begin
    BoxMensagem('Campo Conta Contábil Reduzida deve ser preenchido!', 2);
    pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
    dbedt_ct_new.SetFocus;
    Exit;
  end;

 try
    datm_main.db_broker.StartTransaction;
    if ( datm_ct_contabil.qry_contabil_novo.State in [dsInsert, dsEdit] ) then
    begin
      datm_ct_contabil.qry_contabil_novo.Post;
      Pesquisa := dbedt_ct_new.Text; //datm_ct_contabil.qry_ct_contabil_CD_CT_CONTABIL.AsString;
      datm_ct_contabil.qry_contabil_novo.Close;
      datm_ct_contabil.qry_contabil_novo.Prepare;
      datm_ct_contabil.qry_contabil_novo.Open;
      //Localiza(datm_ct_contabil.qry_contabil_novo, Pesquisa,'TX_OLD' );
    end;
    datm_main.db_broker.Commit;
    Localiza(datm_ct_contabil.qry_contabil_novo, Pesquisa,'TX_NEW' );
    btn_salva_ct_nova.enabled:=false;
    btn_cancela_ct_nova.enabled:=false;
  except
    on E: Exception do
    begin
      datm_ct_contabil.qry_ct_contabil_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_ct_contabil.btn_cancela_ct_novaClick(Sender: TObject);
begin
  datm_ct_contabil.qry_contabil_novo.Cancel;
  btn_salva_ct_nova.enabled:=false;
  btn_cancela_ct_nova.enabled:=False;
  if dbedt_ct_new.Text='' then
  begin
    btn_incluir_ct_nova.Enabled:=True;
  end
  else
  begin
    btn_incluir_ct_nova.Enabled:=false;
  end;
end;

procedure Tfrm_ct_contabil.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  dbedt_ct_old.Text:=dbedt_cd_ct_contabil.text;
end;

end.
