unit uDDE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Grids, DBGrids, ComCtrls, ExtCtrls, Buttons,
  dbTables, db, Math, Variants, ToolEdit, RXDBCtrl, ServicoNovo,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_dde = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    Shape1: TShape;
    noteNavegacao: TNotebook;
    Label71: TLabel;
    Label72: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pgDDE: TPageControl;
    tabLista: TTabSheet;
    tabGlobais: TTabSheet;
    tabComplementares: TTabSheet;
    tabNF: TTabSheet;
    gridDDE: TDBGrid;
    Shape4: TShape;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    edt_cd_exportador2: TDBEdit;
    edt_nm_exportador2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape5: TShape;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    edt_cd_exportador3: TDBEdit;
    edt_nm_exportador3: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid3: TDBGrid;
    Label25: TLabel;
    DBEdit23: TDBEdit;
    Edit9: TEdit;
    SpeedButton4: TSpeedButton;
    DBEdit24: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit25: TDBEdit;
    Label28: TLabel;
    DBEdit26: TDBEdit;
    Shape10: TShape;
    Shape11: TShape;
    DBGrid4: TDBGrid;
    Shape13: TShape;
    edtSufixoCGC: TDBEdit;
    edt_cnpj2: TMaskEdit;
    edt_cnpj3: TMaskEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    Label19: TLabel;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    Label36: TLabel;
    edt_cd_urf_despacho: TDBEdit;
    edt_nm_urf_despacho: TEdit;
    btn_co_urfdespacho: TSpeedButton;
    Label37: TLabel;
    edt_cd_urf_embarque: TDBEdit;
    edt_nm_urf_embarque: TEdit;
    btn_co_urfembarque: TSpeedButton;
    Shape6: TShape;
    Label38: TLabel;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    Shape14: TShape;
    Label39: TLabel;
    Shape15: TShape;
    Label29: TLabel;
    edt_cd_urf_despacho2: TDBEdit;
    edt_nm_urf_despacho2: TEdit;
    Label40: TLabel;
    edt_cd_urf_embarque2: TDBEdit;
    edt_nm_urf_embarque2: TEdit;
    Shape16: TShape;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Shape9: TShape;
    Shape17: TShape;
    Label30: TLabel;
    Label31: TLabel;
    Label41: TLabel;
    DBNavigator1: TDBNavigator;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    edt_cd_via_transporte2: TDBEdit;
    edt_nm_via_transporte2: TEdit;
    Label43: TLabel;
    Label44: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    mkedt_cnpj: TMaskEdit;
    Label46: TLabel;
    Label47: TLabel;
    pnlEstabelecimentos: TPanel;
    DBText3: TDBText;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    BtnGeraArquivo: TSpeedButton;
    BtnConsultaSiscomex: TSpeedButton;
    Panel5: TPanel;
    Bevel1: TBevel;
    Label51: TLabel;
    btn_co_unidade: TSpeedButton;
    edt_cd_unidade: TEdit;
    edt_nm_unidade: TEdit;
    Shape23: TShape;
    Shape22: TShape;
    Shape12: TShape;
    Shape8: TShape;
    btn_excluir_estab: TSpeedButton;
    btn_cancelar_estab: TSpeedButton;
    btn_salvar_estab: TSpeedButton;
    btn_incluir_estab: TSpeedButton;
    shp1: TShape;
    dbedtDTDDE2: TDBEdit;
    dbedtDTDDE3: TDBEdit;
    captura_telas: TMemo;
    PnlSituacao: TPanel;
    lblSituacao: TDBText;
    lblTitSituacao: TLabel;
    GroupBox1: TGroupBox;
    Shape24: TShape;
    Label34: TLabel;
    Shape25: TShape;
    Label53: TLabel;
    Shape26: TShape;
    Label54: TLabel;
    btnConsultaFila: TSpeedButton;
    pControle2: TPanel;
    Shape2: TShape;
    Shape18: TShape;
    Shape7: TShape;
    Shape3: TShape;
    Label3: TLabel;
    btn_co_exportador: TSpeedButton;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label2: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    btn_co_viatransporte: TSpeedButton;
    Label42: TLabel;
    Label45: TLabel;
    lbl2: TLabel;
    Label52: TLabel;
    btnDesp: TSpeedButton;
    DBGrid2: TDBGrid;
    edt_nm_exportador: TEdit;
    DBEdit13: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    edt_cnpj: TMaskEdit;
    edt_nm_via_transporte: TEdit;
    edt_cd_exportador: TDBEdit;
    edt_cd_via_transporte: TDBEdit;
    EditCPFDesp: TDBEdit;
    EditDesp: TEdit;
    pControle1: TPanel;
    Label1: TLabel;
    edt_nr_processo: TDBEdit;
    btn_co_processo: TSpeedButton;
    Label4: TLabel;
    EditNumDespacho: TDBEdit;
    lbl1: TLabel;
    Shape27: TShape;
    dbedtDtDDE: TDBDateEdit;
    Shape28: TShape;
    Label55: TLabel;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure edt_cd_exportadorExit(Sender: TObject);
    procedure btn_co_urfdespachoClick(Sender: TObject);
    procedure btn_co_urfembarqueClick(Sender: TObject);
    procedure edt_cd_exportador2Change(Sender: TObject);
    procedure edt_cd_exportador3Change(Sender: TObject);
    procedure pgDDEChange(Sender: TObject);
    procedure BtnConsultaSiscomexClick(Sender: TObject);
    procedure pgDDEChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btn_co_viatransporteClick(Sender: TObject);
    procedure edt_cd_via_transporte2Change(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure edt_cd_urf_despacho2Change(Sender: TObject);
    procedure edt_cd_urf_embarque2Change(Sender: TObject);
    procedure btn_incluir_estabClick(Sender: TObject);
    procedure btn_salvar_estabClick(Sender: TObject);
    procedure btn_cancelar_estabClick(Sender: TObject);
    procedure btn_excluir_estabClick(Sender: TObject);
    procedure edt_cnpj3Change(Sender: TObject);
    procedure BtnGeraArquivoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure edt_nr_processoExit(Sender: TObject);
    procedure edt_cd_unidadeExit(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure edt_cd_unidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure gridDDEDblClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedtDtDDEExit(Sender: TObject);
    procedure btnDespClick(Sender: TObject);
    procedure captura_telasDblClick(Sender: TObject);
    procedure btnConsultaFilaClick(Sender: TObject);
    procedure gridDDEDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tabGlobaisShow(Sender: TObject);
    procedure tabComplementaresShow(Sender: TObject);
    procedure tabNFShow(Sender: TObject);
    procedure bloqueia_ctrl_delete(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure NotasFiscais;
    procedure LimpaCampoSituacaoDDE;
    { Private declarations }

  public
    gNR_SD,gPermite_altera_reg_dde:String;
    procedure PosicionaNotebook; // aproveita para verificar os botões no topo do form
    procedure AtualizaValoresDDE;
    procedure AtualizaQtTotalVolumes;
    function  PodeIncluirEstabelecimento : Boolean;

    { Public declarations }

  end;

var
  frm_dde: Tfrm_dde;

implementation

uses dDDE, dReCapa, FuncoesExport, ConsOnLineEx, uHistoricoDDE, Funcoes, PGGP017,
  uCons_Fila_DDE;

{$R *.DFM}

procedure Tfrm_dde.PosicionaNotebook; // aproveita para verificar os botões no topo do form
begin
  noteNavegacao.PageIndex := IIF(pgDDE.ActivePage = tabLista, 1, 0)
end;

procedure Tfrm_dde.btn_incluirClick(Sender: TObject);
begin
  if (pgDDE.ActivePage = tabLista) or (pgDDE.ActivePage = tabGlobais) then
  begin
    pgDDE.ActivePage := tabGlobais;
    TabGlobais.Enabled:=true;
    pControle1.Enabled:=true;
    pControle2.Enabled:=true;

    datm_dde.qry_dde.Insert;
    btn_co_processo.Enabled  := True;
    edt_nr_processo.SetFocus;
    edt_nr_processo.ReadOnly := False;
  end
  else if (pgDDE.ActivePage = tabComplementares) then
  begin
    datm_dde.qry_dde_espec.Insert;
    DBGrid3.SetFocus;
  end
  else if (pgDDE.ActivePage = tabNF) then
  begin
    datm_dde.qry_dde_nf.Insert;
    DBGrid4.SetFocus;
  end;
end;

procedure Tfrm_dde.btn_salvarClick(Sender: TObject);
var
  vConsisteCampos : Boolean;

  function ConsisteCampos : Boolean;
  begin
    Result := True;

    if gPermite_Altera_Reg_DDE<>'1' then
       if pgDDE.ActivePage=tabGlobais then begin
          if Trim(EditNumDespacho.Text) = '' then begin
            BoxMensagem(Format(cPreencherCampo,['Número do Despacho']),3);
            EditNumDespacho.SetFocus;
            Result := False;
            Exit;
          end;

          if Trim(dbedtDtDDE.Text) = '/  /' then begin
            BoxMensagem(Format(cPreencherCampo,['Data da DDE']),3);
            dbedtDtDDE.SetFocus;
            Result := False;
            Exit;
          end;
          if Trim(EditCPFDesp.Text) = '' then begin
            BoxMensagem(Format(cPreencherCampo,['Despachante']),3);
            EditCPFDesp.SetFocus;
            Result := False;
            Exit;
          end;
       end;

  end;

  procedure AtualizaDDE;
  begin
    if datm_dde.qry_dde.state in [dsInsert] then begin
      AtualizaHistoricoDDE('0',datm_dde.qry_dde.FieldByName('NR_SD').AsString);
      InsereEspec(datm_dde.qry_dde);
    end;
  end;
begin

  if (datm_dde.qry_dde.state in [dsInsert]) and
     (ConsultaLookUPSQL(' SELECT COUNT(*) QTD' +
                        ' FROM TRE_CAPA (NOLOCK) ' +
                        ' WHERE NR_PROCESSO = ''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''' ' +
                        '   AND NR_RE_SISCOMEX IS NOT NULL', 'QTD') = '0') and
     (MessageDlg('Não existe Registro de RE para este processo.'#13'Deseja continuar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    btn_cancelar.Click;
    Exit;
  end;

  vConsisteCampos := (Trim(EditNumDespacho.Text) <> '') or (Trim(dbedtDtDDE.Text) <> '/  /') or (Trim(EditCPFDesp.Text) <> '');

  if datm_dde.qry_dde.state in [dsEdit, dsInsert] then begin
    if vConsisteCampos then begin     //verifica se uns dos campos de registro da DDE está preenchido
      if ConsisteCampos then begin //força a digitação de todos os tres campos ref ao registro da DDE
        AtualizaDDE;
        datm_dde.qry_dde.Post;
        btn_co_processo.Enabled  := False;
      end else exit;
    end else begin
      AtualizaDDE;
      datm_dde.qry_dde.Post;
      btn_co_processo.Enabled  := False;
    end;

  end;
  if datm_dde.qry_dde_espec.state in [dsEdit, dsInsert] then
    datm_dde.qry_dde_espec.Post;

  if datm_dde.qry_dde_nf.state in [dsEdit, dsInsert] then
    datm_dde.qry_dde_nf.Post;

  if datm_dde.qry_dde_re.state in [dsEdit, dsInsert] then
    datm_dde.qry_dde_re.Post;

  if datm_dde.qry_dde.state in [dsEdit, dsInsert] then
    datm_dde.qry_dde.Post;

  pgDDEChange(nil);
  edt_nr_processo.ReadOnly := True;
end;

procedure Tfrm_dde.btn_cancelarClick(Sender: TObject);
begin
  datm_dde.qry_dde.Cancel;
  datm_dde.qry_dde_re.Cancel;
  btn_co_processo.Enabled  := False;
  edt_nr_processo.ReadOnly := True;
  pgDDE.ActivePageIndex := 0;
end;

procedure Tfrm_dde.btn_excluirClick(Sender: TObject);
begin
  if datm_dde.qry_ddeIN_FILA.AsString='1' then  begin
     Showmessage('Exclusão não permitida para DDE na Fila de Registro');
     exit;
  end;

  if datm_dde.qry_ddeNR_REGISTRO_SD.AsString<>'' then  begin
     Showmessage('Exclusão não permitida para DDE já Registrada');
     exit;
  end;

  if (pgDDE.ActivePage = tabLista) or (pgDDE.ActivePage = tabGlobais) then begin
    if MessageDlg('Deseja realmente excluir essa DDE ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      with TQuery.Create(Application) do begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        Sql.Add('DELETE TSD_NF ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde.qry_ddeNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_ESTAB_NF ');
        Sql.Add('   WHERE NR_PROCESSO = "' + datm_dde.qry_ddeNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_ESPEC ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde.qry_ddeNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_ESTAGIOS ');
        Sql.Add('   WHERE NR_PROCESSO = "' + datm_dde.qry_ddeNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_RE ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde.qry_ddeNR_SD.AsString + '"');

        ExecSQL;

        Free;
      end;
      datm_dde.qry_dde.Delete;
    end;

  end else if (pgDDE.ActivePage = tabComplementares) then begin
    if MessageDlg('Deseja realmente excluir essa Especie ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      datm_dde.qry_dde_espec.Delete;

  end else if (pgDDE.ActivePage = tabNF) then begin
    if MessageDlg('Deseja realmente excluir essa NF ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      datm_dde.qry_dde_nf.Delete;

  end;
end;

procedure Tfrm_dde.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_dde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_dde.Free;
  Action := caFree;
end;

procedure Tfrm_dde.FormShow(Sender: TObject);
begin
  EsconderAplicacao;
  pgDDE.ActivePage := tabLista;
  edt_nm_unidade.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', str_cd_unid_neg, 'AP_UNID_NEG');
  edt_cd_unidade.Text := str_cd_unid_neg;

  edt_cd_unidadeExit(edt_cd_unidade);

end;

procedure Tfrm_dde.btn_co_exportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_dde.qry_dde) then
      Exit;

    edt_cd_exportador.Text := ConsultaOnLineEx('TEMPRESA_NAC','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA');
    datm_dde.qry_dde.FieldByname('CD_EXPORTADOR').AsString := edt_cd_exportador.Text;
  end else begin
    edt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador.Text, 'NM_EMPRESA');
    edt_cnpj.Text          := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador.Text, 'CGC_EMPRESA');
  end;
end;

procedure Tfrm_dde.edt_cd_exportadorExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_dde.btn_co_urfdespachoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_dde.qry_dde) then
      Exit;

    edt_cd_urf_despacho.Text := ConsultaOnLineEx('TURF','URF',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO');
    datm_dde.qry_dde.FieldByname('CD_URF_DESPACHO').AsString := edt_cd_urf_despacho.Text;
  end else
    edt_nm_urf_despacho.Text := ConsultaLookUP('TURF', 'CODIGO', edt_cd_urf_despacho.Text, 'DESCRICAO');
end;

procedure Tfrm_dde.btn_co_urfembarqueClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_dde.qry_dde) then
      Exit;

    edt_cd_urf_embarque.Text := ConsultaOnLineEx('TURF','URF',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO');
    datm_dde.qry_dde.FieldByname('CD_URF_EMBARQUE').AsString := edt_cd_urf_embarque.Text;
  end else
    edt_nm_urf_embarque.Text := ConsultaLookUP('TURF', 'CODIGO', edt_cd_urf_embarque.Text, 'DESCRICAO');
end;

procedure Tfrm_dde.edt_cd_exportador2Change(Sender: TObject);
begin
  edt_nm_exportador2.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador2.Text, 'NM_EMPRESA');
  edt_cnpj2.Text          := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador2.Text, 'CGC_EMPRESA');
end;

procedure Tfrm_dde.edt_cd_exportador3Change(Sender: TObject);
begin
  edt_nm_exportador3.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador3.Text, 'NM_EMPRESA');
  edt_cnpj3.Text          := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador3.Text, 'CGC_EMPRESA');
end;

procedure Tfrm_dde.pgDDEChange(Sender: TObject);
begin
  if pgDDE.ActivePage = tabGlobais then begin
    datm_dde.qry_dde_re.Close;
    datm_dde.qry_dde_re.ParamByName('SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
    datm_dde.qry_dde_re.Prepare;
    datm_dde.qry_dde_re.Open;

  end else if pgDDE.ActivePage = tabComplementares then begin
    datm_dde.qry_dde_espec.Close;
    datm_dde.qry_dde_espec.ParamByName('SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
    datm_dde.qry_dde_espec.Prepare;
    datm_dde.qry_dde_espec.Open;
    frm_dde.AtualizaQtTotalVolumes;
    if (datm_dde.qry_dde.state in [dsEdit, dsInsert]) then
      datm_dde.qry_dde.Post;

  end else if pgDDE.ActivePage = tabNF then begin
    datm_dde.qry_dde_estab.Close;
    datm_dde.qry_dde_estab.ParamByName('NR_SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
    datm_dde.qry_dde_estab.Prepare;
    datm_dde.qry_dde_estab.Open;
    datm_dde.qry_dde_nf.Close;
    datm_dde.qry_dde_nf.Prepare;
    datm_dde.qry_dde_nf.Open;
  end;
  BtnGeraArquivo.Enabled      := (pgDDE.ActivePage = tabLista);
  BtnConsultaSiscomex.Enabled := (pgDDE.ActivePage = tabLista);
  BtnConsultaFila.Enabled     := (pgDDE.ActivePage = tabLista);
end;

procedure Tfrm_dde.BtnConsultaSiscomexClick(Sender: TObject);
begin
  LimpaCampoSituacaoDDE;
  Application.CreateForm(Tfrm_historico_dde, frm_historico_dde);
  frm_historico_dde.qry_dde_estagios.Params[0].AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
  frm_historico_dde.ShowModal;
end;

procedure Tfrm_dde.pgDDEChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ( pgDDE.ActivePage = tabGlobais ) then begin
    AllowChange := not (datm_dde.qry_dde_re.state in [dsEdit, dsInsert]);
    if allowChange then
       AllowChange := not (datm_dde.qry_dde.state in [dsEdit, dsInsert]);
  end
  else if ( pgDDE.ActivePage = tabComplementares ) then
    AllowChange := not (datm_dde.qry_dde_espec.state in [dsEdit, dsInsert])
  else if ( pgDDE.ActivePage = tabNF ) then
    AllowChange := not (datm_dde.qry_dde_nf.state in [dsEdit, dsInsert]);
  if not AllowChange then
    MessageDlg('Você está com o GRID em modo de edição. Favor gravar antes de mudar de guia.', mtInformation, [mbOk], 0);

end;

procedure Tfrm_dde.btn_co_viatransporteClick(Sender: TObject);
begin

  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_dde.qry_dde) then
      Exit;

    edt_cd_via_transporte.Text := ConsultaOnLineEx('TVIA_TRANSPORTE','Vias de Transporte',['CD_VIA_TRANSPORTE','NM_VIA_TRANSPORTE'],['Código','Descrição'],'CD_VIA_TRANSPORTE');
    datm_dde.qry_dde.FieldByname('CD_VIA_TRANSPORTE').AsString := edt_cd_via_transporte.Text;
  end else
    edt_nm_via_transporte.Text := ConsultaLookUP('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', edt_cd_via_transporte.Text, 'NM_VIA_TRANSPORTE');

end;

procedure Tfrm_dde.edt_cd_via_transporte2Change(Sender: TObject);
begin
  edt_nm_via_transporte2.Text := ConsultaLookUP('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', edt_cd_via_transporte2.Text, 'NM_VIA_TRANSPORTE');
end;

procedure Tfrm_dde.SpeedButton10Click(Sender: TObject);
var
  vProcessoReAux : string;
begin
  vProcessoReAux :=
    ConsultaOnLineExSQL('SELECT RC.NR_PROCESSO AS NR_PROCESSO, RC.DT_DATA_RE, RC.CD_IMPORTADOR, ' +
                        '       RC.NR_RE_SISCOMEX,  MIN(RA.CD_RE_ANEXO) INICIAL, MAX(RA.CD_RE_ANEXO) FINAL, ' +
                        '       SUM(ISNULL(RA.PESO_LIQUIDO,0)) AS PESO_LIQUIDO, ' +
                        '       SUM(ISNULL(RA.VL_COND_VENDA,0)) AS VL_COND_VENDA ' +
                        '  FROM TRE_CAPA RC (NOLOCK), TRE_ANEXO RA  (NOLOCK) ' +
                        ' WHERE RC.CD_EXPORTADOR = ''' + edt_cd_exportador.Text + '''' +
                        '   AND RC.NR_PROCESSO *= RA.NR_PROCESSO ' +
                        '   AND ISNULL(RC.NR_RE_SISCOMEX,"")<>"" ' +
                        ' GROUP BY RC.NR_PROCESSO,  RC.DT_DATA_RE, RC.CD_IMPORTADOR, RC.NR_RE_SISCOMEX ',
                        'Selecione o RE que deseja incluir.',
                        ['NR_PROCESSO','DT_DATA_RE','CD_IMPORTADOR', 'NR_RE_SISCOMEX', 'INICIAL', 'FINAL' , 'PESO_LIQUIDO', 'VL_COND_VENDA'],
                        ['Processo','Data','Importador', 'Numero RE', 'Anexo Inicial', 'Anexo Final', 'Peso Liquido', 'Condição Venda'],'NR_RE_SISCOMEX');
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT NR_PROCESSO_RE');
    SQL.Add('  FROM TSD_RE (NOLOCK)');
    SQL.Add(' WHERE NR_SD = ''' + datm_dde.qry_dde.FieldByName('NR_SD').AsString + '''');
    SQL.Add('   AND NR_RE_SISCOMEX = ''' + vProcessoReAux + '''');
    Open;
    if not IsEmpty then begin
      MessageDlg('RE já informado !!!', mtInformation, [mbOk], 0);
      Close;
      Free;       
    end else begin
      Close;
      Free;
      with TQuery.Create(application) do begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT RC.NR_PROCESSO, RC.NR_RE_SISCOMEX,');
        SQL.Add('       SUM(ISNULL(RA.PESO_LIQUIDO,0)) AS PESO_LIQUIDO,');
        SQL.Add('       SUM(ISNULL(RA.VL_COND_VENDA,0)) AS VL_COND_VENDA,');
        SQL.Add('       MIN(RA.CD_RE_ANEXO) INICIAL, MAX(RA.CD_RE_ANEXO) FINAL');
        SQL.Add('FROM   TRE_CAPA RC (NOLOCK), TRE_ANEXO RA (NOLOCK)');
        SQL.Add('WHERE  RC.NR_RE_SISCOMEX = ''' + vProcessoReAux + '''');
        SQL.Add('  AND  RA.NR_PROCESSO = RC.NR_PROCESSO');
        SQL.Add('GROUP BY RC.NR_PROCESSO, RC.NR_RE_SISCOMEX');
        Open;
        if not eof then begin
           datm_dde.qry_dde_re.Insert;
           datm_dde.qry_dde_re.FieldByName('NR_PROCESSO_RE').AsString       := vProcessoReAux;
           datm_dde.qry_dde_re.FieldByName('NR_RE_SISCOMEX').AsString       := Fields[1].AsString;
           datm_dde.qry_dde_re.FieldByName('VL_SOMA_PESO_LIQUIDO').AsFloat  := Fields[2].AsFloat;
           datm_dde.qry_dde_re.FieldByName('VL_SOMA_COND_VENDA').AsFloat    := Fields[3].AsFloat;
           datm_dde.qry_dde_re.FieldByName('NR_ANEXO_INICIAL').AsString     := copy('000',1,3-length(Fields[4].AsString)) + Fields[4].AsString;
           datm_dde.qry_dde_re.FieldByName('NR_ANEXO_FINAL').AsString       := copy('000',1,3-length(Fields[5].AsString)) + Fields[5].AsString;
           datm_dde.qry_dde_re.Post;
        end;
        // Somando os valores na DDE
        Close;
        Free;
      end;
    end;
  end;
end;

procedure Tfrm_dde.AtualizaValoresDDE;
begin
  PoeEmEdicao(datm_dde.qry_dde);
  datm_dde.qry_dde.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat := 0;
  datm_dde.qry_dde.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   := 0;
  with TQuery.Create(application) do begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SUM(ISNULL(RA.VL_SOMA_PESO_LIQUIDO,0)) AS PESO_LIQUIDO,');
    SQL.Add('       SUM(ISNULL(RA.VL_SOMA_COND_VENDA,0)) AS VL_COND_VENDA');
    SQL.Add('FROM   TSD_RE RA (NOLOCK)');
    SQL.Add('WHERE  RA.NR_SD = ''' + datm_dde.qry_dde_re.FieldByName('NR_SD').AsString + '''');
    Open;
    datm_dde.qry_dde.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat := datm_dde.qry_dde.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat + Fields[0].AsFloat;
    datm_dde.qry_dde.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   := datm_dde.qry_dde.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   + Fields[1].AsFloat;
    Close;
    Free;
  end;
end;

procedure Tfrm_dde.AtualizaQtTotalVolumes;
begin
  PoeEmEdicao(datm_dde.qry_dde);
  with TQuery.Create(application) do begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SUM(ISNULL(RA.QT_ESPECIE,0))');
    SQL.Add('FROM   TSD_ESPEC RA (NOLOCK)');
    SQL.Add('WHERE  RA.NR_SD = ''' + datm_dde.qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    datm_dde.qry_dde.FieldByName('QT_TOTAL_VOLUMES').AsFloat := Fields[0].AsFloat;
    Close;
    Free;
  end;
end;

procedure Tfrm_dde.SpeedButton13Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esse R.E. da DDE ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    datm_dde.qry_dde_re.Delete;
    AtualizaValoresDDE;
  end;
end;

procedure Tfrm_dde.edt_cd_urf_despacho2Change(Sender: TObject);
begin
  edt_nm_urf_despacho2.Text := ConsultaLookUP('TURF', 'CODIGO', edt_cd_urf_despacho2.Text, 'DESCRICAO');
end;

procedure Tfrm_dde.edt_cd_urf_embarque2Change(Sender: TObject);
begin
  edt_nm_urf_embarque2.Text := ConsultaLookUP('TURF', 'CODIGO', edt_cd_urf_embarque2.Text, 'DESCRICAO');
end;

procedure Tfrm_dde.btn_incluir_estabClick(Sender: TObject);
begin
  if not PodeIncluirEstabelecimento then begin
    MessageDlg('A quantidade de Estabelecimentos cadastrados, já é igual a informada na DDE.', mtInformation, [mbOK], 0);
    exit;
  end;
  datm_dde.qry_dde_estab.Insert;
  edtSufixoCGC.ReadOnly := False;
  edtSufixoCGC.SetFocus;
end;

function Tfrm_dde.PodeIncluirEstabelecimento : Boolean;
begin
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(NR_ESTABELECIMENTO) FROM TSD_ESTAB_NF (NOLOCK) WHERE NR_PROCESSO = ''' + datm_dde.qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    if pnlEstabelecimentos.Visible then
      Label48.Caption := Copy('00',1,2-Length(Fields[0].AsString)) + Fields[0].AsString;

    Result := True;
    if Fields[0].AsInteger = datm_dde.qry_dde.FieldByName('QT_ESTAB_DESPACHO').AsInteger then
      Result := False;

    Close;
    Free;
  end;
end;

procedure Tfrm_dde.btn_salvar_estabClick(Sender: TObject);
begin
  datm_dde.qry_dde_estab.Post;
  frm_dde.pnlEstabelecimentos.Visible := frm_dde.PodeIncluirEstabelecimento;
  edtSufixoCGC.ReadOnly := True;
end;

procedure Tfrm_dde.btn_cancelar_estabClick(Sender: TObject);
begin
  datm_dde.qry_dde_estab.Cancel;
  edtSufixoCGC.ReadOnly := True;
end;

procedure Tfrm_dde.btn_excluir_estabClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esse Estabelecimento da DDE ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    try
      with TQuery.Create(Application) do begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        Sql.Add('DELETE TSD_NF ');
        Sql.Add('   WHERE NR_SD = "' + datm_dde.qry_dde_estabNR_PROCESSO.AsString + '"');
        Sql.Add('   AND NR_ESTABELECIMENTO = "' + datm_dde.qry_dde_estabNR_ESTABELECIMENTO.AsString + '"');
        Sql.Add('DELETE TSD_ESTAB_NF ');
        Sql.Add('   WHERE NR_PROCESSO = "' + datm_dde.qry_dde_estabNR_PROCESSO.AsString + '"');
        Sql.Add('   AND NR_ESTABELECIMENTO = "' + datm_dde.qry_dde_estabNR_ESTABELECIMENTO.AsString + '"');
        ExecSQL;
        Free;
      end;
      frm_dde.pnlEstabelecimentos.Visible := frm_dde.PodeIncluirEstabelecimento;
      datm_dde.qry_dde_estab.Close;
      datm_dde.qry_dde_nf.Close;
      datm_dde.qry_dde_estab.open;
      datm_dde.qry_dde_nf.open;

    except

    end;
  end;
end;

procedure Tfrm_dde.edt_cnpj3Change(Sender: TObject);
begin
  mkedt_cnpj.Text := Copy(Edt_cnpj3.Text,1,8)
end;

procedure Tfrm_dde.BtnGeraArquivoClick(Sender: TObject);
var
  vFileName, strSpace : string;
  PoeNaFila :Boolean;
  i:Integer;
begin

  Captura_Telas.Visible:=False;

  if frm_dde.gridDDE.SelectedRows.Count < 1 then begin
    MessageDlg('Selecione um processo na listagem, para que seja registrada a DDE.', mtInformation, [mbOK], 0);
    Exit;
  end;

  { Consiste e armazena na fila as DDEs à serem registradas via MyExportViewer - Carlos Alberto 10/12/2008 }

  //abre a Tabela da Fila de DDEs
  if datm_dde.qry_fila_exp.Active=false then
     datm_dde.qry_fila_exp.Open;


  { <--- Abertura das Querys dependentes ---> }

  { para consistir RE }
  datm_dde.qry_dde_re.Close;
  datm_dde.qry_dde_re.ParamByName('SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_re.Prepare;
  datm_dde.qry_dde_re.Open;

  { para consistir Volumes }
  datm_dde.qry_dde_espec.Close;
  datm_dde.qry_dde_espec.ParamByName('SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_espec.Prepare;
  datm_dde.qry_dde_espec.Open;

  { para consistir Estabelecimento }
  datm_dde.qry_dde_estab.Close;
  datm_dde.qry_dde_estab.ParamByName('NR_SD').AsString := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde_estab.Prepare;
  datm_dde.qry_dde_estab.Open;

  { para consistir NF }
  datm_dde.qry_dde_nf.Close;
  datm_dde.qry_dde_nf.Prepare;
  datm_dde.qry_dde_nf.Open;

  { ---> fim da Abertura das Querys Dependentes <--- }

  strSpace:=replicate(' ',18);
  Captura_Telas.Lines.Clear;
  Captura_Telas.Lines.Add('* * *   FORAM ENCONTRADAS DIVERGÊNCIAS   * * *' );
  Captura_Telas.Lines.Add('');
  Captura_Telas.Lines.Add('Nr. PROCESSO          DESCRIÇÃO DA DIVERGÊNCIA' );
  gridDDE.DataSource.DataSet.DisableControls;
  for i:=0 to gridDDE.SelectedRows.Count-1 do begin
     gridDDE.DataSource.DataSet.GotoBookmark(pointer(gridDDE.SelectedRows.Items[i]));
     //
     PoeNaFila:=True;
     if PodeIncluirEstabelecimento then  begin
       Captura_Telas.Lines.Add(datm_dde.qry_ddeNR_SD_REDUZIDO.AsString+strSpace+'Existem inconsistencias no preenchimento' );
       PoeNaFila:=false;
     end;
     vFileName := copy(StringReplace(datm_dde.qry_ddeNR_SD.AsString,'-','',[rfReplaceAll]),5,6);

     if Trim(vFileName) = '' then begin
        Captura_Telas.Lines.Add('Sem Numero de Processo' );
        PoeNaFila:=false;
     end;

     if datm_dde.qry_ddeNR_REGISTRO_SD.AsString<>'' then begin
       Captura_Telas.Lines.Add(datm_dde.qry_ddeNR_SD_REDUZIDO.AsString+strSpace+'Já Registrada' );
       PoeNaFila:=false;
     end;

     if datm_dde.qry_ddeIN_FILA.AsString='1' then begin
       Captura_Telas.Lines.Add(datm_dde.qry_ddeNR_SD_REDUZIDO.AsString+strSpace+'Já está na Fila' );
       PoeNaFila:=false;
     end;

     if datm_dde.qry_dde_espec.RecordCount=0 then begin
       Captura_Telas.Lines.Add('Inclusão de volumes em Dados Complementares está sem dados !!!' );
       PoeNaFila:=false;
     end;

     if trim(datm_dde.qry_ddeTX_IDENT_VEIC_TRANSP.AsString)='' then begin
       Captura_Telas.Lines.Add('"Identificador do Veículo Transportador" em dados complementares Não informado !!!' );
       PoeNaFila:=false;
     end;


     if datm_dde.qry_dde_nf.RecordCount=0 then begin
       Captura_Telas.Lines.Add('Inclusão de NF Inicial e Final em Notas Fiscais está sem dados !!!' );
       PoeNaFila:=false;
     end else begin
       datm_dde.qry_dde_nf.First;
       while not(datm_dde.qry_dde_nf.Eof) do begin
          if datm_dde.qry_dde_nf.FieldByName('NR_NF_INICIAL').asInteger > datm_dde.qry_dde_nf.FieldByName('NR_NF_FINAL').asInteger then begin
             Captura_Telas.Lines.Add('NF Inicial ( '+datm_dde.qry_dde_nf.FieldByName('NR_NF_INICIAL').AsString +' ) não pode ser maior que a NF final ( '+datm_dde.qry_dde_nf.FieldByName('NR_NF_FINAL').AsString+' ) !!!' );
             PoeNaFila:=false;
          end;

          if length(datm_dde.qry_dde_nf.FieldByName('NR_NF_INICIAL').AsString)>8 then begin
             Captura_Telas.Lines.Add('NF Inicial ( '+datm_dde.qry_dde_nf.FieldByName('NR_NF_INICIAL').AsString +' ) - quantidade maxima de digitos ultrapassou a 8 posições !!!' );
             PoeNaFila:=false;
          end;

          if length(datm_dde.qry_dde_nf.FieldByName('NR_NF_FINAL').AsString)>8 then begin
             Captura_Telas.Lines.Add('NF Final ( '+datm_dde.qry_dde_nf.FieldByName('NR_NF_FINAL').AsString +' ) - quantidade maxima de digitos ultrapassou a 8 posições !!!' );
             PoeNaFila:=false;
          end;

          if length(datm_dde.qry_dde_nf.FieldByName('NR_SERIE_NF').AsString)>2 then begin
             Captura_Telas.Lines.Add('Numero de Serie NF - quantidade maxima de digitos ultrapassou a 2 posições !!!' );
             PoeNaFila:=false;
          end;

          if (datm_dde.qry_dde_nf.FieldByName('NR_NF_FINAL').asInteger - datm_dde.qry_dde_nf.FieldByName('NR_NF_INICIAL').asInteger)>999 then begin
             Captura_Telas.Lines.Add('Faixa de NFs Invalidas - Maximo permitido: 999 Notas Fiscais por Serie !!!' );
             PoeNaFila:=false;
          end;

          datm_dde.qry_dde_nf.Next;
       end;
     end;


     if datm_dde.qry_dde_estab.RecordCount=0 then begin
       Captura_Telas.Lines.Add('Informação de Estabelecimento em Notas Fiscais está sem dados !!!' );
       PoeNaFila:=false;
     end;

     { <--- inicio - consiste RE ---> }
     if copy(datm_dde.qry_dde_reNR_RE_SISCOMEX.asString,3,1)<>'/' then begin
       Captura_Telas.Lines.Add('O Numero do RE em Dados Globais está sem a Barra na terceira posição !!!' );
       PoeNaFila:=false;
     end;

     if copy(datm_dde.qry_dde_reNR_RE_SISCOMEX.asString,11,1)<>'-' then begin
       Captura_Telas.Lines.Add('O Numero do RE em Dados Globais está sem Hifen Separador !!!' );
       PoeNaFila:=false;
     end;

     if length(datm_dde.qry_dde_reNR_RE_SISCOMEX.asString)<>14 then begin
       Captura_Telas.Lines.Add('O Numero do RE em Dados Globais está com o Tamanho incorreto !!!' );
       PoeNaFila:=false;
     end;

     if trim(datm_dde.qry_dde_reNR_ANEXO_INICIAL.asString)='' then begin
       Captura_Telas.Lines.Add('O Numero Inicial do RE está em branco !!!' );
       PoeNaFila:=false;
     end;

     if trim(datm_dde.qry_dde_reNR_ANEXO_FINAL.asString)='' then begin
       Captura_Telas.Lines.Add('O Numero Final do RE está em branco !!!' );
       PoeNaFila:=false;
     end;

     if trim(datm_dde.qry_ddeCD_VIA_TRANSPORTE.asString)='' then begin
       Captura_Telas.Lines.Add('Via de Transporte (Dados Globais) não informada !!!' );
       PoeNaFila:=false;
     end;

     { ---> fim - consiste RE <--- }


     { Verifica se existe algum despachante para este exportador }
     with TQuery.Create(Application) do begin
       DataBaseName := 'DBBROKER';
       SQL.Clear;
       Sql.Add(' select count(1) FROM TDESPACHANTE_CLIENTE (NOLOCK) ');
       Sql.Add(' WHERE TIPO="DDE" AND CD_EMPRESA= :CD_EMPRESA ');
       paramByName('CD_EMPRESA').AsString:= datm_dde.qry_ddeCD_EXPORTADOR.AsString;
       prepare;
       open;
       if fields[0].asInteger=0 then begin
          Captura_Telas.Lines.Add(edt_nr_processo.text+'          Não Existe Despachante(s) Habilitado(s) para este Cliente !!!' );
          PoeNaFila:=false;
       end;
       close;
       Free;
     end;

     { Verifica se existe o Processo em TPROCESSO }
     with TQuery.Create(Application) do begin
       DataBaseName := 'DBBROKER';
       SQL.Clear;
       Sql.Add('select count(1) FROM TPROCESSO (NOLOCK) ');
       Sql.Add('   WHERE NR_PROCESSO = :NR_PROCESSO');
       paramByName('NR_PROCESSO').AsString:= datm_dde.qry_ddeNR_SD.AsString;
       prepare;
       open;
       if recordCount=0 then begin
          Captura_Telas.Lines.Add('O Processo não Existe !!!' );
          PoeNaFila:=false;
       end;
       close;
       Free;
     end;

     if PoeNaFila then begin
        datm_dde.qry_fila_exp.Append;
        datm_dde.qry_fila_expNR_PROCESSO.AsString := datm_dde.qry_ddeNR_SD.AsString;
        datm_dde.qry_fila_expCD_USUARIO.AsString  := str_cd_usuario;
        datm_dde.qry_fila_exp.Post;
        //
        { marca DDE como estando na fila }
        datm_dde.qry_dde.Edit;
        datm_dde.qry_ddeIN_FILA.AsString:='1';
        datm_dde.qry_dde.Post;
        //
        LimpaCampoSituacaoDDE;
     end;

  end;
  gridDDE.DataSource.DataSet.EnableControls;
  if Captura_Telas.Lines.Count>3 then
     Captura_Telas.Visible:=True;


end;

procedure Tfrm_dde.btn_co_processoClick(Sender: TObject);
var
  nr_processo : string;
begin
  nr_processo :=
    ConsultaOnLineExSQL(' SELECT SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, ' +
                        '        CD_CLIENTE, ' +
                        '        (SELECT AP_EMPRESA FROM TEMPRESA_NAC CL (NOLOCK) WHERE CL.CD_EMPRESA = P.CD_CLIENTE) AS NM_CLIENTE, ' +
                        '        P.CD_SERVICO, ' +
                        '        ISNULL(SN.NM_SERVICO, S.NM_SERVICO) AS NM_SERVICO, ' +
                        '        DT_ABERTURA, ' +
                        '        CD_EMBARCACAO, ' +
                        '        (SELECT NM_EMBARCACAO FROM TEMBARCACAO EB (NOLOCK) WHERE EB.CD_EMBARCACAO = P.CD_EMBARCACAO) AS NM_EMBARCACAO, ' +
                        '        NR_CONHECIMENTO, ' +
                        '        NR_CONHECIMENTO_MASTER, ' +
                        '        NR_DI, ' +
                        '        NR_MANIFESTO, ' +
                        '        NR_REFERENCIA ' +
                        ' FROM TPROCESSO P (NOLOCK) ' +
                        '    LEFT JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ' +
                        '    LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON CONVERT(VARCHAR, SN.CD_SERVICO) = P.CD_SERVICO ' +
                        ' WHERE CD_UNID_NEG = "' + edt_cd_unidade.Text + '" ' +
                        '   AND CD_PRODUTO = "02" ' +
                        '   AND IN_CANCELADO = "0"','Manutenção do Processo',
                        ['NR_PROCESSO' ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_SERVICO'  ,'NM_SERVICO','DT_ABERTURA', 'CD_EMBARCACAO'  ,'NM_EMBARCACAO','NR_CONHECIMENTO' ,'NR_CONHECIMENTO_MASTER' ,'NR_DI','NR_MANIFESTO', 'NR_REFERENCIA' ],
                        ['Nr. Processo','Cod. Cliente','Cliente'   ,'Cod. Serviço','Serviço'   ,'Data de Abertura','Cod. Embarcação','Embarcação'   ,'Nr. Conhecimento','Nr. Conhecimento Master','DI'   ,'Nr. Manifesto', 'Nr. da Referência'],
                        'NR_PROCESSO');
  datm_dde.qry_dde.FieldByName('NR_SD').AsString := edt_cd_unidade.Text + '02' + nr_processo;//edt_nr_processo.Text;
  datm_dde.qry_dde.FieldByName('NR_SD_REDUZIDO').AsString :=  nr_processo;
  edt_nr_processoExit(nil);
end;

procedure Tfrm_dde.edt_nr_processoExit(Sender: TObject);
var
vExiste_Processo:Boolean;
begin
  if not(datm_dde.qry_dde.state in [dsEdit, dsInsert]) then
    Exit;

  with datm_dde do
  begin
    vExiste_Processo:=True;
    if Trim(edt_nr_processo.Text) <> '' then
    begin
      SetServicoNovo(edt_cd_unidade.Text + '02' + edt_nr_processo.Text, datm_dde);

      { Verifica se existe o Processo em TPROCESSO }
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT P.VL_PESO_LIQUIDO, P.VL_PESO_BRUTO, S.CD_VIA_TRANSPORTE');
        SQL.Add('FROM TPROCESSO P (NOLOCK)');
        SQL.Add('   JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ');
        SQL.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
        ParamByName('NR_PROCESSO').AsString:= edt_cd_unidade.Text + '02' + edt_nr_processo.Text; //edt_nr_processo.Text;
        Prepare;
        Open;

        if recordcount<>0 then
        begin
          if datm_dde.qry_ddeCD_VIA_TRANSPORTE.AsString = '' then
            datm_dde.qry_ddeCD_VIA_TRANSPORTE.AsString := FieldByName('CD_VIA_TRANSPORTE').AsString;

          if datm_dde.qry_ddeVL_TOTAL_PESO_BRUTO.AsFloat = 0 then
            datm_dde.qry_ddeVL_TOTAL_PESO_BRUTO.AsFloat := FieldByName('VL_PESO_BRUTO').AsFloat;
        end
        else
          vExiste_Processo:=false;

        Close;
        Free;
      end;

      if not vExiste_Processo then
      begin
        ShowMessage('Processo Inexistente !!!!');
        pgDDE.ActivePageIndex:=0;
        qry_dde.Cancel;
        Exit;
      end;


      qry_dde.FieldByName('NR_SD').AsString := edt_cd_unidade.Text + '02' + edt_nr_processo.Text;
      qry_dde.FieldByName('NR_SD_REDUZIDO').AsString :=  edt_nr_processo.Text;
      Manutencao2DDE(qry_dde);
      NotasFiscais;
      btn_co_processo.Enabled  := False;
      edt_nr_processo.ReadOnly := True;
      btn_salvar.Click;
    end
    else
      edt_nr_processo.SetFocus;
  end;
end;

procedure Tfrm_dde.NotasFiscais;
var
  vQryNotas : TQuery;
  vPrimeiraNota, vUltimaNota, vSerie : string;
begin
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('INSERT INTO TSD_ESTAB_NF VALUES (''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''',''01'',''' + Copy(ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador2.Text, 'CGC_EMPRESA'),9,6) + ''')');
    ExecSQL;
    vQryNotas := TQuery.Create(Application);
    vQryNotas.Databasename := 'DBBROKER';
    vQryNotas.SQL.Clear;
    vQryNotas.SQL.Add('SELECT NR_NF, NF_SERIE FROM TPROCESSO_EXP_NF (NOLOCK) WHERE NR_PROCESSO = ''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''' ORDER BY LEN(NR_NF), NR_NF');
    vQryNotas.Open;
    vQryNotas.First;
    vPrimeiraNota := vQryNotas.FieldByName('NR_NF').AsString;
    vUltimaNota   := vPrimeiraNota;
    vSerie        := vQryNotas.FieldByName('NF_SERIE').AsString;
    vQryNotas.Next;
    if not vQryNotas.EOF then
      while not vQryNotas.EOF do
      begin
        if StrToInt(vUltimaNota) < vQryNotas.FieldByName('NR_NF').AsInteger - 1 then
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO TSD_NF (NR_SD,NR_NF_INICIAL,NR_NF_FINAL,NR_SERIE_NF,DT_DATA,CD_USUARIO,NR_ESTABELECIMENTO)');
          //SQL.Add('VALUES (''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''',''' + vPrimeiraNota + ''',''' + vUltimaNota + ''',''' + vQryNotas.FieldByName('NF_SERIE').AsString + ''',NULL,NULL,''01'')');
          // Comentado acima e utilizando abaixo porque gerava SERIE igual para a NF seguinte - Michel - 12/04/2012
          SQL.Add('VALUES (''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''',''' + vPrimeiraNota + ''',''' + vUltimaNota + ''',''' + vSerie + ''',NULL,NULL,''01'')');
          ExecSQL;
          vPrimeiraNota := vQryNotas.FieldByName('NR_NF').AsString;
          vUltimaNota   := vPrimeiraNota;
          vSerie        := vQryNotas.FieldByName('NF_SERIE').AsString;
        end
        else
          vUltimaNota   := vQryNotas.FieldByName('NR_NF').AsString;

        vQryNotas.Next;
        if vQryNotas.EOF then
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO TSD_NF (NR_SD,NR_NF_INICIAL,NR_NF_FINAL,NR_SERIE_NF,DT_DATA,CD_USUARIO,NR_ESTABELECIMENTO)');
          //SQL.Add('VALUES (''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''',''' + vPrimeiraNota + ''',''' + vUltimaNota + ''',''' + vQryNotas.FieldByName('NF_SERIE').AsString + ''',NULL,NULL,''01'')');
          // Comentado acima e utilizando abaixo porque gerava SERIE igual para a NF seguinte - Michel - 12/04/2012
          SQL.Add('VALUES (''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''',''' + vPrimeiraNota + ''',''' + vUltimaNota + ''',''' + vSerie + ''',NULL,NULL,''01'')');
          ExecSQL;
        end;
      end
    // IF e ELSE incluidos para incluir também se houver apenas uma nota - Michel - 12/04/2012
    else
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO TSD_NF (NR_SD,NR_NF_INICIAL,NR_NF_FINAL,NR_SERIE_NF,DT_DATA,CD_USUARIO,NR_ESTABELECIMENTO)');
      SQL.Add('            VALUES (''' + edt_cd_unidade.Text + '02' + edt_nr_processo.Text + ''',''' + vPrimeiraNota + ''',''' + vUltimaNota + ''',''' + vSerie + ''',NULL,NULL,''01'')');
      ExecSQL;
    end;


    vQryNotas.Close;
    vQryNotas.Free;
    Free;
  end;
end;

procedure Tfrm_dde.edt_cd_unidadeExit(Sender: TObject);

begin
  if edt_cd_unidade.Modified or not(datm_dde.qry_dde.Active) then begin
     CompletaZerosEsq(TEdit(Sender));


     gNR_SD:=datm_dde.qry_ddeNR_SD.AsString;
     datm_dde.qry_dde.Close;
     datm_dde.qry_dde.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
     datm_dde.qry_dde.Prepare;
     datm_dde.qry_dde.Open;

  end;




end;

procedure Tfrm_dde.btn_co_unidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then  begin
    edt_cd_unidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG','AP_UNID_NEG'],['Código','Nome','Apelido'],'CD_UNID_NEG');
    edt_cd_unidadeExit(edt_cd_unidade);
  end else
    edt_nm_unidade.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_cd_unidade.Text, 'AP_UNID_NEG');

end;

procedure Tfrm_dde.edt_cd_unidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F5 then  begin
         if Sender = edt_cd_unidade        then btn_co_unidadeClick(btn_co_unidade)
    else if Sender = edt_nr_processo       then btn_co_processoClick(btn_co_processo)
    else if Sender = edt_cd_exportador     then btn_co_exportadorClick(btn_co_exportador)
    else if Sender = edt_cd_via_transporte then btn_co_viatransporteClick(btn_co_viatransporte)
    else if Sender = edt_cd_urf_despacho   then btn_co_urfdespachoClick(btn_co_urfdespacho)
    else if Sender = edt_cd_urf_embarque   then btn_co_urfembarqueClick(btn_co_urfembarque)
    else if Sender = EditCPFDesp           then btnDespClick(btnDesp);
  end;
end;

procedure Tfrm_dde.FormCreate(Sender: TObject);
begin
  gNR_SD:='';
  Shape3.Brush.Color  := clMenuBroker;
  Shape4.Brush.Color  := clMenuBroker;
  Shape5.Brush.Color  := clMenuBroker;
  Shape18.Brush.Color := clPnlClaroBroker;
  Shape6.Brush.Color  := clPnlClaroBroker;
  Shape15.Brush.Color := clPnlClaroBroker;
  Shape16.Brush.Color := clPnlClaroBroker;
  Shape8.Brush.Color  := clPnlClaroBroker;
  Shape22.Brush.Color := clPnlClaroBroker;

  a_str_indices[0] := 'NR_SD_REDUZIDO DESC';//'NR_PROCESSO ASC';
  a_str_indices[1] := 'NR_REGISTRO_SD DESC';
  a_str_indices[2] := 'NomeExportador ASC';
  a_str_indices[3] := 'DT_DATA_SD DESC';
  with cb_ordem do begin
    Clear;
    Items.Add( 'Nr. Processo' );
    Items.Add( 'Número do Registro' );
    Items.Add( 'Exportador' );
    Items.Add( 'Data do Registro' );
    ItemIndex := 0;
  end;

  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';

    //comentado por Carlos em 22/03/2010
//    SQL.CLear;
//    SQL.Add('UPDATE TSD SET IN_SELECIONADO = "0"');
//    ExecSQL;

    //Verifica se o usuario tem permissão para alterar o numero do Despacho
    SQL.CLear;
    SQL.Add(' select IN_PERMITE_ALTERA_REG_DDE from TUSUARIO (NOLOCK) ');
    SQL.Add(' where CD_USUARIO= :CD_USUARIO ');
    ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    Open;
    gPermite_Altera_Reg_DDE:=Fields[0].AsString;
    close;
    Free;
  end;
  
end;

procedure Tfrm_dde.gridDDEDblClick(Sender: TObject);
//var
//  vStatus, posicao : string;
begin
{
  with TQuery.Create(Application) do  begin
    if (datm_dde.qry_dde.FieldByName('IN_SELECIONADO').AsString = '1') then
      vStatus := '0'
    else
      vStatus := '1';

    DatabaseName := 'DBBROKER';
    SQL.CLear;
    SQL.Add('UPDATE TSD SET IN_SELECIONADO = ' + QuotedStr(vStatus) + ' WHERE NR_SD = ' + QuotedStr(datm_dde.qry_dde.FieldByName('NR_SD').AsString));
    ExecSQL;
    Free;
  end;
  Posicao := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
  datm_dde.qry_dde.DisableControls;
  datm_dde.qry_dde.Close;
  datm_dde.qry_dde.Open;
  datm_dde.qry_dde.Locate('NR_SD',posicao,[]);
  datm_dde.qry_dde.EnableControls;
}
end;

procedure Tfrm_dde.cb_ordemClick(Sender: TObject);
begin
  edt_chave.Clear;
  edt_chave.Setfocus;
end;

procedure Tfrm_dde.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_dde.qry_dde, edt_chave.Text, copy(a_str_indices[cb_ordem.ItemIndex],0,length(a_str_indices[cb_ordem.ItemIndex])-4) );
end;

procedure Tfrm_dde.dbedtDtDDEExit(Sender: TObject);
begin
  if trim(dbedtDtDDE.Text) = '/  /' then
    if datm_dde.qry_dde.State in [dsInsert, dsEdit] then
      datm_dde.qry_ddeDT_DATA_SD.AsVariant := Null;
end;

procedure Tfrm_dde.btnDespClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_dde.qry_dde) then
      Exit;

    //troca da tabela TACESSO_SCX_EXP pela view VW_DESPACHANTE_CLIENTE - carlos 17/09/2009
    EditCPFDesp.Text := ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE','Escolha o Usuário',['CD_ACESSO','NM_USUARIO','CPF_USUARIO'],['Código','Usuário','CPF'],'CPF_USUARIO','TIPO="DDE" AND CD_EMPRESA="'+datm_dde.qry_ddeCD_EXPORTADOR.AsString +'"' , nil,'' );
  end else
    EditDesp.Text    := ConsultaLookupSQL('SELECT NM_USUARIO FROM VW_DESPACHANTE_CLIENTE WHERE TIPO="DDE" and CD_EMPRESA="'+datm_dde.qry_ddeCD_EXPORTADOR.AsString+'" AND CPF_USUARIO="'+EditCPFDesp.Text+'"' ,  'NM_USUARIO');

end;


procedure Tfrm_dde.LimpaCampoSituacaoDDE;
begin
  if datm_dde.qry_dde.FieldByName('TX_SITUCAO_DDE').AsString <> '' then begin
    if PoeEmEdicao(datm_dde.qry_dde) then begin
      datm_dde.qry_dde.FieldByName('TX_SITUCAO_DDE').AsString := '';
      datm_dde.qry_dde.Post;
    end;
  end;
end;


procedure Tfrm_dde.captura_telasDblClick(Sender: TObject);
begin
   Captura_Telas.Visible:=False;
end;

procedure Tfrm_dde.btnConsultaFilaClick(Sender: TObject);
var
guarda_ponteiro:String;
begin
   vStr_cd_modulo:= '20';
   str_cd_rotina := '2025';
   str_cd_mod    := vStr_cd_modulo;
   str_cd_rot    := str_cd_rotina;
   //
   frm_cons_fila_dde:=Tfrm_cons_fila_dde.Create(nil);
   frm_cons_fila_dde.showmodal;
   FreeAndNil(frm_cons_fila_dde);
  //
  {Faz um Refresh para atualização do GRID} 
  if pgDDE.ActivePageIndex=0 then begin
     guarda_ponteiro:=datm_dde.qry_ddeNR_SD.AsString;
     datm_dde.qry_dde.Close;
     datm_dde.qry_dde.Open;
     datm_dde.qry_dde.Locate('NR_SD',guarda_ponteiro,[]);
  end;
   
end;

procedure Tfrm_dde.gridDDEDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin


  if (Trim(datm_dde.qry_dde.FieldByname('NR_REGISTRO_SD').AsString) <> '/') and (Trim(datm_dde.qry_dde.FieldByname('NR_REGISTRO_SD').AsString) <> '') then begin
    gridDDE.Canvas.Brush.Color := $00D1FCC2;
    gridDDE.Canvas.Font.Color := clBlack;
    gridDDE.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
  end;
  if (datm_dde.qry_dde.FieldByname('IN_FILA').AsString='1') then begin
    gridDDE.Canvas.Brush.Color := $0080FFFF;
    gridDDE.Canvas.Font.Color := clBlack;
    gridDDE.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
  end;

  if (datm_dde.qry_dde.FieldByname('IN_FILA').AsString='2') then begin
    gridDDE.Canvas.Brush.Color := clRed;
    gridDDE.Canvas.Font.Color := clWhite;
    gridDDE.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
  end;


end;

procedure Tfrm_dde.tabGlobaisShow(Sender: TObject);
begin
  //bloqueia a edição de registros na fila de DDEs
  TabGlobais.Enabled:=datm_dde.qry_ddeIN_FILA.AsString<>'1';
  pControle1.Enabled:=datm_dde.qry_ddeNR_REGISTRO_SD.AsString='';
  pControle2.Enabled:=datm_dde.qry_ddeNR_REGISTRO_SD.AsString='';
  if TabGlobais.Enabled=True then
     if gPermite_altera_reg_dde='1' then
        pControle1.Enabled:=True;


end;

procedure Tfrm_dde.tabComplementaresShow(Sender: TObject);
begin
  //bloqueia a edição de registros na fila de DDEs
  TabComplementares.Enabled:=(datm_dde.qry_ddeIN_FILA.AsString<>'1') and (datm_dde.qry_ddeNR_REGISTRO_SD.AsString='');

end;

procedure Tfrm_dde.tabNFShow(Sender: TObject);
begin
  //bloqueia a edição de registros na fila de DDEs
  TabNF.Enabled:=(datm_dde.qry_ddeIN_FILA.AsString<>'1') and (datm_dde.qry_ddeNR_REGISTRO_SD.AsString='');

end;

procedure Tfrm_dde.bloqueia_ctrl_delete(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_delete) and (ssCtrl in Shift)  then begin
     showmessage('Bloqueada a deleção através do <CTRL+DELETE>.');
     Key:=0;
  end;

end;

procedure Tfrm_dde.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se pressionar ESC encerra
  if Key = #27 then
     btn_SairClick(nil);

end;



end.


