unit PGGP020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, StdCtrls, DBCtrls, Buttons, ExtCtrls, PGGP001,
  DBTables, Funcoes;

type
  Tfrm_consulta_previsao = class(TForm)
    pnl_consulta_previsao: TPanel;
    btn_fechar: TSpeedButton;
    DBNavigator1: TDBNavigator;
    pnl_cadastro2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cb_ordem: TComboBox;
    edt_chave: TEdit;
    dbg_cadastro: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_Previsao : String[11];
    Cons_OnLine : TStringField;
    str_cd_unid : string[2];
  end;

var
  frm_consulta_previsao: Tfrm_consulta_previsao;

implementation

uses GSMLIB, PGGP021;

{$R *.DFM}

procedure Tfrm_consulta_previsao.FormShow(Sender: TObject);
begin
  With cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    ItemIndex := 0;
  end;

  a_str_indices[0] := 'NR_PREVISAO';
  a_str_indices[1] := 'CD_CLIENTE, NR_PREVISAO';

  with datm_consulta_previsao do
  begin
    qry_previsao_.Close;
    qry_previsao_.SQL[3] := a_str_indices[0];
    qry_previsao_.Prepare;
    qry_cliente_.Open;
    qry_previsao_.Open;
  end;
end;

procedure Tfrm_consulta_previsao.dbg_cadastroDblClick(Sender: TObject);
begin
  with datm_consulta_previsao do
  begin
    frm_consulta_previsao.nr_previsao := qry_previsao_.Fields[0].AsString;
    qry_previsao_.Close;
    qry_cliente_.Close;
  end;
  Close;
end;

procedure Tfrm_consulta_previsao.btn_fecharClick(Sender: TObject);
begin

  close;

end;

procedure Tfrm_consulta_previsao.edt_chaveChange(Sender: TObject);
begin
  with datm_consulta_previsao do
  begin
    qry_previsao_.DisableControls;
    qry_previsao_.First;
    While not( qry_previsao_.EOF ) Do
    begin
      case cb_ordem.ItemIndex of
        0: Begin
             If At( UpperCase( edt_chave.Text ), UpperCase( qry_previsao_NR_PREVISAO.AsString ) ) Then
             begin
                qry_previsao_.EnableControls;
                Exit;
             end;
           end;
        1: Begin
             If At( UpperCase( edt_chave.Text ), UpperCase( qry_previsao_Look_Nm_Cliente.AsString ) ) Then
             begin
                qry_previsao_.EnableControls;
                Exit;
             end;
           end;
      end;
      qry_previsao_.Next;
    end;
    qry_previsao_.EnableControls;
  end;
end;

procedure Tfrm_consulta_previsao.cb_ordemClick(Sender: TObject);
begin

  { Apaga o campo de pesquisa }

  edt_chave.Text := '';

  with datm_consulta_previsao do
  begin
    qry_previsao_.Close;
    qry_previsao_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
    qry_previsao_.Prepare;
    qry_previsao_.Open;
  end;

end;

procedure Tfrm_consulta_previsao.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  {Inicializa o Data Module}
  Application.CreateForm( Tdatm_consulta_previsao, datm_consulta_previsao );

end;

procedure Tfrm_consulta_previsao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if datm_consulta_previsao.qry_previsao_.Active then
     datm_consulta_previsao.qry_previsao_.Close;
  if datm_consulta_previsao.qry_cliente_.Active then
     datm_consulta_previsao.qry_cliente_.Close;
//  datm_consulta_previsao.Destroy;
  datm_consulta_previsao.Free;
  Action := caFree;
end;

procedure Tfrm_consulta_previsao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then close;
end;

end.
