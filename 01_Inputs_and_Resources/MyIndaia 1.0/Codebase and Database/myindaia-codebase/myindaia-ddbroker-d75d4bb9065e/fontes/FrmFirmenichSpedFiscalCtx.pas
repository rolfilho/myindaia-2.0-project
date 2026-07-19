unit FrmFirmenichSpedFiscalCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFormFirmenichSpedFiscalCtx = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
  public
    { Public declarations }
  end;

var
  FormFirmenichSpedFiscalCtx: TFormFirmenichSpedFiscalCtx;

implementation

uses
  uConsulta, ConsOnLineEx, KrQuery, PGGP001, Funcoes;

{$R *.dfm}

procedure TFormFirmenichSpedFiscalCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TFormFirmenichSpedFiscalCtx.GetSQL: string;
begin
  Result :=
          '   SELECT NF.NR_NF,                                                                                      ' + sLineBreak +
          '          Cast(STUFF((SELECT DISTINCT '' '' + LTRIM(RTRIM(RC.CD_REFERENCIA))                             ' + sLineBreak +
          '                        FROM TREF_CLIENTE RC WITH (NOLOCK)                                               ' + sLineBreak +
          '                       WHERE RC.NR_PROCESSO   = PR.NR_PROCESSO                                           ' + sLineBreak +
          '                         AND RC.TP_REFERENCIA = ''01''                                                   ' + sLineBreak +
          '               FOR XML PATH('''')), 1, 1, '''') as Varchar(max)) AS SHIPMENT,                            ' + sLineBreak +
          '          PR.NR_PROCESSO,                                                                                ' + sLineBreak +
          '          NF.DT_NOTA,                                                                                    ' + sLineBreak +
          '          NF.VL_NOTA,                                                                                    ' + sLineBreak +
          '          PR.NR_DDE,                                                                                     ' + sLineBreak +
          '          PR.DT_REG_DDE,                                                                                 ' + sLineBreak +
          '          NF.NR_RE,                                                                                      ' + sLineBreak +
          '          DRE.DT_REALIZACAO AS DATAEMISSAORE,                                                            ' + sLineBreak +
          '          PR.NR_CONHECIMENTO,                                                                            ' + sLineBreak +
          '          DAV.DT_REALIZACAO AS DATAAVERBACAO,                                                            ' + sLineBreak +
          '          VT.NM_VIA_TRANSPORTE,                                                                          ' + sLineBreak +
          '          RTRIM(PD.NM_PAIS) AS NM_PAIS,                                                                  ' + sLineBreak +
          '          PR.CD_RUC,                                                                                     ' + sLineBreak +
          '          PR.CD_DUE                                                                                      ' + sLineBreak +
          '   FROM  BROKER.DBO.TPROCESSO             PR   (NOLOCK)                                                  ' + sLineBreak +
          '    JOIN BROKER.DBO.TGRUPO                GR   (NOLOCK) ON GR.CD_GRUPO          = PR.CD_GRUPO            ' + sLineBreak +
          '    JOIN BROKER.DBO.VW_SERVICO_GERAL       SV            ON SV.CD_SERVICO        = PR.CD_SERVICO          ' + sLineBreak +
          '    JOIN BROKER.DBO.TVIA_TRANSPORTE       VT   (NOLOCK) ON VT.CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE   ' + sLineBreak +
          '    JOIN BROKER.DBO.TFOLLOWUP             F132 (NOLOCK) ON F132.NR_PROCESSO     = PR.NR_PROCESSO         ' + sLineBreak +
          '                                                       AND F132.CD_EVENTO       = ''132''                ' + sLineBreak +
          '   LEFT JOIN BROKER.DBO.TPROCESSO_EXP_NF  NF   (NOLOCK) ON NF.NR_PROCESSO       = PR.NR_PROCESSO         ' + sLineBreak +
          '   LEFT JOIN BROKER.DBO.TPAIS_BROKER      PD   (NOLOCK) ON PD.CD_PAIS           = PR.CD_PAIS_DESTINO     ' + sLineBreak +
          '   LEFT JOIN BROKER.DBO.TFOLLOWUP         DRE  (NOLOCK) ON DRE.NR_PROCESSO      = PR.NR_PROCESSO         ' + sLineBreak +
          '                                                       AND DRE.CD_EVENTO        = ''402''                ' + sLineBreak + 
          '                                                       AND PR.CD_SERVICO        = DRE.CD_SERVICO         ' + sLineBreak +
          '   LEFT JOIN BROKER.DBO.TFOLLOWUP         DAV  (NOLOCK) ON DAV.NR_PROCESSO      = PR.NR_PROCESSO         ' + sLineBreak + 
          '                                                       AND DAV.CD_EVENTO        = ''141''                ' + sLineBreak +
          '                                                       AND PR.CD_SERVICO        = DAV.CD_SERVICO         ' + sLineBreak + 
          '   WHERE PR.CD_PRODUTO = ''02''                                                                          ' + sLineBreak +
          '     AND GR.CD_GRUPO   = ''118''                                                                         ' + sLineBreak +
          '	    AND F132.DT_REALIZACAO >= '+ DateToSQL(DataInicial)+
          '	    AND F132.DT_REALIZACAO <  '+ DateToSQL(DataFinal+1);
end;

procedure TFormFirmenichSpedFiscalCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
begin
  DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
  DataFinal := StrToDateTimeDef(mskDataregistroFin.Text, 0);
  if (DataInicial > 0) and (DataFinal > 0) then
  begin
    if DataInicial > DataFinal then
    begin
      MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
      Exit;
    end;
  end
  else
  begin
    ShowMessage('Período obrigatório!');
    Exit;
  end;
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Firmenich - Sped Fiscal';
    Form.Titulocoluna.Add('NR_NF=NF');
    Form.Titulocoluna.Add('Shipment=Shipment');
    Form.Titulocoluna.Add('NR_PROCESSO=Processo');
    Form.Titulocoluna.Add('DT_NOTA=Data NF');
    Form.Titulocoluna.Add('VL_NOTA=Valor NF');
    Form.Titulocoluna.Add('NR_DDE=DDE');
    Form.Titulocoluna.Add('DT_REG_DDE=Data DDE');
    Form.Titulocoluna.Add('NR_RE=RE');
    Form.Titulocoluna.Add('DataEmissaoRE=Data Emissão RE');
    Form.Titulocoluna.Add('NR_CONHECIMENTO=NR Conhecimento');
    Form.Titulocoluna.Add('DataAverbacao=Data Averbação');
    Form.Titulocoluna.Add('NM_VIA_TRANSPORTE=Via de Transporte');
    Form.Titulocoluna.Add('NM_PAIS=Pais de Destino');
    Form.Titulocoluna.Add('CD_RUC=RUC');
    Form.Titulocoluna.Add('CD_DUE=DUE');

    Form.FormatacaoEspecial.Add('DT_NOTA=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DT_REG_DDE=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DataEmissaoRE=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DT_CONHECIMENTO=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DataAverbacao=dd/mm/yyyy');

    Form.qryMain.SQL.Text := GetSQL;

    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormFirmenichSpedFiscalCtx.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
