unit PGDI044;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Menus, StdCtrls, ComCtrls, Db, FileText, Grids,
  DBGrids, Mask, DbTables, Funcoes;

type
  Tfrm_DI_saida = class(TForm)
    pnl_file_: TPanel;
    menu_: TMainMenu;
    mi_integrar_: TMenuItem;
    mi_sair_: TMenuItem;
    pnl_integra: TPanel;
    btn_integrar: TSpeedButton;
    speed_sair_: TSpeedButton;
    Speed_file_: TSpeedButton;
    open_file_: TOpenDialog;
    Panel1: TPanel;
    progress_file_: TProgressBar;
    edt_nm_file_: TEdit;
    Label1: TLabel;
    dbgrd_di: TDBGrid;
    Panel2: TPanel;
    lbl_localizar_: TLabel;
    edt_pesquisa: TEdit;
    Panel3: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_periodo: TLabel;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_a: TLabel;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lblProduto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    lblProcesso: TLabel;
    btn_co_processo: TSpeedButton;
    RadioGroup1: TRadioGroup;
    rgTipoIntegracao: TRadioGroup;
    procedure Speed_file_Click(Sender: TObject);
    procedure btn_integrarClick(Sender: TObject);
    procedure speed_sair_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mi_sair_Click(Sender: TObject);
    procedure edt_nm_file_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_integrar_Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_pesquisaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Integra( i, pTipo : Integer );
    procedure DDImport;
    procedure DDImport_Ponto;
    procedure DDImport_FLP;
    procedure DDImport_CUSTO;
  public
    tp_saida : Byte;
    //  1 - Integração DI Padrão / Gip-Lite
    //  2 - Integração DI / Saída DDImport
    //  3 - Integração DDImport - Follow-up
    //  4 - Integração DDImport - Custo
  end;

var
  frm_DI_saida: Tfrm_DI_saida;
  Arquivo  : TFileText;
  cItem    : String[3];
  Stri     : String;
  nr_itens : LongInt;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGDI045, PGGP017, PGSM018, PGSM024, PGSM119, PGSM010,
  PGGP015, ConsOnLineEx;

procedure Tfrm_DI_saida.Speed_file_Click(Sender: TObject);
begin
  if open_file_.Execute then edt_nm_file_.Text := open_file_.FileName;
end;

procedure Tfrm_DI_saida.btn_integrarClick(Sender: TObject);
var nNum: Integer;
    nMax : Real;
    nr_identificador: integer;
begin
  with datm_di_saida do
  begin
    nr_identificador := 0;
    nMax             := 0;

    if Length( edt_nm_file_.Text ) = 0 then
    begin
      edt_nm_file_.SetFocus;
      BoxMensagem( 'O nome do arquivo texto para integração deverá ser informado.', 2 );
      edt_nm_file_.SetFocus;
      Exit;
    end;

    if ( FileExists( Trim( edt_nm_file_.Text ) ) ) then
    begin
      if Not BoxMensagem( 'Arquivo já existente !! Deseja sobrepor o Arquivo ?', 1 ) then
         Exit;
    end;

    if Trim( edt_nm_grupo.Text ) = 'Todos' then
    begin
      edt_nm_produto.Text    := '';
      msk_cd_produto.Text    := '';
      msk_cd_produto.Color   := clMenu;
      msk_cd_produto.Enabled := True;
      btn_co_produto.Enabled := True;

      msk_nr_processo.Text    := '';
      msk_nr_processo.Color   := clMenu;
      msk_nr_processo.Enabled := True;
      btn_co_processo.Enabled := True;
    end;
    Arquivo      := TFileText.Create;
    Arquivo.Name := Trim( edt_nm_file_.Text );
    Arquivo.CreateFile;

    if tp_saida = 2 then
    begin
      try
        datm_main.db_broker.StartTransaction;

        Screen.Cursor := crHourGlass;
        if Trim( msk_cd_unid_neg.Text ) = '' then
          sp_ddimport.ParamByName('@cd_unid_neg').AsString := 'X'
        else
          sp_ddimport.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
        if Trim( msk_cd_grupo.Text ) = '' then
          sp_ddimport.ParamByName('@cd_grupo').AsString    := 'X'
        else
          sp_ddimport.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
        if Trim( msk_cd_cliente.Text ) = '' then
          sp_ddimport.ParamByName('@cd_cliente').AsString  := 'X'
        else
          sp_ddimport.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
        sp_ddimport.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
        sp_ddimport.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
        ExecStoredProc( sp_ddimport );
        nr_identificador := sp_ddimport.ParamByName('@nr_identificador').AsInteger;
        nMax             := sp_ddimport.ParamByName('@tot_ddimport').AsInteger;
        CloseStoredProc( sp_ddimport );
        datm_main.db_broker.Commit;
        Screen.Cursor    := crArrow;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if tp_saida = 3 then
    begin
      try
        datm_main.db_broker.StartTransaction;

        Screen.Cursor := crHourGlass;
        if Trim( msk_cd_unid_neg.Text ) = '' then
          sp_ddimport_flp.ParamByName('@cd_unid_neg').AsString := 'X'
        else
          sp_ddimport_flp.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
        if Trim( msk_cd_grupo.Text ) = '' then
          sp_ddimport_flp.ParamByName('@cd_grupo').AsString    := 'X'
        else
          sp_ddimport_flp.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
        if Trim( msk_cd_cliente.Text ) = '' then
          sp_ddimport_flp.ParamByName('@cd_cliente').AsString  := 'X'
        else
          sp_ddimport_flp.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
        sp_ddimport_flp.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
        sp_ddimport_flp.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
        if Trim( msk_cd_produto.Text ) = '' then
          sp_ddimport_flp.ParamByName('@cd_produto').AsString  := 'X'
        else
          sp_ddimport_flp.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
        if Trim( msk_nr_processo.Text ) = '' then
          sp_ddimport_flp.ParamByName('@nr_processo_flp').AsString  := 'X'
        else
          sp_ddimport_flp.ParamByName('@nr_processo_flp').AsString  := Trim( msk_nr_processo.Text );
        ExecStoredProc( sp_ddimport_flp );
        nr_identificador := sp_ddimport_flp.ParamByName('@nr_identificador').AsInteger;
        nMax             := sp_ddimport_flp.ParamByName('@tot_ddimport').AsInteger;
        CloseStoredProc( sp_ddimport_flp );
        datm_main.db_broker.Commit;
        Screen.Cursor    := crArrow;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    // Saída DDImport Custo
    if tp_saida = 4 then
    begin
      try
        datm_main.db_broker.StartTransaction;
        Screen.Cursor := crHourGlass;
        if Trim( msk_cd_unid_neg.Text ) = '' then
          sp_ddimport_custo.ParamByName('@cd_unid_neg').AsString := 'X'
        else
          sp_ddimport_custo.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
        if Trim( msk_cd_grupo.Text ) = '' then
          sp_ddimport_custo.ParamByName('@cd_grupo').AsString    := 'X'
        else
          sp_ddimport_custo.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
        if Trim( msk_cd_cliente.Text ) = '' then
          sp_ddimport_custo.ParamByName('@cd_cliente').AsString  := 'X'
        else
          sp_ddimport_custo.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
        sp_ddimport_custo.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
        sp_ddimport_custo.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
        if Trim( msk_cd_produto.Text ) = '' then
          sp_ddimport_custo.ParamByName('@cd_produto').AsString  := 'X'
        else
          sp_ddimport_custo.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
        if Trim( msk_nr_processo.Text ) = '' then
          sp_ddimport_custo.ParamByName('@nr_processo_custo').AsString  := 'X'
        else
          sp_ddimport_custo.ParamByName('@nr_processo_custo').AsString  := Trim( msk_nr_processo.Text );
        ExecStoredProc( sp_ddimport_custo );
        nr_identificador := sp_ddimport_custo.ParamByName('@nr_identificador').AsInteger;
        nMax             := sp_ddimport_custo.ParamByName('@tot_ddimport').AsInteger;
        CloseStoredProc( sp_ddimport_custo );
        datm_main.db_broker.Commit;
        Screen.Cursor    := crArrow;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if tp_saida = 1 then
       nMax := dbgrd_di.SelectedRows.Count - 1;

    progress_file_.Max  := Round( nMax ) + 1;
    progress_file_.Step := 1;

    try
      datm_main.db_broker.StartTransaction;

      if tp_saida = 1 then
      begin
        datm_di_saida.qry_di_.DataSource := datm_di_saida.ds_grid_di;

        for nNum := 0 to dbgrd_di.SelectedRows.Count - 1 do
        begin
          Integra( nNum,rgTipoIntegracao.ItemIndex);
          progress_file_.StepIt;
        end;
      end;

      if tp_saida = 2 then
      begin
        qry_ddimport_.Close;
        qry_ddimport_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_ddimport_.Prepare;
        qry_ddimport_.Open;
        if RadioGroup1.ItemIndex = 0 then
        begin
          while Not qry_ddimport_.EOF do
          begin
            DDImport_Ponto;
            progress_file_.StepIt;
            datm_di_saida.qry_ddimport_.Next;
          end;
        end
        else
        begin
          while Not qry_ddimport_.EOF do
          begin
            DDImport;
            progress_file_.StepIt;
            datm_di_saida.qry_ddimport_.Next;
          end;
        end;
      end;

      if tp_saida = 3 then
      begin
        qry_ddimport_flp_.Close;
        qry_ddimport_flp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_ddimport_flp_.Prepare;
        qry_ddimport_flp_.Open;
        while Not qry_ddimport_flp_.EOF do
        begin
          DDImport_FLP;
          progress_file_.StepIt;
          datm_di_saida.qry_ddimport_flp_.Next;
        end;
      end;

      if tp_saida = 4 then
      begin
        qry_ddimport_custo_.Close;
        qry_ddimport_custo_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_ddimport_custo_.Prepare;
        qry_ddimport_custo_.Open;
        while Not qry_ddimport_custo_.EOF do
        begin
          DDImport_CUSTO;
          progress_file_.StepIt;
          datm_di_saida.qry_ddimport_custo_.Next;
        end;
      end;

      datm_main.db_broker.Commit;

      BoxMensagem( 'Integração realizada com sucesso!', 3 );
    except
      on E: Exception do
      begin
        BoxMensagem( 'Falha na Integração!', 2 );
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;

    Arquivo.Close;
    Arquivo.Free;

    if tp_saida = 2 then
    begin
      ApagaDados( 'TDDIMPORT', nr_identificador );
    end;
    if tp_saida = 3 then
    begin
      ApagaDados( 'TDDIMPORT_FLP', nr_identificador );
    end;
    if tp_saida = 4 then
    begin
      //ApagaDados( 'TDDIMPORT_CUSTO', nr_identificador );
    end;

    progress_file_.Position := 0;
  end;
end;

procedure Tfrm_DI_saida.speed_sair_Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DI_saida.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_DI_saida, datm_DI_saida );
end;


procedure Tfrm_DI_saida.mi_sair_Click(Sender: TObject);
begin
  speed_sair_Click(nil);
end;


procedure Tfrm_DI_saida.edt_nm_file_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = edt_nm_file_ then Speed_file_Click(Nil);
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo then btn_co_processoClick(nil);
  end;
end;

procedure Tfrm_DI_saida.mi_integrar_Click(Sender: TObject);
begin
  btn_integrarClick(Nil);
end;

procedure Tfrm_DI_saida.FormShow(Sender: TObject);
begin
  rgTipoIntegracao.Visible := False;

  if tp_saida = 1 then
  begin
    Caption := 'Integração DI Padrão / Gip-Lite';

    datm_di_saida.qry_grid_di_.Close;
    datm_di_saida.qry_grid_di_.Prepare;
    datm_di_saida.qry_grid_di_.Open;

    dbgrd_di.Height := 387;
    Panel3.Visible := False;
    rgTipoIntegracao.Visible := True;
  end;

  if tp_saida = 2 then
  begin
    Caption := 'Integração DI / DDImport';
    Panel2.Visible := False;
    Panel2.TabStop := False;
    Panel3.Top     := 49;
    Panel3.Height  := 336;
    RadioGroup1.Visible := True;

    msk_dt_inicio.Date   := dt_server;
    msk_dt_fim.Date      := dt_server;
    edt_nm_file_.Text    := cDir_Rpt + '\R' + FormatDateTime( 'ddmm', dt_server ) + FormatDateTime( 'hhn', Time ) +  '.TXT';
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_grupo.SetFocus;

    lblProduto.Visible     := False;
    edt_nm_produto.Visible := False;
    msk_cd_produto.Visible := False;
    btn_co_produto.Visible := False;

    lblProcesso.Visible     := False;
    msk_nr_processo.Visible := False;
    btn_co_processo.Visible := False;
  end;

  if ( tp_saida = 3 ) or ( tp_saida = 4 ) then
  begin
    Caption := 'Integração DDImport - Follow-up';
    if tp_saida = 4 then
      Caption := 'Integração DDImport - Custo';

    Panel2.Visible := False;
    Panel2.TabStop := False;
    Panel3.Top     := 49;
    Panel3.Height  := 336;

    msk_dt_inicio.Date   := dt_server;
    msk_dt_fim.Date      := dt_server;
    edt_nm_file_.Text    := cDir_Rpt + '\R' + FormatDateTime( 'ddmm', dt_server ) + FormatDateTime( 'hhnn', Time ) +  '.TXT';
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);

    msk_dt_inicio.TabOrder  := msk_cd_cliente.TabOrder + 1;
    msk_dt_fim.TabOrder     := msk_dt_inicio.TabOrder + 1;

    msk_cd_produto.SetFocus;
  end;
end;

procedure Tfrm_DI_saida.edt_pesquisaChange(Sender: TObject);
begin
  try
    datm_di_saida.qry_grid_di_.Locate('NR_PROCESSO', str_cd_unid_neg + str_cd_produto + edt_pesquisa.text, [loPartialKey, loCaseInsensitive] );
  except
  end;
end;

procedure Tfrm_DI_saida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_di_saida.free;
  Action := caFree;
end;

procedure Tfrm_DI_saida.Integra( i, pTipo : integer );
var
  vAgenteAux, vItemAux, cTexto : String;
  pTexto : Array[0..1024] of Char;
begin
  try
    TQuery(dbgrd_di.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_di.SelectedRows[i]));
    with datm_di_saida do
    begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      qry_di_.Close;
      qry_di_.Prepare;
      qry_di_.Open;
      qry_processo_.Close;
      qry_processo_.Prepare;
      qry_processo_.Open;
      qry_processo_cntr_.Close;
      qry_processo_cntr_.Prepare;
      qry_processo_cntr_.Open;
      qry_ts_fatura_.Close;
      qry_ts_fatura_.Prepare;
      qry_ts_fatura_.Open;
      qry_faturamento_cc_.Close;
      qry_faturamento_cc_.Prepare;
      qry_faturamento_cc_.Open;
      qry_dt_receb_doc_.Close;
      qry_dt_receb_doc_.Prepare;
      qry_dt_receb_doc_.Open;
      qry_dt_desemb_.Close;
      qry_dt_desemb_.Prepare;
      qry_dt_desemb_.Open;
      qry_dt_entrega_merc_.Close;
      qry_dt_entrega_merc_.Prepare;
      qry_dt_entrega_merc_.Open;
      qry_instr_emb_.Close;
      qry_instr_emb_.Prepare;
      qry_instr_emb_.Open;
      qry_itens_numerario_.Close;
      qry_itens_numerario_.Prepare;
      qry_itens_numerario_.Open;
      Application.ProcessMessages;
      // ****************************************************** //
      // * INTEGRAÇÃO DE NUMERÁRIO                            * //
      // ****************************************************** //
      if pTipo = 0 then
      begin
        // "capa"
        cTexto := 'NU';
        cTexto := cTexto + JustificaString( ConsultaLookUpSQL('select top 1 cd_referencia from tref_cliente where nr_processo = ''' + qry_di_NR_PROCESSO.asString + '''','cd_referencia'),15 );
        cTexto := cTexto + JustificaString( ' ',3 );
        cTexto := cTexto + JustificaString( Copy(qry_di_DT_CHEGADA_CARGA.AsString,1,2) + Copy(qry_di_DT_CHEGADA_CARGA.AsString,3,2) + Copy(qry_di_DT_CHEGADA_CARGA.AsString,5,4),8);
        cTexto := cTexto + JustificaString( Copy(qry_dt_receb_doc_DT_REALIZACAO.AsString,1,2) + Copy(qry_dt_receb_doc_DT_REALIZACAO.AsString,4,2) + Copy(qry_dt_receb_doc_DT_REALIZACAO.AsString,7,4),8 );
        cTexto := cTexto + 'IND';
        vAgenteAux := DePara(Copy(qry_di_NR_PROCESSO.AsString,1,2),Copy(qry_di_NR_PROCESSO.AsString,3,2),'15',qry_processo_CD_AGENTE.AsString);
        if vAgenteAux = '' then
          vAgenteAux := 'FOR';
        cTexto := cTexto + JustificaString(vAgenteAux, 3 );
        if qry_di_NR_DCTO_CARGA_MAST.AsString <> '' then
           cTexto := cTexto + JustificaString( qry_di_NR_DCTO_CARGA_MAST.AsString, 18)
        else cTexto := cTexto + JustificaString( qry_di_NR_DCTO_CARGA.AsString,18 );
        cTexto := cTexto + JustificaString( qry_di_CD_TIPO_DECLARACAO.AsString,2 );
        cTexto := cTexto + JustificaString( qry_di_CD_URF_DESPACHO.AsString, 7);
        cTexto := cTexto + JustificaString( qry_di_CD_URF_ENTR_CARGA.AsString, 7);
        cTexto := cTexto + JustificaString( qry_di_CD_RECINTO_ALFAND.AsString, 7);
        cTexto := cTexto + JustificaString( qry_di_CD_MODALIDADE_DESP.AsString, 1);
        cTexto := cTexto + FStrZero( qry_di_CD_TIPO_MANIFESTO.AsString, 2);
        cTexto := cTexto + JustificaString( qry_instr_emb_CD_TIPO_DCTO_INSTR.AsString, 2);
        cTexto := cTexto + JustificaString( qry_di_CD_UTIL_DCTO_CARGA.AsString, 1);
        cTexto := cTexto + JustificaString( qry_di_NR_MANIFESTO.AsString, 15);
        cTexto := cTexto + FormatFloat('0000000000.0000', qry_di_PB_CARGA.AsFloat );
        cTexto := cTexto + JustificaString( qry_ts_fatura_NR_NOTA_FATURA.AsString, 6);
        cTexto := cTexto + JustificaString( Copy( qry_dt_entrega_merc_DT_REALIZACAO.AsString,1,2 ) + Copy( qry_dt_entrega_merc_DT_REALIZACAO.AsString,4,2 ) + Copy( qry_dt_entrega_merc_DT_REALIZACAO.AsString,7,4 ), 8);
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := JustificaString( ' ',250 );
        cTexto := cTexto + #13#10;
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        // "despesas - numerário"
        while not qry_itens_numerario_.EOF do
        begin
          cTexto := 'DN';
          cTexto := cTexto + JustificaString( ConsultaLookUpSQL('select top 1 cd_referencia from tref_cliente where nr_processo = ''' + qry_di_NR_PROCESSO.asString + '''','cd_referencia'),18 );
          cTexto := cTexto + JustificaString( Copy(qry_itens_numerario_DT_SOLICITACAO.AsString,1,2) + Copy(qry_itens_numerario_DT_SOLICITACAO.AsString,4,2) + Copy(qry_itens_numerario_DT_SOLICITACAO.AsString,7,4),8 );
          vItemAux := StringReplace(DePara(Copy(qry_di_NR_PROCESSO.AsString,1,2),Copy(qry_di_NR_PROCESSO.AsString,3,2),'14', qry_itens_numerario_CD_ITEM.AsString),'.','',[rfReplaceAll]);
          if vItemAux = '' then
            vItemAux := '411';
          cTexto := cTexto + JustificaString( vItemAux, 3);
          cTexto := cTexto + FormatFloat('00000000000000.00', qry_itens_numerario_VL_SOLICITADO.AsFloat );
          cTexto := cTexto + JustificaString( qry_itens_numerario_PAGA_POR_QUEM.AsString, 1);
          cTexto := cTexto + JustificaString( qry_itens_numerario_ADIANTAMENTO.AsString, 1);
          cTexto := cTexto + #13#10;
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          qry_itens_numerario_.Next;
        end;
      // ****************************************************** //
      // * INTEGRAÇÃO DE NOTA FISCAL                          * //
      // ****************************************************** //
(*      end else if pTipo = 1 then
      begin
        // abre o banco do interbase
        db_nota.Open;
        // abre as query do interbase
        qryNFCapa.Close;
        qryNFCapa.Params[0].AsString  := qry_di_NR_PROCESSO.AsString;
        qryNFCapa.Open;
        qryNFItens.Close;
        qryNFItens.Params[0].AsString := qry_di_NR_PROCESSO.AsString;
        qryNFItens.Open;
        // "capa"
        cTexto := '1';
        cTexto := cTexto + '01';
        cTexto := cTexto + '01';
        cTexto := cTexto + JustificaString( ' ', 6 ); // OBRIGATÓRIO
        cTexto := cTexto + JustificaString( ' ', 6 ); // filler
        cTexto := cTexto + JustificaString( ' ', 7 );
        cTexto := cTexto + JustificaString( qryNFCapaSTR_CODIGOCFOP.AsString, 6 ); // OBRIGATÓRIO
        cTexto := cTexto + JustificaString( ' ', 5 ); // Nota 2 - Campo em Branco
        cTexto := cTexto + JustificaString( ' ', 14 );
        cTexto := cTexto + JustificaString( ' ', 3 ); // Nota 2 - Campo em Branco
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + JustificaString( qryNFCapaSTR_REFERENCIA.AsString, 17 ); // OBRIGATÓRIO
        cTexto := cTexto + JustificaString( ' ', 2 ); // OBRIGATÓRIO
        cTexto := cTexto + JustificaString( ' ', 6 );
        cTexto := cTexto + JustificaString( ' ', 8 ); // OBRIGATÓRIO
        cTexto := cTexto + JustificaString( ' ', 8 ); //Copy(qryNFCapaDT_DATACHEGADA.AsString,1,2) + Copy(qryNFCapaDT_DATACHEGADA.AsString,3,2) + Copy(qryNFCapaDT_DATACHEGADA.AsString,5,4), 8 );
        cTexto := cTexto + JustificaString( ' ', 6 ); // filler
        cTexto := cTexto + JustificaString( ' ', 8 ); // Copy(qryNFCapaDT_REGISTRODI.AsString,1,2) + Copy(qryNFCapaDT_REGISTRODI.AsString,3,2) + Copy(qryNFCapaDT_REGISTRODI.AsString,5,4), 8 );
        cTexto := cTexto + JustificaString( ' ', 2 ); // filler
        cTexto := cTexto + 'E';
        cTexto := cTexto + 'NFE';
        cTexto := cTexto + JustificaString( ' ', 1 ); // Nota 2 - Campo em Branco
        cTexto := cTexto + JustificaString( ' ', 1 ); // filler
        cTexto := cTexto + 'I';
        cTexto := cTexto + JustificaString( qryNFCapaSTR_REGISTRODI.AsString, 10 );
        cTexto := cTexto + JustificaString( ' ', 3 );
        cTexto := cTexto + JustificaString( ' ', 2 );
        cTexto := cTexto + JustificaString( ' ', 5 ); // Nota 2 - Campo em Branco
        cTexto := cTexto + JustificaString( ' ', 5 ); // Nota 2 - Campo em Branco
        cTexto := cTexto + JustificaString( ' ', 2 );
        cTexto := cTexto + JustificaString( ' ', 1 ); //qryNFCapaSTR_VIATRANSPORTE.AsString, 1 );
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + JustificaString( ' ', 15 ); //FormatFloat('000000000000.00', qryNFCapaF_1.AsFloat );
        cTexto := cTexto + JustificaString( ' ', 15 ); //FormatFloat('000000000000.00', qryNFCapaDBL_VALORICMS.AsFloat );
        cTexto := cTexto + JustificaString( ' ', 15 ); //FormatFloat('000000000000.00', qryNFCapaDBL_BASEICMS.AsFloat );
        cTexto := cTexto + JustificaString( ' ', 4  ); //qryNFCapaSTR_CODIGOIMPORTADOR.AsString, 4 );
        cTexto := cTexto + JustificaString( ' ', 20 ); //qryNFCapaSTR_CODIGOTRANSP.AsString, 20 );
        cTexto := cTexto + JustificaString( ' ', 15 ); //FormatFloat('000000000000.00', qryNFCapaDBL_VALORSEGUROREAIS.AsFloat );
        cTexto := cTexto + JustificaString( ' ', 15 ); //FormatFloat('000000000000.00', qryNFCapaDBL_VALORIPIRECOLHER.AsFloat );
        cTexto := cTexto + FormatFloat('000000000000.00', qryNFCapaDBL_VALORORIGEMMOEDA.AsFloat );
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + FormatFloat('000000000000.00', qryNFCapaDBL_VALORORIGEMMOEDA.AsFloat );
        cTexto := cTexto + JustificaString( ' ', 15 );
        cTexto := cTexto + JustificaString( ' ', 2 ); // filler
        cTexto := cTexto + JustificaString( ' ', 4 ); //JustificaString( qryNFCapaSTR_CODIGOEXPORTADOR.AsString, 4 );
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + JustificaString( ' ', 60 );
        cTexto := cTexto + JustificaString( ' ', 17 );
        cTexto := cTexto + #13#10;
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        // *itens*
        while not qryNFItens.EOF do
        begin
          cTexto := '2';
          cTexto := cTexto + '01';
          cTexto := cTexto + '01';
          cTexto := cTexto + JustificaString( ' ', 6 ); // OBRIGATÓRIO
          cTexto := cTexto + JustificaString( ' ', 6 );
          cTexto := cTexto + JustificaString( ' ', 10 ); // OBRIGATÓRIO
          cTexto := cTexto + JustificaString( qryNFItensSTR_CODIGOPRODUTO.AsString, 20 ); // OBRIGATÓRIO
          cTexto := cTexto + JustificaString( ' ', 1 ); // Nota 2 - Campo em Branco
          cTexto := cTexto + JustificaString( ' ', 1 ); // Nota 2 - Campo em Branco
          cTexto := cTexto + JustificaString( ' ', 2 ); // JustificaString( qryNFItensSTR_NUMEROITEM.AsString, 2 );
          cTexto := cTexto + FormatFloat('000000.0000', qryNFItensDBL_QUANTIDADE.AsFloat );
          cTexto := cTexto + JustificaString( ' ', 3 ); // JustificaString( qryNFItensSTR_UNIDADEMEDIDA.AsString, 3 );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORIPIRECOLHER.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORORIGEMREAIS.AsFloat );
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          cTexto := cTexto + 'I';
          cTexto := cTexto + JustificaString( ' ', 11 ); // Nota 2 - Campo em Branco
          cTexto := cTexto + JustificaString( qryNFItensMEM_DESCRICAOPRODUTO.AsString, 150 );
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORFOBREAIS.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORFRETEREAIS.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORSEGUROREAIS.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORIIRECOLHER.AsFloat );
          cTexto := cTexto + FormatFloat('00.00', qryNFItensDBL_ALIQUOTAPERCREDUIPI.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_DESPESASMOEDA.AsFloat );
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          cTexto := cTexto + JustificaString( qryNFItensSTR_REFERENCIA.AsString, 17 );
          cTexto := cTexto + JustificaString( qryNFItensSTR_EXNCM.AsString, 3 );
          cTexto := cTexto + JustificaString( qryNFItensSTR_NUMEROFATURA.AsString, 15 );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORICMS.AsFloat );
          cTexto := cTexto + FormatFloat('000000.0000', qryNFItensDBL_PESOLIQUIDO.AsFloat );
          cTexto := cTexto + JustificaString( ConsultaLookupSQL('SELECT NR_ITEM_PO FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = ''' + qry_di_NR_PROCESSO.AsString + ''' AND NR_ADICAO = ''' + qryNFItensSTR_NUMEROADICAO.AsString + ''' AND NR_ITEM = ''' + qryNFItensSTR_NUMEROITEM.AsString + '''','NR_ITEM_PO'), 4 ); // OBRIGATÓRIO
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          cTexto := cTexto + FormatFloat('00.00', qryNFItensDBL_ALIQUOTANORMALII.AsFloat );
          cTexto := cTexto + JustificaString( qryNFItensSTR_NUMEROPEDIDO.AsString, 17 );
          cTexto := cTexto + JustificaString( ConsultaLookupSQL('SELECT NR_LI FROM TPROCESSO_LI (NOLOCK) WHERE NR_PROCESSO=''' + qry_di_NR_PROCESSO.AsString + '''','NR_LI'), 10 ); // OBRIGATÓRIO - LI
          cTexto := cTexto + JustificaString( ' ', 3 );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_BASENORMALICMS.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORFOBMOEDA.AsFloat );
          cTexto := cTexto + FormatFloat('000.00', qryNFItensDBL_ALIQUOTAPISPASEP.AsFloat );
          cTexto := cTexto + JustificaString( ' ', 9 );
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_BASECALCULOPISPASEPCOFINS.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORPISPASEPARECOLHER.AsFloat );
          cTexto := cTexto + FormatFloat('000.00', qryNFItensDBL_ALIQUOTACOFINS.AsFloat );
          cTexto := cTexto + JustificaString( ' ', 9 );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_BASECALCULOPISPASEPCOFINS.AsFloat );
          cTexto := cTexto + FormatFloat('000000000000.00', qryNFItensDBL_VALORCOFINSARECOLHER.AsFloat );
          cTexto := cTexto + #13#10;
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          qryNFItens.Next;
        end;
        // fecha o banco do interbase
        db_nota.Close; *)
      // ****************************************************** //
      // * INTEGRAÇÃO DE DI                                   * //
      // ****************************************************** //
      end else if pTipo = 1 then
      begin
        cTexto := 'DI';
        cTexto := cTexto + JustificaString( qry_di_NR_DCTO_CARGA.AsString, 18 );
        cTexto := cTexto + JustificaString( Copy(qry_di_DT_CHEGADA_CARGA.AsString,1,2) + Copy(qry_di_DT_CHEGADA_CARGA.AsString,3,2) + Copy(qry_di_DT_CHEGADA_CARGA.AsString,5,4),8);
        cTexto := cTexto + JustificaString( Copy(qry_dt_receb_doc_DT_REALIZACAO.AsString,1,2) + Copy(qry_dt_receb_doc_DT_REALIZACAO.AsString,4,2) + Copy(qry_dt_receb_doc_DT_REALIZACAO.AsString,7,4),8 );
        cTexto := cTexto + 'IND';
        vAgenteAux := DePara(Copy(qry_di_NR_PROCESSO.AsString,1,2),Copy(qry_di_NR_PROCESSO.AsString,3,2),'15',qry_processo_CD_AGENTE.AsString);
        if vAgenteAux = '' then
          cTexto := cTexto + JustificaString('FOR', 3 )
        else cTexto := cTexto + JustificaString(vAgenteAux, 3 );
        cTexto := cTexto + JustificaString( Copy(qry_di_DT_REGISTRO_DI.AsString,1,2) + Copy(qry_di_DT_REGISTRO_DI.AsString,3,2) + Copy(qry_di_DT_REGISTRO_DI.AsString,5,4),8 );
        cTexto := cTexto + JustificaString( qry_di_NR_DECLARACAO_IMP.AsString,10 );
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + FormatFloat('000000.00000000', qry_di_TX_MLE.AsFloat );
        cTexto := cTexto + JustificaString( Copy(qry_dt_desemb_DT_REALIZACAO.AsString,1,2) + Copy(qry_dt_desemb_DT_REALIZACAO.AsString,4,2) + Copy(qry_dt_desemb_DT_REALIZACAO.AsString,7,4), 8);
        cTexto := cTexto + JustificaString( qry_processo_CD_MOEDA_FRETE.AsString, 3 );
        cTexto := cTexto + FormatFloat('000000000000.00', qry_di_VL_TOT_FRT_PREPAID.AsFloat + qry_di_VL_TOT_FRT_COLLECT.AsFloat - qry_di_VL_FRETE_TNAC_MNEG.AsFloat);
        cTexto := cTexto + FormatFloat('000000.00000000', qry_di_TX_FRETE.AsFloat );
        cTexto := cTexto + FormatFloat('000000000000.00', qry_di_VL_TOT_SEGURO_MNEG.AsFloat );
        cTexto := cTexto + JustificaString( qry_di_CD_MOEDA_SEGURO.AsString, 3 );
        cTexto := cTexto + FormatFloat('000000.00000000', qry_di_TX_SEGURO.AsFloat );
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := FormatFloat('000000.00000000', qry_di_TX_DOLAR.AsFloat );
        // referencia do cliente
        cTexto := cTexto + JustificaString( ConsultaLookUpSQL('select top 1 cd_referencia from tref_cliente where nr_processo = ''' + qry_di_NR_PROCESSO.asString + '''','cd_referencia'),15 );
        if qry_di_NR_DCTO_CARGA_MAST.AsString <> '' then
          cTexto := cTexto + JustificaString( qry_di_NR_DCTO_CARGA_MAST.AsString, 18)
        else cTexto := cTexto + JustificaString( qry_di_NR_DCTO_CARGA.AsString,18 );
        cTexto := cTexto + JustificaString( qry_di_CD_TIPO_DECLARACAO.AsString,2 );
        cTexto := cTexto + JustificaString( qry_di_CD_URF_DESPACHO.AsString, 7);
        cTexto := cTexto + JustificaString( qry_di_CD_URF_ENTR_CARGA.AsString, 7);
        cTexto := cTexto + JustificaString( qry_di_CD_RECINTO_ALFAND.AsString, 7);
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := JustificaString( qry_di_CD_MODALIDADE_DESP.AsString, 1);
        cTexto := cTexto + FStrZero( qry_di_CD_TIPO_MANIFESTO.AsString, 2);
        cTexto := cTexto + JustificaString( qry_instr_emb_CD_TIPO_DCTO_INSTR.AsString, 2);
        cTexto := cTexto + JustificaString( qry_di_CD_UTIL_DCTO_CARGA.AsString, 1);
        cTexto := cTexto + JustificaString( qry_di_NR_MANIFESTO.AsString, 15);
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + FormatFloat('0000000000.0000', qry_di_PB_CARGA.AsFloat );
        cTexto := cTexto + FormatFloat('000000000000.00', qry_di_VL_TOT_MLE_MNEG.AsFloat - qry_di_VL_TOT_DESPS_MNEG.AsFloat );
        cTexto := cTexto + JustificaString( qry_ts_fatura_NR_NOTA_FATURA.AsString, 6);
        cTexto := cTexto + JustificaString( qry_processo_nf_NR_NOTA.AsString, 20 );
        cTexto := cTexto + JustificaString( Copy( qry_processo_nf_DT_NOTA.AsString,1,2 ) + Copy( qry_processo_nf_DT_NOTA.AsString,4,2 ) + Copy( qry_processo_nf_DT_NOTA.AsString,7,4 ), 8);
        cTexto := cTexto + FormatFloat('000000000000.00', qry_processo_nf_VL_NOTA.AsFloat );
        cTexto := cTexto + JustificaString( Copy( qry_dt_entrega_merc_DT_REALIZACAO.AsString,1,2 ) + Copy( qry_dt_entrega_merc_DT_REALIZACAO.AsString,4,2 ) + Copy( qry_dt_entrega_merc_DT_REALIZACAO.AsString,7,4 ), 8);
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + JustificaString( Copy( qry_di_DT_REGISTRO_DI.AsString,1,2 ) + Copy( qry_di_DT_REGISTRO_DI.AsString,3,2 ) + Copy( qry_di_DT_REGISTRO_DI.AsString,5,4 ), 8);
        cTexto := cTexto + FormatFloat('000000000000.00', qry_di_VL_TOT_FRT_COLLECT.AsFloat );
        cTexto := cTexto + FormatFloat('000000000000.00', qry_di_VL_FRETE_TNAC_MNEG.AsFloat );
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + JustificaString( '', 250 );
        case StrToIntDef(qry_processo_CD_CANAL.AsString,5) of
          0 : cTexto := cTexto + '1';
          1 : cTexto := cTexto + '2';
          2 : cTexto := cTexto + '3';
          3 : cTexto := cTexto + '4';
        end;
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := ConsultaLookUpSQL('SELECT DT_REALIZACAO FROM TFOLLOWUP WHERE NR_PROCESSO = ''' + qry_di_NR_PROCESSO.asString + ''' AND CD_EVENTO = ''141''','DT_REALIZACAO');
        cTexto := cTexto + JustificaString( Copy( cTexto,1,2 ) + Copy( cTexto,4,2 ) + Copy( cTexto,7,4 ), 8);
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        cTexto := cTexto + #13#10;
        StrPCopy( pTexto, cTexto );
        Arquivo.Write( pTexto );
        cTexto := '';
        while not qry_faturamento_cc_.EOF do
        begin
          cTexto := 'DE';
          if tp_saida = 2 then
            cTexto := cTexto + JustificaString( qry_faturamento_cc_NR_PROCESSO.AsString, 18 )
          else cTexto := cTexto + JustificaString( qry_di_NR_DCTO_CARGA.AsString,18 );
          cTexto := cTexto + JustificaString( Copy( qry_faturamento_cc_DT_LANCAMENTO.AsString,1,2 ) + Copy( qry_faturamento_cc_DT_LANCAMENTO.AsString,4,2 ) + Copy( qry_faturamento_cc_DT_LANCAMENTO.AsString,7,4 ), 8);
          vItemAux := StringReplace(DePara(Copy(qry_faturamento_cc_NR_PROCESSO.AsString,1,2),Copy(qry_faturamento_cc_NR_PROCESSO.AsString,3,2),'14',qry_faturamento_cc_CD_ITEM.AsString),'.','',[rfReplaceAll]);
          if vItemAux = '' then
            vItemAux := '411';
          cTexto := cTexto + JustificaString( vItemAux, 3);
          cTexto := cTexto + FormatFloat('00000000000000.00', qry_faturamento_cc_VL_ITEM.AsFloat );
          cTexto := cTexto + '2';
          if qry_faturamento_cc_IN_NAO_FAT.AsString = '*' then
            cTexto := cTexto + '2'
          else cTexto := cTexto + '1';
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          cTexto := Space( 178 );
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          cTexto := Space( 100 ) + #13#10;
          StrPCopy( pTexto, cTexto );
          Arquivo.Write( pTexto );
          cTexto := '';
          qry_faturamento_cc_.Next;
        end;
      end;
    end;
  finally
    Screen.Cursor := crArrow;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_DI_saida.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_DI_saida do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_DI_saida.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_DI_saida do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
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

procedure Tfrm_DI_saida.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_grupo );
  with datm_DI_saida.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Grupo de Clientes não encontrado!', 2 );
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_DI_saida.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
    if ( tp_saida = 3 ) or ( tp_saida = 4 ) then
    begin
      msk_cd_produto.Color   := clWindow;
      msk_cd_produto.Enabled := True;
      msk_cd_produto.TabStop := True;
      btn_co_produto.Enabled := True;

      msk_nr_processo.Color   := clWindow;
      msk_nr_processo.Enabled := True;
      msk_nr_processo.TabStop := True;
      btn_co_processo.Enabled := True;
    end;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
    if ( tp_saida = 3 ) or ( tp_saida = 4 ) then
    begin
      edt_nm_produto.Text    := '';
      msk_cd_produto.Color   := clMenu;
      msk_cd_produto.Enabled := False;
      msk_cd_produto.TabStop := False;
      btn_co_produto.Enabled := False;

      msk_nr_processo.Color   := clMenu;
      msk_nr_processo.Enabled := False;
      msk_nr_processo.TabStop := False;
      btn_co_processo.Enabled := False;
    end;
  end;
end;

procedure Tfrm_DI_saida.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
    if ( tp_saida = 3 ) or ( tp_saida = 4 ) then
    begin
      msk_cd_produto.Color   := clWindow;
      msk_cd_produto.Enabled := True;
      msk_cd_produto.TabStop := True;
      btn_co_produto.Enabled := True;

      msk_nr_processo.Color   := clWindow;
      msk_nr_processo.Enabled := True;
      msk_nr_processo.TabStop := True;
      btn_co_processo.Enabled := True;
    end;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
    if ( tp_saida = 3 ) or ( tp_saida = 4 ) then
    begin
      edt_nm_produto.Text    := '';
      msk_cd_produto.Color   := clMenu;
      msk_cd_produto.Enabled := False;
      msk_cd_produto.TabStop := False;
      btn_co_produto.Enabled := False;

      msk_nr_processo.Color   := clMenu;
      msk_nr_processo.Enabled := False;
      msk_nr_processo.TabStop := False;
      btn_co_processo.Enabled := False;
    end;
  end;
end;

procedure Tfrm_DI_saida.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_cliente );
  with datm_DI_saida.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else
    begin
      edt_nm_cliente.Text:= FieldByName('NM_EMPRESA').AsString
    end;
    Close;
  end;
end;

procedure Tfrm_DI_saida.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_grupo.Cons_OnLine_Texto <> '' then msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
end;

procedure Tfrm_DI_saida.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_cliente, frm_cliente );
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_DI_saida.DDImport;
var cTexto : String;
    pTexto : Array[0..1024] of Char;
begin
  with datm_di_saida do
  begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;

    qry_faturamento_cc_.Close;
    qry_faturamento_cc_.Prepare;
    qry_faturamento_cc_.Open;

    Application.ProcessMessages;

    // Tipo de Registro
    cTexto := qry_ddimport_.FieldByName('TP_REGISTRO').AsString;
    // Embarque/PO
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_PO').AsString, 18 );
    // Dt. De Chegada
    if qry_ddimport_.FieldByName('DT_CHEGADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_CHEGADA').AsDateTime );
    // Dt. De Recebimento de Documentos
    if qry_ddimport_.FieldByName('DT_RECEB_DOC').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_RECEB_DOC').AsDateTime );
    // Código do Despachante
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_DESPACHANTE').AsString, 3 );
    // Código do Agente
    cTexto := cTexto + JustificaString( Copy( qry_ddimport_.FieldByName('CD_AGENTE').AsString, 2, 3 ), 3 );
    // Dt. Pagamento dos Impostos
    if qry_ddimport_.FieldByName('DT_PAG_IMP').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PAG_IMP').AsDateTime );
    // Nº Registro da DI
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_DI').AsString, 10 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';
    // Taxa MLE
    cTexto := cTexto + FormataFloat( '000000.00000000', qry_ddimport_.FieldByName('TX_MLE').AsFloat );
    // Dt. Desembaraço
    if qry_ddimport_.FieldByName('DT_DESEMB').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_DESEMB').AsDateTime );
    // Moeda do Frete
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_MOEDA_FRETE').AsString, 3 );
    // Valor do Frete na Moeda
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_FRETE_MNEG').AsFloat );
    // Taxa Frete
    cTexto := cTexto + FormataFloat( '000000.00000000', qry_ddimport_.FieldByName('TX_FRETE').AsFloat );
    // Valor do Seguro na Moeda
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_SEGURO_MNEG').AsFloat );
    // Moeda do Seguro
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_MOEDA_SEGURO').AsString, 3 );
    // Taxa Seguro
    cTexto := cTexto + FormataFloat('000000.00000000', qry_ddimport_.FieldByName('TX_SEGURO').AsFloat );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Taxa Dólar
    cTexto := FormataFloat('000000.00000000', qry_ddimport_.FieldByName('TX_DOLAR').AsFloat );
    // Ref. do Despachante
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_PROCESSO').AsString, 15 );
    // Nº do Master
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_CONHECIMENTO_MASTER').AsString, 18 );
    // Tipo de Declaração
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_TIPO_DECLARACAO').AsString, 2 );
    // URF Despacho
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_URF_DESPACHO').AsString, 7 );
    // URF Entrada
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_URF_ENTRADA').AsString, 7 );
    // Recinto Alfandegado
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_RECINTO_ALFANDEGADO').AsString, 7 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Modalidade de Despacho
    cTexto := JustificaString( qry_ddimport_.FieldByName('CD_MODALIDADE_DESP').AsString, 1 );
    // Tipo de Manifesto
    cTexto := cTexto + FStrZero( qry_ddimport_.FieldByName('CD_TIPO_MANIFESTO').AsString, 2 );
    // Tipo do Documento de Carga
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_TIPO_DCTO_CARGA').AsString, 2 );
    // Utilização
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_UTIL_DCTO_CARGA').AsString, 1 );
    // Nº Manifesto
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_MANIFESTO').AsString, 15 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Peso Bruto
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_PESO_BRUTO').AsFloat );
    // Valor FOB na Moeda
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_MLE_MN').AsFloat );
    // Nº da Fatura de Serviço
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_NF').AsString, 6 );
    // Nº da Nota Fiscal de Entrada
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_NF_ENT').AsString, 20 );
    // Dt. Nota Fiscal de Entrada
    if qry_ddimport_.FieldByName('DT_NF_ENTRADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_NF_ENTRADA').AsDateTime );
    // Valor Total da Nota Fiscal de Entrada
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_NF_ENT').AsFloat );
    // Dt. Entrega da Mercadoria
    if qry_ddimport_.FieldByName('DT_ENTREGA_MERC').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_ENTREGA_MERC').AsDateTime );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Nº do House
    cTexto := JustificaString( qry_ddimport_.FieldByName('NR_CONHECIMENTO').AsString, 18 );
    // Data de Registro da DI
    if qry_ddimport_.FieldByName('DT_REG_DI').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_REG_DI').AsDateTime );
    // Data da Fatura de Serviço
    if qry_ddimport_.FieldByName('DT_FATURA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_FATURA').AsDateTime );
    // Valor da Fatura de Serviço
    cTexto := cTexto + FormataFloat('000000000000.00', qry_ddimport_.FieldByName('VL_FATURA').AsFloat );
    // Data Pagamento Fatura Serviço
    if qry_ddimport_.FieldByName('DT_PAGTO_FATURA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PAGTO_FATURA').AsDateTime );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';
    // Quantidade de Container 20
    cTexto := StrZero( qry_ddimport_.FieldByName('QT_CNTR_20').AsInteger, 3 );
    // Quantidade de Container 40
    cTexto := cTexto + StrZero( qry_ddimport_.FieldByName('QT_CNTR_40').AsInteger, 3 );
    // Quantidade de Container Tanque
    cTexto := cTexto + StrZero( qry_ddimport_.FieldByName('QT_CNTR_TANK').AsInteger, 3 );
    // Data de Embarque
    if qry_ddimport_.FieldByName('DT_EMBARQUE').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_EMBARQUE').AsDateTime );
    // Data de Previsão de Chegada
    if qry_ddimport_.FieldByName('DT_PREV_CHEGADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PREV_CHEGADA').AsDateTime );
    // Data de Previsão de Entrega
    if qry_ddimport_.FieldByName('DT_PREV_ENTREGA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PREV_ENTREGA').AsDateTime );
    // Canal do Desembaraço
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_CANAL').AsString, 1 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';
    // Total Mercadoria DI US$
    cTexto := FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_MLE_DOLAR').AsFloat );
    // Total Frete DI US$
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_FRETE_DOLAR').AsFloat );
    // Total Seguro DI US$
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_SEGURO_DOLAR').AsFloat );
    // Total da DI US$
    cTexto := cTexto + FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_CIF_DOLAR').AsFloat );
    cTexto := cTexto + #13#10;
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    qry_ddimport_desp_.Close;
    qry_ddimport_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := qry_ddimport_.FieldByName('NR_IDENTIFICADOR').AsInteger;
    qry_ddimport_desp_.ParamByName('NR_PROCESSO').AsString       := qry_ddimport_.FieldByName('NR_PROCESSO').AsString;
    qry_ddimport_desp_.Prepare;
    qry_ddimport_desp_.Open;
    while Not qry_ddimport_desp_.EOF do
    begin
      // Tipo de Registro
      cTexto := qry_ddimport_desp_.FieldByName('TP_REGISTRO').AsString;
      // Embarque/PO
      cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_PO').AsString, 18 );
      // Dt. do Pagamento
      if qry_ddimport_desp_.FieldByName('DT_PAGAMENTO').IsNull then
        cTexto := cTexto + '00000000'
      else
        cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_desp_.FieldByName('DT_PAGAMENTO').AsDateTime );
      // Código da Despesa
      cTexto := cTexto + JustificaString( qry_ddimport_desp_.FieldByName('CD_ITEM').AsString, 3 );
      // Valor da Despesa
      if qry_ddimport_desp_.FieldByName('VL_ITEM').AsFloat > 0 then
        cTexto := cTexto + FormataFloat('00000000000000.00', qry_ddimport_desp_.FieldByName('VL_ITEM').AsFloat )
      else
        cTexto := cTexto + FormataFloat('0000000000000.00', qry_ddimport_desp_.FieldByName('VL_ITEM').AsFloat );
      // Flag Previsto / Efetivo
      cTexto := cTexto + '2';
      // Flag Importador / Despachante
      cTexto := cTexto + qry_ddimport_desp_.FieldByName('IN_RESP').AsString;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';
      // Filler
      cTexto := Space( 177 );
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';

      cTexto := Space( 100 ) + #13#10;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';

      qry_ddimport_desp_.Next;
    end;
    qry_ddimport_desp_.Close;

    Screen.Cursor := crArrow;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_DI_saida.DDImport_Ponto;
var cTexto : String;
    pTexto : Array[0..1024] of Char;
begin
  with datm_di_saida do
  begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;

    qry_faturamento_cc_.Close;
    qry_faturamento_cc_.Prepare;
    qry_faturamento_cc_.Open;

    Application.ProcessMessages;

    // Tipo de Registro
    cTexto := qry_ddimport_.FieldByName('TP_REGISTRO').AsString;
    // Embarque/PO
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_PO').AsString, 18 );
    // Dt. De Chegada
    if qry_ddimport_.FieldByName('DT_CHEGADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_CHEGADA').AsDateTime );
    // Dt. De Recebimento de Documentos
    if qry_ddimport_.FieldByName('DT_RECEB_DOC').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_RECEB_DOC').AsDateTime );
    // Código do Despachante
    //cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_DESPACHANTE').AsString, 3 );
    cTexto := cTexto + '014';
    // Código do Agente
    cTexto := cTexto + JustificaString( Copy( qry_ddimport_.FieldByName('CD_AGENTE').AsString, 2, 3 ), 3 );
    // Dt. Pagamento dos Impostos
    if qry_ddimport_.FieldByName('DT_PAG_IMP').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PAG_IMP').AsDateTime );
    // Nº Registro da DI
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_DI').AsString, 10 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';
    // Taxa MLE
    if qry_ddimport_.FieldByName('TX_MLE').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000.00000000', qry_ddimport_.FieldByName('TX_MLE').AsFloat ), 1, 6 ) + '.' + Copy( FormataFloat( '000000.00000000', qry_ddimport_.FieldByName('TX_MLE').AsFloat ), 8, 8 )
    else
      cTexto := cTexto + '000000.00000000';
    // Dt. Desembaraço
    if qry_ddimport_.FieldByName('DT_DESEMB').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_DESEMB').AsDateTime );
    // Moeda do Frete
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_MOEDA_FRETE').AsString, 3 );
    // Valor do Frete na Moeda
    if qry_ddimport_.FieldByName('VL_FRETE_MNEG').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_FRETE_MNEG').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_FRETE_MNEG').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    // Taxa Frete
    if qry_ddimport_.FieldByName('TX_FRETE').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000.00000000', qry_ddimport_.FieldByName('TX_FRETE').AsFloat ), 1, 6 ) + '.' + Copy( FormataFloat( '000000.00000000', qry_ddimport_.FieldByName('TX_FRETE').AsFloat ), 8, 8 )
    else
      cTexto := cTexto + '000000.00000000';
    // Seguro inibido em 27/03/2006
    // Valor do Seguro na Moeda
    if qry_ddimport_.FieldByName('VL_SEGURO_MNEG').AsFloat > 0 then
      //cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_SEGURO_MNEG').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_SEGURO_MNEG').AsFloat ), 14, 2 )
      cTexto := cTexto + '               '
    else
      //cTexto := cTexto + '000000000000.00';
      cTexto := cTexto + '               ';
    // Moeda do Seguro
    //cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_MOEDA_SEGURO').AsString, 3 );
    cTexto := cTexto + '   ';
    // Taxa Seguro
    if qry_ddimport_.FieldByName('TX_SEGURO').AsFloat > 0 then
      //cTexto := cTexto + Copy( FormataFloat('000000.00000000', qry_ddimport_.FieldByName('TX_SEGURO').AsFloat ), 1, 6 ) + '.' + Copy( FormataFloat('000000.00000000', qry_ddimport_.FieldByName('TX_SEGURO').AsFloat ), 8, 8 )
      cTexto := cTexto + '               '
    else
      //cTexto := cTexto + '000000.00000000';
      cTexto := cTexto + '               ';
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Taxa Dólar
    if qry_ddimport_.FieldByName('TX_DOLAR').AsFloat > 0 then
      cTexto := Copy( FormataFloat('000000.00000000', qry_ddimport_.FieldByName('TX_DOLAR').AsFloat ), 1, 6 ) + '.' + Copy( FormataFloat('000000.00000000', qry_ddimport_.FieldByName('TX_DOLAR').AsFloat ), 8, 8 )
    else
      cTexto := '000000.00000000';
    // Ref. do Despachante
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_PROCESSO').AsString, 15 );
    // Nº do Master
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_CONHECIMENTO_MASTER').AsString, 18 );
    // Tipo de Declaração
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_TIPO_DECLARACAO').AsString, 2 );
    // URF Despacho
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_URF_DESPACHO').AsString, 7 );
    // URF Entrada
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_URF_ENTRADA').AsString, 7 );
    // Recinto Alfandegado
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_RECINTO_ALFANDEGADO').AsString, 7 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Modalidade de Despacho
    cTexto := JustificaString( qry_ddimport_.FieldByName('CD_MODALIDADE_DESP').AsString, 1 );
    // Tipo de Manifesto
    cTexto := cTexto + FStrZero( qry_ddimport_.FieldByName('CD_TIPO_MANIFESTO').AsString, 2 );
    // Tipo do Documento de Carga
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_TIPO_DCTO_CARGA').AsString, 2 );
    // Utilização
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_UTIL_DCTO_CARGA').AsString, 1 );
    // Nº Manifesto
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_MANIFESTO').AsString, 15 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Peso Bruto
    if qry_ddimport_.FieldByName('VL_PESO_BRUTO').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_PESO_BRUTO').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_PESO_BRUTO').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    // Valor FOB na Moeda
    if qry_ddimport_.FieldByName('VL_MLE_MN').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_MLE_MN').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_MLE_MN').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    // Nº da Fatura de Serviço
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_NF').AsString, 6 );
    // Nº da Nota Fiscal de Entrada
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_NF_ENT').AsString, 20 );
    // Dt. Nota Fiscal de Entrada
    if qry_ddimport_.FieldByName('DT_NF_ENTRADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_NF_ENTRADA').AsDateTime );
    // Valor Total da Nota Fiscal de Entrada
    if qry_ddimport_.FieldByName('VL_NF_ENT').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_NF_ENT').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_NF_ENT').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    // Dt. Entrega da Mercadoria
    if qry_ddimport_.FieldByName('DT_ENTREGA_MERC').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_ENTREGA_MERC').AsDateTime );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    // Nº do House
    cTexto := JustificaString( qry_ddimport_.FieldByName('NR_CONHECIMENTO').AsString, 18 );
    // Data de Registro da DI
    if qry_ddimport_.FieldByName('DT_REG_DI').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_REG_DI').AsDateTime );
    // Data da Fatura de Serviço
    if qry_ddimport_.FieldByName('DT_FATURA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_FATURA').AsDateTime );
    // Valor da Fatura de Serviço
    if qry_ddimport_.FieldByName('VL_FATURA').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat('000000000000.00', qry_ddimport_.FieldByName('VL_FATURA').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat('000000000000.00', qry_ddimport_.FieldByName('VL_FATURA').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    // Data Pagamento Fatura Serviço
    if qry_ddimport_.FieldByName('DT_PAGTO_FATURA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PAGTO_FATURA').AsDateTime );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';
    // Quantidade de Container 20
    cTexto := StrZero( qry_ddimport_.FieldByName('QT_CNTR_20').AsInteger, 3 );
    // Quantidade de Container 40
    cTexto := cTexto + StrZero( qry_ddimport_.FieldByName('QT_CNTR_40').AsInteger, 3 );
    // Quantidade de Container Tanque
    cTexto := cTexto + StrZero( qry_ddimport_.FieldByName('QT_CNTR_TANK').AsInteger, 3 );
    // Data de Embarque
    if qry_ddimport_.FieldByName('DT_EMBARQUE').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_EMBARQUE').AsDateTime );
    // Data de Previsão de Chegada
    if qry_ddimport_.FieldByName('DT_PREV_CHEGADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PREV_CHEGADA').AsDateTime );
    // Data de Previsão de Entrega
    if qry_ddimport_.FieldByName('DT_PREV_ENTREGA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_.FieldByName('DT_PREV_ENTREGA').AsDateTime );
    // Canal do Desembaraço
    cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('CD_CANAL').AsString, 1 );
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';
    // Total Mercadoria DI US$
    if qry_ddimport_.FieldByName('VL_MLE_DOLAR').AsFloat > 0 then
      cTexto := Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_MLE_DOLAR').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_MLE_DOLAR').AsFloat ), 14, 2 )
    else
      cTexto := '000000000000.00';
    // Total Frete DI US$
    if qry_ddimport_.FieldByName('VL_FRETE_DOLAR').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_FRETE_DOLAR').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_FRETE_DOLAR').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    // Total Seguro DI US$
    if qry_ddimport_.FieldByName('VL_SEGURO_DOLAR').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_SEGURO_DOLAR').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_SEGURO_DOLAR').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    // Total da DI US$
    if qry_ddimport_.FieldByName('VL_CIF_DOLAR').AsFloat > 0 then
      cTexto := cTexto + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_CIF_DOLAR').AsFloat ), 1, 12 ) + '.' + Copy( FormataFloat( '000000000000.00', qry_ddimport_.FieldByName('VL_CIF_DOLAR').AsFloat ), 14, 2 )
    else
      cTexto := cTexto + '000000000000.00';
    cTexto := cTexto + #13#10;
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    qry_ddimport_desp_.Close;
    qry_ddimport_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := qry_ddimport_.FieldByName('NR_IDENTIFICADOR').AsInteger;
    qry_ddimport_desp_.ParamByName('NR_PROCESSO').AsString       := qry_ddimport_.FieldByName('NR_PROCESSO').AsString;
    qry_ddimport_desp_.Prepare;
    qry_ddimport_desp_.Open;
    while Not qry_ddimport_desp_.EOF do
    begin
      // Tipo de Registro
      cTexto := qry_ddimport_desp_.FieldByName('TP_REGISTRO').AsString;
      // Embarque/PO
      cTexto := cTexto + JustificaString( qry_ddimport_.FieldByName('NR_PO').AsString, 18 );
      // Dt. do Pagamento
      if qry_ddimport_desp_.FieldByName('DT_PAGAMENTO').IsNull then
        cTexto := cTexto + '00000000'
      else
        cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_desp_.FieldByName('DT_PAGAMENTO').AsDateTime );
      // Código da Despesa
      cTexto := cTexto + JustificaString( qry_ddimport_desp_.FieldByName('CD_ITEM').AsString, 3 );
      // Valor da Despesa
      if qry_ddimport_desp_.FieldByName('VL_ITEM').AsFloat > 0 then
        cTexto := cTexto + Copy( FormataFloat('00000000000000.00', qry_ddimport_desp_.FieldByName('VL_ITEM').AsFloat ), 1, 14 ) + '.' + Copy( FormataFloat('00000000000000.00', qry_ddimport_desp_.FieldByName('VL_ITEM').AsFloat ), 16, 2 )
      else
        cTexto := cTexto + '00000000000000.00';
      // Flag Previsto / Efetivo
      cTexto := cTexto + '2';
      // Flag Importador / Despachante
      cTexto := cTexto + qry_ddimport_desp_.FieldByName('IN_RESP').AsString;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';
      // Filler
      cTexto := Space( 177 );
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';

      cTexto := Space( 100 ) + #13#10;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';

      qry_ddimport_desp_.Next;
    end;
    qry_ddimport_desp_.Close;

    Screen.Cursor := crArrow;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_DI_saida.DDImport_FLP;
var cTexto : String;
    peso_bruto : String;
    ch_weight : String;
    tar_frete : String;
    frete_real : String;
    pTexto : Array[0..1024] of Char;
begin
  with datm_di_saida do
  begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    // Referência do Embarque no DDImport
    cTexto := JustificaString( qry_ddimport_flp_.FieldByName('NR_PROCESSO').AsString, 15 );
    // Número da DI
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_DI').AsString, 10 );
    // Data Registro da DI
    if qry_ddimport_flp_.FieldByName('DT_REG_DI').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_REG_DI').AsDateTime );
    // Data Previsão Chegada no Porto
    if qry_ddimport_flp_.FieldByName('DT_PREV_CHEGADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_PREV_CHEGADA').AsDateTime );
    // Referência do Despachante
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('REF_DESPACHANTE').AsString, 20 );
    // Data Desembaraço
    if qry_ddimport_flp_.FieldByName('DT_DESEMB').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_DESEMB').AsDateTime );
    // Data Chegada no Porto
    if qry_ddimport_flp_.FieldByName('DT_CHEGADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_CHEGADA').AsDateTime );
    // Data Previsão de Embarque
    if qry_ddimport_flp_.FieldByName('DT_PREV_EMBARQUE').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_PREV_EMBARQUE').AsDateTime );
    // Data Embarque
    if qry_ddimport_flp_.FieldByName('DT_EMBARQUE').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_EMBARQUE').AsDateTime );
    // Data Presença de Carga
    if qry_ddimport_flp_.FieldByName('DT_PRESENCA_CARGA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_PRESENCA_CARGA').AsDateTime );
    // Tipo Documento de Carga
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('CD_TIPO_DCTO_CARGA').AsString, 2 );
    // Número Documento de Carga
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_DCTO_CARGA').AsString, 20 );
    // Número Master
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_MASTER').AsString, 20 );
    // Via de Transporte
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('CD_VIA_TRANSPORTE').AsString, 2 );
    // Quantidade de Container 20
    cTexto := cTexto + StrZero( qry_ddimport_flp_.FieldByName('QT_CNTR_20').AsInteger, 3 );
    // Quantidade de Container 40
    cTexto := cTexto + StrZero( qry_ddimport_flp_.FieldByName('QT_CNTR_40').AsInteger, 3 );
    // Quantidade de Container Tanque
    cTexto := cTexto + StrZero( qry_ddimport_flp_.FieldByName('QT_CNTR_TANK').AsInteger, 3 );
    // Carga Solta
    cTexto := cTexto + qry_ddimport_flp_.FieldByName('CD_CARGA_SOLTA').AsString;
    // Canal da DI
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('CD_CANAL').AsString, 10 );
    // Quantidade de Volumes
    cTexto := cTexto + StrZero( StrToInt( qry_ddimport_flp_.FieldByName('QT_VOLUMES').AsString ), 3 );
    // Peso Bruto
    if qry_ddimport_flp_.FieldByName('VL_PESO_BRUTO').AsFloat > 0 then
    begin
      peso_bruto := FormataFloat('000000000000.00000', qry_ddimport_flp_.FieldByName('VL_PESO_BRUTO').AsFloat );
      cTexto := cTexto + Copy( peso_bruto, 1, 12 ) + '.' + Copy( peso_bruto, 14, 5 );
    end
    else
    begin
      cTexto := cTexto + '000000000000.00000';
    end;
    // Chargeable Weight
    if qry_ddimport_flp_.FieldByName('VL_CHAR_WEIGHT').AsFloat > 0 then
    begin
      ch_weight := FormataFloat('000000000000.00000', qry_ddimport_flp_.FieldByName('VL_CHAR_WEIGHT').AsFloat );
      cTexto := cTexto + Copy( ch_weight, 1, 12 ) + '.' + Copy( ch_weight, 14, 5 );
    end
    else
    begin
      cTexto := cTexto + '000000000000.00000';
    end;
    // Tarifa do Frete
    if qry_ddimport_flp_.FieldByName('VL_TARIFA_FRETE').AsFloat > 0 then
    begin
      tar_frete := FormataFloat('000000000000.00000', qry_ddimport_flp_.FieldByName('VL_TARIFA_FRETE').AsFloat );
      cTexto := cTexto + Copy( tar_frete, 1, 12 ) + '.' + Copy( tar_frete, 14, 5 );
    end
    else
    begin
      cTexto := cTexto + '000000000000.00000';
    end;
    // Frete em R$
    if qry_ddimport_flp_.FieldByName('VL_FRETE_REAL').AsFloat > 0 then
    begin
      frete_real := FormataFloat('000000000000.00', qry_ddimport_flp_.FieldByName('VL_FRETE_REAL').AsFloat );
      cTexto := cTexto + Copy( frete_real, 1, 12 ) + '.' + Copy( frete_real, 14, 2 );
    end
    else
    begin
      cTexto := cTexto + '000000000000.00';
    end;
    // Filler ( branco nas posições 238, 239, 240 )
    cTexto := cTexto + '   ';
    // Data Emissão da Nota Fiscal Entrada
    if qry_ddimport_flp_.FieldByName('DT_NF_ENTRADA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_NF_ENTRADA').AsDateTime );

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Data B/L Master
    if qry_ddimport_flp_.FieldByName('DT_BL_MASTER').IsNull then
      cTexto := '00000000'
    else
      cTexto := FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_BL_MASTER').AsDateTime );
    // Data Docto. Carga
    if qry_ddimport_flp_.FieldByName('DT_DCTO_CARGA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_DCTO_CARGA').AsDateTime );
    // Data Remoção
    if qry_ddimport_flp_.FieldByName('DT_REMOCAO').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_REMOCAO').AsDateTime );
    // Recinto Alfandegado
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('CD_RECINTO_ALFANDEGADO').AsString, 7 );
    // Data Aut. Embarque
    if qry_ddimport_flp_.FieldByName('DT_AUT_EMBARQUE').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_AUT_EMBARQUE').AsDateTime );
    // Data Receb. Cópia das Faturas
    if qry_ddimport_flp_.FieldByName('DT_RECEB_DCTO_FAT').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_RECEB_DCTO_FAT').AsDateTime );
    // Data Previsão de Chegada no Imp
    if qry_ddimport_flp_.FieldByName('DT_PREV_CHEGADA_IMP').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_PREV_CHEGADA_IMP').AsDateTime );
    // Data Pagamento dos Impostos
    if qry_ddimport_flp_.FieldByName('DT_PAG_IMPOSTOS').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_PAG_IMPOSTOS').AsDateTime );
    // Data Desova
    if qry_ddimport_flp_.FieldByName('DT_DESOVA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_DESOVA').AsDateTime );
    // Data Aviso da Avaria
    if qry_ddimport_flp_.FieldByName('DT_AVISO_AVARIA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_AVISO_AVARIA').AsDateTime );
    // Data Anuência da LI
    if qry_ddimport_flp_.FieldByName('DT_ANUENCIA_LI').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_ANUENCIA_LI').AsDateTime );

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Data Chegada no Armazém ( EADI )
    if qry_ddimport_flp_.FieldByName('DT_CHEGADA_ARM').IsNull then
      cTexto := '00000000'
    else
      cTexto := FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_CHEGADA_ARM').AsDateTime );
    // Data Presença de Carga no EADI
    if qry_ddimport_flp_.FieldByName('DT_PRESENCA_CARGA_EADI').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_PRESENCA_CARGA_EADI').AsDateTime );
    // Número DTA
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_DTA').AsString, 20 );
    // Data Registro DTA
    if qry_ddimport_flp_.FieldByName('DT_REG_DTA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_REG_DTA').AsDateTime );
    // Tipo DTA
    cTexto := cTexto +  qry_ddimport_flp_.FieldByName('CD_TIPO_DTA').AsString;
    // Canal DTA
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('CD_CANAL_DTA').AsString, 10 );
    // Data Parametrização do DTA
    if qry_ddimport_flp_.FieldByName('DT_PARAM_DTA').IsNull then
      cTexto := cTexto + '00000000'
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_flp_.FieldByName('DT_PARAM_DTA').AsDateTime );
    // Número do Manifesto
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_MANIFESTO').AsString, 15 );
    // Número do Voo
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_VOO').AsString, 15 );
    // Número da Viagem do Navio
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_VIAGEM_NAVIO').AsString, 15 );
    // Número CI  ( enviado NR_DI como solicitado por sr Mauricio )
    //cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_CI').AsString, 20 );
    cTexto := cTexto + JustificaString( qry_ddimport_flp_.FieldByName('NR_DI').AsString, 20 );
    cTexto := cTexto + #13#10;
    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    Screen.Cursor := crArrow;
    Application.ProcessMessages;
  end;
end;


procedure Tfrm_DI_saida.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_produto, frm_produto );
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
  msk_cd_produto.SetFocus;
end;

procedure Tfrm_DI_saida.btn_co_processoClick(Sender: TObject);
begin
  if ( msk_cd_produto.Text = '' ) then
  begin
    BoxMensagem( 'Produto não informado!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
  end;
end;

procedure Tfrm_DI_saida.msk_cd_produtoChange(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_DI_saida.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  With datm_DI_saida.qry_produto_ Do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_Produto.Clear;
      msk_cd_Produto.SetFocus;
    end
    else edt_nm_produto.Text:= FieldByName('AP_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_DI_saida.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_DI_saida do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := frm_DI_saida.msk_cd_unid_neg.Text + msk_cd_Produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        BoxMensagem( 'Processo não encontrado. Digite novamente.', 2 );
        msk_nr_processo.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_DI_saida.DDImport_CUSTO;
var cTexto : String;
    pTexto : Array[0..1024] of Char;
begin
  with datm_di_saida do
  begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    //   while Pos(' ', S) > 0 do
    //   S[Pos(' ', S)] := '0';

    // Número da DI
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('NR_DI').AsString, 12 );
    // Número do Pedido
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('NR_PEDIDO').AsString, 10 );
    // Taxa Câmbio Reg DI
    if qry_ddimport_custo_.FieldByName('TX_CAMBIO_REG_DI').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('TX_CAMBIO_REG_DI').AsFloat ) + space( 10 - length( FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('TX_CAMBIO_REG_DI').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '          ';
    end;
    // Número do Ítem do Pedido
    cTexto := cTexto + '00' + JustificaString( qry_ddimport_custo_.FieldByName('NR_ITEM_PEDIDO').AsString, 3 );
    // Número da Fatura
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('NR_FATURA').AsString, 16 );
    // Código do Produto
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('CD_PRODUTO').AsString, 18 );
    // Quantidade
    if qry_ddimport_custo_.FieldByName('QTDE').AsFloat > 0 then
    begin
//    qtde := FormataFloat('0000000000000.000', qry_ddimport_custo_.FieldByName('QTDE').AsFloat );
//    cTexto := cTexto + Copy( qtde, 1, 13 ) + '.' + Copy( qtde, 15, 3 );
      cTexto := cTexto + FormataFloat('0.000', qry_ddimport_custo_.FieldByName('QTDE').AsFloat ) + space( 17 - length( FormataFloat('0.000', qry_ddimport_custo_.FieldByName('QTDE').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,000            ';
    end;
    // Valor FOB do Item na Moeda
    if qry_ddimport_custo_.FieldByName('VL_FOB_ITEM_MNEG').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('VL_FOB_ITEM_MNEG').AsFloat ) + space( 16 - length( FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('VL_FOB_ITEM_MNEG').AsFloat ) ) ) ;
    end
    else
    begin
      cTexto := cTexto + '0,00000         ';
    end;
    // Reserva 1 -> THC ( TERMINAL )
    if qry_ddimport_custo_.FieldByName('RESERVA_1').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('RESERVA_1').AsFloat ) + space( 16 - length( FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('RESERVA_1').AsFloat ) ) ) ;
    end
    else
    begin
      cTexto := cTexto + '0,00000         ';
    end;

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Seguro Internacional
    if qry_ddimport_custo_.FieldByName('VL_SEGURO').AsFloat > 0 then
    begin
      cTexto := FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('VL_SEGURO').AsFloat ) + space( 16 - length( FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('VL_SEGURO').AsFloat ) ) );
    end
    else
    begin
      cTexto := '0,00            ';
    end;
    // CPMF
    if qry_ddimport_custo_.FieldByName('VL_CPMF').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_CPMF').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_CPMF').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Reserva 2
    cTexto := cTexto + '0,00            ';
    // Reserva 3
    cTexto := cTexto + '0,00            ';
    // Reserva 4
    cTexto := cTexto + '0,00            ';
    // Imposto de Importação
    if qry_ddimport_custo_.FieldByName('VL_II').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_II').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_II').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // IPI
    if qry_ddimport_custo_.FieldByName('VL_IPI').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('VL_IPI').AsFloat ) + space( 16 - length( cTexto + FormataFloat('0.00000', qry_ddimport_custo_.FieldByName('VL_IPI').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // ICMS
    if qry_ddimport_custo_.FieldByName('VL_ICMS').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_ICMS').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_ICMS').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Frete
    if qry_ddimport_custo_.FieldByName('VL_FRETE').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_FRETE').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_FRETE').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Reserva 5
    cTexto := '0,00            ';
    // Despesas Financeiras
    if qry_ddimport_custo_.FieldByName('VL_DESPESAS_FIN').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESAS_FIN').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESAS_FIN').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Reserva 6
    cTexto := cTexto + '0,00            ';
    // Reserva 7
    cTexto := cTexto + '0,00            ';
    // Data da Fatura
    if qry_ddimport_custo_.FieldByName('DT_FATURA').IsNull then
      cTexto := cTexto + '        '
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_custo_.FieldByName('DT_FATURA').AsDateTime );
    // Sigla da Moeda
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('SL_MOEDA').AsString, 4 );
    // Data NF Serviço Despachante
    if qry_ddimport_custo_.FieldByName('DT_NF_SERVICO_DESP').IsNull then
      cTexto := cTexto + '        '
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_custo_.FieldByName('DT_NF_SERVICO_DESP').AsDateTime );
    // No da NF Serviço Despachante
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('NR_NF_SERVICO_DESP').AsString, 8 );
    // Valor da NF Serviço Despachante
    if qry_ddimport_custo_.FieldByName('VL_NF_SERVICO_DESP').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_NF_SERVICO_DESP').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_NF_SERVICO_DESP').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Data Vencto NF Serviço Desp
    if qry_ddimport_custo_.FieldByName('DT_VENCTO_NF_SERVICO_DESP').IsNull then
      cTexto := '        '
    else
      cTexto := FormatDateTime( 'ddmmyyyy', qry_ddimport_custo_.FieldByName('DT_VENCTO_NF_SERVICO_DESP').AsDateTime );
    // Valor IRRF Despachante
    if qry_ddimport_custo_.FieldByName('VL_IRRF_DESP').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_IRRF_DESP').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_IRRF_DESP').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Reserva 8
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('RESERVA_8').AsString, 10 );
    // Reserva 9
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('RESERVA_9').AsString, 10 );
    // Número da Adição da DI
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('NR_ADICAO_DI').AsString, 3 );
    // Reserva 10
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('RESERVA_10').AsString, 25 );
    // Referência do Despachante
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('REF_DESP').AsString, 15 );
    // Reserva 11
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('RESERVA_11').AsString, 15 );

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );

    // Taxa do Siscomex
    if qry_ddimport_custo_.FieldByName('VL_TX_SISCOMEX').AsFloat > 0 then
    begin
      cTexto := FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_TX_SISCOMEX').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_TX_SISCOMEX').AsFloat ) ) );
    end
    else
    begin
      cTexto := '0,00            ';
    end;
    // Armazenagem
    if qry_ddimport_custo_.FieldByName('VL_ARMAZENAGEM').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_ARMAZENAGEM').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_ARMAZENAGEM').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // SDA
    if qry_ddimport_custo_.FieldByName('VL_SDA').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_SDA').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_SDA').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // No da NF de Entrada
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('NR_NF_ENTRADA').AsString, 16 );
    // Reserva 12
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('RESERVA_12').AsString, 10 );
    // Multa
    if qry_ddimport_custo_.FieldByName('VL_MULTA').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MULTA').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MULTA').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Tipo de Frete
    cTexto := cTexto + qry_ddimport_custo_.FieldByName('TP_FRETE').AsString;
    // Referência do Embarque do DDImport
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('REF_EMB_DDIMPORT').AsString, 15 );
    // Frete Rodoviário
    if qry_ddimport_custo_.FieldByName('VL_FRETE_ROD').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_FRETE_ROD').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_FRETE_ROD').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Marinha Mercante
    if qry_ddimport_custo_.FieldByName('VL_MARINHA').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MARINHA').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MARINHA').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Capatazia
    if qry_ddimport_custo_.FieldByName('VL_CAPATAZIA').AsFloat > 0 then
    begin
      cTexto := FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_CAPATAZIA').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_CAPATAZIA').AsFloat ) ) );
    end
    else
    begin
      cTexto := '0,00            ';
    end;
    // Remoção DAP
    if qry_ddimport_custo_.FieldByName('VL_REMOCAO_DAP').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_REMOCAO_DAP').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_REMOCAO_DAP').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Taxa de Liberação de BL
    if qry_ddimport_custo_.FieldByName('VL_TX_LIB_BL').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_TX_LIB_BL').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_TX_LIB_BL').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Taxa de Desconsolidação
    if qry_ddimport_custo_.FieldByName('VL_TX_DESC').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_TX_DESC').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_TX_DESC').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Serviço Aduaneiro
    if qry_ddimport_custo_.FieldByName('VL_SERV_ADUAN').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_SERV_ADUAN').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_SERV_ADUAN').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Decex (LI)
    if qry_ddimport_custo_.FieldByName('VL_DECEX_LI').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DECEX_LI').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DECEX_LI').AsFloat ) ));
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // FITP
    if qry_ddimport_custo_.FieldByName('VL_FITP').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_FITP').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_FITP').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Laudo Técnico
    if qry_ddimport_custo_.FieldByName('VL_LAUDO_TECN').AsFloat > 0 then
    begin
      cTexto := FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_LAUDO_TECN').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_LAUDO_TECN').AsFloat ) ) );
    end
    else
    begin
      cTexto := '0,00            ';
    end;
    // Movto Zona Primária
    if qry_ddimport_custo_.FieldByName('VL_MOV_PRI').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MOV_PRI').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MOV_PRI').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Movto Retro Area
    if qry_ddimport_custo_.FieldByName('VL_MOV_RETRO').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MOV_RETRO').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_MOV_RETRO').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Caução Container
    if qry_ddimport_custo_.FieldByName('VL_CAUCAO_CNTR').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_CAUCAO_CNTR').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_CAUCAO_CNTR').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Despesa 1
    if qry_ddimport_custo_.FieldByName('VL_DESPESA_1').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESA_1').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESA_1').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Despesa 2
    if qry_ddimport_custo_.FieldByName('VL_DESPESA_2').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESA_2').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESA_2').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Despesa 3
    if qry_ddimport_custo_.FieldByName('VL_DESPESA_3').AsFloat > 0 then
    begin
       cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESA_3').AsFloat ) + space( 16 - length(FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_DESPESA_3').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;
    // Outras Despesas
    if qry_ddimport_custo_.FieldByName('VL_OUTRAS_DESPESA').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_OUTRAS_DESPESA').AsFloat ) + space( 16 - length( FormataFloat('0.00', qry_ddimport_custo_.FieldByName('VL_OUTRAS_DESPESA').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,00            ';
    end;

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );


    // Taxa de Câmbio Frete da DI
    if qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_FRETE_DI').AsFloat > 0 then
    begin
      cTexto := FormataFloat('0.0000000', qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_FRETE_DI').AsFloat ) + space( 14 - length( FormataFloat('0.0000000', qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_FRETE_DI').AsFloat ) ) );
    end
    else
    begin
      cTexto := '0,0000000     ';
    end;
    // Taxa de Câmbio Seguro da DI
    if qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_SEGURO_DI').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.0000000', qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_SEGURO_DI').AsFloat ) + space( 14 - length( FormataFloat('000000.0000000', qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_SEGURO_DI').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,0000000     ';
    end;
    // Taxa de Câmbio Dolar da DI
    if qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_DOLAR_DI').AsFloat > 0 then
    begin
      cTexto := cTexto + FormataFloat('0.0000000', qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_DOLAR_DI').AsFloat ) + space( 14 - length( FormataFloat('0.0000000', qry_ddimport_custo_.FieldByName('VL_TX_CAMBIO_DOLAR_DI').AsFloat ) ) );
    end
    else
    begin
      cTexto := cTexto + '0,0000000     ';
    end;
    // Data Fechamento
    if qry_ddimport_custo_.FieldByName('DT_FECHAMENTO').IsNull then
      cTexto := cTexto + '        '
    else
      cTexto := cTexto + FormatDateTime( 'ddmmyyyy', qry_ddimport_custo_.FieldByName('DT_FECHAMENTO').AsDateTime );
    // Número do Ítem do Embarque no DDImport
    cTexto := cTexto + '0' + JustificaString( qry_ddimport_custo_.FieldByName('NR_ITEM_EMBARQUE').AsString, 3 );
    // Código do Delivery Note
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('CD_DELIVERY_NOTE').AsString, 50 );
    // Base de cáculo do Pis/ Cofins
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('VL_BASE_CALCULO_PIS_COFINS').AsString, 18 );
    // valor do Pis
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('VL_PIS').AsString, 18 );
    // Valor do Cofins
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('VL_COFINS').AsString, 18 );
    // Valor do Pis Armazenado
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('VL_PIS_ARMAZENAGEM').AsString, 18 );
    // Valor do Cofins Armazenado
    cTexto := cTexto + JustificaString( qry_ddimport_custo_.FieldByName('VL_COFINS_ARMAZENAGEM').AsString, 18 );

    cTexto := cTexto + #13#10;

    StrPCopy( pTexto, cTexto );
    Arquivo.Write( pTexto );
    cTexto := '';

    Screen.Cursor := crArrow;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_DI_saida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

end.

