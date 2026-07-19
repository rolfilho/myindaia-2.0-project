unit FerreroDIeImpostosEASY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask;

type
  TFormFerreroDIeImpostosEASY = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    edArquivo: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    btn_cd_unid_neg: TSpeedButton;
    SaveDialog: TSaveDialog;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    Label2: TLabel;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_processoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    str_relatorio: integer;
  end;

var
  FormFerreroDIeImpostosEASY: TFormFerreroDIeImpostosEASY;

implementation

uses PGSM018, PGSM010, PGCH039, GSMLIB, Funcoes, PGCH041, PGSM136, PGGP015,
  KrQuery, KrDialog;

{$R *.dfm}

procedure TFormFerreroDIeImpostosEASY.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then
  begin
    if str_relatorio in [1] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Clear;
    Exit;
  end;

  ValCodEdt(msk_cd_unid_neg);
  With datm_sel_unid_prod_cli.qry_unid_neg_ Do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure TFormFerreroDIeImpostosEASY.msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

procedure TFormFerreroDIeImpostosEASY.btn_cd_unid_negClick(Sender: TObject);
begin
  //vStr_cd_modulo := '23';
  //str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if (Cons_OnLine_Texto <> '' ) then msk_cd_unid_neg.Text := Cons_OnLine_Texto;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure TFormFerreroDIeImpostosEASY.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.text = '' then
  begin
    if str_relatorio in [1] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_produto );
  with datm_sel_unid_prod_cli do
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
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
      msk_cd_produto.SetFocus;
    end
  end;
end;

procedure TFormFerreroDIeImpostosEASY.msk_cd_produtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

procedure TFormFerreroDIeImpostosEASY.btn_co_produtoClick(Sender: TObject);
begin
//  vStr_cd_modulo := '23';
//  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto );
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if (Cons_OnLine_Texto <> '' ) then msk_cd_produto.Text := Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
end;

procedure TFormFerreroDIeImpostosEASY.SpeedButton1Click(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    edArquivo.Text := SaveDialog.FileName;
  end;
end;

procedure TFormFerreroDIeImpostosEASY.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text     := str_cd_unid_neg;
  msk_cd_produto.Text      := str_cd_produto;
end;

procedure TFormFerreroDIeImpostosEASY.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_sel_data_proc do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := str_cd_unid_neg + str_cd_produto +
                                                           msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        msk_nr_processo.Text := '';
        BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TFormFerreroDIeImpostosEASY.msk_nr_processoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_nr_processo then btn_co_processoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure TFormFerreroDIeImpostosEASY.btn_co_processoClick(
  Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := str_cd_unid_neg;
  frm_consulta_processo.str_cd_prod := str_cd_produto;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy(frm_consulta_processo.Nr_Processo,5,14);
    msk_nr_processoExit(nil);
  end;
end;

procedure TFormFerreroDIeImpostosEASY.Button2Click(Sender: TObject);
var
  Query: TLocalQuery;
  Text: TStrings;
begin
  if (msk_cd_unid_neg.Text = '') then
    Reject('Unidade de negócio não informado.');
  if (msk_cd_produto.Text = '') then
    Reject('Produto não informado.');
  if (msk_nr_processo.Text = '') then
    Reject('Processo não informado.');
  if (edArquivo.Text = '') then
    Reject('Arquivo não informado.');
  Text := TStringList.Create;
  try
    Query := AutoQuery.Query;
    Query.SQL.Text := 'SELECT TX_LINHA FROM [dbo].[FN_EDI_DI_FERRERO_EASY] (:NR_PROCESSO)';
    Query.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    Query.Open;
    while not Query.Eof do
    begin
      Text.Add(Query.FieldByName('TX_LINHA').AsString);
      Query.Next;
    end;
    Text.SaveToFile(edArquivo.Text);
    Information('Arquivo gerado com sucesso.');
  finally
    Text.Free;
  end;
end;

procedure TFormFerreroDIeImpostosEASY.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_sel_unid_prod_cli.Free;
  datm_sel_data_proc.Free;
end;

procedure TFormFerreroDIeImpostosEASY.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_unid_prod_cli, datm_sel_unid_prod_cli);
  Application.CreateForm(Tdatm_sel_data_proc, datm_sel_data_proc);
end;

procedure TFormFerreroDIeImpostosEASY.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
