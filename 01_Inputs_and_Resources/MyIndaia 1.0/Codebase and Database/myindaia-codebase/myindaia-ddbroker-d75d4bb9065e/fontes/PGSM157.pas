unit PGSM157;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, ComCtrls, Grids, DBGrids,
  Db, Mask, DBTables, ComOBJ, PGGP001;

type
  Tfrm_ncm = class(TForm)
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_ncm: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbgrd_ncm: TDBGrid;
    Label1: TLabel;
    dbedt_cd_ncm: TDBEdit;
    Label2: TLabel;
    dbedt_nm_ncm: TDBEdit;
    Label3: TLabel;
    dbedt_cd_unid: TDBEdit;
    Label4: TLabel;
    dbedt_aliq_II: TDBEdit;
    Label5: TLabel;
    dbedt_ini_II: TDBEdit;
    Label6: TLabel;
    dbedt_fim_II: TDBEdit;
    Label7: TLabel;
    dbedt_II_Merc: TDBEdit;
    Label8: TLabel;
    dbedt_ini_II_Merc: TDBEdit;
    Label9: TLabel;
    dbedt_fim_II_Merc: TDBEdit;
    Label10: TLabel;
    dbedt_IPI: TDBEdit;
    Label11: TLabel;
    dbedt_ini_IPI: TDBEdit;
    Label12: TLabel;
    dbedt_fim_IPI: TDBEdit;
    dbedt_nm_unid: TDBEdit;
    Bevel3: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel4: TBevel;
    speed_unidade_: TSpeedButton;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbchkbx_nec_li: TDBCheckBox;
    btn_planilha: TSpeedButton;
    OpenDialog: TOpenDialog;
    PB: TProgressBar;
    PnlAtualizando: TPanel;
    Label16: TLabel;
    Bevel6: TBevel;
    Bevel5: TBevel;
    Label17: TLabel;
    dbedt_gatt: TDBEdit;
    Label18: TLabel;
    dbedt_ini_gatt: TDBEdit;
    Label19: TLabel;
    dbedt_fim_gatt: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Bevel7: TBevel;
    dbedt_PIS: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    dbedt_ini_PIS: TDBEdit;
    dbedt_fim_PIS: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Bevel8: TBevel;
    dbedt_fim_COFINS: TDBEdit;
    Label24: TLabel;
    dbedt_ini_COFINS: TDBEdit;
    Label25: TLabel;
    dbedt_COFINS: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure ver_botoes(Sender: TObject);
    procedure pgctrl_ncmChange(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);
    procedure speed_unidade_Click(Sender: TObject);
    procedure dbedt_ini_IIExit(Sender: TObject);
    procedure dbedt_fim_IIExit(Sender: TObject);
    procedure dbedt_ini_II_MercExit(Sender: TObject);
    procedure dbedt_fim_II_MercExit(Sender: TObject);
    procedure dbedt_ini_IPIExit(Sender: TObject);
    procedure dbedt_fim_IPIExit(Sender: TObject);
    procedure pgctrl_ncmChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_planilhaClick(Sender: TObject);
    procedure dbedt_ini_PISExit(Sender: TObject);
    procedure dbedt_fim_PISExit(Sender: TObject);
    procedure dbedt_ini_COFINSExit(Sender: TObject);
    procedure dbedt_fim_COFINSExit(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..1] of String[16];
    st_modificar, st_incluir, st_excluir : Boolean;
    Pesquisa : String;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure GeraPlanilhaDivergencias;
  public
    { Public declarations }
  end;

var
  frm_ncm: Tfrm_ncm;

implementation

uses PGSM158, GSMLIB, PGGP017, PGSM012, PGSM018, Funcoes;

{$R *.DFM}

procedure Tfrm_ncm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_ncm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm(Tdatm_ncm, datm_ncm);
  pgctrl_ncm.ActivePage := ts_lista;
  datm_ncm.qry_ncm_.Close;
  datm_ncm.qry_ncm_.Prepare;
  datm_ncm.qry_ncm_.Open;
  with cb_ordem do
  begin
     Items.Clear;
     Items.Add('Código');
     Items.Add('Descrição');
     ItemIndex := 0;
  end;
  a_str_indices[0] := 'CODIGO';
  a_str_indices[1] := 'DESCRICAO';
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  AtribuiDireitos( st_modificar, st_incluir, st_excluir);
  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_ncm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_ncm do
  begin
    if qry_ncm_.State in [ dsInsert, dsEdit ] then
    begin
      if BoxMensagem('O cadastro de NCM foi alterado.'+ #13 + 'Deseja salvar alterações antes de sair?', 1 ) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          qry_ncm_.Post;
          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          BoxMensagem('Não foi possível para o sistema atualizar o cadastro.',2 );
          qry_ncm_.Cancel;
        end;
      end
    end;
    Free;
  end;
  Screen.Cursor := crDefault;
end;
procedure Tfrm_ncm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ncm.btn_incluirClick(Sender: TObject);
begin
  if st_incluir then
  begin
    pgctrl_ncm.ActivePage := ts_dados_basicos;
    dbedt_cd_ncm.SetFocus;
    datm_ncm.qry_ncm_.Insert;
    datm_ncm.qry_ncm_IN_NECESSITA_LI.AsString := '0';
  end;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
end;

procedure Tfrm_ncm.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_ncm.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ncm.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este registro de NCM será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_ncm.qry_ncm_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_ncm.qry_ncm_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_ncm.ActivePage := ts_lista;
end;

procedure Tfrm_ncm.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Pesquisa := datm_ncm.qry_ncm_CODIGO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_ncm.qry_ncm_.Close;
  datm_ncm.qry_ncm_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_ncm.qry_ncm_.Prepare;
  datm_ncm.qry_ncm_.Open;
  Localiza(datm_ncm.qry_ncm_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_ncm.ver_botoes(Sender: TObject);
begin
  if ( datm_ncm.qry_ncm_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ncm.pgctrl_ncmChange(Sender: TObject);
begin
  if (pgctrl_ncm.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;
end;

procedure Tfrm_ncm.edt_chaveExit(Sender: TObject);
begin
  if datm_ncm.qry_ncm_.Locate( a_str_indices[ cb_ordem.ItemIndex ], edt_chave.text, [lopartialKey] ) then
  dbgrd_ncm.SetFocus;
end;

procedure Tfrm_ncm.speed_unidade_Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unid_medida, frm_unid_medida);
  frm_unid_medida.Cons_OnLine := datm_ncm.qry_ncm_UNIDADE_MEDIDA;
  with frm_unid_medida do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ncm.qry_ncm_.State in [ dsEdit, dsInsert ] ) then datm_ncm.qry_ncm_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure trata_data( edt: TDBEdit );
begin
  try
    if edt.Text <> '  /  /    ' then StrToDate( edt.Text );
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      edt.SetFocus;
    end;
  end;
end;

procedure Tfrm_ncm.dbedt_ini_IIExit(Sender: TObject);
begin
   trata_data( dbedt_ini_II );
end;

procedure Tfrm_ncm.dbedt_fim_IIExit(Sender: TObject);
begin
  trata_data( dbedt_fim_II );
end;

procedure Tfrm_ncm.dbedt_ini_II_MercExit(Sender: TObject);
begin
  trata_data( dbedt_ini_II_Merc );
end;

procedure Tfrm_ncm.dbedt_fim_II_MercExit(Sender: TObject);
begin
  trata_data( dbedt_fim_II_Merc );
end;

procedure Tfrm_ncm.dbedt_ini_IPIExit(Sender: TObject);
begin
  trata_data( dbedt_ini_IPI );
end;

procedure Tfrm_ncm.dbedt_fim_IPIExit(Sender: TObject);
begin
  trata_data( dbedt_fim_IPI );
end;

function Tfrm_ncm.Grava : Boolean;
var
  cd_ncm : String;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_ncm.qry_ncm_.State in [dsInsert, dsEdit] ) then
    begin
      datm_ncm.qry_ncm_.Post;
      cd_ncm := datm_ncm.qry_ncm_CODIGO.AsString;
      datm_ncm.qry_ncm_.Close;
      datm_ncm.qry_ncm_.Prepare;
      datm_ncm.qry_ncm_.Open;
      Localiza(datm_ncm.qry_ncm_, cd_ncm, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_ncm.qry_ncm_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_ncm.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_ncm.qry_ncm_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ncm.qry_ncm_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de NCM foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_ncm.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ncm.Cancelar;
begin
  try
    if datm_ncm.qry_ncm_.State in [dsInsert, dsEdit] then
    begin
      datm_ncm.qry_ncm_.Cancel;
      pgctrl_ncm.ActivePage := ts_dados_basicos;
      dbedt_cd_ncm.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;


procedure Tfrm_ncm.pgctrl_ncmChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ncm.Consiste : Boolean;
begin
  Consiste := True;

  if dbedt_cd_ncm.Text = '' then
  begin
    BoxMensagem('Campo Código deve ser preenchido!', 2);
    pgctrl_ncm.ActivePage := ts_dados_basicos;
    dbedt_cd_ncm.SetFocus;
    Consiste := False;
    Exit;
  end;

  if dbedt_nm_ncm.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_ncm.ActivePage := ts_dados_basicos;
    dbedt_nm_ncm.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

procedure Tfrm_ncm.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_ncm.qry_ncm_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ncm.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
end;

procedure Tfrm_ncm.btn_planilhaClick(Sender: TObject);
var
  Excel : Variant;
  nmArquivo, nmNCM, t: string;
  l,c: integer;
begin
  if OpenDialog.Execute then
  begin
    nmArquivo := OpenDialog.FileName;

    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := False;
    Excel.WorkBooks.Add(nmArquivo);
    PnlAtualizando.Visible := True;
    PB.Visible             := True;                                          
    PB.Max                 := 5000;
    Application.ProcessMessages;
    for l := 2 to 5000 do
    begin
      nmNCM := Excel.WorkBooks[1].Sheets[1].Cells[l,1]; // + ',';
      nmNCM := FStrZero(nmNCM, 8);  //Na leitura do excel, ele retira o zero da esquerda...

      uSql('TMERCADORIA','IN_NECESSITA_LI_SISCOMEX = ''1''','CD_NCM_SH = ''' + nmNCM + '''');
      uSql('TNCM'       ,'IN_NECESSITA_LI          = ''1''','CODIGO    = ''' + nmNCM + '''');
      PB.Position := l;
    end;
    Excel.Quit;
    PB.Visible             := False;
    PnlAtualizando.Visible := False;
    BoxMensagem('Tabelas da Planilha SISCOMEX atualizadas com Sucesso. ' + #10#13 +
                'O sistema irá gerar uma planilha com as divergências encontradas', 3);
    GeraPlanilhaDivergencias;
  end;
end;

procedure Tfrm_ncm.GeraPlanilhaDivergencias;
var
  Excel, xlWorkB, oSheet: OleVariant;
  Linha : Integer;
begin
  try
    Excel := CreateOLEObject('Excel.Application');
    xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\DivergenciasNCM.XLS' );
    Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\DivergenciasNCM_' + Copy(DateToStr(DATE()), 1, 2) +
                                                                 Copy(DateToStr(DATE()), 4, 2) +
                                                                 Copy(DateToStr(DATE()), 7, 4) + '.XLS');
    oSheet := Excel.WorkBooks[1].Worksheets[1];
    with TQuery.Create(Application)do
    begin
      DatabaseName := 'DBBROKER';
      Sql.Add('SELECT');
      Sql.Add('   CD_MERCADORIA, AP_MERCADORIA, CD_NCM_SH,');
      Sql.Add('   ISNULL(IN_NECESSITA_LI_SISCOMEX,''0'') IN_NECESSITA_LI_SISCOMEX, ');
      Sql.Add('   ISNULL(IN_NECESSITA_LI,''0'') IN_NECESSITA_LI');
      Sql.Add('FROM TMERCADORIA(nolock)');
      Sql.Add('WHERE');
      Sql.Add('   ISNULL(IN_NECESSITA_LI_SISCOMEX,''0'') <> ISNULL(IN_NECESSITA_LI, ''0'')');
      Open;
      Last;
      PnlAtualizando.Visible := True;
      PB.Visible             := True;
      PB.Max                 := RecordCount;

      Linha := 9;
      First;
      while not Eof do
      begin
        oSheet.Cells[ Linha, 1 ].Value  := FieldByName('CD_MERCADORIA').AsString;
        oSheet.Cells[ Linha, 2 ].Value  := FieldByName('AP_MERCADORIA').AsString;
        oSheet.Cells[ Linha, 3 ].Value  := FieldByName('CD_NCM_SH').AsString;

        oSheet.Cells[ Linha, 4 ].Value  := IIF(FieldByName('IN_NECESSITA_LI').AsBoolean         = True,'Sim','Não');
        oSheet.Cells[ Linha, 5 ].Value  := IIF(FieldByName('IN_NECESSITA_LI_SISCOMEX').AsString = '1' ,'Sim','Não');
        Linha       := Linha + 1;
        PB.Position := PB.Position + 1;
        Next;
      end;
      Free;
    end;
    oSheet.Range['B1', 'E' + IntToStr(Linha)].Columns.AutoFit;
    Excel.ActiveWorkBook.Save;
    Excel.Visible          := True;
    PnlAtualizando.Visible := False;
    PB.Visible             := False;

  except
    Application.MessageBox('Verifique se a planilha já está aberta. Salve-a e feche-a!', 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
    Exit;
  end;
end;

procedure Tfrm_ncm.dbedt_ini_PISExit(Sender: TObject);
begin
  trata_data(TDBEdit(Sender));
end;

procedure Tfrm_ncm.dbedt_fim_PISExit(Sender: TObject);
begin
  trata_data(TDBEdit(Sender));
end;

procedure Tfrm_ncm.dbedt_ini_COFINSExit(Sender: TObject);
begin
  trata_data(TDBEdit(Sender));
end;

procedure Tfrm_ncm.dbedt_fim_COFINSExit(Sender: TObject);
begin
  trata_data(TDBEdit(Sender));
end;

end.                                                  
