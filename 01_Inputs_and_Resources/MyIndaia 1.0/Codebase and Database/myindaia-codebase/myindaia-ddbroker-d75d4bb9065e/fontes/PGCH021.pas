unit PGCH021;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, ExtCtrls, Buttons, Funcoes;

type
  Tfrm_sel_mes_ano_produto = class(TForm)
    Panel1: TPanel;
    lbl_data: TLabel;
    msk_mes_ano: TMaskEdit;
    btn_imprimir: TButton;
    crp_Relacao: TCrpe;
    btn_sair: TButton;
    Label2: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    Label1: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Shape1: TShape;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Maior_Dia(Dia,Mes,Ano:Word):Word;
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    str_cd_relatorio : String;
    { Public declarations }
  end;

var
  frm_sel_mes_ano_produto: Tfrm_sel_mes_ano_produto;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, GSMLIB, PGCH022, PGSM010, PGSM018;

procedure Tfrm_sel_mes_ano_produto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_mes_ano_produto.btn_imprimirClick(Sender: TObject);
var DataInicial, DataFinal: TDateTime;
    nr_identificador, nr_identificador_sr: integer;
    Dia, Mes, Ano:word;
begin
  {if msk_cd_unid_neg.visible then
  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem('Informe a unidade.',2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;}

  if str_cd_relatorio <> '1' then
    if msk_cd_produto.Text = '' then
    begin
      BoxMensagem('O código do produto é obrigatório.',2);
      msk_cd_produto.SetFocus;
      Exit;
    end;

  try
    if ( StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ) < 1 ) or
       ( StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ) > 12 ) then
    begin
      BoxMensagem('Mês inválido',2);
      msk_mes_ano.Setfocus;
      msk_mes_ano.SelStart  := 0;
      msk_mes_ano.SelLength := 2;
      Exit;
    end;
  except
    on EConvertError do
    begin
      BoxMensagem('Mês inválido!',2);
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
      BoxMensagem('Ano inválido!',2);
      msk_mes_ano.Setfocus;
      msk_mes_ano.SelStart  := 3;
      msk_mes_ano.SelLength := 4;
      Exit;
    end;
  end;

  DataInicial :=
        EncodeDate(
        StrToInt( Copy( msk_mes_ano.Text, 4, 4 ) ),
        StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ), 1);
  DataFinal :=
        EncodeDate(
        StrToInt( Copy( msk_mes_ano.Text, 4, 4 ) ),
        StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ),
        Maior_Dia(31,
                  StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ),
                  StrToInt( Copy( msk_mes_ano.Text, 4, 4 ) ) ) );

  if str_cd_relatorio = '1' then
  begin
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;
      with datm_sel_mes_ano do
      begin
        CloseStoredProc(sp_ordena_rank_receita);
        if Trim(msk_cd_unid_neg.Text) = '' then
          sp_ordena_rank_receita.ParamByName('@cd_unid_neg').AsString := 'X'
        else
          sp_ordena_rank_receita.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
        if Trim(msk_cd_produto.Text) = '' then
          sp_ordena_rank_receita.ParamByName('@cd_produto').AsString  := 'X'
        else
          sp_ordena_rank_receita.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
        sp_ordena_rank_receita.ParamByName('@periodo_inicial').AsDateTime := DataInicial;
        sp_ordena_rank_receita.ParamByName('@periodo_final').AsDateTime   := DataFinal;
        ExecStoredProc(sp_ordena_rank_receita);
        nr_identificador := sp_ordena_rank_receita.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_ordena_rank_receita);
      end;
      with datm_sel_mes_ano do
      begin
        CloseStoredProc(sp_ordena_rank_receita_sr);
        DecodeDate(DataInicial - 1, Ano, Mes, Dia);
        if Trim(msk_cd_unid_neg.Text) = '' then
          sp_ordena_rank_receita_sr.ParamByName('@cd_unid_neg').AsString := 'X'
        else
          sp_ordena_rank_receita_sr.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
        if Trim(msk_cd_produto.Text) = '' then
          sp_ordena_rank_receita_sr.ParamByName('@cd_produto').AsString  := 'X'
        else
          sp_ordena_rank_receita_sr.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
        sp_ordena_rank_receita_sr.ParamByName('@periodo_inicial').AsDateTime     := DataInicial;
        sp_ordena_rank_receita_sr.ParamByName('@periodo_final').AsDateTime       := DataFinal;
        sp_ordena_rank_receita_sr.ParamByName('@periodo_inicial_ant').AsDateTime := EncodeDate(Ano, Mes, 01);
        sp_ordena_rank_receita_sr.ParamByName('@periodo_final_ant').AsDateTime   := DataInicial - 1;
        ExecStoredProc(sp_ordena_rank_receita_sr);
        nr_identificador_sr := sp_ordena_rank_receita_sr.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_ordena_rank_receita);
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Screen.Cursor := crDefault;
        TrataErro(E);
        Exit;
      end;
    end;

    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRFT013.RPT';
      Formulas[0] := 'Periodo_Inicial = ' + DataCrystal(DateToStr(DataInicial));
      Formulas[1] := 'Periodo_Final = '+ DataCrystal(DateToStr(DataFinal));
      Formulas[2] := 'nr_identificador = '+ IntToStr(nr_identificador);
      Formulas[3] := 'cd_produto  = "'+ msk_cd_produto.Text + '"';
      Formulas[4] := 'cd_unid_neg = "'+ msk_cd_unid_neg.Text + '"';
      Execute;
    end;
    with datm_sel_mes_ano.qry_apaga_rank_receita_ do
    begin
      ParamByName('nr_identificador').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
    end;
    with datm_sel_mes_ano.qry_apaga_rank_receita_sr_ do
    begin
      ParamByName('nr_identificador').AsInteger := nr_identificador_sr;
      Prepare;
      ExecSQL;
    end;
  end;

  if str_cd_relatorio = '2' then
  begin
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;
      with datm_sel_mes_ano do
      begin
        CloseStoredProc(sp_valores_cif_fob);
        sp_valores_cif_fob.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        sp_valores_cif_fob.ParamByName('@CD_PRODUTO').AsString  := msk_cd_produto.Text;
        sp_valores_cif_fob.ParamByName('@MES').AsInteger        := StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) );
        sp_valores_cif_fob.ParamByName('@ANO').AsInteger        := StrToInt( Copy( msk_mes_ano.Text, 4, 4 ) );
        ExecStoredProc(sp_valores_cif_fob);
        nr_identificador := sp_valores_cif_fob.ParamByName('@NR_IDENTIFICADOR').AsInteger;
        CloseStoredProc(sp_valores_cif_fob);
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Screen.Cursor := crDefault;
        TrataErro(E);
        Exit;
      end;
    end;

    with crp_Relacao do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName    := cDir_Rpt + '\CRGI005.RPT';
      if msk_cd_produto.Text = '01' then
        ReportTitle := 'Relatório de Valores CIF'
      else
        ReportTitle := 'Relatório de Valores FOB';
        Formulas[0] := 'mes = ' + Copy( msk_mes_ano.Text, 1, 2 );
        Formulas[1] := 'ano = ' + Copy( msk_mes_ano.Text, 4, 4 );
        Formulas[2] := 'cd_produto = "'+ msk_cd_produto.Text + '"';
        Formulas[3] := 'unid_prod = "'+ edt_nm_unid_neg.Text + ' / ' + edt_nm_produto.Text + '"';
        Formulas[4] := 'nr_identificador = '+ IntToStr( nr_identificador );
        Execute;
    end;
    with datm_sel_mes_ano.qry_apaga_valores_cif_fob_ do
    begin
      Close;
      UnPrepare;
      ParamByName('nr_identificador').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
      Close;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '3' then
  begin
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;

      with datm_sel_mes_ano do
      begin
        CloseStoredProc(sp_relacao_clientes);
        sp_relacao_clientes.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
        sp_relacao_clientes.ParamByName('@ano').AsString         := Copy( msk_mes_ano.Text, 4, 4 );
        sp_relacao_clientes.ParamByName('@mes').AsString         := Copy( msk_mes_ano.Text, 1, 2 );
        sp_relacao_clientes.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
        sp_relacao_clientes.ParamByName('@tipo_rel').AsString    := 'AA';
        ExecStoredProc(sp_relacao_clientes);
        nr_identificador                     := sp_relacao_clientes.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_relacao_clientes);
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Screen.Cursor := crDefault;
        TrataErro(E);
        Exit;
      end;
    end;

    With crp_Relacao Do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportTitle := Caption + #13 +
                    edt_nm_unid_neg.Text + ' - ' + edt_nm_produto.Text + #13 +
                    'Data de Referência: ' + msk_mes_ano.Text;
      ReportName  := cDir_Rpt + '\CRES005.RPT';
      Formulas[0] := 'nr_identificador = ' + IntToStr(nr_identificador) ;
      Formulas[1] := 'ano = ' + Copy( msk_mes_ano.Text, 4, 4 );
      Formulas[2] := 'mes = ' + Copy( msk_mes_ano.Text, 1, 2 );
      Execute;
    end;

    with datm_sel_mes_ano.qry_apaga_relacao_clientes_ do
    begin
      Close;
      UnPrepare;
      ParamByName('nr_identificador').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
      Close;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '4' then
  begin
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;

      with datm_sel_mes_ano do
      begin
        CloseStoredProc(sp_relacao_clientes);
        sp_relacao_clientes.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
        sp_relacao_clientes.ParamByName('@ano').AsString         := Copy( msk_mes_ano.Text, 4, 4 );
        sp_relacao_clientes.ParamByName('@mes').AsString         := Copy( msk_mes_ano.Text, 1, 2 );
        sp_relacao_clientes.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
        sp_relacao_clientes.ParamByName('@tipo_rel').AsString    := 'NN';
        ExecStoredProc(sp_relacao_clientes);
        nr_identificador                     := sp_relacao_clientes.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_relacao_clientes);
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Screen.Cursor := crDefault;
        TrataErro(E);
        Exit;
      end;
    end;

    With crp_Relacao Do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportTitle := Caption + #13 +
                    edt_nm_unid_neg.Text + ' - ' + edt_nm_produto.Text + #13 +
                    'Data de Referência: ' + msk_mes_ano.Text;
      ReportName  := cDir_Rpt + '\CRES005.RPT';
      Formulas[0] := 'nr_identificador = ' + IntToStr(nr_identificador) ;
      Formulas[1] := 'ano = ' + Copy( msk_mes_ano.Text, 4, 4 );
      Formulas[2] := 'mes = ' + Copy( msk_mes_ano.Text, 1, 2 );
      Execute;
    end;

    with datm_sel_mes_ano.qry_apaga_relacao_clientes_ do
    begin
      Close;
      UnPrepare;
      ParamByName('nr_identificador').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
      Close;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '5' then
  begin
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;

      with datm_sel_mes_ano do
      begin
        CloseStoredProc(sp_relacao_clientes);
        sp_relacao_clientes.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
        sp_relacao_clientes.ParamByName('@ano').AsString         := Copy( msk_mes_ano.Text, 4, 4 );
        sp_relacao_clientes.ParamByName('@mes').AsString         := Copy( msk_mes_ano.Text, 1, 2 );
        sp_relacao_clientes.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
        sp_relacao_clientes.ParamByName('@tipo_rel').AsString    := 'AN';
        ExecStoredProc(sp_relacao_clientes);
        nr_identificador                     := sp_relacao_clientes.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_relacao_clientes);
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Screen.Cursor := crDefault;
        TrataErro(E);
        Exit;
      end;
    end;

    With crp_Relacao Do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportTitle := Caption + #13 +
                     edt_nm_unid_neg.Text + ' - ' + edt_nm_produto.Text + #13 +
                     'Data de Referência: ' + msk_mes_ano.Text;
      ReportName  := cDir_Rpt + '\CRES005.RPT';
      Formulas[0] := 'nr_identificador = ' + IntToStr(nr_identificador) ;
      Formulas[1] := 'ano = ' + Copy( msk_mes_ano.Text, 4, 4 );
      Formulas[2] := 'mes = ' + Copy( msk_mes_ano.Text, 1, 2 );
      Execute;
    end;

    with datm_sel_mes_ano.qry_apaga_relacao_clientes_ do
    begin
      Close;
      UnPrepare;
      ParamByName('nr_identificador').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
      Close;
    end;
    Screen.Cursor := crDefault;
  end;

  if str_cd_relatorio = '6' then
  begin
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;

      with datm_sel_mes_ano do
      begin
        CloseStoredProc(sp_relacao_clientes);
        sp_relacao_clientes.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
        sp_relacao_clientes.ParamByName('@ano').AsString         := Copy( msk_mes_ano.Text, 4, 4 );
        sp_relacao_clientes.ParamByName('@mes').AsString         := Copy( msk_mes_ano.Text, 1, 2 );
        sp_relacao_clientes.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
        sp_relacao_clientes.ParamByName('@tipo_rel').AsString    := 'NA';
        ExecStoredProc(sp_relacao_clientes);
        nr_identificador                     := sp_relacao_clientes.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc(sp_relacao_clientes);
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Screen.Cursor := crDefault;
        TrataErro(E);
        Exit;
      end;
    end;

    With crp_Relacao Do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportTitle := Caption + #13 +
                     edt_nm_unid_neg.Text + ' - ' + edt_nm_produto.Text + #13 +
                     'Data de Referência: ' + msk_mes_ano.Text;
      ReportName  := cDir_Rpt + '\CRES005.RPT';
      Formulas[0] := 'nr_identificador = ' + IntToStr(nr_identificador) ;
      Formulas[1] := 'ano = ' + Copy( msk_mes_ano.Text, 4, 4 );
      Formulas[2] := 'mes = ' + Copy( msk_mes_ano.Text, 1, 2 );
      Execute;
    end;

    with datm_sel_mes_ano.qry_apaga_relacao_clientes_ do
    begin
      Close;
      UnPrepare;
      ParamByName('nr_identificador').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
      Close;
    end;
    Screen.Cursor := crDefault;
  end;

end;

procedure Tfrm_sel_mes_ano_produto.FormShow(Sender: TObject);
begin
  msk_mes_ano.Text := FormatDateTime('mm/yyyy', dt_server);

  case StrToInt(str_cd_relatorio) of
    1: begin
         Caption                 := 'Relatório de Ranking por Receita';
         Label1.Visible          := True;
         btn_co_unid_neg.Visible := True;
         msk_cd_unid_neg.Visible := True;
         edt_nm_unid_neg.Visible := True;
         {label2.Top              := label2.Top - 45;
         msk_cd_produto.Top      := msk_cd_produto.Top - 45;
         edt_nm_produto.Top      := edt_nm_produto.Top - 45;
         btn_co_produto.Top      := btn_co_produto.Top - 45;
         lbl_data.Top            := lbl_data.Top - 45;
         msk_mes_ano.Top         := msk_mes_ano.Top - 45;
         btn_imprimir.Top        := btn_imprimir.Top - 45;
         btn_sair.Top            := btn_sair.Top - 45;
         height                  := height - 45;}
       end;
    2: begin
         Caption                 := 'Relatório de Valores CIF/FOB';
         msk_cd_unid_neg.Text    := str_cd_unid_neg;
         msk_cd_produto.Text     := str_cd_produto;
         msk_cd_unid_negExit(nil);
         msk_cd_produtoExit(nil);
         btn_imprimir.SetFocus;
       end;
    3: Caption := 'Relação de Clientes Ativos';
    4: Caption := 'Relação de Clientes Não Ativos';
    5: Caption := 'Relação de Clientes Ativos para Não Ativos';
    6: Caption := 'Relação de Clientes Não Ativos para Ativos';
  end;
end;

procedure Tfrm_sel_mes_ano_produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_mes_ano do
  begin
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_apaga_rank_receita_.Close;
    qry_apaga_rank_receita_sr_.Close;
    qry_apaga_relacao_clientes_.Close;
    qry_apaga_valores_cif_fob_.Close;
    Free;
  end;
  crp_Relacao.Free;
  Action := caFree;
end;

function Tfrm_sel_mes_ano_produto.Maior_Dia(Dia,Mes,Ano:Word):Word;
begin
  Maior_Dia := Dia;
  try
    EncodeDate(Ano,Mes,Dia);
  except
    on EConvertError do
    begin
      Dec(Dia);
      Maior_Dia := Maior_Dia(Dia,Mes,Ano);
    end;
  end;
end;

procedure Tfrm_sel_mes_ano_produto.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_mes_ano, datm_sel_mes_ano);
end;

procedure Tfrm_sel_mes_ano_produto.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  With datm_sel_mes_ano.qry_produto_ Do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_Produto.Clear;
      msk_cd_Produto.SetFocus;
    end
    else edt_nm_produto.Text := FieldByName('AP_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_mes_ano_produto.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo  := '23';
  str_cd_rotina  := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_sel_mes_ano_produto.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_sel_mes_ano_produto.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with datm_sel_mes_ano.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else edt_nm_unid_neg.Text := FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_mes_ano_produto.msk_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

end.
