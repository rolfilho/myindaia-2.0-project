unit PGFT021;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, FileText, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32, ToolEdit, ExtCtrls, Funcoes;

type
  Tfrm_livro_iss = class(TForm)
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_mes_ano: TLabel;
    msk_mes_ano: TMaskEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Crp_pagto_ISS: TCrpe;
    Label2: TLabel;
    lbl_folha: TLabel;
    cbo_folha: TComboBox;
    msk_dt_impressao: TDateEdit;
    chkGeraArquivo: TCheckBox;
    msk_nr_nota: TMaskEdit;
    Label1: TLabel;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    function Maior_Dia(Dia,Mes,Ano:Word):Word;
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_notaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tp_relatorio : Integer;
    {1 - Notas Fiscais
     2 - Folha de Abertura/Encerramento }
  end;

var
  frm_livro_iss: Tfrm_livro_iss;
  Arquivo : TFileText;

implementation

{$R *.DFM}

uses GSMLIB, PGSM018, PGFT022, PGGP001, PGGP017;

procedure Tfrm_livro_iss.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm( Tfrm_unidade, frm_unidade );
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_livro_iss.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then Exit;
  ValCodEdt( msk_cd_unid_neg );
  with datm_livro_iss.qry_unid_neg_ do
  begin
    Close;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else
    begin
      edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    end;
    Close;
  end;
end;

function Tfrm_livro_iss.Maior_Dia( Dia, Mes, Ano : Word ):Word;
begin
  Maior_Dia := Dia;
  try
    EncodeDate(Ano,Mes,Dia);
  except
    on EConvertError do
    begin
      Dec(Dia);
      Maior_Dia:= Maior_Dia(Dia,Mes,Ano);
    end;
  end;
end;

function Replicate( Caracter:String; Quant:Integer ): String;
{Repete o mesmo caractere várias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;


procedure Tfrm_livro_iss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_livro_iss.Free;
  Crp_pagto_ISS.Free;
  Action := caFree;
end;

procedure Tfrm_livro_iss.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_livro_iss, datm_livro_iss );
end;

procedure Tfrm_livro_iss.OKBtnClick(Sender: TObject);
var nr_identificador :Integer;
    GeraArquivo, str_vl_nota :String;
var cTexto,vArquivo : String;
    vString : TStrings;
    pTexto : Array[0..1024] of Char;
begin
  nr_identificador := 0;

  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem( 'A unidade de negócio é obrigatório!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if tp_relatorio = 1 then
  begin
    try
      if ( StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ) < 1 ) or
         ( StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ) > 12 ) then
      begin
        BoxMensagem( 'Mês inválido', 2 );
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart  := 0;
        msk_mes_ano.SelLength := 2;
        Exit;
      end;
    except
      on EConvertError do
      begin
        BoxMensagem( 'Mês inválido!', 2 );
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart  := 0;
        msk_mes_ano.SelLength := 2;
        Exit;
      end;
    end;

    try
      StrToInt( Copy( msk_mes_ano.Text, 4, 4 ) );
    except
      on EConvertError do
      begin
        BoxMensagem( 'Ano inválido!', 2 );
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart  := 3;
        msk_mes_ano.SelLength := 4;
        Exit;
      end;
    end;

    try
      StrToDate( msk_dt_impressao.Text );
    except
      on EConvertError do
      begin
        BoxMensagem( 'Data inválida!', 2 );
        msk_dt_impressao.SetFocus;
        msk_dt_impressao.SelectAll;
        Exit;
      end;
    end;

    if ( StrToInt( Copy( msk_mes_ano.Text, 4, 4 ) ) <= 2002 ) and
       ( StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ) < 7 ) then
    begin
      BoxMensagem( 'Rotina válida somente para 07/2002 em diante!', 2 );
      msk_mes_ano.SetFocus;
      Exit;
    end;
  end;

  with datm_livro_iss, Crp_pagto_ISS do
  begin

    qry_fatura_.Close;
    qry_fatura_.Prepare;
    qry_fatura_.Open;

    case tp_relatorio of
      1 : begin
            try
              Screen.Cursor := crHourGlass;
              datm_main.db_broker.StartTransaction;

                Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
                ReportName  := cDir_Rpt + '\CRFT021.RPT';

                if chkGeraArquivo.Checked = True then GeraArquivo := '1' else GeraArquivo := '0';

              {CloseStoredProc( sp_rel_fat_livro_fiscal );
              sp_rel_fat_livro_fiscal.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
              sp_rel_fat_livro_fiscal.ParamByName('@mes').AsString         := Copy( msk_mes_ano.Text, 1, 2 );
              sp_rel_fat_livro_fiscal.ParamByName('@ano').AsString         := Copy( msk_mes_ano.Text, 4, 4 );
              ExecStoredProc( sp_rel_fat_livro_fiscal );
              if sp_rel_fat_livro_fiscal.ParamByName('Result').AsInteger = 1 then
              begin
                BoxMensagem( 'Dados Incorretos!' + #13#10 + 'Informe ao Administrador de Sistemas.', 2 );
              end
              else
              begin
                nr_identificador := sp_rel_fat_livro_fiscal.ParamByName('@nr_identificador').AsInteger;
              end;
              CloseStoredProc( sp_rel_fat_livro_fiscal );  }
              datm_main.db_broker.Commit;
            except
              on E: Exception do
                begin
                  CloseStoredProc( sp_rel_fat_livro_fiscal );
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                  Exit;
                end;
            end;
            Screen.Cursor := crDefault;

            nr_identificador:=1;
            if nr_identificador = 0 then
               Exit;

            WindowState := wsMaximized;
            Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
            Formulas[1] := 'Dia_Impressao = ' + Copy( msk_dt_impressao.Text, 1, 2 );
            Formulas[2] := 'Mes_Impressao = ' + Copy( msk_dt_impressao.Text, 4, 2 );
            Formulas[3] := 'Ano_Impressao = ' + Copy( msk_dt_impressao.Text, 7, 4 );

            Screen.Cursor := crDefault;
            Application.ProcessMessages;

            if GeraArquivo = '0' then Execute;

            if GeraArquivo = '1' then
              begin
                qry_fatura_.Close;
                qry_fatura_.ParamByName ('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
                qry_fatura_.ParamByName ('NR_NOTA').AsString := Trim( msk_nr_nota.Text );
                qry_fatura_.ParamByName('NR_IDENTIFICADOR').AsString := IntToStr (nr_identificador);
                qry_fatura_.Prepare;
                qry_fatura_.Open;
                qry_fatura_.First;

                Arquivo      := TFileText.Create;
                Arquivo.Name := cDir_Rpt + '\GISS' + Copy( msk_mes_ano.Text,1 ,2) + Copy( msk_mes_ano.Text, 4, 4) + '.dat';
                Arquivo.CreateFile;

                cTexto :=('CD_INDICADOR||NR_LAYOUT||DT_EMISSAO_NF||NR_DOC_NF_INICIAL||NR_DOC_NF_SERIE||NR_DOC_NF_FINAL||TP_DOC_NF||' +
                'VL_DOC_NF||VL_BASE_CALCULO||CD_ATIVIDADE||CD_PREST_TOM_ESTABELECIDO||CD_LOCAL_PRESTACAO||NM_RAZAO_SOCIAL||'+
                'NR_CNPJ_CPF||CD_TIPO_CADASTRO||NR_INSCRICAO_MUNICIPAL||NM_INSCRICAO_MUNICIPAL_DV||NR_INSCRICAO_ESTADUAL||'  +
                'NM_TIPO_LOGRADOURO||NM_TITULO_LOGRADOURO||NM_LOGRADOURO||NM_COMPL_LOGRADOURO||NR_LOGRADOURO||CD_CEP||NM_BAIRRO||'  +
                'CD_ESTADO||NM_CIDADE||CD_PAIS||NM_OBSERVACAO||CD_PLANO_CONTA||CD_ALVARA||IC_ORIGEM_DADOS||IC_ENQUADRAMENTO||CD_PLANO_CONTA_PAI||' +
                'IC_RECOLHE_IMPOSTO||VL_ALIQUOTA||FL_ISENTO||FL_SIMPLES');
                cTexto := cTexto + #13#10;
                while not qry_fatura_.EOF do
                begin
                  str_vl_nota := FormatFloat( '#0.00', qry_fatura_VL_TRIB.AsFloat );  

                  cTexto := cTexto + qry_fatura_CONTRIBUINTE.AsString + '||';
                    cTexto := cTexto + qry_fatura_NR_LAYOUT.AsString+'||';
                    cTexto := cTexto + qry_fatura_DT_NF.AsString+'||';
                    cTexto := cTexto + qry_fatura_NR_NF_INICIO.AsString +'||';
                    cTexto := cTexto + qry_fatura_NR_SERIE_NF.AsString+'||';
                    cTexto := cTexto + qry_fatura_NR_NF_FIM.AsString+'||';
                    cTexto := cTexto + qry_fatura_SITUACAO.AsString+'||';
                    //cTexto := cTexto + Copy('000000000000', 1, 12 - (Length( str_vl_nota ) - 1)) + Copy( str_vl_nota, 1, Pos( ',', str_vl_nota ) - 1 )+'||';
                    cTexto := cTexto + Copy('000000000000', 1, 12 - (Length( str_vl_nota ) - 1)) + Copy( str_vl_nota, 1, Pos( ',', str_vl_nota ) - 1 )+ Copy( str_vl_nota, Length( str_vl_nota ) - 1, 2 )+'||';
                    cTexto := cTexto + Copy('000000000000', 1, 12 - (Length( str_vl_nota ) - 1)) + Copy( str_vl_nota, 1, Pos( ',', str_vl_nota ) - 1 )+ Copy( str_vl_nota, Length( str_vl_nota ) - 1, 2 )+'||';
                    cTexto := cTexto + qry_fatura_ATIVIDADE.AsString+'||';
                    cTexto := cTexto + qry_fatura_fESTABELECIDA_MUNICIPIO.AsString+'||';
                    cTexto := cTexto + qry_fatura_CD_LOCAL_PRESTACAO.AsString+'||';
                    cTexto := cTexto + qry_fatura_NM_EMPRESA.AsString+'||';
                    cTexto := cTexto + qry_fatura_CGC_EMPRESA.AsString+'||';
                    cTexto := cTexto + qry_fatura_CD_TIPO_CADASTRO.AsString+'||';
                    cTexto := cTexto + qry_fatura_INSCR_MUNICIPAL.AsString+'||';
                    cTexto := cTexto + qry_fatura_DIGITO_INSCR_MUNICIPAL.AsString+'||';
                    cTexto := cTexto + qry_fatura_INSCR_ESTADUAL.AsString+'||';
                    cTexto := cTexto + qry_fatura_TP_LOGRAD.AsString+'||';
                    cTexto := cTexto + qry_fatura_TITULO_LOGRAD.AsString+'||';
                    cTexto := cTexto + qry_fatura_END_EMPRESA.AsString+'||';
                    cTexto := cTexto + qry_fatura_END_COMPL.AsString+'||';
                    cTexto := cTexto + qry_fatura_END_NUMERO.AsString+'||';
                    cTexto := cTexto + qry_fatura_END_CEP.AsString+'||';
                    cTexto := cTexto + qry_fatura_END_BAIRRO.AsString+'||';
                    cTexto := cTexto + qry_fatura_END_UF.AsString+'||';
                    cTexto := cTexto + qry_fatura_END_CIDADE.AsString+'||';
                    cTexto := cTexto + qry_fatura_CD_PAIS.AsString+'||';
                    cTexto := cTexto + qry_fatura_NM_OBSERVACAO.AsString+'||';
                    cTexto := cTexto + qry_fatura_CD_PLANO_CONTA.AsString+'||';
                    cTexto := cTexto + qry_fatura_CD_ALVARA.AsString+'||';
                    cTexto := cTexto + qry_fatura_IC_ORIGEM_DADOS.AsString+'||';
                    cTexto := cTexto + qry_fatura_IC_ENQUADRAMENTO.AsString+'||';
                    cTexto := cTexto + qry_fatura_CD_PLANO_CONTA_PAI.AsString+'||';
                    cTexto := cTexto + qry_fatura_IC_RECOLHE_IMPOSTO.AsString+'||';
                    cTexto := cTexto + qry_fatura_VL_ALIQUOTA.AsString+'||';
                    cTexto := cTexto + qry_fatura_fISENTO_INSCR_ESTADUAL.AsString+'||';
                    cTexto := cTexto + qry_fatura_FL_SIMPLES.AsString  ;
                    cTexto := cTexto + #13#10;
                    StrPCopy( pTexto, cTexto );
                    Arquivo.Write( pTexto );
                    cTexto := '';
                   
                    qry_fatura_.Next;
                  end;
                  qry_fatura_.Close;
                BoxMensagem( 'Arquivo gerado com sucesso!', 3 );
              end;

            ApagaDados( 'TREL_FAT_LIVRO_FISCAL', nr_identificador );
            ApagaDados( 'TREL_FAT_LIVRO_FISCAL_CANC', nr_identificador );
            ApagaDados( 'TREL_FAT_LIVRO_FISCAL_ISS', nr_identificador );
            ApagaDados( 'TREL_FAT_LIVRO_FISCAL_TOTAIS', nr_identificador );
            ApagaDados( 'TREL_FAT_LIVRO_FISCAL_CANC_GISS', nr_identificador );
            ApagaDados( 'TREL_FAT_LIVRO_FISCAL_GISS', nr_identificador );
          end;
      2 : begin
            Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
            ReportName  := cDir_Rpt + '\CRFT041.RPT';
            Formulas[0] := 'UnidNeg = "' + Trim( msk_cd_unid_neg.Text ) + '"';
            if cbo_folha.ItemIndex = 0 then
              Formulas[1] := 'Termo = "TERMO DE ABERTURA"'
            else
              Formulas[1] := 'Termo = "TERMO DE ENCERRAMENTO"';
            Formulas[2] := 'Dia_Impressao = ' + Copy( msk_dt_impressao.Text, 1, 2 );
            Formulas[3] := 'Mes_Impressao = ' + Copy( msk_dt_impressao.Text, 4, 2 );
            Formulas[4] := 'Ano_Impressao = ' + Copy( msk_dt_impressao.Text, 7, 4 );
            Execute;
          end;
    end;
  end;
end;

procedure Tfrm_livro_iss.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_livro_iss.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text  := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_dt_impressao.Text := DateToStr( dt_server );
  if tp_relatorio = 1 then
    msk_mes_ano.SetFocus;

  if tp_relatorio = 2 then
  begin
    lbl_mes_ano.Visible := False;
    msk_mes_ano.Visible := False;
    lbl_folha.Visible   := True;
    cbo_folha.Visible   := True;
    lbl_folha.Left      := lbl_mes_ano.Left;
    cbo_folha.Left      := msk_mes_ano.Left;
    cbo_folha.ItemIndex := 0;
    cbo_folha.SetFocus;
  end;
end;

procedure Tfrm_livro_iss.msk_nr_notaExit(Sender: TObject);
begin
  if Trim( msk_nr_nota.Text ) <> '' then
    msk_nr_nota.Text := StrZero( StrToInt( msk_nr_nota.Text ), 6 );
end;

end.
