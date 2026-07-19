unit PGPE041;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Funcoes, ConsOnlineEx,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar;

type
  Tfrm_exp_impr_saque = class(TForm)
    pnlAux: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    btn_co_proc_new: TSpeedButton;
    btn_cd_unid_neg: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_nr_saque: TMaskEdit;
    Modelo: TComboBox;
    shpAux: TShape;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure RetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure msk_nr_saqueExit(Sender: TObject);
  private
    { Private declarations }
    procedure pBeforePrint(Sender:TObject);
    procedure pBeforePrint2(Sender:TObject);
  public
    { Public declarations }
  end;

var
  frm_exp_impr_saque: Tfrm_exp_impr_saque;
  ReportFileName : String;

implementation

USES PGPE042, PGGP015, GSMLIB, PGGP001, PGSM018, PGGP031, PGSM136, PGGP017,
  PGSM990;


{$R *.DFM}

procedure Tfrm_exp_impr_saque.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then begin
    msk_cd_unid_neg.Text := Copy('00', 1, 2 - Length(msk_cd_unid_neg.Text)) +  msk_cd_unid_neg.Text;
    if edt_nm_unid_neg.Text = '' then begin
      ShowMessage('Unidade de Negócio inválida ou inexistente!');
      msk_cd_unid_neg.SetFocus;
    end;
  end;
end;

procedure Tfrm_exp_impr_saque.RetornaClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tfrm_exp_impr_saque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_exp_impr_saque do
  begin
    TUnid.Close;
    TProcesso.Close;
    TProc.Close;
    TProcS.Close;
    TExp.Close;
    TImp.Close;
    TConsig.Close;
    TNotf1.Close;
    TNotf2.Close;
    TCondP.Close;
    TCartaCred.Close;

    Free;
  end;

  action := caFree ;
end;


procedure Tfrm_exp_impr_saque.btn_co_proc_newClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT DISTINCT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('  INNER JOIN TPROCESSO_EXP_SAQUE S ( NOLOCK ) ON S.NR_PROCESSO = PR.NR_PROCESSO');
  vListAux.Add('WHERE CD_PRODUTO  = "02" ');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
  if ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO_EXP_SAQUE (NOLOCK) WHERE NR_PROCESSO = "' + msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text + '" ', 'CONT') = '1' then
    msk_nr_saque.Text := ConsultaLookUp('TPROCESSO_EXP_SAQUE', 'NR_PROCESSO', msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text , 'NR_SAQUE');
end;

procedure Tfrm_exp_impr_saque.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_exp_impr_saque, datm_exp_impr_saque );
end;

procedure Tfrm_exp_impr_saque.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;

  msk_cd_unid_negExit(nil);
  msk_nr_processo.SetFocus;
end;


procedure Tfrm_exp_impr_saque.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo        then btn_co_proc_newClick(nil);
    if Sender = msk_cd_unid_neg        then btn_cd_unid_negClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
    end;
  end;
end;


procedure Tfrm_exp_impr_saque.btn_cd_unid_negClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
   msk_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG ' +
                                               '  FROM TUNID_NEG (NOLOCK) ' +
                                               ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                               '                         FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                               '                        WHERE CD_USUARIO = "'+ str_cd_usuario + '") ' ,
                                               'Unidades',
                                               ['CD_UNID_NEG','NM_UNID_NEG', 'AP_UNID_NEG'],['Código','Unidade', 'Apelido'],
                                               'CD_UNID_NEG',nil,msk_cd_unid_neg.Text);
   edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'AP_UNID_NEG');
 end
 else
   edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT AP_UNID_NEG ' +
                                             '  FROM TUNID_NEG (NOLOCK) ' +
                                             ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                             '                         FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                             '                        WHERE CD_USUARIO = "'+ str_cd_usuario + '") ' +
                                             ' AND CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ','AP_UNID_NEG');


end;


procedure Tfrm_exp_impr_saque.msk_nr_processoExit(Sender: TObject);
var vQryAux: TQuery;
begin
  if msk_nr_processo.Text <> '' then begin
    if edt_nm_unid_neg.Text = '' then begin
      ShowMessage('Preencha uma unidade de Negócio Válida!');
      msk_cd_unid_neg.SetFocus;
    end else begin
      try
        vQryAux := TQuery.Create(application);
        vQryAux.DatabaseName := 'DBBROKER';
        vQryAux.Close;
        vQryAux.SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO_EXP_SAQUE WHERE NR_PROCESSO = :NR_PROCESSO ');
        vQryAux.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) + '02' + Trim( msk_nr_processo.Text );
        vQryAux.Open;
        if vQryAux.IsEmpty then begin
          ShowMessage( 'Processo inexistente !');
          msk_nr_processo.SetFocus;
          Exit;
        end;
        if ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO_EXP_SAQUE (NOLOCK) WHERE NR_PROCESSO = "' + msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text + '" ', 'CONT') = '1' then
          msk_nr_saque.Text := ConsultaLookUp('TPROCESSO_EXP_SAQUE', 'NR_PROCESSO', msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text , 'NR_SAQUE');
      finally
        vQryAux.Free;
      end;
    end;
  end;
end;





procedure Tfrm_exp_impr_saque.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_exp_impr_saque.btnImprimirClick(Sender: TObject);
begin
  try
    with datm_exp_impr_saque do
    begin
      //verificações
      if Trim(msk_nr_processo.Text) = '' then
      begin
        BoxMensagem( 'Informar Nº do Processo!', 2 ) ;
        msk_nr_processo.SetFocus ;
        Exit;
      end;

      if Trim(msk_nr_saque.Text) = '' then
      begin
        BoxMensagem( 'Informar Nº do Saque!', 2 ) ;
        msk_nr_saque.SetFocus ;
        Exit;
      end;

      if ConsultaLookUpSQL('SELECT COUNT(*) CONT FROM TPROCESSO_EXP_SAQUE (NOLOCK) WHERE NR_PROCESSO = "'+ Trim(msk_cd_unid_neg.Text) + '02' + Trim(msk_nr_processo.Text) +'" AND NR_SAQUE = "'+ Trim(msk_nr_saque.Text) +'" ', 'CONT') = '0' then begin
        ShowMessage('Processo + Saque inexistentes!');
        msk_nr_processo.SetFocus ;
        Exit;
      end;

      //qrys de resultado
      Tprocesso.Close;
      Tprocesso.Sql.Clear ;
      Tprocesso.Sql.Add('select cd_unid_neg, cd_produto, nr_processo, cd_banco_exp from tprocesso where nr_processo = "' + msk_cd_unid_neg.Text + '02' + msk_nr_processo.text+ '" ');
      Tprocesso.Open;
      if Tprocesso.Eof then
      begin
        BoxMensagem('Processo não encontrado !', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end;

      TUnid.Close;
      TUnid.Sql.Clear ;
      TUnid.Sql.Add('select cd_unid_neg, nm_unid_neg from tunid_neg '+
                      'where cd_unid_neg = "' + msk_cd_unid_neg.Text + '" ');
      Tunid.Open;

      // Filtra Processo
      TProc.Close;
      Tproc.Sql.Clear ;
      Tproc.Sql.Add(
         'SELECT NR_PROCESSO, CD_EXPORTADOR, CD_IMPORTADOR, CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_MOEDA, TP_CONSIGNATARIO, CD_CONSIGNATARIO, ' +
         'TP_NOTIFY1, CD_NOTIFY1, TP_NOTIFY2, CD_NOTIFY2, CD_LINGUA_PEDIDO, CD_BANCO_SAQUE ' +
         'FROM TPROCESSO_EXP WHERE NR_PROCESSO = "' + msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text + '"' ) ;
      Tproc.Open;

      TProcS.Close;
      TprocS.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TprocS.ParamByName('NR_SAQUE').AsString    := msk_nr_saque.Text;
      TProcS.Prepare;
      TProcS.Open;

      // Filtra Exportador
      Texp.Close;
      Texp.ParamByName('CD_EXPORTADOR').AsString := Tproc.FieldByName('CD_EXPORTADOR').AsString;
      Texp.Prepare;
      Texp.Open;

      // Filtra Importador
      Timp.Close;
      Timp.ParamByName('CD_IMPORTADOR').AsString := Tproc.FieldByName('CD_IMPORTADOR').AsString;
      Timp.ParamByName('CD_LINGUA_PEDIDO').AsString := Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString;
      Timp.Prepare;
      Timp.Open;

      TBanco.Close;
      TBanco.ParamByName('NR_PROCESSO').AsString := TProc.FieldByName('NR_PROCESSO').AsString;
      TBanco.Prepare;
      TBanco.Open;

      // Filtra Para
      Tpara.Close;
      Tpara.Sql.Clear ;
      if TProcS.FieldByName('TP_EMPRESA_PAGTO').AsString = '0' then        // Importador
        Tpara.Sql.Add('select nm_empresa AS NM_EMPRESA from tempresa_est where cd_empresa = "' + TProc.Fieldbyname('cd_importador').AsString + '"')

      else if TProcS.FieldByName('TP_EMPRESA_PAGTO').AsString = '1' then  // Banco
        Tpara.Sql.Add( 'SELECT NM_EMPRESA AS NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = "' + TProc.FieldByName('CD_BANCO_SAQUE').AsString + '"' )

      else if TProcS.FieldByName('TP_EMPRESA_PAGTO').AsString = '2' then  // Consignatario
      begin
        if Tproc.FieldByName('tp_consignatario').AsString = '2' then // Transportadora
           Tpara.Sql.Add('SELECT T.DESCRICAO AS NM_EMPRESA FROM TTRANSPORTADOR_ITL T WHERE T.CODIGO = "' + Tproc.FieldByName('cd_consignatario').asString+'"')
        else if Tproc.FieldByName('tp_consignatario').asString = '4' then // Despachante
           Tpara.Sql.Add('SELECT NM_DESPACHANTE AS  NM_EMPRESA FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' +  Tproc.FieldByName('cd_consignatario').asString+'"')
        else if (Tproc.FieldByName('tp_consignatario').asString = '0') or
                (Tproc.FieldByName('tp_consignatario').asString = '1') or
                (Tproc.FieldByName('tp_consignatario').asString = '3') then // Importador / Agente / Banco
           Tpara.Sql.Add('SELECT NM_EMPRESA AS NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = "' + Tproc.FieldByName('cd_consignatario').asString+'"')
      end

      else if TProcS.FieldByName('TP_EMPRESA_PAGTO').AsString = '3' then  // Notificado1
      begin
        if Tproc.FieldByName('tp_notify1').asString = '2' then // Transportadora
           Tpara.Sql.Add('SELECT DESCRICAO AS NM_EMPRESA FROM TTRANSPORTADOR_ITL WHERE CODIGO = "' + Tproc.FieldByName('cd_notify1').asString+'"')
        else if Tproc.FieldByName('tp_notify1').asString = '4' then // Despachante
           Tpara.Sql.Add('SELECT NM_DESPACHANTE AS NM_EMPRESA FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' + Tproc.FieldByName('cd_notify1').asString+'"')
        else
           Tpara.Sql.Add('SELECT NM_EMPRESA AS NM_EMPRESA FROM TEMPRESA_EST E WHERE CD_EMPRESA = "' + Tproc.FieldByName('cd_notify1').asString+'"');
      end

      else if TProcS.FieldByName('TP_EMPRESA_PAGTO').AsString = '4' then  // Notificado2
      begin
        if Tproc.FieldByName('tp_notify2').asString = '2' then // Transportadora
          Tpara.Sql.Add('SELECT DESCRICAO AS NM_EMPRESA FROM TTRANSPORTADOR_ITL WHERE CODIGO = "' + Tproc.FieldByName('cd_notify2').asString+'"')
       else if Tproc.FieldByName('tp_notify2').asString = '4' then // Despachante
          Tpara.Sql.Add('SELECT NM_DESPACHANTE AS NM_EMPRESA FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' + Tproc.FieldByName('cd_notify2').asString+'"')
       else
          Tpara.Sql.Add('SELECT NM_EMPRESA AS NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = "' + Tproc.FieldByName('cd_notify2').asString+'"');
      end;
      Tpara.Open;

      // Filtra Termo de Pagto
      TCondP.Close;
      TCondP.ParamByName('CD_TERMO_PAGTO').AsString   := TprocS.FieldByName('CD_TERMO_PAGTO').AsString;
      TCondP.Prepare;
      TCondP.Open;

      // Filtra Moeda
      TMoeda.Close;
      TMoeda.Sql.Clear;
      TMoeda.Sql.Add('select ap_moeda as ap_moeda from tmoeda_broker where cd_moeda="'+Tproc.FieldByName('cd_moeda').asString+'"') ;
      TMoeda.Open;

       //form de impressão
       Application.CreateForm(TFrm_impressao, Frm_impressao );
       frm_impressao.cd_unid_neg   := msk_cd_unid_neg.text;
       frm_impressao.cd_modulo     := '2009';
       frm_impressao.vBeforePrint  :=  pBeforePrint;
       frm_impressao.vApenas_email := false;
       frm_impressao.ShowModal;
       frm_impressao.Release;
     end;
  finally
  end;     
end;

procedure Tfrm_exp_impr_saque.pBeforePrint(Sender:TObject);
begin
 TppHeaderBand(Frm_impressao.FindComponent('ppHeaderband1')).BeforePrint := pBeforePrint2;
end;

procedure Tfrm_exp_impr_saque.pBeforePrint2(Sender:TObject);
  var Ext1, Ext2, Value1, Value2 : String;
i : Byte;
begin
  //Extenso
  Ext1 := datm_exp_impr_saque.TProcSCalcTotalExtenso.AsString;

  if Trim( Ext1[71] ) = '' then
  begin
    Ext1 := Copy( datm_exp_impr_saque.TProcSCalcTotalExtenso.AsString, 1, 70 );
    Ext2 := Copy( datm_exp_impr_saque.TProcSCalcTotalExtenso.AsString, 71, ( Length( Trim( datm_exp_impr_saque.TProcSCalcTotalExtenso.AsString ) ) - 1 ) );
  end
  else
  begin
    i := 70;
    while i > 0 do
    begin
      if Trim( Ext1[i] ) = '' then
      begin
        Ext1 := Copy( datm_exp_impr_saque.TProcSCalcTotalExtenso.AsString, 1, i - 1 );
        Ext2 := Copy( datm_exp_impr_saque.TProcSCalcTotalExtenso.AsString, i + 1, ( Length( Trim( datm_exp_impr_saque.TProcSCalcTotalExtenso.AsString ) ) - 1 ) );
        break;
      end;
      i := i + 1;
    end;
  end;

  TppLabel(Frm_impressao.FindComponent('pplblExt1Top')).Caption    := Ext1;
  TppLabel(Frm_impressao.FindComponent('pplblExt1Bottom')).Caption := Ext1;
  TppLabel(Frm_impressao.FindComponent('pplblExt2Top')).Caption    := Ext2;
  TppLabel(Frm_impressao.FindComponent('pplblExt2Bottom')).Caption := Ext2;

  // Adicionado para aumentar o tamanho do campo e da linha do relatório - Michel 17/10/2008
  TppDBText(Frm_impressao.FindComponent('ppDBText13')).AutoSize := True;
  TppDBText(Frm_impressao.FindComponent('ppDBText19')).AutoSize := True;
  TppLine(Frm_impressao.FindComponent('ppLine4')).Width  := 2300;
  TppLine(Frm_impressao.FindComponent('ppLine12')).Width := 2300;

  //Value
  Value1 := datm_exp_impr_saque.TProcSTX_VALUE.AsString;
  if Trim( Value1[71] ) = '' then
  begin
    Value1 := Copy( datm_exp_impr_saque.TProcSTX_VALUE.AsString, 1, 70 );
    Value2 := Copy( datm_exp_impr_saque.TProcSTX_VALUE.AsString, 71, ( Length( Trim( datm_exp_impr_saque.TProcSTX_VALUE.AsString ) ) - 1 ) );
  end
  else
  begin
    i := 70;
    while i > 0 do
    begin
      if Trim( Value1[i] ) = '' then
      begin
        Value1 := Copy( datm_exp_impr_saque.TProcSTX_VALUE.AsString, 1, i - 1 );
        Value2 := Copy( datm_exp_impr_saque.TProcSTX_VALUE.AsString, i + 1, ( Length( Trim( datm_exp_impr_saque.TProcSTX_VALUE.AsString ) ) - 1 ) );
        break;
      end;
      i := i + 1;
    end;
  end;

  TppLabel(Frm_impressao.FindComponent('pplblValue1Top')).Caption    := Value1;
  TppLabel(Frm_impressao.FindComponent('pplblValue1Bottom')).Caption := Value1;
  TppLabel(Frm_impressao.FindComponent('pplblValue2Top')).Caption    := Value2;
  TppLabel(Frm_impressao.FindComponent('pplblValue2Bottom')).Caption := Value2;

  if frm_exp_impr_saque.Modelo.ItemIndex = 0 then
  begin
    TppLabel(Frm_impressao.FindComponent('pplblTop')).Caption        := '(Second and third';
    TppLabel(Frm_impressao.FindComponent('pplblBottom')).Caption     := '(First and third';
    TppLabel(Frm_impressao.FindComponent('pplblBillTop')).Caption    := 'sight pay this First Bill of Exchange';
    TppLabel(Frm_impressao.FindComponent('pplblBillBottom')).Caption := 'sight pay this Second Bill of Exchange';
    TppLabel(Frm_impressao.FindComponent('pplblNumTop')).Caption     := '1';
    TppLabel(Frm_impressao.FindComponent('pplblNumBottom')).Caption  := '2';
  end
  else
  begin
    TppLabel(Frm_impressao.FindComponent('pplblTop')).Caption        := '(First and second';
    TppLabel(Frm_impressao.FindComponent('pplblBottom')).Caption     := '(Second and third';
    TppLabel(Frm_impressao.FindComponent('pplblBillTop')).Caption    := 'sight pay this Third Bill of Exchange';
    TppLabel(Frm_impressao.FindComponent('pplblBillBottom')).Caption := 'sight pay this First Bill of Exchange';
    TppLabel(Frm_impressao.FindComponent('pplblNumTop')).Caption     := '3';
    TppLabel(Frm_impressao.FindComponent('pplblNumBottom')).Caption  := 'Copy';
  end;
  TppLabel(Frm_impressao.FindComponent('pplblTop')).Caption          := TppLabel(Frm_impressao.FindComponent('pplblTop')).Caption + ' unpaid) to the order of';
  TppLabel(Frm_impressao.FindComponent('pplblBottom')).Caption       := TppLabel(Frm_impressao.FindComponent('pplblBottom')).Caption + ' unpaid) to the order of';
  if ( datm_exp_impr_saque.TProcSDT_INICIAL.IsNull ) or ( Trim( datm_exp_impr_saque.TProcSDT_INICIAL.AsString ) = '0th,' ) then
  begin
    TppDBText(Frm_impressao.FindComponent('ppdbtxt_dt_inicial')).Visible  := False;
    TppDBText(Frm_impressao.FindComponent('ppdbtxt_dt_inicial2')).Visible := False;
  end
  else
  begin
    TppDBText(Frm_impressao.FindComponent('ppdbtxt_dt_inicial')).Visible  := True;
    TppDBText(Frm_impressao.FindComponent('ppdbtxt_dt_inicial2')).Visible := True;
  end;

  //To
  datm_exp_impr_saque.TCartaCred.Close;
  datm_exp_impr_saque.TCartaCred.ParamByName('NR_PROCESSO').AsString := datm_exp_impr_saque.TProcesso.FieldByName('NR_PROCESSO').AsString;
  datm_exp_impr_saque.TCartaCred.Prepare;
  datm_exp_impr_saque.TCartaCred.Open;
  if Not datm_exp_impr_saque.TCartaCred.EOF then
  begin
    TppDBMemo(Frm_impressao.FindComponent('ppSaque')).Visible     := True;
    TppDBMemo(Frm_impressao.FindComponent('ppSaque2')).Visible    := True;
    TppDBMemo(Frm_impressao.FindComponent('ppSaque')).Left        := TppLabel(Frm_impressao.FindComponent('ppNome')).Left;
    TppDBMemo(Frm_impressao.FindComponent('ppSaque2')).Left       := TppLabel(Frm_impressao.FindComponent('ppNome2')).Left;
    TppDBMemo(Frm_impressao.FindComponent('ppSaque')).Width       := TppLabel(Frm_impressao.FindComponent('ppEndereco')).Width;
    TppDBMemo(Frm_impressao.FindComponent('ppSaque2')).Width      := TppLabel(Frm_impressao.FindComponent('ppEndereco2')).Width;

    TppLabel(Frm_impressao.FindComponent('ppNome')).Visible      := False;
    TppLabel(Frm_impressao.FindComponent('ppNome2')).Visible     := False;
    TppLabel(Frm_impressao.FindComponent('ppEndereco')).Visible  := False;
    TppLabel(Frm_impressao.FindComponent('ppEndereco2')).Visible := False;
    TppLabel(Frm_impressao.FindComponent('ppCidPais')).Visible   := False;
    TppLabel(Frm_impressao.FindComponent('ppCidPais2')).Visible  := False;

  end
  else
  begin
    TppDBMemo(Frm_impressao.FindComponent('ppSaque')).Visible     := False;
    TppDBMemo(Frm_impressao.FindComponent('ppSaque2')).Visible    := False;

    TppLabel(Frm_impressao.FindComponent('ppNome')).Visible      := True;
    TppLabel(Frm_impressao.FindComponent('ppNome2')).Visible     := True;
    TppLabel(Frm_impressao.FindComponent('ppEndereco')).Visible  := True;
    TppLabel(Frm_impressao.FindComponent('ppEndereco2')).Visible := True;
    TppLabel(Frm_impressao.FindComponent('ppCidPais')).Visible   := True;
    TppLabel(Frm_impressao.FindComponent('ppCidPais2')).Visible  := True;

  end;

end;


procedure Tfrm_exp_impr_saque.msk_nr_saqueExit(Sender: TObject);
begin
  if (Trim(msk_nr_processo.Text) = '') or (Trim(msk_nr_saque.Text) = '') then Exit;
  if ConsultaLookUpSQL('SELECT COUNT(*) CONT FROM TPROCESSO_EXP_SAQUE (NOLOCK) WHERE NR_PROCESSO = "'+ Trim(msk_cd_unid_neg.Text) + '02' + Trim(msk_nr_processo.Text) +'" AND NR_SAQUE = "'+ Trim(msk_nr_saque.Text) +'" ', 'CONT') = '0' then begin
    ShowMessage('Nr. de Saque inválido!');
    msk_nr_saque.Text := '';
    msk_nr_saque.SetFocus;
  end;

end;

end.
