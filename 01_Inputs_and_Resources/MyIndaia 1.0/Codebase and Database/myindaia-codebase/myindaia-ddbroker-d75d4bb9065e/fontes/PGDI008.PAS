unit PGDI008;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, Db;

type
  Tfrm_contrato_cambio_antec = class(TForm)
    bvl_contato: TBevel;
    btn_salvar: TButton;
    btn_cancelar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditNR_OP_CAMBIO: TDBEdit;
    Label3: TLabel;
    EditCD_BANCO_PAGAMENTO: TDBEdit;
    Label4: TLabel;
    EditCD_PRACA_PAGAMENTO: TDBEdit;
    Label5: TLabel;
    EditVL_VINC_MD_CAMBIO: TDBEdit;
    Label6: TLabel;
    EditNR_COMPR_CAMBIO: TDBEdit;
    dblkpcbox_moeda_nac: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dblkpcbox_moeda_nacClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditNR_COMPR_CAMBIOExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cState : String[1];
  end;

var
  frm_contrato_cambio_antec: Tfrm_contrato_cambio_antec;

implementation

uses GSMLIB, PGDI019;

{$R *.DFM}

procedure Tfrm_contrato_cambio_antec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_contrato_cambio_antec.btn_cancelarClick(Sender: TObject);
begin
  datm_DI_Adicao.qry_ad_cambio_pg_antec_.cancel;
  Close;
end;

procedure Tfrm_contrato_cambio_antec.btn_salvarClick(Sender: TObject);
begin
  with datm_DI_Adicao do
  begin
    ActiveControl := nil;
    if qry_ad_cambio_pg_antec_.State in [dsEdit, dsInsert] then
    qry_ad_cambio_pg_antec_NR_PROCESSO.AsString        := qry_adicao_NR_PROCESSO.AsString;
    qry_ad_cambio_pg_antec_NR_ADICAO.AsString          := qry_adicao_NR_ADICAO.AsString;
    qry_ad_cambio_pg_antec_CD_FORMA_PAGAMENTO.AsString := '1';
//    if qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO.IsNull then qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO.AsFloat := 0;
    if Length( qry_ad_cambio_pg_antec_NR_COMPR_CAMBIO.AsString ) = 14 then
       qry_ad_cambio_pg_antec_CD_TP_COMPR_CAMBIO.AsString := '1'
    else if Length( qry_ad_cambio_pg_antec_NR_COMPR_CAMBIO.AsString ) = 11 then
      qry_ad_cambio_pg_antec_CD_TP_COMPR_CAMBIO.AsString := '2';
    qry_ad_cambio_pg_antec_.Post;
    qry_ad_cambio_pg_antec_.Close;
    qry_ad_cambio_pg_antec_.Open;
  end;
  Close;
end;

procedure Tfrm_contrato_cambio_antec.dblkpcbox_moeda_nacClick(
  Sender: TObject);
begin
  btn_salvar.enabled := True
end;

procedure Tfrm_contrato_cambio_antec.FormShow(Sender: TObject);
begin
{  datm_DI_Adicao.tbl_adicao_vl_merc_loc_emb_mn;}
  btn_salvar.enabled := false;
end;

procedure Tfrm_contrato_cambio_antec.EditNR_COMPR_CAMBIOExit(
  Sender: TObject);
begin
  if Not CNPJ(EditNR_COMPR_CAMBIO.Text) then
  begin
    EditNR_COMPR_CAMBIO.SetFocus;
  end;
end;

end.
