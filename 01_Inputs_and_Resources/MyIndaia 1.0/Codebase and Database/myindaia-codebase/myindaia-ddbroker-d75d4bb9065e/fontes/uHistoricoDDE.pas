unit uHistoricoDDE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Db, DBTables, DBCGrids,
  UCRPE32, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppVar, ppBands,
  ppStrtch, ppMemo, ppCtrls, RxGIF, jpeg, ppPrnabl, ppClass, ppCache,
  ppParameter, ppProd, ppReport, MemTable, ppSubRpt;

type
  Tfrm_historico_dde = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ntbHistorico: TNotebook;
    Panel4: TPanel;
    dbgEstagios: TDBCtrlGrid;
    pnlEstagio1: TPanel;
    Shape21: TShape;
    Shape22: TShape;
    Image11: TImage;
    Shape1: TShape;
    qry_dde_estagios: TQuery;
    ds_dde_estagios: TDataSource;
    qry_dde_estagiosNR_PROCESSO: TStringField;
    qry_dde_estagiosIN_CONCLUIDO: TStringField;
    qry_dde_estagiosDT_CONCLUSAO: TDateTimeField;
    qry_dde_estagiosNM_ESTAGIO_BROKER: TStringField;
    qry_dde_estagiosNM_ESTAGIO_SISCOMEX: TStringField;
    qry_dde_estagiosIN_POSSUI_DOCUMENTO: TStringField;
    qry_dde_estagiosNM_BSL: TStringField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Shape2: TShape;
    DBText1: TDBText;
    DBText2: TDBText;
    SpeedButton3: TSpeedButton;
    DBText3: TDBText;
    DBText4: TDBText;
    Shape3: TShape;
    imgDoc: TImage;
    imgPrinter: TImage;
    Panel5: TPanel;
    SpeedButton4: TSpeedButton;
    Shape4: TShape;
    Label5: TLabel;
    qry_dde_estagiosCD_TIPO: TIntegerField;
    DBMemo1: TDBMemo;
    Shape5: TShape;
    Shape6: TShape;
    qry_dde_estagiosTX_DOCUMENTO_SISCOMEX: TMemoField;
    crp_historico: TCRPE;
    qryRelProcesso: TQuery;
    dsRelProcesso: TDataSource;
    dsCnt: TDataSource;
    qryCntr: TQuery;
    qryRelProcessoNR_PROCESSO: TStringField;
    qryRelProcessoNR_PROC: TStringField;
    qryRelProcessoCONTATO: TStringField;
    qryRelProcessoDESTINO: TStringField;
    qryRelProcessoEMBARCADOR: TStringField;
    qryRelProcessoARMAZEM: TStringField;
    qryCntrNR_LACRE: TStringField;
    ppBDEProcesso: TppBDEPipeline;
    ppBDECntr: TppBDEPipeline;
    qryRelProcessoTX_DOCUMENTO_SISCOMEX: TMemoField;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    mtTextoDDE: TMemoryTable;
    mtTextoDDETELA_SISCOMEX: TStringField;
    mtTextoDDEPROCESSO: TStringField;
    dsTextoDDE: TDataSource;
    BDETextoDDE: TppBDEPipeline;
    qryRelProcessoNM_ESTAGIO_BROKER: TStringField;
    qryRelProcessocalcContato: TStringField;
    qryRelProcessoAGENTE: TStringField;
    qryCntrNR_CNTR: TStringField;
    qryCntrNM_TP_CNTR: TStringField;
    qryCntrNR_LACRE_SIF: TStringField;
    ppBDECntrppField3: TppField;
    ppBDECntrppField4: TppField;
    qryRelProcessoLISTA_RE: TStringField;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppImage1: TppImage;
    ppImage3: TppImage;
    ppImage4: TppImage;
    ppLabel1: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape3: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine5: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppShape6: TppShape;
    ppLabel12: TppLabel;
    ppDBText4: TppDBText;
    ppShape7: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel19: TppLabel;
    ppLabel11: TppLabel;
    ppLabel10: TppLabel;
    ppLabel6: TppLabel;
    ppLabel4: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText12: TppDBText;
    ppLabel22: TppLabel;
    ppDBText13: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppImage7: TppImage;
    ppShape8: TppShape;
    ppDetailBand1: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLabel9: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppImage2: TppImage;
    ppLabel5: TppLabel;
    qryRelProcessoBOOKING_ARMADOR: TMemoField;
    qryRelProcessoBOOKING_CO_LOADER: TMemoField;
    qryRelProcessoREF_CLIENTE: TMemoField;
    procedure dbgEstagiosPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure FormShow(Sender: TObject);
    procedure pnlEstagioClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure imgPrinterClick(Sender: TObject);
    procedure ds_dde_estagiosStateChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qryRelProcessoCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_historico_dde: Tfrm_historico_dde;

implementation

uses  FuncoesExport, ConsOnLineEx, uDDE, dDDE, PGGP001, PGSM990, PGGP017, Funcoes;

{$R *.DFM}

procedure Tfrm_historico_dde.dbgEstagiosPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin
  if (TQuery(TDataSource(dbgEstagios.DataSource).DataSet).FieldByName('IN_CONCLUIDO').AsString = '1') then
  begin
    DBEdit2.Font.Color  := clBlack;
    DBEdit1.Font.Color  := clNavy;
    DBEdit2.Color       := $00BEEFE9;
    DBEdit1.Color       := $00BEEFE9;
    Shape1.Brush.Color  := $00BEEFE9;
    Shape21.Brush.Color := $00BEEFE9;
    Shape22.Brush.Color := $00BEEFE9;
    Shape2.Brush.Color  := $00BEEFE9;
    Image11.Visible     := True;
    Shape21.Brush.Color := $00A6FFFF;
    imgDoc.Visible      := True;
    imgPrinter.Visible  := True;
  end
  else
  begin
    DBEdit2.Font.Color  := clGray;
    DBEdit1.Font.Color  := clGray;
    DBEdit2.Color       := clBtnFace;
    DBEdit1.Color       := clBtnFace;
    Shape1.Brush.Color  := clBtnFace;
    Shape21.Brush.Color := clBtnFace;
    Shape22.Brush.Color := clBtnFace;
    Shape2.Brush.Color  := clBtnFace;
    Image11.Visible     := False;
    Shape21.Brush.Color := $00E1F2F2;
    imgDoc.Visible      := False;                                   
    imgPrinter.Visible  := False;
  end;
end;

procedure Tfrm_historico_dde.FormShow(Sender: TObject);
begin
  ntbHistorico.ActivePage := 'ntbSituacao';
  qry_dde_estagios.Open;
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TOP 1 NM_ESTAGIO_BROKER FROM TSD_ESTAGIOS');
    SQL.Add('WHERE NR_PROCESSO = ''' + qry_dde_estagiosNR_PROCESSO.AsString + '''');
    SQL.Add('AND IN_CONCLUIDO = ''1''');
    SQL.Add('ORDER BY CD_TIPO DESC');
    Open;
    Label6.Caption := Fields[0].AsString;
    Close;
    Free;
  end;
end;

procedure Tfrm_historico_dde.pnlEstagioClick(Sender: TObject);
begin
  ntbHistorico.ActivePage := 'ntbVisualizacao';
end;

procedure Tfrm_historico_dde.SpeedButton3Click(Sender: TObject);
begin
  ntbHistorico.ActivePage := 'ntbSituacao';
end;

procedure Tfrm_historico_dde.SpeedButton4Click(Sender: TObject);
var
  posicao, vFileName, vAux, vSituacao : string;
  H : HWnd;
  F : TextFile;
  vList : TStringList;
  vPresenca : Boolean;
begin
  try
    vFileName := copy(StringReplace(datm_dde.qry_ddeNR_SD.AsString,'-','',[rfReplaceAll]),5,6);
    if Trim(vFileName) = '' then
      Exit;
    if Trim(datm_dde.qry_dde.FieldByName('CPF_USUARIO').AsString) = '' then
    begin
      //troca da tabela TACESSO_SCX_EXP pela view VW_DESPACHANTE_CLIENTE - carlos 17/09/2009
      if not ConsultaDDE( vFileName, ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE','Escolha o Usuário',['CD_ACESSO','NM_USUARIO','CPF_USUARIO'],['Código','Usuário','CPF'],'CPF_USUARIO','TIPO="DDE" AND CD_EMPRESA="'+datm_dde.qry_ddeCD_EXPORTADOR.AsString +'"' , nil,'' )) then
      begin
        MessageDlg('Ocorreu um erro na geração do arquivo.' + #10#13 + 'Favor informar o ocorrido ao Suporte', mtError, [mbOK], 0);
        Exit;
      end;
    end
    else
    begin
      if not ConsultaDDE( vFileName, '') then
      begin
        MessageDlg('Ocorreu um erro na geração do arquivo.' + #10#13 + 'Favor informar o ocorrido ao Suporte  ', mtError, [mbOK], 0);
        exit;
      end;
    end;
    posicao := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
    datm_dde.qry_dde.DisableControls;
    datm_dde.qry_dde.Close;
    datm_dde.qry_dde.Open;
    datm_dde.qry_dde.Locate('NR_SD',posicao,[]);
    datm_dde.qry_dde.EnableControls;
    Application.MessageBox(PChar(IIF(datm_dde.qry_dde.FieldByName('TX_SITUCAO_DDE').AsString = '',
                           'Processo Consultado !!', 'Processo não foi consultado corretamente. ' +
                           'Verifique o campo Situação da DDE')), 'Mensagem', mb_Ok + mb_IconInformation);
  finally
    TerminateProcesso('ntvdm.exe');
  end;
end;

procedure Tfrm_historico_dde.imgPrinterClick(Sender: TObject);
var
  vArquivoRE : TStringList;
  i : Integer;
begin
  try
    mtTextoDDE.Open;
    vArquivoRE := TStringList.Create;
    vArquivoRE.Assign(qry_dde_estagiosTX_DOCUMENTO_SISCOMEX);
    for i := 0 to vArquivoRE.Count - 1 do
    begin
      if Pos('SISCOMEX',vArquivoRE.Strings[i]) > 0 then
      begin                                            
        if mtTextoDDE.State in [dsInsert] then
          mtTextoDDE.Post;
        mtTextoDDE.Insert;
        mtTextoDDE.FieldByName('PROCESSO').AsString := qry_dde_estagiosNR_PROCESSO.AsString;
      end;
      if mtTextoDDE.State in [dsInsert] then
        mtTextoDDE.FieldByName('TELA_SISCOMEX').AsString := mtTextoDDE.FieldByName('TELA_SISCOMEX').AsString + #10 + vArquivoRE.Strings[i];
    end;
    if mtTextoDDE.State in [dsInsert] then
      mtTextoDDE.Post;

    qryRelProcesso.Close;
    qryRelProcesso.ParamByName('NR_PROCESSO').AsString := qry_dde_estagiosNR_PROCESSO.AsString;
    qryRelProcesso.ParamByName('CD_TIPO').AsInteger    := qry_dde_estagiosCD_TIPO.AsInteger;
    qryRelProcesso.Open;
    qryCntr.Close;
    qryCntr.Open;
    //ppReport1.Print;

    Application.CreateForm(TFrm_impressao, Frm_impressao );
    Frm_impressao.cd_unid_neg   := Copy(qry_dde_estagiosNR_PROCESSO.AsString, 1, 2);
    Frm_impressao.cd_produto    := Copy(qry_dde_estagiosNR_PROCESSO.AsString, 3, 2);
    Frm_impressao.cd_modulo     := '2022';
    Frm_impressao.ShowModal;
  finally
    vArquivoRE.Free;
    mtTextoDDE.EmptyTable;
    mtTextoDDE.Close;
  end;



end;

procedure Tfrm_historico_dde.ds_dde_estagiosStateChange(Sender: TObject);
begin
  SpeedButton2.Enabled := IIF(qry_dde_estagios.state = dsEdit, True, False);
end;

procedure Tfrm_historico_dde.SpeedButton2Click(Sender: TObject);
begin
  qry_dde_estagios.Post;
end;

procedure Tfrm_historico_dde.qryRelProcessoCalcFields(DataSet: TDataSet);
begin
  qryRElProcessocalcContato.AsString := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'NM_USUARIO');
end;

procedure Tfrm_historico_dde.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryCntr.Active then
    qryCntr.Close;
  if qryRelProcesso.Active then
    qryRelProcesso.Close;
  if qry_dde_estagios.Active then
    qry_dde_estagios.Close;
  if mtTextoDDE.Active then
    mtTextoDDE.Close;
  Action := caFree;
end;

end.

