unit PGDI010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Funcoes;

type
  Tfrm_duplica_di = class(TForm)
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_nr_processo: TSpeedButton;
    lbl_cd_cliente: TLabel;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    lbl_cd_servico: TLabel;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    Bevel1: TBevel;
    btn_cancela: TBitBtn;
    btn_duplicar: TBitBtn;
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_duplicarClick(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    in_di : Boolean;
    { Public declarations }
  end;

var
  frm_duplica_di: Tfrm_duplica_di;
  NR_PROC_CONSULTA : String[18];

implementation

uses PGGP015, PGGP017, PGDI003, GSMLIB, PGGP001, PGDI022, PGSM136, ConsOnlineEx;

{$R *.DFM}


procedure Tfrm_duplica_di.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''01''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + frm_di.mskedt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure Tfrm_duplica_di.msk_nr_processoExit(Sender: TObject);
begin
  if in_di then
  begin
    edt_cd_cliente.Text := ''; edt_nm_cliente.Text := '';
    edt_cd_servico.Text := ''; edt_nm_servico.Text := '';
    if msk_nr_processo.Text <> '' then
    begin
      with datm_duplica_di do
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString := frm_DI.mskedt_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.RecordCount = 0 then
        begin
          BoxMensagem( 'Processo não encontrado. Digite novamente.', 2 );
          msk_nr_processo.SetFocus;
          Exit;
        end;

        edt_cd_cliente.Text := qry_processo_CD_CLIENTE.AsString;
        edt_nm_cliente.Text := qry_processo_NM_EMPRESA.AsString;
        edt_cd_servico.Text := qry_processo_CD_SERVICO.AsString;
        edt_nm_servico.text := qry_processo_NM_SERVICO.AsString;

        str_nr_processo := qry_processo_NR_PROCESSO.AsString;

        qry_di_.Close;
        qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_di_.Prepare;
        qry_di_.Open;

        if qry_di_TOT_PROCESSO.AsInteger > 0 then
        begin
          btn_duplicar.Enabled   := True;
        end
        else
        begin
          BoxMensagem( 'DI inexistente para este processo!', 3 );
          btn_duplicar.Enabled   := False;
        end;
        qry_processo_.Close;
        qry_di_.Close;
      end;
    end;
  end;
end;

procedure Tfrm_duplica_di.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  { Inicializa o Data Module }
  Application.CreateForm( Tdatm_duplica_di, datm_duplica_di );
end;

procedure Tfrm_duplica_di.btn_cancelaClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_duplica_di.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  datm_duplica_di.Destroy;
  datm_duplica_di.Free;
  Action := caFree;
end;

procedure Tfrm_duplica_di.btn_duplicarClick(Sender: TObject);
begin
  with datm_duplica_di do
  begin
    if in_di then
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(datm_duplica_di.sp_duplica_di);
        sp_duplica_di.ParamByName('@NR_PROCESSO_FONTE').AsString   := frm_DI.mskedt_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
        sp_duplica_di.ParamByName('@NR_PROCESSO_DESTINO').AsString := frm_DI.mskedt_cd_unid_neg.Text + '01' + frm_DI.mskedt_nr_processo.Text;
        ExecStoredProc(sp_duplica_di);
        case sp_duplica_di.ParamByName('Result').AsInteger of
          0 : begin
                btn_duplicar.Enabled := False;
                BoxMensagem( 'Processo D.I. duplicado com sucesso!', 3);
              end;
          1 : BoxMensagem( 'Processo Fonte não Existe!', 2 );
          2 : BoxMensagem( 'Processo Destino já Existe!', 2 );
        end;
        CloseStoredProc(sp_duplica_di);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end
    else
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_duplica_po);
        sp_duplica_po.ParamByName('@NR_PROCESSO_FONTE').AsString   := str_nr_processo;
        sp_duplica_po.ParamByName('@NR_PROCESSO_DESTINO').AsString := msk_nr_processo.Text;
        ExecStoredProc(sp_duplica_po);
        case sp_duplica_po.ParamByName('Result').AsInteger of
          0 : begin
                btn_duplicar.Enabled := False;
                BoxMensagem( 'Processo P.O. duplicado com sucesso!', 3);
              end;
          1 : BoxMensagem( 'Processo Fonte não Existe!', 2 );
          2 : BoxMensagem( 'Processo Destino já Existe!', 2 );
        end;
        CloseStoredProc(sp_duplica_po);
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
end;

procedure Tfrm_duplica_di.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo then btn_nr_processoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_duplica_di.FormShow(Sender: TObject);
begin
  lbl_cd_cliente.Visible  := in_di;
  lbl_cd_servico.Visible  := in_di;
  edt_cd_cliente.Visible  := in_di;
  edt_cd_servico.Visible  := in_di;
  edt_nm_cliente.Visible  := in_di;
  edt_nm_servico.Visible  := in_di;
  btn_nr_processo.Visible := in_di;

  if in_di then
  begin
    Caption := 'Duplicação de DI';
    lbl_nr_processo.Caption := 'Processo nº:';
  end
  else
  begin
    Caption := 'Duplicação de PO';
    lbl_nr_processo.Caption := 'Novo PO:';
  end;

end;

end.
