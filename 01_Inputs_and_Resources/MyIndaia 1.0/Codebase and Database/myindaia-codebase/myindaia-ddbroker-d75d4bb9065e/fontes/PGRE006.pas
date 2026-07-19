unit PGRE006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Mask, Buttons, ShellApi, ComObj, Db,
  DBTables, Grids, DBGrids, Funcoes;

type
  Tfrm_rel_ev_critico = class(TForm)
    pnl_rel_ev_critico: TPanel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    Label1: TLabel;
    btn_co_area: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    lbl_unid_neg: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_produto: TLabel;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    Label2: TLabel;
    btn_co_evento: TSpeedButton;
    msk_cd_evento: TMaskEdit;
    edt_nm_evento: TEdit;
    chk_dias_uteis: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_cd_eventoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
  private
    { Private declarations }
  public
     vTipoRel : Integer;
    { Public declarations }
  end;

var
  frm_rel_ev_critico: Tfrm_rel_ev_critico;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGRE007, PGSM018, PGSM010, PGSM119, PGSM024,
  pgsm212, PGSM036;

procedure Tfrm_rel_ev_critico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_rel_ev_critico do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_area_.Close;
    qry_evento_.Close;
    qry_ev_basico_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_rel_ev_critico.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_rel_ev_critico, datm_rel_ev_critico );
end;

procedure Tfrm_rel_ev_critico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Close;
end;

procedure Tfrm_rel_ev_critico.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  with datm_rel_ev_critico do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;

  msk_dt_inicio.TabOrder := msk_cd_evento.TabOrder + 1;
  msk_dt_fim.TabOrder := msk_dt_inicio.TabOrder + 1;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_rel_ev_critico.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim(msk_cd_unid_neg.Text) = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_rel_ev_critico do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
        edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        edt_nm_unid_neg.Clear;
        msk_cd_unid_neg.SetFocus;
      end;
      qry_unid_neg_.Close;
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_rel_ev_critico.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim(msk_cd_produto.Text) = '' then
  begin
    edt_nm_produto.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_rel_ev_critico do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
        edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        edt_nm_produto.Clear;
        msk_cd_produto.SetFocus;
      end;
      qry_produto_.Close;
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_rel_ev_critico.msk_cd_grupoExit(Sender: TObject);
begin
  if Trim(msk_cd_grupo.Text) = '' then
  begin
    edt_nm_produto.Text := 'Todos Grupos';
    Exit;
  end;

  ValCodEdt( msk_cd_grupo );
  with datm_rel_ev_critico do
  begin
    qry_grupo_.Close;
    qry_grupo_.ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
    if qry_grupo_.RecordCount > 0 then
      edt_nm_grupo.Text := qry_grupo_.FieldByName('NM_GRUPO').AsString
    else
    begin
      BoxMensagem( 'Grupo de Clientes não encontrado!', 2 );
      edt_nm_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end;
    qry_grupo_.Close;
  end;
end;

procedure Tfrm_rel_ev_critico.msk_cd_clienteExit(Sender: TObject);
begin
  if Trim(msk_cd_cliente.Text) = '' then Exit;

  ValCodEdt( msk_cd_cliente );
  with datm_rel_ev_critico do
  begin
    qry_cliente_.Close;
    qry_cliente_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    qry_cliente_.Prepare;
    qry_cliente_.Open;
    if qry_cliente_.RecordCount > 0 then
      edt_nm_cliente.Text := qry_cliente_AP_EMPRESA.AsString
    else
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end;
    qry_cliente_.Close;
  end;
end;

procedure Tfrm_rel_ev_critico.msk_cd_areaExit(Sender: TObject);
begin
  if Trim(msk_cd_area.Text) = '' then
  begin
    edt_nm_area.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_area );
  if msk_cd_area.Text <> '' then
  begin
    with datm_rel_ev_critico do
    begin
      qry_area_.Close;
      qry_area_.ParamByName('CD_AREA').AsString := msk_cd_area.Text;
      qry_area_.Prepare;
      qry_area_.Open;
      if qry_area_.RecordCount > 0 then
        edt_nm_area.Text := qry_area_NM_AREA.AsString
      else
      begin
        BoxMensagem('Área não cadastrada!', 2);
        edt_nm_area.Clear;
        msk_cd_area.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_area.Text := '';
  end;
end;

procedure Tfrm_rel_ev_critico.msk_cd_eventoExit(Sender: TObject);
begin
  if Trim(msk_cd_evento.Text) = '' then Exit;

  ValCodEdt( msk_cd_evento );
  if msk_cd_evento.Text <> '' then
  begin
    with datm_rel_ev_critico do
    begin
      qry_evento_.Close;
      qry_evento_.ParamByName('CD_EVENTO').AsString := msk_cd_evento.Text;
      qry_evento_.Prepare;
      qry_evento_.Open;
      if qry_evento_.RecordCount > 0 then
        edt_nm_evento.Text := qry_evento_NM_EVENTO.AsString
      else
      begin
        BoxMensagem('Evento não cadastrado!', 2);
        edt_nm_evento.Clear;
        msk_cd_evento.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_evento.Text := '';
  end;
end;

procedure Tfrm_rel_ev_critico.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_area     then btn_co_areaClick(nil);
    if Sender = msk_cd_evento   then btn_co_eventoClick(nil);
  end;
end;

procedure Tfrm_rel_ev_critico.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_rel_ev_critico do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_ev_critico.btn_co_produtoClick(Sender: TObject);
begin
  with datm_rel_ev_critico do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_ev_critico.btn_co_grupoClick(Sender: TObject);
begin
  with datm_rel_ev_critico do
  begin
    Application.CreateForm(Tfrm_grupo, frm_grupo );
    with frm_grupo do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_grupo.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
      msk_cd_grupoExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_ev_critico.btn_co_clienteClick(Sender: TObject);
begin
  with datm_rel_ev_critico do
  begin
    Application.CreateForm(Tfrm_cliente, frm_cliente );
    with frm_cliente do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_cliente.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
      msk_cd_clienteExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_ev_critico.btn_co_areaClick(Sender: TObject);
begin
  with datm_rel_ev_critico do
  begin
    Application.CreateForm(Tfrm_area, frm_area );
    with frm_area do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_area.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_area.Text := frm_area.Cons_OnLine_Texto;
      msk_cd_areaExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_ev_critico.btn_co_eventoClick(Sender: TObject);
begin
  with datm_rel_ev_critico do
  begin
    Application.CreateForm(Tfrm_evento, frm_evento );
    with frm_evento do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_evento.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_evento.Text := frm_evento.Cons_OnLine_Texto;
      msk_cd_eventoExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_ev_critico.btn_imprimirClick(Sender: TObject);
const
  xlWorksheet = -4167;
  xlAutomatic = -4167;
var
  nr_identificador, nLinha, vActiveSheet: integer;
  Excel, xlWorkB, oSheet: OleVariant;
  vTotalProcessosPeriodo : integer;
  vPcRealizadosMeta, vPcRealizadosForaMeta, vPcNaoRealizadosMeta, vPcNaoRealizadosForaMeta : Double;
begin
  if msk_dt_inicio.Date = 0 then
  begin
    BoxMensagem( 'Informe uma data para seleção!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if msk_dt_fim.Date = 0 then
  begin
    BoxMensagem( 'Informe uma data final para seleção!', 2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;

  if ( msk_dt_inicio.Date > msk_dt_fim.Date ) then
  begin
    BoxMensagem( 'Data final deve ser maior ou igual a data inicial!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if ( Trim(msk_cd_evento.Text) = '' ) then
  begin
    BoxMensagem( 'Informe o evento a para a seleção!', 2 );
    msk_cd_evento.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with datm_rel_ev_critico do
  begin
    if vTipoRel = 0 then
    begin
      CloseStoredProc( sp_rel_ev_critico );
      //unidade
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_ev_critico.ParamByName('@cd_unid_neg').AsString := 'X'
      else
        sp_rel_ev_critico.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      //produto
      if Trim( msk_cd_produto.Text ) = '' then
        sp_rel_ev_critico.ParamByName('@cd_produto').AsString  := 'X'
      else
        sp_rel_ev_critico.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
      //grupo
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_ev_critico.ParamByName('@cd_grupo').AsString    := 'X'
      else
        sp_rel_ev_critico.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
      //cliente
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_ev_critico.ParamByName('@cd_cliente').AsString  := 'X'
      else
        sp_rel_ev_critico.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
      //area
      if Trim( msk_cd_area.Text ) = '' then
        sp_rel_ev_critico.ParamByName('@cd_area').AsString     := 'X'
      else
        sp_rel_ev_critico.ParamByName('@cd_area').AsString     := msk_cd_area.Text;
      sp_rel_ev_critico.ParamByName('@cd_evento').AsString     := msk_cd_evento.Text;
      sp_rel_ev_critico.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
      sp_rel_ev_critico.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
      sp_rel_ev_critico.ParamByName('@dt_hoje').AsDate         := dt_server;
      //incluir somente dias uteis
      if chk_dias_uteis.Checked then
        sp_rel_ev_critico.ParamByName('@tp_dias').AsString := '1'
      else
        sp_rel_ev_critico.ParamByName('@tp_dias').AsString := '0';
      ExecStoredProc( sp_rel_ev_critico );
      nr_identificador := sp_rel_ev_critico.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_ev_critico );
    end
    else
    begin
      CloseStoredProc( sp_rel_ev_critico_po );
      //unidade
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_ev_critico_po.ParamByName('@cd_unid_neg').AsString := 'X'
      else
        sp_rel_ev_critico_po.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      //produto
      if Trim( msk_cd_produto.Text ) = '' then
        sp_rel_ev_critico_po.ParamByName('@cd_produto').AsString  := 'X'
      else
        sp_rel_ev_critico_po.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
      //grupo
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_ev_critico_po.ParamByName('@cd_grupo').AsString    := 'X'
      else
        sp_rel_ev_critico_po.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
      //cliente
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_ev_critico_po.ParamByName('@cd_cliente').AsString  := 'X'
      else
        sp_rel_ev_critico_po.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
      //area
      if Trim( msk_cd_area.Text ) = '' then
        sp_rel_ev_critico_po.ParamByName('@cd_area').AsString     := 'X'
      else
        sp_rel_ev_critico_po.ParamByName('@cd_area').AsString     := msk_cd_area.Text;
      sp_rel_ev_critico_po.ParamByName('@cd_evento').AsString     := msk_cd_evento.Text;
      sp_rel_ev_critico_po.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
      sp_rel_ev_critico_po.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
      sp_rel_ev_critico_po.ParamByName('@dt_hoje').AsDate         := dt_server;
      //incluir somente dias uteis
      if chk_dias_uteis.Checked then
        sp_rel_ev_critico_po.ParamByName('@tp_dias').AsString := '1'
      else
        sp_rel_ev_critico_po.ParamByName('@tp_dias').AsString := '0';
      ExecStoredProc( sp_rel_ev_critico_po );
      nr_identificador := sp_rel_ev_critico_po.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_ev_critico_po );
    end;

        qry_group_prazos_.Close;
        qry_group_prazos_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_group_prazos_.Prepare;
        qry_group_prazos_.Open;

        if qry_group_prazos_.IsEmpty then begin
          BoxMensagem('O filtro não trouxe resultados.', 2);
          exit;
        end;

        try
          Excel := CreateOLEObject('Excel.Application');
          xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_EVENTO_CRITICO.XLS' );
          Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_EVENTO_CRITICO_' + Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
        except
          begin
            BoxMensagem('Erro na criação da Planilha.', 2);
            Exit;
          end
        end;

        Excel.WorkBooks[1].Sheets.Add(,,qry_group_prazos_.RecordCount,xlWorkSheet);

        vActiveSheet := 0;
        while not qry_group_prazos_.EOF do
        begin
          vActiveSheet := vActiveSheet + 1;
          oSheet := Excel.WorkBooks[1].Worksheets[vActiveSheet];

          oSheet.PageSetup.RightFooter := 'Página &P de &N';
          oSheet.PageSetup.LeftMargin   := 1;
          oSheet.PageSetup.RightMargin  := 1;
          oSheet.PageSetup.TopMargin    := 0.7;
          oSheet.PageSetup.BottomMargin := 1;
          oSheet.PageSetup.HeaderMargin := 0;
          oSheet.PageSetup.FooterMargin := 2;

          oSheet.Name := 'Prazo de ' + qry_group_prazos_NR_PRAZO.AsString + ' dias';
          // começa a preencher a planilha com processos cujo evento básico tem o prazo do atual registro da qry_group_prazos_

          qry_ev_realizado_.Close;
          qry_ev_realizado_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_ev_realizado_.ParamByName('NR_PRAZO').AsInteger := qry_group_prazos_NR_PRAZO.AsInteger;
          qry_ev_realizado_.Prepare;
          qry_ev_realizado_.Open;

          qry_ev_nao_realiz_ainda_na_meta_.Close;
          qry_ev_nao_realiz_ainda_na_meta_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_ev_nao_realiz_ainda_na_meta_.ParamByName('NR_PRAZO').AsInteger := qry_group_prazos_NR_PRAZO.AsInteger;
          qry_ev_nao_realiz_ainda_na_meta_.Prepare;
          qry_ev_nao_realiz_ainda_na_meta_.Open;

          qry_ev_realiz_fora_meta_.Close;
          qry_ev_realiz_fora_meta_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_ev_realiz_fora_meta_.ParamByName('NR_PRAZO').AsInteger := qry_group_prazos_NR_PRAZO.AsInteger;
          qry_ev_realiz_fora_meta_.Prepare;
          qry_ev_realiz_fora_meta_.Open;

          qry_ev_nao_realiz_fora_meta_.Close;
          qry_ev_nao_realiz_fora_meta_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_ev_nao_realiz_fora_meta_.ParamByName('NR_PRAZO').AsInteger := qry_group_prazos_NR_PRAZO.AsInteger;
          qry_ev_nao_realiz_fora_meta_.Prepare;
          qry_ev_nao_realiz_fora_meta_.Open;

          // calcula % para cada tipo
          vTotalProcessosPeriodo   := qry_ev_nao_realiz_ainda_na_meta_.RecordCount +
                                      qry_ev_nao_realiz_fora_meta_.RecordCount     +
                                      qry_ev_realizado_.RecordCount                +
                                      qry_ev_realiz_fora_meta_.RecordCount;
          vPcRealizadosMeta        := (100 * qry_ev_realizado_.RecordCount)                /vTotalProcessosPeriodo;
          vPcRealizadosForaMeta    := (100 * qry_ev_realiz_fora_meta_.RecordCount)         /vTotalProcessosPeriodo;
          vPcNaoRealizadosMeta     := (100 * qry_ev_nao_realiz_ainda_na_meta_.RecordCount) /vTotalProcessosPeriodo;
          vPcNaoRealizadosForaMeta := (100 * qry_ev_nao_realiz_fora_meta_.RecordCount)     /vTotalProcessosPeriodo;

          // arrumando os tamanhos de colunas e linhas, e outras formatações
          oSheet.Pictures.Insert('C:\DDBroker\figura.bmp').Select;

          oSheet.Columns[01].ColumnWidth   := 20;
          oSheet.Columns[02].ColumnWidth   := 30;
          oSheet.Columns[03].ColumnWidth   := 15;
          oSheet.Columns[04].ColumnWidth   := 15;
          oSheet.Columns[05].ColumnWidth   := 17;

          oSheet.Cells[ 02, 03 ].Font.Bold := True;
          oSheet.Cells[ 02, 03 ].Font.Size := 9;
          oSheet.Cells[ 03, 03 ].Font.Bold := True;
          oSheet.Cells[ 03, 03 ].Font.Size := 9;
          oSheet.Cells[ 04, 03 ].Font.Bold := True;
          oSheet.Cells[ 04, 03 ].Font.Size := 9;
          oSheet.Cells[ 05, 03 ].Font.Bold := True;
          oSheet.Cells[ 05, 03 ].Font.Size := 9;
          oSheet.Cells[ 07, 03 ].Font.Bold := True;
          oSheet.Cells[ 07, 03 ].Font.Size := 9;

          oSheet.Cells[ 02, 03 ].value     := 'Unidade :';
          oSheet.Cells[ 03, 03 ].value     := 'Produto :';
          oSheet.Cells[ 04, 03 ].value     := 'Cliente/Grupo :';
          oSheet.Cells[ 05, 03 ].value     := 'Área :';
          oSheet.Cells[ 06, 03 ].value     := '';
          oSheet.Cells[ 07, 03 ].value     := 'Período :';

          oSheet.Cells[ 11, 01 ].Font.Bold := True;
          oSheet.Cells[ 11, 01 ].Font.Size := 10;
          oSheet.Cells[ 12, 01 ].Font.Bold := True;
          oSheet.Cells[ 12, 01 ].Font.Size := 10;
          oSheet.Cells[ 13, 01 ].Font.Bold := True;
          oSheet.Cells[ 13, 01 ].Font.Size := 10;
          oSheet.Cells[ 15, 01 ].Font.Bold := True;
          oSheet.Cells[ 15, 01 ].Font.Size := 10;
          oSheet.Cells[ 16, 01 ].Font.Bold := True;
          oSheet.Cells[ 16, 01 ].Font.Size := 10;
          oSheet.Cells[ 17, 01 ].Font.Bold := True;
          oSheet.Cells[ 17, 01 ].Font.Size := 10;

          oSheet.Cells[ 12, 01 ].Font.Italic := True;
          oSheet.Cells[ 13, 01 ].Font.Italic := True;
          oSheet.Cells[ 16, 01 ].Font.Italic := True;
          oSheet.Cells[ 17, 01 ].Font.Italic := True;

          oSheet.Cells[ 11, 01 ].value     := 'Quantidade de Processos dentro da Meta :';
          oSheet.Cells[ 12, 01 ].value     := '       Realizados :';
          oSheet.Cells[ 13, 01 ].value     := '       Não Realizados :';
          oSheet.Cells[ 15, 01 ].value     := 'Quantidade de Processos fora da Meta :';
          oSheet.Cells[ 16, 01 ].value     := '       Realizados :';
          oSheet.Cells[ 17, 01 ].value     := '       Não Realizados :';

          //filtros da planilha
          oSheet.Cells[ 02, 04 ].value := edt_nm_unid_neg.Text;
          oSheet.Cells[ 03, 04 ].value := edt_nm_produto.Text;
          if ( edt_nm_grupo.text = '' ) OR ( Trim( edt_nm_grupo.text ) = 'Todos' ) then
          begin
            oSheet.Cells[ 04, 03 ].value := 'Cliente:';
            oSheet.Cells[ 04, 04 ].value := edt_nm_cliente.Text;
          end
          else
          begin
            oSheet.Cells[ 04, 03 ].value := 'Grupo:';
            oSheet.Cells[ 04, 04 ].value := edt_nm_grupo.Text;
          end;
          oSheet.Cells[ 05, 04 ].value := edt_nm_area.Text;
          oSheet.Cells[ 07, 04 ].value := DatetoStr( msk_dt_inicio.date ) + ' à ' + DatetoStr( msk_dt_fim.date );
          oSheet.Cells[ 09, 01 ].Font.Bold   := True;
          oSheet.Cells[ 09, 01 ].Font.Italic := True;
          oSheet.Cells[ 09, 01 ].Font.Size   := 10;
          if qry_group_prazos_NR_PRAZO.AsInteger > 1 then
            oSheet.Cells[ 09, 01 ].value   := 'Evento ' + msk_cd_evento.Text + ': ' + edt_nm_evento.Text + '    -    Prazo de ' + qry_group_prazos_NR_PRAZO.AsString + ' dias'
          else
            oSheet.Cells[ 09, 01 ].value   := 'Evento ' + msk_cd_evento.Text + ': ' + edt_nm_evento.Text + '    -    Prazo de ' + qry_group_prazos_NR_PRAZO.AsString + ' dia';

          oSheet.Cells[ 10, 03 ].Interior.ColorIndex := 35;
          oSheet.Cells[ 10, 04 ].Interior.ColorIndex := 35;
          oSheet.Cells[ 10, 03 ].Font.Bold := True;
          oSheet.Cells[ 10, 03 ].value     := '          Qtde';
          oSheet.Cells[ 10, 04 ].Font.Bold := True;
          oSheet.Cells[ 10, 04 ].value     := '            %';

          oSheet.Cells[ 11, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ 12, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ 13, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ 15, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ 16, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ 17, 03 ].Interior.ColorIndex := 37;

          oSheet.Cells[ 11, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ 12, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ 13, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ 15, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ 16, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ 17, 04 ].Interior.ColorIndex := 36;

          oSheet.Cells[ 11, 03 ].Font.Bold := True;
          oSheet.Cells[ 11, 03 ].value := IntToStr(qry_ev_realizado_.RecordCount + qry_ev_nao_realiz_ainda_na_meta_.RecordCount);
          oSheet.Cells[ 12, 03 ].value := IntToStr(qry_ev_realizado_.RecordCount);
          oSheet.Cells[ 13, 03 ].value := IntToStr(qry_ev_nao_realiz_ainda_na_meta_.RecordCount);

          oSheet.Cells[ 15, 03 ].Font.Bold := True;
          oSheet.Cells[ 15, 03 ].value := IntToStr(qry_ev_realiz_fora_meta_.RecordCount + qry_ev_nao_realiz_fora_meta_.RecordCount);
          oSheet.Cells[ 16, 03 ].value := IntToStr(qry_ev_realiz_fora_meta_.RecordCount);
          oSheet.Cells[ 17, 03 ].value := IntToStr(qry_ev_nao_realiz_fora_meta_.RecordCount);

          oSheet.Cells[ 11, 04 ].Font.Bold := True;
          oSheet.Cells[ 11, 04 ].value := FormatFloat('##0.00',vPcRealizadosMeta+vPcNaoRealizadosMeta);
          oSheet.Cells[ 12, 04 ].value := FormatFloat('##0.00',vPcRealizadosMeta);
          oSheet.Cells[ 13, 04 ].value := FormatFloat('##0.00',vPcNaoRealizadosMeta);

          oSheet.Cells[ 15, 04 ].Font.Bold := True;
          oSheet.Cells[ 15, 04 ].value := FormatFloat('##0.00',vPcRealizadosForaMeta+vPcNaoRealizadosForaMeta);
          oSheet.Cells[ 16, 04 ].value := FormatFloat('##0.00',vPcRealizadosForaMeta);
          oSheet.Cells[ 17, 04 ].value := FormatFloat('##0.00',vPcNaoRealizadosForaMeta);

          oSheet.Cells[ 11, 05 ].Font.Bold := True;
          oSheet.Cells[ 11, 05 ].value     := ' Média Realizados';
          oSheet.Cells[ 12, 05 ].value     := ' ' + FormatFloat('#0.00',(qry_ev_realizado_.RecordCount + qry_ev_realiz_fora_meta_.RecordCount) / 2) + ' proc.';

          oSheet.Cells[ 14, 05 ].Font.Bold := True;
          oSheet.Cells[ 14, 05 ].value     := ' Média Geral';
          oSheet.Cells[ 15, 05 ].value     := ' ' + FormatFloat('#0.00',(qry_ev_nao_realiz_fora_meta_.RecordCount + qry_ev_realizado_.RecordCount + qry_ev_realiz_fora_meta_.RecordCount) / 3) + ' proc.';

          nLinha := 18;

          //insere quantidade de processos não realizados
          nLinha := nLinha + 2;
          oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 01 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 03 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 01 ].Font.Size := 9;
          oSheet.Cells[ nLinha, 01 ].Value := 'Processos Realizados fora da Meta';

          oSheet.Cells[ nLinha, 03 ].Value := qry_ev_realiz_fora_meta_.RecordCount;
          //insere o cabeçalho dos processos não realizados
          nLinha := nLinha + 1;
          oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 01 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 03 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 04 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 05 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 01 ].Value := 'Processos';
          oSheet.Cells[ nLinha, 03 ].Value := 'Data Prevista';
          oSheet.Cells[ nLinha, 04 ].Value := 'Data Realizada';
          oSheet.Cells[ nLinha, 05 ].Value := 'Dias Atraso';
          nLinha := nLinha + 1;

          // Alimenta a planilha com dados dos processos realizados com atraso
          while not qry_ev_realiz_fora_meta_.EOF do
          begin
            nLinha := nLinha + 1;
            oSheet.Cells[ nLinha, 01 ].value := qry_ev_realiz_fora_meta_NR_PROCESSO.AsString;
            oSheet.Cells[ nLinha, 03 ].value := ' ' + DateToStr(qry_ev_realiz_fora_meta_DT_INICIO.AsDateTime);
            oSheet.Cells[ nLinha, 04 ].value := ' ' + DateToStr(qry_ev_realiz_fora_meta_DT_FIM.AsDateTime);
            oSheet.Cells[ nLinha, 05 ].value := IntToStr(qry_ev_realiz_fora_meta_NR_DIAS.AsInteger);
            qry_ev_realiz_fora_meta_.Next;
          end;

          //insere quantidade de processos não realizados
          nLinha := nLinha + 2;
          oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 01 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 03 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 01 ].Font.Size := 9;
          oSheet.Cells[ nLinha, 01 ].Value := 'Processos não Realizados fora da Meta';
          oSheet.Cells[ nLinha, 03 ].Value := qry_ev_nao_realiz_fora_meta_.RecordCount;
          //insere o cabeçalho dos processos não realizados
          nLinha := nLinha + 1;
          oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 01 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 03 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 05 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 01 ].Value := 'Processos';
          oSheet.Cells[ nLinha, 03 ].Value := 'Data Prevista';
          oSheet.Cells[ nLinha, 05 ].Value := 'Dias de Atraso';
          nLinha := nLinha + 1;

          // Alimenta a planilha com dados dos processos não realizados
          while not qry_ev_nao_realiz_fora_meta_.EOF do
          begin
            nLinha := nLinha + 1;
            oSheet.Cells[ nLinha, 01 ].value := qry_ev_nao_realiz_fora_meta_NR_PROCESSO.AsString;
            oSheet.Cells[ nLinha, 03 ].value := ' ' + DateToStr(qry_ev_nao_realiz_fora_meta_DT_INICIO.AsDateTime);
            oSheet.Cells[ nLinha, 05 ].value := IntToStr(qry_ev_nao_realiz_fora_meta_NR_DIAS.AsInteger);
            qry_ev_nao_realiz_fora_meta_.Next;
          end;

          //insere quantidade de processos não realizados
          nLinha := nLinha + 2;
          oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := 37;
          oSheet.Cells[ nLinha, 01 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 03 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 01 ].Font.Size := 9;
          oSheet.Cells[ nLinha, 01 ].Value := 'Processos não Realizados que ainda estão na Meta';
          oSheet.Cells[ nLinha, 03 ].Value := qry_ev_nao_realiz_ainda_na_meta_.RecordCount;
          //insere o cabeçalho dos processos não realizados
          nLinha := nLinha + 1;
          oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := 36;
          oSheet.Cells[ nLinha, 01 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 03 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 05 ].Font.Size := 8;
          oSheet.Cells[ nLinha, 01 ].Value := 'Processos';
          oSheet.Cells[ nLinha, 03 ].Value := 'Data Prevista';
          oSheet.Cells[ nLinha, 05 ].Value := 'Dias Restantes p/ Meta';
          nLinha := nLinha + 1;

          // Alimenta a planilha com dados dos processos não realizados
          while not qry_ev_nao_realiz_ainda_na_meta_.EOF do
          begin
            nLinha := nLinha + 1;
            oSheet.Cells[ nLinha, 01 ].value := qry_ev_nao_realiz_ainda_na_meta_NR_PROCESSO.AsString;
            oSheet.Cells[ nLinha, 03 ].value := ' ' + DateToStr(qry_ev_nao_realiz_ainda_na_meta_DT_INICIO.AsDateTime);
            oSheet.Cells[ nLinha, 05 ].value := IntToStr(Abs(qry_ev_nao_realiz_ainda_na_meta_NR_DIAS.AsInteger));
            qry_ev_nao_realiz_ainda_na_meta_.Next;
          end;

          // proximo prazo, muda-se a TabSheet do Excel, e renomeia.
          qry_group_prazos_.Next;
        end;

        qry_group_prazos_.Close;
        qry_ev_realizado_.Close;
        qry_ev_nao_realiz_ainda_na_meta_.Close;
        qry_ev_realiz_fora_meta_.Close;
        qry_ev_nao_realiz_fora_meta_.Close;

        Screen.Cursor := crDefault;

        //Limpa a tabela auxiliar
        ApagaDados( 'TREL_EV_CRITICO', nr_identificador );

        Excel.Visible := True;

        // Envia msg de sucesso
        ShowMessage('Planilha gerada com sucesso');

        Screen.Cursor := crDefault;
        Application.ProcessMessages;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_rel_ev_critico.msk_cd_grupoChange(Sender: TObject);
begin
  if Trim(msk_cd_grupo.Text) = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;


procedure Tfrm_rel_ev_critico.msk_cd_clienteChange(Sender: TObject);
begin
  if Trim(msk_cd_cliente.Text) = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    msk_cd_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;


end.
