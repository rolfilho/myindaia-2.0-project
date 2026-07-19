{
Finalidade : Cadastrar codigos de declarações de certificado de origem que não tenham vindo do Robô
Programador: Carlos
Data       : Mar/2009
}


unit uDeclaracoes_Fiesp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBCtrls, StdCtrls, RxDBComb, Mask, Buttons, ExtCtrls,
  Grids, DBGrids, ComCtrls, DB, DBTables, ToolEdit, RXDBCtrl;

type
  Tfrm_Declaracoes_Fiesp = class(TForm)
    pgctrl_fiesp: TPageControl;
    ts_lista: TTabSheet;
    dbg_declaracoes: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_btn_ag: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    nvg_declaracoes: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    qry_declaracoes: TQuery;
    qry_declaracoesCD_EMPRESA: TStringField;
    qry_declaracoesCD_ACORDO_FIESP: TStringField;
    qry_declaracoesCD_ACORDO_BROKER: TStringField;
    qry_declaracoesCD_DECLARACAO: TStringField;
    qry_declaracoesCD_NCM_NALADI: TStringField;
    qry_declaracoesDT_VALIDADE: TDateTimeField;
    qry_declaracoesIN_ATIVO: TStringField;
    ds_declaracoes: TDataSource;
    pFiltro: TPanel;
    Label2: TLabel;
    lbl_NCM_NALADI: TLabel;
    edt_ncm_naladi: TEdit;
    cb_acordos: TComboBox;
    qry_declaracoesDT_ATUALIZACAO: TDateTimeField;
    pnl_Empresa: TPanel;
    edt_cd_exportador: TEdit;
    edt_nm_exportador: TEdit;
    btn_co_exportador: TSpeedButton;
    edt_cnpj: TMaskEdit;
    Label5: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    qry_declaracoesTX_IN_ATIVO: TStringField;
    Label8: TLabel;
    cb_Status: TComboBox;
    qry_declaracoesIN_RENOVA_WS: TStringField;
    qry_declaracoescalc_renova_ws: TStringField;
    cbVencimento: TCheckBox;
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    db_classificacao: TDBEdit;
    db_Acordo: TRxDBComboBox;
    db_validade: TDBDateEdit;
    db_cd_declaracao: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure btn_sairClick(Sender: TObject);
    procedure Filtro(Sender: TObject);
    procedure Somente_Numeros(Sender: TObject; var Key: Char);
    procedure edt_ncm_naladiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qry_declaracoesBeforePost(DataSet: TDataSet);
    procedure ds_declaracoesDataChange(Sender: TObject; Field: TField);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure qry_declaracoesBeforeDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qry_declaracoesNewRecord(DataSet: TDataSet);
    function declaracao_existente(CD_EMPRESA, CD_ACORDO_BROKER, CD_NCM_NALADI, CD_DECLARACAO : String ):Boolean;
    procedure pgctrl_fiespChange(Sender: TObject);
    procedure pgctrl_fiespChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure qry_declaracoesCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbg_declaracoesDblClick(Sender: TObject);
    procedure edt_cd_exportadorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     st_modificar ,     st_incluir  ,  st_excluir : Boolean;

  end;

var
  frm_Declaracoes_Fiesp: Tfrm_Declaracoes_Fiesp;

implementation
Uses  ConsOnLineEx , Funcoes ;
 
{$R *.dfm}

procedure Tfrm_Declaracoes_Fiesp.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Declaracoes_Fiesp.Filtro(Sender: TObject);
var
str_acordo,str_status,str_vencimento:String;
begin
  str_acordo:=cb_acordos.Text;      //cb_acordos.Items[cb_acordos.ItemIndex];
  //
  str_status:=cb_status.Text;
  if cb_status.ItemIndex<>0 then
     str_status:=copy(str_status,1,1);

  if cbVencimento.Checked then
     str_vencimento:=DateToStr((date+30))
  else
     str_vencimento:='';
     
  qry_declaracoes.Close;
  qry_declaracoes.ParamByName('cd_empresa').AsString    := edt_cd_exportador.Text;
  qry_declaracoes.ParamByName('cd_acordo').AsString     := str_acordo;
  qry_declaracoes.ParamByName('cd_ncm_naladi').AsString := edt_ncm_naladi.Text;
  qry_declaracoes.ParamByName('IN_ATIVO').AsString      := str_Status;
  qry_declaracoes.ParamByName('VENCIMENTO').AsString    := str_vencimento;
  qry_declaracoes.Open;
end;

procedure Tfrm_Declaracoes_Fiesp.Somente_Numeros(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9',#8,#13,#27]) then begin
     ShowMessage('Digite Somente Numeros(sem pontos , barras ou hifens. )');
     abort;
  end;
end;

procedure Tfrm_Declaracoes_Fiesp.edt_ncm_naladiKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if chr(key)=chr(13) then
     filtro(sender);

end;

procedure Tfrm_Declaracoes_Fiesp.qry_declaracoesBeforePost(
  DataSet: TDataSet);
  var
  cd_acordo_fiesp:String;
begin
  if qry_declaracoesCD_EMPRESA.AsString='' then begin
     Showmessage('Informe a Empresa Exportadora');
     edt_cd_exportador.SetFocus;
     abort;
  end;

  if qry_declaracoesCD_ACORDO_BROKER.AsString='' then begin
     Showmessage('Informe um Acordo');
     db_Acordo.SetFocus;
     abort;
  end;

  if qry_declaracoesCD_NCM_NALADI.AsString='' then begin
     Showmessage('Informe a Classificação( NCM ou NALADI) ');
     db_classificacao.SetFocus;
     abort;
  end;

  if length(qry_declaracoesCD_DECLARACAO.AsString)<>10 then begin
     Showmessage('Código da Declaração Inválido !! ');
     db_cd_declaracao.SetFocus;
     abort;
  end;

  if copy(qry_declaracoesCD_DECLARACAO.AsString,1,1)<>'D' then begin
     Showmessage('Código da Declaração deve Iniciar com a letra "D" !! ');
     db_cd_declaracao.SetFocus;
     abort;
  end;

  if qry_declaracoesDT_VALIDADE.AsString='' then begin
     Showmessage('Informe a Validade do Código da Declaração');
     db_validade.SetFocus;
     abort;
  end;


  cd_acordo_fiesp:=dePara('01','02','26',qry_declaracoesCD_ACORDO_BROKER.AsString);

  if cd_acordo_fiesp='' then begin
     Showmessage('Não foi Encontrado o Acordo correspondente da FIESP !!');
     db_Acordo.SetFocus;
     abort;
  end;

  qry_declaracoesCD_ACORDO_FIESP.AsString:=cd_acordo_fiesp;

  if qry_declaracoes.State in [dsInsert] then begin
     qry_declaracoesDT_ATUALIZACAO.AsDateTime:=now;


     if declaracao_existente(qry_declaracoesCD_EMPRESA.AsString,
                                qry_declaracoesCD_ACORDO_BROKER.AsString,
                                qry_declaracoesCD_NCM_NALADI.AsString,
                                qry_declaracoesCD_DECLARACAO.AsString ) then  begin

        Showmessage('Declaração já Cadastrada!!');
        db_cd_declaracao.SetFocus;
        abort;
     end;
  end;
end;

procedure Tfrm_Declaracoes_Fiesp.ds_declaracoesDataChange(Sender: TObject;
  Field: TField);
begin
   if qry_declaracoes.State in [dsEdit,dsInsert] then begin
      btn_incluir.Enabled     := False;
      btn_excluir.Enabled     := False;
      nvg_declaracoes.Enabled := False;
      btn_salvar.Enabled      := True;
      btn_Cancelar.Enabled    := True
   end else begin
      if qry_declaracoes.Eof then
        btn_excluir.Enabled  := false
      else
       if  st_excluir then
           btn_excluir.Enabled  := true;


      if st_incluir then
         btn_incluir.Enabled  := True;

      nvg_declaracoes.Enabled := True;
      btn_salvar.Enabled      := False;
      btn_Cancelar.Enabled    := False
   end;
end;

procedure Tfrm_Declaracoes_Fiesp.btn_incluirClick(Sender: TObject);
begin
  if edt_nm_exportador.Text='' then begin
     ShowMessage('Selecione um Exportador antes de Incluir uma declaração!');
     pgctrl_fiesp.ActivePageIndex:=0;
     abort;
  end;
  pgctrl_fiesp.ActivePageIndex:=1;
  db_acordo.SetFocus;

  qry_declaracoes.Insert;

end;

procedure Tfrm_Declaracoes_Fiesp.btn_salvarClick(Sender: TObject);
begin
  qry_declaracoes.Post;
end;

procedure Tfrm_Declaracoes_Fiesp.btn_cancelarClick(Sender: TObject);
begin
  qry_declaracoes.Cancel;
end;

procedure Tfrm_Declaracoes_Fiesp.btn_excluirClick(Sender: TObject);
begin
  qry_declaracoes.Delete;
end;

procedure Tfrm_Declaracoes_Fiesp.qry_declaracoesBeforeDelete(
  DataSet: TDataSet);
begin
  if MessageDlg('Deseja realmente excluir essa Declaração ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     abort;

  pgctrl_fiesp.ActivePageIndex:=1;  
end;

procedure Tfrm_Declaracoes_Fiesp.FormShow(Sender: TObject);
begin
  qry_declaracoes.Open;
  edt_cd_exportador.SetFocus;  
end;

procedure Tfrm_Declaracoes_Fiesp.qry_declaracoesNewRecord(
  DataSet: TDataSet);
begin
  qry_declaracoesCD_EMPRESA.AsString       := edt_cd_exportador.Text;
  qry_declaracoesCD_NCM_NALADI.AsString    := db_classificacao.Text;
  if cb_acordos.Text<>'TODOS' then
     qry_declaracoesCD_ACORDO_BROKER.AsString := cb_acordos.Text;
end;

function Tfrm_Declaracoes_Fiesp.declaracao_existente(CD_EMPRESA,  CD_ACORDO_BROKER, CD_NCM_NALADI, CD_DECLARACAO: String): Boolean;
begin
   with TQuery.Create(Application) do begin
     DataBaseName := 'DBBROKER';
     SQL.Clear;
     Sql.Add(' select count(1) from TDECLARACOES_FIESP ');
     Sql.Add(' WHERE CD_EMPRESA     = :CD_EMPRESA ');
     Sql.Add(' AND CD_ACORDO_BROKER = :CD_ACORDO_BROKER ');
     Sql.Add(' AND CD_NCM_NALADI    = :CD_NCM_NALADI ');
     Sql.Add(' AND CD_DECLARACAO    = :CD_DECLARACAO ');
     ParamByName('CD_EMPRESA').AsString       := CD_EMPRESA;
     ParamByName('CD_ACORDO_BROKER').AsString := CD_ACORDO_BROKER;
     ParamByName('CD_NCM_NALADI').AsString    := CD_NCM_NALADI;
     ParamByName('CD_DECLARACAO').AsString    := CD_DECLARACAO;
     Open;
     Result:=(fields[0].AsInteger>0);
     close;
     Free;
   end;
end;

procedure Tfrm_Declaracoes_Fiesp.pgctrl_fiespChange(Sender: TObject);
begin
  if qry_declaracoes.Eof then begin
     ShowMessage('selecione uma declaração ou inclua uma nova!!');
     pgctrl_fiesp.ActivePageIndex:=0;
     abort;
  end;

  pnl_empresa.Enabled:=(pgctrl_fiesp.ActivePageIndex=0);

end;

procedure Tfrm_Declaracoes_Fiesp.pgctrl_fiespChanging(Sender: TObject;
  var AllowChange: Boolean);
begin  
  if qry_declaracoes.State in [dsEdit,dsInsert] then
     if MessageDlg('Deseja Sair sem Salvar ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        AllowChange:=false
     else
        qry_declaracoes.Cancel;
        
end;

procedure Tfrm_Declaracoes_Fiesp.qry_declaracoesCalcFields(
  DataSet: TDataSet);
begin
  qry_declaracoesTX_IN_ATIVO.AsString:=IIF(qry_declaracoesIN_ATIVO.AsString='1','ATIVO','NÃO ATIVO');
  if qry_declaracoesIN_RENOVA_WS.AsString='1' then
     qry_declaracoesCalc_Renova_Ws.AsString:='SIM'
  else
     qry_declaracoesCalc_Renova_Ws.AsString:=' - ';
end;

procedure Tfrm_Declaracoes_Fiesp.FormCreate(Sender: TObject);
begin
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  if not(st_modificar) then
     ds_Declaracoes.AutoEdit:=false;

   WindowState:=wsMaximized;
   
end;

procedure Tfrm_Declaracoes_Fiesp.dbg_declaracoesDblClick(Sender: TObject);
begin
  if dbg_declaracoes.SelectedIndex=5 then begin
     pgctrl_fiesp.ActivePageIndex:=1;
     pgctrl_fiespChange(self);
  end;




  if dbg_declaracoes.SelectedIndex=6 then begin
     if qry_declaracoesDT_VALIDADE.AsDateTime>date+30 then begin
       showmessage('Não há necessidade renovar esta declaração, validade ainda vigente.');
       exit;
     end;

     if qry_declaracoesIN_ATIVO.AsString<>'1' then begin
       showmessage('Declaração não está Ativa.');
       exit;
     end;

     qry_declaracoes.Edit;
     if qry_declaracoesIN_RENOVA_WS.AsString='1' then
        qry_declaracoesIN_RENOVA_WS.AsString:='0'
     else
        qry_declaracoesIN_RENOVA_WS.AsString:='1';
     qry_declaracoes.Post;
  end;


end;

procedure Tfrm_Declaracoes_Fiesp.edt_cd_exportadorExit(Sender: TObject);
begin
  edt_cd_exportador.Text := Copy('00000', 1, 5 - Length( edt_cd_exportador.Text)) +  edt_cd_exportador.Text;
  if Sender is TSpeedButton then begin
    edt_cd_exportador.Text := ConsultaOnLineExFiltro('TEMPRESA_NAC','Exportador',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA','CGC_EMPRESA'],['Código','Nome','Apelido','CNPJ'],'CD_EMPRESA','IN_EXPORTADOR=1 AND ISNULL(CGC_EMPRESA,"")<>"" ',nil);
    edt_cd_exportadorExit(self);
  end else begin
    edt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador.Text, 'NM_EMPRESA');
    edt_cnpj.Text          := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador.Text, 'CGC_EMPRESA');
    filtro(self);
  end;


end;

end.
