unit PGDI038;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus, Mask, DBTables, Funcoes,
  DateUtils, StrUtils, uWebModulo, Componentes,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_trans_DI = class(TForm)
    gbox_monitor: TGroupBox;
    lbl_Capas: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_processos: TLabel;
    lbl_adicoes: TLabel;
    lbl_itens: TLabel;
    lbl_mensagem: TLabel;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_trans_DI: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbgrd_di: TDBGrid;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    mi_menu: TMainMenu;
    mi_transmitir: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    rgrp_transmissao_para: TRadioGroup;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    SP_cons_db_susp: TStoredProc;
    sp_saldo_drawback: TStoredProc;
    SqlAuxiliar: TQuery;
    tmrSelecionaArquivo: TTimer;
    tmrMensagemWeb: TTimer;
    procedure FormShow(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_trans_DIClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cb_ordemClick(Sender: TObject);
    procedure tmrSelecionaArquivoTimer(Sender: TObject);
    procedure tmrMensagemWebTimer(Sender: TObject);
  private
    Pesquisa : string;
    a_str_indices : array[0..2] of string[60];
    IN_EMBUT_FRT_ITENS     : Boolean;
    IN_EMBUT_SEG_ITENS     : Boolean;
    VL_DEDUCAO_MNEG, VL_DEDUCAO_MN : Double;
    Pc_Fundo_Pobreza: Double;
    CPF, FArquivoWeb, NrTransmissao, NrDeclaracao, DataRegistro: String;
    { Private declarations }
    procedure AbreDI;
    procedure NumeraDI;
    procedure IntegraDI;
    procedure IntegraAdicao;
    procedure Adicao;
    procedure DocumentoInstrucao;
    procedure ProcessoDI;
    procedure EmbalagemCarga;
    procedure ArmazCarga;
    procedure PagamentoTributos;
    procedure open_tabelas_sisco;
    procedure close_tabelas_sisco;
    procedure Tributos;
    procedure AtoVinculadoDI;
    procedure IntegraItem;
    procedure ItemAdicao;
    procedure AcrescimosDI;
    procedure DeducoesDI;
    procedure DocumentoVinculado;
    procedure Destaque_NCM;
    procedure Pagamento_Previsto;
    procedure Pagamento_Vinculado;
    procedure Valoracao_NCM;
    procedure ApagaAdicoesExtras;
    function VerificaMarinhaMercante: Boolean;
    procedure IntegraDE;
    // function Check_001 : Boolean;
    function InAdmissaoTemporaria: Boolean;

    // Diagnóstico de DIs Anteriores - Michel - 01/10/2012
    procedure DoLinkClick(Sender: TObject; ALinkText: String);

    // Transmissão de DI para Siscomex Importação Web - Michel - 17/04/2014
    //procedure IntegraDIWeb;
    procedure DoDocumentCompleteDI(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    function ValidarVolumes : String;    
  public
    { Public declarations }
    function Nr_Import2(cTipo : string) : string;
    function Num_To_Str(nValor : Double; nTamTotal : Integer; nFracao : Integer) : string;
    function Conv_VirgPonto(cStringComNumero : string ) : Double;
    function ConvAbrang(cAbrangencia : string ): string;

    procedure TipoAliqImposto(cTipoImposto : Integer);
  end;
var
  frm_trans_DI: Tfrm_trans_DI;
  cProcSCX, cProcBroker, cd_unid_neg, IdentUsuario: string;
  cTipoDecla, cAdicao : string;
  nProcesso, nAdicao, nItem : longint;
  cInfComp : TStringList;
  nItemAdicao : Integer;
  nTotalItens : Integer;
  cCursor  : TCursor;
  lCancelar : Boolean;

implementation

{$R *.DFM}

uses PGGP017, PGDI039, PGGP001, GSMLIB, PGSM119, PGSM024, PGSM018, PGDI052,
  uDiagnostico, ConsOnLineEx, PGDI001, PGDI018,// UDiagnosticoAnteriores,
  PGGP018;

procedure Tfrm_trans_DI.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;

  cd_unid_neg        := '';
  cd_unid_neg        := '';
  lCancelar          := False;
  edt_chave.Text     := '';
  cb_ordem.ItemIndex := 0;
  cCursor            := Screen.Cursor;
  Screen.Cursor      := crHourGlass;
  with datm_trans_DI do
  begin
    //IMPORT.Connected := True;

    if Trim(msk_cd_unid_neg.Text) = '' then
      msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
  end;
  Screen.Cursor := cCursor;
  edt_chave.SetFocus;
end;

procedure Tfrm_trans_DI.cb_ordemChange(Sender: TObject);
begin
  Pesquisa := datm_trans_DI.qry_grd_di_.FieldByName('NR_PROCESSO').AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_trans_DI.qry_grd_di_.Close;
  datm_trans_DI.qry_grd_di_.SQL[11] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
  datm_trans_DI.qry_grd_di_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
  datm_trans_DI.qry_grd_di_.Prepare;
  datm_trans_DI.qry_grd_di_.Open;
  Localiza( datm_trans_DI.qry_grd_di_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_trans_DI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_trans_DI do
  begin
    qry_unid_neg_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_grd_di_.Close;
    qry_di_.Close;
    IMPORT.Connected := False;
    Free;
  end;
   Action := caFree;
end;

procedure Tfrm_trans_DI.IntegraDI;
var
  cIncoterm : string;
  str_cd_tipo_doc_carga  : string[2];
  str_nr_pres_dcto_carga : string[36];
  VL_TOTAL_MLE_MN        : Double;
  SL: TStringList;
  Data: TDateTime;
  CD_TIPO_DECLARACAO: String;
  MR: Integer;
begin
  with datm_trans_DI do
  begin
//    if frm_di_capa = nil then
//      Application.CreateForm(Tfrm_di_capa, frm_di_capa);
//    if datm_di_capa = nil then
//      Application.CreateForm(Tdatm_di_capa, datm_di_capa);
    str_nr_processo := cProcBroker;
//    frm_DI_capa.FormShow(nil);
//    datm_DI_capa.qry_di_.Close;
//    datm_di_capa.qry_di_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
//    datm_di_capa.qry_di_.Prepare;
//    datm_di_capa.qry_di_.Open;
//    datm_di_capa.qry_di_.Edit;
//    frm_di_capa.Atualiza_Historico_Padrao;
//    datm_di_capa.qry_di_.Post;
//    frm_di_capa.Free;
//    datm_di_capa.Free;

      //if (str_cd_cargo = '001') then
        MR := MessageDlg('Deseja transmitir o Siscomex Importação Web?'#13'Para Web clique Sim, para Orientador clique Não.', mtConfirmation, [mbYes, mbNo, mbCancel], 0)
      {else
        MR := mrYes};
        
      case MR of //MessageDlg('Deseja transmitir o Siscomex Importação Web?'#13'Para Web clique Sim, para Orientador clique Não.', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
        mrYes: begin
                 SL := TStringList.Create;
                 try
                   if qry_Trans_DI_Web.Active then
                     qry_Trans_DI_Web.Close;
                   qry_Trans_DI_Web.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
                   qry_Trans_DI_Web.ParamByName('CD_MOTIVO_TRANS').AsInteger := rgrp_transmissao_para.ItemIndex +1;
                   qry_Trans_DI_Web.Open;
                   qry_Trans_DI_Web.First;
                   if qry_Trans_DI_Web.Eof then
                     MessageDlg('Arquivo em branco. Favor verificar a DI.'#13'Se o problema continuar informe o TI.', mtError, [mbOk], 0)
                   else
                   begin
                     qry_Trans_DI_Web.First;
                     while not qry_Trans_DI_Web.Eof do
                     begin
                       if Trim(qry_Trans_DI_WebTX_LINHA.AsString) = '' then
                       begin
                         MessageDlg('Dados em branco para o registro ' + qry_Trans_DI_WebCD_TIPO_LINHA.AsString + ' na linha ' + qry_Trans_DI_WebNR_LINHA.AsString + '.' +
                            #13'Favor informar ao TI.', mtError, [mbOk], 0);
                         Break;
                       end
                       else
                         SL.Add(qry_Trans_DI_WebTX_LINHA.AsString);

                       qry_Trans_DI_Web.Next;
                     end;
                     if qry_Trans_DI_Web.Eof then
                     begin
                       if not DirectoryExists('C:\DDBROKER\DI') then
                         ForceDirectories('C:\DDBROKER\DI');
                       FArquivoWeb := 'C:\DDBROKER\DI\' + str_nr_processo + '.txt';
                       SL.SaveToFile(FArquivoWeb);

                       NrTransmissao := '';
                       NrDeclaracao := '';
                       DataRegistro := '';
                       with Tfrm_Web.Create(Application) do
                         try
                           OnDocumentComplete := DoDocumentCompleteDI;
                           WebBrowser1.Silent := False;
                           tmrMensagemWeb.Enabled := True;
                           Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html');
                           datm_main.db_broker.StartTransaction;
                           try
                             if rgrp_transmissao_para.ItemIndex <> 0 then // Só Salva se não for Diagnóstico
                             begin
                               if NrTransmissao <> '' then
                                 FastExecSQL('UPDATE TDECLARACAO_IMPORTACAO ' +
                                             'SET NR_TRANSMISSAO = :NR_TRANSMISSAO, ' +
                                             '    NR_IDENT_USUARIO = :NR_IDENT_USUARIO,' +
                                             '    DT_TRANSMISSAO = GETDATE(), ' +
                                             '    CD_USUARIO_TRANSMISSAO = :CD_USUARIO_TRANSMISSAO ' +
                                             'WHERE NR_PROCESSO = :NR_PROCESSO', [NrTransmissao, datm_trans_DI.qry_Trans_DI_WebNR_IDENT_USUARIO.AsString, str_cd_usuario, str_nr_processo]);

                               if (NrDeclaracao <> '') and TryStrToDate(DataRegistro, Data) then
                               begin
                                 FastExecSQL('UPDATE TDECLARACAO_IMPORTACAO ' +
                                             'SET NR_DECLARACAO_IMP = :NR_DECLARACAO_IMP, ' +
                                             '    DT_REGISTRO_DI = :DT_REGISTRO_DI ' +
                                             'WHERE NR_PROCESSO = :NR_PROCESSO', [NrDeclaracao, FormatDateTime('ddmmyyyy', Data), str_nr_processo]);

                                 CD_TIPO_DECLARACAO := Trim(ConsultaLookUPSQL('SELECT ISNULL(CD_TIPO_DECLARACAO, '''') AS CD_TIPO_DECLARACAO ' +
                                                                              'FROM TDECLARACAO_IMPORTACAO ' +
                                                                              'WHERE NR_PROCESSO = :NR_PROCESSO', 'CD_TIPO_DECLARACAO', [str_nr_processo]));
                                 { atualiza NR. DA apenas se for processo IE - kleber guedes 24/01/2006 }
                                 if CD_TIPO_DECLARACAO = '02' then //tipo da declaração (processo IE)
                                   FastExecSQL('UPDATE TPROCESSO ' +
                                               'SET NR_DI = :NR_DI, ' +
                                               '    NR_DA = :NR_DA ' +
                                               'WHERE NR_PROCESSO = :NR_PROCESSO', [NrDeclaracao, NrDeclaracao, str_nr_processo])
                                 else
                                   FastExecSQL('UPDATE TPROCESSO ' +
                                               'SET NR_DI = :NR_DI ' +
                                               'WHERE NR_PROCESSO = :NR_PROCESSO', [NrDeclaracao, str_nr_processo]);

                                 FastExecSQL('EXEC SP_ATZ_EVENTO :NR_PROCESSO, :CD_EVENTO_TXT, :DT_REALIZACAO', [str_nr_processo, 'CD_EV_REG_DI', Data]);

                                 {Distribui S.D.A. Automaticamente}
                                 with TQuery.Create(application) do
                                 begin
                                   Databasename := 'DBBROKER';
                                   SQL.Clear;
                                   SQL.Add('SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, IN_INCIDE_SDA ' +
                                           'FROM TCLIENTE_SERVICO ' +
                                           'WHERE CD_CLIENTE  = :CD_CLIENTE ' +
                                           '  AND CD_UNID_NEG = :CD_UNID_NEG ' +
                                           '  AND CD_PRODUTO  = ''01'' ' +
                                           '  AND CD_SERVICO  = (SELECT CD_SERVICO ' +
                                           '                     FROM TPROCESSO ' +
                                           '                     WHERE NR_PROCESSO = :NR_PROCESSO)');
                                   ParamByName('CD_CLIENTE').AsString := datm_trans_DI.qry_grd_di_CD_IMPORTADOR.AsString;
                                   ParamByName('CD_UNID_NEG').AsString := Copy(str_nr_processo, 1, 2);
                                   ParamByName('NR_PROCESSO').AsString := str_nr_processo;
                                   Open;
                                   if (not IsEmpty) and (FieldByName('IN_INCIDE_SDA').AsString = '1') then
                                   begin
                                     FastExecSQL('UPDATE TPROCESSO_SDA ' +
                                                 'SET IN_DISTR = ''1'', ' +
                                                 '    CD_USUARIO_DISTR = :CD_USUARIO_DISTR ' +
                                                 'WHERE NR_PROCESSO = :NR_PROCESSO', [str_cd_usuario, str_nr_processo]);
                                     FastExecSQL('EXEC SP_DISTRIBUI_SDA :CD_UNID_NEG, ''01'', :CD_USUARIO', [Copy(str_nr_processo, 1, 2), str_cd_usuario]);
                                   end;
                                   Free;
                                 end;

                                 // lança impostos
                                 FastExecSQL('EXEC SP_DI_DISTRIBUI_DEB_COM :NR_PROCESSO', [str_nr_processo]);
                               end;
                             end;
                             if datm_main.db_broker.InTransaction then
                               datm_main.db_broker.Commit;
                           except
                             on E: Exception do
                             begin
                               if datm_main.db_broker.InTransaction then
                                 datm_main.db_broker.Rollback;
                               MessageDlg('Erro integrando dados.'#13 + E.Message, mtError, [mbOk], 0);
                             end;
                           end;
                         finally
                           Free;
                           tmrMensagemWeb.Enabled := False;
                         end;

                       //MessageDlg('Arquivo salvo com sucesso em "C:\DDBROKER\DI\' + str_nr_processo + '.txt".', mtInformation, [mbOk], 0);
                     end;
                   end;
                 finally
                   FreeAndNil(SL);
                 end;
                 Exit;
               end;
        mrNo: ;
      else
        Exit;
      end;

    datm_main.db_broker.StartTransaction;
    try
      if not IMPORT.Connected then
      begin
        lbl_mensagem.Caption  := 'Acessando Tabelas Siscomex ... ';
        open_tabelas_sisco;
        lbl_mensagem.Caption  := 'Acessando Tabelas DDBroker ... ';
        //lAbriuSiscomex        := True;
      end;
      qry_di_.Close;
      qry_di_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
      qry_di_.Prepare;
      qry_di_.Open;
      IdentUsuario := cProcBroker;
      Delete(IdentUsuario, 1, 1);
      Delete(IdentUsuario, 2, 1);

      cInfComp := TStringList.Create;

      lbl_mensagem.Caption := 'Transmitindo DI ... ';

      Application.ProcessMessages;

      { Inclusão de Dedução para Processos com CPT }
      CloseStoredProc( sp_di_ded_cpt );
      sp_di_ded_cpt.ParamByName('@NR_PROCESSO').AsString := cProcBroker;
      ExecStoredProc( sp_di_ded_cpt );
      CloseStoredProc( sp_di_ded_cpt );

      { Check para evitar a sobreposição de Processos de DI }
      { Procura Processo Broker no Orientador }
      { Se achar, busca numero do orientador e edita }
      if qry_di_scx_.Locate('NR_IDENT_USUARIO', cProcBroker, [locaseInsensitive]) or qry_di_scx_.Locate('NR_IDENT_USUARIO', IdentUsuario, [locaseInsensitive]) then
      begin
        cProcSCX := qry_di_scx_.FieldByName('NR_DECL_IMP_MICRO').AsString;

        qry_di_atz_.ParamByName('NR_PROCESSO').AsString          := cProcBroker;
        qry_di_atz_.ParamByName('NR_PROCESSO_SISCOMEX').AsString := cProcSCX;
        qry_di_atz_.Prepare;
        qry_di_atz_.ExecSQL;
        {Altera já existente no Orientador}
        qry_di_scx_.Edit;
      end
      else
      begin
        NumeraDI;
        {Inclui no Orientador}
        qry_di_scx_.Append;
        qry_di_scx_.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
        qry_di_scx_.FieldByName('NR_IDENT_USUARIO').AsString  := IdentUsuario;
      end;

      qry_di_scx_.FieldByName('DT_PROCESSAMENTO').AsString := FormatDateTime( 'ddmmyyyy', Date );

      if ( qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString <> '' ) then
      begin
        qry_di_scx_.FieldByName('CD_TIPO_DECLARACAO').AsString := qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString;
      end
      else
      begin
        qry_di_scx_.FieldByName('CD_TIPO_DECLARACAO').AsString := '1';
      end;
      cTipoDecla := qry_di_scx_.FieldByName('CD_TIPO_DECLARACAO').AsString;

      if Trim( qry_di_.FieldByName('NM_EMPRESA').AsString ) <> '' then
      begin
        qry_di_scx_.FieldByName('CD_TIPO_IMPORTADOR').AsString := qry_di_.FieldByName('CD_TIPO_IMPORTADOR').AsString;
        qry_di_scx_.FieldByName('NR_IMPORTADOR').AsString      := Nr_Import2( qry_di_scx_.FieldByName('CD_TIPO_IMPORTADOR').AsString );

        if ( qry_di_scx_.FieldByName('CD_TIPO_IMPORTADOR').AsString = '3' ) or
           ( qry_di_scx_.FieldByName('CD_TIPO_IMPORTADOR').AsString = '4' ) then
        begin
          qry_di_scx_.FieldByName('CD_PAIS_IMPORTADOR').AsString := qry_di_.FieldByName('CD_PAIS_IMPORTADOR').AsString;
          qry_di_scx_.FieldByName('NM_IMPORTADOR').AsString      := qry_di_.FieldByName('NM_EMPRESA').AsString;
          qry_di_scx_.FieldByName('NR_TEL_IMPORTADOR').AsString  := qry_di_.FieldByName('NR_TELEFONE').AsString;
          qry_di_scx_.FieldByName('ED_LOGR_IMPORTADOR').AsString := qry_di_.FieldByName('END_EMPRESA').AsString;
          qry_di_scx_.FieldByName('ED_NR_IMPORTADOR').AsString   := qry_di_.FieldByName('END_NUMERO').AsString;
          qry_di_scx_.FieldByName('ED_BA_IMPORTADOR').AsString   := qry_di_.FieldByName('END_BAIRRO').AsString;
          qry_di_scx_.FieldByName('ED_MUN_IMPORTADOR').AsString  := qry_di_.FieldByName('END_CIDADE').AsString;
          qry_di_scx_.FieldByName('ED_UF_IMPORTADOR').AsString   := qry_di_.FieldByName('END_UF').AsString;
          qry_di_scx_.FieldByName('ED_CEP_IMPORTADOR').AsString  := qry_di_.FieldByName('END_CEP').AsString;
        end;
      end;

      if qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString <> '' then
      begin
        if StrToInt( qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString ) < 12 then
        begin
          if qry_di_.FieldByName('CD_MODALIDADE_DESP').AsString <> '' then
          begin
            qry_di_scx_.FieldByName('CD_MODALIDADE_DESP').AsString := Trim( qry_di_.FieldbyName('CD_MODALIDADE_DESP').AsString );
          end
          else
          begin
            qry_di_scx_.FieldByName('CD_MODALIDADE_DESP').AsString := '1';
          end;
        end;
      end;

      if ( cTipoDecla <> '17') and ( cTipoDecla <> '16' ) then
      begin
        if Trim( qry_di_.FieldByName('CD_URF_ENTR_CARGA').AsString ) <> '' then
        begin
          qry_di_scx_.FieldByName('CD_URF_ENTR_CARGA').AsString := qry_di_.FieldByName('CD_URF_ENTR_CARGA').AsString;
        end;
      end;

      if qry_di_.FieldByName('CD_URF_DESPACHO').AsString <> '' then
      begin
        qry_di_scx_.FieldByName('CD_URF_DESPACHO').AsString := qry_di_.FieldByName('CD_URF_DESPACHO').AsString;
      end;

      qry_di_scx_.FieldByName('IN_OPERACAO_FUNDAP').AsBoolean := qry_di_.FieldByName('IN_OPERACAO_FUNDAP').AsBoolean;

      if Trim( qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString ) <> '' then
      begin
        if StrToInt( qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString ) in [ 1, 12, 13, 14, 15, 16, 17, 18] then
        begin
          if Trim( qry_di_.FieldByName('CD_TIPO_CONSIG').AsString ) <> '' then
            qry_di_scx_.FieldByName('CD_TIPO_CONSIG').AsString := qry_di_.FieldByName('CD_TIPO_CONSIG').AsString;
          if qry_di_.FieldByName('CD_TIPO_CONSIG').AsString = '2' then
            qry_di_scx_.FieldByName('NR_CONSIGNATARIO').AsString := qry_di_.FieldByName('NR_CONSIGNATARIO').AsString;
        end;
      end;

      if ( qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString <= '14' ) or
         ( qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString = '16' ) then
      begin  { Tipo de Declaração }
        if ( cTipoDecla <> '17' ) and ( cTipoDecla <> '16' ) then
        begin
          { Diferente de Nacionalizacao DEA }
          if qry_di_.FieldByName('NR_VEICULO_TRANSP').AsString <> '' then
          begin
            qry_di_scx_.FieldByName('NR_VEICULO_TRANSP').AsString := qry_di_.FieldByName('NR_VEICULO_TRANSP').AsString;
          end;
          if qry_di_.FieldByName('NM_VEICULO_TRANSP').AsString <> '' then
          begin
            qry_di_scx_.FieldByName('NM_VEICULO_TRANSP').AsString := qry_di_.FieldByName('NM_VEICULO_TRANSP').AsString;
          end;
          if Trim( qry_di_.FieldByName('NM_LOCAL_EMBARQUE').AsString ) <> '' then
          begin
            qry_di_scx_.FieldByName('NM_LOCAL_EMBARQUE').AsString := qry_di_.FieldByName('NM_LOCAL_EMBARQUE').AsString;
          end;
          if ( qry_di_.FieldByName('DT_EMBARQUE').AsString <> '' ) then
          begin
            qry_di_scx_.FieldByName('DT_EMBARQUE').AsString := qry_di_.FieldByName('DT_EMBARQUE').AsString;
          end;
          if ( qry_di_.FieldByName('DT_CHEGADA_CARGA').AsString <> '' ) then
          begin
            qry_di_scx_.FieldByName('DT_CHEGADA_CARGA').AsString := qry_di_.FieldByName('DT_CHEGADA_CARGA').AsString;
          end;
          if qry_di_.FieldByName('CD_PAIS_PROC_CARGA').AsString <> '' then
          begin
            qry_di_scx_.FieldByName('CD_PAIS_PROC_CARGA').AsString := qry_di_.FieldByName('CD_PAIS_PROC_CARGA').AsString;
          end;
        end;
      end;

      if Trim( qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString ) <> '' then
      begin
        if StrToInt( qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString) < 10 then
        begin
          if ( cTipoDecla <> '17' ) and ( cTipoDecla <> '16' ) then
          begin
            qry_di_scx_.FieldByName('CD_VIA_TRANSP_CARG').AsString := Trim( qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString );
          end;
        end
        else
        begin
          qry_di_scx_.FieldByName('CD_VIA_TRANSP_CARG').AsString := '4';
        end;
      end
      else
      begin
        qry_di_scx_.FieldByName('CD_VIA_TRANSP_CARG').AsString := '4';
      end;

      if ( cTipoDecla <> '17' ) and ( cTipoDecla <> '16' ) then
      begin
        {Diferente de Nacionalizacao DEA}
        qry_di_scx_.FieldByName('IN_MULTIMODAL').AsBoolean := qry_di_.FieldByName('IN_MULTIMODAL').AsBoolean;
        if Trim( qry_di_.FieldByName('NM_TRANSPORTADOR').AsString ) <> '' then
        begin
          qry_di_scx_.FieldByName('NM_TRANSPORTADOR').AsString := qry_di_.FieldByName('NM_TRANSPORTADOR').AsString;
        end;
        if qry_di_.FieldByName('CD_BANDEIRA_TRANSP').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('CD_BANDEIRA_TRANSP').AsString := qry_di_.FieldByName('CD_BANDEIRA_TRANSP').AsString;
        end;

        {CNPJ do Agente de Carga}
        if qry_di_.FieldByName('NR_AGENTE_CARGA').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('NR_AGENTE_CARGA').AsString  :=
             qry_di_.FieldByName('NR_AGENTE_CARGA').AsString;
        end;

        {Código do Agente de Carga}
        if qry_di_.FieldByName('CD_TIPO_AG_CARGA').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('CD_TIPO_AG_CARGA').AsString  :=
             qry_di_.FieldByName('CD_TIPO_AG_CARGA').AsString;
        end;

        // PRESENÇA DE CARGA
        if ( ( qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString = '01' ) or     // Maritimo
             ( qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString = '07' ) ) and  // Rodoviário
           ( qry_di_.FieldByName('CD_PRESENCA_CARGA').AsString <> '' ) then
        begin
          str_nr_pres_dcto_carga := FStrSpace( qry_di_.FieldByName('CD_PRESENCA_CARGA').AsString, 36);
          if qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString = '07' then  // Rodoviário
             str_cd_tipo_doc_carga  := '13';
          if qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString = '01' then     // Maritimo
             str_cd_tipo_doc_carga  := '12';
        end
        else
        begin
          if ( qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString = '01' ) or   // Maritimo
             ( qry_di_.FieldByName('CD_VIA_TRANSP_CARG').AsString = '07' ) then // Rodoviário
          begin
            if qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString = '14' then
            str_nr_pres_dcto_carga := FStrSpace( qry_di_.FieldByName('NR_DCTO_CARGA').AsString, 18 ) +
                                      FStrSpace( qry_di_.FieldByName('NR_DCTO_CARGA_MAST').AsString, 18 )
            else
              str_nr_pres_dcto_carga := FStrSpace( qry_di_.FieldByName('CD_PRESENCA_CARGA').AsString, 36 );
          end
          else
          begin
            str_nr_pres_dcto_carga := FStrSpace( qry_di_.FieldByName('NR_DCTO_CARGA').AsString, 18 ) +
                                      FStrSpace( qry_di_.FieldByName('NR_DCTO_CARGA_MAST').AsString, 18 );
          end;
          str_cd_tipo_doc_carga := FStrZero( qry_di_.FieldByName('CD_TIPO_DCTO_CARGA').AsString, 2 );
        end;

        { Tipo de Documento de Carga - A(2) }
        if str_cd_tipo_doc_carga <> '' then
        begin
          qry_di_scx_.FieldByName('CD_TIPO_DCTO_CARGA').AsString := str_cd_tipo_doc_carga;
        end;

        { Número do Documento - A(18) }
        if Copy( str_nr_pres_dcto_carga, 1, 18 ) <> '' then
        begin
          qry_di_scx_.FieldByName('NR_DCTO_CARGA').AsString := Copy( str_nr_pres_dcto_carga, 1, 18 );
        end;

        { Número do Master - A(18) }
        if Copy( str_nr_pres_dcto_carga, 19, 18 ) <> '' then
        begin
          qry_di_scx_.FieldByName('NR_DCTO_CARGA_MAST').AsString := Copy( str_nr_pres_dcto_carga, 19, 18 );
        end;

        if qry_di_.FieldByName('CD_UTIL_DCTO_CARGA').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('CD_UTIL_DCTO_CARGA').AsString := qry_di_.FieldByName('CD_UTIL_DCTO_CARGA').AsString;
        end;
        if qry_di_.FieldByName('CD_TIPO_MANIFESTO').AsString <> '' then
        begin
          if (qry_di_.FieldByName('CD_TIPO_MANIFESTO').AsString <> '5') then
          begin
            qry_di_scx_.FieldByName('CD_TIPO_MANIFESTO').AsString := qry_di_.FieldByName('CD_TIPO_MANIFESTO').AsString;
          end;
        end;

        if qry_di_.FieldByName('NR_MANIFESTO').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('NR_MANIFESTO').AsString := qry_di_.FieldByName('NR_MANIFESTO').AsString;
        end;

        if qry_di_.FieldByName('CD_MOEDA_FRETE').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('CD_MOEDA_FRETE').AsString := qry_di_.FieldByName('CD_MOEDA_FRETE').AsString;
        end;

        if qry_di_.FieldByName('VL_TOT_FRT_PREPAID').AsFloat <> 0 then
        begin
          qry_di_scx_.FieldByName('VL_TOT_FRT_PREPAID').AsFloat := qry_di_.FieldByName('VL_TOT_FRT_PREPAID').AsFloat;
        end;

        if qry_di_.FieldByName('VL_TOT_FRT_COLLECT').AsFloat <> 0 then
        begin
          qry_di_scx_.FieldByName('VL_TOT_FRT_COLLECT').AsFloat := qry_di_.FieldByName('VL_TOT_FRT_COLLECT').AsFloat;
        end;

        if qry_di_.FieldByName('VL_FRETE_TNAC_MNEG').AsFloat <> 0 then
        begin
          qry_di_scx_.FieldByName('VL_FRETE_TNAC_MNEG').AsFloat := qry_di_.FieldByName('VL_FRETE_TNAC_MNEG').AsFloat;
        end;

        if qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat <> 0 then
        begin
          qry_di_scx_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat := qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat;
        end;

        if qry_di_.FieldByName('CD_MOEDA_SEGURO').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('CD_MOEDA_SEGURO').AsString := qry_di_.FieldByName('CD_MOEDA_SEGURO').AsString;
        end;

        if qry_di_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat <> 0 then
        begin
          qry_di_scx_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat := qry_di_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat;
        end;

        if qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat <> 0 then
        begin
          qry_di_scx_.FieldByName('VL_TOTAL_SEG_MN').AsFloat := qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat;
        end;

        if qry_di_.FieldByName('CD_MOEDA_MLE').AsString <> '' then
        begin
          qry_di_scx_.FieldByName('CD_MOEDA_MLE').AsString := qry_di_.FieldByName('CD_MOEDA_MLE').AsString;
        end;
      end;

      qry_di_scx_.FieldByName('PB_CARGA').AsString := Num_To_Str(qry_di_.FieldByName('PB_CARGA').AsFloat, 15, 5);
      qry_di_scx_.FieldByName('PL_CARGA').AsString := Num_To_Str(qry_di_.FieldByName('PL_CARGA').AsFloat, 15, 5);

      if qry_di_.FieldByName('CD_RECINTO_ALFAND').AsString <> '' then
      begin
        qry_di_scx_.FieldByName('CD_RECINTO_ALFAND').AsString := qry_di_.FieldByName('CD_RECINTO_ALFAND').AsString;
      end;

      if qry_di_.FieldByname('CD_SETOR_ARMAZENAM').AsString <> '' then
      begin
        qry_di_scx_.FieldByName('CD_SETOR_ARMAZENAM').AsString := qry_di_.FieldByname('CD_SETOR_ARMAZENAM').AsString;
      end;

      { Moeda Negociada }
      if ( qry_di_.FieldByname('CD_MOEDA_MLE').AsString <> '' ) and
         ( cTipoDecla <> '17' ) and ( cTipoDecla <> '16' ) then
      begin
        cIncoterm := qry_di_.FieldByname('CD_INCOTERM').AsString;

        if ( cIncoterm = 'FOB') or ( cIncoterm = 'FCA') or ( cIncoterm = 'FAS') or
           ( cIncoterm = 'EXW') then
        begin
          qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
             qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
             qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;
        end
        else
        if ( cIncoterm = 'DDU' ) or ( cIncoterm = 'DAP' ) then
        begin
          {qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
             qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
             qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOTAL_FRETE_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat};

          // Comentado acima e utilizado abaixo para retirar o Frete se estiver embutido - Michel - 18/11/2011
          qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
             qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
             qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
             qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;

          if qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean then
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat := qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_FRETE_MNEG').AsFloat;

          if qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean then
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat := qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat;
        end
        else
        if ( cIncoterm = 'CFR') or ( cIncoterm = 'CPT' ) then
        begin
          if qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean  then
          begin
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
               qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;
            if qry_di_.FieldByName('CD_MOEDA_FRETE').AsString =
               qry_di_.FieldByName('CD_MOEDA_MLE').AsString then
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 qry_di_.FieldByName('VL_TOTAL_FRETE_MNEG').AsFloat;
            end
            else
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat /
                 qry_di_.FieldByName('TX_MLE').AsFloat;
            end
          end
          else
          begin
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
               qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;
          end;
        end
        else
        if ( cIncoterm = 'CIF') or ( cIncoterm = 'CIP') or ( cIncoterm = 'DAF') or
           ( cIncoterm = 'DES') or ( cIncoterm = 'DAT') then
        begin
          if ( qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
             ( qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean ) then
          begin
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
               qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;

            if qry_di_.FieldByName('CD_MOEDA_FRETE').AsString =
               qry_di_.FieldByName('CD_MOEDA_MLE').AsString then
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 qry_di_.FieldByName('VL_TOTAL_FRETE_MNEG').AsFloat;
            end
            else
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 ( qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat /
                   qry_di_.FieldByName('TX_MLE').AsFloat );
            end;

            if qry_di_.FieldByName('CD_MOEDA_SEGURO').AsString =
               qry_di_.FieldByName('CD_MOEDA_MLE').AsString then
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 qry_di_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat;
            end
            else
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 (qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat /
                 qry_di_.FieldByName('TX_MLE').AsFloat );
            end;
          end
          else
          if ( qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
             ( Not qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean ) then
          begin
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
               qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;
            if qry_di_.FieldByName('CD_MOEDA_FRETE').AsString =
               qry_di_.FieldByName('CD_MOEDA_MLE').AsString then
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 qry_di_.FieldByName('VL_TOTAL_FRETE_MNEG').AsFloat;
            end
            else
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 ( qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat /
                 qry_di_.FieldByName('TX_MLE').AsFloat );
            end;
          end
          else
          if ( Not qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
             ( qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean ) then
          begin
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
               qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;
            if qry_di_.FieldByName('CD_MOEDA_SEGURO').AsString =
               qry_di_.FieldByName('CD_MOEDA_MLE').AsString then
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 qry_di_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat;
            end
            else
            begin
              qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
                 qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat -
                 (qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat /
                 qry_di_.FieldByName('TX_MLE').AsFloat );
            end;
          end
          else
          begin
            qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat :=
               qry_di_.FieldByName('VL_TOT_MLE_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOT_DESPS_MNEG').AsFloat +
               qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MNEG').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MNEG').AsFloat;
          end;
        end;

        if (cIncoterm <> 'FOB') and (cIncoterm <> 'FCA') and (cIncoterm <> 'EXW') and (cIncoterm <> 'FAS') then
          qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat := qry_di_scx_.FieldByName('VL_TOT_MLE_MNEG').AsFloat + qry_di_.FieldByName('VL_TOT_FRT_COLLECT').AsFloat;

      end;

      { Moeda Nacional }
      VL_TOTAL_MLE_MN := qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat + qry_di_.FieldByName('VL_TOT_DESPS_MN').AsFloat +
                         qry_di_.FieldByName('VL_TOTAL_ACRESCIMOS_MN').AsFloat -
                         qry_di_.FieldByName('VL_TOTAL_DEDUCOES_MN').AsFloat;

      IN_EMBUT_FRT_ITENS := qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean;
      IN_EMBUT_SEG_ITENS := qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean;

      {Retira Frete Embutido nos itens}
      if IN_EMBUT_FRT_ITENS then VL_TOTAL_MLE_MN := VL_TOTAL_MLE_MN - qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat;
      {Retira Seguro Embutido nos itens}
      if IN_EMBUT_SEG_ITENS then VL_TOTAL_MLE_MN := VL_TOTAL_MLE_MN - qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat;

      qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat := VL_TOTAL_MLE_MN;

      {
      if ( qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat > 0 ) and
         ( cTipoDecla <> '17' ) and ( cTipoDecla <> '16' ) then
      begin
        if ( cIncoterm = 'FOB') or ( cIncoterm = 'FCA') or ( cIncoterm = 'FAS') or
           ( cIncoterm = 'EXW') then
        begin
          qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat := qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat;
        end
        else
        if ( cIncoterm = 'DDU' ) then
        begin
          qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat :=
             qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat -
             qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat -
             qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat;
        end
        else
        if ( cIncoterm = 'CFR' ) or ( cIncoterm = 'CPT' ) then
        begin
          if qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean then
          begin
            qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat :=
               qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat;
          end
          else
          begin
            qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat :=
               qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat;
          end;
        end
        else
        if ( cIncoterm = 'CIF') or ( cIncoterm = 'CIP') or ( cIncoterm = 'DAF') or
           ( cIncoterm = 'DES') then
        begin
          if ( qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
            ( qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean ) then
          begin
            qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat :=
               qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat;
          end
          else
          if ( qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
             ( Not qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean ) then
          begin
            qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat :=
               qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat -
               qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat;
          end
          else
          if ( Not qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
             ( qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean ) then
          begin
            qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat :=
               qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat -
               qry_di_.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat;
          end
          else
          begin
            qry_di_scx_.FieldByName('VL_TOTAL_MLE_MN').AsFloat :=
               qry_di_.FieldByName('VL_TOTAL_MLE_MN').AsFloat;
          end;
        end;
      end;
      }
      if ( qry_di_.FieldByName('CD_MOEDA_MLE').AsString <> '' ) and
         ( cTipoDecla <> '17' ) and ( cTipoDecla <> '16' ) then
      begin
        qry_di_scx_.FieldByName('IN_MOEDA_UNICA').AsBoolean := True;
      end
      else
      begin
        qry_di_scx_.FieldByName('IN_MOEDA_UNICA').AsBoolean := False;
      end;

      cInfComp.Assign( qry_di_.FieldByName('TX_INFO_COMPL') );

      qry_di_scx_.FieldByName('TX_INFO_COMPL').Assign(cInfComp);

      {Novos Campos para Débito do DARF em Conta Corrente}
      if (qry_di_.FieldByName('CD_TIPO_PGTO_TRIB').AsString <> '' ) then
      begin
        qry_di_scx_.FieldByName('CD_TIPO_PGTO_TRIB').AsString  := qry_di_.FieldByName('CD_TIPO_PGTO_TRIB').AsString;
        if qry_di_scx_.FieldByName('CD_TIPO_PGTO_TRIB').AsString = '1' then
        begin
          // verifica se é DI PRELIMINAR, caso seja, não manda o campo NR_CONTA_PGTO_TRIB e ainda joga 2 para o campo CD_TIPO_PGTO_TRIB
          // para verificação, irei checar se o serviço é diferente de 442, 443 e 444, além de não poder ter DI PRELIMINAR na tabela TPROCESSO_DI
          if ( ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TPROCESSO_DI WHERE NR_PROCESSO = ''' + cProcBroker + ''' AND CD_TIPO_PROCESSO = ''3''','BLABLA') = '1' ) or
             ( ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TPROCESSO WHERE NR_PROCESSO = ''' + cProcBroker + ''' AND CD_SERVICO IN (''442'',''443'',''444'')','BLABLA') = '1' ) then
            qry_di_scx_.FieldByName('CD_TIPO_PGTO_TRIB').AsString  := '3'
          else qry_di_scx_.FieldByName('NR_CONTA_PGTO_TRIB').AsString := qry_di_.FieldByName('NR_CONTA_PGTO_TRIB').AsString;
        end;
      end
      else
      begin
        qry_di_scx_.FieldByName('CD_TIPO_PGTO_TRIB').AsString := '3';
      end;

      Inc(nProcesso);

      lbl_processos.Caption := IntToStr(nProcesso);
      Application.ProcessMessages;

      cInfComp.Free;

      if lCancelar then
      begin
        Exit;
      end;

      qry_di_scx_.Post;    {Atualiza a Tabela da Capa da DI}

      Application.ProcessMessages;
      DocumentoInstrucao;  // Ocorrencias de Documentos para Instrução de Embarque}
      ProcessoDI;          // Ocorrências de Processos na DI}
      EmbalagemCarga;      // Ocorrências de Embalagens para Carga
      ArmazCarga;          // Ocorrências de Carga Armazenada
      PagamentoTributos;   // Ocorrências de Pagto. de Tributos
      Application.ProcessMessages;
      IntegraAdicao;        // Integra as Adições da DI
      IntegraDE; // Carga->DE

      {Limpa deduções para processos CPT}
      if ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
      begin
        qry_del_ded_cpt_.Close;
        qry_del_ded_cpt_.Prepare;
        qry_del_ded_cpt_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
        qry_del_ded_cpt_.ExecSQL;
      end;

      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        MessageDlg('Erro integrando dados.'#13 + E.Message, mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure Tfrm_trans_DI.IntegraAdicao;
var
vPagamentos_Previstos : string;
begin
  lbl_mensagem.Caption := 'Transmitindo Adições da DI ... ';

  with datm_trans_DI do
  begin
    qry_adicao_.Close;
    qry_adicao_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_adicao_.Prepare;
    qry_adicao_.Open;
    while ( Not qry_adicao_.EOF ) and
          ( qry_adicao_.FieldByName('NR_PROCESSO').AsString = cProcBroker ) do
    begin
      cAdicao := qry_adicao_.FieldByName('NR_ADICAO').AsString;

      VL_DEDUCAO_MNEG := 0;
      VL_DEDUCAO_MN   := 0;

      {if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
         ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
      begin
        qry_tot_deducao_.Close;
        qry_tot_deducao_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
        qry_tot_deducao_.ParamByName('NR_ADICAO').AsString   := cAdicao;
        qry_tot_deducao_.Prepare;
        qry_tot_deducao_.Open;
        if Not qry_tot_deducao_.EOF then
        begin
          VL_DEDUCAO_MNEG := qry_tot_deducao_.FieldByName('VL_DEDUCAO_MNEG').AsFloat;
          VL_DEDUCAO_MN   := qry_tot_deducao_.FieldByName('VL_DEDUCAO_MN').AsFloat;
        end;
      end;
      qry_tot_deducao_.Close;} // Comentado porque está sendo utilizado apenas para CPT e não deve mais - Michel - 13/08/2012
      Adicao;
      Inc(nAdicao);
      lbl_adicoes.Caption := IntToStr(nAdicao);
      Application.ProcessMessages;
      Tributos;
      AtoVinculadoDI;
      qry_adicao_.Next;
    end;
    Application.ProcessMessages;
    IntegraItem;
    AcrescimosDI;
    DeducoesDI;
    DocumentoVinculado;
    Destaque_NCM;
    //if qry_adicao_.FieldByName('IN_PGTO_VARIAV_360').AsBoolean then (comentado porque quando o tipo de cambio era parcelas variáveis não transmitia o cambio)
    vPagamentos_Previstos:= ConsultaLookUPSQL('SELECT COUNT (*) as QTDE FROM TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO ='''+cProcBroker+''' AND CD_COBERT_CAMBIAL <> ''4'' ','QTDE');
    if vPagamentos_Previstos <> '0' then
       Pagamento_Previsto;
    Pagamento_Vinculado;
    Valoracao_NCM;
    ApagaAdicoesExtras;
  end;
end;

procedure Tfrm_trans_DI.ApagaAdicoesExtras;
begin
  lbl_mensagem.Caption := 'Limpando Adições da DI ... ';

  if not datm_trans_DI.TB_Adicao_DI.EOF then
  begin
    datm_trans_DI.TB_Adicao_DI.Next;
    while not datm_trans_DI.TB_Adicao_DI.EOF do
    begin
      if datm_trans_DI.TB_Adicao_DI.FieldByName('NR_DECL_IMP_MICRO').AsString = cProcSCX then
      begin
        datm_trans_DI.TB_Adicao_DI.Delete;
      end
      else
      begin
        Exit;
      end;
      datm_trans_DI.TB_Adicao_DI.Next;
    end;
  end;
end;

procedure Tfrm_trans_DI.Adicao;
var
   cAplicacao : string;
   VL_MERC_LOC_EMB_MN : Double;
begin
  with datm_trans_DI do
  begin
    if TB_Adicao_DI.Locate('NR_DECL_IMP_MICRO;NR_OP_IMP_MICRO', VarArrayOf( [cProcSCX,cAdicao] ),[] ) then
    begin
      lbl_mensagem.Caption := 'Localizada Adições nº ' + cAdicao;
      TB_Adicao_DI.Edit;
    end
    else
    begin
      lbl_mensagem.Caption := 'Incluindo Adições nº ' + cAdicao;
      TB_Adicao_DI.Append;
      TB_Adicao_DI.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Adicao_DI.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
    end;
    if qry_adicao_.FieldByName('CD_URF_ENTR_MERC').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_URF_ENTR_MERC').AsString :=
         qry_adicao_.FieldByName('CD_URF_ENTR_MERC').AsString;
    end;
    if qry_adicao_.FieldByName('CD_VIA_TRANSPORTE').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_VIA_TRANSPORTE').AsString :=
         qry_adicao_.FieldByName('CD_VIA_TRANSPORTE').AsString;
    end;
    TB_Adicao_DI.FieldByName('IN_MULTIMODAL').AsBoolean := qry_adicao_.FieldByName('IN_MULTIMODAL').AsBoolean;
    if qry_adicao_.FieldByName('NM_FORN_ESTR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('NM_FORN_ESTR').AsString := qry_adicao_.FieldByName('NM_FORN_ESTR').AsString; // Texto 60
    end;
    if qry_adicao_.FieldByName('ED_LOGR_FORN_ESTR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('ED_LOGR_FORN_ESTR').AsString := qry_adicao_.FieldByName('ED_LOGR_FORN_ESTR').AsString; // Texto 40
    end;
    if qry_adicao_.FieldByName('ED_NR_FORN_ESTR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('ED_NR_FORN_ESTR').AsString := qry_adicao_.FieldByName('ED_NR_FORN_ESTR').AsString; // Texto 06
    end;
    if qry_adicao_.FieldByName('ED_COMPL_FORN_ESTR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('ED_COMPL_FORN_ESTR').AsString := qry_adicao_.FieldByName('ED_COMPL_FORN_ESTR').AsString; // Texto 21
    end;
    if qry_adicao_.FieldByName('ED_CIDAD_FORN_ESTR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('ED_CIDAD_FORN_ESTR').AsString := qry_adicao_.FieldByName('ED_CIDAD_FORN_ESTR').AsString; // Texto 25
    end;
    if qry_adicao_.FieldByName('ED_ESTAD_FORN_ESTR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('ED_ESTAD_FORN_ESTR').AsString := qry_adicao_.FieldByName('ED_ESTAD_FORN_ESTR').AsString; //
    end;
    if qry_adicao_.FieldByName('CD_PAIS_AQUIS_MERC').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_PAIS_AQUIS_MERC').AsString := qry_adicao_.FieldByName('CD_PAIS_AQUIS_MERC').AsString; //
    end;
    if qry_di_.FieldByName('CD_PAIS_AQUIS_MERC').AsString <> '' then
    begin
      if Trim( qry_di_.FieldByName('CD_PAIS_AQUIS_MERC').AsString ) <> '' then
      begin
        TB_Adicao_DI.FieldByName('CD_PAIS_AQUIS_MERC').AsString := qry_di_.FieldByName('CD_PAIS_AQUIS_MERC').AsString;
      end;
    end
    else
    if qry_adicao_.FieldByName('CD_PAIS_AQUIS_MERC').AsString <> '' then
    begin
      if Trim( qry_adicao_.FieldByName('CD_PAIS_AQUIS_MERC').AsString ) <> '' then
      begin
        TB_Adicao_DI.FieldByName('CD_PAIS_AQUIS_MERC').AsString := qry_adicao_.FieldByName('CD_PAIS_AQUIS_MERC').AsString;
      end;
    end;
    if qry_adicao_.FieldByName('CD_MERCADORIA_NCM').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_MERCADORIA_NCM').AsString := qry_adicao_.FieldByName('CD_MERCADORIA_NCM').AsString;
    end;
    if qry_adicao_.FieldByName('CD_PAIS_PROC_MERC').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_PAIS_PROC_MERC').AsString := qry_adicao_.FieldByName('CD_PAIS_PROC_MERC').AsString;
    end;
    if qry_adicao_.FieldByName('CD_AUSENCIA_FABRIC').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_AUSENCIA_FABRIC').AsInteger := qry_adicao_.FieldByName('CD_AUSENCIA_FABRIC').AsInteger;
    end;
    if TB_Adicao_DI.FieldByName('CD_AUSENCIA_FABRIC').AsString = '2' then
    begin
      if qry_adicao_.FieldByName('NM_FABRICANTE_MERC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByName('NM_FABRICANTE_MERC').AsString := qry_adicao_.FieldByName('NM_FABRICANTE_MERC').AsString;
      end;
      if qry_adicao_.FieldByName('ED_LOGR_FABRIC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByName('ED_LOGR_FABRIC').AsString := qry_adicao_.FieldByName('ED_LOGR_FABRIC').AsString;
      end;
      if qry_adicao_.FieldByName('ED_NR_FABRIC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByName('ED_NR_FABRIC').AsString := qry_adicao_.FieldByName('ED_NR_FABRIC').AsString;
      end;
      if qry_adicao_.FieldByName('ED_COMPL_FABRIC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByName('ED_COMPL_FABRIC').AsString := qry_adicao_.FieldByName('ED_COMPL_FABRIC').AsString;
      end;
      if qry_adicao_.FieldByName('ED_CIDAD_FABRIC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByName('ED_CIDAD_FABRIC').AsString := qry_adicao_.FieldByName('ED_CIDAD_FABRIC').AsString;
      end;
      if qry_adicao_.FieldByName('ED_ESTADO_FABRIC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByName('ED_ESTADO_FABRIC').AsString := qry_adicao_.FieldByName('ED_ESTADO_FABRIC').AsString;
      end;
      if qry_adicao_.FieldByName('CD_PAIS_ORIG_MERC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByName('CD_PAIS_ORIG_MERC').AsString := qry_adicao_.FieldByName('CD_PAIS_ORIG_MERC').AsString;
      end;
    end;
    if TB_Adicao_DI.FieldByName('CD_AUSENCIA_FABRIC').AsString = '1' then
    begin
      if Trim( TB_Adicao_DI.FieldByName('CD_PAIS_AQUIS_MERC').AsString ) <> '' then
      begin
        TB_Adicao_DI.FieldByname('CD_PAIS_ORIG_MERC').AsString := TB_Adicao_DI.FieldByName('CD_PAIS_AQUIS_MERC').AsString;
      end;
    end
    else
    begin
      if qry_di_.FieldByName('CD_PAIS_ORIG_MERC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByname('CD_PAIS_ORIG_MERC').AsString := qry_di_.FieldByName('CD_PAIS_ORIG_MERC').AsString;
      end
      else
      if qry_adicao_.FieldByName('CD_PAIS_ORIG_MERC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldByname('CD_PAIS_ORIG_MERC').AsString := qry_adicao_.FieldByName('CD_PAIS_ORIG_MERC').AsString;
      end;
    end;
    if qry_adicao_.FieldByName('CD_MERC_NBM_SH').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_MERC_NBM_SH').AsString := qry_adicao_.FieldByName('CD_MERC_NBM_SH').AsString;
    end;
    if qry_adicao_.FieldByName('CD_MERC_NALADI_NCC').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_MERC_NALADI_NCC').AsString := qry_adicao_.FieldByName('CD_MERC_NALADI_NCC').AsString;
    end;
    if qry_adicao_.FieldByName('CD_MERC_NALADI_SH').AsString <> '' then
    begin
      TB_Adicao_DI.FieldByName('CD_MERC_NALADI_SH').AsString := qry_adicao_.FieldByName('CD_MERC_NALADI_SH').AsString;
    end;
    TB_Adicao_DI.FieldByName('PL_MERCADORIA').AsString := Num_To_Str(qry_adicao_.FieldByName('PL_MERCADORIA').AsFloat,15,5);
    TB_Adicao_DI.FieldByName('QT_UN_ESTATISTICA').AsString := Num_To_Str(qry_adicao_.FieldByName('QT_UN_ESTATISTICA').AsFloat,14,5);

    if qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString <> '' then
    begin
      cAplicacao := qry_di_.FieldByName('CD_TIPO_DECLARACAO').AsString;
      if Not ( ( cAplicacao='02' ) or ( cAplicacao='03' ) or ( cAplicacao='04' ) or
               ( cAplicacao='05' ) or ( cAplicacao='06' ) or ( cAplicacao='07' ) or
               ( cAplicacao='08' ) or ( cAplicacao='09' ) or ( cAplicacao='10' ) ) then
      begin
        if qry_adicao_.FieldByName('CD_APLICACAO_MERC').AsString <> '' then
        begin
          TB_Adicao_DI.FieldByName('CD_APLICACAO_MERC').AsString := Trim(qry_adicao_.FieldByName('CD_APLICACAO_MERC').AsString);
        end;
      end;
    end;
    TB_Adicao_DI.FieldbyName('VL_MERC_EMB_MN').AsInteger := 0;

    if qry_di_.FieldByName('CD_MOEDA_MLE').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_MOEDA_NEGOCIADA').AsString := qry_di_.FieldByName('CD_MOEDA_MLE').AsString;
    end
    else
    begin
      if Trim( qry_adicao_.FieldByName('CD_MOEDA_NEGOCIADA').AsString ) <> '' then
      begin
        TB_Adicao_DI.FieldbyName('CD_MOEDA_NEGOCIADA').AsString := qry_adicao_.FieldByName('CD_MOEDA_NEGOCIADA').AsString;
      end;
    end;
    if qry_di_.FieldByName('CD_INCOTERM').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_INCOTERMS_VENDA').AsString := qry_di_.FieldByName('CD_INCOTERM').AsString;
    end
    else
    begin
      if Trim(qry_adicao_.FieldByName('CD_INCOTERMS_VENDA').AsString) <> '' then
      begin
        TB_Adicao_DI.FieldbyName('CD_INCOTERMS_VENDA').AsString := qry_adicao_.FieldByName('CD_INCOTERMS_VENDA').AsString;
      end;
    end;
    qry_local_embarque_.Close;
    qry_local_embarque_.ParamByName('CD_LOCAL_EMBARQUE').AsString := qry_adicao_.FieldByName('CD_LOC_COND_VENDA').AsString;
    qry_local_embarque_.Prepare;
    qry_local_embarque_.Open;
    if Not qry_local_embarque_.EOF then
    begin
      if qry_local_embarque_.FieldByName('DESCRICAO').AsString <> '' then
      begin
        TB_Adicao_DI.FieldbyName('NM_LOC_COND_VENDA').AsString := qry_local_embarque_.FieldByName('DESCRICAO').AsString;
      end;
    end
    else
    begin
      {LOCAL DE VALIDADE DO INCOTERM???}
      {
      qry_local_embarque_.Close;
      qry_local_embarque_.ParamByName('CD_LOCAL_EMBARQUE').AsString := qry_adicao_.FieldByName('CA2080').AsString;
      qry_local_embarque_.Prepare;
      qry_local_embarque_.Open;
      if Not qry_local_embarque_.EOF then
      if qry_local_embarque_.Locate('CA2801',,[loPartialKey] ) then
      begin
        if qry_local_embarque_.FieldByName('CA2802').AsString <> '' then
        begin
          TB_Adicao_DI.FieldbyName('NM_LOC_COND_VENDA').AsString := qry_local_embarque_.FieldByName('CA2802').AsString;
        end;
      end;}
    end;

    if qry_adicao_.FieldByName('VL_MERC_COND_VENDA').AsFloat <> 0 then
    begin
      if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
         ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
        TB_Adicao_DI.FieldbyName('VL_MERC_COND_VENDA').AsFloat := qry_adicao_.FieldByName('VL_MERC_COND_VENDA').AsFloat + VL_DEDUCAO_MNEG
      else
        TB_Adicao_DI.FieldbyName('VL_MERC_COND_VENDA').AsFloat := qry_adicao_.FieldByName('VL_MERC_COND_VENDA').AsFloat;
    end;
    if qry_adicao_.FieldByName('VL_MERC_VENDA_MN').AsFloat <> 0 then
    begin
      if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
         ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
        TB_Adicao_DI.FieldbyName('VL_MERC_VENDA_MN').AsFloat := qry_adicao_.FieldByName('VL_MERC_VENDA_MN').AsFloat + VL_DEDUCAO_MN
      else
        TB_Adicao_DI.FieldbyName('VL_MERC_VENDA_MN').AsFloat := qry_adicao_.FieldByName('VL_MERC_VENDA_MN').AsFloat;
    end;

    // Modalidade Nacionalizacao DEA
    if ( cTipoDecla = '17' ) or ( cTipoDecla = '16' ) then
    begin
      if qry_adicao_.FieldByName('VL_FRETE_MERC_MNEG').AsFloat <> 0 then
      begin
        TB_Adicao_DI.FieldbyName('VL_FRETE_MERC_MNEG').AsFloat := qry_adicao_.FieldByName('VL_FRETE_MERC_MNEG').AsFloat;
      end;
      if qry_adicao_.FieldByName('CD_MD_FRETE_MERC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldbyName('CD_MD_FRETE_MERC').AsString := qry_adicao_.FieldByName('CD_MD_FRETE_MERC').AsString;
      end;
      if qry_adicao_.FieldByName('VL_SEG_MERC_MNEG').AsFloat <> 0 then
      begin
        TB_Adicao_DI.FieldbyName('VL_SEG_MERC_MNEG').AsFloat := qry_adicao_.FieldByName('VL_SEG_MERC_MNEG').AsFloat;
      end;
      if qry_adicao_.FieldByName('CD_MOEDA_SEG_MERC').AsString <> '' then
      begin
        TB_Adicao_DI.FieldbyName('CD_MOEDA_SEG_MERC').AsString := qry_adicao_.FieldByName('CD_MOEDA_SEG_MERC').AsString;
      end;
    end;
    if qry_adicao_.FieldByName('VL_FRETE_MERC_MN').AsFloat <> 0 then
    begin
      TB_Adicao_DI.FieldbyName('VL_FRETE_MERC_MN').AsFloat := qry_adicao_.FieldByName('VL_FRETE_MERC_MN').AsFloat;
    end;
    if qry_adicao_.FieldByName('VL_SEG_MERC_MN').AsFloat <> 0 then
    begin
      TB_Adicao_DI.FieldbyName('VL_SEG_MERC_MN').AsFloat := qry_adicao_.FieldByName('VL_SEG_MERC_MN').AsFloat;
    end;
    TB_Adicao_DI.FieldbyName('VL_UNID_LOC_EMP').AsFloat := 0;
    if qry_adicao_.FieldByName('CD_METOD_VALORACAO').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_METOD_VALORACAO').AsString := qry_adicao_.FieldByName('CD_METOD_VALORACAO').AsString;
    end
    else
    begin
      TB_Adicao_DI.FieldbyName('CD_METOD_VALORACAO').AsString := '01';
    end;
    if qry_adicao_.FieldByName('CD_VINC_IMPO_EXPO').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_VINC_IMPO_EXPO').AsString := qry_adicao_.FieldByName('CD_VINC_IMPO_EXPO').AsString;
    end
    else
    begin
      TB_Adicao_DI.FieldbyName('CD_VINC_IMPO_EXPO').AsString := '1';
    end;
    if qry_adicao_.FieldByName('CD_TIPO_ACORDO_TAR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_TIPO_ACORDO_TAR').AsString := qry_adicao_.FieldByName('CD_TIPO_ACORDO_TAR').AsString;
    end;
    if qry_adicao_.FieldByName('CD_ACORDO_ALADI').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_ACORDO_ALADI').AsString := qry_adicao_.FieldByName('CD_ACORDO_ALADI').AsString;
    end;
    if qry_adicao_.FieldByName('CD_REGIME_TRIBUTAR').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_REGIME_TRIBUTAR').AsString := qry_adicao_.FieldByName('CD_REGIME_TRIBUTAR').AsString;
    end;
    if qry_adicao_.FieldByName('CD_FUND_LEG_REGIME').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_FUND_LEG_REGIME').AsString := qry_adicao_.FieldByName('CD_FUND_LEG_REGIME').AsString;
    end;

    // Só para Admissão Temporária
    if qry_adicao_.FieldByName('CD_MOTIVO_ADM_TEMP').AsString <> '' then
    begin
      if ( cTipoDecla = '05' ) or ( '12'= cTipoDecla)  then
      begin
        // Tem que ser motivo 05-Adm.Temp. e 12-Consumo e Adm.Temp
        TB_Adicao_DI.FieldbyName('CD_MOTIVO_ADM_TEMP').AsString := qry_adicao_.FieldByName('CD_MOTIVO_ADM_TEMP').AsString;
      end;
    end;

    if ( cTipoDecla = '19' ) then
    begin
      if qry_adicao_.FieldByName('PC_COEF_REDUC_II').AsString <> '' then
      begin
        TB_Adicao_DI.FieldbyName('PC_COEF_REDUC_II').AsString := qry_adicao_.FieldByName('PC_COEF_REDUC_II').AsString;
      end;
    end;
    qry_pagto_prev_.Close;
    qry_pagto_prev_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_pagto_prev_.ParamByName('NR_ADICAO').AsString   := cAdicao;
    qry_pagto_prev_.Prepare;
    qry_pagto_prev_.Open;
    if ( Not qry_pagto_prev_.EOF ) and ( qry_adicao_.FieldByName('IN_PGTO_VARIAV_360').AsBoolean ) then
    begin
      TB_Adicao_DI.FieldbyName('IN_PGTO_VARIAV_360').AsBoolean := True;
    end
    else
    begin
      TB_Adicao_DI.FieldbyName('IN_PGTO_VARIAV_360').AsBoolean := False;
      if qry_adicao_.FieldByName('CD_COBERT_CAMBIAL').AsInteger <> 4 then
      begin
        if qry_adicao_.FieldByName('QT_PARC_FINANC_360').AsString > '0' then
        begin
          if qry_adicao_.FieldByName('QT_PARC_FINANC_360').AsString <> '' then
          begin
            TB_Adicao_DI.FieldbyName('QT_PARC_FINANC_360').AsString := qry_adicao_.FieldByName('QT_PARC_FINANC_360').AsString;
          end;
          if qry_adicao_.FieldByName('QT_PERIOD_PGTO_360').AsString <> '' then
          begin
            TB_Adicao_DI.FieldbyName('QT_PERIOD_PGTO_360').AsString := qry_adicao_.FieldByName('QT_PERIOD_PGTO_360').AsString;
          end;
          if qry_adicao_.FieldByName('VL_TOT_FINANC_360').AsFloat <> 0 then
          begin
            if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
               ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
               TB_Adicao_DI.FieldbyName('VL_TOT_FINANC_360').AsFloat := qry_adicao_.FieldByName('VL_TOT_FINANC_360').AsFloat + VL_DEDUCAO_MNEG
            else
               TB_Adicao_DI.FieldbyName('VL_TOT_FINANC_360').AsFloat := qry_adicao_.FieldByName('VL_TOT_FINANC_360').AsFloat;
          end;
          if qry_adicao_.FieldByName('CD_PERIOD_PGTO_360').AsString <> '' then
          begin
            if StrToInt( qry_adicao_.FieldByName('CD_PERIOD_PGTO_360').AsString ) in [1,2] then
              TB_Adicao_DI.FieldbyName('CD_PERIOD_PGTO_360').AsString := qry_adicao_.FieldByName('CD_PERIOD_PGTO_360').AsString;
          end;
        end;
      end;
    end;
    qry_pagto_prev_.Close;

    // Usado Pelo SISCOMEX
    TB_Adicao_DI.FieldbyName('IN_JUROS_ATE_360').AsBoolean := False;
    TB_Adicao_DI.FieldbyName('VL_COMISSAO_AG_IMP').AsInteger := 0;

    // Este Campo aponta para o Grupo de Radio do Cambio
    if qry_adicao_.FieldByName('CD_COBERT_CAMBIAL').AsInteger <> 0 then
    begin
      TB_Adicao_DI.FieldbyName('CD_COBERT_CAMBIAL').AsInteger := qry_adicao_.FieldByName('CD_COBERT_CAMBIAL').AsInteger;
    end;

    // agente de cambio
    if ( Trim( qry_adicao_.FieldByName('NR_AGENTE_IMP').AsString ) <> '' ) then
    begin
      if qry_adicao_.FieldByName('CD_TIPO_AGENTE_IMP').AsString <> '' then
         TB_Adicao_DI.FieldbyName('CD_TIPO_AGENTE_IMP').AsString := qry_adicao_.FieldByName('CD_TIPO_AGENTE_IMP').AsString;
      if qry_adicao_.FieldByName('NR_AGENTE_IMP').AsString <> '' then
         TB_Adicao_DI.FieldbyName('NR_AGENTE_IMP').AsString := qry_adicao_.FieldByName('NR_AGENTE_IMP').AsString;
      if qry_adicao_.FieldByName('CD_BANC_AGENTE_IMP').AsString <> '' then
         TB_Adicao_DI.FieldbyName('CD_BANC_AGENTE_IMP').AsString := qry_adicao_.FieldByName('CD_BANC_AGENTE_IMP').AsString;
      if qry_adicao_.FieldByName('CD_AGENC_AGENT_IMP').AsString <> '' then
         TB_Adicao_DI.FieldbyName('CD_AGENC_AGENT_IMP').AsString := qry_adicao_.FieldByName('CD_AGENC_AGENT_IMP').AsString;
    end;
    if qry_adicao_.FieldbyName('PC_COMISSAO_AG_IMP').AsFloat <> 0 then
    begin
      TB_Adicao_DI.FieldbyName('PC_COMISSAO_AG_IMP').AsFloat := qry_adicao_.FieldbyName('PC_COMISSAO_AG_IMP').AsFloat;
    end;
    if qry_adicao_.FieldbyName('CD_MODALIDADE_PGTO').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_MODALIDADE_PGTO').AsString := qry_adicao_.FieldbyName('CD_MODALIDADE_PGTO').AsString;
    end;
    if qry_adicao_.FieldbyName('CD_ORGAO_FIN_INTER').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_ORGAO_FIN_INTER').AsString := qry_adicao_.FieldbyName('CD_ORGAO_FIN_INTER').AsString;
    end;
    if qry_adicao_.FieldbyName('CD_MOTIVO_SEM_COB').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_MOTIVO_SEM_COB').AsString := qry_adicao_.FieldbyName('CD_MOTIVO_SEM_COB').AsString;
    end;
    if qry_adicao_.FieldbyName('CD_TAXA_JUROS').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('CD_TAXA_JUROS').AsString := qry_adicao_.FieldbyName('CD_TAXA_JUROS').AsString;
    end;
    if qry_adicao_.FieldbyName('PC_TAXA_JUROS').AsFloat <> 0 then
    begin
      TB_Adicao_DI.FieldbyName('PC_TAXA_JUROS').AsFloat := qry_adicao_.FieldbyName('PC_TAXA_JUROS').AsFloat;
    end;
    if qry_adicao_.FieldbyName('VL_FINANC_SUP_360').AsFloat <> 0 then
    begin
      if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
         ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
         TB_Adicao_DI.FieldbyName('VL_FINANC_SUP_360').AsFloat := qry_adicao_.FieldbyName('VL_FINANC_SUP_360').AsFloat + VL_DEDUCAO_MNEG
      else
         TB_Adicao_DI.FieldbyName('VL_FINANC_SUP_360').AsFloat := qry_adicao_.FieldbyName('VL_FINANC_SUP_360').AsFloat;
    end;
    if qry_adicao_.FieldbyName('NR_ROF').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('NR_ROF').AsString := qry_adicao_.FieldbyName('NR_ROF').AsString;
    end;

    TB_Adicao_DI.FieldbyName('IN_BEM_ENCOMENDA').AsBoolean := qry_adicao_.FieldbyName('IN_BEM_ENCOMENDA').AsBoolean;
    TB_Adicao_DI.FieldbyName('IN_MATERIAL_USADO').AsBoolean := qry_adicao_.FieldbyName('IN_MATERIAL_USADO').AsBoolean;

    if Length( qry_adicao_.FieldbyName('TX_COMPL_VL_ADUAN').AsString ) > 0 then
    begin
      TB_Adicao_DI.FieldByName('TX_COMPL_VL_ADUAN').Assign( qry_adicao_.FieldbyName('TX_COMPL_VL_ADUAN'));
    end
    else
    begin
      TB_Adicao_DI.FieldByName('TX_COMPL_VL_ADUAN').AsString := ' ';
    end;
    TB_Adicao_DI.FieldbyName('IN_IPI_NAO_TRIBUT').AsBoolean :=  qry_adicao_.FieldbyName('IN_IPI_NAO_TRIBUT').AsBoolean;
    if qry_adicao_.FieldbyName('VL_MERC_LOC_EMB_MN').AsFloat <> 0 then
    begin
      if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
         ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
         VL_MERC_LOC_EMB_MN := qry_adicao_.FieldbyName('VL_MERC_LOC_EMB_MN').AsFloat + VL_DEDUCAO_MNEG
      else
         VL_MERC_LOC_EMB_MN := qry_adicao_.FieldbyName('VL_MERC_LOC_EMB_MN').AsFloat;
      {Retira Frete Embutido nos itens}
      if IN_EMBUT_FRT_ITENS then VL_MERC_LOC_EMB_MN := VL_MERC_LOC_EMB_MN - qry_adicao_.FieldByName('VL_FRETE_MERC_MN').AsFloat;
      {Retira Seguro Embutido nos itens}
      if IN_EMBUT_SEG_ITENS then VL_MERC_LOC_EMB_MN := VL_MERC_LOC_EMB_MN - qry_adicao_.FieldByName('VL_SEG_MERC_MN').AsFloat;
      TB_Adicao_DI.FieldbyName('VL_MERC_LOC_EMB_MN').AsFloat := VL_MERC_LOC_EMB_MN;
    end;
    if qry_adicao_.FieldbyName('VL_BASE_CALC_II').AsFloat <> 0 then
    begin
      TB_Adicao_DI.FieldbyName('VL_BASE_CALCULO_MN').AsFloat := qry_adicao_.FieldbyName('VL_BASE_CALC_II').AsFloat;
    end;
    if qry_adicao_.FieldbyName('NR_OPER_TRAT_PREV').AsString <> '' then
    begin
      TB_Adicao_DI.FieldbyName('NR_OPER_TRAT_PREV').AsString := qry_adicao_.FieldbyName('NR_OPER_TRAT_PREV').AsString;
    end;
    // Criado para enviar a aliquota do FECP junto com a do ICMS se tiver - Michel] - 31/03/2010
    if qry_adicao_IN_FUNDO_POBREZA.AsString = '1' then
      TB_Adicao_DI.FieldbyName('VL_ALIQ_ICMS').AsFloat := qry_adicao_.FieldByName('PC_ICMS').AsFloat + Pc_Fundo_Pobreza
    else
      TB_Adicao_DI.FieldbyName('VL_ALIQ_ICMS').AsFloat := qry_adicao_.FieldByName('PC_ICMS').AsFloat;
    TB_Adicao_DI.FieldbyName('IN_REDUC_BASE_CALC').AsBoolean := ( qry_adicao_.FieldByName('PC_REDUCAO_ICMS').AsFloat > 0 );
    if qry_adicao_.FieldByName('CD_FUND_LEGAL_ICMS').AsString <> '' then
      TB_Adicao_DI.FieldbyName('CD_FUND_LEG_REDUC').AsString := qry_adicao_.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
    if qry_adicao_.FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString <> '' then
    begin
      case qry_adicao_.FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
        1 : TB_Adicao_DI.FieldbyName('CD_REGIME_TRIBUTAR_PISCOFINS').AsString := '1';
        2 : TB_Adicao_DI.FieldbyName('CD_REGIME_TRIBUTAR_PISCOFINS').AsString := '3';
        3 : TB_Adicao_DI.FieldbyName('CD_REGIME_TRIBUTAR_PISCOFINS').AsString := '4';
        4 : TB_Adicao_DI.FieldbyName('CD_REGIME_TRIBUTAR_PISCOFINS').AsString := '5';
        5 : TB_Adicao_DI.FieldbyName('CD_REGIME_TRIBUTAR_PISCOFINS').AsString := '6';
      end;
    end;
    if Trim(qry_adicao_.FieldByName('CD_FUND_LEGAL_PISCOFINS').AsString) <> '' then
      TB_Adicao_DI.FieldbyName('CD_FUND_LEG_REGIME_PISCOFINS').AsString := qry_adicao_.FieldByName('CD_FUND_LEGAL_PISCOFINS').AsString;
    TB_Adicao_DI.Post;
    // gravando tributos ( pis e cofins )
    TB_Tributos.Append;
    TB_Tributos.FieldbyName('NR_DECL_IMP_MICRO').AsString  := cProcSCX;
    TB_Tributos.FieldbyName('NR_OP_IMP_MICRO').AsString    := cAdicao;
    TB_Tributos.FieldbyName('CD_RECEITA_IMPOSTO').AsString := '0005';
    TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := Conv_VirgPonto(qry_adicao_.FieldbyName('ALIQ_PIS').AsString);
    // Alíquota Reduzida não transmitia e então não calculava redução no siscomex - Michel - 18/11/2011
    TB_Tributos.FieldbyName('PC_ALIQ_REDUZIDA').Value := qry_adicao_.FieldbyName('PC_REDUCAO_PIS_COFINS').Value;
    
    if qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat > 0 then
      TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '2'
    else
      TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '1';
    if qry_adicao_NM_UNID_MEDIDA_PIS.AsString <> '' then
      TB_Tributos.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString   := qry_adicao_NM_UNID_MEDIDA_PIS.AsString;
    TB_Tributos.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat      := qry_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat;
    TB_Tributos.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat       := qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat;
    TB_Tributos.Post;
    TB_Tributos.Append;
    TB_Tributos.FieldbyName('NR_DECL_IMP_MICRO').AsString  := cProcSCX;
    TB_Tributos.FieldbyName('NR_OP_IMP_MICRO').AsString    := cAdicao;
    TB_Tributos.FieldbyName('CD_RECEITA_IMPOSTO').AsString := '0006';
    TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := Conv_VirgPonto(qry_adicao_.FieldbyName('ALIQ_COFINS').AsString);
    // Alíquota Reduzida não transmitia e então não calculava redução no siscomex - Michel - 18/11/2011
    TB_Tributos.FieldbyName('PC_ALIQ_REDUZIDA').Value := qry_adicao_.FieldbyName('PC_REDUCAO_PIS_COFINS').Value;
    if qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat > 0 then
      TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '2'
    else
      TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '1';
    if qry_adicao_NM_UNID_MEDIDA_COFINS.AsString <> '' then
      TB_Tributos.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString   := qry_adicao_NM_UNID_MEDIDA_COFINS.AsString;
    TB_Tributos.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat      := qry_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat;
    TB_Tributos.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat       := qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat;
    TB_Tributos.Post;
    // final
  end;
end;

procedure Tfrm_trans_DI.Tributos;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Tributos ... ';
  with datm_trans_DI do
  begin
    // * -----------------------  Tratamento do I.I.-------------------------*
    qry_tributos_.Close;
    qry_tributos_.ParamByName('NR_PROCESSO').AsString        := cProcBroker;
    qry_tributos_.ParamByName('NR_ADICAO').AsString          := cAdicao;
    qry_tributos_.ParamByName('CD_RECEITA_IMPOSTO').AsString := '0001';
    qry_tributos_.Prepare;
    qry_tributos_.Open;
    if Not qry_tributos_.EOF then
    begin
      if ( qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat <> 0 ) and
         ( qry_adicao_.FieldbyName('CD_REGIME_TRIBUTAR').AsString <> '6' ) then
      begin
        if TB_Tributos.FindKey( [cProcSCX,cAdicao,'0001'] ) then
        begin
          TB_Tributos.Edit;
        end
        else
        begin
          TB_Tributos.Append;
          TB_Tributos.FieldbyName('NR_DECL_IMP_MICRO').AsString  := cProcSCX;
          TB_Tributos.FieldbyName('NR_OP_IMP_MICRO').AsString    := cAdicao;
          TB_Tributos.FieldbyName('CD_RECEITA_IMPOSTO').AsString := '0001';
        end;

        TipoAliqImposto( 1 );

        if ( qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat <> 0 ) then
        begin
          TB_Tributos.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat := qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat
        end;
        if ( qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString <> '' ) then
        begin
          TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := Conv_VirgPonto(qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString);
        end
        else
        begin
          TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := 0;
        end;
        TB_Tributos.FieldbyName('VL_CALC_IPT_ESPEC').AsFloat := 0;
        if ( qry_tributos_.FieldbyName('VL_CALC_IPT_ADVAL').AsFloat <> 0 ) then
        begin
          TB_Tributos.FieldbyName('VL_CALC_IPT_ADVAL').AsFloat := qry_tributos_.FieldbyName('VL_CALC_IPT_ADVAL').AsFloat
        end;
        if ( qry_tributos_.FieldbyName('PC_ALIQ_REDUZIDA').AsString <> '' ) and
           ( qry_tributos_.FieldbyName('PC_ALIQ_REDUZIDA').AsString <> '0' ) then
        begin
          //Andressa - modificada a verificação para repassar os dados do campo PC_ALIQ_REDUZIDA
          if  ( qry_tributos_.FieldbyName('PC_REDUCAO_IPT_BLI').AsInteger = 0 )  then
             TB_Tributos.FieldbyName('PC_ALIQ_REDUZIDA').AsFloat := Conv_VirgPonto(qry_tributos_.FieldbyName('PC_ALIQ_REDUZIDA').AsString);
//        end
//        else
//        begin
//          if qry_adicao_.FieldByName('CD_REGIME_TRIBUTAR').AsString = '4' then TB_Tributos.FieldbyName('PC_ALIQ_REDUZIDA').AsFloat := 0;
        end;

        if ( qry_tributos_.FieldbyName('PC_REDUCAO_IPT_BLI').AsString <> '' ) and
           ( qry_tributos_.FieldbyName('PC_REDUCAO_IPT_BLI').AsString <> '0' ) then
        begin
          TB_Tributos.FieldbyName('PC_REDUCAO_IPT_BLI').AsFloat := Conv_VirgPonto(qry_tributos_.FieldbyName('PC_REDUCAO_IPT_BLI').AsString);
//        end
//        else
//        begin
//          TB_Tributos.FieldbyName('PC_REDUCAO_IPT_BLI').AsFloat := 0;
        end;
//        if ( qry_tributos_.FieldbyName('PC_ALIQ_ACOR_TARIF').AsString <> '' ) and
//           ( qry_tributos_.FieldbyName('PC_ALIQ_ACOR_TARIF').AsString <> '0' ) then
        if datm_trans_di.TB_Adicao_DI.FieldbyName('CD_TIPO_ACORDO_TAR').AsString <> '' then  // By Vítor Zanin 30-06-2010
        begin
          TB_Tributos.FieldbyName('PC_ALIQ_ACOR_TARIF').AsFloat := Conv_VirgPonto(qry_tributos_.FieldbyName('PC_ALIQ_ACOR_TARIF').AsString);
//        end
//        else
//        begin
//          TB_Tributos.FieldbyName('PC_ALIQ_ACOR_TARIF').AsFloat := 0;
        end;
        TB_Tributos.FieldbyName('VL_CALC_II_AC_TARI').AsFloat := qry_tributos_.FieldbyName('VL_CALC_II_AC_TARI').AsFloat;
        if ( qry_tributos_.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat <> 0 ) then
        begin
          TB_Tributos.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat := qry_tributos_.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat
        end;
        if ( qry_tributos_.FieldbyName('VL_IPT_A_RECOLHER').AsFloat <> 0 ) then
        begin
          // Não transmitir quando Admissão Temporária - Michel - 27/03/2010
          if not InAdmissaoTemporaria then
            TB_Tributos.FieldbyName('VL_IPT_A_RECOLHER').AsFloat := qry_tributos_.FieldbyName('VL_IPT_A_RECOLHER').AsFloat
        end;
        TB_Tributos.Post;
      end
    end;

    // * -----------------------  Tratamento do I.P.I  ----------------------*
    if ( qry_adicao_.FieldbyName('CD_REGIME_TRIBUTAR').AsString <> '2' ) and
       ( qry_adicao_.FieldbyName('CD_REGIME_TRIBUTAR').AsString <> '6' ) then
    begin
      qry_tributos_.Close;
      qry_tributos_.ParamByName('NR_PROCESSO').AsString        := cProcBroker;
      qry_tributos_.ParamByName('NR_ADICAO').AsString          := cAdicao;
      qry_tributos_.ParamByName('CD_RECEITA_IMPOSTO').AsString := '0002';
      qry_tributos_.Prepare;
      qry_tributos_.Open;
      if not qry_tributos_.EOF then
      begin
        if ( qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat <> 0 ) and
           ( ( Not qry_adicao_.FieldbyName('IN_IPI_NAO_TRIBUT').AsBoolean ) ) then
        begin
          if TB_Tributos.FindKey( [cProcSCX,cAdicao,'0002'] ) then
          begin
            TB_Tributos.Edit;
          end
          else
          begin
            TB_Tributos.Append;
            TB_Tributos.FieldbyName('NR_DECL_IMP_MICRO').AsString  := cProcSCX;
            TB_Tributos.FieldbyName('NR_OP_IMP_MICRO').AsString    := cAdicao;
            TB_Tributos.FieldbyName('CD_RECEITA_IMPOSTO').AsString := '0002';
          end;
          TipoAliqImposto( 2 );

          if ( qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat <> 0 ) then
          begin
            TB_Tributos.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat := qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat;
          end;
          if ( qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString <> '' ) then
          begin
            TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := Conv_VirgPonto(qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString);
          end
          else
          begin
            TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := 0;
          end;
          if ( qry_tributos_.FieldbyName('CD_TIPO_BENEF_IPI').AsString <> '' ) then
          begin
            TB_Tributos.FieldbyName('CD_TIPO_BENEF_IPI').AsString := qry_tributos_.FieldbyName('CD_TIPO_BENEF_IPI').AsString;
          end;
          if ( qry_tributos_.FieldbyName('PC_ALIQ_REDUZIDA').AsString <> '' ) and
             ( qry_tributos_.FieldbyName('PC_ALIQ_REDUZIDA').AsString <> '0' ) then
          begin
            TB_Tributos.FieldbyName('PC_ALIQ_REDUZIDA').AsFloat := Conv_VirgPonto(qry_tributos_.FieldbyName('PC_ALIQ_REDUZIDA').AsString);
//          end
//          else
//          begin
//            TB_Tributos.FieldbyName('PC_ALIQ_REDUZIDA').AsFloat := 0;
          end;
          if ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat <> 0 ) then
          begin
            TB_Tributos.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat := qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat;
          end;
          if ( qry_tributos_.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString <> '' ) then
          begin
            TB_Tributos.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString := qry_tributos_.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString;
          end;
          TB_Tributos.FieldbyName('VL_CALC_IPT_ESPEC').AsFloat := 0;
          if ( qry_tributos_.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat <> 0 ) then
          begin
            TB_Tributos.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat := qry_tributos_.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat;
          end;
          if ( qry_tributos_.FieldbyName('QT_ML_RECIPIENTE').AsFloat <> 0 ) then
          begin
            TB_Tributos.FieldbyName('QT_ML_RECIPIENTE').AsFloat := qry_tributos_.FieldbyName('QT_ML_RECIPIENTE').AsFloat;
          end;
          if ( qry_tributos_.FieldbyName('CD_TIPO_RECIPIENTE').AsString <> '' ) then
          begin
            TB_Tributos.FieldbyName('CD_TIPO_RECIPIENTE').AsString := qry_tributos_.FieldbyName('CD_TIPO_RECIPIENTE').AsString;
          end;
          if ( qry_tributos_.FieldbyName('NR_NOTA_COMPL_TIPI').AsString <> '' ) then
          begin
            TB_Tributos.FieldbyName('NR_NOTA_COMPL_TIPI').AsString := qry_tributos_.FieldbyName('NR_NOTA_COMPL_TIPI').AsString;
          end;
          if ( qry_tributos_.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat <> 0 ) then
          begin
            TB_Tributos.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat := qry_tributos_.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat;
          end;
          if ( qry_tributos_.FieldbyName('VL_IPT_A_RECOLHER').AsFloat <> 0 ) then
          begin
            // Não transmitir quando Admissão Temporária - Michel - 27/03/2010
            if not InAdmissaoTemporaria then
              TB_Tributos.FieldbyName('VL_IPT_A_RECOLHER').AsFloat := qry_tributos_.FieldbyName('VL_IPT_A_RECOLHER').AsFloat;
          end;
          TB_Tributos.Post;
        end;
      end;
    end
    else
    begin
      qry_tributos_.Close;
      qry_tributos_.ParamByName('NR_PROCESSO').AsString        := cProcBroker;
      qry_tributos_.ParamByName('NR_ADICAO').AsString          := cAdicao;
      qry_tributos_.ParamByName('CD_RECEITA_IMPOSTO').AsString := '0002';
      qry_tributos_.Prepare;
      qry_tributos_.Open;
      if not qry_tributos_.EOF then
      begin
        qry_tributos_.Delete;
      end;
      qry_tributos_.Close;
    end;

    // * -----------------  Tratamento do Anti-Dumping  ---------------------*
    qry_tributos_.Close;
    qry_tributos_.ParamByName('NR_PROCESSO').AsString        := cProcBroker;
    qry_tributos_.ParamByName('NR_ADICAO').AsString          := cAdicao;
    qry_tributos_.ParamByName('CD_RECEITA_IMPOSTO').AsString := '0003';
    qry_tributos_.Prepare;
    qry_tributos_.Open;
    if not qry_tributos_.EOF then
    begin
      if ( qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat <> 0 ) then
      begin
        if TB_Tributos.FindKey( [cProcSCX,cAdicao,'0003'] ) then
        begin
          TB_Tributos.Edit;
        end
        else
        begin
          TB_Tributos.Append;
          TB_Tributos.FieldbyName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          TB_Tributos.FieldbyName('NR_OP_IMP_MICRO').AsString := cAdicao;
          TB_Tributos.FieldbyName('CD_RECEITA_IMPOSTO').AsString := '0003';
        end;
        TipoAliqImposto( 3 );

        TB_Tributos.FieldbyName('VL_CALC_IPT_ESPEC').AsFloat := 0;
        if ( qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat <> 0 ) then
        begin
          TB_Tributos.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat := qry_tributos_.FieldbyName('VL_BASE_CALC_ADVAL').AsFloat
        end;
        if ( qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString <> '' ) then
        begin
          TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := Conv_VirgPonto(qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString);
        end
        else
        begin
          TB_Tributos.FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat := 0;
        end;
        TB_Tributos.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat := qry_tributos_.FieldbyName('VL_IMPOSTO_DEVIDO').AsFloat;
        TB_Tributos.FieldbyName('VL_IPT_A_RECOLHER').AsFloat := qry_tributos_.FieldbyName('VL_IPT_A_RECOLHER').AsFloat;
        if ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat <> 0 ) then
        begin
          TB_Tributos.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat := qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat
        end;

        if ( qry_tributos_.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString <> '' ) then
        begin
          TB_Tributos.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString := qry_tributos_.FieldbyName('NM_UN_ALIQ_ESP_IPT').AsString;
        end;
        if ( qry_tributos_.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat <> 0 ) then
        begin
          TB_Tributos.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat := qry_tributos_.FieldbyName('QT_MERC_UN_ALIQ_ES').AsFloat
        end;
        TB_Tributos.Post;
      end;
    end;
    qry_tributos_.Close;
  end;
end;

procedure Tfrm_trans_DI.TipoAliqImposto(cTipoImposto : Integer);
begin
  with datm_trans_DI do
  begin
    case cTipoImposto of
    1 : TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '1';
    2 : begin
          if ( qry_tributos_.FieldbyName('CD_TIPO_ALIQ_IPT').AsString <> '' ) then
          begin
            if ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat = 0 ) then
            begin
              TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '1';
            end
            else
            begin
              if qry_tributos_.FieldbyName('CD_TIPO_ALIQ_IPT').AsString <> '' then
              begin
                if ( StrToInt(qry_tributos_.FieldbyName('CD_TIPO_ALIQ_IPT').AsString) = 0 ) and
                   ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat > 0 ) then
                begin
                  TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '2';
                end
                else
                begin
                  if ( StrToInt(qry_adicao_.FieldbyName('CD_TIPO_ALIQ_IPT').AsString) > 0 ) and
                     ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat > 0 ) then
                  begin
                    TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '3';
                  end;
                end;
              end;
            end;
          end;
        end;
    3 : begin
        if ( qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString <> '' ) then
        begin
          if ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat = 0 ) then
          begin // Aliquota Normal
            TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '1';
          end
          else
          begin
            if qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString <> '' then
            begin
              if ( StrToInt(qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString) = 0 ) and
                 ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat > 0 ) then
              begin // Aliquota Normal
                TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '2';
              end
              else
              begin
                if ( StrToInt(qry_tributos_.FieldbyName('PC_ALIQ_NORM_ADVAL').AsString) > 0 ) and
                   ( qry_tributos_.FieldbyName('VL_ALIQ_ESPEC_IPT').AsFloat > 0 ) then
                begin
                  TB_Tributos.FieldbyName('CD_TIPO_ALIQ_IPT').AsString := '3';
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_trans_DI.AtoVinculadoDI;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Ato Vinculado ... ';
  // Ato do NCM
  with datm_trans_DI do
  begin
    qry_ato_vinculado_.Close;
    qry_ato_vinculado_.ParamByName('NR_PROCESSO').AsString       := cProcBroker;
    qry_ato_vinculado_.ParamByName('NR_ADICAO').AsString         := cAdicao;
    qry_ato_vinculado_.ParamByName('CD_ASSUNTO_VINCUL').AsString := '1';
    qry_ato_vinculado_.Prepare;
    qry_ato_vinculado_.Open;
    if not qry_ato_vinculado_.EOF then
    begin
      if qry_ato_vinculado_.FieldbyName('NR_EX_ATO_VINCUL').AsString <> '' then
      begin
        if TB_Ato_Vinculado.FindKey( [cProcSCX,cAdicao,'1'] ) then
        begin
          TB_Ato_Vinculado.Edit;
        end
        else
        begin
          TB_Ato_Vinculado.Append;
          TB_Ato_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          TB_Ato_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
          TB_Ato_Vinculado.FieldByName('CD_ASSUNTO_VINCUL').AsString := '1';
        end;
        TB_Ato_Vinculado.FieldByName('SG_TIPO_ATO_VINCUL').AsString := Copy(qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString,1,5); // Texto 5
        TB_Ato_Vinculado.FieldByName('SG_ORG_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('DT_ANO_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('NR_ATO_VINCULADO').AsString   := qry_ato_vinculado_.FieldByName('NR_ATO_VINCULADO').AsString;
        if qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString <> '' then
        begin
          TB_Ato_Vinculado.FieldByName('NR_EX_ATO_VINCUL').AsString := qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString;
        end;
        TB_Ato_Vinculado.Post;
      end;
    end;

    qry_ato_vinculado_.Close;
    qry_ato_vinculado_.ParamByName('NR_PROCESSO').AsString       := cProcBroker;
    qry_ato_vinculado_.ParamByName('NR_ADICAO').AsString         := cAdicao;
    qry_ato_vinculado_.ParamByName('CD_ASSUNTO_VINCUL').AsString := '2';
    qry_ato_vinculado_.Prepare;
    qry_ato_vinculado_.Open;
    if not qry_ato_vinculado_.EOF then
    begin
      // Ato do NBM
      if ( qry_ato_vinculado_.FieldbyName('NR_EX_ATO_VINCUL').AsString <> '' ) then
      begin
        if TB_Ato_Vinculado.FindKey( [cProcSCX,cAdicao,'2'] ) then
        begin
          TB_Ato_Vinculado.Edit;
        end
        else
        begin
          TB_Ato_Vinculado.Append;
          TB_Ato_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          TB_Ato_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
          TB_Ato_Vinculado.FieldByName('CD_ASSUNTO_VINCUL').AsString := '2';
        end;
        TB_Ato_Vinculado.FieldByName('SG_TIPO_ATO_VINCUL').AsString := Copy(qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString,1,5); // Texto 5
        TB_Ato_Vinculado.FieldByName('SG_ORG_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('DT_ANO_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('NR_ATO_VINCULADO').AsString   := qry_ato_vinculado_.FieldByName('NR_ATO_VINCULADO').AsString;
        if qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString <> '' then
        begin
          TB_Ato_Vinculado.FieldByName('NR_EX_ATO_VINCUL').AsString := qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString;
        end;
        TB_Ato_Vinculado.Post;
      end;
    end;

    qry_ato_vinculado_.Close;
    qry_ato_vinculado_.ParamByName('NR_PROCESSO').AsString       := cProcBroker;
    qry_ato_vinculado_.ParamByName('NR_ADICAO').AsString         := cAdicao;
    qry_ato_vinculado_.ParamByName('CD_ASSUNTO_VINCUL').AsString := '3';
    qry_ato_vinculado_.Prepare;
    qry_ato_vinculado_.Open;
    if not qry_ato_vinculado_.EOF then
    begin
      // Ato do II
      if ( qry_ato_vinculado_.FieldbyName('NR_ATO_VINCULADO').AsString <> '' ) and
         ( Copy( qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString, 1, 5 ) <> '' ) and
         ( qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString <> '' ) and
         ( qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString <> '' ) then
      begin
        if TB_Ato_Vinculado.FindKey( [cProcSCX,cAdicao,'3'] ) then
        begin
          TB_Ato_Vinculado.Edit;
        end
        else
        begin
          TB_Ato_Vinculado.Append;
          TB_Ato_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          TB_Ato_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
          TB_Ato_Vinculado.FieldByName('CD_ASSUNTO_VINCUL').AsString := '3';
        end;
        TB_Ato_Vinculado.FieldByName('SG_TIPO_ATO_VINCUL').AsString := Copy(qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString,1,5); // Texto 5
        TB_Ato_Vinculado.FieldByName('SG_ORG_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('DT_ANO_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('NR_ATO_VINCULADO').AsString   := qry_ato_vinculado_.FieldByName('NR_ATO_VINCULADO').AsString;
        if qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString <> '' then
        begin
          TB_Ato_Vinculado.FieldByName('NR_EX_ATO_VINCUL').AsString := qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString;
        end;
        TB_Ato_Vinculado.Post;
      end;
    end;

    qry_ato_vinculado_.Close;
    qry_ato_vinculado_.ParamByName('NR_PROCESSO').AsString       := cProcBroker;
    qry_ato_vinculado_.ParamByName('NR_ADICAO').AsString         := cAdicao;
    qry_ato_vinculado_.ParamByName('CD_ASSUNTO_VINCUL').AsString := '5';
    qry_ato_vinculado_.Prepare;
    qry_ato_vinculado_.Open;
    if not qry_ato_vinculado_.EOF then
    begin
      // Ato do II
      if ( qry_ato_vinculado_.FieldbyName('NR_ATO_VINCULADO').AsString <> '' ) and
         ( Copy( qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString, 1, 5 ) <> '' ) and
         ( qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString <> '' ) and
         ( qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString <> '' ) then
      begin
        if TB_Ato_Vinculado.FindKey( [cProcSCX,cAdicao,'5'] ) then
        begin
          TB_Ato_Vinculado.Edit;
        end
        else
        begin
          TB_Ato_Vinculado.Append;
          TB_Ato_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          TB_Ato_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
          TB_Ato_Vinculado.FieldByName('CD_ASSUNTO_VINCUL').AsString := '5';
        end;
        TB_Ato_Vinculado.FieldByName('SG_TIPO_ATO_VINCUL').AsString := Copy(qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString,1,5); // Texto 5
        TB_Ato_Vinculado.FieldByName('SG_ORG_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('DT_ANO_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('NR_ATO_VINCULADO').AsString   := qry_ato_vinculado_.FieldByName('NR_ATO_VINCULADO').AsString;
        if qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString <> '' then
        begin
          TB_Ato_Vinculado.FieldByName('NR_EX_ATO_VINCUL').AsString := qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString;
        end;
        TB_Ato_Vinculado.Post;
      end;
    end;

    //Ato do IPI
    qry_ato_vinculado_.Close;
    qry_ato_vinculado_.ParamByName('NR_PROCESSO').AsString       := cProcBroker;
    qry_ato_vinculado_.ParamByName('NR_ADICAO').AsString         := cAdicao;
    qry_ato_vinculado_.ParamByName('CD_ASSUNTO_VINCUL').AsString := '4';
    qry_ato_vinculado_.Prepare;
    qry_ato_vinculado_.Open;
    if not qry_ato_vinculado_.EOF then
    begin
      if qry_ato_vinculado_.FieldbyName('NR_ATO_VINCULADO').AsString <> '' then
      begin
        if TB_Ato_Vinculado.FindKey( [cProcSCX,cAdicao,'4'] ) then
        begin
          TB_Ato_Vinculado.Edit;
        end
        else
        begin
          TB_Ato_Vinculado.Append;
          TB_Ato_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          TB_Ato_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
          TB_Ato_Vinculado.FieldByName('CD_ASSUNTO_VINCUL').AsString := '4';
        end;
        TB_Ato_Vinculado.FieldByName('SG_TIPO_ATO_VINCUL').AsString := Copy(qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString,1,5); // Texto 5
        TB_Ato_Vinculado.FieldByName('SG_ORG_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('DT_ANO_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('NR_ATO_VINCULADO').AsString   := qry_ato_vinculado_.FieldByName('NR_ATO_VINCULADO').AsString;
        if qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString <> '' then
        begin
          TB_Ato_Vinculado.FieldByName('NR_EX_ATO_VINCUL').AsString := qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString;
        end;
        TB_Ato_Vinculado.Post;
      end;
    end;

    // Ato Antidumping
    qry_ato_vinculado_.Close;
    qry_ato_vinculado_.ParamByName('NR_PROCESSO').AsString       := cProcBroker;
    qry_ato_vinculado_.ParamByName('NR_ADICAO').AsString         := cAdicao;
    qry_ato_vinculado_.ParamByName('CD_ASSUNTO_VINCUL').AsString := '6';
    qry_ato_vinculado_.Prepare;
    qry_ato_vinculado_.Open;
    if not qry_ato_vinculado_.EOF then
    begin
      if qry_ato_vinculado_.FieldbyName('NR_ATO_VINCULADO').AsString <> '' then
      begin
        if TB_Ato_Vinculado.FindKey( [cProcSCX,cAdicao,'6'] ) then
        begin
          TB_Ato_Vinculado.Edit;
        end
        else
        begin
          TB_Ato_Vinculado.Append;
          TB_Ato_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          TB_Ato_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
          TB_Ato_Vinculado.FieldByName('CD_ASSUNTO_VINCUL').AsString := '6';
        end;
        TB_Ato_Vinculado.FieldByName('SG_TIPO_ATO_VINCUL').AsString := Copy(qry_ato_vinculado_.FieldByName('SG_TIPO_ATO_VINCUL').AsString,1,5); //Texto 5
        TB_Ato_Vinculado.FieldByName('SG_ORG_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('SG_ORG_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('DT_ANO_ATO_VINCUL').AsString  := qry_ato_vinculado_.FieldByName('DT_ANO_ATO_VINCUL').AsString;
        TB_Ato_Vinculado.FieldByName('NR_ATO_VINCULADO').AsString   := qry_ato_vinculado_.FieldByName('NR_ATO_VINCULADO').AsString;
        if qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString <> '' then
        begin
          TB_Ato_Vinculado.FieldByName('NR_EX_ATO_VINCUL').AsString := qry_ato_vinculado_.FieldByName('NR_EX_ATO_VINCUL').AsString;
        end;
        TB_Ato_Vinculado.Post;
      end;
    end;
    qry_ato_vinculado_.Close;
  end;
end;

procedure Tfrm_trans_DI.IntegraItem;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Itens da DI ... ';
  with datm_trans_DI do
  begin
    qry_item_.Close;
    qry_item_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_item_.Prepare;
    qry_item_.Open;
    if not qry_item_.EOF then
    begin
      nTotalItens := 0;
      while ( not qry_item_.Eof ) do
      begin
        if qry_item_.FieldByName('NR_ITEM').AsString <> '' then
        begin
          nItemAdicao := StrToInt( qry_item_.FieldByName('NR_ITEM').AsString ) - 1;
          ItemAdicao;
          Inc(nItem);
          lbl_itens.caption := IntToStr(nItem);
          Inc(nTotalItens);
          Application.ProcessMessages;
        end;
        qry_item_.Next;
      end;
    end;
  end;
end;

{function TfrmSiscoDI.Check_001 : Boolean;  // Checa se o nº de Itens esta correto !!!
begin
   datm_trans_DI.RS_Item_Adicao.Close;
   datm_trans_DI.RS_Item_Adicao.SQL.Clear;
   datm_trans_DI.RS_Item_Adicao.SQL.Add('SELECT * FROM DETALHE_MERCADORIA ');
   datm_trans_DI.RS_Item_Adicao.SQL.Add(' WHERE NR_DECL_IMP_MICRO = "'+cProcSCX+'"') ;
   datm_trans_DI.RS_Item_Adicao.Open;

//   RegistrosRecuperados;    // Esta rotina ajusta recordcount da Tabela
   if datm_trans_DI.RS_Item_Adicao.RecordCount <> nTotalItens then begin
      if datm_trans_DI.RS_Item_Adicao.RecordCount <> 0 then begin
         while Not datm_trans_DI.RS_Item_Adicao.EOF do begin
            datm_trans_DI.RS_Item_Adicao.Delete;
         end;
      end;
      datm_trans_DI.adi021.FindNearest([cProcBroker]);
//      Check_001 := False;
      end
   else begin
      Check_001 := True;
   end;
end;}

procedure Tfrm_trans_DI.ItemAdicao;
var
   cAdiItem : string;
begin
  with datm_trans_DI do
  begin
    RS_Item_Adicao.Close;
    RS_Item_Adicao.SQL.Clear;
    RS_Item_Adicao.SQL.Add('SELECT * FROM DETALHE_MERCADORIA ');
    RS_Item_Adicao.SQL.Add(' WHERE NR_DECL_IMP_MICRO = "'+cProcSCX+'"') ;
    RS_Item_Adicao.Prepare;
    RS_Item_Adicao.Open;
    while not RS_TB.EOF do
    begin
      RS_TB.Delete;
    end;
    RS_Item_Adicao.Close;

    cAdiItem := qry_item_.FieldByName('NR_ADICAO').AsString;
    if TB_Item_Adicao.FindKey( [cProcSCX,cAdiItem,nItemAdicao] ) then
    begin
      TB_Item_Adicao.Edit;
    end
    else
    begin
      TB_Item_Adicao.Append;
      TB_Item_Adicao.FieldbyName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Item_Adicao.FieldbyName('NR_OP_IMP_MICRO').AsString   := cAdiItem;
      TB_Item_Adicao.FieldbyName('NU_SEQ_DETALHE').AsInteger   := nItemAdicao;
    end;

    if qry_item_.FieldByName('TX_DESC_DET_MERC').AsString <> '' then
    begin
      TB_Item_Adicao.FieldbyName('TX_DESC_DET_MERC').Assign(qry_item_.FieldByName('TX_DESC_DET_MERC'));
    end
    else
    begin
      TB_Item_Adicao.FieldbyName('TX_DESC_DET_MERC').AsString := ' ';
    end;
    TB_Item_Adicao.FieldbyName('QT_MERC_UN_COMERC').AsString := Num_To_Str(qry_item_.FieldByName('QT_MERC_UN_COMERC').AsFloat, 14, 5);

    qry_unid_medida_.Close;
    qry_unid_medida_.ParamByName('CD_UNID_MEDIDA').AsString := qry_item_.FieldByName('CD_UN_MED_COMERC').AsString;
    qry_unid_medida_.Prepare;
    qry_unid_medida_.Open;
    if not qry_unid_medida_.EOF then
    begin
      if qry_unid_medida_.FieldByName('NM_UNID_MEDIDA').AsString <> '' then
      begin
        TB_Item_Adicao.FieldbyName('NM_UN_MEDID_COMERC').AsString := qry_unid_medida_.FieldByName('NM_UNID_MEDIDA').AsString;
      end;
    end;
    // este campo é número de ponto flutuante e não esta sendo usado até agora
    // 20/12/96 trata-se do valor FOB unitário calculado!
    TB_Item_Adicao.FieldbyName('VL_UNID_LOC_EMB').AsFloat := 0;       // Número (Duplo) 8
    TB_Item_Adicao.FieldbyName('VL_UNID_COND_VENDA').AsString :=
      Num_To_Str( qry_item_.FieldByName('VL_UNID_COND_VENDA').AsFloat +
                  qry_item_.FieldByName('VL_DED_CPT_MNEG').AsFloat, 20, 7 );
    TB_Item_Adicao.Post;
  end;
end;

procedure Tfrm_trans_DI.AcrescimosDI;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Acréscimos da DI ... ';
  with datm_trans_DI do
  begin
    if TB_Oco_Acrescimos.FindKey([cProcSCX,'001']) then
    begin
      while ( not TB_Oco_Acrescimos.EOF ) and
            ( TB_Oco_Acrescimos.FieldByName('NR_DECL_IMP_MICRO').AsString = cProcSCX ) do
      begin
        TB_Oco_Acrescimos.Delete;
      end;
    end;

    qry_di_acrescimos_.Close;
    qry_di_acrescimos_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_di_acrescimos_.Prepare;
    qry_di_acrescimos_.Open;
    while ( not qry_di_acrescimos_.EOF ) do
    begin
      TB_Oco_Acrescimos.Append;
      TB_Oco_Acrescimos.FieldByName('NR_DECL_IMP_MICRO').AsString  := cProcSCX;
      TB_Oco_Acrescimos.FieldByName('NR_OP_IMP_MICRO').AsString    := qry_di_acrescimos_.FieldByName('NR_ADICAO').AsString;
      TB_Oco_Acrescimos.FieldByName('CD_MET_ACRES_VALOR').AsString := qry_di_acrescimos_.FieldByName('CD_MET_ACRES_VALOR').AsString;
      if qry_di_acrescimos_.FieldByName('VL_ACRESCIMO_MOEDA').AsFloat > 0 then
      begin
        TB_Oco_Acrescimos.FieldByName('VL_ACRESCIMO_MOEDA').AsFloat := qry_di_acrescimos_.FieldByName('VL_ACRESCIMO_MOEDA').AsFloat;
      end;
      if qry_di_acrescimos_.FieldByName('CD_MD_NEGOC_ACRES').AsString <> '' then
      begin
        TB_Oco_Acrescimos.FieldByName('CD_MD_NEGOC_ACRES').AsString := qry_di_acrescimos_.FieldByName('CD_MD_NEGOC_ACRES').AsString;
      end;
      if qry_di_acrescimos_.FieldByName('VL_ACRESCIMO_MN').AsFloat > 0 then
      begin
        TB_Oco_Acrescimos.FieldByName('VL_ACRESCIMO_MN').AsFloat := qry_di_acrescimos_.FieldByName('VL_ACRESCIMO_MN').AsFloat;
      end;
      TB_Oco_Acrescimos.Post;
      qry_di_acrescimos_.Next;
    end;
    qry_di_acrescimos_.Close;
  end;
end;

procedure Tfrm_trans_DI.DeducoesDI;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Deduções da DI ... ';
  with datm_trans_DI do
  begin
    if TB_Oco_Deducao.FindKey([cProcSCX,'001']) then
    begin
      while ( not TB_Oco_Deducao.EOF ) and
            ( TB_Oco_Deducao.FieldByName('NR_DECL_IMP_MICRO').AsString = cProcSCX ) do
      begin
        TB_Oco_Deducao.Delete;
      end;
    end;

    qry_di_deducao_.Close;
    qry_di_deducao_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_di_deducao_.Prepare;
    qry_di_deducao_.Open;
    while ( not qry_di_deducao_.EOF ) do
    begin
      TB_Oco_Deducao.Append;
      TB_Oco_Deducao.FieldByName('NR_DECL_IMP_MICRO').AsString  := cProcSCX;
      TB_Oco_Deducao.FieldByName('NR_OP_IMP_MICRO').AsString    := qry_di_deducao_.FieldByName('NR_ADICAO').AsString;
      TB_Oco_Deducao.FieldByName('CD_MET_DEDUC_VALOR').AsString := qry_di_deducao_.FieldByName('CD_MET_DEDUC_VALOR').AsString;
      if qry_di_deducao_.FieldByName('VL_DEDUCAO_MNEG').AsFloat > 0 then
      begin
        TB_Oco_Deducao.FieldByName('VL_DEDUCAO_MNEG').AsFloat := qry_di_deducao_.FieldByName('VL_DEDUCAO_MNEG').AsFloat
      end;
      if qry_di_deducao_.FieldByName('CD_MD_NEGOC_DEDUC').AsString <> '' then
      begin
        TB_Oco_Deducao.FieldByName('CD_MD_NEGOC_DEDUC').AsString := qry_di_deducao_.FieldByName('CD_MD_NEGOC_DEDUC').AsString
      end;
      if qry_di_deducao_.FieldByName('VL_DEDUCAO_MN').AsFloat > 0 then
      begin
        TB_Oco_Deducao.FieldByName('VL_DEDUCAO_MN').AsFloat := qry_di_deducao_.FieldByName('VL_DEDUCAO_MN').AsFloat
      end;
      TB_Oco_Deducao.Post;
      qry_di_deducao_.Next;
    end;
    qry_di_deducao_.Close;
  end;
end;

procedure Tfrm_trans_DI.DocumentoVinculado;
var
   nOcorrencias : Integer;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Documentos Vinculados da DI ... ';
  with datm_trans_DI do
  begin
    if TB_Oco_Doc_Vinculado.FindKey([cProcSCX,'001',0 ]) then
    begin
      while ( not TB_Oco_Doc_Vinculado.EOF ) and
            ( TB_Oco_Doc_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString = cProcSCX ) do
      begin
        TB_Oco_Doc_Vinculado.Delete;
      end;
    end;
    cAdicao := '';
    nOcorrencias := 0;
    qry_doc_vinculado_.Close;
    qry_doc_vinculado_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_doc_vinculado_.Prepare;
    qry_doc_vinculado_.Open;
    while ( not qry_doc_vinculado_.EOF ) do
    begin
      if cAdicao <> qry_doc_vinculado_.FieldByName('NR_ADICAO').AsString then
      begin
        cAdicao := qry_doc_vinculado_.FieldByName('NR_ADICAO').AsString;
        nOcorrencias := 0
      end;

      TB_Oco_Doc_Vinculado.Append;
      TB_Oco_Doc_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Oco_Doc_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
      TB_Oco_Doc_Vinculado.FieldByName('NU_SEQ_DOCUMENTO').AsInteger := nOcorrencias;  // Número (Byte) 1
      TB_Oco_Doc_Vinculado.FieldByName('CD_TIPO_DCTO_VINC').AsString :=
         qry_doc_vinculado_.FieldByName('CD_TIPO_DCTO_VINC').AsString;
      {
      if qry_doc_vinculado_.FieldByName('CD_TIPO_DCTO_VINC').AsString = 'RE' then
      begin
        TB_Oco_Doc_Vinculado.FieldByName('CD_TIPO_DCTO_VINC').AsString := '3';
      end
      else
      if qry_doc_vinculado_.FieldByName('CD_TIPO_DCTO_VINC').AsString = 'DI' then
      begin
        TB_Oco_Doc_Vinculado.FieldByName('CD_TIPO_DCTO_VINC').AsString := '2';
      end
      else
      begin
        TB_Oco_Doc_Vinculado.FieldByName('CD_TIPO_DCTO_VINC').AsString := '1';
      end;
      }
      if qry_doc_vinculado_.FieldByName('NR_DCTO_VINCULADO').AsString <> '' then
      begin
        TB_Oco_Doc_Vinculado.FieldByName('NR_DCTO_VINCULADO').AsString :=
           qry_doc_vinculado_.FieldByName('NR_DCTO_VINCULADO').AsString;
      end;
      TB_Oco_Doc_Vinculado.Post;
      inc(nOcorrencias);
      qry_doc_vinculado_.Next;
    end;
    qry_doc_vinculado_.Close;
  end;
end;

procedure Tfrm_trans_DI.Destaque_NCM;
var
  nOcorrencias : Byte;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Destaque do NCM da DI ... ';
  with datm_trans_DI do
  begin
    qry_o_destaque_ncm_.Close;
    qry_o_destaque_ncm_.ParamByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
    qry_o_destaque_ncm_.Prepare;
    qry_o_destaque_ncm_.Open;
    qry_o_destaque_ncm_.First;
    while Not qry_o_destaque_ncm_.EOF do
    begin
      qry_o_destaque_ncm_.Delete;
    end;

    cAdicao := '';
    nOcorrencias := 0;
    qry_destaque_ncm_.Close;
    qry_destaque_ncm_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_destaque_ncm_.Prepare;
    qry_destaque_ncm_.Open;
    while ( not qry_destaque_ncm_.EOF ) do
    begin
      if cAdicao <> qry_destaque_ncm_.FieldByName('NR_ADICAO').AsString then
      begin
        cAdicao := qry_destaque_ncm_.FieldByName('NR_ADICAO').AsString;
        nOcorrencias := 0;
      end;
      if qry_destaque_ncm_.FieldByName('NR_DESTAQUE_NCM').AsString <> '' then
      begin
        qry_existe_adicao_.Close;
        qry_existe_adicao_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
        qry_existe_adicao_.ParamByName('NR_ADICAO').AsString   := cAdicao;
        qry_existe_adicao_.Prepare;
        qry_existe_adicao_.Open;
        if qry_existe_adicao_.RecordCount > 0 then
        begin
          qry_o_destaque_ncm_.Append;
          qry_o_destaque_ncm_.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
          qry_o_destaque_ncm_.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
          qry_o_destaque_ncm_.FieldByName('NU_SEQ_DESTAQUE').AsInteger  := nOcorrencias;             // Número (Byte) 1
          qry_o_destaque_ncm_.FieldByName('NR_DESTAQUE_NCM').AsString   := qry_destaque_ncm_.FieldByName('NR_DESTAQUE_NCM').AsString;
          qry_o_destaque_ncm_.Post;
          Inc(nOcorrencias);
        end;
        qry_existe_adicao_.Close;
      end;
      qry_destaque_ncm_.Next;
    end;
    qry_destaque_ncm_.Close;
    qry_o_destaque_ncm_.Close;
  end;
end;

procedure Tfrm_trans_DI.Pagamento_Previsto;
var
  nOcorrencias : Byte;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Pagamento Previsto da DI ... ';
  with datm_trans_DI do
  begin
    if TB_Oco_Pagto_Previsto.FindKey([cProcSCX,'001',0 ]) then
    begin
      while ( not TB_Oco_Pagto_Previsto.EOF ) and
            ( TB_Oco_Pagto_Previsto.FieldByName('NR_DECL_IMP_MICRO').AsString = cProcSCX ) do
      begin
        TB_Oco_Pagto_Previsto.Delete;
      end;
    end;
    cAdicao := '';
    nOcorrencias := 0;
    qry_pagto_previsto_.Close;
    qry_pagto_previsto_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_pagto_previsto_.Prepare;
    qry_pagto_previsto_.Open;
    while ( not qry_pagto_previsto_.Eof ) do
    begin
      if cAdicao <> qry_pagto_previsto_.FieldByName('NR_ADICAO').AsString then
      begin
        cAdicao := qry_pagto_previsto_.FieldByName('NR_ADICAO').AsString;
        nOcorrencias := 0;
      end;

      {Tratamento para CPT}
      VL_DEDUCAO_MNEG := 0;
      VL_DEDUCAO_MN   := 0;

      {if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
         ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
      begin
        qry_tot_deducao_.Close;
        qry_tot_deducao_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
        qry_tot_deducao_.ParamByName('NR_ADICAO').AsString   := cAdicao;
        qry_tot_deducao_.Prepare;
        qry_tot_deducao_.Open;
        if not qry_tot_deducao_.EOF then
        begin
          VL_DEDUCAO_MNEG := qry_tot_deducao_.FieldByName('VL_DEDUCAO_MNEG').AsFloat;
          VL_DEDUCAO_MN   := qry_tot_deducao_.FieldByName('VL_DEDUCAO_MN').AsFloat;
        end;
      end;
      qry_tot_deducao_.Close;} // Comentado para não utilizar a dedução, pois utiliza só para o CPT e está utilizando errado - Michel - 13/08/2012

      TB_Oco_Pagto_Previsto.Append;
      TB_Oco_Pagto_Previsto.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Oco_Pagto_Previsto.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
      TB_Oco_Pagto_Previsto.FieldByName('NU_SEQ_PAG_PREV').AsInteger  := nOcorrencias;             // Número (Byte) 1
      TB_Oco_Pagto_Previsto.FieldByName('DT_PREV_PGTO_360').AsString  := qry_pagto_previsto_.FieldByName('DT_PREV_PGTO_360').AsString;
      if qry_pagto_previsto_.FieldByName('VL_PREV_PGTO_360').AsFloat <> 0  then
      begin
        if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
           ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
           TB_Oco_Pagto_Previsto.FieldByName('VL_PREV_PGTO_360').AsFloat := qry_pagto_previsto_.FieldByName('VL_PREV_PGTO_360').AsFloat + VL_DEDUCAO_MNEG
        else
           TB_Oco_Pagto_Previsto.FieldByName('VL_PREV_PGTO_360').AsFloat := qry_pagto_previsto_.FieldByName('VL_PREV_PGTO_360').AsFloat;
      end;
      TB_Oco_Pagto_Previsto.Post;
      Inc(nOcorrencias);
      qry_pagto_previsto_.Next;
    end;
    qry_pagto_previsto_.Close;
  end;
end;

procedure Tfrm_trans_DI.Pagamento_Vinculado;
var
  nOcorrencias : Byte;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Pagamento Vinculado da DI ... ';
  with datm_trans_DI do
  begin
    if TB_Oco_Pagto_Vinculado.FindKey([cProcSCX,'001',0 ]) then
    begin
      while ( Not TB_Oco_Pagto_Vinculado.EOF ) and
            ( TB_Oco_Pagto_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString = cProcSCX ) do
      begin
        TB_Oco_Pagto_Vinculado.Delete;
      end;
    end;
    cAdicao := '';
    nOcorrencias := 0;
    qry_pagto_vinculado_.Close;
    qry_pagto_vinculado_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_pagto_vinculado_.Prepare;
    qry_pagto_vinculado_.Open;
    while ( not qry_pagto_vinculado_.EOF ) do
    begin
      if cAdicao <> qry_pagto_vinculado_.FieldByName('NR_ADICAO').AsString then
      begin
        cAdicao := qry_pagto_vinculado_.FieldByName('NR_ADICAO').AsString;
        nOcorrencias := 0;
      end;

      {Tratamento para CPT}
      VL_DEDUCAO_MNEG := 0;
      VL_DEDUCAO_MN   := 0;

      {if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
         ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
      begin
        qry_tot_deducao_.Close;
        qry_tot_deducao_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
        qry_tot_deducao_.ParamByName('NR_ADICAO').AsString   := cAdicao;
        qry_tot_deducao_.Prepare;
        qry_tot_deducao_.Open;
        if Not qry_tot_deducao_.EOF then
        begin
          VL_DEDUCAO_MNEG := qry_tot_deducao_.FieldByName('VL_DEDUCAO_MNEG').AsFloat;
          VL_DEDUCAO_MN   := qry_tot_deducao_.FieldByName('VL_DEDUCAO_MN').AsFloat;
        end;
      end;
      qry_tot_deducao_.Close;} // Comentado porque está sendo utilizado apenas para CPT e não deve mais - Michel - 13/08/2012


      TB_Oco_Pagto_Vinculado.Append;
      TB_Oco_Pagto_Vinculado.FieldByName('NR_DECL_IMP_MICRO').AsString  := cProcSCX;
      TB_Oco_Pagto_Vinculado.FieldByName('NR_OP_IMP_MICRO').AsString    := cAdicao;
      TB_Oco_Pagto_Vinculado.FieldByName('NR_SEQ_PAGAMENTO').AsInteger  := nOcorrencias;
      if qry_pagto_vinculado_.FieldByName('CD_FORMA_PAGAMENTO').AsString <> '' then
        TB_Oco_Pagto_Vinculado.FieldByName('CD_FORMA_PAGAMENTO').AsString :=
           qry_pagto_vinculado_.FieldByName('CD_FORMA_PAGAMENTO').AsString;
      if qry_pagto_vinculado_.FieldByName('IN_PAGAMENTO_MN').AsString = '0' then
         TB_Oco_Pagto_Vinculado.FieldByName('IN_PAGAMENTO_MN').AsBoolean := False
      else
         TB_Oco_Pagto_Vinculado.FieldByName('IN_PAGAMENTO_MN').AsBoolean := True;

      if Not TB_Oco_Pagto_Vinculado.FieldByName('IN_PAGAMENTO_MN').AsBoolean then
      begin
        if qry_pagto_vinculado_.FieldByName('CD_BANCO_PAGAMENTO').AsString <> '' then
        begin
          TB_Oco_Pagto_Vinculado.FieldByName('CD_BANCO_PAGAMENTO').AsString := qry_pagto_vinculado_.FieldByName('CD_BANCO_PAGAMENTO').AsString;
        end;
        if qry_pagto_vinculado_.FieldByName('CD_PRACA_PAGAMENTO').AsString <> '' then
        begin
          TB_Oco_Pagto_Vinculado.FieldByName('CD_PRACA_PAGAMENTO').AsString := qry_pagto_vinculado_.FieldByName('CD_PRACA_PAGAMENTO').AsString;
        end;
        if qry_pagto_vinculado_.FieldByName('NR_OP_CAMBIO').AsString <> '' then
        begin
          TB_Oco_Pagto_Vinculado.FieldByName('NR_OP_CAMBIO').AsString := qry_pagto_vinculado_.FieldByName('NR_OP_CAMBIO').AsString;
        end;
        if qry_pagto_vinculado_.FieldByName('NR_COMPR_CAMBIO').AsString <> '' then
        begin
          TB_Oco_Pagto_Vinculado.FieldByName('NR_COMPR_CAMBIO').AsString := qry_pagto_vinculado_.FieldByName('NR_COMPR_CAMBIO').AsString;
          if Length(qry_pagto_vinculado_.FieldByName('NR_COMPR_CAMBIO').AsString) = 14 then
          begin
            TB_Oco_Pagto_Vinculado.FieldByName('CD_TP_COMPR_CAMBIO').AsString := '1';
          end
          else
          begin
            TB_Oco_Pagto_Vinculado.FieldByName('CD_TP_COMPR_CAMBIO').AsString := '2';
          end;
        end;
      end;
      if qry_pagto_vinculado_.FieldByName('VL_VINC_MD_CAMBIO').AsFloat <> 0 then
      begin
        if ( qry_di_.FieldByname('CD_INCOTERM').AsString = 'CPT' ) and
           ( qry_di_.FieldByname('VL_FRETE_TNAC_MNEG').AsFloat > 0 ) then
           TB_Oco_Pagto_Vinculado.FieldByName('VL_VINC_MD_CAMBIO').AsFloat := qry_pagto_vinculado_.FieldByName('VL_VINC_MD_CAMBIO').AsFloat + VL_DEDUCAO_MNEG
        else
           TB_Oco_Pagto_Vinculado.FieldByName('VL_VINC_MD_CAMBIO').AsFloat := qry_pagto_vinculado_.FieldByName('VL_VINC_MD_CAMBIO').AsFloat;
      end;
      TB_Oco_Pagto_Vinculado.Post;
      inc(nOcorrencias);
      qry_pagto_vinculado_.Next;
    end;
    qry_pagto_vinculado_.Close;
  end;
end;

procedure Tfrm_trans_DI.Valoracao_NCM;
var
   nOcorrencias : Integer;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Valoração da DI ... ';
  with datm_trans_DI do
  begin
    if TB_Valoracao_NCM.FindKey([cProcSCX,'001',0 ]) then
    begin
      while ( not TB_Valoracao_NCM.EOF ) and
            ( TB_Valoracao_NCM.FieldByName('NR_DECL_IMP_MICRO').AsString = cProcSCX ) do
      begin
        TB_Valoracao_NCM.Delete;
      end;
    end;
    cAdicao := '';
    nOcorrencias := 0;

    qry_valoracao_ncm_.Close;
    qry_valoracao_ncm_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_valoracao_ncm_.Prepare;
    qry_valoracao_ncm_.Open;
    while ( not qry_valoracao_ncm_.EOF ) do
    begin
      if cAdicao <> qry_valoracao_ncm_.FieldByName('NR_ADICAO').AsString then
      begin
        cAdicao := qry_valoracao_ncm_.FieldByName('NR_ADICAO').AsString;
        nOcorrencias := 0;
      end;
      TB_Valoracao_NCM.Append;
      TB_Valoracao_NCM.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Valoracao_NCM.FieldByName('NR_OP_IMP_MICRO').AsString   := cAdicao;
      TB_Valoracao_NCM.FieldByName('NR_SEQ_VAL_NCM').AsInteger   := nOcorrencias;
      if qry_valoracao_ncm_.FieldByName('CD_NIVEL_NVE').AsString <> '' then
      begin
        TB_Valoracao_NCM.FieldByName('CD_ABRANGENCIA_NCM').AsString := ConvAbrang(qry_valoracao_ncm_.FieldByName('CD_NIVEL_NVE').AsString);
      end;
      if qry_valoracao_ncm_.FieldByName('CD_ATRIBUTO_NCM').AsString <> '' then
      begin
        TB_Valoracao_NCM.FieldByName('CD_ATRIBUTO_NCM').AsString := qry_valoracao_ncm_.FieldByName('CD_ATRIBUTO_NCM').AsString;
      end;
      if qry_valoracao_ncm_.FieldByName('CD_ESPECIF_NCM').AsString <> '' then
      begin
        TB_Valoracao_NCM.FieldByName('CD_ESPECIF_NCM').AsString := qry_valoracao_ncm_.FieldByName('CD_ESPECIF_NCM').AsString;
      end;
      TB_Valoracao_NCM.Post;
      Inc(nOcorrencias);
      qry_valoracao_ncm_.Next;
    end;
    qry_valoracao_ncm_.Close;
  end;
end;

procedure Tfrm_trans_DI.PagamentoTributos;
var
   nOcorrencias : Integer;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Pagamento de Tributos da DI ... ';
  with datm_trans_DI do
  begin
    nOcorrencias := 0;

    qry_pagto_trib_.Close;
    qry_pagto_trib_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_pagto_trib_.Prepare;
    qry_pagto_trib_.Open;
    while ( Not qry_pagto_trib_.EOF ) do
    begin
      // Procura a primeira ocorrencia no siscomex
      if TB_Oco_PagtoTrib.Locate('NR_DECL_IMP_MICRO;NR_SEQ_PGTO_TRIB', vararrayof( [cProcSCX,nOcorrencias] ),[] ) then
      begin
        TB_Oco_PagtoTrib.Edit;
      end
      else
      begin
        TB_Oco_PagtoTrib.Append;
        TB_Oco_PagtoTrib.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
        TB_Oco_PagtoTrib.FieldByName('NR_SEQ_PGTO_TRIB').AsInteger := nOcorrencias;
      end;

      if qry_pagto_trib_.FieldByName('CD_RECEITA_PGTO').AsString <> '' then
      begin
        TB_Oco_PagtoTrib.FieldByName('CD_RECEITA_PGTO').AsString := qry_pagto_trib_.FieldByName('CD_RECEITA_PGTO').AsString;
      end;
      if qry_pagto_trib_.FieldByName('CD_BANCO_PGTO_TRIB').AsString <> '' then
      begin
        TB_Oco_PagtoTrib.FieldByName('CD_BANCO_PGTO_TRIB').AsString := qry_pagto_trib_.FieldByName('CD_BANCO_PGTO_TRIB').AsString;
      end;
      if qry_pagto_trib_.FieldByName('NR_AGENC_PGTO_TRIB').AsString <> '' then
      begin
        TB_Oco_PagtoTrib.FieldByName('NR_AGENC_PGTO_TRIB').AsString := qry_pagto_trib_.FieldByName('NR_AGENC_PGTO_TRIB').AsString;
      end;
      if qry_pagto_trib_.FieldByName('VL_TRIBUTO_PAGO').AsFloat <> 0 then
      begin
        TB_Oco_PagtoTrib.FieldByName('VL_TRIBUTO_PAGO').AsFloat := qry_pagto_trib_.FieldByName('VL_TRIBUTO_PAGO').AsFloat;
      end;
      if qry_pagto_trib_.FieldByName('DT_PGTO_TRIBUTO').AsString <> '' then
      begin
        if qry_di_.FieldByName('CD_TIPO_PGTO_TRIB').AsString = '2' then
        begin
          TB_Oco_PagtoTrib.FieldByName('DT_PGTO_TRIBUTO').AsString := qry_pagto_trib_.FieldByName('DT_PGTO_TRIBUTO').AsString;
        end;
      end;
      TB_Oco_PagtoTrib.FieldByName('VL_MULTA_PGTO_TRIB').AsFloat := 0;
      TB_Oco_PagtoTrib.FieldByName('VL_JUROS_PGTO_TRIB').AsFloat := 0;
      TB_Oco_PagtoTrib.Post;
      Inc(nOcorrencias);
      qry_pagto_trib_.Next;
    end;
    qry_pagto_trib_.Close;

    while TB_Oco_PagtoTrib.Locate('NR_DECL_IMP_MICRO;NR_SEQ_PGTO_TRIB', vararrayof( [ cProcSCX,nOcorrencias ] ),[] ) do
    begin
      TB_Oco_PagtoTrib.Delete;
      Inc(nOcorrencias);
    end;

    if nOcorrencias = 0 then
    begin
      TB_Oco_PagtoTrib.Append;
      TB_Oco_PagtoTrib.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Oco_PagtoTrib.FieldByName('NR_SEQ_PGTO_TRIB').AsInteger := nOcorrencias;
      TB_Oco_PagtoTrib.FieldByName('VL_MULTA_PGTO_TRIB').AsFloat := 0;
      TB_Oco_PagtoTrib.FieldByName('VL_JUROS_PGTO_TRIB').AsFloat := 0;
      TB_Oco_PagtoTrib.Post;
    end;
  end;
end;

procedure Tfrm_trans_DI.ArmazCarga;
var
   nOcorrencias : Integer;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Carga Armazenada da DI ... ';
  with datm_trans_DI do
  begin
    nOcorrencias := 0;

    qry_carga_armazem_.Close;
    qry_carga_armazem_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_carga_armazem_.Prepare;
    qry_carga_armazem_.Open;
    while ( Not qry_carga_armazem_.EOF ) do
    begin
      if TB_Oco_Armaz_Carga.Locate('NR_DECL_IMP_MICRO;NR_SEQ_ARMAZEM', vararrayof( [cProcSCX,nOcorrencias] ),[loPartialKey] ) then
      begin
        TB_Oco_Armaz_Carga.Edit;
      end
      else
      begin
        TB_Oco_Armaz_Carga.Append;
        TB_Oco_Armaz_Carga.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
        TB_Oco_Armaz_Carga.FieldByName('NR_SEQ_ARMAZEM').AsInteger   := nOcorrencias;
      end;

      if qry_carga_armazem_.FieldByName('NM_ARMAZEM_CARGA').AsString <> '' then
      begin
        TB_Oco_Armaz_Carga.FieldByName('NM_ARMAZEM_CARGA').AsString := qry_carga_armazem_.FieldByName('NM_ARMAZEM_CARGA').AsString;
      end;
      TB_Oco_Armaz_Carga.Post;

      Inc(nOcorrencias);
      qry_carga_armazem_.Next;
    end;
    while TB_Oco_Armaz_Carga.Locate('NR_DECL_IMP_MICRO;NR_SEQ_ARMAZEM', vararrayof( [cProcSCX,nOcorrencias] ),[loPartialKey] ) do
    begin
      TB_Oco_Armaz_Carga.Delete;
      Inc(nOcorrencias);
    end;
    qry_carga_armazem_.Close;
  end;
end;

procedure Tfrm_trans_DI.EmbalagemCarga;
var
   nOcorrencias : integer;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Embalagens da DI ... ';
  with datm_trans_DI do
  begin
    nOcorrencias := 0;

    qry_embalagem_carga_.Close;
    qry_embalagem_carga_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_embalagem_carga_.Prepare;
    qry_embalagem_carga_.Open;
    while ( Not qry_embalagem_carga_.EOF ) do
    begin
      if TB_Oco_Embalagens.Locate('NR_DECL_IMP_MICRO;NR_SEQ_EMBALAGEM', vararrayof( [cProcSCX,nOcorrencias] ),[loPartialKey] ) then
      begin
        TB_Oco_Embalagens.Edit;
      end
      else
      begin
        TB_Oco_Embalagens.Append;
        TB_Oco_Embalagens.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
        TB_Oco_Embalagens.FieldByName('NR_SEQ_EMBALAGEM').AsInteger := nOcorrencias;
      end;

      if qry_embalagem_carga_.FieldByName('CD_TIPO_EMBALAGEM').AsString = '' then
      begin
        BoxMensagem( 'Atenção! Embalagem não informada!!', 3 );
      end
      else
      begin
        TB_Oco_Embalagens.FieldByName('CD_TIPO_EMBALAGEM').AsString := qry_embalagem_carga_.FieldByName('CD_TIPO_EMBALAGEM').AsString;
      end;
      if Trim( qry_embalagem_carga_.FieldByName('QT_VOLUME_CARGA').AsString ) = '' then
         TB_Oco_Embalagens.FieldByName('QT_VOLUME_CARGA').AsInteger := 0
      else
      begin
        if qry_embalagem_carga_.FieldByName('QT_VOLUME_CARGA').AsInteger <> 0 then
          TB_Oco_Embalagens.FieldByName('QT_VOLUME_CARGA').AsInteger := qry_embalagem_carga_.FieldByName('QT_VOLUME_CARGA').AsInteger;
      end;
      TB_Oco_Embalagens.Post;
      Inc(nOcorrencias);
      qry_embalagem_carga_.Next;
    end;
    // Tenta encontrar registros que estejam sobrando !!!
    // e caso exista, apaga.
    if TB_Oco_Embalagens.Locate('NR_DECL_IMP_MICRO;NR_SEQ_EMBALAGEM', vararrayof( [cProcSCX,nOcorrencias] ),[loPartialKey] ) then
    begin
      while TB_Oco_Embalagens.FindKey([ cProcSCX, nOcorrencias ]) do
      begin
        TB_Oco_Embalagens.Delete;
        Inc(nOcorrencias);
      end;
    end;
    qry_embalagem_carga_.Close;
  end;
end;

procedure Tfrm_trans_DI.ProcessoDI;
var
   nOcorrencias : Integer;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Processos Vinculados da DI ... ';
  with datm_trans_DI do
  begin

    nOcorrencias := 0;

    qry_proc_di_.Close;
    qry_proc_di_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_proc_di_.Prepare;
    qry_proc_di_.Open;
    while ( Not qry_proc_di_.EOF ) do
    begin
      if TB_Oco_Processos.FindKey([ cProcSCX, nOcorrencias ]) then
      begin
        TB_Oco_Processos.Edit;
      end
      else
      begin
        TB_Oco_Processos.Append;
      end;
      TB_Oco_Processos.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Oco_Processos.FieldByName('NR_SEQ_PROCESSO').AsInteger  := nOcorrencias;
      if qry_proc_di_.FieldByName('CD_TIPO_PROCESSO').AsString <> '' then
      begin
        TB_Oco_Processos.FieldByName('CD_TIPO_PROCESSO').AsString := qry_proc_di_.FieldByName('CD_TIPO_PROCESSO').AsString;
      end;
      if qry_proc_di_.FieldByName('NR_PROCESSO_INSTR').AsString <> '' then
      begin
        TB_Oco_Processos.FieldByName('NR_PROCESSO_INSTR').AsString := qry_proc_di_.FieldByName('NR_PROCESSO_INSTR').AsString;
      end;
      TB_Oco_Processos.Post;
      Inc(nOcorrencias);
      qry_proc_di_.Next;
    end;
    qry_proc_di_.Close;

    {Tenta encontrar registros que estejam sobrando !!!
     e caso exista, apaga.}
    if TB_Oco_Processos.FindKey([ cProcSCX, nOcorrencias ]) then
    begin
      while TB_Oco_Processos.FindKey([ cProcSCX, nOcorrencias ]) do
      begin
        TB_Oco_Processos.Delete;
        Inc(nOcorrencias);
      end;
    end;
    if nOcorrencias > 0 then
    begin    // Para Manter a compatibilidade c/ Orientador
      TB_Oco_Processos.Append;
      TB_Oco_Processos.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Oco_Processos.FieldByName('NR_SEQ_PROCESSO').AsInteger  := nOcorrencias;
      TB_Oco_Processos.Post;
    end;
  end;
end;

procedure Tfrm_trans_DI.DocumentoInstrucao;
var
  nOcorrencias : Integer;
begin
  lbl_mensagem.Caption := 'Transmitindo Ocorrências de Documentos de Instrução do Embarque da DI ... ';
  with datm_trans_DI do
  begin
    nOcorrencias := 0;
    qry_doc_instrucao_.Close;
    qry_doc_instrucao_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_doc_instrucao_.Prepare;
    qry_doc_instrucao_.Open;
    while Not ( qry_doc_instrucao_.Eof ) do
    begin
      {Procura a primeira ocorrencia no siscomex}
      {Processo no SISCOMEX 00001/96}
      qry_doc_instrucao_scx_.Close;
      qry_doc_instrucao_scx_.Prepare;
      qry_doc_instrucao_scx_.Open;

      if TB_Oco_DocEmb.FindKey([ cProcSCX, nOcorrencias ]) then
      begin
        TB_Oco_DocEmb.Edit;
      end
      else
      begin
        TB_Oco_DocEmb.Append;
      end;
      TB_Oco_DocEmb.FieldByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      TB_Oco_DocEmb.FieldByName('NR_SEQ_DCTO_INSTR').AsInteger := nOcorrencias;  {Número (Byte) 1}
      if qry_doc_instrucao_.FieldByName('CD_TIPO_DCTO_INSTR').AsString <> '' then
      begin
        TB_Oco_DocEmb.FieldByName('CD_TIPO_DCTO_INSTR').AsString := qry_doc_instrucao_.FieldByName('CD_TIPO_DCTO_INSTR').AsString;
      end;
      if qry_doc_instrucao_.FieldByName('NR_DCTO_INSTRUCAO').AsString <> '' then
      begin
        TB_Oco_DocEmb.FieldByName('NR_DCTO_INSTRUCAO').AsString := qry_doc_instrucao_.FieldByName('NR_DCTO_INSTRUCAO').AsString;
      end;
      TB_Oco_DocEmb.Post;
      Inc(nOcorrencias);
      qry_doc_instrucao_.Next;
    end;
    qry_doc_instrucao_.Close;

    {Tenta encontrar registros que estejam sobrando !!!
     e caso exista, apaga.}
    if TB_Oco_DocEmb.FindKey([ cProcSCX, nOcorrencias ]) then
    begin
      while TB_Oco_DocEmb.FindKey([ cProcSCX, nOcorrencias ]) do
      begin
        TB_Oco_DocEmb.Delete;
        Inc(nOcorrencias);
      end;
    end;
  end;
end;

function Tfrm_trans_DI.Num_To_Str(nValor : Double; nTamTotal : Integer; nFracao : Integer) : String;
var
   nInteiros : String;
   nFracaoNum : String;
   cFracaoNum : string;
   i,nPos : integer;
begin
  cFracaoNum := '';
  if nValor < 0 then
  begin     {Proteção de Código p/ Evitar erro!}
    nValor := Abs(nValor);
  end;
  nInteiros := Replicate('0', nTamTotal-nFracao );
  nInteiros := FormatFloat(nInteiros,Int(nValor));

  cFracaoNum := formatfloat(  '#0.' + Replicate( '0', nFracao ), Frac(nValor));
//  cFracaoNum := FloatToStr(Frac(nValor));

  nFracaoNum := '';
  nPos := Pos(',',cFracaoNum);
  if nPos > 0 then
  begin
    for i := 1 to nFracao do
    begin
      if cFracaoNum[nPos+i] <> #0 then
      begin
        nFracaoNum := nFracaoNum + cFracaoNum[nPos+i];
      end
      else
      begin
        break;
      end;
    end;
    nFracaoNum := nFracaoNum+Replicate('0',nFracao-i+1 );
  end
  else
  begin
    nFracaoNum := FormatFloat(nInteiros,0);
  end;
  Result := nInteiros+nFracaoNum
end;

function Tfrm_trans_DI.Nr_Import2(cTipo : String) : String ;
var
  nTipo : integer;
begin
  if cTipo <> '' then
  begin
    nTipo := StrToInt(cTipo);
    case nTipo of
      1 : Nr_Import2 := datm_trans_DI.qry_di_.FieldByName('CGC_EMPRESA').AsString;  { c.g.c. }
      2 : Nr_Import2 := datm_trans_DI.qry_di_.FieldByName('CPF_EMPRESA').AsString;  { c.p.f. }
      3 : Nr_Import2 := datm_trans_DI.qry_di_.FieldByName('OUTRO_DOC').AsString;    { nr. importador }
      4 : Nr_Import2 := '';                                                         { nada }
    end;
  end
  else
  begin
    Nr_Import2 := '';                                                               { nada }
  end;
end;

procedure Tfrm_trans_DI.NumeraDI;
var
   nNovoProc : double;
   nAno : Integer;
   cAno : String;
begin
  lbl_mensagem.Caption := 'Verificando Numeração no Siscomex ... ';
  with datm_trans_DI do
  begin
    if TB_Numerador_DI.RecordCount > 0 then
    begin
      nNovoProc := TB_Numerador_DI.FieldByName('NR_PROV_DECLARACAO' ).AsFloat;
      nAno := TB_Numerador_DI.FieldByName('NR_ANO_DECLARACAO').AsInteger;
      TB_Numerador_DI.Edit;
      TB_Numerador_DI.FieldByName('NR_PROV_DECLARACAO').AsFloat := nNovoProc + 1;
      TB_Numerador_DI.FieldByName('NR_ANO_DECLARACAO').AsInteger := nAno;
    end
    else
    begin
      TB_Numerador_DI.Append;
      TB_Numerador_DI.FieldByName('NR_PROV_DECLARACAO').AsFloat := 1;
      cAno :=Copy(FormatDateTime('ddmmyyyy',Date),5,4);
      TB_Numerador_DI.FieldByName('NR_ANO_DECLARACAO').AsInteger := StrToInt(cAno);
      nNovoProc := TB_Numerador_DI.FieldByName('NR_PROV_DECLARACAO').AsFloat;
      nAno := TB_Numerador_DI.FieldByName('NR_ANO_DECLARACAO').AsInteger;
    end;

    TB_Numerador_DI.Post;
    cProcSCX := FormatFloat('00000',nNovoProc) + '/' +  Copy(FormatFloat('0000',nAno),3,2);

    qry_di_atz_.ParamByName('NR_PROCESSO').AsString          := cProcBroker;
    qry_di_atz_.ParamByName('NR_PROCESSO_SISCOMEX').AsString := cProcSCX;
    qry_di_atz_.Prepare;
    qry_di_atz_.ExecSQL;
  end;
end;

function Tfrm_trans_DI.ConvAbrang(cAbrangencia : string ): string;
begin
  cAbrangencia := Trim(cAbrangencia);
  if cAbrangencia = 'C'  then ConvAbrang := '1';
  if cAbrangencia = 'N'  then ConvAbrang := '6';
  if cAbrangencia = 'SB' then ConvAbrang := '5';
  if cAbrangencia = 'U'  then ConvAbrang := '3';
  if cAbrangencia = 'P'  then ConvAbrang := '2';
  if cAbrangencia = 'SA' then ConvAbrang := '4';
end;

function Tfrm_trans_DI.Conv_VirgPonto(cStringComNumero : String ) : Double;
var
  nPos : Byte;
  nErro : Integer;
  nvalor : double;
begin
  nPos := Pos(',',cStringComNumero);
  if nPos > 0 then
  begin
    Delete( cStringComNumero, nPos,1 );
    Insert( '.',cStringComNumero, nPos);
  end;
  Val(cStringComNumero,nValor,nErro);
  Conv_VirgPonto := nValor;
end;

{ tabelas do siscomex }
procedure Tfrm_trans_DI.open_tabelas_sisco;
begin
  Application.ProcessMessages;
  datm_trans_DI.qry_di_scx_.Open;
  datm_trans_DI.TB_Numerador_DI.Open;
  datm_trans_DI.TB_Oco_DocEmb.Open;
  datm_trans_DI.TB_Oco_Processos.Open;
  datm_trans_DI.TB_Oco_Embalagens.Open;
  datm_trans_DI.TB_Oco_Armaz_Carga.Open;
  datm_trans_DI.TB_Oco_PagtoTrib.Open;
  datm_trans_DI.TB_Adicao_DI.Open;
  datm_trans_DI.TB_Tributos.Open;
  datm_trans_DI.TB_Ato_Vinculado.Open;
  datm_trans_DI.TB_Item_Adicao.Open;
  datm_trans_DI.TB_Oco_Acrescimos.Open;
  datm_trans_DI.TB_Oco_Deducao.Open;
  datm_trans_DI.TB_Oco_Doc_Vinculado.Open;
  datm_trans_DI.TB_Oco_Pagto_Previsto.Open;
  datm_trans_DI.TB_Oco_Pagto_Vinculado.Open;
  datm_trans_DI.TB_Valoracao_NCM.Open;
end;

procedure Tfrm_trans_DI.close_tabelas_sisco;
begin
  Application.ProcessMessages;
  datm_trans_DI.qry_di_scx_.Close;
  datm_trans_DI.TB_Numerador_DI.Close;
  datm_trans_DI.TB_Oco_DocEmb.Close;
  datm_trans_DI.TB_Oco_Processos.Close;
  datm_trans_DI.TB_Oco_Embalagens.Close;
  datm_trans_DI.TB_Oco_Armaz_Carga.Close;
  datm_trans_DI.TB_Oco_PagtoTrib.Close;
  datm_trans_DI.TB_Adicao_DI.Close;
  datm_trans_DI.TB_Tributos.Close;
  datm_trans_DI.TB_Ato_Vinculado.Close;
  datm_trans_DI.TB_Item_Adicao.Close;
  datm_trans_DI.TB_Oco_Acrescimos.Close;
  datm_trans_DI.TB_Oco_Deducao.Close;
  datm_trans_DI.TB_Oco_Doc_Vinculado.Close;
  datm_trans_DI.TB_Oco_Pagto_Previsto.Close;
  datm_trans_DI.TB_Oco_Pagto_Vinculado.Close;
  datm_trans_DI.TB_Valoracao_NCM.Close;
end;

procedure Tfrm_trans_DI.FormCreate(Sender: TObject);
var
  S: String;
begin
  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'NM_EMPRESA';
  a_str_indices[2] := 'NR_DECL_IMP_PROT';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    Items.Add('Nº Transmissão');
    ItemIndex := 0;
  end;
  cb_ordem.ItemIndex := 0;

 { Inicializa o Data Module para Transmissão da DI}
  Application.CreateForm( Tdatm_trans_DI, datm_trans_DI );

  Pc_Fundo_Pobreza := 0;
  S := ConsultaLookUPSQL(' SELECT PC_FUNDO_POBREZA_RJ FROM TPARAMETROS ', 'PC_FUNDO_POBREZA_RJ');
  TryStrToFloat(S, Pc_Fundo_Pobreza);
end;

procedure Tfrm_trans_DI.btn_cancelarClick(Sender: TObject);
begin
  lbl_mensagem.Caption := 'Transmissão sendo abortada!!!';
  Application.ProcessMessages;

  btn_cancelar.Enabled  := False;
  mi_cancelar.Enabled   := False;
  btn_trans_DI.Enabled  := True;
  mi_transmitir.Enabled := True;
  btn_sair.Enabled      := True;
  mi_sair.Enabled       := True;
  lCancelar             := True;
end;

procedure Tfrm_trans_DI.btn_trans_DIClick(Sender: TObject);

  Procedure ConsisteDrawBack;
  Begin
    CloseStoredProc(SP_cons_db_susp);
    SP_cons_db_susp.ParamByName('@nr_processo').AsString := '0101' + datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;
    SP_cons_db_susp.ParamByName('@tp_movimento').AsString := 'DI';
    ExecStoredProc(SP_cons_db_susp);
    CloseStoredProc(SP_cons_db_susp);
  End;

  Procedure ExecProcSaldoDrawBack;
  Begin
    CloseStoredProc(sp_saldo_drawback);
    sp_saldo_drawback.ParamByName('@nr_processo').AsString := '0101' + datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;
    sp_saldo_drawback.ParamByName('@tp_movimento').AsString := 'DI';
    ExecStoredProc(sp_saldo_drawback);
    CloseStoredProc(sp_saldo_drawback);
  End;

var
  i, pQtdDiasParam : integer;
  pAno, pMes, pDia : Word;
  flagTemExcecao, lAbriuSiscomex, lcambio, vPassouII, vPassouIPI, vPassouTx, vAdicaojaPassou, vICMSJaPassou, vRegEspecial : Boolean;
  ldi_liberada, vInConferencia, frete_embutido, frete_embutido_prev, cd_aplicacao_ad_di, cd_aplicacao_ad_prev,
  cd_vinc_impo_expo_ad_di, cd_vinc_impo_expo_ad_prev : String[1];
  vl_cambio : Currency;
  cd_fund_legal_icms, mens_ato, vOldSQL, cd_exportador, cd_exportador_prev, cd_pais_aquisicao, cd_pais_aquisicao_prev, cd_fabricante, cd_fabricante_prev,
  cd_pais_origem, cd_pais_origem_prev, cd_ncm_sh, cd_mercadoria_ncm, nm_via_transporte, nm_via_transp, cd_incoterm, cd_incoterm_prev,
  cd_tributacao_icms_merc, cd_fund_legal_icms_Prev, cd_importador, cd_cliente, cd_vinculacao_prev, cd_vinculacao,
  cd_tributacao_icms_prev, cd_tributacao_icms, pNmColunaICMS, cd_fund_legal_icms_Merc_Ou_Empresa, pDescExcecao,
  cd_reg_tributar, cd_reg_tributar_prev, cd_fund_legal_regime, cd_fund_legal_regime_prev, pc_icms_reducao_prev,
  cd_incoterms_di_ad, cd_incoterms_prev_ad, cd_cfop_ad, cd_cfop_prev_ad, nm_acordo_tar_ad, nm_acordo_tar_prev_ad,
  pc_acordo_tar_ad, pc_acordo_tar_prev_ad, cd_tipo_acordo_tar, cd_tipo_acordo_tar_prev, in_ipi_nao_tribut, in_ipi_nao_tribut_prev,
  cd_tipo_benef_pis_cofins, cd_tipo_benef_pis_cofins_prev, cd_fund_legal_piscofins, cd_fund_legal_piscofins_prev,
  cd_tipo_benef_ipi, cd_tipo_benef_ipi_prev : String;
  mens_previsao, mens_prev_capa, mens_prev_adicao, mensICMS, mens_volume: AnsiString;
  vl_mle_mn, vl_total_mle_mn, vl_frete_mn, vl_total_frete_mn, vl_seguro_mn, vl_total_seg_mn,
  pb_previsao, pl_previsao, pb_carga, pl_carga : Double;
  vl_ii_ad, vl_ipi_ad, vl_icms_ad, pl_adicao_ad, qt_adicao_ad,
  vl_ii_prev, vl_ipi_prev, vl_icms_prev, pl_adicao_prev, qt_adicao_prev,
  vl_acrescimo, vl_deducao, vl_frete_interno, vl_acrescimo_capa, vl_deducao_capa,
  vl_frete_interno_capa, qt_estat_adicao_prev, qt_estat_adicao_ad, pc_icms, pc_icms_prev, pc_icms_Merc, pc_icms_reducao, pc_icms_reducao_Merc,
  vl_icms_afrmm_ad, vl_icms_afrmm_prev: Double;
  vListaExcecoes : TStringList;
  // Aliquota especifica - Michel - 15/03/2010
  vl_aliquota_especifica_pis_ad, vl_aliquota_especifica_cofins_ad, qtd_unid_especifica_pis_ad, qtd_unid_especifica_cofins_ad: Real;
  vALIQ_PIS_AD, vALIQ_COFINS_AD, vVL_PIS_AD, vVL_COFINS_AD,
  vALIQ_PIS_PREV_AD, vALIQ_COFINS_PREV_AD, vVL_PIS_PREV_AD, vVL_COFINS_PREV_AD: Double;
  vALIQ_PIS_REDUZIDA_AD, vALIQ_COFINS_REDUZIDA_AD, vALIQ_PIS_PREV_REDUZIDA_AD, vALIQ_COFINS_PREV_REDUZIDA_AD, vNCM_AD, vEXP_AD: String;
  vCD_REG_TRIB_PIS_COFINS_MERC, vCD_FUND_LEG_PIS_COFINS_MERC, vNCM_MERC, vEXP_MERC: String;
  vPC_PIS_MERC, vPC_COFINS_MERC: Double;
  vIN_ALIQ_DIF_PIS, vIN_ALIQ_DIF_COFINS: String;
  vPIS_COFINS_JaPassou: Boolean;
  cd_unidade_medida_pis_ad, cd_unidade_medida_cofins_ad: String;
  vl_aliquota_especifica_pis_conf, vl_aliquota_especifica_cofins_conf, qtd_unid_especifica_pis_conf, qtd_unid_especifica_cofins_conf: Real;
  cd_unidade_medida_pis_conf, cd_unidade_medida_cofins_conf: String;
  in_fundo_pobreza_ad, in_fundo_pobreza_conf,Verifica656 , Verifica468,Nr_processo,PC_ALIQ_II,PC_ALIQ_REDUZIDA_II,PC_ALIQ_REDUZIDA,PC_ALIQ_NORM_ADVAL: String;
  qt_meses_adm_temp, qt_meses_adm_temp_prev: Integer;
  in_suspende_ii_retific, in_suspende_ipi_retific, in_suspende_pis_cofins_retific,
  in_suspende_ii_retific_prev, in_suspende_ipi_retific_prev, in_suspende_pis_cofins_retific_prev: Boolean;
  VL_COFINS,VL_COFINS_PREV : string;
  // Antidumping - Michel - 06/06/2012
  pc_normal_antidumping_ad, vl_base_calc_antidumping_ad, pc_espec_antidumping_ad, qt_unid_espec_antidumping_ad,
  pc_normal_antidumping_prev, vl_base_calc_antidumping_prev, pc_espec_antidumping_prev, qt_unid_espec_antidumping_prev: Real;
  nm_unid_espec_antidumping_ad, nm_unid_espec_antidumping_prev, cd_acordo_aladi_ad, cd_acordo_aladi_prev: string;
  MercadoriaAntidumping: Boolean;
  Msg, VerificaICMSNestle: String;
  inAFRMM: Boolean;
begin
  Nr_processo:= trim(msk_cd_unid_neg.Text)+'01'+ datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;

  Verifica656:= ConsultaLookUPSQL(' SELECT ISNULL(CONVERT(VARCHAR,F.DT_REALIZACAO,103),''--'') DATA '+ sLineBreak +
                                  '   FROM TFOLLOWUP F WITH(NOLOCK)                                 '+ sLineBreak +
                                  '  LEFT JOIN TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = F.NR_PROCESSO  '+ sLineBreak +
                                  '  WHERE ( ( TP.CD_GRUPO = ''155'' AND F.CD_EVENTO=''963'' )  )    '+ sLineBreak +
                                  '    AND TP.NR_PROCESSO = '''+ nr_processo +''' ' ,
                                  'DATA');
  //agatha nigro 26/12/2017
  Verifica468:= ConsultaLookUPSQL(' SELECT ISNULL(CONVERT(VARCHAR,A.DT_REALIZACAO,103),''--'') DATA     '+ sLineBreak +
                                  '   FROM TFOLLOWUP A WITH(NOLOCK)                                     '+ sLineBreak +
                                  '   JOIN TPROCESSO B WITH(NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO    '+ sLineBreak +
                                  '  WHERE A.CD_EVENTO = ''468''                                        '+ sLineBreak +
                                  '    AND ISNULL(B.IN_CROSSDOCKING,0) = 1                              '+ sLineBreak +
                                  '    AND A.NR_PROCESSO = '''+ nr_processo +''' ' ,
                                  'DATA');

  //agatha nigro 17/01/2019
  VerificaICMSNestle:= ConsultaLookUPSQL(
        'SELECT P.NR_PROCESSO                                                                                       '+ sLineBreak +
        'FROM TPROCESSO P (NOLOCK)                                                                                  '+ sLineBreak +
        'JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = P.NR_PROCESSO                                  '+ sLineBreak +
        'JOIN TADICAO_DE_IMPORTACAO  AD (NOLOCK) ON AD.NR_PROCESSO = P.NR_PROCESSO                                  '+ sLineBreak +
        'WHERE P.CD_CLIENTE in (''01983'' , ''01960'', ''02418'')                                                   '+ sLineBreak +
        '  AND P.CD_AREA    = ''Y0''                                                                                '+ sLineBreak +
        '  AND ((ISNULL(AD.CD_TRIBUTACAO_ICMS, '''') <> ''7'') or (ISNULL(AD.CD_FUND_LEGAL_ICMS, '''') <> ''206'')) '+ sLineBreak +
        '  AND P.NR_PROCESSO = '''+ nr_processo +''' ' ,
        'NR_PROCESSO');

  if VerificaICMSNestle <> '' then
  begin
    BoxMensagem('Verifique o ICMS e dispositivo legal informados.' + #13+
                'Processos com cliente (01983) Nesté Nordeste Alim. e Bebidas com área (Y0) Nes Mat. Técnico '+ #13+
                'Usar ICMS (7) Diferido e dispositivo (206) Nestlé - ICMS Diferido BR30.'
                 , 2);
    exit;
  end;

  If (trim(Verifica656) <> '--') and (trim(Verifica468) <> '--') then
  begin
    with datm_trans_DI do
    begin
      lCancelar := False;
      lAbriuSiscomex := False;
      nProcesso := 0;
      nAdicao   := 0;
      nItem     := 0;
      flagTemExcecao := False;

      if dbgrd_di.SelectedRows.Count = 0 then
      begin
        BoxMensagem( 'Nenhuma Declaração foi selecionada!', 2 );
        Exit;
      end;

      btn_trans_DI.Enabled  := False;
      mi_transmitir.Enabled := False;
      btn_sair.Enabled      := False;
      mi_sair.Enabled       := False;
      btn_cancelar.Enabled  := True;
      mi_cancelar.Enabled   := True;

      lbl_mensagem.Caption := 'Verificando os processos selecionados ... ';
      lbl_mensagem.Refresh;

      if lCancelar then
      begin
        btn_trans_DI.Enabled  := True;
        mi_transmitir.Enabled := True;
        btn_sair.Enabled      := True;
        mi_sair.Enabled       := True;
        btn_cancelar.Enabled  := False;
        mi_cancelar.Enabled   := False;
        lbl_mensagem.Caption  := 'Transmissão abortada! Aguardando Instrução...';
        qry_grd_di_.Close;
        qry_grd_di_.Prepare;
        qry_grd_di_.Open;
        Exit;
      end;

      { Abertura das tabelas Import SISCOMEX }
      lbl_processos.Caption := IntToStr(nProcesso);
      lbl_adicoes.Caption   := IntToStr(nAdicao);
      lbl_itens.Caption     := IntToStr(nItem);


      // DRAWBACK *******************************************
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add( 'DELETE FROM TTEMP_DIAGN_DB_SUSP');
        ExecSql;
        SQL.Clear;
        SQL.Add( 'DELETE FROM TDIAGNOSTICO_SALDO');
        ExecSql;
        Free;
      End;

      // VERIFICAÇÃO DAS MERCADORIAS DOS ITENS E DA DATA DE CHEGADA DA MERCADORIA*************** André 11/06/2008 data de chegada da mercadoria incluida
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
          SQL.Add( ' SELECT COUNT(*),                         ');
          SQL.Add( '        (SELECT DI.DT_CHEGADA_CARGA       ');
          SQL.Add( '           FROM TDECLARACAO_IMPORTACAO DI ');
          SQL.Add( '          WHERE DI.NR_PROCESSO = ''' + msk_cd_unid_neg.Text + '01' + qry_grd_di_NR_PROCESSO.AsString + ''')');
          SQL.Add( '   FROM TDETALHE_MERCADORIA DM ');
          SQL.Add( '  WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + '01' + qry_grd_di_NR_PROCESSO.AsString + '''');
          SQL.Add( '    AND ISNULL(CD_MERCADORIA,'''') = ''''');
        Open;
        if (Fields[0].AsInteger > 0) or (Fields[1].AsString = '') then
        begin
          BoxMensagem('Existem itens com o campo "Mercadoria" não preenchido ' + #13 +'ou a DI está sem a Data de Chegada das Mercadorias.' + #13 +'Não foi possível completar o registro!', 2);
          Exit;
        end;
        Close;


        // FERNANDA 03/01/2012 --->>>> ALERTA PARA DI SEM EVENTO 076
        SQL.Clear;
        SQL.Add('SELECT *');
        SQL.Add('FROM TFOLLOWUP');
        SQL.Add('WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + '01' + qry_grd_di_NR_PROCESSO.AsString + '''');
        SQL.Add('  AND CD_EVENTO = ''076''');
        Open;
        if (RecordCount > 0) and (FieldByName('IN_APLICAVEL').AsString = '1') and (FieldByName('DT_REALIZACAO').AsString = '') then
        begin
          BoxMensagem('PROCESSO SEM NUMERÁRIO, FAVOR CONTATAR O ATENDENTE/GERENTE.' + #13 , 2);
          Exit;
        end;
        Close;
      end;


      For i := 0 To dbgrd_di.SelectedRows.Count - 1 Do
      Begin
        If Not lCancelar Then
        Begin
          dbgrd_di.DataSource.DataSet.GotoBookmark(TBookmark(dbgrd_di.SelectedRows[i]));
          ConsisteDrawBack;
        End
        Else
          Break;
        Application.ProcessMessages;
      End;


      Application.CreateForm(TFrmDiagnostico,FrmDiagnostico);
      FrmDiagnostico.SqlDiagnostico.Open;
      If FrmDiagnostico.SqlDiagnostico.RecordCount > 0 Then
        FrmDiagnostico.ShowModal;


    //***************************************************
      If Not FrmDiagnostico.FlagCancelou Then
      Begin
        for i := 0 to dbgrd_di.SelectedRows.Count - 1 do
        begin
          if lCancelar then
            Break;

          dbgrd_di.DataSource.DataSet.GotoBookmark(TBookmark(dbgrd_di.SelectedRows[i]));

          cProcBroker := msk_cd_unid_neg.Text + '01' + qry_grd_di_NR_PROCESSO.AsString;

          qry_di_.Close;
          qry_di_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
          qry_di_.Prepare;
          qry_di_.Open;
          if Not qry_di_.EOF then
          begin
            lcambio      := False;

            CloseStoredProc( sp_di_libera_cc_propria );
            sp_di_libera_cc_propria.ParamByName('@NR_PROCESSO').AsString := cProcBroker;
            ExecStoredProc( sp_di_libera_cc_propria );
            CloseStoredProc( sp_di_libera_cc_propria );

            qry_processo_.Close;
            qry_processo_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
            qry_processo_.Prepare;
            qry_processo_.Open;
            ldi_liberada := qry_processo_IN_DI_LIBERADA.AsString;
            qry_processo_.Close;


            {Verifica Bloqueio manual}
            qry_di_bloqueada_.Close;
            qry_di_bloqueada_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
            qry_di_bloqueada_.Prepare;
            qry_di_bloqueada_.Open;


            if qry_di_bloqueada_IN_BLOQUEADO.AsString = '1' then
            begin
              BoxMensagem( 'Declaração de Importação bloqueada para Registro!', 2 );
              qry_di_bloqueada_.Close;
              btn_cancelarClick(nil);
              Exit;
            end;
            qry_di_bloqueada_.Close;


            if ldi_liberada = '2' then {Valor CIF US$ acima }
            begin
              BoxMensagem( 'Valor CIF US$ acima do valor parametrizado!' + #13#10 +
                           'Favor solicitar liberação!', 2 );
              btn_cancelarClick(nil);
              Exit;
            end;


            if ldi_liberada <> '1' then {Solicitações em Abertos liberadas ou OK}
            begin
              vPassouII  := False;
              vPassouIPI := False;
              vPassouTX  := False;


              qry_trib_ok_.Close;
              qry_trib_ok_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
              qry_trib_ok_.Prepare;
              qry_trib_ok_.Open;
              if Not qry_trib_ok_.EOF then
              begin
                qry_ii_ok_.Close;
                qry_ii_ok_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
                qry_ii_ok_.Prepare;
                qry_ii_ok_.Open;
                if Not qry_ii_ok_.EOF then
                begin
                  if qry_ii_ok_II_OK.AsInteger > 0 then
                  begin
                    if qry_trib_ok_VL_SALDO_II.AsFloat < qry_trib_ok_VL_II.AsFloat then
                    begin
                      BoxMensagem('I.I. com saldo insuficiente!', 2);
                      btn_cancelarClick(nil);
                      Exit;
                    end else begin
                      vPassouII := True;
                    end;
                  end else begin
                    vPassouII := True;
                  end;
                end;

                qry_ipi_ok_.Close;
                qry_ipi_ok_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
                qry_ipi_ok_.Prepare;
                qry_ipi_ok_.Open;
                if Not qry_ipi_ok_.EOF then
                begin
                  if qry_ipi_ok_IPI_OK.AsInteger > 0 then
                  begin
                    if qry_trib_ok_VL_SALDO_IPI.AsFloat < qry_trib_ok_VL_IPI.AsFloat then
                    begin
                      BoxMensagem('I.P.I. com saldo insuficiente!', 2);
                      btn_cancelarClick(nil);
                      Exit;
                    end
                    else
                    begin
                      vPassouIPI := True;
                    end;
                  end
                  else
                  begin
                    vPassouIPI := True;
                  end;
                end;


                qry_siscomex_ok_.Close;
                qry_siscomex_ok_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
                qry_siscomex_ok_.Prepare;
                qry_siscomex_ok_.Open;
                if Not qry_siscomex_ok_.EOF then
                begin
                  if qry_siscomex_ok_SISCOMEX_OK.AsInteger > 0 then
                  begin
                    if qry_trib_ok_VL_SALDO_SISCOMEX.AsFloat < qry_trib_ok_VL_SISCOMEX.AsFloat then
                    begin
                      BoxMensagem('Taxa Siscomex com saldo insuficiente!', 2);
                      btn_cancelarClick(nil);
                      Exit;
                    end
                    else
                    begin
                      vPassouTx := True;
                    end;
                  end
                  else
                  begin
                    vPassouTx := True;
                  end;
                end;

              end
              else
              begin
                BoxMensagem('Declaração de Importação incompleta ', 3);
                btn_cancelarClick(nil);
                Exit;
              end;


              qry_itens_di_.Close;
              qry_itens_di_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
              qry_itens_di_.Prepare;
              qry_itens_di_.Open;
              if Not qry_itens_di_.EOF then
              begin
                if qry_itens_di_TOTAL_SEM_SALDO.AsInteger > 0 then
                begin
                  BoxMensagem( 'Existem itens sem saldo! Verifique numerários!', 2 );
                  btn_cancelarClick(nil);
                  Exit;
                end;
              end;


              {Exibir mensagem de DI não liberada!!!}
              if not vPassouII or not vPassouIPI or not vPassouTx then
              begin
                BoxMensagem( 'Declaração de Importação não está liberada para registro!', 2 );
                btn_cancelarClick(nil);
                Exit;
              end else begin
                vOldSQL := qry_processo_.SQL.Text;
                qry_processo_.SQL.Text := 'UPDATE TPROCESSO SET IN_DI_LIBERADA = ''1'' WHERE NR_PROCESSO = ''' + cProcBroker + '''';
                qry_processo_.ExecSQL;
                qry_processo_.SQL.Text := vOldSQL;
              end;
            end;

            // Com URF de Despacho preenchido executa sp_atualiza_armazem para definir o tipo do ICMS - Michel - 19/03/2009
            CloseStoredProc(sp_atz_tipo_icms);
            sp_atz_tipo_icms.ParamByName('@nr_processo').AsString      := qry_di_NR_PROCESSO.AsString;
            ExecStoredProc(sp_atz_tipo_icms);
            CloseStoredProc(sp_atz_tipo_icms);

            qry_verif_cambio_.Close;
            qry_verif_cambio_.UnPrepare;
            qry_verif_cambio_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
            qry_verif_cambio_.Prepare;
            qry_verif_cambio_.Open;
            while Not (qry_verif_cambio_.EOF) do
            begin
              if qry_verif_cambio_VL_PREV_PGTO_360.AsCurrency > 0 then
                vl_cambio := ( ( qry_verif_cambio_VL_FINANC_SUP_360.AsCurrency ) +
                               ( qry_verif_cambio_VL_PREV_PGTO_360.AsCurrency  ) +
                               ( qry_verif_cambio_VL_VINC_MD_CAMBIO.AsCurrency ) )
              else
                vl_cambio := ( ( qry_verif_cambio_VL_FINANC_SUP_360.AsCurrency ) +
                               ( qry_verif_cambio_VL_PREV_PGTO_360.AsCurrency  ) +
                               ( qry_verif_cambio_VL_TOT_FINANC_360.AsCurrency ) +
                               ( qry_verif_cambio_VL_VINC_MD_CAMBIO.AsCurrency ) );
              if ( vl_cambio <> qry_verif_cambio_VL_MERC_COND_VENDA.AsCurrency ) and
                 ( qry_verif_cambio_CD_COBERT_CAMBIAL.AsString <> '4' ) then
              begin
                BoxMensagem('Adição ' + qry_verif_cambio_NR_ADICAO.AsString + #13 +
                            'Valor do Câmbio  = ' +
                            FloatToStr(vl_cambio) + #13 +
                            'V.M.C.V.             = ' +
                            FloatToStr(qry_verif_cambio_VL_MERC_COND_VENDA.AsCurrency) + #13, 2);
                lcambio := True;
              end;
              qry_verif_cambio_.Next;
            end;
            qry_verif_cambio_.Close;

            if lCambio then
            begin
              btn_cancelarClick(nil);
              Exit;
            end;

            {Verificação de Produtos que incidem Ato de DrawBack}
            mens_ato := '';
            qry_merc_com_ato_.Close;
            qry_merc_com_ato_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '01' +
                                                                     qry_grd_di_NR_PROCESSO.AsString;
            qry_merc_com_ato_.Prepare;
            qry_merc_com_ato_.Open;
            while Not qry_merc_com_ato_.EOF do
            begin
              if Trim( mens_ato ) = '' then
                mens_ato := 'Existem mercadorias que incidem Ato Drawback!' + #13#10 +
                            'Favor verificá-las no SAP:' + #13#10;
              mens_ato := mens_ato + Copy( qry_merc_com_ato_.FieldByName('NR_PROCESSO').AsString, 5, 14 ) + ' - ' +
                          qry_merc_com_ato_.FieldByName('NR_PROC_PO').AsString + ' - ' +
                          qry_merc_com_ato_.FieldByName('CD_MERCADORIA').AsString + ' - ' +
                          qry_merc_com_ato_.FieldByName('AP_MERCADORIA').AsString + #13#10;
              qry_merc_com_ato_.Next;
            end;
            if Trim( mens_ato ) <> '' then
            begin
              BoxMensagem( mens_ato, 3 );
            end;


            {Verificação das alíquotas}
            qry_ver_aliq_.Close;
            qry_ver_aliq_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '01' +
                                                                     qry_grd_di_NR_PROCESSO.AsString;
            qry_ver_aliq_.Prepare;
            qry_ver_aliq_.Open;
            while Not qry_ver_aliq_.EOF do
            begin
              if qry_ver_aliq_CD_RECEITA_IMPOSTO.AsString = '0001' then
              begin
                if Arredondar( qry_ver_aliq_PC_ALIQ_NORM_ADVAL.AsFloat, 2 ) <>
                   Arredondar( qry_ver_aliq_ALIQ_II_NCM.AsFloat, 2 ) then
                begin
                  if Not BoxMensagem( 'Adição ' + Trim( qry_ver_aliq_NR_ADICAO.AsString ) + ' - N.C.M. ' +
                                      Copy( qry_ver_aliq_CD_NCM_SH.AsString, 1, 4 ) + '.' +
                                      Copy( qry_ver_aliq_CD_NCM_SH.AsString, 5, 2 ) + '.' +
                                      Copy( qry_ver_aliq_CD_NCM_SH.AsString, 7, 2 ) + ':' + #13#10 +
                                      'Alíquota do I.I. ( ' + FormatFloat( '#0,.00', qry_ver_aliq_PC_ALIQ_NORM_ADVAL.AsFloat ) +
                                      '% ) diferente da Alíquota cadastrada para este NCM (' +
                                      FormatFloat( '#0,.00', qry_ver_aliq_ALIQ_II_NCM.AsFloat ) + '% ).' + #13#10 +
                                      'Continua?', 1 ) then
                  begin
                    btn_cancelarClick(nil);
                    Exit;
                  end;
                end;
              end;


              if qry_ver_aliq_CD_RECEITA_IMPOSTO.AsString = '0002' then
              begin
                if Arredondar( qry_ver_aliq_PC_ALIQ_NORM_ADVAL.AsFloat, 2 ) <>
                   Arredondar( qry_ver_aliq_ALIQ_IPI_NCM.AsFloat, 2 ) then
                begin
                  if Not BoxMensagem( 'Adição ' + Trim( qry_ver_aliq_NR_ADICAO.AsString ) + ' - N.C.M. ' +
                                      Copy( qry_ver_aliq_CD_NCM_SH.AsString, 1, 4 ) + '.' +
                                      Copy( qry_ver_aliq_CD_NCM_SH.AsString, 5, 2 ) + '.' +
                                      Copy( qry_ver_aliq_CD_NCM_SH.AsString, 7, 2 ) + ':' + #13#10 +
                                      'Alíquota do I.P.I. ( ' + FormatFloat( '#0,.00', qry_ver_aliq_PC_ALIQ_NORM_ADVAL.AsFloat ) +
                                      '% ) diferente da Alíquota cadastrada para este NCM (' +
                                      FormatFloat( '#0,.00', qry_ver_aliq_ALIQ_IPI_NCM.AsFloat ) + '% ).' + #13#10 +
                                      'Continua?', 1 ) then
                  begin
                    btn_cancelarClick(nil);
                    Exit;
                  end;
                end;
              end;

              qry_ver_aliq_.Next;
            end;
            qry_ver_aliq_.Close;



            //Verificação do processo se foi calculado com a Marinha Mercante
            //Rodrigo Capra - 16/04/2008
            if not VerificaMarinhaMercante then
            begin
              BoxMensagem('A DI não pôde ser transmitida.' + #10#13 + 'Verifique se o pagamento da marinha mercante está lançado na tela de pagamentos operacionais e recalcule o Processo', 3);
              btn_cancelarClick(nil);
              Exit;
            end;

            vInConferencia := ConsultaLookUPSQL('select B.IN_CONFERE_REFERENCIA from TPROCESSO A, TGRUPO B where ' +
                                                'A.NR_PROCESSO = '''  + cProcBroker + ''' and B.CD_GRUPO = A.CD_GRUPO','IN_CONFERE_REFERENCIA');

            if not VerifReferenciaDI(cProcBroker, vInConferencia) then
            begin
              btn_cancelarClick(nil);
              Exit;
            end;

            //******************************************************************//
            // CONFERENCIA DA DI                                                //
            //******************************************************************//

            // CASO NÃO ESTEJA LIBERADO PARA TRANSMITIR SEM CONFERENCIA

           //Nelson-Incluido como 2 para nao ser preciso retirar o if/begin/else
           if ConsultaLookupSQL('SELECT IN_TRANSMITE_SEM_PREVISAO FROM TPROCESSO WHERE NR_PROCESSO = ''' + Trim( msk_cd_unid_neg.Text ) + '01' + qry_grd_di_NR_PROCESSO.AsString + '''', 'IN_TRANSMITE_SEM_PREVISAO') <> '2' then
            begin
              {Previsão - Capa}
(*
              qry_previsao_.Close;
              qry_previsao_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '01' + qry_grd_di_NR_PROCESSO.AsString;
              qry_previsao_.Prepare;
              qry_previsao_.Open;

              if AnsiIndexText(Copy(qry_previsao_adicao_NR_PROCESSO.AsString, 5, 2), ['IE', 'IN']) >= 0 then
                inAFRMM := False
              else
                inAFRMM := ConsultaLookUPSQL(' SELECT ISNULL(E.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_MARINHA_MERCANTE_ICMS ' +
                                             ' FROM TPROCESSO                 P ' +
                                             '    INNER JOIN TGRUPO           G ON G.CD_GRUPO = P.CD_GRUPO ' +
                                             '    INNER JOIN VW_SERVICO_GERAL S ON S.CD_SERVICO = P.CD_SERVICO ' +
                                             '    INNER JOIN TEMPRESA_NAC     E ON E.CD_EMPRESA = P.CD_CLIENTE ' +
                                             ' WHERE P.NR_PROCESSO = ' + QuotedStr(qry_previsao_adicao_NR_PROCESSO.AsString), 'IN_MARINHA_MERCANTE_ICMS') = '1';

              if qry_previsao_.EOF then
              begin
                BoxMensagem( 'Conferência para esta D.I. não cadastrada.' + #10#13 + 'Solicite o preenchimento ao Analista do Processo.', 2 );
                btn_cancelarClick(nil);
                Exit;
              end;
              mens_prev_capa    := '';
*)
              {REGION 'CONFERENCIA CAPA - PREENCHE VALORES'}
(*
              vl_mle_mn         := MyRound( qry_previsao_.FieldByName('VL_MLE_MN').AsFloat, 2 );
              vl_total_mle_mn   := MyRound( qry_previsao_.FieldByName('VL_TOTAL_MLE_MN').AsFloat, 2 );
              vl_frete_mn       := MyRound( qry_previsao_.FieldByName('VL_FRETE_MN').AsFloat, 2 );
              vl_total_frete_mn := MyRound( qry_previsao_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat, 2 );
              vl_seguro_mn      := MyRound( qry_previsao_.FieldByName('VL_SEGURO_MN').AsFloat, 2 );
              vl_total_seg_mn   := MyRound( qry_previsao_.FieldByName('VL_TOTAL_SEG_MN').AsFloat, 2 );
              pb_previsao       := MyRound( qry_previsao_.FieldByName('PB_PREVISAO').AsFloat, 2 );
              pb_carga          := MyRound( qry_previsao_.FieldByName('PB_CARGA').AsFloat, 2 );
              pl_previsao       := MyRound( qry_previsao_.FieldByName('PL_PREVISAO').AsFloat, 2 );
              pl_carga          := MyRound( qry_previsao_.FieldByName('PL_CARGA').AsFloat, 2 );
              cd_incoterm_prev  := qry_previsao_.FieldByName('CD_INCOTERM_PREV').AsString;
              cd_incoterm       := qry_previsao_.FieldByName('CD_INCOTERM').AsString;
              nm_via_transp     := qry_previsao_.FieldByName('NM_VIA_TRANSP').AsString;
              nm_via_transporte := qry_previsao_.FieldByName('NM_VIA_TRANSPORTE').AsString;
              cd_importador     := qry_previsao_.FieldByName('CD_IMPORTADOR').AsString;
              cd_cliente        := qry_previsao_.FieldByName('CD_CLIENTE').AsString;
              cd_vinculacao     := qry_previsao_.FieldByName('CD_VINC_IMPO_EXPO').AsString;
              cd_vinculacao_prev:= qry_previsao_.FieldByName('CD_VINC_IMPO_EXPO_PREV').AsString;
              vl_deducao        := MyRound( qry_previsao_.FieldByName('VL_DEDUCAO').AsFloat, 2 );
              vl_frete_interno  := MyRound( qry_previsao_.FieldByName('VL_FRETE_INTERNO').AsFloat, 2 );
              PC_ALIQ_REDUZIDA_II := qry_previsao_.FieldByName('PC_ALIQ_REDUZIDA_II').AsString;
              PC_ALIQ_REDUZIDA := ConsultaLookUPSQL('SELECT PC_ALIQ_REDUZIDA FROM TRIBUTO WHERE  NR_PROCESSO =''' + qry_previsao_.ParamByName('NR_PROCESSO').AsString + ''' AND CD_RECEITA_IMPOSTO=''0001'' AND NR_ADICAO='''+ qry_previsao_.FieldByName('NR_ADICAO').AsString +'''','PC_ALIQ_REDUZIDA');

              vl_deducao_capa := StrToFloat(ConsultaLookUPSQL('SELECT ISNULL(SUM(ROUND(AC.VL_MOEDA * C.TX_CAMBIO, 2)), 0) AS VL_DEDUCAO   ' +
                                                              '  FROM TACRESCIMO_DEDUCAO            AC                                    ' +
                                                              '   INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = AC.NR_PROCESSO ' +
                                                              '   INNER JOIN TTAXA_CAMBIO           C  ON C.CD_MOEDA     = AC.CD_MOEDA    ' +
                                                              '                                       AND DI.DT_CALCULO BETWEEN C.DT_INICIO_VIGENCIA AND C.DT_TERMINO_VIGENCIA ' +
                                                              'WHERE AC.NR_PROCESSO = :NR_PROCESSO                                        ' +
                                                              '  AND AC.TP_DESPESA = "D"',
                                                              'VL_DEDUCAO',
                                                              [qry_previsao_.ParamByName('NR_PROCESSO').AsString]));

              vl_acrescimo      := MyRound( qry_previsao_.FieldByName('VL_ACRESCIMO').AsFloat, 2 );

              vl_acrescimo_capa := StrToFloat(ConsultaLookUPSQL('SELECT ISNULL(SUM(ROUND(AC.VL_MOEDA * C.TX_CAMBIO, 2)), 0) AS VL_ACRESCIMO ' +
                                                                '  FROM TACRESCIMO_DEDUCAO            AC                                    ' +
                                                                '   INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = AC.NR_PROCESSO ' +
                                                                '   INNER JOIN TTAXA_CAMBIO           C  ON C.CD_MOEDA     = AC.CD_MOEDA    ' +
                                                                '                                       AND DI.DT_CALCULO BETWEEN C.DT_INICIO_VIGENCIA AND C.DT_TERMINO_VIGENCIA ' +
                                                                ' WHERE AC.NR_PROCESSO = :NR_PROCESSO ' +
                                                                '   AND AC.TP_DESPESA = "A"',
                                                                'VL_ACRESCIMO',
                                                                [qry_previsao_.ParamByName('NR_PROCESSO').AsString]));



              frete_embutido    := ConsultaLookUPSQL('SELECT IN_EMBUT_FRT_ITENS AS frete_embutido '+
                                                     '  FROM TDECLARACAO_IMPORTACAO               '+
                                                     ' WHERE NR_PROCESSO = ''' + qry_previsao_.ParamByName('NR_PROCESSO').AsString + ''' ',
                                                     'frete_embutido');
              if frete_embutido = 'T' then
                frete_embutido := 'V';

              frete_embutido_prev  := ConsultaLookUPSQL('SELECT IN_EMBUT_FRT_ITENS AS frete_embutido_prev '+
                                                        '  FROM tprevisao                                 '+
                                                        ' WHERE NR_PROCESSO = ''' + qry_previsao_.ParamByName('NR_PROCESSO').AsString + ''' ',
                                                        'frete_embutido_prev');
              if frete_embutido_prev = 'T' then
                frete_embutido_prev := 'V';


              if cd_incoterm = 'EXW' then
                vl_frete_interno_capa := StrToFloat(ConsultalookupSQL('SELECT ISNULL(SUM(VL_MOEDA),0) VL_MOEDA '+
                                                                      '  FROM TACRESCIMO_DEDUCAO (nolock)      '+
                                                                      ' WHERE NR_PROCESSO = ''' + qry_previsao_.ParamByName('NR_PROCESSO').AsString + '''' +
                                                                      '   AND CD_DESPESA = ''10'' AND TP_DESPESA = ''A''',
                                                                      'VL_MOEDA'))
              else
                vl_frete_interno_capa := 0;
*)
              {ENDREGION 'CONFERENCIA CAPA - PREENCHE VALORES'}


              {Region 'CONFERENCIA CAPA'}
(*
              if cd_importador  <> cd_cliente then
                 mens_prev_capa := mens_prev_capa + 'IMPORTADOR......... ' + Space( 15 - Length(  cd_importador  ) ) +
                                  ( cd_importador ) + Space(3) + Space( 15 - Length(   cd_cliente  ) ) +
                                  ( cd_cliente ) +  #13#10;
              if UpperCase(cd_vinculacao)  <> UpperCase(cd_vinculacao_prev) then
                 mens_prev_capa := mens_prev_capa + 'TIPO DE VINCULAÇÃO. ' + Space( 15 - Length(  cd_vinculacao  ) ) +
                                  ( cd_vinculacao ) + Space(3) + Space( 15 - Length(   cd_vinculacao_prev  ) ) +
                                  ( cd_vinculacao_prev ) +  #13#10;
              if (PC_ALIQ_REDUZIDA_II) <> (PC_ALIQ_REDUZIDA) then
                 mens_prev_capa := mens_prev_capa + 'REDUÇÃO.' + Space( 15 - Length(  PC_ALIQ_REDUZIDA_II ) ) +
                                  ( PC_ALIQ_REDUZIDA_II ) + Space(3) + Space( 15 - Length(   PC_ALIQ_REDUZIDA  ) ) +
                                  ( PC_ALIQ_REDUZIDA ) +  #13#10;

              if nm_via_transp  <> nm_via_transporte then
                 mens_prev_capa := mens_prev_capa + 'Via Transporte..... ' + Space( 15 - Length(  nm_via_transp  ) ) +
                                  ( nm_via_transp ) + Space(3) + Space( 15 - Length(   nm_via_transporte  ) ) +
                                  ( nm_via_transporte ) +  #13#10;
              if pb_previsao  <> pb_carga then
                 mens_prev_capa := mens_prev_capa + 'Peso Bruto......... ' +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', pb_carga ) ) ) +
                                  FormatFloat( '###,###,##0.00', pb_carga ) + Space(3) +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', pb_previsao ) ) ) +
                                  FormatFloat( '###,###,##0.00',pb_previsao ) + #13#10;
              if pl_previsao  <> pl_carga then
                 mens_prev_capa := mens_prev_capa + 'Peso Líquido....... ' +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', pl_carga ) ) ) +
                                  FormatFloat( '###,###,##0.00', pl_carga ) + Space(3) +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', pl_previsao ) ) ) +
                                  FormatFloat( '###,###,##0.00',pl_previsao ) + #13#10;
              if vl_mle_mn <> vl_total_mle_mn then
                 mens_prev_capa := mens_prev_capa + 'Valor MLE.......R$: ' +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_total_mle_mn ) ) ) +
                                  FormatFloat( '###,###,##0.00', vl_total_mle_mn ) + Space(3) +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_mle_mn ) ) ) +
                                  FormatFloat( '###,###,##0.00', vl_mle_mn ) + #13#10;
              if vl_frete_mn <> vl_total_frete_mn then
                 mens_prev_capa := mens_prev_capa + 'Valor Frete.....R$: ' +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_total_frete_mn ) ) ) +
                                  FormatFloat( '###,###,##0.00', vl_total_frete_mn ) + Space(3) +
                                  Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_frete_mn ) ) ) +
                                  FormatFloat( '###,###,##0.00', vl_frete_mn ) + #13#10;
              if frete_embutido <> frete_embutido_prev then
                 mens_prev_capa := mens_prev_capa + 'Frete Embutido..... : ' +
                                  Space(4) + frete_embutido + Space(19) + frete_embutido_prev + #13#10;
              if Abs(vl_seguro_mn - vl_total_seg_mn) > 0.03 then
                 mens_prev_capa := mens_prev_capa + 'Valor Seguro....R$: ' +
                                   Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_total_seg_mn ) ) ) +
                                   FormatFloat( '###,###,##0.00', vl_total_seg_mn ) + Space(3) +
                                   Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_seguro_mn ) ) ) +
                                   FormatFloat( '###,###,##0.00', vl_seguro_mn ) + #13#10;
              if MyRound( qry_previsao_.FieldByName('PC_SEGURO').AsFloat, 4 ) <> MyRound( qry_previsao_.FieldByName('PC_SEGURO_MLE').AsFloat, 4 ) then
                 mens_prev_capa := mens_prev_capa + '% Seguro..........: ' +
                                   Space( 15 - Length( FormatFloat( '##0.0000', MyRound( qry_previsao_.FieldByName('PC_SEGURO_MLE').AsFloat, 4 ) ) ) ) +
                                   FormatFloat( '##0.0000', MyRound( qry_previsao_.FieldByName('PC_SEGURO_MLE').AsFloat, 4 ) ) +
                                   Space(3) + Space( 15 - Length( FormatFloat( '##0.0000', MyRound( qry_previsao_.FieldByName('PC_SEGURO').AsFloat, 4 ) ) ) ) +
                                   FormatFloat( '##0.0000', MyRound( qry_previsao_.FieldByName('PC_SEGURO').AsFloat, 4 ) ) + #13#10;
              if Abs(vl_acrescimo_capa - vl_acrescimo) > 0.03 then
                 mens_prev_capa := mens_prev_capa + 'Valor Acréscimo.R$: ' +
                                   Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_acrescimo_capa ) ) ) +
                                   FormatFloat( '###,###,##0.00', vl_acrescimo_capa ) + Space(3) +
                                   Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_acrescimo ) ) ) +
                                   FormatFloat( '###,###,##0.00', vl_acrescimo ) + #13#10;
              if Abs(vl_deducao_capa - vl_deducao) > 0.03 then
                 mens_prev_capa := mens_prev_capa + 'Valor Dedução...R$: ' +
                                   Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_deducao_capa ) ) ) +
                                   FormatFloat( '###,###,##0.00', vl_deducao_capa ) + Space(3) +
                                   Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_deducao ) ) ) +
                                   FormatFloat( '###,###,##0.00', vl_deducao ) + #13#10;

              if cd_incoterm_prev = 'EXW' then
              begin
                if vl_frete_interno_capa <> vl_frete_interno then
                   mens_prev_capa := mens_prev_capa + 'Vl. Frt.Interno.R$: ' +
                                     Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_frete_interno_capa ) ) ) +
                                     FormatFloat( '###,###,##0.00', vl_frete_interno_capa ) + Space(3) +
                                     Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_frete_interno ) ) ) +
                                     FormatFloat( '###,###,##0.00', vl_frete_interno ) + #13#10;
              end;

              // Quantidade de Suspensões da Retificações nas Adições - Michel - 27/03/2010
              if ConsultaLookUPSQL(' SELECT COUNT(DISTINCT ISNULL(IN_SUSPENDE_II_RETIFIC, 0)) AS QTD' +
                                   '   FROM TADICAO_DE_IMPORTACAO ' +
                                   '  WHERE NR_PROCESSO = ' + QuotedStr(Trim(msk_cd_unid_neg.Text) + '01' + qry_grd_di_NR_PROCESSO.AsString) +
                                   '    AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                   '    AND CD_FUND_LEG_REGIME = ''37'' ', 'QTD') = '2' then
                mens_prev_capa := mens_prev_capa + 'Há adições com o campo "Suspender Retificação" do II diferentes.' + #13#10;
              if ConsultaLookUPSQL(' SELECT COUNT(DISTINCT ISNULL(IN_SUSPENDE_IPI_RETIFIC, 0)) AS QTD' +
                                   '   FROM TADICAO_DE_IMPORTACAO ' +
                                   '  WHERE NR_PROCESSO = ' + QuotedStr(Trim(msk_cd_unid_neg.Text) + '01' + qry_grd_di_NR_PROCESSO.AsString) +
                                   '    AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                   '    AND CD_FUND_LEG_REGIME = ''37'' ', 'QTD') = '2' then
                mens_prev_capa := mens_prev_capa + 'Há adições com o campo "Suspender Retificação" do IPI diferentes.' + #13#10;
              if ConsultaLookUPSQL(' SELECT COUNT(DISTINCT ISNULL(IN_SUSPENDE_PIS_COFINS_RETIFIC, 0)) AS QTD' +
                                   '   FROM TADICAO_DE_IMPORTACAO ' +
                                   '  WHERE NR_PROCESSO = ' + QuotedStr(Trim(msk_cd_unid_neg.Text) + '01' + qry_grd_di_NR_PROCESSO.AsString) +
                                   '    AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                   '    AND CD_FUND_LEG_REGIME = ''37'' ', 'QTD') = '2' then
                mens_prev_capa := mens_prev_capa + 'Há adições com o campo "Suspender Retificação"  do PIS/COFINS diferentes.' + #13#10;
*)
              {EndRegion 'CONFERENCIA CAPA'}


              ////////////////////////////// Volumes - 05023/08    ///////////////////////////////////////////
              mens_volume := ValidarVolumes;
              if mens_volume <> '' then
                mens_volume := 'Volumes' + #13#10 + mens_volume ;

              mens_prev_capa := mens_prev_capa + #13#10 + mens_volume;
              ///////////////////////////////////// Fim do controle de Volumes //////////////////////////////

              {Previsão - Adição}


              mens_prev_adicao := '';
              qry_adicao_comp_.Close;
              qry_adicao_comp_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '01' + qry_grd_di_NR_PROCESSO.AsString;
              qry_adicao_comp_.Prepare;
              qry_adicao_comp_.Open;
              while Not qry_adicao_comp_.EOF do
              begin

                //FERNANDA E ERIC 02/01/2012

                If (datm_trans_DI.qry_di_VL_TOT_FRT_PREPAID.AsInteger > 0) and
                   (qry_adicao_comp_VL_FRETE_MERC_MN.AsInteger > qry_adicao_comp_VL_MERC_VENDA_MN.AsInteger) then
                begin
                  ShowMessage('VALOR FRETE MAIOR QUE VALOR DA MERCADORIA, FAVOR VERIFICAR');  //FERNANDA ---> COMENTADO ABAIXO PARA QUE A TRANSMISSÃO SEJA PERMITIDA, PORÉM INFORMANDO O USUÁRIO SOBRE O FRETE.
                end;

                {Region 'CONFERENCIA ADIÇÃO - PREENCHE VALORES'}

                vl_ii_ad                     := MyRound( qry_adicao_comp_.FieldByName('VL_II').AsFloat, 2 );
                vl_ipi_ad                    := MyRound( qry_adicao_comp_.FieldByName('VL_IPI').AsFloat, 2 );
                vl_icms_ad                   := MyRound( qry_adicao_comp_.FieldByName('VL_ICMS').AsFloat, 2 );

                if inAFRMM then
                  vl_icms_afrmm_ad := MyRound( qry_adicao_comp_.FieldByName('VL_ICMS_A_RECOLHER_AFRMM').AsFloat, 2 )
                else
                  vl_icms_afrmm_ad := 0;

                cd_acordo_aladi_ad           := qry_adicao_comp_.FieldByName('CD_ACORDO_ALADI').AsString;

                //ICMS
                cd_tributacao_icms           := qry_adicao_comp_.FieldByName('CD_TRIBUTACAO_ICMS').AsString;
                cd_fund_legal_icms           := qry_adicao_comp_.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                pc_icms_reducao              := MyRound( qry_adicao_comp_.FieldByName('PC_REDUCAO_ICMS').AsFloat, 5 );
                pc_icms                      := MyRound( qry_adicao_comp_.FieldByName('PC_ICMS').AsFloat, 5 );

                // Antidumping - Michel - 06/06/2012
                pc_normal_antidumping_ad     := qry_adicao_comp_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat;
                vl_base_calc_antidumping_ad  := qry_adicao_comp_.FieldByName('VL_BASE_CALC_ADVAL').AsFloat;
                pc_espec_antidumping_ad      := qry_adicao_comp_.FieldByName('VL_ALIQ_ESPEC_IPT').AsFloat;
                qt_unid_espec_antidumping_ad := qry_adicao_comp_.FieldByName('QT_MERC_UN_ALIQ_ES').AsFloat;
                nm_unid_espec_antidumping_ad := Trim(qry_adicao_comp_.FieldByName('NM_UN_ALIQ_ESP_IPT').AsString);

                pl_adicao_ad                 := MyRound( qry_adicao_comp_.FieldByName('PL_MERCADORIA').AsFloat, 5 );
                qt_adicao_ad                 := MyRound( qry_adicao_comp_.FieldByName('QT_MERCADORIA').AsFloat, 5 );
                cd_exportador                := qry_adicao_comp_.FieldByName('CD_FORNECEDOR').AsString;
                cd_pais_aquisicao            := qry_adicao_comp_.FieldByName('CD_PAIS_AQUIS_MERC').AsString;
                cd_fabricante                := qry_adicao_comp_.FieldByName('CD_FABRICANTE').AsString;
                qt_estat_adicao_ad           := MyRound( qry_adicao_comp_.FieldByName('QT_UN_ESTATISTICA').AsFloat, 5 );
                cd_mercadoria_ncm            := qry_adicao_comp_.FieldByName('CD_NCM_SH').AsString;
                cd_pais_origem               := qry_adicao_comp_.FieldByName('CD_PAIS_ORIG_MERC').AsString;

                cd_reg_tributar              := qry_adicao_comp_CD_REGIME_TRIBUTAR.AsString;
                cd_fund_legal_regime         := qry_adicao_comp_CD_FUND_LEG_REGIME.AsString;

                // Adicionado para verificar aplicação e vinculo por adição - Michel - 19/11/2008
                cd_aplicacao_ad_di           := qry_adicao_comp_CD_APLICACAO_MERC.AsString;
                cd_vinc_impo_expo_ad_di      := qry_adicao_comp_CD_VINC_IMPO_EXPO.AsString;

                // Adicionado para verificar Incoterms da Adição - Michel - 09/12/2008
                cd_incoterms_di_ad           := qry_adicao_comp_CD_INCOTERMS_VENDA.AsString;

                // Adicionado para verificar o campo CFOP da Adição - Michel - 14/05/2009
                cd_cfop_ad                   := qry_adicao_comp_CD_CFOP.AsString;

                // Adicionado para verificar o acordo da Adição - Michel - 27/05/2009
                nm_acordo_tar_ad             := qry_adicao_comp_NM_TIPO_ACORDO_TAR.AsString;
                pc_acordo_tar_ad             := qry_adicao_comp_PC_ALIQ_ACOR_TARIF.AsString;

                // Adicionado para verificar o Tipo de Acordo, IPI Tributável e Benefício e Benefício do PIS/COFINS - Michel - 29/12/2009
                cd_tipo_acordo_tar           := qry_adicao_comp_CD_TIPO_ACORDO_TAR.AsString;
                in_ipi_nao_tribut            := qry_adicao_comp_IN_IPI_NAO_TRIBUT.AsString;
                cd_tipo_benef_ipi            := qry_adicao_comp_CD_TIPO_BENEF_IPI.AsString;
                cd_tipo_benef_pis_cofins     := qry_adicao_comp_CD_TIPO_BENEF_PIS_COFINS.AsString;
                cd_fund_legal_piscofins      := qry_adicao_comp_CD_FUND_LEGAL_PISCOFINS.AsString;

                // Adicionado para verificar a Aliquota Especifica - Michel - 15/03/2010
                vl_aliquota_especifica_pis_ad    := qry_adicao_comp_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat;
                vl_aliquota_especifica_cofins_ad := qry_adicao_comp_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat;
                qtd_unid_especifica_pis_ad       := qry_adicao_comp_QTD_UNID_ESPECIFICA_PIS.AsFloat;
                qtd_unid_especifica_cofins_ad    := qry_adicao_comp_QTD_UNID_ESPECIFICA_COFINS.AsFloat;
                cd_unidade_medida_pis_ad         := qry_adicao_comp_CD_UNIDADE_MEDIDA_PIS.AsString;
                cd_unidade_medida_cofins_ad      := qry_adicao_comp_CD_UNIDADE_MEDIDA_COFINS.AsString;

                // Alíquotas e valor do PIS e COFINS - Michel - 05/10/2010
                vALIQ_PIS_AD                 := qry_adicao_comp_ALIQ_PIS.AsFloat;
                vALIQ_COFINS_AD              := qry_adicao_comp_ALIQ_COFINS.AsFloat;
                vALIQ_PIS_REDUZIDA_AD        := qry_adicao_comp_ALIQ_PIS_REDUZIDA.AsString;
                vALIQ_COFINS_REDUZIDA_AD     := qry_adicao_comp_ALIQ_COFINS_REDUZIDA.AsString;
                vVL_PIS_AD                   := qry_adicao_comp_VL_PIS.AsFloat;
                vVL_COFINS_AD                := qry_adicao_comp_VL_COFINS.AsFloat;

                // Adicionado para verificar a Flag que identifica se tem Fundo de Pobreza na Adição - Michel - 17/03/2010
                in_fundo_pobreza_ad          := qry_adicao_comp_IN_FUNDO_POBREZA.AsString;

                // Adicionado para verificar a Quantidade de meses caso seja Admissão Temporária - Michel - 23/03/2010
                qt_meses_adm_temp            := qry_adicao_comp_QT_MESES_ADM_TEMP.AsInteger;

                // Suspensão definitiva dos impostos com Admissão Temporária - Michel - 27/03/2010
                in_suspende_ii_retific         := qry_adicao_comp_IN_SUSPENDE_II_RETIFIC.AsBoolean;
                in_suspende_ipi_retific        := qry_adicao_comp_IN_SUSPENDE_IPI_RETIFIC.AsBoolean;
                in_suspende_pis_cofins_retific := qry_adicao_comp_IN_SUSPENDE_PIS_COFINS_RETIFIC.AsBoolean;

                //Nelson (Inclusão de conferencia da NCM)
                vNCM_AD                 := qry_adicao_comp_CD_NCM_SH.AsString;

                //Nelson (Inclusão de conferencia de Exportador)
                vEXP_AD                 := qry_adicao_comp_CD_FORNECEDOR.AsString;

                //Nelson
                {
                qry_previsao_adicao_.Close;
                qry_previsao_adicao_.ParamByName('NR_PROCESSO').AsString := qry_adicao_comp_.FieldByName('NR_PROCESSO').AsString;
                qry_previsao_adicao_.ParamByName('NR_ADICAO').AsString   := qry_adicao_comp_.FieldByName('NR_ADICAO').AsString;
                qry_previsao_adicao_.Prepare;
                qry_previsao_adicao_.Open;
                if not qry_previsao_adicao_.EOF then
                begin
                  vl_ii_prev           := MyRound( qry_previsao_adicao_.FieldByName('VL_II').AsFloat, 2 );
                  vl_ipi_prev          := MyRound( qry_previsao_adicao_.FieldByName('VL_IPI').AsFloat, 2 );
                  vl_icms_prev         := MyRound( qry_previsao_adicao_.FieldByName('VL_ICMS').AsFloat, 2 );
                  if inAFRMM then
                    vl_icms_afrmm_prev := MyRound( qry_previsao_adicao_.FieldByName('VL_ICMS_A_RECOLHER_AFRMM').AsFloat, 2 )
                  else
                    vl_icms_afrmm_prev := 0;
                  cd_acordo_aladi_prev := qry_previsao_adicao_.FieldByName('CD_ACORDO_ALADI').AsString;

                  //ICMS
                  cd_tributacao_icms_prev := qry_previsao_adicao_.FieldByName('CD_TRIBUTACAO_ICMS_PREV').AsString;
                  pc_icms_prev            := MyRound( qry_previsao_adicao_.FieldByName('PC_ALIQ_ICMS').AsFloat, 5 );
                  pc_icms_reducao_prev    := qry_previsao_adicao_.FieldByName('PC_ALIQ_ICMS_RED').AsString;
                  cd_fund_legal_icms_prev := qry_previsao_adicao_.FieldByName('CD_FUND_LEGAL_ICMS').AsString;

                  // Antidumping - Michel - 06/06/2012
                  pc_normal_antidumping_prev     := qry_previsao_adicao_.FieldByName('PC_NORMAL_ANTIDUMPING').AsFloat;
                  vl_base_calc_antidumping_prev  := qry_previsao_adicao_.FieldByName('VL_BASE_CALC_ANTIDUMPING').AsFloat;
                  pc_espec_antidumping_prev      := qry_previsao_adicao_.FieldByName('PC_ESPEC_ANTIDUMPING').AsFloat;
                  qt_unid_espec_antidumping_prev := qry_previsao_adicao_.FieldByName('QT_UNID_ESPEC_ANTIDUMPING').AsFloat;
                  nm_unid_espec_antidumping_prev := Trim(qry_previsao_adicao_.FieldByName('NM_UNID_ESPEC_ANTIDUMPING').AsString);

                  cd_reg_tributar_prev      := qry_previsao_adicao_CD_REG_TRIB_II.AsString;
                  cd_fund_legal_regime_prev := qry_previsao_adicao_CD_FUND_LEG_REGIME.AsString;

                  // Adicionado para verificar aplicação e vinculo por adição - Michel - 19/11/2008
                  cd_aplicacao_ad_prev      := qry_previsao_adicao_CD_APLICACAO_MERC.AsString;
                  cd_vinc_impo_expo_ad_prev := qry_previsao_adicao_CD_VINC_IMPO_EXPO.AsString;

                  // Adicionado para verificar Incoterms da Adição - Michel - 09/12/2008
                  cd_incoterms_prev_ad := qry_previsao_adicao_CD_INCOTERMS_VENDA.AsString;

                  // Adicionado para verificar o campo CFOP da Adição - Michel - 14/05/2009
                  cd_cfop_prev_ad := qry_previsao_adicao_CD_CFOP.AsString;

                  // Adicionado para verificar o acordo da Adição - Michel - 27/05/2009
                  nm_acordo_tar_prev_ad := qry_previsao_adicao_NM_TIPO_ACORDO_TAR.AsString;
                  pc_acordo_tar_prev_ad := qry_previsao_adicao_PC_ALIQ_ACORDO.AsString;

                  // Adicionado para verificar o Tipo de Acordo, IPI Tributável e Beneficio do PIS/COFINS - Michel - 29/12/2009
                  cd_tipo_acordo_tar_prev       := qry_previsao_adicao_CD_TIPO_ACORDO_TAR.AsString;
                  in_ipi_nao_tribut_prev        := qry_previsao_adicao_IN_IPI_NAO_TRIBUT.AsString;
                  cd_tipo_benef_ipi_prev        := qry_previsao_adicao_CD_REG_TRIB_IPI.AsString;
                  cd_tipo_benef_pis_cofins_prev := qry_previsao_adicao_CD_TIPO_BENEF_PIS_COFINS.AsString;
                  cd_fund_legal_piscofins_prev  := qry_previsao_adicao_CD_FUND_LEGAL_PISCOFINS.AsString;

                  // Não conferir quando for imunidade
                  if (cd_reg_tributar = '2') then // IMUNIDADE
                    cd_tipo_benef_ipi_prev := cd_tipo_benef_ipi;

                  // Adicionado para verificar a Aliquota Especifica - Michel - 15/03/2010
                  vl_aliquota_especifica_pis_conf    := qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat;
                  vl_aliquota_especifica_cofins_conf := qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat;
                  qtd_unid_especifica_pis_conf       := qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat;
                  qtd_unid_especifica_cofins_conf    := qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat;
                  cd_unidade_medida_pis_conf         := qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS.AsString;
                  cd_unidade_medida_cofins_conf      := qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString;

                  // Alíquotas e valor do PIS e COFINS - Michel - 05/10/2010
                  vALIQ_PIS_PREV_AD             := qry_previsao_adicao_ALIQ_PIS.AsFloat;
                  vALIQ_COFINS_PREV_AD          := qry_previsao_adicao_ALIQ_COFINS.AsFloat;
                  vALIQ_PIS_PREV_REDUZIDA_AD    := qry_previsao_adicao_ALIQ_PIS_REDUZIDA.AsString;
                  vALIQ_COFINS_PREV_REDUZIDA_AD := qry_previsao_adicao_ALIQ_COFINS_REDUZIDA.AsString;
                  vVL_PIS_PREV_AD               := qry_previsao_adicao_VL_PIS.AsFloat;
                  vVL_COFINS_PREV_AD            := qry_previsao_adicao_VL_COFINS.AsFloat;

                  pl_adicao_prev         := MyRound( qry_previsao_adicao_.FieldByName('PL_MERCADORIA').AsFloat, 5 );
                  qt_adicao_prev         := MyRound( qry_previsao_adicao_.FieldByName('QT_MERCADORIA').AsFloat, 5 );
                  cd_exportador_prev     := qry_previsao_adicao_.FieldByName('cd_exportador_prev').AsString;
                  cd_pais_aquisicao_prev := qry_previsao_adicao_.FieldByName('CD_PAIS_AQUISICAO').AsString;
                  cd_fabricante_prev     := qry_previsao_adicao_.FieldByName('cd_fabricante_prev').AsString;
                  qt_estat_adicao_prev   := MyRound( qry_previsao_adicao_.FieldByName('QT_MERC_UN_ALIQ_ES').AsFloat, 5 );
                  cd_ncm_sh              := qry_previsao_adicao_.FieldByName('CD_NCM_SH').AsString;
                  cd_pais_origem_prev    := qry_previsao_adicao_.FieldByName('CD_PAIS_FABRICANTE').AsString;
                  // Adicionado para verificar a Flag que identifica se tem Fundo de Pobreza na Adição - Michel - 17/03/2010
                  in_fundo_pobreza_conf := qry_previsao_adicao_IN_FUNDO_POBREZA.AsString;

                  // Adicionado para verificar a Quantidade de meses caso seja Admissão Temporária - Michel - 23/03/2010
                  qt_meses_adm_temp_prev := qry_previsao_adicao_QT_MESES_ADM_TEMP.AsInteger;

                  // Suspensão definitiva dos impostos com Admissão Temporária - Michel - 27/03/2010
                  in_suspende_ii_retific_prev         := qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean;
                  in_suspende_ipi_retific_prev        := qry_previsao_adicao_IN_SUSPENDE_IPI_RETIFIC.AsBoolean;
                  in_suspende_pis_cofins_retific_prev := qry_previsao_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC.AsBoolean;
                                           }
                {EndRegion 'CONFERENCIA ADIÇÃO - PREENCHE VALORES'}

                {Region 'CONFERENCIA ADIÇÃO'}
(*
                  // Verificar o nome do acordo - Michel - 27/05/2009
                  if nm_acordo_tar_ad  <> nm_acordo_tar_prev_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'TIPO DE ACORDO..: ' +
                                        Space( 7 - Length(nm_acordo_tar_ad)) + nm_acordo_tar_ad + Space(3) +
                                        Space( 15 - Length(nm_acordo_tar_prev_ad)) + nm_acordo_tar_prev_ad + #13#10;
                  end;

                  // Verificar a porcentagem do acordo - Michel - 27/05/2009
                  if pc_acordo_tar_ad  <> pc_acordo_tar_prev_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'PC ACORDO.......: ' +
                                        Space( 7 - Length(pc_acordo_tar_ad)) + pc_acordo_tar_ad + Space(3) +
                                        Space( 15 - Length(pc_acordo_tar_prev_ad)) + pc_acordo_tar_prev_ad + #13#10;
                  end;

                  // Verificar Incoterms - Michel - 09/12/2008 - Ocorrência 04401/08
                  if cd_cfop_ad  <> cd_cfop_prev_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'CFOP............: ' +
                                        Space( 7 - Length(cd_cfop_ad)) + cd_cfop_ad + Space(3) +
                                        Space( 15 - Length(cd_cfop_prev_ad)) + cd_cfop_prev_ad + #13#10;
                  end;

                  // Verificar Incoterms - Michel - 09/12/2008 - Ocorrência 04401/08
                  if cd_incoterms_di_ad  <> cd_incoterms_prev_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'INCOTERMS.......: ' +
                                        Space( 7 - Length(cd_incoterms_di_ad)) + cd_incoterms_di_ad + Space(3) +
                                        Space( 15 - Length(cd_incoterms_prev_ad)) + cd_incoterms_prev_ad + #13#10;
                  end;

                  // Comparações adicionadas para os campos Regime Tributário e Fundamento Legal - Michel - 28/10/2008
                  if cd_reg_tributar  <> cd_reg_tributar_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'REG.TRIB........: ' +
                                        Space( 7 - Length(cd_reg_tributar)) + cd_reg_tributar + Space(3) +
                                        Space( 15 - Length(cd_reg_tributar_prev)) + cd_reg_tributar_prev + #13#10;
                  end;
                  if cd_fund_legal_regime  <> cd_fund_legal_regime_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'FUND.LEGAL......: ' +
                                        Space( 7 - Length(cd_fund_legal_regime)) + cd_fund_legal_regime + Space(3) +
                                        Space( 15 - Length(cd_fund_legal_regime_prev)) + cd_fund_legal_regime_prev + #13#10;
                  end;

                  if cd_acordo_aladi_ad  <> cd_acordo_aladi_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'Acordo ALADI....: ' +
                                        Space( 7 - Length(cd_acordo_aladi_ad)) + cd_acordo_aladi_ad + Space(3) +
                                        Space( 15 - Length(cd_acordo_aladi_prev)) + cd_acordo_aladi_prev + #13#10;
                  end;

                  // Comparações adicionadas para os campos Aplicação e Vínculo - Michel - 19/11/2008
                  if cd_aplicacao_ad_di  <> cd_aplicacao_ad_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'TIPO DE APLICAÇÃO..: ' +
                                        Space( 7 - Length(qry_adicao_comp_TX_APLICACAO.AsString)) + qry_adicao_comp_TX_APLICACAO.AsString + Space(3) +
                                        Space( 15 - Length(qry_previsao_adicao_TX_APLICACAO.AsString)) + qry_previsao_adicao_TX_APLICACAO.AsString + #13#10;
                  end;

                  // Verificar o Tipo de Acordo - Michel - 29/12/2009
                  if cd_tipo_acordo_tar_prev <> cd_tipo_acordo_tar then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'TIPO DE ACORDO TAR.: ' +
                                        Space( 7 - Length(cd_tipo_acordo_tar)) + cd_tipo_acordo_tar + Space(3) +
                                        Space( 15 - Length(cd_tipo_acordo_tar_prev)) + cd_tipo_acordo_tar_prev + #13#10;
                  end;

                  // Verificar o IPI Tributável
                  if in_ipi_nao_tribut_prev <> in_ipi_nao_tribut then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'IPI NAO TRIBUTAVEL.: ' +
                                        Space( 7 - Length(in_ipi_nao_tribut)) + in_ipi_nao_tribut + Space(3) +
                                        Space( 15 - Length(in_ipi_nao_tribut_prev)) + in_ipi_nao_tribut_prev + #13#10;
                  end;

                  // Verificar o Benefício IPI
                  if (not StrToBool(in_ipi_nao_tribut)) and (cd_tipo_benef_ipi_prev <> cd_tipo_benef_ipi) then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'TIPO BEN IPI.......: ' +
                                        Space( 7 - Length(cd_tipo_benef_ipi)) + cd_tipo_benef_ipi + Space(3) +
                                        Space( 15 - Length(cd_tipo_benef_ipi_prev)) + cd_tipo_benef_ipi_prev + #13#10;
                  end;

                   // Verificar o Valor  PIS - Michel - 15/03/2010
                  if Abs(vVL_PIS_AD - vVL_PIS_PREV_AD) > 0.02 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'VALOR PIS..........: ' +
                                        Space( 7 - Length(FloatToStr(vVL_PIS_AD))) + FloatToStr(vVL_PIS_AD) + Space(3) +
                                        Space( 15 - Length(FloatToStr(vVL_PIS_PREV_AD))) + FloatToStr(vVL_PIS_PREV_AD) + #13#10;
                  end;


                  // Verifica se o módulo da diferença dos valores de Cofins é superior a 0.024. Antes considerava 0.020,
                  // mas a função algumas vezes retornava valores como 0.020000001, o que invalidava a verificação.       Eric  14:13h 17/08/2012.
                  if Abs(vVL_COFINS_AD - vVL_COFINS_PREV_AD) > 0.024 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'VALOR COFINS.......: ' +
                                        Space( 7 - Length(FloatToStr(vVL_COFINS_AD))) + FloatToStr(vVL_COFINS_AD) + Space(3) +
                                        Space( 15 - Length(FloatToStr(vVL_COFINS_PREV_AD))) + FloatToStr(vVL_COFINS_PREV_AD) + #13#10;
                  end;

                  // Verificar a Aliquota Especifica PIS - Michel - 15/03/2010
                  if vl_aliquota_especifica_pis_conf <> vl_aliquota_especifica_pis_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'ALIQ ESPECIF PIS...: ' +
                                        Space( 7 - Length(FloatToStr(vl_aliquota_especifica_pis_ad))) + FloatToStr(vl_aliquota_especifica_pis_ad) + Space(3) +
                                        Space( 15 - Length(FloatToStr(vl_aliquota_especifica_pis_conf))) + FloatToStr(vl_aliquota_especifica_pis_conf) + #13#10;
                  end;

                  // Verificar a Aliquota Especifica COFINS - Michel - 15/03/2010
                  if vl_aliquota_especifica_cofins_conf <> vl_aliquota_especifica_cofins_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'ALIQ ESPECIF COFINS: ' +
                                        Space( 7 - Length(FloatToStr(vl_aliquota_especifica_cofins_ad))) + FloatToStr(vl_aliquota_especifica_cofins_ad) + Space(3) +
                                        Space( 15 - Length(FloatToStr(vl_aliquota_especifica_cofins_conf))) + FloatToStr(vl_aliquota_especifica_cofins_conf) + #13#10;
                  end;

                  // Verificar a Quantidade na Unidade Especifica PIS - Michel - 15/03/2010
                  if qtd_unid_especifica_pis_conf <> qtd_unid_especifica_pis_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'QTD ESPECIF PIS....: ' +
                                        Space( 7 - Length(FloatToStr(qtd_unid_especifica_pis_ad))) + FloatToStr(qtd_unid_especifica_pis_ad) + Space(3) +
                                        Space( 15 - Length(FloatToStr(qtd_unid_especifica_pis_conf))) + FloatToStr(qtd_unid_especifica_pis_conf) + #13#10;
                  end;

                  // Verificar a Quantidade na Unidade Especifica COFINS - Michel - 15/03/2010
                  if qtd_unid_especifica_cofins_conf <> qtd_unid_especifica_cofins_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'QTD ESPECIF COFINS.: ' +
                                        Space( 7 - Length(FloatToStr(qtd_unid_especifica_cofins_ad))) + FloatToStr(qtd_unid_especifica_cofins_ad) + Space(3) +
                                        Space( 15 - Length(FloatToStr(qtd_unid_especifica_cofins_conf))) + FloatToStr(qtd_unid_especifica_cofins_conf) + #13#10;
                  end;

                  // Verificar a Unidade de Medida Especifica PIS - Michel - 15/03/2010
                  if cd_unidade_medida_pis_conf <> cd_unidade_medida_pis_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'UNID MED ESP PIS...: ' +
                                        Space( 7 - Length(cd_unidade_medida_pis_ad)) + cd_unidade_medida_pis_ad + Space(3) +
                                        Space( 15 - Length(cd_unidade_medida_pis_conf)) + cd_unidade_medida_pis_conf + #13#10;
                  end;

                  // Verificar a Unidade de Medida Especifica COFINS - Michel - 15/03/2010
                  if cd_unidade_medida_cofins_conf <> cd_unidade_medida_cofins_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'UNID MED ESP COFINS: ' +
                                        Space( 7 - Length(cd_unidade_medida_cofins_ad)) + cd_unidade_medida_cofins_ad + Space(3) +
                                        Space( 15 - Length(cd_unidade_medida_cofins_conf)) + cd_unidade_medida_cofins_conf + #13#10;
                  end;

                  // Verificar a Flag que identifica se tem Fundo de Pobreza na Adição - Michel - 17/03/2010
                  if in_fundo_pobreza_conf <> in_fundo_pobreza_ad then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'FECP...............: ' +
                                        Space( 7 - Length(in_fundo_pobreza_ad)) + in_fundo_pobreza_ad + Space(3) +
                                        Space( 15 - Length(in_fundo_pobreza_conf)) + in_fundo_pobreza_conf + #13#10;
                  end;

                  // Verificar Quantidade de meses da Admissão Temporária - Michel - 17/03/2010
                  if qt_meses_adm_temp <> qt_meses_adm_temp_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'Qtd Meses Adm Temp.: ' +
                                        Space( 7 - Length(IntToStr(qt_meses_adm_temp))) + IntToStr(qt_meses_adm_temp) + Space(3) +
                                        Space( 15 - Length(IntToStr(qt_meses_adm_temp_prev))) + IntToStr(qt_meses_adm_temp_prev) + #13#10;
                  end;

                  // Suspensão definitiva dos impostos com Admissão Temporária - Michel - 27/03/2010
                  if in_suspende_ii_retific <> in_suspende_ii_retific_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'SUSP II RETIFIC....: ' +
                                        Space( 7 - Length(BoolToStr(in_suspende_ii_retific, True))) + BoolToStr(in_suspende_ii_retific, True) + Space(3) +
                                        Space( 15 - Length(BoolToStr(in_suspende_ii_retific_prev, True))) + BoolToStr(in_suspende_ii_retific_prev, True) + #13#10;
                  end;
                  if in_suspende_ipi_retific <> in_suspende_ipi_retific_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'SUSP IPI RETIFIC...: ' +
                                        Space( 7 - Length(BoolToStr(in_suspende_ipi_retific, True))) + BoolToStr(in_suspende_ipi_retific, True) + Space(3) +
                                        Space( 15 - Length(BoolToStr(in_suspende_ipi_retific_prev, True))) + BoolToStr(in_suspende_ipi_retific_prev, True) + #13#10;
                  end;
                  if in_suspende_pis_cofins_retific <> in_suspende_pis_cofins_retific_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'SUSP PIS/COFINS RET: ' +
                                        Space( 7 - Length(BoolToStr(in_suspende_pis_cofins_retific, True))) + BoolToStr(in_suspende_pis_cofins_retific, True) + Space(3) +
                                        Space( 15 - Length(BoolToStr(in_suspende_pis_cofins_retific_prev, True))) + BoolToStr(in_suspende_pis_cofins_retific_prev, True) + #13#10;
                  end;

                  if cd_vinc_impo_expo_ad_di  <> cd_vinc_impo_expo_ad_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'TIPO DE VINCULAÇÃO.: ' +
                                        Space( 7 - Length(qry_adicao_comp_TX_VINCULO.AsString)) + qry_adicao_comp_TX_VINCULO.AsString + Space(3) +
                                        Space( 15 - Length(qry_previsao_adicao_TX_VINCULO.AsString)) + qry_previsao_adicao_TX_VINCULO.AsString + #13#10;
                  end;

                  if cd_ncm_sh  <> cd_mercadoria_ncm then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'NCM.............: ' +
                                        Space( 7 - Length(cd_mercadoria_ncm)) + cd_mercadoria_ncm + Space(3) +
                                        Space( 15 - Length(cd_ncm_sh)) + cd_ncm_sh + #13#10;
                  end;

                  if Abs(vl_ii_ad - vl_ii_prev) > 0.05 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou  := True;
                    mens_prev_adicao := mens_prev_adicao + 'I.I.............R$: ' +
                                        Space( 7 - Length( FormatFloat( '###,###,##0.00', vl_ii_ad ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_ii_ad ) + Space(3) +
                                        Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_ii_prev ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_ii_prev ) + #13#10;
                  end;

                  if Abs(vl_ipi_ad - vl_ipi_prev) > 0.05 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'I.P.I...........R$: ' +
                                        Space( 7 - Length( FormatFloat( '###,###,##0.00', vl_ipi_ad ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_ipi_ad ) + Space(3) +
                                        Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_ipi_prev ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_ipi_prev ) + #13#10;

                  end;

                  if Abs(vl_icms_ad - vl_icms_prev) > 0.05 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'I.C.M.S.........R$: ' +
                                        Space( 7 - Length( FormatFloat( '###,###,##0.00', vl_icms_ad ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_icms_ad ) + Space(3) +
                                        Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_icms_prev ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_icms_prev ) + #13#10;
                  end;

                  if inAFRMM and (Abs(vl_icms_afrmm_ad - vl_icms_afrmm_prev) > 0.05) then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'I.C.M.S + AFRMM.R$: ' +
                                        Space( 7 - Length( FormatFloat( '###,###,##0.00', vl_icms_afrmm_ad ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_icms_afrmm_ad ) + Space(3) +
                                        Space( 15 - Length( FormatFloat( '###,###,##0.00', vl_icms_afrmm_prev ) ) ) +
                                        FormatFloat( '###,###,##0.00', vl_icms_afrmm_prev ) + #13#10;
                  end;

                  if Abs(pl_adicao_ad - pl_adicao_prev) > 0.05 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'Peso Líq..........: ' +
                                        Space( 7 - Length( FormatFloat( '###,###,##0.00000', pl_adicao_ad ) ) ) +
                                        FormatFloat( '###,###,##0.00000', pl_adicao_ad ) + Space(3) +
                                        Space( 15 - Length( FormatFloat( '###,###,##0.00000', pl_adicao_prev ) ) ) +
                                        FormatFloat( '###,###,##0.00000', pl_adicao_prev ) + #13#10;
                  end;

                  if Abs(qt_adicao_ad - qt_adicao_prev) > 0.02 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'Quantidade........: ' +
                                        Space( 7 - Length( FormatFloat( '###,###,##0.00000', qt_adicao_ad ) ) ) +
                                        FormatFloat( '###,###,##0.00000', qt_adicao_ad ) + Space(3) +
                                        Space( 15 - Length( FormatFloat( '###,###,##0.00000', qt_adicao_prev ) ) ) +
                                        FormatFloat( '###,###,##0.00000', qt_adicao_prev ) + #13#10;
                  end;

                  if Abs(qt_estat_adicao_ad - qt_estat_adicao_prev) > 0.02 then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'Qtde.Med.Estatist.: ' +
                                        Space( 7 - Length( FormatFloat( '###,###,##0.00000', qt_estat_adicao_ad ) ) ) +
                                        FormatFloat( '###,###,##0.00000', qt_estat_adicao_ad ) + Space(3) +
                                        Space( 15 - Length( FormatFloat( '###,###,##0.00000', qt_estat_adicao_prev ) ) ) +
                                        FormatFloat( '###,###,##0.00000', qt_estat_adicao_prev ) + #13#10;
                  end;

                  if cd_exportador <> cd_exportador_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'Exportador........: ' +
                                        Space( 7 - Length( cd_exportador ) ) + cd_exportador + Space(3) +
                                        Space( 15 - Length( cd_exportador_prev ) ) + cd_exportador_prev + #13#10;
                  end;

                  if cd_pais_aquisicao <> cd_pais_aquisicao_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'Pais de Aquisição...: ' +
                                        Space( 7 - Length( cd_pais_aquisicao ) ) + cd_pais_aquisicao + Space(3) +
                                        Space( 15 - Length( cd_pais_aquisicao_prev ) ) + cd_pais_aquisicao_prev + #13#10;
                  end;

                  if cd_fabricante <> cd_fabricante_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'Fabricante........: ' +
                                        Space( 7 - Length( cd_fabricante ) ) + cd_fabricante + Space(3) +
                                        Space( 15 - Length( cd_fabricante_prev ) ) + cd_fabricante_prev + #13#10;
                  end;

                  if cd_pais_origem <> cd_pais_origem_prev then
                  begin
                    if not vAdicaoJaPassou then
                      mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                    vAdicaoJaPassou := True;
                    mens_prev_adicao := mens_prev_adicao + 'Pais de Origem......: ' +
                                        Space( 7 - Length( cd_pais_origem ) ) + cd_pais_origem + Space(3) +
                                        Space( 15 - Length( cd_pais_origem_prev ) ) + cd_pais_origem_prev + #13#10;
                  end;
*)
                {EndRegion 'CONFERENCIA ADIÇÃO'}





                // bloco query
                  with TQuery.Create(Application) do
                  begin
                    DatabaseName := 'DBBROKER';
                    SQL.Clear;
                    SQL.Add('SELECT CD_MERCADORIA FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO =:NR_PROCESSO AND ');
                    SQL.Add('NR_ADICAO =:NR_ADICAO');
                    ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' + qry_grd_di_NR_PROCESSO.AsString;
                    ParamByName('NR_ADICAO').AsString   := qry_adicao_comp_.FieldByName('NR_ADICAO').AsString;
                    Open;
                    pc_icms_Merc := 0;
                    vCD_REG_TRIB_PIS_COFINS_MERC := '';
                    vCD_FUND_LEG_PIS_COFINS_MERC := '';
                    vPC_PIS_MERC := 0;
                    vPC_COFINS_MERC := 0;
                    vIN_ALIQ_DIF_PIS := '0';
                    vIN_ALIQ_DIF_COFINS := '0';


                    cd_fund_legal_icms_Merc_Ou_Empresa:='';

                    while not EOF do
                    begin
                      if not (vICMSJaPassou or vPIS_COFINS_JaPassou) then
                      begin
                        qry_mercadoria.Close;
                        datm_trans_DI.qry_mercadoria.ParamByName('CD_MERCADORIA').AsString := FieldByName('CD_MERCADORIA').AsString;
                        qry_mercadoria.Open;

                        cd_tributacao_icms_merc := qry_mercadoria.FieldByName('CD_TRIBUTACAO_ICMS').AsString;
                        MercadoriaAntidumping   := qry_mercadoria.FieldByName('IN_ANTIDUMPING').AsString = '1';


                        //Nelson (Inclusão da conferencia de NCM)
                        vNCM_MERC := qry_mercadoria.FieldByName('CD_NCM_SH').AsString;

                        //Nelson (Inclusão da conferencia de EXPORTADOR)
                        vEXP_MERC := qry_mercadoria.FieldByName('CD_EXPORTADOR').AsString;

                        pc_icms_reducao_Merc := qry_mercadoria.FieldByName('PC_REDUCAO_ICMS').AsFloat;

                        vCD_REG_TRIB_PIS_COFINS_MERC := qry_mercadoria.FieldByName('CD_REG_TRIB_PIS_COFINS').AsString;
                        vCD_FUND_LEG_PIS_COFINS_MERC := qry_mercadoria.FieldByName('CD_FUND_LEG_PIS_COFINS').AsString;

                        if (vIN_ALIQ_DIF_PIS = '0') and (qry_mercadoria.FieldByName('IN_ALIQ_DIF_PIS').AsString = '1') then
                          vIN_ALIQ_DIF_PIS := qry_mercadoria.FieldByName('IN_ALIQ_DIF_PIS').AsString;
                        if (vIN_ALIQ_DIF_COFINS = '0') and (qry_mercadoria.FieldByName('IN_ALIQ_DIF_COFINS').AsString = '1') then
                          vIN_ALIQ_DIF_COFINS := qry_mercadoria.FieldByName('IN_ALIQ_DIF_COFINS').AsString;

                        if ((cd_tributacao_icms_merc <> '3') or (vCD_REG_TRIB_PIS_COFINS_MERC <> '2')) and   //ISENÇÃO
                           ((cd_tributacao_icms_merc <> '6') or (vCD_REG_TRIB_PIS_COFINS_MERC <> '5')) then  //NÃO INCIDENTE
                        begin
                          if qry_mercadoria.FieldByName('IN_ALIQ_DIF').AsString = '1' then //se for aliquota diferenciada então pegar o valor do ICMS do cadatro de mercadorias
                            pc_icms_Merc := qry_mercadoria.FieldByName('PC_ICMS').AsFloat;

                          // Pega a aliquota da mercadoria se for diferenciada - Michel - 30/12/2011
                          if vIN_ALIQ_DIF_PIS = '1' then
                            vPC_PIS_MERC := qry_mercadoria.FieldByName('PC_PIS').AsFloat;

                          if vIN_ALIQ_DIF_COFINS = '1' then
                            vPC_COFINS_MERC := qry_mercadoria.FieldByName('PC_COFINS').AsFloat;

                          //  inicio bloco exceções
                          begin
                            //Exceções - procurar na tabela de exceções a aliquota do ICMS  ( TUF_EXCECOES )
                            if SelectSql(SqlAux, 'SELECT VL_ALIQ_ICMS, SCRIPT_SELECT, RESULT_SELECT, DESC_EXCECAO, CD_REGIME_TRIB, ' +
                                                 '       IN_EXCECAO_VALE_MAIS, CD_DISPOSITIVO_LEGAL, PC_PIS, PC_COFINS, CD_REG_TRIB_PIS_COFINS, CD_FUND_LEG_PIS_COFINS ' +
                                                 'FROM TUF_EXCECOES ' +
                                                 'WHERE IN_CONTEMPLA_ADICAO = ''0'' AND (CD_UF = ''' + datm_trans_DI.qry_grd_di_.FieldByName('END_UF').AsString + ''') OR CD_UF = ''XX'' ' +
                                                 'ORDER BY CD_PRIORIDADE') then
                            begin
                              if vListaExcecoes = nil then
                              begin
                                vListaExcecoes := TStringList.Create;
                                vListaExcecoes.Add('');
                                vListaExcecoes.Add('Exceções Válidas : ');
                                vListaExcecoes.Add('');
                              end;

                              while not SqlAux.Eof do  //Verificando exceções...
                              begin
                                with TQuery.Create(Application) do
                                begin
                                  DatabaseName := 'DBBROKER';
                                  SQL.Clear;
                                  SQL.Add(SqlAux.FieldByName('SCRIPT_SELECT').AsString);
                                  ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' + datm_trans_DI.qry_grd_di_.FieldByName('NR_PROCESSO').AsString;
                                  Open;
                                  if not IsEmpty then
                                  begin
                                    if Fields[0].AsString = datm_trans_DI.SqlAux.FieldByName('RESULT_SELECT').AsString then
                                    begin
                                      case SqlAux.FieldByName('IN_EXCECAO_VALE_MAIS').AsString[1] of
                                        '0': begin
                                               if qry_mercadoria.FieldByName('IN_ALIQ_DIF').AsString = '1' then //se for aliquota diferenciada então pegar o valor do ICMS do cadatro de mercadorias
                                                 pc_icms_Merc := qry_mercadoria.FieldByName('PC_ICMS').AsFloat;
                                               // Pega a aliquota da mercadoria se for diferenciada - Michel - 30/12/2011
                                               if qry_mercadoria.FieldByName('IN_ALIQ_DIF_PIS').AsString = '1' then
                                                 vPC_PIS_MERC := qry_mercadoria.FieldByName('PC_PIS').AsFloat;
                                               if qry_mercadoria.FieldByName('IN_ALIQ_DIF_COFINS').AsString = '1' then
                                                 vPC_COFINS_MERC := qry_mercadoria.FieldByName('PC_COFINS').AsFloat;
                                             end;
                                        '1': begin // Vale mais sempre
                                               pDescExcecao := SqlAux.FieldByName('DESC_EXCECAO').AsString;
                                               pc_icms_Merc := datm_trans_DI.SqlAux.FieldByName('VL_ALIQ_ICMS').AsFloat;

                                               if SqlAux.FieldByName('CD_REGIME_TRIB').AsString <> '' then //ocorrência
                                                 cd_tributacao_icms_merc := SqlAux.FieldByName('CD_REGIME_TRIB').AsString;

                                               //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                               if SqlAux.FieldByName('CD_DISPOSITIVO_LEGAL').AsString <> '' then //ocorrência
                                                  cd_fund_legal_icms_Merc_Ou_Empresa := SqlAux.FieldByName('CD_DISPOSITIVO_LEGAL').AsString
                                               else
                                               if SqlAux.FieldByName('CD_DISPOSITIVO_LEGAL').Value = Null then // Para não bloquear quando estiver nulo o campo - Michel - 09/08/2012
                                                  cd_fund_legal_icms_Merc_Ou_Empresa := cd_fund_legal_icms;

                                               // Pega a aliquota da mercadoria se for diferenciada - Michel - 30/12/2011
                                               // Nas condições abaixo foi incluída verificação para não utilizar o valor do campo se estiver nulo - Michel - 15/08/2012
                                               if (qry_mercadoria.FieldByName('IN_ALIQ_DIF_PIS').AsString = '1') and not VarIsNull(SqlAux.FieldByName('PC_PIS').Value) then
                                                 vPC_PIS_MERC := SqlAux.FieldByName('PC_PIS').AsFloat;

                                               if (qry_mercadoria.FieldByName('IN_ALIQ_DIF_COFINS').AsString = '1') and not VarIsNull(SqlAux.FieldByName('PC_COFINS').Value) then
                                                 vPC_COFINS_MERC := SqlAux.FieldByName('PC_COFINS').AsFloat;

                                               if SqlAux.FieldByName('CD_REG_TRIB_PIS_COFINS').AsString <> '' then
                                                 vCD_REG_TRIB_PIS_COFINS_MERC := SqlAux.FieldByName('CD_REG_TRIB_PIS_COFINS').AsString;

                                               if SqlAux.FieldByName('CD_FUND_LEG_PIS_COFINS').AsString <> '' then
                                                 vCD_FUND_LEG_PIS_COFINS_MERC := SqlAux.FieldByName('CD_FUND_LEG_PIS_COFINS').AsString;

                                                 
                                               vListaExcecoes.Add(pDescExcecao);
                                               flagTemExcecao := True;
                                             end;
                                        '2': begin
                                               // Nas condições abaixo foi incluída verificação para não utilizar o valor do campo se estiver nulo - Michel - 15/08/2012

                                               if ((qry_mercadoria.FieldByName('IN_ALIQ_DIF').AsString = '1') and // Vale mais desde que seja menor do que a Diferenciada
                                                  (SqlAux.FieldByName('VL_ALIQ_ICMS').AsFloat < qry_mercadoria.FieldByName('PC_ICMS').AsFloat)) or
                                                  (qry_mercadoria.FieldByName('IN_ALIQ_DIF').AsString <> '1') and not VarIsNull(SqlAux.FieldByName('VL_ALIQ_ICMS').Value) then
                                                 pc_icms_Merc := SqlAux.FieldByName('VL_ALIQ_ICMS').AsFloat;

                                               // Pega a aliquota da mercadoria se for diferenciada - Michel - 30/12/2011
                                               if (((qry_mercadoria.FieldByName('IN_ALIQ_DIF_PIS').AsString = '1') and // Vale mais desde que seja menor do que a Diferenciada
                                                  (SqlAux.FieldByName('PC_PIS').AsFloat < qry_mercadoria.FieldByName('PC_PIS').AsFloat)) or
                                                  (qry_mercadoria.FieldByName('IN_ALIQ_DIF_PIS').AsString <> '1')) and not VarIsNull(SqlAux.FieldByName('PC_PIS').Value) then
                                                 vPC_PIS_MERC := SqlAux.FieldByName('PC_PIS').AsFloat;

                                               if (((qry_mercadoria.FieldByName('IN_ALIQ_DIF_COFINS').AsString = '1') and // Vale mais desde que seja menor do que a Diferenciada
                                                  (SqlAux.FieldByName('PC_COFINS').AsFloat < qry_mercadoria.FieldByName('PC_COFINS').AsFloat)) or
                                                  (qry_mercadoria.FieldByName('IN_ALIQ_DIF_COFINS').AsString <> '1')) and not VarIsNull(SqlAux.FieldByName('PC_COFINS').Value) then
                                                 vPC_COFINS_MERC := SqlAux.FieldByName('PC_COFINS').AsFloat;
                                             end;
                                      end;
                                    end;
                                  end;
                                  Free;
                                end;
                                SqlAux.Next;
                              end;
                              if pDescExcecao <> '' then
                              begin
                                vListaExcecoes.Delete(vListaExcecoes.IndexOf(pDescExcecao));
                                vListaExcecoes.Add(pDescExcecao + '(utilizado)');
                              end
                            end;

                           { ****}
                            datm_trans_DI.qry_ExcecoesAdicao.Close;
                            datm_trans_DI.qry_ExcecoesAdicao.ParamByName('CD_UF').AsString := datm_trans_DI.qry_grd_di_.FieldByName('END_UF').AsString;
                            datm_trans_DI.qry_ExcecoesAdicao.Open;
                            if not datm_trans_DI.qry_ExcecoesAdicao.IsEmpty then
                            begin
                              while not datm_trans_DI.qry_ExcecoesAdicao.Eof do
                              begin
                                with TQuery.Create(Application) do
                                begin
                                  DatabaseName := 'DBBROKER';
                                  SQL.Clear;
                                  SQL.Add(datm_trans_DI.qry_ExcecoesAdicao.FieldByName('SCRIPT_SELECT').AsString);
                                  ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' + datm_trans_DI.qry_grd_di_.FieldByName('NR_PROCESSO').AsString;
                                  ParamByName('NR_ADICAO').AsString   := qry_adicao_comp_.FieldByName('NR_ADICAO').AsString;
                                  Open;
                                  if not IsEmpty then
                                  begin
                                    if qry_ExcecoesAdicao.FieldByName('IN_EXCECAO_VALE_MAIS').AsString <> '1' then //a Exceção vale menos
                                    begin
                                      if qry_mercadoria.FieldByName('IN_ALIQ_DIF').AsString = '1' then //se for aliquota diferenciada então pegar o valor do ICMS do cadatro de mercadorias
                                        pc_icms_Merc := qry_mercadoria.FieldByName('PC_ICMS').AsFloat;

                                      // Pega a aliquota da mercadoria se for diferenciada - Michel - 30/12/2011
                                      if qry_mercadoria.FieldByName('IN_ALIQ_DIF_PIS').AsString = '1' then
                                        vPC_PIS_MERC := qry_mercadoria.FieldByName('PC_PIS').AsFloat;

                                      if qry_mercadoria.FieldByName('IN_ALIQ_DIF_COFINS').AsString = '1' then
                                        vPC_COFINS_MERC := qry_mercadoria.FieldByName('PC_COFINS').AsFloat;
                                    end
                                    else if Fields[0].AsString = datm_trans_DI.qry_ExcecoesAdicao.FieldByName('RESULT_SELECT').AsString then
                                    begin
                                      pDescExcecao            := qry_ExcecoesAdicao.FieldByName('DESC_EXCECAO').AsString;
                                      pc_icms_Merc            := qry_ExcecoesAdicao.FieldByName('VL_ALIQ_ICMS').AsFloat;

                                      if qry_ExcecoesAdicao.FieldByName('CD_REGIME_TRIB').AsString <> '' then //ocorrência
                                        cd_tributacao_icms_merc := qry_ExcecoesAdicao.FieldByName('CD_REGIME_TRIB').AsString;

                                      if SqlAux.FieldByName('CD_DISPOSITIVO_LEGAL').AsString <> '' then //ocorrência
                                        cd_fund_legal_icms_Merc_Ou_Empresa := qry_ExcecoesAdicao.FieldByName('CD_DISPOSITIVO_LEGAL').AsString;

                                      // Regime de Tributação e Fundamento Legal do Pis Cofins - Michel - 30/12/2011
                                      vPC_PIS_MERC := qry_mercadoria.FieldByName('PC_PIS').AsFloat;
                                      vPC_COFINS_MERC := qry_mercadoria.FieldByName('PC_COFINS').AsFloat;

                                      if qry_ExcecoesAdicao.FieldByName('CD_REG_TRIB_PIS_COFINS').AsString <> '' then
                                        vCD_REG_TRIB_PIS_COFINS_MERC := qry_ExcecoesAdicao.FieldByName('CD_REG_TRIB_PIS_COFINS').AsString;

                                      if qry_ExcecoesAdicao.FieldByName('CD_FUND_LEG_PIS_COFINS').AsString <> '' then
                                        vCD_FUND_LEG_PIS_COFINS_MERC := qry_ExcecoesAdicao.FieldByName('CD_FUND_LEG_PIS_COFINS').AsString;

                                      vListaExcecoes.Add(pDescExcecao + ' - Adição nº' + qry_adicao_comp_.FieldByName('NR_ADICAO').AsString);
                                    end;
                                  end;
                                  Free;
                                end;
                                datm_trans_DI.qry_ExcecoesAdicao.Next;
                              end;
                            end;

                            //criar uma condição para que caso exista uma exceção então não pegar o icms do estado
                            if not flagTemExcecao then
                            begin
                              if pc_icms_Merc = 0 then  //se não existir exceções então pega a alíquota do estado do cliente
                                pc_icms_Merc := StrToFloat(ConsultaLookUP('TUF', 'CD_UF',datm_trans_DI.qry_grd_di_.FieldByName('END_UF').AsString,'VL_ALIQ_ICMS'));
                            end;
                          end;
                          // Bloco exceções fim
                        end;

                        //Campo IN_VERIF_ICMS_TRANSM é uma FLAG utilizada para não fazer as consistências do ICMS da mercadoria com a DI e a Conferência
                        if not qry_mercadoria.IsEmpty then
                        begin
                          if (not vICMSJaPassou)// and
                              then  //ISENÇÃO e NÃO INCIDENTE
                          begin
                            if (datm_trans_DI.qry_grd_di_.FieldByName('IN_CAT63').AsString <> '1') and // Verifica se o cliente possuiu a flag
                                                                                                       // no cadastro de empresa "Regime Especial'
                               (datm_trans_DI.qry_grd_di_.FieldByName('IN_REGIME_ESP').AsString = '1') then
                            begin
                              if cd_tributacao_icms_merc <> '5' then  // Verifica se o cliente não possuiu as flags no cadastro
                              begin
                                vRegEspecial := False;
                                pNmColunaICMS := 'Mercadoria';
                                //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                IF cd_fund_legal_icms_Merc_Ou_Empresa = '' THEN
                                  cd_fund_legal_icms_Merc_Ou_Empresa := qry_mercadoria.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                              end
                              else
                              begin
                                vRegEspecial := True;
                                pNmColunaICMS := 'Regime Especial';
                                //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                IF cd_fund_legal_icms_Merc_Ou_Empresa = '' THEN
                                  cd_fund_legal_icms_Merc_Ou_Empresa := qry_grd_di_.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                              end
                            end
                            else
                            begin
                              if ((datm_trans_DI.qry_grd_di_.FieldByName('IN_CAT63').AsString = '1') and  // Verifica se o cliente possuiu a flag no cadastro de empresa "CAT63'
                               (datm_trans_DI.qry_grd_di_.FieldByName('IN_REGIME_ESP').AsString <> '1')) then
                              begin
                                if (ConsultaLookUpSQL('select IN_CAT63 from TMERCADORIA ' +
                                                      ' where CD_MERCADORIA = ''' + datm_trans_DI.qry_mercadoria.ParamByName('CD_MERCADORIA').AsString + ''' ',
                                                      'IN_CAT63') = '1') then
                                begin
                                  pNmColunaICMS := 'CAT63';
                                  pQtdDiasParam := StrToInt(ConsultaLookUpSQL('select QT_DIAS_CAT63 from TPARAMETROS', 'QT_DIAS_CAT63'));
                                  DecodeDate(Now,pAno, pMes, pDia);
                                  if (Date <= PoeOuTiraDiasUteis(pQtdDiasParam,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(pAno,pMes)))) ) then
                                  begin
                                    vRegEspecial := True;
                                    cd_fund_legal_icms_Merc_Ou_Empresa := '055';
                                  end;
                                end
                                else
                                begin
                                  if cd_tributacao_icms_merc <> '5' then  // Verifica se o cliente não possuiu as flags no cadastro
                                  begin
                                    vRegEspecial := False;
                                    pNmColunaICMS := 'Mercadoria';
                                    //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                    IF cd_fund_legal_icms_Merc_Ou_Empresa = '' THEN
                                      cd_fund_legal_icms_Merc_Ou_Empresa := qry_mercadoria.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                                  end
                                  else
                                  begin
                                    ShowMessage ('O cliente não está marcado como Regime Especial!');
                                  end
                                end;
                              end
                            end;
                            if ((datm_trans_DI.qry_grd_di_.FieldByName('IN_CAT63').AsString <> '1') and
                               (datm_trans_DI.qry_grd_di_.FieldByName('IN_REGIME_ESP').AsString <> '1')) then
                            begin
                              if cd_tributacao_icms_merc <> '5' then  // Verifica se o cliente não possuiu as flags no cadastro
                              begin
                                vRegEspecial := False;
                                pNmColunaICMS := 'Mercadoria';
                                //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                IF cd_fund_legal_icms_Merc_Ou_Empresa = '' THEN
                                  cd_fund_legal_icms_Merc_Ou_Empresa := qry_mercadoria.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                              end
                              else
                              begin
                                ShowMessage ('O cliente não está marcado como Regime Especial!');
                              end
                            end
                            else
                            begin
                              pQtdDiasParam := StrToInt(ConsultaLookUpSQL('select QT_DIAS_CAT63 from TPARAMETROS', 'QT_DIAS_CAT63'));
                              DecodeDate(Now,pAno, pMes, pDia);

                              if     ((datm_trans_DI.qry_grd_di_.FieldByName('IN_REGIME_ESP').AsString = '1')
                                 and  (datm_trans_DI.qry_grd_di_.FieldByName('IN_CAT63').AsString = '1'))    then
                                      // cliente possuiu as duas flags no cadastro
                              begin
                                if (ConsultaLookUpSQL('select IN_CAT63    '+
                                                      '  from TMERCADORIA ' +
                                                      ' where CD_MERCADORIA = ''' + datm_trans_DI.qry_mercadoria.ParamByName('CD_MERCADORIA').AsString + ''' ',
                                                      'IN_CAT63') = '1')
                                   and (Date <= PoeOuTiraDiasUteis(pQtdDiasParam,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(pAno,pMes)))) ) then
                                begin
                                  pNmColunaICMS  := 'CAT63';
                                  vRegEspecial   := True;
                                  cd_fund_legal_icms_Merc_Ou_Empresa := '055';
                                end
                                else
                                if (cd_tributacao_icms = cd_tributacao_icms_prev) then
                                begin
                                  if cd_tributacao_icms_merc <> '5' then  // Verifica se o cliente não possuiu as flags no cadastro
                                  begin
                                    vRegEspecial := False;
                                    pNmColunaICMS := 'Mercadoria';
                                    //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                    IF cd_fund_legal_icms_Merc_Ou_Empresa = '' THEN
                                      cd_fund_legal_icms_Merc_Ou_Empresa := qry_mercadoria.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                                  end
                                  else
                                  begin
                                    vRegEspecial := True;
                                    pNmColunaICMS := 'Regime Especial';
                                    //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                    IF cd_fund_legal_icms_Merc_Ou_Empresa = '' THEN
                                      cd_fund_legal_icms_Merc_Ou_Empresa := qry_grd_di_.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                                  end;
                                end
                                else
                                begin
                                  vRegEspecial := False;
                                  pNmColunaICMS := 'Mercadoria';
                                  //ALTERADO POR FERNANDA COM MICHEL EM 27/12/2011
                                  IF cd_fund_legal_icms_Merc_Ou_Empresa = '' THEN
                                    cd_fund_legal_icms_Merc_Ou_Empresa := qry_mercadoria.FieldByName('CD_FUND_LEGAL_ICMS').AsString;
                                end;
                              end;
                            end;

                            //Por definição com o Vitor, qdo a empresa for "Regime Especial" então assumirá o valor 5 e a DI/Conferência devem conter o mesmo valor - 18-01-2008 - Rodrigo Capra
                            if vRegEspecial then
                              cd_tributacao_icms_merc := '5';

                            //Conversei com o Vitor dia 11/01/2008 e decidimos igualar o valor da variável de regime de tributação qdo for Ato Drawback
                            if cd_fund_legal_icms = '004' then
                              cd_tributacao_icms_merc := cd_tributacao_icms;

                            //Regime de Tributação
                            if //Nelson (  cd_tributacao_icms <> cd_tributacao_icms_prev) or
                                ( (datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1') and
                                  (cd_tributacao_icms <> cd_tributacao_icms_merc)
                                 ) then
                            begin
                             // if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Tributação do ICMS.: ' +
                                                  Space( 5 - Length( cd_tributacao_icms ) ) + cd_tributacao_icms + Space(3) +
                                                  //Space( 15 - Length( cd_tributacao_icms_prev ) ) + cd_tributacao_icms_prev + Space(3) +
                                                  IIF (datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1', Space( 15 - Length( cd_tributacao_icms_merc ) ) + cd_tributacao_icms_merc + #13#10 , Space(20) );
                              vICMSJaPassou := True;
                            end;

                            //Alíquota de ICMS
                            if in_fundo_pobreza_ad = '1' then // Com Fundo de Pobreza
                            begin
                              if //Nelson (  pc_icms <> pc_icms_prev) or
                                 ( (datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1') and
                                 ( (pc_icms + Pc_Fundo_Pobreza) <> pc_icms_Merc) ) then
                                begin
                                  if not vAdicaoJaPassou then
                                    mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                                  vAdicaoJaPassou := True;
                                  mensICMS := mensICMS + 'Alíquota de ICMS...: ' +
                                                      Space(5 - Length(FloatToStr(pc_icms) + '+' + FloatToStr(Pc_Fundo_Pobreza))) + FloatToStr(pc_icms) + '+' + FloatToStr(Pc_Fundo_Pobreza) + Space(3) +
                                                      //Space(15 - Length( FloatToStr(pc_icms_prev))) + FloatToStr(pc_icms_prev) + Space(3) +
                                                      IIF (datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1', Space(15 - Length(FloatToStr(pc_icms_Merc))) + FloatToStr(pc_icms_Merc) +  ' - ' + pDescExcecao + #13#10, Space(20));
                                  vICMSJaPassou := True;
                                end;
                            end
                            else // Sem Fundo de Pobreza
                            begin
                              if //Nelson (  pc_icms <> pc_icms_prev) or
                                 ( (datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1') and
                                 (  pc_icms <> pc_icms_Merc) ) then
                                begin
                                if not vAdicaoJaPassou then
                                  mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                                vAdicaoJaPassou := True;
                                mensICMS := mensICMS + 'Alíquota de ICMS...: ' +
                                                    Space( 5 - Length( FloatToStr(pc_icms) ) )      + FloatToStr(pc_icms)      + Space(3) +
                                                    //Space( 15 - Length( FloatToStr(pc_icms_prev) ) ) + FloatToStr(pc_icms_prev) + Space(3) +
                                                    IIF (datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1', Space( 15 - Length( FloatToStr(pc_icms_Merc) ) ) + FloatToStr(pc_icms_Merc) +  ' - ' + pDescExcecao + #13#10, Space(20));
                                vICMSJaPassou := True;
                              end;
                            end;

                            //Alíquota de ICMS
                            //Nelson
                            {if (  pc_icms_reducao <> pc_icms_reducao_prev) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;

                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Redução de ICMS...: ' +
                                                  Space( 5 - Length(pc_icms_reducao) )      + pc_icms_reducao + Space(3) +
                                                  Space( 15 - Length(pc_icms_reducao_prev ) ) + pc_icms_reducao_prev + Space(3) +
                                                  Space( 15 - Length('------') ) + '------' + #13#10;
                              vICMSJaPassou := True;
                            end;   }

                            if cd_fund_legal_icms <> '004' then
                            begin
                              //Conversei com o Vitor dia 11/01/2008 e decidimos retirar a comparação do dispositivo legal qdo for ato drawback
                              //Dispositivo Legal
                              if //Nelson (  cd_fund_legal_icms <> cd_fund_legal_icms_Prev) or
                                 ( (cd_fund_legal_icms <> cd_fund_legal_icms_Merc_Ou_Empresa) and
                                 (  datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1'))then
                              begin
                                if not vAdicaoJaPassou then
                                  mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                                vAdicaoJaPassou := True;
                                mensICMS := mensICMS + 'Dispositivo Legal..: ' +
                                                    Space( 5 -  Length( cd_fund_legal_icms ) ) + cd_fund_legal_icms + Space(3) +
                                                    //Space( 15 - Length( cd_fund_legal_icms_Prev ) ) + cd_fund_legal_icms_Prev + Space(3) +
                                                    Space( 15 - Length( cd_fund_legal_icms_Merc_Ou_Empresa ) ) + cd_fund_legal_icms_Merc_Ou_Empresa + #13#10;
                                vICMSJaPassou := True;
                              end;
                            end;
                          end; // vICMSJaPassou





                          // Antidumping - Michel - 06/06/2012
                          if ((pc_espec_antidumping_ad = 0) and (pc_normal_antidumping_ad = 0) and MercadoriaAntidumping) or
                             (((pc_espec_antidumping_ad <> 0) or (pc_normal_antidumping_ad <> 0)) and not MercadoriaAntidumping) then
                          begin
                            if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                            vAdicaoJaPassou := True;
                            mensICMS := mensICMS + 'Andidumping.......: ' +
                                                Space( 5 - 3) + IfThen((pc_espec_antidumping_ad <> 0) or (pc_normal_antidumping_ad <> 0), 'Sim', 'Não') + Space(3) +
                                                //Space( 15 - 3) + IfThen((pc_espec_antidumping_prev <> 0) or (pc_normal_antidumping_prev <> 0), 'Sim', 'Não') + Space(3) +
                                                Space( 15 - 3) + IfThen(MercadoriaAntidumping, 'Sim', 'Não') + #13#10;
                            vICMSJaPassou := True;
                          end;

                          //Nelson
                         { if (pc_normal_antidumping_ad <> pc_normal_antidumping_prev) then
                          begin
                            if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                            vAdicaoJaPassou := True;
                            mensICMS := mensICMS + 'Aliq. Antidumping.: ' +
                                                Space( 5 - Length(FormatFloat('0.00', pc_normal_antidumping_ad))) + FormatFloat('0.00', pc_normal_antidumping_ad) + Space(3) +
                                                Space( 15 - Length(FormatFloat('0.00', pc_normal_antidumping_prev))) + FormatFloat('0.00', pc_normal_antidumping_prev) + Space(3) +
                                                Space( 15 - Length(IfThen(MercadoriaAntidumping, 'Sim', 'Não'))) + IfThen(MercadoriaAntidumping, 'Sim', 'Não') + #13#10;
                            vICMSJaPassou := True;
                          end;  }

                          //Nelson
                          { if (vl_base_calc_antidumping_ad <> vl_base_calc_antidumping_prev) then
                          begin
                            if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                            vAdicaoJaPassou := True;
                            mensICMS := mensICMS + 'Base Antidumping..: ' +
                                                Space( 5 - Length(FormatFloat('0.00', vl_base_calc_antidumping_ad))) + FormatFloat('0.00', vl_base_calc_antidumping_ad) + Space(3) +
                                                Space( 15 - Length(FormatFloat('0.00', vl_base_calc_antidumping_prev))) + FormatFloat('0.00', vl_base_calc_antidumping_prev) + Space(3) + #13#10;
                            vICMSJaPassou := True;
                          end;    }

                          //Nelson
                          { if (pc_espec_antidumping_ad <> pc_espec_antidumping_prev) then
                          begin
                            if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                            vAdicaoJaPassou := True;
                            mensICMS := mensICMS + 'Aliq. Esp. Antidu.: ' +
                                                Space( 5 - Length(FormatFloat('0.00', pc_espec_antidumping_ad))) + FormatFloat('0.00', pc_espec_antidumping_ad) + Space(3) +
                                                Space( 15 - Length(FormatFloat('0.00', pc_espec_antidumping_prev))) + FormatFloat('0.00', pc_espec_antidumping_prev) + Space(3) +
                                                Space( 15 - Length(IfThen(MercadoriaAntidumping, 'Sim', 'Não'))) + IfThen(MercadoriaAntidumping, 'Sim', 'Não') + #13#10;
                            vICMSJaPassou := True;
                          end;    }

                          //Nelson
                          { if (qt_unid_espec_antidumping_ad <> qt_unid_espec_antidumping_prev) then
                          begin
                            if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                            vAdicaoJaPassou := True;
                            mensICMS := mensICMS + 'Qtd. Esp. Antidum.: ' +
                                                Space( 5 - Length(FormatFloat('0.00', qt_unid_espec_antidumping_ad))) + FormatFloat('0.00', qt_unid_espec_antidumping_ad) + Space(3) +
                                                Space( 15 - Length(FormatFloat('0.00', qt_unid_espec_antidumping_prev))) + FormatFloat('0.00', qt_unid_espec_antidumping_prev) + Space(3) + #13#10;
                            vICMSJaPassou := True;
                          end;    }

                          //Nelson
                          { if (nm_unid_espec_antidumping_ad <> nm_unid_espec_antidumping_prev) then
                          begin
                            if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                            vAdicaoJaPassou := True;
                            mensICMS := mensICMS + 'Unid. Esp. Antidu.: ' +
                                                Space( 5 - Length(nm_unid_espec_antidumping_ad)) + nm_unid_espec_antidumping_ad + Space(3) +
                                                Space( 15 - Length(nm_unid_espec_antidumping_prev)) + nm_unid_espec_antidumping_prev + Space(3)+ #13#10;
                            vICMSJaPassou := True;
                          end;    }


                            //Nelson (Inclusão da conferencia da NCM)
                            if (vNCM_AD <> vNCM_MERC) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'NCM.......: ' +
                                 Space(5 -  Length(vNCM_AD)) + (vNCM_AD) + Space(3) +
                                // Space(15 - Length(FloatToStr(vNCM_PREV_AD))) + FloatToStr(vNCM_PREV_AD) + Space(3) +
                                 Space(15 - Length((vNCM_MERC))) + (vNCM_MERC) + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;


                            //Nelson (Inclusão da conferencia de EXPORTADOR)
                            if (vEXP_AD <> vEXP_MERC) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Cod. Exportador...: ' +
                                 Space(5 -  Length(vEXP_AD)) + (vEXP_AD) + Space(3) +
                                 Space(15 - Length((vEXP_MERC))) + (vEXP_MERC) + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;

                          if (pc_icms_reducao <> pc_icms_reducao_Merc) then
                          begin
                            if not vAdicaoJaPassou then
                              mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                            vAdicaoJaPassou := True;
                            mensICMS := mensICMS + 'ICMS Redução......: ' +
                               Space(5 -  Length(FloatToStr(pc_icms_reducao))) + (FloatToStr(pc_icms_reducao)) + Space(3) +
                               Space(15 - Length((FloatToStr(pc_icms_reducao_Merc)))) + (FloatToStr(pc_icms_reducao_Merc)) + #13#10;
                            vPIS_COFINS_JaPassou := True;
                          end;

                          // Pis Cofins - Michel - 30/12/2011
                          if {(not vPIS_COFINS_JaPassou) and} (vCD_REG_TRIB_PIS_COFINS_MERC <> '2') and (vCD_REG_TRIB_PIS_COFINS_MERC <> '5') and // ISENÇÃO E NÃO INCIDÊNCIA
                             (datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1') then
                          begin
                            if //Nelson (cd_tipo_benef_pis_cofins <> cd_tipo_benef_pis_cofins_prev) or
                               (cd_tipo_benef_pis_cofins <> vCD_REG_TRIB_PIS_COFINS_MERC) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Reg Trib PIS/COFINS: ' +
                                 Space(5 -  Length(cd_tipo_benef_pis_cofins)) + cd_tipo_benef_pis_cofins + Space(3) +
                                 //Space(15 - Length(cd_tipo_benef_pis_cofins_prev)) + cd_tipo_benef_pis_cofins_prev + Space(3) +
                                 Space(15 - Length(vCD_REG_TRIB_PIS_COFINS_MERC)) + vCD_REG_TRIB_PIS_COFINS_MERC + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;

                            if //Nelson (cd_fund_legal_piscofins <> cd_fund_legal_piscofins_prev) or
                               (cd_fund_legal_piscofins <> vCD_FUND_LEG_PIS_COFINS_MERC) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Fund Leg PIS/COFINS: ' +
                                 Space(5 -  Length(cd_fund_legal_piscofins)) + cd_fund_legal_piscofins + Space(3) +
                                 //Space(15 - Length(cd_fund_legal_piscofins_prev)) + cd_fund_legal_piscofins_prev + Space(3) +
                                 Space(15 - Length(vCD_FUND_LEG_PIS_COFINS_MERC)) + vCD_FUND_LEG_PIS_COFINS_MERC + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;

                            if (vIN_ALIQ_DIF_PIS = '1') and ({//Nelson (vALIQ_PIS_AD <> vALIQ_PIS_PREV_AD) or} (vALIQ_PIS_AD <> vPC_PIS_MERC)) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Alíquota PIS.......: ' +
                                 Space(5 -  Length(FloatToStr(vALIQ_PIS_AD))) + FloatToStr(vALIQ_PIS_AD) + Space(3) +
                                 //Space(15 - Length(FloatToStr(vALIQ_PIS_PREV_AD))) + FloatToStr(vALIQ_PIS_PREV_AD) + Space(3) +
                                 Space(15 - Length(FloatToStr(vPC_PIS_MERC))) + FloatToStr(vPC_PIS_MERC) + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;

                            if (vIN_ALIQ_DIF_COFINS = '1') and ({//Nelson(vALIQ_COFINS_AD <> vALIQ_COFINS_PREV_AD) or} (vALIQ_COFINS_AD <> vPC_COFINS_MERC)) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Alíquota COFINS....: ' +
                                 Space(5 -  Length(FloatToStr(vALIQ_COFINS_AD))) + FloatToStr(vALIQ_COFINS_AD) + Space(3) +
                                 //Space(15 - Length(FloatToStr(vALIQ_COFINS_PREV_AD))) + FloatToStr(vALIQ_COFINS_PREV_AD) + Space(3) +
                                 Space(15 - Length(FloatToStr(vPC_COFINS_MERC))) + FloatToStr(vPC_COFINS_MERC) + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;

                              //Nelson
                            { if (vALIQ_PIS_REDUZIDA_AD <> vALIQ_PIS_PREV_REDUZIDA_AD) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Alíquota Red PIS...: ' +
                                 Space(5 -  Length(vALIQ_PIS_REDUZIDA_AD)) + vALIQ_PIS_REDUZIDA_AD + Space(3) +
                                 Space(15 - Length(vALIQ_PIS_PREV_REDUZIDA_AD)) + vALIQ_PIS_PREV_REDUZIDA_AD + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;   }

                            //Nelson
                            { if (vALIQ_COFINS_REDUZIDA_AD <> vALIQ_COFINS_PREV_REDUZIDA_AD) then
                            begin
                              if not vAdicaoJaPassou then
                                mensICMS := mensICMS + #13#10 + 'Adição: ' + qry_previsao_adicao_.FieldByName('NR_ADICAO').AsString + #13#10;
                              vAdicaoJaPassou := True;
                              mensICMS := mensICMS + 'Alíquota Red COFINS: ' +
                                 Space(5 -  Length(vALIQ_COFINS_REDUZIDA_AD)) + vALIQ_COFINS_REDUZIDA_AD + Space(3) +
                                 Space(15 - Length(vALIQ_COFINS_PREV_REDUZIDA_AD)) + vALIQ_COFINS_PREV_REDUZIDA_AD + #13#10;
                              vPIS_COFINS_JaPassou := True;
                            end;}

                          end;
                        end;
                      end;
                      Next;
                    end; // end while
                    Free;
                  end; // end  query
                // end bloco query
(*
                end
                else
                begin
                  mens_prev_adicao := mens_prev_adicao + #13#10 + 'Adição: ' + qry_adicao_comp_.FieldByName('NR_ADICAO').AsString + ' não informada!' + #13#10;
                end;
*)
                vAdicaojaPassou := False;
                vICMSJaPassou   := False;
                qry_adicao_comp_.Next;
              end;

              if ( Trim( mens_prev_capa ) <> '' ) or
                 ( Trim( mens_prev_adicao ) <> '' ) then
              begin
                mens_previsao := 'Divergências na Declaração de Importação:' + #13#10#13#10
                                + Space(25) +'D.I.               Mercadoria' //'D.I.      Conferência'
                                + #13#10;
                mens_previsao := mens_previsao + mens_prev_capa + mens_prev_adicao;
              end;


              if Trim( mensICMS ) <> '' then
                mens_previsao := mens_previsao           + #13#10#13#10 +
                                'Divergências:' + #13#10#13#10 + Space(25) +
                                'D.I.               ' +
                                 IIF(datm_trans_DI.qry_grd_di_.FieldByName('IN_VERIF_ICMS_TRANSM').AsString = '1',pNmColunaICMS,'')
                                 + #13#10 + mensICMS;


              if Trim( mens_previsao ) <> '' then
              begin
                Application.CreateForm( Tfrm_erros_di , frm_erros_di );
                frm_erros_di.nr_processo := qry_grd_di_NR_PROCESSO.AsString;
                frm_erros_di.mem_erros.Lines.Clear;
                frm_erros_di.mem_erros.Lines.Add( mens_previsao );

                if vListaExcecoes <> nil then
                begin
                  frm_erros_di.mem_erros.Lines.AddStrings(vListaExcecoes );
                end;

                if ConsultaLookupSQL('SELECT IN_TRANSMITE_SEM_PREVISAO FROM TPROCESSO WHERE NR_PROCESSO = ''' + Trim( msk_cd_unid_neg.Text ) + '01' + qry_grd_di_NR_PROCESSO.AsString + '''', 'IN_TRANSMITE_SEM_PREVISAO') <> '1' then
                begin
                  if rgrp_transmissao_para.ItemIndex <> 0 then  //se não for diagnóstico
                  begin
                    frm_erros_di.lblMsgPermissaoUsuario.Visible := true;
                    if (str_cd_cargo <> '001') then
                    begin
                      frm_erros_di.btnProsseguir.Enabled := false;
                      frm_erros_di.lblMsgPermissaoUsuario.caption := 'Você não tem permissão para prosseguir';
                    end
                    else
                    begin
                      frm_erros_di.btnProsseguir.Enabled := true;
                      frm_erros_di.lblMsgPermissaoUsuario.caption := 'Você tem permissão para prosseguir';
                    end;
                  end;
                end;

                frm_erros_di.ShowModal;
                if frm_erros_di.ModalResult = mrCancel then
                begin
                  qry_previsao_.Close;
                  btn_cancelarClick(nil);
                  Exit;
                end;

              end;
              qry_previsao_.Close;

            end;

            //******************************************************************//
            // FIM DA CONFERENCIA DA DI                                         //
            //******************************************************************//

            {Verifica se o cliente ( TEMPRESA_NAC ) esta como "Importador"}
            if StrToBool(ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA',qry_grd_di_CD_IMPORTADOR.AsString,'IN_IMPORTADOR')) <> True then
            begin
              BoxMensagem('O importador "' + qry_grd_di_CD_IMPORTADOR.AsString +
                                     ' - ' + qry_grd_di_NM_EMPRESA.AsString    +
                         '" do processo "' + qry_grd_di_NR_PROCESSO.AsString   +
                         '", não está com o CNPJ habilitado para registrar DIs.',3);
              Exit;
            end;

            {CAT63}
            with TQuery.Create(Application) do
            begin
              DatabaseName := 'DBBROKER';
              SQL.Clear;
              SQL.Add('SELECT NR_ADICAO FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + '01' + qry_grd_di_NR_PROCESSO.AsString + '''');
              Open;
              while not EOF do
              begin
                // verifica o beneficio do cat63 para cada adição do processo a ser transmitido
                if VerificaCAT63(2,msk_cd_unid_neg.Text+'01'+qry_grd_di_NR_PROCESSO.AsString,Fields[0].AsString,'') then
                  BoxMensagem('A adição " ' + Fields[0].AsString + ' " do processo " ' + qry_grd_di_NR_PROCESSO.AsString + ' " está sendo transmitida como CAT63.',3);
                Next;
              end;
              Close;
              Free;
            end;

            // FAZ A VERIFICAÇÃO DE ALIQUOTAS CASO TENHA EX INFORMADO
            with TQuery.Create(Application) do
            begin
              DatabaseName := 'DBBROKER';
              SQL.Clear;
              // ESTA QUERY LISTA TODAS AS ADICOES QUE POSSUEM ALGUM EX E AS ALIQUOTAS TANTO DA NCM QTO A CADASTRADA NA ADICAO
              SQL.Add('SELECT TR.NR_ADICAO, TR.PC_ALIQ_NORM_ADVAL, AI.CD_NCM_SH, NCM.ALIQUOTA_IPI, NCM.ALIQUOTA_II, TR.CD_RECEITA_IMPOSTO');
              SQL.Add('  FROM TRIBUTO TR, TATO_VINCULADO AV, TNCM NCM, TADICAO_DE_IMPORTACAO AI');
              SQL.Add(' WHERE TR.NR_PROCESSO = ''' + msk_cd_unid_neg.Text + '01' + qry_grd_di_NR_PROCESSO.AsString + '''');
              SQL.Add('   AND AV.NR_PROCESSO = TR.NR_PROCESSO');
              SQL.Add('   AND AV.NR_ADICAO   = TR.NR_ADICAO');
              SQL.Add('   AND ( ( ( TR.CD_RECEITA_IMPOSTO = ''0002'' ) AND ( CD_ASSUNTO_VINCUL IN (''4'',''2'') ) ) OR');
              SQL.Add('       ( ( TR.CD_RECEITA_IMPOSTO = ''0001'' ) AND ( CD_ASSUNTO_VINCUL IN (''1'',''3'',''5'') ) ) )');
              SQL.Add('   AND AI.NR_PROCESSO = AV.NR_PROCESSO');
              SQL.Add('   AND AI.NR_ADICAO   = TR.NR_ADICAO');
              SQL.Add('   AND NCM.CODIGO     = AI.CD_NCM_SH');
              SQL.Add('GROUP BY TR.NR_ADICAO, TR.PC_ALIQ_NORM_ADVAL, AI.CD_NCM_SH, NCM.ALIQUOTA_IPI, NCM.ALIQUOTA_II, TR.CD_RECEITA_IMPOSTO');

              // RODA UMA A UMA VERIFICANDO SE A ALIQUOTA É A MESMA. CASO SEJA, INTERROMPE A TRANSMISSAO E APRESENTA O PROBLEMA.
              while not EOF do
              begin
                if FieldByName('CD_RECEITA_IMPOSTO').AsString = '0001' then // testa caso o ex seja de II
                begin
                  if FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat = FieldByName('ALIQUOTA_II').AsFloat then
                  begin
                    if not BoxMensagem( 'Adição ' + Trim( FieldByName('NR_ADICAO').AsString ) + ' - N.C.M. ' + Copy( FieldByName('CD_NCM_SH').AsString, 1, 4 ) + '.' + Copy( FieldByName('CD_NCM_SH').AsString, 5, 2 ) + '.' + Copy( FieldByName('CD_NCM_SH').AsString, 7, 2 ) + ':'
                                + #13#10 + 'A alíquota do I.I. ( ' + FormatFloat( '#0,.00', FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat ) + '% ) está igual a alíquota cadastrada para este NCM ('
                                + FormatFloat( '#0,.00', FieldByName('ALIQUOTA_II').AsFloat ) + '% ), sendo que a adição possui um EX informado.' + #13#10 + 'Deseja realmente continuar a transmissão ?', 1 ) then
                    begin
                      btn_trans_DI.Enabled  := True;
                      mi_transmitir.Enabled := True;
                      btn_sair.Enabled      := True;
                      mi_sair.Enabled       := True;
                      btn_cancelar.Enabled  := False;
                      mi_cancelar.Enabled   := False;
                      lbl_mensagem.Caption := 'Aguardando instrução... ';
                      lbl_mensagem.Refresh;
                      Exit;
                    end;
                  end;
                end
                else if FieldByName('CD_RECEITA_IMPOSTO').AsString = '0002' then // testa caso o ex seja de IPI
                begin
                  if FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat = FieldByName('ALIQUOTA_IPI').AsFloat then
                  begin
                    if not BoxMensagem( 'Adição ' + Trim( FieldByName('NR_ADICAO').AsString ) + ' - N.C.M. ' + Copy( FieldByName('CD_NCM_SH').AsString, 1, 4 ) + '.' + Copy( FieldByName('CD_NCM_SH').AsString, 5, 2 ) + '.' + Copy( FieldByName('CD_NCM_SH').AsString, 7, 2 ) + ':'
                                + #13#10 + 'A alíquota do I.P.I. ( ' + FormatFloat( '#0,.00', FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat ) + '% ) está igual a alíquota cadastrada para este NCM ('
                                + FormatFloat( '#0,.00', FieldByName('ALIQUOTA_IPI').AsFloat ) + '% ), sendo que a adição possui um EX informado.' + #13#10 + 'Deseja realmente continuar a transmissão ?', 1 ) then
                    begin
                      btn_trans_DI.Enabled  := True;
                      mi_transmitir.Enabled := True;
                      btn_sair.Enabled      := True;
                      mi_sair.Enabled       := True;
                      btn_cancelar.Enabled  := False;
                      mi_cancelar.Enabled   := False;
                      lbl_mensagem.Caption := 'Aguardando instrução... ';
                      lbl_mensagem.Refresh;
                      Exit;
                    end;
                  end;
                end;
                Next;
              end;
              Close;
              Free;
            end;

            { Tudo OK  - Iniciar Transmissão }
            Try
              With SqlAuxiliar, SqlAuxiliar.Sql Do
              Begin
                Close;
                Clear;
                Add('select NR_PROCESSO from TTEMP_DIAGN_DB_SUSP');
                Add('where nr_processo =:PROCESSO and LIBERADO = ''N''');
                ParamByName('PROCESSO').AsString := cProcBroker;
                Open;
              End;
              If SqlAuxiliar.IsEmpty Then
              Begin
                IntegraDI;
                ExecProcSaldoDrawBack;
              End;
            Except
              On E: Exception Do
              Begin
                btn_cancelarClick(Nil);
                close_tabelas_sisco;
                IMPORT.Connected := False;
                If datm_main.db_broker.InTransaction Then datm_main.db_broker.Rollback;
                Application.MessageBox(PChar('Ocorreu o seguinte erro no myIndaiá:' + #13#10 + E.Message + #13#10 +
                                       'Fvr informar imediatamente ao suporte.'),
                                       'Ocorreu um erro no myIndaiá !', MB_OK + MB_ICONSTOP);
                TrataErro(E);
              End;
            End;
          End;
          Application.ProcessMessages;
        end;
      End;
      FrmDiagnostico.Release;

      lbl_mensagem.caption := 'Fechando Tabelas Siscomex ... ';
      close_tabelas_sisco;
      datm_trans_DI.IMPORT.Connected := False;

      btn_trans_DI.Enabled  := True;
      mi_transmitir.Enabled := True;

      btn_sair.Enabled      := True;
      mi_sair.Enabled       := True;

      btn_cancelar.Enabled  := false;
      mi_cancelar.Enabled   := false;

      if lCancelar then
      begin
        lbl_mensagem.Caption := 'Transmissão abortada! Aguardando Instrução...';
      end
      else
      begin
        lbl_mensagem.Caption := 'Dados transmitidos com sucesso... ';
      end
    end;
  end
  else
  begin
    if (trim(Verifica656) = '--') then
      ShowMessage('O evento de autorização do registro do importador não foi realizado!');

    if (trim(Verifica468) = '--') then
      ShowMessage('O evento Realização do Cross Docking não foi realizado!');
  end;
end;

procedure Tfrm_trans_DI.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_trans_DI.qry_grd_di_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

{
function ConsisteProc( cTipo: Integer ): Boolean;
var
   i: Integer;
   cProc: String;

begin
  frmErrosDiag := TfrmErrosDiag.Create( Application );

  lNaoContinua := False;
  nQtd := 0;

  // Abre Arquivos para Consistencias
  DMGipLite.agi001.Open;
  DMGipLite.qry_adicao_.Open;
  DMGipLite.adi021.Open;
  DMGipLite.adi033.Open;

  if cTipo = 1  then
  begin // DI
    // Consiste Campos
    for i := 0 to frmSiscoDI.dbgrd_di.SelectedRows.Count - 1 do
    begin
      frmSiscoDI.dbgrd_di.DataSource.DataSet.GotoBookmark(TBookmark(frmSiscoDI.dbgrd_di.SelectedRows[i]));
      cProc := frmSiscoDI.dbgrd_di.DataSource.DataSet.Fields[0].AsString;
      Consiste( cProc, '1' );
      Application.ProcessMessages;
    end;
  end
  else
  begin
    for i := 0 to frmTransLI.DBGGipLiteLI.SelectedRows.Count - 1 do
    begin
      frmTransLI.DBGGipLiteLI.DataSource.DataSet.GotoBookmark(TBookmark(frmTransLI.DBGGipLiteLI.SelectedRows[i]));
      cProc := frmTransLI.DBGGipLiteLI.DataSource.DataSet.Fields[0].AsString;
      Consiste( cProc, '2' );
      Application.ProcessMessages;
    end;
  end;

  // Fecha Arquivos
  DMGipLite.agi001.Close;
  DMGipLite.qry_adicao_.Close;
  DMGipLite.adi021.Close;
  DMGipLite.adi033.Close;

  if ( frmErrosDiag.SGErros.RowCount > 2 ) then
  begin
    frmErrosDiag.SGErros.Cells[0,0] := 'Processo';
    frmErrosDiag.SGErros.Cells[1,0] := 'Adição';
    frmErrosDiag.SGErros.Cells[2,0] := 'Mensagem';

    if lErroFatal then
    begin
      frmErrosDiag.bbOk.Enabled := False;
    end;

    frmErrosDiag.SGErros.Refresh;
    frmErrosDiag.ShowModal;
  end;

  frmErrosDiag.SGErros.Free;

  ConsisteProc :=  lNaoContinua;
end;}

{
function Consiste( cProc, cTipo : String ) : Boolean;
var
   sGridErros : TStringList;
   nI, nV, nAd : Integer;
begin

  cProcesso := cProc;

  if cTipo = '1' then
  begin //Valida DI

    DMGipLite.qry_di_.FindKey([ cProc ]);

    cTipoDeclara := Trim(DMGiplite.qry_di_.Fields[96].AsString); // Tipo Declaracao
    cViaTrans := Trim(DMGiplite.qry_di_.Fields[11].AsString);    // Via Transporte

    for nV := 0 to DMGipLite.qry_di_.FieldCount -1 do
    begin
      VerificaCampos( nV, 'DI1' );
    end;
    DMGipLite.qry_adicao_.FindKey([ cProc, '001' ]);
    while ( DMGipLite.qry_adicao_.FieldByName('CA2001').AsString = cProc ) and
          ( not DMGipLite.qry_adicao_.Eof ) do
    begin
      for nAd := 0 to DMGipLite.qry_adicao_.FieldCount-1 do
      begin
        VerificaCampos( nAd, 'DI2' );
      end;
      cAdicao := DMGipLite.qry_adicao_.FieldByName('CA2002').AsString;

      DMGipLite.adi021.FindKey([ cProc, cAdicao, '001' ]);

      while ( DMGipLite.adi021.FieldByName('CA2101').AsString = cProc ) and
            ( DMGipLite.adi021.FieldByName('CA2109').AsString = cAdicao ) and
            ( not DMGipLite.adi021.Eof ) do
      begin
        for nI := 0 to DMGipLite.adi021.FieldCount-1 do
        begin
          VerificaCampos( nI, 'DI3' );
        end;

        DMGipLite.adi021.Next;

      end;

      DMGipLite.qry_adicao_.Next;

    end;

  end
  else
  if cTipo = '2' then
  begin // Valida LI
    DMGipLite.adi032.FindKey([ cProc ]);
    for nV := 0 to DMGipLite.adi032.FieldCount -1 do
    begin
      VerificaCampos( nV, 'LI1' );
    end;
    DMGipLite.adi033.FindKey([ cProc, '001' ]);
    while ( DMGipLite.adi033.FieldByName('CA3301').AsString = cProc ) and
          ( not DMGipLite.adi033.Eof ) do
    begin
      for nAd := 0 to DMGipLite.adi033.FieldCount-1 do
      begin
        VerificaCampos( nI, 'LI2' );
      end;
      DMGipLite.adi033.Next;
    end;
  end;
end;
}

{
procedure VerificaCampos( nCampo: Integer; cTipo: String );
var
   lNada:  Boolean;
   cLi, cItem, cCampo: String;
   iCampo: Integer;
   fCampo: Double;
begin
  if cTipo = 'DI1' then // Capa DI
  begin
    if ( DMGipLite.qry_di_.Fields[nCampo].DataType = ftString ) or
       ( DMGipLite.qry_di_.Fields[nCampo].DataType = ftMemo   ) then
       cCampo := DMGipLite.qry_di_.Fields[nCampo].AsString
    else if ( DMGipLite.qry_di_.Fields[nCampo].DataType = ftDate ) then
        cCampo := DMGipLite.qry_di_.Fields[nCampo].AsString
    else if ( DMGipLite.qry_di_.Fields[nCampo].DataType = ftInteger  ) or
            ( DMGipLite.qry_di_.Fields[nCampo].DataType = ftSmallInt ) then
       iCampo := DMGipLite.qry_di_.Fields[nCampo].AsInteger
    else if ( DMGipLite.qry_di_.Fields[nCampo].DataType = ftFloat ) then
       fCampo := DMGipLite.qry_di_.Fields[nCampo].AsFloat
    else
       cCampo := '';

    Inc( nCampo );

    case nCampo of
      1: if Trim( cCampo ) = '' then
         begin
           AdicionaString( cProcesso, 'Capa', '(*) Nome do processo não informado !!!' );
           lErroFatal := True;
         end;
      4: if Trim( cCampo ) = '' then
         begin
           AdicionaString( cProcesso, 'Capa', '(*) Importador do processo não informado !!!' );
           lErroFatal := True;
         end
         else if ( not DMGipLite.agi001.FindKey([ cCampo ]) ) then
         begin
           AdicionaString( cProcesso, 'Capa', '(*) Importador do processo não cadastrado !!!' );
           lErroFatal := True;
         end
         else if ( DMGipLite.agi001.FindKey([ cCampo ]) ) then
         begin
           if Trim(DMGipLite.agi001.FieldByName('CA0103').AsString) = '' then
           begin
             AdicionaString( cProcesso, 'Capa', '(*) Tipo de Importador não informado no cadastrado !!!' );
             lErroFatal := True;
           end;
         end;
      10: if ( Pos(cTipoDeclara, '16_17' ) <> 0 ) then
          begin
            if Trim( cCampo ) = '' then
            begin
              AdicionaString( cProcesso, 'Capa', 'Código do País de Procedência não informado !!!' );
            end;
          end;

      14:
             if ( Pos( Trim( DMGipLite.qry_di_.Fields[96].AsString ), '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 ) and
                ( Pos( Trim( DMGipLite.qry_di_.Fields[11].AsString ), '1_4' ) <> 0 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Código do Local de Embarque não informado !!!' );
                end;
             end;
      15:
             if ( Pos( cTipoDeclara, '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 ) and
                ( Pos( Trim( DMGipLite.qry_di_.Fields[11].AsString ), '1_2_3' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Nome do Veiculo Transportador não informado !!!' );
                end;
             end;

      16:
             if ( Pos( cTipoDeclara, '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Data de Chegada não informada !!!' );
                end;
             end;

      18:
             if ( Pos( cTipoDeclara, '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 ) then begin
                if ( iCampo = 0 ) then begin
                   AdicionaString( cProcesso, 'Capa', 'Código da Modalidade de Despacho não informada !!!' );
                end;
             end;

      26:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, 'Capa', 'Peso Líquido Total não informada !!!' );
             end;

      27:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, 'Capa', 'Peso Bruto Total não informada !!!' );
             end;

      49:
             if ( Pos( cTipoDeclara, '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 )and
                ( Pos( Trim( DMGipLite.qry_di_.Fields[11].AsString ), '1_2_3' ) = 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Numero do documento de carga não informado !!!' );
                end;
             end;

      50:
             if ( Pos( Trim(DMGipLite.qry_di_.Fields[59].AsString), '2_5_9' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Numero do Master não informado !!!' );
                end;
             end;

      51:
             if ( Pos( cTipoDeclara, '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 ) and
                ( Pos( Trim( DMGipLite.qry_di_.Fields[11].AsString ), '1_2_3_4_5_6_7_8_9' ) <> 0 )then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Data do documento de carga não informado !!!' );
                end;
             end;

      53:
             if ( Pos( cTipoDeclara, '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 ) and
                ( Pos( cViaTrans, '1_2_3_4_5_6_7' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Numero do Manifesto não informado !!!' );
                end;
             end;

      57:
             if Trim( cCampo )  = '' then begin
                AdicionaString( cProcesso, 'Capa', 'URF de Despacho não informado !!!' );
             end;

      58:
             if ( Pos( cTipoDeclara, '16_17' ) = 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'URF de Entrada não informado !!!' );
                end;
             end;

      59:
             if ( Pos( cTipoDeclara, '01_02_03_04_05_06_07_08_09_10_11' ) <> 0 ) and
                ( Pos( cViaTrans, '1_2_3_4_6_7' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Tipo de Manifesto não informado !!!' );
                end;
             end;

      60:
             if ( Pos( cTipoDeclara, '16_17' ) <> 0 ) and
                ( Pos( cViaTrans, '1_2_3_4_6_7' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Tipo do documento de carga não informado !!!' );
                end;
             end;

      96:
             if ( Pos( cTipoDeclara, '16_17' ) = 0 ) and
                ( Pos( cViaTrans, '1_4' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Código da Bandeira do Veiculo Transportador não informado !!!' );
                end;
             end;

      97:
             if Trim( cCampo )  = '' then begin
                AdicionaString( cProcesso, 'Capa', '(*) Tipo de declaração não informado !!!' );
                lErroFatal := True;
             end;

      99:
             if ( DMGipLite.qry_di_.Fields[97].AsBoolean = True ) and
                ( DMGipLite.qry_di_.Fields[234].AsBoolean = False ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Código do Consignatário não informado !!!' );
                end;
             end;

      100:
             if ( Pos( cTipoDeclara, '16_17' ) = 0 ) and
                ( Pos( cViaTrans, '1_2_3_4_6_7' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Código do Transportador não informado !!!' );
                end;
             end;

      102:
             if ( Pos( cTipoDeclara, '16_17' ) = 0 ) and
                ( Pos( cViaTrans, '7' ) <> 0 ) then begin
                if Trim( cCampo )  = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Placa do Veiculo Transportador não informado !!!' );
                end;
             end;

      150:
             if ( Pos( cTipoDeclara, '16_17' ) = 0 ) and
                ( Pos( cViaTrans, '1_2_3_4_6_7' ) <> 0 ) then begin
                if ( iCampo  = 0 ) then begin
                   AdicionaString( cProcesso, 'Capa', 'Utilização da Carga não informado !!!' );
                end;
             end;

      end;

      end
   else if ( cTipo = 'DI2' ) then begin

      if ( DMGipLite.qry_adicao_.Fields[nCampo].DataType = ftString ) or
         ( DMGipLite.qry_adicao_.Fields[nCampo].DataType = ftMemo   ) then
         cCampo := DMGipLite.qry_adicao_.Fields[nCampo].AsString
      else if ( DMGipLite.qry_adicao_.Fields[nCampo].DataType = ftDate ) then
         cCampo := DMGipLite.qry_adicao_.Fields[nCampo].AsString
      else if ( DMGipLite.qry_adicao_.Fields[nCampo].DataType = ftInteger  ) or
              ( DMGipLite.qry_adicao_.Fields[nCampo].DataType = ftSmallInt ) then
         iCampo := DMGipLite.qry_adicao_.Fields[nCampo].AsInteger
      else if ( DMGipLite.qry_adicao_.Fields[nCampo].DataType = ftFloat ) then
         fCampo := DMGipLite.qry_adicao_.Fields[nCampo].AsFloat
      else
         cCampo := '';

      Inc( nCampo );

      cAdicao := DMGipLite.qry_adicao_.Fields[1].AsString;

      case nCampo of

           1:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Nome do processo não informado !!!' );
                lErroFatal := True;
             end;
           2:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Numero da Adição não informado !!!' );
                lErroFatal := True;
             end;
           7:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Código do País de Aquisição não informado !!!' );
             end;
           8:
             if ( nCampo = 0 ) then begin
                AdicionaString( cProcesso, cAdicao, 'Valor da Mercadoria na condição de Venda não informado !!!' );
             end;
          21:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Código NBM/SH não informado !!!' );
             end;
          25:
             if ( nCampo = 0 ) then begin
                AdicionaString( cProcesso, cAdicao, 'Quantidade na Medida Estatistica não informado !!!' );
             end;
          26:
             if ( nCampo = 0 ) then begin
                AdicionaString( cProcesso, cAdicao, 'Peso Líquido não informado !!!' );
             end;
          27:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Tipo de Calculo do II não informado !!!' );
             end;
          30:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Tipo de Calculo do IPI não informado !!!' );
             end;
          45:
             if ( Trim( DMGipLite.qry_di_.Fields[8].AsString) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'País de Origem não informado !!!' );
                end;
             end;
          46:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Vinculação entre Import./Export. não informado !!!' );
             end;
          48:
             if ( Pos( cTipoDeclara, '02_03_04_05_06_07_08_09_10' ) <> 0 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código da Aplicação da Mercadoria não informado !!!' );
                end;
             end;
          64:
             if ( Trim( DMGipLite.qry_di_.Fields[20].AsString) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código da Moeda Negociada não informado !!!' );
                end;
             end;
          66:
             if ( Trim( DMGipLite.qry_di_.Fields[65].AsString) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código do Exportador não informado !!!' );
                end;
             end;
          67:
             if ( Trim( DMGipLite.qry_di_.Fields[133].AsString) = '' ) and
                ( DMGipLite.qry_adicao_.Fields[43].AsInteger = 2 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código do Fabricante não informado !!!' );
                end;
             end;
          75:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Código do Método de Valoração Aduaneira não informado !!!' );
             end;
          78:
             if ( Trim( DMGipLite.qry_di_.Fields[12].AsString) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código do Incoterm não informado !!!' );
                end;
             end;
          79:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao, 'Código do Exportador não informado !!!' );
             end;
          80:
             if ( Trim( DMGipLite.qry_di_.Fields[2].AsString) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código do Local de Validade do Incoterm não informado !!!' );
                end;
             end;
          148:
             if ( Trim( cViaTrans ) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Via de Transporte não informado !!!' );
                   lErroFatal := True;
                end;
             end;
          149:
             if ( Trim( DMGipLite.qry_di_.Fields[9].AsString) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código do País de Procedência não informado !!!' );
                end;
             end;
          150:
             if ( Trim( DMGipLite.qry_di_.Fields[57].AsString) = '' ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cAdicao, 'Código do País de Procedência não informado !!!' );
                end;
             end;
      end;
      end
   else if cTipo = 'DI3' then begin   // Itens da DI

      if ( DMGipLite.adi021.Fields[nCampo].DataType = ftString ) or
         ( DMGipLite.adi021.Fields[nCampo].DataType = ftMemo   ) then
         cCampo := DMGipLite.adi021.Fields[nCampo].AsString
      else if ( DMGipLite.adi021.Fields[nCampo].DataType = ftDate ) then
         cCampo := DMGipLite.adi021.Fields[nCampo].AsString
      else if ( DMGipLite.adi021.Fields[nCampo].DataType = ftSmallInt ) then
         iCampo := DMGipLite.adi021.Fields[nCampo].AsInteger
      else if ( DMGipLite.adi021.Fields[nCampo].DataType = ftFloat ) then
         fCampo := DMGipLite.adi021.Fields[nCampo].AsFloat
      else
         cCampo := '';

      Inc( nCampo );

      cItem := DMGipLite.adi021.Fields[1].AsString;

      case nCampo of

           1:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Nome do processo não informado !!!' );
             end;
           2:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Sequencia do Item não informado !!!' );
             end;
           3:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Quantidade do Item não informado !!!' );
             end;
           4:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Valor Unitário do Item não informado !!!' );
             end;
           7:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Valor Total do Item não informado !!!' );
             end;
           8:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Descricao do Produto não informado !!!' );
             end;
           9:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Numero da Adição não informado !!!' );
             end;
          16:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Peso Líquido Total do Item não informado !!!' );
             end;
          19:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'Código da Unidade de Medida do Item não informado !!!' );
             end;
          23:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'NBM/SH do Item não informado !!!' );
             end;
          24:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cAdicao+'/'+cItem, 'NCM do Item não informado !!!' );
             end;
      end;
      end

   else if ( cTipo = 'LI1' ) then begin  // Capa LI

      if ( DMGipLite.adi032.Fields[nCampo].DataType = ftString ) or
         ( DMGipLite.adi032.Fields[nCampo].DataType = ftMemo   ) then
         cCampo := DMGipLite.adi032.Fields[nCampo].AsString
      else if ( DMGipLite.adi032.Fields[nCampo].DataType = ftDate ) then
         cCampo := DMGipLite.adi032.Fields[nCampo].AsString
      else if ( DMGipLite.adi032.Fields[nCampo].DataType = ftSmallInt ) then
         iCampo := DMGipLite.adi032.Fields[nCampo].AsInteger
      else if ( DMGipLite.adi032.Fields[nCampo].DataType = ftFloat ) then
         fCampo := DMGipLite.adi032.Fields[nCampo].AsFloat
      else
         cCampo := '';

      Inc( nCampo );

      cLI := DMGipLite.adi032.Fields[0].AsString;

      case nCampo of

           1:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Nome do Processo não informado !!!' );
             end;
           3:
             if ( Pos( Trim( DMGipLite.adi032.Fields[26].AsString ), '1_2' ) <> 0 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cLI, 'Modalidade de Pagamento não informado !!!' );
                end;
             end;
           4:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, 'Capa', 'Importador do processo não informado !!!' );
                end
             else if ( not DMGipLite.agi001.FindKey([ cCampo ]) ) then begin
                AdicionaString( cProcesso, 'Capa', 'Importador do processo não cadastrado !!!' );
                end
             else if ( DMGipLite.agi001.FindKey([ cCampo ]) ) then begin
                if Trim(DMGipLite.agi001.FieldByName('CA0103').AsString) = '' then begin
                   AdicionaString( cProcesso, 'Capa', 'Tipo de Importador não informado no cadastrado !!!' );
                end;
             end;
           7:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Código do Regime de Tributação não informado !!!' );
             end;
          10:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Código do País de Procedência não informado !!!' );
             end;
          13:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Código do Incoterm não informado !!!' );
             end;
          14:
             if ( Pos( Trim( DMGipLite.adi032.Fields[26].AsString ), '3' ) <> 0 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cLI, 'Código da Instituição Financeira não informado !!!' );
                end;
             end;
          15:
             if ( Pos( Trim( DMGipLite.adi032.Fields[26].AsString ), '4' ) <> 0 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cLI, 'Código do Motivo sem cobertura não informado !!!' );
                end;
             end;
          17:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cLI, 'Quantidade na Medida Estatística não informado !!!' );
             end;
          21:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Código da Moeda FOB não informado !!!' );
             end;
          22:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'URF Despacho não informado !!!' );
             end;
          23:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'URF Entrada não informado !!!' );
             end;
          24:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cLI, 'Valor Total da Mercadoria Negociada não informado !!!' );
             end;
          26:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cLI, 'Peso Liquido Total não informado !!!' );
             end;
          27:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Tipo do Câmbio não informado !!!' );
             end;
          50:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Numero de Itens da LI não informado !!!' );
             end;
          51:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cLI, 'Esta LI não foi Montada !!!' );
             end;
      end;
      end

   else if ( cTipo = 'LI2' ) then begin  // Capa LI

      if ( DMGipLite.adi033.Fields[nCampo].DataType = ftString ) or
         ( DMGipLite.adi033.Fields[nCampo].DataType = ftMemo   ) then
         cCampo := DMGipLite.adi033.Fields[nCampo].AsString
      else if ( DMGipLite.adi033.Fields[nCampo].DataType = ftDate ) then
         cCampo := DMGipLite.adi033.Fields[nCampo].AsString
      else if ( DMGipLite.adi033.Fields[nCampo].DataType = ftSmallInt ) then
         iCampo := DMGipLite.adi033.Fields[nCampo].AsInteger
      else if ( DMGipLite.adi033.Fields[nCampo].DataType = ftFloat ) then
         fCampo := DMGipLite.adi033.Fields[nCampo].AsFloat
      else
         cCampo := '';

      Inc( nCampo );

      cItem := DMGipLite.adi033.Fields[1].AsString;

      case nCampo of

           1:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cItem, 'Nome do Processo não informado !!!' );
             end;
           2:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cItem, 'Numero de Sequencia do Item não informado !!!' );
             end;
           3:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cItem, 'Quantidade do Item da LI não informado !!!' );
             end;
           4:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cItem, 'Valor Unitário do Item da LI não informado !!!' );
             end;
           5:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cItem, 'Peso Unitário do Item da LI não informado !!!' );
             end;
           7:
             if ( fCampo = 0 ) then begin
                AdicionaString( cProcesso, cItem, 'Valor Total do Item da LI não informado !!!' );
             end;
           8:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cItem, 'Descrição do Produto do Item não informado !!!' );
             end;
          12:
             if ( DMGipLite.adi033.Fields[13].AsInteger = 2 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cItem, 'Código do Fabricante do Item não informado !!!' );
                end;
                end
             else if ( DMGipLite.adi033.Fields[13].AsInteger = 1 ) or
                     ( DMGipLite.adi033.Fields[13].AsInteger = 3 ) then begin
                if Trim( cCampo ) <> '' then begin
                   AdicionaString( cProcesso, cItem, 'Código do Fabricante NÃO deve ser informado !!!' );
                end;
             end;
          13:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cItem, 'Código do Exportador do Item não informado !!!' );
             end;
          14:
             if ( iCampo = 0 ) then begin
                AdicionaString( cProcesso, cItem, 'Indicador de Fabr. é o Export. não informado !!!' );
             end;
          19:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cItem, 'Código da Unidade de Medida do Item não informado !!!' );
             end;
          20:
             if ( DMGipLite.adi033.Fields[13].AsInteger = 2 ) then begin
                if Trim( cCampo ) = '' then begin
                   AdicionaString( cProcesso, cItem, 'Código do País de Origem não informado !!!' );
                end;
                end
             else if ( DMGipLite.adi033.Fields[13].AsInteger = 1 ) or
                     ( DMGipLite.adi033.Fields[13].AsInteger = 3 ) then begin
                if Trim( cCampo ) <> '' then begin
                   AdicionaString( cProcesso, cItem, 'Código do País de Origem NÃO deve ser informado !!!' );
                end;
             end;
          30:
             if Trim( cCampo ) = '' then begin
                AdicionaString( cProcesso, cItem, 'Código do País de Aquisição do Item não informado !!!' );
             end;
      end;

   end;
end;
}

procedure AdicionaString( cP, cAd, cMsg : String );
begin
{
   Inc( nQtd );

   if nQtd > 3 then
      frmErrosDiag.SGErros.RowCount := nQtd;

   // Primeira Coluna
   frmErrosDiag.SGErros.Cells[ 0, nQtd ] := cP ;

   // Segunda coluna
   frmErrosDiag.SGErros.Cells[ 1, nQtd ] := cAd ;

   // Terceira Coluna
   frmErrosDiag.SGErros.Cells[ 2, nQtd ] := cMsg ;
}
end;

procedure Tfrm_trans_DI.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_trans_DI.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = cd_unid_neg then Exit;
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_unid_neg);
  with datm_trans_DI.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else
    begin
      cd_unid_neg := msk_cd_unid_neg.Text;
      edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
      AbreDI;
    end;
    Close;
  end;
end;

procedure Tfrm_trans_DI.AbreDI;
begin
  with datm_trans_DI do
  begin
    qry_grd_di_.Close;
    qry_grd_di_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_grd_di_.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
    if Trim(qry_grd_di_.ParamByName('NR_PROCESSO').AsString) = '' then
      qry_grd_di_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text
    else
      qry_grd_di_.ParamByName('CD_CLIENTE').AsString := '';
    qry_grd_di_.Prepare;
    qry_grd_di_.Open;

    qry_di_.Close;
    qry_di_.Prepare;
    qry_di_.Open;
  end;
end;

procedure Tfrm_trans_DI.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
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

procedure Tfrm_trans_DI.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    edt_nm_grupo.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_trans_DI.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if EOF then
    begin
      BoxMensagem( 'Grupo de Clientes não encontrado!', 2 );
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else
    begin
      edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
      AbreDI;
    end;
    Close;
  end;
end;

procedure Tfrm_trans_DI.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
  end;
end;

procedure Tfrm_trans_DI.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
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

procedure Tfrm_trans_DI.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
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

procedure Tfrm_trans_DI.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text     := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_trans_DI do
  begin
    qry_cliente_.Close;
    qry_cliente_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    qry_cliente_.Prepare;
    qry_cliente_.Open;
    if qry_cliente_.EOF then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else
    begin
      edt_nm_cliente.Text := qry_cliente_.FieldByName('AP_EMPRESA').AsString;
      AbreDI;
    end;
    qry_cliente_.Close;
  end;
end;

procedure Tfrm_trans_DI.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
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

procedure Tfrm_trans_DI.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_unidade.Cons_OnLine_Texto <> '' then msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_trans_DI.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_trans_DI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_trans_DI.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_trans_DI.qry_grd_di_.Close;
  datm_trans_DI.qry_grd_di_.SQL[11] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
  datm_trans_DI.qry_grd_di_.Prepare;
  datm_trans_DI.qry_grd_di_.Open;
  Localiza(datm_trans_DI.qry_grd_di_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_trans_DI.VerificaMarinhaMercante : Boolean;
//Função que verifica se o grupo da empresa é obrigatório que possua o
//Item "Marinha Mercante" incluído na tabela TSOLIC_PAGTO
begin
  Result := True;
//Ocorrência : 04551-08
  if (Copy(cProcBroker,5,2) = 'IE') or (Copy(cProcBroker,5,2) = 'IN')then
    Exit;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    // Verifica se há alguma adição que não seja Drawback - Michel - 20/02/2013
    SQL.Clear;
    SQL.Add('SELECT COUNT(*)');
    SQL.Add('FROM TADICAO_DE_IMPORTACAO');
    SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
    SQL.Add('  AND ISNULL(CD_FUND_LEG_REGIME, "") <> "16"');
    ParamByName('NR_PROCESSO').AsString := cProcBroker;
    Open;
    if Fields[0].AsInteger > 0 then
    begin
      Close;
      // Condição abaixo para não verificar a marinha se for Admissão Temporária - Michel - 25/10/2011
      SQL.Clear;
      SQL.Add('SELECT CD_TIPO_DECLARACAO');
      SQL.Add('FROM TDECLARACAO_IMPORTACAO');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
      ParamByName('NR_PROCESSO').AsString := cProcBroker;
      Open;

      if (FieldByName('CD_TIPO_DECLARACAO').AsString <> '05') then
      begin
        Close;
        Sql.Clear;
        // Query alterada para verificar a flag da empresa - Michel - 08/11/2011
        Sql.Add('SELECT S.CD_VIA_TRANSPORTE, ISNULL(E.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_MARINHA_MERCANTE_ICMS');
        Sql.Add('FROM TGRUPO G, TPROCESSO P, TSERVICO S, TEMPRESA_NAC E');
        Sql.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
        Sql.Add('  AND G.CD_GRUPO    = P.CD_GRUPO');
        Sql.Add('  AND P.CD_SERVICO  = S.CD_SERVICO');
        Sql.Add('  AND E.CD_EMPRESA  = P.CD_CLIENTE');
        ParamByName('NR_PROCESSO').AsString := cProcBroker;
        Open;
  //      if datm_trans_DI.qry_grd_diIN_CALCULOU_COM_AFRMM.AsString = ''
        if (FieldByName('IN_MARINHA_MERCANTE_ICMS').AsString = '1') and (FieldByName('CD_VIA_TRANSPORTE').AsString = '01')then
        begin
          if datm_trans_DI.qry_grd_di_IN_CALCULOU_COM_AFRMM.AsString = '1' then
            Result := True
          else
          begin
            //{
            Close;
            SQL.Clear;
            SQL.Add('SELECT CD_TIPO_ACORDO_TAR, CD_ACORDO_ALADI');
            SQL.Add('FROM TADICAO_DE_IMPORTACAO');
            SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
            ParamByName('NR_PROCESSO').AsString := cProcBroker;
            Open;
            First;
            while Result and not Eof do
            begin
              if (FieldByName('CD_TIPO_ACORDO_TAR').AsString <> '2') or
                 ((FieldByName('CD_TIPO_ACORDO_TAR').AsString = '2') and (AnsiIndexText(Trim(FieldByName('CD_ACORDO_ALADI').AsString), ['504', '']) >= 0)) then
                Result := False;
              Next;
            end; //}Result := False;
          end;
        end;
      end;
    end;
    Close;
    Free;
  end;
end;


function Tfrm_trans_DI.InAdmissaoTemporaria: Boolean;
begin
  Result := (datm_trans_DI.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '5') and (datm_trans_DI.qry_adicao_CD_FUND_LEG_REGIME.AsString = '37');
end;

procedure Tfrm_trans_DI.DoLinkClick(Sender: TObject; ALinkText: String);
var
  strModulo, strRotina: String;
begin
  strModulo := vStr_cd_modulo;
  strRotina := str_cd_rotina;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';
  frm_manut_proc.pesq_cd_unid_neg := Copy(ALinkText, 1, 2);
  frm_manut_proc.pesq_cd_prod     := Copy(ALinkText, 3, 2);
  frm_manut_proc.pesq_nr_proc     := ALinkText;
  frm_manut_proc.ShowModal;
  vStr_cd_modulo := strModulo;
  str_cd_rotina  := strRotina;
end;

procedure Tfrm_trans_DI.IntegraDE;
var
  NrSeq: Integer;
begin
  with datm_trans_DI do
  begin
    qry_DE_DI_Scx.Close;
    qry_DE_DI_Scx.ParamByName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
    qry_DE_DI_Scx.Prepare;
    qry_DE_DI_Scx.Open;
    while not qry_DE_DI_Scx.Eof do
      qry_DE_DI_Scx.Delete;

    qry_DE_DI.Close;
    qry_DE_DI.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_DE_DI.Prepare;
    qry_DE_DI.Open;

    NrSeq := 0;
    while not qry_DE_DI.Eof do
    begin
      qry_DE_DI_Scx.Append;
      qry_DE_DI_Scx.FieldbyName('NR_DECL_IMP_MICRO').AsString := cProcSCX;
      qry_DE_DI_Scx.FieldbyName('NR_SEQ_DE').AsInteger        := NrSeq;
      qry_DE_DI_Scx.FieldbyName('NR_DE_MERCOSUL').AsString    := qry_DE_DINR_DE_MERCOSUL.AsString;
      qry_DE_DI_Scx.FieldbyName('NR_RE_INICIAL').AsString     := qry_DE_DINR_RE_INICIAL.AsString;
      qry_DE_DI_Scx.FieldbyName('NR_RE_FINAL').AsString       := qry_DE_DINR_RE_FINAL.AsString;
      qry_DE_DI_Scx.Post;
      qry_DE_DI.Next;
      Inc(NrSeq);
    end;
  end;
end;

procedure Tfrm_trans_DI.DoDocumentCompleteDI(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  Pagina: String;
  I: Integer;
  Inputs, TDs: OleVariant;
begin
  try
    Pagina := Tfrm_Web(Sender).GetPageName;
    if SameText(Pagina, 'private_siscomeximpweb_inicio.do') then
    begin
      Tfrm_Web(Sender).WebBrowser1.Silent := True;
      CPF := Tfrm_Web(Sender).OleDocument.getElementById('cpfUsuarioCorrente').innerHTML;
      Tfrm_Web(Sender).Navegar(URL_Imp + 'importacaoweb-7/EstruturaPropriaMenu.do');
    end
    else
    if SameText(Pagina, 'EstruturaPropriaMenu.do') then
    begin
      tmrSelecionaArquivo.Enabled := True;
      Tfrm_Web(Sender).ExecutaScript('document.getElementsByName(''arquivoEstruturaPropria'')[0].click();');
      Tfrm_Web(Sender).ExecutaScript('document.getElementsByName(''arquivoEstruturaPropria'')[0].form.submit();');
    end
    else
      if SameText(Pagina, 'EnviaArquivoEstruturaPropria.do') then
      begin
        NrTransmissao := Trim(Tfrm_Web(Sender).OleDocument.getElementById('nrTransmissao').value);
        if NrTransmissao = '' then
        begin
    //      if Tfrm_Web(Sender).OleDocument.getElementById('corpo').getElementsByTagName('td').item(1).childNodes.length > 0 then
    //        NrTransmissao := Trim(Tfrm_Web(Sender).OleDocument.getElementById('corpo').getElementsByTagName('td').item(1).childNodes.item(0).toString())
    //      else
            NrTransmissao := Trim(Tfrm_Web(Sender).OleDocument.getElementById('corpo').getElementsByTagName('td').item(1).innerHTML);
        end;
        Inputs := Tfrm_Web(Sender).OleDocument.getElementById('corpo').getElementsByTagName('input');
        I := 0;
        while (I < Inputs.length) and not SameText(Trim(Inputs.item(I).value), 'Consultar') do
          Inc(I);
        if (I < Inputs.length) then
          Inputs.item(I).click();
      end
      else
      if SameText(Pagina, 'ConsultarDiagnostico.do') or SameText(Pagina, 'RegistrarDiagnostico.do') then
      begin
        if rgrp_transmissao_para.ItemIndex <> 0 then // Se não for Diagnóstico, porque no Diagnóstico não tem número de DI e dá erro abaixo
        begin
          Application.ProcessMessages;

          sleep(500);
          try
            //Tfrm_Web(Sender).GravarPaginaHTML;

            NrDeclaracao := Trim(Tfrm_Web(Sender).OleDocument.getElementById('nrDeclaracao').value);
            NrDeclaracao := StringReplace(StringReplace(NrDeclaracao, '/', '', []), '-', '', []);

            if not IsNumeric(NrDeclaracao) then
              NrDeclaracao := '';

          //  Tfrm_Web(Sender).GravarPaginaHTML;
          except on e:exception do
          end;

          Application.ProcessMessages;
          sleep(500);
          
          if NrDeclaracao = '' then
          begin
            try
              TDs := Tfrm_Web(Sender).OleDocument.getElementById('registrarDiagnostico').getElementsByTagName('table').item(1).getElementsByTagName('td');
            except
              try
                TDs := Tfrm_Web(Sender).OleDocument.getElementById('TABLE_2').getElementsByTagName('td');//.item(0).childNodes.item(0).childNodes.item(0).innerHTML
              except
              end;
            end;

            TDs := TDs.item(0);
            while TDs.childNodes.length > 0 do
              TDs := TDs.childNodes.item(0);

            NrDeclaracao := Trim(TDs.toString());
            NrDeclaracao := StringReplace(StringReplace(NrDeclaracao, '/', '', []), '-', '', []);

            if not IsNumeric(NrDeclaracao) then
              NrDeclaracao := '';
          end;

          Application.ProcessMessages;
          sleep(500);  
          if NrDeclaracao = '' then
          begin
            try
              TDs := Tfrm_Web(Sender).OleDocument.getElementsByClassName('consulta2').item(0).getElementsByTagName('td');
              TDs := TDs.item(0);
              NrDeclaracao := Trim(TDs.textContent);
              NrDeclaracao := StringReplace(StringReplace(NrDeclaracao, '/', '', []), '-', '', []);

              if not IsNumeric(NrDeclaracao) then
                NrDeclaracao := '';
            except
            end;
          end;

          if NrDeclaracao <> '' then
          begin
            ShowMessage('Anote o número do Registro ' + NrDeclaracao + '.'#13 +
                        'Caso o número informado aqui não seja o mesmo do site, por favor anote **ANTES DE FECHAR ESTA MENSAGEM** ' +
                        'o número informado no site para atualização no sistema.');
            DataRegistro := FormatDateTime('dd/mm/yyyy', Date);
            Tfrm_web(Sender).Close;
          end;
        end;
      end;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOk], 0);
  end;
end;

function IsNumeric(S : String) : Boolean;
begin
Result := True;
Try
   StrToInt(S);
Except
Result := False;
end;
end;

procedure Tfrm_trans_DI.tmrSelecionaArquivoTimer(Sender: TObject);
var
  H: HWND;
  I: Integer;
begin
  H := FindWindow(nil, 'Escolher arquivo a carregar');
  if H = 0 then
    H := FindWindow(nil, 'Escolher arquivo');
  if H = 0 then
    H := FindWindow(nil, 'Choose File to Upload');
  if H <> 0 then
  begin
    ListarComponentes(H);
    I := 0;
    while (I <= High(Comps)) and not SameText(Copy(Comps[I].ClassName, 1, 10), 'ComboBoxEx') do
      Inc(I);

    if I <= High(Comps) then
    begin
      SendText(Comps[I].Hnd, FArquivoWeb);

      I := 0;
      while (I <= High(Comps)) and not (AnsiIndexText(StringReplace(Comps[I].Text, '&', '', []), ['Abrir', 'Open']) >= 0) do
        Inc(I);

      SendClick(Comps[I].Hnd);

      Sleep(1000);

      //Tfrm_Web(Sender).OleDocument.getElementById('arquivoEstruturaPropria').form.submit();
    end;
  end;
end;

procedure Tfrm_trans_DI.tmrMensagemWebTimer(Sender: TObject);
var
  H: HWND;
begin
  tmrMensagemWeb.Enabled := False;
  try
    H := FindWindow(nil, 'Erro de Script');
    if H = 0 then
      H := FindWindow(nil, 'Alerta de segurança');
    if H <> 0 then
    begin
      SetForegroundWindow(H);
      keybd_event(VK_RETURN, 0, 0, 0);
    end;
  finally
    tmrMensagemWeb.Enabled := True;
  end;
end;

function Tfrm_trans_DI.ValidarVolumes : String;
Var Mensagem, vQtdVolPrevisao, vQtdVolPrevisao_2 , Mensagem_DI, Mensagem_Conf, Mensagem_Manut: String;
begin
  Mensagem := '';
  Mensagem_DI := '';
  Mensagem_Conf := '';
  Mensagem_Manut := '';
  {-------------------------------------------------------------------------------------}
  with datm_trans_DI.qry_DI_Volumes do
  begin
    Close;
    Sql.Clear;
    Sql.Text :=' select A.*, B.DESCRICAO                                               '+
               '   from TEMBALAGEM_CARGA A (nolock)                                    '+
               '   join TTP_EMBALAGEM    B (nolock) on B.CODIGO = A.CD_TIPO_EMBALAGEM  '+
               '  where A.NR_PROCESSO = :NR_PROCESSO                                   ';
    ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '01' + datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;
    Prepare;
    Open;
  end;

  with datm_trans_DI.qry_Previsao_Volumes do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ' select A.*, B.DESCRICAO                                                       '+
                '   from TPREVISAO_EMBALAGEM_CARGA A (nolock)                                   '+
                '   join TTP_EMBALAGEM             B (nolock) on B.CODIGO = A.CD_TIPO_EMBALAGEM '+
                ' where A.NR_PROCESSO       =:NR_PROCESSO                                       '+
                '   and A.CD_TIPO_EMBALAGEM =:CD_TIPO_EMBALAGEM                                 ';
  end;

  with datm_trans_DI.qryVolumeProcesso do
  begin
    Close;
    Sql.Clear;
    Sql.Text :=
                ' SELECT A.NR_PROCESSO   AS NR_PROCESSO,                                        ' + sLineBreak +
                '        C.DESCRICAO     AS DESCRICAO,                                          ' + sLineBreak +
                '        C.CODIGO        AS CD_TIPO_EMBALAGEM,                                  ' + sLineBreak +
                '        COUNT(*)        AS QT_VOLUME_CARGA                                     ' + sLineBreak +
                ' FROM TPROCESSO       A  (NOLOCK)                                              ' + sLineBreak +
                ' JOIN TPROCESSO_CNTR  B  (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO             ' + sLineBreak +
                ' JOIN TTP_EMBALAGEM   C  (NOLOCK) ON C.CODIGO      = ''08''                    ' + sLineBreak +
                ' LEFT JOIN TPROCESSO_CARGA_SOLTA D (NOLOCK) ON D.NR_PROCESSO = A.NR_PROCESSO   ' + sLineBreak +
                '  WHERE A.NR_PROCESSO = :NR_PROCESSO                                           ' + sLineBreak +
                '    AND C.CODIGO      = :CD_TIPO_EMBALAGEM                                     ' + sLineBreak +
                '    AND D.NR_PROCESSO IS NULL                                                  ' + sLineBreak +
                '  GROUP BY A.NR_PROCESSO, C.CODIGO, C.DESCRICAO                                ' + sLineBreak +
                '                                                                               ' + sLineBreak +
                ' UNION ALL                                                                     ' + sLineBreak +
                '                                                                               ' + sLineBreak +
                ' SELECT A.NR_PROCESSO,                                                         ' + sLineBreak +
                '        B.NM_ESPECIE   AS DESCRICAO,                                           ' + sLineBreak +
                '        B.TP_ESTUFAGEM AS CD_TIPO_EMBALAGEM,                                   ' + sLineBreak +
                '        SUM(B.VL_QTDE) AS QT_VOLUME_CARGA                                      ' + sLineBreak +
                ' FROM TPROCESSO             A(NOLOCK)                                          ' + sLineBreak +
                ' JOIN TPROCESSO_CARGA_SOLTA B (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO        ' + sLineBreak +
                '  WHERE A.NR_PROCESSO  = :NR_PROCESSO_1                                        ' + sLineBreak +
                '    AND B.TP_ESTUFAGEM = :CD_TIPO_EMBALAGEM_1                                  ' + sLineBreak +
                '  GROUP BY A.NR_PROCESSO, B.NM_ESPECIE, B.TP_ESTUFAGEM                         ' + sLineBreak ;
  end;

  while not datm_trans_DI.qry_DI_Volumes.Eof do
  begin
    datm_trans_DI.qryVolumeProcesso.Close;
    datm_trans_DI.qryVolumeProcesso.ParamByName('NR_PROCESSO').AsString         := datm_trans_DI.qry_DI_Volumes.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qryVolumeProcesso.ParamByName('CD_TIPO_EMBALAGEM').AsString   := datm_trans_DI.qry_DI_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qryVolumeProcesso.ParamByName('NR_PROCESSO_1').AsString       := datm_trans_DI.qry_DI_Volumes.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qryVolumeProcesso.ParamByName('CD_TIPO_EMBALAGEM_1').AsString := datm_trans_DI.qry_DI_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qryVolumeProcesso.Open;

    datm_trans_DI.qry_Previsao_Volumes.Close;
    datm_trans_DI.qry_Previsao_Volumes.ParamByName('NR_PROCESSO').AsString       := datm_trans_DI.qry_DI_Volumes.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qry_Previsao_Volumes.ParamByName('CD_TIPO_EMBALAGEM').AsString := datm_trans_DI.qry_DI_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qry_Previsao_Volumes.Open;

   // vQtdVolPrevisao   := IIF(datm_trans_DI.qry_Previsao_Volumes.IsEmpty,'0',datm_trans_DI.qry_Previsao_Volumes.FieldByName('QT_VOLUME_CARGA').AsString);
    vQtdVolPrevisao   := IIF(datm_trans_DI.qryVolumeProcesso.IsEmpty,'0',datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString);
    vQtdVolPrevisao_2 := IIF(datm_trans_DI.qryVolumeProcesso.IsEmpty,'0',datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString);

    if (vQtdVolPrevisao     <> datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString)
    or (vQtdVolPrevisao_2   <> datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString)
    or (vQtdVolPrevisao_2   <> vQtdVolPrevisao) then
    begin
      Mensagem_DI :=    datm_trans_DI.qry_DI_Volumes.FieldByName('DESCRICAO').AsString + ' :  ' + Space( 23 - Length(datm_trans_DI.qry_DI_Volumes.FieldByName('DESCRICAO').AsString) ) +
                        datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString    + Space( 24 - Length(datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString)) +
                        vQtdVolPrevisao   + Space( 15 ) +
                        vQtdVolPrevisao_2 +  #13#10;

     Mensagem := Mensagem + Mensagem_DI;
    end;

    datm_trans_DI.qry_DI_Volumes.Next;
  end;
  {-------------------------------------------------------------------------------------}

  with datm_trans_DI.qry_Previsao_Volumes do
  begin
    Close;
    SQL.Clear;
    SQL.text := ' select A.*, B.DESCRICAO                                                       '+
                '   from TPREVISAO_EMBALAGEM_CARGA A (NOLOCK)                                   '+
                '   join TTP_EMBALAGEM             B (NOLOCK) on B.CODIGO = A.CD_TIPO_EMBALAGEM '+
                '  where A.NR_PROCESSO =:NR_PROCESSO                                            ';
    ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '01' + datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;
    Open;
  end;

  with datm_trans_DI.qry_DI_Volumes do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ' select A.*, B.DESCRICAO                                              '+
                '   from TEMBALAGEM_CARGA A (NOLOCK)                                   '+
                '   join TTP_EMBALAGEM    B (NOLOCK) on B.CODIGO = A.CD_TIPO_EMBALAGEM '+
                '  where A.NR_PROCESSO       = :NR_PROCESSO                            '+
                '    and A.CD_TIPO_EMBALAGEM = :CD_TIPO_EMBALAGEM                      ';
  end;

  with datm_trans_DI.qryVolumeProcesso do
  begin
    Close;
    Sql.Clear;
    Sql.Text :=
                ' SELECT A.NR_PROCESSO   AS NR_PROCESSO,                                        ' + sLineBreak +
                '        C.DESCRICAO     AS DESCRICAO,                                          ' + sLineBreak +
                '        C.CODIGO        AS CD_TIPO_EMBALAGEM,                                  ' + sLineBreak +
                '        COUNT(*)        AS QT_VOLUME_CARGA                                     ' + sLineBreak +
                ' FROM TPROCESSO       A  (NOLOCK)                                              ' + sLineBreak +
                ' JOIN TPROCESSO_CNTR  B  (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO             ' + sLineBreak +
                ' JOIN TTP_EMBALAGEM   C  (NOLOCK) ON C.CODIGO      = ''08''                    ' + sLineBreak +
                ' LEFT JOIN TPROCESSO_CARGA_SOLTA D (NOLOCK) ON D.NR_PROCESSO = A.NR_PROCESSO   ' + sLineBreak +
                '  WHERE A.NR_PROCESSO = :NR_PROCESSO                                           ' + sLineBreak +
                '    AND C.CODIGO      = :CD_TIPO_EMBALAGEM                                     ' + sLineBreak +
                '    AND D.NR_PROCESSO IS NULL                                                  ' + sLineBreak +
                '  GROUP BY A.NR_PROCESSO, C.CODIGO, C.DESCRICAO                                ' + sLineBreak +
                '                                                                               ' + sLineBreak +
                ' UNION ALL                                                                     ' + sLineBreak +
                '                                                                               ' + sLineBreak +
                ' SELECT A.NR_PROCESSO,                                                         ' + sLineBreak +
                '        B.NM_ESPECIE   AS DESCRICAO,                                           ' + sLineBreak +
                '        B.TP_ESTUFAGEM AS CD_TIPO_EMBALAGEM,                                   ' + sLineBreak +
                '        SUM(B.VL_QTDE) AS QT_VOLUME_CARGA                                      ' + sLineBreak +
                ' FROM TPROCESSO             A(NOLOCK)                                          ' + sLineBreak +
                ' JOIN TPROCESSO_CARGA_SOLTA B (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO        ' + sLineBreak +
                '  WHERE A.NR_PROCESSO  = :NR_PROCESSO_1                                        ' + sLineBreak +
                '    AND B.TP_ESTUFAGEM = :CD_TIPO_EMBALAGEM_1                                  ' + sLineBreak +
                '  GROUP BY A.NR_PROCESSO, B.NM_ESPECIE, B.TP_ESTUFAGEM                         ' + sLineBreak ;
  end;

  while not datm_trans_DI.qry_Previsao_Volumes.Eof do
  begin
    datm_trans_DI.qryVolumeProcesso.Close;
    datm_trans_DI.qryVolumeProcesso.ParamByName('NR_PROCESSO').AsString         := datm_trans_DI.qry_Previsao_Volumes.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qryVolumeProcesso.ParamByName('CD_TIPO_EMBALAGEM').AsString   := datm_trans_DI.qry_Previsao_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qryVolumeProcesso.ParamByName('NR_PROCESSO_1').AsString       := datm_trans_DI.qry_Previsao_Volumes.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qryVolumeProcesso.ParamByName('CD_TIPO_EMBALAGEM_1').AsString := datm_trans_DI.qry_Previsao_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qryVolumeProcesso.Open;

    datm_trans_DI.qry_DI_Volumes.Close;
    datm_trans_DI.qry_DI_Volumes.ParamByName('NR_PROCESSO').AsString       := datm_trans_DI.qry_Previsao_Volumes.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qry_DI_Volumes.ParamByName('CD_TIPO_EMBALAGEM').AsString := datm_trans_DI.qry_Previsao_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qry_DI_Volumes.Open;

   // vQtdVolPrevisao := IIF(datm_trans_DI.qry_DI_Volumes.IsEmpty,'0',datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString);
   //if(vQtdVolPrevisao <> datm_trans_DI.qry_Previsao_Volumes.FieldByName('QT_VOLUME_CARGA').AsString)and
   //  (datm_trans_DI.qry_Previsao_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString <> datm_trans_DI.qry_DI_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString)then

    vQtdVolPrevisao    := IIF(datm_trans_DI.qry_DI_Volumes.IsEmpty,'0',datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString);
    vQtdVolPrevisao_2  := IIF(datm_trans_DI.qryVolumeProcesso.IsEmpty,'0',datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString);

    //if (vQtdVolPrevisao      <> datm_trans_DI.qry_Previsao_Volumes.FieldByName('QT_VOLUME_CARGA').AsString)
    // or (vQtdVolPrevisao_2    <> datm_trans_DI.qry_Previsao_Volumes.FieldByName('QT_VOLUME_CARGA').AsString)
    if (vQtdVolPrevisao      <> datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString)
    or (vQtdVolPrevisao_2    <> datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString)
    or (vQtdVolPrevisao_2    <> vQtdVolPrevisao) then
    begin
      Mensagem_Conf :=  datm_trans_DI.qry_Previsao_Volumes.FieldByName('DESCRICAO').AsString + ' :  ' + Space( 23 - Length(datm_trans_DI.qry_Previsao_Volumes.FieldByName('DESCRICAO').AsString) ) +
                        vQtdVolPrevisao +  Space( 24 - Length(vQtdVolPrevisao)) +
                        datm_trans_DI.qry_Previsao_Volumes.FieldByName('QT_VOLUME_CARGA').AsString  +  Space( 15 ) +
                        vQtdVolPrevisao_2 +  #13#10;

      if not AnsiContainsText(Mensagem , Mensagem_Conf) then
        Mensagem := Mensagem + Mensagem_Conf;
    end;
    datm_trans_DI.qry_Previsao_Volumes.Next;
  end;

  {-------------------------------------------------------------------------------------}

  with datm_trans_DI.qryVolumeProcesso do
  begin
    Close;
    Sql.Clear;
    Sql.Text :=
                ' SELECT A.NR_PROCESSO   AS NR_PROCESSO,                                        ' + sLineBreak +
                '        C.DESCRICAO     AS DESCRICAO,                                          ' + sLineBreak +
                '        C.CODIGO        AS CD_TIPO_EMBALAGEM,                                  ' + sLineBreak +
                '        COUNT(*)        AS QT_VOLUME_CARGA                                     ' + sLineBreak +
                ' FROM TPROCESSO       A  (NOLOCK)                                              ' + sLineBreak +
                ' JOIN TPROCESSO_CNTR  B  (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO             ' + sLineBreak +
                ' JOIN TTP_EMBALAGEM   C  (NOLOCK) ON C.CODIGO      = ''08''                    ' + sLineBreak +
                ' LEFT JOIN TPROCESSO_CARGA_SOLTA D (NOLOCK) ON D.NR_PROCESSO = A.NR_PROCESSO   ' + sLineBreak +
                '  WHERE A.NR_PROCESSO = :NR_PROCESSO                                           ' + sLineBreak +
                '    AND D.NR_PROCESSO IS NULL                                                  ' + sLineBreak +
                '  GROUP BY A.NR_PROCESSO, C.CODIGO, C.DESCRICAO                                ' + sLineBreak +
                '                                                                               ' + sLineBreak +
                ' UNION ALL                                                                     ' + sLineBreak +
                '                                                                               ' + sLineBreak +
                ' SELECT A.NR_PROCESSO,                                                         ' + sLineBreak +
                '        B.NM_ESPECIE   AS DESCRICAO,                                           ' + sLineBreak +
                '        B.TP_ESTUFAGEM AS CD_TIPO_EMBALAGEM,                                   ' + sLineBreak +
                '        SUM(B.VL_QTDE) AS QT_VOLUME_CARGA                                      ' + sLineBreak +
                ' FROM TPROCESSO             A(NOLOCK)                                          ' + sLineBreak +
                ' JOIN TPROCESSO_CARGA_SOLTA B (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO        ' + sLineBreak +
                '  WHERE A.NR_PROCESSO  = :NR_PROCESSO_1                                        ' + sLineBreak +
                '  GROUP BY A.NR_PROCESSO, B.NM_ESPECIE, B.TP_ESTUFAGEM                         ' + sLineBreak ;
    ParamByName('NR_PROCESSO').AsString   := Trim( msk_cd_unid_neg.Text ) + '01' + datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;
    ParamByName('NR_PROCESSO_1').AsString := Trim( msk_cd_unid_neg.Text ) + '01' + datm_trans_DI.qry_grd_di_NR_PROCESSO.AsString;
    Open;
  end;

  with datm_trans_DI.qry_Previsao_Volumes do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ' select A.*, B.DESCRICAO                                                       '+
                '   from TPREVISAO_EMBALAGEM_CARGA A (nolock)                                   '+
                '   join TTP_EMBALAGEM             B (nolock) on B.CODIGO = A.CD_TIPO_EMBALAGEM '+
                ' where A.NR_PROCESSO       =:NR_PROCESSO                                       '+
                '   and A.CD_TIPO_EMBALAGEM =:CD_TIPO_EMBALAGEM                                 ';
  end;

  with datm_trans_DI.qry_DI_Volumes do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ' select A.*, B.DESCRICAO                                              '+
                '   from TEMBALAGEM_CARGA A (NOLOCK)                                   '+
                '   join TTP_EMBALAGEM    B (NOLOCK) on B.CODIGO = A.CD_TIPO_EMBALAGEM '+
                '  where A.NR_PROCESSO       = :NR_PROCESSO                            '+
                '    and A.CD_TIPO_EMBALAGEM = :CD_TIPO_EMBALAGEM                      ';
  end;

  while not datm_trans_DI.qryVolumeProcesso.Eof do
  begin

    datm_trans_DI.qry_Previsao_Volumes.Close;
    datm_trans_DI.qry_Previsao_Volumes.ParamByName('NR_PROCESSO').AsString       := datm_trans_DI.qryVolumeProcesso.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qry_Previsao_Volumes.ParamByName('CD_TIPO_EMBALAGEM').AsString := datm_trans_DI.qryVolumeProcesso.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qry_Previsao_Volumes.Open;

    datm_trans_DI.qry_DI_Volumes.Close;
    datm_trans_DI.qry_DI_Volumes.ParamByName('NR_PROCESSO').AsString       := datm_trans_DI.qryVolumeProcesso.ParamByName('NR_PROCESSO').AsString;
    datm_trans_DI.qry_DI_Volumes.ParamByName('CD_TIPO_EMBALAGEM').AsString := datm_trans_DI.qryVolumeProcesso.FieldByName('CD_TIPO_EMBALAGEM').AsString;
    datm_trans_DI.qry_DI_Volumes.Open;

   // vQtdVolPrevisao := IIF(datm_trans_DI.qry_DI_Volumes.IsEmpty,'0',datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString);
   // if(vQtdVolPrevisao <> datm_trans_DI.qry_Previsao_Volumes.FieldByName('QT_VOLUME_CARGA').AsString)and
   //   (datm_trans_DI.qry_Previsao_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString <> datm_trans_DI.qry_DI_Volumes.FieldByName('CD_TIPO_EMBALAGEM').AsString)then

    vQtdVolPrevisao    := IIF(datm_trans_DI.qry_DI_Volumes.IsEmpty,'0',datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString);
    //vQtdVolPrevisao_2  := IIF(datm_trans_DI.qry_Previsao_Volumes.IsEmpty,'0',datm_trans_DI.qry_Previsao_Volumes.FieldByName('QT_VOLUME_CARGA').AsString);
    vQtdVolPrevisao_2  := IIF(datm_trans_DI.qry_DI_Volumes.IsEmpty,'0',datm_trans_DI.qry_DI_Volumes.FieldByName('QT_VOLUME_CARGA').AsString);

    if (vQtdVolPrevisao   <> datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString)
    or (vQtdVolPrevisao_2 <> datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString)
    or (vQtdVolPrevisao_2 <> vQtdVolPrevisao) then
    begin
      Mensagem_Manut := datm_trans_DI.qryVolumeProcesso.FieldByName('DESCRICAO').AsString + ' :  ' + Space( 23 - Length(datm_trans_DI.qryVolumeProcesso.FieldByName('DESCRICAO').AsString) ) +
                        vQtdVolPrevisao   + Space( 24 - Length(vQtdVolPrevisao)) +
                        vQtdVolPrevisao_2 + Space( 15 ) +
                        datm_trans_DI.qryVolumeProcesso.FieldByName('QT_VOLUME_CARGA').AsString  +  #13#10;

      if not AnsiContainsText(Mensagem , Mensagem_Manut) then
        Mensagem := Mensagem + Mensagem_Manut;    
    end;

    datm_trans_DI.qryVolumeProcesso.Next;
  end;
  {-------------------------------------------------------------------------------------}

  Result := Trim(Mensagem);
end;

end.

{
Exceções

Tabela TUF_EXCECOES serve para guardar as exceções que futuramente poderão ser inseridas nela

Campos :

CD_UF :
  Caso o estado possua uma exceção, será colocado o código do estado em questão.
  Caso seja uma exceção genérica, será incluído como código 'XX'

CD_UF_EXCECOES :
  Código auto-incremento

DESC_EXCECAO :
  Descrição breve da exceção. Esta descrição irá aparecer na tela de transmissão da DI para o
  usuário no momento que for utilizada.

VL_ALIQ_ICMS :
  Caso a exceção seja utilizada, este campo irá guardar o novo valor do ICMS da exceção

SCRIPT_SELECT :
  Comando SQL que será executado passando parâmetros como NR_PROCESSO e/ou  NR_ADICAO.
  Este campo só é utilizado caso o campo CD_UF seja uma exceção genérica, de valor 'XX'

RESULT_SELECT :
  Resultado que o campo SCRIPT_SELECT deve retornar para que a exceção genérica seja "verdadeira".

CD_REGIME_TRIB :
  Campo que guardará o código do regime de tributação que será utilizado caso a exceção
  do estado ou exceção genérica seja utilizada.

CD_PRIORIDADE :
  Campo que dirá quem tem mais prioridade, se é a exceção do estado ou se é a exceção genérica que serve para todos.
  Valores
    1 : Prioridade Principal
    2 : Prioridade Secundária

IN_CONTEMPLA_ADICAO :
  Algumas exceções se adaptam a adições e não no processo como um todo.
  Este campo tem como objetivo dizer se contempla também as adições ou o processo como um todo.
  Valores
    0 : Não contempla adição
    1 : Contempla Adição
  Obs.: Caso a exceção contemple uma adição, não esquecer de incluir o
        parâmetro :NR_ADICAO no campo SCRIPT_SELECT para que possa ser feito a
        verificação por adição.

IN_EXCECAO_VALE_MAIS :
  Campo que será utilizado para verificar quem será prioridade, as exceções ou a alíquota diferenciada do produto.
  Valores
    0 : A alíquota diferenciada vale mais, ou seja, ela tem preferência na hora das comparações;
    1 : A exceção tem prioridade, ou seja, mesmo existindo alíquota diferenciada
        para o produto, a exceção é que será utilizada;
}
