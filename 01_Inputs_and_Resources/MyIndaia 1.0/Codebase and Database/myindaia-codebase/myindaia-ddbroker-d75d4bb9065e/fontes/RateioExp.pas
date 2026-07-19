unit RateioExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, DBCtrls;

type
  Tfrm_rateio_exp = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit3: TDBEdit;
    Edit4: TDBEdit;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Edit5: TDBEdit;
    Edit6: TDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Edit2: TDBEdit;
    Edit1: TDBEdit;
    qry_capa1: TQuery;
    qry_itens1: TQuery;
    dsCapa1: TDataSource;
    dsItens1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    qry_capa1NR_PROCESSO: TStringField;
    qry_capa1VL_PESO_LIQUIDO: TFloatField;
    qry_capa1PADRAO_RATEIO_EXP: TStringField;
    qry_itens1LIQ_A_RATEAR: TFloatField;
    qry_itens1VL_TOT_PESO_LIQ: TFloatField;
    qry_capa1VL_TOT_MCV: TFloatField;
    qry_capa1QT_TOTAL: TFloatField;
    SpeedButton1: TSpeedButton;
    Bevel2: TBevel;
    qry_capa2: TQuery;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    dsCapa2: TDataSource;
    qry_itens2: TQuery;
    FloatField6: TFloatField;
    FloatField8: TFloatField;
    dsItens2: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    vTabela : String;
    procedure ExecutaRateio(const pTabela : String);
  end;

var
  frm_rateio_exp: Tfrm_rateio_exp;

implementation

{$R *.DFM}

procedure TFrm_rateio_exp.ExecutaRateio(const pTabela : String);
var
  vQryLoop, vQryUpdate : TQuery;
  vAuxX1 : Real;
  vAuxX2 : Real;
  total_liquido : Real;
  total_bruto : Real;
begin

// *****************************************************************************
// verifica se alterou o Peso Bruto e/ou Liquido da Capa
// *****************************************************************************

  total_liquido := StrToFloat(Edit3.Text);
  total_bruto := StrToFloat(Edit4.Text);

  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM ' + pTabela + '_ITEM');
    SQL.Add('WHERE NR_PROCESSO = ''' + qry_capa1.FieldByName('NR_PROCESSO').AsString + '''');
    if qry_capa1.FieldByName('PADRAO_RATEIO_EXP').AsString = 'QUANTIDADE' then
      SQL.Add('AND QT_MERCADORIA = 0')
    else
      SQL.Add('AND VL_MLE = 0');
    Open;
    if Fields[0].AsInteger > 0 then
    begin
      Close;
      Free;
      if qry_capa1.FieldByName('PADRAO_RATEIO_EXP').AsString = 'QUANTIDADE' then
        ShowMessage('Existem itens com a Quantidade de Mercadoria igual a 0' + #13#10 +
                    'Não será possível concluir o rateio.')
      else
        ShowMessage('Existem itens com o Valor MLE igual a 0' + #13#10 +
                    'Não será possível concluir o rateio.');
      exit;
    end;
  end;

// *****************************************************************************
// verifica se alterou o Peso Bruto e/ou Liquido da Capa
// *****************************************************************************

  if qry_capa1.State in [dsEdit] then
  begin
    if MessageDlg('O Peso Líquido da capa foi alterado.' + #13#10 +
                  'Deseja salvar os novos valores na capa e utilizar os mesmo no rateio?', mtInformation, [mbYes,mbNo], 0) = mrYes then
      qry_capa1.Post
    else
      qry_capa1.Cancel;
    qry_capa1.Close;
    qry_capa1.Open;
    qry_itens1.Close;
    qry_itens1.Open;
  end;

  if qry_capa2.State in [dsEdit] then
  begin
    if MessageDlg('O Peso Bruto da capa foi alterado.' + #13#10 +
                  'Deseja salvar os novos valores na capa e utilizar os mesmo no rateio?', mtInformation, [mbYes,mbNo], 0) = mrYes then
      qry_capa2.Post
    else
      qry_capa2.Cancel;
    qry_capa2.Close;
    qry_capa2.Open;
    qry_itens2.Close;
    qry_itens2.Open;
  end;

// *****************************************************************************
// preparando e criando o s componentes para o rateio
// *****************************************************************************

  vQryUpdate := TQuery.Create(application);
  vQryUpdate.DatabaseName := 'DBBROKER';
  vQryLoop := TQuery.Create(application);
  vQryLoop.DatabaseName := 'DBBROKER';

// *****************************************************************************
// RATEIO DO PESO LIQUIDO
// *****************************************************************************

  vQryUpdate.SQL.Clear;
  vQryUpdate.SQL.Add('UPDATE ' + pTabela + '_ITEM SET VL_TOT_PESO_LIQ = CAST(:X1 AS DECIMAL(18,5)), VL_PESO_LIQ_UNIT = :X2, IN_RATEADO = ''1'' WHERE NR_PROCESSO = ''' + qry_capa1.FieldByName('NR_PROCESSO').AsString + ''' AND NR_ITEM = :ITEM');

  vQryLoop.SQL.Clear;
  vQryLoop.SQL.Add('SELECT NR_ITEM, ISNULL(QT_MERCADORIA,0) QT_MERCADORIA, ISNULL(VL_MLE,0) VL_MLE FROM ' + pTabela + '_ITEM WHERE NR_PROCESSO = ''' + qry_capa1.FieldByName('NR_PROCESSO').AsString + '''');
  vQryLoop.SQL.Add('AND ISNULL(VL_TOT_PESO_LIQ,0) = 0');
  vQryLoop.Open;
  vQryLoop.First;
  while not vQryLoop.EOF do
  begin
    if qry_capa1.FieldByName('PADRAO_RATEIO_EXP').AsString = 'QUANTIDADE' then
    begin
      vAuxX1 := ( vQryLoop.FieldByname('QT_MERCADORIA').AsFloat * qry_itens1.FieldByname('LIQ_A_RATEAR').AsFloat ) / qry_capa1.FieldByname('QT_TOTAL').AsFloat;
      vAuxX2 := ( vAuxX1 / vQryLoop.FieldByname('QT_MERCADORIA').AsFloat );
      total_liquido := total_liquido + StrToFloat(FormatFloat('0.00000',vAuxX1));
    end
    else
    begin
      vAuxX1 := ( vQryLoop.FieldByname('VL_MLE').AsFloat * qry_itens1.FieldByname('LIQ_A_RATEAR').AsFloat ) / qry_capa1.FieldByname('VL_TOT_MCV').AsFloat;
      vAuxX2 := ( vAuxX1 / vQryLoop.FieldByname('QT_MERCADORIA').AsFloat );
      total_liquido := total_liquido + StrToFloat(FormatFloat('0.00000',vAuxX1));
    end;
    vQryUpdate.ParamByname('X1').AsFloat    := StrToFloat(FormatFloat('0.00000',vAuxX1));
    vQryUpdate.ParamByname('X2').AsFloat    := vAuxX2;
    vQryUpdate.ParamByname('ITEM').AsString := vQryLoop.FieldByName('NR_ITEM').AsString;
    vQryUpdate.ExecSQL;
    vQryLoop.Next;
  end;

  total_liquido := qry_capa1.FieldByName('VL_PESO_LIQUIDO').AsFloat - total_liquido;
  if total_liquido > 0 then
  begin
    vQryUpdate.ParamByname('X1').AsFloat    := StrToFloat(FormatFloat('0.00000',vAuxX1)) + total_liquido;
    vQryUpdate.ParamByname('X2').AsFloat    := vAuxX2;
    vQryUpdate.ParamByname('ITEM').AsString := vQryLoop.FieldByName('NR_ITEM').AsString;
    vQryUpdate.ExecSQL;
  end;

  vQryLoop.Close;

// *****************************************************************************
// RATEIO DO PESO BRUTO
// *****************************************************************************

  vQryUpdate.SQL.Clear;
  vQryUpdate.SQL.Add('UPDATE ' + pTabela + '_ITEM SET VL_TOT_PESO_BRUTO = :X1, IN_RATEADO = ''1'' WHERE NR_PROCESSO = ''' + qry_capa2.FieldByName('NR_PROCESSO').AsString + ''' AND NR_ITEM = :ITEM');

  vQryLoop.SQL.Clear;
  vQryLoop.SQL.Add('SELECT NR_ITEM, ISNULL(QT_MERCADORIA,0) QT_MERCADORIA, ISNULL(VL_MLE,0) VL_MLE FROM ' + pTabela + '_ITEM WHERE NR_PROCESSO = ''' + qry_capa2.FieldByName('NR_PROCESSO').AsString + '''');
  vQryLoop.SQL.Add('AND ISNULL(VL_TOT_PESO_BRUTO,0) = 0');
  vQryLoop.Open;
  vQryLoop.First;
  while not vQryLoop.EOF do
  begin
    if qry_capa2.FieldByName('PADRAO_RATEIO_EXP').AsString = 'QUANTIDADE' then
    begin
      vAuxX1 := ( vQryLoop.FieldByname('QT_MERCADORIA').AsFloat * qry_itens2.FieldByname('BRU_A_RATEAR').AsFloat ) / qry_capa2.FieldByname('QT_TOTAL').AsFloat;
      total_bruto := total_bruto + StrToFloat(FormatFloat('0.00000',vAuxX1));
    end
    else
    begin
      vAuxX1 := ( vQryLoop.FieldByname('VL_MLE').AsFloat * qry_itens2.FieldByname('BRU_A_RATEAR').AsFloat ) / qry_capa2.FieldByname('VL_TOT_MCV').AsFloat;
      total_bruto := total_bruto + StrToFloat(FormatFloat('0.00000',vAuxX1));
    end;
    vQryUpdate.ParamByname('X1').AsFloat    := StrToFloat(FormatFloat('0.00000',vAuxX1));
    vQryUpdate.ParamByname('ITEM').AsString := vQryLoop.FieldByName('NR_ITEM').AsString;
    vQryUpdate.ExecSQL;
    vQryLoop.Next;
  end;

  total_bruto := qry_capa2.FieldByName('VL_PESO_BRUTO').AsFloat - total_bruto;
  if total_bruto > 0 then
  begin
    vQryUpdate.ParamByname('X1').AsFloat    := StrToFloat(FormatFloat('0.00000',vAuxX1)) + total_bruto;
    vQryUpdate.ParamByname('ITEM').AsString := vQryLoop.FieldByName('NR_ITEM').AsString;
    vQryUpdate.ExecSQL;
  end;

  vQryLoop.Close;

// *****************************************************************************
// concluindo o processo de rateio
// *****************************************************************************

  ShowMessage('Rateio concluído com sucesso.');
  qry_capa1.Close;
  qry_capa1.Open;
  qry_capa2.Close;
  qry_capa2.Open;
  qry_itens1.Close;
  qry_itens1.Open;
  qry_itens2.Close;
  qry_itens2.Open;

  vQryLoop.Free;
  vQryUpdate.Free;

end;

procedure Tfrm_rateio_exp.BitBtn1Click(Sender: TObject);
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE ' + vTabela + '_ITEM');
    SQL.Add('SET VL_TOT_PESO_BRUTO = 0, VL_TOT_PESO_LIQ = 0, IN_RATEADO = ''0''');
    SQL.Add('WHERE NR_PROCESSO = ''' + qry_capa1.FieldByName('NR_PROCESSO').AsString + ''' AND IN_RATEADO = ''1''');
    ExecSQL;
    qry_capa1.Close;
    qry_capa1.Open;
    qry_capa2.Close;
    qry_capa2.Open;
    qry_itens1.Close;
    qry_itens1.Open;
    qry_itens2.Close;
    qry_itens2.Open;
  end;

  ExecutaRateio(vTabela);
end;

procedure Tfrm_rateio_exp.BitBtn2Click(Sender: TObject);
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE ' + vTabela + '_ITEM');
    SQL.Add('SET VL_TOT_PESO_BRUTO = 0, VL_TOT_PESO_LIQ = 0, IN_RATEADO = ''0''');
    SQL.Add('WHERE NR_PROCESSO = ''' + qry_capa1.FieldByName('NR_PROCESSO').AsString + ''' AND IN_RATEADO = ''1''');
    ExecSQL;
    ShowMessage('Estorno concluído com sucesso.');
    qry_capa1.Close;
    qry_capa1.Open;
    qry_capa2.Close;
    qry_capa2.Open;
    qry_itens1.Close;
    qry_itens1.Open;
    qry_itens2.Close;
    qry_itens2.Open;
  end;
end;

procedure Tfrm_rateio_exp.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_rateio_exp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

end.
