unit PGCH025;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons;

type
  Tfrm_sel_col_fav = class(TForm)
    crp_col_fav: TCrpe;
    lbl_cd_coligada: TLabel;
    btn_cd_coligada: TSpeedButton;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    edt_nm_favorecido: TEdit;
    msk_cd_favorecido: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Label7: TLabel;
    msk_ano: TMaskEdit;
    Label9: TLabel;
    btn_co_recol: TSpeedButton;
    msk_cd_recol: TMaskEdit;
    edt_nm_recol: TEdit;
    procedure btn_cd_coligadaClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_anoExit(Sender: TObject);
    procedure Tipo3;
    procedure msk_cd_coligadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_recolExit(Sender: TObject);
    procedure btn_co_recolClick(Sender: TObject);
  private
    c1, c2, c3:  String;
    str_resp, str_email_resp : String;
    str_cd_recol : String[4];
    tot_tipo2, nr_seq : Integer;
    p1, p2, p3: Array[0..1024] of Char;
    avl_rend : Array[1..12] of Double;
    avl_ir : Array[1..12] of Double;
  public
    { Public declarations }
    tp_rel : Byte;
  end;

var
  frm_sel_col_fav: Tfrm_sel_col_fav;

implementation

uses PGGP001, PGGP017, PGCH026, PGSM090, PGSM096, PGSM148, GSMLIB, FILETEXT;

var
   Arquivo : TFileText;

{$R *.DFM}

procedure Tfrm_sel_col_fav.btn_cd_coligadaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 14;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TCOLIGADA';

  datm_consulta_padrao.Tabela.Filtered     := False;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := True; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' Coligada ';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_coligada.Text := frm_consulta_padrao.Cons_OnLine_Texto;
  msk_cd_coligadaExit(msk_cd_coligada);
end;

procedure Tfrm_sel_col_fav.btn_co_favorecidoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Favor, frm_Favor);
  with frm_Favor Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_Favor.Cons_OnLine_Texto := msk_cd_favorecido.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_favorecido.Text := frm_Favor.Cons_OnLine_Texto;
  end;
  msk_cd_favorecidoExit(nil);
  msk_cd_favorecido.SetFocus;
end;

procedure Tfrm_sel_col_fav.msk_cd_coligadaExit(Sender: TObject);
begin
  edt_nm_coligada.Clear;
  if msk_cd_coligada.text = '' then
  begin
    edt_nm_coligada.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_coligada);
  with datm_sel_col_fav.qry_coligada_ Do
  begin
    ParamByName('CD_COLIGADA').AsString := msk_cd_coligada.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem(' Coligada não encontrada!',2);
      msk_cd_coligada.Clear;
      edt_nm_coligada.Clear;
      msk_cd_coligada.SetFocus;
    end
    else edt_nm_coligada.Text:= FieldByName('NM_COLIGADA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_col_fav.msk_cd_favorecidoExit(Sender: TObject);
begin
  edt_nm_favorecido.Clear;
  if msk_cd_favorecido.text = '' then
  begin
    edt_nm_favorecido.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_favorecido);
  With datm_sel_col_fav.qry_favorecido_ Do
  begin
    Close;
    ParamByName('CD_FAVORECIDO').AsString := msk_cd_favorecido.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Favorecido não encontrado!',2);
      msk_cd_favorecido.Clear;
      edt_nm_favorecido.Clear;
      msk_cd_favorecido.SetFocus;
    end
    else edt_nm_favorecido.Text:= FieldByName('NM_FAVORECIDO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_col_fav.btn_iniciarClick(Sender: TObject);
var
  i : Byte;
begin
  if Trim(msk_cd_coligada.Text) = '' then
  begin
    BoxMensagem('Informe uma Coligada!', 2);
    msk_cd_coligada.SetFocus;
    Exit;
  end;

  if Trim(msk_cd_recol.Text) = '' then
  begin
    BoxMensagem('Informe o Código do Recolhimento de IR!', 2);
    msk_cd_recol.SetFocus;
    Exit;
  end;

  if Trim(msk_ano.Text) = '' then
  begin
    BoxMensagem('Informe o ano!', 2);
    msk_ano.SetFocus;
    Exit;
  end;

  if tp_rel = 3 then
  begin
    {Gera Arquivo DIRF}
    with datm_sel_col_fav do
    begin
      qry_coligada_.Close;
      qry_coligada_.ParamByName('CD_COLIGADA').AsString := msk_cd_coligada.Text;
      qry_coligada_.Prepare;
      qry_coligada_.Open;

      qry_DIRF_.Close;
      qry_DIRF_.ParamByName('CD_COLIGADA').AsString := msk_cd_coligada.Text;
      qry_DIRF_.ParamByName('ANO').AsString := msk_ano.Text;
      qry_DIRF_.ParamByName('CD_RECOL').AsString := msk_cd_recol.Text;

      qry_DIRF_.Prepare;
      qry_DIRF_.Open;

      for i := 1 to 12 do
      begin
        avl_rend[i] := 0;
        avl_ir[i]   := 0;
      end;

      nr_seq := 1;
      {Tipo 1}
      Arquivo := TFileText.Create;
      Arquivo.Name := cDir_Risc + '\DIRF' + msk_cd_coligada.Text + '.TXT';
      Arquivo.CreateFile;
      {Nº Sequencial do arquivo}
      c1 := FormatFloat('00000000', nr_seq);
      {Tipo}
      c1 := c1 + '1';
      {CNPJ do Declarante}
      c1 := c1 + qry_coligada_CGC_COLIGADA.AsString;
      {Nome do arquivo}
      c1 := c1 + 'DIRF';
      {Ano de retenção}
      c1 := c1 + Copy( msk_ano.Text, 3, 2);
      {OR + Ano-referencia + Filler}
      c1 := c1 + 'O1' + Space(11);
      {Firma ou Nome Empresarial do Declarante}
      c1 := c1 + Emite( qry_coligada_NM_RAZ_SOCIAL, 60 );
      {Filler}
      c1 := c1 + Space(48);
      {CNPJ do estabelecimento responsável}
      c1 := c1 + qry_coligada_CGC_COLIGADA.AsString;
      {Logradouro}
      c1 := c1 + Emite( qry_coligada_END_COLIGADA, 40 );
      {Numero}
      c1 := c1 + Emite( qry_coligada_END_NUMERO, 6 );
      {Complemento}
      c1 := c1 + Emite( qry_coligada_END_COMPL, 20 );
      {Bairro}
      c1 := c1 + Emite( qry_coligada_END_BAIRRO, 20 );
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      c1 := '';
      {CEP}
      c1 := c1 + Emite( qry_coligada_END_CEP, 8 );
      {Caixa Postal}
      c1 := c1 + Replicate('0', 5);
      {Município}
      c1 := c1 + Emite( qry_coligada_END_CIDADE, 40 );
      {Sigla da UF}
      c1 := c1 + Emite( qry_coligada_END_UF, 2 );
      {Nome do país}
      c1 := c1 + 'Brasil' + Space(24);
      {DDD do estabelecimento}
      c1 := c1 + '0' + Emite( qry_coligada_DDD_COLIGADA, 3 );
      {Telefone do estabelecimento}
      if qry_coligada_TEL_COLIGADA.IsNull then
        c1 := c1 + Replicate('0', 8)
      else
      begin
        c1 := c1 + Replicate( '0', 8 - Length( qry_coligada_TEL_COLIGADA.AsString ) ) +
                   qry_coligada_TEL_COLIGADA.AsString;
      end;

      {Fax do estabelecimento}
      if qry_coligada_FAX_COLIGADA.IsNull then
        c1 := c1 + Replicate('0', 8)
      else
      begin
        c1 := c1 + Replicate( '0', 8 - Length( qry_coligada_FAX_COLIGADA.AsString ) ) +
                   qry_coligada_FAX_COLIGADA.AsString;
      end;

      {E-mail do estabelecimento}
      c1 := c1 + Emite( qry_coligada_EMAIL_COLIGADA, 50 );
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      c1 := '';
      {CPF do responsável}
      c1 := c1 + '26795299872';
      {Nome do responsável}
      str_resp := 'Jose Antonio Gotti';
      c1 := c1 + str_resp + Space(60 - Length( str_resp ) ) ;
      {DDD do responsável}
      c1 := c1 + '0013';
      {Telefone do responsável}
      c1 := c1 + '02224433';
      {Ramal do responsável}
      c1 := c1 + '000214';
      {Fax do responsável}
      c1 := c1 + '02323508';
      {E-mail do responsável}
      str_email_resp := 'jgotti.adm@smagalhaes.com.br';
      c1 := c1 + str_email_resp + Space(50 - Length( str_email_resp ) ) ;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      {Para uso da SRF + Para uso do declarante}
      c1 := Space(178);
      c1 := c1 + #13#10;
      StrPCopy( p1, c1);
      Arquivo.Write( p1 );

      nr_seq := 2;
      tot_tipo2 := 0;
      qry_DIRF_.First;

      {Tipo 2}
      while Not qry_DIRF_.EOF do
      begin
        {Nº Sequencial do arquivo}
        c2 := FormatFloat('00000000', nr_seq);
        {Tipo}
        c2 := c2 + '2';
        {CNPJ do Declarante}
        c2 := c2 + qry_coligada_CGC_COLIGADA.AsString;
        {Código de retenção + Beneficiário}
        str_cd_recol := qry_DIRF_CD_RECOL.AsString;
        c2 := c2 + str_cd_recol;
        {Identificação da espécie de beneficiário}
        if qry_DIRF_CD_TIPO_PESSOA.AsString = 'F' then
        begin
          c2 := c2 + '1000';
          c2 := c2 + Emite( qry_DIRF_CPF_EMPRESA, 11 );
        end
        else
        begin
          c2 := c2 + '2';
          c2 := c2 + Emite( qry_DIRF_CGC_EMPRESA, 14 );
        end;
        {Nome do beneficiário}
        c2 := c2 + Emite( qry_DIRF_NM_FAVORECIDO, 60 );
        StrPCopy( p2, c2);
        Arquivo.Write( p2 );

        c2:= '';
        {Informações mensais dos beneficiários pessoas físicas ou jurídicas}
        {Janeiro}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_01.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_01.AsFloat );
        avl_rend[1] := avl_rend[1] + qry_DIRF_VL_REND_TRIB_01.AsFloat;
        avl_ir[1]   := avl_ir[1] + qry_DIRF_VL_IR_01.AsFloat;
        {Fevereiro}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_02.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_02.AsFloat );
        avl_rend[2] := avl_rend[2] + qry_DIRF_VL_REND_TRIB_02.AsFloat;
        avl_ir[2]   := avl_ir[2] + qry_DIRF_VL_IR_02.AsFloat;
        {Março}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_03.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_03.AsFloat );
        avl_rend[3] := avl_rend[3] + qry_DIRF_VL_REND_TRIB_03.AsFloat;
        avl_ir[3]   := avl_ir[3] + qry_DIRF_VL_IR_03.AsFloat;
        StrPCopy( p2, c2);
        Arquivo.Write( p2 );
        c2 := '';
        {Abril}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_04.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_04.AsFloat );
        avl_rend[4] := avl_rend[4] + qry_DIRF_VL_REND_TRIB_04.AsFloat;
        avl_ir[4]   := avl_ir[4] + qry_DIRF_VL_IR_04.AsFloat;
        {Maio}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_05.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_05.AsFloat );
        avl_rend[5] := avl_rend[5] + qry_DIRF_VL_REND_TRIB_05.AsFloat;
        avl_ir[5]   := avl_ir[5] + qry_DIRF_VL_IR_05.AsFloat;
        {Junho}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_06.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_06.AsFloat );
        avl_rend[6] := avl_rend[6] + qry_DIRF_VL_REND_TRIB_06.AsFloat;
        avl_ir[6]   := avl_ir[6] + qry_DIRF_VL_IR_06.AsFloat;
        StrPCopy( p2, c2);
        Arquivo.Write( p2 );

        c2 := '';
        {Julho}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_07.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_07.AsFloat );
        avl_rend[7] := avl_rend[7] + qry_DIRF_VL_REND_TRIB_07.AsFloat;
        avl_ir[7]   := avl_ir[7] + qry_DIRF_VL_IR_07.AsFloat;
        {Agosto}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_08.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_08.AsFloat );
        avl_rend[8] := avl_rend[8] + qry_DIRF_VL_REND_TRIB_08.AsFloat;
        avl_ir[8]   := avl_ir[8] + qry_DIRF_VL_IR_08.AsFloat;
        {Setembro}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_09.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_09.AsFloat );
        avl_rend[9] := avl_rend[9] + qry_DIRF_VL_REND_TRIB_09.AsFloat;
        avl_ir[9]   := avl_ir[9] + qry_DIRF_VL_IR_09.AsFloat;
        StrPCopy( p2, c2);
        Arquivo.Write( p2 );

        c2 := '';
        {Outubro}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_10.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_10.AsFloat );
        avl_rend[10] := avl_rend[10] + qry_DIRF_VL_REND_TRIB_10.AsFloat;
        avl_ir[10]   := avl_ir[10] + qry_DIRF_VL_IR_10.AsFloat;
        {Novembro}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_11.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_11.AsFloat );
        avl_rend[11] := avl_rend[11] + qry_DIRF_VL_REND_TRIB_11.AsFloat;
        avl_ir[11]   := avl_ir[11] + qry_DIRF_VL_IR_11.AsFloat;
        {Dezembro}
        c2 := c2 + Zonar( qry_DIRF_VL_REND_TRIB_12.AsFloat );
        c2 := c2 + Replicate('0', 15);
        c2 := c2 + Zonar( qry_DIRF_VL_IR_12.AsFloat );
        avl_rend[12] := avl_rend[12] + qry_DIRF_VL_REND_TRIB_12.AsFloat;
        avl_ir[12]   := avl_ir[12] + qry_DIRF_VL_IR_12.AsFloat;
        StrPCopy( p2, c2);
        Arquivo.Write( p2 );

        {13º Salário}
        c2 := Replicate('0', 45);
        {Para uso da SRF + Para uso do declarante}
        c2 := c2 + Space(43);
        c2 := c2 + #13#10;
        StrPCopy( p2, c2);
        Arquivo.Write( p2 );

        nr_seq    := nr_seq + 1;
        tot_tipo2 := tot_tipo2 + 1;
        qry_DIRF_.Next;

        if qry_DIRF_.EOF then Tipo3
        else if qry_DIRF_CD_RECOL.AsString <> str_cd_recol then Tipo3;

      end;
      qry_DIRF_.Close;
      qry_coligada_.Close;

      Arquivo.Close;
      Arquivo.Free;
      {Fim da Geração do arquivo da DIRF}
      BoxMensagem('Arquivo DIRF gerado com sucesso!', 3);
    end;
  end
  else
  begin
    With crp_col_fav Do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      if tp_rel = 1 then
      begin
        ReportName  := cDir_Rpt + '\CRIR001.RPT';
      end
      else
        ReportName  := cDir_Rpt + '\CRIR004.RPT';
      Formulas[0] := 'Coligada = "'+ msk_cd_coligada.Text + '"';
      Formulas[1] := 'CD_RECOLHE = "'+ msk_cd_recol.Text + '"';
      Formulas[2] := 'Favorecido = "'+ trim(msk_cd_favorecido.Text) + '"';
      Formulas[3] := 'Ano = "'+ msk_ano.Text + '"';
      Execute;
    end;
  end;
end;

procedure Tfrm_sel_col_fav.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_col_fav.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_col_fav do
  begin
    if qry_favorecido_.Active then qry_favorecido_.Close;
    if qry_coligada_.Active then qry_coligada_.Close;
    Free;
  end;
  action:= cafree;
end;

procedure Tfrm_sel_col_fav.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_col_fav, datm_sel_col_fav);
end;

procedure Tfrm_sel_col_fav.FormShow(Sender: TObject);
begin
  if tp_rel = 1 then Caption := 'Ficha Financeira';
  if tp_rel = 2 then Caption := 'Etiquetas';
  if tp_rel = 3 then
  begin
    Caption := 'Geração de DIRF';
    btn_iniciar.Caption := '&Gerar';
    lbl_favorecido.Visible := False;
    msk_cd_favorecido.Visible := False;
    edt_nm_favorecido.Visible := False;
    btn_co_favorecido.Visible := False;
  end;
end;

procedure Tfrm_sel_col_fav.msk_anoExit(Sender: TObject);
begin
  try
    if Trim(msk_ano.text) <> '' then StrToInt(msk_ano.text);
  except
    on EConvertError do
    begin
      BoxMensagem('Ano inválido!',2);
      msk_ano.Setfocus;
      Exit;
    end;
  end;
end;


procedure Tfrm_sel_col_fav.Tipo3;
var
  k : Byte;
begin
  with datm_sel_col_fav do
  begin
    {Tipo 3}
    {Nº Sequencial do arquivo}
    c3 := FormatFloat('00000000', nr_seq);
    {Tipo}
    c3 := c3 + '3';
    {CNPJ do Declarante}
    c3 := c3 + qry_coligada_CGC_COLIGADA.AsString;
    {Código de retenção}
    c3 := c3 + str_cd_recol;
    {Total de registros do tipo 2 informados}
    c3 := c3 + FormatFloat('00000000', tot_tipo2);
    {Usou => zerou}
    tot_tipo2 := 0;
    {Filler}
    c3 := c3 + Space(67);
    StrPCopy( p3, c3);
    Arquivo.Write( p3 );

    c3 := '';
    {Total das Informações mensais dos beneficiários pessoas físicas ou jurídicas}
    {Janeiro}
    c3 := c3 + Zonar( avl_rend[1] ) + Replicate('0', 15 ) +  Zonar( avl_ir[1] );
    {Fevereiro}
    c3 := c3 + Zonar( avl_rend[2] ) + Replicate('0', 15 ) +  Zonar( avl_ir[2] );
    {Março}
    c3 := c3 + Zonar( avl_rend[3] ) + Replicate('0', 15 ) +  Zonar( avl_ir[3] );
    StrPCopy( p3, c3);
    Arquivo.Write( p3 );

    c3 := '';
    {Abril}
    c3 := c3 + Zonar( avl_rend[4] ) + Replicate('0', 15 ) +  Zonar( avl_ir[4] );
    {Maio}
    c3 := c3 + Zonar( avl_rend[5] ) + Replicate('0', 15 ) +  Zonar( avl_ir[5] );
    {Junho}
    c3 := c3 + Zonar( avl_rend[6] ) + Replicate('0', 15 ) +  Zonar( avl_ir[6] );
    StrPCopy( p3, c3);
    Arquivo.Write( p3 );

    c3 := '';
    {Julho}
    c3 := c3 + Zonar( avl_rend[7] ) + Replicate('0', 15 ) +  Zonar( avl_ir[7] );
    {Agosto}
    c3 := c3 + Zonar( avl_rend[8] ) + Replicate('0', 15 ) +  Zonar( avl_ir[8] );
    {Setembro}
    c3 := c3 + Zonar( avl_rend[9] ) + Replicate('0', 15 ) +  Zonar( avl_ir[9] );
    StrPCopy( p3, c3);
    Arquivo.Write( p3 );

    c3 := '';
    {Outubro}
    c3 := c3 + Zonar( avl_rend[10] ) + Replicate('0', 15 ) +  Zonar( avl_ir[10] );
    {Novembro}
    c3 := c3 + Zonar( avl_rend[11] ) + Replicate('0', 15 ) +  Zonar( avl_ir[11] );
    {Dezembro}
    c3 := c3 + Zonar( avl_rend[12] ) + Replicate('0', 15 ) +  Zonar( avl_ir[12] );
    StrPCopy( p3, c3);
    Arquivo.Write( p3 );

    {13º Salário}
    c3 := Replicate('0', 45);
    {Para uso da SRF + Para uso do declarante}
    c3 := c3 + Space(43);
    c3 := c3 + #13#10;
    StrPCopy( p3, c3);
    Arquivo.Write( p3 );

    for k := 1 to 12 do
    begin
      avl_rend[k] := 0;
      avl_ir[k]   := 0;
    end;


    nr_seq := nr_seq + 1;

  end;
end;

procedure Tfrm_sel_col_fav.msk_cd_coligadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_coligada   then btn_cd_coligadaClick(nil);
    if Sender = msk_cd_favorecido then btn_co_favorecidoClick(nil);
    if Sender = msk_cd_recol      then btn_co_recolClick(nil);
  end;
end;

procedure Tfrm_sel_col_fav.msk_cd_recolExit(Sender: TObject);
begin
  edt_nm_recol.Clear;
  if msk_cd_recol.text = '' then
  begin
    edt_nm_recol.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_recol);
  With datm_sel_col_fav.qry_recol_ir_ Do
  begin
    Close;
    ParamByName('CD_RECOL').AsString := msk_cd_recol.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Código de Recolhimento de IR não encontrado!',2);
      msk_cd_recol.Clear;
      edt_nm_recol.Clear;
      msk_cd_recol.SetFocus;
    end
    else edt_nm_recol.Text:= FieldByName('NM_NATUREZA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_col_fav.btn_co_recolClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 25;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TCD_RECOL_IR';

  datm_consulta_padrao.Tabela.Filtered     := False;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := False; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' Coligada ';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_recol.Text := frm_consulta_padrao.Cons_OnLine_Texto;
  msk_cd_recolExit(nil);
end;

end.
