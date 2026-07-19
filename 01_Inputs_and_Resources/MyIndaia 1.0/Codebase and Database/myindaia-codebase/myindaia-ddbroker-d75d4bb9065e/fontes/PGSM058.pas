unit PGSM058;

interface                       

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StrUtils;

type
  Tdatm_usuario = class(TDataModule)
    ds_usuario: TDataSource;
    tbl_yesno_: TTable;
    ds_usuario_habilitacao: TDataSource;
    ds_yesno: TDataSource;
    qry_usuario_habilitacao_: TQuery;
    qry_ult_usuario_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_DT_HABILITACAO: TDateTimeField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_ult_usuario_ULTIMO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_CD_VIATRANSP: TStringField;
    qry_cargo_: TQuery;
    ds_cargo: TDataSource;
    qry_usuario_habilitacao_look_ativo: TStringField;
    qry_cargo_CD_CARGO: TStringField;
    qry_cargo_NM_CARGO: TStringField;
    qry_cargo_CD_NIVEL: TIntegerField;
    qry_cargo_CD_CARGO_PAI: TStringField;
    qry_cargo_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_look_unidade: TStringField;
    qry_usuario_habilitacao_look_produto: TStringField;
    qry_usuario_habilitacao_IN_DEFAULT: TStringField;
    qry_usuario_habilitacao_look_default: TStringField;
    qry_pesquisa_default_: TQuery;
    qry_pesquisa_default_QTD_DEFAULT: TIntegerField;
    qry_produto_IN_ATIVO: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_DT_HABILITACAO: TDateTimeField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_usuario_lista_: TQuery;
    ds_usuario_lista: TDataSource;
    qry_usuario_lista_CD_USUARIO: TStringField;
    qry_usuario_lista_CD_SENHA: TStringField;
    qry_usuario_lista_CD_CARGO: TStringField;
    qry_usuario_lista_NM_USUARIO: TStringField;
    qry_usuario_lista_AP_USUARIO: TStringField;
    qry_usuario_lista_IN_ATIVO: TStringField;
    qry_usuario_lista_LK_NM_CARGO: TStringField;
    qry_usuario_lista_LK_ATIVO: TStringField;
    sp_atz_habilitacao_padrao: TStoredProc;
    qry_apelido_: TQuery;
    qry_apelido_TOT: TIntegerField;
    sp_inclui_login: TStoredProc;
    db_broker2: TDatabase;
    sp_exclui_login: TStoredProc;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_SENHA: TStringField;
    qry_usuario_CD_CARGO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    qry_usuario_LK_NM_CARGO: TStringField;
    qry_lista_: TQuery;
    ds_lista: TDataSource;
    qry_lista_CD_USUARIO: TStringField;
    qry_lista_CD_SENHA: TStringField;
    qry_lista_NM_USUARIO: TStringField;
    qry_lista_AP_USUARIO: TStringField;
    qry_lista_IN_ATIVO: TStringField;
    qry_lista_NM_CARGO: TStringField;
    qry_lista_LK_ATIVO: TStringField;
    guarda: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    qry_usuario_IN_AVISO_PO: TStringField;
    qry_usuario_CD_CELULA: TStringField;
    qry_usuario_LookCelula: TStringField;
    qry_celula_: TQuery;
    qry_usuario_permissao_: TQuery;
    ds_usuario_permissao: TDataSource;
    qry_empresa_: TQuery;
    ds_empresa: TDataSource;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    qry_usuario_permissao_CD_CLIENTE: TStringField;
    qry_usuario_permissao_IN_ATIVO: TStringField;
    qry_usuario_permissao_LookNmCliente: TStringField;
    qry_usuario_permissao_LookAtivo: TStringField;
    qry_usuario_permissao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_IN_ACESSO_SITE: TStringField;
    qry_usuario_habilitacao_look_acesso_site: TStringField;
    qry_permissao_area_: TQuery;
    ds_permissao_area: TDataSource;
    qry_permissao_area_CD_USUARIO: TStringField;
    qry_permissao_area_IN_ATIVO: TStringField;
    qry_permissao_area_LookAtivo: TStringField;
    qry_permissao_area_LookNmArea: TStringField;
    qry_permissao_area_CD_AREA: TStringField;
    qry_usuario_CD_TRANSP_ROD: TStringField;
    qry_usuario_IN_SELECIONADO: TStringField;
    qry_usuario_lista_IN_SELECIONADO: TStringField;
    qry_lista_IN_SELECIONADO: TStringField;
    qry_lista_calcSelecionado: TStringField;
    qry_lista_calcativo: TStringField;
    qry_usuario_CD_INSTALACAO: TStringField;
    qry_usuario_CD_IDIOMA: TIntegerField;
    qry_usuario_DT_ULT_ALT_SENHA: TDateTimeField;
    qry_usuario_IN_ALT_STATUS_RECEB: TStringField;
    qry_usuario_CD_EMPRESA: TStringField;
    SqlPermissao_EmpresaEst: TQuery;
    DtsPermissao_EmpresaEst: TDataSource;
    SqlPermissao_EmpresaEstCD_USUARIO: TStringField;
    SqlPermissao_EmpresaEstCD_EMPRESA: TStringField;
    SqlPermissao_EmpresaEstIN_ATIVO: TStringField;
    SqlPermissao_EmpresaEstLookNmEmpresa: TStringField;
    SqlPermissao_EmpresaEstLookAtivo: TStringField;
    ds_lingua: TDataSource;
    qry_lingua_: TQuery;
    qry_lingua_CODIGO: TStringField;
    qry_lingua_DESCRICAO: TStringField;
    qry_usuario_CD_CHEFIA: TStringField;
    qry_usuario_IN_MODO_PREVIEW: TStringField;
    qry_usuario_IN_FECHAR_MOV_FINANC: TStringField;
    qry_usuario_IN_PERMITE_FATURAMENTO: TStringField;
    qry_usuario_IN_PERMITE_ALTERA_REG_DDE: TStringField;
    qry_usuario_IN_ZERA_LIQUIDACAO: TStringField;
    qry_usuario_CD_COMPUTADOR: TIntegerField;
    qry_usuario_EXIBE_RESUMO: TStringField;
    qry_usuario_EXIBE_DETALHE: TStringField;
    qry_usuario_GRUPO_RAP: TStringField;
    qry_usuario_SUPERVISA_PENDENCIAS: TStringField;
    qry_usuario_NM_SENHA_INICIAL: TStringField;
    upd_usuario: TUpdateSQL;
    ds_permissao_grupo_: TDataSource;
    qry_permissao_grupo_: TQuery;
    qry_permissao_grupo_CD_USUARIO: TStringField;
    qry_permissao_grupo_CD_GRUPO: TStringField;
    qry_permissao_grupo_LookNmGrupo: TStringField;
    qry_permissao_grupo_LookAtivo: TStringField;
    qry_permissao_grupo_IN_ATIVO: TStringField;
    qry_usuario_NM_EMAIL: TMemoField;
    ds_grupo: TDataSource;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_usuario_CD_GRUPO_DETALHES: TStringField;
    qry_usuario_IN_MANAGER: TStringField;
    qry_usuario_IN_MANAGER_SITE: TStringField;
    qry_usuario_CD_SUPERIOR_DIRETO: TStringField;
    qry_usuario_QT_SENHA_INCORRETA: TIntegerField;
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_usuario_CalcFields(DataSet: TDataSet);
    procedure qry_usuario_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_usuario_permissao_CalcFields(DataSet: TDataSet);
    procedure qry_permissao_area_CalcFields(DataSet: TDataSet);
    procedure qry_lista_CalcFields(DataSet: TDataSet);
    procedure SqlPermissao_EmpresaEstCalcFields(DataSet: TDataSet);
    procedure qry_usuario_AfterInsert(DataSet: TDataSet);
    procedure ds_usuarioStateChange(Sender: TObject);
    procedure qry_usuario_AfterPost(DataSet: TDataSet);
    procedure qry_usuario_IN_ATIVOChange(Sender: TField);
    procedure qry_usuario_AfterDelete(DataSet: TDataSet);
    procedure qry_permissao_grupo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_usuario: Tdatm_usuario;

implementation

uses GSMLIB, PGSM016, ConsOnLineEx;

{$R *.DFM}

procedure Tdatm_usuario.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_usuario_lista_.Close;
  qry_usuario_lista_.ParamByName('CD_USUARIO').AsString := qry_lista_CD_USUARIO.AsString;
  qry_usuario_lista_.Prepare;
  qry_usuario_lista_.Open;
end;

procedure Tdatm_usuario.qry_usuario_CalcFields(DataSet: TDataSet);
begin
  {Célula}
  qry_usuario_LookCelula.AsString := Lookup( qry_celula_, qry_usuario_CD_CELULA, 'CD_CELULA', 'NM_CELULA' );
end;

procedure Tdatm_usuario.qry_usuario_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_usuario_.Close;
  qry_usuario_.ParamByName('CD_USUARIO').AsString := qry_usuario_lista_CD_USUARIO.AsString;
  qry_usuario_.Prepare;
  qry_usuario_.Open;

  qry_usuario_habilitacao_.Close;
  qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := qry_usuario_lista_CD_USUARIO.AsString;
  qry_usuario_habilitacao_.Prepare;
  qry_usuario_habilitacao_.Open;

  qry_usuario_permissao_.Close;
  qry_usuario_permissao_.ParamByName('CD_USUARIO').AsString := qry_usuario_lista_CD_USUARIO.AsString;
  qry_usuario_permissao_.Prepare;
  qry_usuario_permissao_.Open;

  qry_permissao_area_.Close;
  qry_permissao_area_.ParamByName('CD_USUARIO').AsString := qry_usuario_lista_CD_USUARIO.AsString;
  qry_permissao_area_.Prepare;
  qry_permissao_area_.Open;

  qry_permissao_grupo_.Close;
  qry_permissao_grupo_.ParamByName('CD_USUARIO').AsString := qry_usuario_lista_CD_USUARIO.AsString;
  qry_permissao_grupo_.Prepare;
  qry_permissao_grupo_.Open;

  SqlPermissao_EmpresaEst.Close;
  SqlPermissao_EmpresaEst.ParamByName('CD_USUARIO').AsString := qry_usuario_lista_CD_USUARIO.AsString;
  SqlPermissao_EmpresaEst.Prepare;
  SqlPermissao_EmpresaEst.Open;

  qry_lingua_.Open;
  qry_grupo_.Open;
end;

procedure Tdatm_usuario.qry_usuario_permissao_CalcFields(
  DataSet: TDataSet);
begin
  qry_usuario_permissao_LookNmCliente.AsString := FastLookup( 'TEMPRESA_NAC', qry_usuario_permissao_CD_CLIENTE, 'CD_EMPRESA', 'NM_EMPRESA', '' );
  qry_usuario_permissao_LookAtivo.AsString := FastLookup( 'TYES_NO', qry_usuario_permissao_IN_ATIVO, 'CD_YESNO', 'TX_YESNO', '' );
end;

procedure Tdatm_usuario.qry_permissao_area_CalcFields(DataSet: TDataSet);
begin
  qry_permissao_area_LookNmArea.AsString := FastLookup( 'TAREA', qry_permissao_area_CD_AREA, 'CD_AREA', 'NM_AREA', '' );
  qry_permissao_area_LookAtivo.AsString := FastLookup( 'TYES_NO', qry_permissao_area_IN_ATIVO, 'CD_YESNO', 'TX_YESNO', '' );
end;

procedure Tdatm_usuario.qry_lista_CalcFields(DataSet: TDataSet);
begin
  {Selecionado}
  if qry_lista_IN_SELECIONADO.AsString = '1' then
    qry_lista_calcSelecionado.AsString := 'ü'
  else
    qry_lista_calcSelecionado.AsString := '';
  {ativo}
  if qry_lista_IN_ATIVO.AsString = '1' then
    qry_lista_calcativo.AsString := 'ü'
  else
    qry_lista_calcativo.AsString := '';

end;

procedure Tdatm_usuario.SqlPermissao_EmpresaEstCalcFields(
  DataSet: TDataSet);
begin
  SqlPermissao_EmpresaEstLookNmEmpresa.AsString := FastLookup( 'TEMPRESA_EST', SqlPermissao_EmpresaEstCD_EMPRESA, 'CD_EMPRESA', 'NM_EMPRESA', '' );
  SqlPermissao_EmpresaEstLookAtivo.AsString     := FastLookup( 'TYES_NO', SqlPermissao_EmpresaEstIN_ATIVO, 'CD_YESNO', 'TX_YESNO', '' );
end;

procedure Tdatm_usuario.qry_usuario_AfterInsert(DataSet: TDataSet);
begin
  qry_usuario_CD_IDIOMA.AsString := '0';
end;

procedure Tdatm_usuario.ds_usuarioStateChange(Sender: TObject);
begin
  frm_usuario.dblkpcbox_ativo.Enabled := (ds_usuario.State <> dsInsert);
end;

procedure Tdatm_usuario.qry_usuario_AfterPost(DataSet: TDataSet);
begin
  qry_usuario_.ApplyUpdates;
end;

procedure Tdatm_usuario.qry_usuario_IN_ATIVOChange(Sender: TField);
begin
  // Se passou por todas as verificações, verificar quantidade áreas, empresas e habilitações, onde deve haver pelo menos uma
  // Se for Cliente (Cargos 040 e 131) ou Transportador (Cargo 055) deve ter pelo menos uma área e uma empresa
  // Se for Importador (Cargo 088) deve ter pelo menos uma empresa estrangeira
  // Se não for Cliente deve ter pelo menos uma habilitação
  // Michel - 14/07/2010
  if (qry_usuario_.State = dsEdit) and (qry_usuario_IN_ATIVO.AsString = '1') then
  begin
    // 040, 131 e 055
    if AnsiIndexText(qry_usuario_CD_CARGO.AsString, ['040', '131', '055']) >= 0 then
    begin
      // Empresas
      if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                           ' FROM TPERMISSAO_GRUPO (NOLOCK)' +
                           ' WHERE CD_USUARIO = "' + qry_usuario_CD_USUARIO.AsString + '"', 'QTD') = '0' then
      begin
        BoxMensagem('Para ativar este cargo é necessário incluir pelo menos um permissão de Cliente.'#13 +
                    'Habilitação >> Permissões - Grupos', 2);
        qry_usuario_IN_ATIVO.AsString := '0';
      end;
    end
      // Áreas
      {*
      else if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                           ' FROM TPERMISSAO (NOLOCK)' +
                           ' WHERE CD_USUARIO = "' + qry_usuario_CD_USUARIO.AsString + '"', 'QTD') = '0' then
      begin
        BoxMensagem('Para ativar este cargo é necessário incluir pelo menos um permissão de Cliente.'#13 +
                    'Habilitação >> Permissões - Clientes', 2);
        qry_usuario_IN_ATIVO.AsString := '0';
      end
      // Áreas
      else if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                ' FROM TPERMISSAO_AREA (NOLOCK) ' +
                                ' WHERE CD_USUARIO = "' + qry_usuario_CD_USUARIO.AsString + '" ' +
                                '   AND IN_ATIVO   = "1"', 'QTD') = '0' then
      begin
        BoxMensagem('Para ativar este cargo é necessário incluir pelo menos um permissão de Área.'#13 +
                    'Habilitação >> Permissões - Áreas', 2);
        qry_usuario_IN_ATIVO.AsString := '0';
      end;
    end
    *}
    // 088
    else if AnsiIndexText(qry_usuario_CD_CARGO.AsString, ['088']) >= 0 then
    begin
      // Empresas Estrangeira
      if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                           ' FROM TPERMISSAO_EMPRESA_EST (NOLOCK) ' +
                           ' WHERE CD_USUARIO = "' + qry_usuario_CD_USUARIO.AsString + '" ' +
                           '   AND IN_ATIVO   = "1"', 'QTD') = '0' then
      begin
        BoxMensagem('Para ativar este cargo é necessário incluir pelo menos um permissão de Empresa Estrangeira.'#13 +
                    'Habilitação >> Permissões - Empresa Estrangeira', 2);
        qry_usuario_IN_ATIVO.AsString := '0';
      end;
    end
    // Demais Cargos
    else
    begin
      // Habilitação
      if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                           ' FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                           ' WHERE CD_USUARIO = "' + qry_usuario_CD_USUARIO.AsString + '" ' +
                           '   AND IN_ATIVO   = "1"', 'QTD') = '0' then
      begin
        BoxMensagem('Para ativar este cargo é necessário incluir pelo menos uma Habilitação.'#13 +
                    'Habilitação >> Lista', 2);
        qry_usuario_IN_ATIVO.AsString := '0';
      end;
    end;
  end;
end;

procedure Tdatm_usuario.qry_usuario_AfterDelete(DataSet: TDataSet);
begin
  qry_usuario_.ApplyUpdates;
end;

procedure Tdatm_usuario.qry_permissao_grupo_CalcFields(DataSet: TDataSet);
begin
  qry_permissao_grupo_LookNmGrupo.AsString := FastLookup( 'TGRUPO', qry_permissao_grupo_CD_GRUPO, 'CD_GRUPO', 'NM_GRUPO', '' );
  qry_permissao_grupo_LookAtivo.AsString   := FastLookup( 'TYES_NO', qry_permissao_grupo_IN_ATIVO, 'CD_YESNO', 'TX_YESNO', '' );
end;

end.
