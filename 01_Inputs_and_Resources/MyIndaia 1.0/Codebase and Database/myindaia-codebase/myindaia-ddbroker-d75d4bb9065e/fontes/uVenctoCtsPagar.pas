(*************************************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGGP059.PAS - Vencimentos de Contas a Pagar

AUTOR: Bysoft

DATA: dd/mm/yyyy

Manutenção: Rafael Araujo

Data: 22/10/2001 - AMBR-0052/01 - Mais de um Vencimento

*************************************************************************************************)

unit uVenctoCtsPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Grids, DBGrids, DBCtrls, DB, RxMemDS, DBTables,PGGP011,
  Buttons, DateUtils;

type
  Tfrm_ctaapagar_vencto = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    dbedt_dt_vencto: TDBEdit;
    Label2: TLabel;
    dbedt_nr_lanc: TDBEdit;
    Shape6: TShape;
    Label19: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    EditValor: TDBEdit;
    DBEdit2: TDBEdit;
    SqlLancamentos: TQuery;
    SqlLancamentosDT_CTAAPAGAR: TDateTimeField;
    SqlLancamentosNR_CTAAPAGAR: TStringField;
    SqlLancamentosCODIGO: TAutoIncField;
    SqlLancamentosCD_CT_CONTABIL: TStringField;
    SqlLancamentosCD_FILIAL: TStringField;
    SqlLancamentosCD_CT_CUSTO: TStringField;
    SqlLancamentosVL_LANCAMENTO: TFloatField;
    SqlLancamentosCD_UNID_NEG: TStringField;
    SqlLancamentosCD_ACESSO: TStringField;
    SqlLancamentosCD_AUX: TStringField;
    SqlLancamentosCD_ITEM: TStringField;
    SqlLancamentosNM_HISTORICO: TMemoField;
    SqlLancamentosNR_LANC_CAIXA: TStringField;
    DtsLancamentos: TDataSource;
    EditDisponivel: TEdit;
    Label6: TLabel;
    SqlContaContabil: TQuery;
    SqlLancamentosLookUpNM_ContaContabil: TStringField;
    Label7: TLabel;
    dbedt_cd_ct_contabil: TDBEdit;
    Panel3: TPanel;
    btnConfirma: TBitBtn;
    Edit1: TEdit;
    btn_ContaContabil: TSpeedButton;
    dbedt_cd_rateio: TDBEdit;
    lbl_cd_ct_custo: TLabel;
    btn_co_ct_custo: TSpeedButton;
    dbedt_nm_rateio: TEdit;
    Shape2: TShape;
    SqlLancamentosDT_MOVIMENTO_CAIXA: TDateTimeField;
    SqlLancamentosCD_RATEIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SqlLancamentosAfterScroll(DataSet: TDataSet);
    procedure SqlLancamentosBeforeClose(DataSet: TDataSet);
    procedure SqlLancamentosBeforeScroll(DataSet: TDataSet);
    procedure SqlLancamentosAfterOpen(DataSet: TDataSet);
    procedure EditValorExit(Sender: TObject);
    procedure SqlLancamentosAfterPost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SqlLancamentosAfterEdit(DataSet: TDataSet);
    procedure EditValorChange(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btn_ContaContabilClick(Sender: TObject);
    procedure btn_co_ct_custoClick(Sender: TObject);
    procedure SqlLancamentosAfterInsert(DataSet: TDataSet);
    procedure dbedt_cd_rateioExit(Sender: TObject);
    procedure EditValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_identificador : Integer;
    vValDisponivel   : Real;
    procedure AtualizaValDisp;
  end;

var
  frm_ctaapagar_vencto: Tfrm_ctaapagar_vencto;

implementation

uses GSMLIB, PGGP060, dVenctoCtsPagar, PGGP012, PGGP001, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_ctaapagar_vencto.FormCreate(Sender: TObject);
begin
  //Application.CreateForm( Tdatm_ctaapagar_vencto,datm_ctaapagar_vencto );
end;

procedure Tfrm_ctaapagar_vencto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_ctaapagar_vencto do
  begin
    qry_ctaapagar_vencto_.Close;
    Free;
  end;
end;

procedure Tfrm_ctaapagar_vencto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_ctaapagar_vencto.SqlLancamentosAfterScroll(
  DataSet: TDataSet);
begin
  If SqlLancamentos.Active Then
    If frm_ctaapagar_vencto.Active Then
      EditValor.SetFocus;
end;

procedure Tfrm_ctaapagar_vencto.SqlLancamentosBeforeClose(
  DataSet: TDataSet);
begin
  if SqlLancamentos.State = dsEdit then
    SqlLancamentos.Post;
end;

procedure Tfrm_ctaapagar_vencto.SqlLancamentosBeforeScroll(
  DataSet: TDataSet);
begin
  if SqlLancamentos.State = dsEdit then
    SqlLancamentos.Post;
end;

procedure Tfrm_ctaapagar_vencto.SqlLancamentosAfterOpen(DataSet: TDataSet);
begin
  SqlContaContabil.Open;
end;

procedure Tfrm_ctaapagar_vencto.EditValorExit(Sender: TObject);
begin
  If DtsLancamentos.State = dsEdit Then
  Begin
    if StrToFloat( TiraPic ( EditDisponivel.Text ) ) <> 0 then
    begin
      If StrToFloat( TiraPic ( EditValor.Text ) ) > StrToFloat( TiraPic ( EditDisponivel.Text ) ) Then
      Begin
        BoxMensagem('Valor do Lançamento é maior que o Valor Disponível !', 2);
        EditValor.SetFocus;
        Exit;
      End;
      SqlLancamentos.Next;
      SqlLancamentos.Prior;
    end;
  End;
end;

Procedure Tfrm_ctaapagar_vencto.AtualizaValDisp;
VAR
   VALOR:DOUBLE;
Begin
  With TQuery.Create(Application) Do
  Begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('select ISNULL(SUM(VL_LANCAMENTO),0) VALOR from TCTAAPAGAR_LANC');
    SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR');
    ParamByName('DT_CTAAPAGAR').AsDateTime := SqlLancamentos.ParamByName('DT_CTAAPAGAR').AsDateTime;
    ParamByName('NR_CTAAPAGAR').AsString   := SqlLancamentos.ParamByName('NR_CTAAPAGAR').AsString;
    Open;
    valor:=FieldByName('VALOR').AsFloat;

    SQL.Clear;
    SQL.Add('select ISNULL(VL_LIQUIDO,0) VL_LIQUIDO from TCTAAPAGAR');
    SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR and CD_UNID_NEG =:CD_UNID_NEG');
    ParamByName('DT_CTAAPAGAR').AsDateTime := SqlLancamentos.ParamByName('DT_CTAAPAGAR').AsDateTime;
    ParamByName('NR_CTAAPAGAR').AsString   := SqlLancamentos.ParamByName('NR_CTAAPAGAR').AsString;
    ParamByName('CD_UNID_NEG').AsString   := SqlLancamentos.ParamByName('CD_UNID_NEG').AsString;
    Open;

    //vValDisponivel:= datm_ctaapagar.qry_ctaapagar_VL_LIQUIDO.asfloat;
//    EditDisponivel.Text := FormatFloat('#,##0.00',vValDisponivel - FieldByName('VALOR').AsFloat);
    EditDisponivel.Text := FormatFloat('#0,.00', FieldByName('VL_LIQUIDO').AsFloat - valor);

  End;
End;


procedure Tfrm_ctaapagar_vencto.SqlLancamentosAfterPost(DataSet: TDataSet);
begin
  AtualizaValDisp;
end;

procedure Tfrm_ctaapagar_vencto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  EditDisponivel.Text := FormatFloat('#0,.00', vValDisponivel - FieldByName('VALOR').AsFloat);
If StrToFloat(TiraPic(EditDisponivel.Text)) > 0 Then
  Begin
    BoxMensagem('Atenção, a distribuição não está completa ! Ainda falta : ' + EditDisponivel.Text,2);
    CanClose := False;
    EditValor.SetFocus;
  End;
end;

procedure Tfrm_ctaapagar_vencto.SqlLancamentosAfterEdit(DataSet: TDataSet);
begin
{  With TQuery.Create(Application) Do
  Begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('select ISNULL(SUM(VL_LANCAMENTO),0) VALOR from TCTAAPAGAR_LANC');
    SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR = :NR_CTAAPAGAR and CD_CT_CONTABIL <> :CD_CT_CONTABIL');
    ParamByName('DT_CTAAPAGAR').AsDateTime := SqlLancamentos.ParamByName('DT_CTAAPAGAR').AsDateTime;
    ParamByName('NR_CTAAPAGAR').AsString   := SqlLancamentos.ParamByName('NR_CTAAPAGAR').AsString;
    ParamByName('CD_CT_CONTABIL').AsString := SqlLancamentos.FieldByName('CD_CT_CONTABIL').AsString;
    Open;
    EditDisponivel.Text := FormatFloat('#,##0.00',vValDisponivel - FieldByname('VALOR').AsFloat);
    Free;
  End;}
end;

procedure Tfrm_ctaapagar_vencto.EditValorChange(Sender: TObject);
VAR
   VALOR:DOUBLE;
begin
  If DtsLancamentos.State = dsEdit Then
  Begin
    With TQuery.Create(Application) Do
    Begin
      DatabaseName := 'DBBROKER';
      Close;
      SQL.Clear;
      SQL.Add('select ISNULL(SUM(VL_LANCAMENTO),0) VALOR from TCTAAPAGAR_LANC');
      SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR = :NR_CTAAPAGAR and CD_CT_CONTABIL <> :CD_CT_CONTABIL');
      ParamByName('DT_CTAAPAGAR').AsDateTime := SqlLancamentos.ParamByName('DT_CTAAPAGAR').AsDateTime;
      ParamByName('NR_CTAAPAGAR').AsString   := SqlLancamentos.ParamByName('NR_CTAAPAGAR').AsString;
      ParamByName('CD_CT_CONTABIL').AsString := SqlLancamentos.FieldByName('CD_CT_CONTABIL').AsString;
      Open;

      valor:=FieldByName('VALOR').AsFloat;

      SQL.Clear;
      SQL.Add('select ISNULL(VL_LIQUIDO,0) VL_LIQUIDO from TCTAAPAGAR');
      SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR and CD_UNID_NEG =:CD_UNID_NEG');
      ParamByName('DT_CTAAPAGAR').AsDateTime := SqlLancamentos.ParamByName('DT_CTAAPAGAR').AsDateTime;
      ParamByName('NR_CTAAPAGAR').AsString   := SqlLancamentos.ParamByName('NR_CTAAPAGAR').AsString;
      ParamByName('CD_UNID_NEG').AsString   := SqlLancamentos.ParamByName('CD_UNID_NEG').AsString;
      Open;

      EditDisponivel.Text := FormatFloat('#0,.00', FieldByName('VL_LIQUIDO').AsFloat - valor);
      //EditDisponivel.Text := FormatFloat('#0,.00', vValDisponivel - FieldByName('VALOR').AsFloat);
//      EditDisponivel.Text := FormatFloat('#,##0.00',vValDisponivel - FieldByname('VALOR').AsFloat);
      //StrToFloat( TiraPic ( EditDisponivel.Text ) )
      Free;
    End;
  End;
end;

procedure Tfrm_ctaapagar_vencto.btnConfirmaClick(Sender: TObject);
begin
  if SqlLancamentos.State in [ dsInsert, dsEdit ] then
    SqlLancamentos.Post;
  Close;
end;

procedure Tfrm_ctaapagar_vencto.btn_ContaContabilClick(Sender: TObject);
begin
{  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(SqlLancamentos) then
      Exit;
      SqlLancamentosCD_CT_CONTABIL.AsString := ConsultaOnLineEx('TCT_CONTABIL','Contas Contábeis',['CD_CT_CONTABIL','NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL',frm_main.mi_cad_fin_conta_contabil)
  end
  else
    edit1.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',dbedt_cd_ct_contabil.Text,'NM_CT_CONTABIL');
}
//Filtrar as contas que são do ano da data do lançamento
  if Sender Is TSpeedButton then              
  begin
    if not PoeEmEdicao(SqlLancamentos) then
      Exit;
    SqlLancamentosCD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(SqlLancamentos.FieldByName('DT_CTAAPAGAR').AsDateTime)), 'Contas Contábeis',
                                                                ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                'CD_CT_CONTABIL', nil, dbedt_cd_ct_contabil.Text);
  end
  else
    edit1.Text                            := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                               ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil.Text + '" ' +
                                                               ' AND ANO_CONTA = ' + IntToStr(YearOf(SqlLancamentos.FieldByName('DT_CTAAPAGAR').AsDateTime)),'NM_CT_CONTABIL');
end;

procedure Tfrm_ctaapagar_vencto.btn_co_ct_custoClick(Sender: TObject);
begin
{  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(SqlLancamentos) then exit;
      SqlLancamentosCD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro de Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',frm_main.mi_cad_fin_centro_custos)
  end else
    Edit2.Text := ConsultaLookUP('TCONTABIL_CUSTO','CD_CT_CUSTO',dbedt_cd_ct_custo.Text,'NM_CT_CUSTO') }

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(SqlLancamentos) then
      Exit;
    SqlLancamentosCD_RATEIO.AsString := ConsultaOnLineEx('TRATEIO','Rateios',['CD_RATEIO','NM_RATEIO'],['Código','Descrição'],'CD_RATEIO',frm_main.mi_cad_fin_conta_gerencial)
  end
  else
    dbedt_nm_rateio.Text := ConsultaLookUP('TRATEIO','CD_RATEIO',dbedt_cd_rateio.Text,'NM_RATEIO')

end;

procedure Tfrm_ctaapagar_vencto.SqlLancamentosAfterInsert(
  DataSet: TDataSet);
begin
  SqlLancamentosCD_UNID_NEG.AsString := datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString;
end;

procedure Tfrm_ctaapagar_vencto.dbedt_cd_rateioExit(Sender: TObject);
begin
  dbedt_cd_rateio.Text := FStrZero(dbedt_cd_rateio.Text, 4);
end;

procedure Tfrm_ctaapagar_vencto.EditValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Return then
  begin
    //só fecha o FORM se a distribuição estiver feita por completo
    If StrToFloat(TiraPic(EditDisponivel.Text)) = 0 Then
      btnConfirma.Click;
  end;
end;

procedure Tfrm_ctaapagar_vencto.DBGrid1CellClick(Column: TColumn);
begin
  SqlLancamentos.Close;
  SqlLancamentos.ParamByName('CD_UNID_NEG').AsString    := datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString;
  SqlLancamentos.ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
  SqlLancamentos.ParamByName('NR_CTAAPAGAR').AsString   := datm_ctaapagar_vencto.qry_ctaapagar_vencto_NR_CTAAPAGAR.AsString;
  SqlLancamentos.Open;
  AtualizaValDisp;
end;

end.

