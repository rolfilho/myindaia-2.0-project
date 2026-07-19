unit PGDI029;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Mask, dialogs, UCRPE32, Funcoes;

type
  Tfrm_recalc_proc = class(TForm)
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
    lbl_unidade2: TLabel;
    btn_co_unidade2: TSpeedButton;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
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
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unidade2Click(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    Interrompe: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_recalc_proc: Tfrm_recalc_proc;

implementation

uses PGGP001, PGDI030, PGSM018, GSMLIB, PGGP017;


{$R *.DFM}

procedure Tfrm_recalc_proc.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure Tfrm_recalc_proc.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure Tfrm_recalc_proc.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure Tfrm_recalc_proc.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure Tfrm_recalc_proc.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure Tfrm_recalc_proc.SetButtons;
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

function Tfrm_recalc_proc.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_recalc_proc.SetItem(List: TListBox; Index: Integer);
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

procedure Tfrm_recalc_proc.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_recalc_proc, datm_recalc_proc);
  mskedt_cd_unid_neg.Text:= str_cd_unid_neg;
  mskedt_cd_unid_negExit(nil);
end;

procedure Tfrm_recalc_proc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_recalc_proc.free;
  action:= caFree;
end;


procedure Tfrm_recalc_proc.mskedt_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Text:= '';
  ValCodEdt(mskedt_cd_unid_neg);
  with datm_recalc_proc do
  begin
    {VERIFICAR SE O USUÁRIO TEM ACESSO A UNIDADExPRODUTO }
    qry_usuario_hab_.Prepare;
    qry_usuario_hab_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString := '01';
    qry_usuario_hab_.Open;
    if qry_usuario_hab_OK.AsInteger <= 0 then {NÃO TEM ACESSO}
    begin
      BoxMensagem('Usuário não possui permissão para esta unidade/produto!', 2);
      qry_usuario_hab_.Close;
      Exit;
    end;
    qry_usuario_hab_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.ParamByName('cd_unid_neg').AsString:= mskedt_cd_unid_neg.text;
    qry_unid_neg_.Open;
    if qry_unid_neg_.RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!', 2);
      qry_unid_neg_.Close;
      Exit;
    end;
    edt_nm_unid_neg.Text:= qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
    qry_unid_neg_.Close;
  end;

  DstList.Items.Clear;
  SrcList.Items.Clear;

  with datm_recalc_proc.qry_DI_ do
  begin
    Prepare;
    ParamByName('CD_UNID_NEG').AsString:= mskedt_cd_unid_neg.Text;
    ParamByName('CD_PRODUTO').AsString:= '01';
    Open;
    while not eof do
    begin
      SrcList.Items.Add(datm_recalc_proc.qry_DI_calc_nr_processo.text);
      Next;
    end;
    Close;
  end;

end;

procedure Tfrm_recalc_proc.btn_co_unidade2Click(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  mskedt_cd_unid_negExit(Nil);
end;

procedure Tfrm_recalc_proc.OKBtnClick(Sender: TObject);
var i: integer;
    nr_processo:String;
begin
  if DstList.Items.Count = 0 then
  begin
    BoxMensagem('Nenhum item foi selecionado.',2);
    Exit;
  end;

  DstList.Selected[DstList.ItemIndex]:= false;
  OKBtn.Enabled:= False;
  Interrompe:= False;
  for I := 0 to DstList.Items.Count - 1 do
  begin
    DstList.Selected[i]:= true;
    if i > 0 then DstList.Selected[i - 1]:= False;
    nr_processo:= DstList.Items[i];
                  //mskedt_cd_unid_neg.text + '01' +
                  //copy(DstList.Items[i], 1, 2) +
                  //copy(DstList.Items[i], 4, 4) +
                  //copy(DstList.Items[i], 9, 1);
    with datm_recalc_proc do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_di_calculo);
        sp_di_calculo.ParamByName('@nr_processo').AsString := nr_processo;
        ExecStoredProc(sp_di_calculo);
        CloseStoredProc(sp_di_calculo);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
    Application.ProcessMessages;
    if Interrompe then
    begin
      ShowMessage('Processo Interrompido pelo usuário.');
      Exit;
    end;
  end;
  mskedt_cd_unid_negExit(nil);
  OKBtn.Enabled := True;
end;

procedure Tfrm_recalc_proc.CancelBtnClick(Sender: TObject);
begin
  Interrompe:= True;
end;

end.
