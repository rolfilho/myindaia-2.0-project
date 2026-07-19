unit uReAnexoFabric;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, Db, DbTables;

type
  Tfrm_re_anexo_fabric = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btn_sair: TSpeedButton;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    pnlInclusao: TPanel;
    Shape16: TShape;
    Label12: TLabel;
    edt_cd_fabricante: TDBEdit;
    Label2: TLabel;
    edt_nm_fabricante: TEdit;
    btn_co_fabricante: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Shape36: TShape;
    Label82: TLabel;
    dbQTD: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Shape1: TShape;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_cd_fabricanteExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbQTDEnter(Sender: TObject);
    procedure selecionaALL(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_re_anexo_fabric: Tfrm_re_anexo_fabric;

implementation

uses dReCapa, ConsOnLineEx, FuncoesExport,funcoes;

{$R *.DFM}

procedure Tfrm_re_anexo_fabric.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  datm_re_capa.qry_re_anexo_fabric.Close;
// Action := caFree;
end;

procedure Tfrm_re_anexo_fabric.btn_sairClick(Sender: TObject);
begin
  if datm_re_capa.qry_re_anexo_fabric.State in [dsInsert, dsEdit] then
    MessageDlg('Você está em modo de edição. Favor gravar antes de fechar.', mtInformation, [mbOk], 0)
  else
    Close;
end;

procedure Tfrm_re_anexo_fabric.btn_co_fabricanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    edt_cd_fabricante.Text := ConsultaOnLineExSQL(
                                                       ' SELECT CD_EMPRESA,NM_EMPRESA,CGC_EMPRESA'+
                                                       ' FROM TEMPRESA_NAC'+
                                                       ' WHERE IN_ATIVO = "1"',
                                                       'Fabricantes / Fornecedores', ['CD_EMPRESA','NM_EMPRESA','CGC_EMPRESA'], ['Código','Nome','Cnpj'], 'CD_EMPRESA');
    datm_re_capa.qry_re_anexo_fabric.FieldByname('CD_FABRICANTE').AsString := edt_cd_fabricante.Text;
  end else
    edt_nm_fabricante.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_fabricante.Text, 'NM_EMPRESA');
end;

procedure Tfrm_re_anexo_fabric.btn_incluirClick(Sender: TObject);
begin
  DBGrid1.Enabled := False;
  pnlInclusao.Visible := True;
  datm_re_capa.qry_re_anexo_fabric.Insert;
  datm_re_capa.qry_re_anexo_fabric.FieldByName('NR_PROCESSO').AsString  := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
  datm_re_capa.qry_re_anexo_fabric.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString  := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
  datm_re_capa.qry_re_anexo_fabric.FieldByName('CD_RE_ANEXO').AsInteger := datm_re_capa.qry_re_anexo.FieldByName('CD_RE_ANEXO').AsInteger;

  with TQuery.Create(application) do
  begin
    Close;
    DatabaseName := 'DBBROKER';
    SQL.Add('SELECT ISNULL(MAX(CD_RE_ANEXO_FABRIC), 0) ');
    SQL.Add('FROM TRE_ANEXO_FABRIC ');
    SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO').AsString));
    SQL.Add('AND NR_PROCESSO_COMPLEMENTO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString));
    SQL.Add('AND CD_RE_ANEXO = ' + QuotedStr(IntToStr(datm_re_capa.qry_re_anexo.FieldByname('CD_RE_ANEXO').AsInteger)));
    Prepare;
    Open;

    if not IsEmpty then
      datm_re_capa.qry_re_anexo_fabricCD_RE_ANEXO_FABRIC.AsInteger := Fields[0].AsInteger + 1
    else
      datm_re_capa.qry_re_anexo_fabric.FieldByName('CD_RE_ANEXO_FABRIC').AsInteger := 1;
    Free;
  end;

  edt_cd_fabricante.SetFocus;
end;

procedure Tfrm_re_anexo_fabric.btn_salvarClick(Sender: TObject);
var
str_CD_FABRIC:String;
begin
  DBGrid1.Enabled := True;
  pnlInclusao.Visible := False;
  with datm_re_capa.qry_re_anexo_fabric do
  begin
    if (FieldByName('CD_FABRICANTE').AsString = '') or (FieldByName('CD_FABRICANTE').IsNull) or
//       (FieldByName('NR_ATO').AsString = '')        or (FieldByName('NR_ATO').IsNull) or
       (FieldByName('QT_MERCADORIA').AsString = '') or (FieldByName('QT_MERCADORIA').IsNull) or
       (FieldByName('VL_TOTAL').AsString = '')      or (FieldByName('VL_TOTAL').IsNull) then
      MessageDlg('Preencha todos os campos antes de salvar!', mtInformation, [mbOk], 0)
    else
    begin

      str_CD_FABRIC:=ConsultaLookUPSQL('SELECT CD_EMPRESA  FROM TEMPRESA_NAC WHERE CD_EMPRESA = "' +FieldByName('CD_FABRICANTE').AsString+'"','CD_EMPRESA');
      if str_CD_Fabric='' then begin
         ShowMessage('Fabricante não Cadastrado!!!');
         exit;
      end else Post;

      Close;
      ParamByname('NR_PROCESSO').AsString   := datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO').AsString;
      ParamByname('NR_PROCESSO_COMPLEMENTO').AsString   := datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString;
      ParamByname('CD_RE_ANEXO').AsInteger  := datm_re_capa.qry_re_anexo.FieldByname('CD_RE_ANEXO').AsInteger;
      Open;
    end;
  end;
end;

procedure Tfrm_re_anexo_fabric.btn_cancelarClick(Sender: TObject);
begin
  DBGrid1.Enabled := true;
  pnlInclusao.Visible := False;
  datm_re_capa.qry_re_anexo_fabric.Cancel;
  datm_re_capa.qry_re_anexo_fabric.Close;
  datm_re_capa.qry_re_anexo_fabric.ParamByname('NR_PROCESSO').AsString   := datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO').AsString;
  datm_re_capa.qry_re_anexo_fabric.ParamByname('CD_RE_ANEXO').AsInteger  := datm_re_capa.qry_re_anexo.FieldByname('CD_RE_ANEXO').AsInteger;
  datm_re_capa.qry_re_anexo_fabric.Open;
end;

procedure Tfrm_re_anexo_fabric.btn_excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja realmente excluir o Fabricante selecionado ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)  and
     (not datm_re_capa.qry_re_anexo_fabric.IsEmpty)  then
    datm_re_capa.qry_re_anexo_fabric.Delete;
end;

procedure Tfrm_re_anexo_fabric.edt_cd_fabricanteExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_re_anexo_fabric.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//by carlos
//   if ((DBGrid1.Columns.Items[DBGrid1.SelectedIndex].FieldName = 'VL_TOTAL') and ((key = VK_TAB) or (key = VK_RIGHT))) or
//     (key = VK_DOWN) or (key = VK_UP) then
//      key := 0;

   //Induzir o usuario a clicar no botão de novo                   PGUP (33)            PGDN (34)
   if (key = VK_DOWN) or (key = VK_UP) or (key = VK_INSERT) or (key = VK_PRIOR ) or (key = VK_NEXT ) then
      key := 0;


end;

procedure Tfrm_re_anexo_fabric.dbQTDEnter(Sender: TObject);
begin

  dbQTD.Text:=StringReplace(dbQTD.Text,'.','',[rfReplaceAll]);

end;

procedure Tfrm_re_anexo_fabric.selecionaALL(Sender: TObject);
begin
  TDBEdit(sender).SelectAll;
end;

end.
