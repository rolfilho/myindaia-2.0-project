unit uControleRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, DBTables, dbcgrids, Mask, Buttons,
  ExtCtrls, Provider, DBClient, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxDBEdit, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmControleRecibo = class(TForm)
    qry_ControleRecibos: TQuery;
    ds_ControleRecibos: TDataSource;
    qry_ControleRecibosNR_PROCESSO: TStringField;
    qry_ControleRecibosNM_ITEM: TStringField;
    qry_ControleRecibosVL_PAGTO: TFloatField;
    qry_ControleRecibosDT_PAGTO: TStringField;
    qry_ControleRecibosNM_EMPRESA: TStringField;
    qry_ControleRecibosNM_FAVORECIDO: TStringField;
    qry_ControleRecibosDIAS_ATRASADO: TIntegerField;
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    dbnvg: TDBNavigator;
    qry_ControleRecibosPROCESSO: TStringField;
    qry_ControleRecibosNR_LANCAMENTO: TStringField;
    cds_ControleRecibos: TClientDataSet;
    dsp_ControleRecibos: TDataSetProvider;
    cds_ControleRecibosNR_PROCESSO: TStringField;
    cds_ControleRecibosNR_LANCAMENTO: TStringField;
    cds_ControleRecibosNM_ITEM: TStringField;
    cds_ControleRecibosVL_PAGTO: TFloatField;
    cds_ControleRecibosDT_PAGTO: TStringField;
    cds_ControleRecibosNM_EMPRESA: TStringField;
    cds_ControleRecibosNM_FAVORECIDO: TStringField;
    cds_ControleRecibosDIAS_ATRASADO: TIntegerField;
    cds_ControleRecibosPROCESSO: TStringField;
    btnExecutar: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    btn_sair: TSpeedButton;
    cbFavorecido: TComboBox;
    lblFavorecido: TLabel;
    qry_FavorecidosControle: TQuery;
    qry_FavorecidosControleCD_FAVORECIDO: TStringField;
    qry_FavorecidosControleNM_FAVORECIDO: TStringField;
    qry_ControleRecibosNR_CONHECIMENTO: TStringField;
    cds_ControleRecibosNR_CONHECIMENTO: TStringField;
    pnlMemo: TPanel;
    Memo1: TMemo;
    lblStatus: TLabel;
    pnl_localiza_processo: TPanel;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    msk_nr_processo_filtro: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    cxgridrecibos: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxgridrecibosIN_RECIBO: TcxGridDBColumn;
    cxgridrecibosNM_ITEM: TcxGridDBColumn;
    cxgridrecibosVL_PAGTO: TcxGridDBColumn;
    cxgridrecibosDT_PAGTO: TcxGridDBColumn;
    cxgridrecibosNM_EMPRESA: TcxGridDBColumn;
    cxgridrecibosNM_FAVORECIDO: TcxGridDBColumn;
    cxgridrecibosDIAS_ATRASADO: TcxGridDBColumn;
    cxgridrecibosPROCESSO: TcxGridDBColumn;
    cxgridrecibosNR_CONHECIMENTO: TcxGridDBColumn;
    qry_ControleRecibosIN_RECIBO: TIntegerField;
    cds_ControleRecibosIN_RECIBO: TIntegerField;
    cds_ControleRecibosVL_TOTAL: TAggregateField;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure cbFavorecidoChange(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processo_filtroExit(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure cxGrid1DBTableView1IN_RECIBOPropertiesEditValueChanged(
      Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaQuery(pTipo : Integer);
  public
    { Public declarations }
  end;

var
  frmControleRecibo: TfrmControleRecibo;

implementation

uses PGGP001, PGGP017, Funcoes, GSMLIB, ConsOnLineEx;



{$R *.dfm}

procedure TfrmControleRecibo.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  AtualizaQuery(1);
  frmControleRecibo.WindowState := wsMaximized;
end;

procedure TfrmControleRecibo.btn_sairClick(Sender: TObject);
begin
  cds_ControleRecibos.Close;
  Close;
end;

procedure TfrmControleRecibo.btnExecutarClick(Sender: TObject);

begin
  lblStatus.Visible := True;
  Refresh;
  cds_ControleRecibos.Filter := 'IN_RECIBO = 1';
  cds_ControleRecibos.Filtered := True;
  cds_ControleRecibos.DisableControls;
  pnlMemo.Visible := False;
  cds_ControleRecibos.First;
  while not cds_ControleRecibos.Eof do
  begin
    FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_RECIBO = 1 WHERE NR_PROCESSO = '''+cds_ControleRecibosNR_PROCESSO.AsString+''' AND NR_LANCAMENTO = '''+cds_ControleRecibosNR_LANCAMENTO.AsString+'''');
    cds_ControleRecibos.next;
  end;
  cds_ControleRecibos.EnableControls;
  lblStatus.Visible := False;
  cds_ControleRecibos.Filtered := False;
  Refresh;
  AtualizaQuery(1);
end;

procedure TfrmControleRecibo.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
  begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text);
  end
  else
  begin
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
    AtualizaQuery(1);
  end
end;

procedure TfrmControleRecibo.btn_co_produtoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text);
  end
  else
  begin
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
    AtualizaQuery(2);
  end;
end;

procedure TfrmControleRecibo.AtualizaQuery(pTipo : Integer);
var
str_nr_processo_filtro:String;
begin
  if msk_nr_processo_filtro.Text='' then
     str_nr_processo_filtro:=''
  else
     str_nr_processo_filtro:=msk_cd_unid_neg.Text+msk_cd_produto.Text+msk_nr_processo_filtro.Text;


  if pTipo in [1,2,3] then
  begin

    qry_FavorecidosControle.Close;
    qry_FavorecidosControle.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
    qry_FavorecidosControle.ParamByName('CD_PRODUTO').AsString   := msk_cd_produto.Text;
    qry_FavorecidosControle.ParamByName('NR_PROCESSO').AsString  := str_nr_processo_filtro;
    qry_FavorecidosControle.Open;

    cbFavorecido.Clear;
    cbFavorecido.Items.add('Todos');
    qry_FavorecidosControle.DisableControls;
    qry_FavorecidosControle.First;
    while not qry_FavorecidosControle.Eof do
    begin
      cbFavorecido.Items.add(qry_FavorecidosControle.FieldByName('NM_FAVORECIDO').AsString);
      qry_FavorecidosControle.Next;
    end;
    qry_FavorecidosControle.EnableControls;

    cbFavorecido.ItemIndex := 0;
  end else begin

     cds_ControleRecibos.Close;
     cds_ControleRecibos.Params.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
     cds_ControleRecibos.Params.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
     cds_ControleRecibos.Params.ParamByName('NR_PROCESSO').AsString   := str_nr_processo_filtro;
     cds_ControleRecibos.Params.ParamByName('NM_FAVORECIDO').AsString := cbFavorecido.Text;
     cds_ControleRecibos.Open;
  end;
end;

procedure TfrmControleRecibo.FormResize(Sender: TObject);
begin
  //dbctrlg_Recibos.RowCount := frmControleRecibo.Height div 22;
end;

procedure TfrmControleRecibo.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt(msk_cd_unid_neg);
end;

procedure TfrmControleRecibo.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt(msk_cd_produto);
end;

procedure TfrmControleRecibo.cbFavorecidoChange(Sender: TObject);
begin
  AtualizaQuery(0);
end;

procedure TfrmControleRecibo.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
//  if chkProcessos.Checked then
//    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  msk_nr_processoExit(msk_nr_processo);
  vListAux.Free;
end;

procedure TfrmControleRecibo.msk_nr_processoExit(Sender: TObject);
begin
//  if msk_nr_processo.Text <> '' then
//    cds_ControleRecibos.Locate('PROCESSO', msk_nr_processo.Text, []);

end;

procedure TfrmControleRecibo.msk_nr_processo_filtroExit(Sender: TObject);
begin
  AtualizaQuery(3);
  AtualizaQuery(0);
end;

procedure TfrmControleRecibo.msk_nr_processoChange(Sender: TObject);
begin
   cds_ControleRecibos.Locate('PROCESSO', msk_nr_processo.Text, [loPartialKey]);

end;

procedure TfrmControleRecibo.cxGrid1DBTableView1IN_RECIBOPropertiesEditValueChanged(
  Sender: TObject);
begin
  try
    if cds_ControleRecibos.State <> dsEdit then
      cds_ControleRecibos.Edit;
    cds_ControleRecibosIN_RECIBO.AsInteger := cxgridrecibosIN_RECIBO.EditValue;
    cds_ControleRecibos.Post;
  except
  end;
end;

end.
