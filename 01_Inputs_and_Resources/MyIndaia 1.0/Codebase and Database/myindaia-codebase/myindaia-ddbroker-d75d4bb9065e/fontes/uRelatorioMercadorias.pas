unit uRelatorioMercadorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls, FMTBcd, DBXpress,
  DB, SqlExpr, DBClient, Provider, DBCtrls;

type
  TfrmRelatorioMercadorias = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbGrupo: TDBLookupComboBox;
    edtGrupo: TEdit;
    Label1: TLabel;
    qryGrupo: TSQLQuery;
    strngfldqry1CD_GRUPO: TStringField;
    strngfldqry1NM_GRUPO: TStringField;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    strngfldGrupoCD_GRUPO: TStringField;
    strngfldGrupoNM_GRUPO: TStringField;
    dsGrupo: TDataSource;
    SQLConnection: TSQLConnection;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoExit(Sender: TObject);
    procedure cbGrupoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   function GetSelect(Tipo :String): string;
   procedure PreencherCodigoGrupo;
   procedure BuscarCodigoGrupo;
   function GetSqlGrupo: String;
  public
    TipoRelatorio : String;
  end;

var
  frmRelatorioMercadorias: TfrmRelatorioMercadorias;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TfrmRelatorioMercadorias.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Mercadorias';

    Form.Titulocoluna.Add('CD_GRUPO=Cod. Grupo');
    Form.Titulocoluna.Add('NM_GRUPO=Nome Grupo');
    Form.Titulocoluna.Add('CD_NCM_SH=NCM');
    Form.Titulocoluna.Add('CD_MERCADORIA=Cod. Mercadoria');
    Form.Titulocoluna.Add('DS_PORTUGUES=Desc. Mercadoria');
    Form.Titulocoluna.Add('DS_INGLES=Desc. Merc. Ingles');
    Form.Titulocoluna.Add('DS_ESPANHOL=Desc. Merc. Espanhol');
    Form.Titulocoluna.Add('AP_MERCADORIA=Apelido');
    Form.Titulocoluna.Add('IN_NECESSITA_LI=Necessita LI');
    Form.Titulocoluna.Add('IN_NECESSITA_LI_SISCOMEX=Necessita LI - siscomex');
    Form.Titulocoluna.Add('DT_CRIACAO=Necessita LI - Dt. Criação');
    Form.Titulocoluna.Add('DT_ULT_ALTERACAO=Necessita LI - Dt. Alteração');

    Form.qryMain.SQL.Text := GetSelect(TipoRelatorio);

    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TfrmRelatorioMercadorias.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TfrmRelatorioMercadorias.GetSelect(Tipo :String): string;
var
  Sql : String;
begin
  if Tipo = 'E' then
  begin
    Sql := ' SELECT B.CD_GRUPO,                                                                                                                '+sLineBreak +
           '        B.NM_GRUPO,                                                                                                                '+sLineBreak +
           '        A.CD_NCM_SH,                                                                                                               '+sLineBreak +
           '        A.CD_MERCADORIA,                                                                                                           '+sLineBreak +
           '        RTRIM(LTRIM(REPLACE(REPLACE(CONVERT(VARCHAR(1048),                                                                         '+sLineBreak +
           '        ISNULL(A.NM_MERCADORIA, '''')),CHAR(10), ''''), CHAR(13), ''''))) DS_PORTUGUES,                                            '+sLineBreak +
           '        RTRIM(LTRIM(REPLACE(REPLACE(CONVERT(VARCHAR(1048),                                                                         '+sLineBreak +
           '        ISNULL(A.TX_DESC_INGLES, '''')),CHAR(10), ''''), CHAR(13), ''''))) DS_INGLES,                                              '+sLineBreak +
           '        RTRIM(LTRIM(REPLACE(REPLACE(CONVERT(VARCHAR(1048),                                                                         '+sLineBreak +
           '        ISNULL(A.TX_DESC_ESP, '''')),CHAR(10), ''''), CHAR(13), ''''))) DS_ESPANHOL,                                               '+sLineBreak +
           '        AP_MERCADORIA ,                                                                                                            '+sLineBreak +
           '        null as IN_NECESSITA_LI  ,                                                                                                 '+sLineBreak +
           '        null as IN_NECESSITA_LI_SISCOMEX                                                                                           '+sLineBreak +
           '   FROM TMERCADORIA_EXP A (NOLOCK)                                                                                                 '+sLineBreak +
           '   JOIN TGRUPO          B (NOLOCK)  ON B.CD_GRUPO = A.CD_GRUPO                                                                     '+sLineBreak +
           '  WHERE 1=1                                                                                                                        '+sLineBreak ;
           if cbGrupo.keyvalue <> null then
            if cbGrupo.keyvalue <> '' then
            Sql := Sql + ' AND B.CD_GRUPO = ' + Quotedstr(cbGrupo.keyvalue) +sLineBreak ;

           Sql := Sql +' ORDER BY B.NM_GRUPO, A.AP_MERCADORIA '   +sLineBreak ;
  end
  else
  begin
    Sql := ' SELECT B.CD_GRUPO,                                                                                                            '+sLineBreak +
           '        B.NM_GRUPO,                                                                                                            '+sLineBreak +
           '        A.CD_NCM_SH,                                                                                                           '+sLineBreak +
           '        A.CD_MERCADORIA,                                                                                                       '+sLineBreak +
           '        RTRIM(LTRIM(REPLACE(REPLACE(CONVERT(VARCHAR(1048),                                                                     '+sLineBreak +
           '        ISNULL(A.NM_MERCADORIA, '''')),CHAR(10), ''''), CHAR(13), ''''))) DS_PORTUGUES,                                        '+sLineBreak +
           '        AP_MERCADORIA ,                                                                                                        '+sLineBreak +
           '        CASE WHEN ISNULL(IN_NECESSITA_LI, 0) = 0 THEN ''N'' ELSE ''S'' END as IN_NECESSITA_LI  ,                               '+sLineBreak +
           '        CASE WHEN ISNULL(IN_NECESSITA_LI_SISCOMEX, 0) = 0 THEN ''N'' ELSE ''S'' END as IN_NECESSITA_LI_SISCOMEX,               '+sLineBreak +
           '        A.DT_CRIACAO,                                                                                                          '+sLineBreak +
           '        A.DT_ULT_ALTERACAO,                                                                                                    '+sLineBreak +
           '        RTRIM(LTRIM(REPLACE(REPLACE(CONVERT(VARCHAR(1048),                                                                     '+sLineBreak +
           '        ISNULL(A.TX_DESC_INGLES, '''')),CHAR(10), ''''), CHAR(13), ''''))) DS_INGLES                                           '+sLineBreak +
           '   FROM TMERCADORIA     A (NOLOCK)                                                                                             '+sLineBreak +
           '   JOIN TGRUPO          B (NOLOCK)  ON B.CD_GRUPO = A.CD_GRUPO                                                                 '+sLineBreak +
           '  WHERE 1=1                                                                                                                    '+sLineBreak ;
           if cbGrupo.keyvalue <> null then
            if cbGrupo.keyvalue <> '' then
            Sql := Sql + ' AND B.CD_GRUPO = ' + Quotedstr(cbGrupo.keyvalue) +sLineBreak ;
            
           Sql := Sql +' ORDER BY B.NM_GRUPO, A.AP_MERCADORIA '   +sLineBreak ;
  end;

  Result := Sql;
end;

procedure TfrmRelatorioMercadorias.edtGrupoExit(Sender: TObject);
begin
  BuscarCodigoGrupo;
end;

procedure TfrmRelatorioMercadorias.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoGrupo;
  end;
end;

procedure TfrmRelatorioMercadorias.cbGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbGrupo.KeyValue := '';

    edtGrupo.text := cbGrupo.KeyValue;
end;

procedure TfrmRelatorioMercadorias.cbGrupoExit(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmRelatorioMercadorias.cbGrupoCloseUp(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmRelatorioMercadorias.BuscarCodigoGrupo;
begin
  if cdsGrupo.Locate('CD_GRUPO', edtGrupo.Text, [loCaseInsensitive]) then
    cbGrupo.KeyValue := cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    cbGrupo.KeyValue := '';
end;

procedure TfrmRelatorioMercadorias.PreencherCodigoGrupo;
begin
  if cbGrupo.KeyValue = null then
  begin
    edtGrupo.Text := '';
    exit;
  end;
  if cbGrupo.KeyValue = '' then
  begin
    edtGrupo.Text := '';
    exit;
  end;

  edtGrupo.Text := cdsGrupo.fieldbyName('CD_GRUPO').AsString
end;



procedure TfrmRelatorioMercadorias.FormCreate(Sender: TObject);
begin
  qryGrupo.sql.Text := GetSqlGrupo;
  qryGrupo.close;
  cdsGrupo.close;
  qryGrupo.Open;
  cdsGrupo.Open;
  cbGrupo.KeyValue := '';
end;

function TfrmRelatorioMercadorias.GetSqlGrupo: String;
begin
   Result :=  ' SELECT CD_GRUPO, NM_GRUPO      ' + sLineBreak +
              '   FROM TGRUPO                  ' + sLineBreak +
              '  WHERE ISNULL(IN_ATIVO,1) = 1  ' + sLineBreak +
              '  ORDER BY NM_GRUPO             ' + sLineBreak ;
end;

end.

