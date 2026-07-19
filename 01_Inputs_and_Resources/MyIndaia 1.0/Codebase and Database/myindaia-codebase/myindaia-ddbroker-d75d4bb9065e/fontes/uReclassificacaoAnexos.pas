unit uReclassificacaoAnexos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Buttons;

type
  Tfrm_reclassificacao_anexos = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    sp_re_classifica_anexos: TStoredProc;
    Panel4: TPanel;
    rbAgruparSim: TRadioButton;
    rbAgruparNao: TRadioButton;
    cbNaoQuebraLinhas: TCheckBox;
    cbTipoRecof: TCheckBox;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Shape2: TShape;
    cbQuebraValor: TCheckBox;
    cbQuebraFabricante: TCheckBox;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Label4: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    edt_separador: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cbDescricaoMercadoria: TCheckBox;
    Shape16: TShape;
    Shape17: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure rbAgruparSimClick(Sender: TObject);
    procedure rbAgruparNaoClick(Sender: TObject);
    procedure cbNaoQuebraLinhasClick(Sender: TObject);
    procedure cbTipoRecofClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_reclassificacao_anexos: Tfrm_reclassificacao_anexos;

implementation

uses dReCapa, FuncoesExport, PGGP017;

{$R *.DFM}

procedure Tfrm_reclassificacao_anexos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_reclassificacao_anexos.FormShow(Sender: TObject);
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT IN_AGRUPAR, IN_QUEBRA_POR_VALOR, IN_QUEBRA_POR_FABRICANTE,');
    SQL.Add('       IN_DESC_TIPO_RECOF, IN_NAO_QUEBRAR_LINHAS, TP_NAO_QUEBRAR_LINHAS_SEPARADOR');
    SQL.Add('  FROM TRE_CAPA');
    SQL.Add(' WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
    SQL.Add('   AND NR_PROCESSO_COMPLEMENTO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString + '''');
    Open;
    //configurando opções
    rbAgruparSim.Checked       := (Fields[0].AsString = '1');
    rbAgruparNao.Checked       :=  not rbAgruparSim.Checked;
    cbQuebraValor.Checked      := (Fields[1].AsString = '1');
    cbQuebraFabricante.Checked := (Fields[2].AsString = '1');
    cbTipoRecof.Checked        := (Fields[3].AsString = '1');
    cbNaoQuebraLinhas.Checked  := (Fields[4].AsString = '1');
    edt_separador.Text         :=  Fields[5].AsString;
    //final das configurações
    Free;
  end;
end;

procedure Tfrm_reclassificacao_anexos.SpeedButton1Click(Sender: TObject);
begin
  // salvando as configurações para a procedure fazer o correto
  // Update alterado por Michel em 27/01/2009, dimuindo quantidade de linhas e incluindo o campo IN_DESCRICAO_MERCADORIA
  try
    datm_main.db_broker.StartTransaction;
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TRE_CAPA SET');
      SQL.Add('   IN_AGRUPAR                      = ''' + IntToStr(ABS(Integer(rbAgruparSim.checked)))          + ''',');
      SQL.Add('   IN_QUEBRA_POR_VALOR             = ''' + IntToStr(ABS(Integer(cbQuebraValor.checked)))         + ''',');
      SQL.Add('   IN_QUEBRA_POR_FABRICANTE        = ''' + IntToStr(ABS(Integer(cbQuebraFabricante.checked)))    + ''',');
      SQL.Add('   IN_DESC_TIPO_RECOF              = ''' + IntToStr(ABS(Integer(cbTipoRecof.checked)))           + ''',');
      SQL.Add('   IN_DESCRICAO_MERCADORIA         = ''' + IntToStr(ABS(Integer(cbDescricaoMercadoria.checked))) + ''',');
      SQL.Add('   IN_NAO_QUEBRAR_LINHAS           = ''' + IntToStr(ABS(Integer(cbNaoQuebraLinhas.checked)))     + ''',');
      SQL.Add('   TP_NAO_QUEBRAR_LINHAS_SEPARADOR = ''' + Trim(edt_separador.text)                              + '''');
      SQL.Add('WHERE NR_PROCESSO             = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
      SQL.Add('  AND NR_PROCESSO_COMPLEMENTO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString + '''');
      ExecSQL;
      Free;
    end;
    Panel2.Caption := '         Classificando anexos...';
    Label1.Visible := True;
    bevel1.Visible := True;
    Panel4.Visible := False;
    Height := 110;
    Position := poScreenCenter;
    Application.ProcessMessages;
    // executando a procedure que classifica os itens
    sp_re_classifica_anexos.Close;
    sp_re_classifica_anexos.ParamByName('@NR_PROCESSO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
    sp_re_classifica_anexos.ParamByName('@NR_PROCESSO_COMPLEMENTO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
    sp_re_classifica_anexos.ExecProc;
    // Excessão criada para verificar se foi possível reorganizar os itens para efetuar COMMIT ou ROLLBACK - Michel - 29/01/2009
    // Sucesso = 0; Falha = 1
    if sp_re_classifica_anexos.ParamByName('Result').AsString = '1' then
    begin
      MessageDlg('A descrição de alguma mercadoria deste anexo ultrapassa o limite de linhas.'#13'A operação foi cancelada.', mtWarning, [mbOk], 0);
      datm_main.db_broker.Rollback;
    end
    else
      datm_main.db_broker.Commit;
  except
    MessageDlg('Houve um erro ao classificar os ítens.'#13'Informe ao TI.', mtWarning, [mbOk], 0);
    if datm_main.db_broker.InTransaction then
      datm_main.db_broker.Rollback;
  end;
  Close;
end;

procedure Tfrm_reclassificacao_anexos.rbAgruparSimClick(Sender: TObject);
begin
  cbQuebraValor.Enabled      := True;
  cbQuebraFabricante.Enabled := True;
end;

procedure Tfrm_reclassificacao_anexos.rbAgruparNaoClick(Sender: TObject);
begin
  cbQuebraValor.Enabled      := False;
  cbQuebraFabricante.Enabled := False;
end;

procedure Tfrm_reclassificacao_anexos.cbNaoQuebraLinhasClick(
  Sender: TObject);
begin
  if cbNaoQuebraLinhas.Checked then
    edt_separador.Enabled := True
  else
    edt_separador.Enabled := False;
end;

procedure Tfrm_reclassificacao_anexos.cbTipoRecofClick(Sender: TObject);
begin
  if cbTipoRecof.checked then
    cbNaoQuebraLinhas.Enabled := False
  else begin
    cbNaoQuebraLinhas.Enabled := True;
    edt_separador.Enabled := False;
  end;
end;

procedure Tfrm_reclassificacao_anexos.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.
