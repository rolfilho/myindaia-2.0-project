unit PGSM033;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ShellApi;

type
  Tfrm_duplica_eventos = class(TForm)
    lbl_servico: TLabel;
    btn_co_servico: TSpeedButton;
    edt_nm_servico: TEdit;
    msk_cd_servico: TMaskEdit;
    btn_duplicar: TButton;
    btn_fechar: TButton;
    lbl_destino: TLabel;
    procedure btn_co_servicoClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    nr_form : Byte;
    str_servico_destino : String[3];
    cd_nm_destino : String;
  end;

var
  frm_duplica_eventos: Tfrm_duplica_eventos;

implementation

uses PGGP001, PGSM022, PGSM038, GSMLIB, PGGP017, PGSM096, PGSM148, PGSM059;

{$R *.DFM}

procedure Tfrm_duplica_eventos.btn_co_servicoClick(Sender: TObject);
begin
  case nr_form of
  1 : begin
        Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

        frm_consulta_padrao.nCodigo              := 26;
        datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
        datm_consulta_padrao.Tabela.TableName    := 'TSERVICO';

        datm_consulta_padrao.Tabela.Filtered := False;
        datm_consulta_padrao.Tabela.Open;
        frm_consulta_padrao.st_modificar     := True; // st_modificar;

        with frm_consulta_padrao do
        begin
          Caption := Caption + ' Serviço ';
          lCons_OnLine := True;
          ShowModal;
          lCons_OnLine := False;
        end;

        msk_cd_servico.Text := frm_consulta_padrao.Cons_OnLine_Texto;
        msk_cd_servicoExit(nil);
        msk_cd_servico.SetFocus;
      end;
  2 : begin
        Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

        frm_consulta_padrao.nCodigo              := 57;
        datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
        datm_consulta_padrao.Tabela.TableName    := 'TITEM';

        datm_consulta_padrao.Tabela.Filtered := False;
        datm_consulta_padrao.Tabela.Open;
        frm_consulta_padrao.st_modificar     := True; // st_modificar;

        with frm_consulta_padrao do
        begin
          Caption := Caption + ' Item ';
          lCons_OnLine := True;
          ShowModal;
          lCons_OnLine := False;
        end;

        msk_cd_servico.Text := frm_consulta_padrao.Cons_OnLine_Texto;
        msk_cd_servicoExit(nil);
        msk_cd_servico.SetFocus;
      end;
  end;
end;

procedure Tfrm_duplica_eventos.msk_cd_servicoExit(Sender: TObject);
begin
  case nr_form of
  1 : begin
        edt_nm_servico.Clear;
        if msk_cd_servico.Text = '' then
        begin
          edt_nm_servico.Text := '';
          Exit;
        end;
        ValCodEdt(msk_cd_servico);
        with datm_duplica_eventos.qry_servico_ do
        begin
          ParamByName('CD_SERVICO').AsString := msk_cd_servico.Text;
          Prepare;
          Open;
          if RecordCount = 0 then
          begin
            BoxMensagem('Serviço não encontrado!', 2);
            msk_cd_servico.Clear;
            edt_nm_servico.Clear;
            msk_cd_servico.SetFocus;
          end
          else edt_nm_servico.Text:= FieldByName('NM_SERVICO').AsString;
          Close;
        end;
      end;
  2 : begin
        edt_nm_servico.Clear;
        if msk_cd_servico.Text = '' then
        begin
          edt_nm_servico.Text := '';
          Exit;
        end;
        ValCodEdt(msk_cd_servico);
        with datm_duplica_eventos.qry_item_ do
        begin
          close;
          ParamByName('CD_ITEM').AsString := msk_cd_servico.Text;
          Prepare;
          Open;
          if RecordCount = 0 then
          begin
            BoxMensagem('Item não encontrado!', 2);
            msk_cd_servico.Clear;
            edt_nm_servico.Clear;
            msk_cd_servico.SetFocus;
          end
          else edt_nm_servico.Text:= FieldByName('NM_ITEM').AsString;
          Close;
        end;
      end;
  end
end;

procedure Tfrm_duplica_eventos.btn_duplicarClick(Sender: TObject);
begin
  case nr_form of
  1 : begin
        if Trim(msk_cd_servico.Text) = '' then
        begin
          BoxMensagem('Informe um Serviço!', 2);
          msk_cd_servico.SetFocus;
          Exit;
        end;

        try
          if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected :=  True;
          datm_main.db_broker.StartTransaction;

          with datm_duplica_eventos do
          begin
            CloseStoredProc(sp_duplica_eventos);
            sp_duplica_eventos.ParamByName('@CD_SERVICO_FONTE').AsString   := Trim( msk_cd_servico.Text );
            sp_duplica_eventos.ParamByName('@CD_SERVICO_DESTINO').AsString := str_servico_destino;
            ExecStoredProc(datm_duplica_eventos.sp_duplica_eventos);
            CloseStoredProc(sp_duplica_eventos);
          end;

          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
            Exit;
          end;
        end;
        BoxMensagem('Duplicação executada com sucesso!', 3);
      end;
  2 : begin
        if Trim(msk_cd_servico.Text) = '' then
        begin
          BoxMensagem('Informe um Item!', 2);
          msk_cd_servico.SetFocus;
          Exit;
        end;

        try
          if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected :=  True;
          datm_main.db_broker.StartTransaction;

          with datm_duplica_eventos do
          begin
            CloseStoredProc(sp_duplica_item_area);
            sp_duplica_item_area.ParamByName('@CD_ITEM_FONTE').AsString   := Trim( msk_cd_servico.Text );
            sp_duplica_item_area.ParamByName('@CD_ITEM_DESTINO').AsString := str_servico_destino;
            ExecStoredProc(datm_duplica_eventos.sp_duplica_item_area);
            CloseStoredProc(sp_duplica_item_area);
          end;

          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
            Exit;
          end;
        end;
        BoxMensagem('Duplicação executada com sucesso!', 3);
      end;
  end;
end;

procedure Tfrm_duplica_eventos.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_duplica_eventos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   with datm_duplica_eventos do
   begin
     if qry_servico_.Active  then qry_servico_.Close;
     if qry_item_.Active  then qry_item_.Close;
     Free;
   end;
   Action := cafree; 
end;

procedure Tfrm_duplica_eventos.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_duplica_eventos, datm_duplica_eventos);
end;

procedure Tfrm_duplica_eventos.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_servico  then btn_co_servicoClick(nil);
  end;
end;

procedure Tfrm_duplica_eventos.FormShow(Sender: TObject);
begin
  case nr_form of
  1 : begin
        frm_duplica_eventos.Caption := 'Duplicação de Eventos';
        lbl_servico.Caption := 'Serviço Origem';
        lbl_destino.Caption := cd_nm_destino;
      end;
  2 : begin
        frm_duplica_eventos.Caption := 'Duplicação de Áreas';
        lbl_servico.Caption := 'Item Origem';
        lbl_destino.Caption := cd_nm_destino;
      end;
  end;
end;

end.
