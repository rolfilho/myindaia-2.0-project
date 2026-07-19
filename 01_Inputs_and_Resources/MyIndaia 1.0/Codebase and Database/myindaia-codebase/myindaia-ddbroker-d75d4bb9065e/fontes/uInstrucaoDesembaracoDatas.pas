unit uInstrucaoDesembaracoDatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, RxMemDS, DbTables,
  Buttons;

type
  TFrmInstrucaoDesembaracoDatas = class(TForm)
    pnl_ev_espec: TPanel;
    shp13: TShape;
    shp9: TShape;
    lbl_09: TLabel;
    lbl_11: TLabel;
    lbl_14: TLabel;
    dbgrdEventoEspec: TDBGrid;
    DtsDatas: TDataSource;
    TblDatas: TRxMemoryData;
    TblDatasCD_EVENTO: TStringField;
    TblDatasNM_EVENTO: TStringField;
    TblDatasDT_REALIZADO: TStringField;
    Panel4: TPanel;
    btnSalvarPedido: TSpeedButton;
    btnCancelarPedido: TSpeedButton;
    TblDatasIN_APLICAVEL: TStringField;
    Label1: TLabel;
    TblDatasIN_MARCADO: TStringField;
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdEventoEspecDblClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure dbgrdEventoEspecDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    fIdCodInstrucao : string;
  public
    property IdCodInstrucao : string read fIdCodInstrucao write fIdCodInstrucao;
    procedure AlimentaTabMemoria(const pIdCodigo : string);
  end;

var
  FrmInstrucaoDesembaracoDatas: TFrmInstrucaoDesembaracoDatas;

implementation

{$R *.dfm}

uses
  uDatm_InstrucaoDesembaraco, ConsOnLineEx, PGGP017, Funcoes;


procedure TFrmInstrucaoDesembaracoDatas.AlimentaTabMemoria(const pIdCodigo : string);
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Add('select E.CD_EVENTO,  E.NM_EVENTO');
    Sql.Add('from TSERVICO_EVENTO SE, TEVENTO E');
    Sql.Add('where');
    Sql.Add('  SE.CD_SERVICO IN (');
    Sql.Add('	 SELECT CD_SERVICO');
    Sql.Add('	 FROM TPROCESSO(NOLOCK)');
    Sql.Add('	 where');
    Sql.Add('	   NR_REFERENCIA in ( select distinct NR_REFERENCIA');
    Sql.Add('	   					          from TINSTRUCAO_DESEMBARACO_PEDIDO');
    Sql.Add('						            where ID_CODIGO =:ID_CODIGO)) AND');
    Sql.Add('    E.CD_EVENTO = SE.CD_EVENTO');
    Sql.Add('ORDER BY NR_ORDEM');

    ParamByName('ID_CODIGO').AsString     := pIdCodigo;
    Open;
    TblDatas.Open;

    while not Eof do
    begin
      TblDatas.Insert;
      TblDatas.FieldByName('CD_EVENTO').AsString := FieldByName('CD_EVENTO').AsString;
      TblDatas.FieldByName('NM_EVENTO').AsString := FieldByName('NM_EVENTO').AsString;

      TblDatas.FieldByName('DT_REALIZADO').AsString := '';
      TblDatas.FieldByName('IN_APLICAVEL').AsString := '';


      TblDatas.Post;
      Next;
    end;
    Free;
  end;
end;

procedure TFrmInstrucaoDesembaracoDatas.btnCancelarPedidoClick(
  Sender: TObject);
begin
  Close;
end;

procedure TFrmInstrucaoDesembaracoDatas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Escape then
    btnCancelarPedido.Click;
end;

procedure TFrmInstrucaoDesembaracoDatas.dbgrdEventoEspecDblClick(
  Sender: TObject);
begin
  if (dbgrdEventoEspec.SelectedField.FieldName = 'IN_MARCADO') then
  begin
    TblDatas.Edit;
    TblDatas.FieldByName('IN_MARCADO').Asstring := IIF(TblDatas.FieldByName('IN_MARCADO').AsString = 'ü','','ü');
    if TblDatas.FieldByName('IN_MARCADO').AsString <> '' then
      TblDatas.FieldByName('IN_APLICAVEL').AsString := TblDatas.FieldByName('IN_MARCADO').AsString;
    TblDatas.Post;
  end;

  if (dbgrdEventoEspec.SelectedField.FieldName = 'IN_APLICAVEL') then
  begin
    TblDatas.Edit;
    TblDatas.FieldByName('IN_APLICAVEL').AsString := IIF(TblDatas.FieldByName('IN_APLICAVEL').AsString = 'ü','','ü');
    TblDatas.Post;
  end;

  if TblDatas.FieldByName('IN_APLICAVEL').AsString = 'ü' then
  begin
    if (dbgrdEventoEspec.SelectedField.FieldName = 'DT_REALIZADO') then
    begin
      TblDatas.Edit;
      TblDatas.FieldByName('DT_REALIZADO').AsDateTime := Date;
      TblDatas.Post;
    end;
  end;
//  else
//    BoxMensagem('Este evento esta marcado como não aplicável, você não pode alterar a data de realização.',2);
end;

procedure TFrmInstrucaoDesembaracoDatas.btnSalvarPedidoClick(
  Sender: TObject);
var
  vQryPedidos : TQuery;
begin
//Consistência de data foi colocada desta forma pois não encontrei forma melhor d se fazer a consistência em Memory Table
  TblDatas.First;
  while not TblDatas.Eof do
  begin
    if TblDatasDT_REALIZADO.AsString <> '' then
    begin
      try
        TblDatasDT_REALIZADO.AsDateTime;
      except
        BoxMensagem('A data "' + TblDatasDT_REALIZADO.AsString + '" está incorreta, por favor corrija!',2);
        Exit;
      end;
    end;
    TblDatas.Next;
  end;                                         

  //Seleciona apenas os pedidos da instrução de desembaraço atual
  vQryPedidos := TQuery.Create(Application);
  vQryPedidos.DataBaseName := 'DBBROKER';
  vQryPedidos.SQL.Add('select NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL');
  vQryPedidos.SQL.Add('from TINSTRUCAO_DESEMBARACO_PEDIDO');
  vQryPedidos.SQL.Add('where');
  vQryPedidos.SQL.Add('   ID_CODIGO =:ID_CODIGO');
  vQryPedidos.ParamByName('ID_CODIGO').AsString := IdCodInstrucao;
  vQryPedidos.Open;

  TblDatas.First;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    while not TblDatas.Eof do
    begin
      if TblDatasIN_MARCADO.AsString <> '' then //Somente os eventos que foram marcados como "IN_MARCADO"
      begin
        vQryPedidos.First;
        while not vQryPedidos.Eof do //pra cada pedido/item/parcial da instrução, será alimentado o followup de pedidos com a data digitada
        begin
          Close;
          Sql.Clear;
          Sql.Add('UPDATE TFLP_PO_ITEM');
          Sql.Add('SET');
          Sql.Add('  CD_RESP_REALIZACAO =:CD_RESP_REALIZACAO, ');
          Sql.Add('  IN_APLICAVEL       =:IN_APLICAVEL,       ');
          if Trim(TblDatasDT_REALIZADO.AsString) <> '' then
            Sql.Add('  DT_REALIZACAO      =:DT_REALIZACAO       ')
          else
            Sql.Add('  DT_REALIZACAO      = NULL');
          Sql.Add('WHERE');
          Sql.Add('  NR_PROCESSO =:NR_PROCESSO and NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE AND ');
          Sql.Add('  NR_PARCIAL =:NR_PARCIAL AND CD_EVENTO =:CD_EVENTO');

          ParamByName('CD_RESP_REALIZACAO').AsString := Str_Cd_Usuario;
          ParamByName('IN_APLICAVEL').AsString       := IIF(TblDatasIN_APLICAVEL.AsString <> '','1','0');

          if Trim(TblDatasDT_REALIZADO.AsString) <> '' then
            ParamByName('DT_REALIZACAO').AsDateTime    := TblDatasDT_REALIZADO.AsDateTime;

          ParamByName('NR_PROCESSO').AsString     := vQryPedidos.FieldByName('NR_REFERENCIA').AsString;
          ParamByName('NR_ITEM_CLIENTE').AsString := vQryPedidos.FieldByName('NR_ITEM_PO').AsString;
          ParamByName('NR_PARCIAL').AsInteger     := vQryPedidos.FieldByName('NR_PARCIAL').AsInteger;

          ParamByName('CD_EVENTO').AsString          := TblDatasCD_EVENTO.AsString;
          ExecSql;

          vQryPedidos.Next;
        end;
      end;
      TblDatas.Next;
    end;
    Free;
  end;
  if TblDatas.Eof then
  begin
    BoxMensagem('Datas atualizadas com sucesso !',3);
    vQryPedidos.Free;
    Close;
  end;
end;

procedure TFrmInstrucaoDesembaracoDatas.dbgrdEventoEspecDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_APLICAVEL').AsString = '') or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_MARCADO').AsString = '')  then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clGray;
    TDBGrid(Sender).Canvas.FillRect(Rect);
//    TDBGrid(Sender).Canvas.Brush.Color := $00EFEFEF;
  end
  else
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
//    TDBGrid(Sender).Canvas.Brush.Color := $00EFEFEF;
  end;

  if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_EVENTO').AsString = '022' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00E9E9FE;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.



  
