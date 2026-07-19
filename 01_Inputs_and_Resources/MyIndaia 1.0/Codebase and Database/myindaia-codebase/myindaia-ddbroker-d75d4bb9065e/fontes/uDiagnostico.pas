unit uDiagnostico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, DB, DBTables, DBGrids, dbcgrids, Menus, Buttons,
  StdCtrls, Mask, PGGP001, Funcoes;

type
  TFrmDiagnostico = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dtsDiagnostico: TDataSource;
    SqlDiagnostico: TQuery;
    SqlDiagnosticoCODIGO: TAutoIncField;
    SqlDiagnosticoNR_PROCESSO: TStringField;
    SqlDiagnosticoSTATUS: TStringField;
    SqlDiagnosticoDESCRICAO: TStringField;
    SqlDiagnosticocalcSTATUS: TStringField;
    btn_liberar: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_liberar: TMenuItem;
    SqlDiagnosticocalcNR_PROCESSO: TStringField;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    SqlDiagnosticoLIBERADO: TStringField;
    SqlDiagnosticocalcLiberado: TStringField;
    btn_trans_LI: TSpeedButton;
    btn_cancelar: TSpeedButton;
    ransmitir1: TMenuItem;
    Sair1: TMenuItem;
    UpdDiagnostico: TUpdateSQL;
    procedure SqlDiagnosticoCalcFields(DataSet: TDataSet);
    procedure btn_liberarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_trans_LIClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    st_modificar, st_incluir, st_excluir : Boolean;
    FlagCancelou : Boolean;
    { Public declarations }
  end;

var
  FrmDiagnostico: TFrmDiagnostico;

implementation

{$R *.dfm}

Uses
  GsmLib, PGGP017;

procedure TFrmDiagnostico.SqlDiagnosticoCalcFields(DataSet: TDataSet);
begin
  If SqlDiagnosticoSTATUS.AsString = 'F' Then      //feliz
    SqlDiagnosticocalcSTATUS.AsString := 'J'
  Else If SqlDiagnosticoSTATUS.AsString = 'S' Then //serio
    SqlDiagnosticocalcSTATUS.AsString := 'K'
  Else                                      //triste
    SqlDiagnosticocalcSTATUS.AsString := 'L';

  If SqlDiagnosticoLIBERADO.AsString = 'N' Then
    SqlDiagnosticocalcLIBERADO.AsString := 'Não'
  Else
    SqlDiagnosticocalcLIBERADO.AsString := 'Sim';
  SqlDiagnosticocalcNR_PROCESSO.AsString := Copy(SqlDiagnosticoNR_PROCESSO.AsString,5,Length(SqlDiagnosticoNR_PROCESSO.AsString));
end;

procedure TFrmDiagnostico.btn_liberarClick(Sender: TObject);
begin
  If SqlDiagnosticoSTATUS.AsString = 'F' Then
    Application.MessageBox('Este processo já está liberado !','Atenção !',MB_IconInformation + MB_OK)
  Else If SqlDiagnosticoSTATUS.AsString = 'T' Then
    Application.MessageBox('Este processo não poderá ser liberado pois necessita de correções importantes na LI!','Atenção !',MB_IconInformation + MB_OK)
  Else    //S
  Begin
    If Application.MessageBox('Tem certeza que deseja liberar o processo ?','Atenção!',MB_IconQuestion + MB_YESNO) = id_Yes Then
    Begin
      SqlDiagnostico.Edit;
      SqlDiagnostico.FieldByName('LIBERADO').AsString := '';
      SqlDiagnostico.Post;
    End;
  End;
end;

procedure TFrmDiagnostico.FormShow(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  btn_liberar.Enabled := st_excluir;
  mi_liberar.Enabled  := st_excluir;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
end;

procedure TFrmDiagnostico.msk_cd_unid_negChange(Sender: TObject);
begin
  With TQuery.Create(Application) Do
  Begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_UNID_NEG, AP_UNID_NEG FROM TUNID_NEG');
    SQL.Add('WHERE CD_UNID_NEG = :CD_UNID_NEG');
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    edt_nm_unid_neg.Text := FieldByName('AP_UNID_NEG').AsString;
  End;
end;

procedure TFrmDiagnostico.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
{  If TDBGrid(Sender).DataSource.DataSet.FieldByName('STATUS').AsString = 'F' Then  //
    TDBGrid(Sender).Columns.Items[0].Color := $0040BC03
  Else If TDBGrid(Sender).DataSource.DataSet.FieldByName('STATUS').AsString = 'S' Then  //
    TDBGrid(Sender).Columns.Items[0].Color := $0095FFFF
  Else
    TDBGrid(Sender).Columns.Items[0].Color := $002D2DFD;


{  TDBGrid(Sender).Canvas.FillRect(Rect);
  If TDBGrid(Sender).DataSource.DataSet.FieldByName('STATUS').AsString = 'F' Then  //
    TDBGrid(Sender).Canvas.Brush.Color := $0040BC03
  Else If TDBGrid(Sender).DataSource.DataSet.FieldByName('STATUS').AsString = 'S' Then  //
    TDBGrid(Sender).Canvas.Brush.Color := $0095FFFF
  Else
    TDBGrid(Sender).Canvas.Brush.Color := $002D2DFD;
  TDBGrid(Sender).Canvas.TextOut(Rect.Left + 2 ,Rect.Top+2, Column.Field.Text );
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State); }
end;

procedure TFrmDiagnostico.btn_trans_LIClick(Sender: TObject);
begin
  FlagCancelou := False;
  Close;
end;

procedure TFrmDiagnostico.btn_cancelarClick(Sender: TObject);
begin
  FlagCancelou := True;
  Close;
end;

procedure TFrmDiagnostico.FormCreate(Sender: TObject);
begin
  FlagCancelou := False;
end;

end.


