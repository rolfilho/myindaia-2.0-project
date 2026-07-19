unit PGNM008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, ComCtrls, Grids, DBGrids, Db, DBTables, PGGP001;

type
  Tfrm_receb_num_itens = class(TForm)
    DBGrid2: TDBGrid;
    btn_confirma: TButton;
    btn_alterar_item_numerario: TButton;
    btn_cancelar: TButton;
    dsq_itens_solinum: TDataSource;
    qry_itens_solinum_: TQuery;
    qry_itens_solinum_NR_PROCESSO: TStringField;
    qry_itens_solinum_NR_SOLICITACAO: TStringField;
    qry_itens_solinum_NR_LANCAMENTO: TStringField;
    qry_itens_solinum_CD_ITEM: TStringField;
    qry_itens_solinum_NR_PRIORIDADE: TIntegerField;
    qry_itens_solinum_CD_TIPO_CALCULO: TStringField;
    qry_itens_solinum_TP_SOLIC_INFORM: TStringField;
    qry_itens_solinum_CD_STATUS: TStringField;
    qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_solinum_VL_SOLICITADO: TFloatField;
    qry_itens_solinum_VL_RECEBIDO: TFloatField;
    qry_itens_solinum_VL_UTILIZADO: TFloatField;
    btn_recombina: TButton;
    btn_prioridade: TButton;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_confirmaClick(Sender: TObject);
    procedure btn_alterar_item_numerarioClick(Sender: TObject);
    procedure btn_recombinaClick(Sender: TObject);
    procedure btn_prioridadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cState : String[1];
  end;

var
  frm_receb_num_itens: Tfrm_receb_num_itens;

implementation

Uses GSMLIB, PGNM018, PGNM006, PGNM007, PGNM005;

{$R *.DFM}

procedure Tfrm_receb_num_itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_receb_num_itens.FormShow(Sender: TObject);
var
  nr_proc_caption : String[13];
begin

  nr_proc_caption := Processo( str_nr_processo );
  Caption := ' Processo Nº [ ' + nr_proc_caption + ' ] - Recebimento Nº [ '+ datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString+' ]' ;

end;

procedure Tfrm_receb_num_itens.btn_cancelarClick(Sender: TObject);
begin
  frm_receb_num_solic.lOperacaoCancelada := True;
  close;
end;

procedure Tfrm_receb_num_itens.btn_confirmaClick(
  Sender: TObject);
var
  i : integer;
begin
  datm_receb_num_solic.qry_itens_receb_.DisableControls;
  datm_receb_num_solic.qry_itens_receb_.First;
  For i := 1 to datm_receb_num_solic.qry_itens_receb_.RecordCount do
  begin
    qry_itens_solinum_.close;
    qry_itens_solinum_.ParamByName( 'NR_PROCESSO' ).AsString := datm_receb_num_solic.qry_itens_receb_NR_PROCESSO.AsString;
    qry_itens_solinum_.ParamByName( 'NR_SOLICITACAO' ).AsString := datm_receb_num_solic.qry_itens_receb_NR_SOLICITACAO.AsString;
    qry_itens_solinum_.ParamByName( 'NR_LANCAMENTO' ).AsString := datm_receb_num_solic.qry_itens_receb_NR_LANCAMENTO.AsString;
    qry_itens_solinum_.Open;
    qry_itens_solinum_.Edit;
    qry_itens_solinum_VL_RECEBIDO.AsFloat := qry_itens_solinum_VL_RECEBIDO.AsFloat + datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat;
    if qry_itens_solinum_VL_SOLICITADO.AsFloat = qry_itens_solinum_VL_RECEBIDO.AsFloat Then
       qry_itens_solinum_CD_STATUS.AsString := 'B';
    qry_itens_solinum_.Post;
    qry_itens_solinum_.close;
    If ( i <= datm_receb_num_solic.qry_itens_receb_.RecordCount ) Then
       datm_receb_num_solic.qry_itens_receb_.Next;
  end;
  datm_receb_num_solic.sp_soma_todas_solinum_.ParamByName('@nr_processo').AsString := datm_receb_num_solic.tbl_recebimento_NR_PROCESSO.AsString;
  datm_receb_num_solic.sp_soma_todas_solinum_.ExecProc;
  datm_receb_num_solic.tbl_processo_w_.post;
  { Refresh }
  qry_itens_solinum_.close;
  qry_itens_solinum_.open;
  { Refresh }
  datm_receb_num_solic.qry_itens_receb_.EnableControls;
  datm_receb_num_solic.qry_n_ref_.close;
  datm_receb_num_solic.qry_n_ref_.open;
  close;
end;

procedure Tfrm_receb_num_itens.btn_alterar_item_numerarioClick(
  Sender: TObject);
begin
  Application.CreateForm( Tfrm_receb_num_lanc, frm_receb_num_lanc ); 
  frm_receb_num_lanc.ShowModal;
end;



procedure Tfrm_receb_num_itens.btn_recombinaClick(Sender: TObject);
var
  i : integer;
  r : integer;
  n : integer;
  nRows : integer;
  nVl_Saldo : Double;
begin

  With frm_receb_num_registro do
  begin

    c := c + 1;
    if c > nCombinacao Then
    begin
       MessageDlg('Atenção! Não existem outras combinações possíveis.', mtWarning, [mbOk], 0);
       c := 1;
       Exit;
    end;

    datm_receb_num_solic.qry_itens_receb_.Close;

    datm_receb_num_solic.sp_cancela_itens_receb_.ParamByName('@nr_processo').AsString := datm_receb_num_solic.tbl_recebimento_NR_PROCESSO.AsString;
    datm_receb_num_solic.sp_cancela_itens_receb_.ParamByName('@nr_recebimento').AsString  := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
    datm_receb_num_solic.sp_cancela_itens_receb_.ExecProc;

    datm_receb_num_solic.qry_itens_receb_.ParamByName('NR_PROCESSO').AsString := qry_itens_solinum_NR_PROCESSO.AsString; 
    datm_receb_num_solic.qry_itens_receb_.ParamByName('NR_RECEBIMENTO').AsString := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;       
    datm_receb_num_solic.qry_itens_receb_.Open;
  
    nRows := qry_itens_solinum_.RecordCount;
    qry_itens_solinum_.First;
    
    r := 0;
    aCombinacao[c] := aCombinacao[c] + '00,';
    For i := 1 to nRows do
    begin
      nVl_Saldo := ( qry_itens_solinum_VL_SOLICITADO.AsFloat - qry_itens_solinum_VL_RECEBIDO.AsFloat );
      datm_receb_num_solic.qry_itens_receb_.Append;
      datm_receb_num_solic.qry_itens_receb_NR_PROCESSO.AsString     := qry_itens_solinum_NR_PROCESSO.AsString;
      datm_receb_num_solic.qry_itens_receb_NR_RECEBIMENTO.AsString  := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
      datm_receb_num_solic.qry_itens_receb_NR_SOLICITACAO.AsString  := qry_itens_solinum_NR_SOLICITACAO.AsString;
      datm_receb_num_solic.qry_itens_receb_NR_LANCAMENTO.AsString   := qry_itens_solinum_NR_LANCAMENTO.AsString;
      datm_receb_num_solic.qry_itens_receb_CD_ITEM.AsString         := qry_itens_solinum_CD_ITEM.AsString;
      datm_receb_num_solic.qry_itens_receb_VL_SOLICITADO.AsFloat    := nVl_Saldo;
      datm_receb_num_solic.qry_itens_receb_IN_CANCELADO.AsBoolean   := False;
      n := StrToInt( Copy(aCombinacao[c], ((r*3)+1) ,2 ) );
      if ( n > 0 ) and
         ( qry_itens_solinum_NR_SOLICITACAO.AsString = aSolicNum[n].nr_solic ) and
         ( qry_itens_solinum_NR_LANCAMENTO.AsString  = aSolicNum[n].nr_lanc  ) Then
        begin
          datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat := nVl_Saldo;
          r := r + 1;
        end
      else
        datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat := 0;
      datm_receb_num_solic.qry_itens_receb_.post;
      If ( i <= nRows ) Then qry_itens_solinum_.Next;
    end;
  end;

  { Equivale ao refresh }
  datm_receb_num_solic.qry_itens_receb_.Close;
  datm_receb_num_solic.qry_itens_receb_.Open;

end;


procedure Tfrm_receb_num_itens.btn_prioridadeClick(Sender: TObject);
begin
  { Força a prioridade }
  datm_receb_num_solic.qry_itens_receb_.Active := False;
  datm_receb_num_solic.sp_cancela_itens_receb_.ParamByName('@nr_processo').AsString := datm_receb_num_solic.tbl_recebimento_NR_PROCESSO.AsString;
  datm_receb_num_solic.sp_cancela_itens_receb_.ParamByName('@nr_recebimento').AsString  := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
  datm_receb_num_solic.sp_cancela_itens_receb_.ExecProc;
  frm_receb_num_registro.Prioridade;
end;

end.
