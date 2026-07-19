unit PGPE015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls, DBCtrls, Menus;

type
  Tfrm_pe_consulta_prod = class(TForm)
    pnl_pe_consulta: TPanel;
    lbl_nr_processo: TLabel;
    btn_co_produto: TSpeedButton;
    dbgrd_consulta_prod: TDBGrid;
    lbl_importador2: TLabel;
    mskedt_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    SpeedButton6: TSpeedButton;
    mskedt_cd_mercadoria: TMaskEdit;
    main_cons_produtos: TMainMenu;
    mi_sair: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskedt_cd_mercadoriaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskedt_cd_mercadoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mskedt_cd_clienteExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pe_consulta_prod: Tfrm_pe_consulta_prod;

implementation

  uses PGSM018, PGGP015, PGGP001, PGGP003, GSMLIB, PGSM010,
  PGSM096, PGSM117, PGSM118, PGSM024, PGPE016;

{$R *.DFM}

procedure Tfrm_pe_consulta_prod.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pe_consulta_prod.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_pe_Consulta_Prod, datm_pe_Consulta_Prod );
end;

procedure Tfrm_pe_consulta_prod.mskedt_cd_mercadoriaExit(Sender: TObject);
begin
  with datm_pe_consulta_prod do
  begin

    if mskedt_cd_mercadoria.Text <> '' then
    begin
      If Trim( mskedt_cd_cliente.Text ) <> '' then
      begin
        dbgrd_consulta_prod.DataSource := ds_pe_itens2;

        qry_pe_itens2_.Close;
        qry_pe_itens2_.ParamByName('CD_IMPORTADOR').AsString := mskedt_cd_cliente.Text;
        qry_pe_itens2_.ParamByName('CD_MERCADORIA').AsString := mskedt_cd_mercadoria.Text;
        qry_pe_itens2_.Prepare;
        qry_pe_itens2_.Open;

        If Trim(qry_pe_itens2_NR_PROCESSO.AsString) = '' then
        begin
          BoxMensagem( 'Nao existem itens com este Cliente e Mercadoria no PE !!', 3 );
          mskedt_cd_mercadoria.Text := '';
          mskedt_cd_mercadoria.SetFocus;
          exit;
        end;
      end
      else
      begin
        dbgrd_consulta_prod.DataSource := ds_pe_itens1;

        qry_pe_itens1_.Close;
        qry_pe_itens1_.ParamByName('CD_MERCADORIA').AsString := mskedt_cd_mercadoria.Text;
        qry_pe_itens1_.Prepare;
        qry_pe_itens1_.Open;

        If Trim(qry_pe_itens1_NR_PROCESSO.AsString) = '' then
        begin
          BoxMensagem( 'Nao existem itens com esta Mercadoria no PE !!', 3 );
          mskedt_cd_mercadoria.Text := '';
          mskedt_cd_mercadoria.SetFocus;
          exit;
        end;
      end;

    end
    else
    begin
      qry_pe_itens1_.Close;
      qry_pe_itens2_.Close;
      dbgrd_consulta_prod.Enabled := False;
      Exit;
    end;

    dbgrd_consulta_prod.Enabled := True;
    dbgrd_consulta_prod.SetFocus;
  end;

end;

procedure Tfrm_pe_consulta_prod.FormShow(Sender: TObject);
begin
  dbgrd_consulta_prod.Enabled := False;
  mskedt_cd_cliente.Text := '';
  mskedt_cd_mercadoria.Text := '';
  edt_nm_cliente.Text := ''

end;

procedure Tfrm_pe_consulta_prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_pe_consulta_prod do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_pe_itens1_.Close;
    qry_pe_itens2_.Close;
    qry_cliente_.Close;

    Free;
  end;
  Action := caFree
end;

procedure Tfrm_pe_consulta_prod.mskedt_cd_mercadoriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = mskedt_cd_cliente    then SpeedButton6Click(nil);
    if Sender = mskedt_cd_mercadoria then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_pe_consulta_prod.mskedt_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if mskedt_cd_cliente.text = '' then
  begin
    exit;
  end;
  ValCodEdt(mskedt_cd_cliente);
  With datm_pe_consulta_prod Do
  begin
    qry_cliente_.Close;
    qry_cliente_.ParamByName('CD_CLIENTE').AsString := mskedt_cd_cliente.Text;
    qry_cliente_.Open;
    if Trim(qry_cliente_CD_EMPRESA.AsString) = '' then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      mskedt_cd_cliente.Clear;
      mskedt_cd_cliente.setfocus;
    end
    else edt_nm_cliente.Text:= qry_cliente_.FieldByName('AP_EMPRESA').AsString;
  end;

end;

procedure Tfrm_pe_consulta_prod.SpeedButton6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  With frm_cliente Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := mskedt_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    mskedt_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  mskedt_cd_clienteExit(nil);
  mskedt_cd_cliente.SetFocus;

end;

procedure Tfrm_pe_consulta_prod.btn_co_produtoClick(Sender: TObject);
var
  cFilter : String;
begin

  cFilter := '';

  If Trim(mskedt_cd_cliente.Text) <> '' then
     cFilter := 'CD_EXPORTADOR = ' + mskedt_cd_cliente.text;

  datm_pe_consulta_prod.qry_cliente_.Close;
  datm_pe_consulta_prod.qry_cliente_.Open;

  If mskedt_cd_cliente.Text <> '' then
  begin
    datm_pe_consulta_prod.qry_cliente_.Locate('CD_EMPRESA', mskedt_cd_cliente.Text, []);
    If Trim(datm_pe_consulta_prod.qry_cliente_CD_GRUPO.AsString) <> '' then
       cFilter := cFilter + ' AND CD_GRUPO = ' + datm_pe_consulta_prod.qry_cliente_CD_GRUPO.AsString;
  end;

  Cons_On_line_Texto( 'DBBROKER', 'TMERCADORIA',
                      mskedt_cd_mercadoria,
                      'Mercadorias', 44, cFilter );

  mskedt_cd_mercadoriaExit(Sender);
end;



procedure Tfrm_pe_consulta_prod.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then btn_fecharClick(nil);
end;

end.
