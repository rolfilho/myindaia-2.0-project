unit PGDI025;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, DBTables, Db, DBCtrls, DBCGrids,
  UCRPE32, Buttons, Menus;

type
  Tfrm_rascunho_LI = class(TForm)
    Mensagem: TStatusBar;
    ds_li: TDataSource;
    qry_li_browse: TQuery;
    qry_li_browseNR_OPER_TRAT_PREV: TStringField;
    qry_li_browseDT_REG_OPER_TRAT: TStringField;
    qry_li_browseNM_FORN_ESTR: TStringField;
    crp_li: TCrpe;
    menu_cadastro: TMainMenu;
    mi_imprime: TMenuItem;
    mi_sair: TMenuItem;
    pnl_financeiro: TPanel;
    btn_sair: TSpeedButton;
    btn_imprimir: TSpeedButton;
    pnl_emissao: TPanel;
    lblColigada: TLabel;
    btn_co_LI: TSpeedButton;
    msk_num_LI: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_LIClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cd_unidade : String[2];
    nr_processo : String[11];
  end;

var
  frm_rascunho_LI: Tfrm_rascunho_LI;

implementation

uses PGGP001, GSMLIB, PGGP017, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_rascunho_LI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_li.Free;
  qry_li_browse.Close;
  Action := caFree;
end;

procedure Tfrm_rascunho_LI.FormCreate(Sender: TObject);
begin
  qry_li_browse.open
end;

procedure Tfrm_rascunho_LI.btn_co_LIClick(Sender: TObject);
begin
  msk_num_LI.Text := ConsultaOnLineEx('OPERAÇÃO_COM_TRATAMENTO','LI´s',['NR_OPER_TRAT_PREV','DT_REG_OPER_TRAT','NM_FORN_ESTR'],['Nº LI','Data','Fornecedor'],'NR_OPER_TRAT_PREV',nil,0);
end;

procedure Tfrm_rascunho_LI.btn_imprimirClick(Sender: TObject);
begin
  With crp_li Do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName:= cDir_Rpt + '\CRGSM002.RPT';
    ParamFields[0] := msk_num_LI.Text;
    Execute;
  end;
end;

procedure Tfrm_rascunho_LI.btn_sairClick(Sender: TObject);
begin
  Close;
end;

end.
