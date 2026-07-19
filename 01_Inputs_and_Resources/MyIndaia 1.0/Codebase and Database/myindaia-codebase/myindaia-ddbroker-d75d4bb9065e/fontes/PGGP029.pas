unit PGGP029;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, Funcoes;

type
  Tfrm_sel_unid_prod_arm = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_dt_inicio: TMaskEdit;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    crp_unid_prod: TCrpe;
    lbl_periodo: TLabel;
    msk_dt_fim: TMaskEdit;
    lbl_a: TLabel;
    lbl_arm: TLabel;
    btn_co_arm: TSpeedButton;
    msk_cd_arm: TMaskEdit;
    edt_nm_arm: TEdit;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    SrcList: TListBox;
    DstList: TListBox;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_armClick(Sender: TObject);
    procedure msk_cd_armExit(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);

    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    procedure SetButtons;

  private
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
  end;

var
  frm_sel_unid_prod_arm: Tfrm_sel_unid_prod_arm;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGGP030, PGSM010, PGSM018, PGSM024, PGSM064, PGSM119;

procedure Tfrm_sel_unid_prod_arm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_prod_arm.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_prod_arm do
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
  end;
end;

procedure Tfrm_sel_unid_prod_arm.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_unid_prod_arm do
    begin
      qry_produto_.Close;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;

end;

procedure Tfrm_sel_unid_prod_arm.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_prod_arm do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
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
  end;
end;

procedure Tfrm_sel_unid_prod_arm.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_unid_prod_arm do
  begin
    Application.CreateForm( Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

{$HINTS OFF}
procedure Tfrm_sel_unid_prod_arm.msk_dt_inicioExit(Sender: TObject);
begin
  SrcList.Clear;
  DstList.Clear;

  try
    if msk_dt_inicio.Text <> '  /  /    ' then StrToDate(msk_dt_inicio.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_inicio.Clear;
      msk_dt_inicio.SetFocus;
      exit;
    end;
  end;

end;
{$HINTS ON}

procedure Tfrm_sel_unid_prod_arm.btn_imprimirClick(Sender: TObject);
var
  nr_identificador: integer;
  i : integer;

begin
  nr_identificador := 0;

  if ( Trim( msk_cd_unid_neg.Text ) = '' ) and Not ( tp_rel in [1] ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( Trim(msk_cd_produto.Text) = '' ) and Not ( tp_rel in [1] )  then
  begin
    BoxMensagem('Informe um Produto!', 2);
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if tp_rel in [1] then
  begin
    if msk_dt_inicio.Text = '  /  /    ' then
    begin
      if ComPeriodo then BoxMensagem('Informe uma data de início para seleção!', 2)
      else BoxMensagem('Informe uma data para seleção!', 2);
      msk_dt_inicio.SetFocus;
      Exit;
    end;

    if ComPeriodo then
    begin
      if ( msk_dt_fim.Text = '  /  /    ' ) then
      begin
        BoxMensagem('Informe uma data final para seleção!', 2);
        msk_dt_fim.SetFocus;
        Exit;
      end;

      if StrToDate( msk_dt_inicio.Text ) > StrToDate( msk_dt_fim.Text ) then
      begin
        BoxMensagem('Data final deve ser maior ou igual a data inicial!', 2);
        msk_dt_fim.Clear;
        msk_dt_inicio.SetFocus;
        Exit;
      end;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_unid_prod do
  begin
    if tp_rel in [1] then
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    end;

    case tp_rel of
      1: begin
           ReportName  := cDir_Rpt + '\CRGI016.RPT';
           if msk_dt_inicio.Text = msk_dt_fim.Text then
              ReportTitle := Caption + ' [ ' + msk_dt_inicio.Text + ' ]'
           else
              ReportTitle := Caption + ' [ ' + msk_dt_inicio.Text + ' a ' + msk_dt_fim.Text + ' ]';

           with datm_sel_unid_prod_arm do
           begin
             if DstList.Items.Count > 0 then
             begin
               CloseStoredProc( sp_rel_desp_arm );
               sp_rel_desp_arm.ParamByName('@nr_controle').AsInteger := 1;
               ExecStoredProc( sp_rel_desp_arm );
               nr_identificador := sp_rel_desp_arm.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_desp_arm );

               for I := 0 to DstList.Items.Count - 1 do
               begin
                 sp_rel_desp_arm2.ParamByName('@nr_identificador').AsInteger := nr_identificador;
                 sp_rel_desp_arm2.ParamByName('@nr_processo').AsString := DstList.Items[i];
                 ExecStoredProc( sp_rel_desp_arm2 );
                 CloseStoredProc( sp_rel_desp_arm2 );
               end;
             end
             else
             begin
               CloseStoredProc( sp_rel_desp_arm );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_desp_arm.ParamByName('@cd_unid_neg').AsString         := 'X'
               else
                 sp_rel_desp_arm.ParamByName('@cd_unid_neg').AsString         := msk_cd_unid_neg.Text;

               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_desp_arm.ParamByName('@cd_produto').AsString          := 'X'
               else
                 sp_rel_desp_arm.ParamByName('@cd_produto').AsString          := msk_cd_produto.Text;

               sp_rel_desp_arm.ParamByName('@dt_inicio').AsString           := msk_dt_inicio.Text;
               sp_rel_desp_arm.ParamByName('@dt_fim').AsString              := msk_dt_fim.Text;

               if Trim( msk_cd_arm.Text ) = '' then
                 sp_rel_desp_arm.ParamByName('@cd_armazem_descarga').AsString := 'X'
               else
                 sp_rel_desp_arm.ParamByName('@cd_armazem_descarga').AsString := msk_cd_arm.Text;

               ExecStoredProc( sp_rel_desp_arm );
               nr_identificador := sp_rel_desp_arm.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_desp_arm );
             end;
           end;
         end;
    end; {end case}
    if tp_rel in [1] then
    begin
      Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
      Execute;
      with datm_sel_unid_prod_arm.qry_apaga_dados do
      begin
        ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        Prepare;
        ExecSQL;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_unid_prod_arm.FormShow(Sender: TObject);
begin
  if ComPeriodo then
    lbl_periodo.Caption := 'Selecione um período:'
  else
  begin
    if tp_rel in [1] then
    begin
      lbl_periodo.Caption := 'Selecione uma data:';
      msk_dt_inicio.Text := FormatDateTime('dd/mm/yyyy', dt_server);
    end;
  end;

  case tp_rel of
    1 : begin
          Caption := 'Despachos para Armazenagem';
        end;
  end;

  with datm_sel_unid_prod_arm do
  begin
    qry_arm_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lbl_a.Visible        := ComPeriodo;
  msk_dt_fim.Visible   := ComPeriodo;

end;

procedure Tfrm_sel_unid_prod_arm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_unid_prod_arm do
  begin
    qry_arm_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
//    Destroy;
    Free;
  end;
  crp_unid_prod.Free;
  Action := caFree;
end;

procedure Tfrm_sel_unid_prod_arm.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Recebimento}
  Application.CreateForm( Tdatm_sel_unid_prod_arm, datm_sel_unid_prod_arm );
end;

procedure Tfrm_sel_unid_prod_arm.msk_dt_fimExit(Sender: TObject);
begin
  try
    if msk_dt_fim.Text <> '  /  /    ' then StrToDate(msk_dt_fim.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_fim.Clear;
      msk_dt_fim.SetFocus;
      exit;
    end;
  end;

  with datm_sel_unid_prod_arm.qry_processo_ Do
  begin
    Screen.Cursor := crHourGlass;

    Close;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.text;
    ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
    ParamByName('CD_ARMAZEM_DESCARGA').AsString := msk_cd_arm.text;
    ParamByName('DT_INICIO').AsDateTime := StrToDate( msk_dt_inicio.Text );
    ParamByName('DT_FIM').AsDateTime    := StrToDate( msk_dt_fim.Text );
    Prepare;
    Open;

    SrcList.Items.Clear;
    while not eof do
    begin
      SrcList.Items.Add(FieldByName('NR_PROCESSO').AsString);
      Next;
    end;
    Close;

    Screen.Cursor := crDefault;
  end;

end;

procedure Tfrm_sel_unid_prod_arm.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_arm      then btn_co_armClick(nil);
  end;
end;

procedure Tfrm_sel_unid_prod_arm.btn_co_armClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_amz.Cons_OnLine_Texto := msk_cd_arm.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_arm.Text := frm_amz.Cons_OnLine_Texto;
  end;
  msk_cd_armExit(nil);
  msk_cd_arm.SetFocus;
end;

procedure Tfrm_sel_unid_prod_arm.msk_cd_armExit(Sender: TObject);
begin
  edt_nm_arm.Clear;

  SrcList.Clear;
  DstList.Clear;

  if msk_cd_arm.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_arm.Text := 'Todos'
    else edt_nm_arm.Text := '';
  end
  else
  begin
    ValCodEdt(msk_cd_arm);
    with datm_sel_unid_prod_arm.qry_arm_ do
    begin
      Close;
      ParamByName('CD_ARMAZEM').AsString := msk_cd_arm.Text;
      Prepare;
      Open;
      if Eof then
      begin
        BoxMensagem('Armazém não encontrado!',2);
        msk_cd_arm.Clear;
        edt_nm_arm.Clear;
        msk_cd_arm.SetFocus;
      end
      else edt_nm_arm.Text := FieldByName('NM_ARMAZEM').AsString;
      Close;
    end;
  end;
end;


procedure Tfrm_sel_unid_prod_arm.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure Tfrm_sel_unid_prod_arm.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure Tfrm_sel_unid_prod_arm.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure Tfrm_sel_unid_prod_arm.ExAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

function Tfrm_sel_unid_prod_arm.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_sel_unid_prod_arm.MoveSelected(List: TCustomListBox; Items: TStrings);
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


procedure Tfrm_sel_unid_prod_arm.SetItem(List: TListBox; Index: Integer);
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

procedure Tfrm_sel_unid_prod_arm.SetButtons;
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



end.
