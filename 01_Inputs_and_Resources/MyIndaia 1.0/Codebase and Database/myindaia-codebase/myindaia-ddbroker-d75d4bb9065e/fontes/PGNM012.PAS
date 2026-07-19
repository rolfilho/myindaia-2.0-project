unit PGNM012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, ComCtrls, Grids, DBGrids, Db, DBTables,
  PGGP001;

type
  Tfrm_receb_nao_solic_lanc = class(TForm)
    btn_gravar: TButton;
    Bevel1: TBevel;
    dbedt_nr_recebimento: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedt_vl_recebimento: TDBEdit;
    dbcbox_cd_banco: TDBLookupComboBox;
    dbcbox_nm_banco: TDBLookupComboBox;
    btn_cancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_vl_recebimentoChange(Sender: TObject);
  private                                  
    { Private declarations }
  public
    { Public declarations }
    lCombinacao : boolean;
    lPrioridade : boolean;
    lProcManual : boolean;
    nr_solicitacao : String[3];
    cState : String[1];
  end;

var
  frm_receb_nao_solic_lanc: Tfrm_receb_nao_solic_lanc;

implementation

Uses pggp002, PGGP011, PGGP012, PGNM002, GSMLIB, PGNM004, PGNM008, PGNM009,
  PGNM019;

{$R *.DFM}

procedure Tfrm_receb_nao_solic_lanc.FormShow(Sender: TObject);
var
  nr_proc_caption : String[13];
begin
  nr_proc_caption := Processo( str_nr_processo );
  Caption := Caption + ' - Processo Nº [ ' + nr_proc_caption + ' ]' ;
end;

procedure Tfrm_receb_nao_solic_lanc.btn_gravarClick(Sender: TObject);
begin
  try
    datm_receb_num_nao_solic.qry_solinum_.close;
    datm_receb_num_nao_solic.qry_solinum_.open;
    datm_receb_num_nao_solic.qry_solinum_.Append;
    datm_receb_num_nao_solic.qry_solinum_NR_PROCESSO.AsString      := datm_receb_num_nao_solic.tbl_processo_w_NR_PROCESSO.AsString;
    datm_receb_num_nao_solic.qry_solinum_NR_SOLICITACAO.AsString   := nr_solicitacao;
    datm_receb_num_nao_solic.qry_solinum_DT_SOLICITACAO.AsDateTime := date;
    datm_receb_num_nao_solic.qry_solinum_CD_USUARIO.AsString       := str_cd_usuario;
    datm_receb_num_nao_solic.qry_solinum_CD_STATUS.AsString        := 'A';

    datm_receb_num_nao_solic.qry_itens_solinum_.close;
    datm_receb_num_nao_solic.qry_itens_solinum_.open;
    datm_receb_num_nao_solic.qry_itens_solinum_.Append;
    datm_receb_num_nao_solic.qry_itens_solinum_NR_PROCESSO.AsString     := str_nr_processo;
    datm_receb_num_nao_solic.qry_itens_solinum_NR_SOLICITACAO.AsString  := nr_solicitacao;
    datm_receb_num_nao_solic.qry_itens_solinum_NR_LANCAMENTO.AsString   := '001';
    datm_receb_num_nao_solic.qry_itens_solinum_CD_ITEM.AsString         := '999';
    datm_receb_num_nao_solic.qry_itens_solinum_TP_SOLIC_INFORM.AsString := '1';
    datm_receb_num_nao_solic.qry_itens_solinum_CD_STATUS.AsString       := 'B';
    datm_receb_num_nao_solic.qry_itens_solinum_VL_SOLICITADO.AsFloat    := dbedt_vl_recebimento.field.AsFloat;
    datm_receb_num_nao_solic.qry_itens_solinum_VL_RECEBIDO.AsFloat      := dbedt_vl_recebimento.field.AsFloat;
    datm_receb_num_nao_solic.qry_itens_receb_.close;
    datm_receb_num_nao_solic.qry_itens_receb_.open;
    If not ( datm_receb_num_nao_solic.tbl_recebimento_.State in [dsInsert, dsEdit] ) Then;
       datm_receb_num_nao_solic.tbl_recebimento_.Edit;
    datm_receb_num_nao_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger := datm_receb_num_nao_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger + 1;
    datm_receb_num_nao_solic.qry_itens_receb_.Append;
    datm_receb_num_nao_solic.qry_itens_receb_NR_PROCESSO.AsString    := str_nr_processo;
    datm_receb_num_nao_solic.qry_itens_receb_NR_RECEBIMENTO.AsString := nr_solicitacao;
    datm_receb_num_nao_solic.qry_itens_receb_NR_LANC_RECEB.AsString  := StrZero( datm_receb_num_nao_solic.tbl_recebimento_QT_ITENS_RECEB.AsFloat, 3 );
    datm_receb_num_nao_solic.qry_itens_receb_NR_SOLICITACAO.AsString := nr_solicitacao;
    datm_receb_num_nao_solic.qry_itens_receb_NR_LANCAMENTO.AsString  := '001';
    datm_receb_num_nao_solic.qry_itens_receb_CD_ITEM.AsString        := '999';
    datm_receb_num_nao_solic.qry_itens_receb_VL_SOLICITADO.AsFloat   := dbedt_vl_recebimento.field.AsFloat;
    datm_receb_num_nao_solic.qry_itens_receb_VL_RECEBIDO.AsFloat     := dbedt_vl_recebimento.field.AsFloat;
    datm_receb_num_nao_solic.qry_itens_receb_IN_CANCELADO.AsBoolean  := False;
    datm_receb_num_nao_solic.qry_itens_solinum_.post;
    datm_receb_num_nao_solic.qry_solinum_.Post;
    datm_receb_num_nao_solic.qry_itens_receb_.post;
    datm_receb_num_nao_solic.tbl_recebimento_.post;
    datm_receb_num_nao_solic.tbl_processo_w_.Post;
    btn_gravar.Enabled := False;
    btn_gravar.Default := False;
    close;
  except
    frm_receb_nao_solic.lOperacaoCancelada := True;
    btn_gravar.Enabled := False;
    btn_gravar.Default := False;
    close;
  end
end;

procedure Tfrm_receb_nao_solic_lanc.btn_cancelarClick(Sender: TObject);
begin
  frm_receb_nao_solic.lOperacaoCancelada := True;
  close;
end;

procedure Tfrm_receb_nao_solic_lanc.dbedt_vl_recebimentoChange(
  Sender: TObject);
begin
  btn_gravar.Enabled := True;
  btn_gravar.Default := True;
end;

end.
