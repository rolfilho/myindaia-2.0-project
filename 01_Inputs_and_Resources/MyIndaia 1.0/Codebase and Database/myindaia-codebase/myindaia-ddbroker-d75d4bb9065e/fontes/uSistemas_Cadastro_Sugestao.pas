unit uSistemas_Cadastro_Sugestao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Menus, Buttons, ExtCtrls, Grids,
  DBGrids, DB, DBTables,ADODB;

type
  Tfrm_cadastro_sugestao = class(TForm)
    db_dicas: TDBGrid;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    dbedt_manual: TDBEdit;
    dbedt_sistemas: TDBEdit;
    dbedt_rotina: TDBEdit;
    dbedt_modulo: TDBEdit;
    dbedt_titulo: TDBEdit;
    Label1: TLabel;
    mem_sugestao: TDBMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    dbedt_usuario: TDBEdit;
    Label7: TLabel;
    qry_dicas: TQuery;
    ds_dicas: TDataSource;
    dbedt_cd_usuario: TDBEdit;
    dbedt_cd_rotina: TDBEdit;
    dbedt_cd_modulo: TDBEdit;
    dbedt_cd_sistemas: TDBEdit;
    dlgOpenAnexo: TOpenDialog;
    Label8: TLabel;
    dbedt_codigo: TDBEdit;
    qry_dicasCD_SISTEMAS_DICAS: TIntegerField;
    qry_dicasCD_SISTEMAS: TIntegerField;
    qry_dicasCD_MODULO: TStringField;
    qry_dicasCD_ROTINA: TStringField;
    qry_dicasTX_TITULO_DICA: TStringField;
    qry_dicasNM_PATH_MANUAL: TStringField;
    qry_dicasCD_USUARIO_CRIADOR: TStringField;
    qry_dicasDT_INCLUSAO: TDateTimeField;
    qry_dicasNM_SISTEMA: TStringField;
    qry_dicasNM_MODULO: TStringField;
    qry_dicasNM_ROTINA: TStringField;
    up_dicas: TUpdateSQL;
    SpeedButton5: TSpeedButton;
    qry_dicasNM_USUARIO: TStringField;
    qry_dicasTX_TEXTO_DICA: TMemoField;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dge(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure ds_dicasDataChange(Sender: TObject; Field: TField);
    procedure dbedt_cd_moduloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   
    procedure dbedt_cd_rotinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure dbedt_cd_sistemasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_usuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qry_dicasAfterDelete(DataSet: TDataSet);
    procedure qry_dicasAfterPost(DataSet: TDataSet);
    procedure qry_dicasBeforePost(DataSet: TDataSet);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadastro_sugestao: Tfrm_cadastro_sugestao;

implementation

uses ConsOnLineEx, Funcoes, PGGP017;

{$R *.dfm}

function  codigo(qry: TAdoQuery; cod: string; qt: integer): string;
var cd: string;
begin
  try
    try
      if cod = '' then cod := '0';
      cd := IntToStr(StrToInt(cod) + 1);
    except
      cd := '';
    end;
    while length(cd) < qt do
      cd := '0' + cd;
    codigo := cd;
  except
    ShowMessage('Não foi possível incluir este regsistro !');
    qry.Cancel;
  end;
end;


procedure Tfrm_cadastro_sugestao.SpeedButton4Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if  qry_dicas.State in [dsBrowse, dsInactive] then qry_dicas.Edit;
      dbedt_cd_usuario.Text:= ConsultaOnLineEx('TUSUARIO','USUARIO',['CD_USUARIO,NM_USUARIO'],['Codigo','Nome'],'CD_USUARIO',nil);
      dbedt_usuario.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO',dbedt_cd_usuario.Text,'NM_USUARIO');
    end
    else
      dbedt_usuario.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO',dbedt_cd_usuario.Text,'NM_USUARIO');
end;

procedure Tfrm_cadastro_sugestao.SpeedButton2Click(Sender: TObject);
begin
  if dlgOpenAnexo.Execute then
  begin
    if qry_dicas.State in [dsbrowse] then
      qry_dicas.Edit;
      qry_dicasNM_PATH_MANUAL.AsString := dlgOpenAnexo.FileName;
  end;
end;

procedure Tfrm_cadastro_sugestao.SpeedButton1Click(Sender: TObject);
var
  verificar:string;
begin
  verificar :=dbedt_cd_modulo.Text;
  if Sender is TSpeedButton then
  begin
    if  qry_dicas.State in [dsBrowse, dsInactive] then qry_dicas.Edit;
    dbedt_cd_modulo.Text:= ConsultaOnLineEx('TMODULO','MÓDULO',['CD_MODULO,NM_MODULO'],['Codigo','Nome'],'CD_MODULO',nil);
    dbedt_modulo.Text := ConsultaLookUP('TMODULO','CD_MODULO',dbedt_cd_modulo.Text,'NM_MODULO');
   end
   else
   begin
     dbedt_modulo.Text := ConsultaLookUP('TMODULO','CD_MODULO',dbedt_cd_modulo.Text,'NM_MODULO');
   end;
  if not (dbedt_cd_modulo.Text=verificar) then
  begin
    dbedt_cd_rotina.Text:='';
    dbedt_rotina.Text:= '';
  end;
end;

procedure Tfrm_cadastro_sugestao.btn_excluirClick(Sender: TObject);
begin
  qry_dicas.Delete;
end;

procedure Tfrm_cadastro_sugestao.FormShow(Sender: TObject);
begin
  qry_dicas.Close;
  qry_dicas.Open;
end;

procedure Tfrm_cadastro_sugestao.dge(Sender: TObject);
var
  nome:string;
begin
  nome:= ConsultaLookUP('TUSUARIO','CD_USUARIO',dbedt_cd_usuario.Text,'NM_USUARIO');
  dbedt_usuario.Text:= nome;
end;

procedure Tfrm_cadastro_sugestao.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cadastro_sugestao.btn_cancelarClick(Sender: TObject);
begin
  qry_dicas.Cancel;
end;

procedure Tfrm_cadastro_sugestao.btn_incluirClick(Sender: TObject);
begin
  qry_dicas.insert;
  qry_dicasCD_SISTEMAS_DICAS.AsString:= ConsultaLookUPSQL('SELECT isnull(MAX(CD_SISTEMAS_DICAS),0)+1 CD_SISTEMAS_DICAS FROM TSISTEMAS_DICAS','CD_SISTEMAS_DICAS');
  dbedt_titulo.SetFocus;
end;

procedure Tfrm_cadastro_sugestao.btn_salvarClick(Sender: TObject);
begin
  if( dbedt_titulo.text='') or (dbedt_cd_usuario.Text='') or (mem_sugestao.Text='') then
  begin
    ShowMessage('Favor preencher os campos!!!');
  end
  else
  begin
    qry_dicas.Post;
    qry_dicas.Close;
    qry_dicas.Open;
    btn_salvar.Enabled:=false;
  end;
end;

procedure Tfrm_cadastro_sugestao.ds_dicasDataChange(Sender: TObject;
  Field: TField);
begin
  if qry_dicas.State in [dsedit,dsinsert] then
    btn_mi(False, True, True, False)
  else
    btn_mi(True, False, False, True);
end;

procedure Tfrm_cadastro_sugestao.dbedt_cd_moduloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  SpeedButton1Click(dbedt_cd_modulo);
end;

procedure Tfrm_cadastro_sugestao.dbedt_cd_rotinaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  SpeedButton3Click(dbedt_cd_rotina);
end;

procedure Tfrm_cadastro_sugestao.SpeedButton3Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if  qry_dicas.State in [dsBrowse, dsInactive] then qry_dicas.Edit;
    dbedt_cd_rotina.Text:= ConsultaOnLineEx('TMODULO_ROTINA','ROTINA',['CD_ROTINA,NM_ROTINA'],['Codigo','Nome'],'CD_ROTINA',nil);
    dbedt_rotina.Text := ConsultaLookUP('TMODULO_ROTINA','CD_ROTINA',dbedt_cd_rotina.Text,'NM_ROTINA');
  end
  else
    dbedt_rotina.Text := ConsultaLookUP('TMODULO_ROTINA','CD_ROTINA',dbedt_cd_rotina.Text,'NM_ROTINA');
end;


procedure Tfrm_cadastro_sugestao.SpeedButton5Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if  qry_dicas.State in [dsBrowse, dsInactive] then qry_dicas.Edit;
    dbedt_cd_sistemas.Text:= ConsultaOnLineEx('TSISTEMAS','SISTEMAS',['CD_SISTEMA,NM_SISTEMA'],['Codigo','Nome'],'CD_SISTEMA',nil);
    dbedt_sistemas.Text := ConsultaLookUP('TSISTEMAS','CD_SISTEMA',dbedt_cd_sistemas.Text,'NM_SISTEMA');
  end
  else
    dbedt_sistemas.Text := ConsultaLookUP('TSISTEMAS','CD_SISTEMA',dbedt_cd_sistemas.Text,'NM_SISTEMA');
end;

procedure Tfrm_cadastro_sugestao.dbedt_cd_sistemasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  SpeedButton5Click(dbedt_cd_sistemas);
end;

procedure Tfrm_cadastro_sugestao.dbedt_cd_usuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  SpeedButton4Click(dbedt_cd_usuario);
end;

procedure Tfrm_cadastro_sugestao.qry_dicasAfterDelete(DataSet: TDataSet);
begin
  qry_dicas.ApplyUpdates;
end;

procedure Tfrm_cadastro_sugestao.qry_dicasAfterPost(DataSet: TDataSet);
begin
  qry_dicas.ApplyUpdates;
end;

procedure Tfrm_cadastro_sugestao.qry_dicasBeforePost(DataSet: TDataSet);
begin
  qry_dicasDT_INCLUSAO.AsDateTime := Date;
end;

procedure Tfrm_cadastro_sugestao.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;
  btn_excluir.Enabled  := Exc;
  btn_salvar.Enabled   := Salv;
  btn_Cancelar.Enabled := Canc;
end;

end.
