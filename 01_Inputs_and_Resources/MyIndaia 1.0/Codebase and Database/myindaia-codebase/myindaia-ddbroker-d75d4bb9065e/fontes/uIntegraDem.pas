unit uIntegraDem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit, ComCtrls,
  DB, DBTables, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  Tfrm_integra_dem = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_integrar: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_integrar: TMenuItem;
    mi_sair: TMenuItem;
    Panel1: TPanel;
    Label19: TLabel;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_grupo: TSpeedButton;
    Shape1: TShape;
    Label1: TLabel;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    Label31: TLabel;
    Label2: TLabel;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    qry_integra_: TQuery;
    ds_integra: TDataSource;
    ds_ref: TDataSource;
    qry_ref_: TQuery;
    ds_documentos: TDataSource;
    qry_documentos_: TQuery;
    ds_item: TDataSource;
    qry_item_: TQuery;
    qry_integra_NR_PROCESSO: TStringField;
    qry_integra_CD_UNID_NEG: TStringField;
    qry_integra_CD_PRODUTO: TStringField;
    qry_integra_NR_SOLICITACAO: TStringField;
    qry_integra_NR_NOTA_FATURA: TStringField;
    qry_integra_DT_FATURA: TDateTimeField;
    qry_integra_PROCESSO: TStringField;
    qry_integra_LOCAL_ENTREGA: TStringField;
    qry_integra_NM_EMPRESA: TStringField;
    qry_integra_NR_DECLARACAO_IMP: TStringField;
    qry_integra_NR_CONHECIMENTO: TStringField;
    qry_integra_TX_DOLAR: TFloatField;
    ds_com: TDataSource;
    qry_com_: TQuery;
    shp1: TShape;
    lbl1: TLabel;
    edt_nm_file_: TEdit;
    btnSpeed_file: TSpeedButton;
    dlgOpen_file: TOpenDialog;
    dscom_exp: TDataSource;
    qry_com_exp: TQuery;
    qry_integra_TP_TIPO_FAT: TStringField;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_grupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_integrarClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btnSpeed_fileClick(Sender: TObject);
    procedure edt_nm_file_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_integra_dem: Tfrm_integra_dem;
  Txt      : TextFile;
  cNomeTxt, Linha, v_nota_fiscal : String;
  function PoeZero( num : String; i : Integer ): String;

implementation

uses GSMLIB, PGGP001, PGGP017, Funcoes, ConsOnLineEx;

{$R *.dfm}

procedure Tfrm_integra_dem.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integra_dem.btn_co_grupoClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupos',['CD_GRUPO','NM_GRUPO'],['Código','Grupo'],'CD_GRUPO',nil,1);
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',msk_cd_grupo.Text,'NM_GRUPO');
 end
 else
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',msk_cd_grupo.Text,'NM_GRUPO');
end;

procedure Tfrm_integra_dem.btn_co_clienteClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
   msk_cd_cliente.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA', 'AP_EMPRESA'],['Código','Empresa', 'Apelido'],'CD_EMPRESA',nil,2);
   edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',msk_cd_cliente.Text,'AP_EMPRESA');
 end
 else
   edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',msk_cd_cliente.Text,'AP_EMPRESA');
end;

procedure Tfrm_integra_dem.msk_cd_grupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_grupo       then btn_co_grupoClick(btn_co_grupo)     else
    if Sender = msk_cd_cliente     then btn_co_clienteClick(btn_co_cliente)
  end;
end;

procedure Tfrm_integra_dem.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
    edt_nm_grupo.Text      := '';
  end
  else
  begin
    msk_cd_cliente.Text    := '';
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_integra_dem.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
    edt_nm_cliente.Text  := '';
  end
  else
  begin
    msk_cd_grupo.Text    := '';
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;

end;

procedure Tfrm_integra_dem.FormShow(Sender: TObject);
begin
  edt_nm_file_.Text    := cDir_Rpt + '\DEM' + FormatDateTime( 'ddmmyyyy', date() ) + FormatDateTime( 'hhmmss', time() ) +  '.txt';
  msk_dt_inicio.Date         := dt_server;
  msk_dt_fim.Date            := dt_server;
end;

procedure Tfrm_integra_dem.btn_integrarClick(Sender: TObject);
var
   doc : Integer;
   ref : String;
begin
  if Length( edt_nm_file_.Text ) = 0 then
  begin
    edt_nm_file_.SetFocus;
    BoxMensagem( 'O nome do arquivo texto para integração deverá ser informado.', 2 );
    edt_nm_file_.SetFocus;
    Exit;
  end;

  if ( FileExists( Trim( edt_nm_file_.Text ) ) ) then
  begin
    if Not BoxMensagem( 'Arquivo já existente !! Deseja sobrepor o Arquivo ?', 1 ) then
       Exit;
  end;

  with qry_integra_ do
  begin
    Close;
    if Trim( msk_cd_grupo.Text ) <> '' then
      ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text
    else
      ParamByName('CD_GRUPO').AsString := 'X';
    if Trim( msk_cd_cliente.Text ) <> '' then
      ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text
    else
      ParamByName('CD_CLIENTE').AsString := 'X';
    ParamByName('DT_INICIAL').AsDate := msk_dt_inicio.Date;
    ParamByName('DT_FINAL').AsDate := msk_dt_fim.Date;
    Prepare;
    Open;
  end;

  if qry_integra_.IsEmpty then
  begin
    BoxMensagem('Não há dados para exibir!!', 2);
    Exit;
  end;

  with qry_ref_ do
  begin
    Close;
    Prepare;
    Open
  end;

  with qry_documentos_ do
  begin
    Close;
    Prepare;
    Open
  end;

  with qry_item_ do
  begin
    Close;
    Prepare;
    Open
  end;

  with qry_com_ do
  begin
    Close;
    Prepare;
    Open
  end;

  with qry_com_exp do
  begin
    Close;
    Prepare;
    Open
  end;

  try
    (* Nome do arquivo *)
    cNomeTxt := edt_nm_file_.text;
    FileMode := 2;
    try
      AssignFile( Txt, cNomeTxt );
      ReWrite( Txt );
    except
      BoxMensagem( 'Erro na criação do Arquivo!', 2 );
      Exit;
    end;

    qry_integra_.First;
    while not qry_integra_.EOF do
    begin
      Linha := #13#10;
      Write( Txt, Linha );

      (* Informações Gerais *)
      Linha := 'Nota de Despesa: ' + qry_integra_.FieldByName('NR_NOTA_FATURA').AsString + Space( 13 - length(qry_integra_.FieldByName('NR_NOTA_FATURA').AsString) );
      Linha := Linha + 'Data: ' + FormatDateTime( 'dd/mm/yyyy', qry_integra_.FieldByName('DT_FATURA').AsDateTime ) + Space(10);
      if ( qry_integra_.FieldByName('TP_TIPO_FAT').AsString = 'C' ) and ( qry_integra_.FieldByName('CD_PRODUTO').AsString = '02' ) then
        Linha := Linha + 'Cidade: ' + 'Barra Mansa' + #13#10
      else
        Linha := Linha + 'Cidade: ' + qry_integra_.FieldByName('LOCAL_ENTREGA').AsString + #13#10;
      Write( Txt, Linha );
      if ( qry_integra_.FieldByName('TP_TIPO_FAT').AsString = 'C' ) then
        Linha := 'Registro: ' + qry_integra_.FieldByName('PROCESSO').AsString + '-C' + Space(8)
      else
        Linha := 'Registro: ' + qry_integra_.FieldByName('PROCESSO').AsString + Space(10);

      qry_ref_.Last;
      if qry_ref_.RecordCount = 1 then
      begin
        Linha := Linha + 'Ref./Cliente: ' + qry_ref_.FieldByName('CD_REFERENCIA').AsString + #13#10;
        Write( Txt, Linha );
      end
      else
      begin
        Linha := Linha + 'Ref./Cliente: ' +  #13#10;
        Write( Txt, Linha );
      end;
      Linha := 'Exportador: ' + qry_integra_.FieldByName('NM_EMPRESA').AsString + #13#10;
      Write( Txt, Linha );
      Linha := 'D.I: ' + Copy( qry_integra_.FieldByName('NR_DECLARACAO_IMP').AsString, 1, 2 ) + '/' + Copy( qry_integra_.FieldByName('NR_DECLARACAO_IMP').AsString, 3, 7 ) + '-' + Copy( qry_integra_.FieldByName('NR_DECLARACAO_IMP').AsString, 10, 1 ) + Space( 23 - length( qry_integra_.FieldByName('NR_DECLARACAO_IMP').AsString ) );
      Linha := Linha + 'B/L: ' + qry_integra_.FieldByName('NR_CONHECIMENTO').AsString + #13#10;
      Write( Txt, Linha );

      (* OBS *)
      ref := '';
      if qry_ref_.RecordCount > 1 then
      begin
        qry_ref_.First;
        while not qry_ref_.EOF do
        begin
          ref := ref + qry_ref_.FieldByName('CD_REFERENCIA').AsString + '; ';
          qry_ref_.Next;
        end;
      end;
      if ref <> '' then
        Linha := 'OBS30: ' + Copy( ref, 1, ( length( ref ) - 2 ) )  + #13#10
      else
        Linha := 'OBS30: ' + '' + #13#10;
      Write( Txt, Linha );
      Linha := 'OBS31: ' + '' + #13#10;
      Write( Txt, Linha );
      Linha := 'OBS32: ' + '' + #13#10;
      Write( Txt, Linha );
      Linha := 'OBS33: ' + '' + #13#10;
      Write( Txt, Linha );
      Linha := 'OBS34: ' + '' + #13#10;
      Write( Txt, Linha );

      (* Documentos Anexos *)
      doc := 1;
      while not qry_documentos_.EOF do
      begin
        Linha := 'Documentos Anexos ' + IntToStr( doc ) + ': ' + qry_documentos_.FieldByName('DESCRICAO').AsString + ' ' + qry_documentos_.FieldByName('NR_DOCTO').AsString + #13#10;
        Write( Txt, Linha );
        doc := doc + 1;
        qry_documentos_.Next;
      end;
      while doc < 17 do
      begin
        Linha := 'Documentos Anexos ' + IntToStr( doc ) + ': ' + #13#10;
        Write( Txt, Linha );
        doc := doc + 1;
      end;
      Linha := #13#10;
      Write( Txt, Linha );

      (* Despesas *)
      Linha := 'COD' + Space(10) + 'Nao Tributavel' + Space(10) + 'Tributavel' + #13#10;
      Write( Txt, Linha );
      if qry_integra_.FieldByName('CD_PRODUTO').AsString = '01' then
      begin
        Linha := Space(13) + '-TAXA US$ ' + FloatToStr( qry_integra_.FieldByName('TX_DOLAR').AsFloat ) + #13#10;
        Write( Txt, Linha );
      end
      else
      begin
        Linha := #13#10;
        Write( Txt, Linha );
      end;
      Linha := #13#10;
      Write( Txt, Linha );
      qry_item_.First;
      while not qry_item_.EOF do
      begin
        if qry_item_.FieldByName('IN_TRIBUTAVEL').AsString = '0' then  // Sai na coluna Tributável do TXT
        begin
          (*  Saldo Devedor - item 996 - deve ter sinal negativo  *)
          if qry_item_.FieldByName('ITEM').AsString = '996' then
          begin
            Linha := qry_item_.FieldByName('CD_ITEM').AsString;
            Linha := Linha + Space( 42 - length( FormatFloat( '###,###,##0.00', qry_item_.FieldByName('VL_ITEM').AsFloat ) )) + '- ' + FormatFloat( '###,###,##0.00', qry_item_.FieldByName('VL_ITEM').AsFloat ) + #13#10;
            Write( Txt, Linha );
          end
          else
          begin
            Linha := qry_item_.FieldByName('CD_ITEM').AsString;
            Linha := Linha + Space( 24 - length( FormatFloat( '###,###,##0.00', qry_item_.FieldByName('VL_ITEM').AsFloat ) )) + FormatFloat( '###,###,##0.00', qry_item_.FieldByName('VL_ITEM').AsFloat ) + #13#10;
            Write( Txt, Linha );
          end;
        end
        else
        begin
          Linha := qry_item_.FieldByName('CD_ITEM').AsString;
          Linha := Linha + Space( 44 - length( FormatFloat( '###,###,##0.00', qry_item_.FieldByName('VL_ITEM').AsFloat ) )) + FormatFloat( '###,###,##0.00', qry_item_.FieldByName('VL_ITEM').AsFloat ) + #13#10;
          Write( Txt, Linha );
        end;

        qry_item_.Next;
      end;
      (*  Comissão *)
      if qry_integra_.FieldByName('TP_TIPO_FAT').AsString = 'D' then  // Não imprime comissão nas Notas Complementares
      begin
        Linha := '358';
        if qry_integra_.FieldByName('CD_PRODUTO').AsString = '01' then
          Linha := Linha + Space( 44 - length( FormatFloat( '###,###,##0.00', qry_com_.FieldByName('VL_NUM_TAXA').AsFloat ) )) + FormatFloat( '###,###,##0.00', qry_com_.FieldByName('VL_NUM_TAXA').AsFloat ) + #13#10
        else
          Linha := Linha + Space( 44 - length( FormatFloat( '###,###,##0.00', qry_com_exp.FieldByName('VL_NUM_TAXA').AsFloat ) )) + FormatFloat( '###,###,##0.00', qry_com_exp.FieldByName('VL_NUM_TAXA').AsFloat ) + #13#10;
        Write( Txt, Linha );
      end;

      qry_integra_.Next;
    end;

    CloseFile( Txt );

    BoxMensagem('Arquivo Demonstrativo gerado', 3);

  except
    CloseFile( Txt );
    BoxMensagem('Erro na geração do Arquivo Demonstrativo', 2);
    Exit
  end;

end;


procedure Tfrm_integra_dem.msk_cd_grupoExit(Sender: TObject);
begin
  if Trim( msk_cd_grupo.Text ) <> '' then
  begin
    msk_cd_grupo.Text := PoeZero( msk_cd_grupo.Text, 3 );
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',msk_cd_grupo.Text,'NM_GRUPO');
  end;
end;


procedure Tfrm_integra_dem.msk_cd_clienteExit(Sender: TObject);
begin
  if Trim( msk_cd_cliente.Text ) <> '' then
  begin
    msk_cd_cliente.Text := PoeZero( msk_cd_cliente.Text, 5 );
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',msk_cd_cliente.Text,'AP_EMPRESA');
  end
end;


function PoeZero( num : String; i : Integer ): String;
begin
  Result := '';
  while length(num) < i do
        num := '0' + num;
  Result := num;
end;

procedure Tfrm_integra_dem.btnSpeed_fileClick(Sender: TObject);
begin
  if dlgOpen_file.Execute then edt_nm_file_.Text := dlgOpen_file.FileName;
end;


procedure Tfrm_integra_dem.edt_nm_file_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = edt_nm_file_ then btnSpeed_fileClick(Nil);
  end;
end;


end.
