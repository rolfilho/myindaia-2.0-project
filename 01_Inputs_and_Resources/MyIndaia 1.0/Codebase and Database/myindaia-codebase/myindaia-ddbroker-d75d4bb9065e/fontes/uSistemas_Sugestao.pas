unit uSistemas_Sugestao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, DBCtrls, ExtCtrls, Buttons,
  StdCtrls, Mask, DateUtils, ADODB , IdMessage ,IdSMTP, jpeg ;

type

  Tfrm_dicas_sugestao = class(TForm)
    edt_titulo: TEdit;
    qry_ult_preOcor_: TQuery;
    qry_ult_preOcor_nr_ocor: TStringField;
    qry_preOcorrencia: TQuery;
    mem_dica: TMemo;
    qry_ult_ocor_: TQuery;
    qry_pendente_: TQuery;
    qry_pendente_CD_OCORRENCIA: TStringField;
    qry_pendente_CD_USUARIO: TStringField;
    qry_pendente_DT_ABERTURA: TDateTimeField;
    qry_pendente_DT_FINALIZACAO: TDateTimeField;
    qry_pendente_CD_CAMINHO_1: TStringField;
    qry_pendente_CD_CAMINHO_2: TStringField;
    qry_pendente_CD_CAMINHO_3: TStringField;
    qry_pendente_CD_CAMINHO_4: TStringField;
    qry_pendente_CD_CAMINHO_5: TStringField;
    qry_pendente_NM_MOTIVO: TMemoField;
    qry_pendente_CD_STATUS: TStringField;
    qry_pendente_CD_DELEGADO: TStringField;
    qry_pendente_NM_PRIORIDADE: TStringField;
    qry_pendente_NM_COMENT: TMemoField;
    qry_pendente_NM_PRIORIDADE_S: TStringField;
    qry_pendente_DT_DURACAO: TStringField;
    qry_pendente_DT_ULT_MODIF: TDateTimeField;
    qry_pendente_CD_OCOR_ORIGEM: TStringField;
    qry_pendente_TX_TITULO: TStringField;
    qry_pendente_IN_PROCESSO_PARADO: TIntegerField;
    qry_pendente_TX_JUSTIFICA_RETRAB: TStringField;
    qry_pendente_TX_JUSTIFICA_ATRASO: TStringField;
    qry_pendente_QT_MINUTOS_GASTOS: TIntegerField;
    qry_ult_ocor_nr_ocor: TStringField;
    qry_ult_ocor_ano_ocor: TStringField;
    qry_preOcorrenciaCD_OCORRENCIA: TStringField;
    qry_preOcorrenciaCD_USUARIO: TStringField;
    qry_preOcorrenciaDT_ABERTURA: TDateTimeField;
    qry_preOcorrenciaDT_FINALIZACAO: TDateTimeField;
    qry_preOcorrenciaCD_CAMINHO_1: TStringField;
    qry_preOcorrenciaCD_CAMINHO_2: TStringField;
    qry_preOcorrenciaCD_CAMINHO_3: TStringField;
    qry_preOcorrenciaNM_MOTIVO: TMemoField;
    qry_preOcorrenciaCD_STATUS: TStringField;
    qry_preOcorrenciaCD_OCORRENCIA_SUPORTE: TStringField;
    qry_preOcorrenciaIN_URGENTE: TStringField;
    Panel1: TPanel;
    Shape1: TShape;
    btn_confirmar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape2: TShape;
    SpeedButton1: TSpeedButton;
    Shape3: TShape;
    btn_sugestao: TSpeedButton;
    Shape4: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btn_fecharClick(Sender: TObject);
    procedure qry_preOcorrenciaAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
    procedure btn_sugestaoClick(Sender: TObject);
    


  private
    { Private declarations }
  public
    cdusuario : String;
  end;

var
  frm_dicas_sugestao: Tfrm_dicas_sugestao;

implementation

uses PGGP003, PGSM209, PGGP017, ConsOnLineEx, Funcoes ,
  uSistemas_Cadastro_Sugestao;

{$R *.dfm}

procedure Tfrm_dicas_sugestao.btn_fecharClick(Sender: TObject);
begin
close;
end;

  procedure EnviaEmailSuporte(pCdOcorrencia, vUrgente, vTI: String);
var
  idMessage1 : TIdMessage;
  idSMTP1 : TIdSMTP;
  vMotivo, vCaminho : String;
begin
  idMessage1 := TIdMessage.Create(Application);
  idSMTP1 := TIdSMTP.Create(Application);

  with idMessage1 do
  begin
    ContentType := 'text/html';
    Body.Add('<html>');
    Body.Add('<body><font face = "Bitstream Vera Sans" size = 2>');
    if vTI = '1' then
    begin
      vMotivo := ConsultaLookUP('suporte.dbo.TOCORRENCIA','CD_OCORRENCIA', pCdOcorrencia, 'NM_MOTIVO');
      Body.Add('<p><b>Ocorrencia Enviada ao Suporte: ' + Copy(pCdOcorrencia, 1, 6) + '/' + Copy(pCdOcorrencia, 7, 8) + '</p>');
    end
    else
    begin
      vMotivo := ConsultaLookUP('suporte.dbo.TPRE_OCORRENCIA','CD_OCORRENCIA', pCdOcorrencia, 'NM_MOTIVO');
      Body.Add('<p><b>Nova Ocorrencia Criada: ' + Copy(pCdOcorrencia, 1, 8) + '/' + Copy(pCdOcorrencia, 9, 10) + '</p>');
    end;
    Body.Add('<p><b>Motivo: ' + vMotivo + '</p>');
    Body.Add('<br><p><i>Este é um email gerado automaticamente pelo MyHelpDesk.</i></p>');
    Body.Add('</font></body></html>');

    From.Text := 'ti@myindaia.com.br';
    ReplyTo.EMailAddresses := 'ti@myindaia.com.br';

    vCaminho := ConsultaLookUP('suporte.dbo.TPRE_OCORRENCIA', 'CD_OCORRENCIA', pCdOcorrencia,'CD_CAMINHO_1');
    if vCaminho = '02' then
      Recipients.EMailAddresses := ConsultaLookUPSQL('SELECT TX_EMAIL_SUPORTE FROM suporte.dbo.TPARAMETRO', 'TX_EMAIL_SUPORTE')
    else
      Recipients.EMailAddresses := ConsultaLookUPSQL('SELECT TX_EMAIL_DESENVOLVIMENTO FROM suporte.dbo.TPARAMETRO', 'TX_EMAIL_DESENVOLVIMENTO');

    if Length(ConsultaLookUP('suporte.dbo.TOCORRENCIA_TI', 'CD_OCORRENCIA', pCdOcorrencia,'NM_MOTIVO')) > 30 then
      vMotivo := Copy(ConsultaLookUP('suporte.dbo.TPRE_OCORRENCIA', 'CD_OCORRENCIA', pCdOcorrencia,'NM_MOTIVO') , 1, 30) + '...'
    else
      vMotivo := Copy(ConsultaLookUP('suporte.dbo.TPRE_OCORRENCIA', 'CD_OCORRENCIA', pCdOcorrencia,'NM_MOTIVO') , 1, 30);

  if vUrgente = '1' then
    Subject := '[URGENTE] Nova Ocorrencia: ' + Copy(pCdOcorrencia, 1, 8) + '/' + Copy(pCdOcorrencia, 9, 10) + ': ' + vMotivo
  else
    Subject := 'Nova Ocorrencia: ' + Copy(pCdOcorrencia, 1, 8) + '/' + Copy(pCdOcorrencia, 9, 10) + ': ' + vMotivo;
  end;

  idSMTP1.Host := 'mail.indaialogistica.com.br';
  idSMTP1.Port := 25;
  IdSMTP1.Connect;
  try
    idSMTP1.Send(idMessage1)
  except
    ShowMessage('O e-mail não foi enviado.');
  end;
  idSMTP1.Disconnect;
  idMessage1.MessageParts.Clear;
  idMessage1.Clear;
end;

function  codigo(qry: TQuery; cod: string; qt: integer): string;
var cd: string;
begin
  try
    try
      if cod = '' then cod := '0';
      cd := IntToStr(StrToInt(cod) + 1);
    except
      cd := '';
    end;

    while length(cd) < qt do
          cd := '0' + cd;
    codigo := cd;
  except
    ShowMessage('Não foi possível incluir este regsistro !');
    qry.Cancel;
  end;
end;

procedure Tfrm_dicas_sugestao.qry_preOcorrenciaAfterPost(
  DataSet: TDataSet);
begin
  qry_preOcorrencia.ApplyUpdates;
end;

procedure Tfrm_dicas_sugestao.FormShow(Sender: TObject);
begin
mem_dica.Text:='';
end;

procedure Tfrm_dicas_sugestao.btn_confirmarClick(Sender: TObject);
var
  vCdPreOcorrencia, vCdOcorrencia : string;
begin

  if (trim(edt_titulo.Text) <> '')  or (trim(mem_dica.Text) <> '')  then
  begin
    qry_ult_preOcor_.Close;
    qry_ult_preOcor_.Open;
    //Criar Pré Ocorrencia
    vCdPreOcorrencia :=  codigo(qry_preOcorrencia,qry_ult_preOcor_nr_ocor.AsString,8) + FormatDateTime('YY', now);
    FastExecSQL(' INSERT INTO INDAIA10.suporte.dbo.TPRE_OCORRENCIA(CD_OCORRENCIA, CD_USUARIO, DT_ABERTURA, DT_FINALIZACAO, CD_CAMINHO_1, '+
                ' CD_CAMINHO_2, CD_CAMINHO_3, NM_MOTIVO, CD_STATUS, CD_OCORRENCIA_SUPORTE, IN_URGENTE)' +
                ' VALUES ('''+ vCdPreOcorrencia +''', '+
                ' '''+str_cd_usuario+''', GETDATE(), NULL,  ''01'', ''001'', ''0001'',''Essa Ocorrencia e uma dica''+''/''+''Titulo''+''-''+''(''+'''+edt_titulo.Text+'''+'')'' +''Dica''+''-''+''(''+'''+mem_dica.Text+'''+'')'', ''0012'', NULL, 0) ');

    // Criar Ocorrencia
    qry_ult_ocor_.Close;
    qry_ult_ocor_.Open;

    if (qry_ult_ocor_nr_ocor.IsNull) or (qry_ult_ocor_ano_ocor.AsInteger < StrToInt(FormatDateTime('YY', now)) ) then
      vCdOcorrencia:= '00001' + FormatDateTime('YY', now)
    else
      vCdOcorrencia:= codigo(qry_pendente_, qry_ult_ocor_nr_ocor.AsString, 5) + FormatDateTime('YY', now);
      //vCdOcorrencia := codigo(qry_pendente_, qry_ult_ocor_nr_ocor.AsString, 5) + FormatDateTime('YY', now);

    FastExecSQL(' INSERT INTO INDAIA10.suporte.dbo.TOCORRENCIA(CD_OCORRENCIA, CD_USUARIO, DT_ABERTURA, CD_CAMINHO_1, '+
                '  CD_CAMINHO_2, CD_CAMINHO_3, NM_MOTIVO, CD_STATUS, CD_DELEGADO, TX_TITULO)' +
                ' VALUES ('''+vCdOcorrencia+''', '''+str_cd_usuario+''', GETDATE(),''01'', ''001'', ''0001'', '+
                ' ''Essa Ocorrencia e uma dica''+''/''+''Titulo''+''-''+''(''+'''+edt_titulo.Text+'''+'')'' +''Dica''+''-''+''(''+'''+mem_dica.Text+'''+'')'', ''0012'', ''0013'','''+edt_titulo.text+''' ) ');

    // Atualiza PreOcorrencia com o nº da Ocorrencia
    FastExecSQL('UPDATE INDAIA10.SUPORTE.DBO.TPRE_OCORRENCIA '+
                ' SET CD_STATUS=''0013'',CD_OCORRENCIA_SUPORTE= '''+ vCdOcorrencia +''',DT_ABERTURA = GETDATE() '+
                'WHERE CD_OCORRENCIA = '+vCdPreOcorrencia+' ');
    // Envia Email
    EnviaEmailSuporte(vCdPreOcorrencia, '0', '0');
    edt_titulo.Text:='';
    mem_dica.Text:='';
    Close;
  end
  else
  begin
    ShowMessage('É obrigatório o preenchimento de todos os campos!');
  end;
end;

procedure Tfrm_dicas_sugestao.btn_sugestaoClick(Sender: TObject);
begin
  Close;
end;

end.
