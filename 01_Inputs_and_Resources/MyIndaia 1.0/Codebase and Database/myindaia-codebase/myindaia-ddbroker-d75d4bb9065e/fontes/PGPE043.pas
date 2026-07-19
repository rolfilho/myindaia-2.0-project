unit PGPE043;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls,
  Mask, ComCtrls, Funcoes, Variants, ConsOnlineEx;

type
  Tfrm_exp_bordero = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    mi_salvar: TMenuItem;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_bordero: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbg_cadastro: TDBGrid;
    pnl_entrada_de_dados: TPanel;
    mi_cancelar: TMenuItem;
    lbl_processo: TLabel;
    mskedt_nr_processo: TMaskEdit;
    Label2: TLabel;
    dbedt_dt_envio: TDBEdit;
    dbm_observacao: TDBMemo;
    Label7: TLabel;
    btn_co_obs: TSpeedButton;
    btn_co_proc_new: TSpeedButton;
    dbedt_nr_fatura: TDBEdit;
    Label26: TLabel;
    Label29: TLabel;
    dbedt_dt_fatura: TDBEdit;
    Label32: TLabel;
    dbedt_cd_exportador: TDBEdit;
    dbedt_nm_exportador: TDBEdit;
    btn_co_exportador: TSpeedButton;
    Label27: TLabel;
    dbedt_cd_importador: TDBEdit;
    dbedt_nm_importador: TDBEdit;
    btn_co_importador: TSpeedButton;
    dbedt_nr_protocolo: TDBEdit;
    Label61: TLabel;
    ts_documentos: TTabSheet;
    pnl_documentos: TPanel;
    lbl_sequencia: TLabel;
    dbedt_nr_sequencia: TDBEdit;
    lbl_item: TLabel;
    dbedt_cd_documento: TDBEdit;
    dbedt_nm_documento: TDBEdit;
    btn_co_documento: TSpeedButton;
    lbl_valor: TLabel;
    dbedt_nr_referencia: TDBEdit;
    Label1: TLabel;
    dbedt_qt_orig: TDBEdit;
    dbedt_qt_copias: TDBEdit;
    Label3: TLabel;
    edt_chave: TEdit;
    lbl_pesquisa: TLabel;
    cb_ordem: TComboBox;
    lbl_ordem_pesquisa: TLabel;
    pnlUnidade: TPanel;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    dbgrd_exp_desp: TDBGrid;
    btnImpressao: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_borderoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_borderoChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_obsClick(Sender: TObject);
    procedure dbm_observacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure btn_co_documentoClick(Sender: TObject);
    procedure dbedt_cd_documentoExit(Sender: TObject);
    procedure dbedt_nr_faturaExit(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lNaoConsiste : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure Habilita_Entrada;
    procedure Desabilita_Entrada;
    procedure CodExits;

  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto  : String;
  end;

var
  frm_exp_bordero: Tfrm_exp_bordero;

implementation

uses GSMLIB, PGGP017, PGGP001, PGSM006, PGSM018, PGGP025, PGPE044, PGSM136,
  PGSM208, pgpe045;

{$R *.DFM}

procedure Tfrm_exp_bordero.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_exp_bordero.btn_incluirClick(Sender: TObject);
begin
  if pgctrl_bordero.ActivePage <> ts_documentos then
  begin
    with datm_exp_bordero do
    begin
      pgctrl_bordero.ActivePage := ts_dados_basicos;

      qry_exp_bord_.DisableControls;
      qry_exp_bord_.Cancel;
      qry_exp_bord_.Append;
      qry_exp_bord_.EnableControls;
    end;
    pgctrl_bordero.ActivePage := ts_dados_basicos;

    Desabilita_Entrada;

    Btn_Mi(False, True, True, False );

    lbl_processo.Enabled       := True;

    mskedt_nr_processo.Enabled  := True;
    mskedt_nr_processo.ReadOnly := False;
    btn_co_proc_new.Enabled     := True;

    mskedt_nr_processo.Text := '';
    mskedt_nr_processo.SetFocus;
  end
  else
  begin
    datm_exp_bordero.qry_exp_bord_item_.DisableControls;
    datm_exp_bordero.qry_exp_bord_item_.Cancel;
    datm_exp_bordero.qry_exp_bord_item_.Append;
    datm_exp_bordero.qry_exp_bord_item_.EnableControls;

    datm_exp_bordero.qry_ult_doc_.Close;
    datm_exp_bordero.qry_ult_doc_.ParamByName('NR_PROCESSO').AsString := datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString;
    datm_exp_bordero.qry_ult_doc_.ParamByName('NR_FATURA').AsString := datm_exp_bordero.qry_proc_exp_NR_FATURA.AsString;
    datm_exp_bordero.qry_ult_doc_.Prepare;
    datm_exp_bordero.qry_ult_doc_.Open;

    datm_exp_bordero.qry_exp_bord_item_NR_SEQUENCIA.AsString := UltCod( datm_exp_bordero.qry_ult_doc_, datm_exp_bordero.qry_ult_doc_ULTIMO );

    Habilita_Entrada;

    Btn_Mi(False, True, True, False );

    dbedt_cd_documento.SetFocus;
  end;

end;

procedure Tfrm_exp_bordero.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  with datm_exp_bordero do
  begin
    qry_proc_exp_.Close;
    qry_emp_nac_.Close;
    qry_emp_est_.Close;
    qry_exp_bord_.Close;
    qry_exp_bord_item_.Close;
    qry_tp_documento_.Close;
    qry_processo_.Close;

    Free;
  end;

  Action := caFree;

end;

procedure Tfrm_exp_bordero.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module}
  Application.CreateForm( Tdatm_exp_bordero, datm_exp_bordero );

  with datm_exp_bordero do
  begin
    ds_proc_exp.AutoEdit := st_modificar;
    qry_proc_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_proc_exp_.Prepare;
    qry_proc_exp_.SQL[3] := 'NR_PROCESSO';
    qry_proc_exp_.Open;
  end;

  a_str_indices[0] := 'NR_PROCESSO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  datm_exp_bordero.qry_exp_bord_.Close;
  datm_exp_bordero.qry_exp_bord_.Prepare;
  datm_exp_bordero.qry_exp_bord_.Open;

  if datm_exp_bordero.qry_exp_bord_.EOF then
     btn_excluir.Enabled := False;

  pgctrl_bordero.ActivePage := ts_lista;
  
end;

procedure Tfrm_exp_bordero.btn_excluirClick(Sender: TObject);
var pProcesso : String[18];
    pFatura: string[15];
begin
  if pgctrl_bordero.ActivePage <> ts_documentos then
  begin
    if BoxMensagem( 'Este Processo será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;

      pProcesso := datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString;
      pFatura :=   datm_exp_bordero.qry_proc_exp_NR_FATURA.AsString;

      datm_exp_bordero.qry_proc_exp_.Close;
      datm_exp_bordero.qry_exp_bord_.Close;

      with TQuery.Create(application) do begin
        DataBaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROCESSO_EXP_BORD_ITEM WHERE NR_PROCESSO = "' + pProcesso + '" AND NR_FATURA = "' + pFatura + '" ');
        SQL.Add('DELETE FROM TPROCESSO_EXP_BORD      WHERE NR_PROCESSO = "' + pProcesso + '" AND NR_FATURA = "' + pFatura + '" ');
        ExecSQL;
        Free;
      end;

      //datm_exp_bordero.qry_exec_sp_.SQL.Clear;
      //datm_exp_bordero.qry_exec_sp_.SQL.Add( 'EXEC sp_exp_bordero_exclui "' + cProcesso + '"' );
      //datm_exp_bordero.qry_exec_sp_.ExecSQL;

      datm_main.db_broker.Commit;

      datm_exp_bordero.qry_proc_exp_.Close;
      //datm_exp_bordero.qry_proc_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
      datm_exp_bordero.qry_proc_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      datm_exp_bordero.qry_proc_exp_.Prepare;
      datm_exp_bordero.qry_proc_exp_.Open;

      datm_exp_bordero.qry_exp_bord_.Close;
      datm_exp_bordero.qry_exp_bord_.Prepare;
      datm_exp_bordero.qry_exp_bord_.Open;

      if datm_exp_bordero.qry_exp_bord_.EOF then
      begin
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;

    except
      on E: Exception do
      begin
        datm_exp_bordero.qry_proc_exp_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    pgctrl_bordero.ActivePage := ts_lista;
  end
  else
  begin
    try
      datm_main.db_broker.StartTransaction;
      datm_exp_bordero.qry_exp_bord_item_.Delete;
      datm_main.db_broker.Commit;

      if datm_exp_bordero.qry_exp_bord_item_.EOF then
      begin
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;

    except
      on E: Exception do
      begin
        datm_exp_bordero.qry_exp_bord_item_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

end;

procedure Tfrm_exp_bordero.FormShow(Sender: TObject);
begin
  pgctrl_bordero.ActivePage := ts_lista;
  edt_chave.SetFocus;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  edt_nm_unid_neg.Text := datm_exp_bordero.qry_unid_neg_NM_UNID_NEG.AsString;

  datm_exp_bordero.qry_unid_neg_.Close;
  //datm_exp_bordero.qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
  datm_exp_bordero.qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
  datm_exp_bordero.qry_unid_neg_.Prepare;
  datm_exp_bordero.qry_unid_neg_.Open;
end;

procedure Tfrm_exp_bordero.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
  datm_exp_bordero.qry_exp_bord_.Locate('NR_PROCESSO', Trim(msk_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text), [LoCaseInsensitive, loPartialKey]);
end;

procedure Tfrm_exp_bordero.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_exp_bordero.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString;

  edt_chave.Text := '';
  datm_exp_bordero.qry_proc_exp_.Close;
  datm_exp_bordero.qry_proc_exp_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_exp_bordero.qry_proc_exp_.Open;
  Localiza(datm_exp_bordero.qry_proc_exp_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_exp_bordero.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_exp_bordero.qry_proc_exp_, Trim( msk_cd_unid_neg.Text ) + '02' + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_exp_bordero.Consiste : Boolean;
var vQryAux: TQuery;
begin

  if pgctrl_bordero.ActivePage = ts_dados_basicos then
  begin
    if datm_exp_bordero.qry_exp_bord_.State in [dsEdit, dsInsert] then
    begin
      { Processo }
      if mskedt_nr_processo.Text = '' then
      begin
        BoxMensagem('Processo deve ser preenchido!', 2);
        pgctrl_bordero.ActivePage := ts_dados_basicos;
        mskedt_nr_processo.SetFocus;
        Consiste := False;
        Exit;
      end;

      { Fatura }
      if dbedt_nr_fatura.Text = '' then
      begin
        BoxMensagem('Nr. de Fatura deve ser preenchida!', 2);
        pgctrl_bordero.ActivePage := ts_dados_basicos;
        dbedt_nr_fatura.SetFocus;
        Consiste := False;
        Exit;
      end;

      {verifica se existe Processo + fatura}
      if (mskedt_nr_processo.Text <> '') and (dbedt_nr_fatura.Text <> '')  and (datm_exp_bordero.qry_exp_bord_.State = dsInsert) then begin
        vQryAux := TQuery.Create(application);
        vQryAux.DataBaseName := 'DBBROKER';
        vQryAux.Close;
        vQryAux.SQL.Clear;
        vQryAux.SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO_EXP_BORD WHERE ');
        vQryAux.SQL.Add(' NR_PROCESSO = "' + str_nr_processo + '" AND ');
        vQryAux.SQL.Add(' NR_FATURA = "' + dbedt_nr_fatura.Text + '" ');
        vQryAux.Open;
        if not (vQryAux.EOF) then
        begin
          BoxMensagem('Já existe este Processo  e Fatura!', 2);
          pgctrl_bordero.ActivePage := ts_dados_basicos;
          mskedt_nr_processo.SetFocus;
          Consiste := False;
          Exit;
        end;
        vQryAux.Free;

      end;

      {Exportador}
      if dbedt_cd_exportador.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_exportador );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_exportador.Text = '' ) then
          begin
            BoxMensagem('Código do Exportador inválido !',2);
            pgctrl_bordero.ActivePage := ts_dados_basicos;
            dbedt_cd_exportador.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Importador}
      if dbedt_cd_importador.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_importador );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_importador.Text = '' ) then
          begin
            BoxMensagem('Código do Importador inválido!',2);
            pgctrl_bordero.ActivePage := ts_dados_basicos;
            dbedt_cd_importador.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end
  end
  else if pgctrl_bordero.ActivePage = ts_documentos then
  begin

    if datm_exp_bordero.qry_exp_bord_item_.State in [dsEdit, dsInsert] then
    begin

      if dbedt_cd_documento.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_documento );
        if ( dbedt_nm_documento.Text = '' ) then
        begin
          BoxMensagem('Tipo do Documento inválido!',2);
          pgctrl_bordero.ActivePage := ts_documentos;
          dbedt_cd_documento.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

  Consiste := True;

end;

function Tfrm_exp_bordero.Grava : Boolean;
var vFatura: string;
begin
  try
    datm_main.db_broker.StartTransaction;
    with datm_exp_bordero do
    begin

      if pgctrl_bordero.ActivePage <> ts_documentos then
      begin
        if ( qry_exp_bord_.State in [dsInsert, dsEdit] ) then
          qry_exp_bord_.Post;

        datm_main.db_broker.Commit;

        vFatura := qry_proc_exp_NR_FATURA.AsString;
        qry_proc_exp_.Close;
        qry_proc_exp_.Prepare;
        qry_proc_exp_.Open;
        qry_proc_exp_.Locate('NR_PROCESSO;NR_FATURA', VarArrayOf([str_nr_processo, vFatura]), [loCaseInsensitive]);

        qry_exp_bord_.Close;
        qry_exp_bord_.Prepare;
        qry_exp_bord_.Open;
        qry_exp_bord_.Locate('NR_PROCESSO', str_nr_processo, [loCaseInsensitive, loPartialKey]);
      end
      else
      begin
        if ( qry_exp_bord_item_.State in [dsInsert, dsEdit] ) then
        begin
          qry_exp_bord_item_NR_PROCESSO.AsString := qry_proc_exp_NR_PROCESSO.AsString;
          qry_exp_bord_item_NR_FATURA.AsString := qry_proc_exp_NR_FATURA.AsString;          
          qry_exp_bord_item_.Post;

          datm_main.db_broker.Commit;

          qry_exp_bord_item_.Close;
          qry_exp_bord_item_.Prepare;
          qry_exp_bord_item_.Open;

        end;
      end;
      Grava := True;
    end;

  except
    on E: Exception do
    begin
      if pgctrl_bordero.ActivePage <> ts_documentos then
         datm_exp_bordero.qry_exp_bord_.Cancel
      else
         datm_exp_bordero.qry_exp_bord_item_.Cancel;

      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);

      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

  pgctrl_bordero.SetFocus;

end;

function Tfrm_exp_bordero.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_exp_bordero.qry_exp_bord_.State in [dsEdit] ) and st_modificar ) or
     ( datm_exp_bordero.qry_exp_bord_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Bordero foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;

end;

procedure Tfrm_exp_bordero.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_exp_bordero.Cancelar;
begin
  if pgctrl_bordero.ActivePage <> ts_documentos then
  begin
    try
      begin
        if datm_exp_bordero.qry_exp_bord_.State in [dsInsert, dsEdit] then
        begin
          datm_exp_bordero.qry_exp_bord_.Cancel;
          mskedt_nr_processo.Text := '';
          mskedt_nr_processo.ReadOnly := True;
          pgctrl_bordero.ActivePage := ts_lista;
        end;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end
  else
  begin
    try
      begin
        if datm_exp_bordero.qry_exp_bord_item_.State in [dsInsert, dsEdit] then
          datm_exp_bordero.qry_exp_bord_item_.Cancel;

        if datm_exp_bordero.qry_exp_bord_item_.EOF then
        begin
          btn_excluir.Enabled := False;
          mi_excluir.Enabled  := False;
        end;

      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );

end;

procedure Tfrm_exp_bordero.pgctrl_borderoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;                                                                               

procedure Tfrm_exp_bordero.pgctrl_borderoChange(Sender: TObject);
begin
  btnImpressao.Enabled := (pgctrl_bordero.ActivePage = ts_dados_basicos);
  OnChanging := False;
  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

  if (pgctrl_bordero.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
    lbl_cd_unid_neg.Enabled := True;
    btn_co_unid_neg.Enabled := True;
    msk_cd_unid_neg.Enabled := True;
    edt_nm_unid_neg.Enabled := True;
    btn_incluir.Enabled := True;
    mi_incluir.Enabled := True;

    if not (datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString = '') then
    begin
      btn_excluir.Enabled := True;
      mi_excluir.Enabled := True;
    end
    else
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled := False;
    end;
  end
  else if pgctrl_bordero.ActivePage = ts_dados_basicos then
  begin
    mskedt_nr_processo.Enabled  := False;
    mskedt_nr_processo.ReadOnly := True;

    mskedt_nr_processo.Text := Copy( datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString, 5, 14);

    datm_exp_bordero.qry_exp_bord_.Close;
    datm_exp_bordero.qry_exp_bord_.ParamByName('NR_PROCESSO').AsString := datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString;
    datm_exp_bordero.qry_exp_bord_.Prepare;
    datm_exp_bordero.qry_exp_bord_.Open;

    if not (datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString = '') then
    begin
      Habilita_Entrada;

      btn_salvar.Enabled      := False;
      mi_salvar.Enabled       := False;
      btn_cancelar.Enabled    := False;
      mi_cancelar.Enabled     := False;

      btn_incluir.Enabled     := True;
      mi_incluir.Enabled      := True;
      btn_excluir.Enabled     := True;
      mi_excluir.Enabled      := True;

      mskedt_nr_processo.Enabled  := False;
      mskedt_nr_processo.ReadOnly := True;
      btn_co_proc_new.Enabled     := False;

      dbedt_nr_fatura.SetFocus;
    end
    else
    begin
      Desabilita_Entrada;

      mskedt_nr_processo.Enabled  := True;
      mskedt_nr_processo.ReadOnly := False;
    end;

  end
  else if pgctrl_bordero.ActivePage = ts_documentos then
  begin
    datm_exp_bordero.qry_tp_documento_.Close;
    datm_exp_bordero.qry_tp_documento_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    datm_exp_bordero.qry_tp_documento_.ParamByName('CD_PRODUTO').AsString  := '02';
    datm_exp_bordero.qry_tp_documento_.Prepare;
    datm_exp_bordero.qry_tp_documento_.Open;

    datm_exp_bordero.qry_exp_bord_item_.Close;
    datm_exp_bordero.qry_exp_bord_item_.ParamByName('NR_PROCESSO').AsString := datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString;
    datm_exp_bordero.qry_exp_bord_item_.ParamByName('NR_FATURA').AsString := datm_exp_bordero.qry_proc_exp_NR_FATURA.AsString;    
    datm_exp_bordero.qry_exp_bord_item_.Prepare;
    datm_exp_bordero.qry_exp_bord_item_.Open;

    if not (datm_exp_bordero.qry_exp_bord_item_NR_PROCESSO.AsString = '') then
    begin
      Habilita_Entrada;

      btn_salvar.Enabled      := False;
      mi_salvar.Enabled       := False;
      btn_cancelar.Enabled    := False;
      mi_cancelar.Enabled     := False;

      btn_excluir.Enabled     := True;
      mi_excluir.Enabled      := True;
    end
    else
      Desabilita_Entrada;

    if datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString <> '' then
    begin
      btn_incluir.Enabled     := True;
      mi_incluir.Enabled      := True;
    end;
  end;

end;

procedure Tfrm_exp_bordero.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;


procedure Tfrm_exp_bordero.btn_co_obsClick(Sender: TObject);
begin
  with datm_exp_bordero Do
  begin
    Application.CreateForm(Tfrm_observacoes, frm_observacoes );
    frm_observacoes.Cons_OnLine := datm_exp_bordero.qry_exp_bord_TX_OBSERVACAO;
    With frm_observacoes Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

end;

procedure Tfrm_exp_bordero.dbm_observacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = mskedt_nr_processo  then btn_co_proc_newClick(nil);
    if Sender = dbedt_cd_exportador then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_importador then btn_co_importadorClick(nil);
    if Sender = dbm_observacao      then btn_co_obsClick(nil);
    if Sender = dbedt_cd_documento  then btn_co_documentoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = mskedt_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      mskedt_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      mskedt_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_exp_bordero.msk_cd_unid_negExit(Sender: TObject);
var
   nNumero : Double;
   bAchou  : Boolean;

begin
  nNumero := 0;

  with datm_exp_bordero do
  begin
    msk_cd_unid_neg.Text := Trim(msk_cd_unid_neg.Text);
    if Trim(msk_cd_unid_neg.Text) <> '' then
       nNumero := StrToFloat(msk_cd_unid_neg.Text);

    msk_cd_unid_neg.Text   := StrZero( nNumero, msk_cd_unid_neg.MaxLength );
    if ( msk_cd_unid_neg.Text <> '' ) then
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;

      bAchou := qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]);
      if Not (bAchou) then
      begin
        BoxMensagem('Unidade não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;

        if not (qry_unid_neg_.EOF) then
           edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end;
    end;

    if ( msk_cd_unid_neg.Text = '' )  then
      edt_nm_unid_neg.Text := '';

    qry_proc_exp_.Close;
    qry_proc_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_proc_exp_.Prepare;
    qry_proc_exp_.Open;

  end;
end;

procedure Tfrm_exp_bordero.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
  end;

end;

procedure Tfrm_exp_bordero.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo        := '23';
  str_cd_rotina        := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  vStr_cd_modulo        := '01';
  str_cd_rotina        := '0102';

  msk_cd_unid_negExit(nil);

end;

procedure Tfrm_exp_bordero.btn_co_proc_newClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_exp,frm_consulta_exp);
  frm_consulta_exp.str_cd_unid := frm_exp_bordero.msk_cd_unid_neg.Text;
  frm_consulta_exp.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_exp.Nr_Processo <> '') then
  begin
    mskedt_nr_processo.Text := Copy( frm_consulta_exp.Nr_Processo, 5, 14 );
    str_nr_processo := frm_consulta_exp.Nr_Processo;
  end;

end;

procedure Tfrm_exp_bordero.mskedt_nr_processoExit(Sender: TObject);
var vQryAux: TQuery;
begin
  If mskedt_nr_processo.ReadOnly then
     exit;

  If mskedt_nr_processo.Text <> '' then
  begin
    with datm_exp_bordero do
    begin

      qry_processo_.Close;
      //qry_processo_.ParamByName('NR_PROCESSO').AsString := str_cd_unid_neg + '02' + mskedt_nr_processo.Text;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;

      if qry_processo_.EOF then
      begin
        BoxMensagem( 'Nr. Processo não existente !! ', 3 );
        mskedt_nr_processo.Text := '';
        mskedt_nr_processo.ReadOnly := True;
        Cancelar;
        Exit;
      end;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;
      mskedt_nr_processo.Text := Copy( str_nr_processo, 5, 14 );

      if datm_exp_bordero.qry_exp_bord_.State in [dsInsert, dsEdit] then begin
        {verifica se existe Processo + fatura}
        if (mskedt_nr_processo.Text <> '') and (dbedt_nr_fatura.Text <> '') then begin
          vQryAux := TQuery.Create(application);
          vQryAux.DataBaseName := 'DBBROKER';
          vQryAux.Close;
          vQryAux.SQL.Clear;
          vQryAux.SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO_EXP_BORD WHERE ');
          vQryAux.SQL.Add(' NR_PROCESSO = "' + str_nr_processo + '" AND ');
          vQryAux.SQL.Add(' NR_FATURA = "' + dbedt_nr_fatura.Text + '" ');
          vQryAux.Open;
          if not (vQryAux.EOF) then
          begin
            BoxMensagem('Já existe este Processo e Fatura!', 2);
            dbedt_nr_fatura.SetFocus;
            mskedt_nr_processo.ReadOnly := True;
            Exit;
          end;
          vQryAux.Free;
        end;
      end;

      qry_exp_bord_.Append;

      qry_exp_bord_NR_PROCESSO.AsString   := Trim(str_nr_processo);
      qry_exp_bord_DT_ENVIO.AsDateTime    := StrToDate( DateToStr( Date ) );
      qry_exp_bord_NR_FATURA.AsString     := qry_processo_NR_FATURA.AsString;
      qry_exp_bord_DT_FATURA.AsString     := qry_processo_DT_FATURA.AsString;
      qry_exp_bord_CD_EXPORTADOR.AsString := qry_processo_CD_EXPORTADOR.AsString;
      qry_exp_bord_CD_IMPORTADOR.AsString := qry_processo_CD_IMPORTADOR.AsString;

      Habilita_Entrada;

      Btn_Mi(False, True, True, False );

      mskedt_nr_processo.Enabled := False;
      btn_co_proc_new.Enabled := False;

      dbedt_nr_fatura.SetFocus;

    end;
  end;

end;

procedure Tfrm_exp_bordero.Habilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := True;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TComboBox ) then
       TComboBox( Components[i] ).Enabled     := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := True;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is  TDBMemo ) then
       TDbMemo( Components[i] ).Enabled       := True;
  end;

  btn_sair.Enabled    := True;
  mi_sair.Enabled     := True;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;

  lbl_cd_unid_neg.Enabled := False;
  btn_co_unid_neg.Enabled := False;
  msk_cd_unid_neg.Enabled := False;
  edt_nm_unid_neg.Enabled := False;

end;


procedure Tfrm_exp_bordero.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := False;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TComboBox ) then
       TComboBox( Components[i] ).Enabled     := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := False;
    if ( Components[i] is  TDBMemo ) then
       TDbMemo( Components[i] ).Enabled       :=  False;
  end;

  mi_salvar.Enabled   := btn_salvar.Enabled;
  mi_cancelar.Enabled := btn_cancelar.Enabled;
  mi_excluir.Enabled  := btn_excluir.Enabled;

  btn_sair.Enabled    := True;
  mi_sair.Enabled     := btn_sair.Enabled;
end;


procedure Tfrm_exp_bordero.btn_co_exportadorClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMPRESA_NAC',
                datm_exp_bordero.qry_exp_bord_CD_EXPORTADOR,
                'Exportador', 38, 'SELECT * FROM TEMPRESA_NAC WHERE IN_EXPORTADOR = 1','TQuery');
  dbedt_cd_exportadorExit(nil);

end;

procedure Tfrm_exp_bordero.btn_co_importadorClick(Sender: TObject);
var
vGrupo:String[3];
begin
{
  Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                datm_exp_bordero.qry_exp_bord_CD_IMPORTADOR,
                'Importador', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_IMPORTADOR = 1','TQuery');
}


    vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_bordero.qry_proc_exp_NR_PROCESSO.AsString, 'CD_GRUPO');
    dbedt_cd_importador.Text := ConsultaOnLineExSQL(
      'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
      ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
      'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,dbedt_cd_importador.Text);



  dbedt_cd_importadorExit(nil);
end;

procedure Tfrm_exp_bordero.dbedt_cd_exportadorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_exp_bordero.dbedt_cd_importadorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_exp_bordero.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_exp_bordero.btn_co_documentoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_documento, frm_documento);
  frm_documento.Cons_OnLine := datm_exp_bordero.qry_exp_bord_item_CD_DOCUMENTO;
  with frm_documento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    cd_unid_neg  := msk_cd_unid_neg.Text;
    cd_produto   := '02';
    if Not ( datm_exp_bordero.qry_exp_bord_item_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_exp_bordero.qry_exp_bord_item_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  {
  with datm_exp_bordero do
  begin
    qry_tp_documento_.Close;
    qry_tp_documento_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_tp_documento_.ParamByName('CD_PRODUTO').AsString  := str_cd_produto;
    qry_tp_documento_.Prepare;
    qry_tp_documento_.Open;
  end;
  }
  dbedt_cd_documentoExit(nil);
end;

procedure Tfrm_exp_bordero.dbedt_cd_documentoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_exp_bordero.dbedt_nr_faturaExit(Sender: TObject);
var vQryAux: TQuery;
begin
  if datm_exp_bordero.qry_exp_bord_.State in [dsInsert, dsEdit] then begin
    {verifica se existe Processo + fatura}
    if (mskedt_nr_processo.Text <> '') and (dbedt_nr_fatura.Text <> '') then begin
      vQryAux := TQuery.Create(application);
      vQryAux.DataBaseName := 'DBBROKER';
      vQryAux.Close;
      vQryAux.SQL.Clear;
      vQryAux.SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO_EXP_BORD WHERE ');
      vQryAux.SQL.Add(' NR_PROCESSO = "' + str_nr_processo + '" AND ');
      vQryAux.SQL.Add(' NR_FATURA = "' + dbedt_nr_fatura.Text + '" ');
      vQryAux.Open;
      if not (vQryAux.EOF) then
      begin
        BoxMensagem('Já existe este Processo e Fatura!', 2);
        //dbedt_nr_fatura.SetFocus;
        mskedt_nr_processo.ReadOnly := True;
        Exit;
      end;
      vQryAux.Free;
    end;
  end;
end;

procedure Tfrm_exp_bordero.btnImpressaoClick(Sender: TObject);
begin
  vStr_cd_modulo := '20';
  str_cd_rotina := '2011';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_bordero, frm_exp_impr_bordero);
  frm_exp_impr_bordero.vUnid := msk_cd_unid_neg.Text;
  frm_exp_impr_bordero.vProcesso := Trim(mskedt_nr_processo.Text);
  frm_exp_impr_bordero.ShowModal;
end;

end.

