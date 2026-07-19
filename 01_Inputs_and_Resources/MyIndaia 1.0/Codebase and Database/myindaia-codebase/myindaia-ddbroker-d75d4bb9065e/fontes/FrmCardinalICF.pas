unit FrmCardinalICF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormCardinalICF = class(TForm)
    Panel3: TPanel;
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
    chk_ult_processos: TCheckBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dsMain: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    qryMain: TQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function ConsultaProcesso(UltimosProcessos: Boolean): string;
    procedure AdicionaProcessoNaFila(const NR_Processo: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCardinalICF: TFormCardinalICF;

implementation

uses PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

function TFormCardinalICF.ConsultaProcesso(UltimosProcessos: Boolean): string;
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  try
    vListAux.Add('SELECT SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, DT_ABERTURA, ' );
    vListAux.Add('  CD_CLIENTE,    (SELECT AP_EMPRESA    FROM TEMPRESA_NAC ( NOLOCK ) WHERE CD_EMPRESA    = PR.CD_CLIENTE)    AS NM_CLIENTE,    ' );
    vListAux.Add('  CD_SERVICO,    (SELECT NM_SERVICO    FROM TSERVICO     ( NOLOCK ) WHERE CD_SERVICO    = PR.CD_SERVICO)    AS NM_SERVICO,    ' );
    vListAux.Add('  CD_EMBARCACAO, (SELECT NM_EMBARCACAO FROM TEMBARCACAO  ( NOLOCK ) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, ' );
    vListAux.Add('  NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER, NR_DI, NR_MANIFESTO    ' );
    vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ' );
    vListAux.Add('WHERE CD_UNID_NEG  = ' + QuotedStr(msk_cd_unid_neg.Text) );
    vListAux.Add('  AND CD_PRODUTO   = ' + QuotedStr(msk_cd_produto.Text)  );
    vListAux.Add('  AND IN_CANCELADO = ''0'' ');
    vListAux.Add('  AND PR.CD_GRUPO = ''B90'' ');
    if UltimosProcessos then
      vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));

    Result := ConsultaOnLineExSQLList(vListAux,'Processos',
        ['NR_PROCESSO' ,'DT_ABERTURA'     ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_SERVICO'  ,'NM_SERVICO','CD_EMBARCACAO'  ,'NM_EMBARCACAO','NR_CONHECIMENTO' ,'NR_CONHECIMENTO_MASTER' ,'NR_DI','NR_MANIFESTO' ],
        ['Nr. Processo','Data de Abertura','Cód. Cliente','Cliente'   ,'Cód. Serviço','Serviço'   ,'Cod. Embarcação','Embarcação'   ,'Nr. Conhecimento','Nr. Conhecimento Master','DI'   ,'Nr. Manifesto'],
         'NR_PROCESSO',nil);
  finally
    vListAux.Free;
  end;
end;

procedure TFormCardinalICF.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCardinalICF.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
    msk_cd_unid_negExit(nil);
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TFormCardinalICF.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormCardinalICF.btn_nr_processoClick(Sender: TObject);
begin
  msk_nr_processo.Text := ConsultaProcesso(chk_ult_processos.Checked);
  msk_nr_processoExit(nil);
end;

procedure TFormCardinalICF.msk_cd_unid_negExit(Sender: TObject);
begin
  btn_co_unid_negClick(Sender);
end;

procedure TFormCardinalICF.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(Sender);
end;

procedure TFormCardinalICF.AdicionaProcessoNaFila(const NR_Processo: string);
begin
  qryMain.Close;
  QueryExec('INSERT INTO INTGRACAO_CARDINAL_ICF (NR_PROCESSO) VALUES ('+QuotedStr(NR_Processo)+')' );
  qryMain.Open;
end;

procedure TFormCardinalICF.msk_nr_processoExit(Sender: TObject);
var
  Processo: string;
begin
  if Length(msk_nr_processo.Text) >= 12 then
  begin
    Processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
    AdicionaProcessoNaFila(Processo);
    msk_nr_processo.Clear;
    msk_nr_processo.SetFocus;
    ShowMessage('Processo "' + Processo +'" incluído na fila.');
  end;
end;

procedure TFormCardinalICF.FormCreate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  btn_co_unid_negClick(Sender);
  btn_co_produtoClick(Sender);
end;

end.
