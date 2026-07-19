unit PGGP061;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PGCH014, UCRPE32, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, daDatMod, DBTables, Db, ppViewr;

type
  Tfrm_sel_unid_cont = class(Tfrm_sel_unid_prod)
    lbl_agente: TLabel;
    msk_cd_agente: TMaskEdit;
    edt_nm_agente: TEdit;
    btn_co_agente: TSpeedButton;
    msk_cd_transp: TMaskEdit;
    edt_nm_transp: TEdit;
    lbl_transp: TLabel;
    btn_co_transp: TSpeedButton;
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure msk_cd_agenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_transpClick(Sender: TObject);
    procedure msk_cd_transpExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_sel_unid_cont: Tfrm_sel_unid_cont;

implementation

uses PGGP062, GSMLIB, uAg, PGSM051, PGGP017, PGGP001;

{$R *.DFM}

procedure Tfrm_sel_unid_cont.msk_cd_agenteExit(Sender: TObject);
begin
  if msk_cd_agente.text = '' then
  begin
    edt_nm_agente.Text := 'Todos';
    Exit;
  end;

  ValCodEdt( msk_cd_agente );
  if msk_cd_agente.Text <> '' then
  begin
    with datm_sel_unid_cont do
    begin
      qry_agente_.Close;
      qry_agente_.ParamByName('CD_AGENTE').AsString := msk_cd_agente.Text;
      qry_agente_.Prepare;
      qry_agente_.Open;

      if qry_agente_.RecordCount > 0 then
      begin
        edt_nm_agente.Text := qry_agente_NM_AGENTE.AsString;
      end
      else
      begin
        BoxMensagem('Agente não cadastrado!', 2);
        msk_cd_agente.SetFocus;
      end;
    end;
  end
  else
  begin
    edt_nm_agente.Text := '';
  end;
end;

procedure Tfrm_sel_unid_cont.msk_cd_agenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_agente   then btn_co_agenteClick(nil);
    if Sender = msk_cd_transp   then btn_co_transpClick(nil);
  end;
end;

procedure Tfrm_sel_unid_cont.btn_co_agenteClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_ag, frm_ag );
  with frm_ag do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
    if frm_ag.Cons_OnLine_Texto <> '' then msk_cd_agente.Text := frm_ag.Cons_OnLine_Texto;
  end;
  msk_cd_agenteExit(nil);
end;

procedure Tfrm_sel_unid_cont.btn_co_transpClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_transp_rod, frm_transp_rod );
  with frm_transp_rod do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine   := False;
  if frm_transp_rod.Cons_OnLine_Texto <> '' then msk_cd_transp.Text := frm_transp_rod.Cons_OnLine_Texto;
  end;
  msk_cd_transpExit(nil);
end;

procedure Tfrm_sel_unid_cont.msk_cd_transpExit(Sender: TObject);
begin
  if msk_cd_transp.text = '' then
  begin
    edt_nm_transp.Text := 'Todos';
    Exit;
  end;

  ValCodEdt( msk_cd_transp );
  if msk_cd_transp.Text <> '' then
  begin
    with datm_sel_unid_cont do
    begin
      qry_transp_.Close;
      qry_transp_.ParamByName('CD_TRANSP_ROD').AsString := msk_cd_transp.Text;
      qry_transp_.Prepare;
      qry_transp_.Open;

      if qry_transp_.RecordCount > 0 then
      begin
        edt_nm_transp.Text := qry_transp_AP_TRANSP_ROD.AsString;
      end
      else
      begin
        BoxMensagem('Transportador não cadastrado!', 2);
        msk_cd_transp.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_transp.Text := '';
  end;
end;

procedure Tfrm_sel_unid_cont.FormShow(Sender: TObject);
begin
  inherited;

  case tp_rel of
      24: begin
          Caption := 'Rel. Contêineres não Devolvidos';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          chk_arquivo.Visible    := True;
          chk_arquivo.Left       := 12;
          chk_arquivo.Top        := 253;
      end;
  end;

  if chk_arquivo.Visible then
  begin
    msk_dt_inicio.TabOrder := chk_arquivo.TabOrder + 1;
  end;
  msk_dt_fim.TabOrder := msk_dt_inicio.TabOrder + 1;
end;

procedure Tfrm_sel_unid_cont.btn_imprimirClick(Sender: TObject);
var
  nr_identificador: integer;
begin
  Screen.Cursor := crHourGlass;
  case tp_rel of
      24: begin
           with datm_sel_unid_cont do
           begin
             try
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_cntr_nao_dev );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                  sp_rel_cntr_nao_dev.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                  sp_rel_cntr_nao_dev.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
               if Trim( msk_cd_produto.Text ) = '' then
                  sp_rel_cntr_nao_dev.ParamByName('@cd_produto').AsString    := 'X'
               else
                  sp_rel_cntr_nao_dev.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
               if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_cntr_nao_dev.ParamByName('@cd_grupo').AsString      := 'X'
               else
                  sp_rel_cntr_nao_dev.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
               if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_cntr_nao_dev.ParamByName('@cd_cliente').AsString    := 'X'
               else
                  sp_rel_cntr_nao_dev.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
               if Trim( msk_cd_agente.Text ) = '' then
                  sp_rel_cntr_nao_dev.ParamByName('@cd_agente').AsString     := 'X'
               else
                  sp_rel_cntr_nao_dev.ParamByName('@cd_agente').AsString     := msk_cd_agente.Text;
               if Trim( msk_cd_transp.Text ) = '' then
                  sp_rel_cntr_nao_dev.ParamByName('@cd_transp_nac').AsString := 'X'
               else
                  sp_rel_cntr_nao_dev.ParamByName('@cd_transp_nac').AsString := msk_cd_transp.Text;
               
               sp_rel_cntr_nao_dev.ParamByName('@dt_inicio').AsDate         := msk_dt_inicio.Date;
               sp_rel_cntr_nao_dev.ParamByName('@dt_fim').AsDate            := msk_dt_fim.Date;

               ExecStoredProc( sp_rel_cntr_nao_dev );
               nr_identificador := sp_rel_cntr_nao_dev.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_cntr_nao_dev );
               datm_main.db_broker.Commit;

               qry_cntr_nao_dev_.Close;
               qry_cntr_nao_dev_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
               qry_cntr_nao_dev_.Prepare;
               qry_cntr_nao_dev_.Open;
               Screen.Cursor := crHourGlass;

               if qry_cntr_nao_dev_.RecordCount > 0 then
               begin
                 ppRetCntr.Template.FileName := cDir_RPT + '\RBEST001.rtm';
                 ppRetCntr.Template.LoadFromFile;
                 pplbl_titulo.Caption             := 'Contêineres não Devolvidos - De ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
                 ppRetCntr.AllowPrintToFile  := True;
                 if chk_arquivo.Checked then
                 begin
                   ppRetCntr.DeviceType      := 'PDFFile';
                   ppRetCntr.TextFileName    := cDir_Rpt + '\RelCntrNaoDev.PDF';
                 end
                 else
                 begin
                   ppRetCntr.DeviceType      := 'Screen';
                 end;
                 ppRetCntr.Print ;

               end;
               qry_cntr_nao_dev_.Close;

               ApagaDados( 'TREL_CNTR_NAO_DEV', nr_identificador );

             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
                 Exit;
               end;
             end;
           end;
         end;
      end;
end;

procedure Tfrm_sel_unid_cont.FormCreate(Sender: TObject);
begin
  inherited;

 { Inicializa o Data Module para Seleção de Relatórios}
  Application.CreateForm( Tdatm_sel_unid_cont, datm_sel_unid_cont );
end;


end.
