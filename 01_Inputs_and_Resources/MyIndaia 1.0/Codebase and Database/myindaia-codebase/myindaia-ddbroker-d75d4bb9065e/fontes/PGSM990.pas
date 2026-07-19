unit PGSM990;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ComCtrls, StdCtrls, ExtCtrls,
  Buttons,DBTables ,DB,TXtraDev, ppBands, ppCache, Inifiles, Grids, DBGrids,
  ppEndUsr, ppTypes, ppModule, daDataModule, ppMemo, ppSubRpt, ppStrtch,
  ppRegion, ppCtrls, ppVar, ppPrnabl, ppParameter, Funcoes, RxGIF, raCodMod,
  IdMessage, IdSMTP, OleCtrls, SHDocVw,
  FormsLog, jpeg; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  TFrm_impressao = class(TForm)
    Panel1: TPanel;
    OpenDialogRTF: TOpenDialog;
    OpenDialogXLS: TOpenDialog;
    OpenDialogHTML: TOpenDialog;
    OpenDialogPDF: TOpenDialog;
    ppReport1: TppReport;
    DBGrid1: TDBGrid;
    pnl_mail: TPanel;
    LstFiles: TListBox;
    reMessageText: TRichEdit;
    Label2: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Eto: TEdit;
    EdtCC: TEdit;
    eSubject: TEdit;
    ComboBox_TP: TComboBox;
    Label1: TLabel;
    ppDesigner: TppDesigner;
    qry_relatorios_: TQuery;
    ds_relatorios: TDataSource;
    qry_relatorios_CD_UNID_NEG: TStringField;
    qry_relatorios_CD_MODULO: TStringField;
    qry_relatorios_CODIGO: TStringField;
    qry_relatorios_DESCRIAO: TStringField;
    qry_relatorios_NM_PATH: TStringField;
    qry_relatorios_DT_DOCUMENTO: TDateTimeField;
    qry_relatorios_IN_DAFAULT: TStringField;
    qry_relatorios_IN_EMP_NAC: TStringField;
    qry_relatorios_IN_EMP_EST: TStringField;
    qry_relatorios_IN_AGENTE: TStringField;
    qry_relatorios_IN_CIA: TStringField;
    qry_relatorios_IN_ARMADOR: TStringField;
    qry_relatorios_IN_COMISSARIA: TStringField;
    qry_relatorios_CD_EMP_NAC: TStringField;
    qry_relatorios_CD_EMP_EST: TStringField;
    qry_relatorios_CD_AGENTE: TStringField;
    qry_relatorios_CD_CIA: TStringField;
    qry_relatorios_CD_ARMADOR: TStringField;
    qry_relatorios_CD_COMISSARIA: TStringField;
    Panel2: TPanel;
    RadioGroup_main: TRadioGroup;
    ppParameterList1: TppParameterList;
    Panel3: TPanel;
    Label9: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    pnl_arquivo: TPanel;
    Shape6: TShape;
    Shape7: TShape;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn_co_unid_neg: TSpeedButton;
    ComboBox2: TComboBox;
    Edit_arquivo: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    lblStatus: TLabel;
    chkCopyMe: TCheckBox;
    Shape8: TShape;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Timer1: TTimer;
    Shape9: TShape;
    Shape10: TShape;
    wbEmail: TWebBrowser;
    qry_relatorios_CD_VIA_TRANSP: TStringField;
    qry_relatorios_CD_PRODUTO: TStringField;
    qry_relatorios_IN_PROCESSO: TStringField;
    qry_relatorios_CD_GRUPO: TStringField;
    qry_relatorios_IN_GRUPO: TStringField;
    qry_relatorios_CD_TIPO_DOCTO: TIntegerField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape4: TppShape;
    ppDBMemo8: TppDBMemo;
    ppDBText79: TppDBText;
    ppShape7: TppShape;
    ppShape10: TppShape;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppDBText28: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText52: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppLine1: TppLine;
    ppLine14: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBText41: TppDBText;
    ppPesoLiq: TppLabel;
    ppPesoBruto: TppLabel;
    ppCubagem: TppLabel;
    ppSubTot: TppLabel;
    ppDesc: TppLabel;
    ppTotFob: TppLabel;
    ppFrete: TppLabel;
    ppSeguro: TppLabel;
    ppTot: TppLabel;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText47: TppDBText;
    ppDBText65: TppDBText;
    ppLine2: TppLine;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBTxtNot1: TppDBText;
    ppDBMemNot: TppDBMemo;
    ppDBTxtNot2: TppDBText;
    ppDBTxtNot3: TppDBText;
    ppDBTxtNot4: TppDBText;
    ppDBTxtNot5: TppDBText;
    ppDBTxtAss1: TppDBText;
    ppDBTxtAss2: TppDBText;
    ppDBTxtAss3: TppDBText;
    ppLineAss4: TppLine;
    ppDBTxtDestino: TppDBText;
    ppDBTxtDestinoCC: TppDBText;
    ppDBText38: TppDBText;
    ppDBText80: TppDBText;
    ppDBText83: TppDBText;
    ppDBText97: TppDBText;
    ppLabel1: TppLabel;
    ppDBText5: TppDBText;
    ppPageStyle2: TppPageStyle;
    ppShape6: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppLine7: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel13: TppLabel;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText48: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppLabel14: TppLabel;
    ppLabel17: TppLabel;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText66: TppDBText;
    ppShape11: TppShape;
    ppPG: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppImage1: TppImage;
    ppLine12: TppLine;
    ppDBText67: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBMemo2: TppDBMemo;
    ppDBText1: TppDBText;
    ppDBMemo6: TppDBMemo;
    ppDBText93: TppDBText;
    ppDBText2: TppDBText;
    ppDBText92: TppDBText;
    ppDBText86: TppDBText;
    ppDBText85: TppDBText;
    ppDBMemo7: TppDBMemo;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppLabel18: TppLabel;
    ppDBText77: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText84: TppDBText;
    ppLabel19: TppLabel;
    ppMerc: TppMemo;
    ppDBText91: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo5: TppDBMemo;
    ppDBCalc1: TppDBCalc;
    ppLine13: TppLine;
    ppLine15: TppLine;
    ppDBCalc2: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText94: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure RadioGroup_mainClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EtoChange(Sender: TObject);
    procedure EdtCCChange(Sender: TObject);
    procedure qry_relatorios_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    SMTP,eHomeAddr :string;
    TOP :integer;
    cd_estufagem: string[1];
    cd_grupo: string[3];
    cd_emp_nac, cd_emp_est:string[5];
    cd_agente, cd_cia, cd_armador, cd_modulo, cd_comissaria :string[4];
    cd_unid_neg, cd_via_transp, cd_produto, in_processo:string[2];
    pAssunto, pTo, pAnexo, pBody, vPathCertifOrigem : string;
    IdMessage1 : TIdMessage;
    IdSMTP1    : TIdSMTP;
    vBeforePrint, vStartPage: TNotifyEvent;
    vApenas_email, vEmail_direto, vMostrarEnviarHTML: boolean;
  end;

var
  Frm_impressao: TFrm_impressao;

implementation

{$R *.DFM}

Uses PGGP017, GSMLIB, PGGP003, PGGP001, PGDI001, uModDoc, ConsOnLineEx,
  PGPE030, dExpCalcProfit, PGSM296, uDigitalizacao, Mensagens;

procedure TFrm_impressao.RadioGroup_mainClick(Sender: TObject);
begin
  lblStatus.Caption := '';
  if RadioGroup_main.ItemIndex = 3 then
  begin
    Frm_impressao.Height  := 435;
//    Frm_impressao.TOP := TOP - 120;
    pnl_mail.Visible :=true;
    pnl_arquivo.Visible :=false;
    DBGrid1.Top             :=220;
    SpeedButton1.Caption := 'Enviar...';
    if vApenas_email then
    begin
      label9.Caption := 'Envio de e-mail - [ myIndaiá ]';
      label1.Visible := false;
      Shape5.Visible := false;
      ComboBox_TP.Visible := false;
      dbgrid1.Visible := false;
      panel2.Visible := false;
      frm_impressao.Height := 309;
    end;
  end
  else if RadioGroup_main.ItemIndex = 2 then
  begin
    Frm_impressao.Height := 330;
//    Frm_impressao.TOP := TOP - 120;
    pnl_mail.Visible :=false;
    pnl_arquivo.Visible :=true;
//    pnl_arquivo.Height := 50 ;
    DBGrid1.Top             :=115;
    SpeedButton1.Caption := 'Salvar';
  end
  else begin
    if RadioGroup_main.ItemIndex = 1 then
      SpeedButton1.Caption := 'Imprimir'
    else if RadioGroup_main.ItemIndex = 0 then
      SpeedButton1.Caption := 'Visualizar'
    else if RadioGroup_main.ItemIndex = 5 then
      SpeedButton1.Caption := 'Vincular';
//    Frm_impressao.TOP := TOP + 120;
    Frm_impressao.Height := 265;
    DBGrid1.Top         :=50;
    pnl_mail.Visible :=false;
    pnl_arquivo.Visible :=false;
  end;
end;

procedure TFrm_impressao.FormShow(Sender: TObject);
var
  qry :Tquery;
begin
//   TOP := Frm_impressao.TOP ;
//   Frm_impressao.TOP := TOP;
   Frm_impressao.Height := 265;
   DBGrid1.Top          := 50;
   pnl_mail.Visible :=false;
   //seleciona opção e-mail
   if vApenas_email then
   begin
     RadioGroup_main.ItemIndex := 3;
     reMessageText.Visible := not vMostrarEnviarHTML;
   end;
   if not vMostrarEnviarHTML then wbEmail.Free;
   vMostrarEnviarHTML := False;

   pnl_arquivo.Visible :=false;
   qry := TQuery.Create( Application );
   with qry do
   begin
     Close;
     SQL.Clear;
     DataBaseName := 'DBBROKER';
     SQL.Add('SELECT IN_ACESSO FROM TCONTROLE_ACESSO WHERE ');
     SQL.Add('  CD_MODULO = "22" AND CD_ROTINA = "2271"');
     SQL.Add(' AND CD_CARGO = '+ QUOTEDSTR(str_cd_cargo) );
     Open;
     TRadioButton(RadioGroup_main.Components[4]).Visible := Fields[0].AsBoolean;
     if not TRadioButton(RadioGroup_main.Components[4]).Visible then
       TRadioButton(RadioGroup_main.Components[5]).Left := TRadioButton(RadioGroup_main.Components[4]).Left;
     // As 3 linhas acima foram utilizadas para substituir as comentadas abaixo - Michel - 15/05/2009
     {if Fields[0].AsBoolean then
     begin
       RadioGroup_main.Items.Add('Designer');
       RadioGroup_main.Columns := 6;
     end;}
     Close;
     Free;
   end;

   qry_relatorios_.Close;
   qry_relatorios_.ParamByName('CD_UNID_NEG').AsString   := cd_unid_neg;
   qry_relatorios_.ParamByName('CD_MODULO').AsString     := cd_modulo;
   qry_relatorios_.ParamByName('CD_GRUPO').AsString      := cd_grupo;
   qry_relatorios_.ParamByName('CD_EMP_NAC').AsString    := cd_emp_nac;
   qry_relatorios_.ParamByName('CD_EMP_EST').AsString    := cd_emp_est;
   qry_relatorios_.ParamByName('CD_AGENTE').AsString     := cd_agente;
   qry_relatorios_.ParamByName('CD_CIA').AsString        := cd_cia;
   qry_relatorios_.ParamByName('CD_ARMADOR').AsString    := cd_armador;
   qry_relatorios_.ParamByName('CD_COMISSARIA').AsString := cd_comissaria;
   qry_relatorios_.ParamByName('CD_VIA_TRANSP').AsString := cd_via_transp;
   qry_relatorios_.ParamByName('CD_PRODUTO').AsString    := cd_produto;
   qry_relatorios_.ParamByName('CD_ESTUFAGEM').AsString  := cd_estufagem;   
   qry_relatorios_.ParamByName('IN_PROCESSO').AsString   := in_processo;

   //Rodrigo Capra - Relatórios "Certificados de Origem" - 03/07/2008
   if vPathCertifOrigem <> '' then
     qry_relatorios_.SQL.Add(' and upper(NM_PATH) = ''' + UpperCase(vPathCertifOrigem) + '''');




   qry_relatorios_.Prepare;
   qry_relatorios_.Open;
end;

procedure TFrm_impressao.btn_co_unid_negClick(Sender: TObject);
begin
  if TRIM(ComboBox2.Text) = 'RTF'  then
  begin
     OpenDialogRTF.Execute;
     Edit_arquivo.text :=  OpenDialogRTF.Filename;
  end
  else if TRIM(ComboBox2.Text) = 'XLS'  then
  begin
     OpenDialogXLS.Execute;
     Edit_arquivo.text :=  OpenDialogXLS.Filename;
  end
  else if TRIM(ComboBox2.Text) = 'HTML' then
  begin
     OpenDialogHTML.Execute;
     Edit_arquivo.text :=  OpenDialogHTML.Filename;
  end
  else if TRIM(ComboBox2.Text) = 'PDF'  then
  begin
     OpenDialogPDF.Execute;
     Edit_arquivo.text :=  OpenDialogPDF.Filename;
  end;
end;

procedure TFrm_impressao.FormCreate(Sender: TObject);
begin
  cd_modulo     := '';
  cd_unid_neg   := '';
  cd_via_transp := '';
  cd_produto    := '';
  in_processo   := '';
  //
  cd_grupo      := '';
  cd_emp_nac    := '';
  cd_emp_est    := '';
  cd_agente     := '';
  cd_cia        := '';
  cd_armador    := '';
  cd_comissaria := '';
  cd_estufagem  := '';
  in_processo   := '1';
  Panel3.Color  := clPnlClaroBroker;
  Panel2.Color  := clMenuBroker;
  Panel1.Color  := clMenuBroker;
  vApenas_email := False;
//  Frm_impressao.Top := Frm_impressao.Top - 150;
end;

procedure TFrm_impressao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_relatorios_.Close;
end;

procedure TFrm_impressao.SpeedButton1Click(Sender: TObject);
var
  path, vMailUsuario :String;
  i: Byte;
  Body: TStringList;
begin
  //carrega o arquivo quando usado o gerenciador
  if not vApenas_email then
  begin
    ppReport1.Reset;
    ppReport1.Template.FileName := qry_relatorios_NM_PATH.AsString;
    ppReport1.Template.LoadFromFile;
    ppReport1.BeforePrint := vBeforePrint;
    ppReport1.OnStartPage := vStartPage;
    path := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(path + 'TEMP\') then
      CreateDir(path + 'TEMP\');
    LstFiles.Items.Clear;
  end;
  {0 - VISUALIZA}
  if RadioGroup_main.ItemIndex = 0 then
  begin
    ppReport1.AllowPrintToArchive := False;
    ppReport1.AllowPrintToFile    := False;
    ppReport1.ShowPrintDialog     := False;
    ppReport1.SaveAsTemplate      := false;
    ppReport1.DeviceType          := 'Screen';
    ppReport1.PRINT;
  end;

  {1 - IMPRESSORA}
  if RadioGroup_main.ItemIndex = 1 then
  begin
    ppReport1.AllowPrintToArchive := False;
    ppReport1.AllowPrintToFile    := False;
    ppReport1.ShowPrintDialog     := True;
    ppReport1.SaveAsTemplate      := false;
    ppReport1.DeviceType          := 'Printer';
    ppReport1.Print;
  end;

  {2 - ARQUIVO}
  if RadioGroup_main.ItemIndex = 2 then
  begin
    if edit_arquivo.text <> '' then
    begin
      ppReport1.AllowPrintToArchive :=False;
      ppReport1.AllowPrintToFile :=True;
      ppReport1.ShowPrintDialog := False;
      if      TRIM(ComboBox2.Text) = 'RTF'  then
        ppReport1.DeviceType := 'RTFFile'  //RTF
      else if TRIM(ComboBox2.Text) = 'XLS'  then
        ppReport1.DeviceType := 'ExcelFile'//XLS
      else if TRIM(ComboBox2.Text) = 'HTML' then
        ppReport1.DeviceType := 'HTMLFile' //HTML
      else if TRIM(ComboBox2.Text) = 'PDF'  then
        ppReport1.DeviceType := 'PDFFile' ; //PDF;
      lblStatus.Caption := 'Imprimindo para arquivo ' + edit_arquivo.text;
      ppReport1.SaveAsTemplate := true;
      ppReport1.TextFileName :=  Edit_arquivo.text + '.' + Trim(ComboBox2.Text);
      ppReport1.Print;
      lblStatus.Caption := 'Arquivo gerado em ' + edit_arquivo.text;
      sleep(3);
      close;
    end
    else BoxMensagem( 'Digite o nome do arquivo!' , 2 );
  end;

  {3 - EMAIL}
  if RadioGroup_main.ItemIndex = 3 then
  begin

  // verifica se é apenas e-mail
    if not vApenas_email then
    begin
        ppReport1.AllowPrintToArchive :=True;
        ppReport1.AllowPrintToFile :=True;
        ppReport1.ShowPrintDialog := False;
        if      TRIM(ComboBox_TP.Text) = 'RTF' then
        begin
          ppReport1.DeviceType := 'RTFFile' ; //RTF
          ppReport1.TextFileName := path + 'TEMP\ARQ' + str_cd_usuario + '.RTF';
          LstFiles.Items.add(ppReport1.TextFileName);
        end
        else if TRIM(ComboBox_TP.Text) = 'XLS' then
        begin
          ppReport1.DeviceType := 'ExcelFile';//XLS
          ppReport1.TextFileName := path + 'TEMP\ARQ' + str_cd_usuario + '.XLS';
          LstFiles.Items.add(ppReport1.TextFileName);
        end
        else if TRIM(ComboBox_TP.Text) = 'HTML' then
        begin
          ppReport1.DeviceType := 'HTMLLayerFile' ;//HTML
          ppReport1.TextFileName := path + 'TEMP\RPT' + str_cd_usuario + '.HTML';
          LstFiles.Items.add(path + 'TEMP\RPT0001.HTM');
        end
        else if TRIM(ComboBox_TP.Text) = 'PDF' then
        begin
          ppReport1.DeviceType := 'PDFFile'  ;//PDF;
          ppReport1.TextFileName := path + 'TEMP\ARQ' + str_cd_usuario + '.PDF';
          LstFiles.Items.add(ppReport1.TextFileName);
        end;
        lblStatus.Caption := 'Enviando Email para ' + eTo.text;
        ppReport1.SaveAsTemplate := true;
        ppReport1.Print;
    end;

    //envia e-mail tanto para gerenciador como para apenas e-mail
    pTo            := StringReplace(eTo.Text+';'+edtCC.Text,',',';',[rfReplaceAll]);
    vMailUsuario := Trim(ConsultaLookUp('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_EMAIL'));
    if chkCopyMe.Checked then
      pTo := pTo + ';' + vMailUsuario;
    pAssunto       := eSubject.text;
    pAnexo         := Trim(LstFiles.Items.Text);
    Body := TStringList.Create;
    if vMostrarEnviarHTML then
    begin
      Body.LoadFromFile(Trim(LstFiles.Items.Text));
      Body.Insert(0,'<HTML>');
      Body.Insert(1,'<BODY>');
      Body.Insert(2,'<center><IMG SRC=http://www.indaialogistica.com.br/img/cabecalho.gif><br><br></center>');
    end
    else
    begin
      Body.Add('');
      Body.Add(reMessageText.Text);
      Body.Add('');
      Body.Add('');
      Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
      Body.Add('');
      Body.Add(' Este é um email gerado automaticamente pelo MyIndaiá.');
      Body.Add(' Dúvidas: myindaia@myindaia.com.br');
      Body.Add('');
      Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
      Body.Add('');
    end;
    GSMLIB.EnviaEmailHtmlDe(pAssunto, Body.Text, pTo, vMailUsuario, GSMLIB.StringsToArray(lstFiles.Items));

    {IdMessage1 := TIdMessage.Create(application);
    IdSMTP1    := TIdSMTP.Create(application);
    if not vMostrarEnviarHTML then
     for i := 0 to lstFIles.Items.Count - 1 do
       TIdAttachment.Create(IdMessage1.MessageParts, lstFiles.Items.Strings[i]);
    with IdMessage1 do
    begin
      if vMostrarEnviarHTML then
      begin
        ContentType := 'text/html' ;
        Body.LoadFromFile(Trim(LstFiles.Items.Text));
        Body.Insert(0,'<HTML>');
        Body.Insert(1,'<BODY>');
        Body.Insert(2,'<center><IMG SRC=http://www.indaialogistica.com.br/img/cabecalho.gif><br><br></center>');
      end
      else
      begin
        Body.Add('');
        Body.Add(reMessageText.Text);
        Body.Add('');
        Body.Add('');
        Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
        Body.Add('');
        Body.Add(' Este é um email gerado automaticamente pelo MyIndaiá.');
        Body.Add(' Dúvidas: myindaia@myindaia.com.br');
        Body.Add('');
        Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
        Body.Add('');
      end;
      From.Text := vMailUsuario;
      ReplyTo.EMailAddresses := vMailUsuario;
      Recipients.EMailAddresses := pTo;
      Subject := pAssunto + ' - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);
    end;
    IdSMTP1.Host := 'mail.indaialogistica.com.br';
    IdSMTP1.Port := 25;
    IdSMTP1.Connect;
    IdSMTP1.Send(IdMessage1);
    IdSMTP1.Disconnect;
    IdMessage1.MessageParts.Clear;
    IdMessage1.Clear;
    IdMessage1.free;
    IdSMTP1.free;}
  end;

  {4 - Designer}
  if RadioGroup_main.ItemIndex = 4 then
  begin
    ppReport1.AllowPrintToArchive :=False;
    ppReport1.AllowPrintToFile :=False;
    ppReport1.ShowPrintDialog := True;
    ppReport1.SaveAsTemplate := false;
    ppDesigner.ShowModal;
    Close;
  end;

  {5 - VINCULAR} // Criado por Michel em 09/03/2009
  if RadioGroup_main.ItemIndex = 5 then
  begin
    ppReport1.AllowPrintToArchive :=False;
    ppReport1.AllowPrintToFile :=True;
    ppReport1.ShowPrintDialog := False;
    ppReport1.DeviceType := 'PDFFile' ; //PDF;
    lblStatus.Caption := 'Gerando arquivo para vincular.';
    ppReport1.SaveAsTemplate := true;
    DeleteFile('C:\Vinculado.pdf');
    ppReport1.TextFileName :=  'C:\Vinculado.pdf';
    try
      ppReport1.Print;
    except
      MessageDlg('Erro gerando o arquivo.'#13'Tente novamente ou informe ao TI.', mtError, [mbOk], 0);
      Exit;
    end;
    sleep(3);
    with datm_main.GetReferenciaDigitalizacao do
      VincularArquivoDigitalizacao(Processo, Instrucao, OutraReferencia.Tabela, OutraReferencia.Referencia, 'C:\Vinculado.pdf', ConsultaLookUP('TTP_DOCTO_DIGITALIZADO',
         'CD_TIPO_DOCTO', qry_relatorios_CD_TIPO_DOCTO.AsString, 'ISNULL(NM_TIPO_DOCTO, '''') AS NM_TIPO_DOCTO'));
    //Application.CreateForm(TfrmDigitalizacao, frmDigitalizacao);
    //frmDigitalizacao.Vincular('C:\Vinculado.pdf', ConsultaLookUP('TTP_DOCTO_DIGITALIZADO',
    //   'CD_TIPO_DOCTO', qry_relatorios_CD_TIPO_DOCTO.AsString, 'ISNULL(NM_TIPO_DOCTO, '''') AS NM_TIPO_DOCTO'));
    //frmDigitalizacao.Release;
    //FreeAndNil(frmDigitalizacao);
    close;
  end;

  lblStatus.Caption := 'Concluído';
end;

procedure TFrm_impressao.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_impressao.SpeedButton3Click(Sender: TObject);
var
  vRetornoFuncao : string;
begin
  vRetornoFuncao := OpenAddressBook(361,388);
  if vRetornoFuncao <> '' then
    eTo.Text := eTo.Text + vRetornoFuncao + ';';
end;

procedure TFrm_impressao.SpeedButton4Click(Sender: TObject);
var
  vRetornoFuncao : string;
begin
  vRetornoFuncao := OpenAddressBook(385,388);
  if vRetornoFuncao <> '' then
    edtCC.Text := edtCC.Text + vRetornoFuncao + ';';
end;

procedure TFrm_impressao.Timer1Timer(Sender: TObject);
begin
  PostMessage(FindWindow(nil,'OUTLOO~1'), WM_CLOSE, 0, 0);
end;

procedure TFrm_impressao.EtoChange(Sender: TObject);
var
  i : Integer;
begin
  eTo.Hint := '';
  for i := 1 to ContaOcorrencias(eTo.Text,';')  do
    eTo.Hint := eTo.Hint + ExtractWord(i,eTo.Text,';') + chr(13);
  eTo.Hint := Copy(eTo.Hint,0,Length(eTo.Hint)-1);
end;

procedure TFrm_impressao.EdtCCChange(Sender: TObject);
var
  i : Integer;
begin
  EdtCC.Hint := '';
  for i := 1 to ContaOcorrencias(EdtCC.Text,';')  do
    EdtCC.Hint := EdtCC.Hint + ExtractWord(i,EdtCC.Text,';') + chr(13);
  EdtCC.Hint := Copy(EdtCC.Hint,0,Length(EdtCC.Hint)-1);
end;

procedure TFrm_impressao.qry_relatorios_AfterScroll(DataSet: TDataSet);
begin
  // Ocultar ou Exibir o botão Vincular do RadioGroup de acordo com o campo de tipo de documento
  TRadioButton(RadioGroup_main.Components[5]).Visible := (qry_relatorios_CD_TIPO_DOCTO.AsString <> '');
  if RadioGroup_main.ItemIndex = 5 then
    RadioGroup_main.ItemIndex := 0;
  // As 3 linhas acima foram utilizadas para substituir as comentadas abaixo - Michel - 15/05/2009
  {if (qry_relatorios_CD_TIPO_DOCTO.AsString = '') and
     (RadioGroup_main.Items[RadioGroup_main.Items.Count -1] = 'Vincular Arquivo') then
  begin
    if RadioGroup_main.ItemIndex = RadioGroup_main.Items.Count -1 then
      RadioGroup_main.ItemIndex := RadioGroup_main.Items.Count -2;
    RadioGroup_main.Items.Delete(RadioGroup_main.Items.Count -1);
  end;
  if (qry_relatorios_CD_TIPO_DOCTO.AsString <> '') and
     (RadioGroup_main.Items[RadioGroup_main.Items.Count -1] <> 'Vincular Arquivo') then
    RadioGroup_main.Items.Add('Vincular Arquivo');}
end;

end.
