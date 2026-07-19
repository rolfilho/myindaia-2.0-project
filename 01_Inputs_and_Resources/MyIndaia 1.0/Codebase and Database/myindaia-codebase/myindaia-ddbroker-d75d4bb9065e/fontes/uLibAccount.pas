  unit uLibAccount;
(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: PGSM251.PAS - frm_cia_transp
AUTOR: Paulo do Amaral Costa
DATA: 24/06/2002
MANUTENÇÃO:
DATA: 24/06/2002 - ADBC-0007 - Ecotrans
********************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, RXDBCtrl;

type
  Tfrm_lib_account = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_sair: TMenuItem;
    btn_aprovar_proc: TSpeedButton;
    dbg_cadastro: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pnl1: TPanel;
    Label5: TLabel;
    btn_co_unid_pesq: TSpeedButton;
    Label6: TLabel;
    btn_co_prod_pesq: TSpeedButton;
    msk_unid_pesq: TMaskEdit;
    edt_nm_unid_pesq: TEdit;
    msk_prod_pesq: TMaskEdit;
    edt_nm_prod_pesq: TEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_unid_pesqClick(Sender: TObject);
    procedure btn_co_prod_pesqClick(Sender: TObject);
    procedure msk_prod_pesqExit(Sender: TObject);
    procedure msk_unid_pesqExit(Sender: TObject);
    procedure btn_aprovar_procClick(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure msk_unid_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    a_str_indices : Array[0..5] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );


  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_lib_account: Tfrm_lib_account;

implementation

uses GSMLIB, PGGP017, PGSM250, ConsOnLineEx, dLibAccount, Funcoes;


{$R *.DFM}

procedure Tfrm_lib_account.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_lib_account.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_lib_account.Free;
  Action := caFree;
end;

procedure Tfrm_lib_account.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_lib_account.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Frete }

  Application.CreateForm(Tdatm_lib_account, datm_lib_account );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
     with datm_lib_account do
    begin

      qry_traz_default_.Close;
      qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_traz_default_.Open;

      msk_unid_pesq.text:= qry_traz_default_CD_UNID_NEG.AsString;
      edt_nm_unid_pesq.text:=qry_traz_default_NM_UNID_NEG.AsString;

      msk_prod_pesq.text:=qry_traz_default_CD_PRODUTO.AsString;
      edt_nm_prod_pesq.text:=qry_traz_default_NM_PRODUTO.AsString;

     qry_processo_.Close;
     qry_processo_.ParamByName('CD_PRODUTO').AsString:= qry_traz_default_CD_PRODUTO.AsString;
     qry_processo_.ParamByName('CD_UNID_NEG').AsString:=qry_traz_default_CD_UNID_NEG.AsString;
     qry_processo_.Prepare;
     qry_processo_.Open;
    end;


  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'CD_CLIENTE';
  a_str_indices[2] := 'CD_AGENTE';
  a_str_indices[3] := 'NM_AGENTE';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cód. Cliente');
    Items.Add('Cliente');
    Items.Add('Cód. Agente');
    Items.Add('Agente');
    ItemIndex := 0;
  end;

  vstr_cd_modulo:='33';
  str_cd_rotina:='3305';

//  AtribuiDireitos(st_modificar, st_incluir, st_excluir);


 end;


procedure Tfrm_lib_account.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
 
end;

procedure Tfrm_lib_account.btn_co_unid_pesqClick(Sender: TObject);
begin
{ Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );


 msk_unid_pesqExit(Sender); }

  if Sender is TSpeedButton then begin
    msk_unid_pesq.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_unid_pesq.text);
    msk_unid_pesqExit(Sender);
  end else
    edt_nm_unid_pesq.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_unid_pesq.text, 'NM_UNID_NEG' );

 

end;

procedure Tfrm_lib_account.btn_co_prod_pesqClick(Sender: TObject);
//var produto:string;
begin
{produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO');
 if produto <>'' then
   begin
    msk_prod_pesq.text:=produto;
    msk_prod_pesqExit(Sender);
   end; }

  if Sender is TSpeedButton then begin
    msk_prod_pesq.text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_prod_pesq.text);
    msk_prod_pesqExit(Sender);
  end else
    edt_nm_prod_pesq.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_pesq.Text+'" ' +
                                               'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'")' , 'NM_PRODUTO');
   


end;

procedure Tfrm_lib_account.msk_prod_pesqExit(Sender: TObject);
begin
{ if msk_prod_pesq.Text <> '' then
  begin
    ValCodEdt( msk_prod_pesq );
    datm_lib_account.qry_pesquisa_.Active:=false;
    datm_lib_account.qry_pesquisa_.Sql.Clear;
    datm_lib_account.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_pesq.Text+'"');
    datm_lib_account.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_lib_account.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_lib_account.qry_pesquisa_.Active:=true;
    if datm_lib_account.qry_pesquisa_.RecordCount > 0 then
        begin
           edt_nm_prod_pesq.text:= datm_lib_account.qry_pesquisa_.Fields[0].AsString;
           datm_lib_account.qry_pesquisa_.Close;
           datm_lib_account.qry_processo_.Close;
           datm_lib_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
           datm_lib_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
           datm_lib_account.qry_processo_.Prepare;
           datm_lib_account.qry_processo_.Open;
        end
        else
        begin
          datm_lib_account.qry_pesquisa_.Close;
          edt_nm_prod_pesq.Text := '';
          BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
          msk_prod_pesq.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('O Produto deve ser informado!',2);
      msk_prod_pesq.SetFocus;
     end;  }

   if msk_prod_pesq.Text <> '' then begin
    msk_prod_pesq.Text := Copy('00', 1, 2 - Length( msk_prod_pesq.Text)) +  msk_prod_pesq.Text;
    edt_nm_prod_pesq.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_pesq.Text+'" ' +
                                               ' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'") ' , 'NM_PRODUTO');

    if edt_nm_prod_pesq.text = '' then begin
      edt_nm_prod_pesq.Text := '';
      ShowMessage('Código do Produto inválido ou não habilidado!');
      msk_prod_pesq.SetFocus;
      Exit;
    end else begin
      datm_lib_account.qry_processo_.Close;
      datm_lib_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
      datm_lib_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
      datm_lib_account.qry_processo_.Prepare;
      datm_lib_account.qry_processo_.Open;
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_prod_pesq.SetFocus;
  end;
end;

procedure Tfrm_lib_account.msk_unid_pesqExit(Sender: TObject);
begin
{ if msk_unid_pesq.Text <> '' then
  begin
    ValCodEdt( msk_unid_pesq );
    datm_lib_account.qry_pesquisa_.Active:=false;
    datm_lib_account.qry_pesquisa_.Sql.Clear;
    datm_lib_account.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'"');
    datm_lib_account.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_lib_account.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_lib_account.qry_pesquisa_.Active:=true;
    if datm_lib_account.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_unid_pesq.text:= datm_lib_account.qry_pesquisa_.Fields[0].AsString;
          datm_lib_account.qry_pesquisa_.Close;

          datm_lib_account.qry_processo_.Close;
          datm_lib_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
          datm_lib_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
          datm_lib_account.qry_processo_.Prepare;
          datm_lib_account.qry_processo_.Open;


        end
        else
        begin
          datm_lib_account.qry_pesquisa_.Close;
          edt_nm_unid_pesq.Text := '';
          BoxMensagem('Código da Unidade de Negócio inválido!', 2);
          msk_unid_pesq.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('A Unidade de Negócio deve ser informado!',2);
      msk_unid_pesq.SetFocus;
     end; }

  if msk_unid_pesq.Text <> '' then begin
    msk_unid_pesq.Text := Copy('00', 1, 2 - Length( msk_unid_pesq.Text)) +  msk_unid_pesq.Text;
    edt_nm_unid_pesq.text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'" ' +
                                               ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                               '                     WHERE CD_USUARIO ="'+str_cd_usuario+'")', 'NM_UNID_NEG');
    if edt_nm_unid_pesq.text = '' then begin
      edt_nm_unid_pesq.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_unid_pesq.SetFocus;
      Exit;
    end else begin
      datm_lib_account.qry_processo_.Close;
      datm_lib_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
      datm_lib_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
      datm_lib_account.qry_processo_.Prepare;
      datm_lib_account.qry_processo_.Open;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_unid_pesq.SetFocus;
  end;

end;

procedure Tfrm_lib_account.btn_aprovar_procClick(Sender: TObject);
var nr_processo: String[18];
    REMESSA : TQuery;
    in_fatura : String[1];
begin
    if datm_lib_account.qry_processo_.RecordCount = 0 then exit;

    nr_processo := datm_lib_account.qry_processo_NR_PROCESSO.AsString;

    if (datm_lib_account.qry_processo_IN_ACCOUNT.AsString ='6') then
      begin

       if datm_lib_account.qry_processo_VL_ACCOUNT.AsFloat > 0  then
         in_fatura := '3'
       else
         in_fatura := '4';

       REMESSA:= Tquery.Create(Application);
       REMESSA.DatabaseName:= 'DBBROKER';
       REMESSA.Sql.Add(' UPDATE TPROCESSO_FATURA_AG SET IN_FATURA = "'+in_fatura+'",  ');
       REMESSA.Sql.Add(' CD_VIA_TRANSP = "'+datm_lib_account.qry_processo_CD_VIA_TRANSPORTE.AsString+'",');
       REMESSA.Sql.Add(' CD_MOEDA = "'+datm_lib_account.qry_processo_CD_MOEDA_FRETE.AsString+'", ');
       REMESSA.Sql.Add(' CD_CLIENTE = "'+datm_lib_account.qry_processo_CD_CLIENTE.AsString+'", ');
       REMESSA.Sql.Add(' CD_AGENTE = "'+datm_lib_account.qry_processo_CD_AGENTE.AsString+'"');
       REMESSA.Sql.Add(' WHERE NR_PROCESSO = "'+nr_processo+'"');
       REMESSA.ExecSql;


       REMESSA.Sql.Clear;
       REMESSA.Sql.Add('UPDATE TPROCESSO SET IN_ACCOUNT = "5" WHERE ');
       REMESSA.Sql.Add(' NR_PROCESSO = "'+nr_processo+'"');
       REMESSA.ExecSql;
       REMESSA.Free;
      end;

    if datm_lib_account.qry_processo_IN_ACCOUNT.AsString ='7' then
       begin
        Boxmensagem('Todos os processos dessa Consolidada serão Liberados para o Operacional!',3);
         With TQuery.Create(Application) do
          begin
           DAtaBaseName:= 'DBBROKER';
           Sql.Add('UPDATE TPROCESSO SET IN_ACCOUNT = "0" ');
           Sql.Add(' WHERE NR_PROCESSO IN (SELECT H.NR_PROCESSO FROM THOUSE H ');
           Sql.Add('                          WHERE H.CD_MASTER = "'+datm_lib_account.qry_processo_CD_MASTER.AsString+'") ');
           ExecSql;

           Sql.Clear;
           Sql.Add('UPDATE TMASTER SET IN_ACCOUNT = "0" ');
           Sql.Add(' WHERE CD_MASTER = "'+datm_lib_account.qry_processo_CD_MASTER.AsString+'"');
           ExecSql;
           Free;
          end;
       end;

    datm_lib_account.qry_processo_.Close;
    datm_lib_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
    datm_lib_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
    datm_lib_account.qry_processo_.Prepare;
    datm_lib_account.qry_processo_.Open;

    Boxmensagem('Processo Liberado pelo Account',3);

end;

procedure Tfrm_lib_account.cb_ordemChange(Sender: TObject);
begin

    edt_chave.Text := '';
    datm_lib_account.qry_processo_.Close;
    datm_lib_account.qry_processo_.SQL[10] := a_str_indices[cb_ordem.ItemIndex];
    datm_lib_account.qry_processo_.ParamByName('CD_UNI_NEG').AsString:=msk_unid_pesq.text;
    datm_lib_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_prod_pesq.text;
    datm_lib_account.qry_processo_.Prepare;
    datm_lib_account.qry_processo_.Open;
    edt_chave.SetFocus;

end;

procedure Tfrm_lib_account.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 0 then
       Localiza (datm_lib_account.qry_processo_, msk_unid_pesq.text + msk_prod_pesq.text +
                         edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else Localiza (datm_lib_account.qry_processo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_lib_account.msk_unid_pesqKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then begin
    if Sender = msk_unid_pesq then btn_co_unid_pesqClick(btn_co_unid_pesq);
    if Sender = msk_prod_pesq then btn_co_prod_pesqClick(btn_co_prod_pesq);
  end;
end;

end.
