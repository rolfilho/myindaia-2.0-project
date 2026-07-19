unit uIntFORDExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, StrUtils, Mask, ComObj, ToolEdit, Grids, ADODB,
  DBGrids, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, Excel2000,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GSMLIB;

type
  TfrmIntFORDExp = class(TForm)
    btnIntegrar: TBitBtn;
    fleArquivo: TFilenameEdit;
    Label1: TLabel;
    edtFatura: TEdit;
    lblFatura: TLabel;
    BitBtn1: TBitBtn;
    procedure btnIntegrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function IntegrarArquivo(AArquivo: String): Boolean;
    { Private declarations }
  public

  end;

var
  frmIntFORDExp: TfrmIntFORDExp;

implementation
{$R *.DFM}
uses PGSM990, dIntFORDExp;


function TfrmIntFORDExp.IntegrarArquivo(AArquivo: String): Boolean;
var
  //controle da planilha
  ExcelApp: TExcelApplication;
  ExcelWB : TExcelWorkbook;
  ExcelWS : TExcelWorksheet;
  vInsereCapa, vLinha: Integer;

  //consultas e conexoes
  conBroker : TADOConnection;
  cmdBroker : TADOCommand;
  qryCapa: TADOQuery;
  qryItens: TADOQuery;

  //capa
  NrFatura: String;
  ExportadorNome: String;
  ExportadorEndNum: String;
  ExportadorEndCep: String;
  ImportadorNome: String;
  ImportadorEndNum: String;
  ImportadorCidadePais: String;
  ConsignatarioNome: String;
  ConsignatarioPais: String;
  PortoDescricao: String;
  NmViaTransporte: String;
  NmPaisDestino: String;
  DtFatura: TDateTime;
  TxNormaOrigem: String;
  TxObs: String;
  TxObs1: String;
  TxObs2: String;

  //itens
  NrNCMMercadoria: String;
  NrNALADIMercadoria: String;
  TxMercadoria: String;
  QtMercadoria: Double;
  VlMercadoria: Double;
begin
  //criação dos objetos e conexões
  conBroker := TADOConnection.Create(nil);
  cmdBroker := TADOCommand.Create(nil);
  qryCapa   := TADOQuery.Create(nil);
  qryItens  := TADOQuery.Create(nil);

  if VersaoTeste then
     ServidorEmUso := 'ANTUERPIA'
  else
     ServidorEmUso := 'INDAIA10';

  with conBroker do
  begin
    Provider := 'SQLOLEDB.1';
    ConnectionString :=
      'Provider=SQLOLEDB.1;Data Source='''+ ServidorEmUso + ''';Initial Catalog=BROKER;' +
      'User ID=SA;Password=123;Persist Security Info=True;';
    CursorLocation := clUseServer;
    LoginPrompt := False;
    Connected := True;
  end;

  with cmdBroker do
  begin
    CommandTimeout := 200;
    CommandType := cmdText;
    Connection := conBroker;
    ExecuteOptions := [eoExecuteNoRecords];
  end;

  qryCapa.Connection := conBroker;
  qryItens.Connection := conBroker;

  ExcelApp  := TExcelApplication.Create(nil);
  ExcelWB   := TExcelWorkbook.Create(nil);
  ExcelWS   := TExcelWorksheet.Create(nil);

  try
    ExcelApp.Workbooks.Open(AArquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
       EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
    try

      ExcelWB.ConnectTo(ExcelApp.ActiveWorkbook);
      ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] as ExcelWorksheet);

      vInsereCapa := 1;
      vLinha := 3;
      while not (ExcelWS.Range['A' + IntToStr(vLinha), 'A' + IntToStr(vLinha)].Text = '') do
      begin
        if vInsereCapa = 1 then
        begin
          NrFatura             := ExcelWS.Range['B' + IntToStr(vLinha), 'B' + IntToStr(vLinha)].Text;
          ExportadorNome       := ExcelWS.Range['J' + IntToStr(vLinha), 'J' + IntToStr(vLinha)].Text;
          ExportadorEndNum     := ExcelWS.Range['K' + IntToStr(vLinha), 'K' + IntToStr(vLinha)].Text;
          ExportadorEndCep     := ExcelWS.Range['L' + IntToStr(vLinha), 'L' + IntToStr(vLinha)].Text;
          ImportadorNome       := ExcelWS.Range['M' + IntToStr(vLinha), 'M' + IntToStr(vLinha)].Text;
          ImportadorEndNum     := ExcelWS.Range['N' + IntToStr(vLinha), 'N' + IntToStr(vLinha)].Text;
          ImportadorCidadePais := ExcelWS.Range['O' + IntToStr(vLinha), 'O' + IntToStr(vLinha)].Text + '/' + ExcelWS.Range['P' + IntToStr(vLinha), 'P' + IntToStr(vLinha)].Text;
          ConsignatarioNome    := ExcelWS.Range['M' + IntToStr(vLinha), 'M' + IntToStr(vLinha)].Text;
          ConsignatarioPais    := ExcelWS.Range['P' + IntToStr(vLinha), 'P' + IntToStr(vLinha)].Text;
          PortoDescricao       := ExcelWS.Range['U' + IntToStr(vLinha), 'U' + IntToStr(vLinha)].Text;
          NmViaTransporte      := ExcelWS.Range['A' + IntToStr(vLinha), 'A' + IntToStr(vLinha)].Text;
          NmPaisDestino        := ExcelWS.Range['I' + IntToStr(vLinha), 'I' + IntToStr(vLinha)].Text;
          DtFatura             := StrToDateTime(ExcelWS.Range['C' + IntToStr(vLinha), 'C' + IntToStr(vLinha)].Text);
          TxNormaOrigem        := ExcelWS.Range['Q' + IntToStr(vLinha), 'Q' + IntToStr(vLinha)].Text;
          TxObs                := ExcelWS.Range['R' + IntToStr(vLinha), 'R' + IntToStr(vLinha)].Text;
          TxObs1               := ExcelWS.Range['S' + IntToStr(vLinha), 'S' + IntToStr(vLinha)].Text;
          TxObs2               := ExcelWS.Range['T' + IntToStr(vLinha), 'T' + IntToStr(vLinha)].Text;

          //Insere valores na capa
          with qryCapa do
          begin
            SQL.Clear;
            SQL.Add(' DELETE FROM TEXP_CO_CAPA WHERE NR_FATURA = :NR_FATURA');
            Parameters.ParamByName('NR_FATURA').Value := NrFatura;
            ExecSQL;
            SQL.Clear;
            SQL.Add(' DELETE FROM TEXP_CO_ITENS WHERE NR_FATURA = :NR_FATURA');
            Parameters.ParamByName('NR_FATURA').Value := NrFatura;
            ExecSQL;
            SQL.Clear;
            SQL.Add(' INSERT INTO TEXP_CO_CAPA(NR_FATURA, EXPORTADOR_NOME, EXPORTADOR_ENDERECO_NUM, EXPORTADOR_END_CIDADE_UF_CEP,');
            SQL.Add('   IMPORTADOR_NOME, IMPORTADOR_ENDERECO_NUM, IMPORTADOR_CIDADE_PAIS,');
            SQL.Add('   CONSIGNATARIO_NOME, CONSIGNATARIO_NM_PAIS, PORTO_DESCRICAO, NM_VIA_TRANSPORTE, NM_PAIS_DESTINO,');
            SQL.Add('   DT_FATURA, TX_NORMA_ORIGEM, TX_OBS, TX_OBS_1, TX_OBS_2)');
            SQL.Add(' VALUES(:NR_FATURA, :EXPORTADOR_NOME, :EXPORTADOR_ENDERECO_NUM, :EXPORTADOR_END_CIDADE_UF_CEP,');
            SQL.Add('   :IMPORTADOR_NOME, :IMPORTADOR_ENDERECO_NUM, :IMPORTADOR_CIDADE_PAIS,');
            SQL.Add('   :CONSIGNATARIO_NOME, :CONSIGNATARIO_NM_PAIS, :PORTO_DESCRICAO, :NM_VIA_TRANSPORTE, :NM_PAIS_DESTINO,');
            SQL.Add('   :DT_FATURA, :TX_NORMA_ORIGEM, :TX_OBS, :TX_OBS_1, :TX_OBS_2 )');
            Parameters.ParamByName('NR_FATURA').Value                    := NrFatura;
            Parameters.ParamByName('EXPORTADOR_NOME').Value              := ExportadorNome;
            Parameters.ParamByName('EXPORTADOR_ENDERECO_NUM').Value      := ExportadorEndNum;
            Parameters.ParamByName('EXPORTADOR_END_CIDADE_UF_CEP').Value := ExportadorEndCep;
            Parameters.ParamByName('IMPORTADOR_NOME').Value              := ImportadorNome;
            Parameters.ParamByName('IMPORTADOR_ENDERECO_NUM').Value      := ImportadorEndNum;
            Parameters.ParamByName('IMPORTADOR_CIDADE_PAIS').Value       := ImportadorCidadePais;
            Parameters.ParamByName('CONSIGNATARIO_NOME').Value           := ConsignatarioNome;
            Parameters.ParamByName('CONSIGNATARIO_NM_PAIS').Value        := ConsignatarioPais;
            Parameters.ParamByName('PORTO_DESCRICAO').Value              := PortoDescricao;
            Parameters.ParamByName('NM_VIA_TRANSPORTE').Value            := NmViaTransporte;
            Parameters.ParamByName('NM_PAIS_DESTINO').Value              := NmPaisDestino;
            Parameters.ParamByName('DT_FATURA').Value                    := DtFatura;
            Parameters.ParamByName('TX_NORMA_ORIGEM').Value              := TxNormaOrigem;
            Parameters.ParamByName('TX_OBS').Value                       := TxObs;
            Parameters.ParamByName('TX_OBS_1').Value                     := TxObs1;
            Parameters.ParamByName('TX_OBS_2').Value                     := TxObs2;
            ExecSQL;
          end;
          vInsereCapa := 0;
        end;
        NrFatura           := ExcelWS.Range['B' + IntToStr(vLinha), 'B' + IntToStr(vLinha)].Text;
        NrNCMMercadoria    := ExcelWS.Range['E' + IntToStr(vLinha), 'E' + IntToStr(vLinha)].Text;
        NrNALADIMercadoria := ExcelWS.Range['F' + IntToStr(vLinha), 'F' + IntToStr(vLinha)].Text;
        TxMercadoria       := ExcelWS.Range['D' + IntToStr(vLinha), 'D' + IntToStr(vLinha)].Text;
        QtMercadoria       := StrToFloat(ExcelWS.Range['G' + IntToStr(vLinha), 'G' + IntToStr(vLinha)].Text);
        VlMercadoria       := StrToFloat(StringReplace(ExcelWS.Range['H' + IntToStr(vLinha), 'H' + IntToStr(vLinha)].Text,'.','',[rfReplaceAll]));

        //Insere valores nos itens
        with qryItens do
        begin
          SQL.Clear;
          SQL.Add(' INSERT INTO TEXP_CO_ITENS (NR_FATURA, NR_NCM_MERCADORIA, NR_NALADI_MERCADORIA, TX_MERCADORIA, PL_MERCADORIA, VL_MERCADORIA)');
          SQL.Add(' VALUES(:NR_FATURA, :NR_NCM_MERCADORIA, :NR_NALADI_MERCADORIA, :TX_MERCADORIA, :PL_MERCADORIA, :VL_MERCADORIA)');
          Parameters.ParamByName('NR_FATURA').Value            := NrFatura;
          Parameters.ParamByName('NR_NCM_MERCADORIA').Value    := NrNCMMercadoria;
          Parameters.ParamByName('NR_NALADI_MERCADORIA').Value := NrNALADIMercadoria;
          Parameters.ParamByName('TX_MERCADORIA').Value        := TxMercadoria;
          Parameters.ParamByName('PL_MERCADORIA').Value        := QtMercadoria;
          Parameters.ParamByName('VL_MERCADORIA').Value        := VlMercadoria;
          ExecSQL;
        end;
        Inc(vLinha);
      end;
    finally
      ShowMessage('ATENÇÃO: Fatura integrada com sucesso!');
      ExcelWS.Disconnect;
      ExcelWB.Disconnect;
      ExcelApp.Quit;
    end;
  finally
    FreeAndNil(ExcelWS);
    FreeAndNil(ExcelWB);
    FreeAndNil(ExcelApp);
    FreeAndNil(qryCapa);
    FreeAndNil(qryItens);
  end;
end;

procedure TfrmIntFORDExp.btnIntegrarClick(Sender: TObject);
begin
  if (fleArquivo.FileName = '') or not FileExists(fleArquivo.FileName) then
  begin
    fleArquivo.SetFocus;
    MessageDlg('ATENÇÃO: Informe um arquivo válido.', mtError, [mbOk], 0);
  end
  else
    IntegrarArquivo(fleArquivo.FileName);
end;

procedure TfrmIntFORDExp.BitBtn1Click(Sender: TObject);
begin
  datmFordExp.qryExpCOCapa.Close;
  datmFordExp.qryExpCOCapa.ParamByName('NR_FATURA').AsString  := edtFatura.Text;
  datmFordExp.qryExpCOCapa.Open;

  if (datmFordExp.qryExpCOCapa.Eof) then
  begin
    ShowMessage('ATENÇÃO: Esta fatura ainda não foi integrada no sistema!');
    datmFordExp.qryExpCOCapa.Close;
  end
  else
  begin
    datmFordExp.qryExpCONCM.Close;
    datmFordExp.qryExpCONCM.ParamByName('NR_FATURA').AsString := Trim(edtFatura.Text);
    datmFordExp.qryExpCONCM.Open;

    datmFordExp.qryExpCOItens.Close;
    datmFordExp.qryExpCOItens.ParamByName('NR_FATURA').AsString := Trim(edtFatura.Text);
    datmFordExp.qryExpCOItens.Open;

    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := '01';
    frm_impressao.cd_produto    := '02';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_modulo     := '3203';
    frm_impressao.cd_grupo      := '';
    frm_impressao.in_processo   := '0';
    frm_impressao.vApenas_email := false;
    frm_impressao.ShowModal;
    frm_impressao.Release;
   end;
end;

procedure TfrmIntFORDExp.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TdatmFordExp, datmFordExp);
end;

procedure TfrmIntFORDExp.FormDestroy(Sender: TObject);
begin
  if Assigned(datmFordExp) and (datmFordExp.ComponentCount > 0 ) then
    FreeAndNil(datmFordExp);
end;

end.
