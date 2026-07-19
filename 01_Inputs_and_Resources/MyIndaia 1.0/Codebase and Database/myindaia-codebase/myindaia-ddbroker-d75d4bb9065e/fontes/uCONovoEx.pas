unit uCONovoEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxLabel, cxMaskEdit,
  StdCtrls, Buttons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxCurrencyEdit, DBTables, Grids, DBGrids, ConsOnlineEx, Menus, ExtCtrls;

type
  Tfrm_co_novoex = class(TForm)
    cxgREItens: TcxGrid;
    cxgREItensDBTableView1: TcxGridDBTableView;
    cxgREItensLevel1: TcxGridLevel;
    cxgREsNR_RE: TcxGridDBColumn;
    cxgREsIN_RE_CO: TcxGridDBColumn;
    cxgREsNR_NCM: TcxGridDBColumn;
    cxgREsTX_ENQUADRAMENTO: TcxGridDBColumn;
    cxgREsVL_COND_VENDA: TcxGridDBColumn;
    cxgREsVL_LOCAL_EMB: TcxGridDBColumn;
    cxgREsQT_UNID_COMERC: TcxGridDBColumn;
    cxgREsTX_UNID_COMERC: TcxGridDBColumn;
    cxgREsQT_UNID_ESTAT: TcxGridDBColumn;
    cxgREsTX_UNID_ESTAT: TcxGridDBColumn;
    cxgREsQT_PESO_LIQ: TcxGridDBColumn;
    cxgREsCGC_EMPRESA: TcxGridDBColumn;
    cxgREsNM_EMPRESA: TcxGridDBColumn;
    cxgREsNM_EMPRESA2: TcxGridDBColumn;
    pmREs: TPopupMenu;
    mi_marcar_todos_REs: TMenuItem;
    mi_desmarcar_todos_REs: TMenuItem;
    Panel1: TPanel;
    btnCO: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCOClick(Sender: TObject);
    procedure mi_marcar_todos_REsClick(Sender: TObject);
    procedure pmREsPopup(Sender: TObject);
    procedure mi_desmarcar_todos_REsClick(Sender: TObject);
  private
    procedure AtualizaREs(Selecionado: Boolean; Usuario: Variant);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_co_novoex: Tfrm_co_novoex;

implementation

{$R *.dfm}
uses
dCONovoEx, PGGP017, PGSM990, StrUtils;

procedure Tfrm_co_novoex.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_co_novoex, datm_co_novoex);
  datm_co_novoex.qryREsNovoEx.Open;
end;

procedure Tfrm_co_novoex.FormDestroy(Sender: TObject);
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TPROCESSO_RE_ITENS_NOVOEX SET IN_RE_CO = 0, CD_USUARIO_CO = NULL WHERE CD_USUARIO_CO = :CD_USUARIO_CO ');
    ParamByName('CD_USUARIO_CO').AsString := str_cd_usuario;
    ExecSQL;
  end;
  datm_co_novoex.qryREsNovoEx.Close;
  FreeAndNil(datm_co_novoex);
end;

procedure Tfrm_co_novoex.btnCOClick(Sender: TObject);
begin
  if datm_co_novoex.qryREsNovoEx.State in [dsEdit] then
    datm_co_novoex.qryREsNovoEx.Post;

  datm_co_novoex.qryREsCOCapa.Close;
  datm_co_novoex.qryREsCOCapa.ParamByName('CD_USUARIO_CO').AsString  := str_cd_usuario;
  datm_co_novoex.qryREsCOCapa.Open;

  if (datm_co_novoex.qryREsCOCapa.Eof) then
  begin
    ShowMessage('ATENÇÃO: Você não selecionou nenhum RE!');
    datm_co_novoex.qryREsCOCapa.Close;
  end
  else
  begin
    datm_co_novoex.qryREsCONCM.Close;
    datm_co_novoex.qryREsCONCM.ParamByName('CD_USUARIO_CO').AsString := str_cd_usuario;
    datm_co_novoex.qryREsCONCM.Open;

    datm_co_novoex.qryREsCOItens.Close;
    datm_co_novoex.qryREsCOItens.ParamByName('CD_USUARIO_CO').AsString := str_cd_usuario;
    datm_co_novoex.qryREsCOItens.Open;

    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := '01';
    frm_impressao.cd_produto    := '02';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_modulo     := '1597';
    frm_impressao.cd_grupo      := '';
    frm_impressao.in_processo   := '0';
    frm_impressao.vApenas_email := false;
    frm_impressao.ShowModal;
    frm_impressao.Release;
   end;
end;

procedure Tfrm_co_novoex.mi_marcar_todos_REsClick(Sender: TObject);
begin
  AtualizaREs(True, str_cd_usuario);
end;

procedure Tfrm_co_novoex.pmREsPopup(Sender: TObject);
begin
  mi_marcar_todos_REs.Visible := cxgREsNR_RE.Focused;
end;

procedure Tfrm_co_novoex.AtualizaREs(Selecionado: Boolean;
  Usuario: Variant);
var
  RE: String;
begin
  RE := Copy(datm_co_novoex.qryREsNovoExNR_RE.AsString, 1, 9);
  datm_co_novoex.qryREsNovoEx.First;
  datm_co_novoex.qryREsNovoEx.Locate('NR_RE', RE, [loPartialKey]);
  while (not datm_co_novoex.qryREsNovoEx.Eof) and (LeftStr(datm_co_novoex.qryREsNovoExNR_RE.AsString, 9) = RE) do
  begin
    datm_co_novoex.qryREsNovoEx.Edit;
    datm_co_novoex.qryREsNovoExIN_RE_CO.AsBoolean := Selecionado;
    datm_co_novoex.qryREsNovoExCD_USUARIO_CO.AsVariant := Usuario;
    datm_co_novoex.qryREsNovoEx.Post;

    datm_co_novoex.qryREsNovoEx.Next;
  end;
  datm_co_novoex.qryREsNovoEx.Prior;

end;

procedure Tfrm_co_novoex.mi_desmarcar_todos_REsClick(Sender: TObject);
begin
  AtualizaREs(False, NULL);
end;

end.
