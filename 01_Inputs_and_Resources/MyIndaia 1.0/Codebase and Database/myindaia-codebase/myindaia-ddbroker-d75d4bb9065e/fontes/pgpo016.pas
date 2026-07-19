unit PGPO016;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Variants,   Buttons, Mask, dialogs, UCRPE32, Funcoes;

type
  Tfrm_po_impressao = class(TForm)
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
    Crp_PO: TCrpe;
    Label5: TLabel;
    btn_co_cliente: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    Label1: TLabel;
    msk_nr_processo: TMaskEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
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
  private
    { Private declarations }
  public
    tp_modelo : Byte;
    { Public declarations }
  end;

var
  frm_po_impressao: Tfrm_po_impressao;

implementation

uses PGDI027, GSMLIB, PGGP001, PGSM024, PGSM018, PGPO017;

{$R *.DFM}
var gincludebtn, gincallbtn: boolean;
procedure Tfrm_po_impressao.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure Tfrm_po_impressao.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure Tfrm_po_impressao.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure Tfrm_po_impressao.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure Tfrm_po_impressao.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure Tfrm_po_impressao.SetButtons;
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

function Tfrm_po_impressao.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_po_impressao.SetItem(List: TListBox; Index: Integer);
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

procedure Tfrm_po_impressao.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_po_impressao, datm_po_impressao);
end;

procedure Tfrm_po_impressao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_po_impressao.qry_po_.Close;
  datm_po_impressao.free;
  Crp_PO.Free;
  Action := caFree;
end;

procedure Tfrm_po_impressao.OKBtnClick(Sender: TObject);
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

  if tp_modelo = 3 then
  begin
    with datm_po_impressao do
    begin
      qry_po_.Close;
      qry_po_.SQL[35] := 'P.NR_PROCESSO IN ( ' + nr_processos + ' )';
      qry_po_.Prepare;
      qry_po_.Open;

      ppReport.Template.FileName := cDir_RPT + '\CRPO005.RTM';
      ppReport.Template.LoadFromFile;
      ppReport.Print ;
    end;
  end
  else
  begin
    with Crp_PO do
    begin
      Connect               := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      if tp_modelo = 1 then
      begin
        ReportName          := cDir_Rpt + '\CRPO001.RPT';
        ReportTitle         := 'Pedido de Importação - Capa e Itens';
      end
      else if tp_modelo = 2 then
      begin
        ReportName          := cDir_Rpt + '\CRPO002.RPT';
        ReportTitle         := 'IMPORT DEPARTMENT';
      end
      else if tp_modelo = 4 then
      begin
        ReportName          := cDir_Rpt + '\CRPO005.RPT';
        ReportTitle         := 'Saldo DA';
      end;
      SelectionFormula[0]   := '{TPO.NR_PROCESSO} in ['+ nr_processos + ']';
      Execute;
    end;
  end;

  Screen.Cursor := crArrow;

end;

procedure Tfrm_po_impressao.msk_cd_clienteExit(Sender: TObject);
begin

  edt_nm_cliente.Clear;
  SrcList.Clear;
  if msk_cd_cliente.text = '' then Exit;
  ValCodEdt(msk_cd_cliente);
  with datm_po_impressao.qry_cliente_ do
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

  with datm_po_impressao.qry_processo_ do
  begin
    Filter:= '';
    if msk_cd_cliente.Text <> '' then Filter:= Filter + 'CD_IMPORTADOR = ''' + msk_cd_cliente.text + '''';
    if tp_modelo = 4 then
      SQL[2] := 'WHERE  ISNULL( NR_DA, "" ) <> ""'
    else
      SQL[2] := 'WHERE  ISNULL( NR_DA, "" ) =  ""';
    Prepare;
    Open;
    while not eof do
    begin
      SrcList.Items.Add(FieldByName('NR_PROCESSO').AsString);
      Next;
    end;
    Close;
  end;

end;

procedure Tfrm_po_impressao.btn_co_clienteClick(Sender: TObject);
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
    if ( frm_cliente.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_po_impressao.BitBtn1Click(Sender: TObject);
begin
  if msk_nr_processo.text = '' then Exit;
  with datm_po_impressao.qry_processo_ do
  begin
    Filter:= 'NR_PROCESSO = ''' + msk_nr_processo.Text + '''';
    if tp_modelo = 4 then
      SQL[2] := 'WHERE  ISNULL( NR_DA, "" ) <> ""'
    else
      SQL[2] := 'WHERE  ISNULL( NR_DA, "" ) =  ""';
    Prepare;
    Open;
    if recordcount = 0 then
    begin
      BoxMensagem('Processo não encontrado.',2);
    end
    else
      DstList.Items.Add(FieldByName('NR_PROCESSO').AsString);
    begin
    end;
    Close;
  end;
  SetButtons;
end;

procedure Tfrm_po_impressao.FormShow(Sender: TObject);
begin
  msk_cd_clienteChange(nil);
  msk_cd_cliente.SetFocus;
  if tp_modelo = 1 then Caption := 'Impressão do PO';
  if tp_modelo = 2 then Caption := 'Impressão do PO - Mod. 2';

end;

procedure Tfrm_po_impressao.msk_nr_processoChange(Sender: TObject);
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

procedure Tfrm_po_impressao.msk_nr_processoEnter(Sender: TObject);
begin
  gincludebtn:= includebtn.Enabled;
  gincallbtn:= incallbtn.enabled;
end;

procedure Tfrm_po_impressao.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_po_impressao.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
  end;
end;

end.
