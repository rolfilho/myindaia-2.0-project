unit uExpMontaRe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables;

type
  Tfrm_exp_monta_re = class(TForm)
    Panel1: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    btn_preparar: TSpeedButton;
    btn_sair: TSpeedButton;
    qry_lista: TQuery;
    dsLista: TDataSource;
    qry_listaNR_PROCESSO: TStringField;
    qry_listaCD_EXPORTADOR: TStringField;
    qry_listaNR_OUTRAS_REF: TStringField;
    qry_listaNomeExportador: TStringField;
    qry_listaStatus: TStringField;
    updLista: TUpdateSQL;
    qry_listaIN_SELECIONADO: TStringField;
    Shape1: TShape;
    Label1: TLabel;
    qry_listaNR_PROCESSO_ABR: TStringField;
    Label52: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    ds_emp_nac: TDataSource;
    qry_exec_sp_: TQuery;
    qry_exec_sp_CD_UNID_NEG: TStringField;
    qry_exec_sp_CD_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_produto_: TQuery;
    qry_produto_NM_PRODUTO: TStringField;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    edt_chave: TEdit;
    Label2: TLabel;
    qry_listaCD_USUARIO: TStringField;
    SpeedButton2: TSpeedButton;
    sp_exp_monta_re: TStoredProc;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure qry_listaCalcFields(DataSet: TDataSet);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qry_listaAfterPost(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btn_prepararClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    function ValidaExp(AProcesso: String): Boolean;
  public
    { Public declarations }
  end;

var
  frm_exp_monta_re: Tfrm_exp_monta_re;

implementation

uses ConsOnlineEx, dReCapa, uReCapa, Funcoes, PGGP017, PGGP001;

{$R *.DFM}

procedure Tfrm_exp_monta_re.btn_co_unid_negClick(Sender: TObject);
begin
  ValCodEdt(msk_cd_unid_neg);
  if Sender is TSpeedButton then
  begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG','AP_UNID_NEG'],['Código','Nome','Apelido'],'CD_UNID_NEG');
    msk_cd_unid_negExit(nil);
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'AP_UNID_NEG');
end;

procedure Tfrm_exp_monta_re.msk_cd_unid_negExit(Sender: TObject);
begin
  with qry_lista do
  begin
    SQL.Clear;
    SQL.Add(' SELECT e.NR_PROCESSO, e.IN_SELECIONADO, e.CD_EXPORTADOR, e.NR_OUTRAS_REF, e.CD_USUARIO, SUBSTRING(e.NR_PROCESSO, 5, 14) AS NR_PROCESSO_ABR ');
    SQL.Add(' FROM TPROCESSO_EXP e ');
    SQL.Add(' JOIN TPROCESSO pr ON pr.NR_PROCESSO=e.NR_PROCESSO ');
    SQL.Add(' JOIN TFOLLOWUP fl ON fl.NR_PROCESSO=e.NR_PROCESSO and fl.CD_EVENTO="092" and fl.DT_REALIZACAO is null ');
    SQL.Add(' JOIN TFOLLOWUP fl2 ON fl2.NR_PROCESSO=e.NR_PROCESSO and fl2.CD_EVENTO="402" and fl2.DT_REALIZACAO is null and fl2.IN_APLICAVEL=1 ');
    SQL.Add('  ');
    SQL.Add('  ');
    SQL.Add(' WHERE SUBSTRING(e.NR_PROCESSO,1,2) = ''' + msk_cd_unid_neg.Text + '''');
    SQL.Add('   AND SUBSTRING(e.NR_PROCESSO,3,2) = ''' + msk_cd_produto.Text + '''');
    SQL.Add('   AND ISNULL(e.IN_MONTADO,''0'') = ''0''');
    SQL.Add('  AND pr.IN_CANCELADO<>1 ');
    SQL.Add(' ORDER BY SUBSTRING(e.NR_PROCESSO,13,2) DESC, SUBSTRING(e.NR_PROCESSO,5,7) DESC');
    Open;
    Locate('NR_PROCESSO', str_nr_processo, [loCaseInsensitive, loPartialKey]);
  end;

end;

procedure Tfrm_exp_monta_re.qry_listaCalcFields(DataSet: TDataSet);
begin
  qry_lista.FieldByName('NomeExportador').AsString := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', qry_lista.FieldByName('CD_EXPORTADOR').AsString, 'NM_EMPRESA');
  if qry_lista.FieldByName('IN_SELECIONADO').AsString = '1' then
    qry_lista.FieldByName('Status').AsString := 'ü'
  else qry_lista.FieldByName('Status').AsString := ' ';
end;

procedure Tfrm_exp_monta_re.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_exp_monta_re.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_exp_monta_re.qry_listaAfterPost(DataSet: TDataSet);
begin
  qry_lista.ApplyUpdates;
end;

procedure Tfrm_exp_monta_re.DBGrid1DblClick(Sender: TObject);
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TPROCESSO_EXP_ITEM WHERE NR_PROCESSO = ' + QuotedStr(qry_listaNR_PROCESSO.AsString));
    Open;
    if  Fields[0].AsInteger > 0 then
    begin
      qry_lista.Edit;
      if (qry_lista.FieldByName('IN_SELECIONADO').AsString = '1') then
      begin
        qry_lista.FieldByName('IN_SELECIONADO').AsString := '0';
        qry_lista.FieldByName('CD_USUARIO').AsString := '';
      end
      else
      begin
        qry_lista.FieldByName('IN_SELECIONADO').AsString := '1';
        qry_lista.FieldByName('CD_USUARIO').AsString := str_cd_usuario;
      end;
      qry_lista.Post;
    end
    else
    begin
      Application.MessageBox('Não existe itens para este processo!','Mensagem',mb_ok+mb_IconWarning);
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_exp_monta_re.btn_prepararClick(Sender: TObject);
var
  NovoEx: Boolean;
  Servico: String;
  Grupo: String;
begin
  with TQuery.Create(Application) do
  begin
    SQL.Clear;
    DatabaseName := 'DBBROKER';
    SQL.Add(' SELECT NR_PROCESSO               ');
    SQL.Add(' FROM TPROCESSO_EXP               ');
    SQL.Add(' WHERE IN_SELECIONADO = "1"       ');
    SQL.Add(' AND ISNULL(IN_MONTADO,"0") = "0" ');
    SQL.Add(' AND CD_USUARIO = '+str_cd_usuario );
    Open;
    while not EOF do
    begin
      if ConfereNF(FieldByName('NR_PROCESSO').AsString) and ValidaExp(FieldByName('NR_PROCESSO').AsString) then
      begin
        try
          CloseStoredProc(sp_exp_monta_re);
          sp_exp_monta_re.ParamByName('@NR_PROCESSO').AsString := FieldByName('NR_PROCESSO').AsString;
          ExecStoredProc(sp_exp_monta_re);

          //  Retirada a pergunta se o RE será no modelo NovoEx ou no Siscomex, em vista que o Siscomex
          //  foi extinto. Variável NovoEx sempre será 'True'.
          //                                Ocorrência 01391/12,   Eric, 10:09h   13/02/2012

          NovoEx := True;
          //NovoEx := ConsultaLookUPSQL(' SELECT TOP 1 CONVERT(INT, IN_NOVOEX) AS IN_NOVOEX ' +
          //                            ' FROM TRE_CAPA ' +
          //                            ' WHERE NR_PROCESSO = ' + QuotedStr(FieldByName('NR_PROCESSO').AsString) +
          //                            ' ORDER BY CONVERT(INT, ISNULL(NR_PROCESSO_COMPLEMENTO, ''000'')) DESC ', 'IN_NOVOEX') = '1';

          {// Incluído para perguntar sempre para o serviço 929 se monta para o NovoEx ou não - Michel - 01/01/2011
          Servico := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', FieldByName('NR_PROCESSO').AsString, 'CD_SERVICO');

          // Incluído para perguntar sempre para o Grupo 002 se monta para o NovoEx ou não - Michel - 02/12/2011
          Grupo := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', FieldByName('NR_PROCESSO').AsString, 'CD_GRUPO');}

          // Comentado acima, as validações estão sendo feitas em FN_IS_NOVOEX - Michel - 02/11/2011
          (*if (NovoEx and FileExists(ExtractFilePath(Application.ExeName) + 'NovoEx\' + FieldByName('NR_PROCESSO').AsString + '*.xml')) or
             (ConsultaLookUPSQL('SELECT DBO.FN_IS_NOVOEX(''' + FieldByName('NR_PROCESSO').AsString + ''') AS IN_NOVOEX', 'IN_NOVOEX') = '1') then
            {if dt_server >= StrToDate('01/12/2010') then
              NovoEx := True
            else}
              NovoEx := MessageDlg('Deseja preparar este RE para o modelo NovoEx?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
              NovoEx := True;*)
          if sp_exp_monta_re.ParamByName('RESULT').AsInteger = 0 then
            MessageDlg('Integração do processo "'+FieldByName('NR_PROCESSO').AsString+'" concluida com sucesso.' + #10#13 + 'Lembre de entrar na RE montada e classificar os anexos conforme desejado.', mtInformation, [mbOK], 0)
          else
            MessageDlg('Ocorreu um erro ao prepara a RE do processo "'+FieldByName('NR_PROCESSO').AsString+'".' + #10#13 + 'Informe o ocorrido ao suporte.', mtError, [mbOK], 0);
          CloseStoredProc(sp_exp_monta_re);
          //if NovoEx then
            FastExecSQL('EXEC SP_RE_CLASSIFICA_ANEXO_NOVOEX_TODOS "' + FieldByName('NR_PROCESSO').AsString + '"');
          //else
          //  FastExecSQL('UPDATE TRE_CAPA SET IN_NOVOEX = 0 WHERE NR_PROCESSO = "' + FieldByName('NR_PROCESSO').AsString + '"');
          msk_cd_unid_negExit(nil);
        except
          on e:exception do
           MessageDlg('Ocorreu um erro ao prepara a RE para o processo "'+FieldByName('NR_PROCESSO').AsString+'" .' + #10#13 + 'Informe o ocorrido ao suporte. ' + #10#13 + e.message, mtError, [mbOK], 0);
        end;
      end;
      Next;
    end;
    Free;
  end;
end;

procedure Tfrm_exp_monta_re.FormShow(Sender: TObject);
begin
  { retirar a seleção de lagum registro que por ventura tenha focado marcado anteriormente - by carlos 11/07/2011 }
  with TQuery.Create(Application) do
  begin
    SQL.Clear;
    DatabaseName := 'DBBROKER';
    SQL.Add(' UPDATE        ');
    SQL.Add(' TPROCESSO_EXP ');
    SQL.Add(' SET IN_SELECIONADO = "0" ');
    SQL.Add(' WHERE IN_SELECIONADO = "1" ' );
    SQL.Add(' AND ISNULL(IN_MONTADO,"0") =  "0"' );
    SQL.Add(' AND CD_USUARIO = '+str_cd_usuario );
    ExecSQL;
    free;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text := '02';
  msk_cd_produtoExit(nil);

  edt_chave.SetFocus;
end;

procedure Tfrm_exp_monta_re.btn_co_produtoClick(Sender: TObject);
begin
  ValCodEdt(msk_cd_produto);
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Descrição'],'CD_PRODUTO');
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'NM_PRODUTO');
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_exp_monta_re.msk_cd_produtoExit(Sender: TObject);
begin
    msk_cd_produto.Text   := Trim( msk_cd_produto.Text );
    ValCodEdt( msk_cd_produto );

    if ( msk_cd_produto.Text <> '' ) then
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString := Trim( msk_cd_produto.Text );
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;

      if Not ( qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]) ) then
      begin
        MessageDlg('Produto não encontrado, sem habilitação ou desativado!', mtInformation, [mbOK], 0);
        msk_cd_produto.Text := '';
        edt_nm_produto.Text := '';
        msk_cd_produto.SetFocus;
      end
      else
      begin
        qry_produto_.Close;
        qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
        qry_produto_.Prepare;
        qry_produto_.Open;
        if Not ( qry_produto_.EOF ) then
           edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
      end;
    end;

    if ( msk_cd_produto.Text = '' )  then
      edt_nm_produto.Text := '';
end;

procedure Tfrm_exp_monta_re.msk_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_produto then btn_co_produtoClick(TSpeedButton.NewInstance);
  end;
end;

procedure Tfrm_exp_monta_re.edt_chaveChange(Sender: TObject);
begin
  Localiza( qry_lista, edt_chave.Text, 'NR_PROCESSO_ABR' );
end;

procedure Tfrm_exp_monta_re.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(Tdatm_re_capa, datm_re_capa);
  Application.CreateForm(Tfrm_re_capa,frm_re_capa);
  frm_re_capa.ShowModal;
  frm_re_capa.Release;
  datm_re_capa.Destroy;
  Close;
end;

function Tfrm_exp_monta_re.ValidaExp(AProcesso: String): Boolean;
var
  S: String;
begin
  Result := True;
  // Grupo Exige CFOP
  if ConsultaLookUPSQL('SELECT G.IN_EXIGE_CFOP_EXP ' +
                       'FROM TPROCESSO P ' +
                       '   INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE ' +
                       '   INNER JOIN TGRUPO G ON G.CD_GRUPO = E.CD_GRUPO ' +
                       'WHERE P.NR_PROCESSO = :NR_PROCESSO', 'IN_EXIGE_CFOP_EXP', [AProcesso]) = '1' then
  begin
    with TQuery.Create(Self) do
      try
        DatabaseName := 'DBBROKER';
        SQL.Add('SELECT NR_ITEM');
        SQL.Add('FROM TPROCESSO_EXP_ITEM');
        SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        SQL.Add('  AND ISNULL(CD_CFOP, "") = ""');
        SQL.Add('ORDER BY NR_ITEM');
        ParamByName('NR_PROCESSO').AsString := AProcesso;
        Open;
        First;
        S := '';
        while not Eof do
        begin
          S := S + #13 + FieldByName('NR_ITEM').AsString;
          Next;
        end;
        if S <> '' then
        begin
          System.Delete(S, 1, 1);
          MessageDlg('É necessário informar o CFOP para os ítens abaixo:'#13 + S, mtInformation, [mbOk], 0);
          Result := False;
          Exit;
        end
        else
        begin
          SQL.Clear;
          SQL.Add('SELECT NR_ITEM, CD_CFOP, NR_ATO_CONCESSORIO');
          SQL.Add('FROM TPROCESSO_EXP_ITEM');
          SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
          SQL.Add('ORDER BY NR_ITEM');
          ParamByName('NR_PROCESSO').AsString := AProcesso;
          Open;
          First;
          S := '';
          while not Eof do
          begin
            if (FieldByName('CD_CFOP').AsString = '7127') and (FieldByName('NR_ATO_CONCESSORIO').AsString = '') then
              S := S + #13 + FieldByName('NR_ITEM').AsString;
            Next;
          end;
          if S <> '' then
          begin
            System.Delete(S, 1, 1);
            MessageDlg('É necessário informar o Ato Concessório para os ítens abaixo:'#13 + S, mtInformation, [mbOk], 0);
            Result := False;
            Exit;
          end;
        end;
      finally
        Free;
      end;
  end; // Grupo Exige CFOP

  // CFOP 7127 exige que o Ato Concessório seja preenchido
  with TQuery.Create(Self) do
    try
      DatabaseName := 'DBBROKER';
      SQL.Add('SELECT NR_ITEM, CD_CFOP, NR_ATO_CONCESSORIO');
      SQL.Add('FROM TPROCESSO_EXP_ITEM');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
      SQL.Add('ORDER BY NR_ITEM');
      ParamByName('NR_PROCESSO').AsString := AProcesso;
      Open;
      First;
      S := '';
      while not Eof do
      begin
        if (FieldByName('CD_CFOP').AsString = '7127') and (FieldByName('NR_ATO_CONCESSORIO').AsString = '') then
          S := S + #13 + FieldByName('NR_ITEM').AsString;
        Next;
      end;
      if S <> '' then
      begin
        System.Delete(S, 1, 1);
        MessageDlg('É necessário informar o Ato Concessório para os ítens abaixo:'#13 + S, mtInformation, [mbOk], 0);
        Result := False;
        Exit;
      end;
    finally
      Free;
    end; // CFOP 7127 exige que o Ato Concessório seja preenchido
end;

end.
