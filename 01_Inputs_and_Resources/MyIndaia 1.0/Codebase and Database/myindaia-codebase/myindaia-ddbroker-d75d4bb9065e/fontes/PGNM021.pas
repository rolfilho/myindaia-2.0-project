 unit PGNM021;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DbTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, DBCGrids, UCRPE32, ShellAPI, Funcoes;

type
  Tfrm_Impressao_Numerario = class(TForm)
    pnl_cadastro: TPanel;
    btn_imprime: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_emissao: TPanel;
    lbl_nr_solic: TLabel;
    lbl_dt_solic: TLabel;
    lbl_emitir: TLabel;
    dbctrlgrd_numerario: TDBCtrlGrid;
    dbtxt_nr_solic: TDBText;
    dbtxt_vl_solic_: TDBText;
    dbchkbox_emitir: TDBCheckBox;
    Mensagem: TStatusBar;
    menu_cadastro: TMainMenu;
    mi_imprime: TMenuItem;
    mi_sair: TMenuItem;
    lbl_cd_unid_neg: TLabel;
    lbl_produto: TLabel;
    lblCliente: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    btn_co_cliente: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    Label8: TLabel;
    Label7: TLabel;
    mem_obs: TMemo;
    mem_ass: TMemo;
    lbl_Valor: TLabel;
    dbtxt_dt_solic: TDBText;
    grpbox_tp_solic: TGroupBox;
    rbtn_normal: TRadioButton;
    rbtn_totais: TRadioButton;
    crp_Numerario: TCrpe;
    rbtn_item: TRadioButton;
    msk_dt_movimento: TMaskEdit;
    lbl_dt_solic_ch: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    dbtxt_nr_processo: TDBText;
    Label2: TLabel;
    rbtn_JJ: TRadioButton;
    dbmem_obs: TDBMemo;
    btn_salvar: TSpeedButton;
    mi_salvar: TMenuItem;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimeClick(Sender: TObject);
    procedure msk_dt_movimentoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Imprime_Avon;
    function VporPDecimal(Valor:String):String;
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Gera_Arquivo_JJ;
    procedure Gera_Arquivo_Raychem;
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbmem_obsChange(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_clienteEnter(Sender: TObject);
    procedure msk_dt_movimentoEnter(Sender: TObject);
  private
    num_cd_unid_neg, num_cd_produto, num_cd_cliente, num_dt_base : String; 
    procedure AbreNumerario;
  public
  end;

var
  frm_Impressao_Numerario: Tfrm_Impressao_Numerario;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGNM022, PGSM010, PGSM018, PGSM104, FileText;

var str_relatorio:Byte;
procedure Tfrm_Impressao_Numerario.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
  if ( msk_cd_unid_neg.Text <> '' ) and ( msk_cd_unid_neg.Text <> num_cd_unid_neg )then
  begin
    with datm_Impressao_Numerario do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        AbreNumerario;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
      end;
    end
  end;
end;

procedure Tfrm_Impressao_Numerario.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_produto );
  if ( msk_cd_produto.Text <> '' ) and ( msk_cd_produto.Text <> num_cd_produto )then
  begin
    with datm_Impressao_Numerario do
    begin
      qry_produto_.Close;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
        AbreNumerario;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        edt_nm_produto.Text := '';
        msk_cd_produto.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.msk_cd_clienteExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_cliente );
  if ( msk_cd_cliente.Text <> '' ) then
  begin
    if ( msk_cd_cliente.Text <> num_cd_cliente ) then
    begin
      with datm_Impressao_Numerario do
      begin
        qry_emp_nac_.Close;
        qry_emp_nac_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_emp_nac_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_emp_nac_.SQL[5] := ' CD_EMPRESA = "' + msk_cd_cliente.Text + '"';
        qry_emp_nac_.Prepare;
        qry_emp_nac_.Open;

        qry_cliente_contato_.Close;
        qry_cliente_contato_.Prepare;
        qry_cliente_contato_.Open;

        if qry_emp_nac_.RecordCount > 0 then
        begin
          if ( qry_emp_nac_CD_NUMERARIO.IsNull ) or ( qry_emp_nac_CD_NUMERARIO.AsString = '' ) then
          begin
            BoxMensagem('Modelo de Numerário não cadastrado para este cliente!', 2);
            msk_cd_cliente.SetFocus;
            Exit;
          end;

          case StrToInt( qry_emp_nac_CD_NUMERARIO.AsString ) of
            1: begin
                 mem_obs.Enabled         := True;
                 mem_ass.Enabled         := True;
                 dbmem_obs.Enabled       := True;
                 grpbox_tp_solic.Enabled := True;
                 btn_salvar.Visible      := True;
                 mi_salvar.Visible       := True;
                 str_relatorio           := 1;
               end;
            2: begin
                 mem_obs.Enabled         := False;
                 mem_ass.Enabled         := False;
                 dbmem_obs.Enabled       := False;
                 grpbox_tp_solic.Enabled := False;
                 btn_salvar.Visible      := False;
                 mi_salvar.Visible       := False;
                 str_relatorio           := 2;
               end;
            5: begin
                 mem_obs.Enabled         := True;
                 mem_ass.Enabled         := True;
                 dbmem_obs.Enabled       := False;
                 grpbox_tp_solic.Enabled := False;
                 btn_salvar.Visible      := False;
                 mi_salvar.Visible       := False;
                 str_relatorio           := 3;
               end;
            6: begin
                 mem_obs.Enabled         := True;
                 mem_ass.Enabled         := False;
                 dbmem_obs.Enabled       := False;
                 grpbox_tp_solic.Enabled := False;
                 btn_salvar.Visible      := False;
                 mi_salvar.Visible       := False;
                 str_relatorio           := 4;
               end;
            7: begin {Por processo}
                 str_relatorio           := 7;
                 dbmem_obs.Enabled       := True;
                 btn_salvar.Visible      := True;
                 mi_salvar.Visible       := True;
               end;
          else
            begin
              mem_obs.Enabled            := True;
              mem_ass.Enabled            := True;
              grpbox_tp_solic.Enabled    := True;
              btn_salvar.Visible         := False;
              mi_salvar.Visible          := False;
              str_relatorio              := 1;
            end;
          end;
          edt_nm_cliente.Text := qry_emp_nac_NM_EMPRESA.AsString;
          AbreNumerario;
        end
        else
        begin
          BoxMensagem('Cliente não cadastrado ou sem Habilitação!', 2);
          edt_nm_cliente.Text := '';
          msk_cd_cliente.SetFocus;
        end;
      end;
    end;
  end
  else
  begin
    edt_nm_cliente.Text := '';
  end;
end;

procedure Tfrm_Impressao_Numerario.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_Impressao_Numerario do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(Sender);
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.btn_co_produtoClick(Sender: TObject);
begin
  with datm_Impressao_Numerario do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(Sender);
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.btn_co_clienteClick(Sender: TObject);
begin
  with datm_Impressao_Numerario do
  begin
    Application.CreateForm(Tfrm_cliente_co, frm_cliente_co );
    with frm_cliente_co do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_cliente_co.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
      msk_cd_clienteExit(Sender);
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Dados de Emissão de Solicitação }
  Application.CreateForm(Tdatm_Impressao_Numerario, datm_Impressao_Numerario );

  msk_cd_unid_neg.Text  := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  msk_cd_produto.Text   := str_cd_produto;
  msk_cd_produtoExit(nil);

  msk_dt_movimento.Text := DateToStr(Date);

  with datm_Impressao_Numerario do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
    qry_emp_nac_.Close;
    qry_emp_nac_.Prepare;
    qry_emp_nac_.Open;
  end;
end;

procedure Tfrm_Impressao_Numerario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_Impressao_Numerario do
  begin
    qry_numerario_.Close;
    qry_unid_neg_produto_.Close;
    qry_cliente_hab_.Close;
    qry_cliente_contato_.Close;
    qry_processo_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_emp_nac_.Close;
//    Destroy;
    Free;
  end;
  crp_Numerario.Free;
  Action := caFree;
end;

procedure Tfrm_Impressao_Numerario.btn_sairClick(Sender: TObject);
begin
  if datm_Impressao_Numerario.qry_numerario_.State in [dsEdit] then
     datm_Impressao_Numerario.qry_numerario_.Post;
  Close;
end;

procedure Tfrm_Impressao_Numerario.AbreNumerario;
begin
  with datm_Impressao_Numerario do
  begin
    if ( msk_cd_unid_neg.Text <> '' ) and ( msk_cd_produto.Text <> '' ) and
       ( msk_cd_cliente.Text <> '' ) and ( msk_dt_movimento.Text <> '' ) then
    begin

      qry_cliente_hab_.Close;
      qry_cliente_hab_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
      qry_cliente_hab_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_cliente_hab_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_cliente_hab_.Prepare;
      qry_cliente_hab_.Open;
      if qry_cliente_hab_IN_ATIVO.AsString = '1' then
      begin
        qry_cont_num_.Close;
        qry_cont_num_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_cont_num_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_cont_num_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
        qry_cont_num_.Prepare;
        qry_cont_num_.Open;
        if qry_cont_num_QT_REGISTROS.AsInteger <= 0 then
        begin
          BoxMensagem('Não existem Solicitações para este Cliente nesta habilitação!', 2);
          msk_cd_unid_neg.SetFocus;
          Exit;
        end;

        qry_processo_.Close;
        qry_processo_.ParamByName('CD_UNID_NEG').AsString      := msk_cd_unid_neg.Text;
        qry_processo_.ParamByName('CD_PRODUTO').AsString       := msk_cd_produto.Text;
        qry_processo_.ParamByName('CD_CLIENTE').AsString       := msk_cd_cliente.Text;
        qry_processo_.ParamByName('DT_SOLICITACAO').AsDateTime := StrToDate( msk_dt_movimento.Text );
        qry_processo_.Prepare;
        qry_processo_.Open;
        qry_processo_.First;

        {Obs.}
        while Not qry_processo_.EOF do
        begin
          if qry_numerario_TX_NUMERARIO_OBS.AsString = '' then
          begin
            {Se não possuir Obs. em Numerário trazer da Habilitação}
            qry_unid_neg_produto_.Close;
            qry_unid_neg_produto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
            qry_unid_neg_produto_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
            qry_unid_neg_produto_.Prepare;
            qry_unid_neg_produto_.Open;

            if qry_unid_neg_produto_IN_ATIVO.AsString = '1' then
            begin
              if Not qry_numerario_.EOF then
              begin
                qry_numerario_.First;
                while not qry_numerario_.EOF do
                begin
                  if Not ( qry_numerario_.State in [dsEdit, dsInsert] ) then
                     qry_numerario_.Edit;

                  mem_obs.Lines.Assign( qry_cliente_hab_TX_NUMERARIO_OBS );
                  if mem_obs.Text = '' then
                  begin
                    {Se não possuir Obs. em Habilitação trazer de UnidXProd }
                    mem_obs.Lines.Assign( qry_unid_neg_produto_TX_NUMERARIO_OBS );
                  end;
                  qry_numerario_TX_NUMERARIO_OBS.Assign(mem_obs.Lines);
                  qry_numerario_.Post;
                  qry_numerario_.Next
                end;
              end;
            end;
          end;
          qry_processo_.Next;
        end;

        qry_processo_.First;
        {Assinatura}
        mem_ass.Lines.Assign( qry_numerario_TX_NUMERARIO_ASS );
        if mem_ass.Text = '' then
        begin
          {Se não possuir Ass. em Numerário trazer da Habilitação}
          qry_unid_neg_produto_.Close;
          qry_unid_neg_produto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_unid_neg_produto_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          qry_unid_neg_produto_.Prepare;
          qry_unid_neg_produto_.Open;

          if qry_unid_neg_produto_IN_ATIVO.AsString = '1' then
          begin
            mem_ass.Lines.Assign( qry_unid_neg_produto_TX_NUMERARIO_ASS );
          end;
        end;
      end
      else
      begin
        BoxMensagem('Esta habilitação não está ativa para este Cliente!', 3);
        msk_cd_unid_neg.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.btn_imprimeClick(Sender: TObject);
var
  nr_identificador: integer;
begin
  if Trim(msk_cd_unid_neg.Text) = '' then
  begin
    BoxMensagem('Informe uma Unidade de Negócio!', 2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if Trim(msk_cd_produto.Text) = '' then
  begin
    BoxMensagem('Informe um Produto!', 2);
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if Trim(msk_cd_cliente.Text) = '' then
  begin
    BoxMensagem('Informe um Cliente!', 2);
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  if datm_Impressao_Numerario.qry_numerario_.State in [dsEdit, dsInsert] then
    datm_Impressao_Numerario.qry_numerario_.Post;

  { Atualizar Totais por Banco }
  if ( ( str_relatorio = 1 ) or
       ( str_relatorio = 7 ) or
       ( str_relatorio = 3 ) ) and
     ( not rbtn_JJ.Checked )then
  begin
    with datm_Impressao_Numerario do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_atz_num_imp);
        sp_atz_num_imp.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        sp_atz_num_imp.ParamByName('@CD_PRODUTO').AsString  := msk_cd_produto.Text;
        sp_atz_num_imp.ParamByName('@CD_CLIENTE').AsString  := msk_cd_cliente.Text;
        ExecStoredProc(sp_atz_num_imp);
        nr_identificador := sp_atz_num_imp.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_atz_num_imp);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Exit;
        end;
      end;
    end;
  end
  else
  begin
    nr_identificador := 0;
  end;

  {Alterações feita para a solicitação da Avon - Rodrigo}
    case str_relatorio of
    1, 3:
      begin
        with datm_Impressao_Numerario do
        begin
          qry_processo_.First;
          while Not qry_processo_.EOF do
          begin
            qry_numerario_.First;
            while Not qry_numerario_.EOF do
            begin
              qry_numerario_.Edit;
              if qry_numerario_IN_EMITIDO.AsString = '0' then
              begin
                qry_numerario_TX_NUMERARIO_OBS.Assign(mem_obs.Lines);
                qry_numerario_TX_NUMERARIO_ASS.Assign(mem_ass.Lines);
              end;
              qry_numerario_.Post;
              qry_numerario_.Next;
            end;
            qry_processo_.Next;
          end;
        end;
      end;
    2:begin

      end;
    end;

  if ( str_relatorio = 1 ) or ( str_relatorio = 7 ) then
  begin
    if rbtn_JJ.Checked then
    begin
      Gera_Arquivo_JJ;
    end
    else
    begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      with crp_Numerario do
      begin
        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

        if rbtn_normal.Checked and ( str_relatorio = 1 ) then
        begin
          ReportName  := cDir_Rpt + '\CRNM003.RPT';
          ReportTitle := 'Solicitação de Numerário';
          Formulas[0] := 'nr_identificador = ' + IntToStr( nr_identificador );
          Formulas[1] := 'Totais = "0"';
        end
        else
        if rbtn_normal.Checked and ( str_relatorio = 7 ) then
        begin
          ReportName  := cDir_Rpt + '\CRNM009.RPT';
          ReportTitle := 'Solicitação de Numerário';
          Formulas[0] := 'nr_identificador = ' + IntToStr( nr_identificador );
          Formulas[1] := 'Totais = "0"';
        end
        else
        if rbtn_totais.Checked then
        begin
          ReportName  := cDir_Rpt + '\CRNM003.RPT';
          ReportTitle := 'Solicitação de Numerário - Totais';
          Formulas[0] := 'nr_identificador = ' + IntToStr( nr_identificador );
          Formulas[1] := 'Totais = "1"';
        end
        else
        if rbtn_Item.Checked then
        begin
          Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
          ReportName  := cDir_Rpt + '\CRNM005.RPT';
          ReportTitle := 'Solicitação de Numerário - Item';
          Formulas[0] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
          Formulas[1] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
          Formulas[2] := 'Produto = "'+ msk_cd_produto.Text + '"';
          Formulas[3] := 'Totais = "0"';
        end;
        Execute;
      end;
    end;
  end;

  if str_relatorio = 3 then
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Numerario do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRNM007.RPT';
      Formulas[0] := 'nr_identificador = ' + IntToStr( nr_identificador );

      Execute;
    end;
  end;

  if str_relatorio = 4 then
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    Gera_Arquivo_Raychem;
  end;

  Screen.Cursor := crDefault;

  with datm_Impressao_Numerario do
  begin
    if ( qry_numerario_.State in [dsEdit] ) then qry_numerario_.Post;
    qry_processo_.First;
    while Not qry_processo_.EOF do
    begin
      qry_numerario_.First;
      while Not qry_numerario_.EOF do
      begin
        qry_numerario_.Edit;
        if qry_numerario_IN_EMITIDO.AsString = '0' then
        begin
          datm_Impressao_Numerario.qry_numerario_NR_SOLICITACAO.AsString;
          qry_numerario_IN_EMITIDO.AsString   := '1';
          qry_numerario_DT_EMISSAO.AsDateTime := Date;
          {procedimento de impressão}
          if str_relatorio = 2 then
            imprime_avon;
        end;
        if qry_numerario_DT_EMISSAO.IsNull then
           qry_numerario_IN_EMITIDO.AsString := '0';
        qry_numerario_.Post;
        qry_numerario_.Next;
      end;
      qry_processo_.Next;
    end;
  end;

  with datm_Impressao_Numerario.qry_apaga_dados do
  begin
    ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    Prepare;
    ExecSQL;
  end;
end;

procedure Tfrm_Impressao_Numerario.msk_dt_movimentoExit(Sender: TObject);
begin
  if ( msk_dt_movimento.Text <> '' ) and
     ( msk_dt_movimento.Text <> '  /  /    ' ) and
     ( msk_dt_movimento.Text <> num_dt_base ) then
  begin
    try
      StrToDate( msk_dt_movimento.Text );
      AbreNumerario;
    except
      BoxMensagem('Data Inválida!', 2);
      msk_dt_movimento.SetFocus;
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_Impressao_Numerario.Imprime_Avon;
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_Numerario, datm_Impressao_Numerario do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    qry_ref_cli_.ParamByName('nr_processo').AsString:=
      datm_Impressao_Numerario.qry_numerario_NR_PROCESSO.AsString;
    qry_ref_cli_.prepare;
    qry_ref_cli_.open;

    qry_avon_.ParamByName('nr_processo').AsString       :=
      datm_Impressao_Numerario.qry_numerario_NR_PROCESSO.AsString;
    qry_avon_.ParamByName('nr_solicitacao').AsString    :=
      datm_Impressao_Numerario.qry_numerario_NR_SOLICITACAO.AsString;
    qry_avon_.ParamByName('cd_grp_item_arm').AsString   := str_cd_grp_item_arm;
    qry_avon_.ParamByName('cd_grp_item_cap').AsString   := str_cd_grp_item_cap;
    qry_avon_.ParamByName('cd_grp_item_frete').AsString := str_cd_grp_item_frete;
    qry_avon_.ParamByName('cd_item_icms').AsString      := str_cd_item_icms;
    qry_avon_.ParamByName('cd_item_ii').AsString        := str_cd_item_ii;
    qry_avon_.ParamByName('cd_item_ipi').AsString       := str_cd_item_ipi;
    qry_avon_.ParamByName('cd_item_afrmm').AsString     := str_cd_item_afrmm;
    qry_avon_.ParamByName('cd_item_sda').AsString       := str_cd_item_sda;
    qry_avon_.ParamByName('cd_item_siscomex').AsString  := str_cd_item_siscomex;
    qry_avon_.Prepare;
    qry_avon_.Open;

    Formulas[0] := 'nr_solicitacao = "' +
      datm_Impressao_Numerario.qry_numerario_NR_SOLICITACAO.AsString + '"';
    Formulas[1] := 'nr_processo = "' +
      datm_Impressao_Numerario.qry_numerario_NR_PROCESSO.AsString + '"';
    Formulas[2] := 'i_icms = ' +
      VporPDecimal(FloatToStr(qry_avon_vl_icms.AsFloat));
    Formulas[3] := 'ref_cli = "' + qry_ref_cli_CD_REFERENCIA.AsString + '"';

//    Formulas[2] := 'i_armazen = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_armazen.AsFloat));
//    Formulas[3] := 'i_capatazias = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_cap.AsFloat));
//    Formulas[4] := 'i_frete = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_frete.AsFloat));
//    Formulas[5] := 'i_icms = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_icms.AsFloat));
//    Formulas[6] := 'i_ii = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_ii.AsFloat));
//    Formulas[7] := 'i_ipi = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_ipi.AsFloat));
//    Formulas[8] := 'i_mar_mercante = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_afrmm.AsFloat));
//    Formulas[9] := 'i_sda = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_sda.AsFloat));
//    Formulas[10] := 'i_siscomex = ' +
//      VporPDecimal(FloatToStr(qry_avon_vl_siscomex.AsFloat));
//    Formulas[11] := 'ref_cli = "' + qry_ref_cli_CD_REFERENCIA.AsString + '"';

    qry_ref_cli_.close;
    qry_avon_.close;

    ReportName   := cDir_Rpt + '\CRNM006.RPT';
//    Destination  := toFile;
//    PrintFileType:= WordForWindows;
//    PrintFileName:= cDir_Rpt + '\' +
//                    datm_Impressao_Numerario.qry_numerario_NR_PROCESSO.AsString +
//                    datm_Impressao_Numerario.qry_numerario_NR_SOLICITACAO.AsString +
//                    '.DOC';
    Execute;
  end;
  Screen.Cursor := crDefault;
end;

function Tfrm_Impressao_Numerario.VporPDecimal(Valor:String):String;
var cont, tamanho:byte;
begin
  tamanho:= Length(Valor);
  for cont:= 1 to tamanho do
    if Valor[cont] = ',' then Valor[cont]:= '.';
  VporPDecimal := Valor;
end;

procedure Tfrm_Impressao_Numerario.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_Impressao_Numerario.Gera_Arquivo_JJ;
var Arquivo : TFileText;
    c1 : String;
    p1: Array[0..1024] of Char;
    str_ref : String[55];
begin
  with datm_Impressao_Numerario do
  begin
    qry_numerario_item_.Close;
    qry_numerario_item_.UnPrepare;
    qry_numerario_item_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
    qry_numerario_item_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_numerario_item_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_numerario_item_.Prepare;
    qry_numerario_item_.Open;

    if qry_numerario_item_.RecordCount = 0 then
    begin
      BoxMensagem('Nenhuma solicitação selecionada!', 2);
      Exit;
    end
    else
    begin
      Arquivo := TFileText.Create;
      Arquivo.Name := cDir_Contab + '\NUMERARIO.TXT';
      Arquivo.CreateFile;
      qry_numerario_item_.First;
      while Not qry_numerario_item_.EOF do
      begin
        qry_ref_cli_.Close;
        qry_ref_cli_.ParamByName('nr_processo').AsString := qry_numerario_item_NR_PROCESSO.AsString;
        qry_ref_cli_.Prepare;
        qry_ref_cli_.Open;
        str_ref := '';
        while Not qry_ref_cli_.EOF do
        begin
          if Length(Trim(str_ref)+'; '+Trim(qry_ref_cli_CD_REFERENCIA.AsString)) <= 55 then
          begin
            if str_ref <> '' then
              str_ref := str_ref + '; ';
            str_ref := str_ref + Trim(qry_ref_cli_CD_REFERENCIA.AsString);
          end;
          qry_ref_cli_.Next;
        end;
        c1 := '001SM    ' + qry_numerario_item_NR_PROCESSO.AsString + '    ';
        c1 := c1 + FormatDateTime('ddmmyyyy',qry_numerario_item_DT_SOLICITACAO.AsDatetime);
        c1 := c1 + qry_numerario_item_CD_ITEM.AsString + '  ';
        c1 := c1 + FStrSpace(qry_numerario_item_NM_ITEM.AsString, 30);
        c1 := c1 + FFloatToStr( qry_numerario_item_VL_TOT_ITEM.AsFloat, 13, 2);
        if qry_numerario_item_IN_SM.AsString = '1' then
           c1 := c1 + 'CCD'
        else
           c1 := c1 + 'DDC';
        c1 := c1 + FStrSpace(qry_numerario_item_NR_BANCO.AsString, 3);
        c1 := c1 + Space(26);
        c1 := c1 + FStrSpace(qry_numerario_item_CD_AGENCIA.AsString, 6);
        c1 := c1 + FStrSpace(str_ref, 55);
        c1 := c1 + Space(8);
        c1 := c1 + #13#10;
        StrPCopy( p1, c1);
        Arquivo.Write( p1 );
        qry_numerario_item_.Next;
      end;
      BoxMensagem('Arquivo ' + Arquivo.Name + ' gerado com sucesso!', 3);

      Arquivo.Close;
      Arquivo.Free;
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.Gera_Arquivo_Raychem;
var Arquivo : TFileText;
    c1, str_totais, cTexto1, cTexto2 : String;
    p1: Array[0..1024] of Char;
    nr_linhas, nr_linhas_memo, nr_colunas, npos: Integer;
    vl_total_proc : Double;
begin
  Application.ProcessMessages;
  with datm_Impressao_Numerario do
  begin
    qry_numerario_item_.Close;
    qry_numerario_item_.UnPrepare;
    qry_numerario_item_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
    qry_numerario_item_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_numerario_item_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_numerario_item_.Prepare;
    qry_numerario_item_.Open;

    if qry_numerario_item_.RecordCount = 0 then
    begin
      BoxMensagem('Nenhuma solicitação selecionada!', 2);
      Exit;
    end
    else
    begin
      Arquivo      := TFileText.Create;
      Arquivo.Name := cDir_Contab + '\NUMERARIO.TXT';
      Arquivo.CreateFile;

      {Linhas X Colunas}
      {Linhas do Campo Memo}
      cTexto1 := qry_numerario_TX_NUMERARIO_OBS.AsString;
      npos    := Length( cTexto1 );
      nr_linhas_memo := 0;
      while npos > 0 do
      begin
        npos  := nAt ( #13 , cTexto1 );
        if npos > 0 then
        begin
          cTexto2 := Copy ( cTexto1 , 1 , ( npos - 1 ) );
          cTexto1 := Copy ( cTexto1 , ( npos + 1 ) , ( length( cTexto1 ) - npos ) );
        end
        else
        begin
          cTexto2 := cTexto1;
          cTexto1 := '';
        end;
        if Copy ( cTexto1 , 1 , 1 ) = #10 then cTexto1 := Copy ( cTexto1 , 2 , length (cTexto1) );
        npos := length( cTexto1 );

        nr_linhas_memo := nr_linhas_memo + 1;
      end;

      qry_proc_distintos_.Close;
      qry_proc_distintos_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_proc_distintos_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_proc_distintos_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
      qry_proc_distintos_.Prepare;
      qry_proc_distintos_.Open;
      qry_proc_distintos_.First;
      nr_linhas := 0;
      while Not qry_proc_distintos_.EOF do
      begin
        nr_linhas := nr_linhas + 1;
        qry_proc_distintos_.Next;
      end;

      qry_itens_distintos_.Close;
      qry_itens_distintos_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_itens_distintos_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_itens_distintos_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
      qry_itens_distintos_.Prepare;
      qry_itens_distintos_.Open;
      qry_itens_distintos_.First;
      nr_colunas := 0;
      while Not qry_itens_distintos_.EOF do
      begin
        nr_colunas := nr_colunas + 1;
        qry_itens_distintos_.Next;
      end;
      str_totais := IntToStr( nr_linhas ) + ';' +
                    IntToStr( nr_colunas ) + ';' +
                    IntToStr( nr_linhas_memo ) + #13#10;
      StrPCopy( p1, str_totais );
      Arquivo.Write( p1 );

      {Cabeçalho}
      c1 := edt_nm_unid_neg.Text + #13#10#13#10 + ';' + FormatDateTime('dd/mm/yyyy', Date ) + #13#10;
      c1 := c1 + 'PARA:;' + msk_cd_cliente.Text + ' - ' + edt_nm_cliente.Text + #13#10;
      c1 := c1 + 'FAX:;' + qry_cliente_contato_NR_FAX.AsString + #13#10;
      c1 := c1 + 'ATENÇÃO:;' + qry_cliente_contato_NM_CONTATO.AsString + #13#10;
      c1 := c1 + 'ASSUNTO:;' + 'SOLICITAÇÃO DE NUMERÁRIO' + #13#10#13#10#13#10#13#10;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      {Cabeçalho dos itens}
      c1 := 'GSM;FOB;';
      qry_itens_distintos_.First;
      while Not qry_itens_distintos_.EOF do
      begin
        if ( qry_itens_distintos_NM_APELIDO.IsNull ) or ( qry_itens_distintos_NM_APELIDO.AsString = '' ) then
           c1 := c1 + qry_itens_distintos_CD_ITEM.AsString + ';'
        else
           c1 := c1 + qry_itens_distintos_NM_APELIDO.AsString + ';';
        StrPCopy( p1, c1);
        Arquivo.Write( p1 );
        c1 := '';
        qry_itens_distintos_.Next;
      end;
      c1 := c1 + 'TOTAL' + #13#10;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      qry_proc_distintos_.First;
      while Not qry_proc_distintos_.EOF do
      begin
        qry_fob_.Close;
        qry_fob_.Prepare;
        qry_fob_.Open;
        c1 := qry_numerario_Calc_Nr_Processo.AsString + ';';
        c1 := c1 + FormatFloat( '#0.00', qry_fob_VL_MLE_MN.AsFloat ) + ';';
        StrPCopy( p1, c1 );
        Arquivo.Write( p1 );
        vl_total_proc := 0;
        {Itens}
        qry_itens_distintos_.First;
        while Not qry_itens_distintos_.EOF do
        begin
          qry_proc_item_num_.Close;
          qry_proc_item_num_.ParamByName('NR_PROCESSO').AsString := qry_proc_distintos_NR_PROCESSO.AsString;
          qry_proc_item_num_.ParamByName('CD_ITEM').AsString     := qry_itens_distintos_CD_ITEM.AsString;
          qry_proc_item_num_.Prepare;
          qry_proc_item_num_.Open;
          if qry_proc_item_num_.RecordCount > 0 then
          begin
            c1 := FormatFloat( '#0.00', qry_proc_item_num_VL_TOT_ITEM.AsFloat ) + ';';
            vl_total_proc := vl_total_proc + qry_proc_item_num_VL_TOT_ITEM.AsFloat;
          end
          else
          begin
            c1 := '0' + ';';
          end;
          StrPCopy( p1, c1);
          Arquivo.Write( p1 );
          qry_itens_distintos_.Next;
        end;
        c1 := FormatFloat( '#0.00', vl_total_proc ) + ';' + #13#10;
        StrPCopy( p1, c1);
        Arquivo.Write( p1 );
        qry_proc_distintos_.Next;
      end;
      c1 := 'TOTAL GERAL' + #13#10#13#10#13#10#13#10;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      {Observação}
      cTexto1 := qry_numerario_TX_NUMERARIO_OBS.AsString;
      npos    := length( cTexto1 );
      while npos > 0 do
      begin
        npos  := nAt ( #13 , cTexto1 );
        if npos > 0 then
          begin
            cTexto2 := Copy ( cTexto1 , 1 , ( npos - 1 ) );
            cTexto1 := Copy ( cTexto1 , ( npos + 1 ) , ( length( cTexto1 ) - npos ) );
          end
        else
        begin
          cTexto2 := cTexto1;
          cTexto1 := '';
        end;
        if Copy ( cTexto1 , 1 , 1 ) = #10 then cTexto1 := Copy ( cTexto1 , 2 , length (cTexto1) );
        npos := length( cTexto1 );

        c1 := cTexto2 + #13#10;
        StrPCopy( p1, c1);
        Arquivo.Write( p1 );
      end;

      c1 := #13#10#13#10#13#10 + 'ASS.' + #13#10 + 'Requisitado por;;;Aprovado por' + #13#10 +
            'Data;____/____/________;;Data;____/____/________' + #13#10;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      if FileExists('C:\PROG\GSM\NUMERARIO.XLS') then
         DeleteFile('C:\PROG\GSM\NUMERARIO.XLS');

      if BoxMensagem('Numerário Gerado com sucesso!' + #13#10 +
                     'Deseja abri-lo no Excel?' , 1) then
         ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\NUMMOD06.XLS' ), '', SW_MAXIMIZE );

      Arquivo.Close;
      Arquivo.Free;
    end;
  end;
end;

procedure Tfrm_Impressao_Numerario.FormShow(Sender: TObject);
begin
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_Impressao_Numerario.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  try
    datm_main.db_broker.StartTransaction;
    if datm_Impressao_Numerario.qry_numerario_.State in [dsEdit, dsInsert] then
       datm_Impressao_Numerario.qry_numerario_.Post;

    mem_obs.Lines.Assign( datm_Impressao_Numerario.qry_numerario_TX_NUMERARIO_OBS );
    mem_ass.Lines.Assign( datm_Impressao_Numerario.qry_numerario_TX_NUMERARIO_ASS );

    datm_main.db_broker.Commit;
  except
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
  end;
  btn_salvar.Enabled := False;
  mi_salvar.Enabled  := False;
end;

procedure Tfrm_Impressao_Numerario.dbmem_obsChange(Sender: TObject);
begin
  if ( datm_Impressao_Numerario.qry_numerario_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_salvar.Enabled := True;
    mi_salvar.Enabled  := True;
  end;
end;

procedure Tfrm_Impressao_Numerario.msk_cd_unid_negEnter(Sender: TObject);
begin
  num_cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_Impressao_Numerario.msk_cd_produtoEnter(Sender: TObject);
begin
  num_cd_produto := msk_cd_produto.Text;
end;

procedure Tfrm_Impressao_Numerario.msk_cd_clienteEnter(Sender: TObject);
begin
  num_cd_cliente := msk_cd_cliente.Text;
end;

procedure Tfrm_Impressao_Numerario.msk_dt_movimentoEnter(Sender: TObject);
begin
  num_dt_base := msk_dt_movimento.Text;
end;

end.
