unit PGCH018;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, UCRPE32, ToolEdit, RXDBCtrl;

type
  Tfrm_sel_banco_data = class(TForm)
    Panel1: TPanel;
    lbl_data: TLabel;
    btn_imprimir: TButton;
    btn_sair: TButton;
    lbl_banco: TLabel;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    btn_co_banco: TSpeedButton;
    crp_relacao: TCrpe;
    lblColigada: TLabel;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    btn_co_coligada: TSpeedButton;
    lbl_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    msk_data: TDateEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure btn_co_coligadaClick(Sender: TObject);
    procedure GeraArq;
    procedure GeraHeaderArq;
    procedure GeraHeaderLote;
    procedure GeraDetalheA;
    procedure GeraDetalheJ;
    procedure GeraTrailerLote;
    procedure GeraTrailerArq;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);

  private
    { Private declarations }
    c1 : String;
    p1 : Array[0..1024] of Char;
    str_cd_barras, str_nr_lote, str_nr_detalhe : String;
    nr_detalhe, nr_linhas : Integer;
    vl_total_lote : Double;
  public
    str_cd_relatorio : String;
    { Public declarations }
  end;

var
  frm_sel_banco_data: Tfrm_sel_banco_data;

implementation

{$R *.DFM}
uses GSMLIB, FileText, PGGP001, PGCH031, PGSM041, PGGP017, PGSM018, PGSM010,
  PGCH033, ConsOnLineEx;

var
   Arquivo : TFileText;

procedure Tfrm_sel_banco_data.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_banco_data.btn_imprimirClick(Sender: TObject);
begin
  if (msk_cd_unid_neg.Visible) and (str_cd_relatorio <> '1') then
    if Trim(msk_cd_unid_neg.Text) = '' then
    begin
      BoxMensagem('Informe uma Unidade!', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

  if (msk_cd_produto.Visible) and (str_cd_relatorio <> '1') then
    if Trim(msk_cd_produto.Text) = '' then
    begin
      BoxMensagem('Informe um Produto!', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

  if msk_data.Text = '  /  /    ' then
  begin
    BoxMensagem('Informe uma data para seleção!', 2);
    msk_data.SetFocus;
    Exit;
  end;

  try
    if msk_data.Text <> '  /  /    ' then StrToDate(msk_data.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_data.Clear;
    end;
  end;

  if ( Trim( msk_cd_banco.Text ) = '' ) or
     ( Trim( edt_nm_banco.Text ) = '' ) then
  begin
    BoxMensagem('Informe um Banco!', 2);
    msk_cd_banco.SetFocus;
    Exit;
  end;

  if str_cd_relatorio = '2' then
  begin
    if ( Trim( msk_cd_coligada.Text ) = '' ) or
       ( Trim( edt_nm_coligada.Text ) = '' ) then
    begin
      BoxMensagem( 'Informe uma Empresa Coligada!', 2 );
      msk_cd_coligada.SetFocus;
      Exit;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  if str_cd_relatorio = '1' then
  begin
    with datm_sel_banco_data do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_atz_rel_pagto);
        if Trim(msk_cd_unid_neg.Text) = ''then
          sp_atz_rel_pagto.ParamByName('@CD_UNID_NEG').AsString := 'X'
        else
          sp_atz_rel_pagto.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        if Trim(msk_cd_produto.Text) = ''then
          sp_atz_rel_pagto.ParamByName('@CD_PRODUTO').AsString := 'X'
        else
          sp_atz_rel_pagto.ParamByName('@CD_PRODUTO').AsString := msk_cd_produto.Text;
        sp_atz_rel_pagto.ParamByName('@CD_BANCO').AsString := msk_cd_banco.Text;
        sp_atz_rel_pagto.ParamByName('@DT_MOV').AsString   := msk_data.Text;
        ExecStoredProc(sp_atz_rel_pagto);
        CloseStoredProc(sp_atz_rel_pagto);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    with crp_relacao do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName    := cDir_Rpt + '\CRCH004.RPT';
      Formulas[0]   := 'CD_BANCO      = "'+ msk_cd_banco.Text + '"';
      Formulas[1]   := 'DT_MOVIMENTO  = '+ DataCrystal( msk_data.Text );
      Execute;
    end;
  end;

  if str_cd_relatorio = '2' then
  begin
    try
      GeraArq;
      BoxMensagem('Arquivo gerado com sucesso: ' +
                   cDir_Rpt + '\P' + msk_cd_banco.Text + msk_cd_coligada.Text +
                   FormatDateTime( 'dd', dt_server ) + '.TXT', 3 );
    except
      BoxMensagem('Falha na geração do arquivo!', 2);
    end;
  end;

  Screen.Cursor := crDefault;

end;

procedure Tfrm_sel_banco_data.FormShow(Sender: TObject);
begin
  { Inicializa o Data Module}
  Application.CreateForm( Tdatm_sel_banco_data, datm_sel_banco_data );
  msk_data.Text := FormatDateTime('dd/mm/yyyy', dt_server);

  {Coligada}
  lblColigada.Visible     := str_cd_relatorio = '2';
  msk_cd_coligada.Visible := str_cd_relatorio = '2';
  edt_nm_coligada.Visible := str_cd_relatorio = '2';
  btn_co_coligada.Visible := str_cd_relatorio = '2';

  {Unidade}
  lbl_unid_neg.Visible    := str_cd_relatorio = '1';
  msk_cd_unid_neg.Visible := str_cd_relatorio = '1';
  edt_nm_unid_neg.Visible := str_cd_relatorio = '1';
  btn_co_unid_neg.Visible := str_cd_relatorio = '1';

 {Produto}
  lbl_produto.Visible     := str_cd_relatorio = '1';
  msk_cd_produto.Visible  := str_cd_relatorio = '1';
  edt_nm_produto.Visible  := str_cd_relatorio = '1';
  btn_co_produto.Visible  := str_cd_relatorio = '1';

  if str_cd_relatorio = '1' then
  begin
    Caption                 := 'Relação de Cheques / Despesas';
    btn_imprimir.Caption    := '&Imprimir';
    lbl_data.Caption        := 'Data';
  end
  else if str_cd_relatorio = '2' then
  begin
    Caption              := 'Integração com SISPAG';
    btn_imprimir.Caption := '&Gerar Arquivo';
    lbl_data.Caption     := 'Dt. Pagto';
    msk_cd_coligada.Text := str_cd_coligada;
    msk_cd_coligadaExit(nil);

    {Alinhamento Vertical}
    {Labels}
    lbl_data.Top        := lbl_Data.Top - 80;
    lblColigada.Top     := lblColigada.Top - 80;
    lbl_banco.Top       := lbl_banco.Top - 80;

    {MaskEdits}
    msk_data.Top        := msk_data.Top - 80;
    msk_cd_coligada.Top := msk_cd_coligada.Top - 80;
    msk_cd_banco.Top    := msk_cd_banco.Top - 80;

    {Edits}
    edt_nm_coligada.Top := edt_nm_coligada.Top - 80;
    edt_nm_banco.Top    := edt_nm_banco.Top - 80;

    {Speed Buttons}
    btn_co_coligada.Top := btn_co_coligada.Top - 80;
    btn_co_banco.Top    := btn_co_banco.Top - 80;

    msk_cd_banco.SetFocus;
  end;
end;

procedure Tfrm_sel_banco_data.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_sel_banco_data do
  begin
    qry_banco_.Close;
    qry_coligada_.Close;
    qry_favorecido_.Close;
    qry_ctaapagar_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sel_banco_data.btn_co_bancoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_banco.Text := ConsultaOnLineEx('TBANCO','Banco',['CD_BANCO','NM_BANCO'],['Código','Descrição'],'CD_BANCO',frm_main.mi_cad_fin_conta_banc)
  else
    edt_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO',msk_cd_banco.Text,'NM_BANCO')
end;

procedure Tfrm_sel_banco_data.msk_cd_bancoExit(Sender: TObject);
begin
  if msk_cd_banco.Text = '' then
  begin
    edt_nm_banco.Text := '';
  end
  else
  begin
    ValCodEdt( msk_cd_banco );
    if msk_cd_banco.Text <> '' then
    begin
      with datm_sel_banco_data do
      begin
        qry_banco_.Close;
        qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
        qry_banco_.Prepare;
        qry_banco_.Open;
        if Not qry_banco_.EOF then
        begin
          edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
        end
        else
        begin
          BoxMensagem( 'Banco não cadastrado!', 2 );
          msk_cd_banco.SetFocus;
        end
      end;
    end
  end;
end;

procedure Tfrm_sel_banco_data.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_banco    then btn_co_bancoClick(btn_co_banco);
    if Sender = msk_cd_coligada then btn_co_coligadaClick(btn_co_coligada);
    if Sender = msk_cd_produto  then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
  end;
end;

procedure Tfrm_sel_banco_data.msk_cd_coligadaExit(Sender: TObject);
begin
  if msk_cd_coligada.Text <> '' then
  begin
    ValCodEdt( msk_cd_coligada );
    with datm_sel_banco_data do
    begin
      qry_coligada_.Close;
      qry_coligada_.SQL[3] := 'WHERE CD_COLIGADA = "' + msk_cd_coligada.Text + '"';
      qry_coligada_.Prepare;
      qry_coligada_.Open;
      if qry_coligada_.RecordCount > 0 then
      begin
        edt_nm_coligada.Text := qry_coligada_NM_COLIGADA.AsString;
      end
      else
      begin
        BoxMensagem( 'Empresa Coligada não cadastrada!', 2 );
        msk_cd_coligada.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_coligada.Text := '';
  end;
end;

procedure Tfrm_sel_banco_data.btn_co_coligadaClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    msk_cd_coligada.Text := ConsultaOnLineEx('TCOLIGADA','Coligada',['CD_COLIGADA','NM_COLIGADA'],['Código','Descrição'],'CD_COLIGADA',nil)
  Else
    edt_nm_coligada.Text := ConsultaLookUP('TCOLIGADA','CD_COLIGADA', msk_cd_coligada.Text,'NM_COLIGADA');
end;

procedure Tfrm_sel_banco_data.GeraArq;
var str_tp_pgto : string[2];
begin
  with datm_sel_banco_data do
  begin
    Application.ProcessMessages;
    qry_ctaapagar_.Close;
    qry_ctaapagar_.ParamByName('CD_COLIGADA').AsString    := msk_cd_coligada.Text;
    qry_ctaapagar_.ParamByName('DT_PAGAMENTO').AsDateTime := StrToDate( msk_data.Text );
    qry_ctaapagar_.ParamByName('CD_BANCO').AsString       := msk_cd_banco.Text;
    qry_ctaapagar_.Prepare;
    qry_ctaapagar_.Open;

    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_ctaapagar_.First;

    Arquivo      := TFileText.Create;
    Arquivo.Name := cDir_Rpt + '\P' + msk_cd_banco.Text + msk_cd_coligada.Text + FormatDateTime( 'dd', dt_server ) + '.TXT';
//    Arquivo.Name := cDir_Rpt + '\P' + msk_cd_banco.Text + msk_cd_coligada.Text + FormatDateTime( 'dd', Date ) + '.TXT';
    Arquivo.CreateFile;

    str_nr_lote := '0000';

    while Not qry_ctaapagar_.EOF do
    begin
      if str_nr_lote = '0000' then
      begin
       {Gerar Registro de Header de Arquivo}
       GeraHeaderArq;
      end;
      if str_tp_pgto <> qry_ctaapagar_TP_PAGTO.AsString then
      begin
        if str_nr_lote <> '0000' then
        begin
          {Gera Registro de Trailer de Lote}
          GeraTrailerLote;
        end;
        str_nr_lote := FStrZero( trim( IntToStr( StrToInt( str_nr_lote) + 1 ) ), 4);
        {Gera Registro de Header de Lote}
        GeraHeaderLote;
        str_tp_pgto := qry_ctaapagar_TP_PAGTO.AsString;
        nr_linhas   := 0;
      end;
      if ( qry_ctaapagar_TP_PAGTO.AsString = '01' ) or
         ( qry_ctaapagar_TP_PAGTO.AsString = '03' ) then
      begin
        {Gerar Registro de Detalhe Segmento A}
        GeraDetalheA;
      end
      else
      begin
        {Gerar Registro de Detalhe Segmento J}
        GeraDetalheJ;
      end;
      qry_ctaapagar_.Next;
    end;
    if str_nr_lote <> '0000' then
    begin
      {Gera Registro de Trailer de Lote}
      GeraTrailerLote;
      {Gerar Registro de Trailer de Arquivo}
      GeraTrailerArq;
    end;
    Arquivo.Close;
    Arquivo.Free;
  end;
end;

procedure Tfrm_sel_banco_data.GeraHeaderArq;
begin
  with datm_sel_banco_data do
  begin
    c1 := '';
    {Código do Banco}
    c1 := c1 + CampoTXTNum( qry_banco_NR_BANCO, 3 );
    {Código do Lote + Tipo de Registro + Layout de Arquivo + Empresa - Inscrição}
    c1 := c1 + Replicate('0', 5) + Space(6) + '0202';
    {Inscrição Número}
    c1 := c1 + CampoTXTNum( qry_coligada_CGC_COLIGADA, 14 );
    {Brancos}
    c1 := c1 + Space(20);
    {Agência + Brancos}
    c1 := c1 + CampoTXTNum( qry_banco_CD_AGENCIA, 5 ) + ' ';
    {Conta + Brancos}
    c1 := c1 + CampoTXTNum( qry_banco_NR_CONTA, 12 ) + ' ';
    {DAC}
    if qry_banco_DAC_AGENCIA.IsNull then
      c1 := c1 + '0'
    else
      c1 := c1 + qry_banco_DAC_AGENCIA.AsString;
    {Nome da Empresa}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_coligada_NM_COLIGADA, 30 ) ) );
    {Nome do Banco}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_banco_NM_BANCO, 30 ) ) );
    {Brancos + Arquivo-Código}
    c1 := c1 + Space(10) + '1';
    {Data de Geração}
    c1 := c1 + FormatDateTime( 'ddmmyyyy', dt_server );
//    c1 := c1 + FormatDateTime( 'ddmmyyyy', Date );
    {Hora da Geração}
    c1 := c1 + FormatDateTime( 'hhmmss', Time );
    {Zeros + Unidade de Densidade}
    c1 := c1 + Replicate('0', 14);
    {Brancos}
    c1 := c1 + Space(69);
    {Grava Header de Arquivo}
    c1 := c1 + #13#10;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    nr_linhas := nr_linhas + 1;
  end;
end;

procedure Tfrm_sel_banco_data.GeraHeaderLote;
begin
  with datm_sel_banco_data do
  begin
    c1 := '';
    nr_detalhe    := 0;
    vl_total_lote := 0;
    {Código do Banco}
    c1 := c1 + CampoTXTNum( qry_banco_NR_BANCO, 3 );
    {Código do Lote + Tipo de Registro + Tipo de Operação + Tipo de Pagamento(Fornecedores)}
    c1 := c1 + str_nr_lote + '1C20';
    {Forma de Pagamento}
    c1 := c1 + qry_ctaapagar_TP_PAGTO.AsString;
    {Layout do Lote + Brancos + Empresa - Inscrição}
    c1 := c1 + '020 2';
    {Inscrição Número}
    c1 := c1 + CampoTXTNum( qry_coligada_CGC_COLIGADA, 14 );
    {Brancos}
    c1 := c1 + Space(20);
    {Agência + Brancos}
    c1 := c1 + CampoTXTNum( qry_banco_CD_AGENCIA, 5 ) + ' ';
    {Conta}
    c1 := c1 + CampoTXTNum( qry_banco_NR_CONTA, 12 ) + ' ';
    {DAC}
    if qry_banco_DAC_AGENCIA.IsNull then
      c1 := c1 + '0'
    else
      c1 := c1 + qry_banco_DAC_AGENCIA.AsString;
    {Nome da Empresa}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_coligada_NM_COLIGADA, 30 ) ) );
    {Finalidade do Lote + Historico de C/C}
    c1 := c1 + Space(40);
    {Endereço da Empresa}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_coligada_END_COLIGADA, 30 ) ) );
    {Número}
    c1 := c1 + CampoTXTNum( qry_coligada_END_NUMERO, 5 );
    {Complemento}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_coligada_END_COMPL, 15 ) ) );
    {Cidade}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_coligada_END_CIDADE, 20 ) ) );
    {CEP}
    c1 := c1 + CampoTXTNum( qry_coligada_END_CEP, 8 );
    {Estado}
    c1 := c1 + CampoTXT( qry_coligada_END_UF, 2 );
    {Brancos + Ocorrencias}
    c1 := c1 + Space(18);
    {Grava Header de Lote}
    c1 := c1 + #13#10;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    nr_linhas := nr_linhas + 1;
  end;
end;

procedure Tfrm_sel_banco_data.GeraDetalheA;
begin
  with datm_sel_banco_data do
  begin
    c1 := '';
    {Código do Banco}
    c1 := c1 + CampoTXTNum( qry_banco_NR_BANCO, 3 );
    nr_detalhe := nr_detalhe + 1;
    {Código do Lote + Tipo de Registro + Número do Registro + Segmento + Tipo de Movimento + Zeros}
    str_nr_detalhe := StrZero( nr_detalhe, 5 );
    c1 := c1 + str_nr_lote + '3' + str_nr_detalhe + 'A' + Replicate( '0', 6 );
    {Banco Favorecido}
    c1 := c1 + CampoTXTNum( qry_favorecido_NR_BANCO, 3 );
    {Agencia Conta }
    c1 := c1 + CampoTXTNum( qry_favorecido_NR_AGENCIA, 5 ) + ' ';
    c1 := c1 + CampoTXTNum( qry_favorecido_NR_CONTA, 12 );
    if qry_favorecido_NR_DAC.IsNull then
      c1 := c1 + ' 0'
    else
    begin
      if Length(qry_favorecido_NR_DAC.AsString) = 1 then
        c1 := c1 + ' ' + qry_favorecido_NR_DAC.AsString
      else
        c1 := c1 + qry_favorecido_NR_DAC.AsString;
    end;
    {Nome do Favorecido}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_favorecido_NM_FAVORECIDO, 30 ) ) );
    {Seu número}
    c1 := c1 + FormatDateTime('ddmmyyyy', qry_ctaapagar_DT_CTAAPAGAR.AsDateTime );
    c1 := c1 + qry_ctaapagar_NR_CTAAPAGAR.AsString;
    c1 := c1 + Space(9);
    {Data de Pagto}
    c1 := c1 + FormatDateTime('ddmmyyyy', qry_ctaapagar_DT_PAGAMENTO.AsDateTime );
    {Moeda - Tipo + Zeros}
    c1 := c1 + 'REA' + Replicate( '0', 15 );
    {Valor do Pagto}
    vl_total_lote := vl_total_lote + qry_ctaapagar_CalcPagamento.AsFloat;
    c1 := c1 + TiraVirg( FormatFloat('0000000000000.00', qry_ctaapagar_CalcPagamento.AsFloat ) );
    {Nosso Número + Brancos + Data Efetiva + Valor efetivo + Finalidade Detalhe + Brancos + Nº DE DOC/OP/CHEQUE}
    c1 := c1 + Space(20) + Replicate( '0', 23 ) + Space(20) + Replicate( '0', 6 );
    {Nº de Inscrição}
    if qry_favorecido_CGC_EMPRESA.IsNull or ( Trim( qry_favorecido_CGC_EMPRESA.AsString ) = '' ) then
      c1 := c1 + '000' + CampoTXTNum( qry_favorecido_CPF_EMPRESA, 11 )
    else
      c1 := c1 + CampoTXTNum( qry_favorecido_CGC_EMPRESA, 14 );
    {Brancos + Aviso + Ocorrencias}
    c1 := c1 + Space(23);
    {Grava Detalhe A}
    c1 := c1 + #13#10;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    nr_linhas := nr_linhas + 1;
  end;
end;

procedure Tfrm_sel_banco_data.GeraDetalheJ;
begin
  with datm_sel_banco_data do
  begin
    c1 := '';
    {Código do Banco}
    c1 := c1 + CampoTXTNum( qry_banco_NR_BANCO, 3 );
    nr_detalhe := nr_detalhe + 1;
    {Código do Lote + Tipo de Registro + Número do Registro + Segmento + Tipo de Movimento}
    str_nr_detalhe := StrZero( nr_detalhe, 5 );
    c1 := c1 + str_nr_lote + '3' + str_nr_detalhe + 'J' + Replicate( '0', 3 );
    str_cd_barras := qry_ctaapagar_CD_BARRAS.AsString;
    if qry_ctaapagar_TP_CD_BARRAS.AsString = '1' then {Manual - Parte superior da Ficha de Compensação}
    begin
      {Banco Favorecido}
      c1 := c1 + Copy( str_cd_barras, 1, 3 );
      {Moeda}
      c1 := c1 + Copy( str_cd_barras, 4, 1 );
      {DV}
      c1 := c1 + Copy( str_cd_barras, 33, 1 );
      {Valor}
      c1 := c1 + Replicate('0', 14 - ( Length( str_cd_barras ) - 33 ) ) +
                 Copy( str_cd_barras, 34, Length( str_cd_barras ) - 33 );
      {Campo Livre}
      c1 := c1 + Copy( str_cd_barras, 5, 5 ) + Copy( str_cd_barras, 11, 10 ) + Copy( str_cd_barras, 22, 10 );
    end
    else {Leitura Ótica - Parte inferior da Ficha de Compensação}
    begin
      {Banco Favorecido}
      c1 := c1 + Copy( str_cd_barras, 1, 3 );
      {Moeda}
      c1 := c1 + Copy( str_cd_barras, 4, 1 );
      {DV}
      c1 := c1 + Copy( str_cd_barras, 5, 1 );
      {Valor}
      c1 := c1 + Copy( str_cd_barras, 6, 14 );
      {Campo Livre}
      c1 := c1 + Copy( str_cd_barras, 20, 25 );
    end;
    {Nome do Favorecido}
    c1 := c1 + UpperCase( ConvAscii( CampoTXT( qry_favorecido_NM_FAVORECIDO, 30 ) ) );
    {Data Vencto}
    c1 := c1 + FormatDateTime( 'ddmmyyyy', qry_ctaapagar_DT_VENCIMENTO.AsDateTime );
    {Valor do Titulo}
    c1 := c1 + TiraVirg( FormatFloat('0000000000000.00', qry_ctaapagar_CalcValor.AsFloat ) );
    {Descontos}
    c1 := c1 + TiraVirg( FormatFloat('0000000000000.00', qry_ctaapagar_VL_DESCONTO.AsFloat ) );
    {Acrescimos}
    c1 := c1 + TiraVirg( FormatFloat('0000000000000.00', qry_ctaapagar_VL_ACRESCIMO.AsFloat ) );
    {Data Pagamento}
    c1 := c1 + FormatDateTime( 'ddmmyyyy', qry_ctaapagar_DT_PAGAMENTO.AsDateTime );
    {Valor Pagamento}
    vl_total_lote := vl_total_lote + qry_ctaapagar_CalcPagamento.AsFloat;
    c1 := c1 + TiraVirg( FormatFloat('0000000000000.00', qry_ctaapagar_CalcPagamento.AsFloat ) );
    {Zeros}
    c1 := c1 + Replicate( '0', 15);
    {Seu número + brancos + nosso número + Ocorrências}
    c1 := c1 + FormatDateTime('ddmmyyyy', qry_ctaapagar_DT_CTAAPAGAR.AsDateTime );
    c1 := c1 + qry_ctaapagar_NR_CTAAPAGAR.AsString;
    c1 := c1 + Space(47);
    {Grava Detalhe J}
    c1 := c1 + #13#10;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    nr_linhas := nr_linhas + 1;
  end;
end;

procedure Tfrm_sel_banco_data.GeraTrailerLote;
begin
  with datm_sel_banco_data do
  begin
    c1 := '';
    {Código do Banco}
    c1 := c1 + CampoTXTNum( qry_banco_NR_BANCO, 3 );
    {Código do Lote + Tipo de Registro + Brancos + Total Qtde Registros}
    str_nr_detalhe := StrZero( nr_detalhe + 2, 6 );
    c1 := c1 + str_nr_lote + '5' + Space(9) + str_nr_detalhe;
    {Total Valor Pagtos}
    c1 := c1 + TiraVirg( FormatFloat('0000000000000000.00', vl_total_lote ) );
    {Zeros + Brancos}
    c1 := c1 + Replicate( '0', 18 ) + Space(181);
    {Grava Trailer Lote}
    c1 := c1 + #13#10;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    nr_linhas := nr_linhas + 1;
  end;
end;

procedure Tfrm_sel_banco_data.GeraTrailerArq;
begin
  with datm_sel_banco_data do
  begin
    c1 := '';
    {Código do Banco}
    c1 := c1 + CampoTXTNum( qry_banco_NR_BANCO, 3 );
    {Código do Lote + Tipo de Registro + Brancos + Total Qtde lotes}
    c1 := c1 + Replicate( '9', 5 ) + Space(9) + '00' + str_nr_lote;
    nr_linhas := nr_linhas + 1;
    {Total Qtde Registros}
    c1 := c1 + StrZero( nr_linhas, 6 );
    {Brancos}
    c1 := c1 + Space(211);
    {Grava Trailer Arq}
    c1 := c1 + #13#10;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
  end;
end;



procedure Tfrm_sel_banco_data.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'NM_UNID_NEG')
end;

procedure Tfrm_sel_banco_data.btn_co_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto)
  Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_sel_banco_data.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with datm_sel_banco_data.qry_unidade_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      edt_nm_unid_neg.Text := 'Todas'
    end
    else edt_nm_unid_neg.Text:= FieldByName('NM_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_banco_data.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  with datm_sel_banco_data.qry_produto_ do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      edt_nm_produto.Text := 'Todos';
    end
    else edt_nm_produto.Text:= FieldByName('NM_PRODUTO').AsString;
    Close;
  end;
end;                    

end.                        
