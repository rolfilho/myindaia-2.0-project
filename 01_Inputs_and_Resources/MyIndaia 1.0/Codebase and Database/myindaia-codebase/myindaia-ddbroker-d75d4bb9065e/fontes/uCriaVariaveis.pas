unit uCriaVariaveis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, StrUtils,
  Spin, DBCtrls;


type
  TfrmCriaVariaveis = class(TForm)
    pnlTop: TPanel;
    btn_sair: TSpeedButton;
    dbgrdVariaveis: TDBGrid;
    lbl1: TLabel;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    qryCartasConfig: TQuery;
    dsCartasConfig: TDataSource;
    qryCartasConfigCD_CARTAS_CONFIG: TIntegerField;
    qryCartasConfigTX_CARTAS_CONFIG: TStringField;
    qryCartasConfigNM_CAMPO: TStringField;
    qryCartasConfigNM_TABELA: TStringField;
    qryCartasConfigNM_JOIN: TStringField;
    qryCartasConfigIN_TABELA: TStringField;
    qryCartasConfigcalcTabela: TStringField;
    qryCartasConfigIN_VARIOS_REGISTROS: TStringField;
    qryCartasConfigTP_PRODUTO: TStringField;
    qryCartasConfigNM_SQL_MANUAL: TMemoField;
    qryCartasConfigcalcSQL: TStringField;
    qryCartasConfigCD_DIRECAO: TStringField;
    qryCartasConfigcalcDirecao: TStringField;
    qryCartasConfigTX_MASCARA: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    shp2: TShape;
    shp8: TShape;
    shp6: TShape;
    shp5: TShape;
    shp7: TShape;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    shp4: TShape;
    lbl8: TLabel;
    lbl6: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    edtJoin2: TEdit;
    edtDescricao: TEdit;
    edtCampo: TEdit;
    edtTabela: TEdit;
    edtJoin1: TEdit;
    memSQLManual: TMemo;
    btnEscolheTabela: TSpinButton;
    chkVarios: TCheckBox;
    rgProduto: TRadioGroup;
    cboDirecao: TComboBox;
    edt_Mascara: TEdit;
    procedure edtDescricaoChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btnEscolheTabelaDownClick(Sender: TObject);
    procedure qryCartasConfigCalcFields(DataSet: TDataSet);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCriaVariaveis: TfrmCriaVariaveis;


implementation

{$R *.dfm}

uses PGGP017, ConsOnLineEx;

procedure TfrmCriaVariaveis.edtDescricaoChange(Sender: TObject);
begin
  btn_Salvar.Enabled   := True;
  btn_Cancelar.Enabled := True;
end;

procedure TfrmCriaVariaveis.btn_salvarClick(Sender: TObject);

  function ValidaVariavel: Boolean;
  begin
    Result := True;

    if vTipoTabela = TTProcesso then
    begin
      if memSQLManual.Text <> '' then
      begin
        if Pos(':NR_PROCESSO',memSQLManual.Text) = 0 then
        begin
          Result := False;
          Exit;
        end;
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add(memSQLManual.Text);
          ParamByName('NR_PROCESSO').AsString := 'blablabla';
          try
            try
              Open;
            except
              Result := False;
              Exit;
            end;
          finally
            Close;
            Free;
          end;
        end;
      end
      else
      if qryCartasConfig.FieldByName('NM_TABELA').AsString <> '' then
      begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT '+qryCartasConfig.FieldByName('NM_CAMPO').AsString+' FROM '+qryCartasConfig.FieldByName('NM_TABELA').AsString+' (NOLOCK) ');
          SQL.Add(' WHERE '+Trim(Copy(qryCartasConfig.FieldByName('NM_JOIN').AsString,Pos('>',qryCartasConfig.FieldByName('NM_JOIN').AsString)+1,Length(qryCartasConfig.FieldByName('NM_JOIN').AsString)))+' = ( SELECT '+Trim(Copy(qryCartasConfig.FieldByName('NM_JOIN').AsString,1,Pos('>',qryCartasConfig.FieldByName('NM_JOIN').AsString)-1))+' FROM TPROCESSO WHERE NR_PROCESSO = "blablabla" )');
          try
            try
              Open;
            except
              Result := False;
              Exit;
            end;
          finally
            Close;
            Free;
          end;      end;
      end
      else
      begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT '+qryCartasConfig.FieldByName('NM_CAMPO').AsString+' FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "blablabla" ');
          try
            try
              Open;
            except
              Result := False;
              Exit;
            end;
          finally
            Close;
            Free;
          end;
        end;
      end;
    end
    else
    if vTipoTabela = TTProposta then
    begin
      if memSQLManual.Text <> '' then
      begin
        if Pos(':NR_PROPOSTA',memSQLManual.Text) = 0 then
        begin
          ShowMessage('A configuração desse campo não está correta. Informe ao departamento de Tecnologia.');
          Exit;
        end;
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add(memSQLManual.Text);
          ParamByName('NR_PROPOSTA').AsString := 'blablabla';
          try
            try
              Open;
            except
              Result := False;
              Exit;
            end;
          finally
            Close;
            Free;
          end;
        end;
      end
      else
      if qryCartasConfig.FieldByName('NM_TABELA').AsString <> '' then
      begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT '+qryCartasConfig.FieldByName('NM_CAMPO').AsString+' FROM '+qryCartasConfig.FieldByName('NM_TABELA').AsString+' (NOLOCK) ');
          SQL.Add(' WHERE '+Trim(Copy(qryCartasConfig.FieldByName('NM_JOIN').AsString,Pos('>',qryCartasConfig.FieldByName('NM_JOIN').AsString)+1,Length(qryCartasConfig.FieldByName('NM_JOIN').AsString)))+' = ( SELECT '+Trim(Copy(qryCartasConfig.FieldByName('NM_JOIN').AsString,1,Pos('>',qryCartasConfig.FieldByName('NM_JOIN').AsString)-1))+' FROM TPROPOSTA WHERE NR_PROPOSTA = "blablabla" )');

          try
            try
              Open;
            except
              Result := False;
              Exit;
            end;
          finally
            Close;
            Free;
          end;
        end;
      end
      else
      begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT '+qryCartasConfig.FieldByName('NM_CAMPO').AsString+' FROM TPROPOSTA (NOLOCK) WHERE NR_PROPOSTA = "blablabla" ');
          try
            try
              Open;
            except
              Result := False;
              Exit;
            end;
          finally
            Close;
            Free;
          end;
        end;
      end;
    end;
  end;


begin
  if qryCartasConfig.State in [dsBrowse, dsInactive] then
    qryCartasConfig.Insert;

  if qryCartasConfig.State in [dsInsert] then
    qryCartasConfig.FieldByName('CD_CARTAS_CONFIG').AsString := ConsultaLookupSQL('SELECT ISNULL(MAX(CD_CARTAS_CONFIG)+1,1) BLABLA FROM TCARTAS_CONFIG (NOLOCK)','BLABLA');

  qryCartasConfig.FieldByName('TX_CARTAS_CONFIG').AsString := '\'+StringReplace(StringReplace(StringReplace(edtDescricao.Text,'\','',[rfReplaceAll]),'/','',[rfReplaceAll]),' ','',[rfReplaceAll])+'/';
  qryCartasConfig.FieldByName('NM_CAMPO').AsString         := edtCampo.text;
  qryCartasConfig.FieldByName('TX_MASCARA').AsString       := edt_Mascara.text;
  qryCartasConfig.FieldByName('NM_TABELA').AsString        := edtTabela.Text;

  if vTipoTabela = TTProcesso then
    qryCartasConfig.FieldByName('IN_TABELA').AsString := '0'
  else
  if vTipoTabela = TTProposta then
    qryCartasConfig.FieldByName('IN_TABELA').AsString := '1';

  if (edtJoin1.Text <> '') and (edtJoin2.Text <> '') then
    qryCartasConfig.FieldByName('NM_JOIN').AsString         := edtJoin1.Text + '>' + edtJoin2.Text;
  if (memSQLManual.Lines.Strings[0] <> '') then
      qryCartasConfig.FieldByName('NM_SQL_MANUAL').Value    := memSQLManual.Text;

  //Valida JOIN construído
  if not ValidaVariavel then
  begin
    ShowMessage('Existe um problema na criação desta variável!' + #13#10 +
                'Verifique se a construção da variável está correta!');
    Exit;
  end;

  if (not chkVarios.Checked) then
    qryCartasConfig.FieldByName('IN_VARIOS_REGISTROS').AsString := '0';
  if (chkVarios.Checked) then
    qryCartasConfig.FieldByName('IN_VARIOS_REGISTROS').AsString := '1';

  if rgProduto.ItemIndex = -1 then rgProduto.ItemIndex := 2; // se não for clicado passa ambos!
  if rgProduto.ItemIndex = 0 then qryCartasConfig.FieldByName('TP_PRODUTO').AsString := '01';
  if rgProduto.ItemIndex = 1 then qryCartasConfig.FieldByName('TP_PRODUTO').AsString := '02';
  if rgProduto.ItemIndex = 2 then qryCartasConfig.FieldByName('TP_PRODUTO').AsString := 'AM';

  // Adiciona Direção dos registros - Michel - 11/12/2008
  qryCartasConfig.FieldByName('CD_DIRECAO').AsString := cboDirecao.Text; // como o campo é CHAR(1), pegará apenas a primeira letra

  qryCartasConfig.Post;
  qryCartasConfig.Close;
  qryCartasConfig.Prepare;
  qryCartasConfig.Open;
  edtDescricao.Clear;
  edtCampo.Clear;
  edtTabela.Clear;
  edtJoin1.Clear;
  edtJoin2.Clear;
  memSQLManual.Clear;
  btn_salvar.Enabled := False;
  btn_cancelar.Enabled := False;
  chkVarios.Checked := false;
  rgProduto.ItemIndex := -1;
end;


procedure TfrmCriaVariaveis.btn_cancelarClick(Sender: TObject);
begin
  edtDescricao.Clear;
  edtCampo.Clear;
  edtTabela.Clear;
  edtJoin1.Clear;
  edtJoin2.Clear;
  memSQLManual.Clear;
  btn_salvar.Enabled := False;
  btn_cancelar.Enabled := False;
end;

procedure TfrmCriaVariaveis.FormShow(Sender: TObject);
begin
  qryCartasConfig.Close;
  qryCartasConfig.Prepare;
  qryCartasConfig.Open;
  if vTipoTabela = TTProcesso then
    lbl5.Caption := 'campo na TPROCESSO'
  else   if vTipoTabela = TTProposta then
    lbl5.Caption := 'campo na TPROPOSTA';
end;

procedure TfrmCriaVariaveis.btn_excluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir a variavel selecionada ?',
                            'Exclusão de Variável', MB_YESNO + MB_ICONQUESTION) = mrYes then
    qryCartasConfig.Delete;
end;

procedure TfrmCriaVariaveis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCriaVariaveis.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCriaVariaveis.btnEscolheTabelaDownClick(Sender: TObject);
begin
  if vTipoTabela = TTProcesso then begin
    vTipoTabela := TTProposta;
    lbl5.Caption := 'campo na TPROPOSTA';
  end else if vTipoTabela = TTProposta then begin
    vTipoTabela := TTProcesso;
    lbl5.Caption := 'campo na TPROCESSO';
  end;
end;

procedure TfrmCriaVariaveis.qryCartasConfigCalcFields(DataSet: TDataSet);
begin
  if vTipoTabela = ttProcesso then
    qryCartasConfigcalcTabela.AsString := 'TPROCESSO'
  else
  if vTipoTabela = ttProposta then
    qryCartasConfigcalcTabela.AsString := 'TPROPOSTA';

  qryCartasConfigcalcSQL.AsString := ConsultaLookUP('TCARTAS_CONFIG', 'CD_CARTAS_CONFIG', qryCartasConfigCD_CARTAS_CONFIG.AsString, 'NM_SQL_MANUAL');

  if Length(qryCartasConfigcalcSQL.AsString) > 250 then
    qryCartasConfigcalcSQL.AsString := Copy(qryCartasConfigcalcSQL.AsString, 1, 250) + ' ...';

  if qryCartasConfigCD_DIRECAO.AsString = 'H' then
    qryCartasConfigcalcDirecao.AsString := 'Horizontal'
  else
    qryCartasConfigcalcDirecao.AsString := 'Vertical';
end;

procedure TfrmCriaVariaveis.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
const
  vLetra: array[1..26] of string[1] = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
                                       'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                                       'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' );

var
  x: integer;

begin
  Key := UpCase(key);
  x := 1;
  repeat
    if Key = vLetra[x] then begin
      Key := Char(x + 64);
      Exit;
    end;
    x := x + 1;
  until x = 27;

  if Key <> Char(8) then
    Key := char(nil);     
end;

procedure TfrmCriaVariaveis.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

end.
