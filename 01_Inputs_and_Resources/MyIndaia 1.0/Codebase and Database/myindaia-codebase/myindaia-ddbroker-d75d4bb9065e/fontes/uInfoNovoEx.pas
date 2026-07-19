unit uInfoNovoEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxCurrencyEdit, cxCheckBox,
  cxMaskEdit, cxLabel, StdCtrls, Buttons;

type
  Tfrm_info_novoex = class(TForm)
    cxgREItensDBTableView1: TcxGridDBTableView;
    cxgREItensLevel1: TcxGridLevel;
    cxgREItens: TcxGrid;
    cxgREItensNR_RE: TcxGridDBColumn;
    cxgREItensNR_NCM: TcxGridDBColumn;
    cxgREItensTX_MERCADORIA: TcxGridDBColumn;
    cxgREItensVL_COND_VENDA: TcxGridDBColumn;
    cxgREItensVL_LOCAL_EMB: TcxGridDBColumn;
    cxgREItensQT_UNID_COMERC: TcxGridDBColumn;
    cxgREItensTX_UNID_COMERC: TcxGridDBColumn;
    cxgREItensQT_UNID_ESTAT: TcxGridDBColumn;
    cxgREItensTX_UNID_ESTAT: TcxGridDBColumn;
    cxgREItensQT_PESO_LIQ: TcxGridDBColumn;
    cxgREItensIN_CO: TcxGridDBColumn;
    cxgREItensTX_ENQUADRAMENTO: TcxGridDBColumn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function ShowModal(NrProcesso: String): Integer; reintroduce;
  end;

var
  frm_info_novoex: Tfrm_info_novoex;

implementation

{$R *.dfm}
uses dInfoNovoEx, PGGP018;

function Tfrm_info_novoex.ShowModal(NrProcesso: String): Integer;
begin
  with datm_info_novoex.qryREItensNovoEx do
  begin
    Close;
    ParamByName('NR_PROCESSO').AsString := NrProcesso;
    Open;
  end;
  Result := Inherited ShowModal;
end;

procedure Tfrm_info_novoex.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_info_novoex, datm_info_novoex);
end;

procedure Tfrm_info_novoex.FormDestroy(Sender: TObject);
begin
  if datm_info_novoex.qryREItensNovoEx.State in [dsEdit] then
    datm_info_novoex.qryREItensNovoEx.Post;
  FreeAndNil(datm_info_novoex);
end;

end.
