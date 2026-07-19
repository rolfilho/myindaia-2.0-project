unit FrPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyDgOk, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Generics.Collections,
  MyEntitiesBroker,
  System.Rtti,
  Aurelius.Criteria.Base,
  ConnectionModule,
  Aurelius.Mapping.Attributes, Aurelius.Types.DynamicProperties, Aurelius.Bind.Dataset,
  Aurelius.Bind.BaseDataset;

type
  TWhereDefaut = Record
    Produto: string;
    ativo: String;
  end;

  TformMyPesquisa = class(TformMyDgOk)
    Panel2: TPanel;
    Panel3: TPanel;
    btnPesquisar: TButton;
    edtPesquisa: TEdit;
    Label1: TLabel;
    cboPesquisa: TComboBox;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    dsMain: TDataSource;
    adsMain: TAureliusDataset;
    Label3: TLabel;
    cbxTipoPesquisa: TComboBox;
    procedure btnPesquisarClick(Sender: TObject);
    procedure cboPesquisaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FEntidade: TClass;
    Campos: TStrings;
    FWhereDefaut: TWhereDefaut;
    procedure LoadData;
  protected
    procedure DoActivate; override;
  public
    class function Execute(Entidade: TClass; Campos, Filtros: array of string; AWhereDefaut: TWhereDefaut): TObject;
  end;

var
  formMyPesquisa: TformMyPesquisa;

implementation

uses Aurelius.Criteria.Linq;

{$R *.dfm}

procedure TformMyPesquisa.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TformMyPesquisa.LoadData;
var
  Criteria: TCriteria;
  I: Integer;
  Index: Integer;
begin
  Criteria := FObjectManager.CreateCriteria(FEntidade);
  if (edtPesquisa.Text <> '') then
  begin
    if cbxTipoPesquisa.ItemIndex = 0 then
      Criteria.Where(
        TLinq.Like(cboPesquisa.Items.Names[cboPesquisa.ItemIndex], '%' + edtPesquisa.Text + '%')
      )
    else
      Criteria.Where(
        TLinq.Eq(cboPesquisa.Items.Names[cboPesquisa.ItemIndex], edtPesquisa.Text)
      );
  end;
  if not FWhereDefaut.Produto.IsEmpty then
    Criteria.Add(Linq.eq('cdProduto', FWhereDefaut.Produto));

  if not FWhereDefaut.ativo.IsEmpty then
    Criteria.Add(Linq.Eq('InAtivo', FWhereDefaut.ativo));

  adsMain.Close;
  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
  for I := 0 to adsMain.FieldCount -1 do
  begin
    Index := Campos.IndexOfName(adsMain.Fields[I].FieldName);
    if Index >=0 then
      adsMain.Fields[I].DisplayLabel := Campos.ValueFromIndex[Index]
    else
      adsMain.Fields[I].Visible := False;
  end;
end;

procedure TformMyPesquisa.cboPesquisaDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  cboPesquisa.Canvas.TextRect(Rect, Rect.Left, Rect.Top, cboPesquisa.Items.ValueFromIndex[Index]);
end;

procedure TformMyPesquisa.DoActivate;
begin
  inherited;
  LoadData;
end;

class function TformMyPesquisa.Execute(Entidade: TClass; Campos, Filtros: array of string; AWhereDefaut: TWhereDefaut): TObject;
var
  Form: TformMyPesquisa;
  I: Integer;
begin
  Form := TformMyPesquisa.Create(nil);
  try
    Form.FEntidade := Entidade;
    for I := Low(Campos) to High(Campos) do
      Form.Campos.Add(Campos[I]);
    for I := Low(Filtros) to High(Filtros) do
      Form.cboPesquisa.Items.Add(Filtros[I]);
    Form.cboPesquisa.ItemIndex := 0;
    Form.FObjectManager := FireDacMSSQL.ObjectManager;
    Form.FWhereDefaut := AWhereDefaut;
    Form.ShowModal;
    if Form.ModalResult = mrOk then
    begin
      Result := Form.adsMain.EntityFieldByName('Self').AsObject;
    end;
  finally
    Form.Free;
  end;
end;

procedure TformMyPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  Campos := TStringList.Create;
end;

procedure TformMyPesquisa.FormDestroy(Sender: TObject);
begin
  inherited;
  Campos.Free;
end;

end.
