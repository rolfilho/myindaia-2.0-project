unit PGNM011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Menus, ExtCtrls, PGGP001;

type
  Tfrm_numerario_recebidos = class(TForm)
    qry_recebimento: TDataSource;
    qry_recebimento_: TQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    qry_recebimento_NR_PROCESSO: TStringField;
    qry_recebimento_CD_CLIENTE: TStringField;
    qry_recebimento_CD_BANCO: TStringField;
    dsq_itens_receb: TDataSource;
    qry_itens_receb_: TQuery;
    qry_recebimento_Look_ap_banco: TStringField;
    qry_itens_receb_NR_PROCESSO: TStringField;
    qry_itens_receb_NR_SOLICITACAO: TStringField;
    qry_itens_receb_NR_LANCAMENTO: TStringField;
    qry_itens_receb_CD_ITEM: TStringField;
    qry_itens_receb_VL_SOLICITADO: TFloatField;
    qry_itens_receb_VL_RECEBIDO: TFloatField;
    qry_itens_receb_Look_nm_item: TStringField;
    qry_recebimento_CD_USUARIO: TStringField;
    qry_recebimento_Look_ap_usuario: TStringField;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_cancelar: TSpeedButton;
    menu_cadastro: TMainMenu;
    Itens1: TMenuItem;
    mi_saida: TMenuItem;
    qry_recebimento_NR_RECEBIMENTO: TStringField;
    qry_recebimento_DT_RECEBIMENTO: TDateTimeField;
    qry_recebimento_VL_RECEBIMENTO: TFloatField;
    qry_recebimento_IN_CANCELADO: TBooleanField;
    qry_recebimento_Look_cancelado: TStringField;
    qry_itens_receb_NR_RECEBIMENTO: TStringField;
    ds_banco: TDataSource;
    tbl_banco_: TTable;
    tbl_banco_CD_BANCO: TStringField;
    tbl_banco_NM_BANCO: TStringField;
    tbl_banco_AP_BANCO: TStringField;
    tbl_banco_NR_CONTA: TStringField;
    tbl_banco_CD_AGENCIA: TStringField;
    tbl_banco_CD_CT_CONTABIL: TStringField;
    ds_usuario: TDataSource;
    tbl_usuario_: TTable;
    tbl_usuario_CD_USUARIO: TStringField;
    tbl_usuario_AP_USUARIO: TStringField;
    tbl_usuario_NM_USUARIO: TStringField;
    tbl_usuario_CD_SENHA: TStringField;
    tbl_usuario_CD_UNID_NEG: TStringField;
    tbl_usuario_CD_PRODUTO: TStringField;
    tbl_usuario_CD_CARGO: TStringField;
    tbl_usuario_IN_ATIVO: TStringField;
    dsq_item_cd: TDataSource;
    qry_item_cd: TQuery;
    qry_item_cdCD_ITEM: TStringField;
    qry_item_cdNM_ITEM: TStringField;
    qry_item_cdCD_TIPO_ITEM: TStringField;
    qry_item_cdNR_PRIORIDADE: TIntegerField;
    qry_item_cdCD_TIPO_LANC_FAT: TStringField;
    sp_cancela_recebimento_: TStoredProc;
    procedure FormShow(Sender: TObject);
    procedure qry_recebimentoDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure qry_recebimento_CalcFields(DataSet: TDataSet);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_recebimento : string[3];
  end;

var
  frm_numerario_recebidos: Tfrm_numerario_recebidos;

implementation

uses GSMLIB, PGNM017;

{$R *.DFM}

procedure Tfrm_numerario_recebidos.FormShow(Sender: TObject);
var
  nr_proc_caption : String[13];
begin

  nr_proc_caption := Processo( str_nr_processo );
  Caption := Caption + ' - Processo Nº [ ' + nr_proc_caption + ' ]' ;

  qry_recebimento_.Close;
  qry_recebimento_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  qry_recebimento_.Open;

  If qry_recebimento_.RecordCount > 0 Then
     btn_cancelar.Enabled := True
  Else
     btn_cancelar.Enabled := False;

  qry_itens_receb_.Close;
  qry_itens_receb_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  qry_itens_receb_.ParamByName('NR_recebimento').AsString :=
  qry_recebimento_NR_recebimento.AsString;
  qry_itens_receb_.open;

end;

procedure Tfrm_numerario_recebidos.qry_recebimentoDataChange(Sender: TObject;
  Field: TField);
begin
  qry_itens_receb_.Close;
  qry_itens_receb_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  qry_itens_receb_.ParamByName('NR_recebimento').AsString := 
  qry_recebimento_NR_recebimento.AsString;
  qry_itens_receb_.open;
end;

procedure Tfrm_numerario_recebidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_numerario_recebidos.BitBtn1Click(Sender: TObject);
begin
  close;
end;



procedure Tfrm_numerario_recebidos.qry_recebimento_CalcFields(
  DataSet: TDataSet);
begin
  If qry_recebimento_IN_CANCELADO.AsBoolean = True Then
     qry_recebimento_Look_cancelado.AsString := 'Sim'
  else
     qry_recebimento_Look_cancelado.AsString := 'Não';
end;

procedure Tfrm_numerario_recebidos.btn_cancelarClick(Sender: TObject);
begin

  if MessageDlg('Este Recebimento será cancelado! Confirma cancelamento?',
     mtConfirmation,
     [mbYes, mbNo], 0) = mrYes then
  begin
     Try
       str_nr_processo    := qry_recebimento_NR_PROCESSO.AsString;  
       nr_recebimento := qry_recebimento_NR_RECEBIMENTO.AsString;
       qry_recebimento_.close;
       qry_itens_receb_.close;
       datm_numerario.qry_solinum_.close;
       sp_cancela_recebimento_.ParamByName('@nr_processo').AsString := str_nr_processo;
       sp_cancela_recebimento_.ParamByName('@nr_recebimento').AsString  := nr_recebimento;
       sp_cancela_recebimento_.ParamByName('@cd_usuario').AsString  := str_cd_usuario;
       sp_cancela_recebimento_.ExecProc;
       qry_recebimento_.open;

       If qry_recebimento_.RecordCount > 0 Then
          btn_cancelar.Enabled := True
       Else
          btn_cancelar.Enabled := False;

       qry_itens_receb_.open;
       datm_numerario.qry_solinum_.open;
     Except                             
       if MessageDlg('O cancelamento não foi bem sucedido.',
          mtError, [mbOk], 0) = mrOk then Exit;
     end;
  end;   
     
end;

procedure Tfrm_numerario_recebidos.btn_sairClick(Sender: TObject);
begin
  close;
end;





end.
