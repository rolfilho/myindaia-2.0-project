unit upendencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, DB,
  DBTables, RxLookup, Mask, ToolEdit, dbcgrids, ComCtrls, IdMessage, IdSMTP,
  SpellChk;

type
  TStringArray =  array of String;
  Tfrm_pendencias = class(TForm)
    pnl_opcao_pendencias: TPanel;
    Shape2: TShape;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    DBText2: TDBText;
    pnlPendencias: TPanel;
    pnl_titulo: TPanel;
    lblTitulo: TLabel;
    pnl_grid: TPanel;
    dbg_pendencias: TDBGrid;
    shp_titulo: TShape;
    shp_grid: TShape;
    dsPendenciasGrid: TDataSource;
    qryPendenciasGrid: TQuery;
    qryPendenciasGridNM_PENDENCIA: TStringField;
    qryPendenciasGridCD_STATUS: TStringField;
    dsLookupPendencias: TDataSource;
    qryLookupPendencias: TQuery;
    qryLookupPendenciasNM_PENDENCIA: TStringField;
    btn_solicitar: TSpeedButton;
    qryPendenciasGridCD_PENDENCIA: TIntegerField;
    qryPendenciasGridNR_PROCESSO: TStringField;
    qryPendenciasGridDT_CRIACAO_PENDENCIA: TDateTimeField;
    qryPendenciasGridNM_STATUS: TStringField;
    upPendenciasGrid: TUpdateSQL;
    pnl_historico_pendencias: TPanel;
    pnl_historico_pendencias1: TPanel;
    shp_historico_pendencias: TShape;
    btn_historico_sair: TSpeedButton;
    mm_historico: TMemo;
    dsHistorico: TDataSource;
    qryHistorico: TQuery;
    qryHistoricoCD_USUARIO: TStringField;
    qryHistoricoDT_TEXTO: TDateTimeField;
    pnl_historico_aux: TPanel;
    Shape1: TShape;
    re_historico_texto: TRichEdit;
    qryHistoricoCD_PENDENCIA: TIntegerField;
    qryHistoricoNR_PROCESSO: TStringField;
    qryHistoricoCD_TEXTO: TIntegerField;
    qryHistoricoTP_TEXTO: TStringField;
    qryHistoricoCD_USUARIO_PARA: TStringField;
    qryHistoricoAP_USUARIO: TStringField;
    qryHistoricoNM_USUARIO: TStringField;
    btn_historico_ok: TBitBtn;
    pnl_legenda_externo: TPanel;
    pnl_legenda_interno: TPanel;
    lbl_nome_interno: TLabel;
    lbl_nome_externo: TLabel;
    btn_historico_email: TSpeedButton;
    pnl_historico_email: TPanel;
    pnl_historico_email_geral: TPanel;
    shp_historico_email: TShape;
    btn_email_enviar: TButton;
    btn_email_cancelar: TButton;
    pnl_historico_email2: TPanel;
    Label2: TLabel;
    edt_assunto: TEdit;
    pnl_historico_email1: TPanel;
    edt_para: TEdit;
    qryPendenciasGridCONTADOR: TIntegerField;
    qryPendenciasGridCD_USUARIO_SOLICITANTE: TStringField;
    sp_historico_texto: TSpellCheck;
    qryPendenciasGridCD_USUARIO_CRIADOR: TStringField;
    lbl_para: TLabel;
    btn_historico_email_geral: TSpeedButton;
    qryPendenciasGridCD_USUARIO_SOLICITACAO: TStringField;
    qryPendenciasGridCD_USUARIO_FINALIZACAO: TStringField;
    qryPendenciasGridCD_USUARIO_CANCELAMENTO: TStringField;
    qryPendenciasGridDT_SOLICITACAO: TDateTimeField;
    qryPendenciasGridDT_FINALIZACAO: TDateTimeField;
    qryPendenciasGridDT_PRIMEIRA_SOLICITACAO: TDateTimeField;
    qryPendenciasGridDT_RESPOSTA_SOLICITA: TDateTimeField;
    qryPendenciasGridCD_USUARIO_RESPOSTA_SOLICITA: TStringField;
    qryHistoricoNM_TEXTO: TMemoField;
    qryPendenciasGridCALC_NOME_USUARIO: TStringField;
    qryPendenciasGridNR_PROCESSO2: TStringField;
    btn_proc_realiza: TSpeedButton;
    qryPendenciasGridNR_REFERENCIA: TStringField;
    qryPendenciasGridNR_ITEM_CLIENTE: TStringField;
    qryPendenciasGridNR_PARCIAL: TIntegerField;
    qryPendenciasGridCD_EMPRESA: TStringField;
    qryHistoricoNR_REFERENCIA: TStringField;
    qryHistoricoNR_ITEM_CLIENTE: TStringField;
    qryHistoricoNR_PARCIAL: TIntegerField;
    qryHistoricoCD_EMPRESA: TStringField;
    Label1: TLabel;
    btn_co_contato: TSpeedButton;
    dbedt_nm_contato: TEdit;
    btn_incluir_contato: TSpeedButton;
    lbContatos: TListBox;
    btn_excluir_contato: TSpeedButton;
    qryAuxProcesso: TQuery;
    edt_co_contato: TEdit;
    qryPendenciasGridCALC_NOME_CONTATO: TStringField;
    qryPendenciasGridCD_USUARIO_CONTATO: TStringField;
    rxle_nm_pendencia: TDBLookupComboBox;
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure ATIVA_SALVAR(DataSet: TDataSet);
    procedure qryPendenciasGridAfterPost(DataSet: TDataSet);
    procedure dsPendenciasGridDataChange(Sender: TObject; Field: TField);
    procedure qryPendenciasGridNewRecord(DataSet: TDataSet);
    procedure qryPendenciasGridBeforePost(DataSet: TDataSet);
    procedure qryPendenciasGridAfterDelete(DataSet: TDataSet);
    procedure btn_solicitarClick(Sender: TObject);
    procedure qryPendenciasGridAfterScroll(DataSet: TDataSet);
    procedure qryPendenciasGridBeforeInsert(DataSet: TDataSet);
    procedure dbg_pendenciasDblClick(Sender: TObject);
    procedure btn_historico_sairClick(Sender: TObject);
    procedure mm_historicoChange(Sender: TObject);
    procedure btn_historico_okClick(Sender: TObject);
    procedure btn_historico_emailClick(Sender: TObject);
    procedure btn_email_cancelarClick(Sender: TObject);
    procedure btn_email_enviarClick(Sender: TObject);
    procedure qryPendenciasGridAfterCancel(DataSet: TDataSet);
    procedure dbg_pendenciasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure lbl_paraClick(Sender: TObject);
    procedure qryPendenciasGridCalcFields(DataSet: TDataSet);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure btn_co_contatoClick(Sender: TObject);
    procedure btn_incluir_contatoClick(Sender: TObject);
    procedure btn_excluir_contatoClick(Sender: TObject);
  private
    function Split(AText, ADelimiter: String): TStringArray;
    procedure PrepararEmail;
    function EmailAutomatico: Boolean;
    { Private declarations }
  public
     tp_origem : Byte;
     tp_usuario : Byte;
  end;

var
  frm_pendencias: Tfrm_pendencias;
  nm_contatos : String;

implementation

uses
  uFollowUp, Math, PGGP017, StrUtils, ConsOnlineEx, PGGP001, GSMLIB,
  PGPO018;

{$R *.dfm}

procedure Tfrm_pendencias.btn_sairClick(Sender: TObject);
var
  qtde_pendencias_digitadas : Integer;
begin
  with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(CD_PENDENCIA) AS PENDENCIA');
      SQL.Add('FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS ');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO ');
      SQL.Add('AND NR_REFERENCIA = :NR_REFERENCIA ');
      SQL.Add('AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ');
      SQL.Add('AND NR_PARCIAL = :NR_PARCIAL ');
      SQL.Add('AND CD_EMPRESA = :CD_EMPRESA ');
      SQL.Add('AND CD_STATUS =''1''');
      SQL.Add('AND IN_ATIVO  =''1''');
      if tp_origem = 1 then
      begin
        if tp_usuario = 1 then
        begin
          ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
          ParamByName('NR_REFERENCIA').AsString := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
          ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuAtendenteNR_ITEM_CLIENTE.AsString;
          ParamByName('NR_PARCIAL').AsInteger := frm_main.qryPendenciasMenuAtendenteNR_PARCIAL.AsInteger;
          ParamByName('CD_EMPRESA').AsString := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
        end
        else
        begin
          ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
          ParamByName('NR_REFERENCIA').AsString := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
          ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuNR_ITEM_CLIENTE.AsString;
          ParamByName('NR_PARCIAL').AsInteger := frm_main.qryPendenciasMenuNR_PARCIAL.AsInteger;
          ParamByName('CD_EMPRESA').AsString := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
        end;
      end
      else
      begin
        if tp_origem = 2 then
        begin
          ParamByName('NR_PROCESSO').AsString := 'X';
          ParamByName('NR_REFERENCIA').AsString := frm_po_flp.qryFollowupPOItemNR_PROCESSO.AsString;
          ParamByName('NR_ITEM_CLIENTE').AsString := frm_po_flp.qryFollowupPOItemNR_ITEM_CLIENTE.AsString;
          ParamByName('NR_PARCIAL').AsInteger := frm_po_flp.qryFollowupPOItemNR_PARCIAL.AsInteger;
          ParamByName('CD_EMPRESA').AsString := frm_po_flp.qryFollowupPOItemCD_EMPRESA.AsString;
        end
        else
        begin
          ParamByName('NR_PROCESSO').AsString := frm_followup.qryFollowUpNR_PROCESSO.AsString;
          ParamByName('NR_REFERENCIA').AsString := 'X';
          ParamByName('NR_ITEM_CLIENTE').AsString := 'X';
          ParamByName('NR_PARCIAL').AsInteger := 0;
          ParamByName('CD_EMPRESA').AsString := 'X';
        end;
      end;
      Open;
      qtde_pendencias_digitadas := FieldByName('PENDENCIA').asInteger;
      Close;
      Free;
    end;
    if qtde_pendencias_digitadas > 0 Then
    begin
      if MessageDlg('ATENÇÃO: Existem pendências aguardando solicitação!'+#13+'Deseja solicitá-las agora?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Close;
    end
    else
       Close;

end;

procedure Tfrm_pendencias.FormShow(Sender: TObject);
begin
  qryPendenciasGrid.Close;
//  qryLookupPendencias.Close;
  qryAuxProcesso.Close;
  btn_incluir_contato.Enabled := False;
  if lbContatos.Count = 0 then
    btn_excluir_contato.Enabled := False;


  if tp_origem = 1 then
  begin
    if tp_usuario = 1 then
    begin
      qryPendenciasGrid.ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
      qryPendenciasGrid.ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
      qryPendenciasGrid.ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuAtendenteNR_ITEM_CLIENTE.AsString;
      qryPendenciasGrid.ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuAtendenteNR_PARCIAL.AsInteger;
      qryPendenciasGrid.ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuAtendenteCD_EMPRESA.AsString;

      if frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString <> 'X' then
      begin
        qryAuxProcesso.SQL.Text := ' SELECT P.CD_UNID_NEG, P.CD_CLIENTE, P.CD_PRODUTO, C.CD_USUARIO AS ANALISTA ' +
                                   ' FROM TPROCESSO              P (NOLOCK)' +
                                   ' INNER JOIN TCLIENTE_CONTATO C (NOLOCK) ON C.CD_CONTATO = P.CD_CONTATO AND C.CD_CLIENTE = P.CD_CLIENTE ' +
                                   ' WHERE P.NR_PROCESSO = :NR_PROCESSO ';
        qryAuxProcesso.ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
      end
      else
      begin
         qryAuxProcesso.SQL.Text := ' SELECT P.CD_UNID_NEG, P.CD_CLIENTE, P.CD_PRODUTO, P.CD_ANALISTA_CLIENTE AS ANALISTA ' +
                                    ' FROM TPROCESSO P (NOLOCK) ' +
                                    ' WHERE P.NR_REFERENCIA = :NR_PROCESSO AND P.CD_CLIENTE = :CD_EMPRESA';
         qryAuxProcesso.ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
         qryAuxProcesso.ParamByName('CD_EMPRESA').AsString  := frm_main.qryPendenciasMenuAtendenteCD_EMPRESA.AsString;
      end;
    end
    else
    begin
      qryPendenciasGrid.ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
      qryPendenciasGrid.ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
      qryPendenciasGrid.ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuNR_ITEM_CLIENTE.AsString;
      qryPendenciasGrid.ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuNR_PARCIAL.AsInteger;
      qryPendenciasGrid.ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuCD_EMPRESA.AsString;

      if frm_main.qryPendenciasMenuNR_PROCESSO.AsString <> 'X' then
      begin
        qryAuxProcesso.SQL.Text := ' SELECT P.CD_UNID_NEG, P.CD_CLIENTE, P.CD_PRODUTO, C.CD_USUARIO AS ANALISTA ' +
                                   ' FROM TPROCESSO              P (NOLOCK)' +
                                   ' INNER JOIN TCLIENTE_CONTATO C (NOLOCK) ON C.CD_CONTATO = P.CD_CONTATO AND C.CD_CLIENTE = P.CD_CLIENTE ' +
                                   ' WHERE P.NR_PROCESSO = :NR_PROCESSO';
        qryAuxProcesso.ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
      end
      else
      begin
         qryAuxProcesso.SQL.Text := ' SELECT P.CD_UNID_NEG, P.CD_CLIENTE, P.CD_PRODUTO, P.CD_ANALISTA_CLIENTE AS ANALISTA ' +
                                    ' FROM TPROCESSO P (NOLOCK) ' +
                                    ' WHERE P.NR_REFERENCIA = :NR_PROCESSO AND P.CD_CLIENTE = :CD_EMPRESA';
         qryAuxProcesso.ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
         qryAuxProcesso.ParamByName('CD_EMPRESA').AsString := frm_main.qryPendenciasMenuCD_EMPRESA.AsString;
      end;
    end;
  end
  else
  if tp_origem = 2 then
  begin
    qryPendenciasGrid.ParamByName('NR_PROCESSO').AsString     := 'X';
    qryPendenciasGrid.ParamByName('NR_REFERENCIA').AsString   := frm_po_flp.qryFollowupPOItemNR_PROCESSO.AsString;
    qryPendenciasGrid.ParamByName('NR_ITEM_CLIENTE').AsString := frm_po_flp.qryFollowupPOItemNR_ITEM_CLIENTE.AsString;
    qryPendenciasGrid.ParamByName('NR_PARCIAL').AsInteger     := frm_po_flp.qryFollowupPOItemNR_PARCIAL.AsInteger;
    qryPendenciasGrid.ParamByName('CD_EMPRESA').AsString      := frm_po_flp.qryFollowupPOItemCD_EMPRESA.AsString;
    qryAuxProcesso.SQL.Text := ' SELECT P.CD_GRUPO, P.CD_ANALISTA_CLIENTE AS ANALISTA ' +
                               ' FROM TPROCESSO P (NOLOCK) ' +
                               ' WHERE P.NR_REFERENCIA = :NR_PROCESSO AND P.CD_CLIENTE = :CD_EMPRESA';
    qryAuxProcesso.ParamByName('NR_PROCESSO').AsString := frm_po_flp.qryFollowupPOItemNR_PROCESSO.AsString;
    qryAuxProcesso.ParamByName('CD_EMPRESA').AsString  := frm_po_flp.qryFollowupPOItemCD_EMPRESA.AsString;
  end
  else
  begin
    qryPendenciasGrid.ParamByName('NR_PROCESSO').AsString     := frm_followup.qryFollowUpNR_PROCESSO.AsString;
    qryPendenciasGrid.ParamByName('NR_REFERENCIA').AsString   := 'X';
    qryPendenciasGrid.ParamByName('NR_ITEM_CLIENTE').AsString := 'X';
    qryPendenciasGrid.ParamByName('NR_PARCIAL').AsInteger     := 0;
    qryPendenciasGrid.ParamByName('CD_EMPRESA').AsString      := 'X';

    qryAuxProcesso.SQL.Text := ' SELECT P.CD_UNID_NEG, P.CD_CLIENTE, P.CD_PRODUTO, C.CD_USUARIO AS ANALISTA ' +
                               ' FROM TPROCESSO              P (NOLOCK) ' +
                               ' INNER JOIN TCLIENTE_CONTATO C (NOLOCK) ON C.CD_CONTATO = P.CD_CONTATO AND C.CD_CLIENTE = P.CD_CLIENTE ' +
                               ' WHERE P.NR_PROCESSO = :NR_PROCESSO';
    qryAuxProcesso.ParamByName('NR_PROCESSO').AsString := frm_followup.qryFollowUpNR_PROCESSO.AsString;
  end;
//  qryLookupPendencias.Open;
  qryPendenciasGrid.Open;
  qryAuxProcesso.Open;


  if qryPendenciasGridNR_PROCESSO.AsString <> 'X' then
  begin
//    DBText1.DataField := 'NR_PROCESSO2';
    DBText2.DataField := 'NR_PROCESSO2';
  end
  else
  begin
//    DBText1.DataField := 'NR_REFERENCIA';
    DBText2.DataField := 'NR_REFERENCIA';
  end;
end;

procedure Tfrm_pendencias.btn_excluirClick(Sender: TObject);
begin
  qryPendenciasGrid.Edit;
  qryPendenciasGridCD_USUARIO_CANCELAMENTO.AsString := str_cd_usuario;
  qryPendenciasGrid.Post;
  qryPendenciasGrid.Delete;
  if tp_origem <> 1 then
  begin
    frm_followup.qryPendencias.Close;
    frm_followup.qryPendencias.Open;
  end;
//  qryLookupPendencias.Close;
//  qryLookupPendencias.Open;
 // rxle_nm_pendencia.Text := '';
 rxle_nm_pendencia.KeyValue := '';
end;

procedure Tfrm_pendencias.btn_salvarClick(Sender: TObject);
var
  I : Integer;
  contatos_array : TStringArray;
  titulo_pendencia : String;
begin
  if lbContatos.Count = 0 then
  begin
    ShowMessage('ATENÇÃO: Selecione pelo menos um contato!');
    Exit;
  end;

  contatos_array := Split(nm_contatos, ';');
  if qryPendenciasGridNM_PENDENCIA.AsString = '' then
    qryPendenciasGridNM_PENDENCIA.AsString := rxle_nm_pendencia.Text;

  titulo_pendencia := qryPendenciasGridNM_PENDENCIA.AsString;

  for I := 0 to High(contatos_array) do
  begin
    if Trim(contatos_array[I]) <> '' then
    begin
      if Not (qryPendenciasGrid.State in [dsInsert]) then
        qryPendenciasGrid.Insert;
      qryPendenciasGridNM_PENDENCIA.AsString := titulo_pendencia;
      qryPendenciasGridCD_USUARIO_CONTATO.AsString := contatos_array[I];
      qryPendenciasGrid.Post;
    end;
  end;

  qryPendenciasGrid.Close;
  qryPendenciasGrid.Open;
  if tp_origem <> 1 then
  begin
    if tp_origem  = 2 then
    begin
      frm_po_flp.qryPendencias.Close;
      frm_po_flp.qryPendencias.Open;
    end
    else
    begin
      frm_followup.qryPendencias.Close;
      frm_followup.qryPendencias.Open;
    end;
  end;
end;

procedure Tfrm_pendencias.btn_cancelarClick(Sender: TObject);
begin
  qryPendenciasGrid.Cancel;
  pnl_grid.Enabled := True;
  edt_co_contato.Text := '';
  btn_incluir_contato.Enabled := True;
end;

procedure Tfrm_pendencias.btn_incluirClick(Sender: TObject);
begin
  qryLookupPendencias.Close;
  qryLookupPendencias.Open;

  qryPendenciasGrid.Insert;
  pnl_grid.Enabled := False;
  edt_co_contato.Text := qryAuxProcesso.FieldByName('ANALISTA').AsString;
  if edt_co_contato.Text <> '' then
    btn_incluir_contato.Enabled := True;
end;

procedure Tfrm_pendencias.ATIVA_SALVAR(DataSet: TDataSet);
begin
  btn_salvar.Enabled   := True;
  btn_cancelar.Enabled := True;
  btn_incluir.Enabled  := False;
end;

procedure Tfrm_pendencias.qryPendenciasGridAfterPost(DataSet: TDataSet);
begin
  qryPendenciasGrid.ApplyUpdates;
//  rxle_nm_pendencia.Text    := '';
 rxle_nm_pendencia.KeyValue := '';
  rxle_nm_pendencia.Enabled := False;
  btn_salvar.Enabled        := False;
  btn_incluir.Enabled       := True;
  btn_excluir.Enabled       := True;
//  qryLookupPendencias.Close;
//  qryLookupPendencias.Open;
  pnl_grid.Enabled := True;
  lbContatos.Clear;
  nm_contatos :=  '';
  edt_co_contato.Clear;
  btn_excluir_contato.Enabled := False;
  btn_incluir_contato.Enabled := False;
end;

procedure Tfrm_pendencias.dsPendenciasGridDataChange(Sender: TObject;
  Field: TField);
begin
  if qryPendenciasGrid.RecordCount > 0 then
  begin
    btn_excluir.Enabled    := True;
    dbg_pendencias.Enabled := True;
    btn_historico_email_geral.Enabled := True;
  end
  else
  begin
    btn_excluir.Enabled    := False;
    dbg_pendencias.Enabled := False;
    btn_historico_email_geral.Enabled := False;
  end;
end;

procedure Tfrm_pendencias.qryPendenciasGridNewRecord(DataSet: TDataSet);
var
int_cd_pendencia : Integer;
begin
  with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT MAX(CD_PENDENCIA) AS PENDENCIA');
      SQL.Add('FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS ');
      SQL.Add('WHERE NR_PROCESSO     = :NR_PROCESSO ');
      SQL.Add('  AND NR_REFERENCIA   = :NR_REFERENCIA ');
      SQL.Add('  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ');
      SQL.Add('  AND NR_PARCIAL      = :NR_PARCIAL ');
      SQL.Add('  AND CD_EMPRESA      = :CD_EMPRESA ');
      if tp_origem = 1 then
      begin
        if tp_usuario = 1 then
        begin
          ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
          ParamByName('NR_REFERENCIA').AsString := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
          ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuAtendenteNR_ITEM_CLIENTE.AsString;
          ParamByName('NR_PARCIAL').AsInteger := frm_main.qryPendenciasMenuAtendenteNR_PARCIAL.AsInteger;
          ParamByName('CD_EMPRESA').AsString := frm_main.qryPendenciasMenuAtendenteCD_EMPRESA.AsString;
        end
        else
        begin
          ParamByName('NR_PROCESSO').AsString := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
          ParamByName('NR_REFERENCIA').AsString := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
          ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuNR_ITEM_CLIENTE.AsString;
          ParamByName('NR_PARCIAL').AsInteger := frm_main.qryPendenciasMenuNR_PARCIAL.AsInteger;
          ParamByName('CD_EMPRESA').AsString := frm_main.qryPendenciasMenuCD_EMPRESA.AsString;
        end;
      end
      else
      begin
      if tp_origem = 2 then
      begin
        ParamByName('NR_PROCESSO').AsString := 'X';
        ParamByName('NR_REFERENCIA').AsString := frm_po_flp.qryFollowUpPOItemNR_PROCESSO.AsString;
        ParamByName('NR_ITEM_CLIENTE').AsString := frm_po_flp.qryFollowUpPOItemNR_ITEM_CLIENTE.AsString;
        ParamByName('NR_PARCIAL').AsInteger := frm_po_flp.qryFollowUpPOItemNR_PARCIAL.AsInteger;
        ParamByName('CD_EMPRESA').AsString := frm_po_flp.qryFollowUpPOItemCD_EMPRESA.AsString;
      end
      else
      begin
        ParamByName('NR_PROCESSO').AsString := frm_followup.qryFollowUpNR_PROCESSO.AsString;
        ParamByName('NR_REFERENCIA').AsString := 'X';
        ParamByName('NR_ITEM_CLIENTE').AsString := 'X';
        ParamByName('NR_PARCIAL').AsInteger := 0;
        ParamByName('CD_EMPRESA').AsString := 'X';
      end;
      end;
      Open;
      int_cd_pendencia := FieldByName('PENDENCIA').asInteger + 1;
      Close;
      Free;
    end;
  qryPendenciasGridCD_PENDENCIA.AsInteger          := int_cd_pendencia;
  qryPendenciasGridCD_STATUS.AsString              := '1';
  if tp_origem = 1 then
  begin
    if tp_usuario = 1 then
    begin
      qryPendenciasGridNR_PROCESSO.AsString      := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
      qryPendenciasGridNR_REFERENCIA.AsString    := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
      qryPendenciasGridNR_ITEM_CLIENTE.AsString  := frm_main.qryPendenciasMenuAtendenteNR_ITEM_CLIENTE.AsString;
      qryPendenciasGridNR_PARCIAL.AsInteger      := frm_main.qryPendenciasMenuAtendenteNR_PARCIAL.AsInteger;
      qryPendenciasGridCD_EMPRESA.AsString       := frm_main.qryPendenciasMenuAtendenteCD_EMPRESA.AsString;
    end
    else
    begin
      qryPendenciasGridNR_PROCESSO.AsString     := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
      qryPendenciasGridNR_REFERENCIA.AsString   := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
      qryPendenciasGridNR_ITEM_CLIENTE.AsString := frm_main.qryPendenciasMenuNR_ITEM_CLIENTE.AsString;
      qryPendenciasGridNR_PARCIAL.AsInteger     := frm_main.qryPendenciasMenuNR_PARCIAL.AsInteger;
      qryPendenciasGridCD_EMPRESA.AsString      := frm_main.qryPendenciasMenuCD_EMPRESA.AsString;
    end;
  end
  else
  if tp_origem = 2 then
  begin
    qryPendenciasGridNR_PROCESSO.AsString     := 'X';
    qryPendenciasGridNR_REFERENCIA.AsString   := frm_po_flp.qryFollowUpPOItemNR_PROCESSO.AsString;
    qryPendenciasGridNR_ITEM_CLIENTE.AsString := frm_po_flp.qryFollowUpPOItemNR_ITEM_CLIENTE.AsString;
    qryPendenciasGridNR_PARCIAL.AsInteger     := frm_po_flp.qryFollowUpPOItemNR_PARCIAL.AsInteger;
    qryPendenciasGridCD_EMPRESA.AsString      := frm_po_flp.qryFollowUpPOItemCD_EMPRESA.AsString;
  end
  else
  begin
    qryPendenciasGridNR_PROCESSO.AsString            := frm_followup.qryFollowUpNR_PROCESSO.AsString;
    qryPendenciasGridNR_REFERENCIA.AsString          := 'X';
    qryPendenciasGridNR_ITEM_CLIENTE.AsString        := 'X';
    qryPendenciasGridNR_PARCIAL.AsInteger            := 0;
    qryPendenciasGridCD_EMPRESA.AsString             := 'X';
  end;
  qryPendenciasGridDT_CRIACAO_PENDENCIA.AsDateTime := Now;
  qryPendenciasGridCD_USUARIO_CRIADOR.AsString     := str_cd_usuario;
end;

procedure Tfrm_pendencias.qryPendenciasGridBeforePost(DataSet: TDataSet);
begin
  //if qryPendenciasGridNM_PENDENCIA.AsString = '' then
  //  qryPendenciasGridNM_PENDENCIA.AsString := rxle_nm_pendencia.Text;
end;

procedure Tfrm_pendencias.qryPendenciasGridAfterDelete(DataSet: TDataSet);
begin
  qryPendenciasGrid.ApplyUpdates;
//  qryLookupPendencias.Close;
//  qryLookupPendencias.Open;
  qryPendenciasGrid.Close;
  qryPendenciasGrid.Open;
//  rxle_nm_pendencia.Text    := '';
  rxle_nm_pendencia.KeyValue := '';
  rxle_nm_pendencia.Enabled := False;
end;

procedure Tfrm_pendencias.btn_solicitarClick(Sender: TObject);
begin

  qryPendenciasGrid.Edit;
  if qryPendenciasGridCD_STATUS.AsInteger = 1 then
  begin
    qryPendenciasGridCD_STATUS.AsInteger := 2;
    if not qryPendenciasGridDT_PRIMEIRA_SOLICITACAO.IsNull then
    begin
      qryPendenciasGridCD_USUARIO_SOLICITACAO.AsString := str_cd_usuario;
      qryPendenciasGridDT_SOLICITACAO.AsDateTime       := Now;
      qryPendenciasGridCD_USUARIO_RESPOSTA_SOLICITA.AsVariant := null;
      qryPendenciasGridDT_RESPOSTA_SOLICITA.AsVariant     := null;
    end
    else
    begin
      qryPendenciasGridCD_USUARIO_SOLICITANTE.AsString  := str_cd_usuario;
      qryPendenciasGridDT_PRIMEIRA_SOLICITACAO.AsDateTime := Now;
      qryPendenciasGridCD_USUARIO_RESPOSTA_SOLICITA.AsVariant := null;
      qryPendenciasGridDT_RESPOSTA_SOLICITA.AsVariant      := null;
    end;

    if EmailAutomatico then
    begin
      pnl_historico_email.Tag := 3; // Pendência selecionada e solicitada
      PrepararEmail;
    end;

  end
  else
  begin
    if (qryPendenciasGridCD_STATUS.AsInteger = 3) or (qryPendenciasGridCD_STATUS.AsInteger = 2) then
    begin
      qryPendenciasGridCD_STATUS.AsInteger := 4;
      qryPendenciasGridCD_USUARIO_FINALIZACAO.AsString := str_cd_usuario;
      qryPendenciasGridDT_FINALIZACAO.AsDateTime := Now;
    end;
  end;
  qryPendenciasGrid.UpdateRecord;
  qryPendenciasGrid.Post;

  qryPendenciasGrid.Close;
  qryPendenciasGrid.Open;
  if tp_origem <> 1 then
  begin
    if tp_origem = 2 then
    begin
      frm_po_flp.qryPendencias.Close;
      frm_po_flp.qryPendencias.Open;
    end
    else
    begin
      frm_followup.qryPendencias.Close;
      frm_followup.qryPendencias.Open;
    end;
  end;
end;

function Tfrm_pendencias.EmailAutomatico: Boolean;
var
  qry: TQuery;
begin
  Result := False;
  qry := TQuery.Create(application);
  try
    qry.Databasename := 'DBBROKER';
    qry.SQL.Clear;
    qry.SQL.Add('SELECT G.IN_PENDENCIAS_EMAIL');
    qry.SQL.Add(' FROM TPROCESSO    P (NOLOCK) ');
    qry.SQL.Add(' INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = P.CD_GRUPO ');
    qry.SQL.Add(' WHERE P.NR_PROCESSO = :NR_PROCESSO');
    qry.ParamByName('NR_PROCESSO').AsString   := qryPendenciasGridNR_PROCESSO.AsString;
    qry.Open;
    result := (qry.FieldByName('IN_PENDENCIAS_EMAIL').AsString = '1')
  finally
      FreeAndNil(qry);
  end;
end;

procedure Tfrm_pendencias.qryPendenciasGridAfterScroll(DataSet: TDataSet);
begin
   btn_solicitar.Enabled := False;
   btn_solicitar.Caption := 'Solicitar';
   btn_solicitar.Hint := 'Solicitar Pendência';
   if qryPendenciasGrid.RecordCount > 0 then
   begin
     if (qryPendenciasGridCD_STATUS.AsInteger <> 4) and (qryPendenciasGridCONTADOR.AsInteger > 0) and (qryPendenciasGridCD_STATUS.AsInteger <> 5) then
     begin
       btn_solicitar.Enabled := True;
       If qryPendenciasGridCD_STATUS.AsInteger <> 1 Then
       begin
         btn_solicitar.Caption := 'Aprovar';
         btn_solicitar.Hint := 'Aprovar Pendência';
       end
       else
       begin
        btn_solicitar.Caption := 'Solicitar';
        btn_solicitar.Hint := 'Solicitar Pendência';
       end;
     end;
     if (qryPendenciasGridCD_STATUS.AsInteger = 4) or (qryPendenciasGridCD_STATUS.AsInteger = 5) then
       btn_excluir.Enabled   := False
     else
       btn_excluir.Enabled   := True;
   end;
end;

procedure Tfrm_pendencias.qryPendenciasGridBeforeInsert(DataSet: TDataSet);
begin
  rxle_nm_pendencia.Enabled := True;
  rxle_nm_pendencia.SetFocus;
end;

procedure Tfrm_pendencias.dbg_pendenciasDblClick(Sender: TObject);
var
data_aux : String;
begin
  mm_historico.Text := '';
  pnl_historico_pendencias.Visible := True;
  pnl_opcao_pendencias.Enabled     := False;
  pnl_titulo.Enabled               := False;
  pnl_grid.Enabled                 := False;
  qryHistorico.Close;
  if tp_origem = 1 then
  begin
    if tp_usuario = 1 then
    begin
      qryHistorico.ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
      qryHistorico.ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
      qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuAtendenteNR_ITEM_CLIENTE.AsString;
      qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuAtendenteNR_PARCIAL.AsInteger;
      qryHistorico.ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuAtendenteCD_EMPRESA.AsString;
    end
    else
    begin
      qryHistorico.ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
      qryHistorico.ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
      qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuNR_ITEM_CLIENTE.AsString;
      qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuNR_PARCIAL.AsInteger;
      qryHistorico.ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuCD_EMPRESA.AsString;
    end;
  end
  else
  begin
  if tp_origem = 2 then
  begin
    qryHistorico.ParamByName('NR_PROCESSO').AsString     := 'X';
    qryHistorico.ParamByName('NR_REFERENCIA').AsString   := frm_po_flp.qryFollowUpPOItemNR_PROCESSO.AsString;
    qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := frm_po_flp.qryFollowUpPOItemNR_ITEM_CLIENTE.AsString;
    qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := frm_po_flp.qryFollowUpPOItemNR_PARCIAL.AsInteger;
    qryHistorico.ParamByName('CD_EMPRESA').AsString      := frm_po_flp.qryFollowUpPOItemCD_EMPRESA.AsString;
  end
  else
  begin
    qryHistorico.ParamByName('NR_PROCESSO').AsString     := frm_followup.qryFollowUpNR_PROCESSO.AsString;
    qryHistorico.ParamByName('NR_REFERENCIA').AsString   := 'X';
    qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := 'X';
    qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := 0;
    qryHistorico.ParamByName('CD_EMPRESA').AsString      := 'X';
  end;
  end;
  qryHistorico.ParamByName('CD_PENDENCIA').AsInteger := qryPendenciasGridCD_PENDENCIA.AsInteger;
  qryHistorico.Open;
  if not qryHistorico.IsEmpty then
  begin
    qryHistorico.First;
    data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
    re_historico_texto.Clear;
    re_historico_texto.SelStart := Length(re_historico_texto.Text);
    re_historico_texto.Paragraph.FirstIndent := 5;
    re_historico_texto.Lines.Add('');
    re_historico_texto.SelAttributes.Color := clRed;
    re_historico_texto.SelAttributes.Style := [fsBold];
    re_historico_texto.Lines.Add('(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
    while not qryHistorico.Eof do
    begin
      re_historico_texto.SelStart := Length(re_historico_texto.Text);
      re_historico_texto.Paragraph.FirstIndent := 5;
      re_historico_texto.Lines.Add('');
      if data_aux <> FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) then
      begin
        re_historico_texto.SelAttributes.Color := clRed;
        re_historico_texto.SelAttributes.Style := [fsBold];
        re_historico_texto.Lines.Add('(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
        re_historico_texto.Lines.Add('');
      end;
      re_historico_texto.Paragraph.FirstIndent := 15;
      re_historico_texto.SelAttributes.Style := [fsBold];
      re_historico_texto.SelAttributes.Color := IfThen(qryHistoricoTP_TEXTO.AsString = 'I', clBlack, clTeal);
      re_historico_texto.Lines.Add('(' + FormatDateTime('hh:nn:ss', qryHistoricoDT_TEXTO.AsDateTime) + ') ' + qryHistoricoNM_USUARIO.AsString  + ':');
      re_historico_texto.SelAttributes.Color := IfThen(qryHistoricoTP_TEXTO.AsString = 'I', clBlack, clTeal);
      re_historico_texto.Lines.Add(qryHistoricoNM_TEXTO.Value);
      data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
      qryHistorico.Next;
    end;
    btn_historico_email.Enabled    := True;
    re_historico_texto.SetFocus;
    mm_historico.SetFocus;
  end
  else
  begin
    re_historico_texto.Clear;
    btn_historico_email.Enabled    := False;
    mm_historico.SetFocus;
  end;
end;

procedure Tfrm_pendencias.btn_historico_sairClick(Sender: TObject);
begin
  qryPendenciasGrid.Close;
  qryPendenciasGrid.Open;
  pnl_historico_pendencias.Visible := False;
  pnl_opcao_pendencias.Enabled     := True;
  pnl_titulo.Enabled               := True;
  pnl_grid.Enabled                 := True;
end;

procedure Tfrm_pendencias.mm_historicoChange(Sender: TObject);
begin
  btn_historico_ok.Enabled := Length(mm_historico.Text) > 0;
end;

procedure Tfrm_pendencias.btn_historico_okClick(Sender: TObject);
var
  int_cd_texto : string;
  cd_analista : string;
begin
  sp_historico_texto.CheckMemoTextSpelling(TDBMemo(mm_historico));
  with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT MAX(CD_TEXTO) AS TEXTO ');
      SQL.Add(' FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS_LOG ');
      SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO AND CD_PENDENCIA = :CD_PENDENCIA');
      SQL.Add(' AND NR_REFERENCIA = :NR_REFERENCIA AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE AND NR_PARCIAL = :NR_PARCIAL AND  CD_EMPRESA = :CD_EMPRESA');
      ParamByName('NR_PROCESSO').AsString     := qryPendenciasGridNR_PROCESSO.AsString;
      ParamByName('NR_REFERENCIA').AsString   := qryPendenciasGridNR_REFERENCIA.AsString;
      ParamByName('NR_ITEM_CLIENTE').AsString := qryPendenciasGridNR_ITEM_CLIENTE.AsString;
      ParamByName('NR_PARCIAL').AsInteger     := qryPendenciasGridNR_PARCIAL.AsInteger;
      ParamByName('CD_EMPRESA').AsString      := qryPendenciasGridCD_EMPRESA.AsString;
      ParamByName('CD_PENDENCIA').AsInteger   := qryPendenciasGridCD_PENDENCIA.AsInteger;
      Open;
      int_cd_texto := IntToStr(FieldByName('TEXTO').asInteger + 1);
      Close;
      Free;
    end;
  with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO MYINDAIA.DBO.TPROCESSO_PENDENCIAS_LOG (CD_PENDENCIA, NR_PROCESSO, NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA, CD_TEXTO, TP_TEXTO, NM_TEXTO, CD_USUARIO, CD_USUARIO_PARA, DT_TEXTO) ');
      SQL.Add('VALUES ('+ qryPendenciasGridCD_PENDENCIA.AsString +', '''+ qryPendenciasGridNR_PROCESSO.AsString +''','''+ qryPendenciasGridNR_REFERENCIA.AsString +''', '''+ qryPendenciasGridNR_ITEM_CLIENTE.AsString +''', '''+ qryPendenciasGridNR_PARCIAL.AsString +''', '''+ qryPendenciasGridCD_EMPRESA.AsString +''' ,'+ int_cd_texto +', ''I'', '''+ mm_historico.Text +''', '''+ str_cd_usuario +''', '''+ qryPendenciasGridCD_USUARIO_CONTATO.AsString +''', GETDATE()) ');
      ExecSQL;
      SQL.Clear;
      SQL.Add('UPDATE MYINDAIA.DBO.TPROCESSO_PENDENCIAS SET CD_STATUS = ''1'' ');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND CD_PENDENCIA = :CD_PENDENCIA');
      SQL.Add(' AND NR_REFERENCIA = :NR_REFERENCIA AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE AND NR_PARCIAL = :NR_PARCIAL AND  CD_EMPRESA = :CD_EMPRESA');
      ParamByName('NR_PROCESSO').AsString     := qryPendenciasGridNR_PROCESSO.AsString;
      ParamByName('NR_REFERENCIA').AsString   := qryPendenciasGridNR_REFERENCIA.AsString;
      ParamByName('NR_ITEM_CLIENTE').AsString := qryPendenciasGridNR_ITEM_CLIENTE.AsString;
      ParamByName('NR_PARCIAL').AsInteger     := qryPendenciasGridNR_PARCIAL.AsInteger;
      ParamByName('CD_EMPRESA').AsString      := qryPendenciasGridCD_EMPRESA.AsString;
      ParamByName('CD_PENDENCIA').AsInteger   := qryPendenciasGridCD_PENDENCIA.AsInteger;
      ExecSQL;
      Free;
    end;
    dbg_pendenciasDblClick(sender);
    mm_historico.SetFocus;
end;

procedure Tfrm_pendencias.btn_historico_emailClick(Sender: TObject);
begin
  if sender = btn_historico_email then
    pnl_historico_email.Tag := 1 // Pendência selecionada
  else
    pnl_historico_email.Tag := 2;//Todas as pendências
  pnl_historico_email.Visible      := True;
  pnl_historico_pendencias.Enabled := False;
  edt_para.SetFocus;
end;

procedure Tfrm_pendencias.btn_email_cancelarClick(Sender: TObject);
begin
  pnl_historico_email.Visible      := False;
  pnl_historico_pendencias.Enabled := True;
  if mm_historico.CanFocus then
    mm_historico.SetFocus;
end;

procedure Tfrm_pendencias.btn_email_enviarClick(Sender: TObject);
begin
  PrepararEmail;
end;

procedure Tfrm_pendencias.PrepararEmail;
var
  emailRemetente, emailDestinatario, Titulo, Pedidos: string;
  data_aux : String;
  Body: TStrings;
begin
  Body := TStringList.Create;
  try
    if pnl_historico_email.Tag = 1 then
    begin
        qryHistorico.First;
        data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
        Body.Add('<html><body>');
        Body.Add('<font color=''red'' face=''verdana'' size=''2pt''><b>');
        Body.Add('&nbsp;(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
        Body.Add('</b></font><br>');
        while not qryHistorico.Eof do
        begin
          Body.Add('<br>');
          if data_aux <> FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) then
          begin
            Body.Add('<font color=''red'' face=''verdana'' size=''2pt''><b>');
            Body.Add('&nbsp;(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
            Body.Add('</b></font>');
            Body.Add('<br><br>');
          end;
          Body.Add('<font color='''+ IfThen(qryHistoricoTP_TEXTO.AsString = 'I', 'black','#008080') +''' face=''verdana'' size=''2pt''><b>');
          Body.Add('&nbsp;&nbsp;&nbsp;(' + FormatDateTime('hh:nn:ss', qryHistoricoDT_TEXTO.AsDateTime) + ') ' + qryHistoricoNM_USUARIO.AsString  + ':');
          Body.Add('</b><br>');
          Body.Add('&nbsp;&nbsp;&nbsp;' + StringReplace(StringReplace(qryHistoricoNM_TEXTO.Value, #10, '', [rfReplaceAll]),#13,'<br>&nbsp;&nbsp;&nbsp;',[rfReplaceAll]));
          Body.Add('</font>');
          data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
          Body.Add('<br>');
          qryHistorico.Next;
        end;
        Body.Add('</body></html>');
        {From.Text                 := ConsultaLookUPSQL('SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO ='''+ str_cd_usuario+'''','NM_EMAIL');
        Recipients.EMailAddresses := edt_para.Text;
        Subject                   := edt_assunto.Text;}

      GSMLIB.EnviaEmailHtmlDe(edt_assunto.Text, Body.Text, edt_para.Text, ConsultaLookUPSQL('SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO ='''+ str_cd_usuario+'''','NM_EMAIL'));
      btn_email_cancelar.Click;
    end
    else if pnl_historico_email.Tag = 2 then
    begin
      {IdMessage1 := TIdMessage.Create(application);
      IdSMTP1    := TIdSMTP.Create(application);
      with IdMessage1 do begin
        ContentType := 'text/html' ;}
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          Close;
          SQL.Add('SELECT CD_PENDENCIA, NM_PENDENCIA FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS WHERE NR_PROCESSO = :NR_PROCESSO AND NR_REFERENCIA = :NR_REFERENCIA ');
          SQL.Add(' AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE AND NR_PARCIAL = :NR_PARCIAL AND CD_EMPRESA = :CD_EMPRESA AND CD_STATUS <> 5');
          if tp_origem = 1 then
             begin
              if tp_usuario = 1 then
              begin
                ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
                ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
                ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuAtendenteNR_ITEM_CLIENTE.AsString;
                ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuAtendenteNR_PARCIAL.AsInteger;
                ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuAtendenteCD_EMPRESA.AsString;
              end
              else
              begin
                ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
                ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
                ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuNR_ITEM_CLIENTE.AsString;
                ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuNR_PARCIAL.AsInteger;
                ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuCD_EMPRESA.AsString;
              end;
             end
             else
             begin
             if tp_origem = 2 then
             begin
              ParamByName('NR_PROCESSO').AsString     := 'X';
              ParamByName('NR_REFERENCIA').AsString   := frm_po_flp.qryFollowUpPOItemNR_PROCESSO.AsString;
              ParamByName('NR_ITEM_CLIENTE').AsString := frm_po_flp.qryFollowUpPOItemNR_ITEM_CLIENTE.AsString;
              ParamByName('NR_PARCIAL').AsInteger     := frm_po_flp.qryFollowUpPOItemNR_PARCIAL.AsInteger;
              ParamByName('CD_EMPRESA').AsString      := frm_po_flp.qryFollowUpPOItemCD_EMPRESA.AsString;
             end
             else
             begin
              ParamByName('NR_PROCESSO').AsString     := frm_followup.qryFollowUpNR_PROCESSO.AsString;
              ParamByName('NR_REFERENCIA').AsString   := 'X';
              ParamByName('NR_ITEM_CLIENTE').AsString := 'X';
              ParamByName('NR_PARCIAL').AsInteger     := 0;
              ParamByName('CD_EMPRESA').AsString      := 'X';
             end;
             end;
          Open;
          while not EOF do
          begin
            qryHistorico.Close;
            qryHistorico.ParamByName('CD_PENDENCIA').AsInteger := FieldByName('CD_PENDENCIA').AsInteger;
            if tp_origem = 1 then
            begin
              if tp_usuario = 1 then
              begin
                qryHistorico.ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
                qryHistorico.ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
                qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuAtendenteNR_ITEM_CLIENTE.AsString;
                qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuAtendenteNR_PARCIAL.AsInteger;
                qryHistorico.ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuAtendenteCD_EMPRESA.AsString;
              end
              else
                qryHistorico.ParamByName('NR_PROCESSO').AsString     := frm_main.qryPendenciasMenuNR_PROCESSO.AsString;
                qryHistorico.ParamByName('NR_REFERENCIA').AsString   := frm_main.qryPendenciasMenuNR_REFERENCIA.AsString;
                qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := frm_main.qryPendenciasMenuNR_ITEM_CLIENTE.AsString;
                qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := frm_main.qryPendenciasMenuNR_PARCIAL.AsInteger;
                qryHistorico.ParamByName('CD_EMPRESA').AsString      := frm_main.qryPendenciasMenuCD_EMPRESA.AsString;
            end
            else
            begin
              if tp_origem = 2 then
              begin
                qryHistorico.ParamByName('NR_PROCESSO').AsString     := 'X';
                qryHistorico.ParamByName('NR_REFERENCIA').AsString   := frm_po_flp.qryFollowUpPOItemNR_PROCESSO.AsString;
                qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := frm_po_flp.qryFollowUpPOItemNR_ITEM_CLIENTE.AsString;
                qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := frm_po_flp.qryFollowUpPOItemNR_PARCIAL.AsInteger;
                qryHistorico.ParamByName('CD_EMPRESA').AsString      := frm_po_flp.qryFollowUpPOItemCD_EMPRESA.AsString;
              end
              else
              begin
                qryHistorico.ParamByName('NR_PROCESSO').AsString     := frm_followup.qryFollowUpNR_PROCESSO.AsString;
                qryHistorico.ParamByName('NR_REFERENCIA').AsString   := 'X';
                qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := 'X';
                qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := 0;
                qryHistorico.ParamByName('CD_EMPRESA').AsString      := 'X';
              end;
            end;
            qryHistorico.Open;
            data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
            Body.Add('<html><body>');
            Body.Add('<br><font color=''black'' face=''verdana'' size=''2pt''><b>' + FieldByName('NM_PENDENCIA').AsString + '</b></font><br><br>');
            Body.Add('<font color=''red'' face=''verdana'' size=''2pt''><b>');
            Body.Add('&nbsp;(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
            Body.Add('</b></font><br>');
            while not qryHistorico.Eof do
            begin
              Body.Add('<br>');
              if data_aux <> FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) then
              begin
                Body.Add('<font color=''red'' face=''verdana'' size=''2pt''><b>');
                Body.Add('&nbsp;(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
                Body.Add('</b></font>');
                Body.Add('<br><br>');
              end;
              Body.Add('<font color='''+ IfThen(qryHistoricoTP_TEXTO.AsString = 'I', 'black','#008080') +''' face=''verdana'' size=''2pt''><b>');
              Body.Add('&nbsp;&nbsp;&nbsp;(' + FormatDateTime('hh:nn:ss', qryHistoricoDT_TEXTO.AsDateTime) + ') ' + qryHistoricoNM_USUARIO.AsString  + ':');
              Body.Add('</b><br>');
              Body.Add('&nbsp;&nbsp;&nbsp;' + StringReplace(StringReplace(qryHistoricoNM_TEXTO.Value, #10, '', [rfReplaceAll]),#13,'<br>&nbsp;&nbsp;&nbsp;',[rfReplaceAll]));
              Body.Add('</font>');
              data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
              Body.Add('<br>');
              qryHistorico.Next;
            end;
          Next;
          end;
        end;
        Body.Add('</body></html>');
        {From.Text                 := ConsultaLookUPSQL('SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO ='''+ str_cd_usuario+'''','NM_EMAIL');
        Recipients.EMailAddresses := edt_para.Text;
        Subject                   := edt_assunto.Text;
      end;
      IdSMTP1.Host := 'mail.indaialogistica.com.br';
      IdSMTP1.Port := 25;
      IdSMTP1.Connect;
      try
        IdSMTP1.Send(IdMessage1);
        btn_email_cancelar.Click;
      except
        ShowMessage('O email não foi enviado.');
      end;
      IdSMTP1.Disconnect;
      IdMessage1.MessageParts.Clear;
      IdMessage1.Clear;}
      GSMLIB.EnviaEmailHtmlDe(edt_assunto.Text, Body.Text, edt_para.Text, ConsultaLookUPSQL('SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO ='''+ str_cd_usuario+'''','NM_EMAIL'));
      btn_email_cancelar.Click;
    end
    else
    if pnl_historico_email.Tag = 3 then
    begin

      qryHistorico.Close;
      qryHistorico.ParamByName('CD_PENDENCIA').AsInteger   := qryPendenciasGridCD_PENDENCIA.AsInteger;
      qryHistorico.ParamByName('NR_PROCESSO').AsString     := qryPendenciasGridNR_PROCESSO.AsString;
      qryHistorico.ParamByName('NR_REFERENCIA').AsString   := qryPendenciasGridNR_REFERENCIA.AsString;
      qryHistorico.ParamByName('NR_ITEM_CLIENTE').AsString := qryPendenciasGridNR_ITEM_CLIENTE.AsString;
      qryHistorico.ParamByName('NR_PARCIAL').AsInteger     := qryPendenciasGridNR_PARCIAL.AsInteger;
      qryHistorico.ParamByName('CD_EMPRESA').AsString      := qryPendenciasGridCD_EMPRESA.AsString;
      qryHistorico.Open;
      qryHistorico.first;

      Pedidos := ConsultaLookUPSQL(' SELECT ' +
                                   ' Cast(ISNULL(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) ' +
                                   '                    FROM TREF_CLIENTE R WITH (NOLOCK) ' +
                                   '                    WHERE R.NR_PROCESSO   = TP.NR_PROCESSO ' +
                                   '                    AND R.TP_REFERENCIA = ''01'' ' +
                                   '          FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS PEDIDOS ' +
                                   ' FROM TPROCESSO TP ' +
                                   ' WHERE TP.NR_PROCESSO = ' + QuotedStr(qryPendenciasGridNR_PROCESSO.AsString)
                                    ,'PEDIDOS');

      data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
      Body.Add('<html><body>');
      Body.Add('<font color=''red'' face=''verdana'' size=''2pt''><b>');
      Body.Add('&nbsp;(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
      Body.Add('</b></font><br>');

      Body.Add('<br>');
      Body.Add('<font color=''black'' face=''verdana'' size=''2pt''>');
      Body.Add('&nbsp;&nbsp;' + StringReplace(StringReplace('Pedidos: ' + Pedidos, #10, '', [rfReplaceAll]),#13,'<br>&nbsp;&nbsp;&nbsp;',[rfReplaceAll]));
      Body.Add('</font>');
      Body.Add('<br>');

      while not qryHistorico.Eof do
      begin
        Body.Add('<br>');
        if data_aux <> FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) then
        begin
          Body.Add('<font color=''red'' face=''verdana'' size=''2pt''><b>');
          Body.Add('&nbsp;(' + FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime) + ')');
          Body.Add('</b></font>');
          Body.Add('<br><br>');
        end;
        Body.Add('<font color='''+ IfThen(qryHistoricoTP_TEXTO.AsString = 'I', 'black','#008080') +''' face=''verdana'' size=''2pt''><b>');
        Body.Add('&nbsp;&nbsp;&nbsp;(' + FormatDateTime('hh:nn:ss', qryHistoricoDT_TEXTO.AsDateTime) + ') ' + qryHistoricoNM_USUARIO.AsString  + ':');
        Body.Add('</b><br>');
        Body.Add('&nbsp;&nbsp;&nbsp;' + StringReplace(StringReplace(qryHistoricoNM_TEXTO.Value, #10, '', [rfReplaceAll]),#13,'<br>&nbsp;&nbsp;&nbsp;',[rfReplaceAll]));
        Body.Add('</font>');
        data_aux := FormatDateTime('dd/mm/yyyy', qryHistoricoDT_TEXTO.AsDateTime);
        Body.Add('<br>');
        qryHistorico.Next;
      end;
      Body.Add('</body></html>');
      emailRemetente    := ConsultaLookUPSQL('SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO ='''+ str_cd_usuario+'''','NM_EMAIL');
      emailDestinatario := ConsultaLookUPSQL('SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO ='''+ qryPendenciasGridCD_USUARIO_CONTATO.AsString+'''','NM_EMAIL');edt_para.Text;
      Titulo            := qryPendenciasGridNR_PROCESSO.AsString + ' - Nova pendência (' + qryPendenciasGridNM_PENDENCIA.AsString +')';

      GSMLIB.EnviaEmailHtmlDe(Titulo, Body.Text, emailDestinatario, emailRemetente);
    end;
  finally
    FreeAndNil(Body);
  end;
end;

procedure Tfrm_pendencias.qryPendenciasGridAfterCancel(DataSet: TDataSet);
begin
  btn_incluir.Enabled       := True;
  btn_salvar.Enabled        := False;
   rxle_nm_pendencia.KeyValue := '';
  //  rxle_nm_pendencia.Text    := '';
  rxle_nm_pendencia.Enabled := False;
end;

procedure Tfrm_pendencias.dbg_pendenciasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_STATUS').AsString = '5' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00E9E9FE;
  end;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_STATUS').AsString = '4' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00CCF5C9;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_pendencias.lbl_paraClick(Sender: TObject);
var
  vRetornoFuncao : string;
begin
  vRetornoFuncao := OpenAddressBook(361,388);
  if vRetornoFuncao <> '' then
    edt_para.Text := edt_para.Text + vRetornoFuncao + ';';
end;

procedure Tfrm_pendencias.qryPendenciasGridCalcFields(DataSet: TDataSet);
begin
  if qryPendenciasGrid.State <> dsInsert then
  begin
    case qryPendenciasGridCD_STATUS.AsInteger of
      1: qryPendenciasGridCALC_NOME_USUARIO.AsString := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO ='''+ qryPendenciasGridCD_USUARIO_CRIADOR.AsString+'''','NM_USUARIO');
      2: qryPendenciasGridCALC_NOME_USUARIO.AsString := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO ='''+ qryPendenciasGridCD_USUARIO_SOLICITANTE.AsString+'''','NM_USUARIO');
      3: qryPendenciasGridCALC_NOME_USUARIO.AsString := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO ='''+ qryPendenciasGridCD_USUARIO_RESPOSTA_SOLICITA.AsString+'''','NM_USUARIO');
      4: qryPendenciasGridCALC_NOME_USUARIO.AsString := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO ='''+ qryPendenciasGridCD_USUARIO_FINALIZACAO.AsString+'''','NM_USUARIO');
      5: qryPendenciasGridCALC_NOME_USUARIO.AsString := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO ='''+ qryPendenciasGridCD_USUARIO_CANCELAMENTO.AsString+'''','NM_USUARIO');
    end;
    qryPendenciasGridCALC_NOME_CONTATO.AsString := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO ='''+ qryPendenciasGridCD_USUARIO_CONTATO.AsString+'''','NM_USUARIO');
  end;
end;

procedure Tfrm_pendencias.btn_proc_realizaClick(Sender: TObject);
begin
  Close;
  //if qryPendenciasGridNR_PROCESSO.AsString = 'X' then
  if Trim(nr_po_gestao) <> '' then
  begin
    if frm_po_flp = nil then
      Application.CreateForm(Tfrm_po_flp, frm_po_flp);
    cd_unid_neg_gestao := ConsultaLookUPSQL('SELECT CD_UNID_NEG FROM TPROCESSO WHERE NR_REFERENCIA ='''+ qryPendenciasGridNR_REFERENCIA.AsString+'''','CD_UNID_NEG');
    nr_po_gestao       := qryPendenciasGridNR_REFERENCIA.AsString;
    if frm_po_flp.Showing then
      frm_po_flp.OnShow(frm_po_flp)
    else
    begin
      frm_po_flp.ShowModal;
      FreeAndNil(frm_po_flp);
    end;
  end
  else
  begin
    if frm_followup = nil then
      Application.CreateForm(Tfrm_followup, frm_followup);
    frm_followup.pesq_cd_unid_neg := cd_unid_neg_gestao;
    frm_followup.pesq_cd_prod     := cd_prod_gestao;
    frm_followup.pesq_nr_proc     := qryPendenciasGridNR_PROCESSO.AsString;
    if frm_followup.Showing then
      frm_followup.OnShow(frm_followup)
    else
    begin
      frm_followup.ShowModal;
      FreeAndNil(frm_po_flp);
    end;
  end;
end;

procedure Tfrm_pendencias.btn_co_contatoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    with qryAuxProcesso do
    begin
      edt_co_contato.Text := ConsultaOnLineExSQL(' SELECT DISTINCT C.CD_USUARIO, C.NM_CONTATO ' +
                                                 ' FROM TCLIENTE_CONTATO C (NOLOCK) ' +
                                                 ' WHERE C.CD_PRODUTO = ''' + FieldByName('CD_PRODUTO').AsString + ''' ' +
                                                 '   AND C.CD_UNID_NEG = ''' + FieldByName('CD_UNID_NEG').AsString + ''' ' +
                                                 '   AND C.CD_CLIENTE = ''' + FieldByName('CD_CLIENTE').AsString + ''' ' +
                                                 '   AND C.CD_USUARIO IS NOT NULL','Contatos',['CD_USUARIO','NM_USUARIO'],['Código','Descrição'],'CD_USUARIO');
    end;
  end
  else
    dbedt_nm_contato.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', edt_co_contato.Text,'NM_USUARIO')
end;

procedure Tfrm_pendencias.btn_incluir_contatoClick(Sender: TObject);
begin
  if dbedt_nm_contato.Text <> '' then
  begin
    if Pos(edt_co_contato.Text, nm_contatos) = 0 then
    begin
      lbContatos.AddItem(dbedt_nm_contato.Text, TObject(Integer(StrToInt(edt_co_contato.Text))));
      nm_contatos := nm_contatos + Trim(edt_co_contato.Text) + ';';
      edt_co_contato.Text := '';
    end
    else
      ShowMessage('ATENÇÃO: Este contato já foi selecionado!');
    if lbContatos.Count > 0 then
      btn_excluir_contato.Enabled := True;
  end
  else
    ShowMessage('ATENÇÃO: Primeiramente, escolha um contato!');
end;

procedure Tfrm_pendencias.btn_excluir_contatoClick(Sender: TObject);
var
  Cod: Integer;
begin
  if lbContatos.ItemIndex > -1 then
  begin
    Cod := Integer(lbContatos.Items.Objects[lbContatos.ItemIndex]);
    nm_contatos := StringReplace(nm_contatos, FormataFloat('0000', Cod) + ';', '',[rfReplaceAll]);
    lbContatos.DeleteSelected;
    if lbContatos.Count = 0 then
      btn_excluir_contato.Enabled := False;
  end
  else
    ShowMessage('ATENÇÃO: Primeiramente, selecione um contato na lista!');
end;

function Tfrm_pendencias.Split(AText, ADelimiter: String): TStringArray;
var
  S: String;
  P, DL: Integer;
begin
  SetLength(Result, 0);
  AText := Trim(AText);
  DL := Length(ADelimiter) - 1;
  while (AText <> '') do
  begin
    P := Pos(ADelimiter, AText);
    if P < 1 then
      P := Length(AText) + 1;
    S := Trim(Copy(AText, 1, P - 1));
    Delete(AText, 1, P + DL);
    if S <> '' then
    begin
      SetLength(Result, High(Result) + 2);
      Result[High(Result)] := S;
    end;
  end;
end;

end.
