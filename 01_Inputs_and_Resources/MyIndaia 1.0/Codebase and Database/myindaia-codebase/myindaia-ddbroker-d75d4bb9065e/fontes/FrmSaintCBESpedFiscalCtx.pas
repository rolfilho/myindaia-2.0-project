unit FrmSaintCBESpedFiscalCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFormCDESpedFiscalCtx = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCDESpedFiscalCtx: TFormCDESpedFiscalCtx;

implementation

uses
  uConsulta, ConsOnLineEx, KrQuery, PGGP001, Funcoes;

{$R *.dfm}

function TFormCDESpedFiscalCtx.GetSQL: string;
begin
  Result := '  SELECT  NF.NR_NF, '+
            '          MASTER.DBO.ROWCONCAT(DISTINCT RTRIM(RC.CD_REFERENCIA)+'' '') AS [Fatura], '+
            '          PR.NR_PROCESSO, '+
            '          NF.DT_NOTA, '+
            '          ISNULL(NF.VL_NOTA, 0) AS VL_NOTA, '+
            '          PR.NR_DDE, '+
            '          PR.DT_REG_DDE, '+
            '          NF.NR_RE, '+
            '          DRE.DT_REALIZACAO AS DataEmissaoRE, '+
            '          PR.NR_CONHECIMENTO, '+
            '          DAV.DT_REALIZACAO AS DataAverbacao, '+
            '          VT.NM_VIA_TRANSPORTE, '+
            '          RTRIM(PD.NM_PAIS) AS NM_PAIS '+
            '  FROM BROKER.DBO.TPROCESSO             PR   (NOLOCK)  '+
            '  LEFT JOIN BROKER.DBO.TPROCESSO_EXP_NF NF   (NOLOCK)ON NF.NR_PROCESSO        = PR.NR_PROCESSO '+
            '  LEFT JOIN BROKER.DBO.TREF_CLIENTE     RC   (NOLOCK)ON RC.NR_PROCESSO        = PR.NR_PROCESSO AND RC.TP_REFERENCIA = ''01'' '+
            '  LEFT JOIN BROKER.DBO.TFOLLOWUP        DRE  (NOLOCK)ON DRE.NR_PROCESSO       = PR.NR_PROCESSO AND DRE.CD_EVENTO = ''402'' '+
            '  LEFT JOIN BROKER.DBO.TFOLLOWUP        DAV  (NOLOCK)ON DAV.NR_PROCESSO       = PR.NR_PROCESSO AND DAV.CD_EVENTO = ''141'' '+
            '  LEFT JOIN BROKER.DBO.TSERVICO         SV   (NOLOCK)ON SV.CD_SERVICO         = PR.CD_SERVICO '+
            '  LEFT JOIN BROKER.DBO.TVIA_TRANSPORTE  VT   (NOLOCK)ON VT.CD_VIA_TRANSPORTE  = SV.CD_VIA_TRANSPORTE '+
            '  LEFT JOIN BROKER.DBO.TPAIS_BROKER     PD   (NOLOCK)ON PD.CD_PAIS            = PR.CD_PAIS_DESTINO '+
            '  LEFT JOIN BROKER.DBO.TGRUPO           GR   (NOLOCK)ON GR.CD_GRUPO           = PR.CD_GRUPO '+
            '  LEFT JOIN BROKER.DBO.TFOLLOWUP        F132 (NOLOCK)ON F132.NR_PROCESSO      = PR.NR_PROCESSO AND F132.CD_EVENTO   = ''132'' '+
            '  WHERE PR.CD_PRODUTO  = ''02'' '+
            '    AND GR.CD_GRUPO    = ''503'' '+
            '    AND F132.DT_REALIZACAO >= '+ DateToSQL(DataInicial)+
            '    AND F132.DT_REALIZACAO  < '+ DateToSQL(DataFinal+1)+
            '  GROUP BY	NF.NR_NF,PR.NR_PROCESSO, NF.DT_NOTA,NF.VL_NOTA, PR.NR_DDE, '+
            '    PR.DT_REG_DDE,NF.NR_RE,DRE.DT_REALIZACAO, PR.NR_CONHECIMENTO, '+
            '    DAV.DT_REALIZACAO,VT.NM_VIA_TRANSPORTE,PD.NM_PAIS ';
end;

procedure TFormCDESpedFiscalCtx.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TFormCDESpedFiscalCtx.BitBtn1Click(Sender: TObject);
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
    Form.TituloRelatorio := 'CDE - Sped Fiscal';
    Form.Titulocoluna.Add('NR_NF=NF');
    Form.Titulocoluna.Add('Fatura=Fatura');
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

procedure TFormCDESpedFiscalCtx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
