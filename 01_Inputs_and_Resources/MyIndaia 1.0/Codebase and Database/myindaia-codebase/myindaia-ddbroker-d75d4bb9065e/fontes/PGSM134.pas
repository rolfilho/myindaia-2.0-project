unit PGSM134;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, Funcoes,
  PGGP017, DBTables, DB;

type
  Tfrm_canc_proc = class(TForm)
    pgctrl_canc_proc: TPageControl;
    ts_lista: TTabSheet;
    dbg_canc_proc: TDBGrid;
    pnl_btn_c: TPanel;
    btn_cancelar: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    menu_cadastro: TMainMenu;
    mi_cancelar: TMenuItem;
    Sair1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbg_canc_procKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Pesquisa : String;
    a_str_indices : Array[0..1] Of String[60];
    procedure LimpaInstrucaoDesembRefCliente;
  public
    { Public declarations }
  end;

var
  frm_canc_proc: Tfrm_canc_proc;

implementation

uses PGSM135, GSMLIB, PGGP001, ConsOnLineEx;

{$R *.DFM}


procedure Tfrm_canc_proc.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_canc_proc, datm_canc_proc );
  vStr_cd_modulo:='01';
  str_cd_rotina:='0104';

  with datm_canc_proc Do
  begin
    qry_rel_processo_.Close;
    qry_rel_processo_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_rel_processo_.Prepare;
    qry_rel_processo_.Open;
  end;

  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'CD_CLIENTE';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Unid+Prod+Processo');
    Items.Add('Cód. Cliente');
    ItemIndex := 0;
  end;

{  datm_canc_proc.qry_processo_.Close;
  datm_canc_proc.qry_processo_.Open;

  datm_canc_proc.qry_fat_cc_.Close;
  datm_canc_proc.qry_fat_cc_.Open;}
end;

procedure Tfrm_canc_proc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_canc_proc Do
  begin
    qry_rel_processo_.Close;
    qry_fat_cc_.Close;
  end;
//  datm_canc_proc.Destroy;
  datm_canc_proc.Free;
  Action := caFree;
end;

procedure Tfrm_canc_proc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_canc_proc.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_canc_proc.qry_rel_processo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_canc_proc.cb_ordemClick(Sender: TObject);
begin
  try
    Screen.Cursor:=crHourGlass;
    Pesquisa := datm_canc_proc.qry_rel_processo_NR_PROCESSO.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    datm_canc_proc.qry_rel_processo_.Close;
    datm_canc_proc.qry_rel_processo_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    datm_canc_proc.qry_rel_processo_.SQL[53] := a_str_indices[cb_ordem.ItemIndex];
    datm_canc_proc.qry_rel_processo_.Open;
    Localiza(datm_canc_proc.qry_rel_processo_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure Tfrm_canc_proc.dbg_canc_procKeyPress(Sender: TObject;
  var Key: Char);
begin
//  If Key = #13 then btn_cancelarClick(Sender);
end;

procedure Tfrm_canc_proc.btn_cancelarClick(Sender: TObject);
  var
  //qryAuxiliar : TQuery;
  qryWallet : TQuery;
begin
  with datm_canc_proc do
  begin
//    datm_canc_proc.qry_processo_.Close;
//    datm_canc_proc.qry_processo_.Open;

    datm_canc_proc.qry_fat_cc_.Close;
    datm_canc_proc.qry_fat_cc_.Open;

    datm_canc_proc.qry_Caixa_Money.Close;
    datm_canc_proc.qry_Caixa_Money.Open;


    qry_pgto_lancado_.Close;
    qry_pgto_lancado_.ParamByName('NR_PROCESSO').AsString := qry_rel_processo_NR_PROCESSO.AsString;
    qry_pgto_lancado_.Open;

    try
      if qry_rel_processo_IN_CANCELADO.AsString = '0' then
      begin
        if qry_fat_cc_QT_FAT_CC.AsFloat = 0 then
        begin
          if qry_fat_cc_QT_RECEB.AsInteger = 0 then
          begin
            //if qry_pgto_lancado_QT_PROCESSOS.AsInteger = 0 then
            if qry_pgto_lancado_.FieldByName('VL_TOTAL').AsFloat = 0 then //Rodrigo Capra - 05/12/2007
            begin
              if qry_fat_cc_QT_SOLIC_CH.AsInteger = 0 then
              begin
                if qry_Caixa_Money.RecordCount = 0 then
                begin
                  if ConsultaLookUpSql('SELECT COUNT(*) BLABLA FROM TFOLLOWUP WHERE NR_PROCESSO = ''' + qry_rel_processo_NR_PROCESSO.AsString + ''' ' +
                                               ' AND CD_EVENTO IN (''227'') AND DT_REALIZACAO IS NOT NULL', 'BLABLA') = '0' then
                  begin
                    with TQuery.Create(Application) do
                    begin
                      DatabaseName := 'DBBROKER';
                      SQL.Clear;
                      SQL.Add('UPDATE TPROCESSO');
                      SQL.Add('SET ');
                      SQL.Add('   IN_CANCELADO  = ''1'',            ');
                      SQL.Add('   CD_CANCELADOR =:CD_CANCELADOR,    ');
                      SQL.Add('   DT_CANCELAMENTO =:DT_CANCELAMENTO');
                      SQL.Add('WHERE');
                      SQL.Add('   NR_PROCESSO =:NR_PROCESSO');
                      ParamByName('NR_PROCESSO').AsString       := qry_rel_processo_NR_PROCESSO.AsString;
                      ParamByName('CD_CANCELADOR').AsString     := Str_Cd_Usuario;
                      ParamByName('DT_CANCELAMENTO').AsDateTime := Now;
                      ExecSql;
                      Free;
                    end;


                    try
                      qryWallet := TQuery.Create(Application);
                      qryWallet.DatabaseName := 'DBBROKER';
                      qryWallet.SQL.Clear;
                      qryWallet.SQL.Add('DELETE MYINDAIAV2.DBO.CUSTOMCLEARANCE');
                      qryWallet.SQL.Add('WHERE');
                      qryWallet.SQL.Add('   customID =:NR_PROCESSO');
                      qryWallet.ParamByName('NR_PROCESSO').AsString       := qry_rel_processo_NR_PROCESSO.AsString;
                      qryWallet.ExecSql;
                    Finally
                      qryWallet.Free;
                    end;



                    {qry_processo_.Edit;
                    qry_processo_IN_CANCELADO.AsString:='1';
                    qry_processo_CD_CANCELADOR.AsString:=str_cd_usuario;
                    qry_processo_DT_CANCELAMENTO.AsDateTime:=now;
                    qry_processo_.Post;}

                    //cancelar Estágio do Processo para Importações ou Administrações
                    {if (qry_rel_processo_CD_PRODUTO.AsString = '01') or (qry_rel_processo_CD_PRODUTO.AsString = '06') then
                    begin
                      with TQuery.Create(Application) do
                      begin
                        DatabaseName := 'DBBROKER';
                        SQL.Clear;
                        if qry_rel_processo_CD_PRODUTO.AsString = '01' then
                        begin
                          qryAuxiliar := TQuery.Create(application);
                          qryAuxiliar.Databasename := 'DBBROKER';
                          qryAuxiliar.SQL.Clear;
                          qryAuxiliar.SQL.Add('SELECT COUNT(*) FROM TESTAGIO_PROCESSO (NOLOCK)');
                          qryAuxiliar.SQL.Add('WHERE NR_PROCESSO_DES <> '''+ qry_rel_processo_NR_PROCESSO.AsString+'''');
                          qryAuxiliar.Open;
                          //verifica se existem processos diferentes do cancelado
                          if qryAuxiliar.Fields[0].AsInteger > 0 then begin
                            SQL.Add('DELETE TESTAGIO_PROCESSO WHERE NR_PROCESSO_DES = '''+ qry_rel_processo_NR_PROCESSO.AsString+'''');
                          end
                          else
                          begin
                            SQL.Add('UPDATE TESTAGIO_PROCESSO SET NR_PROCESSO_DES = NULL');
                            SQL.Add('WHERE NR_PROCESSO_DES = '''+ qry_rel_processo_NR_PROCESSO.AsString+'''');
                          end;
                          ExecSQL;
                          qryAuxiliar.Close;
                          qryAuxiliar.Free;
                        end;
                        if qry_rel_processo_CD_PRODUTO.AsString = '06' then
                        begin
                          //administração de pedido
                          SQL.Add('UPDATE TESTAGIO_PROCESSO SET NR_PROCESSO_ADM = NULL');
                          SQL.Add('WHERE NR_PROCESSO_ADM = '''+ qry_rel_processo_NR_PROCESSO.AsString+'''');
                          ExecSQL;
                        end;
                        Free;
                      end;
                    end;
                    //no caso do produto 02(exp), retorna a rap para o status de autorizada
                    if qry_rel_processo_CD_PRODUTO.AsString = '02' then
                    begin
                      qryAuxiliar := TQuery.Create(application);
                      qryAuxiliar.Databasename := 'DBBROKER';
                      qryAuxiliar.SQL.Clear;
                      qryAuxiliar.SQL.Add('SELECT COUNT(*) FROM MYINDAIA.DBO.TRAP (NOLOCK) WHERE NR_PROCESSO = ''' + qry_rel_processo_NR_PROCESSO.AsString+'''');
                      qryAuxiliar.Open;

                      if qryAuxiliar.Fields[0].AsInteger > 0 then
                      begin
                        with TQuery.Create(application) do
                        begin
                          Databasename := 'DBBROKER';
                          try
                            //retorna para o status de autorizado
                            SQL.Clear;
                            SQL.Add('UPDATE E SET CD_STATUS = ''2'', CD_USUARIO_FIM = NULL, DT_FINALIZADO = NULL');
                            SQL.Add('FROM MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK), MYINDAIA.DBO.TRAP R (NOLOCK)');
                            SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO = E.CD_RAP+E.CD_RAP_ANO');
                            SQL.Add('  AND R.NR_PROCESSO = ''' + qry_rel_processo_NR_PROCESSO.AsString+'''');
                            ExecSQL;
                            SQL.Clear;
                            SQL.Add('UPDATE MYINDAIA.DBO.TRAP SET CD_STATUS = ''2'', NR_PROCESSO = NULL');
                            SQL.Add('WHERE NR_PROCESSO = ''' + qry_rel_processo_NR_PROCESSO.AsString+'''');
                            ExecSQL;
                          finally
                            Free;
                          end;
                        end;
                      end;
                      qryAuxiliar.Close;
                      qryAuxiliar.Free;
                    end;} // Efetuando operação do cancelamento na trigger - Michel - 20/09/2010
                    LimpaInstrucaoDesembRefCliente;
                    qry_rel_processo_.Close;
                    qry_rel_processo_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
                    qry_rel_processo_.Open;

                    BoxMensagem('Processo foi cancelado com êxito!',3);
                  end
                  else
                    BoxMensagem('Impossível cancelar processo. Existem eventos crucias preenchidos no followup!',3);
                end
                else
                  BoxMensagem('Impossível cancelar processo, pois existem lançamentos no myIndaiá Money!',3);
              end
              else
                BoxMensagem('Impossível cancelar processo solicitação de cheque!',3);
            end
            else
              BoxMensagem('Não será possível cancelar o processo de número :  ' + qry_rel_processo_NR_PROCESSO.AsString + ' pois o mesmo ainda contém pendências no faturamento',3)
              //ShowMessage('O Processo não pode ser Cancelado. Contatar setor Financeiro!');
          end
          else
            BoxMensagem('Impossível cancelar processo recebimento de numerário!',3);
        end
        else
          BoxMensagem('Impossível cancelar processo com movimento!',3);
      end
      else
          BoxMensagem('Impossível cancelar processo cancelado!',3);
    except
      on E:Exception do
      begin
        //qry_processo_.Cancel;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_canc_proc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure Tfrm_canc_proc.edt_chaveExit(Sender: TObject);
begin
{    with datm_canc_proc do
    begin
      qry_pgto_lancado_.ParamByName('NR_PROCESSO').AsString := edt_chave.Text;
      qry_pgto_lancado_.Open;
    end;}
end;

procedure Tfrm_canc_proc.FormShow(Sender: TObject);
begin
  edt_chave.SetFocus;
end;

procedure Tfrm_canc_proc.LimpaInstrucaoDesembRefCliente;
begin
  {with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    Sql.Add('UPDATE TINSTRUCAO_DESEMBARACO set NR_PROCESSO = NULL');
    Sql.Add('WHERE');
    Sql.Add(' NR_PROCESSO =:NR_PROCESSO');
    ParamByName('NR_PROCESSO').AsString := datm_canc_proc.qry_rel_processo_NR_PROCESSO.AsString;
    ExecSql;

    Close;
    SQL.Clear;
    Sql.Add('DELETE FROM TREF_CLIENTE');
    Sql.Add('WHERE');
    Sql.Add(' NR_PROCESSO =:NR_PROCESSO');
    ParamByName('NR_PROCESSO').AsString := datm_canc_proc.qry_rel_processo_NR_PROCESSO.AsString;
    ExecSql;

    Free;
  end;} // Efetuando operação do cancelamento na trigger - Michel - 20/09/2010
end;


end.
