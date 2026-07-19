unit PGNM015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Menus, ExtCtrls, PGGP001;

type
  Tfrm_devolucao_itens = class(TForm)
    qry_itens_receb: TDataSource;
    qry_itens_receb_: TQuery;
    DBGrid1: TDBGrid;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_novo: TSpeedButton;
    menu_cadastro: TMainMenu;
    Itens1: TMenuItem;
    mi_saida: TMenuItem;
    DBGrid2: TDBGrid;
    qry_itens_receb_NR_PROCESSO: TStringField;
    qry_itens_receb_NR_RECEBIMENTO: TStringField;
    qry_itens_receb_NR_SOLICITACAO: TStringField;
    qry_itens_receb_NR_LANCAMENTO: TStringField;
    qry_itens_receb_CD_ITEM: TStringField;
    qry_itens_receb_VL_SOLICITADO: TFloatField;
    qry_itens_receb_VL_RECEBIDO: TFloatField;
    qry_itens_receb_IN_CANCELADO: TBooleanField;
    qry_itens_receb_Look_nm_item: TStringField;
    qry_itens_receb_look_cancelado: TStringField;
    Cancelar1: TMenuItem;
    btn_cancelar: TSpeedButton;
    qry_itens_receb_NR_LANC_RECEB: TStringField;
    qry_itens_solinum_: TQuery;
    dsq_itens_solinum: TDataSource;
    qry_itens_solinum_NR_PROCESSO: TStringField;
    qry_itens_solinum_NR_SOLICITACAO: TStringField;
    qry_itens_solinum_NR_LANCAMENTO: TStringField;
    qry_itens_solinum_CD_ITEM: TStringField;
    qry_itens_solinum_NR_PRIORIDADE: TIntegerField;
    qry_itens_solinum_CD_TIPO_CALCULO: TStringField;
    qry_itens_solinum_TP_SOLIC_INFORM: TStringField;
    qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_solinum_VL_SOLICITADO: TFloatField;
    qry_itens_solinum_CD_STATUS: TStringField;
    qry_itens_solinum_VL_UTILIZADO: TFloatField;
    qry_itens_solinum_Look_vl_Saldo: TFloatField;
    qry_itens_solinum_VL_RECEBIDO: TFloatField;
    sp_cancela_item_devolucao_: TStoredProc;
    procedure FormShow(Sender: TObject);
    procedure qry_itens_recebDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure qry_itens_solinum_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_devolucao : string[3];
    nr_lancamento : string[3];
  end;

var
  frm_devolucao_itens: Tfrm_devolucao_itens;

implementation

uses GSMLIB, PGNM020, PGNM016;

{$R *.DFM}

procedure Tfrm_devolucao_itens.FormShow(Sender: TObject);
var
  nr_proc_caption : String[13];
begin
  nr_proc_caption := Processo( str_nr_processo );
  Caption := 'Processo Nº [ ' + nr_proc_caption + ' ] - Devolução Nº [' + nr_devolucao + '] ' ;
  qry_itens_receb_.Close;
  qry_itens_receb_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
  qry_itens_receb_.Open;
  If qry_itens_receb_.RecordCount > 0 Then
    begin
      btn_novo.Enabled := True;
      btn_cancelar.Enabled := True;
    end
  else
    begin
      btn_novo.Enabled := False;
      btn_cancelar.Enabled := False;
    end;
end;

procedure Tfrm_devolucao_itens.qry_itens_recebDataChange(Sender: TObject;
  Field: TField);
begin
  datm_devolucao.qry_itens_devolucao_.Close;
  datm_devolucao.qry_itens_devolucao_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
  datm_devolucao.qry_itens_devolucao_.ParamByName('NR_DEVOLUCAO').AsString := nr_devolucao;
  datm_devolucao.qry_itens_devolucao_.Open;
  If qry_itens_receb_.RecordCount > 0 Then
    begin
      btn_novo.Enabled := True;
      btn_cancelar.Enabled := True;
    end
  else
    begin
      btn_novo.Enabled := False;
      btn_cancelar.Enabled := False;
    end;
end;

procedure Tfrm_devolucao_itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_devolucao_itens.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_devolucao_itens.btn_cancelarClick(Sender: TObject);
begin

  If ( datm_devolucao.qry_itens_devolucao_IN_CANCELADO.AsString = '1' ) Then
  begin
    MessageDlg('Este item da devolução já foi cancelado anteriormente!',  mtError, [mbOk], 0);
    Exit;
  end;

  if MessageDlg('Este item da Devolução será cancelado! Confirma cancelamento?',
     mtConfirmation,
     [mbYes, mbNo], 0) = mrYes then
  begin
     Try
     
       With sp_cancela_item_devolucao_ Do
       begin

          ParamByName('@NR_DEVOLUCAO').AsString  := datm_devolucao.qry_itens_devolucao_NR_DEVOLUCAO.AsString;
          ParamByName('@NR_PROCESSO').AsString   := datm_devolucao.qry_itens_devolucao_NR_PROCESSO.AsString;
          ParamByName('@NR_LANC_DEVOL').AsString := datm_devolucao.qry_itens_devolucao_NR_LANC_DEVOL.AsString;
          
          datm_devolucao.qry_devolucao_.Close;       
          datm_devolucao.qry_itens_devolucao_.Close;

          ExecProc;

          datm_devolucao.qry_itens_devolucao_.Open;
          datm_devolucao.qry_devolucao_.Open;
          
       end;

     Except                             
     
       if MessageDlg('O cancelamento não foi bem sucedido.',
          mtError, [mbOk], 0) = mrOk then Exit;
          
     end;
     
  end;   

end;

procedure Tfrm_devolucao_itens.btn_novoClick(Sender: TObject);
begin

  if Not( datm_devolucao.qry_devolucao_.State in [dsEdit, dsInsert] ) Then
     datm_devolucao.qry_devolucao_.Edit;

  datm_devolucao.qry_devolucao_QT_ITENS_DEVOLV.AsFloat :=    
  datm_devolucao.qry_devolucao_QT_ITENS_DEVOLV.AsFloat + 1;

  datm_devolucao.qry_itens_devolucao_.Append;
  datm_devolucao.qry_itens_devolucao_NR_PROCESSO.AsString     := str_nr_processo;
  datm_devolucao.qry_itens_devolucao_NR_DEVOLUCAO.AsString    := nr_devolucao;
  datm_devolucao.qry_itens_devolucao_NR_LANC_DEVOL.AsString   := StrZero( datm_devolucao.qry_devolucao_QT_ITENS_DEVOLV.AsFloat, 3 );
  datm_devolucao.qry_itens_devolucao_NR_RECEBIMENTO.AsString  := qry_itens_receb_NR_RECEBIMENTO.AsString;
  datm_devolucao.qry_itens_devolucao_NR_LANC_RECEB.AsString   := qry_itens_receb_NR_LANC_RECEB.AsString;
  datm_devolucao.qry_itens_devolucao_NR_SOLINUM.AsString      := qry_itens_receb_NR_SOLICITACAO.AsString;
  datm_devolucao.qry_itens_devolucao_NR_LANC_SOLINUM.AsString := qry_itens_receb_NR_LANCAMENTO.AsString;
  datm_devolucao.qry_itens_devolucao_CD_ITEM.AsString         := qry_itens_receb_CD_ITEM.AsString;
  datm_devolucao.qry_itens_devolucao_IN_CANCELADO.AsString    := '0';

  qry_itens_solinum_.Close;
  qry_itens_solinum_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
  qry_itens_solinum_.ParamByName('NR_SOLICITACAO').AsString := qry_itens_receb_NR_SOLICITACAO.AsString;
  qry_itens_solinum_.ParamByName('NR_LANCAMENTO').AsString := qry_itens_receb_NR_LANCAMENTO.AsString;
  qry_itens_solinum_.Open;

  Application.CreateForm( Tfrm_devolucao_lanc, frm_devolucao_lanc );
  frm_devolucao_lanc.nr_devolucao := nr_devolucao;
  frm_devolucao_lanc.edt_cd_item.Text := qry_itens_receb_CD_ITEM.AsString;                         
  frm_devolucao_lanc.edt_nm_item.Text := qry_itens_receb_Look_nm_item.AsString;                         
  frm_devolucao_lanc.ShowModal;                         

end;

procedure Tfrm_devolucao_itens.qry_itens_solinum_CalcFields(
  DataSet: TDataSet);
begin
  qry_itens_solinum_Look_vl_Saldo.AsFloat :=
  qry_itens_solinum_VL_RECEBIDO.AsFloat -
  qry_itens_solinum_VL_UTILIZADO.AsFloat
end;

end.
