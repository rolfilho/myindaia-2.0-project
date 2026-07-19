unit PGSM220;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask;

type
  Tfrm_duplica_unid = class(TForm)
    lbl_unid_atual: TLabel;
    msk_cd_unid_atual: TMaskEdit;
    btn_co_unid_atual: TSpeedButton;
    edt_nm_unid_atual: TEdit;
    Bevel1: TBevel;
    btn_cancela: TBitBtn;
    btn_duplicar: TBitBtn;
    Label1: TLabel;
    msk_cd_unid_new: TMaskEdit;
    chkbx_atualiza_cliente: TCheckBox;
    procedure btn_co_unid_atualClick(Sender: TObject);
    procedure msk_cd_unid_atualExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_duplicarClick(Sender: TObject);
    procedure msk_cd_unid_atualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_newExit(Sender: TObject);
  private
    { Private declarations }
  public
    in_di : Boolean;
    { Public declarations }
  end;

var
  frm_duplica_unid: Tfrm_duplica_unid;
  NR_PROC_CONSULTA : String[18];

implementation

uses PGGP015, PGGP017, GSMLIB, PGGP001, PGSM221, PGSM018;

{$R *.DFM}


procedure Tfrm_duplica_unid.btn_co_unid_atualClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TUNID_NEG',
                datm_duplica_unid.qry_unid_neg_CD_UNID_NEG,
                'Unidade de Negócio', 52, '', 'TQuery');

  msk_cd_unid_atualExit(nil);
  msk_cd_unid_atual.SetFocus;

end;

procedure Tfrm_duplica_unid.msk_cd_unid_atualExit(Sender: TObject);
begin
  with datm_duplica_unid do
  begin
    edt_nm_unid_atual.Clear;
    if msk_cd_unid_atual.Text = '' then Exit;
    ValCodEdt(msk_cd_unid_atual);

    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_atual.Text;
    qry_unid_neg_.Open;

    if qry_unid_neg_.EOF then
    begin
      BoxMensagem('Unidade não encontrada !!',2);
      msk_cd_unid_atual.Clear;
      msk_cd_unid_atual.SetFocus;
    end
    else edt_nm_unid_atual.Text:= qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
  end;

end;

procedure Tfrm_duplica_unid.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  { Inicializa o Data Module }
  Application.CreateForm( Tdatm_duplica_unid, datm_duplica_unid );
end;

procedure Tfrm_duplica_unid.btn_cancelaClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_duplica_unid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_duplica_unid.qry_unid_neg_.Close;
  datm_duplica_unid.Free;
  Action := caFree;
end;

procedure Tfrm_duplica_unid.btn_duplicarClick(Sender: TObject);
begin
  if (Trim(edt_nm_unid_atual.Text) = '') or
     (Trim(msk_cd_unid_new.Text) = '') then
  begin
    BoxMensagem( 'É necessario o preenchimento das Unidades !!', 3 );
    exit;
  end;

  with datm_duplica_unid do
  begin
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_duplica_unid);

        Screen.Cursor := crHourGlass;
        sp_duplica_unid.ParamByName('@CD_UNID_ATUAL').AsString := msk_cd_unid_atual.Text;
        sp_duplica_unid.ParamByName('@CD_UNID_NEW').AsString   := msk_cd_unid_new.Text;
        sp_duplica_unid.ParamByName('@TP_REPASSA').AsBoolean   := chkbx_atualiza_cliente.Checked;

        ExecStoredProc(sp_duplica_unid);
        CloseStoredProc(sp_duplica_unid);
        Screen.Cursor := crArrow;

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  btn_cancelaClick(nil);
end;

procedure Tfrm_duplica_unid.msk_cd_unid_atualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_atual then btn_co_unid_atualClick(nil);
  end;
end;

procedure Tfrm_duplica_unid.msk_cd_unid_newExit(Sender: TObject);
begin
  ValCodEdt(msk_cd_unid_new);
end;

end.
