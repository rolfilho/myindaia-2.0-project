unit PGES003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32, ComCtrls, ExtCtrls, Funcoes;

type
  Tfrm_tot_gastos_porto = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btn_grupo: TSpeedButton;
    btn_cd_cliente: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btn_cd_moeda: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    msk_cd_grupo_item: TMaskEdit;
    edt_nm_grupo_item: TEdit;
    msk_cd_moeda: TMaskEdit;
    edt_nm_moeda: TEdit;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    crp_rel: TCRPE;
    Shape2: TShape;
    Shape1: TShape;
    Label8: TLabel;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_grupo_itemExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure msk_cd_moedaExit(Sender: TObject);
    procedure btn_grupoClick(Sender: TObject);
    procedure btn_cd_clienteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_cd_moedaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_grupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    str_relatorio:byte;
    { Public declarations }
  end;

var
  frm_tot_gastos_porto: Tfrm_tot_gastos_porto;

implementation

uses PGES004, PGSM018, PGSM010, GSMLIB, PGGP001, PGSM119, PGSM024, PGSM096,
     PGSM048, PGGP017, PGSM148;

{$R *.DFM}

procedure Tfrm_tot_gastos_porto.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with datm_tot_gastos_porto.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      msk_cd_unid_neg.setfocus;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_tot_gastos_porto.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_tot_gastos_porto.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  with datm_tot_gastos_porto.qry_produto_ do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_Produto.Clear;
      msk_cd_Produto.setfocus;
    end
    else edt_nm_produto.Text:= FieldByName('AP_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_tot_gastos_porto.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_tot_gastos_porto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_rel.Free;
  datm_tot_gastos_porto.free;
  Action:= cafree;
end;

procedure Tfrm_tot_gastos_porto.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_tot_gastos_porto, datm_tot_gastos_porto);
end;

procedure Tfrm_tot_gastos_porto.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  with datm_tot_gastos_porto.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo não encontrado!',2);
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_tot_gastos_porto.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then Exit;
  ValCodEdt(msk_cd_cliente);
  with datm_tot_gastos_porto.qry_cliente_ do
  begin
    ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('NM_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_tot_gastos_porto.msk_cd_grupo_itemExit(
  Sender: TObject);
begin
  edt_nm_grupo_item.Clear;
  if msk_cd_grupo_item.Text = '' then Exit;
  ValCodEdt(msk_cd_grupo_item);
  with datm_tot_gastos_porto.qry_grupo_item_ do
  begin
    ParamByName('CD_GRUPO_ITEM').AsString := msk_cd_grupo_ITEM.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo de itens não encontrado!',2);
      msk_cd_grupo_item.Clear;
      msk_cd_grupo_item.setfocus;
    end
    else edt_nm_grupo_item.Text:= FieldByName('NM_GRUPO_ITEM').AsString;
    Close;
  end;
end;

procedure Tfrm_tot_gastos_porto.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Enabled:= False;
    msk_cd_cliente.Color:= clmenu;
    btn_cd_cliente.Enabled:= False;
  end
  else
  begin
    msk_cd_cliente.Enabled:= True;
    msk_cd_cliente.Color:= clwindow;
    btn_cd_cliente.Enabled:= True;
  end;
end;

procedure Tfrm_tot_gastos_porto.msk_cd_clienteChange(
  Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    msk_cd_grupo.Enabled:= False;
    msk_cd_grupo.Color:= clmenu;
    btn_grupo.Enabled:= false;
  end
  else
  begin
    msk_cd_grupo.Enabled:= True;
    msk_cd_grupo.Color:= clwindow;
    btn_grupo.Enabled:= True;
  end;
end;

procedure Tfrm_tot_gastos_porto.btn_iniciarClick(Sender: TObject);
var nr_identificador:integer;
begin
  nr_identificador:= 0;
  if (msk_cd_grupo.Text = '') and (msk_cd_cliente.Text = '') then
  begin
    BoxMensagem('Informe o grupo ou o código do cliente.',2);
    msk_cd_grupo.SetFocus;
    Exit;
  end;

  if (msk_cd_unid_neg.Text = '') then
  begin
    BoxMensagem('Informe a unidade de negócio!',2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if (msk_cd_produto.Text = '') then
  begin
    BoxMensagem('Informe o código do produto!',2);
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if msk_dt_inicio.Date > msk_dt_fim.Date then
  begin
    BoxMensagem('Data inicial não pode ser maior que a data final.',2);
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if msk_cd_grupo_item.Text = '' then
  begin
    BoxMensagem('Informe o grupo do item.',2);
    msk_cd_grupo_item.SetFocus;
    Exit;
  end;

  if msk_cd_moeda.Text = '' then
  begin
    BoxMensagem('Informe a moeda.',2);
    msk_cd_moeda.SetFocus;
    Exit;
  end;

  with Crp_rel do
  begin
    case str_relatorio of
    1: begin
         Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
         ReportName  := cDir_Rpt + '\CRES003.RPT';
         ReportTitle := 'Total de Gastos por Porto com ' + edt_nm_grupo_item.Text + #13 +
                        'na Moeda ' + edt_nm_moeda.Text + #13 +
                        'no Período de ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) +
                        ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + #13;
         Formulas[0] := 'Dt_inicial = ' + DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
         Formulas[1] := 'Dt_final = ' + DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) );
         Formulas[2] := 'cd_moeda = "' + msk_cd_moeda.Text + '"';
         Formulas[3] := 'cd_produto = "' + msk_cd_produto.Text + '"';
         Formulas[4] := 'cd_unid_neg = "' + msk_cd_unid_neg.Text + '"';
         Formulas[5] := 'cd_cliente = "' + msk_cd_cliente.Text + '"';
         Formulas[6] := 'cd_grupo_cliente = "' + msk_cd_grupo.Text + '"';
         Formulas[7] := 'cd_grupo_item = "' + msk_cd_grupo_item.Text + '"';
       end;
    2: begin
         try
           datm_main.db_broker.StartTransaction;
           with datm_tot_gastos_porto do
           begin
             CloseStoredProc(sp_gastos_armazenagem);
             sp_gastos_armazenagem.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
             sp_gastos_armazenagem.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
             sp_gastos_armazenagem.ParamByName('@cd_grupo_item').AsString := msk_cd_grupo_item.Text;
             sp_gastos_armazenagem.ParamByName('@cd_moeda').AsString      := msk_cd_moeda.Text;
             sp_gastos_armazenagem.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
             sp_gastos_armazenagem.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
             sp_gastos_armazenagem.ParamByName('@periodo_inicial').AsDate := msk_dt_inicio.Date;
             sp_gastos_armazenagem.ParamByName('@periodo_final').AsDate   := msk_dt_fim.Date;
             ExecStoredProc(sp_gastos_armazenagem);
             nr_identificador := sp_gastos_armazenagem.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc(sp_gastos_armazenagem);
           end;
           datm_main.db_broker.Commit;
         except
           on E: Exception do
           begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             TrataErro(E);
             Exit;
           end;
         end;
         Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
         ReportName  := cDir_Rpt + '\CRES004.rpt';
         ReportTitle := 'Total de Gastos por Porto com ' + edt_nm_grupo_item.Text + #13 +
                        'na Moeda ' + edt_nm_moeda.Text + #13 +
                        'no Período de ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) +
                        ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + #13 +
                        edt_nm_unid_neg.Text + ' - ' + edt_nm_produto.Text;
         Formulas[0] := 'nr_identificador = ' + IntToStr(nr_identificador);
       end;
    end;
    Execute;
  end;
  if str_relatorio = 2 then
  begin
    with datm_tot_gastos_porto.qry_del_gastos_armazenagem do
    begin
      ParamByName('nr_identificador').AsInteger:= nr_identificador;
      Prepare;
      ExecSQL;
    end;
  end;
end;

procedure Tfrm_tot_gastos_porto.msk_cd_moedaExit(Sender: TObject);
begin
  edt_nm_moeda.Clear;
  if msk_cd_moeda.Text = '' then Exit;
  ValCodEdt(msk_cd_moeda);
  with datm_tot_gastos_porto.qry_moeda_ do
  begin
    ParamByName('CD_MOEDA').AsString := msk_cd_moeda.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Moeda de não encontrada!',2);
      msk_cd_moeda.Clear;
      msk_cd_moeda.setfocus;
    end
    else edt_nm_moeda.Text:= FieldByName('NM_MOEDA').AsString;
    Close;
  end;
end;

procedure Tfrm_tot_gastos_porto.btn_grupoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2201';
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
    msk_cd_grupoExit(nil);
    if (frm_grupo.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_grupoExit(nil);
end;

procedure Tfrm_tot_gastos_porto.btn_cd_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
    msk_cd_clienteExit(nil);
    if (frm_cliente.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_tot_gastos_porto.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);
  frm_consulta_padrao.nCodigo              := 16;
  datm_consulta_padrao.Tabela.DataBaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TGRUPO_ITEM';

  datm_consulta_padrao.Tabela.Open;
  with frm_consulta_padrao do
  begin
    Caption := 'Grupo de Item [Consulta On_Line]';
    lCons_OnLine := True;
    ShowModal;
    msk_cd_grupo_item.Text:= Cons_OnLine_Texto;
    lCons_OnLine := False;
  end;
  msk_cd_grupo_itemExit(nil);
end;

procedure Tfrm_tot_gastos_porto.btn_cd_moedaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_moeda.Text := frm_moeda.Cons_OnLine_Texto;
    msk_cd_moedaExit(nil);
    if (frm_moeda.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_moeda.Text := frm_moeda.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_moedaExit(nil);
end;

procedure Tfrm_tot_gastos_porto.FormShow(Sender: TObject);
begin
  case str_relatorio of
    1: caption:= 'Total de Gastos por Porto';
    2: caption:= 'Total de Gastos/Média por Porto';

  end;

  label8.caption := caption;

  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;
  msk_dt_inicio.TabOrder := msk_cd_produto.TabOrder + 1;
  msk_dt_fim.TabOrder    := msk_dt_inicio.TabOrder + 1;
end;

procedure Tfrm_tot_gastos_porto.msk_cd_grupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_grupo then btn_grupoClick(nil);
    if Sender = msk_cd_cliente then btn_cd_clienteClick(nil);
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto then btn_cd_produtoClick(nil);
    if Sender = msk_cd_grupo_item then SpeedButton1Click(nil);
    if Sender = msk_cd_moeda then btn_cd_moedaClick(nil);
  end;
end;


end.
