unit UDIExterna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmDIExterna = class(TForm)
    pnlFundo: TPanel;
    pgcPagamentoMercante: TPageControl;
    tbsLista: TTabSheet;
    tbsSuspensao: TTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedtTP_SUSPENCAO: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dblkSuspensao: TDBLookupComboBox;
    tbsIsencao: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    dbedtTP_ISENCAO: TDBEdit;
    dbedtNR_PARCELA: TDBEdit;
    dblkIsencao: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    rgTipoSuspensao: TDBRadioGroup;
    rgTipoIsencao: TDBRadioGroup;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Panel4: TPanel;
    pnlBtns: TPanel;
    btnInserirSuspensao: TBitBtn;
    btnAlterarSuspensao: TBitBtn;
    btnExcluirSuspensao: TBitBtn;
    dbgSuspensao: TDBGrid;
    Panel2: TPanel;
    dbgIntegral: TDBGrid;
    btnInserirIntegral: TBitBtn;
    btnExcluirIntegral: TBitBtn;
    Panel1: TPanel;
    dbgIsencao: TDBGrid;
    btnInserirIsencao: TBitBtn;
    btnAlterarIsencao: TBitBtn;
    btnExcluirIsencao: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    btnGravarSuspensao: TBitBtn;
    btnCancelarSuspensao: TBitBtn;
    Panel5: TPanel;
    btnGravaIsencao: TBitBtn;
    btnCancelarIsencao: TBitBtn;
    Panel6: TPanel;
    btnContinuar: TBitBtn;
    btnCancelar: TBitBtn;
    lblIntegral: TLabel;
    tbsNacionalizacao: TTabSheet;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    Panel8: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    btnAlterarIntegral: TBitBtn;
    procedure btnInserirSuspensaoClick(Sender: TObject);
    procedure btnInserirIsencaoClick(Sender: TObject);
    procedure btnAlterarSuspensaoClick(Sender: TObject);
    procedure btnAlterarIsencaoClick(Sender: TObject);
    procedure btnExcluirIsencaoClick(Sender: TObject);
    procedure btnExcluirSuspensaoClick(Sender: TObject);
    procedure btnExcluirIntegralClick(Sender: TObject);
    procedure btnGravarSuspensaoClick(Sender: TObject);
    procedure btnGravaIsencaoClick(Sender: TObject);
    procedure btnCancelarIsencaoClick(Sender: TObject);
    procedure btnCancelarSuspensaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirIntegralClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnAlterarIntegralClick(Sender: TObject);
  private
    { Private declarations }
  procedure AbrirQuery;
  procedure PreencherOutrosCampos(TIPO_PGMTO : Integer);
  public
    { Public declarations }
    NRPROCESSO : String;
    NUMCE : String;
    CONHECIMENTO : String;
    NACIONALIZACAO : String;
  procedure FecharQuery;
  procedure EsconderMostrarPaginas(paginaMostrar : String ='');
  end;

var
  frmDIExterna: TfrmDIExterna;

implementation

uses
  DmBroker;

{$R *.dfm}

procedure TfrmDIExterna.FormCreate(Sender: TObject);
begin
  dmdBroker.qryIsencao.close;
  dmdBroker.cdsIsencao.close;
  dmdBroker.cdsIsencao.Open;
  dmdBroker.qrySuspensao.Close;
  dmdBroker.cdsSuspensao.Close;
  dmdBroker.cdsSuspensao.Open;
  EsconderMostrarPaginas;
end;

procedure TfrmDIExterna.FormShow(Sender: TObject);
begin
  AbrirQuery;
  if NACIONALIZACAO = '1' then
  begin
    frmDIExterna.EsconderMostrarPaginas;
  //  frmDIExterna.btnInserirIntegral.enabled := true;
  //  frmDIExterna.btnExcluirIntegral.enabled := true;

    btnInserirSuspensao.Enabled := false;
    btnAlterarSuspensao.Enabled := false;
    btnExcluirSuspensao.Enabled := false;
    btnInserirIsencao.Enabled := false;
    btnAlterarIsencao.Enabled := false;
    btnExcluirIsencao.Enabled := false;
    lblIntegral.Visible := false;

    //inserindo pro usuario só precisar alterar
    NACIONALIZACAO := '0';
    btnInserirIntegral.Click;
    NACIONALIZACAO := '1';
    dbgIntegral.Columns[1].Visible := true;
  end
  else
  begin
  //  frmDIExterna.btnInserirIntegral.enabled := false;
  //  frmDIExterna.btnExcluirIntegral.enabled := false;

    btnInserirSuspensao.Enabled := true;
    btnAlterarSuspensao.Enabled := true;
    btnExcluirSuspensao.Enabled := true;
    btnInserirIsencao.Enabled := true;
    btnAlterarIsencao.Enabled := true;
    btnExcluirIsencao.Enabled := true;
    lblIntegral.Visible := true;
    dbgIntegral.Columns[1].Visible := false;
  end;
end;

procedure TfrmDIExterna.btnGravarSuspensaoClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExternaCD_TP_SUSPENSAO.asString = '' then
  begin
    Application.MessageBox(PWideChar('Preencha o tipo de suspensão!'), 'Atenção!', MB_OK);
    exit;
  end;

  if dmdBroker.cdsDIExternaIC_SUSPENSAO_PARCIAL.AsString = '1' then
    if dmdBroker.cdsDIExternaQT_PESO_SUSPENSAO.asFloat = 0 then
    begin
      Application.MessageBox(PWideChar('Preencha o peso da suspensão!'), 'Atenção!', MB_OK);
      exit;
    end;

  PreencherOutrosCampos(3);
  dmdBroker.cdsDIExterna.post;
  dmdBroker.cdsDIExterna.ApplyUpdates(0);
  EsconderMostrarPaginas;
  pgcPagamentoMercante.ActivePage := tbsLista;
  AbrirQuery;
end;

procedure TfrmDIExterna.btnCancelarSuspensaoClick(Sender: TObject);
begin
  dmdBroker.cdsDIExterna.cancel;
  EsconderMostrarPaginas;
  pgcPagamentoMercante.ActivePage := tbsLista;
end;

procedure TfrmDIExterna.btnGravaIsencaoClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExternaCD_TP_ISENCAO.asString = '' then
  begin
    Application.MessageBox(PWideChar('Preencha o tipo de isenção!'), 'Atenção!', MB_OK);
    exit;
  end;

  if dmdBroker.cdsDIExternaIC_ISENCAO_PARCIAL.AsString = '1' then
    if dmdBroker.cdsDIExternaQT_PESO_ISENCAO.asFloat = 0 then
    begin
      Application.MessageBox(PWideChar('Preencha o peso da isenção!'), 'Atenção!', MB_OK);
      exit;
    end;

  PreencherOutrosCampos(2);
  dmdBroker.cdsDIExterna.post;
  dmdBroker.cdsDIExterna.ApplyUpdates(0);

  EsconderMostrarPaginas;
  pgcPagamentoMercante.ActivePage := tbsLista;
  AbrirQuery;
  btnInserirIntegral.Click;
end;

procedure TfrmDIExterna.btnCancelarIsencaoClick(Sender: TObject);
begin
  dmdBroker.cdsDIExterna.cancel;
  EsconderMostrarPaginas;
  pgcPagamentoMercante.ActivePage := tbsLista;
end;

procedure TfrmDIExterna.btnAlterarIntegralClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExterna.Locate('CD_PGMTO_SEM_DI', dmdBroker.cdsDIExternaIntegral.FieldByName('CD_PGMTO_SEM_DI').asInteger, []) then
  begin
    EsconderMostrarPaginas('tbsNacionalizacao');
    pgcPagamentoMercante.ActivePage := tbsNacionalizacao;
    dmdBroker.cdsDIExterna.edit;
  end;
end;

procedure TfrmDIExterna.BitBtn3Click(Sender: TObject);
begin
  PreencherOutrosCampos(1);
  dmdBroker.cdsDIExterna.post;
  dmdBroker.cdsDIExterna.ApplyUpdates(0);

  EsconderMostrarPaginas;
  pgcPagamentoMercante.ActivePage := tbsLista;
  AbrirQuery;
end;

procedure TfrmDIExterna.BitBtn5Click(Sender: TObject);
begin
  if dmdBroker.cdsDIExterna.Locate('CD_PGMTO_SEM_DI', dmdBroker.cdsDIExternaIsencao.FieldByName('CD_PGMTO_SEM_DI').asInteger, []) then
  begin
    EsconderMostrarPaginas('tbsnacionalizacao');
    pgcPagamentoMercante.ActivePage := tbsNacionalizacao;
    dmdBroker.cdsDIExterna.edit;
  end;
end;

procedure TfrmDIExterna.btnAlterarIsencaoClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExterna.Locate('CD_PGMTO_SEM_DI', dmdBroker.cdsDIExternaIsencao.FieldByName('CD_PGMTO_SEM_DI').asInteger, []) then
  begin
    EsconderMostrarPaginas('tbsIsencao');
    pgcPagamentoMercante.ActivePage := tbsIsencao;
    dmdBroker.cdsDIExterna.edit;
  end;
end;

procedure TfrmDIExterna.btnAlterarSuspensaoClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExterna.Locate('CD_PGMTO_SEM_DI', dmdBroker.cdsDIExternaSuspensao.FieldByName('CD_PGMTO_SEM_DI').asInteger, []) then
  begin
    EsconderMostrarPaginas('tbsSuspensao');
    dmdBroker.cdsDIExterna.edit;
    pgcPagamentoMercante.ActivePage := tbsSuspensao;
  end;
end;

procedure TfrmDIExterna.btnExcluirIntegralClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExterna.Locate('CD_PGMTO_SEM_DI', dmdBroker.cdsDIExternaIntegral.FieldByName('CD_PGMTO_SEM_DI').asInteger, []) then
  begin
    dmdBroker.cdsDIExterna.delete;
    dmdBroker.cdsDIExterna.ApplyUpdates(0);
    AbrirQuery;
  end;
end;

procedure TfrmDIExterna.btnExcluirIsencaoClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExterna.Locate('CD_PGMTO_SEM_DI', dmdBroker.cdsDIExternaIsencao.FieldByName('CD_PGMTO_SEM_DI').asInteger, []) then
  begin
    dmdBroker.cdsDIExterna.delete;
    dmdBroker.cdsDIExterna.ApplyUpdates(0);
    AbrirQuery;
  end;
  if dmdBroker.cdsDIExternaIsencao.RecordCount = 0 then
    btnExcluirIntegral.Click;
end;

procedure TfrmDIExterna.btnExcluirSuspensaoClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExterna.Locate('CD_PGMTO_SEM_DI', dmdBroker.cdsDIExternaSuspensao.FieldByName('CD_PGMTO_SEM_DI').asInteger, []) then
  begin
    dmdBroker.cdsDIExterna.delete;
    dmdBroker.cdsDIExterna.ApplyUpdates(0);
    AbrirQuery;
  end;
end;

procedure TfrmDIExterna.btnInserirIntegralClick(Sender: TObject);
begin
  if dmdBroker.cdsDIExternaIntegral.RecordCount = 0 then
  begin
    if NACIONALIZACAO = '1' then
    begin
      dmdBroker.cdsDIExterna.Append;
      EsconderMostrarPaginas('tbsNacionalizacao');
      pgcPagamentoMercante.ActivePage := tbsNacionalizacao;
    end
    else
    begin
      dmdBroker.cdsDIExterna.Append;
      PreencherOutrosCampos(1);
      dmdBroker.cdsDIExterna.post;
      dmdBroker.cdsDIExterna.ApplyUpdates(0);
      AbrirQuery;
    end;
  end;
end;

procedure TfrmDIExterna.btnInserirIsencaoClick(Sender: TObject);
begin
  dmdBroker.cdsDIExterna.Append;
  dmdBroker.cdsDIExterna.fieldByName('IC_ISENCAO_PARCIAL').value := 0;
  EsconderMostrarPaginas('tbsIsencao');
  pgcPagamentoMercante.ActivePage := tbsIsencao;
end;

procedure TfrmDIExterna.btnInserirSuspensaoClick(Sender: TObject);
begin
  dmdBroker.cdsDIExterna.Append;
  dmdBroker.cdsDIExterna.fieldByName('IC_SUSPENSAO_PARCIAL').value := 0;
  EsconderMostrarPaginas('tbsSuspensao');
  pgcPagamentoMercante.ActivePage := tbsSuspensao;
end;

procedure TfrmDIExterna.EsconderMostrarPaginas(paginaMostrar : String = '');
var
  I: Integer;
begin
  for I := 0 to pgcPagamentoMercante.PageCount-1 do
  begin
    if not (pgcPagamentoMercante.Pages[i].Name = 'tbsLista') then
      pgcPagamentoMercante.Pages[i].TabVisible := false;

    if (pgcPagamentoMercante.Pages[i].Name = paginaMostrar) then
      pgcPagamentoMercante.Pages[i].TabVisible := true;
  end;
end;

procedure TfrmDIExterna.AbrirQuery;
begin
  FecharQuery;

  dmdBroker.cdsDIExterna.ParamByName('NR_PROCESSO').AsString          := NRPROCESSO;
  dmdBroker.cdsDIExternaIsencao.ParamByName('NR_PROCESSO').AsString   := NRPROCESSO;
  dmdBroker.cdsDIExternaSuspensao.ParamByName('NR_PROCESSO').AsString := NRPROCESSO;
  dmdBroker.cdsDIExternaIntegral.ParamByName('NR_PROCESSO').AsString  := NRPROCESSO;


  dmdBroker.cdsDIExternaIsencao.Open;
  dmdBroker.cdsDIExternaSuspensao.Open;
  dmdBroker.cdsDIExternaIntegral.Open;
  dmdBroker.cdsDIExterna.Open;
end;

procedure TfrmDIExterna.FecharQuery;
begin
  dmdBroker.qryDIExterna.close;
  dmdBroker.cdsDIExterna.close;
  dmdBroker.cdsDIExternaIsencao.close;
  dmdBroker.cdsDIExternaSuspensao.close;
  dmdBroker.cdsDIExternaIntegral.close;
end;

procedure TfrmDIExterna.PreencherOutrosCampos(TIPO_PGMTO : Integer);
begin
  dmdBroker.cdsDIExterna.fieldByName('NR_PROCESSO').value     := NRPROCESSO;
  dmdBroker.cdsDIExterna.fieldByName('TP_PGMTO').value        := TIPO_PGMTO;
  dmdBroker.cdsDIExterna.fieldByName('NR_CONHECIMENTO').value := CONHECIMENTO;
  dmdBroker.cdsDIExterna.fieldByName('NUM_CE').value          := NUMCE;
end;

end.

