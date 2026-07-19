unit PGGA023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, DBCtrls, Funcoes, ConsOnlineEx,
  Grids, DBGrids, ToolEdit;

type
  Tfrm_sel_unid_prod_via = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;                    
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    crp_unid_prod_via: TCrpe;
    dblckpbox_via_transporte: TDBLookupComboBox;
    lbl_via_transp: TLabel;
    btn_imprimir: TButton;
    btn_sair: TButton;
    chk_proc: TCheckBox;
    lbl1: TLabel;
    medtCelula: TMaskEdit;
    edt_nm_celula: TEdit;
    btnCelula: TSpeedButton;
    btn_imprimirExp: TButton;
    Panel2: TPanel;
    rbDetalhado: TRadioButton;
    rbSimples: TRadioButton;
    gbPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    dteInicial: TDateEdit;
    lblDataFinal: TLabel;
    dteFinal: TDateEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCelulaClick(Sender: TObject);
    procedure medtCelulaExit(Sender: TObject);
    procedure btn_imprimirExpClick(Sender: TObject);
  private
  public
    tp_rel : Integer;
  end;

var
  frm_sel_unid_prod_via: Tfrm_sel_unid_prod_via;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGGA024, PGSM010, PGSM018, PGSM990;

procedure Tfrm_sel_unid_prod_via.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_prod_via.msk_cd_unid_negExit(Sender: TObject);
begin
{  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_prod_via do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end; }

  if msk_cd_unid_neg.Text = '' then
    edt_nm_unid_neg.Text := 'Todas'
  else begin
    msk_cd_unid_neg.Text := Copy('00', 1 ,2 - Length(msk_cd_unid_neg.Text) ) + msk_cd_unid_neg.Text;
    if edt_nm_unid_neg.Text = '' then begin
      ShowMessage('Unidade de Negócio não cadastrada!');
      msk_cd_unid_neg.Text := '';
      msk_cd_unid_neg.SetFocus;
    end;
  end;

end;

procedure Tfrm_sel_unid_prod_via.btn_co_unid_negClick(Sender: TObject);
begin
{  with datm_sel_unid_prod_via do
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
  end;   }

  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG',nil, 1 ,msk_cd_unid_neg.Text)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG')

end;

procedure Tfrm_sel_unid_prod_via.btn_imprimirClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  (*with crp_unid_prod_via do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    if tp_rel = 1 then
      ReportName  := cDir_Rpt + '\CRGI013.RPT'
    else
      ReportName  := cDir_Rpt + '\CRGE003.RPT';

    if datm_sel_unid_prod_via.qry_via_transp_broker_CD_VIA_TRANSP.AsString = '01' then {Marítimo}
      ReportTitle := 'Posição de Navios'
    else if datm_sel_unid_prod_via.qry_via_transp_broker_CD_VIA_TRANSP.AsString = '04' then {Aéreo}
      ReportTitle := 'Posição de Vôos';

    Formulas[0] := 'Unidade = "' + msk_cd_unid_neg.Text + '"';
    Formulas[1] := 'ViaTransporte = "'+ datm_sel_unid_prod_via.qry_via_transp_broker_CD_VIA_TRANSP.AsString + '"';
    if chk_proc.Checked then
      Formulas[2] := 'ExibeProcessos = 1'
    else
      Formulas[2] := 'ExibeProcessos = 0';
    Formulas[3] := 'celula = "' + Trim(medtCelula.Text) + '"';

    Execute;
  end; *) // utilizando reportbuilder - Michel - 11/11/2009
  // Se a data final for menor que a data inicial
  if dteFinal.Date < dteInicial.Date then
  begin
    MessageDlg('A data final deve ser maior que a data incial.', mtError, [mbOK], 0);
    dteFinal.SetFocus;
    Exit;
  end;

  Application.CreateForm(TFrm_impressao, Frm_impressao);
  frm_impressao.cd_unid_neg   := msk_cd_unid_neg.text;
  frm_impressao.cd_produto    := '01';
  frm_impressao.cd_via_transp := dblckpbox_via_transporte.KeyValue;
  frm_impressao.vApenas_email := False;

  if rbSimples.Checked then
    with datm_sel_unid_prod_via.qry_viagens_imp do
    begin
      if Active then
        Close;
      if Trim(msk_cd_unid_neg.Text) <> '' then
        ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text
      else
        ParamByName('CD_UNID_NEG').AsString := 'XX';
      if Trim(medtCelula.Text) <> '' then
        ParamByName('CD_CELULA').AsString := medtCelula.Text
      else
        ParamByName('CD_CELULA').AsString := 'XX';
      ParamByName('CD_VIA_TRANSPORTE').AsString := dblckpbox_via_transporte.KeyValue;
      ParamByName('DT_INICIAL').AsDateTime      := dteInicial.Date;
      ParamByName('DT_FINAL').AsDateTime        := dteFinal.Date;
      Open;
      frm_impressao.cd_modulo := '1595';
    end
  else
    with datm_sel_unid_prod_via.qry_viagens_detalhe_imp do
    begin
      if Active then
        Close;
      if Trim(msk_cd_unid_neg.Text) <> '' then
        ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text
      else
        ParamByName('CD_UNID_NEG').AsString := 'XX';
      if Trim(medtCelula.Text) <> '' then
        ParamByName('CD_CELULA').AsString := medtCelula.Text
      else
        ParamByName('CD_CELULA').AsString := 'XX';
      ParamByName('CD_VIA_TRANSPORTE').AsString := dblckpbox_via_transporte.KeyValue;
      ParamByName('DT_INICIAL').AsDateTime      := dteInicial.Date;
      ParamByName('DT_FINAL').AsDateTime        := dteFinal.Date;
      Open;
      frm_impressao.cd_modulo := '1596';
    end;

  Frm_impressao.vBeforePrint  := datm_sel_unid_prod_via.pBeforePrintImp;
  frm_impressao.ShowModal;
  frm_impressao.Release;
  FreeAndNil(frm_impressao);

  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_unid_prod_via.FormShow(Sender: TObject);
const
  arCaptions: array[1..2] of String = ('Posição de Veículos - Importação', 'Posição de Veículos - Exportação');
  arPeriodos: array[1..2] of String = ('Período Previsto Para Chegada', 'Período Previsto Para Saída');
begin
  {if tp_rel = 1 then
  begin
    Caption             := 'Posição de Veículos - Importação';
    Self.Height         := 196;
    btn_imprimir.Top    := 135;
    btn_imprimirExp.Top := 135;
    btn_sair.Top        := 135;
    lblDataInicial.Visible:= False;
    lblDataFinal.Visible:= False;
    dteInicial.Visible:= False;
    dteFinal.Visible:= False; // Solicitado para que se possa utilizar a data - Michel - 10/11/2009
  end
  else
    Caption := 'Posição de Veículos - Exportação';}

  Caption           := arCaptions[tp_rel];
  gbPeriodo.Caption := arPeriodos[tp_rel];

  btn_imprimir.Visible    := tp_rel = 1;
  btn_imprimirExp.Visible := tp_rel = 2;

  with datm_sel_unid_prod_via do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    qry_via_transp_broker_.Close;
    qry_via_transp_broker_.Prepare;
    qry_via_transp_broker_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  medtCelulaExit(nil);
  dblckpbox_via_transporte.SetFocus;
end;

procedure Tfrm_sel_unid_prod_via.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_unid_prod_via do
  begin
    qry_via_transp_broker_.Close;
    qry_unid_neg_.Close;
    Free;
  end;
  crp_unid_prod_via.Free;
  Action := caFree;
end;

procedure Tfrm_sel_unid_prod_via.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Recebimento}
  Application.CreateForm( Tdatm_sel_unid_prod_via, datm_sel_unid_prod_via );

  dblckpbox_via_transporte.KeyValue := '01';

  dteInicial.Date:= Date;
  dteFinal.Date:= Date;
end;

procedure Tfrm_sel_unid_prod_via.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = medtCelula      then btnCelulaClick(btnCelula);
  end;
end;
procedure Tfrm_sel_unid_prod_via.btnCelulaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    medtCelula.Text := ConsultaOnLineEx('TCELULA','Célula',['CD_CELULA','NM_CELULA'],['Código','Descrição'],'CD_CELULA',nil, 1 ,medtCelula.Text)
  else
    edt_nm_celula.Text := ConsultaLookUP('TCELULA','CD_CELULA',medtcelula.Text,'NM_CELULA')
end;

procedure Tfrm_sel_unid_prod_via.medtCelulaExit(Sender: TObject);
begin
  if medtCelula.Text = '' then
    edt_nm_celula.Text := 'Todos'
  else
  begin
    medtCelula.Text := Copy('00', 1 ,2 - Length(medtCelula.Text) ) + medtCelula.Text;
    if edt_nm_celula.Text = '' then
    begin
      ShowMessage('Célula inválida!');
      medtCelula.Text := '';
      medtCelula.SetFocus;
    end;
  end;


end;

procedure Tfrm_sel_unid_prod_via.btn_imprimirExpClick(Sender: TObject);
begin
  // Se a data final for menor que a data inicial
  if dteFinal.Date < dteInicial.Date then
  begin
    MessageDlg('A data final deve ser maior que a data incial.', mtError, [mbOK], 0);
    dteFinal.SetFocus;
    Exit;
  end;

  Application.CreateForm(TFrm_impressao, Frm_impressao );
  frm_impressao.cd_unid_neg   := msk_cd_unid_neg.text;
  frm_impressao.cd_produto    := '02';
  frm_impressao.cd_via_transp := dblckpbox_via_transporte.KeyValue;
  frm_impressao.vApenas_email := False;

  with datm_sel_unid_prod_via.qry_detalhe do
  begin
    datm_sel_unid_prod_via.qry_detalhe_Deadline.Close;
    Close;
    Sql.Clear;
    if rbSimples.Checked then
    begin
      frm_impressao.cd_modulo     := '1593';

      SQL.Add(' SELECT EM.NM_EMBARCACAO,                                                             ');
      SQL.Add('        SUBSTRING(V.NR_VIAGEM, 1,2) + ''.'' + SUBSTRING(V.NR_VIAGEM, 3,2) NR_VIAGEM,  ');
      SQL.Add('        V.DT_ESPERADA,                                                                ');
      SQL.Add('        V.DT_ENT,                                                                     ');
      SQL.Add('        LE.DESCRICAO,                                                                 ');
      SQL.Add('        AZ.NM_ARMAZEM                                                                 ');
      SQL.Add(' FROM TVIAGEM V INNER JOIN TPROCESSO P ON P.CD_UNID_NEG   =  V.CD_UNID_NEG            ');
      SQL.Add('                                      AND P.CD_PRODUTO    =  V.CD_PRODUTO             ');
      SQL.Add('                                      AND P.CD_EMBARCACAO =  V.CD_EMBARCACAO          ');
      SQL.Add('                                      AND P.NR_VIAGEM     =  V.NR_VIAGEM              ');
      SQL.Add('    LEFT JOIN TARMAZEM AZ ON AZ.CD_ARMAZEM = V.CD_ARMAZEM_ATRACACAO                   ');
      SQL.Add('    INNER JOIN TUNID_NEG U ON U.CD_UNID_NEG = V.CD_UNID_NEG                           ');
      SQL.Add('    INNER JOIN TFOLLOWUP FU ON FU.NR_PROCESSO =  P.NR_PROCESSO                        ');
      SQL.Add('    LEFT JOIN TEMBARCACAO EM ON EM.CD_EMBARCACAO = V.CD_EMBARCACAO                    ');
      SQL.Add('    LEFT JOIN TLOCAL_EMBARQUE LE ON LE.CODIGO = P.CD_LOCAL_EMBARQUE                   ');
      SQL.Add(' WHERE :CD_UNID_NEG IN (V.CD_UNID_NEG, ''XX'')                                        ');
      SQL.Add('   AND :CD_CELULA   IN (P.CD_CELULA, ''XX'')                                          ');
      SQL.Add('   AND V.DT_ESPERADA BETWEEN :DT_INICIO AND :DT_FIM                                   ');
      SQL.Add('   AND V.CD_PRODUTO               =  ''02''                                           ');
      SQL.Add('   AND P.IN_CANCELADO             =  ''0''                                            ');
      SQL.Add('   AND FU.CD_EVENTO               =  ''289''                                          ');
      SQL.Add('   AND ISNULL(DT_REALIZACAO, '''')  =  ''''                                           ');
      SQL.Add(' GROUP BY EM.NM_EMBARCACAO,                                                           ');
      SQL.Add('          V.NR_VIAGEM,                                                                ');
      SQL.Add('          V.DT_ESPERADA,                                                              ');
      SQL.Add('          V.DT_ENT,                                                                   ');
      SQL.Add('          LE.DESCRICAO,                                                               ');
      SQL.Add('          AZ.NM_ARMAZEM                                                               ');
      SQL.Add(' ORDER BY V.DT_ESPERADA,                                                              ');
      SQL.Add('          V.NR_VIAGEM,                                                                ');
      SQL.Add('          EM.NM_EMBARCACAO                                                            ');
      ParamByName('DT_INICIO').DataType := ftDateTime;
      ParamByName('DT_INICIO').AsDateTime := dteInicial.Date;
      ParamByName('DT_FIM').DataType := ftDateTime;
      ParamByName('DT_FIM').AsDateTime := dteFinal.Date;
      if Trim(msk_cd_unid_neg.Text) <> '' then
        ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text
      else
        ParamByName('CD_UNID_NEG').AsString := 'XX';
      if Trim(medtCelula.Text) <> '' then
        ParamByName('CD_CELULA').AsString := medtCelula.Text
      else
        ParamByName('CD_CELULA').AsString := 'XX';
    end
    else
    begin
      frm_impressao.cd_modulo     := '1548';

      Sql.Add(' SELECT');
      Sql.Add('   V.CD_UNID_NEG, V.CD_PRODUTO, V.CD_EMBARCACAO, V.NR_VIAGEM, SUBSTRING(V.NR_VIAGEM, 1,2) + ''/'' +');
      Sql.Add('   SUBSTRING(V.NR_VIAGEM, 3,2) NR_VIAGEM_MASK,  P.NR_PROCESSO, EN.AP_EMPRESA, A.CD_AGENTE,');
      Sql.Add('   A.NM_AGENTE, P.TP_ESTUFAGEM, SUBSTRING(P.NR_PROCESSO, 5, 12) PROCESSO, V.DT_ENT, V.DT_ESPERADA, ');
      Sql.Add('   V.NR_VIAGEM_ARMADOR');
      Sql.Add(' FROM TVIAGEM V');
      Sql.Add('   inner join TPROCESSO P on V.CD_UNID_NEG = P.CD_UNID_NEG AND V.CD_PRODUTO = P.CD_PRODUTO and V.CD_EMBARCACAO = P.CD_EMBARCACAO AND V.NR_VIAGEM = P.NR_VIAGEM');
      Sql.Add('   inner join TAGENTE A on P.CD_AGENTE     = A.CD_AGENTE');
      Sql.Add('   inner join TUNID_NEG U on U.CD_UNID_NEG   = P.CD_UNID_NEG  AND V.CD_PRODUTO    = ''02''');
      Sql.Add('   inner join TEMPRESA_NAC EN on P.CD_CLIENTE    = EN.CD_EMPRESA');
      Sql.Add('   inner join TVIAGEM_DEADLINE VD on VD.CD_UNID_NEG = V.CD_UNID_NEG and VD.CD_PRODUTO =  P.CD_PRODUTO  AND VD.CD_EMBARCACAO = P.CD_EMBARCACAO AND VD.NR_VIAGEM  =  P.NR_VIAGEM');
      Sql.Add('   inner join TFOLLOWUP FU on FU.NR_PROCESSO   = P.NR_PROCESSO and FU.CD_EVENTO  = ''289'' AND ISNULL(DT_REALIZACAO,'''')  = ''''');
      Sql.Add(' WHERE ');
      Sql.Add('   P.IN_CANCELADO  = ''0'' and ');

      if Trim(msk_cd_unid_neg.Text) <> '' then
        Sql.Add(' V.CD_UNID_NEG = '''  + msk_cd_unid_neg.Text + ''' AND ');
      if Trim(medtCelula.Text) <> '' then
        Sql.Add(' P.CD_CELULA = '''  + medtCelula.Text + ''' AND ');

      // Linhas adicionadas para filtrar por data - Michel 15/10/2008
      Sql.Add('  V.DT_ESPERADA between CONVERT(DATETIME,''' + DateToStr(dteInicial.Date) + ''',103) AND CONVERT(DATETIME,''' + DateToStr(dteFinal.Date) + ''',103)');

 {     Sql.Add('FROM TVIAGEM V, TPROCESSO P, TAGENTE A, TUNID_NEG U, TEMPRESA_NAC EN, TVIAGEM_DEADLINE VD, TFOLLOWUP FU');
      Sql.Add('WHERE');
      Sql.Add('  V.CD_UNID_NEG   = P.CD_UNID_NEG    AND V.CD_PRODUTO    = P.CD_PRODUTO     AND');
      Sql.Add('  V.CD_EMBARCACAO = P.CD_EMBARCACAO  AND V.NR_VIAGEM     = P.NR_VIAGEM      AND');
      Sql.Add('  P.CD_AGENTE     = A.CD_AGENTE      AND P.CD_CLIENTE    = EN.CD_EMPRESA    AND');
      Sql.Add('  U.CD_UNID_NEG   = P.CD_UNID_NEG    AND V.CD_PRODUTO    = ''02''           AND');
      Sql.Add('  P.IN_CANCELADO  = ''0''            AND VD.CD_UNID_NEG = V.CD_UNID_NEG     AND');
      Sql.Add('  VD.CD_PRODUTO   =  P.CD_PRODUTO    AND VD.CD_EMBARCACAO = P.CD_EMBARCACAO AND');
      Sql.Add('  VD.NR_VIAGEM    =  P.NR_VIAGEM     AND FU.NR_PROCESSO   = P.NR_PROCESSO   AND');
      Sql.Add('  FU.CD_EVENTO    =    ''289''       AND ISNULL(DT_REALIZACAO,'''')  = '''' ');}

      Sql.Add(' GROUP BY');
      Sql.Add('   V.CD_UNID_NEG, V.CD_PRODUTO, V.CD_EMBARCACAO, V.NR_VIAGEM, P.NR_PROCESSO, EN.AP_EMPRESA, A.CD_AGENTE,');
      Sql.Add('   A.NM_AGENTE, P.TP_ESTUFAGEM, V.DT_ENT, V.DT_ESPERADA, V.NR_VIAGEM_ARMADOR');
      Sql.Add(' ORDER BY V.CD_EMBARCACAO, V.NR_VIAGEM, V.DT_ESPERADA');
      //, V.CD_UNID_NEG, V.CD_PRODUTO, V.CD_EMBARCACAO, V.NR_VIAGEM, P.NR_PROCESSO, EN.AP_EMPRESA, A.NM_AGENTE');
    end;
    Open;

    Frm_impressao.vBeforePrint  := datm_sel_unid_prod_via.pBeforePrint;
    frm_impressao.ShowModal;
    frm_impressao.Release;
    FreeAndNil(frm_impressao);
  end;
end;

end.



