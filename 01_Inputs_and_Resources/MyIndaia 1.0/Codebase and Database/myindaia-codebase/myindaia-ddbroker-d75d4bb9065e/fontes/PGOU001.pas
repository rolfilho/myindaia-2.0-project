unit PGOU001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, DbTables, Db, ComCtrls, Mask, ExtCtrls,
  Menus;

type
  Tfrm_nf_broker_sap = class(TForm)
    Memo1: TMemo;
    PageControl1: TPageControl;
    ts_nf_broker_sap: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    lbl_cd_cliente: TLabel;
    SpeedButton6: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    Image3: TImage;
    Image4: TImage;
    Label6: TLabel;
    Label7: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbgrd_lista: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Cria_TXT(nr_processo:String; nr_nf:String);
    procedure Erro(Sender: TObject; E: Exception);
  public
    procedure ValCodEdt( Edit_Codigo : TMaskEdit );
    procedure Localiza( Query : TQuery; Chave : String; Campo : String );
    Function StrZero(nNumero : Double; i : Integer) : String;
    { Public declarations }
  end;

var
  frm_nf_broker_sap: Tfrm_nf_broker_sap;
  CancelaOperacao: Boolean;
  Cancelado: Boolean;
  Transacao: Boolean;
  NF_TXT: TextFile;
  Stri: String;
  ErroAntigo: TExceptionEvent;
  Arquivos: TSearchRec;
  cDir_Base_Dados, cDir_Repos_TXT: String;
  a_str_indices: array [0..1] of String;
  a_str_indices1: array [0..1] of String;
  Usuario, Senha: String;
implementation
Uses PGOU002, PGSM104, PGGP017, GSMLIB {, PGSM024, PGGP017, PGSM104};
{$R *.DFM}

procedure Tfrm_nf_broker_sap.FormCreate(Sender: TObject);
begin
  ErroAntigo:= Application.OnException;
  Application.OnException:= Erro;
  Application.CreateForm(Tdatm_nf_broker_sap, datm_nf_broker_sap);
  CancelaOperacao := False;
  Transacao       := False;
  Cancelado       := False;
  Usuario         := ParamStr(1);
  Senha           := ParamStr(2);

  with datm_nf_broker_sap do
  begin
    tbl_parametros.Open;

    cDir_Base_Dados := tbl_parametros.FieldByName('PATH_NF_DBF').AsString;
    cDir_Repos_TXT  := Trim(tbl_parametros.FieldByNAme('PATH_RELATORIOS').AsString) + '\';

    if not SetCurrentDir(cDir_Repos_TXT)
    then CreateDir(cDir_Repos_TXT);
    SetCurrentDir(tbl_parametros.FieldByName('PATH_RELATORIOS').AsString);
    tbl_parametros.Close;

    AConexao.IsConnected         := False;
    AConexao.ConnectPath         := cDir_Base_Dados;
    ATbl_Adicao.DatabaseName     := cDir_Base_Dados;
    ATbl_DI.DatabaseName         := cDir_Base_Dados;
    Atbl_Exportador.DatabaseName := cDir_Base_Dados;
    Atbl_Importador.DatabaseName := cDir_Base_Dados;
    ATbl_Item.DatabaseName       := cDir_Base_Dados;
    Atbl_Pais.DatabaseName       := cDir_Base_Dados;
    Atbl_Unidade.DatabaseName    := cDir_Base_Dados;
    Atbl_Embalagem.DatabaseName  := cDir_Base_Dados;
    AConexao.IsConnected         := True;

  end;

  cb_ordem.ItemIndex := 0;
  a_str_indices[0]   := 'CD_UNID_NEG, CD_PRODUTO, P.NR_PROCESSO DESC';
  a_str_indices[1]   := 'NR_DECLARACAO_IMP';
  a_str_indices1[0]  := 'NR_PROCESSO';
  a_str_indices1[1]  := 'NR_DECLARACAO_IMP';

end;

procedure Tfrm_nf_broker_sap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Transacao
  then Action:= caNone
  else
  begin
    datm_nf_broker_sap.qry_di_lista_.Close;
    datm_nf_broker_sap.Free;
    Action := caFree;
  end;
end;

procedure Tfrm_nf_broker_sap.BitBtn2Click(Sender: TObject);
begin
  Close
end;

procedure Tfrm_nf_broker_sap.BitBtn1Click(Sender: TObject);
var i: word;
begin
  Transacao:= True;
  if dbgrd_lista.SelectedRows.Count = 0 then
  begin
    ShowMessage('Nenhuma Declaração foi selecionada.');
    Exit;
  end;
  Image3.Visible         := False;
  Refresh;
  msk_cd_cliente.Enabled := False;
  SpeedButton6.Enabled   := False;
  BitBtn1.Enabled        := False;
  BitBtn2.Enabled        := False;
  BitBtn3.Enabled        := True;
  dbgrd_lista.Enabled    := False;
  AssignFile(NF_TXT, cDir_Repos_TXT + 'NF_SAP' + '.TXT');
  Rewrite(NF_TXT);

  for i:= 0 to dbgrd_lista.SelectedRows.Count - 1 do
  begin
    Cria_TXT( datm_nf_broker_sap.Atbl_NF.FieldByName('CA1401').AsString, datm_nf_broker_sap.Atbl_NF.FieldByName('CA1402').AsString);
    if Not Cancelado then
    begin
      dbgrd_lista.SelectedRows.CurrentRowSelected := False;
      if dbgrd_lista.SelectedRows.Count > 0 then
         TTable(dbgrd_lista.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_lista.SelectedRows[0]));
    end
    else Break;
  end;

  CloseFile(NF_TXT);
  
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[3].Text := '';
  CancelaOperacao           := False;
  Cancelado                 := False;
  BitBtn1.Enabled           := True;
  msk_cd_cliente.Enabled    := True;
  SpeedButton6.Enabled      := True;
  BitBtn2.Enabled           := True;
  BitBtn3.Enabled           := False;
  dbgrd_lista.Enabled       := True;
  Image3.Visible            := True;
  Transacao                 := False;
end;

procedure Tfrm_nf_broker_sap.Cria_TXT( nr_processo: String; nr_nf: String );
var Linha: String;
    vl_nf, vl_icms, vl_ipi, vl_base_icms : Double;
begin
  {Capa da NF}
  with datm_nf_broker_sap, datm_nf_broker_sap.Atbl_NF do
  begin
    vl_nf   := 0;
    vl_icms := 0;
    vl_ipi  := 0;

    Screen.Cursor := crSQLWait;
    StatusBar1.Panels[0].Text := 'Lendo NF...';
    Open;
    StatusBar1.Panels[1].Text := 'Processo: ' + Copy( nr_processo, 5, 14 );
    StatusBar1.Panels[0].Text := 'Gravando NF´s no Arquivo...';
    {Tipo de Registro}
    System.Append(NF_TXT);
    Linha := 'N1';
    {CGC do Importador}
    Atbl_Importador.Open;
    if Atbl_Importador.FindKey( [Atbl_NF.FieldByName('CA1427').AsString] ) then
      Linha := Linha + Atbl_Importador.FieldByName('CA0104').AsString
    else
      Linha := Linha + Space(14);
    Atbl_Importador.Open;
    {Data do Documento}
    Linha := Linha + FormatDateTime( 'ddmmyyyy', ATbl_NF.FieldByName('CD1404').AsDateTime );
    {Peso Líquido}
    Linha := Linha + Copy( FFloatToMsk ( '###########0.000000', ATbl_NF.FieldByName('CN1416').AsFloat ), 1, 12 ) +
                     Copy( FFloatToMsk ( '###########0.000000', ATbl_NF.FieldByName('CN1416').AsFloat ), 14, 6 );
    {Peso Bruto}
    Linha := Linha + Copy( FFloatToMsk ( '###########0.000000', ATbl_NF.FieldByName('CN1415').AsFloat ), 1, 12 ) +
                     Copy( FFloatToMsk ( '###########0.000000', ATbl_NF.FieldByName('CN1415').AsFloat ), 14, 6 );
    {Nº da DI}
    qry_di_.Close;
    qry_di_.ParamByName('NR_PROCESSO').AsString := nr_processo;
    qry_di_.Open;
    if Not qry_di_.EOF then
       Linha := Linha + Format('%10s', [qry_di_NR_DECLARACAO_IMP.AsString] )
    else
       Linha := Linha + Space(10);
    {Ref. Comissária}
    Linha := Linha + Format('%15s', [nr_processo] );
    {Veículo}
    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_proc_emb_.Close;
    qry_proc_emb_.ParamByName('NR_PROCESSO').AsString := nr_processo;
    qry_proc_emb_.Prepare;
    qry_proc_emb_.Open;
    if Not qry_proc_emb_.EOF then
    begin
      if qry_proc_emb_LookViaTransp.AsString = '01' then
         Linha := Linha + Copy( qry_proc_emb_NM_EMBARCACAO.AsString, 1, 30 )
      else
         Linha := Linha + Format( '%30s', [qry_proc_emb_NR_VOO.AsString] );
    end
    else Linha := Linha + Space(30);
    {CGC da Transportadora}
    qry_proc_transp_.Close;
    qry_proc_transp_.ParamByName('NR_PROCESSO').AsString := nr_processo;
    qry_proc_transp_.Prepare;
    qry_proc_transp_.Open;
    if Not qry_proc_transp_.EOF then
      Linha := Linha + Format( '%14s', [qry_proc_transp_NM_TRANSP_ROD.AsString] )
    else Linha := Linha + Space(14);

    ATbl_NF_Item.Filter := 'CA1501 = "' + nr_processo + '" AND CA1525 = "' + nr_nf + '"';
    ATbl_NF_Item.Open;
    ATbl_NF_Item.First;
    while Not ATbl_NF_Item.EOF do
    begin
      vl_nf   := vl_nf + ATbl_NF_Item.FieldByName('CN1504').AsFloat;
      vl_icms := vl_icms + ATbl_NF_Item.FieldByName('CN1538').AsFloat;
      vl_ipi  := vl_ipi + ATbl_NF_Item.FieldByName('CN1506').AsFloat;

      ATbl_NF_Item.Next;
    end;
    ATbl_NF_Item.Close;

    Linha := Linha + Copy( FFloatToMsk ( '############0.000000', vl_nf ), 1, 13 ) +
                     Copy( FFloatToMsk ( '############0.000000', vl_nf ), 15, 6 );
    Linha := Linha + Copy( FFloatToMsk ( '###########0.0000000', vl_icms ), 1, 12 ) +
                     Copy( FFloatToMsk ( '###########0.0000000', vl_icms ), 14, 7 );
    Linha := Linha + Copy( FFloatToMsk ( '############0.000000', vl_ipi ), 1, 13 ) +
                     Copy( FFloatToMsk ( '############0.000000', vl_ipi ), 15, 6 );
    Writeln(NF_TXT,  Linha);
    {--------------------------------------------------------------------------}
    {Itens da NF}
    {Tipo de Registro}
    System.Append(NF_TXT);
    Linha := 'N2';

    ATbl_NF_Item.Filter := 'CA1501 = "' + nr_processo + '" AND CA1525 = "' + nr_nf + '"';
    ATbl_NF_Item.Open;
    ATbl_NF_Item.First;
    while Not ATbl_NF_Item.EOF do
    begin
      {Código do Produto}
      Linha := Linha + Copy( ATbl_NF_Item.FieldByName('CA1514').AsString, 1, 18 );
      {Quantidade}
      Linha := Linha + Copy( FFloatToMsk ( '#########0.00000', ATbl_NF_Item.FieldByName('CN1509').AsFloat ), 1, 10 ) +
                       Copy( FFloatToMsk ( '#########0.00000', ATbl_NF_Item.FieldByName('CN1509').AsFloat ), 12, 5 );
      {Unidade de medida}
      Atbl_Unidade.Open;
      if Atbl_Unidade.FindKey( [Atbl_NF_Item.FieldByName('CA1512').AsString] ) then
         Linha := Linha + Format( '%03s', [Atbl_Unidade.FieldByName('CA2104').AsString] )
      else
         Linha := Linha + Space(3);
      Atbl_Unidade.Close;
      {Preço Unitário}
      Linha := Linha + Copy( FFloatToMsk ( '#########0.0000000', ATbl_NF_Item.FieldByName('CN1511').AsFloat ), 1, 10 ) +
                       Copy( FFloatToMsk ( '#########0.0000000', ATbl_NF_Item.FieldByName('CN1511').AsFloat ), 12, 7 );
      {CFOP}
      Linha := Linha + Format( '%06s', [Atbl_NF_Item.FieldByName('CA1517').AsString] );
      {Base do ICMS}
      vl_base_icms := ATbl_NF_Item.FieldByName('CN1504').AsFloat + ATbl_NF_Item.FieldByName('CN1506').AsFloat;
      Linha := Linha + Copy( FFloatToMsk ( '############0.00', vl_base_icms ), 1, 13 ) +
                       Copy( FFloatToMsk ( '############0.00', vl_base_icms ), 15, 2 );
      {% ICMS}
      Linha := Linha + Copy( FFloatToMsk ( '##0.000', ATbl_NF_Item.FieldByName('CN1513').AsFloat ), 1, 3 ) +
                       Copy( FFloatToMsk ( '##0.000', ATbl_NF_Item.FieldByName('CN1513').AsFloat ), 5, 3 );
      {Valor do ICMS}
      Linha := Linha + Copy( FFloatToMsk ( '#########0.0000000', ATbl_NF_Item.FieldByName('CN1538').AsFloat ), 1, 10 ) +
                       Copy( FFloatToMsk ( '#########0.0000000', ATbl_NF_Item.FieldByName('CN1538').AsFloat ), 12, 7 );
      {Base do IPI}
      Linha := Linha + Copy( FFloatToMsk ( '############0.00', ATbl_NF_Item.FieldByName('CN1511').AsFloat ), 1, 13 ) +
                       Copy( FFloatToMsk ( '############0.00', ATbl_NF_Item.FieldByName('CN1511').AsFloat ), 15, 2 );
      {% IPI}
      Linha := Linha + Copy( FFloatToMsk ( '##0.000', ATbl_NF_Item.FieldByName('CN1505').AsFloat ), 1, 3 ) +
                       Copy( FFloatToMsk ( '##0.000', ATbl_NF_Item.FieldByName('CN1505').AsFloat ), 5, 3 );
      {Valor do IPI}
      Linha := Linha + Copy( FFloatToMsk ( '############0.000000', ATbl_NF_Item.FieldByName('CN1506').AsFloat ), 1, 13 ) +
                       Copy( FFloatToMsk ( '############0.000000', ATbl_NF_Item.FieldByName('CN1506').AsFloat ), 15, 6 );
      {Valor da Mercadoria}
      Linha := Linha + Copy( FFloatToMsk ( '############0.000000', ATbl_NF_Item.FieldByName('CN1504').AsFloat ), 1, 13 ) +
                       Copy( FFloatToMsk ( '############0.000000', ATbl_NF_Item.FieldByName('CN1504').AsFloat ), 15, 6 );
      {NCM}
      Linha := Linha + Format( '%11s', [Atbl_NF_Item.FieldByName('CA1503').AsString] );
      {Nº Pedido}
      Linha := Linha + Format( '%40s', [Atbl_NF_Item.FieldByName('CA1523').AsString] );

      Writeln(NF_TXT,  Linha);

      ATbl_NF_Item.Next;
    end;
    ATbl_NF_Item.Close;

    if CancelaOperacao then
    begin
      if MessageDlg('Cancela a operação?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        CloseFile(NF_TXT);
        Cancelado:= True;
        CancelaOperacao:= False;
        Close;
        Exit;
      end
      else CancelaOperacao:= False;
    end;
    Application.ProcessMessages;
    StatusBar1.Panels[0].Text:= '';
  end;

  Screen.Cursor:= crDefault;
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[3].Text := '';
  if Cancelado then Exit;
end;


procedure Tfrm_nf_broker_sap.BitBtn3Click(Sender: TObject);
begin
  CancelaOperacao:= True;
end;

procedure Tfrm_nf_broker_sap.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:= Not Transacao;
end;

procedure Tfrm_nf_broker_sap.Erro(Sender: TObject; E: Exception);
begin
  BitBtn1.Enabled   := True;
  BitBtn2.Enabled   := True;
  BitBtn3.Enabled   := False;
  dbgrd_lista.Enabled   := True;
  Image3.Visible    := True;
  Screen.Cursor     := crDefault;
  Transacao         := False;
  ShowMessage('Ocorreu um erro durante o processo.');
end;

procedure Tfrm_nf_broker_sap.FormDestroy(Sender: TObject);
begin
  Application.OnException               := ErroAntigo;
  if datm_nf_broker_sap.AConexao.IsConnected then
     datm_nf_broker_sap.AConexao.IsConnected := False;
end;

procedure Tfrm_nf_broker_sap.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  BitBtn1.Enabled     := False;
  dbgrd_lista.Enabled := False;
  edt_chave.Enabled   := False;
  cb_ordem.Enabled    := False;
  with datm_nf_broker_sap, datm_nf_broker_sap.qry_cliente_ do
  begin
    if Atbl_NF.Active then Atbl_NF.Close;

    if msk_cd_cliente.Text = '' then Exit;
    ValCodEdt(msk_cd_cliente);
    qry_cliente_.Close;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      ShowMessage('Cliente não encontrado!');
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      Exit;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;

    edt_chave.Enabled   := True;
    cb_ordem.Enabled    := True;
    BitBtn1.Enabled     := True;
    dbgrd_lista.Enabled := True;

    Atbl_NF.Filter := 'CA1427 = "' + Copy( msk_cd_cliente.Text, 2, 4 ) + '"';
    Atbl_NF.Open;
  end;
end;

procedure Tfrm_nf_broker_sap.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_cliente then SpeedButton6Click(nil);
  end;
end;

procedure Tfrm_nf_broker_sap.SpeedButton2Click(Sender: TObject);
var Arquivo_Encontrado:Integer;
    Atributos:Word;
begin
  if MessageDlg('Deseja apagar os arquivos marcados?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Arquivo_Encontrado:= FindFirst(cDir_Repos_TXT + '\*.txt', faAnyFile, Arquivos);
    while Arquivo_Encontrado = 0 do
    begin
      Atributos:= FileGetAttr(cDir_Repos_TXT + '\' + Arquivos.Name);
      if not((Atributos and faSysFile) = faSysFile)
      then begin
             if not ((Atributos and faArchive) = faArchive)
             then DeleteFile(cDir_Repos_TXT + '\' + Arquivos.Name);
           end
      else begin
             Atributos:= Atributos and not (faSysFile);
             FileSetAttr(cDir_Repos_TXT + '\' + Arquivos.Name, Atributos);
             DeleteFile(cDir_Repos_TXT + '\' + Arquivos.Name);
           end;
      Arquivo_Encontrado := FindNext(Arquivos);
    end;
  end;
end;

procedure Tfrm_nf_broker_sap.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  datm_nf_broker_sap.qry_di_lista_.SQL[7] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];

  datm_nf_broker_sap.qry_di_lista_.Close;
  datm_nf_broker_sap.qry_di_lista_.Open;

  edt_chave.SetFocus;
  Screen.Cursor:=crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_nf_broker_sap.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_nf_broker_sap.qry_di_lista_,
           edt_chave.Text,
           a_str_indices1[cb_ordem.ItemIndex] );
end;

procedure Tfrm_nf_broker_sap.SpeedButton6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  With frm_cliente_co Do
  Begin
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_cliente_co.Cons_OnLine_Texto <> '' ) then
  begin
    msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
    msk_cd_clienteExit(nil);
  end;
end;

procedure Tfrm_nf_broker_sap.ValCodEdt( Edit_Codigo : TMaskEdit );
Var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin

  lDigitouLetras := False;

  nFim := length(Edit_Codigo.Text)-1;

  If Length(Trim(Edit_Codigo.Text)) > 0 Then
  begin
    { VERIFICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO }
    nLoop := 0;
    Repeat
      If (Edit_Codigo.Text[nLoop]
      In ['a'..'z','A'..'Z']) then lDigitouLetras := True;
      nLoop := nLoop + 1;
    Until (lDigitouLetras = True) or ( nLoop > nFim );

    { SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO }
    If Not( lDigitouLetras ) then
    begin
      nNumero := StrToFloat(Edit_Codigo.Text);
      If Edit_codigo.readonly = false then
      Edit_Codigo.Text := StrZero( nNumero, Edit_Codigo.MaxLength );
    end;
  end;
end;

procedure Tfrm_nf_broker_sap.Localiza( Query : TQuery; Chave : String; Campo : String );
begin
  if Chave = '' then Query.First
  else
  begin
    try
       Query.Locate(Campo, Chave, [loCaseInsensitive, loPartialKey]);
    except
      ShowMessage('Chave inválida!');
    end;
  end;
end;

Function Tfrm_nf_broker_sap.StrZero(nNumero : double; i : Integer) : String;
var
  s : string;
begin
  try
    s := FloatToStr( nNumero )
  except
    s := ''
  end;
  While Length( s ) < i do s := '0' + s;
  StrZero := s
end;

procedure Tfrm_nf_broker_sap.FormShow(Sender: TObject);
begin
  msk_cd_cliente.SetFocus;
end;

end.
