unit PGNM007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, ComCtrls, Grids, DBGrids, Db, DBTables, PGGP001;

Type
  TSolicNum = record
              nr_solic : string[3];
              nr_Lanc  : string[3];
              vl_lanc  : Double   
  end;
  
type
  Tfrm_receb_num_registro = class(TForm)
    btn_gravar: TButton;
    Bevel1: TBevel;
    dbedt_nr_recebimento: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedt_vl_recebimento: TDBEdit;
    dbcbox_cd_banco: TDBLookupComboBox;
    dbcbox_nm_banco: TDBLookupComboBox;
    btn_cancelar: TButton;
    dsq_itens_solinum: TDataSource;
    qry_itens_solinum_: TQuery;
    qry_itens_solinum_NR_PROCESSO: TStringField;
    qry_itens_solinum_NR_SOLICITACAO: TStringField;
    qry_itens_solinum_NR_LANCAMENTO: TStringField;
    qry_itens_solinum_CD_ITEM: TStringField;
    qry_itens_solinum_NR_PRIORIDADE: TIntegerField;
    qry_itens_solinum_CD_TIPO_CALCULO: TStringField;
    qry_itens_solinum_TP_SOLIC_INFORM: TStringField;
    qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_solinum_VL_SOLICITADO: TFloatField;
    qry_itens_solinum_CD_STATUS: TStringField;
    qry_itens_solinum_VL_RECEBIDO: TFloatField;
    qry_itens_solinum_VL_UTILIZADO: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_vl_recebimentoChange(Sender: TObject);
    function Combinacao : Boolean;
    Function Prioridade : Boolean;
  private                                  
    { Private declarations }
  public
    { Public declarations }
    lCombinacao : boolean;
    lPrioridade : boolean;
    lProcManual : boolean;
    cState : String[1];
    j : integer;
    c : integer;
    k : integer;
    nTotal : Double;
    aPonteiro : array[0..99] of integer;
    aCombinacao : array[1..99] of String;       
    nCombinacao : integer;       
    aTrabalho  : array[1..99] of integer;       
    nTrabalho  : integer;       
    nElementos : integer;
    procedure ProcCombinacao;                     
    procedure InitCombinacao;
  end;

var
  frm_receb_num_registro: Tfrm_receb_num_registro;
  aSolicNum : array[1..99] of TSolicNum;

implementation

Uses GSMLIB, PGNM018, PGNM008, PGNM005;

{$R *.DFM}

procedure Tfrm_receb_num_registro.InitCombinacao;
var
  i : integer;
begin
  { Inicializa variaveis de Controle }
  j            := 1;
  c            := 0;
  nTotal       := 0;
  nCombinacao  := 0;       
  nTrabalho    := 0;       
  aPonteiro[0] := 0;
  { Apaga o vetor de combinacoes }
  For i := 1 to 99 do
  begin
    aPonteiro[i] := 0;
    aTrabalho[i] := 0;
    aCombinacao[i] := '';
  end; 
end;                        

procedure Tfrm_receb_num_registro.ProcCombinacao;
Var
  i : integer;
begin
  aPonteiro[ j ] := aPonteiro[ j - 1 ];
  While True do
  begin
    aPonteiro[ j ] := aPonteiro[ j ] + 1;
    if aPonteiro[ j ] > nElementos Then
    begin
      Exit;  {Fim}
    end; 
    nTotal := 0;
    k := 1 ;
    While k <= j do
    begin
      nTotal := nTotal + aSolicNum[ aPonteiro[ k ] ].vl_lanc;
      k := k + 1;
    end;  
    if nTotal = dbedt_vl_recebimento.Field.AsFloat Then
    begin
      nCombinacao := nCombinacao + 1;
      For i := 1 to j do aCombinacao[nCombinacao] := aCombinacao[nCombinacao] + StrZero( aPonteiro[i], 2 ) + ',';  
      If nCombinacao = 10 Then
         Exit
      else
         Continue;
    end;
    if ( nTotal > dbedt_vl_recebimento.Field.AsFloat) Then 
    begin
      Continue;
    end;     
    if ( aPonteiro[j] = nElementos ) Then 
    begin
      Exit;  
    end;     
    nTrabalho := nTrabalho + 1;   
    aTrabalho[ nTrabalho ] := j;
    j := j + 1;
    ProcCombinacao;
    j := aTrabalho[ nTrabalho ];
    aTrabalho[ nTrabalho ] := 0;
    nTrabalho := nTrabalho - 1;
    Continue;
  end;     
end;
          
Function Tfrm_receb_num_registro.Combinacao : Boolean;
var
  i : integer;
  r : integer;
  n : integer;
  nRows : integer;
  nVl_Saldo : Double;
begin
  Result := False; { default }
  { Variável auxiliar para controle dos indices  }
  nRows := qry_itens_solinum_.RecordCount;
  i := 1;
  While ( i <= nRows ) do
  begin
    nVl_Saldo := qry_itens_solinum_VL_SOLICITADO.AsFloat - qry_itens_solinum_VL_RECEBIDO.AsFloat;
    If ( nVl_Saldo <= dbedt_vl_recebimento.Field.AsFloat ) and ( nVl_Saldo > 0 ) Then 
      begin
        nElementos := nElementos + 1;
        aSolicNum[ nElementos ].nr_solic := qry_itens_solinum_NR_SOLICITACAO.AsString; 
        aSolicNum[ nElementos ].nr_lanc  := qry_itens_solinum_NR_LANCAMENTO.AsString; 
        aSolicNum[ nElementos ].vl_lanc  := nVl_Saldo;
      end;
    i := i + 1;
    If ( i <= nRows ) Then qry_itens_solinum_.Next;
  end;
  InitCombinacao;
  ProcCombinacao;
  If nCombinacao > 0 Then { Encontrou uma combinacao caso > Zero }
  begin
    datm_receb_num_solic.qry_itens_receb_.Close;
    datm_receb_num_solic.qry_itens_receb_.ParamByName('NR_PROCESSO').AsString := qry_itens_solinum_NR_PROCESSO.AsString;
    datm_receb_num_solic.qry_itens_receb_.ParamByName('NR_RECEBIMENTO').AsString := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
    datm_receb_num_solic.qry_itens_receb_.Open;
    qry_itens_solinum_.First;
    c := 1;
    r := 0;
    aCombinacao[c] := aCombinacao[c] + '00,';
    If not ( datm_receb_num_solic.tbl_recebimento_.State in [dsInsert, dsEdit] ) Then
       datm_receb_num_solic.tbl_recebimento_.Edit;
    For i := 1 to nRows do
    begin
      datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger := datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger + 1;
      datm_receb_num_solic.qry_itens_receb_.Append;
      datm_receb_num_solic.qry_itens_receb_NR_PROCESSO.AsString     := qry_itens_solinum_NR_PROCESSO.AsString;
      datm_receb_num_solic.qry_itens_receb_NR_RECEBIMENTO.AsString  := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
      datm_receb_num_solic.qry_itens_receb_NR_LANC_RECEB.AsString   := StrZero( datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsFloat, 3 );
      datm_receb_num_solic.qry_itens_receb_NR_SOLICITACAO.AsString  := qry_itens_solinum_NR_SOLICITACAO.AsString;
      datm_receb_num_solic.qry_itens_receb_NR_LANCAMENTO.AsString   := qry_itens_solinum_NR_LANCAMENTO.AsString;
      datm_receb_num_solic.qry_itens_receb_CD_ITEM.AsString         := qry_itens_solinum_CD_ITEM.AsString;
      datm_receb_num_solic.qry_itens_receb_IN_CANCELADO.AsBoolean   := False;
      nVl_Saldo := qry_itens_solinum_VL_SOLICITADO.AsFloat - qry_itens_solinum_VL_RECEBIDO.AsFloat;
      datm_receb_num_solic.qry_itens_receb_VL_SOLICITADO.AsFloat    := nVl_Saldo;
      n := StrToInt( Copy(aCombinacao[c], ((r*3)+1) ,2 ) );
      if ( n > 0 ) and
         ( qry_itens_solinum_NR_SOLICITACAO.AsString = aSolicNum[n].nr_solic ) and
         ( qry_itens_solinum_NR_LANCAMENTO.AsString  = aSolicNum[n].nr_lanc  ) Then
        begin
          datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat := nVl_Saldo;
          r := r + 1;
        end
      else
        datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat := 0;
      datm_receb_num_solic.qry_itens_receb_.post;
      If ( i <= nRows ) Then qry_itens_solinum_.Next;
    end;
    datm_receb_num_solic.tbl_recebimento_.Post;
    { Equivale ao refresh }
    datm_receb_num_solic.qry_itens_receb_.Close;
    datm_receb_num_solic.qry_itens_receb_.Open;
    Result := True;
    Exit
  end;
end;

Function Tfrm_receb_num_registro.Prioridade : Boolean;
Var
  i : integer;
  nRows : integer;
  nValor : Double;
  nSaldo_recebimento : Double;
  nr_solicitacao : string[3];
begin
  try
    datm_receb_num_solic.qry_itens_por_prioridade_.close;
    datm_receb_num_solic.qry_itens_por_prioridade_.ParamByName( 'NR_PROCESSO' ).AsString := str_nr_processo;
    datm_receb_num_solic.qry_itens_por_prioridade_.Open;
  except
    { .. disponivel para tratamentos }
  end;
  nRows := datm_receb_num_solic.qry_itens_por_prioridade_.RecordCount;
  If (nRows > 0) then
  begin
    nSaldo_recebimento := dbedt_vl_recebimento.Field.AsFloat;
    datm_receb_num_solic.qry_itens_receb_.Close;
    datm_receb_num_solic.qry_itens_receb_.ParamByName('NR_PROCESSO').AsString := qry_itens_solinum_NR_PROCESSO.AsString;
    datm_receb_num_solic.qry_itens_receb_.ParamByName('NR_RECEBIMENTO').AsString := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
    datm_receb_num_solic.qry_itens_receb_.Open;
    qry_itens_solinum_.First;
    i := 1;
    If not ( datm_receb_num_solic.tbl_recebimento_.State in [dsInsert, dsEdit] ) Then
       datm_receb_num_solic.tbl_recebimento_.Edit;
    While ( i <= nRows ) do
    begin
      nValor := datm_receb_num_solic.qry_itens_por_prioridade_VL_SOLICITADO.AsFloat -
                datm_receb_num_solic.qry_itens_por_prioridade_VL_RECEBIDO.AsFloat;
      If ( nValor > 0 ) Then
        begin
          datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger := datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger + 1;
          datm_receb_num_solic.qry_itens_receb_.Append;
          datm_receb_num_solic.qry_itens_receb_NR_PROCESSO.AsString     := datm_receb_num_solic.qry_itens_por_prioridade_NR_PROCESSO.AsString;
          datm_receb_num_solic.qry_itens_receb_NR_RECEBIMENTO.AsString  := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
          datm_receb_num_solic.qry_itens_receb_NR_LANC_RECEB.AsString   := StrZero( datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsFloat, 3 );
          datm_receb_num_solic.qry_itens_receb_NR_SOLICITACAO.AsString  := datm_receb_num_solic.qry_itens_por_prioridade_NR_SOLICITACAO.AsString;
          datm_receb_num_solic.qry_itens_receb_NR_LANCAMENTO.AsString   := datm_receb_num_solic.qry_itens_por_prioridade_NR_LANCAMENTO.AsString;
          datm_receb_num_solic.qry_itens_receb_CD_ITEM.AsString         := datm_receb_num_solic.qry_itens_por_prioridade_CD_ITEM.AsString;
          datm_receb_num_solic.qry_itens_receb_VL_SOLICITADO.AsFloat    := nValor;
          datm_receb_num_solic.qry_itens_receb_IN_CANCELADO.AsBoolean   := False;          
          If nSaldo_Recebimento > 0 Then
            begin
              If ( nValor <= nSaldo_Recebimento ) Then
                begin
                  datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat := nValor;
                  nSaldo_Recebimento := nSaldo_Recebimento - nValor;
                end
              else
                begin
                  datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat := nSaldo_Recebimento;
                  nSaldo_Recebimento := 0;
                end;
            end
          else
            begin
              datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat := 0;
            end;
        end;
      i := i + 1;
      nr_solicitacao := datm_receb_num_solic.qry_itens_por_prioridade_NR_SOLICITACAO.AsString;
      If ( i <= nRows ) Then
        datm_receb_num_solic.qry_itens_por_prioridade_.Next
      else
        If nSaldo_Recebimento > 0 Then   { Se restou saldo do recebimento joga como item 999 - Saldo no Processo }
          begin
            try
              { fechar consulta }
              datm_receb_num_solic.qry_verif_item_999_.close;
              datm_receb_num_solic.qry_verif_item_999_.SQL.clear;
              datm_receb_num_solic.qry_verif_item_999_.SQL.add( 'SELECT * FROM TNUMERARIO_ITEM_SOLIC WHERE ' );
              datm_receb_num_solic.qry_verif_item_999_.SQL.add( 'NR_PROCESSO = "' + str_nr_processo + '" AND ' );
              datm_receb_num_solic.qry_verif_item_999_.SQL.add( 'NR_SOLICITACAO = "' + nr_solicitacao + '" AND ' );
              datm_receb_num_solic.qry_verif_item_999_.SQL.add( 'NR_LANCAMENTO = "' + '999' + '"' );
              { faz a chamada e abre a consulta}
              datm_receb_num_solic.qry_verif_item_999_.ExecSQL;
            except
            end;
            datm_receb_num_solic.qry_verif_item_999_.Open;
            If datm_receb_num_solic.qry_verif_item_999_.RecordCount = 0 then
            begin
              try
                qry_itens_solinum_.Append;
                qry_itens_solinum_NR_PROCESSO.AsString     := str_nr_processo;
                qry_itens_solinum_NR_SOLICITACAO.AsString  := nr_solicitacao;
                qry_itens_solinum_NR_LANCAMENTO.AsString   := '999';
                qry_itens_solinum_TP_SOLIC_INFORM.AsString := '1';
                qry_itens_solinum_CD_STATUS.AsString       := 'A';
                qry_itens_solinum_CD_ITEM.AsString         := '999';
                qry_itens_solinum_.Post;
              except
              end;
            end;
            datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger := datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsInteger + 1;
            datm_receb_num_solic.qry_itens_receb_.Append;
            datm_receb_num_solic.qry_itens_receb_NR_PROCESSO.AsString     := datm_receb_num_solic.qry_itens_por_prioridade_NR_PROCESSO.AsString;
            datm_receb_num_solic.qry_itens_receb_NR_RECEBIMENTO.AsString  := datm_receb_num_solic.tbl_recebimento_NR_RECEBIMENTO.AsString;
            datm_receb_num_solic.qry_itens_receb_NR_LANC_RECEB.AsString   := StrZero( datm_receb_num_solic.tbl_recebimento_QT_ITENS_RECEB.AsFloat, 3 );
            datm_receb_num_solic.qry_itens_receb_NR_SOLICITACAO.AsString  := datm_receb_num_solic.qry_itens_por_prioridade_NR_SOLICITACAO.AsString;
            datm_receb_num_solic.qry_itens_receb_NR_LANCAMENTO.AsString   := '999';
            datm_receb_num_solic.qry_itens_receb_CD_ITEM.AsString         := '999';
            datm_receb_num_solic.qry_itens_receb_VL_SOLICITADO.AsFloat    := 0;
            datm_receb_num_solic.qry_itens_receb_VL_RECEBIDO.AsFloat      := nSaldo_Recebimento;
            datm_receb_num_solic.qry_itens_receb_IN_CANCELADO.AsBoolean   := False;
            datm_receb_num_solic.qry_itens_receb_.post;
          end;
    end;
    datm_receb_num_solic.qry_itens_receb_.post;
    { Equivale ao refresh }
    datm_receb_num_solic.qry_itens_receb_.Close;
    datm_receb_num_solic.qry_itens_receb_.Open;
    Result := True;
    Exit
  end;
  Result := False;
end;

procedure Tfrm_receb_num_registro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_receb_num_registro.FormShow(Sender: TObject);
var
  nr_proc_caption : String[13];
begin
  nr_proc_caption := Processo( str_nr_processo );
  Caption := Caption + ' - Processo Nº [ ' + nr_proc_caption + ' ]' ;
end;

procedure Tfrm_receb_num_registro.btn_gravarClick(Sender: TObject);
begin

  try
    qry_itens_solinum_.close;
    qry_itens_solinum_.ParamByName( 'NR_PROCESSO' ).AsString := str_nr_processo;
    qry_itens_solinum_.Open;
  except
    frm_receb_num_solic.lOperacaoCancelada := True;
    Close;
  end;

  If Not (qry_itens_solinum_.RecordCount = 0) then
  begin
    lCombinacao := Combinacao; { Processa Combinacoes }
    If Not (lCombinacao) Then lPrioridade := Prioridade;
  end;

  Application.CreateForm( Tfrm_receb_num_itens, frm_receb_num_itens );
  If lCombinacao = True Then
    begin
      frm_receb_num_itens.btn_recombina.Visible := True;
      frm_receb_num_itens.btn_prioridade.Visible := True;
    end
  Else
    begin
      frm_receb_num_itens.btn_recombina.Visible := False;
      frm_receb_num_itens.btn_prioridade.Visible := False;
    end;

  frm_receb_num_itens.ShowModal;

  btn_gravar.Enabled := False;
  btn_gravar.Default := False;

  close;

end;

procedure Tfrm_receb_num_registro.btn_cancelarClick(Sender: TObject);
begin
  frm_receb_num_solic.lOperacaoCancelada := True;
  close;
end;

procedure Tfrm_receb_num_registro.dbedt_vl_recebimentoChange(
  Sender: TObject);
begin
  btn_gravar.Enabled := True;
  btn_gravar.Default := True;
end;

end.
