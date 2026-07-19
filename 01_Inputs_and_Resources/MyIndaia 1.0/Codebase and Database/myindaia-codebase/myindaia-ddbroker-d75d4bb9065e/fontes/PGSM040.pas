unit PGSM040;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons;

type
  Tfrm_recontab_ctaapagar = class(TForm)
    Panel1: TPanel;
    lbl_data: TLabel;
    msk_lote: TMaskEdit;
    btn_recontab: TButton;
    btn_sair: TButton;
    lbl_coligada: TLabel;
    btn_co_coligada: TSpeedButton;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_recontabClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure btn_co_coligadaClick(Sender: TObject);
    procedure msk_cd_coligadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    str_cd_relatorio : String;
    { Public declarations }
  end;

var
  frm_recontab_ctaapagar: Tfrm_recontab_ctaapagar;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, GSMLIB, PGSM043, PGSM096, PGSM148;

procedure Tfrm_recontab_ctaapagar.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_recontab_ctaapagar.btn_recontabClick(Sender: TObject);
begin
  if Trim( msk_cd_coligada.Text ) = '' then
  begin
    BoxMensagem('Informe uma Empresa Coligada!', 2);
    msk_cd_coligada.SetFocus;
    Exit;
  end;

  if Trim( msk_lote.Text ) = '' then
  begin
    BoxMensagem('Informe o lote para recontabilização!', 2);
    msk_lote.SetFocus;
    Exit;
  end;

  with datm_recontab_ctaapagar do
  begin
    try
      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;
      Contabiliza( qry_contab_, qry_contab_lanc_, qry_contab_gerencial_ ,
                   msk_cd_coligada.Text, msk_cd_coligada.Text );
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_recontab_ctaapagar.FormShow(Sender: TObject);
begin
  msk_cd_coligada.Text := str_cd_coligada;
  msk_cd_coligadaExit(nil);
  msk_lote.SetFocus;
end;

procedure Tfrm_recontab_ctaapagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_recontab_ctaapagar.qry_coligada_.Close;
  Action := caFree;
end;



procedure Tfrm_recontab_ctaapagar.msk_cd_coligadaExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_coligada );
  with datm_recontab_ctaapagar do
  begin
    if msk_cd_coligada.Text <> '' then
    begin
      qry_coligada_.Close;
      qry_coligada_.SQL[2] := 'WHERE CD_COLIGADA = "' + msk_cd_coligada.Text + '"';
      qry_coligada_.Prepare;
      qry_coligada_.Open;
      if qry_coligada_.RecordCount > 0 then
      begin
        edt_nm_coligada.Text := qry_coligada_NM_COLIGADA.AsString;
      end
      else
      begin
        BoxMensagem('Empresa Coligada inválida!', 2);
        edt_nm_coligada.Text := '';
        msk_cd_coligada.SetFocus;
        Exit;
      end;
    end
    else
    begin
      edt_nm_coligada.Text := '';
    end;
  end;
end;

procedure Tfrm_recontab_ctaapagar.btn_co_coligadaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 14;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TCOLIGADA';

  datm_consulta_padrao.Tabela.Filtered     := False;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := True; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption      := Caption + ' Coligada ';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_coligada.Text := frm_consulta_padrao.Cons_OnLine_Texto;
  msk_cd_coligadaExit(msk_cd_coligada);
end;

procedure Tfrm_recontab_ctaapagar.msk_cd_coligadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_coligada         then btn_co_coligadaClick(nil);
  end;
end;

procedure Tfrm_recontab_ctaapagar.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Dados do módulo Recontabiliza Contas a Pagar }
  Application.CreateForm( Tdatm_recontab_ctaapagar, datm_recontab_ctaapagar );
end;

end.
