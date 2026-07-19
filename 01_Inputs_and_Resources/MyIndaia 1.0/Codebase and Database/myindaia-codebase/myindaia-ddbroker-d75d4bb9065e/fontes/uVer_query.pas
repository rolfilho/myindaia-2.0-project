(*******************************************************************************
  Sistema    : MyIndaia - Indaiá Logística Internacional
  PROGRAMA   : uVer_query.Pas
  DATA       : 15/05/2011
  Manutenção : Utilitário de exibição do texto SQL das querys do sistema - by Carlos
               Tecla de Atalho - CTRL+ Y
*******************************************************************************)

unit uVer_query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, RxDBComb, RxLookup, RXDBCtrl, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxDBLookupComboBox, cxTextEdit, cxButtonEdit, cxCalendar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  Tfrm_ver_query = class(TForm)
    qTemp: TQuery;
    dsTemp: TDataSource;
    pnl_background: TPanel;
    memo_sql: TMemo;
    Label1: TLabel;
    pnl_Resultado: TPanel;
    dbGrid_Resultado: TDBGrid;
    Label6: TLabel;
    btn_fechar_result: TSpeedButton;
    pnl_topo: TPanel;
    btn_executa_query: TSpeedButton;
    SpeedButton1: TSpeedButton;
    pnl_field: TPanel;
    Label2: TLabel;
    pnl_query: TPanel;
    Label4: TLabel;
    sgParams: TStringGrid;
    edt_Query: TEdit;
    edt_Field: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure memo_sqlChange(Sender: TObject);
    procedure btn_executa_queryClick(Sender: TObject);
    procedure btn_fechar_resultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    strSQL:String;
    procedure Executa;
  public
    { Public declarations }
    form_ativo:TForm;
  end;

var
  frm_ver_query: Tfrm_ver_query;

implementation
uses PGGP017, ComObj, Contnrs;

{$R *.dfm}

procedure Tfrm_ver_query.FormCreate(Sender: TObject);
begin
  memo_sql.Clear;
  pnl_field.Visible:=False;
end;

procedure Tfrm_ver_query.memo_sqlChange(Sender: TObject);
begin
  if memo_sql.Lines.Count>0 then
     btn_executa_query.Enabled:=True
  else
     btn_executa_query.Enabled:=False;

end;

procedure Tfrm_ver_query.btn_executa_queryClick(Sender: TObject);
var
vlParam,nmParam:String;
i:Integer;
begin
  pnl_resultado.Visible:=False;
  sgParams.RowCount    :=0;

  qTemp.SQL.Clear;
  qTemp.SQL.Add(memo_SQL.Text);
  if POS(':', memo_SQL.Text)>0 then begin
     sgParams.Visible:=True;

     for i:=0 to qTemp.Params.Count-1 do begin
       nmParam:=upperCase(qTemp.Params[i].Name);
       if qTemp.ParamByName(nmParam).Value='' then begin
          vlParam:=InputBox('Informe o Parametro',nmParam,'');

          sgParams.RowCount:=i+1;
          sgParams.Cells[0,i]:=inttostr(i)+'-'+nmParam;
          sgParams.Cells[1,i]:=UpperCase(vlParam);

          qTemp.ParamByName(nmParam).Value:=vlParam;
       end;
       if vlParam='' then exit;
     end;
     
     sgParams.Row:=0;

   end else sgParams.Visible:=False;
   try
     qTemp.Open;
   except
      on E: Exception do
      begin
        ShowMessage('Erro de Sintaxe: '+#13+e.message);
      end;

   end;
   pnl_resultado.Visible:=True;
end;


procedure Tfrm_ver_query.Executa;
var
tem:Integer;
controle_ativo:TWinControl;
begin

   controle_ativo:=form_ativo.ActiveControl;

   pnl_resultado.Visible := False;
   edt_Query.Text     := '';
   edt_Field.Text     := '';

   tem:=0;
   if Controle_ativo is TDBGRID then begin
      try
         pnl_field.Visible:=False;
         edt_Query.Text:=TQuery(TDBGRID(Controle_ativo).DataSource.DataSet).GetNamePath;
         //
         strSQL:=TQuery(TDBGRID(Controle_ativo).DataSource.DataSet).SQL.Text;

         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBGRID(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBNavigator then begin
      try
         pnl_field.Visible:=False;
         edt_Query.Text:=TQuery(TDBNavigator(Controle_ativo).DataSource.DataSet).GetNamePath;
         //
         strSQL:=TQuery(TDBNavigator(Controle_ativo).DataSource.DataSet).SQL.Text;

         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBNavigator(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBEDIT  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBEDIT(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBEDIT(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBEDIT(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBEDIT(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBDATEEDIT  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBDATEEDIT(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBDATEEDIT(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBDATEEDIT(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBDATEEDIT(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;         

   if Controle_ativo is TDBMEMO   then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBMEMO(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBMEMO(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBMEMO(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBMEMO(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBCheckBox  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBCheckBox(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBCheckBox(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBCheckBox(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBCheckBox(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBComboBox  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBComboBox(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBComboBox(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBComboBox(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBComboBox(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBListBox  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBListBox(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBListBox(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBListBox(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBListBox(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBRadioGroup  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBRadioGroup(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBRadioGroup(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBRadioGroup(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBRadioGroup(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBImage  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBImage(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBImage(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBImage(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBImage(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBLookupComboBox  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBLookupComboBox(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBLookupComboBox(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBLookupComboBox(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBLookupComboBox(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBLookupListBox  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBLookupListBox(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBLookupListBox(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBLookupListBox(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBLookupListBox(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TDBRichEdit  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TDBRichEdit(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TDBRichEdit(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TDBRichEdit(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TDBRichEdit(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   {Palheta RX}
   if Controle_ativo is TrxDBGRID then begin
      try
         pnl_field.Visible:=False;
         edt_Query.Text:=TQuery(TrxDBGRID(Controle_ativo).DataSource.DataSet).GetNamePath;
         //
         strSQL:=TQuery(TrxDBGRID(Controle_ativo).DataSource.DataSet).SQL.Text;

         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TrxDBGRID(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;


   if Controle_ativo is TRXDBComboBox  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TRXDBComboBox(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TRXDBComboBox(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TRXDBComboBox(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TRXDBComboBox(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TrxDBLookupList  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TrxDBLookupList(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TrxDBLookupList(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TrxDBLookupList(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TrxDBLookupList(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if Controle_ativo is TrxDBLookupCombo  then begin
      try
         pnl_field.Visible :=True;
         edt_Query.Text :=TQuery(TrxDBLookupCombo(Controle_ativo).DataSource.DataSet).GetNamePath;
         edt_Field.Text :=TrxDBLookupCombo(Controle_ativo).DataField;
         //
         strSQL:=TQuery(TrxDBLookupCombo(Controle_ativo).DataSource.DataSet).SQL.Text;
         memo_sql.Clear;
         memo_sql.Lines.Add( strSQL );
         tem:=1;
      except
         edt_Query.Text:='Objeto da Classe: '+TrxDBLookupCombo(Controle_ativo).DataSource.Dataset.ClassName+' informações limitada!';
         tem:=2;
      end;
   end;

   if tem=0 then begin
      Height:=65;
      pnl_field.Visible :=True;
      edt_Query.Text :='DataSource não encontrado!';
      edt_Field.Text :='da classe '+UpperCase(Controle_ativo.ClassName);
      memo_sql.Text:='';
      btn_executa_query.Visible:=False;

   end;

   if tem=2 then begin
      Height:=65;
      if edt_Query.Text='' then
         edt_Query.Text :='Não foi possivel capturar as informações';

      memo_sql.Text:='';
      btn_executa_query.Visible:=False;

   end;

end;

procedure Tfrm_ver_query.btn_fechar_resultClick(Sender: TObject);
begin
   pnl_resultado.Visible := False;
end;

procedure Tfrm_ver_query.FormShow(Sender: TObject);
begin
  if form_ativo=nil then
     form_ativo:=frm_ver_query;

  Caption:='Verifica SQL Query - '+form_ativo.Name;
  executa;

end;

procedure Tfrm_ver_query.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ver_query.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  qTemp.Close;
end;

procedure Tfrm_ver_query.FormActivate(Sender: TObject);
begin
   if Height=65 then
      frm_ver_query.BorderIcons:=[biSystemMenu];
end;

end.
