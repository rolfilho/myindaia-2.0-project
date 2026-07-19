unit uCadNcmPisCofins;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, DBTables;

type
  Tfrm_ncm_pis_cofins = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dbg_conta: TDBGrid;
    TabSheet2: TTabSheet;
    pnl_cnt: TPanel;
    menu_cadastro: TMainMenu;
    cmdIncluirM: TMenuItem;
    cmdSalvarM: TMenuItem;
    cmdCancelarM: TMenuItem;
    cmdExcluirM: TMenuItem;
    cmdSairM: TMenuItem;
    qry_ncm_pis_cofins_: TQuery;
    qry_ncm_pis_cofins_ALIQ_PIS: TFloatField;
    qry_ncm_pis_cofins_ALIQ_COFINS: TFloatField;
    ds_ncm_pis_cofins: TDataSource;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    qrylista: TQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    ds_lista: TDataSource;
    qry_ncm_pis_cofins_NCM: TStringField;
    qry_ncm_pis_cofins_CAPITULO: TStringField;
    qrylistaNCM: TStringField;
    qrylistaCAPITULO: TStringField;
    dbmemo_complemento: TDBMemo;
    Label87: TLabel;
    btn_co_obs: TSpeedButton;
    qry_ncm_pis_cofins_TX_ARTIGO: TMemoField;
    pnl_cadastro: TPanel;
    cmdIncluir: TSpeedButton;
    cmdExcluir: TSpeedButton;
    cmdSair: TSpeedButton;
    cmdSalvar: TSpeedButton;
    cmdCancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure cmdIncluirClick(Sender: TObject);
    procedure cmdSalvarClick(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
    procedure cmdExcluirClick(Sender: TObject);
    procedure cmdSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ds_ncm_pis_cofinsStateChange(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure qry_ncm_pis_cofins_BeforePost(DataSet: TDataSet);
    procedure btn_co_obsClick(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir   : boolean;
    cd_acesso, cd_aux : String[1];
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Localiza( Query : TQuery; Chave : String; Campo : String );

  public
    lNaoConsiste : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_ncm_pis_cofins: Tfrm_ncm_pis_cofins;

implementation

uses PGSM094, GSMLIB, PGGP001, PGGP017, PGSM041, PGSM096, PGSM148, PGSM006;

{$R *.DFM}

procedure Tfrm_ncm_pis_cofins.cmdIncluirClick(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
    qry_ncm_pis_cofins_.Close;
    qry_ncm_pis_cofins_.SQL.Clear;
    qry_ncm_pis_cofins_.SQL.Add('SELECT * FROM TNCM_PIS_COFINS');
    qry_ncm_pis_cofins_.Open;
  end;
  qry_ncm_pis_cofins_.Insert;
  PageControl1.ActivePage := TabSheet2;
  DBEdit1.SetFocus;
end;

procedure Tfrm_ncm_pis_cofins.cmdSalvarClick(Sender: TObject);
begin
  try
    if PageControl1.ActivePage = TabSheet1 then
    begin
      qry_ncm_pis_cofins_.Close;
      qry_ncm_pis_cofins_.SQL.Clear;
      qry_ncm_pis_cofins_.SQL.Add('SELECT * FROM TNCM_PIS_COFINS');
      qry_ncm_pis_cofins_.SQL.Add('WHERE NCM = ''' + qryLista.FieldByName('NCM').AsString + ' AND CAPITULO'+ qryLista.FieldByName('CAPITULO').AsString +'''');
      qry_ncm_pis_cofins_.Open;
    end;
    qry_ncm_pis_cofins_.Post;
    qryLista.Close;
    qryLista.open;
    PageControl1.ActivePage := TabSheet1;
  except
   on E: Exception do
    begin
      TrataErro(E);
      qry_ncm_pis_cofins_.Cancel;
    end;
  end;
end;

procedure Tfrm_ncm_pis_cofins.cmdCancelarClick(Sender: TObject);
begin
 qry_ncm_pis_cofins_.Cancel;
 PageControl1.ActivePage := TabSheet1;
end;



procedure Tfrm_ncm_pis_cofins.cmdExcluirClick(Sender: TObject);
begin
  try
    qry_ncm_pis_cofins_.Close;
    qry_ncm_pis_cofins_.SQL.Clear;
    qry_ncm_pis_cofins_.SQL.Add('SELECT * FROM TNCM_PIS_COFINS ');
    qry_ncm_pis_cofins_.SQL.Add('WHERE NCM = "' + qryLista.FieldByName('NCM').AsString  + '" AND CAPITULO = "' + qryLista.FieldByName('CAPITULO').AsString+'"');
    qry_ncm_pis_cofins_.Open;
    if MessageDlg('Confirma exclusão deste registro de NCM?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
       qry_ncm_pis_cofins_.Delete;
       qry_ncm_pis_cofins_.Close;
       qryLista.Close;
       qryLista.open;
       if PageControl1.ActivePage = TabSheet2 then
       begin
         qry_ncm_pis_cofins_.Close;
         qry_ncm_pis_cofins_.SQL.Clear;
         qry_ncm_pis_cofins_.SQL.Add('SELECT * FROM TNCM_PIS_COFINS');
         qry_ncm_pis_cofins_.SQL.Add('WHERE NCM = ''' + qryLista.FieldByName('NCM').AsString + ' AND CAPITULO = ' + qryLista.FieldByName('CAPITULO').AsString+'''');
         qry_ncm_pis_cofins_.Open;
       end;
    end;
  except
   on E: Exception do
    begin
      TrataErro(E);
      qry_ncm_pis_cofins_.Cancel;
    end;
  end;

end;

procedure Tfrm_ncm_pis_cofins.cmdSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ncm_pis_cofins.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
end;

procedure Tfrm_ncm_pis_cofins.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_ncm_pis_cofins.ds_ncm_pis_cofinsStateChange(
  Sender: TObject);
begin
  if frm_ncm_pis_cofins = nil then Exit;
  with frm_ncm_pis_cofins do begin
    cmdIncluir.Enabled      := (ds_ncm_pis_cofins.State = dsBrowse);
    cmdIncluirM.Enabled     := (ds_ncm_pis_cofins.State = dsBrowse);
    cmdSalvar.Enabled       := (ds_ncm_pis_cofins.State in [dsEdit, dsInsert]);
    cmdSalvarM.Enabled      := (ds_ncm_pis_cofins.State in [dsEdit, dsInsert]);
    cmdCancelar.Enabled     := (ds_ncm_pis_cofins.State in [dsEdit, dsInsert]);
    cmdCancelarM.Enabled    := (ds_ncm_pis_cofins.State in [dsEdit, dsInsert]);
    cmdExcluir.Enabled      := ((ds_ncm_pis_cofins.State = dsBrowse) and (not qry_ncm_pis_cofins_.IsEmpty));
    cmdExcluirM.Enabled     := ((ds_ncm_pis_cofins.State = dsBrowse) and (not qry_ncm_pis_cofins_.IsEmpty));
  end;

end;

procedure Tfrm_ncm_pis_cofins.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
(*   if PageControl1.ActivePage = TabSheet1 then
   begin
     qry_ncm_pis_cofins_.Close;
     qry_ncm_pis_cofins_.SQL.Clear;
     qry_ncm_pis_cofins_.SQL.Add('SELECT * FROM TNCM_PIS_COFINS');
     qry_ncm_pis_cofins_.SQL.Add(' WHERE NCM = "' + qryLista.FieldByName('NCM').AsString + '" AND CAPITULO = "' + qryLista.FieldByName('CAPITULO').AsString+'"');
     qry_ncm_pis_cofins_.Open;
   //  SHOWMESSAGE (qry_ncm_pis_cofins_.SQL.TEXT);
    // SHOWMESSAGE (INTTOSTR(qry_ncm_pis_cofins_.RECORDCOUNT));

   end; *)

   if PageControl1.ActivePage = TabSheet1 then
   begin
     qry_ncm_pis_cofins_.Close;
     qry_ncm_pis_cofins_.SQL.Clear;
     qry_ncm_pis_cofins_.SQL.Add('SELECT * FROM TNCM_PIS_COFINS');
     qry_ncm_pis_cofins_.SQL.Add(' WHERE (NCM = "' + qryLista.FieldByName('NCM').AsString + '" OR NCM IS NULL )  AND (CAPITULO = "' + qryLista.FieldByName('CAPITULO').AsString+'" OR CAPITULO IS NULL)');
   //  SHOWMESSAGE (qry_ncm_pis_cofins_.SQL.TEXT);
     qry_ncm_pis_cofins_.Open;
 
    // SHOWMESSAGE (INTTOSTR(qry_ncm_pis_cofins_.RECORDCOUNT));
 
   end   
end;

procedure Tfrm_ncm_pis_cofins.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  ds_ncm_pis_cofinsStateChange(nil);

  qryLista.Close;
  qryLista.SQl.Clear;
  qryLista.SQL.Add('SELECT * FROM TNCM_PIS_COFINS');
  qryLista.SQL.Add(' ORDER BY NCM');
  qryLista.Prepare;
  qryLista.Open;

{  qryCfop.Close;
  qryCfop.SQL.Clear;
  qryCfop.SQL.Add('SELECT * FROM TCfop');
  qryCfop.SQL.Add('WHERE CD_Cfop = ''' + qryLista.FieldByName('CD_Cfop').AsString + '''');
  qryCfop.Prepare;
  qryCfop.Open;}

  cmdIncluir.Enabled := True;
  cmdIncluirM.Enabled := True;
  cmdExcluir.Enabled := True;
  cmdExcluirM.Enabled := True;

  cb_ordem.itemIndex := 0;
end;

procedure Tfrm_ncm_pis_cofins.edt_chaveChange(Sender: TObject);
begin
 if  cb_ordem.itemIndex = 0 then
    Localiza(qryLista, edt_chave.Text, 'NCM')
 else Localiza(qryLista, edt_chave.Text, 'CAPITULO');
end;


procedure Tfrm_ncm_pis_cofins.Localiza( Query : TQuery; Chave : String; Campo : String );
begin
  if Chave = '' then Query.First
  else
  begin
    try
       Query.Locate(Campo, Chave, [loCaseInsensitive, loPartialKey]);
    except
      ShowMessage('Chave inválida!');
    end;
  end;
end;


procedure Tfrm_ncm_pis_cofins.qry_ncm_pis_cofins_BeforePost(
  DataSet: TDataSet);
begin
  if qry_ncm_pis_cofins_.FieldByName('CAPITULO').AsString = '' then
    qry_ncm_pis_cofins_.FieldByName('CAPITULO').AsString := '0000';
  if qry_ncm_pis_cofins_.FieldByName('NCM').AsString = '' then
    qry_ncm_pis_cofins_.FieldByName('NCM').AsString := '00000000';
end;



procedure Tfrm_ncm_pis_cofins.btn_co_obsClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_observacoes, frm_observacoes );
  frm_observacoes.Cons_OnLine := qry_ncm_pis_cofins_TX_ARTIGO;
  with frm_observacoes do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

end.

