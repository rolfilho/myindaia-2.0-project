unit PGNM016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Db, DBTables, PGGP001;

type
  Tfrm_devolucao_lanc = class(TForm)
    btn_salvar: TButton;
    btn_cancelar: TButton;
    Label1: TLabel;
    dbedt_nr_item: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedt_vl_recebido: TDBEdit;
    Bevel1: TBevel;
    edt_cd_item: TEdit;
    edt_nm_item: TEdit;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    sp_proc_item_devolucao_: TStoredProc;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_vl_recebidoExit(Sender: TObject);
  private
    { Private declarations }
  public
    nr_devolucao : string[3];
    { Public declarations }
  end;

var
  frm_devolucao_lanc: Tfrm_devolucao_lanc;

implementation

uses GSMLIB, PGNM020, PGNM015;

{$R *.DFM}

procedure Tfrm_devolucao_lanc.btn_salvarClick(Sender: TObject);
begin

  With sp_proc_item_devolucao_ Do
  begin
  
     ParamByName('@NR_PROCESSO').AsString   := datm_devolucao.qry_itens_devolucao_NR_PROCESSO.AsString;
     ParamByName('@NR_DEVOLUCAO').AsString  := datm_devolucao.qry_itens_devolucao_NR_DEVOLUCAO.AsString;
     ParamByName('@NR_LANC_DEVOL').AsString := datm_devolucao.qry_itens_devolucao_NR_LANC_DEVOL.AsString;

     datm_devolucao.qry_devolucao_.Post;
     datm_devolucao.qry_itens_devolucao_.Post;
     
     datm_devolucao.qry_devolucao_.Close;
     datm_devolucao.qry_itens_devolucao_.Close;

     {Execula a Procedure}
     ExecProc;
     
  end;
  
  datm_devolucao.qry_devolucao_.Open;
  datm_devolucao.qry_itens_devolucao_.Open;
  
  Close;
end;

procedure Tfrm_devolucao_lanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_devolucao_lanc.btn_cancelarClick(Sender: TObject);
begin
  datm_devolucao.qry_itens_devolucao_.cancel;
  datm_devolucao.qry_devolucao_.Cancel;
  Close;
end;


procedure Tfrm_devolucao_lanc.FormShow(Sender: TObject);
var
  nr_proc_caption : String[13];
begin
  nr_proc_caption := Processo( str_nr_processo );
  Caption := Caption + ' - Processo Nº [ ' + nr_proc_caption + ' ] - Devolução Nº [' + nr_devolucao + '] ' ;
end;


procedure Tfrm_devolucao_lanc.dbedt_vl_recebidoExit(Sender: TObject);
Var
  lVerdadeiro : Boolean;
  
begin

  {inicializa}
  lVerdadeiro := False;
  
  If datm_devolucao.qry_itens_devolucao_VL_DEVOLVIDO.AsFloat
     <= frm_devolucao_itens.qry_itens_solinum_Look_vl_Saldo.AsFloat Then
     lVerdadeiro := True;

  {depende de lverdadeiro }   
  btn_salvar.Enabled := lVerdadeiro;

  If lVerdadeiro Then
     btn_salvar.SetFocus
  else   
     btn_Cancelar.SetFocus
      
end;                  

end.
