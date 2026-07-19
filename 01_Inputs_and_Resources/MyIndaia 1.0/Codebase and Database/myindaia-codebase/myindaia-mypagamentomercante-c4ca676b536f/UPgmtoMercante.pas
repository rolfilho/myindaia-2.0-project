unit UPgmtoMercante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids,  FMTBcd,
  DB, DBClient, Provider, SqlExpr, Buttons, Mask, DateUtils, ComCtrls, Registry,
  System.Masks, IWSystem;

type
  TfrmPgmtoMercante = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    pnlFiltros: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblUnidadeNeg: TLabel;
    cbGrupo: TDBLookupComboBox;
    edtNumeroBL: TEdit;
    edtNrMercante: TEdit;
    cbEmpresa: TDBLookupComboBox;
    btnPesquisar: TBitBtn;
    edtGrupo: TEdit;
    edtEmpresa: TEdit;
    rgStatus: TRadioGroup;
    edtNrProcesso: TEdit;
    cbProduto: TDBLookupComboBox;
    edtProduto: TEdit;
    cbUnidade: TDBLookupComboBox;
    edUnidade: TEdit;
    pnlBottom: TPanel;
    lblResultados: TLabel;
    pnlGrid: TPanel;
    pgcDados: TPageControl;
    btnPagarAFRMM: TBitBtn;
    lblMensagens: TLabel;
    mmObservacao: TMemo;
    sb: TSpeedButton;
    rgTipoDI: TRadioGroup;
    tbsDiExterna: TTabSheet;
    tbsDiInterna: TTabSheet;
    dbgdados: TDBGrid;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure edrQtRegistrosKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtEmpresaExit(Sender: TObject);
    procedure cbGrupoExit(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoCloseUp(Sender: TObject);
    procedure cbEmpresaCloseUp(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgStatusClick(Sender: TObject);
    procedure dbgDadosTitleClick(Column: TColumn);
    procedure cbUnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbProdutoExit(Sender: TObject);
    procedure cbUnidadeExit(Sender: TObject);
    procedure cbProdutoCloseUp(Sender: TObject);
    procedure cbUnidadeCloseUp(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtProdutoExit(Sender: TObject);
    procedure edUnidadeExit(Sender: TObject);
    procedure btnPagarAFRMMClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbClick(Sender: TObject);

  private
    { Private declarations }

  procedure Filtrar;
  procedure PreencherCodigoGrupo;
  procedure PreencherCodigoEmpresa;
  procedure BuscarCodigoEmpresa;
  procedure BuscarCodigoGrupo;
  procedure BuscarCodigoProduto;
  procedure BuscarCodigoUnidadeNeg;
  procedure PreencherCodigoUnidadeNeg;
  procedure PreencherCodigoProduto;
  procedure CarregaCodigoUsuario;
  procedure LimpaLog;
  public
    { Public declarations }
    sUsuario, sSenha, sUsuarioWallet, sUsuarioMyIndaia :String;
  end;

var
  frmPgmtoMercante: TfrmPgmtoMercante;

implementation


{$R *.dfm}

uses DmBroker, uNavPgmtoMercante, UDIExterna;

procedure TfrmPgmtoMercante.FormCreate(Sender: TObject);
begin
 //grupo
  dmdBroker.cdsGrupo.disablecontrols;
  dmdBroker.cdsGrupo.close;
  dmdBroker.cdsGrupo.Open;
  dmdBroker.cdsGrupo.Enablecontrols;
  //empresa
  dmdBroker.cdsEmpresa.disablecontrols;
  dmdBroker.cdsEmpresa.close;
  dmdBroker.cdsEmpresa.Open;
  dmdBroker.cdsEmpresa.Enablecontrols;
 //unidade de negocio
  dmdBroker.cdsUnidadeNeg.disablecontrols;
  dmdBroker.cdsUnidadeNeg.close;
  dmdBroker.cdsUnidadeNeg.Open;
  dmdBroker.cdsUnidadeNeg.Enablecontrols;
 //unidade de negocio
  dmdBroker.cdsProduto.disablecontrols;
  dmdBroker.cdsProduto.close;
  dmdBroker.cdsProduto.Open;
  dmdBroker.cdsProduto.Enablecontrols;

  Filtrar;

  if not DirectoryExists(ExtractFilePath(Application.ExeName)  + 'Downloads\') then
    ForceDirectories(ExtractFilePath(Application.ExeName)  + 'Downloads\');

  if not DirectoryExists(ExtractFilePath(Application.ExeName)  + 'Log\') then
    ForceDirectories(ExtractFilePath(Application.ExeName)  + 'Log\');

  lblMensagens.Caption := '';

  mmObservacao.Clear;
  mmObservacao.lines.add(' Integral                                                                          ');
  mmObservacao.lines.add(' Evento(s) com preenchimento obrigatório:                                          ');
  mmObservacao.lines.add('         419 - Confecção de DI / DTA / DSI (Para clientes que emitem no MyIndaia)  ');
  mmObservacao.lines.add('         722 - Mercante analisado                                                  ');
  mmObservacao.lines.add('         416 - Analise documental                                                  ');
  mmObservacao.lines.add('         162 - Data de chegada do Navio                                            ');
  mmObservacao.lines.add(' Evento(s) sem preenchimento:                                                      ');
  mmObservacao.lines.add('         533 - Pagamento de Marinha Mercante                                       ');
  mmObservacao.lines.add('                                                                                   ');
  mmObservacao.lines.add(' Isenção / Suspensão                                                               ');
  mmObservacao.lines.add(' Evento(s) com preenchimento obrigatório:                                          ');
  mmObservacao.lines.add('         419 - Confecção de DI / DTA / DSI (Para clientes que emitem no MyIndaia)  ');
  mmObservacao.lines.add('         722 - Mercante analisado                                                  ');
  mmObservacao.lines.add('         416 - Analise documental                                                  ');
  mmObservacao.lines.add('         162 - Data de chegada do Navio                                            ');
  mmObservacao.lines.add(' Eventos sem preenchimento:                                                        ');
  mmObservacao.lines.add('         049 - Isensão/Suspenão MM                                                 ');
end;



procedure TfrmPgmtoMercante.FormShow(Sender: TObject);
begin
  {carregar padrão unidade/produto}
  edUnidade.Text  := '01';
  edtProduto.Text := '01';
  BuscarCodigoUnidadeNeg;
  BuscarCodigoProduto;

  CarregaCodigoUsuario;
  LimpaLog;
end;

procedure TfrmPgmtoMercante.Filtrar;
var Sql, FiltroGrupo, FiltroEmpresa, FiltroProcesso, FiltroBL, FiltroCEMercante, nr_processo :String;
begin
  try
    Screen.Cursor := crHourGlass;
    Sql := 'SELECT * FROM FN_SELECIONA_PAGAMENTO_MERCANTE(';

    if not ((cbEmpresa.KeyValue = '') or (cbEmpresa.KeyValue = null)) then
      FiltroEmpresa := quotedStr(cbEmpresa.KeyValue)
    else
      FiltroEmpresa := quotedStr('');

    if not ( (cbGrupo.KeyValue = '') or (cbGrupo.KeyValue = null)) then
      FiltroGrupo := quotedStr(cbGrupo.KeyValue)
    else
      FiltroGrupo := quotedStr('');

    if not (edtNumeroBL.text = '') then
      FiltroBL := QuotedStr(edtNumeroBL.text)
    else
      FiltroBL := QuotedStr('');

    if not (edtNrMercante.text = '') then
      FiltroCEMercante := QuotedStr(edtNrMercante.text)
    else
      FiltroCEMercante := QuotedStr('');

    if (trim(edtNrProcesso.text) <> '') and
       ((cbUnidade.KeyValue <> '') and (cbUnidade.KeyValue <> null)) and
       ((cbProduto.KeyValue <> '') and (cbProduto.KeyValue <> null))
    then
    begin
      nr_processo :=  cbUnidade.KeyValue + cbProduto.KeyValue +  trim(edtNrProcesso.text);
      if not (nr_processo = '') then
        FiltroProcesso := QuotedStr(nr_processo)
      else
        FiltroProcesso := QuotedStr('');
    end
    else
      FiltroProcesso := QuotedStr('');
      
    dmdBroker.cdsDados.DisableControls;
    
    pgcDados.Pages[0].TabVisible := false;
    pgcDados.Pages[1].TabVisible := false;
    pgcDados.ActivePageIndex := rgTipoDI.ItemIndex;
    rgStatus.ItemIndex := 0;

    dmdBroker.cdsDados.Close;
    dmdBroker.qryDados.Sql.Clear;
    dmdBroker.qryDados.sql.text := Sql + FiltroEmpresa    +' , ' +
                                         FiltroGrupo      +' , ' +
                                         FiltroProcesso   +' , ' +
                                         FiltroCEMercante +' , ' +
                                         FiltroBL         +',0,1,'+
                                         '''' + inttostr(rgTipoDI.ItemIndex)+ ''') ';

    dmdBroker.cdsDados.Open;
    dmdBroker.cdsDados.EnableControls;

    lblResultados.caption := 'Resultados: ' +  IntToStr(dmdBroker.cdsdados.recordcount);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPgmtoMercante.edrQtRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;


procedure TfrmPgmtoMercante.btnPagarAFRMMClick(Sender: TObject);
begin
  Try
    frmNavPgmtoMercante := TfrmNavPgmtoMercante.Create(Self);
    frmNavPgmtoMercante.lblTitulo.Caption  := dmdBroker.cdsdados.fieldByName('NR_PROCESSO').AsString;
    frmNavPgmtoMercante.NR_PROCESSO        := dmdBroker.cdsdados.fieldByName('NR_PROCESSO').AsString;

    if (dmdBroker.cdsdados.fieldByName('DEFINIR').asinteger > 0) or
       ((dmdBroker.cdsdados.fieldByName('DI_EXTERNA').asString = '1') and
        (dmdBroker.cdsdados.fieldByName('NACIONALIZACAO').AsString = '1' )) then
    begin
      try
        frmDIExterna := tfrmDIExterna.Create(self);
        frmDIExterna.NRPROCESSO   := dmdBroker.cdsdados.fieldByName('NR_PROCESSO').AsString;
        frmDIExterna.NUMCE        := dmdBroker.cdsdados.fieldByName('NUM_CE').AsString;
        frmDIExterna.CONHECIMENTO := dmdBroker.cdsdados.fieldByName('NR_CONHECIMENTO').AsString;
        frmDIExterna.Nacionalizacao := dmdBroker.cdsdados.fieldByName('NACIONALIZACAO').AsString ;

        if frmDIExterna.ShowModal = mrOk then
        begin
          frmNavPgmtoMercante.QT_ISENCAO   := dmdBroker.cdsDIExternaIsencao.RecordCount;
          frmNavPgmtoMercante.QT_SUSPENSAO := dmdBroker.cdsDIExternaSuspensao.RecordCount;
          frmNavPgmtoMercante.QT_INTEGRAL  := dmdBroker.cdsDIExternaIntegral.RecordCount;
          frmNavPgmtoMercante.ShowModal;
        end;
      finally
        frmDIExterna.FecharQuery;
        freeAndNil(frmDIExterna);
      end;
    end
    else
    begin
      frmNavPgmtoMercante.QT_ISENCAO     := dmdBroker.cdsdados.fieldByName('ISENCAO').asinteger;
      frmNavPgmtoMercante.QT_SUSPENSAO   := dmdBroker.cdsdados.fieldByName('SUSPENSAO').asinteger;
      frmNavPgmtoMercante.QT_INTEGRAL    := dmdBroker.cdsdados.fieldByName('INTEGRAL').asinteger;
      frmNavPgmtoMercante.ShowModal;
    end;
  Finally
    FreeAndNil(frmNavPgmtoMercante);
  End;
end;

procedure TfrmPgmtoMercante.btnPesquisarClick(Sender: TObject);
begin
  try
    btnPesquisar.Enabled := false;
    Filtrar;
  finally
    btnPesquisar.Enabled := true;
  end;
end;

procedure TfrmPgmtoMercante.edtGrupoExit(Sender: TObject);
begin
  BuscarCodigoGrupo;
end;

procedure TfrmPgmtoMercante.edtEmpresaExit(Sender: TObject);
begin
   BuscarCodigoEmpresa;
end;

procedure TfrmPgmtoMercante.cbGrupoExit(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmPgmtoMercante.cbEmpresaExit(Sender: TObject);
begin
  PreencherCodigoEmpresa;
end;

procedure TfrmPgmtoMercante.cbGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbGrupo.KeyValue := '';

    edtGrupo.text := cbGrupo.KeyValue;
end;

procedure TfrmPgmtoMercante.cbEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbEmpresa.KeyValue := '';

    edtEmpresa.text := cbEmpresa.KeyValue;
end;

procedure TfrmPgmtoMercante.cbGrupoCloseUp(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmPgmtoMercante.PreencherCodigoGrupo;
begin
  if not ((cbGrupo.KeyValue = '') or (cbGrupo.KeyValue = null)) then
    edtGrupo.Text := dmdBroker.cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    edtGrupo.Text := '';
end;

procedure TfrmPgmtoMercante.PreencherCodigoEmpresa;
begin
  if not ((cbEmpresa.KeyValue = '') or (cbEmpresa.KeyValue = null)) then
    edtEmpresa.Text := dmdBroker.cdsEmpresa.fieldbyName('CD_EMPRESA').AsString
  else
    edtEmpresa.Text := '';
end;

procedure TfrmPgmtoMercante.BuscarCodigoEmpresa;
begin
  if dmdBroker.cdsEmpresa.Locate('CD_EMPRESA', edtEmpresa.Text, [loCaseInsensitive]) then
    cbEmpresa.KeyValue := dmdBroker.cdsEmpresa.fieldbyName('CD_EMPRESA').AsString
  else
    cbEmpresa.KeyValue := '';
end;

procedure TfrmPgmtoMercante.BuscarCodigoGrupo;
begin
  if dmdBroker.cdsGrupo.Locate('CD_GRUPO', edtGrupo.Text, [loCaseInsensitive]) then
    cbGrupo.KeyValue := dmdBroker.cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    cbGrupo.KeyValue := '';
end;

procedure TfrmPgmtoMercante.cbEmpresaCloseUp(Sender: TObject);
begin
  PreencherCodigoEmpresa;                     
end;

procedure TfrmPgmtoMercante.edtGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoGrupo;
  end;
end;

procedure TfrmPgmtoMercante.edtEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoEmpresa;
  end;
end;

procedure TfrmPgmtoMercante.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dmdBroker.cdsdados.FieldByName('IC_STATUS').asString = '1' then
  dbgDados.Canvas.Brush.Color := $008080FF;

  if (Rect.Top = TStringGrid(dbgDados).CellRect(0,TStringGrid(dbgDados).Row).Top) or (gdSelected in State) then
  begin
    dbgDados.Canvas.Brush.Color := $00FF9933;
  end;
  dbgDados.Canvas.FillRect(Rect);
  dbgDados.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure TfrmPgmtoMercante.rgStatusClick(Sender: TObject);
begin
  if rgStatus.ItemIndex = 0 then  //todos
  begin
    dmdBroker.cdsdados.Filtered     := false;
    dmdBroker.cdsdados.Filter       := '';
    lblResultados.caption := 'Resultados: ' +  IntToStr(dmdBroker.cdsdados.recordcount);
  end
  else
  if rgStatus.ItemIndex = 1 then //consultados
  begin
    dmdBroker.cdsdados.Filtered     := false;
    dmdBroker.cdsdados.Filter       := 'INTEGRAL > 0 ';
    dmdBroker.cdsdados.Filtered     := true;
    lblResultados.caption := 'Resultados: ' +  IntToStr(dmdBroker.cdsdados.recordcount);
  end;

  if rgTipoDI.ItemIndex = 0 then
  begin
    if rgStatus.ItemIndex = 2 then 
    begin
      dmdBroker.cdsdados.Filtered     := false;
      dmdBroker.cdsdados.Filter       := 'ISENCAO > 0 ';
      dmdBroker.cdsdados.Filtered     := true;
      lblResultados.caption := 'Resultados: ' +  IntToStr(dmdBroker.cdsdados.recordcount);
    end
    else
    if rgStatus.ItemIndex = 3 then 
    begin
      dmdBroker.cdsdados.Filtered     := false;
      dmdBroker.cdsdados.Filter       := 'SUSPENSAO > 0 ';
      dmdBroker.cdsdados.Filtered     := true;
      lblResultados.caption := 'Resultados: ' +  IntToStr(dmdBroker.cdsdados.recordcount);
    end;
  end
  else
  begin
    if rgStatus.ItemIndex = 2 then 
    begin
      dmdBroker.cdsdados.Filtered     := false;
      dmdBroker.cdsdados.Filter       := 'DEFINIR > 0 ';
      dmdBroker.cdsdados.Filtered     := true;
      lblResultados.caption := 'Resultados: ' +  IntToStr(dmdBroker.cdsdados.recordcount);
    end
    else
    if rgStatus.ItemIndex = 3 then
    begin
      dmdBroker.cdsdados.Filtered     := false;
      dmdBroker.cdsdados.Filter       := 'DEFINIR > 0 ';
      dmdBroker.cdsdados.Filtered     := true;
      lblResultados.caption := 'Resultados: ' +  IntToStr(dmdBroker.cdsdados.recordcount);
    end;
  end;
end;

procedure TfrmPgmtoMercante.sbClick(Sender: TObject);
begin
  mmObservacao.width    := 500;
  mmObservacao.Height   := 260;
  mmObservacao.Visible  := not mmObservacao.Visible;
end;

procedure TfrmPgmtoMercante.dbgDadosTitleClick(Column: TColumn);
begin
  dmdBroker.cdsdados.IndexFieldNames := Column.FieldName;
end;


procedure TfrmPgmtoMercante.edUnidadeExit(Sender: TObject);
begin
  BuscarCodigoUnidadeNeg;
end;

procedure TfrmPgmtoMercante.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto;
end;

procedure TfrmPgmtoMercante.edUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoUnidadeNeg;
  end;
end;

procedure TfrmPgmtoMercante.BuscarCodigoProduto;
begin
  if dmdBroker.cdsProduto.Locate('CD_PRODUTO', edtProduto.Text, []) then
     cbProduto.KeyValue := dmdBroker.cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    cbProduto.KeyValue := '';
end;


procedure TfrmPgmtoMercante.BuscarCodigoUnidadeNeg;
begin
  if dmdBroker.cdsUnidadeNeg.Locate('CD_UNID_NEG', edUnidade.Text, []) then
     cbUnidade.KeyValue := dmdBroker.cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    cbUnidade.KeyValue := '';
end;

procedure TfrmPgmtoMercante.edtProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoProduto;
  end;
end;

procedure TfrmPgmtoMercante.cbUnidadeCloseUp(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TfrmPgmtoMercante.PreencherCodigoUnidadeNeg;
begin
  if not ((cbUnidade.KeyValue = '') or (cbUnidade.KeyValue = null)) then
    edUnidade.Text := dmdBroker.cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    edUnidade.Text := '';
end;

procedure TfrmPgmtoMercante.cbProdutoCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmPgmtoMercante.PreencherCodigoProduto;
begin
 if not ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null)) then
    edtProduto.Text := dmdBroker.cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    edtProduto.Text := '';
end;

procedure TfrmPgmtoMercante.CarregaCodigoUsuario;
begin
  if frmPgmtoMercante.sUsuario = '' then
    frmPgmtoMercante.sUsuario := 'AGATHA.NIGRO';

  dmdBroker.qryUsuarioWallet.close;
  dmdBroker.qryUsuarioWallet.ParamByName('AP_USUARIO').Value := frmPgmtoMercante.sUsuario;
  dmdBroker.qryUsuarioWallet.open;
  if dmdBroker.qryUsuarioWallet.isEmpty then
  begin
    btnPagarAFRMM.Enabled := false;
    lblMensagens.Caption := 'Usuário Wallet não encontrado!';
    frmPgmtoMercante.sUsuarioWallet := '';
  end
  else
  begin
    frmPgmtoMercante.sUsuarioWallet   := dmdBroker.qryUsuarioWalletid.AsString;
    frmPgmtoMercante.sUsuarioMyIndaia := dmdBroker.qryUsuarioWalletCD_USUARIO.AsString;
  end;
  dmdBroker.qryUsuarioWallet.close;
end;

procedure TfrmPgmtoMercante.cbUnidadeExit(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TfrmPgmtoMercante.cbProdutoExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmPgmtoMercante.cbProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbProduto.KeyValue := '';
end;

procedure TfrmPgmtoMercante.cbUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbUnidade.KeyValue := '';
end;

procedure TfrmPgmtoMercante.LimpaLog;
var
  NomeArquivo , sDataArquivo, SDataLimite : String;
  i:integer;
  ListaArquivosAntigos : TStringList;
  pesquisa: TSearchRec;
begin
  ListaArquivosAntigos := tStringList.Create;
  try
    if FindFirst(gsAppPath+ 'log\*.log', faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
          NomeArquivo := Copy(pesquisa.Name, 1,10);
                                      {  2    0    1    8    0    7     1    8  _ }
          if MatchesMask(NomeArquivo, '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]') then
            ListaArquivosAntigos.Add(pesquisa.Name);
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
      sDataArquivo := Copy(ListaArquivosAntigos[i], 1, 4) + '/' +
                      Copy(ListaArquivosAntigos[i], 6, 2) + '/' +
                      Copy(ListaArquivosAntigos[i], 9, 2);

      sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,- 5));

      //se for mais antigo que 5 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        if fileExists(gsAppPath +'log\' + ListaArquivosAntigos[i]) then
          Deletefile(gsAppPath+ 'log\' + ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;
end.
