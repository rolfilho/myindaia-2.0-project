(*************************************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGIN001.PAS - Formulário - Integração Work Image - frm_int_work_im

AUTOR: Carla Regina Castelo

DATA: 14/01/2002

*************************************************************************************************)
unit PGIN001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, UCRPE32, Funcoes;


type
  Tfrm_int_work_im = class(TForm)
    pnl_cadastro: TPanel;
    btn_gerar: TSpeedButton;
    btn_sair: TSpeedButton;
    mi_menu: TMainMenu;
    mi_gerar: TMenuItem;
    mi_sair: TMenuItem;
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    Label1: TLabel;
    msk_cd_produto: TMaskEdit;
    Label5: TLabel;
    msk_cd_cliente: TMaskEdit;
    lst_origem: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    lst_destino: TListBox;
    DstLabel: TLabel;
    SrcLabel: TLabel;
    edt_nm_cliente: TEdit;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    btn_co_cliente: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    lblGrupo: TLabel;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_grupo: TSpeedButton;
    Label2: TLabel;
    edt_nm_servico: TEdit;
    btn_co_servico: TSpeedButton;
    msk_cd_servico: TMaskEdit;
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
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_clienteEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_gerarClick(Sender: TObject);
  private
    cd_cliente, cd_unid_neg, cd_produto ,c1: String;
    procedure AbreProcessos;
    procedure EditaEtiqueta;
    { Private declarations }
  public
    { Public declarations }
    nr_rel_cobr_cart : String[5];
    Arquivo : TextFile;

  end;

var
  frm_int_work_im: Tfrm_int_work_im;

implementation

uses PGGP017, GSMLIB, PGGP001, PGGP015, PGSM024, PGSM018, PGSM010, PGSM119,
  PGIN002, PGSM022;
{$R *.DFM}

procedure Tfrm_int_work_im.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(lst_origem);
  MoveSelected(lst_origem, lst_destino.Items);
  SetItem(lst_origem, Index);
end;

procedure Tfrm_int_work_im.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(lst_destino);
  MoveSelected(lst_destino, lst_origem.Items);
  SetItem(lst_destino, Index);
end;

procedure Tfrm_int_work_im.IncAllBtnClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lst_origem.Items.Count - 1 do
    lst_destino.Items.AddObject(lst_origem.Items[i], lst_origem.Items.Objects[i]);
  lst_origem.Items.Clear;
  SetItem(lst_origem, 0);
end;

procedure Tfrm_int_work_im.ExcAllBtnClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lst_destino.Items.Count - 1 do
    lst_origem.Items.AddObject(lst_destino.Items[i], lst_destino.Items.Objects[i]);
  lst_destino.Items.Clear;
  SetItem(lst_destino, 0);
end;

procedure Tfrm_int_work_im.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  i: Integer;
begin
  for i := List.Items.Count - 1 downto 0 do
    if List.Selected[i] then
    begin
      Items.AddObject(List.Items[i], List.Items.Objects[i]);
      List.Items.Delete(i);
    end;
end;

procedure Tfrm_int_work_im.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := lst_origem.Items.Count = 0;
  DstEmpty := lst_destino.Items.Count = 0;
  IncludeBtn.Enabled := Not SrcEmpty;
  IncAllBtn.Enabled  := Not SrcEmpty;
  ExcludeBtn.Enabled := Not DstEmpty;
  ExAllBtn.Enabled   := Not DstEmpty;
end;

function Tfrm_int_work_im.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_int_work_im.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    if Index >= 0 then Selected[Index] := True;
  end;
  SetButtons;
end;

procedure Tfrm_int_work_im.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_int_work_im, datm_int_work_im);
end;

procedure Tfrm_int_work_im.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_int_work_im do
  begin
    qry_cliente_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_servico_.Close;
    qry_cliente_servico_.Close;
    qry_edita_etiqueta_.Close;
    qry_dados_processo_.Close;
    qry_arq_proc_.Close;
    qry_arq_import_.Close;
    qry_processo_.Close;
    qry_parametro_.Close;
    Free;
  end;

  Action := caFree;
end;

procedure Tfrm_int_work_im.msk_cd_clienteExit(Sender: TObject);
begin
  if cd_cliente <> msk_cd_cliente.Text then
  begin
    lst_origem.Clear;
    lst_destino.Clear;
  end
  else Exit;

  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    AbreProcessos;
  end
  else
  begin
    ValCodEdt( msk_cd_cliente );
    with datm_int_work_im.qry_cliente_ do
    begin
      Close;
      ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.Text;
      Prepare;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem( 'Cliente não encontrado!', 2 );
        msk_cd_cliente.Clear;
        edt_nm_cliente.Clear;
        Exit;
      end
      else
      begin
        edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
        AbreProcessos;
      end;
      Close;
    end;
  end;
end;

procedure Tfrm_int_work_im.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
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

procedure Tfrm_int_work_im.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_int_work_im.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_cliente   then btn_co_clienteClick(nil);
    if Sender = msk_cd_unid_neg  then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto   then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo     then btn_co_grupoClick(nil);
    if Sender = msk_cd_servico   then btn_co_servicoClick(nil);
  end;
end;

procedure Tfrm_int_work_im.AbreProcessos;
var cSQL : String;
begin
  with datm_int_work_im do
  begin
    if msk_cd_cliente.enabled  then
    begin
      cSQL := '';
      cSQL := cSQL + 'WHERE IN_ETIQUETA = "0" ';
      cSQL := cSQL + 'AND (( CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ) OR ( "' + msk_cd_unid_neg.Text + '" = "" )) ';
      cSQL := cSQL + 'AND (( CD_PRODUTO = "'  + msk_cd_produto.Text + '" ) OR ( "' + msk_cd_produto.Text + '" = "" )) ';
      cSQL := cSQL + 'AND (( CD_CLIENTE = "'  + msk_cd_cliente.Text + '" ) OR ( "' + msk_cd_cliente.Text + '" = "" )) ';
      cSQL := cSQL + 'AND (( CD_SERVICO = "'  + msk_cd_servico.Text + '" ) OR ( "' + msk_cd_servico.Text + '" = "" )) ';
      cSQL := cSQL + 'ORDER BY NR_PROCESSO ';
    end
    else
    begin
      cSQL := '';
      cSQL := cSQL + ' P , TEMPRESA_NAC E ';
      cSQL := cSQL + 'WHERE P.IN_ETIQUETA = "0" ';
      cSQL := cSQL + 'AND (( P.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ) OR ( "' + msk_cd_unid_neg.Text + '" = "" )) ';
      cSQL := cSQL + 'AND (( P.CD_PRODUTO = "'  + msk_cd_produto.Text + '" ) OR ( "' + msk_cd_produto.Text + '" = "" )) ';
      cSQL := cSQL + 'AND (( E.CD_GRUPO = "'    + msk_cd_grupo.Text + '" )   OR ( "' + msk_cd_grupo.Text + '" = "" )) ';
      cSQL := cSQL + 'AND (( P.CD_SERVICO = "'  + msk_cd_servico.Text + '" ) OR ( "' + msk_cd_servico.Text + '" = "" )) ';
      cSQL := cSQL + 'AND P.CD_CLIENTE = E.CD_EMPRESA ';
      cSQL := cSQL + 'ORDER BY NR_PROCESSO ';
    End;
    qry_processo_.Close;
    qry_processo_.SQL[2] := cSQL;
    qry_processo_.Prepare;
    qry_processo_.Open;
    qry_processo_.First;
    lst_origem.Clear;
    lst_destino.Clear;
    while Not qry_processo_.EOF do
    begin
      lst_origem.Items.Add( copy (qry_processo_.FieldByName('NR_PROCESSO').AsString,5,length(qry_processo_.FieldByName('NR_PROCESSO').AsString)) );
      qry_processo_.Next;
    end;
    qry_processo_.Close;
  end;
end;

procedure Tfrm_int_work_im.btn_sairClick(Sender: TObject);
begin
  Close;
end;
procedure Tfrm_int_work_im.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_int_work_im.msk_cd_clienteEnter(Sender: TObject);
begin
  cd_cliente := msk_cd_cliente.Text;
end;

procedure Tfrm_int_work_im.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto := msk_cd_produto.Text;
end;

procedure Tfrm_int_work_im.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_int_work_im.msk_cd_unid_negExit(Sender: TObject);
begin
  if cd_unid_neg <> msk_cd_unid_neg.Text then
  begin
    lst_origem.Clear;
    lst_destino.Clear;
  end
  else Exit;
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_unid_neg );
  with datm_Int_work_im.qry_unid_neg_ do
  begin
    Close;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      Exit;
    end
    else
    begin
      edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
      AbreProcessos;
    end;
    Close;
  end;
end;

procedure Tfrm_int_work_im.msk_cd_produtoExit(Sender: TObject);
begin
  if cd_produto <> msk_cd_produto.Text then
  begin
    lst_origem.Clear;
    lst_destino.Clear;
  end
  else Exit;

  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_produto );
  with datm_Int_work_im.qry_produto_ do
  begin
    Close;
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Produto não encontrado!', 2 );
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
      Exit;
    end
    else
    begin
      edt_nm_produto.Text:= FieldByName('NM_PRODUTO').AsString;
      AbreProcessos;
    end;
    Close;
  end;
end;

procedure Tfrm_int_work_im.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    msk_cd_produtoExit(nil);
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_int_work_im.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
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






procedure Tfrm_int_work_im.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Enabled := False;
    btn_co_cliente.Enabled := False;
  end
  else
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    btn_co_cliente.Enabled := True;
  end;
end;

procedure Tfrm_int_work_im.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
    msk_cd_grupoExit(nil);
    if ( frm_grupo.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_grupoExit(nil);
end;


procedure Tfrm_int_work_im.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  With datm_int_work_im.qry_grupo_ Do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo de Clientes não encontrado!',2);
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    AbreProcessos;
    Close;
  end;

end;


procedure Tfrm_int_work_im.btn_co_servicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';

  Application.CreateForm(Tfrm_servico, frm_servico);
  with frm_servico do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_servico.Text := frm_servico.Cons_OnLine_Texto;

  vStr_cd_modulo := '15';
  str_cd_rotina := '1555';

  msk_cd_servicoExit(nil);
end;

procedure Tfrm_int_work_im.msk_cd_servicoExit(Sender: TObject);
begin
  { Servico }
  if (msk_cd_servico.Text <> '') then
  begin
    ValCodEdt( msk_cd_servico );

    with datm_int_work_im.qry_servico_ do
    begin
      Close;
      ParamByName('CD_SERVICO').AsString := msk_cd_servico.Text;
      Prepare;
      Open;
      if Eof then
      begin
        BoxMensagem('Serviço inexistente!', 2);
        msk_cd_servico.Text      := '';
        edt_nm_servico.Text      := '';
        msk_cd_servico.SetFocus;
      end
      else
      begin
        {Cliente X Serviço}
        with datm_int_work_im do
        begin
          edt_nm_servico.Text      := qry_servico_NM_SERVICO.AsString;

          qry_cliente_servico_.Close;
          if msk_cd_grupo.Text <> '' then
             qry_cliente_servico_.SQL[5] := 'AND E.CD_GRUPO = "' + msk_cd_grupo.Text + '"'
          else if msk_cd_cliente.Text <> '' then
             qry_cliente_servico_.SQL[5] := 'AND S.CD_CLIENTE = "' + msk_cd_cliente.Text + '"';

          qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.Text;
          qry_cliente_servico_.Prepare;
          qry_cliente_servico_.Open;

          if qry_cliente_servico_.EOF then
          begin
            BoxMensagem( 'Grupo/Cliente não tem habilitação para este serviço!', 2);
            msk_cd_servico.SetFocus;
            Exit;
          end;
        end;
      end;
    end;
  end
  else
    edt_nm_servico.Text := 'Todos';
  AbreProcessos;
end;

procedure Tfrm_int_work_im.msk_cd_clienteChange(Sender: TObject);
begin
 if msk_cd_cliente.Text <> '' then
  begin
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Enabled := False;
    btn_co_grupo.Enabled := False;
  end
  else
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    btn_co_grupo.Enabled := True;
  end;
end;

procedure Tfrm_int_work_im.btn_gerarClick(Sender: TObject);
var i : integer;
    arq_nome : String;
    CNPJ_CPF : String;
    J_F : String;
    Str_dec_sep : char;

begin
 if  Trim(msk_cd_unid_neg.Text) = ''   then
  begin
    BoxMensagem('Informe uma Unidade de Negócio!', 2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if  Trim(msk_cd_produto.Text) = ''  then
  begin
    BoxMensagem('Informe um Produto!', 2);
    msk_cd_produto.SetFocus;
    Exit;
  end;

  Str_dec_sep := DecimalSeparator;
  DecimalSeparator := '.';
  with datm_int_work_im do
  Begin
    if lst_destino.Items.Count = 0 then
    begin
      BoxMensagem( 'Nenhum processo foi selecionado', 2 );
      Exit;
    end;

    qry_parametro_.close;
    qry_parametro_.open;
    if  qry_parametro_.fieldbyname('PATH_WORK_IMAGE').AsString = '' then begin
      BoxMensagem('Não existe um diretório na rotina de paramêtros para gerar os arquivos!', 2);
      Exit;
    end;


    try
      Application.ProcessMessages;
      Arq_nome  := qry_parametro_.fieldbyname('PATH_WORK_IMAGE').AsString + '\DI019.TXT';
      AssignFile( Arquivo, Arq_nome );
      Rewrite( Arquivo );
      for i := 0 to lst_destino.Items.Count - 1 do
      begin
        qry_dados_processo_.Close;
        qry_dados_processo_.ParamByName('CD_UNID_NEG').AsString    := Trim( msk_cd_unid_neg.Text );
        qry_dados_processo_.ParamByName('CD_PRODUTO').AsString     := Trim( msk_cd_produto.Text );
        qry_dados_processo_.ParamByName('NR_PROCESSO').AsString    := Trim( msk_cd_unid_neg.Text ) +  Trim( msk_cd_produto.Text )+ Trim( lst_destino.Items[i] );
        qry_dados_processo_.Open;


        qry_arq_proc_.close;
        qry_arq_proc_.parambyname('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_arq_proc_.parambyname('CD_PRODUTO').AsString  := Trim( msk_cd_produto.Text );
        qry_arq_proc_.parambyname('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +  Trim( msk_cd_produto.Text )+ Trim( lst_destino.Items[i] );
        qry_arq_proc_.parambyname('CD_SERVICO').AsString  := qry_dados_processo_CD_SERVICO.AsString;
        qry_arq_proc_.open;

        qry_arq_proc_.first;
        While not qry_arq_proc_.eof do
        Begin
          c1 := '';
          c1 := '"' + qry_arq_proc_NR_PROCESSO.AsString + '", "' +
                        qry_arq_proc_CD_CLIENTE.AsString  + '", "' +
                        qry_arq_proc_NR_DECLARACAO_IMP.AsString  + '", "' ;

          if  qry_arq_proc_DT_REGISTRO_DI.AsString <> '' then
            c1 := c1 + copy (qry_arq_proc_DT_REGISTRO_DI.AsString, 1,2) +'/'+ copy (qry_arq_proc_DT_REGISTRO_DI.AsString, 3,2) + '/'+ copy (qry_arq_proc_DT_REGISTRO_DI.AsString, 5,4)  + '", "'
          else
            c1 := c1 + '", "';

          if  qry_arq_proc_VL_MLE_MN.AsFloat <> 0 then
             c1 := c1 + formatfloat('#.##00',qry_arq_proc_VL_MLE_MN.AsFloat) + '", "'
          else
             c1 := c1 + '0", "';

          c1 := c1  +  qry_arq_proc_NR_CONHECIMENTO.AsString  + '","' +
                       qry_arq_proc_NR_CONHECIMENTO_MASTER.AsString  + '","' +
                       qry_arq_proc_TX_MERCADORIA.AsString  + '","' +
                       qry_arq_proc_CD_REFERENCIA.AsString  + '","' +
                       qry_arq_proc_DT_ABERTURA.AsString+ '","' +
                       qry_arq_proc_DATA_TERMINO.AsString+ '"' + #13#10;
          write( Arquivo, c1);
          qry_arq_proc_.next;
        End;
      End;
      write( Arquivo, '--------------=D480031570C017BE5F4');
      closeFile(Arquivo);
      BoxMensagem('Arquivo gerado com sucesso: '+ Arq_nome , 3 );

      Application.ProcessMessages;
      Arq_nome  := qry_parametro_.fieldbyname('PATH_WORK_IMAGE').AsString + '\GI001.TXT';
      AssignFile( Arquivo, Arq_nome );
      Rewrite( Arquivo );
      for i := 0 to lst_destino.Items.Count - 1 do
      begin
        qry_dados_processo_.Close;
        qry_dados_processo_.ParamByName('CD_UNID_NEG').AsString    := Trim( msk_cd_unid_neg.Text );
        qry_dados_processo_.ParamByName('CD_PRODUTO').AsString     := Trim( msk_cd_produto.Text );
        qry_dados_processo_.ParamByName('NR_PROCESSO').AsString    := Trim( msk_cd_unid_neg.Text ) +  Trim( msk_cd_produto.Text )+ Trim( lst_destino.Items[i] );
        qry_dados_processo_.Open;


        qry_arq_import_.close;
        qry_arq_import_.parambyname('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_arq_import_.parambyname('CD_PRODUTO').AsString  := Trim( msk_cd_produto.Text );
        qry_arq_import_.parambyname('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +  Trim( msk_cd_produto.Text )+ Trim( lst_destino.Items[i] );
        qry_arq_import_.parambyname('CD_SERVICO').AsString  := qry_dados_processo_CD_SERVICO.AsString;
        qry_arq_import_.parambyname('CD_CLIENTE').AsString  := qry_dados_processo_CD_CLIENTE.AsString;
        qry_arq_import_.open;

        qry_arq_import_.first;
        CNPJ_CPF := '';
        J_F := '';
        While not qry_arq_import_.eof do
        Begin
          if qry_arq_import_CGC_EMPRESA.AsString <> '' then
             CNPJ_CPF := qry_arq_import_CGC_EMPRESA.AsString
          else
             CNPJ_CPF := qry_arq_import_CPF_EMPRESA.AsString;

          if qry_arq_import_CD_TIPO_PESSOA.AsString = '1' then
             J_F := 'J'
          else
             J_F := 'F';

          c1 := '';
          c1 := '"' + CNPJ_CPF  + '", "' +
                      qry_arq_import_NM_EMPRESA.AsString + '", "' +
                      qry_arq_import_AP_EMPRESA.AsString + '", "' +
                      J_F + '", "' +
                      qry_arq_import_DT_VALID_CRED_RF.AsString + '", "' +
                      qry_arq_import_CD_CLIENTE.AsString + '", "' +
                      qry_arq_import_END_CIDADE.AsString + '"' + #13#10;

          write( Arquivo, c1);
          qry_arq_import_.next;
        End;
      End;
      write( Arquivo, '--------------=D480031318F02D01E8C');
      closeFile(Arquivo);
      BoxMensagem('Arquivo gerado com sucesso: '+ Arq_nome , 3 );
    except
      BoxMensagem('Falha na geração dos arquivos!', 2);
    end;


    EditaEtiqueta;

    lst_origem.Clear;
    lst_destino.Clear;

    btn_gerar.Enabled := True;
    mi_gerar.Enabled  := True;

    if msk_cd_cliente.Enabled  then
    begin
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else
    begin
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
  end;
  DecimalSeparator := Str_dec_sep;
end;

procedure Tfrm_int_work_im.EditaEtiqueta;
var
 i:integer;
begin
  for i := 0 to lst_destino.Items.Count - 1 do
  begin
    with datm_int_work_im do
    Begin
      qry_edita_etiqueta_.close;
      qry_edita_etiqueta_.requestlive := true;
      qry_edita_etiqueta_.parambyname ('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_edita_etiqueta_.parambyname ('CD_PRODUTO').AsString :=  Trim( msk_cd_produto.Text );
      qry_edita_etiqueta_.parambyname ('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +  Trim( msk_cd_produto.Text )+ Trim( lst_destino.Items[i] );
      qry_edita_etiqueta_.open;
      if qry_edita_etiqueta_.recordcount <> 0 then
      begin
        qry_edita_etiqueta_.edit;
        qry_edita_etiqueta_IN_ETIQUETA.AsString := '1';
        qry_edita_etiqueta_.post;
      end;
    End;
  end;
end;
end.
