unit uLaudo;

interface

uses
  Windows, Math, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Menus, Spin, Mask, Buttons, ExtCtrls, uGerarDrawback, Grids, DBGrids,
  ComCtrls, DB, ToolEdit, RXDBCtrl, DBTables, Variants, ExcelXP, Excel2000, ActiveX, StrUtils;

type
  Tfrm_Laudo = class(TForm)
    pgctrl_Laudos: TPageControl;
    ts_lista: TTabSheet;
    dbg_Laudos: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_btn_ag: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel1: TPanel;
    BtnMercadoria: TSpeedButton;
    Label55: TLabel;
    msk_nm_mercadoria: TEdit;
    msk_cd_mercadoria: TMaskEdit;
    btnExcel: TSpeedButton;
    dlgOpenExcel: TOpenDialog;
    dlgOpenExcelEXP: TOpenDialog;
    dlgOpenExcelIMP: TOpenDialog;
    pnl_ag: TPanel;
    Label14: TLabel;
    btn_co_mat_pri: TSpeedButton;
    Label15: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btn_co_un_med_comerc: TSpeedButton;
    dbedt_cd_mat_pri: TDBEdit;
    dbedt_vl_percent: TDBEdit;
    dbgrd_mat_pri: TDBGrid;
    dbedt_nm_mat_pri: TEdit;
    EditNCM: TMaskEdit;
    EditPercPerda: TDBEdit;
    dbedt_cd_un_med_comerc: TDBEdit;
    dbedt_look_nm_un_med_comerc: TEdit;
    pnlExcel: TPanel;
    shpExcel: TShape;
    btnGerarExcel: TSpeedButton;
    lblLinha: TLabel;
    btnFechar: TSpeedButton;
    btnRUDEXP: TSpeedButton;
    btnRUDIMP: TSpeedButton;
    lblExcelIMP: TLabel;
    lblExcelEXP: TLabel;
    edtExcelIMP: TEdit;
    edtExcelEXP: TEdit;
    lblChaves: TLabel;
    btn_incluir_matpri: TSpeedButton;
    btn_salvar_matpri: TSpeedButton;
    btn_cancelar_matpri: TSpeedButton;
    btn_excluir_matpri: TSpeedButton;
    dbedtPalavraChave: TDBEdit;
    lblPalavraChave: TLabel;
    dbedtDescr_Merc: TDBEdit;
    btnGerarDB: TSpeedButton;
    pnlGerarDB: TPanel;
    shpGerarDB: TShape;
    btnConsulta: TSpeedButton;
    btnFecharDB: TSpeedButton;
    lbledtEmpresaDB: TLabeledEdit;
    edtEmpresaDB: TEdit;
    btnGeraDB: TButton;
    qry_gera_db_exp: TQuery;
    qry_gera_db_imp: TQuery;
    upd_gera_db_exp: TUpdateSQL;
    upd_gera_db_imp: TUpdateSQL;
    qry_gera_db_expCD_MERCADORIA: TStringField;
    qry_gera_db_expNR_LAUDO: TStringField;
    qry_gera_db_expNR_RE: TStringField;
    qry_gera_db_expDT_EMBARQUE: TStringField;
    qry_gera_db_expCD_NCM_SH: TStringField;
    qry_gera_db_expDESCRICAO: TStringField;
    qry_gera_db_expPL_MERCADORIA: TFloatField;
    qry_gera_db_expQT_MERCADORIA: TFloatField;
    qry_gera_db_expCD_UN_MEDIDA: TStringField;
    qry_gera_db_expVL_MLE_ITEM: TFloatField;
    qry_gera_db_expCD_MOEDA: TStringField;
    qry_gera_db_expVL_MLE_MNEG: TFloatField;
    qry_gera_db_expPC_COMISSAO: TFloatField;
    qry_gera_db_expVL_COMISSAO: TFloatField;
    qry_gera_db_expVL_MLE_ITEM_MN: TFloatField;
    qry_gera_db_expVL_ENQUADRAMENTO: TFloatField;
    qry_gera_db_expPL_MERCADORIA_ORIGINAL: TFloatField;
    qry_gera_db_expQT_MERCADORIA_ORIGINAL: TFloatField;
    qry_gera_db_expVL_MLE_ITEM_ORIGINAL: TFloatField;
    qry_gera_db_impCD_MERCADORIA: TStringField;
    qry_gera_db_impNR_LAUDO: TStringField;
    qry_gera_db_impCD_MAT_PRI: TStringField;
    qry_gera_db_impNR_DI: TStringField;
    qry_gera_db_impNR_ADICAO: TStringField;
    qry_gera_db_impNR_ITEM: TStringField;
    qry_gera_db_impDT_REGISTRO_DI: TStringField;
    qry_gera_db_impDT_DESEMBARACO: TStringField;
    qry_gera_db_impCD_NCM_SH: TStringField;
    qry_gera_db_impDESCRICAO: TStringField;
    qry_gera_db_impPL_MERCADORIA: TFloatField;
    qry_gera_db_impQT_MERCADORIA: TFloatField;
    qry_gera_db_impCD_UN_MEDIDA: TStringField;
    qry_gera_db_impVL_MLE_ITEM: TFloatField;
    qry_gera_db_impCD_MOEDA: TStringField;
    qry_gera_db_impVL_MLE_MNEG: TFloatField;
    qry_gera_db_impVL_FRETE_MNEG: TFloatField;
    qry_gera_db_impVL_SEGURO_MNEG: TFloatField;
    qry_gera_db_impVL_TAXA_X: TFloatField;
    qry_gera_db_impVL_TAXA_DOLAR: TFloatField;
    qry_gera_db_impPL_MERCADORIA_ORIGINAL: TFloatField;
    qry_gera_db_impQT_MERCADORIA_ORIGINAL: TFloatField;
    qry_gera_db_impVL_MLE_ITEM_ORIGINAL: TFloatField;
    procedure mi_sairClick(Sender: TObject);
    procedure mi_excluirClick(Sender: TObject);
    procedure mi_cancelarClick(Sender: TObject);
    procedure mi_salvarClick(Sender: TObject);
    procedure mi_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pgctrl_LaudosChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnMercadoriaClick(Sender: TObject);
    procedure btn_co_mat_priClick(Sender: TObject);
    procedure dbedt_cd_mat_priExit(Sender: TObject);
    procedure dbedt_vl_percentChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_LaudosChange(Sender: TObject);
    procedure CmbUnidadeChange(Sender: TObject);
    procedure btn_co_un_med_comercClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnRUDEXPClick(Sender: TObject);
    procedure btnRUDIMPClick(Sender: TObject);
    procedure edtExcelIMPChange(Sender: TObject);
    procedure edtExcelEXPChange(Sender: TObject);
    procedure btnGerarExcelClick(Sender: TObject);
    procedure dbg_LaudosCellClick(Column: TColumn);
    procedure btn_incluir_matpriClick(Sender: TObject);
    procedure btn_salvar_matpriClick(Sender: TObject);
    procedure dbgrd_mat_priCellClick(Column: TColumn);
    procedure btn_cancelar_matpriClick(Sender: TObject);
    procedure btn_excluir_matpriClick(Sender: TObject);
    procedure DBEdit1Click(Sender: TObject);
    procedure dbedtDescr_MercChange(Sender: TObject);
    procedure dbgrd_mat_priDblClick(Sender: TObject);
    procedure dbg_LaudosDblClick(Sender: TObject);
    procedure dbedtPalavraChaveChange(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure lbledtEmpresaDBExit(Sender: TObject);
    procedure lbledtEmpresaDBKeyPress(Sender: TObject; var Key: Char);
    procedure btnGeraDBClick(Sender: TObject);
    procedure btnGerarDBClick(Sender: TObject);
    procedure btnFecharDBClick(Sender: TObject);
    procedure lbledtEmpresaDBChange(Sender: TObject);


  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    SiglaUMMercadoria : String;
    procedure Cancelar;
    function Consiste : Boolean;
    function Grava    : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function VerAlt   : Boolean;
    procedure AtualizaGrid;
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_Laudo: Tfrm_Laudo;

implementation

uses
  Funcoes, PGGP017, dLaudo, ConsOnLineEx, MaskUtils;

{$R *.DFM}

procedure AbreFechaExcel;
begin
  frm_Laudo.btn_sair.Enabled := not frm_Laudo.btn_sair.Enabled;
  frm_Laudo.btnExcel.Enabled := not frm_Laudo.btnExcel.Enabled;
  frm_Laudo.pnlExcel.Visible := not frm_Laudo.pnlExcel.Visible;

  frm_laudo.edtExcelEXP.Clear;
  frm_laudo.edtExcelIMP.Clear;

  frm_laudo.dlgOpenExcelEXP.FileName := '';
  frm_laudo.dlgOpenExcelIMP.FileName := '';
end;

procedure Tfrm_Laudo.mi_sairClick(Sender: TObject);
begin
  VerAlt;
  close;
end;

procedure BotoesMatPri(Incluir : Integer; Salvar : Integer; Cancela : Integer; Excluir : Integer);
begin
  with frm_Laudo do
  begin
    case Incluir of
      1: btn_incluir_matpri.Enabled := True;
      0: btn_incluir_matpri.Enabled := False;
    end;

    case Salvar of
      1: btn_salvar_matpri.Enabled := True;
      0: btn_salvar_matpri.Enabled := False;
    end;

    case Cancela of
      1: btn_cancelar_matpri.Enabled := True;
      0: btn_cancelar_matpri.Enabled := False;
    end;

    case Excluir of
      1: btn_excluir_matpri.Enabled := True;
      0: btn_excluir_matpri.Enabled := False;
    end;
  end;
end;

procedure BotoesLaudo(Incluir : Integer; Salvar : Integer; Cancela : Integer; Excluir : Integer);
begin
  with frm_Laudo do
  begin
    case Incluir of
      1: btn_incluir.Enabled := True;
      0: btn_incluir.Enabled := False;
    end;

    case Salvar of
      1: btn_salvar.Enabled := True;
      0: btn_salvar.Enabled := False;
    end;

    case Cancela of
      1: btn_cancelar.Enabled := True;
      0: btn_cancelar.Enabled := False;
    end;

    case Excluir of
      1: btn_excluir.Enabled := True;
      0: btn_excluir.Enabled := False;
    end;
  end;
end;

procedure Tfrm_Laudo.mi_excluirClick(Sender: TObject);
begin
  If pgctrl_Laudos.ActivePage = ts_Lista Then
  Begin
    with datm_Laudo do
    begin
      try
        {Consistência}
        {if dbgrd_mat_pri.DataSource.DataSet.RecordCount > 0 then
        begin
          BoxMensagem( 'Erro na Exclusão! Existem Matérias Primas cadastradas para este Laudo!', 2 );
          Exit;
        end;}

        if qry_laudo_.RecordCount > 0 then
        Begin
          If Application.MessageBox('Confirma exclusão do Laudo ?','Atenção',MB_IconQuestion + Mb_yesno) = id_Yes Then
          Begin
            datm_main.db_broker.StartTransaction;
            
            with TQuery.Create(Application) do
            begin
              Databasename := 'DBBROKER';
              SQL.Add('DELETE FROM TLAUDO_TECNICO_EXP');
              SQL.Add('WHERE CD_MERCADORIA = '+QuotedStr(qry_Laudo_CD_MERCADORIA.AsString));
              SQL.Add('AND NR_LAUDO = '+QuotedStr(qry_Laudo_NR_LAUDO.AsString));
              ExecSQL;
              Close;
              Free;
            end;

            qry_laudo_.Delete;
            datm_main.db_broker.Commit;
          End;
        End
        Else
          BoxMensagem('Não existem Laudos para serem excluídos',3);
      except
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
      end;
    end;
  End;


 { Else
  Begin
    with datm_Laudo do
    begin
      Try
        If dbgrd_mat_pri.DataSource.DataSet.RecordCount > 0 Then
        Begin
          If Application.MessageBox('Confirma exclusão da Matéria Prima ?','Atenção',MB_IconQuestion + Mb_yesno) = id_Yes Then
          Begin
            datm_main.db_broker.StartTransaction;
            qry_laudo_mat_pri_.Locate('CD_MAT_PRI',datm_Laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString,[]);
            qry_laudo_mat_pri_.Delete;
            datm_main.db_broker.Commit;
            dbgrd_mat_pri.DataSource.DataSet.Close;
            dbgrd_mat_pri.DataSource.DataSet.Open;
          End;
        End
        Else
          BoxMensagem('Não Existem Matérias Primas cadastradas para este laudo',3);
      Except
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
      End;
    End;
  End; }
end;

procedure Tfrm_Laudo.mi_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

Function TFrm_Laudo.VerAlt: Boolean;
begin
  VerAlt := True;
  if ( ( datm_Laudo.qry_laudo_.State in [dsEdit] ) and st_modificar ) or
     ( datm_Laudo.qry_laudo_.State in [dsInsert] ) then
    begin
    if BoxMensagem('O Cadastro de Laudos foi alterado.' + #13#10 +
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

procedure Tfrm_Laudo.Cancelar;
begin
  btn_mi( st_incluir, False, False, st_excluir );
  datm_Laudo.qry_Laudo_.Cancel;
//  edit_cd_mercadoria_read.Clear;
//  edit_nm_mercadoria_read.Clear;
end;

procedure Tfrm_Laudo.mi_salvarClick(Sender: TObject);
begin
  Try
      datm_main.db_broker.StartTransaction;
      //datm_Laudo.qry_laudo_mat_pri_.FieldByName('VL_CALCULADO').AsFloat := ConverteValMatPri;
      datm_Laudo.qry_laudo_.Post;
      dbg_Laudos.DataSource.DataSet.Close;
      dbg_Laudos.DataSource.DataSet.Open;
      AtualizaGrid;
      btn_mi( st_incluir, False, False, st_excluir );
      datm_main.db_broker.Commit;
  except
      ShowMessage('Erro ao salvar as alterações.' +#13#10+ 'Por favor, tente novamente');
      datm_main.db_broker.Rollback;
  end;
    //BoxMensagem(Format(cPreencherCampo,['Usagem %']), 2);
    //dbedt_cd_mat_pri.SetFocus;
    //BoxMensagem(Format(cPreencherCampo,['Matéria Prima']), 2);
    //dbedt_cd_mat_pri.SetFocus;
end;

Function TFrm_Laudo.Consiste : Boolean; //usado para campos que não
begin                                          //devem ficar em branco
  Consiste := False;

  if msk_cd_mercadoria.text = '' then
  begin
    BoxMensagem(Format(cPreencherCampo,['Código da Mercadoria']), 2);
    exit;
  end;

    With datm_Laudo Do
    Begin
      { Código da Matéria Prima }
      if Not lNaoConsiste then
      begin
        if dbedt_cd_mat_pri.Text = '' then
        begin
          BoxMensagem( 'Campo Matéria Prima é obrigatório!', 2 );
          dbedt_cd_mat_pri.SetFocus;
          Consiste := false;
          Exit;
        end;
      end;

      if qry_laudo_.State in [dsInsert, dsEdit] then
        ValidCodigo( dbedt_cd_mat_pri );
      If dbedt_cd_mat_pri.Text <> '' Then
      Begin
        if dbedt_nm_mat_pri.Text = '' Then
        Begin
          BoxMensagem( 'Código da Matéria Prima inválido!', 2 );
          dbedt_cd_mat_pri.SetFocus;
        End;
      End;
    End;
                                                                     
  Consiste := True;
end;

function Tfrm_Laudo.Grava : Boolean;     //USAR
var
  cd_mercadoria  : String;
  cd_mat_pri : String;
  nr_laudo : String[5];
begin
  Try
    With datm_Laudo Do
    Begin
      If ( qry_laudo_mat_pri_.State in [dsInsert, dsEdit] ) Then
      Begin
        datm_main.db_broker.StartTransaction;

        qry_laudo_mat_pri_.FieldByName('CD_MERCADORIA').AsString := qry_laudo_CD_MERCADORIA.AsString;
        qry_laudo_mat_pri_.FieldByName('NR_LAUDO').AsString      := qry_laudo_NR_LAUDO.AsString;
        qry_laudo_mat_pri_.Post;
        cd_mercadoria := qry_laudo_mat_pri_CD_MERCADORIA.AsString;
        nr_laudo      := qry_laudo_mat_pri_NR_LAUDO.AsString;
        cd_mat_pri    := qry_laudo_mat_pri_CD_MAT_PRI.AsString;

        datm_main.db_broker.Commit;
        Grava := True;

        qry_lista_mat_pri_.Close;
        qry_lista_mat_pri_.Prepare;
        qry_lista_mat_pri_.Open;
        qry_lista_mat_pri_.Locate( 'CD_MERCADORIA;NR_LAUDO;CD_MAT_PRI',
                                 VarArrayOf([ cd_mercadoria, nr_laudo, cd_mat_pri ]), [loCaseInsensitive] );
      End;
    End;
  Except
    If datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    BoxMensagem( 'Erro - operação de atualização. Tente gravar novamente.', 2 );
    btn_cancelar.Click;
    Grava := False;
  End;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_Laudo.mi_incluirClick(Sender: TObject);
Var
  Nr_laudo : String[5];
begin
  If pgctrl_Laudos.ActivePage = ts_lista Then
  Begin
    If (Trim(msk_cd_mercadoria.Text) <> '') Then
    Begin
      If (Trim(msk_nm_mercadoria.Text) = '') then
       begin
         ShowMessage('O código de mercadoria digitado é inválido. Por favor, digite o código novamente.');
       end
       else
       begin
        Try
          With datm_Laudo Do
          Begin
            datm_main.db_broker.StartTransaction;
            qry_ult_laudo_.Close;
            qry_ult_laudo_.ParamByName('CD_MERCADORIA').AsString := msk_cd_mercadoria.Text;
    //          qry_ult_laudo_.ParamByName('CD_MERCADORIA').AsString := qry_mercadoria_CD_MERCADORIA.AsString;
            qry_ult_laudo_.Prepare;
            qry_ult_laudo_.Open;
            if qry_ult_laudo_.FieldByName('NR_LAUDO').IsNull then
              nr_laudo := '00001'
            else
              nr_laudo := StrZero( StrToInt( qry_ult_laudo_.FieldByName('NR_LAUDO').AsString ) + 1, 5 );
            qry_ult_laudo_.Close;


            qry_laudo_.Append;
            qry_laudo_CD_MERCADORIA.AsString := msk_cd_mercadoria.Text;
            qry_laudo_NR_LAUDO.AsString      := nr_laudo;
            //qry_laudo_.Post;

            datm_main.db_broker.Commit;
            AtualizaGrid;
            pgctrl_Laudos.OnChange(Sender);
            Btn_Mi(False, true, true, False);
          End;
        except
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
        end;
      end;
    End
    Else
    Begin
      BoxMensagem('Para incluir um Laudo é necessário escolher uma mercadoria primeiro!',3);
      Pgctrl_Laudos.ActivePage := ts_Lista;
      msk_cd_mercadoria.SetFocus;
    End;
  End;
  {Else
  Begin
    If EditLaudo.Text <> '' Then
    Begin
      datm_Laudo.qry_laudo_mat_pri_.Insert;
      btn_mi( False, True, True, False );
      dbedt_cd_mat_pri.SetFocus;
    End
    Else
    Begin
      BoxMensagem('Para incluir um Laudo é necessário escolher uma mercadoria primeiro!',3);
      Pgctrl_Laudos.ActivePage := ts_Lista;
      msk_cd_mercadoria.SetFocus;
    End;
  End;}
end;

procedure Tfrm_Laudo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled   := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled   := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled    := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled  := Canc;  mi_Cancelar.Enabled  := Canc;
  dbgrd_mat_pri.Enabled := btn_incluir.Enabled;
end;


procedure Tfrm_Laudo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  msk_cd_mercadoria.Clear;
  msk_nm_mercadoria.Clear;
  datm_Laudo.qry_laudo_.Close;
  datm_Laudo.qry_lista_mat_pri_.Close;
end;

procedure Tfrm_Laudo.FormCreate(Sender: TObject);
begin
  //Panel1.Color := clPnlClaroBroker;
  //pnl_btn_ag.Color := clMenuBroker;
  st_modificar := True;
  st_incluir   := True;
  st_excluir   := True;

  //AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  datm_Laudo.ds_laudo.AutoEdit     := st_modificar;

  datm_Laudo.qry_laudo_.Close;
  datm_Laudo.qry_laudo_.Open;
  datm_Laudo.qry_laudo_mat_pri_.Close;

  datm_Laudo.qry_lista_mat_pri_.Open;

  btn_incluir.Enabled   := st_incluir;
  btn_excluir.Enabled   := st_excluir;
  mi_incluir.Enabled    := st_incluir;
  mi_excluir.Enabled    := st_excluir;
  Btn_Mi(st_incluir, False, False, st_excluir );
  
end;

procedure Tfrm_Laudo.pgctrl_LaudosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_Laudo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   VerAlt;
end;

procedure Tfrm_Laudo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_Laudo.FormShow(Sender: TObject);
begin
  pgctrl_Laudos.ActivePage:= ts_lista;
  msk_cd_mercadoria.setfocus;
  If Trim(msk_nm_mercadoria.Text) = '' then
    begin
      btn_incluir.Enabled := False;
      btn_excluir.Enabled := False;
      btnExcel.Enabled    := True;
    end;
end;

function AtualizaValores(QtdeTotal : Double; QtdeIndividual: Double; Valor : Double): Double;
var
  Aux : Double;
begin
  If QtdeTotal = 0 then
    Result := 0
  else
  begin
    Aux := ((QtdeIndividual*100)/QtdeTotal)/100;
    Result := Valor*Aux;
  end;
end;


procedure Tfrm_Laudo.BtnMercadoriaClick(Sender: TObject);
Var
  CodUnid : String;
begin
  If Sender is TSpeedButton Then
  Begin
    msk_cd_mercadoria.Text       := ConsultaOnLineEx('TMERCADORIA_EXP','Mercadoria',['CD_MERCADORIA','AP_MERCADORIA'],['Código','Descrição'],'CD_MERCADORIA',nil, 1, '');
    CodUnid                      := ConsultaLookUP('TMERCADORIA_EXP','CD_MERCADORIA', msk_cd_mercadoria.Text,'CD_UN_MED_COMERC');
    //EditUnidade.Text             := ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA', CodUnid,'NM_UNID_MEDIDA');
    SiglaUMMercadoria            := ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA', CodUnid,'NM_SIGLA');
  End
  Else
  Begin
    msk_nm_mercadoria.Text := ConsultaLookUP('TMERCADORIA_EXP','CD_MERCADORIA', msk_cd_mercadoria.Text,'AP_MERCADORIA');
    //edit_nm_mercadoria_read.Text := msk_nm_mercadoria.Text;
    If Trim(msk_nm_mercadoria.Text) <> '' then
        btn_incluir.Enabled := True
    else
        btn_incluir.Enabled := False;

    datm_laudo.qry_lista_mat_pri_.Cancel;
    datm_laudo.qry_lista_mat_pri_.Close;

    If datm_Laudo.qry_laudo_.State in [dsEdit, dsBrowse] then
    begin
      If (datm_laudo.qry_laudo_.RecordCount = 0) or (Trim(msk_nm_mercadoria.Text) = '') then
      begin
        btn_incluir_matpri.Enabled  := False;
        btn_excluir_matpri.Enabled  := False;
        btn_salvar_matpri.Enabled   := False;
        btn_cancelar_matpri.Enabled := False;
        datm_laudo.qry_lista_mat_pri_.Cancel;
        datm_laudo.qry_lista_mat_pri_.Close;
        datm_laudo.qry_laudo_.Cancel;
        datm_laudo.qry_Laudo_.Close;

        dbedtDescr_Merc.Enabled        := False;
        dbedt_cd_mat_pri.Enabled       := False;
        btn_co_mat_pri.Enabled         := False;
        dbedt_vl_percent.Enabled       := False;
        dbedt_cd_un_med_comerc.Enabled := False;
        btn_co_un_med_comerc.Enabled   := False;
        EditPercPerda.Enabled          := False;
        dbedtPalavraChave.Enabled      := False;
      end;

    end;

  End;
  AtualizaGrid;
end;

procedure Tfrm_Laudo.btn_co_mat_priClick(Sender: TObject);
begin
  If datm_Laudo.qry_laudo_NR_LAUDO.AsString <> '' Then
  Begin
    If Sender Is TSpeedButton Then
    Begin
      If not (datm_laudo.qry_lista_mat_pri_.State in [dsEdit]) then
         datm_laudo.qry_lista_mat_pri_.Edit;

      datm_Laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString := ConsultaOnLineEx('TMERCADORIA','Mercadoria',['CD_MERCADORIA','AP_MERCADORIA'],['Código','Descrição'],'CD_MERCADORIA',nil,1,'');
    End
    Else
    Begin
      If datm_Laudo.qry_lista_mat_pri_.State in [ dsInsert, dsEdit ] Then
        BotoesMatPri(0,1,1,0);
      dbedt_nm_mat_pri.Text := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA', dbedt_cd_mat_pri.Text,'AP_MERCADORIA');
      EditNCM.Text          := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA', dbedt_cd_mat_pri.Text,'CD_NCM_SH');
    End;
  End
  Else
  Begin
    Showmessage('Selecione um laudo primeiro!');
  End;
end;

procedure Tfrm_Laudo.dbedt_cd_mat_priExit(Sender: TObject);
begin
  If datm_Laudo.qry_lista_mat_pri_.State in [ dsInsert, dsEdit ] Then
     BotoesMatPri(0,1,1,0);
          //Btn_Mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_Laudo.dbedt_vl_percentChange(Sender: TObject);
begin
  If datm_Laudo.qry_lista_mat_pri_.State in [ dsInsert, dsEdit ] Then
     BotoesMatPri(0,1,1,0);
      //Btn_Mi( False, st_modificar, st_modificar, False );
end;

Procedure Tfrm_Laudo.AtualizaGrid;
Begin
  If datm_Laudo.qry_laudo_.ParamByName('CD_MERCADORIA').AsString <> msk_cd_mercadoria.Text Then
  Begin
    datm_Laudo.qry_laudo_.Close;
    datm_Laudo.qry_laudo_.ParamByName('CD_MERCADORIA').AsString := msk_cd_mercadoria.Text;
    datm_Laudo.qry_laudo_.Open;
  End;

  datm_Laudo.qry_laudo_mat_pri_.Close;

  datm_Laudo.qry_laudo_mat_pri_.ParamByName('CD_MERCADORIA').AsString := datm_Laudo.qry_laudo_CD_MERCADORIA.AsString;
  datm_Laudo.qry_laudo_mat_pri_.ParamByName('NR_LAUDO').AsString := datm_Laudo.qry_laudo_NR_LAUDO.AsString;

  datm_Laudo.qry_laudo_mat_pri_.Open;
End;

procedure Tfrm_Laudo.edt_chaveChange(Sender: TObject);
begin
  If pgctrl_Laudos.ActivePageIndex = 0 Then
    datm_Laudo.qry_laudo_.Locate('NR_LAUDO',Edt_Chave.Text,[]);
end;

procedure Tfrm_Laudo.pgctrl_LaudosChange(Sender: TObject);
begin
  If pgctrl_Laudos.ActivePageIndex = 1 Then
  Begin
    AtualizaGrid;
    //dbedt_cd_mat_pri.Enabled := EditLaudo.Text <> '';
    dbedt_vl_percent.Enabled := dbedt_cd_mat_pri.Enabled;
    EditPercPerda.Enabled    := dbedt_cd_mat_pri.Enabled;
    dbedt_cd_un_med_comerc.Enabled := dbedt_cd_mat_pri.Enabled;
    btn_co_un_med_comerc.Enabled   := dbedt_cd_mat_pri.Enabled;
  End;
end;

procedure Tfrm_Laudo.CmbUnidadeChange(Sender: TObject);
begin
  If datm_Laudo.qry_laudo_mat_pri_.State in [ dsInsert, dsEdit ] Then
    Btn_Mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_Laudo.btn_co_un_med_comercClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    //If not (datm_laudo.qry_lista_mat_pri_.State in [dsInsert, dsEdit]) then
    //Exit;

    If not (datm_laudo.qry_lista_mat_pri_.State in [dsEdit]) then
      datm_laudo.qry_lista_mat_pri_.Edit;

    datm_Laudo.qry_lista_mat_pri_CD_UN_MED_COMERC.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER','Unidade de Medida',['CD_UNID_MEDIDA','NM_UNID_MEDIDA'],['Código','Nome'],'CD_UNID_MEDIDA',nil, 1, '');

    If datm_Laudo.qry_lista_mat_pri_.State in [ dsInsert, dsEdit ] Then
      BotoesMatPri(0,1,1,0);
  End
  Else
    dbedt_look_nm_un_med_comerc.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',dbedt_cd_un_med_comerc.Text,'NM_UNID_MEDIDA')
end;

procedure Tfrm_Laudo.btnExcelClick(Sender: TObject);
begin
   if (datm_Laudo.qry_laudo_.State <> dsInactive) and (datm_Laudo.qry_lista_mat_pri_.State <> dsInactive) then
        AbreFechaExcel;
        //pnlExcel.Visible := True;
end;

function DeParaUnidMedida(Param : string): string;
begin
  with TQuery.Create(Application) do
  begin
    try
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TOP 1 RTRIM(ISNULL(NM_SIGLA, '''')) AS SIGLA ');
      SQL.Add('FROM TUNID_MEDIDA_BROKER');
      SQL.Add('WHERE NM_UNID_MEDIDA = '+QuotedStr(Trim(Param)));
      Open;
      If FieldbyName('SIGLA').AsString = '' Then
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT TOP 1 RTRIM(ISNULL(NM_SIGLA, '''')) AS SIGLA ');
        SQL.Add('FROM TUNID_MEDIDA_BROKER');
        SQL.Add('WHERE NM_UNID_MEDIDA LIKE ''%'+Trim(Param)+'%''');
        Open;


        If FieldbyName('SIGLA').AsString = '' Then
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT TOP 1 RTRIM(ISNULL(NM_SIGLA, '''')) AS SIGLA ');
          SQL.Add('FROM TUNID_MEDIDA_BROKER');
          SQL.Add('WHERE NM_SIGLA = '+QuotedStr(Trim(Param)));
          Open;
          Result := FieldbyName('SIGLA').AsString;
        end
        else
        Result := FieldbyName('SIGLA').AsString;

      end
      else
      Result := FieldbyName('SIGLA').AsString;

    finally
    
      Close;
      Free;
    end;
  end;
end;

function DeParaNomeMoeda(Param : string): string;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TOP 1 RTRIM(ISNULL(AP_MOEDA, ''N/A'')) AS SIGLA');
    SQL.Add('FROM TMOEDA_BROKER');
    SQL.Add('WHERE CD_MOEDA = '+QuotedStr(Trim(Param)));
    Open;
    Result := FieldbyName('SIGLA').AsString;
    Close;
    Free;
  end;
end;

function DeParaMoeda(Param : string): string;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TOP 1 RTRIM(ISNULL(CD_MOEDA, ''N/A'')) AS SIGLA');
    SQL.Add('FROM TMOEDA_BROKER');
    SQL.Add('WHERE AP_MOEDA = '+QuotedStr(Trim(Param)));
    Open;
    Result := FieldbyName('SIGLA').AsString;
    Close;
    Free;
  end;
end;

procedure Tfrm_Laudo.btnFecharClick(Sender: TObject);
begin
    AbreFechaExcel;
end;

procedure Tfrm_Laudo.btnRUDEXPClick(Sender: TObject);
begin
    If dlgOpenExcelEXP.Execute then
      edtExcelEXP.Text := ExtractFileName(dlgOpenExcelEXP.FileName);
end;

procedure Tfrm_Laudo.btnRUDIMPClick(Sender: TObject);
begin
    If dlgOpenExcelIMP.Execute then
      edtExcelIMP.Text := ExtractFileName(dlgOpenExcelIMP.FileName);
end;

procedure Tfrm_Laudo.edtExcelIMPChange(Sender: TObject);
begin
  if Trim(edtExcelIMP.Text) <> '' then
     lblExcelIMP.Font.Style := [fsBold]
  else
     lblExcelIMP.Font.Style := [];
end;

procedure Tfrm_Laudo.edtExcelEXPChange(Sender: TObject);
begin
  if Trim(edtExcelEXP.Text) <> '' then
     lblExcelEXP.Font.Style := [fsBold]
  else
     lblExcelEXP.Font.Style := [];
end;

procedure Tfrm_Laudo.btnGerarExcelClick(Sender: TObject);
var
  ExcelApp : TExcelApplication;
  ExcelWS  : TExcelWorksheet;
  ExcelWB  : TExcelWorkbook;
  Celula   : ExcelRange;
  I, I2, I3, Marcador, Posicao, PosicaoOriginal, PosInicial,
  PosFinal, CountImp, CountExp, Count, RespMensagem : Integer;
  vCaminho, vMercadoria, vLaudo, vNumeroRE,
  vNumeroDI, vNrAdicao, vNrItem, vDtRegistroDI,
  vDtDesembaraco, vDataEmbarque, vNCM, vDescricao, vDescricaoOriginal,
  vUnidMedida, vQtdeMerc, vQtdeMerc_Original, vQtdeAux, vPesoMerc,
  Unidade, UnidadeOriginal, vValorMLE_Item, vMoeda, vValorMLE_MN,
  vFreteDolar, vSeguroDolar, vTaxaX, vTaxaDolar,
  vValorComissao, vValorMLE_Item_MN, vEnquadramento, S, vLinha : string;
  vPc_Comissao, CXPesoKG, CXQtde, vQtdeOriginal, vQtde_Original, vPesoOriginal, vValorMLE_ItemOriginal : Double;
  Separador : Char;
  PossiveisDescricoes, PalavrasChave : TStringList;
begin

  DecimalSeparator := '.';

  if FindWindow('XLMAIN',nil) <> 0  then
  begin
    MessageDlg('Favor fechar todas as janelas do Excel antes de continuar.'+#13#10+'Caso não haja nenhuma janela do Excel aberta e o erro continue ocorrendo, entre em contato com o departamento de TI.', mtError, [mbOk], 0);
    Exit;
  end;
                          
  If (Trim(edtExcelEXP.Text) = '') and (Trim(edtExcelIMP.Text) = '') then
  begin
    Showmessage('Erro! Pelo menos uma das planilhas precisa ser carregada. Por favor, tente novamente.');
    Exit;
  end
  else
  begin
    try
      datm_main.db_broker.StartTransaction;

      ExcelApp := TExcelApplication.Create(nil);
      ExcelWS  := TExcelWorksheet.Create(nil);
      ExcelWB  := TExcelWorkbook.Create(nil);

      datm_laudo.qry_Laudo_.First;
      PossiveisDescricoes := TStringList.Create;

      while not datm_laudo.qry_Laudo_.EOF do
      begin
        If Trim(dlgOpenExcelEXP.FileName) <> '' then
        begin

          with TQuery.Create(Application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Add('SELECT * FROM TLAUDO_TECNICO_EXP');
            SQL.Add('WHERE CD_MERCADORIA = '+QuotedStr(datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString));
            SQL.Add('AND NR_LAUDO = '+QuotedStr(datm_laudo.qry_Laudo_NR_LAUDO.AsString));
            Open;
            CountExp := RecordCount;
            Close;
            Free;
          end;

          If CountExp > 0 then
          begin
            RespMensagem := MessageDlg('O laudo nº '+datm_laudo.qry_Laudo_NR_LAUDO.AsString+' já possui registros salvos no sistema.'+#13#10
               +' Clique em ''Sim'' para excluir os registros existentes, ''Não'' para inserir os novos valores e manter os registros existentes, e em ''Cancelar'' para cancelar a operação.', mtWarning, mbYesNoCancel, 0);

            If RespMensagem = mrYes then
            begin
              with TQuery.Create(Application) do
              begin
                Databasename := 'DBBROKER';
                SQL.Add('DELETE FROM TLAUDO_TECNICO_EXP');
                SQL.Add('WHERE CD_MERCADORIA = :CD_MERCADORIA');
                SQL.Add('AND NR_LAUDO = :NR_LAUDO');
                ParambyName('CD_MERCADORIA').AsString := datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString;
                ParambyName('NR_LAUDO').AsString      := datm_Laudo.qry_Laudo_NR_LAUDO.AsString;
                ExecSQL;
                Close;
                Free;
              end;
            end
            else
            If RespMensagem = mrCancel then
            begin
              Showmessage('Operação cancelada!');

              If datm_main.db_broker.InTransaction then
                 datm_main.db_broker.Rollback;

              Exit;
            end;

          end;

          ExcelWB.ConnectTo(ExcelApp.Workbooks.Open(dlgOpenExcelEXP.FileName, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0));
          ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] As ExcelWorksheet);

          PossiveisDescricoes.Clear;
          ExtractStrings([';'],[],PChar(Trim(dbedtDescr_Merc.Text)), PossiveisDescricoes);

          for I2 := 0 to PossiveisDescricoes.Count-1 do
          begin
            Celula := ExcelWS.Cells.Find(' '+PossiveisDescricoes.Strings[I2], EmptyParam, xlFormulas, xlPart, xlByRows, xlNext, False, False);
            I := 0;

            while Assigned(Celula) and (not VarIsNull(Celula)) and (not VarIsEmpty(Celula)) and (Celula.Row > I) do
            begin
              I := Celula.Row;

              vMercadoria            := Trim(datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString);
              vLaudo                 := Trim(datm_laudo.qry_Laudo_NR_LAUDO.AsString);
              vNumeroRE              := Trim(StringReplace(StringReplace(ExcelWS.Range['A'+InttoStr(I), 'A'+InttoStr(I)].Value2, '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]));
              vDataEmbarque          := Trim(StringReplace(ExcelWS.Range['B'+InttoStr(I), 'B'+InttoStr(I)].Value2, '/', '', [rfReplaceAll]));
              vNCM                   := Trim(ExcelWS.Range['C'+InttoStr(I), 'C'+InttoStr(I)].Value2);
              vDescricao             := Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2);
              vUnidMedida            := Trim(ExcelWS.Range['H'+InttoStr(I), 'H'+InttoStr(I)].Value2);
              vQtdeOriginal          := StrtoFloat(Trim(ExcelWS.Range['I'+InttoStr(I), 'I'+InttoStr(I)].Value2));
              vQtde_Original         := ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2;
              vPesoOriginal          := ExcelWS.Range['F'+InttoStr(I), 'F'+InttoStr(I)].Value2;
              vValorMLE_ItemOriginal := ExcelWS.Range['I'+InttoStr(I), 'I'+InttoStr(I)].Value2;
              vMoeda                 := Trim(ExcelWS.Range['J'+InttoStr(I), 'J'+InttoStr(I)].Value2);
              vDescricaoOriginal     := vDescricao;

              with TQuery.Create(Application) do
              begin
                Databasename := 'DBBROKER';
                SQL.Add('SELECT TOP 1 ISNULL(NM_SIGLA, '''') AS SIGLA FROM TUNID_MEDIDA_BROKER');
                SQL.Add('WHERE NM_UNID_MEDIDA LIKE ''%'+ vUnidMedida +'%''');
                SQL.Add('AND NM_SIGLA IS NOT NULL');
                Open;

                If FieldbyName('SIGLA').AsString = '' then
                  Unidade := vUnidMedida
                else
                  Unidade := FieldbyName('SIGLA').AsString;

                UnidadeOriginal := Unidade;

                Close;
                Free;
              end;

              //Marcador := 0;

              vQtdeMerc := '0';
              vPesoMerc := '0';

              repeat

                repeat
                  DecimalSeparator := '.';
                  Posicao := Pos(UpperCase(Trim(PossiveisDescricoes.Strings[I2])), UpperCase(vDescricao));

                  if Posicao = 0 then
                    Posicao := Length(vDescricao) +1;

                    S := Copy(vDescricao, 0, Posicao -1);

                  //----------------------------------------------------------------------------------------------

                  If Unidade = 'SH' THen // Caso a unidade seja 'Chapas', verifica as suas variantes
                  begin
                    If Pos(Uppercase('CHAPAS'), Uppercase(S)) <> 0 then
                      Unidade := 'CHAPAS';
                  end;

                  If Unidade = 'TO' then                    // Caso a unidade de medida seja 'Tonelada', verifica as suas variantes.
                  begin
                    If Pos(UpperCase('TON'), UpperCase(S)) <> 0 then
                      begin
                        Unidade := 'TON';
                      end
                    else
                    If Pos(UpperCase('TONS'), UpperCase(S)) <> 0 then
                      begin
                        Unidade := 'TONS';
                      end
                    else
                    If Pos(UpperCase('KG'), UpperCase(S)) <> 0 then
                      begin
                        Unidade := 'KG';
                      end
                    else
                    If Pos(UpperCase(Unidade), UpperCase(S)) <> 0 then
                      begin
                        Unidade := Unidade;
                      end
                    else
                    If Pos(UpperCase(Trim(ExcelWS.Range['H'+InttoStr(I), 'H'+InttoStr(I)].Value2)), UpperCase(S)) <> 0 then
                      begin
                        Unidade := Trim(ExcelWS.Range['H'+InttoStr(I), 'H'+InttoStr(I)].Value2)
                      end
                    else
                    If Pos('  ', Uppercase(S)) <> 0 then
                      begin
                        Unidade := '  ';
                      end
                  end;

                  If Pos(UpperCase(Unidade), UpperCase(S)) <> 0 then
                    begin
                      if Unidade = '  ' then
                      begin
                        S := Copy(S, 0, Pos('  ', S) - 1);
                        Posicao := Length(S);
                        PosicaoOriginal := Posicao;

                        while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                        begin
                          If S[Posicao] in [',','.'] then
                          begin
                             S := Copy(S, Posicao-5, PosicaoOriginal);
                             Posicao := Length(S);

                             while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                             begin
                               Dec(Posicao);
                             end;
                             Break;

                          end;

                          Dec(Posicao);
                        end;

                        //vQtdeMerc := Trim(Copy(S, Posicao, Length(S)));
                        //vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                        vQtdeAux  := Trim(Copy(S, Posicao, Length(S)));
                        vQtdeAux  := StringReplace(vQtdeAux, ',', '.', [rfReplaceAll]);

                        vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc)+StrtoFloat(vQtdeAux));
                        vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                        try

                          If UnidadeOriginal = 'TO' then
                          begin
                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            If ( StrtoFloat(vQtdeMerc) > 0) and ( StrtoFloat(vQtdeMerc) < 100 )  then
                              vPesoMerc := FloatToStr(StrtoFloat(vQtdeMerc)*1000)
                            else
                              vPesoMerc := vQtdeMerc;

                          end
                          else If UnidadeOriginal = 'KG' then
                          begin
                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                              vPesoMerc := vQtdeMerc;
                          end
                          else If UnidadeOriginal = 'CX' then
                          begin
                            Posicao := Pos(UpperCase(Trim(PossiveisDescricoes.Strings[I2])), UpperCase(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)));
                            if Posicao = 0 then
                              Posicao := Length(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)) +1;

                              S := Copy(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PossiveisDescricoes.Strings[I2])+15));
                          end;
                        except
                          DecimalSeparator := ',';
                          If UnidadeOriginal = 'TO' then
                          begin
                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            If ( StrtoFloat(vQtdeMerc) > 0) and ( StrtoFloat(vQtdeMerc) < 100 )  then
                              vPesoMerc := FloatToStr(StrtoFloat(vQtdeMerc)*1000)
                            else
                              vPesoMerc := vQtdeMerc;

                          end
                          else
                          If UnidadeOriginal = 'KG' then
                          begin
                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                              vPesoMerc := vQtdeMerc;
                          end
                          else If UnidadeOriginal = 'CX' then
                          begin
                            vPesoMerc := '';
                            Posicao := Pos(UpperCase(Trim(PossiveisDescricoes.Strings[I2])), UpperCase(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)));
                            if Posicao = 0 then
                              Posicao := Length(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)) +1;

                            S := Copy(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PossiveisDescricoes.Strings[I2])+15));

                            If Pos('KG', S) > 0 then
                              S := Trim(Copy(S, 0, Pos('KG', S) - 1))
                            else
                            begin
                              // Se o sistema não encontrou a referência pelo KG, procura pela grama. Para isso, verifica a letra G precedida por um número de 0 a 9
                              // para evitar que ele encontre simplesmente a letra G no meio de uma palavra qualquer.           Eric        09:20h  03/07/2012.

                              If Pos('0G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('0G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('1G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('1G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('2G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('2G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('3G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('3G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('4G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('4G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('5G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('5G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('6G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('6G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('7G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('7G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('8G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('8G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('9G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('9G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end;
                            end;

                            Posicao := 0;

                            //PosicaoOriginal := Posicao;
                            while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                            begin
                              If S[Posicao] in [',','.'] then
                              begin

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                  DecimalSeparator := '.';
                                end;


                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;
                                Break;

                              end;

                              Dec(Posicao);
                            end;

                            vPesoMerc := FloatToStr(CXPesoKG*CXQtde*StrtoFloat(vQtdeMerc));
                            Posicao := Pos(UpperCase(Trim(PossiveisDescricoes.Strings[I2])), UpperCase(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)));
                            if Posicao = 0 then
                              Posicao := Length(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)) +1;

                              S := Copy(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PossiveisDescricoes.Strings[I2])+15));
                          end;
                          DecimalSeparator := '.';

                        end;
                      end
                      else
                      begin
                        //S := Trim(Copy(S, 0, Pos(Unidade, RightStr(S, 10)) - 1));

                        //S := Trim(Copy(S, 0, Pos(Unidade, S)-1));

                        Marcador := Pos(Unidade, S);

                        while (Marcador > 0) do
                        begin
                          Posicao := Marcador;
                          Marcador := PosEx(Unidade, S, Posicao+1);
                        end;

                        S := Trim(Copy(S, 0, Posicao-1));

                        S := Trim(RightStr(S, 12));

                        Posicao := Length(S);
                        PosicaoOriginal := Posicao;

                        Marcador := 0;

                        while (not (Posicao = 0)) and (S[Posicao] <> '') and (Marcador <= 1) do
                        begin
                          If not (S[Posicao] in ['0','1', '2', '3', '4', '5', '6', '7', '8', '9', '.', ',']) then
                           S := StringReplace(S, S[Posicao], ' ', [rfReplaceAll])
                          Else
                          If S[Posicao] = ' ' then
                           Marcador := Marcador + 1;

                          Dec(Posicao);
                        end;

                        while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                        begin
                          If S[Posicao] in [',','.'] then
                          begin
                            S := Copy(S, Posicao-5, PosicaoOriginal);
                            Posicao := Length(S);

                            while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) and (S[Posicao] in ['0','1', '2', '3', '4', '5', '6', '7', '8', '9', '.', ',']) do
                            begin
                              Dec(Posicao);
                            end;

                            Break;

                          end;

                          Dec(Posicao);
                        end;

                        //vQtdeMerc := Trim(Copy(S, Posicao, Length(S)));

                        S := Trim(S);
                        Posicao := Length(S);

                        while (S[Posicao] <> ' ') and (S[Posicao] <> '') do
                        begin
                          Dec(Posicao);
                        end;

                        S := Copy(S, Posicao, Length(S));

                        //vQtdeMerc := Trim(S);
                        //vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                        {DecimalSeparator := ',';
                      
                        vQtdeAux  := Trim(S);
                        vQtdeAux  := StringReplace(vQtdeAux, '.', '', [rfReplaceAll]);}

                        If AnsiIndexStr(Unidade, ['TON','TO','TONS']) >= 0 Then
                        begin
                          DecimalSeparator := '.';

                          vQtdeAux  := Trim(S);

                          If Pos(',',vQtdeMerc) <> 0 Then
                            vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                          If Pos(',', vQtdeAux) <> 0 Then
                            vQtdeAux  := StringReplace(vQtdeAux, ',', '.', [rfReplaceAll]);

                          vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc)+StrtoFloat(vQtdeAux));
                          vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);
                        end
                        else
                        begin
                          DecimalSeparator := ',';

                          vQtdeAux  := Trim(S);
                          vQtdeAux  := StringReplace(vQtdeAux, '.', '', [rfReplaceAll]);

                          vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc)+StrtoFloat(vQtdeAux));
                          vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);
                        end;

                        DecimalSeparator := '.';

                        try
                          If UnidadeOriginal = 'TO' then
                          begin

                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            vUnidMedida := 'KG';

                            If StrToFloat(vQtdeMerc) > 500 then
                            begin
                              vPesoMerc := vQtdeMerc;
                            end
                            else
                            begin
                              vPesoMerc := FloattoStr(StrtoFloat(vQtdeMerc)*1000);
                            end;

                          end
                          else If UnidadeOriginal = 'KG' then
                          begin
                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                              vPesoMerc := vQtdeMerc;
                          end
                          else If UnidadeOriginal = 'CX' then
                          begin
                            vPesoMerc := '';
                            Posicao := Pos(UpperCase(Trim(PossiveisDescricoes.Strings[I2])), UpperCase(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)));
                            if Posicao = 0 then
                              Posicao := Length(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)) +1;

                            S := Copy(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PossiveisDescricoes.Strings[I2])+16));

                            If Pos('KG', S) > 0 then
                              S := Trim(Copy(S, 0, Pos('KG', S) - 1))
                            else
                            begin
                              // Se o sistema não encontrou a referência pelo KG, procura pela grama. Para isso, verifica a letra G precedida por um número de 0 a 9
                              // para evitar que ele encontre simplesmente a letra G no meio de uma palavra qualquer.           Eric        09:20h  03/07/2012.

                              If Pos('0G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('0G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('1G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('1G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('2G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('2G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('3G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('3G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('4G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('4G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('5G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('5G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('6G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('6G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('7G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('7G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('8G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('8G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end
                              else
                              If Pos('9G', S) > 0 Then
                              begin
                                S := Trim(Copy(S, 0, Pos('9G', S)));
                                Posicao := Length(S);
                                PosicaoOriginal := Posicao;

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                  DecimalSeparator := '.';
                                end;

                              end;
                            end;

                            Posicao := 0;

                            //PosicaoOriginal := Posicao;
                            while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                            begin
                              If S[Posicao] in [',','.'] then
                              begin

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                                except
                                  DecimalSeparator := ',';

                                  CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                  DecimalSeparator := '.';
                                end;

                                S := Copy(S, 0, Posicao-1);
                                Posicao := Length(S);

                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;

                                try
                                  CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                                except
                                  DecimalSeparator := ',';

                                  CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                  DecimalSeparator := '.';
                                end;


                                while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                                begin
                                  Dec(Posicao);
                                end;
                                Break;

                              end;

                              Dec(Posicao);
                            end;

                            {vQtdeMerc := StringReplace(vQtdeMerc, '.', '', [rfReplaceAll]);
                            vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                            DecimalSeparator := '.';

                            vPesoMerc := FloatToStr(CXPesoKG*CXQtde*StrtoFloat(vQtdeMerc));

                            DecimalSeparator := ',';}
                          end;

                        except
                          DecimalSeparator := ',';

                          If UnidadeOriginal = 'TO' then
                          begin
                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            If ( StrtoFloat(vQtdeMerc) > 0) and ( StrtoFloat(vQtdeMerc) < 100 ) then
                              vPesoMerc := FloatToStr(StrtoFloat(vQtdeMerc)*1000)
                            else
                              vPesoMerc := vQtdeMerc;

                          end
                          else If UnidadeOriginal = 'KG' then
                          begin
                            If StrtoFloat(vQtdeMerc) < 0 then
                              vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                              vPesoMerc := vQtdeMerc;
                          end
                          else If UnidadeOriginal = 'CX' then
                          begin
                            Posicao := Pos(UpperCase(Trim(PossiveisDescricoes.Strings[I2])), UpperCase(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)));
                            if Posicao = 0 then
                              Posicao := Length(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2)) +1;

                              S := Copy(Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PossiveisDescricoes.Strings[I2])+15));
                          end;
                          DecimalSeparator := '.';
                        end;
                      end;
                    end
                  else
                  begin
                    vPesoMerc := Trim(ExcelWS.Range['F'+InttoStr(I), 'F'+InttoStr(I)].Value2);
                    vQtdeMerc := Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2);
                  end;

                until ((vQtdeMerc <> '') or (vPesoMerc <> ''));

                vDescricao := StringReplace(vDescricao, Copy(vDescricao, 0, Pos(PossiveisDescricoes.Strings[I2], vDescricao)+Length(PossiveisDescricoes.Strings[I2])), '', []);

              until Pos(PossiveisDescricoes.Strings[I2], vDescricao) = 0;

              If (Unidade <> 'TO') and (UnidadeOriginal <> 'TO') and (not (AnsiIndexStr(Unidade, ['TO', 'TON', 'TONS']) >= 0)) then
              begin
                vQtdeMerc := StringReplace(vQtdeMerc, '.', '', [rfReplaceAll]);
              end;

              vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

              DecimalSeparator := '.';

              If (vPesoMerc = '') or (vPesoMerc = '0') then
                vPesoMerc := FloatToStr(CXPesoKG*CXQtde*StrtoFloat(vQtdeMerc));

              DecimalSeparator := '.';

              vValorMLE_Item    := Trim(ExcelWS.Range['I'+InttoStr(I), 'I'+InttoStr(I)].Value2);
              vValorMLE_MN      := Trim(ExcelWS.Range['K'+InttoStr(I), 'K'+InttoStr(I)].Value2);
              vPc_Comissao      := StrToFloat(Trim(StringReplace(ExcelWS.Range['L'+InttoStr(I), 'L'+InttoStr(I)].Value2, '%', '', [rfReplaceAll])));
              vValorComissao    := Trim(ExcelWS.Range['M'+InttoStr(I), 'M'+InttoStr(I)].Value2);
              vValorMLE_Item_MN := Trim(ExcelWS.Range['N'+InttoStr(I), 'N'+InttoStr(I)].Value2);
              vEnquadramento    := Trim(ExcelWS.Range['O'+InttoStr(I), 'O'+InttoStr(I)].Value2);

              vQtdeOriginal :=  ExcelWS.Range['F'+InttoStr(I), 'F'+InttoStr(I)].Value2;

              vValorMLE_Item    := FormatFloat('0.00', AtualizaValores(vQtdeOriginal, StrtoFloat(vPesoMerc), StrtoFloat(vValorMLE_Item)));
              vValorMLE_MN      := FormatFloat('0.00', AtualizaValores(vQtdeOriginal, StrtoFloat(vPesoMerc), StrtoFloat(vValorMLE_MN)));
              vValorComissao    := FormatFloat('0.00', AtualizaValores(vQtdeOriginal, StrtoFloat(vPesoMerc), StrtoFloat(vValorComissao)));
              vValorMLE_Item_MN := FormatFloat('0.00', AtualizaValores(vQtdeOriginal, StrtoFloat(vPesoMerc), StrtoFloat(vValorMLE_Item_MN)));

              If AnsiIndexStr(UnidadeOriginal, ['KG','TON','TO', 'TONS']) >= 0 then
              begin
                 vQtdeMerc := vPesoMerc;
              end;

              with TQuery.Create(Application) do
              begin
                DatabaseName := 'DBBROKER';
                SQL.Clear;
                SQL.Add('INSERT INTO TLAUDO_TECNICO_EXP');
                SQL.Add('VALUES ('+QuotedStr(vMercadoria)+','+QuotedStr(vLaudo)+','+QuotedStr(vNumeroRE)+','+QuotedStr(vDataEmbarque)+',');
                SQL.Add(QuotedStr(vNCM)+','+QuotedStr(vDescricaoOriginal)+','+QuotedStr(vPesoMerc)+','+QuotedStr(FloattoStr(vPesoOriginal))+','+QuotedStr(vQtdeMerc)+','+QuotedStr(FloattoStr(vQtde_Original))+','+QuotedStr(DeParaUnidMedida(vUnidMedida))+','+QuotedStr(vValorMLE_Item)+','+QuotedStr(FloattoStr(vValorMLE_ItemOriginal))+',');
                SQL.Add(QuotedStr(DeParaMoeda(vMoeda))+','+QuotedStr(vValorMLE_MN)+','+QuotedStr(FloattoStr(vPc_Comissao))+','+QuotedStr(vValorComissao)+','+QuotedStr(vValorMLE_Item_Mn)+','+QuotedStr(vEnquadramento)+')');
                //Showmessage(SQL.Text);

                {SQL.Add('INSERT INTO TLAUDO_TECNICO_EXP');
                SQL.Add('VALUES (:Mercadoria, :Laudo, :NumeroRE, :DataEmbarque, :NCM, :Descricao, :PesoMerc, :QtdeMerc, :UnidMedida, :ValorMLE_Item, ');
                SQL.Add(':Moeda, :ValorMLE_MN, :Pc_Comissao, :ValorComissao, :ValorMLE_Item_Mn, :Enquadramento, :PesoMercOriginal, :QtdeMercOriginal, :VMLEOriginal)');}

                {ParambyName('Mercadoria').AsString       := vMercadoria;
                ParambyName('Laudo').AsString            := vLaudo;
                ParambyName('NumeroRE').AsString         := vNumeroRE;
                ParambyName('DataEmbarque').AsString     := vDataEmbarque;
                ParambyName('NCM').AsString              := vNCM;
                ParambyName('Descricao').AsString        := vDescricaoOriginal;
                ParambyName('PesoMerc').AsFloat          := StrToFloat(vPesoMerc);
                ParambyName('QtdeMerc').AsFloat          := StrtoFloat(vQtdeMerc);
                ParambyName('UnidMedida').AsString       := DeParaUnidMedida(vUnidMedida);
                ParambyName('ValorMLE_Item').AsFloat     := StrtoFloat(vValorMLE_Item);
                ParambyName('Moeda').AsString            := DeParaMoeda(vMoeda);
                ParambyName('ValorMLE_MN').AsFloat       := StrtoFloat(vValorMLE_MN);
                ParambyName('Pc_Comissao').AsFloat       := vPc_Comissao;
                ParambyName('ValorComissao').AsFloat     := StrtoFloat(vValorComissao);
                ParambyName('ValorMLE_Item_MN').AsFloat  := StrtoFloat(vValorMLE_Item_MN);
                ParambyName('Enquadramento').AsFloat     := StrtoFloat(vEnquadramento);
                ParambyName('PesoMercOriginal').AsFloat  := vPesoOriginal;
                ParambyName('QtdeMercOriginal').AsFloat  := vQtde_Original;
                ParambyName('VMLEOriginal').AsFloat      := vValorMLE_ItemOriginal;}

                ExecSQL;
              end;
              DecimalSeparator := ',';

              Celula := ExcelWS.Cells.Find(' '+Trim(PossiveisDescricoes.Strings[I2]), Celula, xlFormulas, xlPart, xlByRows, xlNext, False, False);
            end;
          end;

          ExcelWS.Disconnect;
          ExcelWB.Close(False);
          ExcelWB.Disconnect;

        end;

        // Lê todos as matérias-primas para pesquisar suas palavras-chave

        If Trim(dlgOpenExcelIMP.FileName) <> '' then
        begin
          ExcelWB.ConnectTo(ExcelApp.Workbooks.Open(dlgOpenExcelIMP.FileName, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0));
          ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] As ExcelWorksheet);

          PalavrasChave := TStringList.Create;

          datm_Laudo.qry_lista_mat_pri_.DisableControls;
          datm_laudo.qry_lista_mat_pri_.First;

          //Posicao := 0;
          //PosicaoOriginal := 0;

          while not datm_laudo.qry_lista_mat_pri_.Eof do
          begin

            with TQuery.Create(Application) do
            begin
              Databasename := 'DBBROKER';
              SQL.Clear;
              SQL.Add('SELECT * FROM TLAUDO_TECNICO_IMP');
              SQL.Add('WHERE CD_MERCADORIA = '+QuotedStr(datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString));
              SQL.Add('AND NR_LAUDO = '+QuotedStr(datm_laudo.qry_Laudo_NR_LAUDO.AsString));
              SQL.Add('AND CD_MAT_PRI = '+QuotedStr(datm_laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString));
              Open;
              CountExp := RecordCount;
              Close;
              Free;
            end;

            If CountExp > 0 then
            begin
              RespMensagem := MessageDlg('A matéria-prima de cód. '+datm_laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString+' já possui registros salvos no sistema.'+#13#10
                 +'Clique em ''Sim'' para excluir os registros existentes, ''Não'' para inserir os novos valores e manter os registros existentes, e em ''Cancelar'' para cancelar a operação.', mtWarning, mbYesNoCancel, 0);

              If RespMensagem = mrYes then
              begin
                with TQuery.Create(Application) do
                begin
                  Databasename := 'DBBROKER';
                  SQL.Add('DELETE FROM TLAUDO_TECNICO_IMP');
                  SQL.Add('WHERE CD_MERCADORIA = :CD_MERCADORIA');
                  SQL.Add('AND NR_LAUDO = :NR_LAUDO');
                  SQL.Add('AND CD_MAT_PRI = :CD_MAT_PRI');
                  ParambyName('CD_MERCADORIA').AsString := datm_Laudo.qry_lista_mat_pri_CD_MERCADORIA.AsString;
                  ParambyName('NR_LAUDO').AsString      := datm_Laudo.qry_lista_mat_pri_NR_LAUDO.AsString;
                  ParambyName('CD_MAT_PRI').AsString    := datm_laudo.qry_laudo_mat_pri_CD_MAT_PRI.AsString;
                  ExecSQL;
                  Close;
                  Free;
                end;
              end
              else
              If RespMensagem = mrCancel then
              begin

                If datm_main.db_broker.InTransaction then
                   datm_main.db_broker.Rollback;

                ExcelWS.Disconnect;
                ExcelWB.Close(False);
                ExcelWB.Disconnect;
                ExcelApp.Disconnect;
                FreeAndNil(ExcelWS);
                FreeAndNil(ExcelWB);
                FreeAndNil(ExcelApp);

                Exit;
              end;

            end;

            PalavrasChave.Clear;
            ExtractStrings([';'],[],PChar(Trim(datm_laudo.qry_lista_mat_pri_.FieldbyName('NR_PALAVRAS_CHAVE').AsString)), PalavrasChave);

            for I2 := 0 to PalavrasChave.Count-1 do
            begin
              Celula := ExcelWS.Cells.Find(Trim(PalavrasChave.Strings[I2]), EmptyParam, xlFormulas, xlPart, xlByRows, xlNext, False, False);
              I := 0;

              while Assigned(Celula) and (not VarIsNull(Celula)) and (not VarIsEmpty(Celula)) and (Celula.Row > I) do
              begin
                I := Celula.Row;

                DecimalSeparator := '.';

                vMercadoria            := Trim(datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString);
                vLaudo                 := Trim(datm_laudo.qry_Laudo_NR_LAUDO.AsString);
                vNumeroDI              := Trim(StringReplace(StringReplace(ExcelWS.Range['A'+InttoStr(I), 'A'+InttoStr(I)].Value2, '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]));
                vNrAdicao              := Trim(Copy(ExcelWS.Range['B'+InttoStr(I), 'B'+InttoStr(I)].Value2, 1, 3));
                vNrItem                := Trim(Copy(ExcelWS.Range['B'+InttoStr(I), 'B'+InttoStr(I)].Value2, 7, 2));
                vNrItem                := FormatFloat('000', StrToFloat(vNrItem));
                vDtRegistroDI          := Trim(StringReplace(ExcelWS.Range['C'+InttoStr(I), 'C'+InttoStr(I)].Value2, '/', '', [rfReplaceAll]));
                vDtDesembaraco         := Trim(StringReplace(ExcelWS.Range['D'+InttoStr(I), 'D'+InttoStr(I)].Value2, '/', '', [rfReplaceAll]));
                vNCM                   := Trim(ExcelWS.Range['E'+InttoStr(I), 'E'+InttoStr(I)].Value2);
                vDescricao             := Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2);
                vPesoMerc              := Trim(ExcelWS.Range['H'+InttoStr(I), 'H'+InttoStr(I)].Value2);
                vQtdeMerc              := Trim(ExcelWS.Range['I'+InttoStr(I), 'I'+InttoStr(I)].Value2);
                vUnidMedida            := Trim(ExcelWS.Range['J'+InttoStr(I), 'J'+InttoStr(I)].Value2);
                vValorMLE_Item         := Trim(ExcelWS.Range['K'+InttoStr(I), 'K'+InttoStr(I)].Value2);
                vMoeda                 := Trim(ExcelWS.Range['L'+InttoStr(I), 'L'+InttoStr(I)].Value2);
                vValorMLE_MN           := Trim(ExcelWS.Range['M'+InttoStr(I), 'M'+InttoStr(I)].Value2);
                vFreteDolar            := Trim(ExcelWS.Range['N'+InttoStr(I), 'N'+InttoStr(I)].Value2);
                vSeguroDolar           := Trim(ExcelWS.Range['O'+InttoStr(I), 'O'+InttoStr(I)].Value2);
                vTaxaX                 := Trim(ExcelWS.Range['P'+InttoStr(I), 'P'+InttoStr(I)].Value2);
                vTaxaDolar             := Trim(ExcelWS.Range['Q'+InttoStr(I), 'Q'+InttoStr(I)].Value2);

                vQtde_Original         := ExcelWS.Range['I'+InttoStr(I), 'I'+InttoStr(I)].Value2;
                vPesoOriginal          := ExcelWS.Range['H'+InttoStr(I), 'H'+InttoStr(I)].Value2;
                vValorMLE_ItemOriginal := ExcelWS.Range['K'+InttoStr(I), 'K'+InttoStr(I)].Value2;

  // ----------------------------------------------------------------------------------------------------------------------------------------------

                vDescricaoOriginal := vDescricao;

                with TQuery.Create(Application) do
                begin
                  Databasename := 'DBBROKER';
                  SQL.Add('SELECT TOP 1 ISNULL(NM_SIGLA, '''') AS SIGLA FROM TUNID_MEDIDA_BROKER');
                  SQL.Add('WHERE NM_UNID_MEDIDA LIKE ''%'+ vUnidMedida +'%''');
                  SQL.Add('AND NM_SIGLA IS NOT NULL');
                  Open;

                  If FieldbyName('SIGLA').AsString = '' then
                    Unidade := vUnidMedida
                  else
                    Unidade := FieldbyName('SIGLA').AsString;

                  UnidadeOriginal := Unidade;

                  Close;
                  Free;
                end;

                repeat
                  DecimalSeparator := '.';
                  Posicao := Pos(UpperCase(Trim(PalavrasChave.Strings[I2])), Uppercase(vDescricao));

                  If Posicao = 0 then
                    Posicao := Length(vDescricao)+1;

                  S := Copy(vDescricao, 0, Posicao-1);

                  If Unidade = 'SH' THen // Caso a unidade seja 'Chapas', verifica as suas variantes
                  begin
                    If Pos(Uppercase('CHAPAS'), Uppercase(S)) <> 0 then
                      Unidade := 'CHAPAS';
                  end;

                  If Unidade = 'TO' then                    // Caso a unidade de medida seja 'Tonelada', verifica as suas variantes.
                  begin
                    If Pos(UpperCase('TON'), UpperCase(S)) <> 0 then
                    begin
                      Unidade := 'TON';
                    end
                    else
                    If Pos(UpperCase('TONS'), UpperCase(S)) <> 0 then
                    begin
                      Unidade := 'TONS';
                    end
                    else
                    If Pos(UpperCase('KG'), UpperCase(S)) <> 0 then
                    begin
                      Unidade := 'KG';
                    end
                    else
                    If Pos(UpperCase(' '+Unidade+' '), UpperCase(S)) <> 0 then
                    begin
                      Unidade := Unidade;
                    end
                    else
                    If Pos(UpperCase(Trim(ExcelWS.Range['J'+InttoStr(I), 'J'+InttoStr(I)].Value2)), UpperCase(S)) <> 0 then
                    begin
                      Unidade := Trim(ExcelWS.Range['J'+InttoStr(I), 'J'+InttoStr(I)].Value2)
                    end
                    else
                    If Pos('  ', Uppercase(S)) <> 0 then
                    begin
                      Unidade := '  ';
                    end
                  end;

                  If Pos(UpperCase(' '+Unidade+' '), UpperCase(S)) <> 0 then
                  begin
                    if Unidade = '  ' then
                    begin
                      S := Copy(S, 0, Pos('  ', S) - 1);
                      Posicao := Length(S);
                      PosicaoOriginal := Posicao;

                      while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                      begin
                        If S[Posicao] in [',','.'] then
                        begin
                           S := Copy(S, Posicao-5, PosicaoOriginal);
                           Posicao := Length(S);

                           while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                           begin
                             Dec(Posicao);
                           end;
                           Break;

                        end;

                        Dec(Posicao);
                      end;

                      vQtdeAux  := Trim(Copy(S, Posicao, Length(S)));
                      vQtdeAux  := StringReplace(vQtdeAux, ',', '.', [rfReplaceAll]);

                      vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc)+StrtoFloat(vQtdeAux));
                      vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                      try

                        If UnidadeOriginal = 'TO' then
                        begin
                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                          If ( StrtoFloat(vQtdeMerc) > 0) and ( StrtoFloat(vQtdeMerc) < 100 )  then
                            vPesoMerc := FloatToStr(StrtoFloat(vQtdeMerc)*1000)
                          else
                            vPesoMerc := vQtdeMerc;

                        end
                        else If UnidadeOriginal = 'KG' then
                        begin
                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            vPesoMerc := vQtdeMerc;
                        end
                        else If UnidadeOriginal = 'CX' then
                        begin
                          Posicao := Pos(UpperCase(Trim(PalavrasChave.Strings[I2])), UpperCase(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)));
                          if Posicao = 0 then
                            Posicao := Length(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)) +1;

                            S := Copy(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PalavrasChave.Strings[I2])+15));
                        end;
                      except
                        DecimalSeparator := ',';
                        If UnidadeOriginal = 'TO' then
                        begin
                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                          If ( StrtoFloat(vQtdeMerc) > 0) and ( StrtoFloat(vQtdeMerc) < 100 )  then
                            vPesoMerc := FloatToStr(StrtoFloat(vQtdeMerc)*1000)
                          else
                            vPesoMerc := vQtdeMerc;

                        end
                        else
                        If UnidadeOriginal = 'KG' then
                        begin
                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            vPesoMerc := vQtdeMerc;
                        end
                        else If UnidadeOriginal = 'CX' then
                        begin
                          vPesoMerc := '';
                          Posicao := Pos(UpperCase(Trim(PalavrasChave.Strings[I2])), UpperCase(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)));
                          if Posicao = 0 then
                            Posicao := Length(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)) +1;

                          S := Copy(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PalavrasChave.Strings[I2])+15));

                          If Pos('KG', S) > 0 then
                            S := Trim(Copy(S, 0, Pos('KG', S) - 1))
                          else
                          begin
                            // Se o sistema não encontrou a referência pelo KG, procura pela grama. Para isso, verifica a letra G precedida por um número de 0 a 9
                            // para evitar que ele encontre simplesmente a letra G no meio de uma palavra qualquer.           Eric        09:20h  03/07/2012.

                            If Pos('0G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('0G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('1G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('1G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('2G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('2G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('3G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('3G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('4G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('4G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('5G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('5G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('6G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('6G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('7G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('7G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('8G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('8G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('9G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('9G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end;
                          end;

                          Posicao := 0;

                          //PosicaoOriginal := Posicao;
                          while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                          begin
                            If S[Posicao] in [',','.'] then
                            begin

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                DecimalSeparator := '.';
                              end;


                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;
                              Break;

                            end;

                            Dec(Posicao);
                          end;

                          vPesoMerc := FloatToStr(CXPesoKG*CXQtde*StrtoFloat(vQtdeMerc));
                          Posicao := Pos(UpperCase(Trim(PalavrasChave.Strings[I2])), UpperCase(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)));
                          if Posicao = 0 then
                            Posicao := Length(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)) +1;

                            S := Copy(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PalavrasChave.Strings[I2])+15));
                        end;
                        DecimalSeparator := '.';

                      end;
                    end
                    else
                    begin
                      Marcador := Pos(Unidade, S);

                      while (Marcador > 0) do
                      begin
                        Posicao := Marcador;
                        Marcador := PosEx(Unidade, S, Posicao+1);
                      end;

                      S := Trim(Copy(S, 0, Posicao-1));

                      S := Trim(RightStr(S, 10));

                      Posicao := Length(S);
                      PosicaoOriginal := Posicao;

                      Marcador := 0;

                      while (not (Posicao = 0)) and (S[Posicao] <> '') and (Marcador <= 1) do
                      begin
                        If not (S[Posicao] in ['0','1', '2', '3', '4', '5', '6', '7', '8', '9', '.', ',']) then
                         S := StringReplace(S, S[Posicao], ' ', [])
                        Else
                        If S[Posicao] = ' ' then
                         Marcador := Marcador + 1;

                        Dec(Posicao);
                      end;

                      while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                      begin
                        If S[Posicao] in [',','.'] then
                        begin
                          S := Copy(S, Posicao-5, PosicaoOriginal);
                          Posicao := Length(S);

                          while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) and (S[Posicao] in ['0','1', '2', '3', '4', '5', '6', '7', '8', '9', '.', ',']) do
                          begin
                            Dec(Posicao);
                          end;

                          Break;

                        end;

                        Dec(Posicao);
                      end;

                      //vQtdeMerc := Trim(Copy(S, Posicao, Length(S)));

                      S := Trim(S);
                      Posicao := Length(S);

                      while (S[Posicao] <> ' ') and (S[Posicao] <> '') do
                      begin
                        Dec(Posicao);
                      end;

                      S := Copy(S, Posicao, Length(S));

                      DecimalSeparator := ',';

                      vQtdeAux  := Trim(S);
                      vQtdeAux  := StringReplace(vQtdeAux, '.', '', [rfReplaceAll]);

                      vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc)+StrtoFloat(vQtdeAux));
                      vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                      try
                        If UnidadeOriginal = 'TO' then
                        begin

                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                          vUnidMedida := 'KG';

                          If StrToFloat(vQtdeMerc) > 100 then
                          begin
                            vPesoMerc := vQtdeMerc;
                          end
                          else
                          begin
                            vPesoMerc := FloattoStr(StrtoFloat(vQtdeMerc)*1000);
                          end;

                        end
                        else If UnidadeOriginal = 'KG' then
                        begin
                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            vPesoMerc := vQtdeMerc;
                        end
                        else If UnidadeOriginal = 'CX' then
                        begin
                          vPesoMerc := '';
                          Posicao := Pos(UpperCase(Trim(PalavrasChave.Strings[I2])), UpperCase(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)));
                          if Posicao = 0 then
                            Posicao := Length(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)) +1;

                          S := Copy(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PalavrasChave.Strings[I2])+16));

                          If Pos('KG', S) > 0 then
                            S := Trim(Copy(S, 0, Pos('KG', S) - 1))
                          else
                          begin
                            // Se o sistema não encontrou a referência pelo KG, procura pela grama. Para isso, verifica a letra G precedida por um número de 0 a 9
                            // para evitar que ele encontre simplesmente a letra G no meio de uma palavra qualquer.           Eric        09:20h  03/07/2012.

                            If Pos('0G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('0G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('1G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('1G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('2G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('2G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('3G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('3G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('4G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('4G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('5G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('5G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('6G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('6G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('7G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('7G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('8G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('8G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end
                            else
                            If Pos('9G', S) > 0 Then
                            begin
                              S := Trim(Copy(S, 0, Pos('9G', S)));
                              Posicao := Length(S);
                              PosicaoOriginal := Posicao;

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Trim(Copy(S, Posicao+1, PosicaoOriginal)))/1000;

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Trim(Copy(S, Posicao+1, Length(S))));

                                DecimalSeparator := '.';
                              end;

                            end;
                          end;

                          Posicao := 0;

                          //PosicaoOriginal := Posicao;
                          while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                          begin
                            If S[Posicao] in [',','.'] then
                            begin

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                              except
                                DecimalSeparator := ',';

                                CXPesoKG := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                DecimalSeparator := '.';
                              end;

                              S := Copy(S, 0, Posicao-1);
                              Posicao := Length(S);

                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (S[Posicao] <> 'X') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;

                              try
                                CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));
                              except
                                DecimalSeparator := ',';

                                CXQtde := StrtoFloat(Copy(S, Posicao+1, Length(S)));

                                DecimalSeparator := '.';
                              end;


                              while (S[Posicao] <> ' ') and (S[Posicao] <> '') and (Posicao > 0) do
                              begin
                                Dec(Posicao);
                              end;
                              Break;

                            end;

                            Dec(Posicao);
                          end;

                          {vQtdeMerc := StringReplace(vQtdeMerc, '.', '', [rfReplaceAll]);
                          vQtdeMerc := StringReplace(vQtdeMerc, ',', '.', [rfReplaceAll]);

                          DecimalSeparator := '.';

                          vPesoMerc := FloatToStr(CXPesoKG*CXQtde*StrtoFloat(vQtdeMerc));

                          DecimalSeparator := ',';}
                        end;

                      except
                        DecimalSeparator := ',';

                        If UnidadeOriginal = 'TO' then
                        begin
                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                          If ( StrtoFloat(vQtdeMerc) > 0) and ( StrtoFloat(vQtdeMerc) < 100 ) then
                            vPesoMerc := FloatToStr(StrtoFloat(vQtdeMerc)*1000)
                          else
                            vPesoMerc := vQtdeMerc;

                        end
                        else If UnidadeOriginal = 'KG' then
                        begin
                          If StrtoFloat(vQtdeMerc) < 0 then
                            vQtdeMerc := FloattoStr(StrtoFloat(vQtdeMerc) * -1);

                            vPesoMerc := vQtdeMerc;
                        end
                        else If UnidadeOriginal = 'CX' then
                        begin
                          Posicao := Pos(UpperCase(Trim(PalavrasChave.Strings[I2])), UpperCase(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)));
                          if Posicao = 0 then
                            Posicao := Length(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2)) +1;

                            S := Copy(Trim(ExcelWS.Range['G'+InttoStr(I), 'G'+InttoStr(I)].Value2), Posicao, Posicao+(Length(PalavrasChave.Strings[I2])+15));
                        end;
                        DecimalSeparator := '.';
                      end;
                    end;
                  end
                  else
                  begin
                    vPesoMerc := Trim(ExcelWS.Range['H'+InttoStr(I), 'H'+InttoStr(I)].Value2);
                    vQtdeMerc := Trim(ExcelWS.Range['I'+InttoStr(I), 'I'+InttoStr(I)].Value2);
                  end;

                until (vPesoMerc <> '') or (vQtdeMerc <> '');

  // ----------------------------------------------------------------------------------------------------------------------------------------------

                vPesoMerc := StringReplace(vPesoMerc, ',','',[rfReplaceAll]);
                vQtdeMerc := StringReplace(vQtdeMerc, ',', '', [rfReplaceAll]);

                DecimalSeparator := '.';

                with TQuery.Create(Application) do
                begin
                  DatabaseName := 'DBBROKER';
                  SQL.Clear;
                  SQL.Add('INSERT INTO TLAUDO_TECNICO_IMP (CD_MERCADORIA, NR_LAUDO, CD_MAT_PRI, NR_DI, NR_ADICAO, NR_ITEM, DT_REGISTRO_DI,');
                  SQL.Add('DT_DESEMBARACO, CD_NCM_SH, DESCRICAO, PL_MERCADORIA, QT_MERCADORIA, CD_UN_MEDIDA, VL_MLE_ITEM, CD_MOEDA,');
                  SQL.Add('VL_MLE_MNEG, VL_FRETE_MNEG, VL_SEGURO_MNEG, VL_TAXA_X, VL_TAXA_DOLAR, PL_MERCADORIA_ORIGINAL, QT_MERCADORIA_ORIGINAL, VL_MLE_ITEM_ORIGINAL)');

                  {SQL.Add('VALUES (:CD_MERCADORIA, :NR_LAUDO, :CD_MAT_PRI, :NR_DI, :NR_ADICAO, :NR_ITEM, :DT_REGISTRO_DI,');
                  SQL.Add(':DT_DESEMBARACO, :CD_NCM_SH, :DESCRICAO, :PL_MERCADORIA, :QT_MERCADORIA, :CD_UN_MEDIDA, :VL_MLE_ITEM, :CD_MOEDA,');
                  SQL.Add(':VL_MLE_MNEG, :VL_FRETE_MNEG, :VL_SEGURO_MNEG, :VL_TAXA_X, :VL_TAXA_DOLAR, :PL_MERCADORIA_ORIGINAL, :QT_MERCADORIA_ORIGINAL, :VL_MLE_ITEM_ORIGINAL)');

                  ParambyName('CD_MERCADORIA').AsString := vMercadoria;
                  ParambyName('NR_LAUDO').AsString := vLaudo;
                  ParambyName('CD_MAT_PRI').AsString := datm_Laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString;
                  ParambyName('NR_DI').AsString := vNumeroDI;
                  ParambyName('NR_ADICAO').AsString := vNrAdicao;
                  ParambyName('NR_ITEM').AsString := vNrItem;
                  ParambyName('DT_REGISTRO_DI').AsString := vDtRegistroDI;
                  ParambyName('DT_DESEMBARACO').AsString := vDtDesembaraco;
                  ParambyName('CD_NCM_SH').AsString := vNCM;
                  ParambyName('DESCRICAO').AsString := vDescricao;
                  ParambyName('PL_MERCADORIA').AsString := vPesoMerc;
                  ParambyName('QT_MERCADORIA').AsString := vQtdeMerc;
                  ParambyName('CD_UN_MEDIDA').AsString := DeParaUnidMedida(vUnidMedida);
                  ParambyName('VL_MLE_ITEM').AsString   := vValorMLE_Item;
                  ParamByName('CD_MOEDA').AsString     := DeParaMoeda(vMoeda);
                  ParambyName('VL_MLE_MNEG').AsString := vValorMLE_MN;
                  ParambyName('VL_FRETE_MNEG').AsString := vFreteDolar;
                  ParambyName('VL_SEGURO_MNEG').AsString := vSeguroDolar;
                  ParambyName('VL_TAXA_X').AsString := vTaxaX;
                  ParambyName('VL_TAXA_DOLAR').AsString := vTaxaDolar;
                  ParambyName('PL_MERCADORIA_ORIGINAL').AsFloat := vPesoOriginal;
                  ParambyName('QT_MERCADORIA_ORIGINAL').AsFloat := vQtde_Original;
                  ParambyName('VL_MLE_ITEM_ORIGINAL').AsFloat   := vValorMLE_ItemOriginal;}

                  SQL.Add('VALUES ('+QuotedStr(vMercadoria)+','+QuotedStr(vLaudo)+','+QuotedStr(datm_laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString)+','+QuotedStr(vNumeroDI)+','+QuotedStr(vNrAdicao)+',');
                  SQL.Add(QuotedStr(vNrItem)+','+QuotedStr(vDtRegistroDI)+','+QuotedStr(vDtDesembaraco)+','+QuotedStr(vNCM)+','+QuotedStr(vDescricao)+','+vPesoMerc+',');
                  SQL.Add(vQtdeMerc+','+QuotedStr(DeParaUnidMedida(vUnidMedida))+','+vValorMLE_Item+','+QuotedStr(DeParaMoeda(vMoeda))+','+vValorMLE_MN+','+vFreteDolar+',');
                  SQL.Add(vSeguroDolar+','+vTaxaX+','+vTaxaDolar+','+QuotedStr(FloatToStr(vPesoOriginal))+','+QuotedStr(FloattoStr(vQtde_Original))+','+QuotedStr(FloattoStr(vValorMLE_ItemOriginal))+')');
                  //Showmessage(SQL.Text);
                  ExecSQL;
                end;
                Celula := ExcelWS.Cells.Find(Trim(PalavrasChave.Strings[I2]), Celula, xlFormulas, xlPart, xlByRows, xlNext, False, False);
              end;
            end;
              datm_laudo.qry_lista_mat_pri_.Next;
          end;
        end;

        datm_Laudo.qry_lista_mat_pri_.First;
        datm_Laudo.qry_lista_mat_pri_.EnableControls;

        PossiveisDescricoes.Clear;

        datm_laudo.qry_laudo_.Next;
          
      end; // End do 'While not datm_laudo.qry_laudo_.EOF'

      Showmessage('Leitura Concluída!');

      If Trim(dlgOpenExcelIMP.FileName) = '' then
      begin
        ExcelApp.Disconnect;
        FreeAndNil(ExcelWS);
        FreeAndNil(ExcelWB);
        FreeAndNil(ExcelApp);
      end
      else
      begin
        ExcelWS.Disconnect;
        ExcelWB.Close(False);
        ExcelWB.Disconnect;
        ExcelApp.Disconnect;
        FreeAndNil(ExcelWS);
        FreeAndNil(ExcelWB);
        FreeAndNil(ExcelApp);
      end;

      datm_main.db_broker.Commit;

    except
      If datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;

        ExcelWS.Disconnect;
        ExcelWB.Close(False);
        ExcelWB.Disconnect;
        ExcelApp.Disconnect;
        FreeAndNil(ExcelWS);
        FreeAndNil(ExcelWB);
        FreeAndNil(ExcelApp);
    end;
   //end; //- End do 'With TQuery do'
  end;
end;

procedure Tfrm_Laudo.dbg_LaudosCellClick(Column: TColumn);
begin
  If datm_Laudo.qry_Laudo_.State in [dsEdit, dsInsert, dsBrowse] then
  begin
    If datm_Laudo.qry_laudo_.RecordCount > 0 then
       begin
         btn_incluir_matpri.Enabled  := True;
         btn_excluir_matpri.Enabled  := False;
         btn_salvar_matpri.Enabled   := False;
         btn_cancelar_matpri.Enabled := False;
         btn_excluir.Enabled         := True;

         If datm_Laudo.qry_lista_mat_pri_.State in [dsEdit, dsInsert, dsBrowse] then
         begin
           datm_Laudo.qry_lista_mat_pri_.Close;
         end;

         with datm_Laudo do
         begin
           qry_lista_mat_pri_.ParamByName('CD_MERCADORIA').AsString := qry_Laudo_CD_MERCADORIA.AsString;
           qry_lista_mat_pri_.ParamByName('NR_LAUDO').AsString      := qry_Laudo_NR_LAUDO.AsString;
           qry_lista_mat_pri_.Open;
         end;

         dbedtDescr_Merc.Enabled        := True;

         dbedt_cd_mat_pri.Enabled       := True;
         btn_co_mat_pri.Enabled         := True;
         dbedt_vl_percent.Enabled       := True;
         dbedt_cd_un_med_comerc.Enabled := True;
         btn_co_un_med_comerc.Enabled   := True;
         EditPercPerda.Enabled          := True;
         dbedtPalavraChave.Enabled      := True;
       end
    else
    begin
      btn_incluir_matpri.Enabled  := False;
      btn_excluir_matpri.Enabled  := False;
      btn_salvar_matpri.Enabled   := False;
      btn_cancelar_matpri.Enabled := False;

      dbedtDescr_Merc.Enabled        := False;

      dbedt_cd_mat_pri.Enabled       := False;
      btn_co_mat_pri.Enabled         := False;
      dbedt_vl_percent.Enabled       := False;
      dbedt_cd_un_med_comerc.Enabled := False;
      btn_co_un_med_comerc.Enabled   := False;
      EditPercPerda.Enabled          := False;
      dbedtPalavraChave.Enabled      := False;
     end;
  end;
end;

procedure Tfrm_Laudo.btn_incluir_matpriClick(Sender: TObject);
begin
  try
    with datm_Laudo do
    begin
      if qry_lista_mat_pri_.State in [dsInsert] then qry_lista_mat_pri_.Cancel;

        dbedt_cd_mat_pri.Enabled        := True;
        btn_co_mat_pri.Enabled          := True;
        dbedt_vl_percent.Enabled        := True;
        dbedt_cd_un_med_comerc.Enabled  := True;
        btn_co_un_med_comerc.Enabled    := True;
        EditPercPerda.Enabled           := True;
        dbedtPalavraChave.Enabled       := True;
        qry_lista_mat_pri_.Open;
        qry_lista_mat_pri_.Append;
        qry_lista_mat_pri_CD_MERCADORIA.AsString := qry_laudo_CD_MERCADORIA.AsString;
        qry_lista_mat_pri_NR_LAUDO.AsString      := qry_laudo_NR_LAUDO.AsString;
        dbedt_cd_mat_pri.SetFocus;

        BotoesMatPri(0,1,1,0);

    end;

  except

  end;

end;

procedure Tfrm_Laudo.btn_salvar_matpriClick(Sender: TObject);
begin
   try
     datm_main.db_broker.StartTransaction;
     with datm_Laudo do
     begin
       if qry_lista_mat_pri_.State in [dsInsert, dsEdit] then
       begin
         qry_lista_mat_pri_.Post;
         qry_lista_mat_pri_.Close;
         qry_lista_mat_pri_.Open;
       end;
     end;

     datm_main.db_broker.Commit;
  except
     datm_Laudo.qry_lista_mat_pri_.Cancel;
     ShowMessage('Ocorreu um erro.' +#13#10+ 'Por favor, tente novamente.');
     datm_main.db_broker.Rollback;
  end;

     BotoesMatPri(1,0,0,0);

end;
procedure Tfrm_Laudo.dbgrd_mat_priCellClick(Column: TColumn);
begin
      iF not datm_Laudo.qry_lista_mat_pri_.EOF then
      begin
        btn_excluir_matpri.Enabled     := True;
        dbedt_cd_mat_pri.Enabled       := True;
        btn_co_mat_pri.Enabled         := True;
        dbedt_vl_percent.Enabled       := True;
        dbedt_cd_un_med_comerc.Enabled := True;
        btn_co_un_med_comerc.Enabled   := True;
        EditPercPerda.Enabled          := True;
        dbedtPalavraChave.Enabled      := True;
      end
      else
      begin
        btn_excluir_matpri.Enabled     := False;
        dbedt_cd_mat_pri.Enabled       := False;
        btn_co_mat_pri.Enabled         := False;
        dbedt_vl_percent.Enabled       := False;
        dbedt_cd_un_med_comerc.Enabled := False;
        btn_co_un_med_comerc.Enabled   := False;
        EditPercPerda.Enabled          := False;
        dbedtPalavraChave.Enabled      := False;
      end;

end;

procedure Tfrm_Laudo.btn_cancelar_matpriClick(Sender: TObject);
begin
    datm_Laudo.qry_lista_mat_pri_.Cancel;
    btn_salvar_matpri.Enabled   := False;
    btn_cancelar_matpri.Enabled := False;
    btn_incluir_matpri.Enabled  := True;
    btn_excluir_matpri.Enabled  := True;
end;

procedure Tfrm_Laudo.btn_excluir_matpriClick(Sender: TObject);
begin
   If not datm_Laudo.qry_lista_mat_pri_.Eof then
   begin
     try
        datm_main.db_broker.StartTransaction;

        If MessageDlg('Você tem certeza de que deseja excluir esta matéria-prima?', mtWarning, [mbYes, mbNo], 0) = mrYes then
        begin
          with TQuery.Create(Application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Add('DELETE FROM TLAUDO_TECNICO_IMP');
            SQL.Add('WHERE CD_MERCADORIA = '+QuotedStr(datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString));
            SQL.Add('AND NR_LAUDO = '+QuotedStr(datm_laudo.qry_Laudo_NR_LAUDO.AsString));
            SQL.Add('AND CD_MAT_PRI = '+QuotedStr(datm_laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString));
            ExecSQL;
            Close;
            Free;
          end;

          datm_Laudo.qry_lista_mat_pri_.Delete;

        end;

        datm_main.db_broker.Commit;

        If datm_laudo.qry_lista_mat_pri_.RecordCount = 0 then
          begin
            datm_laudo.qry_lista_mat_pri_.Close;
            btn_incluir_matpri.Enabled  := True;
            btn_excluir_matpri.Enabled  := False;
            btn_salvar_matpri.Enabled   := False;
            btn_cancelar_matpri.Enabled := False;
          end;                                   
           
     except
        ShowMessage('Erro ao excluir o registro.' + #13#10 + 'Por favor, tente novamente.');
        datm_main.db_broker.Rollback;
     end;
   end;
end;

procedure Tfrm_Laudo.DBEdit1Click(Sender: TObject);
begin
  //datm_Laudo.qry_Laudo_.Edit;
end;

procedure Tfrm_Laudo.dbedtDescr_MercChange(Sender: TObject);
begin
  If datm_Laudo.qry_Laudo_.State in [dsEdit, dsInsert] then
        BotoesLaudo(0,1,1,0);
        
end;

procedure Tfrm_Laudo.dbgrd_mat_priDblClick(Sender: TObject);
begin
  If not (datm_laudo.qry_lista_mat_pri_.State in [dsInactive]) then
  begin
    If (datm_laudo.qry_lista_mat_pri_.RecordCount = 0) then
      Exit;
  end
  else
  Exit;

  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Add('SELECT * FROM TLAUDO_TECNICO_IMP');
    SQL.Add('WHERE CD_MERCADORIA = :CD_MERCADORIA');
    SQL.Add('AND NR_LAUDO = :NR_LAUDO');
    SQL.Add('AND CD_MAT_PRI = :CD_MAT_PRI');
    SQL.Add('ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA');
    ParambyName('CD_MERCADORIA').AsString := datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString;
    ParambyName('NR_LAUDO').AsString      := datm_laudo.qry_Laudo_NR_LAUDO.AsString;
    ParambyName('CD_MAT_PRI').AsString    := datm_laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString;
    Open;

    If EOF then
    begin
      Showmessage('Erro! Não há matérias-primas cadastradas nesta mercadoria!');
      Exit;
    end
    else
    If not EOF then
    begin
      Application.CreateForm(Tfrm_gera_drawback, frm_gera_drawback);
      vCodMercadoria := datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString;
      vCodLaudo      := datm_Laudo.qry_Laudo_NR_LAUDO.AsString;
      vCodMatPrima   := datm_laudo.qry_lista_mat_pri_CD_MAT_PRI.AsString;
      vPalavrasChave := datm_Laudo.qry_lista_mat_pri_.FieldbyName('NR_PALAVRAS_CHAVE').AsString;
      vTipo          := 'IMP';
      frm_gera_drawback.ShowModal;
    end;

    Close;
    Free;
  end;

end;

procedure Tfrm_Laudo.dbg_LaudosDblClick(Sender: TObject);
begin
  If not (datm_laudo.qry_laudo_.State in [dsInactive]) then
  begin
    If (datm_laudo.qry_laudo_.RecordCount = 0) then
      Exit;
  end
  else
  Exit;

  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Add('SELECT * FROM TLAUDO_TECNICO_EXP');
    SQL.Add('WHERE CD_MERCADORIA = '+QuotedStr(datm_laudo.qry_Laudo_CD_MERCADORIA.AsString));
    SQL.Add('AND NR_LAUDO = '+QuotedStr(datm_laudo.qry_Laudo_NR_LAUDO.AsString));
    SQL.Add('ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA');
    {SQL.Add('SELECT * FROM TLAUDO_TECNICO_EXP');
    SQL.Add('WHERE CD_MERCADORIA = :CD_MERCADORIA');
    SQL.Add('AND NR_LAUDO = :NR_LAUDO');
    SQL.Add('ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA');}
    //ParambyName('CD_MERCADORIA').AsString := datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString;
    //ParambyName('NR_LAUDO').AsString      := datm_laudo.qry_Laudo_NR_LAUDO.AsString;
    Open;

    If EOF then
    begin
      Showmessage('Erro! Não há mercadorias cadastradas neste laudo!');
      Exit;
    end
    else
    If not EOF then
    begin
     Application.CreateForm(Tfrm_gera_drawback, frm_gera_drawback);
     vCodMercadoria := datm_Laudo.qry_Laudo_CD_MERCADORIA.AsString;
     vCodLaudo      := datm_Laudo.qry_Laudo_NR_LAUDO.AsString;
     vPalavrasChave := datm_Laudo.qry_Laudo_.FieldbyName('NR_DESCR_MERC').AsString;
     vTipo          := 'EXP';
     frm_gera_drawback.ShowModal;
    end;

    Close;
    Free;
  end;
end;

procedure Tfrm_Laudo.dbedtPalavraChaveChange(Sender: TObject);
begin
   If datm_Laudo.qry_lista_mat_pri_.State in [ dsInsert, dsEdit ] Then
     BotoesMatPri(0,1,1,0);
end;

procedure Tfrm_Laudo.btnConsultaClick(Sender: TObject);
begin
  lbledtEmpresaDB.Text := ConsultaOnLineEx('TEMPRESA_NAC','Empresa Nacional',['CD_EMPRESA','NM_EMPRESA'],['Código da Empresa','Nome da Empresa'],'CD_EMPRESA',nil);
end;

procedure Tfrm_Laudo.lbledtEmpresaDBExit(Sender: TObject);
begin
  If Trim(lbledtEmpresaDB.Text) <> '' then
    begin
      lbledtEmpresaDB.Text := FormatFloat('00000', StrtoFloat(lbledtEmpresaDB.Text));
    end;
end;

procedure Tfrm_Laudo.lbledtEmpresaDBKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not (Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', #8]) then
     Abort;

end;

procedure Tfrm_Laudo.btnGeraDBClick(Sender: TObject);
type
  TTotais  = record
     PesoKG           : Double;
     Quantidade       : Double;
     UnidMedida       : String;
     VMLE             : Double;
     Moeda            : String;
     ValorTotalUSD    : Double;
     ValorFrete       : Double;
     ValorSeguro      : Double;
     TTPesoKG         : Double;
     TTQuantidade     : Double;
     TTVMLE           : Double;
     TTValorTotalUSD  : Double;
     TTValorFrete     : Double;
     TTValorSeguro    : Double;
  end;

  TTotaisExp  = record
     PesoKG               : Double;
     Quantidade           : Double;
     UnidMedida           : String;
     VMLE                 : Double;
     Moeda                : String;
     ValorTotalUSD        : Double;
     ValorPCComissao      : Double;
     ValorComissao        : Double;
     ValorFOB             : Double;
     ValorEnquadramento   : Double;
     TTPesoKG             : Double;
     TTQuantidade         : Double;
     TTVMLE               : Double;
     TTValorTotalUSD      : Double;
     TTValorPCComissao    : Double;
     TTValorComissao      : Double;
     TTValorFOB           : Double;
     TTValorEnquadramento : Double;
  end;              
var
  ExcelApp : TExcelApplication;
  ExcelWB  : TExcelWorkbook;
  ExcelWS  : TExcelWorksheet;
  vCaminho, vNmEmpresa, vCNPJ, vRE, vDtEmbarque,
  vNCM, vDescricao, vUnidMedida, vMoeda, vNumeroDI, vCodMoeda, NovaMoeda : string;

  vPesoKG, vQuantidade, vVMLE, vValorTotalUSD, vFreteUSD, vSeguroUSD, vPcComissao, vVlComissao, vFOB, vEnquadramento,
  vTotPesoKg, vTotQuantidade, vTotVMLE, vTotValorTotalUSD, vTotFreteUSD, vTotSeguroUSD, vTotPcComissao, vTotVlComissao,
  vTotFOB, vTotEnquadramento : Double;

  Pagina, Linha, QuebraLinha, I, I2, vBordaInicial, vBordaFinal : integer;
  SQL : TStrings;
  PalavrasChave : TStringList;
  Totais  : array of TTotais;
  TotaisExp : array of TTotaisExp;
begin

  If FindWindow('XLMAIN',nil) <> 0  then
  begin
    MessageDlg('Favor fechar todas as janelas do Excel antes de continuar.'+#13#10+'Caso não haja nenhuma janela do Excel aberta e o erro continue ocorrendo, entre em contato com o departamento de TI.', mtError, [mbOk], 0);
    Exit;
  end;

  try
    vNmEmpresa := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Trim(lbledtEmpresaDB.Text), 'NM_EMPRESA');
    vCNPJ      := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Trim(lbledtEmpresaDB.Text), 'CGC_EMPRESA');
    vCNPJ      := FormatMaskText('00.000.000/0000-00;0', vCNPJ);
    vCaminho := 'H:\DDBroker\Modelo_RUD_EXPO.xls';

    ExcelApp := TExcelApplication.Create(nil);
    ExcelWB  := TExcelWorkbook.Create(nil);
    ExcelWS  := TExcelWorksheet.Create(nil);

    ExcelApp.Visible[1] := False;
    ExcelWB.ConnectTo(ExcelApp.Workbooks.Open(vCaminho, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0));
    ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] As ExcelWorksheet);

    Linha := 5;

    datm_main.db_broker.StartTransaction;

    PalavrasChave := TStringList.Create;

    with qry_gera_db_exp do
    begin
      Databasename := 'DBBROKER';

      ParambyName('CD_MERCADORIA').AsString := Trim(msk_cd_mercadoria.Text);
      Open;

      while not Eof do
      begin
        ExtractStrings([';'],[],PChar(vPalavrasChave), PalavrasChave);

        vMoeda := FieldbyName('CD_MOEDA').AsString;
        NovaMoeda := 'N';

        If High(TotaisExp) = -1 then
        begin
          SetLength(TotaisExp, High(TotaisExp)+2);
          TotaisExp[0].Moeda := vMoeda;
        end
        else If High(TotaisExp) >= 0 then
        begin
          I2 := 0;

          for I2 := 0 to High(TotaisExp) do
          begin
            If TotaisExp[I2].Moeda <> vMoeda then
            begin
              If (NovaMoeda <> 'NN') and (I2 <> High(TotaisExp)) then
                 NovaMoeda := 'S'
              Else
              If (NovaMoeda <> 'NN') and (I2 = High(TotaisExp)) Then
                 NovaMoeda := 'SS';
            end
            else
            begin
              NovaMoeda := 'NN';
            end;
          end;

          If NovaMoeda = 'SS' then
          begin
            SetLength(TotaisExp, High(TotaisExp)+2);
            TotaisExp[High(TotaisExp)].Moeda := vMoeda;
          end;

        end;
        Next;
      end;

      // Início da leitura do SQL

      First;
      vMoeda := FieldbyName('CD_MOEDA').AsString;
      vCodMoeda := FieldbyName('CD_MOEDA').AsString;
      vBordaInicial := Linha;
      vNCM := FieldbyName('CD_NCM_SH').AsString;
      vUnidMedida := FieldbyName('CD_UN_MEDIDA').AsString;

      while not Eof do
      begin
        while (vNCM = FieldbyName('CD_NCM_SH').AsString) do
        begin
          if QuebraLinha = 16 then
          begin
            vBordaFinal := Linha - 1;

            ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
            ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
            ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

           //Teste Sub-Total (NÃO ESQUECER DE REMOVER!!)

            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].MergeCells := False;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].Merge(EmptyParam);
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'Sub-Total';
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Pattern := xlSolid;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Color := 10092543;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Font.Bold := True;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.ColorIndex := 0;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.Weight := xlMedium;

            ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].HorizontalAlignment := xlRight;
            ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].VerticalAlignment := xlCenter;
            ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].HorizontalAlignment := xlRight;
            ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].VerticalAlignment := xlCenter;

            ExcelWS.Cells.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := vPesoKG;
            ExcelWS.Cells.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := vQuantidade;
            ExcelWS.Cells.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := vUnidMedida;
            ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vVMLE;
            ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vMoeda;
            ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vValorTotalUSD;
            ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vPcComissao;
            ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vVlComissao;
            ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vFOB;
            ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vEnquadramento;

            If (vNCM <> FieldbyName('CD_NCM_SH').AsString) then
               vNCM := FieldbyName('CD_NCM_SH').AsString
            else
            if (vUnidMedida <> FieldByName('CD_UN_MEDIDA').AsString) then
               vUnidMedida := FieldbyName('CD_UN_MEDIDA').AsString;

            Linha := Linha + 1;

            vTotPesoKg        := vTotPesoKG + vPesoKG;
            vTotQuantidade    := vTotQuantidade + vQuantidade;
            vTotVMLE          := vTotVMLE + vVMLE;
            vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
            vTotPcComissao    := vTotPcComissao + vPcComissao;
            vTotVlComissao    := vTotVlComissao + vVlComissao;
            vTotFOB           := vTotFOB + vFOB;
            vTotEnquadramento := vTotEnquadramento + vEnquadramento;

            vPesoKG        := 0;
            vQuantidade    := 0;
            vVMLE          := 0;
            vValorTotalUSD := 0;
            vPcComissao    := 0;
            vVlComissao    := 0;
            vFOB           := 0;
            vEnquadramento := 0;

            //Teste Sub-Total (NÃO ESQUECER DE REMOVER!!)  

            Linha := Linha + 1;
            QuebraLinha := QuebraLinha + 1;
            If not EOF then
            begin
              Delete;
              First;

              ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
              ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
              ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

              If vBordaInicial <> 5 Then
              begin
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1)].Borders[xlInsideVertical].LineStyle := xlNone;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;
              end;

              QuebraLinha := 0;
              Linha := Linha + 21;
              Pagina := Pagina + 1;
              ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].HorizontalAlignment := xlCenter;
              ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].VerticalAlignment := xlCenter;
              ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].Orientation := 0;
              ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].AddIndent := False;
              ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].IndentLevel := 0;
              ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].ShrinkToFit := False;
              ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].ReadingOrder := xlContext;

              ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].MergeCells := True;
              ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].Merge(EmptyParam);
              vBordaInicial := Linha;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':F'+InttoStr(Linha), 'A'+InttoStr(Linha)+':F'+InttoStr(Linha)].Merge(EmptyParam);
              ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Pagina '+InttoStr(Pagina)+'                                                                                                                                                    RELATÓRIO DE EXPORTAÇÃO DE DRAWBACK ';
              Linha := Linha + 1;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Merge(EmptyParam);
              ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Empresa: ' + vNmEmpresa + ' CNPJ: ' + vCNPJ;
              Linha := Linha + 1;

              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Pattern := xlSolid;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Color := 10092543;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Font.Bold := True;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.ColorIndex := 0;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.Weight := xlMedium;

              {ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideVertical].LineStyle := xlNone;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;}

              ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'RE';
              ExcelWS.Range['B'+InttoStr(Linha),'B'+InttoStr(Linha)].Value2 := 'Data de'+#10+'Embarque';
              ExcelWS.Range['C'+InttoStr(Linha),'C'+InttoStr(Linha)].Value2 := 'NCM';
              ExcelWS.Range['E'+InttoStr(Linha),'E'+InttoStr(Linha)].Value2 := 'Descrição da'+#10+'Mercadoria';
              ExcelWS.Range['F'+InttoStr(Linha),'F'+InttoStr(Linha)].Value2 := 'Peso em'+#10+'KG';
              ExcelWS.Range['G'+InttoStr(Linha),'G'+InttoStr(Linha)].Value2 := 'Quantidade';
              ExcelWS.Range['H'+InttoStr(Linha),'H'+InttoStr(Linha)].Value2 := 'Unid.'+#10+'Medida';
              ExcelWS.Range['I'+InttoStr(Linha),'I'+InttoStr(Linha)].Value2 := 'V.M.L.E';
              ExcelWS.Range['J'+InttoStr(Linha),'J'+InttoStr(Linha)].Value2 := 'Moeda'+#10+'V.M.L.E';
              ExcelWS.Range['K'+InttoStr(Linha),'K'+InttoStr(Linha)].Value2 := 'Valor'+#10+'Total US$';
              ExcelWS.Range['L'+InttoStr(Linha),'L'+InttoStr(Linha)].Value2 := '%'+#10+'Comissão';
              ExcelWS.Range['M'+InttoStr(Linha),'M'+InttoStr(Linha)].Value2 := 'Valor'+#10+'Comissão';
              ExcelWS.Range['N'+InttoStr(Linha),'N'+InttoStr(Linha)].Value2 := 'FOB'+#10+'Líquido';
              ExcelWS.Range['O'+InttoStr(Linha),'O'+InttoStr(Linha)].Value2 := 'Enquadramento';
              Linha := Linha + 1;

              ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', FieldbyName('NR_RE').AsString);
              ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', FieldbyName('DT_EMBARQUE').AsString);
              ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := FieldbyName('CD_NCM_SH').AsString;
              ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := FieldbyName('DESCRICAO').AsString;
              ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := FieldbyName('PL_MERCADORIA').AsFloat;
              ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := FieldbyName('QT_MERCADORIA').AsFloat;
              ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := FieldbyName('CD_UN_MEDIDA').AsString;
              ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := FieldbyName('VL_MLE_ITEM').AsFloat;
              ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := DeParaNomeMoeda(FieldbyName('CD_MOEDA').AsString);
              ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := FieldbyName('VL_MLE_MNEG').AsFloat;
              ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := FieldbyName('PC_COMISSAO').AsFloat;
              ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := FieldbyName('VL_COMISSAO').AsFloat;
              ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := FieldByName('VL_MLE_ITEM_MN').AsFloat;
              ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := FieldbyName('VL_ENQUADRAMENTO').AsFloat;

              vPesoKG        := vPesoKG + FieldbyName('PL_MERCADORIA').AsFloat;
              vQuantidade    := vQuantidade + FieldbyName('QT_MERCADORIA').AsFloat;
              vVMLE          := vVMLE + FieldbyName('VL_MLE_ITEM').AsFloat;
              vValorTotalUSD := vValorTotalUSD + FieldbyName('VL_MLE_MNEG').AsFloat;
              vPcComissao    := vPcComissao + FieldbyName('PC_COMISSAO').AsFloat;
              vVlComissao    := vVlComissao + FieldbyName('VL_COMISSAO').AsFloat;
              vUnidMedida    := FieldbyName('CD_UN_MEDIDA').AsString;
              vMoeda         := DeParaNomeMoeda(FieldbyName('CD_MOEDA').AsString);
              vFOB           := vFOB + FieldbyName('VL_MLE_ITEM_MN').AsFloat;
              vEnquadramento := vEnquadramento + FieldbyName('VL_ENQUADRAMENTO').AsFloat;

              Linha := Linha + 1;
              QuebraLinha := QuebraLinha + 1;
            end
            else
              Break;                    
          end
          else
          begin
            ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', FieldbyName('NR_RE').AsString);
            ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', FieldbyName('DT_EMBARQUE').AsString);
            ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := FieldbyName('CD_NCM_SH').AsString;
            ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := FieldbyName('DESCRICAO').AsString;
            ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := FieldbyName('PL_MERCADORIA').AsFloat;
            ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := FieldbyName('QT_MERCADORIA').AsFloat;
            ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := FieldbyName('CD_UN_MEDIDA').AsString;
            ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := FieldbyName('VL_MLE_ITEM').AsFloat;
            ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := DeParaNomeMoeda(FieldbyName('CD_MOEDA').AsString);
            ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := FieldbyName('VL_MLE_MNEG').AsFloat;
            ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := FieldbyName('PC_COMISSAO').AsFloat;
            ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := FieldbyName('VL_COMISSAO').AsFloat;
            ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := FieldbyName('VL_MLE_ITEM_MN').AsFloat;
            ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := FieldbyName('VL_ENQUADRAMENTO').AsFloat;

            vPesoKG        := vPesoKG + FieldbyName('PL_MERCADORIA').AsFloat;
            vQuantidade    := vQuantidade + FieldbyName('QT_MERCADORIA').AsFloat;
            vVMLE          := vVMLE + FieldbyName('VL_MLE_ITEM').AsFloat;
            vValorTotalUSD := vValorTotalUSD + FieldbyName('VL_MLE_MNEG').AsFloat;
            vPcComissao    := vPcComissao + FieldbyName('PC_COMISSAO').AsFloat;
            vVlComissao    := vVlComissao + FieldbyName('VL_COMISSAO').AsFloat;
            vUnidMedida    := FieldbyName('CD_UN_MEDIDA').AsString;
            vMoeda         := DeParaNomeMoeda(FieldbyName('CD_MOEDA').AsString);
            vFOB           := vFOB + FieldbyName('VL_MLE_ITEM_MN').AsFloat;
            vEnquadramento := vEnquadramento + FieldbyName('VL_ENQUADRAMENTO').AsFloat;

            Linha := Linha + 1;
            QuebraLinha := QuebraLinha + 1;
          end;

          for I2 := 0 to High(TotaisExp) do
          begin
            If TotaisExp[I2].Moeda = vCodMoeda then
            begin
              TotaisExp[I2].PesoKG             := FieldbyName('PL_MERCADORIA').AsFloat;
              TotaisExp[I2].Quantidade         := FieldbyName('QT_MERCADORIA').AsFloat;
              TotaisExp[I2].UnidMedida         := FieldbyName('CD_UN_MEDIDA').AsString;
              TotaisExp[I2].VMLE               := FieldbyName('VL_MLE_ITEM').AsFloat;
              TotaisExp[I2].ValorTotalUSD      := FieldbyName('VL_MLE_MNEG').AsFloat;
              TotaisExp[I2].ValorComissao      := FieldbyName('VL_COMISSAO').AsFloat;
              TotaisExp[I2].ValorPCComissao    := FieldbyName('PC_COMISSAO').AsFloat;
              TotaisExp[I2].ValorFOB           := FieldbyName('VL_MLE_ITEM_MN').AsFloat;
              TotaisExp[I2].ValorEnquadramento := FieldbyName('VL_ENQUADRAMENTO').AsFloat;

              TotaisExp[I2].TTPesoKG             := TotaisExp[I2].TTPesoKG             + FieldbyName('PL_MERCADORIA').AsFloat;
              TotaisExp[I2].TTQuantidade         := TotaisExp[I2].TTQuantidade         + FieldbyName('QT_MERCADORIA').AsFloat;
              TotaisExp[I2].TTVMLE               := TotaisExp[I2].TTVMLE               + FieldbyName('VL_MLE_ITEM').AsFloat;
              TotaisExp[I2].TTValorTotalUSD      := TotaisExp[I2].TTValorTotalUSD      + FieldbyName('VL_MLE_MNEG').AsFloat;
              TotaisExp[I2].TTValorComissao      := TotaisExp[I2].TTValorComissao      + FieldbyName('VL_COMISSAO').AsFloat;
              TotaisExp[I2].TTValorPcComissao    := TotaisExp[I2].TTValorPcComissao    + FieldbyName('PC_COMISSAO').AsFloat;
              TotaisExp[I2].TTValorFOB           := TotaisExp[I2].TTValorFOB           + FieldbyName('VL_MLE_ITEM_MN').AsFloat;
              TotaisExp[I2].TTValorEnquadramento := TotaisExp[I2].TTValorEnquadramento + FieldbyName('VL_ENQUADRAMENTO').AsFloat;
            end;
          end;

          If not Eof then
          begin
            Delete;
            First;
          end
          else
            Break;
        end;

        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].MergeCells := False;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].Merge(EmptyParam);
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'SUBTOTAL';
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Pattern := xlSolid;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Color := 10092543;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Font.Bold := True;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.ColorIndex := 0;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.Weight := xlMedium;

        ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].HorizontalAlignment := xlRight;
        ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].VerticalAlignment := xlCenter;
        ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].HorizontalAlignment := xlRight;
        ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].VerticalAlignment := xlCenter;

        ExcelWS.Cells.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := vPesoKG;
        ExcelWS.Cells.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := vQuantidade;
        ExcelWS.Cells.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := vUnidMedida;
        ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vVMLE;
        ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vMoeda;
        ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vValorTotalUSD;
        ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vPcComissao;
        ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vVlComissao;
        ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vFOB;
        ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vEnquadramento;

        If (vNCM <> FieldbyName('CD_NCM_SH').AsString) then
           vNCM := FieldbyName('CD_NCM_SH').AsString
        else
        if (vUnidMedida <> FieldbyName('CD_UN_MEDIDA').AsString) then
           vUnidMedida := FieldbyName('CD_UN_MEDIDA').AsString;

        Linha := Linha + 1;

        vTotPesoKg        := vTotPesoKG + vPesoKG;
        vTotQuantidade    := vTotQuantidade + vQuantidade;
        vTotVMLE          := vTotVMLE + vVMLE;
        vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
        vTotPcComissao    := vTotPcComissao + vPcComissao;
        vTotVlComissao    := vTotVlComissao + vVlComissao;
        vTotFOB           := vTotFOB + vFOB;
        vTotEnquadramento := vTotEnquadramento + vEnquadramento;

        vPesoKG        := 0;
        vQuantidade    := 0;
        vVMLE          := 0;
        vValorTotalUSD := 0;
        vPcComissao    := 0;
        vVlComissao    := 0;
        vFOB           := 0;
        vEnquadramento := 0;

      end;

      // Insere a linha 'Total Geral', incluindo a somatória de todos os valores, discernindo as moedas.

      ExcelWS.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
      ExcelWS.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].VerticalAlignment := xlCenter;
      ExcelWS.Range['F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlRight;
      ExcelWS.Range['F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].VerticalAlignment := xlCenter;

      ExcelWS.Range['H'+InttoStr(Linha)+':H'+InttoStr(Linha+High(TotaisExp)), 'H'+InttoStr(Linha)+':H'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
      ExcelWS.Range['J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp)), 'J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
      ExcelWS.Range['L'+InttoStr(Linha)+':L'+InttoStr(Linha+High(TotaisExp)), 'L'+InttoStr(Linha)+':L'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
      ExcelWS.Range['O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;

      ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Orientation := 0;
      ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].AddIndent := False;
      ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].IndentLevel := 0;
      ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].ShrinkToFit := False;
      ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].ReadingOrder := xlContext;

      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Interior.Pattern := xlSolid;
      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Interior.PatternColorIndex := xlAutomatic;
      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Interior.Color := 10092543;
      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Font.Bold := True;
      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Borders.LineStyle := xlContinuous;
      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Borders.ColorIndex := 0;
      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Borders.Weight := xlMedium;

      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].MergeCells := False;
      ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
      ExcelWS.Cells.Range['I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(TotaisExp)), 'I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
      ExcelWS.Cells.Range['J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp)), 'J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
      ExcelWS.Cells.Range['K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(TotaisExp)), 'K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
      ExcelWS.Cells.Range['N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(TotaisExp)), 'N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
      ExcelWS.Cells.Range['O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
      ExcelWS.Cells.Range['P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(TotaisExp)), 'P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);

      ExcelWS.Range['A'+InttoStr(Linha)+':A'+InttoStr(Linha), 'A'+InttoStr(Linha)+':A'+InttoStr(Linha)].Value2 := 'TOTAL GERAL';

      for I := 0 to High(TotaisExp) do
      begin
        ExcelWS.Cells.Range['I'+InttoStr(Linha+I), 'I'+InttoStr(Linha+I)].Value2 := TotaisExp[I].TTVMLE;
        ExcelWS.Cells.Range['J'+InttoStr(Linha+I), 'J'+InttoStr(Linha+I)].Value2 := DeParaNomeMoeda(TotaisExp[I].Moeda);
      end;

      ExcelWS.Cells.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := vTotPesoKG;
      ExcelWS.Cells.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := vTotQuantidade;
      ExcelWS.Cells.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := DeParaUnidMedida(FieldbyName('CD_UN_MEDIDA').AsString);
      ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vTotValorTotalUSD;
      ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vTotPcComissao;
      ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vTotVlComissao;
      ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vTotFOB;
      ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vTotEnquadramento;

    end;

    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    qry_gera_db_exp.Close;    
    vCaminho := 'H:\DDBroker\Modelo_RUD_IMPO.xls';
    PalavrasChave.Clear;

    ExcelWB.ConnectTo(ExcelApp.Workbooks.Open(vCaminho, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0));
    ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] As ExcelWorksheet);
    Linha := 5;
    QuebraLinha := 0;
    Pagina := 1;
    qry_gera_db_imp.Close;
    
    with qry_gera_db_imp do
    begin
      ParambyName('CD_MERCADORIA').AsString := Trim(msk_cd_mercadoria.Text);
      Open;

      while not EOF do
      begin
        ExtractStrings([';'],[],PChar(vPalavrasChave), PalavrasChave);

        qry_gera_db_imp.DisableControls;
        qry_gera_db_imp.Close;
        SQL := qry_gera_db_imp.SQL;

        qry_gera_db_imp.ParambyName('CD_MERCADORIA').AsString := Trim(msk_cd_mercadoria.Text);
        qry_gera_db_imp.Open;

          while not qry_gera_db_imp.Eof do
          begin
            vMoeda := qry_gera_db_impCD_MOEDA.AsString;
            NovaMoeda := 'N';

            If High(Totais) = -1 then
            begin
              SetLength(Totais, High(Totais)+2);
              Totais[0].Moeda := vMoeda;
            end
            else If High(Totais) >= 0 then
            begin
              I2 := 0;

              for I2 := 0 to High(Totais) do
              begin
                If Totais[I2].Moeda <> vMoeda then
                  begin
                    If (NovaMoeda <> 'NN') and (I2 <> High(Totais)) then
                       NovaMoeda := 'S'
                    Else
                    If (NovaMoeda <> 'NN') and (I2 = High(Totais)) Then
                       NovaMoeda := 'SS';
                  end
                  else
                  begin
                       NovaMoeda := 'NN';
                  end;
              end;

              If NovaMoeda = 'SS' then
              begin
                SetLength(Totais, High(Totais)+2);
                Totais[High(Totais)].Moeda := vMoeda;
              end;

            end;

            qry_gera_db_imp.Next;
          end;                                                             

        qry_gera_db_imp.Close;

        qry_gera_db_imp.ParambyName('CD_MERCADORIA').AsString := Trim(msk_cd_mercadoria.Text);

        qry_gera_db_imp.Open;
        qry_gera_db_imp.First;
        vMoeda := qry_gera_db_impCD_MOEDA.AsString;
        vCodMoeda := qry_gera_db_impCD_MOEDA.AsString;
        vBordaInicial := Linha;

        while not qry_gera_db_imp.Eof do
        begin
          If vCodMoeda = qry_gera_db_impCD_MOEDA.AsString then
            begin
              if QuebraLinha = 13 then
              begin
                vBordaFinal := Linha - 1;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

                If vBordaInicial <> 5 Then
                begin
                  ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1)].Borders[xlInsideVertical].LineStyle := xlNone;
                  ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;
                end;

                //Teste Sub-total (NÃO ESQUECER DE REMOVER!!)

                vBordaFinal := Linha-1;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].MergeCells := False;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Merge(EmptyParam);
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'SUBTOTAL';
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

                ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vPesoKG;
                ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vQuantidade;
                ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vUnidMedida;
                ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vVMLE;
                ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vMoeda;
                ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vValorTotalUSD;
                ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vFreteUSD;
                ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vSeguroUSD;

                Linha := Linha + 1;
                QuebraLinha := QuebraLinha + 1;
                qry_gera_db_imp.Delete;
                qry_gera_db_imp.First;
                vCodMoeda := qry_gera_db_impCD_MOEDA.AsString;

                vTotPesoKg        := vTotPesoKg + vPesoKG;
                vTotQuantidade    := vTotQuantidade + vQuantidade;
                vTotVMLE          := vTotVMLE + vVMLE;
                vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
                vTotFreteUSD      := vTotFreteUSD + vFreteUSD;
                vTotSeguroUSD     := vTotSeguroUSD + vSeguroUSD;

                vPesoKG        := 0;
                vQuantidade    := 0;
                vVMLE          := 0;
                vValorTotalUSD := 0;
                vFreteUSD      := 0;
                vSeguroUSD     := 0;

                //Teste Sub-total (NÃO ESQUECER DE REMOVER!!)

                QuebraLinha := 0;
                Linha := Linha + 21;
                Pagina := Pagina + 1;
                ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].HorizontalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].VerticalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].Orientation := 0;
                ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].AddIndent := False;
                ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].IndentLevel := 0;
                ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].ShrinkToFit := False;
                ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].ReadingOrder := xlContext;

                ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].MergeCells := True;
                ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].Merge(EmptyParam);
                vBordaInicial := Linha;
                ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Pagina '+InttoStr(Pagina)+'                                                                                                                                                    RELATÓRIO DE IMPORTAÇÃO DE DRAWBACK ';
                Linha := Linha + 1;
                ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Empresa: ' + vNmEmpresa + ' CNPJ: ' + vCNPJ;
                Linha := Linha + 1;

                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideVertical].LineStyle := xlNone;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;

                ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'DI original'+#10+'nº';
                ExcelWS.Range['B'+InttoStr(Linha),'B'+InttoStr(Linha)].Value2 := 'Nº '+#10+'Adição';
                ExcelWS.Range['C'+InttoStr(Linha),'C'+InttoStr(Linha)].Value2 := 'DI original'+#10+'nº';
                ExcelWS.Range['D'+InttoStr(Linha),'D'+InttoStr(Linha)].Value2 := 'Nº '+#10+'Adição';
                ExcelWS.Range['E'+InttoStr(Linha),'E'+InttoStr(Linha)].Value2 := 'Data do '+#10+'Registro da DI';
                ExcelWS.Range['F'+InttoStr(Linha),'F'+InttoStr(Linha)].Value2 := 'Data '+#10+'Desembaraço';
                ExcelWS.Range['G'+InttoStr(Linha),'G'+InttoStr(Linha)].Value2 := 'NCM';
                ExcelWS.Range['H'+InttoStr(Linha),'H'+InttoStr(Linha)].Value2 := 'Descrição da'+#10+'Mercadoria';
                ExcelWS.Range['I'+InttoStr(Linha),'I'+InttoStr(Linha)].Value2 := 'Peso em'+#10+'KG';
                ExcelWS.Range['J'+InttoStr(Linha),'J'+InttoStr(Linha)].Value2 := 'Qtd.';
                ExcelWS.Range['K'+InttoStr(Linha),'K'+InttoStr(Linha)].Value2 := 'Unid.'+#10+'Medida';
                ExcelWS.Range['L'+InttoStr(Linha),'L'+InttoStr(Linha)].Value2 := 'V.M.L.E';
                ExcelWS.Range['M'+InttoStr(Linha),'M'+InttoStr(Linha)].Value2 := 'Moeda'+#10+'V.M.L.E';
                ExcelWS.Range['N'+InttoStr(Linha),'N'+InttoStr(Linha)].Value2 := 'Valor'+#10'Total US$';
                ExcelWS.Range['O'+InttoStr(Linha),'O'+InttoStr(Linha)].Value2 := 'Frete'+#10+'USD';
                ExcelWS.Range['P'+InttoStr(Linha),'P'+InttoStr(Linha)].Value2 := 'Seguro'+#10+'USD';
                ExcelWS.Range['Q'+InttoStr(Linha),'Q'+InttoStr(Linha)].Value2 := 'Taxa';
                ExcelWS.Range['Q'+InttoStr(Linha+1),'Q'+InttoStr(Linha+1)].Value2 := 'X';
                ExcelWS.Range['R'+InttoStr(Linha+1),'R'+InttoStr(Linha+1)].Value2 := 'USD';
                Linha := Linha + 1;


                ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_gera_db_impNR_DI.AsString);
                ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := qry_gera_db_impNR_ADICAO.AsString;
                ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_gera_db_impNR_DI.AsString);
                ExcelWS.Range['D'+InttoStr(Linha), 'D'+InttoStr(Linha)].Value2 := qry_gera_db_impNR_ADICAO.AsString;
                ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_gera_db_impDT_REGISTRO_DI.AsString);
                ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_gera_db_impDT_DESEMBARACO.AsString);
                ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := qry_gera_db_impCD_NCM_SH.AsString;
                ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := qry_gera_db_impDESCRICAO.AsString;
                ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := qry_gera_db_impPL_MERCADORIA.AsString;
                ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := qry_gera_db_impQT_MERCADORIA.AsString;
                ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := qry_gera_db_impCD_UN_MEDIDA.AsString;
                ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_MLE_ITEM.AsFloat;
                ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := DeParaMoeda(qry_gera_db_impCD_MOEDA.AsString);
                ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_MLE_MNEG.AsFloat;
                ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_FRETE_MNEG.AsFloat;
                ExcelWS.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_SEGURO_MNEG.AsFloat;
                ExcelWS.Range['Q'+InttoStr(Linha), 'Q'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_TAXA_X.AsFloat;
                ExcelWS.Range['R'+InttoStr(Linha), 'R'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_TAXA_DOLAR.AsFloat;

                vPesoKG        := vPesoKG + qry_gera_db_impPL_MERCADORIA.AsFloat;
                vQuantidade    := vQuantidade + qry_gera_db_impQT_MERCADORIA.AsFloat;
                vVMLE          := vVMLE + qry_gera_db_impVL_MLE_ITEM.AsFloat;
                vValorTotalUSD := vValorTotalUSD + qry_gera_db_impVL_MLE_MNEG.AsFloat;
                vFreteUSD      := vFreteUSD + qry_gera_db_impVL_FRETE_MNEG.AsFloat;
                vSeguroUSD     := vSeguroUSD + qry_gera_db_impVL_SEGURO_MNEG.AsFloat;
                vUnidMedida    := qry_gera_db_impCD_UN_MEDIDA.AsString;
                vMoeda         := DeParaMoeda(qry_gera_db_impCD_MOEDA.AsString);

                Linha := Linha + 1;
                QuebraLinha := QuebraLinha + 1;
              end
              else
              begin
                ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_gera_db_impNR_DI.AsString);
                ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := qry_gera_db_impNR_ADICAO.AsString;
                ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_gera_db_impNR_DI.AsString);
                ExcelWS.Range['D'+InttoStr(Linha), 'D'+InttoStr(Linha)].Value2 := qry_gera_db_impNR_ADICAO.AsString;
                ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_gera_db_impDT_REGISTRO_DI.AsString);
                ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_gera_db_impDT_DESEMBARACO.AsString);
                ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := qry_gera_db_impCD_NCM_SH.AsString;
                ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := qry_gera_db_impDESCRICAO.AsString;
                ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := qry_gera_db_impPL_MERCADORIA.AsString;
                ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := qry_gera_db_impQT_MERCADORIA.AsString;
                ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := qry_gera_db_impCD_UN_MEDIDA.AsString;
                ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_MLE_ITEM.AsFloat;
                ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := DeParaMoeda(qry_gera_db_impCD_MOEDA.AsString);
                ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_MLE_MNEG.AsFloat;
                ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_FRETE_MNEG.AsFloat;
                ExcelWS.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_SEGURO_MNEG.AsFloat;
                ExcelWS.Range['Q'+InttoStr(Linha), 'Q'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_TAXA_X.AsFloat;
                ExcelWS.Range['R'+InttoStr(Linha), 'R'+InttoStr(Linha)].Value2 := qry_gera_db_impVL_TAXA_DOLAR.AsFloat;

                vPesoKG        := vPesoKG + qry_gera_db_impPL_MERCADORIA.AsFloat;
                vQuantidade    := vQuantidade + qry_gera_db_impQT_MERCADORIA.AsFloat;
                vVMLE          := vVMLE + qry_gera_db_impVL_MLE_ITEM.AsFloat;
                vValorTotalUSD := vValorTotalUSD + qry_gera_db_impVL_MLE_MNEG.AsFloat;
                vFreteUSD      := vFreteUSD + qry_gera_db_impVL_FRETE_MNEG.AsFloat;
                vSeguroUSD     := vSeguroUSD + qry_gera_db_impVL_SEGURO_MNEG.AsFloat;
                vUnidMedida    := qry_gera_db_impCD_UN_MEDIDA.AsString;
                vMoeda         := DeParaMoeda(qry_gera_db_impCD_MOEDA.AsString);

                Linha := Linha + 1;
                QuebraLinha := QuebraLinha + 1;
              end;

              for I2 := 0 to High(Totais) do
              begin
                If Totais[I2].Moeda = vCodMoeda then
                begin
                   Totais[I2].PesoKG        := qry_gera_db_impPL_MERCADORIA.AsFloat;
                   Totais[I2].Quantidade    := qry_gera_db_impQT_MERCADORIA.AsFloat;
                   Totais[I2].UnidMedida    := qry_gera_db_impCD_UN_MEDIDA.AsString;
                   Totais[I2].VMLE          := qry_gera_db_impVL_MLE_ITEM.AsFloat;
                   Totais[I2].ValorTotalUSD := qry_gera_db_impVL_MLE_MNEG.AsFloat;
                   Totais[I2].ValorFrete    := qry_gera_db_impVL_FRETE_MNEG.AsFloat;
                   Totais[I2].ValorSeguro   := qry_gera_db_impVL_SEGURO_MNEG.AsFloat;

                   Totais[I2].TTPesoKG        := Totais[I2].TTPesoKG        + qry_gera_db_impPL_MERCADORIA.AsFloat;
                   Totais[I2].TTQuantidade    := Totais[I2].TTQuantidade    + qry_gera_db_impQT_MERCADORIA.AsFloat;
                   Totais[I2].TTVMLE          := Totais[I2].TTVMLE          + qry_gera_db_impVL_MLE_ITEM.AsFloat;
                   Totais[I2].TTValorTotalUSD := Totais[I2].TTValorTotalUSD + qry_gera_db_impVL_MLE_MNEG.AsFloat;
                   Totais[I2].TTValorFrete    := Totais[I2].TTValorFrete    + qry_gera_db_impVL_FRETE_MNEG.AsFloat;
                   Totais[I2].TTValorSeguro   := Totais[I2].TTValorSeguro   + qry_gera_db_impVL_SEGURO_MNEG.AsFloat;

                end;
              end;
              qry_gera_db_imp.Delete;
              qry_gera_db_imp.First;
            end
          else
          begin
            vBordaFinal := Linha-1;
            ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
            ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
            ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].MergeCells := False;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Merge(EmptyParam);
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'SUBTOTAL';
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

            ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vPesoKG;
            ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vQuantidade;
            ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vUnidMedida;
            ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vVMLE;
            ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vMoeda;
            ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vValorTotalUSD;
            ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vFreteUSD;
            ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vSeguroUSD;

            Linha := Linha + 1;
            QuebraLinha := QuebraLinha + 1;
            qry_gera_db_imp.Delete;
            qry_gera_db_imp.First;
            vCodMoeda := qry_gera_db_impCD_MOEDA.AsString;

            vTotPesoKg        := vTotPesoKg + vPesoKG;
            vTotQuantidade    := vTotQuantidade + vQuantidade;
            vTotVMLE          := vTotVMLE + vVMLE;
            vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
            vTotFreteUSD      := vTotFreteUSD + vFreteUSD;
            vTotSeguroUSD     := vTotSeguroUSD + vSeguroUSD;

            vPesoKG        := 0;
            vQuantidade    := 0;
            vVMLE          := 0;
            vValorTotalUSD := 0;
            vFreteUSD      := 0;
            vSeguroUSD     := 0;
          end;

        end;

        vBordaFinal := Linha-1;

        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].MergeCells := False;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Merge(EmptyParam);
        ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'TOTAL';
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

        ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vPesoKG;
        ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vQuantidade;
        ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vUnidMedida;
        ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vVMLE;
        ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vMoeda;
        ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vValorTotalUSD;
        ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vFreteUSD;
        ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vSeguroUSD;

        Linha := Linha + 1;

        vTotPesoKg        := vTotPesoKg + vPesoKG;
        vTotQuantidade    := vTotQuantidade + vQuantidade;
        vTotVMLE          := vTotVMLE + vVMLE;
        vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
        vTotFreteUSD      := vTotFreteUSD + vFreteUSD;
        vTotSeguroUSD     := vTotSeguroUSD + vSeguroUSD;

        vPesoKG        := 0;
        vQuantidade    := 0;
        vVMLE          := 0;
        vValorTotalUSD := 0;
        vFreteUSD      := 0;
        vSeguroUSD     := 0;
        vBordaInicial  := Linha;

        // Insere a linha 'Total Geral', incluindo a somatória de todos os valores, discernindo as moedas.

        ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].HorizontalAlignment := xlCenter;
        ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].VerticalAlignment := xlCenter;
        ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Orientation := 0;
        ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].AddIndent := False;
        ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].IndentLevel := 0;
        ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].ShrinkToFit := False;
        ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].ReadingOrder := xlContext;

        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Interior.Pattern := xlSolid;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Interior.PatternColorIndex := xlAutomatic;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Interior.Color := 10092543;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Font.Bold := True;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Borders.LineStyle := xlContinuous;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Borders.ColorIndex := 0;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Borders.Weight := xlMedium;

        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais))].MergeCells := False;
        ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(Totais)), 'I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(Totais)), 'J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(Totais)), 'K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(Totais)), 'N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(Totais)), 'O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(Totais)), 'P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['Q'+InttoStr(Linha)+':Q'+InttoStr(Linha+High(Totais)), 'Q'+InttoStr(Linha)+':Q'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
        ExcelWS.Cells.Range['R'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'R'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);

        ExcelWS.Range['A'+InttoStr(Linha)+':A'+InttoStr(Linha), 'A'+InttoStr(Linha)+':A'+InttoStr(Linha)].Value2 := 'TOTAL GERAL';

        for I := 0 to High(Totais) do
        begin
          ExcelWS.Cells.Range['L'+InttoStr(Linha+I), 'L'+InttoStr(Linha+I)].Value2 := Totais[I].TTVMLE;
          ExcelWS.Cells.Range['M'+InttoStr(Linha+I), 'M'+InttoStr(Linha+I)].Value2 := DeParaMoeda(Totais[I].Moeda);
        end;
        ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vTotPesoKG;
        ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vTotQuantidade;
        ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := DeParaUnidMedida(qry_gera_db_impCD_UN_MEDIDA.AsString);
        ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vTotValorTotalUSD;
        ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vTotFreteUSD;
        ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vTotSeguroUSD;

        qry_gera_db_imp.Close;
        qry_gera_db_imp.EnableControls;
      end;

    end;

    ExcelApp.Visible[1] := True;

    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Disconnect;
    FreeAndNil(ExcelWS);
    FreeAndNil(ExcelWB);
    FreeAndNil(ExcelApp);

    datm_main.db_broker.Rollback;

  except
    If datm_main.db_broker.InTransaction then
       datm_main.db_broker.Rollback;

    ExcelWS.Disconnect;
    ExcelWB.Close(False);
    ExcelWB.Disconnect;
    ExcelApp.Disconnect;
    FreeAndNil(ExcelWS);
    FreeAndNil(ExcelWB);
    FreeAndNil(ExcelApp);
  end;

end;

procedure Tfrm_Laudo.btnGerarDBClick(Sender: TObject);
begin
  If datm_Laudo.qry_Laudo_.State in [dsEdit, dsInsert, dsBrowse] then
  begin
    If datm_Laudo.qry_laudo_.RecordCount > 0 then
    begin
      pnlExcel.Enabled            := False;
      pnl_btn_ag.Enabled          := False;
      pnl_ag.Enabled              := False;
      dbg_Laudos.Enabled          := False;
      msk_cd_mercadoria.Enabled   := False;
      btnMercadoria.Enabled       := False;
      dbedtDescr_Merc.Enabled     := False;
      lbledtEmpresaDB.Clear;

      mi_incluir.Enabled  := False;
      mi_salvar.Enabled   := False;
      mi_cancelar.Enabled := False;
      mi_excluir.Enabled  := False;
      mi_sair.Enabled     := False;

      pnlGerarDB.Visible          := True;
    end
    else
    begin
      Showmessage('A mercadoria precisa ter pelo menos um laudo cadastrado. Por favor, verifique e tente novamente!');
      Exit;
    end;
  end;
end;

procedure Tfrm_Laudo.btnFecharDBClick(Sender: TObject);
begin
  pnlExcel.Enabled          := True;
  pnl_btn_ag.Enabled        := True;
  pnl_ag.Enabled            := True;
  dbg_Laudos.Enabled        := True;
  msk_cd_mercadoria.Enabled := True;
  btnMercadoria.Enabled     := True;
  dbedtDescr_Merc.Enabled   := True;
  lbledtEmpresaDB.Clear;

  mi_incluir.Enabled  := btn_incluir.Enabled;
  mi_salvar.Enabled   := btn_salvar.Enabled;
  mi_cancelar.Enabled := btn_cancelar.Enabled;
  mi_excluir.Enabled  := btn_excluir.Enabled;
  mi_sair.Enabled     := btn_sair.Enabled;

  pnlGerarDB.Visible    := False;
end;

procedure Tfrm_Laudo.lbledtEmpresaDBChange(Sender: TObject);
begin
   If Trim(ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Trim(lbledtEmpresaDB.Text) ,'NM_EMPRESA')) <> '' then
      edtEmpresaDB.Text := Trim(ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Trim(lbledtEmpresaDB.Text) ,'NM_EMPRESA'))
   else
      edtEmpresaDB.Text := '';

end;

end.
