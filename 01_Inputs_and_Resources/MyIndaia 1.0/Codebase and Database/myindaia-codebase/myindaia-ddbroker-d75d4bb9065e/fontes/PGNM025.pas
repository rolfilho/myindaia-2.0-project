unit PGNM025;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Menus, DB, DBTables, Mask, UCRPE32,
  DBCGrids, Funcoes, PGGP017, ppBands, ppCtrls, RxGIF, ppPrnabl, ppClass,
  ppCache, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ConsOnLineEx,
  ppModule, raCodMod, ppStrtch, ppSubRpt, ppDB, ppDBPipe, ppDBBDE;

type
  Tfrm_print_recibo = class(TForm)
    pnl_print: TPanel;
    pnl_dados: TPanel;
    btn_incluir_ref: TSpeedButton;
    btn_salvar_ref: TSpeedButton;
    Label1: TLabel;
    lbl_cliente: TLabel;
    Label2: TLabel;
    lbl_quantia: TLabel;
    Label3: TLabel;
    dbmemo_referente: TDBMemo;
    btn_memo_ref_: TSpeedButton;
    lbl_valor: TLabel;
    btn_cancelar_ref: TSpeedButton;
    btn_excluir_ref: TSpeedButton;
    btn_imprimir_recibo: TSpeedButton;
    btn_sair: TSpeedButton;
    menu: TMainMenu;
    mi_incluir_ref: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar_referencia: TMenuItem;
    mi_excluir_referencia: TMenuItem;
    mi_imprimir_recibo: TMenuItem;
    mi_sair: TMenuItem;
    dbnav_ref: TDBNavigator;
    lbl_data: TLabel;
    crystallRecibo: TCrpe;
    dbctrlGrid_Ref: TDBCtrlGrid;
    dbmemoref_: TDBMemo;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Label4: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppi1: TppImage;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    dsGeral: TDataSource;
    qryGeral: TQuery;
    qryDetalhe: TQuery;
    dsDetalhe: TDataSource;
    qryGeralNR_PROC: TStringField;
    qryGeralNR_PROCESSO: TStringField;
    qryGeralNR_RECEBIMENTO: TStringField;
    qryGeralCD_CLIENTE: TStringField;
    qryGeralCD_UNID_NEG: TStringField;
    qryGeralCIDADE_UNID: TStringField;
    qryGeralVL_RECEBIMENTO: TFloatField;
    qryGeralNM_EMPRESA: TStringField;
    qryGeralNR_CONHECIMENTO: TStringField;
    qryGeralNAVIO: TStringField;
    qryGeralNR_VIAGEM_ARMADOR: TStringField;
    qryGeralORIGEM: TStringField;
    qryGeralDESTINO: TStringField;
    qryGeralDT_ATRACACAO: TDateTimeField;
    qryGeralcalcUsuario: TStringField;
    qryGeralcalcExtenso: TStringField;
    qryGeralcalcCNTR: TStringField;
    qryGeralcalcData: TStringField;
    qryDetalheNM_ITEM: TStringField;
    qryDetalheMOEDA: TStringField;
    qryDetalheVL_ORIGINAL: TFloatField;
    qryDetalheVL_TARIFA: TFloatField;
    qryDetalheVL_RECEBIDO: TFloatField;
    ppBDETotal: TppBDEPipeline;
    ppBDEDetalhe: TppBDEPipeline;
    ppSub: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppShape17: TppShape;
    ppLabel5: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine2: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    qryGeralcalcNavio: TStringField;
    ppLabel27: TppLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluir_refClick(Sender: TObject);
    procedure btn_salvar_refClick(Sender: TObject);
    procedure btn_cancelar_refClick(Sender: TObject);
    procedure btn_excluir_refClick(Sender: TObject);
    procedure btn_imprimir_reciboClick(Sender: TObject);
    procedure dbmemo_referenteChange(Sender: TObject);
    procedure verifica_estado;
    procedure Ver_Alt;
    procedure dbmemoref_DblClick(Sender: TObject);
    procedure btn_memo_ref_Click(Sender: TObject);
    procedure qryGeralCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_proc, nr_receb, cd_cliente, nr_fp: String;
    cd_usuario : String[4];
    vl_recibo  : double;
  end;

var
  frm_print_recibo: Tfrm_print_recibo;

implementation

uses PGNM026, GSMLIB, PGNM004, PGGP001, PGSM990;

{$R *.DFM}

procedure Tfrm_print_recibo.verifica_estado;
begin
   with frm_print_recibo do
   begin
      btn_incluir_ref.Enabled             := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      mi_incluir_ref.Enabled              := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      btn_excluir_ref.Enabled             := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      mi_excluir_referencia.Enabled       := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      btn_imprimir_recibo.Enabled         := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      mi_imprimir_recibo.Enabled          := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      btn_salvar_ref.Enabled              := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
      mi_salvar.Enabled                   := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
      btn_cancelar_ref.Enabled            := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
      mi_cancelar_referencia.Enabled      := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
   end;
end;

procedure Tfrm_print_recibo.Ver_Alt;
begin
   if datm_print_recibo.qry_ref_.State in [dsInsert,dsEdit] then
   begin
      if BoxMensagem('O cadastro de notas de refência foi alterado. Salva alterações?',1) then
        btn_salvar_refClick(nil)
      else
        btn_cancelar_refClick(nil);
   end;
   verifica_estado;
end;

procedure Tfrm_print_recibo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_print_recibo.FormClose(Sender: TObject; var Action: TCloseAction);
  var i: Integer;
begin
   Ver_Alt;
   for i := 0 to datm_print_recibo.ComponentCount - 1 do
   begin
      if Components[i] is TQuery then ( Components[i] as tQuery ).Close;
      if Components[i] is TTable then ( Components[i] as tTable ).Close;
   end;
   datm_print_recibo.Free;
   Action := caFree;
end;

procedure Tfrm_print_recibo.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_print_recibo, datm_print_recibo );
//  datm_print_recibo.qry_ref_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  datm_print_recibo.qry_ref_.Prepare;
  datm_print_recibo.qry_ref_.Open;
  pnl_Print.Color     := clMenuBroker;
  pnl_Dados.Color     := clPnlClaroBroker;
  Shape11.Brush.Color := clBtnFace;
  Shape5.Brush.Color  := clMenuBroker;
  Shape6.Brush.Color  := clMenuBroker;
  Shape7.Brush.Color  := clMenuBroker;
  Shape8.Brush.Color  := clMenuBroker;
  Shape9.Brush.Color  := clMenuBroker;
  Shape10.Brush.Color := clMenuBroker;
end;

procedure Tfrm_print_recibo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_print_recibo.btn_incluir_refClick(Sender: TObject);
begin
  with datm_print_recibo do
  begin
     qry_ref_.Insert;
  end;
  verifica_estado;
  dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo.btn_salvar_refClick(Sender: TObject);
var codigo: String;
begin
   with datm_print_recibo.qry_ref_ do
   begin
     try
        ActiveControl := nil;
        FieldByName('CD_USUARIO').AsString := str_cd_usuario;
        Post;
        codigo := FieldByName('CD_REFERENCIA').asString;
        Close;
        Open;
        Locate('CD_REFERENCIA', codigo, [] );
     except
        BoxMensagem( 'Não foi possível gravar!', 2 );
        verifica_estado;
     end;
   end;
   verifica_estado;
   dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo.btn_cancelar_refClick(Sender: TObject);
begin
  datm_print_recibo.qry_ref_.Cancel;
  verifica_estado;
  dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo.btn_excluir_refClick(Sender: TObject);
begin
  if BoxMensagem('Deseja mesmo apagar este registro?',1) then
  begin
    try
      datm_print_recibo.qry_ref_.Delete;
      datm_print_recibo.qry_ref_.Close;
      datm_print_recibo.qry_ref_.Open;
    except
    end;
  end;
  verifica_estado;
  dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo.btn_imprimir_reciboClick(Sender: TObject);
var
  vStrReferencias, vCdServico : string;

begin
  Screen.Cursor := crHourGlass;
  Ver_Alt;
  vCdServico := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', nr_proc, 'CD_SERVICO');

  //caso agenciamento - imprimi recibo fi, senão imprime recibo normal
  if ConsultaLookUp('TSERVICO', 'CD_SERVICO', vCdServico, 'TP_SERVICO') = '1' then begin
    qryGeral.Close;
    qryGeral.ParamByName('CD_CLIENTE').AsString := cd_cliente;
    qryGeral.ParamByName('NR_RECEBIMENTO').AsString := nr_receb;
    qryGeral.ParamByName('NR_PROCESSO').AsString := nr_proc;
    qryGeral.ParamByName('CD_UNID_NEG').AsString := Copy(nr_proc, 1, 2);
    qryGeral.Open;
    qryDetalhe.Close;
    qryDetalhe.Open;
//    ppReport1.Print;
        //chama o form de impressão!!
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := Copy(nr_proc, 1, 2);
    frm_impressao.cd_produto    := '';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_modulo     := '0609';
    frm_impressao.vApenas_email := false;
    frm_impressao.ShowModal;
    frm_impressao.Release;


  end else begin
    with crystallRecibo do
    begin
      Connect     := 'DSN=BROKER; UID=' + str_nm_admin + '; PWD=' + str_nm_senha + '; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRNM008.RPT';
      ReportTitle := 'Recibo de Numerário';
      Formulas[0] := 'nr_processo = "'+ nr_proc + '"';
      Formulas[1] := 'ValorNum = "'+ lbl_valor.Caption + '"';
      Formulas[2] := 'ValorStr = "'+ Extenso( vl_recibo ) + '"';
      Formulas[3] := 'CodRef = "'+ datm_print_recibo.qry_ref_CD_REFERENCIA.AsString + '"';
      Formulas[4] := 'DtEmissao = "' + lbl_data.Caption + '"';
      Formulas[5] := 'Cliente = "' + lbl_cliente.Caption + '"';
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' SELECT TOP 8 RTRIM(LTRIM(CD_REFERENCIA)) + ''/'' + RTRIM(LTRIM(NR_ITEM_PO)) FROM TREF_CLIENTE WHERE NR_PROCESSO = ''' + nr_proc + '''');
        Open;
        while not EOF do
        begin
          if Copy(Fields[0].AsString,Length(Fields[0].AsString),1) = '/' then
            vStrReferencias := vStrReferencias + ' - ' + Copy(Fields[0].AsString,0,Length(Fields[0].AsString)-1)
          else
            vStrReferencias := vStrReferencias + ' - ' + Fields[0].AsString;

          Next;
        end;
        Formulas[6] := 'referencia = "'+ Copy(vStrReferencias,3,Length(vStrReferencias)) + '"';
        Close;
        Free;
      end;
      if nr_fp <> '' then
        Formulas[7] := 'nrFp = "SPE : '+ nr_fp + '"'
      else Formulas[7] := 'nrFp = "'+nr_fp+'"';

      (* Nº da Fatura *)
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' SELECT TOP 1 F.NR_NOTA_FATURA FROM TS_FATURA_PROCESSO FS (NOLOCK), TS_FATURA F (NOLOCK) WHERE FS.NR_SOLICITACAO = F.NR_SOLICITACAO AND NR_PROCESSO = ''' + nr_proc + '''');
        Open;
        if RecordCount <> 0 then
          Formulas[8] := 'fatura = "  -  Fatura:  ' + Fields[0].AsString + '"'
        else
          Formulas[8] := ' ';
        Close;
        Free;
      end;

      Execute;
    end;
  end;
  Screen.Cursor  := crDefault;
end;

procedure Tfrm_print_recibo.dbmemo_referenteChange(Sender: TObject);
begin
  verifica_estado;
end;

procedure Tfrm_print_recibo.dbmemoref_DblClick(Sender: TObject);
begin
  dbctrlGrid_Ref.Visible := False;
end;

procedure Tfrm_print_recibo.btn_memo_ref_Click(Sender: TObject);
begin
  dbctrlGrid_Ref.Visible := True;
end;

procedure Tfrm_print_recibo.qryGeralCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcUsuario').AsString := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'NM_USUARIO');
  DataSet.FieldByName('calcExtenso').AsString := lbl_quantia.Caption;
  DataSet.FieldByName('calcData').AsString :=  DataSet.FieldByName('CIDADE_UNID').AsString + ', ' + lbl_data.Caption + '.';
  DataSet.FieldByName('calcNavio').AsString :=  DataSet.FieldByName('NAVIO').AsString + '/' + DataSet.FieldByName('NR_VIAGEM_ARMADOR').AsString;
  DataSet.FieldByName('calcCNTR').AsString := '';
  with TQuery.Create(application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT RTRIM(LTRIM(SUBSTRING(NR_CNTR, 1, 4))) + "-" +  RTRIM(LTRIM(SUBSTRING(NR_CNTR, 5, 3))) + "-" + ');
    SQL.Add(' RTRIM(LTRIM(SUBSTRING(NR_CNTR, 8, 3))) + "-" + RTRIM(LTRIM(SUBSTRING(NR_CNTR, 11, 1))) +  ", " ');
    SQL.Add('  FROM TPROCESSO_CNTR (NOLOCK) WHERE NR_PROCESSO = "' + nr_proc + '" ');
    Open;
    while not Eof do begin
      DataSet.FieldByName('calcCNTR').AsString :=   DataSet.FieldByName('calcCNTR').AsString + Fields[0].AsString;
      Next;
    end;
    Free;
  end;
  DataSet.FieldByName('calcCNTR').AsString := Copy(DataSet.FieldByName('calcCNTR').AsString, 1, Length(DataSet.FieldByName('calcCNTR').AsString) - 1);
end;

end.
