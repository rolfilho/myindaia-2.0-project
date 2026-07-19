unit UAtualizaDatasOrgaosAnuentesProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls, DB, DBClient,
  Provider, DBTables, DBCtrls, KrQuery;

type
  TfrmAtualizaDatasOrgaosAnuentesProcesso = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    pnlCampos: TPanel;
    pnlDisponiveis: TPanel;
    pnlBotoes: TPanel;
    pnlSelecionados: TPanel;
    btnSeleciona: TSpeedButton;
    btnSelecionaTodos: TSpeedButton;
    btnRemove: TSpeedButton;
    btnRemoveTodos: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbgrdDisponiveis: TDBGrid;
    dbgrdSelecionados: TDBGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    medtDataEntrada: TMaskEdit;
    chkDataEntrada: TCheckBox;
    medtDataDeferimento: TMaskEdit;
    chkDataDeferimento: TCheckBox;
    medtDataVencimento: TMaskEdit;
    chkDataVencimento: TCheckBox;
    lbl4: TLabel;
    lbl5: TLabel;
    chkSomenteLISelecionada: TCheckBox;
    chkSomenteOrgaoSelecionado: TCheckBox;
    qryOrgaosAnuentesDisponiveis: TQuery;
    strngfld_li_NR_PROCESSO: TStringField;
    strngfld_li_NR_LI: TStringField;
    dspOrgaosAnuentesDisponiveis: TDataSetProvider;
    dsOrgaosAnuentesDisponiveis: TDataSource;
    cdsOrgaosAnuentesDisponiveis: TClientDataSet;
    strngfldLisDisponiveisNR_PROCESSO: TStringField;
    strngfldLisDisponiveisNR_LI: TStringField;
    strngfldOrgaosAnuentesDisponiveisCD_ORGAO_ANUENTE: TStringField;
    qryOrgaosAnuentesDisponiveisDT_DEFERIMENTO: TDateTimeField;
    qryOrgaosAnuentesDisponiveisDT_VENCTO: TDateTimeField;
    qryOrgaosAnuentesDisponiveisDT_ENTR_PROC: TDateTimeField;
    strngfldOrgaosAnuentesDisponiveisCD_ORGAO_ANUENTE1: TStringField;
    cdsOrgaosAnuentesDisponiveisDT_DEFERIMENTO: TDateTimeField;
    cdsOrgaosAnuentesDisponiveisDT_VENCTO: TDateTimeField;
    cdsOrgaosAnuentesDisponiveisDT_ENTR_PROC: TDateTimeField;
    cdsOrgaoAnuentesSelecionados: TClientDataSet;
    strngfld1: TStringField;
    strngfld2: TStringField;
    strngfld3: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    dsOrgaoAnuentesSelecionados: TDataSource;
    qryOrgaosAnuentes: TQuery;
    strngfld6: TStringField;
    qryLIs: TQuery;
    strngfld8: TStringField;
    cmbOrgaosAnuentes: TDBLookupComboBox;
    cmbLIs: TDBLookupComboBox;
    dsLIs: TDataSource;
    dsOrgaosAnuentes: TDataSource;
    strngfldLIsNR_LI_SEM_FORMATACAO: TStringField;
    Label1: TLabel;
    chkReferencia: TCheckBox;
    lblReferencia: TEdit;
    qryOrgaosAnuentesDisponiveisREFERENCIA: TStringField;
    cdsOrgaosAnuentesDisponiveisREFERENCIA: TStringField;
    cdsOrgaoAnuentesSelecionadosREFERENCIA: TStringField;
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnSelecionaTodosClick(Sender: TObject);
    procedure btnRemoveTodosClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtivarBotoes;
    procedure chkSomenteOrgaoSelecionadoClick(Sender: TObject);
    procedure chkSomenteLISelecionadaClick(Sender: TObject);
    procedure cmbLIsExit(Sender: TObject);
    procedure cmbOrgaosAnuentesExit(Sender: TObject);
    procedure FiltrarOrgaosDisponiveis;
    procedure chkDataEntradaClick(Sender: TObject);
    procedure chkDataDeferimentoClick(Sender: TObject);
    procedure chkDataVencimentoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure ValidarData(data : String);
    procedure medtDataEntradaExit(Sender: TObject);
    procedure medtDataDeferimentoExit(Sender: TObject);
    procedure medtDataVencimentoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkReferenciaClick(Sender: TObject);

  private
    { Private declarations }
    procedure AbrirQueries;
  public
    { Public declarations }
    Nr_Processo :String;
  end;

var
  frmAtualizaDatasOrgaosAnuentesProcesso: TfrmAtualizaDatasOrgaosAnuentesProcesso;

implementation

{$R *.dfm}

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.btnSelecionaClick(
  Sender: TObject);
begin
  if not cdsOrgaosAnuentesDisponiveis.isEmpty then
  begin
    if not cdsOrgaoAnuentesSelecionados.locate('NR_LI;CD_ORGAO_ANUENTE',
                                               VarArrayOf([cdsOrgaosAnuentesDisponiveis.FieldByName('NR_LI').asString,
                                                           cdsOrgaosAnuentesDisponiveis.FieldByName('CD_ORGAO_ANUENTE').asString]), []) then
    begin
      cdsOrgaoAnuentesSelecionados.append;

      cdsOrgaoAnuentesSelecionados.FieldByName('NR_PROCESSO').Value      := cdsOrgaosAnuentesDisponiveis.FieldByName('NR_PROCESSO').asString;
      cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').Value            := cdsOrgaosAnuentesDisponiveis.FieldByName('NR_LI').asString;
      cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').Value := cdsOrgaosAnuentesDisponiveis.FieldByName('CD_ORGAO_ANUENTE').asString;

      if cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').AsDatetime > 0 then
        cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').Value   := cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').AsDatetime
      else
        cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').Value   := null;

      if cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').AsDatetime > 0 then
        cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').Value        := cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').AsDatetime
      else
        cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').Value        := null;

      if cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').AsDatetime > 0 then
        cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').Value     := cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').AsDatetime
      else
        cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').Value     := null;

      if trim(cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').asString) <> '' then
        cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').Value     := cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').asString
      else
        cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').Value     := null;

      cdsOrgaoAnuentesSelecionados.post;
    end;
      cdsOrgaosAnuentesDisponiveis.delete;
  end;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.btnSelecionaTodosClick(
  Sender: TObject);
begin
  if not cdsOrgaosAnuentesDisponiveis.isEmpty then
  begin             
    cdsOrgaosAnuentesDisponiveis.first;
    while not cdsOrgaosAnuentesDisponiveis.eof do
    begin
      if not cdsOrgaoAnuentesSelecionados.locate('NR_LI;CD_ORGAO_ANUENTE',
                                                 VarArrayOf([cdsOrgaosAnuentesDisponiveis.FieldByName('NR_LI').asString,
                                                             cdsOrgaosAnuentesDisponiveis.FieldByName('CD_ORGAO_ANUENTE').asString]), []) then
      begin
        cdsOrgaoAnuentesSelecionados.append;

        cdsOrgaoAnuentesSelecionados.FieldByName('NR_PROCESSO').Value      := cdsOrgaosAnuentesDisponiveis.FieldByName('NR_PROCESSO').asString;
        cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').Value            := cdsOrgaosAnuentesDisponiveis.FieldByName('NR_LI').asString;
        cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').Value := cdsOrgaosAnuentesDisponiveis.FieldByName('CD_ORGAO_ANUENTE').asString;

        if cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').AsDatetime > 0 then
          cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').Value   := cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').AsDatetime
        else
          cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').Value   := null;

        if cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').AsDatetime > 0 then
          cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').Value        := cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').AsDatetime
        else
          cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').Value        := null;

        if cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').AsDatetime > 0 then
          cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').Value     := cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').AsDatetime
        else
          cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').Value     := null;

        if trim(cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').asString) <> '' then
          cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').Value     := cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').asString
        else
          cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').Value     := null;

      cdsOrgaoAnuentesSelecionados.post;
      end;

      cdsOrgaosAnuentesDisponiveis.next;
    end;

    cdsOrgaosAnuentesDisponiveis.DisableControls;
    try
      cdsOrgaosAnuentesDisponiveis.EmptyDataSet;
    finally
      cdsOrgaosAnuentesDisponiveis.EnableControls;
    end;
  end;
  AtivarBotoes;  
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.btnRemoveTodosClick(
  Sender: TObject);
begin
  if not cdsOrgaoAnuentesSelecionados.isEmpty then
  begin

    cdsOrgaoAnuentesSelecionados.first;
    while not cdsOrgaoAnuentesSelecionados.eof do
    begin
      if not cdsOrgaosAnuentesDisponiveis.locate('NR_LI;CD_ORGAO_ANUENTE',
                                                 VarArrayOf([cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').asString,
                                                             cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').asString]), []) then
      begin
        cdsOrgaosAnuentesDisponiveis.append;

        cdsOrgaosAnuentesDisponiveis.FieldByName('NR_PROCESSO').Value      := cdsOrgaoAnuentesSelecionados.FieldByName('NR_PROCESSO').asString;
        cdsOrgaosAnuentesDisponiveis.FieldByName('NR_LI').Value            := cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').asString;
        cdsOrgaosAnuentesDisponiveis.FieldByName('CD_ORGAO_ANUENTE').Value := cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').asString;

        if cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').AsDatetime > 0 then
          cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').Value   := cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').AsDatetime
        else
          cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').Value   := null;

        if cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').AsDatetime > 0 then
          cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').Value        := cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').AsDatetime
        else
          cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').Value        := null;

        if cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').AsDatetime > 0 then
          cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').Value     := cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').AsDatetime
        else
          cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').Value     := null;

        if trim(cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').asString) <> '' then
          cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').Value     := cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').AsDatetime
        else
          cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').Value     := null;

        cdsOrgaosAnuentesDisponiveis.post;
      end;
      
      cdsOrgaoAnuentesSelecionados.next;
    end;

    cdsOrgaoAnuentesSelecionados.DisableControls;
    try
      cdsOrgaoAnuentesSelecionados.EmptyDataSet;
    finally
      cdsOrgaoAnuentesSelecionados.EnableControls;
    end;
  end;
  AtivarBotoes;  
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.btnRemoveClick(
  Sender: TObject);
begin
  if not cdsOrgaoAnuentesSelecionados.isEmpty then
  begin
    if not cdsOrgaosAnuentesDisponiveis.locate('NR_LI;CD_ORGAO_ANUENTE',
                                               VarArrayOf([cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').asString,
                                                           cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').asString]), []) then
    begin
      cdsOrgaosAnuentesDisponiveis.append;

      cdsOrgaosAnuentesDisponiveis.FieldByName('NR_PROCESSO').Value      := cdsOrgaoAnuentesSelecionados.FieldByName('NR_PROCESSO').asString;
      cdsOrgaosAnuentesDisponiveis.FieldByName('NR_LI').Value            := cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').asString;
      cdsOrgaosAnuentesDisponiveis.FieldByName('CD_ORGAO_ANUENTE').Value := cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').asString;

      if cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').AsDatetime > 0 then
        cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').Value   := cdsOrgaoAnuentesSelecionados.FieldByName('DT_DEFERIMENTO').AsDatetime
      else
        cdsOrgaosAnuentesDisponiveis.FieldByName('DT_DEFERIMENTO').Value   := null;

      if cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').AsDatetime > 0 then
        cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').Value        := cdsOrgaoAnuentesSelecionados.FieldByName('DT_VENCTO').AsDatetime
      else
        cdsOrgaosAnuentesDisponiveis.FieldByName('DT_VENCTO').Value        := null;

      if cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').AsDatetime > 0 then
        cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').Value     := cdsOrgaoAnuentesSelecionados.FieldByName('DT_ENTR_PROC').AsDatetime
      else
        cdsOrgaosAnuentesDisponiveis.FieldByName('DT_ENTR_PROC').Value     := null;

      if trim(cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').asString) <> '' then
        cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').Value     := cdsOrgaoAnuentesSelecionados.FieldByName('REFERENCIA').asString
      else
        cdsOrgaosAnuentesDisponiveis.FieldByName('REFERENCIA').Value     := '';

      cdsOrgaosAnuentesDisponiveis.post;
    end;
      cdsOrgaoAnuentesSelecionados.delete;    
  end;
  AtivarBotoes;  
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.AtivarBotoes;
begin
  if (not cdsOrgaoAnuentesSelecionados.IsEmpty)
   and (chkDataVencimento.Checked
     or chkDataDeferimento.checked
     or chkDataEntrada.checked
     or chkReferencia.checked) then
  begin
    btn_salvar.enabled   := true;
    btn_cancelar.enabled := true;
  end
  else
  begin
    btn_salvar.enabled   := false;
    btn_cancelar.enabled := false;
  end;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.FormShow(
  Sender: TObject);
begin
  AbrirQueries;

  if medtDataEntrada.text = '  /  /    ' then
  begin
    chkDataEntrada.checked  := false;
    medtDataEntrada.Enabled := false;
  end;
  if medtDataDeferimento.text = '  /  /    ' then
  begin
    chkDataDeferimento.Checked  := false;
    medtDataDeferimento.Enabled := false;
  end;
  if medtDataVencimento.text = '  /  /    ' then
  begin
    chkDataVencimento.checked  := false;
    medtDataVencimento.Enabled := false;
  end;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.chkSomenteOrgaoSelecionadoClick(
  Sender: TObject);
begin
  cmbOrgaosAnuentes.enabled := chkSomenteOrgaoSelecionado.checked;
  FiltrarOrgaosDisponiveis;  
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.chkSomenteLISelecionadaClick(
  Sender: TObject);
begin
  cmbLIs.enabled := chkSomenteLISelecionada.checked;
  FiltrarOrgaosDisponiveis;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.cmbLIsExit(
  Sender: TObject);
begin
  FiltrarOrgaosDisponiveis;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.cmbOrgaosAnuentesExit(
  Sender: TObject);
begin
  FiltrarOrgaosDisponiveis;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.FiltrarOrgaosDisponiveis;
begin
  cdsOrgaosAnuentesDisponiveis.close;
  cdsOrgaosAnuentesDisponiveis.Params.ParamByName('NR_PROCESSO').value       := Nr_Processo;

  if ((not (cmbLIs.Text = '')) and chkSomenteLISelecionada.Checked) then
  cdsOrgaosAnuentesDisponiveis.Params.ParamByName('NR_LI').value             := cmbLIs.keyvalue
  else
  cdsOrgaosAnuentesDisponiveis.Params.ParamByName('NR_LI').value             := '';

  if ((not (cmbOrgaosAnuentes.text = '')) and chkSomenteOrgaoSelecionado.checked) then
    cdsOrgaosAnuentesDisponiveis.Params.ParamByName('CD_ORGAO_ANUENTE').value := cmbOrgaosAnuentes.text
  else
    cdsOrgaosAnuentesDisponiveis.Params.ParamByName('CD_ORGAO_ANUENTE').value := '';

  cdsOrgaosAnuentesDisponiveis.open;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.chkDataEntradaClick(
  Sender: TObject);
begin
  medtDataEntrada.enabled := chkDataEntrada.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.chkDataDeferimentoClick(
  Sender: TObject);
begin
  medtDataDeferimento.enabled := chkDataDeferimento.checked;
  AtivarBotoes;  
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.chkDataVencimentoClick(
  Sender: TObject);
begin
  medtDataVencimento.Enabled := chkDataVencimento.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.chkReferenciaClick(
  Sender: TObject);
begin
  lblReferencia.Enabled := chkReferencia.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.btn_cancelarClick(
  Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.btn_salvarClick(
  Sender: TObject);
var
  qryAtualizaDatas: TLocalSQLQuery;
  aLIs, aOrgaosAnuentes :string;
begin

  {Validação}
  if chkDataDeferimento.Checked then
  begin
    if medtDataDeferimento.text = '  /  /    ' then
    begin
     ShowMessage('Informe a Data de Deferimento.');
     exit;
    end;
    ValidarData(medtDataDeferimento.text);
  end;

  if chkDataEntrada.Checked then
  begin
    if medtDataEntrada.text = '  /  /    ' then
    begin
     ShowMessage('Informe a Data de Entrada.');
     exit;
    end;
    ValidarData(medtDataEntrada.text);
  end;

  if chkDataVencimento.Checked then
  begin
    if medtDataVencimento.text = '  /  /    ' then
    begin
     ShowMessage('Informe a Data de Vencimento.');
     exit;
    end;
    ValidarData(medtDataVencimento.text);    
  end;

  {Validação}

  {Gravação}
  aLIs := '';
  aOrgaosAnuentes := '';
  cdsOrgaoAnuentesSelecionados.First;
  while not cdsOrgaoAnuentesSelecionados.eof do
  begin
    if aLIs = '' then
      aLIs := '''' + TRIM(cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').asString) + ''''
    else
      aLIs := aLIs + ', ' + '''' + TRIM(cdsOrgaoAnuentesSelecionados.FieldByName('NR_LI').asString) + '''';

    if aOrgaosAnuentes = '' then
      aOrgaosAnuentes :=  '''' + TRIM(cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').asString) + ''''
    else
      aOrgaosAnuentes := aOrgaosAnuentes + ', ' + '''' + TRIM(cdsOrgaoAnuentesSelecionados.FieldByName('CD_ORGAO_ANUENTE').asString) + '''';

    cdsOrgaoAnuentesSelecionados.next;
  end;

  if aLIs <> '' then
  begin
    qryAtualizaDatas := TLocalSQLQuery.Create(nil);
    qryAtualizaDatas.sql.Text :=
    '   DECLARE @NR_PROCESSO       VARCHAR(18)                                                                      '  + sLineBreak +
    '   DECLARE @DATA_DEFERIMENTO  DATETIME                                                                         '  + sLineBreak +
    '   DECLARE @DT_VENCTO         DATETIME                                                                         '  + sLineBreak +
    '   DECLARE @DT_ENTR_PROC      DATETIME                                                                         '  + sLineBreak +
    '   DECLARE @DS_REFERENCIA     VARCHAR(30)                                                                      '  + sLineBreak +
    '   SET @NR_PROCESSO       = :NR_PROCESSO                                                                       '  + sLineBreak +
    '   SET @DATA_DEFERIMENTO  = :DATA_DEFERIMENTO                                                                  '  + sLineBreak +
    '   SET @DT_VENCTO         = :DT_VENCTO                                                                         '  + sLineBreak +
    '   SET @DT_ENTR_PROC      = :DT_ENTR_PROC                                                                      '  + sLineBreak +
    '   SET @DS_REFERENCIA     = :DS_REFERENCIA                                                                     '  + sLineBreak +
    '                                                                                                               '  + sLineBreak +
    '   UPDATE TPROCESSO_LI_ORGAO_ANUENTE                                                                           '  + sLineBreak +
    '      SET                                                                                                      '  + sLineBreak +
    '          DT_DEFERIMENTO = CASE WHEN @DATA_DEFERIMENTO IS NULL THEN DT_DEFERIMENTO ELSE @DATA_DEFERIMENTO END  '  + sLineBreak +
    '         ,DT_VENCTO      = CASE WHEN @DT_VENCTO        IS NULL THEN DT_VENCTO      ELSE @DT_VENCTO        END  '  + sLineBreak +
    '         ,DT_ENTR_PROC   = CASE WHEN @DT_ENTR_PROC     IS NULL THEN DT_ENTR_PROC   ELSE @DT_ENTR_PROC     END  '  + sLineBreak +
    '         ,REFERENCIA     = CASE WHEN @DS_REFERENCIA    IS NULL THEN REFERENCIA     ELSE @DS_REFERENCIA    END  '  + sLineBreak +
    '   FROM TPROCESSO_LI_ORGAO_ANUENTE A WITH (NOLOCK)                                                             '  + sLineBreak +
    '   WHERE NR_PROCESSO = @NR_PROCESSO                                                                            '  + sLineBreak +
    '     AND NR_LI            IN (' + aLIs +')                                                                     '  + sLineBreak +
    '     AND CD_ORGAO_ANUENTE IN (' + aOrgaosAnuentes +')                                                          '  + sLineBreak ;

    qryAtualizaDatas.close;
    qryAtualizaDatas.ParamByName('NR_PROCESSO').value      := cdsOrgaoAnuentesSelecionados.FieldByName('NR_PROCESSO').asString;


    qryAtualizaDatas.ParamByName('DATA_DEFERIMENTO').DataType := ftDateTime;
    if ((medtDataDeferimento.text <> '  /  /    ') and (chkDataDeferimento.Checked)) then
     qryAtualizaDatas.ParamByName('DATA_DEFERIMENTO').value := medtDataDeferimento.text
    else
     qryAtualizaDatas.ParamByName('DATA_DEFERIMENTO').value := unassigned;


    qryAtualizaDatas.ParamByName('DT_ENTR_PROC').DataType := ftDateTime;
    if ((medtDataEntrada.text <> '  /  /    ') and (chkDataEntrada.Checked)) then
     qryAtualizaDatas.ParamByName('DT_ENTR_PROC').value  := medtDataEntrada.Text
    else
     qryAtualizaDatas.ParamByName('DT_ENTR_PROC').value  := unassigned;


    qryAtualizaDatas.ParamByName('DT_VENCTO').DataType := ftDateTime;
    if ((medtDataVencimento.text <> '  /  /    ') and (chkDataVencimento.Checked)) then
     qryAtualizaDatas.ParamByName('DT_VENCTO').value   := medtDataVencimento.text
    else
     qryAtualizaDatas.ParamByName('DT_VENCTO').value   := unassigned;


    qryAtualizaDatas.ParamByName('DS_REFERENCIA').DataType := ftstring;
    if ((trim(lblReferencia.text) <> '') and (chkReferencia.Checked)) then
     qryAtualizaDatas.ParamByName('DS_REFERENCIA').value   := trim(lblReferencia.text)
    else
     qryAtualizaDatas.ParamByName('DS_REFERENCIA').value   := unassigned;

    qryAtualizaDatas.ExecSQL;
  end;
  {Gravação}

  btn_cancelar.Click;
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.ValidarData(data : String);
var sData :string;
begin
  try
    if data <> '  /  /    ' then
      sdata := DateToStr(StrToDate( data ) );
  except
    ShowMessage('Data Inválida. Digite novamente.' );
    abort;
  end;
end;
procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.medtDataEntradaExit(
  Sender: TObject);
begin
  ValidarData(medtDataEntrada.text);
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.medtDataDeferimentoExit(
  Sender: TObject);
begin
  ValidarData(medtDataDeferimento.text);
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.medtDataVencimentoExit(
  Sender: TObject);
begin
  ValidarData(medtDataVencimento.text);
end;

procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin   
  FreeAndNil(frmAtualizaDatasOrgaosAnuentesProcesso);
end;
            
procedure TfrmAtualizaDatasOrgaosAnuentesProcesso.AbrirQueries;
begin
  cdsOrgaoAnuentesSelecionados.createDataSet;
  
  qryOrgaosAnuentesDisponiveis.close;
  cdsOrgaosAnuentesDisponiveis.close;
  cdsOrgaosAnuentesDisponiveis.Params.ParamByName('NR_PROCESSO').value      := Nr_Processo;
  cdsOrgaosAnuentesDisponiveis.Params.ParamByName('NR_LI').value            := '';
  cdsOrgaosAnuentesDisponiveis.Params.ParamByName('CD_ORGAO_ANUENTE').value := '';
  cdsOrgaosAnuentesDisponiveis.open;

  qryOrgaosAnuentes.Close;
  qryOrgaosAnuentes.ParamByName('NR_PROCESSO').value := Nr_Processo;
  qryOrgaosAnuentes.ParamByName('NR_LI').value       := '';
  qryOrgaosAnuentes.Open;

  qryLIs.close;
  qryLIs.ParamByName('NR_PROCESSO').Value := Nr_Processo;
  qryLIs.open;
end;


end.





