program email_custo;

uses
  Classes,
  Forms,
  Dialogs,
  ComCtrls,
  Db,
  FileText,
  isp3,
  SysUtils,
  DBTables;

{$R *.RES}

function JustificaString(Campo : String; Tamanho : Integer): String;
var
  cTexto: String;
  i: Integer;
begin
  ctexto:='';
  for i:= length( campo ) + 1 to tamanho do
     ctexto := ctexto + ' ';

  result := campo + ctexto;
end;

function FormataCampo( campo: tfield ): string;
begin
  result:=JustificaString(campo.value,campo.Size);
end;


var
    db_broker: TDatabase;
    qry_ddimport_custo_: TQuery;
    qry_cliente_contato_: TQuery;
    smtp: TSMTP;
    email_cliente : string[50];
    nome_arquivo  : string[25];
    str_txt       : string;
    Arquivo_01    : TFileText;
    Arquivo_02    : TStringList;
    ArquivoCAB    : TStringList;
    ArquivoROD    : TStringList;
begin
  Application.Initialize;
  db_broker:= TDatabase.Create(application);
  with db_broker do
  begin
      AliasName := 'BROKER';
      DatabaseName := 'DBBROKER';
      LoginPrompt := False;
      Params.Add('USER NAME=SA');
      Params.Add('PASSWORD=123');
      Connected := True;
  end;

  qry_ddimport_custo_:= TQuery.Create(application);
  qry_ddimport_custo_.DatabaseName := 'DBBROKER';
  qry_ddimport_custo_.SQL.text := 'SELECT * FROM TEMAIL_DDIMPORT_CUSTO';

  qry_cliente_contato_:= TQuery.Create(application);
  qry_cliente_contato_.DatabaseName := 'DBBROKER';
  qry_cliente_contato_.SQL.text     := 'SELECT TOP 1 ISNULL( NM_EMAIL, '#39#39' )  AS EMAIL_CLIENTE' +
                                       '  FROM TCLIENTE_CONTATO '                                    +
                                       'WHERE CD_CLIENTE = '#39'00023'#39' AND'                      +
                                       '               IN_EDI     = 1 ';
  smtp:= TSMTP.Create(application);


  /// INICIO

  db_broker.Connected := true;

  // captura o email do responsavel na ctx
  qry_cliente_contato_.Close;
  qry_cliente_contato_.Prepare;
  qry_cliente_contato_.Open;
  email_cliente := qry_cliente_contato_.FieldByName('EMAIL_CLIENTE').AsString;
  qry_cliente_contato_.Close;

  //gera arquivo para se enviado por email
  qry_ddimport_custo_.Close;
  qry_ddimport_custo_.Prepare;
  qry_ddimport_custo_.Open;

  if qry_ddimport_custo_.RecordCount > 0 then
  begin
    //nome do arquivo
    nome_arquivo := 'custo_'+ FormatDateTime('ddmmyyyy', date() - 1 )  + '.txt' ;

    Arquivo_01      := TFileText.Create;
    Arquivo_01.Name := 'n:\custo\' + nome_arquivo ;
    Arquivo_01.CreateFile;

    qry_ddimport_custo_.First;
    while not qry_ddimport_custo_.EOF do
    begin
      str_txt := '';

      str_txt:=FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_DI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_PEDIDO'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('TX_CAMBIO_REG_DI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_ITEM_PEDIDO'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_FATURA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('CD_PRODUTO'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('QTDE'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_FOB_ITEM_MNEG'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_1'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_SEGURO'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_CPMF'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_2'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_3'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_4'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_II'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_IPI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_ICMS'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_FRETE'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_5'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_DESPESAS_FIN'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_6'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_7'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('DT_FATURA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('SL_MOEDA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('DT_NF_SERVICO_DESP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_NF_SERVICO_DESP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_NF_SERVICO_DESP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('DT_VENCTO_NF_SERVICO_DESP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_IRRF_DESP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_8'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_9'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_ADICAO_DI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_10'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('REF_DESP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_11'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_TX_SISCOMEX'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_ARMAZENAGEM'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_SDA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_NF_ENTRADA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('RESERVA_12'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_MULTA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('TP_FRETE'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('REF_EMB_DDIMPORT'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_FRETE_ROD'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_MARINHA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_CAPATAZIA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_REMOCAO_DAP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_TX_LIB_BL'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_TX_DESC'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_SERV_ADUAN'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_DECEX_LI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_FITP'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_LAUDO_TECN'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_MOV_PRI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_MOV_RETRO'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_CAUCAO_CNTR'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_DESPESA_1'));

      //Arquivo_01.Write(pchar( str_txt ));
      //str_txt := '';

      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_DESPESA_2'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_DESPESA_3'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_OUTRAS_DESPESA'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_TX_CAMBIO_FRETE_DI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_TX_CAMBIO_SEGURO_DI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_TX_CAMBIO_DOLAR_DI'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('DT_FECHAMENTO'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('NR_ITEM_EMBARQUE'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('CD_DELIVERY_NOTE'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_BASE_CALCULO_PIS_COFINS'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_PIS'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_COFINS'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_PIS_ARMAZENAGEM'));
      str_txt := str_txt + FORMATACAMPO(qry_ddimport_custo_.Fieldbyname('VL_COFINS_ARMAZENAGEM'));
      str_txt := str_txt + #13#10;

      Arquivo_01.Write(pchar( str_txt ));

      qry_ddimport_custo_.Next;
    end;


    Arquivo_01.Close;
    Arquivo_01.Free;

    smtp.Blocking := true;
    smtp.RemoteHost := 'mail.indaialogistica.com.br';
    smtp.RemotePort := 25;
    smtp.Connect( smtp.RemoteHost, smtp.RemotePort );
    smtp.DocInput.Headers.Clear;
    smtp.DocInput.Headers.add('From', 'suporte@indaialogistica.com.br');
    smtp.DocInput.Headers.Add('To', email_cliente );
    smtp.DocInput.Headers.Add('Subject','DDImport Custo');
    smtp.DocInput.Headers.Add('Content-Type','multipart/mixed; boundary="----=_NextPart_000_000F_01C430F7.BC8EFF80"');

    arquivoCAB := TStringList.Create;
    arquivoCAB.Add('------=_NextPart_000_000F_01C430F7.BC8EFF80');
    arquivoCAB.Add('Content-Type: text/plain;');
    arquivoCAB.Add('	name="' + nome_arquivo  + '"');
    arquivoCAB.Add('Content-Transfer-Encoding: quoted-printable');
    arquivoCAB.Add('Content-Disposition: attachment;');
    arquivoCAB.Add('	filename="' + nome_arquivo  + '"');
    arquivoCAB.Add('');

    arquivoROD := TStringList.Create;
    arquivoROD.Add('');
    arquivoROD.Add('------=_NextPart_000_000F_01C430F7.BC8EFF80--');


    Arquivo_02:=TStringList.Create;
    Arquivo_02.LoadFromFile('N:\custo\' + nome_arquivo );

    smtp.SendDoc( null, smtp.DocInput.Headers,arquivoCAB.text + Arquivo_02.Text + arquivoROD.text, null, null);
    smtp.Quit;
    smtp.Blocking := false;
  end
  else
  begin
    smtp.Blocking := true;
    smtp.RemoteHost := 'mail.indaialogistica.com.br';
    smtp.RemotePort := 25;
    smtp.Connect( smtp.RemoteHost, smtp.RemotePort );
    smtp.DocInput.Headers.Clear;
    smtp.DocInput.Headers.Add('Subject','Arquivo de Entrada DDImport Custo');
    smtp.DocInput.Headers.add('From', 'suporte@indaialogistica.com.br');
    smtp.DocInput.Headers.Add('To', email_cliente );
    smtp.SendDoc( null, smtp.DocInput.Headers, 'No dia '+ FormatDatetime('dd/mm/yyyy', date() - 1 ) + ' não houve nenhum processo.', null, null );
    smtp.Quit;
    smtp.Blocking := false;
  end;


  qry_ddimport_custo_.Close;

  // FIM
  
  db_broker.Connected := false;
  //encerra o aplicativo e volta para a stored procedure

  Application.Run;
end.
