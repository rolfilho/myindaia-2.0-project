unit uRelIntegradoDrawback;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils,
  UCRPE32, StdCtrls, Mask, Buttons, ExtCtrls, Funcoes, DB, DBTables, Excel2000, OleServer, ComObj;

type
  Tfrm_rel_integrado_drawback = class(TForm)
    Panel1: TPanel;
    btn_geraplanilha: TButton;
    btn_fechar: TButton;
    mskedt_periodo_final: TMaskEdit;
    Label2: TLabel;
    mskedt_periodo_inicial: TMaskEdit;
    Label3: TLabel;
    mskedt_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_cd_empresa: TSpeedButton;
    lbl_cd_cliente: TLabel;
    mskedt_cd_unid_neg: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    Shape1: TShape;
    Label4: TLabel;
    Shape2: TShape;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_empresaClick(Sender: TObject);
    procedure btn_geraplanilhaClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure mskedt_periodo_inicialExit(Sender: TObject);
    procedure mskedt_periodo_finalExit(Sender: TObject);
    procedure mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure mskedt_cd_clienteExit(Sender: TObject);
  private
    vCorAux :Integer;
  public
    { Public declarations }
  end;

var
  frm_rel_integrado_drawback: Tfrm_rel_integrado_drawback;

implementation

uses PGGP001, PGSM018, PGSM010, PGSM024, PGFT024, GSMLIB, PGGP017, PGSM105, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_rel_integrado_drawback.btn_cd_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    mskedt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG');
  End;
end;

procedure Tfrm_rel_integrado_drawback.btn_cd_empresaClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    mskedt_cd_cliente.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','AP_EMPRESA'],['Código','Apelido'],'CD_EMPRESA',nil);
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', mskedt_cd_cliente.Text,'AP_EMPRESA');
  End;
end;

procedure Tfrm_rel_integrado_drawback.btn_geraplanilhaClick(Sender: TObject);

  procedure Pinta(PosicaoAtual, NumCols :Integer; oSheet: OleVariant);
  var I: integer;
  begin
    if vCorAux = 34 then
      vCorAux := 35
    else vCorAux := 34;
    for I := 1 to NumCols do oSheet.Cells[PosicaoAtual,I].Interior.ColorIndex := vCorAux;
  end;

var
  nLinha, I :Integer;
  Excel, xlWorkB1, oSheet :OleVariant;
  AuxQ, AuxQaditivo :TQuery;
  Periodo, Cliente, Aditivos :String;
begin
  Periodo  := '';
  Cliente  := '';
  Aditivos := '';
  if Trim(mskedt_cd_unid_neg.text) = '' then
  begin
    BoxMensagem('A unidade é obrigatória!',2);
    mskedt_cd_unid_neg.setfocus;
    exit;
  end;
  if not ((Trim(mskedt_periodo_inicial.text) = '/  /') and (Trim(mskedt_periodo_final.text) = '/  /')) then
  begin
    if StrToDate(mskedt_periodo_inicial.text) > StrToDate(mskedt_periodo_final.text) then
    begin
      BoxMensagem('O período inicial não pode ser maior que o período final!',2);
      mskedt_periodo_final.setfocus;
      exit;
    end;
    Periodo := ' AND DT_VIGENCIA BETWEEN '+QuotedStr(mskedt_periodo_inicial.Text)+' AND '+QuotedStr(mskedt_periodo_final.Text);
  end;
  if not (Trim(mskedt_cd_cliente.Text) = '')then
    Cliente := ' AND P.CD_CLIENTE = '+QuotedStr(mskedt_cd_cliente.Text);

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  AuxQ := TQuery.Create(Self);
  with AuxQ do
  begin
    DatabaseName := datm_main.db_broker.DataBaseName;
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT P.NR_PROCESSO,(SELECT E.NM_EMPRESA FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = P.CD_CLIENTE) CLIENTE,'+#13+
                '(SELECT SUM(FI.VL_FOB) FROM TFORECAST_IMP FI where FI.NR_FORECAST = F.NR_FORECAST) VALOR_FOB,'+#13+
                '(SELECT TPAC.NM_TP_SIT_ATO_CONC FROM TTP_SIT_ATO_CONC TPAC WHERE TPAC.TP_SIT_ATO_CONC = ACS.TP_SIT_ATO_CONC) SITUACAO_AC,'+#13+
                'ACS.NR_ATO_CONC,CONVERT(varchar,ACS.DT_VIGENCIA,103) DT_VIGENCIA,MAX(ACA.DT_VENCTO) DT_VENCTO,'+#13+
                'CONVERT(varchar,ACS.DT_VENCTO_FINAL,103) DT_VENCTO_FINAL, 4-COUNT(NR_ADITIVO) NR_PRORROGACOES'+#13+
                'FROM TATO_CONC_SUSP ACS, TFORECAST F, TPROCESSO P, TATO_CONC_ADITIVO ACA'+#13+
                'WHERE ACS.NR_FORECAST = F.NR_FORECAST AND P.NR_PROCESSO = F.NR_PROCESSO AND P.CD_UNID_NEG = :CD_UNID_NEG'+Periodo+Cliente+#13+
                'AND ACS.DT_BAIXA_FINAL IS NULL AND P.CD_PRODUTO = ''15'' AND ACA.NR_FORECAST =* F.NR_FORECAST AND ACS.TP_DRAWBACK = ''0'''+#13+
                'GROUP BY P.NR_PROCESSO,P.CD_CLIENTE,F.NR_FORECAST,ACS.TP_SIT_ATO_CONC,ACS.NR_ATO_CONC,ACS.DT_VIGENCIA,ACS.DT_VENCTO_FINAL';
    Params[0].AsString := mskedt_cd_unid_neg.Text;
    Prepare;  
    Open;
    if IsEmpty then
    begin
      BoxMensagem('Não foram encontrados DrawBacks Suspensão. Verifique os dados informados e tente novamente.',2);
      Screen.Cursor := crDefault;
    end
    else
      First;

    try
      Excel := CreateOLEObject('Excel.Application');
      xlWorkB1 := Excel.Workbooks.Open('C:\ddbroker\Relatório Integrado de Drawback.xls');
      Excel.ActiveWorkBook.SaveAs('C:\Rel_Integrado_Drawback_'+Copy(DateToStr(DATE()),1,2)+Copy(DateToStr(DATE()),4,2)+Copy(DateToStr(DATE()),7,4)+'.XLS');
      oSheet := Excel.WorkBooks[1].Worksheets[1];
    except
      BoxMensagem('Erro na criação da Planilha. Verifique se a Planilha não está em uso ou se o Excel está aberto.',2) ;
      Exit;
    end;

    nLinha := 4;
    while not Eof do
    begin
      Pinta(nLinha,9,oSheet);
      oSheet.Cells[nLinha,01].value := Copy(Fields[0].Value,5,Length(Fields[0].Value));
      oSheet.Cells[nLinha,02].value := Fields[1].Value;
      oSheet.Cells[nLinha,03].value := FormatFloat('#,##0.00',Fields[2].Value);
      oSheet.Cells[nLinha,04].value := Fields[3].Value;
      oSheet.Cells[nLinha,05].value := Fields[4].Value;
      oSheet.Cells[nLinha,06].value := FormatDateTime('dd/mm/yyyy',Fields[5].AsDateTime);
      oSheet.Cells[nLinha,07].value := FormatDateTime('dd/mm/yyyy',Fields[6].AsDateTime);
      oSheet.Cells[nLinha,08].value := FormatDateTime('dd/mm/yyyy',Fields[7].AsDateTime);
      oSheet.Cells[nLinha,09].value := Fields[8].Value;
      Next;
      Inc(NLinha);
    end;
    for I := 1 to 9 do
    begin
      oSheet.Cells[nLinha,I].Interior.ColorIndex := 49;
      oSheet.Cells[nLinha,I].Font.Color := ClWhite;
    end;
    oSheet.Cells[nLinha,01].HorizontalAlignment := xlLeft; //Alinhar Coluna a Esquerda
    oSheet.Cells[nLinha,01].Value := ' Qtde de Registros - '+IntToStr(RecordCount);
    oSheet.Cells[nLinha,04].HorizontalAlignment := xlLeft;
    oSheet.Cells[nLinha,04].Value := ' Emissor : '+ConsultaLookUP('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_USUARIO');
    oSheet.Cells[nLinha,07].HorizontalAlignment := xlLeft;
    oSheet.Cells[nLinha,07].Value := ' Data de emissão : '+DateTimeToStr(Now);
    //Fim WorkSheet 1
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT P.NR_PROCESSO,(SELECT E.NM_EMPRESA FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = P.CD_CLIENTE) CLIENTE,'+#13+
                '(SELECT SUM(FI.VL_FOB) FROM TFORECAST_IMP FI where FI.NR_FORECAST = F.NR_FORECAST) VALOR_FOB,'+#13+
                '(SELECT TPAC.NM_TP_SIT_ATO_CONC FROM TTP_SIT_ATO_CONC TPAC WHERE TPAC.TP_SIT_ATO_CONC = ACS.TP_SIT_ATO_CONC) SITUACAO_AC,'+#13+
                'ACS.NR_ATO_CONC,F.NR_FORECAST,CONVERT(varchar,ACS.DT_EMISSAO,103) DT_EMISSAO, MAX(ACA.DT_VENCTO) DT_VENCTO,'+#13+
                'CONVERT(varchar,ACS.DT_VENCTO_FINAL,103) DT_VENCTO_FINAL, 4-COUNT(NR_ADITIVO) PRORROGACOES_RESTANTES'+#13+
                'FROM TATO_CONC_SUSP ACS, TFORECAST F, TPROCESSO P, TATO_CONC_ADITIVO ACA'+#13+
                'WHERE ACS.NR_FORECAST = F.NR_FORECAST AND P.NR_PROCESSO = F.NR_PROCESSO AND ACS.DT_BAIXA_FINAL IS NULL AND P.CD_PRODUTO = ''15'''+#13+
                'AND ACS.TP_DRAWBACK = ''1'' AND ACA.NR_FORECAST =* F.NR_FORECAST AND P.CD_UNID_NEG = :CD_UNID_NEG'+Periodo+Cliente+#13+
                'GROUP BY P.NR_PROCESSO,P.CD_CLIENTE,F.NR_FORECAST,ACS.TP_SIT_ATO_CONC,ACS.NR_ATO_CONC,ACS.DT_EMISSAO,ACS.DT_VENCTO_FINAL';
    Params[0].AsString := mskedt_cd_unid_neg.Text;
    Prepare;
    Open;
    if IsEmpty then
    begin
      BoxMensagem('Não foram encontrados DrawBacks Isenção. Verifique os dados informados e tente novamente.',2);
      Screen.Cursor := crDefault;
    end
    else
    begin
      First;
    end;
    oSheet := Excel.WorkBooks[1].Worksheets[2];
    nLinha := 4;
    AuxQaditivo := TQuery.Create(Self);
    AuxQaditivo.DatabaseName := datm_main.db_broker.DatabaseName;
    while not Eof do
    begin
      with AuxQaditivo do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT ACA.NR_ADITIVO FROM TATO_CONC_ADITIVO ACA WHERE ACA.NR_FORECAST = '+QuotedStr(AuxQ.FieldByName('NR_FORECAST').AsString);
        Prepare;
        Open;
        First;
        while not Eof do
        begin
          Aditivos := Aditivos + Copy(Fields[0].AsString,1,4)+'-'+Copy(Fields[0].AsString,5,2)+'/'+Copy(Fields[0].AsString,7,6)+'-'+Copy(Fields[0].AsString,13,1)+'  /  ';
          Next;
        end;                                   
        Aditivos := Copy(Aditivos,1,Length(Aditivos)-5);
      end;
      Pinta(nLinha,10,oSheet);
      oSheet.Cells[nLinha,01].value := Copy(Fields[0].Value,5,Length(Fields[0].Value));
      oSheet.Cells[nLinha,02].value := Fields[1].Value;
      oSheet.Cells[nLinha,03].value := FormatFloat('#,##0.00',Fields[2].Value);
      oSheet.Cells[nLinha,04].value := Fields[3].Value;
      oSheet.Cells[nLinha,05].value := Fields[4].Value;
      oSheet.Cells[nLinha,06].value := Aditivos;
      oSheet.Cells[nLinha,07].value := FormatDateTime('dd/mm/yyyy',Fields[6].AsDateTime);
      oSheet.Cells[nLinha,08].value := FormatDateTime('dd/mm/yyyy',Fields[7].AsDateTime);
      oSheet.Cells[nLinha,09].value := FormatDateTime('dd/mm/yyyy',Fields[8].AsDateTime);
      oSheet.Cells[nLinha,10].value := Fields[9].Value;
      Next;
      Inc(NLinha);
    end;
    for I := 1 to 10 do
    begin
      oSheet.Cells[nLinha,I].Interior.ColorIndex := 49;
      oSheet.Cells[nLinha,I].Font.Color := ClWhite;
    end;
    oSheet.Cells[nLinha,01].HorizontalAlignment := xlLeft; //Alinhar Coluna a Esquerda
    oSheet.Cells[nLinha,01].Value := ' Qtde de Registros - '+IntToStr(RecordCount);
    oSheet.Cells[nLinha,04].HorizontalAlignment := xlLeft;
    oSheet.Cells[nLinha,04].Value := ' Emissor : '+ConsultaLookUP('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_USUARIO');
    oSheet.Cells[nLinha,07].HorizontalAlignment := xlLeft;
    oSheet.Cells[nLinha,07].Value := ' Data de emissão : '+DateTimeToStr(Now);
    AuxQaditivo.Free;
    Free;
  end;
  Screen.Cursor := crDefault;
  Excel.Visible := True;
  ShowMessage('Planilha gerada com sucesso');
  Application.ProcessMessages;
end;

procedure Tfrm_rel_integrado_drawback.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_integrado_drawback.mskedt_periodo_inicialExit(Sender: TObject);
begin
  if Trim(mskedt_periodo_inicial.text) = '/  /' then exit;
  try
    StrToDate(mskedt_periodo_inicial.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data inválida!',2);
      mskedt_periodo_inicial.clear;
      mskedt_periodo_inicial.setfocus;
    end;
  end;
end;

procedure Tfrm_rel_integrado_drawback.mskedt_periodo_finalExit(Sender: TObject);
begin
  if Trim(mskedt_periodo_final.text) = '/  /' then exit;
  try
    StrToDate(mskedt_periodo_final.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data inválida!',2);
      mskedt_periodo_final.clear;
      mskedt_periodo_final.setfocus;
    end;
  end;

end;

procedure Tfrm_rel_integrado_drawback.mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = mskedt_cd_cliente then btn_cd_empresaClick(nil);
  end;
end;

procedure Tfrm_rel_integrado_drawback.mskedt_cd_unid_negExit(Sender: TObject);
begin
  if (edt_nm_unid_neg.Text = '') and (mskedt_cd_unid_neg.Text <> '') then
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG')
  else
    Exit;
end;

procedure Tfrm_rel_integrado_drawback.mskedt_cd_clienteExit(Sender: TObject);
begin
  if (edt_nm_cliente.Text = '') and (mskedt_cd_cliente.Text <> '') then
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', mskedt_cd_cliente.Text,'AP_EMPRESA')
  else
    Exit;
end;

end.
