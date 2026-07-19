unit PGPE045;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, DBCtrls, Mask, ExtCtrls, ConsOnLineEx,
  ComCtrls, TabNotBk, Tabs, ppPrnabl, ppClass, ppStrtch, ppRichTx, ppBands,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, FileCtrl, ppMemo, DateUtils;

type
  Tfrm_exp_impr_bordero = class(TForm)
    shpFundo: TShape;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    dsGeral: TDataSource;
    qryGeral: TQuery;
    dsDet: TDataSource;
    qryDet: TQuery;
    dsRef: TDataSource;
    qryRef: TQuery;
    dsRE: TDataSource;
    qryRE: TQuery;
    dsSaque: TDataSource;
    qrySaque: TQuery;
    dsNF: TDataSource;
    qryNF: TQuery;
    qryDetNM_DOCTO: TStringField;
    qryDetORIG: TStringField;
    qryDetCOPIA: TStringField;
    qryRefREF: TStringField;
    qryRERE: TStringField;
    qrySaqueDT_VCTO_SAQUE: TDateTimeField;
    qrySaqueVL_TOT_SAQUE: TFloatField;
    qryNFNF: TStringField;
    btnVoltar: TSpeedButton;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    fllstAux: TFileListBox;
    nbPrincipal: TNotebook;
    Label1: TLabel;
    Label3: TLabel;
    btn_co_proc_new: TSpeedButton;
    btn_cd_unid_neg: TSpeedButton;
    lbl_nr_dhl: TLabel;
    Label4: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_nr_dhl: TMaskEdit;
    cbo_tp_impressao: TComboBox;
    pg: TPageControl;
    ts1: TTabSheet;
    qryDetCD_DOCUMENTO: TStringField;
    ppMem: TppMemo;
    qryGeralNR_PROCESSO: TStringField;
    qryGeralNR_FATURA: TStringField;
    qryGeralPROC_SIGLA: TStringField;
    qryGeralNM_AREA: TStringField;
    qryGeralNM_USUARIO: TStringField;
    qryGeralEMAIL_USUARIO: TStringField;
    qryGeralDT_ATUAL: TStringField;
    qryGeralNM_BANCO: TStringField;
    qryGeralAP_MOEDA: TStringField;
    qryGeralVL_TOT_MCV: TFloatField;
    qryGeralNM_TERMO_PAGTO: TStringField;
    qryGeralNM_EMPRESA: TStringField;
    qryGeralPAIS_IMP: TStringField;
    qryGeralPAIS_DEST: TStringField;
    qryGeralDT_EMBARQUE: TStringField;
    qryGeralCONHECIMENTO: TStringField;
    qryGeralNR_SD: TStringField;
    qryGeralCLIENTE: TStringField;
    qryGeralNR_TELEFONE: TStringField;
    qryGeralNR_FAX: TStringField;
    qryGeralCNPJ_EMPRESA: TStringField;
    qryGeralNM_BANCO_BORD: TStringField;
    qryGeralTP_LAYOUT: TIntegerField;
    qryGeralDT_FATURA: TStringField;
    qryGeralEND_BANCO: TStringField;
    qryGeralCID_BANCO: TStringField;
    qryGeralUSUARIO_GERADOR: TStringField;
    qryGeralNM_EMAIL: TStringField;
    qryGeralCD_FORMA_PAGTO: TStringField;
    qryGeralCD_SEGURADORA: TStringField;
    qryGeralCD_BANCO_EXP: TStringField;
    qryGeralNM_AGENTE: TStringField;
    qryGeralEND_AGENTE: TStringField;
    qryGeralCOMISSAO_AGENTE: TFloatField;
    qryRENR_OUTRA_REF: TStringField;
    qryGeralOBS_AGENTE: TStringField;
    qryGeralOBS_BANCO: TStringField;
    qryGeralNR_DDE: TStringField;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure cbo_tp_impressaoChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vParam: integer;
    procedure GeraBordero(Sender: TObject);
    procedure MudarTela(pMostrarBordero: boolean);
    procedure pBeforePrint(Sender: TObject);
  public
    { Public declarations }
    vUnid: string[2];
    vProcesso: string[18];
  end;

var
  frm_exp_impr_bordero: Tfrm_exp_impr_bordero;
  ReportFileName : String;
  ReportPath : String;
  NR_PROC_CONSULTA : String[18];

implementation

//uses GSMLIB, PGGP035, PGSM018, PGPE046, PGRE001;
uses PGGP001, PGGP017, PGSM990, GSMLIB;

{$R *.DFM}


procedure Tfrm_exp_impr_bordero.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then begin
    msk_cd_unid_neg.Text := Copy('00', 1, 2 - Length(msk_cd_unid_neg.Text)) +  msk_cd_unid_neg.Text;
    if edt_nm_unid_neg.Text = '' then begin
      ShowMessage('Unidade de Negócio inválida ou inexistente!');
      msk_cd_unid_neg.SetFocus;
    end;
  end;
end;

procedure Tfrm_exp_impr_bordero.btn_co_proc_newClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT DISTINCT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('  INNER JOIN TPROCESSO_EXP_BORD B ( NOLOCK ) ON B.NR_PROCESSO = PR.NR_PROCESSO');
  vListAux.Add('WHERE CD_PRODUTO  = "02" ');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
end;

procedure Tfrm_exp_impr_bordero.FormShow(Sender: TObject);
var vQryAux: TQuery;
begin
  MudarTela(False);
  vQryAux := TQuery.Create(application);
  vQryAux.DatabaseName := 'DBBROKER';
  vQryAux.Close;
  vQryAux.SQL.Add('SELECT ISNULL(CD_UNID_NEG, "") FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE IN_DEFAULT = "1" AND CD_USUARIO = "' + str_cd_usuario + '" ');
  vQryAux.Open;
  if vUnid = '' then
    msk_cd_unid_neg.Text :=  vQryAux.FIelds[0].AsString
  else
    msk_cd_unid_neg.Text := vUnid;

  msk_nr_processo.Text := vProcesso;
  vQryAux.Free;

  msk_cd_unid_negExit(nil);
  msk_nr_processo.SetFocus;

  lbl_nr_dhl.Visible := False;
  msk_nr_dhl.Visible := False;
  cbo_tp_impressao.ItemIndex := 0;
end;

procedure Tfrm_exp_impr_bordero.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo        then btn_co_proc_newClick(btn_co_proc_new);
    if Sender = msk_cd_unid_neg        then btn_cd_unid_negClick(btn_cd_unid_neg);
  end;
end;

procedure Tfrm_exp_impr_bordero.btn_cd_unid_negClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
   msk_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG ' +
                                               '  FROM TUNID_NEG (NOLOCK) ' +
                                               ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                               '                         FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                               '                        WHERE CD_USUARIO = "'+ str_cd_usuario + '") ' ,
                                               'Unidades',
                                               ['CD_UNID_NEG','NM_UNID_NEG', 'AP_UNID_NEG'],['Código','Unidade', 'Apelido'],
                                               'CD_UNID_NEG',nil,msk_cd_unid_neg.Text);
   edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'AP_UNID_NEG');
 end
 else
   edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT AP_UNID_NEG ' +
                                             '  FROM TUNID_NEG (NOLOCK) ' +
                                             ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                             '                         FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                             '                        WHERE CD_USUARIO = "'+ str_cd_usuario + '") ' +
                                             ' AND CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ','AP_UNID_NEG');
end;

procedure Tfrm_exp_impr_bordero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_exp_impr_bordero.msk_nr_processoExit(Sender: TObject);
var vQryAux: TQuery;
begin
  if msk_nr_processo.Text <> '' then begin
    if edt_nm_unid_neg.Text = '' then begin
      ShowMessage('Preencha uma unidade de Negócio Válida!');
      msk_cd_unid_neg.SetFocus;
    end else begin
      try
        vQryAux := TQuery.Create(application);
        vQryAux.DatabaseName := 'DBBROKER';
        vQryAux.Close;
        vQryAux.SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO_EXP WHERE NR_PROCESSO = :NR_PROCESSO ');
        vQryAux.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '02' + Trim( msk_nr_processo.Text );
        vQryAux.Open;
        if vQryAux.IsEmpty then begin
          ShowMessage( 'Processo inexistente !');
          msk_nr_processo.SetFocus;
        end;
      finally
        vQryAux.Free;
      end;
    end;
  end;

end;

procedure Tfrm_exp_impr_bordero.cbo_tp_impressaoChange(Sender: TObject);
begin
  if ( cbo_tp_impressao.ItemIndex = 1 ) or ( cbo_tp_impressao.ItemIndex = 2 ) then
  begin
    msk_nr_dhl.Visible := true;
    lbl_nr_dhl.Visible := true;
  end
  else
  begin
    msk_nr_dhl.Visible := false;
    lbl_nr_dhl.Visible := false;
  end;

end;

procedure Tfrm_exp_impr_bordero.btnSairClick(Sender: TObject);
var i: Byte;
begin
  fllstAux.Directory := 'c:\DDBroker\';
  fllstAux.Update;
  if fllstAux.Count > 0 then
    for i := 0 to fllstAux.Count - 1 do
      DeleteFile(fllstAux.Directory + '\' + fllstAux.Items.Strings[i]);

  Close;
end;

procedure Tfrm_exp_impr_bordero.btnImprimirClick(Sender: TObject);
var vAux, i, vPeriodo: integer;
    vTxtAux: TMemo;
    vREf, vNF, vDDE, vRE, vFat, vDet, vIndicador: string;
    vlMCV: real;
    vDtIni: TDateTime;
begin
  //gera dados do processo - 1 registro por fatura
  qryGeral.Close;
  qryGeral.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
  qryGeral.ParamByName('USUARIO').AsString := str_cd_usuario;
  qryGeral.Open;
  if qryGeral.IsEmpty then begin
    ShowMessage('Processo Inválido ou Inexistente! Impressão cancelada!');
    Exit;
  end;
  MudarTela(true);

  vAux := 1;
  while not qryGeral.Eof do
  begin
    //cria tabsheet, richEdit e Botões para cada fatura do processo
    if vAux = 1 then begin
      ts1.Caption := qryGeralNR_FATURA.AsString;
    end else begin
      with TTabSheet.Create(frm_exp_impr_bordero) do
      begin
        Parent        := pg;
        PageControl   := pg;
        Align         := alClient;
        Name          := 'ts' + IntToStr(vAux);
        Caption       := qryGeralNR_FATURA.AsString;
        TabVisible    := True;
        PageIndex     := vAux - 1;
      end;
    end;
    with TMemo.Create(pg) do
    begin
      Parent        := TTabSheet(frm_exp_impr_bordero.FindComponent('ts' + IntToStr(vAux)));
      Align         := alTop;
      Height        := pg.Height - 75;
      Name          := 'pTxt' + IntToStr(vAux);
      Font.Name     := 'Courier New';
      Font.Size     := 11;
      Lines.Clear;
      ScrollBars    := ssBoth;
      TabOrder      := 0;
      Visible       := True;
    end;
    with TButton.Create(pg) do
    begin
      Parent        := TTabSheet(frm_exp_impr_bordero.FindComponent('ts' + IntToStr(vAux)));
      Align         := alRight;
      Top           := pg.Height - 45;
      Width         := 75;
      Height        := 25;
      Caption       := 'Imprimir';
      Name          := 'btn' + IntToStr(vAux);
      TabOrder      := 1;
      Visible       := True;
      Tag           := vAux;
      OnClick       := GeraBordero;
    end;

    //inicializa variáveis
    vDDE := qryGeralNR_DDE.AsString;

    vRef := '';
    vRE  := '';
    vNF  := '';
    vFat := '';
    //pega detalhes
    qryDet.Close;
    qryDet.Open;
    qryRef.Close;
    qryRef.Open;
    qryRE.Close;
    qryRE.Open;
    qryNF.Close;
    qryNF.Open;
    //procura saque daquela fatura específica
    qrySaque.Close;
    qrySaque.ParamByName('NR_FATURA').AsString := qryGeralNR_FATURA.AsString;
    qrySaque.Open;
    if qrySaque.IsEmpty then begin
      //caso não encontra pega o primeiro saque do processo
      qrySaque.Close;
      qrySaque.ParamByName('NR_FATURA').AsString := '';
      qrySaque.Open;
    end;

    while not qryRef.Eof do begin
      vRef := vRef + qryRefREF.AsString + ', ';
      qryRef.Next;
    end;
    vRef := Copy(vRef, 1, Length(vRef) - 2);

    while not qryRe.Eof do begin
      //if (Trim(qryRENR_OUTRA_REF.AsString) = qryGeralNR_FATURA.AsString) or  (Trim(qryRENR_OUTRA_REF.AsString) ='') then
        vRe  := vRe + qryReRE.AsString + ', ';
        vFat := vFat + qryRENR_OUTRA_REF.AsString + '+'; // Adiciona para o corpo com as faturas - Michel - 23/10/2008
      qryRe.Next;
    end;
    vRe  := Copy(vRe, 1, Length(vRe) - 2);
    if qryGeralNR_FATURA.AsString='' then
       vFat := Copy(vFat, 1, Length(vFat) - 1)
    else
       vFat := qryGeralNR_FATURA.AsString;

    while not qryNF.Eof do begin
      vNF := vNF + qryNFNF.AsString + ', ';
      qryNF.Next;
    end;
    vNF := Copy(vNF, 1, Length(vNF) - 2);

    case qryGeralTP_LAYOUT.AsInteger of
    1: begin
        //monta texto do borderô
        vTxtAux := TMemo(pg.FindComponent('ptxt' + IntToStr(vAux)));
        vTxtAux.Lines.Add(qryGeralPROC_SIGLA.AsString + ' / ' + qryGeralNM_AREA.AsString + ' / ' + qryGeralNR_FATURA.AsString + ' / ' + qryGeralNM_USUARIO.AsString);
        //vTxtAux.Lines.Add(qryGeralPROC_SIGLA.AsString + ' / ' + qryGeralNM_AREA.AsString + ' / ' + vFat + ' / ' + qryGeralNM_USUARIO.AsString);
        vTxtAux.Lines.Add('Data : ' + qryGeralDT_ATUAL.AsString);
        vTxtAux.Lines.Add('S/Ref: ' + vRef);
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('AO');
        vTxtAux.Lines.Add(qryGeralNM_BANCO.AsString);
        vTxtAux.Lines.Add('CARTEIRA DE CÂMBIO/EXPORTAÇÃO.');
        vTxtAux.Lines.Add('SÃO PAULO');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('REF: FAT ' + qryGeralNR_FATURA.AsString + ' ' + qryGeralAP_MOEDA.AsString + ' ' + FormatFloat('0.,00', qryGeralVL_TOT_MCV.AsFloat) + ' - ' + qryGeralNM_TERMO_PAGTO.AsString);
        vTxtAux.Lines.Add('     VENC. ' + qrySaqueDT_VCTO_SAQUE.AsString);
        vTxtAux.Lines.Add('     IMPORTADOR  : ' + qryGeralNM_EMPRESA.AsString + ' - ' + qryGeralPAIS_IMP.AsString);
        vTxtAux.Lines.Add('     EMBARQUE    : ' + qryGeralDT_EMBARQUE.AsString);
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('Prezados Senhores, ');
        vTxtAux.Lines.Add('Com a presente encaminhamos os documentos referente ao embarque acima mencionado, os quais solicitamos enviarem cobrança ao Banco:');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add(qryGeralNM_BANCO_BORD.AsString);
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('DOCUMENTOS ANEXOS');
        //passa documentos anexos cadastrados em TPROCESSO_EXP_BORD_ITEM
        while not qryDet.Eof do begin
          vDet := '';
          vDet := qryDetNM_DOCTO.AsString;
          //exceções
          if qryDetCD_DOCUMENTO.AsString = '002' then
            if (qrySaqueDT_VCTO_SAQUE.IsNull) or (qrySaqueDT_VCTO_SAQUE.AsString = '') then
              vDet := vDet + ' ' + qryGeralAP_MOEDA.AsString + ' ' + FormatFloat('0.,00', qrySaqueVL_TOT_SAQUE.AsFloat) + ' - Vencimento: À vista'
            else
              vDet := vDet + ' ' + qryGeralAP_MOEDA.AsString + ' ' + FormatFloat('0.,00', qrySaqueVL_TOT_SAQUE.AsFloat) + ' - Vencimento: ' + qrySaqueDT_VCTO_SAQUE.AsString;
          if (qryDetCD_DOCUMENTO.AsString = '001') or (qryDetCD_DOCUMENTO.AsString = '003') then
            vDet := vDet + ' ' + qryGeralNR_FATURA.AsString;
          if qryDetCD_DOCUMENTO.AsString = '004' then
            vDet := vDet + ' ' + qryGeralCONHECIMENTO.AsString;

          for i := 1 to 63 - Length(vDet) do
            vDet := vDet + '.';

          vTxtAux.Lines.Add(vDet + qryDetORIG.AsString + '/' + qryDetCOPIA.AsString);
          qryDet.Next;
        end;
        //lança demais documentos
        if vRe <> '' then begin
          vTxtAux.Lines.Add('R.E. Nº ' + vRE);
        end;
        if qryGeralNR_SD.AsString <> '' then
          vTxtAux.Lines.Add('SD Nº ' + qryGeralNR_SD.AsString);
        if vNF <> '' then begin
          vTxtAux.Lines.Add('Outros Documentos:');
          vTxtAux.Lines.Add('NF Nº '+ vNF);
        end;
        //nr de DHL, se for preenchido
        if (msk_nr_dhl.Text <> '') and ((cbo_tp_impressao.ItemIndex = 1) or (cbo_tp_impressao.ItemIndex = 2)) then
          vTxtAux.Lines.Add('Nº DHL: ' +  msk_nr_dhl.Text);
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('OBSERVAÇÕES');
        vTxtAux.Lines.Add('');
        //observações
        Case cbo_tp_impressao.ItemIndex of
        0: begin
             vTxtAux.Lines.Add('1-Liberar documentação ao sacado contra: ( )pagamento  ( )aceite  (X)somente p/s/ arquivo');
             vTxtAux.Lines.Add('2-As Despesas de cobrança no exterior ocorrerão por:   ( )n/conta ( )conta do sacado');
             vTxtAux.Lines.Add('3-Na falta de pagamento ou aceite: ( )protestar ( )não protestar');
           end;
        1: begin
             vTxtAux.Lines.Add('1-Liberar documentação ao sacado contra: ( )pagamento  (X)aceite  ( )somente p/s/ arquivo');
             vTxtAux.Lines.Add('2-As Despesas de cobrança no exterior ocorrerão por:   ( )n/conta (X)conta do sacado');
             vTxtAux.Lines.Add('3-Na falta de pagamento ou aceite: ( )protestar (X)não protestar');
           end;
        2: begin
             vTxtAux.Lines.Add('1-Liberar documentação ao sacado contra: ( )pagamento  (X)aceite  ( )somente p/s/ arquivo');
             vTxtAux.Lines.Add('2-As Despesas de cobrança no exterior ocorrerão por:   ( )n/conta (X)conta do sacado');
             vTxtAux.Lines.Add('3-Na falta de pagamento ou aceite: (X)protestar ( )não protestar');
           end;
        end;
        vTxtAux.Lines.Add('4-Liquidação por: (X)ordem de pagamento ( )cheque');
        vTxtAux.Lines.Add('5-Comissão de Agente: ( )conta gráfica ( )a remeter');
        vTxtAux.Lines.Add('6-Favor remeter os documentos via correio');
        vTxtAux.Lines.Add('7-Favor remeter os documentos via: [DHL], devendo o faturamento ser feito em nome de [NOME_DE],' +
                          ' destacando no conhecimento o número de nossa fatura e Depto. FFTC-Câmbio.');
        vTxtAux.Lines.Add('8-Favor cobrar juros de atraso - PRIME + 2%');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('NÃO COBRAR JUROS');
        vTxtAux.Lines.Add('NÃO COBRAR PROTESTO DO SAQUE');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('Atenciosamente,');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add(qryGeralCLIENTE.AsString);
       end;
    2: begin
        vlMCV := 0;
        vlMCV := StrToFloatDef(ConsultaLookUpSQL('SELECT SUM(ISNULL(VL_MCV, 0)) AS SOMA FROM TPROCESSO_EXP_ITEM (NOLOCK) ' +
                                                 ' WHERE NR_PROCESSO = ''' + qryGeralNR_PROCESSO.AsString + ''' --AND ' +     // Query com comentário para pegar valor total do processo - Michel - 23/10/2008
                                                 ' NR_PEDIDO = ''' + qryGeralNR_FATURA.AsString + ''' '  , 'SOMA'),0);

        //caso não tenha vencimento do saque, calcular de acordo com Conhecimento (132)
        vDtIni :=  qrySaqueDT_VCTO_SAQUE.AsDateTime;
        if Trim(qrySaqueDT_VCTO_SAQUE.AsString) = '' then begin
          try
            vDtIni := StrToDateDef(ConsultaLookUpSQL('SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE CD_EVENTO = ''132'' AND NR_PROCESSO = ''' + qryGeralNR_PROCESSO.AsString + ''' ', 'DT_REALIZACAO'), 0);
            vPeriodo := StrToIntDef(ConsultaLookUpSQL('SELECT ISNULL(TP.NR_PERIODICIDADE, 0) AS PERIODO ' +
                                            '  FROM TTERMO_PAGTO TP (NOLOCK) ' +
                                            ' INNER JOIN TPROCESSO_EXP E (NOLOCK) ON E.CD_TERMO_PAGTO = TP.CD_TERMO_PAGTO ' +
                                            ' WHERE NR_PROCESSO = ''' + qryGeralNR_PROCESSO.AsString + ''' ', 'PERIODO'), 0);
            vDtIni := IncDay(vDtIni, vPeriodo);

          except
            vDtIni :=  qrySaqueDT_VCTO_SAQUE.AsDateTime;
          end;
        end;
        //monta texto do borderô
        vTxtAux := TMemo(pg.FindComponent('ptxt' + IntToStr(vAux)));
        //vTxtAux.Lines.Add('FATURA COMERCIAL: ' + qryGeralNR_FATURA.AsString + ' DATA:' + qryGeralDT_FATURA.AsString);
        vTxtAux.Lines.Add('FATURA COMERCIAL: ' + vFat + ' DATA:' + qryGeralDT_FATURA.AsString);
        // A linha acima foi substituida para adicionar todas as faturas ao corpo do documento - Michel - 23/10/2008
        vTxtAux.Lines.Add('IMPORTADOR      : ' + qryGeralNM_EMPRESA.AsString);
        vTxtAux.Lines.Add('VENCIMENTO      : ' + FormatDateTime('dd/mm/yyy', vDtIni));
        vTxtAux.Lines.Add('MODALIDADE      : ' + qryGeralNM_TERMO_PAGTO.AsString);
        vTxtAux.Lines.Add('VALOR           : ' + qryGeralAP_MOEDA.AsString + ' ' + FormatFloat('0.,00', vlMCV));
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('RELAÇÃO DE VÍNCULO     [   ] 0   [   ] 1');
        vTxtAux.Lines.Add('[  ] CÂMBIO A FECHAR   VALOR DE CÂMBIO A FECHAR: ' + qryGeralAP_MOEDA.AsString + ' 0,00');
        vTxtAux.Lines.Add('[  ] CÂMBIO A TRANSFERIR (TOTAL)');
        vTxtAux.Lines.Add('[  ] VINCULAR AO CONTRATO DE CÂMBIO COMO SEGUE:');
        vTxtAux.Lines.Add('OPERAÇÃO NR.          DATA DO FECHAMENTO         VALOR QUE SE APLICA PARA FECHAMENTO');
        vTxtAux.Lines.Add('                                                     ' + qryGeralAP_MOEDA.AsString);
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
//        vTxtAux.Lines.Add('REGISTRO DE EXPORTAÇÃO:  ' + vRE + '    SOLIC. DE DESPACHO ADUANEIRO: '+vDDE); //by carlos 24/08/2011 (exibir RE, DDE e Fatura)
        vTxtAux.Lines.Add('REGISTRO DE EXPORTAÇÃO:  ' + vRE );
        vTxtAux.Lines.Add('SOLIC. DE DESPACHO ADUANEIRO: '+vDDE);
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        if not qryDet.IsEmpty then begin
        vTxtAux.Lines.Add('DOCUMENTOS EM ANEXO            ORIGINAIS       CÓPIAS');
        vTxtAux.Lines.Add('-------------------            ---------       ------');
          while not qryDet.Eof do begin
            vDet := '';
            vDet := Copy(qryDetNM_DOCTO.AsString, 1, 30) + Space(30 - Length(Copy(qryDetNM_DOCTO.AsString, 1, 30)));
            vTxtAux.Lines.Add(vDet + '  [' + qryDetORIG.AsString + ']          [' + qryDetCOPIA.AsString + ']');
            qryDet.Next;
          end;
        end;
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('BL NR: ' + qryGeralCONHECIMENTO.AsString);
        //vTxtAux.Lines.Add('DATA DE EMBARQUE: ' + qryGeralDT_EMBARQUE.AsString); // Substituido pela linha abaixo para trazer a data do conhecimento - Michel - 13/11/2009
        vTxtAux.Lines.Add('DATA DO CONHECIMENTO DE EMBARQUE: ' + qryGeralDT_EMBARQUE.AsString);
        vTxtAux.Lines.Add('PAÍS DE DESTINO: ' + qryGeralPAIS_DEST.AsString);
        vTxtAux.Lines.Add('CNPJ: ' + qryGeralCNPJ_EMPRESA.AsString);
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('OS DOCUMENTOS DE EMBARQUE DEVERÃO SER ENVIADOS POR COURRIER DHL CONTA NR: 654131293 PARA O BANCO ABAIXO,');
        vTxtAux.Lines.Add('MENCIONANDO O Nº DA FATURA COMERCIAL NO CAMPO REFERÊNCIA DO AWB/COURRIER A SER PREENCHIDO PELO BANCO.');
        vTxtAux.Lines.Add('TÃO LOGO TENHAM O Nº DO COURRIER, NOS INFORMAR. SEGUE ABAIXO O ENDEREÇO DO BANCO PARA ENVIO DO COURRIER:');
        vTxtAux.Lines.Add('');
        if (qryGeralCD_FORMA_PAGTO.AsString = '0') or (qryGeralCD_FORMA_PAGTO.AsString = '1') then begin
          //Modificada a linha acima por Eric    09:21h  27/02/2012
          //agente - by carlos 22/10/2009    (ocorrencia: 12574-09)
          vTxtAux.Lines.Add('COMISSÃO DO AGENTE EM CONTA GRÁFICA');
          vTxtAux.Lines.Add('SOLICITAMOS CONSIDERAR O PAGAMENTO DA COMISSÃO NO VALOR DE: ' + qryGeralAP_MOEDA.AsString + ' ' + FormatFloat('0.,00', qryGeralCOMISSAO_AGENTE.AsFloat));
          if qryGeralOBS_AGENTE.AsString='' then begin
             vTxtAux.Lines.Add('PARA NOSSO AGENTE: ' + qryGeralNM_AGENTE.AsString);
             vTxtAux.Lines.Add('ENDEREÇO: ' + qryGeralEND_AGENTE.AsString);
          end else begin
             vTxtAux.Lines.Add('');
             vTxtAux.Lines.Add(qryGeralOBS_AGENTE.AsString);
          end;

          //banco - by carlos 22/10/2009     (ocorrencia: 12574-09)
          if qryGeralOBS_BANCO.AsString='' then begin
             vTxtAux.Lines.Add('NOME DO BANCO: ' + qryGeralNM_BANCO.AsString);
             vTxtAux.Lines.Add('ENDEREÇO     : ' + qryGeralEND_BANCO.AsString);
             vTxtAux.Lines.Add('CIDADE-PAÍS  : ' + qryGeralCID_BANCO.AsString);
          end else
             vTxtAux.Lines.Add(qryGeralOBS_BANCO.AsString);
        end;
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('NÃO COBRAR JUROS');
        vTxtAux.Lines.Add('NÃO COBRAR PROTESTO DO SAQUE');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add('ATENCIOSAMENTE,');
        vTxtAux.Lines.Add('');
        vTxtAux.Lines.Add(UpperCase(qryGeralCLIENTE.AsString));
        vTxtAux.Lines.Add('DEPTO. DE EXPORTAÇÃO');
        vTxtAux.Lines.Add(qryGeralUSUARIO_GERADOR.AsString);
        vTxtAux.Lines.Add('TEL: (13) 32114000 ');
        vTxtAux.Lines.Add('FAX: (13) 32195095 ');
        vTxtAux.Lines.Add('E-MAIL: ' + qryGeralNM_EMAIL.AsString);

      end;
    end;
    vAux := vAux + 1;
    qryGeral.Next;
  end;

end;

procedure tfrm_exp_impr_bordero.GeraBordero(Sender: TObject);
var vTxtAux: TMemo;
    vAux: integer;
begin
  vAux := TButton(Sender).Tag;
  vParam := TButton(Sender).Tag;
  vTxtAux := TMemo(pg.FindComponent('ptxt' + IntToStr(vAux) ));
  vTxtAux.Lines.SaveToFile('c:\DDBroker\bordero' + IntToStr(vAux) + '.txt');
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  frm_impressao.cd_unid_neg   := Copy(qryGeralNR_PROCESSO.AsString, 1,2);
  frm_impressao.cd_modulo     := '2011';
  frm_impressao.vBeforePrint  :=  pBeforePrint;
  frm_impressao.vApenas_email := false;
  frm_impressao.ShowModal;
  frm_impressao.Release;
end;

procedure tfrm_exp_impr_bordero.pBeforePrint(Sender: TObject);
begin
//  TppRichText(Frm_impressao.FindComponent('ppTxt')).LoadFromFile('c:\DDBroker\bordero' + IntToStr(vParam) + '.txt');
TppMemo(Frm_impressao.FindComponent('ppMem')).Lines.LoadFromFile('c:\DDBroker\bordero' + IntToStr(vParam) + '.txt');
//TppRichText(Frm_impressao.FindComponent('ppTxt')).RichText := 'teste';
end;

procedure tFrm_exp_impr_bordero.MudarTela(pMostrarBordero: boolean);
begin
  if pMostrarBordero then begin
    nbPrincipal.ActivePage := 'bord';
    frm_exp_impr_bordero.Caption := 'Borderô - ' + Copy(qryGeralNR_PROCESSO.AsString, 5,14);
    frm_exp_impr_bordero.WindowState := wsMaximized;
  end else begin
    nbPrincipal.ActivePage := 'default';
    frm_exp_impr_bordero.Width  := 395;
    frm_exp_impr_bordero.Height := 216;
    frm_exp_impr_bordero.Caption := 'Borderô';
    frm_exp_impr_bordero.Position := poScreenCenter;
    frm_exp_impr_bordero.WindowState := wsNormal;
  end;
  btnImprimir.Visible := not pMostrarBordero;
  btnSair.Visible     := not pMostrarBordero;
  btnVoltar.Visible   := pMostrarBordero;
  pg.Visible          := pMostrarBordero;
end;

procedure Tfrm_exp_impr_bordero.btnVoltarClick(Sender: TObject);
var i: Byte;
begin
  MudarTela(False);
  if not qryGeral.IsEmpty then begin
    for i:= 1 to qryGeral.RecordCount do begin
      if i <> 1 then
        if frm_exp_impr_bordero.FindComponent('ts' + IntToStr(i)) <> nil then
          frm_exp_impr_bordero.FindComponent('ts'+ IntToStr(i)).Free;
      if pg.FindComponent('pTxt' + IntToStr(i)) <> nil then
        pg.FindComponent('pTxt'+ IntToStr(i)).Free;
      if pg.FindComponent('btn' + IntToStr(i)) <> nil then
        pg.FindComponent('btn'+ IntToStr(i)).Free;
    end;
  end;
end;

procedure Tfrm_exp_impr_bordero.FormCreate(Sender: TObject);
begin
  vUnid := '';
  vProcesso := '';
end;

end.

