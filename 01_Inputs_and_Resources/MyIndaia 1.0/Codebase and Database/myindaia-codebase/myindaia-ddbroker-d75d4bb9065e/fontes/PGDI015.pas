unit PGDI015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, DBTables, Db, DBCtrls, DBCGrids,
  Buttons, Menus, Grids, DBGrids, Funcoes,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tfrm_DI_adicao_Com_LI = class(TForm)
    Panel1: TPanel;
    Mensagem: TStatusBar;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText2: TDBText;
    DBText1: TDBText;                                           
    DBText3: TDBText;
    mi_menu: TMainMenu;
    mi_iniciar: TMenuItem;
    mi_fechar: TMenuItem;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_iniciar: TSpeedButton;
    dbnvg: TDBNavigator;
    DBGrid1: TDBGrid;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private                             
    { Private declarations }
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
  public
    { Public declarations }
    cd_unidade : String[2];
    cd_produto  : String[2];
    nr_processo : String[14];
  end;

var
  frm_DI_adicao_Com_LI: Tfrm_DI_adicao_Com_LI;

implementation

uses PGGP001, GSMLIB, PGGP017, PGDI034;

{$R *.DFM}

procedure Tfrm_DI_adicao_Com_LI.btn_iniciarClick(Sender: TObject);
var
  i : Integer;
begin
  if DBGrid1.SelectedRows.Count > 0 then
     TTable(DBGrid1.DataSource.DataSet).GotoBookMark(TBookMark(DBGrid1.SelectedRows[0]));
  for i := 0 to DBGrid1.SelectedRows.Count - 1 do
  begin

    Mensagem.SimpleText := 'Gerando Nova Adição ...';
    Application.ProcessMessages;

    str_nr_processo := cd_unidade + cd_produto + nr_processo;
    with datm_DI_adicao_com_LI do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_di_adicao_com_li);
        sp_di_adicao_com_li.ParamByName('@cd_unid_neg').AsString   := cd_unidade;
        sp_di_adicao_com_li.ParamByName('@cd_prod').AsString       := cd_produto;
        sp_di_adicao_com_li.ParamByName('@nr_processo').AsString   := str_nr_processo;
        sp_di_adicao_com_li.ParamByName('@nr_li').AsString         := qry_li_browse_NR_OPER_TRAT_PREV.AsString;
        sp_di_adicao_com_li.ParamByName('@dt_registro').AsDateTime := qry_li_browse_DT_REG_OPER_TRAT.AsDateTime;
        ExecStoredProc(sp_di_adicao_com_li);
        if sp_di_adicao_com_li.ParamByName('Result').AsInteger = 1 then
        begin
          CloseStoredProc(sp_di_adicao_com_li);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          Mensagem.SimpleText := 'Erro na geração da Adição. Contate o Administrador do sistema!';
          Exit;
        end
        else
        CloseStoredProc(sp_di_adicao_com_li);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          TrataErro(E);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          Mensagem.SimpleText := 'Erro na geração da Adição.';
        end;
      end;
    end;

    DBGrid1.SelectedRows.CurrentRowSelected := False;
    if DBGrid1.SelectedRows.Count > 0 then
      TTable(DBGrid1.DataSource.DataSet).GotoBookMark(TBookMark(DBGrid1.SelectedRows[0]))
    else
      Break;
  end;

  Mensagem.SimpleText := 'Adição gerada com sucesso.';
  datm_DI_adicao_com_LI.qry_li_browse_.Close;
  datm_DI_adicao_com_LI.qry_li_browse_.Open;
end;

procedure Tfrm_DI_adicao_Com_LI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_DI_adicao_com_LI.Free;
  Action := caFree;
  Application.ProcessMessages;
end;

procedure Tfrm_DI_adicao_Com_LI.FormShow(Sender: TObject);
begin
  //with datm_DI_adicao_com_LI.db_ri do if (not Connected) then Connected := True;
  datm_DI_adicao_com_LI.qry_li_browse_.Open;
  edt_chave.SetFocus;
end;

procedure Tfrm_DI_adicao_Com_LI.FormCreate(Sender: TObject);
begin
  { Inicializa o Data Module para Adição com LI }
  Application.CreateForm( Tdatm_DI_adicao_com_LI, datm_DI_adicao_com_LI );

  a_str_indices[0] := 'NR_OPER_TRAT_PREV';
  a_str_indices[1] := 'CONVERT( datetime, DT_REG_OPER_TRAT, 103)';
  a_str_indices[2] := 'NM_FORN_ESTR';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Nº Reg. LI');
    Items.Add('Data Reg. LI');
    Items.Add('Exportador');
    ItemIndex := 0;
  end;
end;

procedure Tfrm_DI_adicao_Com_LI.btn_sairClick(Sender: TObject);
begin
  datm_DI_adicao_com_LI.qry_li_browse_.Close;
  Close;
end;

procedure Tfrm_DI_adicao_Com_LI.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex <> 1 then
     Localiza( datm_DI_adicao_com_LI.qry_li_browse_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else
     Localiza( datm_DI_adicao_com_LI.qry_li_browse_, edt_chave.Text, 'DT_REG_OPER_TRAT' );
end;

procedure Tfrm_DI_adicao_Com_LI.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_DI_adicao_com_LI.qry_li_browse_NR_OPER_TRAT_PREV.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_DI_adicao_com_LI.qry_li_browse_.Close;
  datm_DI_adicao_com_LI.qry_li_browse_.SQL[5] := a_str_indices[cb_ordem.ItemIndex];
  datm_DI_adicao_com_LI.qry_li_browse_.Prepare;
  datm_DI_adicao_com_LI.qry_li_browse_.Open;
  Localiza(datm_DI_adicao_com_LI.qry_li_browse_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_DI_adicao_Com_LI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close; 
end;

end.
