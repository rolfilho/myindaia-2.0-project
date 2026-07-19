unit PGSM198;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Mask, dialogs, UCRPE32, ExtCtrls, Funcoes;

type
  Tfrm_retorno_fi = class(TForm)
    pnl_retorno: TPanel;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_cliente: TEdit;
    Label5: TLabel;
    msk_cd_cliente: TMaskEdit;
    btn_co_cliente: TSpeedButton;
    Label3: TLabel;
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    DstList: TListBox;
    Label4: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKBtnClick(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_retorno_fi: Tfrm_retorno_fi;

implementation

uses PGDI027, GSMLIB, PGGP001, PGSM024, PGSM018, PGSM199, FILETEXT;

{$R *.DFM}
procedure Tfrm_retorno_fi.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure Tfrm_retorno_fi.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure Tfrm_retorno_fi.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure Tfrm_retorno_fi.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure Tfrm_retorno_fi.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure Tfrm_retorno_fi.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
end;

function Tfrm_retorno_fi.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_retorno_fi.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

procedure Tfrm_retorno_fi.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_retorno_fi, datm_retorno_fi);
end;

procedure Tfrm_retorno_fi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_retorno_fi.free;
  Action := caFree;
end;

procedure Tfrm_retorno_fi.OKBtnClick(Sender: TObject);
var
  I : Integer;
  Arquivo : TFileText;
  cTexto, cInclui : String;
  Nr_Processo : String[18];
  pTexto : Array[0..1024] of Char;

begin

  if DstList.Items.Count = 0 then
  begin
    BoxMensagem('Nenhum processo foi informado.',2);
    Exit;
  end;

  if (FileExists(Trim(cDir_Rpt) + '\RETORNO_FI.TXT') )  then
  begin
    if not BoxMensagem( 'Arquivo ja existente !! Deseja sobrepor o Arquivo ?', 1 ) then
      exit;
  end;

  Arquivo := TFileText.Create;
  Arquivo.Name := cDir_Rpt + '\RETORNO_FI.TXT';
  Arquivo.CreateFile;

  Screen.Cursor := crHourGlass;

  for I := 0 to DstList.Items.Count - 1 do
  begin
    Nr_Processo := str_cd_unid_neg + '02' + Trim( DstList.Items[i] );

    with datm_retorno_fi do
    begin
      qry_proc_exp_.Close;
      qry_proc_exp_.ParamByName( 'NR_PROCESSO' ).AsString := Nr_Processo;
      qry_proc_exp_.Prepare;
      qry_proc_exp_.Open;

      qry_de_para_.Close;
      qry_de_para_.ParamByName( 'CD_UNID_NEG' ).AsString := str_cd_unid_neg;
      qry_de_para_.ParamByName( 'CD_DDBROKER' ).AsString := qry_proc_exp_CD_IMPORTADOR.AsString;
      qry_de_para_.Prepare;
      qry_de_para_.Open;

      qry_proc_flp_.Close;
      qry_proc_flp_.ParamByName( 'NR_PROCESSO' ).AsString := Nr_Processo;
      qry_proc_flp_.Prepare;
      qry_proc_flp_.Open;

      qry_proc_saque_.Close;
      qry_proc_saque_.ParamByName( 'NR_PROCESSO' ).AsString := Nr_Processo;
      qry_proc_saque_.Prepare;
      qry_proc_saque_.Open;

      qry_proc_re_.Close;
      qry_proc_re_.ParamByName( 'NR_PROCESSO' ).AsString := Nr_Processo;
      qry_proc_re_.Prepare;
      qry_proc_re_.Open;

      qry_proc_nf_.Close;
      qry_proc_nf_.ParamByName( 'NR_PROCESSO' ).AsString := Nr_Processo;
      qry_proc_nf_.Prepare;
      qry_proc_nf_.Open;

      cTexto := 'C;';
      cTexto := cTexto + Trim(qry_de_para_CD_EXTERNO.AsString)     + ';' +       // Cliente
                         Trim(qry_proc_exp_NR_FATURA.AsString)     + ';' +       // Nr. Fatura
                         Trim(qry_proc_exp_DT_FATURA.AsString)     + ';' +       // Dt. Fatura
                         Trim(qry_proc_exp_CD_MOEDA_MLE.AsString)  + ';' +       // Cod. Moeda
                         Trim(qry_proc_flp_DT_REALIZACAO.AsString) + ';';        // Dt. Embarque

      if Trim(qry_proc_exp_NR_SD.AsString) <> '' then
         cTexto := cTexto + Copy( qry_proc_exp_NR_SD.AsString, 1,10 ) + '-' + Copy( qry_proc_exp_NR_SD.AsString, 11,1 ) + ';'
      else
         cTexto := cTexto + ';';

      cTexto := cTexto + #13#10;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';

      // Saque
      cInclui := '';
      if not qry_proc_saque_.Eof then
      begin
        while not (qry_proc_saque_.Eof) do
        begin
          cInclui := cInclui + qry_proc_saque_DT_VCTO_SAQUE.AsString + ';' + FormatFloat('0000000000.00', qry_proc_saque_VL_TOT_SAQUE.AsFloat ) + ';';
          qry_proc_saque_.Next;
        end;
      end;
      cTexto := cTexto + 'S;' + cInclui + #13#10;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';

      // NF
      cInclui := '';
      if not qry_proc_nf_.Eof then
      begin
        while not (qry_proc_nf_.Eof) do
        begin
          cInclui := cInclui + qry_proc_nf_NR_NF.AsString + ';';
          qry_proc_nf_.Next;
        end;
      end;
      cTexto := cTexto + 'N;' + cInclui + #13#10;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := '';

      // RE
      cInclui := '';
      if not qry_proc_re_.Eof then
      begin
        while not (qry_proc_re_.Eof) do
        begin
          cInclui := cInclui + Copy(qry_proc_re_NR_RE.AsString,1,2) + '/' +
                               Copy(qry_proc_re_NR_RE.AsString,3,7) + '-' +
                               Copy(qry_proc_re_NR_RE.AsString,8,3) + ';' + qry_proc_re_DT_RE.AsString + ';';
          qry_proc_re_.Next;
        end;
      end;
      cTexto := cTexto + 'R;' + cInclui + #13#10;
      StrPCopy( pTexto, cTexto );
      Arquivo.Write( pTexto );
      cTexto := ''
    end;
  end;

  Arquivo.Close;
  Arquivo.Free;

  Screen.Cursor := crArrow;

  if Nr_Processo <> '' then
     BoxMensagem( 'Arquivo gerado com sucesso !!', 3 );

end;

procedure Tfrm_retorno_fi.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;

  if msk_cd_cliente.Text = '' then
     Exit;

  SrcList.Clear;

  ValCodEdt(msk_cd_cliente);
  with datm_retorno_fi.qry_cliente_ do
  begin
    ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
      Close;
      Exit;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;

  with datm_retorno_fi.qry_processo_ do
  begin
    Filter:= '';
    if msk_cd_unid_neg.Text <> '' then Filter:= 'CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ';
    if Filter <> ''
    then Filter:= Filter + 'and ';
    if msk_cd_cliente.Text <> '' then Filter:= Filter + 'CD_CLIENTE = ''' + msk_cd_cliente.text + '''';
    Prepare;
    Open;
    while not eof do
    begin
      SrcList.Items.Add(FieldByName('calc_nr_processo').AsString);
      Next;
    end;
    Close;
  end;

end;

procedure Tfrm_retorno_fi.btn_co_clienteClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TEMPRESA_EST',
                msk_cd_cliente,
                'Cliente', 38, '');
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_retorno_fi.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do
  Begin
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

procedure Tfrm_retorno_fi.msk_cd_unid_negChange(Sender: TObject);
begin
  if (msk_cd_cliente.Text <> '') then Exit;
end;

procedure Tfrm_retorno_fi.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text:= str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_cliente.setfocus;
end;

procedure Tfrm_retorno_fi.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
  end;
end;


procedure Tfrm_retorno_fi.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  With datm_retorno_fi.qry_unid_neg_ Do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      msk_cd_unid_neg.setfocus;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
  if msk_cd_cliente.Text <> '' then msk_cd_clienteExit(nil);

  with datm_retorno_fi.qry_processo_ do
  begin
    Filter:= '';
    if msk_cd_unid_neg.Text <> '' then Filter:= 'CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ';
    Prepare;
    Open;
    while not eof do
    begin
      SrcList.Items.Add(FieldByName('calc_nr_processo').AsString);
      Next;
    end;
    Close;
  end;

end;

end.
