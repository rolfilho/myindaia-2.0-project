unit PGPE025;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Mask, dialogs, UCRPE32, Funcoes, PGGP017;

type
  Tfrm_pe_impressao = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Crp_PE: TCrpe;
    Label5: TLabel;
    btn_co_cliente: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    Label1: TLabel;
    msk_nr_processo: TMaskEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pe_impressao: Tfrm_pe_impressao;

implementation

uses PGDI027, GSMLIB, PGGP001, PGSM024, PGSM018, PGPO017, PGPE026;

{$R *.DFM}
var gincludebtn, gincallbtn: boolean;
procedure Tfrm_pe_impressao.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure Tfrm_pe_impressao.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure Tfrm_pe_impressao.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure Tfrm_pe_impressao.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure Tfrm_pe_impressao.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure Tfrm_pe_impressao.SetButtons;
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

function Tfrm_pe_impressao.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_pe_impressao.SetItem(List: TListBox; Index: Integer);
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

procedure Tfrm_pe_impressao.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_pe_impressao, datm_pe_impressao);
end;

procedure Tfrm_pe_impressao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_pe_impressao.free;
  Crp_PE.Free;
  Action := caFree;
end;

procedure Tfrm_pe_impressao.OKBtnClick(Sender: TObject);
var nr_processos: AnsiString;
    I:Integer;
begin
  if DstList.Items.Count = 0 then
  begin
    BoxMensagem('Nenhum processo foi informado.',2);
    Exit;
  end;

  nr_processos:= '';

  for I := 0 to DstList.Items.Count - 1 do
  begin
    nr_processos:= nr_processos + '"' + Trim( DstList.Items[i] ) + '"' + ',';
  end;
  delete(nr_processos, length(nr_processos), 1);

  Screen.Cursor := crHourGlass;

  with Crp_PE do
  begin
    ReportName          := cDir_Rpt + '\CRPE001.RPT';
    Connect             := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportTitle         := 'Pedido de Exportação - Capa e Itens';
    SelectionFormula[0] := '{TPE.NR_PROCESSO} in ['+ nr_processos + ']';
    Execute;
  end;

  Screen.Cursor := crArrow;

end;

procedure Tfrm_pe_impressao.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  SrcList.Clear;
  if msk_cd_cliente.text = '' then Exit;
  ValCodEdt(msk_cd_cliente);
  With datm_pe_impressao.qry_cliente_ Do
  begin
    ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado ou não há habilitação para este Cliente !',2);
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
      Close;
      Exit;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;

  With datm_pe_impressao do
  begin
    qry_processo_.Filter:= '';
    qry_processo_.Close;
    qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    if msk_cd_cliente.Text <> '' then qry_processo_.Filter:= 'CD_EXPORTADOR = ' + msk_cd_cliente.Text;
    qry_processo_.Prepare;
    qry_processo_.Open;
    while not (qry_processo_.eof) do
    begin
      SrcList.Items.Add(qry_processo_.FieldByName('NR_PROCESSO').AsString);
      qry_processo_.Next;
    end;
  end;

end;

procedure Tfrm_pe_impressao.btn_co_clienteClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TEMPRESA_NAC',
                msk_cd_cliente,
                'Exportador', 38, 'IN_EXPORTADOR = 1');
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_pe_impressao.BitBtn1Click(Sender: TObject);
begin
  if msk_nr_processo.text = '' then
     Exit;

  With datm_pe_impressao do
  begin
    qry_processo_.Filter:= '';
    qry_processo_.Close;
    qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;

    qry_processo_.Filter:= 'NR_PROCESSO = ''' + msk_nr_processo.Text + '''';
    qry_processo_.Prepare;
    qry_processo_.Open;

    while not (qry_processo_.eof) do
    begin
      SrcList.Items.Add(qry_processo_.FieldByName('NR_PROCESSO').AsString);
      qry_processo_.Next;
    end;
  end;

  SetButtons;
  
end;

procedure Tfrm_pe_impressao.FormShow(Sender: TObject);
begin
  datm_pe_impressao.qry_unid_neg_.Close;
  datm_pe_impressao.qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
  datm_pe_impressao.qry_unid_neg_.Prepare;
  datm_pe_impressao.qry_unid_neg_.Open;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  edt_nm_unid_neg.Text := datm_pe_impressao.qry_unid_neg_NM_UNID_NEG.AsString;

  datm_pe_impressao.qry_processo_.Close;
  datm_pe_impressao.qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
  datm_pe_impressao.qry_processo_.Prepare;
  datm_pe_impressao.qry_processo_.Open;

  msk_cd_clienteChange(nil);
  msk_cd_cliente.setfocus;
end;

procedure Tfrm_pe_impressao.msk_nr_processoChange(Sender: TObject);
begin
  if msk_nr_processo.Text = '' then
  begin
    includebtn.Enabled:= gincludebtn;
    incallbtn.enabled:= gincallbtn;
  end
  else
  begin
    includebtn.Enabled:= False;
    incallbtn.enabled:= False;
  end;

end;

procedure Tfrm_pe_impressao.msk_nr_processoEnter(Sender: TObject);
begin
  gincludebtn:= includebtn.Enabled;
  gincallbtn:= incallbtn.enabled;
end;

procedure Tfrm_pe_impressao.msk_cd_clienteChange(Sender: TObject);
begin
  if (msk_cd_cliente.Text = '') then
  begin
    msk_nr_processo.Enabled:= True;
    BitBtn1.Enabled:= True;
  end
  else
  begin
    msk_nr_processo.Enabled:= False;
    msk_nr_processo.Clear;
    BitBtn1.Enabled:= False;
  end;
end;

procedure Tfrm_pe_impressao.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
  end;
end;


procedure Tfrm_pe_impressao.msk_cd_unid_negExit(Sender: TObject);
var
   nNumero : Double;
   bAchou  : Boolean;

begin
  nNumero := 0;

  with datm_pe_impressao do
  begin
    msk_cd_unid_neg.Text   := Trim(msk_cd_unid_neg.Text);
    if Trim(msk_cd_unid_neg.Text) <> '' then
       nNumero := StrToFloat(msk_cd_unid_neg.Text);

    msk_cd_unid_neg.Text   := StrZero( nNumero, msk_cd_unid_neg.MaxLength );
    if ( msk_cd_unid_neg.Text <> '' ) then
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;

      bAchou := qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, []);
      if Not (bAchou) then
      begin
        BoxMensagem('Unidade não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;

        if not (qry_unid_neg_.EOF) then
           edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end;
    end;

    if ( msk_cd_unid_neg.Text = '' )  then
      edt_nm_unid_neg.Text := '';

    qry_processo_.Close;
    qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_processo_.Prepare;
    qry_processo_.Open;

  end;

end;

procedure Tfrm_pe_impressao.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo        := '23';
  str_cd_rotina        := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  vStr_cd_modulo        := '01';
  str_cd_rotina        := '0102';

  msk_cd_unid_negExit(nil);

end;

end.
