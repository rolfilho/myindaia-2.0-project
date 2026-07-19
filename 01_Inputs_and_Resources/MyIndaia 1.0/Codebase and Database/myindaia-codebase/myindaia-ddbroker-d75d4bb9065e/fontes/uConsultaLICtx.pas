unit uConsultaLICtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DMLeiaute, DBCtrls, CheckLst;

type
  TPeriodo = class
    DataInicial: TdateTime;
    DataFinal: TdateTime;
  end;

  TOpcoesCtx = class
  public
    //Numero do processo, Numero da LI, Status, Data de registro da LI, data de deferimento
    UnidaDeNegocio: string;
    Produto: string;
    NrProcesso: string;
    NrLi: string;
    Cliente: string;
    Grupo: string;
    PeridoRegistro: TPeriodo;
    PeridoDeferimento: TPeriodo;
    PeridoEntradaOrgaoAnuente: TPeriodo;
    PeridoStatus: TPeriodo;
    Status: string;
    Leiaute: string;
    constructor Create;
    destructor Destroy; override;
  end;

  TfmConsultaLiCtx = class(TForm)
    lbl_nr_processo: TLabel;
    btn_nr_processo: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    chkProcessos: TCheckBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    mskDataDeferimentoIni: TMaskEdit;
    mskDataDeferimentoFin: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    mskDataEntradaOrgaoAnuenteIni: TMaskEdit;
    mskDataEntradaOrgaoAnuenteFin: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    lbl19: TLabel;
    lblGrupo: TLabel;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_grupo: TSpeedButton;
    edt_cd_cliente: TMaskEdit;
    clbStatus: TCheckListBox;
    mskDataStatusFin: TMaskEdit;
    mskDataStatusIni: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure dbedt_cd_clienteChange(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure edt_cd_clienteChange(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Executa(Opcoes: TOpcoesCtx): Boolean;
  end;

implementation

uses PGGP001, ConsOnLineEx, GSMLIB, Funcoes, PGGP019, PGSM119;

{$R *.dfm}

{ TfmConsultaLiCtx }

class function TfmConsultaLiCtx.Executa(Opcoes: TOpcoesCtx): Boolean;
var
  Form: TfmConsultaLiCtx;
  I: Integer;
begin
  Form := TfmConsultaLiCtx.Create(nil);
  try
    Result := Form.ShowModal = mrOk;
    if Result then
    begin
      Opcoes.UnidaDeNegocio := Form.msk_cd_unid_neg.Text;
      Opcoes.Produto := Form.msk_cd_produto.Text;
      if (Form.msk_nr_processo.Text <> '') then
        Opcoes.NrProcesso := Form.msk_cd_unid_neg.Text + Form.msk_cd_produto.Text + Form.msk_nr_processo.Text
      else
        Opcoes.NrProcesso := '';
      if Form.edt_cd_cliente.Text <> '' then
        Opcoes.Cliente := Form.edt_cd_cliente.Text;
      if Form.msk_cd_grupo.Text <> '' then
        Opcoes.Grupo := Form.msk_cd_grupo.Text;
      Opcoes.PeridoRegistro.DataInicial := StrToDateTimeDef(Form.mskDataregistroIni.Text, 0);
      Opcoes.PeridoRegistro.DataFinal := StrToDateTimeDef(Form.mskDataregistroFin.Text, 0);
      Opcoes.PeridoDeferimento.DataInicial := StrToDateTimeDef(Form.mskDataDeferimentoIni.Text, 0);
      Opcoes.PeridoDeferimento.DataFinal := StrToDateTimeDef(Form.mskDataDeferimentoFin.Text, 0);
      Opcoes.PeridoEntradaOrgaoAnuente.DataInicial := StrToDateTimeDef(Form.mskDataEntradaOrgaoAnuenteIni.Text, 0);
      Opcoes.PeridoEntradaOrgaoAnuente.DataFinal := StrToDateTimeDef(Form.mskDataEntradaOrgaoAnuenteFin.Text, 0);
      Opcoes.PeridoStatus.DataInicial := StrToDateTimeDef(Form.mskDataStatusIni.Text, 0);
      Opcoes.PeridoStatus.DataFinal := StrToDateTimeDef(Form.mskDataStatusFin.Text, 0);
      Opcoes.Status := '';
      for I := 0 to Form.clbStatus.Count-1 do
      begin
        if Form.clbStatus.Checked[I] then
        begin
          if Opcoes.Status = '' then
            Opcoes.Status := QuotedStr(Form.clbStatus.Items.Strings[I])
          else
            Opcoes.Status := Opcoes.Status + ',' + QuotedStr(Form.clbStatus.Items.Strings[I])
        end;
      end;
      Opcoes.Leiaute := '';
    end;
  finally
    Form.Free;
  end;
end;

{ TOpcoes }

constructor TOpcoesCtx.Create;
begin
  PeridoRegistro := TPeriodo.Create;
  PeridoDeferimento := TPeriodo.Create;
  PeridoEntradaOrgaoAnuente := TPeriodo.Create;
  PeridoStatus := TPeriodo.Create;
end;

destructor TOpcoesCtx.Destroy;
begin
  PeridoRegistro.Free;
  PeridoDeferimento.Free;
  PeridoEntradaOrgaoAnuente.Free;
  PeridoStatus.Free;
  inherited;
end;

procedure TfmConsultaLiCtx.BitBtn1Click(Sender: TObject);
var
  RegistroDataInicial: TDateTime;
  RegistroDataFinal: TDateTime;
  DeferimentoDataInicial: TDateTime;
  DeferimentoDataFinal: TDateTime;
  DataEntradaOrgaoAnuenteInicial: TDateTime;
  DataEntradaOrgaoAnuenteFinal: TDateTime;
  DataStatusInicial: TDateTime;
  DataStatusFinal: TDateTime;
  Filtrado: Boolean;
  I: Integer;
begin
  RegistroDataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
  RegistroDataFinal := StrToDateTimeDef(mskDataregistroFin.Text, 0);
  DeferimentoDataInicial := StrToDateTimeDef(mskDataDeferimentoIni.Text, 0);
  DeferimentoDataFinal := StrToDateTimeDef(mskDataDeferimentoFin.Text, 0);
  DataEntradaOrgaoAnuenteInicial := StrToDateTimeDef(mskDataEntradaOrgaoAnuenteIni.Text, 0);
  DataEntradaOrgaoAnuenteFinal := StrToDateTimeDef(mskDataEntradaOrgaoAnuenteFin.Text, 0);
  DataStatusInicial := StrToDateTimeDef(mskDataStatusIni.Text, 0);
  DataStatusFinal := StrToDateTimeDef(mskDataStatusFin.Text, 0);
  if (RegistroDataInicial > 0) and (RegistroDataFinal > 0) then
    if RegistroDataInicial > RegistroDataFinal then
    begin
      MessageDlg('Data inicial de Registro maior que a data final.', mtWarning, [mbOK], 0);
      Exit;
    end;
  if (DeferimentoDataInicial > 0) and (DeferimentoDataFinal > 0) then
    if DeferimentoDataInicial > DeferimentoDataFinal then
    begin
      MessageDlg('Data inicial de Deferimento maior que a data final.', mtWarning, [mbOK], 0);
      Exit;
    end;
  if (DataEntradaOrgaoAnuenteInicial > 0) and (DataEntradaOrgaoAnuenteFinal > 0) then
    if DataEntradaOrgaoAnuenteInicial > DataEntradaOrgaoAnuenteFinal then
    begin
      MessageDlg('Data inicial de Entrada de Orgão Anuente maior que a data final.', mtWarning, [mbOK], 0);
      Exit;
    end;
  if (DataStatusInicial > 0) and (DataStatusFinal > 0) then
    if DataStatusInicial > DataStatusFinal then
    begin
      MessageDlg('Data inicial de Status maior que a data final.', mtWarning, [mbOK], 0);
      Exit;
    end;
  Filtrado := False;
  if edt_cd_cliente.Text <> '' then
    Filtrado := True;
  if msk_cd_grupo.Text <> '' then
    Filtrado := True;
  if (RegistroDataInicial > 0) and (RegistroDataFinal > 0) then
    Filtrado := True;
  if (DeferimentoDataInicial > 0) and (DeferimentoDataFinal > 0) then
    Filtrado := True;
  if (DataEntradaOrgaoAnuenteInicial > 0) and (DataEntradaOrgaoAnuenteFinal > 0) then
    Filtrado := True;
  if (DataStatusInicial > 0) and (DataStatusFinal > 0) then
    Filtrado := True;
  if msk_nr_processo.Text <> '' then
    Filtrado := True;
  for I := 0 to clbStatus.Count -1 do
    if clbStatus.Checked[I] then
      Filtrado := True;
  if not Filtrado then
  begin
    MessageDlg('Nenehum filtro foi definido.', mtWarning, [mbOK], 0);
    Exit;
  end;
  Close;
  ModalResult := mrOk;
end;

procedure TfmConsultaLiCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TfmConsultaLiCtx.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TfmConsultaLiCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TfmConsultaLiCtx.FormActivate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text := str_cd_produto;
  btn_co_unid_negClick(Sender);
  btn_co_produtoClick(Sender);
end;

procedure TfmConsultaLiCtx.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
end;

procedure TfmConsultaLiCtx.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_produto );
end;

procedure TfmConsultaLiCtx.dbedt_cd_clienteChange(Sender: TObject);
begin
  If Sender is TDbEdit Then
    If TDbEdit(Sender).Name = edt_cd_cliente.Name Then
      btn_co_cliente.OnClick(Sender);
end;

procedure TfmConsultaLiCtx.btn_co_clienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edt_cd_cliente.Text := ConsultaOnLineEx('TEMPRESA_NAC','Cliente',
      ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],
      ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'],'CD_EMPRESA')
  else
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_cliente.Text, 'NM_EMPRESA');
end;

procedure TfmConsultaLiCtx.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO')
  else
    edt_nm_Grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', msk_cd_grupo.Text,'NM_GRUPO');
end;

procedure TfmConsultaLiCtx.msk_cd_grupoChange(Sender: TObject);
begin
  btn_co_grupoClick(nil);
end;

procedure TfmConsultaLiCtx.edt_cd_clienteChange(Sender: TObject);
begin
  btn_co_clienteClick(Sender);
end;

procedure TfmConsultaLiCtx.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  try
    vListAux.Text := 'SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA '+
      'FROM TPROCESSO PR ( NOLOCK ) '+
      '  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE '+
      'WHERE CD_PRODUTO  = ' + QuotedStr(msk_cd_produto.Text) +
      '  AND CD_UNID_NEG = '+ QuotedStr(msk_cd_unid_neg.Text) +
      '  AND PR.IN_CANCELADO = ' + QuotedStr('0');
    if chkProcessos.Checked then
      vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
    msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  finally
    vListAux.Free;
  end;
end;

end.
