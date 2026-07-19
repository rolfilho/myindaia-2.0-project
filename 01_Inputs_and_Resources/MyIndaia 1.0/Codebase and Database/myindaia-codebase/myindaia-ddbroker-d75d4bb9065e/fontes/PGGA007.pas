unit PGGA007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, Menus, doslib, DB, Printers, Funcoes;

type
  Tfrm_imp_darf = class(TForm)
    pnl_financeiro: TPanel;
    btn_sair: TSpeedButton;
    btn_imprimir: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_imprime: TMenuItem;
    mi_sair: TMenuItem;
    pnl_emissao: TPanel;
    lbl_processo: TLabel;
    btn_co_processo: TSpeedButton;
    lbl_cod_receita: TLabel;
    edt_vl_principal: TEdit;
    Label1: TLabel;
    Mensagem: TStatusBar;
    msk_nr_processo: TMaskEdit;
    msk_cd_receita: TMaskEdit;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    Label4: TLabel;
    edt_vl_multa: TEdit;
    Label5: TLabel;
    edt_vl_juros: TEdit;
    mem_motivo: TMemo;
    lbl_motivo: TLabel;
    edt_nm_cliente: TEdit;
    lbl_vl_total: TLabel;
    edt_vl_total: TEdit;
    btn_co_motivo: TSpeedButton;
    procedure btn_imprimirClick(Sender: TObject);
    procedure AtualizaTotal;
    procedure GeraArquivoDARF;
    procedure btn_sairClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure edt_vl_principalEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_vl_principalExit(Sender: TObject);
    function habilita_printer:boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure edt_vl_multaEnter(Sender: TObject);
    procedure edt_vl_jurosEnter(Sender: TObject);
    procedure edt_vl_multaExit(Sender: TObject);
    procedure edt_vl_jurosExit(Sender: TObject);
    procedure btn_co_motivoClick(Sender: TObject);
  private
    function Tira_Ponto( Str: String ): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_imp_darf: Tfrm_imp_darf;

implementation

uses PGGP001, GSMLIB, PGGA008, PGSM010, PGSM018, PGSM174, PGSM104, PGSM119,
     PGGP015, PGSM136, ConsOnLineEx, PGGP017;

{$R *.DFM}

var  str_cr, str_cnpj_importador, str_referencia, str_tel_unid_neg,
     str_cd_urf_despacho, str_ident, str_ident_master : String;
     str_vl_principal, str_vl_multa, str_vl_juros: String;

procedure Tfrm_imp_darf.btn_imprimirClick(Sender: TObject);
begin
  if Not habilita_printer then
  begin
    BoxMensagem( 'Dados insuficientes para emissão do DARF!', 2 );
    Exit;
  end;

  if datm_imp_darf.qry_ajuste_impressao_.EOF then
  begin
    BoxMensagem( 'Ajuste de Impressão não está configurado para esta Unidade de Negócio !!', 3 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  Mensagem.SimpleText := 'Gerando Arquivo do DARF...';
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  GeraArquivoDARF();

  Screen.Cursor := crDefault;
  Application.ProcessMessages;

  Mensagem.SimpleText := 'Arquivo gerado com sucesso.';

  if msk_cd_grupo.Color = clWindow then msk_cd_grupo.SetFocus
  else msk_cd_cliente.SetFocus;

end;

procedure Tfrm_imp_darf.GeraArquivoDARF;
var
  dt_fim_mes, str_conhecimento : String;
begin
  str_cr := #13#10;
  {Inicializa}
  try
    with datm_imp_darf do
    begin

      rp_darf.SetToDefaultPrinter;
      rp_darf.BeginDoc;

      rp_darf.Say( 01, 01, #27#64#27#67#0#4#15 );

      {Período de Apuração}
      if FormatDateTime( 'mm', dt_server ) = '12' then dt_fim_mes := '31/12/' + FormatDateTime( 'yyyy', dt_server )
      else
      begin
        if StrToInt( FormatDateTime( 'mm', dt_server ) ) >= 9 then
           dt_fim_mes := '01/' + IntToStr( StrToInt( FormatDateTime( 'mm', dt_server ) ) + 1 ) + '/' + FormatDateTime( 'yyyy', dt_server )
        else
           dt_fim_mes := '01/' + '0' + IntToStr( StrToInt( FormatDateTime( 'mm', dt_server ) ) + 1 ) + '/' + FormatDateTime( 'yyyy', dt_server );
        dt_fim_mes := FormatDateTime( 'dd/mm/yyyy', StrToDate( dt_fim_mes ) - 1 );
      end;

      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_PERIODO.AsString),
                   StrToInt(qry_ajuste_impressao_C_PERIODO.AsString),
                   dt_fim_mes );

      {CPF ou CNPJ}
      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_CPF_CNPJ.AsString),
                   StrToInt(qry_ajuste_impressao_C_CPF_CNPJ.AsString),
                   Copy( str_cnpj_importador, 1, 2 ) + '.' + Copy( str_cnpj_importador, 3, 3 ) + '.' +
                   Copy( str_cnpj_importador, 6, 3 ) + '/' + Copy( str_cnpj_importador, 9, 4 ) + '-' +
                   Copy( str_cnpj_importador, 13, 2 ) );

      {N/REF + Código da Receita}
      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_N_REF.AsString),
                   StrToInt(qry_ajuste_impressao_C_N_REF.AsString),
                   Trim( msk_nr_processo.Text ) );

      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_N_REF.AsString),
                   StrToInt(qry_ajuste_impressao_C_CD_RECEITA.AsString),
                   Trim( msk_cd_receita.Text ) );

      {S/REF}
      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_S_REF.AsString),
                   StrToInt(qry_ajuste_impressao_C_S_REF.AsString),
                   str_referencia );

      {Numero de Referencia}
      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_NR_REF.AsString),
                   StrToInt(qry_ajuste_impressao_C_NR_REF.AsString),
                   str_cd_urf_despacho );

      {Importador}
      if Trim( edt_nm_cliente.Text ) <> '' then
      begin
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_IMPORTADOR.AsString),
                     StrToInt(qry_ajuste_impressao_C_IMPORTADOR.AsString),
                     Trim( edt_nm_cliente.Text ) );
      end
      else
      begin
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_IMPORTADOR.AsString),
                     StrToInt(qry_ajuste_impressao_C_IMPORTADOR.AsString),
                     Trim( edt_nm_grupo.Text ) );
      end;

      {Telefone da Unidade de Negócio}
      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_TEL_UNIDADE.AsString),
                   StrToInt(qry_ajuste_impressao_C_TEL_UNIDADE.AsString),
                   'Telefone.: ' +  Trim( str_tel_unid_neg ) +
                    Space( 103 - Length( Trim( str_tel_unid_neg ) ) ) );

      {Data do Vencimento}
      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_DT_VENCTO.AsString),
                   StrToInt(qry_ajuste_impressao_C_DT_VENCTO.AsString),
                   dt_fim_mes );

      {Master/Filhote/Valor Principal}
      qry_servico_.Close;
      qry_servico_.ParamByName( 'NR_PROCESSO' ).AsString := msk_cd_unid_neg.Text +  msk_cd_produto.Text +
                                                            msk_nr_processo.Text;
      qry_servico_.Prepare;
      qry_servico_.Open;

      if Trim( qry_servico_CD_VIA_TRANSPORTE.AsString ) = '07' then
        str_conhecimento := 'Ident.:' + Trim( str_ident )
      else
        str_conhecimento := 'Ident.:' + Trim( str_ident ) + ' Ident. do Master: ' + Trim( str_ident );
      if Trim( edt_vl_principal.Text ) <> '' then
      begin
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_MASTER.AsString),
                     StrToInt(qry_ajuste_impressao_C_MASTER.AsString),
                     str_conhecimento );
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_MASTER.AsString),
                     StrToInt(qry_ajuste_impressao_C_VL_PRINC.AsString),
                     Space( 10 - Length( Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_principal.Text ) ) ) ) ) ) +
                     Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_principal.Text ) ) ) ) );
      end
      else
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_MASTER.AsString),
                     StrToInt(qry_ajuste_impressao_C_MASTER.AsString),
                     str_conhecimento );
      qry_servico_.Close;

      {Linha 1 do motivo/Valor da multa}
      if Trim( edt_vl_multa.Text ) <> '' then
      begin
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_LINHA_MOTIVO1.AsString),
                     StrToInt(qry_ajuste_impressao_C_LINHA_MOTIVO1.AsString),
                     Trim( mem_motivo.Lines.Strings[0] ) );
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_LINHA_MOTIVO1.AsString),
                     StrToInt(qry_ajuste_impressao_C_VL_MULTA.AsString),
                     Space( 10 - Length( Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_multa.Text ) ) ) ) ) ) +
                     Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_multa.Text ) ) ) ) );
      end
      else
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_LINHA_MOTIVO1.AsString),
                     StrToInt(qry_ajuste_impressao_C_LINHA_MOTIVO1.AsString),
                     Trim( mem_motivo.Lines.Strings[0] ) );

      {Linha 2 do motivo}
      rp_darf.Say( StrToInt(qry_ajuste_impressao_L_LINHA_MOTIVO2.AsString),
                   StrToInt(qry_ajuste_impressao_C_LINHA_MOTIVO2.AsString),
                   Trim( mem_motivo.Lines.Strings[1] ) );


      {Valor dos Juros}
      if Trim( edt_vl_juros.Text ) <> '' then
      begin
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_VL_JUROS.AsString),
                     StrToInt(qry_ajuste_impressao_C_VL_JUROS.AsString),
                     Space( 10 - Length( Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_juros.Text ) ) ) ) ) ) +
                     Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_juros.Text ) ) ) ) );
      end;

      {Valor Total}
      if Trim( edt_vl_total.Text ) <> '' then
      begin
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_VL_TOTAL.AsString),
                     StrToInt(qry_ajuste_impressao_C_VL_TOTAL.AsString),
                     Space( 10 - Length( Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_total.Text ) ) ) ) ) ) +
                     Trim( FormatFloat( '###,###,###,##0.00', StrToFloat( Tira_Ponto( edt_vl_total.Text ) ) ) ) + #12 );
      end
      else
      begin
        rp_darf.Say( StrToInt(qry_ajuste_impressao_L_VL_TOTAL.AsString),
                     StrToInt(qry_ajuste_impressao_C_VL_TOTAL.AsString),
                     #12 );
      end;
    end;
  except
    Mensagem.SimpleText := 'Erro na geração do Arquivo de Cheques';
    datm_imp_darf.rp_darf.EndDoc;
    Exit
  end;

  datm_imp_darf.rp_darf.EndDoc;
  Mensagem.SimpleText := 'Arquivo gerado com sucesso.';
end;

procedure Tfrm_imp_darf.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_darf.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_darf.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_imp_darf.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_imp_darf do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text +  msk_cd_produto.Text +
         msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.EOF then
      begin
        msk_nr_processo.Text := '';
        BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end;
      str_referencia      := qry_processo_.FieldByName('CD_REFERENCIA').AsString;
      str_cd_urf_despacho := qry_processo_.FieldByName('CD_URF_DESPACHO').AsString + '-' +
                             qry_processo_.FieldByName('CD_DIGITO').AsString;
      str_cd_urf_despacho := Copy( str_cd_urf_despacho, 1, 2 ) + '.' +
                             Copy( str_cd_urf_despacho, 3, 1 ) + '.' +
                             Copy( str_cd_urf_despacho, 4, 2 ) + '.' +
                             Copy( str_cd_urf_despacho, 6, 4 );
      str_ident           := qry_processo_.FieldByName('NR_DCTO_CARGA').AsString;
      str_ident_master    := qry_processo_.FieldByName('NR_DCTO_CARGA_MAST').AsString;
    end;
  end;
end;

procedure Tfrm_imp_darf.edt_vl_principalEnter(Sender: TObject);
begin
  edt_vl_principal.Text := str_vl_principal;
end;

procedure Tfrm_imp_darf.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_imp_darf, datm_imp_darf);
  str_vl_principal    := '';
  str_vl_multa        := '';
  str_vl_juros        := '';
  str_cnpj_importador := '';
  str_referencia      := '';
  str_tel_unid_neg    := '';
  str_cd_urf_despacho := '';
  str_ident           := '';
  str_ident_master    := '';
end;

procedure Tfrm_imp_darf.edt_vl_principalExit(Sender: TObject);
begin
  if Trim( edt_vl_principal.Text ) <> '' then
  begin
     edt_vl_principal.Text := Tira_Ponto(edt_vl_principal.Text);
     try
       edt_vl_principal.Text := FormatFloat('#0.00', StrToCurr(edt_vl_principal.Text));
       AtualizaTotal;
     except
       on EConvertError do
       begin
         BoxMensagem('Valor do Principal inválido',2);
         edt_vl_principal.SetFocus;
         edt_vl_principal.SelectAll;
         Exit;
       end;
    end;
    str_vl_principal := edt_vl_principal.Text;
  end;
end;

function Tfrm_imp_darf.habilita_printer : Boolean;
begin
  habilita_printer := True;
  if Trim(msk_cd_receita.Text)        = ''         then habilita_printer := False;
  if ( Trim( msk_cd_grupo.Text ) = '' ) and
     ( Trim( msk_cd_cliente.Text ) = '' )          then habilita_printer := False;
  if Trim(msk_nr_processo.Text)       = ''         then habilita_printer := False;
  if Trim(edt_vl_total.Text)          = ''         then habilita_printer := False;
end;

procedure Tfrm_imp_darf.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_imp_darf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_imp_darf do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_processo_.Close;
    Free;
  end;
  Action := caFree;
end;

function Tfrm_imp_darf.Tira_Ponto(Str:String):String;
begin
  while Pos('.',Str) <> 0 do
    delete(str, Pos('.',Str), 1);
  Tira_Ponto:= Str;
end;

procedure Tfrm_imp_darf.FormShow(Sender: TObject);
begin
  pnl_financeiro.Color := clMenuBroker;
  with datm_imp_darf do
  begin
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text := str_cd_produto;
    msk_cd_produtoExit(nil);
    msk_cd_receita.Text := '2185';
    msk_cd_grupo.SetFocus;
  end;
end;

procedure Tfrm_imp_darf.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then edt_nm_unid_neg.Text := '';
  ValCodEdt( msk_cd_unid_neg );
  with datm_imp_darf.qry_unid_neg_ do
  begin
    if msk_cd_unid_neg.Text <> '' then
    begin
      Close;
      SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      Prepare;
      Open;
      if Not EOF then
      begin
        edt_nm_unid_neg.Text := FieldByName('NM_UNID_NEG').AsString;
        str_tel_unid_neg     := FieldByName('NR_FONE').AsString;

        datm_imp_darf.qry_ajuste_impressao_.Close;
        datm_imp_darf.qry_ajuste_impressao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        datm_imp_darf.qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := '001';
        datm_imp_darf.qry_ajuste_impressao_.Prepare;
        datm_imp_darf.qry_ajuste_impressao_.Open;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end
    end
    else
    begin
      edt_nm_unid_neg.Text := '';
    end;
  end;
end;

procedure Tfrm_imp_darf.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  with datm_imp_darf.qry_produto_ do
  begin
    if msk_cd_produto.Text <> '' then
    begin
      Close;
      SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
      Prepare;
      Open;
      if Not EOF then
      begin
        edt_nm_produto.Text := FieldByName('NM_PRODUTO').AsString;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        msk_cd_produto.SetFocus;
      end
    end
    else
    begin
      edt_nm_produto.Text := '';
    end;
  end;
end;

procedure Tfrm_imp_darf.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    edt_nm_grupo.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_imp_darf.qry_grupo_ do
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
      edt_nm_grupo.Text   := FieldByName('NM_GRUPO').AsString;
      str_cnpj_importador := FieldByName('CNPJ_GRUPO').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_imp_darf.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_imp_darf.qry_cliente_ do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if EOF then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else
    begin
      edt_nm_cliente.Text := FieldByName('NM_EMPRESA').AsString;
      str_cnpj_importador := FieldByName('CGC_EMPRESA').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_imp_darf.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_nr_processo then btn_co_processoClick(nil);
    if Sender = mem_motivo      then btn_co_motivoClick(nil);
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

procedure Tfrm_imp_darf.msk_cd_grupoChange(Sender: TObject);
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

procedure Tfrm_imp_darf.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_imp_darf.btn_co_unid_negClick(Sender: TObject);
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
    msk_cd_unid_negExit(nil);
  end;
end;

procedure Tfrm_imp_darf.btn_co_produtoClick(Sender: TObject);
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
    msk_cd_produtoExit(nil);
  end;
end;

procedure Tfrm_imp_darf.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_imp_darf.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente_co.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_imp_darf.edt_vl_multaEnter(Sender: TObject);
begin
  edt_vl_multa.Text := str_vl_multa;
end;

procedure Tfrm_imp_darf.edt_vl_jurosEnter(Sender: TObject);
begin
  edt_vl_juros.Text := str_vl_juros;
end;

procedure Tfrm_imp_darf.edt_vl_multaExit(Sender: TObject);
begin
  if Trim( edt_vl_multa.Text ) <> '' then
  begin
     edt_vl_multa.Text := Tira_Ponto(edt_vl_multa.Text);
     try
       edt_vl_multa.Text := FormatFloat('#0.00', StrToCurr(edt_vl_multa.Text));
       AtualizaTotal;
     except
       on EConvertError do
       begin
         BoxMensagem('Valor da Multa inválido',2);
         edt_vl_multa.SetFocus;
         edt_vl_multa.SelectAll;
         Exit;
       end;
    end;
    str_vl_multa := edt_vl_multa.Text;
  end;
end;

procedure Tfrm_imp_darf.edt_vl_jurosExit(Sender: TObject);
begin
  if Trim( edt_vl_juros.Text ) <> '' then
  begin
     edt_vl_juros.Text := Tira_Ponto(edt_vl_juros.Text);
     try
       edt_vl_juros.Text := FormatFloat('#0.00', StrToCurr(edt_vl_juros.Text));
       AtualizaTotal;
     except
       on EConvertError do
       begin
         BoxMensagem( 'Valor dos Juros inválido', 2 );
         edt_vl_juros.SetFocus;
         edt_vl_juros.SelectAll;
         Exit;
       end;
    end;
    str_vl_juros := edt_vl_juros.Text;
  end;
end;

procedure Tfrm_imp_darf.btn_co_motivoClick(Sender: TObject);
begin
  mem_motivo.Text := ConsultaOnLineEx('THIST_PADRAO','Países',['CD_HISTORICO','NM_HISTORICO'],['Código','Nome'],'NM_HISTORICO',frm_main.mi_cad_fin_hist_padrao);

(*  Application.CreateForm(Tfrm_hist_padrao, frm_hist_padrao);
  with frm_hist_padrao do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_hist_padrao.Cons_OnLineMemo_Texto := mem_motivo.Lines;
    lCons_OnLineMemo := True;
    ShowModal;
    lCons_OnLineMemo := False;
//    mem_motivo.Lines.Add( frm_hist_padrao.Cons_OnLineMemo_Texto[0] );
//    mem_motivo.Lines.Add( frm_hist_padrao.Cons_OnLineMemo_Texto[1] );
  end;
  mem_motivo.SetFocus;*)
end;

procedure Tfrm_imp_darf.AtualizaTotal;
var
  vl_total : Double;
begin
  vl_total := 0;
  {Soma Valor Principal}
  try
    edt_vl_principal.Text := FormatFloat('#0.00', StrToCurr(edt_vl_principal.Text));
    vl_total := vl_total + StrToCurr(edt_vl_principal.Text);
  except
    on EConvertError do
    begin
      Application.ProcessMessages;
    end;
  end;
  {Soma Valor Multa}
  try
    edt_vl_multa.Text := FormatFloat('#0.00', StrToCurr(edt_vl_multa.Text));
    vl_total := vl_total + StrToCurr(edt_vl_multa.Text);
    except
    on EConvertError do
    begin
      Application.ProcessMessages;
    end;
  end;
  {Soma Valor Juros}
  try
    edt_vl_juros.Text := FormatFloat('#0.00', StrToCurr(edt_vl_juros.Text));
    vl_total := vl_total + StrToCurr(edt_vl_juros.Text);
  except
    on EConvertError do
    begin
      Application.ProcessMessages;
    end;
  end;
  {Atualiza Total}
  try
    edt_vl_total.Text := FormatFloat( '#0.00', vl_total );
    except
    on EConvertError do
    begin
      Application.ProcessMessages;
    end;
  end;
end;

end.
