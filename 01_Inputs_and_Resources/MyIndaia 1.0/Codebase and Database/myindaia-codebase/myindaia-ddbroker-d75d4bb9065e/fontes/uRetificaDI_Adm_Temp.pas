unit uRetificaDI_Adm_Temp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables;

type
  Tfrm_RetificaDI_Adm_Temp = class(TForm)
    pnl_Transmissao: TPanel;
    btn_sair: TSpeedButton;
    btn_Retificar: TSpeedButton;
    btn_Cancelar: TSpeedButton;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    edt_Processo: TEdit;
    pnlOpcoes: TPanel;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_cliente: TMaskEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    qryDI: TQuery;
    dbgDI: TDBGrid;
    dsDI: TDataSource;
    qryDINR_PROCESSO: TStringField;
    qryDINM_IMPORTADOR: TStringField;
    qryDIQTD_ADICOES: TIntegerField;
    qryDINR_PROCESSO_SIMPLES: TStringField;
    qryDICD_UNID_NEG: TStringField;
    qryPagamentos: TQuery;
    qryPagamentosVL_PIS: TFloatField;
    qryPagamentosVL_COFINS: TFloatField;
    qryPagamentosVL_IPI: TFloatField;
    qryPagamentosVL_II: TFloatField;
    tblPagamentos_Scx: TTable;
    tblPagamentos_ScxNR_DECL_IMP_MICRO: TStringField;
    tblPagamentos_ScxNR_SEQ_PGTO_TRIB: TSmallintField;
    tblPagamentos_ScxCD_RECEITA_PGTO: TStringField;
    tblPagamentos_ScxCD_BANCO_PGTO_TRIB: TStringField;
    tblPagamentos_ScxNR_AGENC_PGTO_TRIB: TStringField;
    tblPagamentos_ScxVL_TRIBUTO_PAGO: TFloatField;
    tblPagamentos_ScxDT_PGTO_TRIBUTO: TStringField;
    tblPagamentos_ScxVL_MULTA_PGTO_TRIB: TFloatField;
    tblPagamentos_ScxVL_JUROS_PGTO_TRIB: TFloatField;
    qryDINR_DECLARACAO_IMP: TStringField;
    qryDI_Scx: TQuery;
    qryDI_ScxNR_DECL_IMP_MICRO: TStringField;
    qryBanco: TQuery;
    qryDIIN_RETIFICADA: TBooleanField;
    qryBancoNR_CONTA_PGTO_TRIB: TStringField;
    qryBancoCD_BANCO: TStringField;
    qryMaxSequencia_Scx: TQuery;
    qryMaxSequencia_ScxMAX_SEQ: TIntegerField;
    db_import: TDatabase;
    updDI: TUpdateSQL;
    qryDI_ScxTX_INFO_COMPL: TMemoField;
    updDI_Scx: TUpdateSQL;
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure edt_ProcessoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_RetificarClick(Sender: TObject);
    procedure dbgDIDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    procedure PreparaTela(AUnidade, AGrupo, ACliente, AProcesso: String);
  public
    function ShowModal(AUnidade: String = ''; AGrupo: String = ''; ACliente: String = ''; AProcesso: String = ''): Integer;
    procedure Show(AUnidade: String = ''; AGrupo: String = ''; ACliente: String = ''; AProcesso: String = ''); 
  end;

var
  frm_RetificaDI_Adm_Temp: Tfrm_RetificaDI_Adm_Temp;

implementation

uses ConsOnlineEx, Funcoes;

{$R *.dfm}

procedure Tfrm_RetificaDI_Adm_Temp.msk_cd_unid_negChange(Sender: TObject);
begin
  if Length(msk_cd_unid_neg.Text) < msk_cd_unid_neg.MaxLength then
    edt_nm_unid_neg.Text := ''
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'NM_UNID_NEG');
end;

procedure Tfrm_RetificaDI_Adm_Temp.msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure Tfrm_RetificaDI_Adm_Temp.msk_cd_grupoChange(Sender: TObject);
begin
  if Length(msk_cd_grupo.Text) < msk_cd_grupo.MaxLength then
    edt_nm_grupo.Text := ''
  else
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', msk_cd_grupo.Text, 'NM_GRUPO');
end;

procedure Tfrm_RetificaDI_Adm_Temp.msk_cd_clienteChange(Sender: TObject);
begin
  if Length(msk_cd_cliente.Text) < msk_cd_cliente.MaxLength then
    edt_nm_cliente.Text := ''
  else
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', msk_cd_cliente.Text, 'NM_EMPRESA');
end;

procedure Tfrm_RetificaDI_Adm_Temp.msk_cd_unid_negExit(Sender: TObject);
begin
  if (msk_cd_unid_neg.Text <> '') and (edt_nm_unid_neg.Text = '') then
  begin
    MessageDlg('Código inválido.'#13'Verifique o código digitado ou deixe em branco para não filtrar por este campo.',
       mtError, [mbOk], 0);
    msk_cd_unid_neg.SetFocus;
  end;
end;

procedure Tfrm_RetificaDI_Adm_Temp.msk_cd_grupoExit(Sender: TObject);
begin
  if (msk_cd_grupo.Text <> '') and (edt_nm_grupo.Text = '') then
  begin
    MessageDlg('Código inválido.'#13'Verifique o código digitado ou deixe em branco para não filtrar por este campo.',
       mtError, [mbOk], 0);
    msk_cd_grupo.SetFocus;
  end;
end;

procedure Tfrm_RetificaDI_Adm_Temp.msk_cd_clienteExit(Sender: TObject);
begin
  if (msk_cd_cliente.Text <> '') and (edt_nm_cliente.Text = '') then
  begin
    MessageDlg('Código inválido.'#13'Verifique o código digitado ou deixe em branco para não filtrar por este campo.',
       mtError, [mbOk], 0);
    msk_cd_cliente.SetFocus;
  end;
end;

procedure Tfrm_RetificaDI_Adm_Temp.edt_ProcessoChange(Sender: TObject);
begin
  if edt_Processo.Text = '' then
    qryDI.First
  else
    qryDI.Locate('NR_PROCESSO_SIMPLES', edt_Processo.Text, []);
end;

function Tfrm_RetificaDI_Adm_Temp.ShowModal(AUnidade, AGrupo, ACliente, AProcesso: String): Integer;
begin
  PreparaTela(AUnidade, AGrupo, ACliente, AProcesso);
  Result := inherited ShowModal;
end;

procedure Tfrm_RetificaDI_Adm_Temp.Show(AUnidade, AGrupo, ACliente, AProcesso: String);
begin
  PreparaTela(AUnidade, AGrupo, ACliente, AProcesso);
  inherited Show;
end;

procedure Tfrm_RetificaDI_Adm_Temp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryDI.Close;
  qryPagamentos.Close;
  Action := caFree;
end;

procedure Tfrm_RetificaDI_Adm_Temp.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_RetificaDI_Adm_Temp.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure Tfrm_RetificaDI_Adm_Temp.btn_RetificarClick(Sender: TObject);
var
  NrSequencia: Byte;
begin
  {0086- I.I
   1038- I.P.I
   5602- PIS
   5629- COFINS}
  if qryDIIN_RETIFICADA.AsBoolean then
    MessageDlg('Esta DI já foi retificada.'#13'Caso necessite efetuar uma nova retificação solicite ao TI a liberação.',
       mtInformation, [mbOk], 0)
  else
  begin
    try
      qryDI_Scx.Close;
      qryDI_Scx.ParamByName('NR_DECLARACAO_IMP').AsString := qryDINR_DECLARACAO_IMP.AsString;
      qryDI_Scx.Open;
      if qryDI_Scx.Eof then
        MessageDlg('Declaração não encontrada na Base de Dados local do SISCOMEX.'#13 +
           'O processo não foi transmitido deste computador ou foi eliminado.', mtError, [mbOk], 0)
      else
      begin
        qryPagamentos.Close;
        qryPagamentos.ParamByName('NR_PROCESSO').AsString := qryDINR_PROCESSO.AsString;
        qryPagamentos.Open;

        qryBanco.Close;
        qryBanco.ParamByName('NR_PROCESSO').AsString := qryDINR_PROCESSO.AsString;
        qryBanco.Open;

        qryMaxSequencia_Scx.Close;
        qryMaxSequencia_Scx.ParamByName('NR_DECL_IMP_MICRO').AsString := qryDI_ScxNR_DECL_IMP_MICRO.AsString;
        qryMaxSequencia_Scx.Open;

        tblPagamentos_Scx.Open;

        NrSequencia := qryMaxSequencia_ScxMAX_SEQ.AsInteger + 1;
        db_import.StartTransaction;
        // II
        if qryPagamentosVL_II.AsFloat >= 0 then
        begin
          tblPagamentos_Scx.Append;
          tblPagamentos_ScxNR_DECL_IMP_MICRO.AsString  := qryDI_ScxNR_DECL_IMP_MICRO.AsString;
          tblPagamentos_ScxNR_SEQ_PGTO_TRIB.AsInteger  := NrSequencia;
          tblPagamentos_ScxCD_RECEITA_PGTO.AsString    := '0086';
          tblPagamentos_ScxCD_BANCO_PGTO_TRIB.AsString := qryBancoCD_BANCO.AsString;
          tblPagamentos_ScxNR_AGENC_PGTO_TRIB.AsString := qryBancoNR_CONTA_PGTO_TRIB.AsString;
          tblPagamentos_ScxVL_TRIBUTO_PAGO.AsFloat     := qryPagamentosVL_II.AsFloat;
          tblPagamentos_ScxVL_MULTA_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_ScxVL_JUROS_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_Scx.Post;
          Inc(NrSequencia);
        end;

        // IPI
        if qryPagamentosVL_IPI.AsFloat >= 0 then
        begin
          tblPagamentos_Scx.Append;
          tblPagamentos_ScxNR_DECL_IMP_MICRO.AsString  := qryDI_ScxNR_DECL_IMP_MICRO.AsString;
          tblPagamentos_ScxNR_SEQ_PGTO_TRIB.AsInteger  := NrSequencia;
          tblPagamentos_ScxCD_RECEITA_PGTO.AsString    := '1038';
          tblPagamentos_ScxCD_BANCO_PGTO_TRIB.AsString := qryBancoCD_BANCO.AsString;
          tblPagamentos_ScxNR_AGENC_PGTO_TRIB.AsString := qryBancoNR_CONTA_PGTO_TRIB.AsString;
          tblPagamentos_ScxVL_TRIBUTO_PAGO.AsFloat     := qryPagamentosVL_IPI.AsFloat;
          tblPagamentos_ScxVL_MULTA_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_ScxVL_JUROS_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_Scx.Post;
          Inc(NrSequencia);
        end;

        // PIS
        if qryPagamentosVL_PIS.AsFloat >= 0 then
        begin
          tblPagamentos_Scx.Append;
          tblPagamentos_ScxNR_DECL_IMP_MICRO.AsString  := qryDI_ScxNR_DECL_IMP_MICRO.AsString;
          tblPagamentos_ScxNR_SEQ_PGTO_TRIB.AsInteger  := NrSequencia;
          tblPagamentos_ScxCD_RECEITA_PGTO.AsString    := '5602';
          tblPagamentos_ScxCD_BANCO_PGTO_TRIB.AsString := qryBancoCD_BANCO.AsString;
          tblPagamentos_ScxNR_AGENC_PGTO_TRIB.AsString := qryBancoNR_CONTA_PGTO_TRIB.AsString;
          tblPagamentos_ScxVL_TRIBUTO_PAGO.AsFloat     := qryPagamentosVL_PIS.AsFloat;
          tblPagamentos_ScxVL_MULTA_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_ScxVL_JUROS_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_Scx.Post;
          Inc(NrSequencia);
        end;

        // COFINS
        if qryPagamentosVL_COFINS.AsFloat >= 0 then
        begin
          tblPagamentos_Scx.Append;
          tblPagamentos_ScxNR_DECL_IMP_MICRO.AsString  := qryDI_ScxNR_DECL_IMP_MICRO.AsString;
          tblPagamentos_ScxNR_SEQ_PGTO_TRIB.AsInteger  := NrSequencia;
          tblPagamentos_ScxCD_RECEITA_PGTO.AsString    := '5629';
          tblPagamentos_ScxCD_BANCO_PGTO_TRIB.AsString := qryBancoCD_BANCO.AsString;
          tblPagamentos_ScxNR_AGENC_PGTO_TRIB.AsString := qryBancoNR_CONTA_PGTO_TRIB.AsString;
          tblPagamentos_ScxVL_TRIBUTO_PAGO.AsFloat     := qryPagamentosVL_COFINS.AsFloat;
          tblPagamentos_ScxVL_MULTA_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_ScxVL_JUROS_PGTO_TRIB.AsFloat  := 0;
          tblPagamentos_Scx.Post;
          Inc(NrSequencia);
        end;
        if Pos('DI RETIFICADA PARA INCLUSAO DOS RECOLHIMENTOS DE TRIBUTOS PROPORCIONAIS', UpperCase(qryDI_ScxTX_INFO_COMPL.Value)) = 0 then
        begin
          qryDI_Scx.Edit;
          qryDI_ScxTX_INFO_COMPL.Value := qryDI_ScxTX_INFO_COMPL.Value + #13#10 + 'DI RETIFICADA PARA INCLUSAO DOS RECOLHIMENTOS DE TRIBUTOS PROPORCIONAIS';
          qryDI_Scx.Post;
        end;
        db_import.Commit;
        qryDI.Edit;
        qryDIIN_RETIFICADA.AsBoolean := True;
        qryDI.Post;
        qryDI.ApplyUpdates;
      end; // Declaração encontrada no SISCOMEX
    except
      on E: Exception do
      begin
        MessageDlg('Erro executando a operação.'#13'Mensagem: ' + E.Message, mtError, [mbOk], 0);
        if db_import.InTransaction then
          db_import.Rollback;
      end;
    end;
  end; // DI já retificada}
end;

procedure Tfrm_RetificaDI_Adm_Temp.dbgDIDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if qryDIIN_RETIFICADA.AsBoolean then
    dbgDI.Canvas.Brush.Color := clMoneyGreen
  else
    dbgDI.Canvas.Brush.Color := clWhite;
  dbgDI.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_RetificaDI_Adm_Temp.PreparaTela(AUnidade, AGrupo, ACliente, AProcesso: String);
begin
  if AUnidade <> '' then
  begin
    msk_cd_unid_neg.Text := AUnidade;
    msk_cd_unid_neg.Enabled := False;
  end;
  if AGrupo <> '' then
  begin
    msk_cd_grupo.Text := AUnidade;
    msk_cd_grupo.Enabled := False;
  end;
  if ACliente <> '' then
  begin
    msk_cd_cliente.Text := AUnidade;
    msk_cd_cliente.Enabled := False;
  end;
  if AProcesso <> '' then
  begin
    pnl_pesquisa.Visible := False;
    btn_sair.Left        := pnl_Transmissao.Width - btn_sair.Width - 10;
    pnlOpcoes.Visible    := False;
  end;

  qryDI.ParamByName('CD_UNID_NEG').AsString := AUnidade;
  qryDI.ParamByName('CD_GRUPO').AsString    := AGrupo;
  qryDI.ParamByName('CD_CLIENTE').AsString  := ACliente;
  qryDI.ParamByName('NR_PROCESSO').AsString := AProcesso;
  qryDI.Open;
end;

procedure Tfrm_RetificaDI_Adm_Temp.FormCreate(Sender: TObject);
begin
  if not db_import.Connected then
    db_import.Open;
end;

end.
