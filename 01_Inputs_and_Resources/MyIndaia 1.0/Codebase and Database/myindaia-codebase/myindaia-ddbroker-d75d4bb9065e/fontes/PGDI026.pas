unit PGDI026;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Mask, dialogs, UCRPE32, Funcoes;

type
  Tfrm_imp_varias_di = class(TForm)
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
    Crp_DI: TCrpe;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    Label5: TLabel;
    btn_co_cliente: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    Label1: TLabel;
    msk_nr_processo: TMaskEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
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
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_imp_varias_di: Tfrm_imp_varias_di;

implementation

uses PGDI027, GSMLIB, PGGP001, PGSM024, PGSM018, PGSM136;

{$R *.DFM}
var gincludebtn, gincallbtn: boolean;
procedure Tfrm_imp_varias_di.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure Tfrm_imp_varias_di.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure Tfrm_imp_varias_di.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure Tfrm_imp_varias_di.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure Tfrm_imp_varias_di.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure Tfrm_imp_varias_di.SetButtons;
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

function Tfrm_imp_varias_di.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_imp_varias_di.SetItem(List: TListBox; Index: Integer);
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

procedure Tfrm_imp_varias_di.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_imp_varias_di, datm_imp_varias_di);
end;

procedure Tfrm_imp_varias_di.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Crp_DI.Free;
  datm_imp_varias_di.free;
  Action := caFree;
end;

procedure Tfrm_imp_varias_di.OKBtnClick(Sender: TObject);
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
    nr_processos:= nr_processos + '"' + Trim( msk_cd_unid_neg.Text ) + '01' + Trim( Copy( DstList.Items[i], 5, 14 ) ) + '"' + ',';
  end;
  Delete( nr_processos, length(nr_processos), 1);

  Screen.Cursor := crHourGlass;

  with Crp_DI do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName          := cDir_Rpt + '\CRGSM001.RPT';
    ReportTitle         := 'Rascunho de DI - Capa e Itens';
    SelectionFormula[0] := 'Trim( {DI.NR_PROCESSO} ) IN ['+ nr_processos +']';
    Execute;
  end;

  Screen.Cursor := crArrow;

end;

procedure Tfrm_imp_varias_di.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  SrcList.Clear;
  if msk_cd_cliente.Text = '' then Exit;
  ValCodEdt(msk_cd_cliente);
  with datm_imp_varias_di.qry_cliente_ do
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

  with datm_imp_varias_di.qry_processo_ do
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
      SrcList.Items.Add(FieldByName('CD_UNID_NEG').AsString + '     ' +
                        FieldByName('calc_nr_processo').AsString);
      Next;
    end;
    Close;
  end;

end;

procedure Tfrm_imp_varias_di.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  With frm_cliente Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
    msk_cd_clienteExit(nil);
    if (frm_cliente.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_imp_varias_di.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with datm_imp_varias_di.qry_unid_neg_ do
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
end;

procedure Tfrm_imp_varias_di.btn_co_unid_negClick(Sender: TObject);
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

procedure Tfrm_imp_varias_di.msk_cd_unid_negChange(Sender: TObject);
begin
  if (msk_cd_cliente.Text <> '') then Exit;
  if (msk_cd_unid_neg.Text = '') then
  begin
    msk_nr_processo.Enabled:= False;
    msk_nr_processo.Clear;
    BitBtn1.Enabled:= False;
  end
  else
  begin
    msk_nr_processo.Enabled:= True;
    BitBtn1.Enabled:= True;
  end;
end;

procedure Tfrm_imp_varias_di.BitBtn1Click(Sender: TObject);
begin
  if msk_nr_processo.text = '' then Exit;
  with datm_imp_varias_di.qry_processo_ do
  begin
    Filter:= 'NR_PROCESSO = ''' + msk_nr_processo.Text + '''';
    Prepare;
    Open;
    if recordcount = 0 then
    begin
      BoxMensagem('Processo não encontrado.',2);
    end
    else
      DstList.Items.Add(msk_cd_unid_neg.text + '     ' +
                        FieldByName('calc_nr_processo').AsString);
    begin
    end;
    Close;
  end;
  SetButtons;
end;

procedure Tfrm_imp_varias_di.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text:= str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_cliente.setfocus;
end;

procedure Tfrm_imp_varias_di.msk_nr_processoChange(Sender: TObject);
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

procedure Tfrm_imp_varias_di.msk_nr_processoEnter(Sender: TObject);
begin
  gincludebtn:= includebtn.Enabled;
  gincallbtn:= incallbtn.enabled;
end;

procedure Tfrm_imp_varias_di.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_imp_varias_di.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      BitBtn1Click(nil);
    end;
  end;
end;

end.
