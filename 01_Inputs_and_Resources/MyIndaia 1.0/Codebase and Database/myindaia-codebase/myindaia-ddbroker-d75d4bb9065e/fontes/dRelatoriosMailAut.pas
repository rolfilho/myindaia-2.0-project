unit dRelatoriosMailAut;

interface

uses
  SysUtils, Classes, DB, DBTables, DBClient, Provider;

type
  Tdatm_relatorios_mail_aut = class(TDataModule)
    qry_relatorios_mail_aut_: TQuery;
    ds_relatorios_mail_aut: TDataSource;
    qry_relatorios_mail_aut_CD_RELATORIO: TStringField;
    qry_relatorios_mail_aut_NM_RELATORIO: TStringField;
    qry_relatorios_mail_aut_TX_RELATORIO: TStringField;
    qry_relatorios_mail_aut_TX_MODELO: TStringField;
    qry_relatorios_mail_aut_CD_TIPO_RELATORIO: TStringField;
    qry_relatorios_mail_aut_usuarios_: TQuery;
    ds_relatorios_mail_aut_usuarios: TDataSource;
    qry_relatorios_mail_aut_usuarios_CD_RELATORIO: TStringField;
    qry_relatorios_mail_aut_usuarios_CD_USUARIO: TStringField;
    qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO: TStringField;
    qry_relatorios_mail_aut_usuarios_calc_NM_USUARIO: TStringField;
    qry_relatorios_mail_aut_IN_ATIVO: TStringField;
    qry_relatorios_mail_aut_calc_ATIVO: TStringField;
    qry_relatorios_mail_aut_IN_FIMDESEMANA: TStringField;
    qry_relatorios_mail_aut_TX_CONFIGURACAO: TMemoField;
    qry_relatorios_mail_aut_EVENTO: TStringField;
    upd_relatorios_mail_aut_: TUpdateSQL;
    qry_relatorios_mail_aut_TP_IDIOMA: TStringField;
    qry_relatorios_mail_aut_CD_VIA_TRANSPORTE: TStringField;
    qry_relatorios_mail_aut_VARIAVEL_CARTAS_CONFIG: TStringField;
    qry_relatorios_mail_aut_IN_SABADO: TBooleanField;
    qry_relatorios_mail_aut_IN_DOMINGO: TBooleanField;
    qry_relatorios_mail_aut_IN_GRAVAR_DIGITALIZACAO: TBooleanField;
    qry_relatorios_mail_aut_CD_TP_DOCTO_GRAVAR: TStringField;
    qry_relatorios_mail_aut_TX_CORPO_EMAIL: TMemoField;
    procedure ds_relatorios_mail_autStateChange(Sender: TObject);
    procedure qry_relatorios_mail_aut_AfterScroll(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_usuarios_CalcFields(
      DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_usuarios_AfterScroll(
      DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_CalcFields(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_AfterPost(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  function GetSqlRelatorios :string;
  end;

var
  datm_relatorios_mail_aut: Tdatm_relatorios_mail_aut;

implementation

uses uRelatoriosMailAut, ConsOnLineEx;

{$R *.dfm}

procedure Tdatm_relatorios_mail_aut.ds_relatorios_mail_autStateChange(Sender: TObject);
begin
  with frm_relatorios_mail_aut do
  begin
    if (pgctrl_documento.ActivePage = ts_lista) or (pgctrl_documento.ActivePage = ts_dados) then
    begin
//      btn_incluir.Enabled  := (qry_relatorios_mail_aut_.state in [dsBrowse]);
      btn_salvar.Enabled   := (qry_relatorios_mail_aut_.state in [dsInsert, dsEdit]);
      btn_cancelar.Enabled := (qry_relatorios_mail_aut_.state in [dsInsert, dsEdit]);
      mi_novo.Enabled      := (qry_relatorios_mail_aut_.state in [dsBrowse]);
      mi_salvar.Enabled    := (qry_relatorios_mail_aut_.state in [dsInsert, dsEdit]);
      mi_cancelar.Enabled  := (qry_relatorios_mail_aut_.state in [dsInsert, dsEdit]);
    end
    else
    begin
//      btn_incluir.Enabled  := (qry_relatorios_mail_aut_usuarios_.state in [dsBrowse]);
      btn_salvar.Enabled   := (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
      btn_cancelar.Enabled := (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
      mi_novo.Enabled      := (qry_relatorios_mail_aut_usuarios_.state in [dsBrowse]);
      mi_salvar.Enabled    := (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
      mi_cancelar.Enabled  := (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
    end;

    if (pgctrl_documento.ActivePage = ts_lista) OR (pgctrl_documento.ActivePage = ts_usuarios)  then
      btn_incluir.Enabled := true
    else
      btn_incluir.Enabled := false;  
  end;
end;

procedure Tdatm_relatorios_mail_aut.qry_relatorios_mail_aut_AfterScroll(DataSet: TDataSet);
begin
  frm_relatorios_mail_aut.AtualizaNB;
  frm_relatorios_mail_aut.file_path.Text := qry_relatorios_mail_aut_TX_MODELO.AsString;
  frm_relatorios_mail_aut.edt_horarios.Clear;
end;

procedure Tdatm_relatorios_mail_aut.qry_relatorios_mail_aut_usuarios_CalcFields(DataSet: TDataSet);
begin
  qry_relatorios_mail_aut_usuarios_calc_NM_USUARIO.AsString := ConsultaLookUp('TUSUARIO','CD_USUARIO',qry_relatorios_mail_aut_usuarios_CD_USUARIO.AsString,'NM_USUARIO');
end;

procedure Tdatm_relatorios_mail_aut.qry_relatorios_mail_aut_usuarios_AfterScroll(DataSet: TDataSet);
begin
  frm_relatorios_mail_aut.edt_horarios.Text := qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO.AsString;
  frm_relatorios_mail_aut.nb_config.ActivePage := qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString;
end;

procedure Tdatm_relatorios_mail_aut.qry_relatorios_mail_aut_CalcFields(
  DataSet: TDataSet);
begin
  if qry_relatorios_mail_aut_.FieldByName('IN_ATIVO').AsString = '1' then
    qry_relatorios_mail_aut_.FieldByName('calc_ATIVO').AsString := 'ü';
end;

procedure Tdatm_relatorios_mail_aut.qry_relatorios_mail_aut_AfterPost(
  DataSet: TDataSet);
begin
  qry_relatorios_mail_aut_.ApplyUpdates;
end;

procedure Tdatm_relatorios_mail_aut.qry_relatorios_mail_aut_AfterDelete(
  DataSet: TDataSet);
begin
  qry_relatorios_mail_aut_.ApplyUpdates;
end;

function Tdatm_relatorios_mail_aut.GetSqlRelatorios :string;
begin
  result := ' SELECT  CD_RELATORIO, NM_RELATORIO, TX_RELATORIO, TX_MODELO,                 ' + sLineBreak +
            '         CD_TIPO_RELATORIO, TX_CONFIGURACAO, IN_ATIVO, IN_FIMDESEMANA,        ' + sLineBreak +
            '         SUBSTRING(TX_CONFIGURACAO,7,3) EVENTO, TP_IDIOMA, CD_VIA_TRANSPORTE, ' + sLineBreak +
            '         VARIAVEL_CARTAS_CONFIG, IN_SABADO, IN_DOMINGO ,                      ' + sLineBreak +
            '         IN_GRAVAR_DIGITALIZACAO, CD_TP_DOCTO_GRAVAR, TX_CORPO_EMAIL          ' + sLineBreak +
            ' FROM TRELATORIOS_MAIL_AUT (NOLOCK)                                           ' + sLineBreak +
            ' WHERE CD_TIPO_RELATORIO <> ''E01''                                           ' + sLineBreak +
            ' AND ( ( :ATIVO = '''' ) OR  ( IN_ATIVO = :ATIVO ))                           ' + sLineBreak +
            '                                                                              ' + sLineBreak + //manter as linhas em branco
            '                                                                              ' + sLineBreak ;
end;

end.
