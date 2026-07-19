(*************************************************************************************************
Sistema: MyIndaia
PROGRAMA: PGGP013.PAS - Liberação de Contas a Pagar
Manutenção:
Data:
*************************************************************************************************)

unit PGGP013;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, ComCtrls, Grids, DBGrids, Db, DBTables,
  Buttons, Menus, ToolEdit, RXDBCtrl, Funcoes;

type
  Tfrm_lib_ctaapagar = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_liberar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_liberar: TMenuItem;
    mi_sair: TMenuItem;
    mi_pesq_liberacao: TMenuItem;
    rdgrp_lib: TRadioGroup;
    Panel2: TPanel;
    lbl_unidade: TLabel;
    btn_co_unidade: TSpeedButton;
    lbl_dt_pagto: TLabel;
    Label2: TLabel;
    btn_co_banco: TSpeedButton;
    msk_cd_unidade: TMaskEdit;
    edt_nm_unidade: TEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TEdit;
    Label3: TLabel;
    cbo_ordem: TComboBox;
    btn_alt_banco: TSpeedButton;
    mi_alt_banco: TMenuItem;
    msk_dt_pagto: TDateEdit;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    dbgrd_lista: TDBGrid;
    pnl_insere_banco: TPanel;
    Panel1: TPanel;
    Shape1: TShape;
    btn_co_banco2: TSpeedButton;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    Button1: TButton;
    Button2: TButton;
    pnl_baixar: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    EditDtBase: TDateEdit;
    BtnDesmontar: TSpeedButton;
    Desmontar1: TMenuItem;
    GroupBox1: TGroupBox;
    lbl_inicio: TLabel;
    lbl_fim: TLabel;
    msk_dt_inicio: TDateEdit;
    msk_dt_fim: TDateEdit;
    btnTED: TSpeedButton;
    ED1: TMenuItem;
    BtnEmissaoCheque: TSpeedButton;
    EmissodeCheques1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Financeiro1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_liberarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure AbreTabelas;
    procedure FechaTabelas;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unidadeEnter(Sender: TObject);
    procedure msk_cd_unidadeExit(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure cbo_ordemClick(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn_co_banco2Click(Sender: TObject);
    procedure btn_alt_bancoClick(Sender: TObject);
    procedure msk_dataEnter(Sender: TObject);
    procedure msk_dataExit(Sender: TObject);
    procedure msk_dt_fimEnter(Sender: TObject);
    procedure EditDtBaseEnter(Sender: TObject);
    procedure BtnDesmontarClick(Sender: TObject);
    procedure btnTEDClick(Sender: TObject);
    procedure BtnEmissaoChequeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
  private
    dt_pagto: TDate;
    st_modulo, st_rotina, nr_ctaapagar, dt_inicio, dt_fim, dt_base : String;
    cd_unidade_contas : String[2];
    dt_ctaapagar: TDate;
  public
    nr_solicitacao : String[3];
    nr_lancamento : Double;
    cState : String[1];
    in_alt_banco : Boolean;
    lPesquisa : Boolean;
  end;

var
  frm_lib_ctaapagar: Tfrm_lib_ctaapagar;

implementation

uses GSMLIB, PGGP014, PGGP001, PGGP017, PGSM096, PGSM148, PGSM041, PGSM090, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_lib_ctaapagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FechaTabelas;
  with datm_lib_ctaapagar do
  begin
    Free;
    Action := caFree;
  end;
end;


procedure Tfrm_lib_ctaapagar.btn_liberarClick(Sender: TObject);
Var
  tot_nao_distr, I : integer;
  vStatus : String;
  dt_movimento : TDateTime;
begin
  in_alt_banco := false ;
  if datm_lib_ctaapagar.qry_ctaapagar_IN_DISTRIBUICAO.AsString = '0' then
  begin
    BoxMensagem( 'Distribuição dos Valores e/ou Gerencial não confere com o valor do Pagamento!', 2 );
    Exit;
  end;
  if datm_lib_ctaapagar.qry_ctaapagar_IN_LIBERADO.AsString = '1' then
  begin
    BoxMensagem( 'Lançamento já liberado!', 2 );
    Exit;
  end;

  If datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString <> '$' Then //pedir banco somente se for diferente de dinheiro
  Begin
    if dbedt_cd_banco.text = '' then
    begin
      msk_cd_banco.text := '';
      edt_nm_banco.text := '';
      pnl_insere_banco.Visible := true;
      msk_cd_banco.SetFocus;
      Exit;
    end;
  End;
  if msk_dt_pagto.Text = '  /  /    ' then
  begin
    BoxMensagem( 'Informe uma Data de Pagamento!', 2 );
    Exit;
  end;

  // Verifica se o movimento está fechado antes de prosseguir
  with TQuery.Create(Application)do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO ');
    Sql.Add('FROM TCAIXA_CONTROLE (NOLOCK) ');
    Open;
    dt_movimento := Fields[0].AsDateTime;
    Free;
  end;
  if StrToDate( msk_dt_pagto.Text ) < dt_movimento then
  begin
    BoxMensagem('Movimento Financeiro fechado!', 2);
    Exit;
  end;

  tot_nao_distr := 0;
  if rdgrp_lib.ItemIndex = 0 then
  begin
    with datm_lib_ctaapagar do
    begin
      if DBGrid1.SelectedRows.Count = 0 then
      begin
        BoxMensagem( 'Selecione um Pagamento!', 2 );
        Exit;
      end;
      For I := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin
        If datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString <> '$' Then
        Begin
          If Trim( qry_ctaapagar_CD_BANCO.AsString ) = '' Then
          Begin
            BoxMensagem( 'Informe o Banco!', 2 );
            dbedt_cd_banco.SetFocus;
            Exit;
          End;
        End;
        // Screen.Cursor := crHourGlass;
        // Application.ProcessMessages;
        Try
          datm_main.db_broker.StartTransaction;
          pnl_baixar.Visible := true;
          Label6.CAption := 'Baixando Lançamento...';
          if msk_cd_banco.text = '' then
            msk_cd_banco.text := qry_ctaapagar_CD_BANCO.AsString;
          // if Not ( qry_ctaapagar_.State in [dsEdit] ) then
          //   qry_ctaapagar_.Edit;
          qry_ctaapagar_.First;
          While Not qry_ctaapagar_.Eof Do
          Begin
            If (datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString = '$') Or
               (datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString = 'D') Then
              vStatus := '7'    // Pago
            Else
              vStatus := '16';  // Liberado pelo sistema
            With TQuery.Create(Application) Do
            Begin
              DataBaseName := 'DBBROKER';
              Sql.Add(' UPDATE TCTAAPAGAR SET IN_LIBERADO = :IN_LIBERADO, ');
              If (datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString = '$') Or
                 (datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString = 'D') Then
              Begin
                Sql.Add(' DT_PAGAMENTO = :DT_PAGAMENTO, ');
                Params[1].AsDateTime := strtodatetime( msk_dt_pagto.Text )
              End;
              Sql.Add(' CD_LIBERADOR = :CD_LIBERADOR, ');
              Sql.Add(' DT_LIBERACAO = :DT_LIBERACAO, STATUS = ''' + vStatus + '''');
              Sql.Add(' WHERE NR_CTAAPAGAR = :NR_CTAAPAGAR AND DT_CTAAPAGAR = :DT_CTAAPAGAR ');
              Sql.Add(' AND CD_UNID_NEG = :CD_UNID_NEG ');
              If qry_ctaapagar_IN_LIBERADO.AsString = '0' Then
                ParamByName('IN_LIBERADO').AsString    := '1'
              Else
                ParamByName('IN_LIBERADO').AsString   := '0';
              ParamByName('CD_LIBERADOR').AsString   := str_cd_usuario;
              ParamByName('DT_LIBERACAO').AsDateTime := dt_server;
              ParamByName('NR_CTAAPAGAR').AsString   := datm_lib_ctaapagar.qry_ctaapagar_NR_CTAAPAGAR.AsString;
              ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
              ParamByName('CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
              ExecSql;
              Free;
            End;

            If qry_ctaapagar_IN_OPERACIONAL.AsString = '0' Then
            Begin
              Label6.CAption := 'Atualizando Caixa Administrativo...';
              CloseStoredProc(sp_distribui_ctaapagar);
              sp_distribui_ctaapagar.ParamByName('@DT_MOVIMENTO').AsDateTime := strtodatetime( msk_dt_pagto.Text );
              sp_distribui_ctaapagar.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
              ExecStoredProc(sp_distribui_ctaapagar);
              CloseStoredProc(sp_distribui_ctaapagar);
            End
            Else
            Begin
              Label6.CAption := 'Atualizando Caixa Operacional...';
              CloseStoredProc(sp_distribui_ctaapagar_ag);
              sp_distribui_ctaapagar_ag.ParamByName('@DT_MOVIMENTO').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
              sp_distribui_ctaapagar_ag.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
              sp_distribui_ctaapagar_ag.ParamByName('@nr_cta_pagar').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
              sp_distribui_ctaapagar_ag.ParamByName('@tp_pagamento').AsString   := qry_ctaapagar_TP_PAGAMENTO.AsString;
              sp_distribui_ctaapagar_ag.ParamByName('@cd_banco').AsString       := dbedt_cd_banco.text;
              ExecStoredProc(sp_distribui_ctaapagar_ag);
              CloseStoredProc(sp_distribui_ctaapagar_ag);
            End;

            if ( in_integracao_contabil = '1' ) and (qry_ctaapagar_TP_PAGAMENTO.AsString <> 'C') and
              (qry_ctaapagar_IN_OPERACIONAL.AsString = '1') then
            begin
              Label6.CAption := 'Contabilizando ...';
              executa_sp_contabiliza_pagto_dinheiro_ctapagar(msk_cd_unidade.Text, qry_ctaapagar_NR_CTAAPAGAR.AsString,
                                                             dbedt_cd_banco.text, qry_ctaapagar_NR_TITULO.AsString,
                                                             qry_ctaapagar_DT_CTAAPAGAR.AsDAtetime, strtodatetime(msk_dt_pagto.text) );
            end;
            if ( in_integracao_contabil = '1' ) and (qry_ctaapagar_TP_PAGAMENTO.AsString <> 'C') and
            (qry_ctaapagar_IN_OPERACIONAL.AsString = '0') then
            begin
              Label6.CAption := 'Contabilizando ...';

              exec_sp_baixa_pagto_adm(msk_cd_unidade.Text, qry_ctaapagar_NR_CTAAPAGAR.AsString, dbedt_cd_banco.text,
                                      qry_ctaapagar_NR_TITULO.AsString, qry_ctaapagar_DT_CTAAPAGAR.AsDAtetime,
                                      strtodatetime(msk_dt_pagto.text) );

            end;
            qry_ctaapagar_.Next;
          End;
          datm_main.db_broker.Commit;
          cd_unidade_contas  := qry_ctaapagar_CD_UNID_NEG.AsString;
          dt_ctaapagar       := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
          nr_ctaapagar       := qry_ctaapagar_NR_CTAAPAGAR.AsString;
          FechaTabelas;
          AbreTabelas;
          qry_ctaapagar_.Locate( 'CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
             VarArrayOf( [msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar] ), [loCaseInsensitive,loPartialKey] );
          pnl_baixar.Visible := false;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            qry_ctaapagar_.Cancel;
            pnl_baixar.Visible := false;
            TrataErro(E);
            Exit;
          end;
        end;
      end;
      BoxMensagem( 'Lançamentos autorizados com Sucesso !', 3 );
    end;
  end
  else
  begin
    with datm_lib_ctaapagar do
    begin
      if msk_dt_pagto.Text = '  /  /    ' then
      begin
        BoxMensagem( 'Informe uma Data de Pagamento!', 2 );
        Exit;
      end
      else
      begin
        if StrToDate(msk_dt_pagto.Text) < dt_server then
        begin
          BoxMensagem( 'Data de Pagamento deve ser maior ou igual a data atual!', 2 );
          msk_dt_pagto.SetFocus;
          Exit;
        end
        else
        begin
          qry_ctaapagar_.First;
          while not qry_ctaapagar_.EOF do
          begin
            if qry_ctaapagar_IN_DISTRIBUICAO.AsString = '0' then
            begin
              tot_nao_distr := tot_nao_distr + 1;
            end
            else
            begin
              if qry_liberacao_IN_LIBERADO.AsString = '0' then
              begin
                try
                  datm_main.db_broker.StartTransaction;

                  if Not ( qry_liberacao_.State in [dsEdit] ) then
                    qry_liberacao_.Edit;
                  qry_liberacao_IN_LIBERADO.AsString    := '1';
                  qry_liberacao_DT_PAGAMENTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
                  qry_liberacao_CD_LIBERADOR.AsString   := str_cd_usuario;
                  qry_liberacao_DT_LIBERACAO.AsDateTime := dt_server;
                  qry_liberacao_.Post;

                  if qry_ctaapagar_IN_OPERACIONAL.AsString = '0' then
                  begin
                    CloseStoredProc(sp_distribui_ctaapagar);
                    sp_distribui_ctaapagar.ParamByName('@DT_MOVIMENTO').AsDateTime := StrToDate( msk_dt_pagto.Text );
                    sp_distribui_ctaapagar.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
                    ExecStoredProc(sp_distribui_ctaapagar);
                    CloseStoredProc(sp_distribui_ctaapagar);
                  end
                 else
                   begin
                   CloseStoredProc(sp_distribui_ctaapagar_ag);
                   sp_distribui_ctaapagar_ag.ParamByName('@DT_MOVIMENTO').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
                   sp_distribui_ctaapagar_ag.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
                   sp_distribui_ctaapagar_ag.ParamByName('@nr_cta_pagar').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
                   sp_distribui_ctaapagar_ag.ParamByName('@tp_pagamento').AsString   := qry_ctaapagar_TP_PAGAMENTO.AsString;
                   sp_distribui_ctaapagar_ag.ParamByName('@cd_banco').AsString       := dbedt_cd_banco.text;
                   ExecStoredProc(sp_distribui_ctaapagar_ag);
                   CloseStoredProc(sp_distribui_ctaapagar_ag);
                  end;
                  datm_main.db_broker.Commit;

                  cd_unidade_contas  := qry_ctaapagar_CD_UNID_NEG.AsString;
                  dt_ctaapagar       := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
                  nr_ctaapagar       := qry_ctaapagar_NR_CTAAPAGAR.AsString;

                except
                  on E: Exception do
                  begin
                    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                    qry_liberacao_.Cancel;
                    TrataErro(E);
                  end;
                end;
              end;
            end;
            qry_ctaapagar_.Next;
          end;
          FechaTabelas;
          AbreTabelas;

          qry_ctaapagar_.Locate( 'CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
             VarArrayOf( [msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar] ), [loCaseInsensitive,loPartialKey] );
        end;
      end;
    end;
  end;
  if tot_nao_distr > 0 then
  begin
    BoxMensagem( IntToStr(tot_nao_distr) + ' Contas não foram liberados pois a Distribuição dos Valores e/ou Gerencial não confere com o valor do Pagamento!!', 2 );
  end;
end;


procedure Tfrm_lib_ctaapagar.FormCreate(Sender: TObject);
begin
  // Cria o DataModule p/ Liberação de Contas a Pagar
  Application.CreateForm(Tdatm_lib_ctaapagar, datm_lib_ctaapagar );

  a_str_indices[0] := 'CD_FORNECEDOR, IN_LIBERADO, DT_VENCIMENTO';
  a_str_indices[1] := 'NR_TITULO, IN_LIBERADO, DT_VENCIMENTO';

  with cbO_ordem do
  begin
    Clear;
    Items.Add('Fornecedor');
    Items.Add('N.º Nota Fiscal');
    ItemIndex := 0;
  end;
end;


procedure Tfrm_lib_ctaapagar.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_lib_ctaapagar.FechaTabelas;
begin
  with datm_lib_ctaapagar do
  begin
    qry_ctaapagar_.Close;
    qry_unidade_.Close;
  end;
end;


procedure Tfrm_lib_ctaapagar.AbreTabelas;
var dt_servidor : TDateTime;
begin
  with datm_lib_ctaapagar do
  begin
    qry_ContasAgrupadas.Close;
    qry_ctaapagar_.Close;
    SqlContasLancamento.Close;
    qry_ContasAgrupadas.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
    if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_fim.Text <> '  /  /    ' ) then
    begin
      qry_ContasAgrupadas.ParamByName('DT_INICIO').AsDate    := StrToDate( msk_dt_inicio.Text );
      qry_ContasAgrupadas.ParamByName('DT_FIM').AsDate       := StrToDate( msk_dt_fim.Text );
      // 06/10/2005
      // qry_ContasAgrupadas.ParamByName('DT_CTAAPAGAR').AsDate := StrToDate( EditDtBase.Text );
    end
    else
    begin
      dt_servidor := StrToDate( DateToStr( dt_server ) );
      qry_ContasAgrupadas.ParamByName('DT_INICIO').AsDate    := dt_servidor;
      qry_ContasAgrupadas.ParamByName('DT_FIM').AsDate       := dt_servidor;
      // 06/10/2005
      // qry_ContasAgrupadas.ParamByName('DT_CTAAPAGAR').AsDate := dt_servidor;
    end;
    qry_ContasAgrupadas.Prepare;
    qry_ContasAgrupadas.Open;
    If Not qry_ContasAgrupadas.IsEmpty Then
    Begin
      qry_ctaapagar_.Open;
      SqlContasLancamento.Open;
      qry_ctaapagar_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
         VarArrayOf([msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar]), [loCaseInsensitive,loPartialKey]);
    End;

    // qry_ctaapagar_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
    // qry_ContasAgrupadas.Open;

    (*
    qry_ctaapagar_.Close;
    qry_ctaapagar_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
    if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_fim.Text <> '  /  /    ' ) then
    begin
      qry_ctaapagar_.ParamByName('DT_INICIO').AsDate   := StrToDate( msk_dt_inicio.Text );
      qry_ctaapagar_.ParamByName('DT_FIM').AsDate      := StrToDate( msk_dt_fim.Text );
    end
    else
    begin
      dt_servidor := StrToDate( DateToStr( dt_server ) );
      qry_ctaapagar_.ParamByName('DT_INICIO').AsDate   := dt_servidor;
      qry_ctaapagar_.ParamByName('DT_FIM').AsDate      := dt_servidor;
    end;
    qry_ctaapagar_.Prepare;
    qry_ctaapagar_.Open;
    *)

    (*
    qry_liberacao_.Close;
    qry_liberacao_.Prepare;
    qry_liberacao_.Open;
    *)
  end;
end;


procedure Tfrm_lib_ctaapagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_lib_ctaapagar.msk_cd_unidadeEnter(Sender: TObject);
begin
  cd_unidade_contas := msk_cd_unidade.Text;
end;


procedure Tfrm_lib_ctaapagar.msk_cd_unidadeExit(Sender: TObject);
begin
  if ( cd_unidade_contas = msk_cd_unidade.Text ) then Exit;

  ValCodEdt( msk_cd_unidade );

  with datm_lib_ctaapagar do
  begin
    if msk_cd_unidade.Text <> '' then
    begin
      qry_unidade_.Close;
      qry_unidade_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unidade.Text + '"';
      qry_unidade_.Prepare;
      qry_unidade_.Open;
      if qry_unidade_.RecordCount > 0 then
      begin
        edt_nm_unidade.Text := qry_unidade_NM_UNID_NEG.AsString;
        AbreTabelas;
      end
      else
      begin
        BoxMensagem('Unidade Inválida!', 2);
        edt_nm_unidade.Text := '';
        msk_cd_unidade.SetFocus;
        Exit;
      end;
    end
    else
    begin
      edt_nm_unidade.Text := '';
    end;
  end;
end;


procedure Tfrm_lib_ctaapagar.btn_co_unidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidade',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else
    edt_nm_unidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unidade.Text,'NM_UNID_NEG')
end;


procedure Tfrm_lib_ctaapagar.FormShow(Sender: TObject);
var dt_servidor : TDateTime;
begin
  AbreTabelas;
  dt_servidor         := StrToDate( DateToStr( dt_server ) );
  msk_dt_inicio.Text  := FormatDateTime('dd/mm/yyyy', dt_servidor );
  msk_dt_fim.Text     := FormatDateTime('dd/mm/yyyy', dt_servidor );
  msk_dt_pagto.Text   := FormatDateTime('dd/mm/yyyy', dt_servidor );
  EditDtBase.Text     := FormatDateTime('dd/mm/yyyy', dt_servidor );
  msk_cd_unidade.Text := str_cd_unid_neg;
  msk_cd_unidadeExit(nil);
  msk_dt_inicio.SetFocus;
end;

procedure Tfrm_lib_ctaapagar.msk_cd_unidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unidade then btn_co_unidadeClick(btn_co_unidade);
    if Sender = dbedt_cd_banco then btn_co_bancoClick(btn_co_banco);
    if Sender = msk_cd_banco then btn_co_banco2Click(btn_co_banco2);
  end;
end;

procedure Tfrm_lib_ctaapagar.btn_co_bancoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_lib_ctaapagar.qry_ctaapagar_) then exit;
    datm_lib_ctaapagar.qry_ctaapagar_CD_BANCO.AsString := ConsultaOnLineEx('TBANCO','Banco',['CD_BANCO','NM_BANCO'],['Código','Descrição'],'CD_BANCO',frm_main.mi_cad_fin_conta_banc);
  end
  else
    dbedt_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO',dbedt_cd_banco.Text,'NM_BANCO')
end;


procedure Tfrm_lib_ctaapagar.dbedt_cd_bancoExit(Sender: TObject);
begin
  if datm_lib_ctaapagar.qry_ctaapagar_.State in [dsEdit] then
     ValidCodigo( dbedt_cd_banco );
end;


procedure Tfrm_lib_ctaapagar.cbo_ordemClick(Sender: TObject);
var
  cd_unidade_contas, nr_ctaapagar : String;
  dt_ctaapagar : TDateTime;
begin
  with datm_lib_ctaapagar do
  begin
    cd_unidade_contas  := qry_ctaapagar_CD_UNID_NEG.AsString;
    dt_ctaapagar       := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
    nr_ctaapagar       := qry_ctaapagar_NR_CTAAPAGAR.AsString;

    qry_ctaapagar_.Close;
    qry_ctaapagar_.SQL[9] := a_str_indices[cbo_ordem.ItemIndex];
    qry_ctaapagar_.Prepare;
    qry_ctaapagar_.Open;
    qry_ctaapagar_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
       VarArrayOf([cd_unidade_contas, dt_ctaapagar, nr_ctaapagar ]), [loCaseInsensitive]);
  end;
end;


procedure Tfrm_lib_ctaapagar.msk_cd_bancoExit(Sender: TObject);
begin
 if msk_cd_banco.text <> '' then
  begin
   ValCodEdt( msk_cd_banco );
   With Tquery.Create(Application) do
    begin
     DAtaBaseName := 'DBBROKER';
     // Retirado filtro IN_IMPOSTOS = 0 em 26/10/2005
     // Sql.Add('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO = "'+msk_cd_banco.text+'" AND IN_IMPOSTOS = "0" ');
     Sql.Add('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO = "'+msk_cd_banco.text+ '" ' );
     Open;
     if Recordcount > 0 then
      begin
       edt_nm_banco.Text := Fields[0].AsString;
      end
     else
      begin
       Boxmensagem('Banco Inválido',2);
       msk_cd_banco.Setfocus;
      end;
      Free;
    end;
  end
end;


procedure Tfrm_lib_ctaapagar.Button1Click(Sender: TObject);
begin
  if edt_nm_banco.Text = '' then
  begin
    Boxmensagem('Deve ser Informado o Banco',2);
    msk_cd_banco.SetFocus;
    Exit;
  end;
  Try
    datm_lib_ctaapagar.qry_ctaapagar_.First;
    While Not datm_lib_ctaapagar.qry_ctaapagar_.Eof Do
    Begin
      With TQuery.Create(Application) Do
      Begin
        DAtaBaseName := 'DBBROKER';
        Close;
        Sql.Clear;
        Sql.Add('UPDATE TCTAAPAGAR SET CD_BANCO = :CD_BANCO ');
        Sql.Add('where');
        Sql.Add(' NR_CTAAPAGAR = :NR_CTAAPAGAR AND DT_CTAAPAGAR = :DT_CTAAPAGAR ');
        ParamByName('NR_CTAAPAGAR').AsString   := datm_lib_ctaapagar.qry_ctaapagar_NR_CTAAPAGAR.AsString;
        ParamByName('DT_CTAAPAGAR').AsDateTime := datm_lib_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        ParamByName('CD_BANCO').AsString       := msk_cd_banco.text;
        ExecSql;
      End;
      datm_lib_ctaapagar.qry_ctaapagar_.Next;
    End;
    datm_lib_ctaapagar.qry_ctaapagar_.Close;
    datm_lib_ctaapagar.qry_ctaapagar_.Open;

  (*
  if not(datm_lib_ctaapagar.qry_ctaapagar_.State in [ dsEdit ]) then
    datm_lib_ctaapagar.qry_ctaapagar_.Edit;

  datm_lib_ctaapagar.qry_ctaapagar_CD_BANCO.AsString := msk_cd_banco.text;

  datm_lib_ctaapagar.qry_ctaapagar_.Post;
  *)

  if not in_alt_banco then
     btn_liberarClick(nil);
  except
   on E: Exception do
    begin
     datm_lib_ctaapagar.qry_ctaapagar_.Cancel;
     TrataErro(E);
     end;
  end;
  pnl_insere_banco.Visible := false;
end;


procedure Tfrm_lib_ctaapagar.Button2Click(Sender: TObject);
begin
  pnl_insere_banco.Visible := false;
end;

procedure Tfrm_lib_ctaapagar.btn_co_banco2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_banco.Text := ConsultaOnLineEx('TBANCO','Banco',['CD_BANCO','NM_BANCO'],['Código','Descrição'],'CD_BANCO',frm_main.mi_cad_fin_conta_banc)
  else
    edt_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO',msk_cd_banco.Text,'NM_BANCO')
end;


procedure Tfrm_lib_ctaapagar.btn_alt_bancoClick(Sender: TObject);
begin
  in_alt_banco := true ;
 if datm_lib_ctaapagar.qry_ctaapagar_IN_DISTRIBUICAO.AsString = '0' then
  begin
   BoxMensagem( 'Distribuição dos Valores e/ou Gerencial não confere com o valor do Pagamento!', 2 );
   Exit;
  end;

 if datm_lib_ctaapagar.qry_ctaapagar_IN_LIBERADO.AsString = '1' then
  begin
   BoxMensagem( 'Lançamento já liberado!', 2 );
   Exit;
  end;

  if (in_integracao_contabil = '1' )and (dt_contabilizacao >=  strtodatetime(msk_dt_pagto.text)) then
  begin
   BoxMensagem( 'Período Contabil Fechado!', 2 );
   Exit;
  end;

  if (datm_lib_ctaapagar.qry_ctaapagar_IN_CONTABILIZADO.AsString = '0') and
     (datm_lib_ctaapagar.qry_ctaapagar_IN_OPERACIONAL.AsString = '0') then
  begin
   Boxmensagem('Pagto Administrativo não contabilizado',2);
   exit;
  end;

 msk_cd_banco.text := '';
 edt_nm_banco.text := '';
 pnl_insere_banco.Visible := true;
 msk_cd_banco.SetFocus;
end;


procedure Tfrm_lib_ctaapagar.msk_dataEnter(Sender: TObject);
begin
  dt_inicio := msk_dt_inicio.Text;
end;

procedure Tfrm_lib_ctaapagar.msk_dataExit(Sender: TObject);
begin
  if ( ( dt_inicio = msk_dt_inicio.Text ) and ( dt_fim = msk_dt_fim.Text ) (*and ( dt_base = EditDtBase.Text )*) ) then
    Exit;
  dt_inicio := msk_dt_inicio.Text;
  dt_fim    := msk_dt_fim.Text;
  // dt_base   := EditDtBase.Text;

  if ( msk_dt_inicio.Text <> '' ) and ( msk_dt_fim.Text <> '' ) then AbreTabelas;
end;

procedure Tfrm_lib_ctaapagar.msk_dt_fimEnter(Sender: TObject);
begin
  dt_fim := msk_dt_fim.Text;
end;

procedure Tfrm_lib_ctaapagar.EditDtBaseEnter(Sender: TObject);
begin
  dt_base := EditDtBase.Text;
end;


procedure Tfrm_lib_ctaapagar.BtnDesmontarClick(Sender: TObject);
Var
  I : Integer;
  nr_novo_lancamento : String[3];

  Procedure Desmontar;
  Begin
    If BoxMensagem( 'Este Conta será cancelada! Confirma ?', 1 ) Then
    Begin
      datm_lib_ctaapagar.qry_ctaapagar_.First;
      While Not datm_lib_ctaapagar.qry_ctaapagar_.Eof Do
      Begin
        With TQuery.Create(Application) Do
        Begin
          DAtaBaseName := 'DBBROKER';
          Close;
          Sql.Clear;
          Sql.Add('update TCTAAPAGAR SET NR_REF = NULL, DT_MONTAGEM = NULL, IN_DISTRIBUICAO = ''0'', DT_PAGAMENTO = NULL, IN_LIBERADO = ''0'', IN_TRANSFERIDO = ''0'', STATUS = ''0''');
          Sql.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR');
          ParamByName('NR_CTAAPAGAR').AsString   := datm_lib_ctaapagar.qry_ctaapagar_NR_CTAAPAGAR.AsString;
          ParamByName('DT_CTAAPAGAR').AsDateTime := datm_lib_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
          ExecSql;
          Free;

          //cancela no Financeiro qdo for Tipo de Pagamento Dinheiro ou Débito em conta
          With datm_lib_ctaapagar Do
          Begin
            SqlContasLancamento.First;
            While Not datm_lib_ctaapagar.SqlContasLancamento.Eof Do
            Begin
              qry_ult_lancto_.Close;
              qry_ult_lancto_.ParamByName('DT_MOVIMENTO').AsDateTime := dt_server;
              qry_ult_lancto_.Prepare;
              qry_ult_lancto_.Open;
              if qry_ult_lancto_NR_LANCAMENTO.AsString = '000' then
                 nr_novo_lancamento := '001'
              else
                 nr_novo_lancamento := qry_ult_lancto_NR_LANCAMENTO.AsString;
              qry_ult_lancto_.Close;
              // datm_lib_ctaapagar.SqlContasLancamentoNR_LANC_CAIXA.AsString
              qry_ins_caixa.Close;
              qry_ins_caixa.ParamByName('CD_COLIGADA').AsString    := '01';
              qry_ins_caixa.ParamByName('DT_CANCELAMENTO').AsDateTime := dt_server;
              qry_ins_caixa.ParamByName('DT_MOVIMENTO').AsDateTime := SqlContasLancamentoDT_MOVIMENTO_CAIXA.AsDateTime;
              qry_ins_caixa.ParamByName('NR_LANCAMENTO').AsString  := SqlContasLancamentoNR_LANC_CAIXA.AsString;
              qry_ins_caixa.ParamByName('NR_LANC_NOVO').AsString   := nr_novo_lancamento;
              qry_ins_caixa.ExecSQL;

              datm_lib_ctaapagar.SqlContasLancamento.Next;
            End;
          End;
        End;
        datm_lib_ctaapagar.qry_ctaapagar_.Next;
      End;
      AbreTabelas;
      BoxMensagem( 'A conta foi cancelada com Sucesso !!', 2 );
    End;
  End;
begin
  If Not datm_lib_ctaapagar.qry_ContasAgrupadas.IsEmpty Then
  Begin
    If datm_lib_ctaapagar.qry_ContasAgrupadasDT_PAGAMENTO.AsDateTime = 0 Then
      Desmontar
    Else
    Begin
      If (datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString = '$') Or  //dinheiro ou déb conta
         (datm_lib_ctaapagar.qry_ContasAgrupadasTP_PAGAMENTO.AsString = 'D') Then
        Desmontar
      Else
        BoxMensagem( 'Não é possível cancelar a conta porque ela já está paga !', 2 );
    End;
  End
  Else
    BoxMensagem( 'Não existem Contas para serem canceladas !', 2 );
end;


procedure Tfrm_lib_ctaapagar.btnTEDClick(Sender: TObject);
begin
  frm_main.mi_adm_gera_ted.Click;
  datm_lib_ctaapagar.qry_ContasAgrupadas.Close;
  datm_lib_ctaapagar.qry_ContasAgrupadas.Open;
  datm_lib_ctaapagar.qry_ctaapagar_.Close;
  datm_lib_ctaapagar.qry_ctaapagar_.Open;
  datm_lib_ctaapagar.SqlContasLancamento.Open;
  datm_lib_ctaapagar.SqlContasLancamento.Close;
end;

procedure Tfrm_lib_ctaapagar.BtnEmissaoChequeClick(Sender: TObject);
begin
  frm_main.mi_adm_imp_cheque.Click;
  datm_lib_ctaapagar.qry_ContasAgrupadas.Close;
  datm_lib_ctaapagar.qry_ContasAgrupadas.Open;
  datm_lib_ctaapagar.qry_ctaapagar_.Close;
  datm_lib_ctaapagar.qry_ctaapagar_.Open;
  datm_lib_ctaapagar.SqlContasLancamento.Open;
  datm_lib_ctaapagar.SqlContasLancamento.Close;
end;


procedure Tfrm_lib_ctaapagar.SpeedButton1Click(Sender: TObject);
begin
  frm_main.mi_fin_lanc.Click;
  datm_lib_ctaapagar.qry_ContasAgrupadas.Close;
  datm_lib_ctaapagar.qry_ContasAgrupadas.Open;
end;


procedure Tfrm_lib_ctaapagar.msk_dt_pagtoExit(Sender: TObject);
begin
  if msk_dt_pagto.Text = '  /  /    ' then
  begin
    BoxMensagem( 'Informe uma Data de Pagamento!', 2 );
    Exit;
  end
  else
  begin
    if StrToDate(msk_dt_pagto.Text) > dt_server then
    begin
      BoxMensagem( 'Data de Pagamento deve ser menor ou igual a data atual!', 2 );
      msk_dt_pagto.SetFocus;
      Exit;
    end;
  end;  
end;

end.
