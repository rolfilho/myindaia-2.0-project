unit PGPO011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls, DBCtrls, Menus, ConsOnLineEx;

type
  Tfrm_po_consulta_prod = class(TForm)
    main_cons_produtos: TMainMenu;
    mi_sair: TMenuItem;
    pnl_comandos: TPanel;
    btn_sair: TSpeedButton;
    bvl_po_consulta: TBevel;
    lbl_importador: TLabel;
    mskedt_cd_importador: TMaskEdit;
    edt_nm_importador: TEdit;
    btn_co_importador: TSpeedButton;
    lbl_mercadoria: TLabel;
    mskedt_cd_mercadoria: TMaskEdit;
    btn_co_mercadoria: TSpeedButton;
    dbgrd_consulta_prod: TDBGrid;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskedt_cd_mercadoriaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskedt_cd_mercadoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mskedt_cd_importadorExit(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_po_consulta_prod: Tfrm_po_consulta_prod;

implementation

uses GSMLIB, PGPO012, PGGP001;

{$R *.DFM}

procedure Tfrm_po_consulta_prod.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_po_consulta_prod.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_po_consulta_prod, datm_po_consulta_prod );
end;

procedure Tfrm_po_consulta_prod.mskedt_cd_mercadoriaExit(Sender: TObject);
begin
  with datm_po_consulta_prod do
  begin
    if Trim( mskedt_cd_mercadoria.Text ) <> '' then
    begin
      If Trim( mskedt_cd_importador.Text ) <> '' then
      begin
        dbgrd_consulta_prod.DataSource := ds_po_itens2;

        qry_po_itens2_.Close;
        qry_po_itens2_.ParamByName('CD_IMPORTADOR').AsString := mskedt_cd_importador.Text;
        qry_po_itens2_.ParamByName('CD_MERCADORIA').AsString := mskedt_cd_mercadoria.Text;
        qry_po_itens2_.Prepare;
        qry_po_itens2_.Open;

        If qry_po_itens2_.RecordCount = 0 then
        begin
          BoxMensagem( 'Nao existem itens com este Cliente e Mercadoria no PO !!', 3 );
          mskedt_cd_mercadoria.Text := '';
          mskedt_cd_mercadoria.SetFocus;
          exit;
        end;
      end
      else
      begin
        dbgrd_consulta_prod.DataSource := ds_po_itens1;

        qry_po_itens1_.Close;
        qry_po_itens1_.ParamByName('CD_MERCADORIA').AsString := mskedt_cd_mercadoria.Text;
        qry_po_itens1_.Prepare;
        qry_po_itens1_.Open;

        If qry_po_itens1_.RecordCount = 0 then
        begin
          BoxMensagem( 'Nao existem itens com esta Mercadoria no PO !!', 3 );
          mskedt_cd_mercadoria.Text := '';
          mskedt_cd_mercadoria.SetFocus;
          exit;
        end;
      end;
    end
    else
    begin
      dbgrd_consulta_prod.Enabled := False;
      Exit;
    end;

    dbgrd_consulta_prod.Enabled := True;
  end;
end;

procedure Tfrm_po_consulta_prod.FormShow(Sender: TObject);
begin
  mskedt_cd_importador.Text   := '';
  edt_nm_importador.Text      := '';
  mskedt_cd_mercadoria.Text   := '';
  dbgrd_consulta_prod.Enabled := False;
end;

procedure Tfrm_po_consulta_prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_po_consulta_prod do
  begin
    qry_po_itens1_.Close;
    qry_po_itens2_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_cliente_.Close;

    Free;
  end;
  Action := caFree
end;

procedure Tfrm_po_consulta_prod.mskedt_cd_mercadoriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = mskedt_cd_importador then btn_co_importadorClick(nil);
    if Sender = mskedt_cd_mercadoria then btn_co_mercadoriaClick(nil);
  end;
end;

procedure Tfrm_po_consulta_prod.mskedt_cd_importadorExit(Sender: TObject);
begin
  edt_nm_importador.Clear;
  if mskedt_cd_importador.Text = '' then Exit;

  ValCodEdt(mskedt_cd_importador);
  with datm_po_consulta_prod Do
  begin
    qry_cliente_.Close;
    qry_cliente_.ParamByName('CD_CLIENTE').AsString := mskedt_cd_importador.Text;
    qry_cliente_.Open;
    if qry_cliente_.RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      mskedt_cd_importador.Clear;
      mskedt_cd_importador.SetFocus;
    end
    else edt_nm_importador.Text:= qry_cliente_.FieldByName('AP_EMPRESA').AsString;
  end;
end;

procedure Tfrm_po_consulta_prod.btn_co_importadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    mskedt_cd_importador.Text := ConsultaOnLineEx('TEMPRESA_NAC','Importadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  else
    edt_nm_importador.Text := ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA', mskedt_cd_importador.Text,'NM_EMPRESA');
  mskedt_cd_importadorExit(nil);
end;

procedure Tfrm_po_consulta_prod.btn_co_mercadoriaClick(Sender: TObject);
var
  vImport, vGrupo, vFiltro : string;
begin
  if Sender is TSpeedButton then
  begin
    if Trim( mskedt_cd_importador.Text ) <> '' then
    begin
      vImport := Trim( mskedt_cd_importador.Text );
      vGrupo  := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', vImport, 'CD_GRUPO');
      vFiltro := '( ( CD_IMPORTADOR = ''' + vImport + ''' AND ''' + vImport + ''' <> '''' ) OR ( CD_GRUPO = ''' + vGrupo + ''' AND ''' + vGrupo + ''' <> '''') )';
      mskedt_cd_mercadoria.Text := ConsultaOnLineExFiltro('TMERCADORIA','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA', 'CD_NCM_SH'],['Código','Nome', 'NCM'],'CD_MERCADORIA',vFiltro,frm_main.mi_cad_merc);
      mskedt_cd_mercadoriaExit(nil);
    end
    else
    begin
      vFiltro := 'Para realizar a consulta de Mercadoria informe o Importador';
      MessageDlg(vFiltro, mtInformation, [mbOK], 0);
      Exit;
    end;
  end
end;

procedure Tfrm_po_consulta_prod.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then btn_fecharClick(nil);
end;

end.
