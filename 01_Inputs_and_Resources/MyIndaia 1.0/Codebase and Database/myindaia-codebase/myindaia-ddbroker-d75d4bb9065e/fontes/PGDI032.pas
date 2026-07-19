unit PGDI032;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, UCRPE32, Menus, ppCtrls,
  Grids, DBGrids,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_DI_Resumo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbedt_ii: TDBEdit;
    dbedt_ipi: TDBEdit;
    dbedt_ad: TDBEdit;
    dbedt_sda: TDBEdit;
    dbedt_icms: TDBEdit;
    dbedt_seguro_mn: TDBEdit;
    dbedt_vmle_mn: TDBEdit;
    dbedt_frete_mn: TDBEdit;
    dbedt_desp_mn: TDBEdit;
    dbedt_acresc_mn: TDBEdit;
    dbedt_deducao_mn: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbedt_seguro_mneg: TDBEdit;
    dbedt_desp_mneg: TDBEdit;
    dbedt_vmle_mneg: TDBEdit;
    dbedt_moeda_frete: TDBEdit;
    dbedt_moeda_vmle: TDBEdit;
    dbedt_moeda_seguro: TDBEdit;
    dbedt_taxa_vmle: TDBEdit;
    dbedt_taxa_frete: TDBEdit;
    dbedt_taxa_seguro: TDBEdit;
    dbedt_taxa_usd: TDBEdit;
    Label18: TLabel;
    dbedt_frete_mneg: TDBEdit;
    dbedt_cif: TDBEdit;
    dbedt_dt_calculo: TDBEdit;
    Label19: TLabel;
    dbedt_nr_processo: TDBEdit;
    dbedt_siscomex: TDBEdit;
    Label20: TLabel;
    Panel2: TPanel;
    btn_sair: TSpeedButton;
    SpeedButton1: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_imprimir_: TMenuItem;
    mi_sair_: TMenuItem;
    Label21: TLabel;
    dbedt_vl_pis: TDBEdit;
    dbedt_vl_cofins: TDBEdit;
    Label22: TLabel;
    dbedt_cd_servico: TDBEdit;
    Label23: TLabel;
    dbedt_nm_servico: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Shape5: TShape;
    Label26: TLabel;
    DBEdit3: TDBEdit;
    Label27: TLabel;
    DBEdit4: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label30: TLabel;
    DBGrid1: TDBGrid;
    Label31: TLabel;
    Label32: TLabel;
    dbedt_Fundo_Pobreza: TDBEdit;
    pnlImpostos: TPanel;
    Label33: TLabel;
    dedt_VL_Impostos: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_sairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DI_Resumo: Tfrm_DI_Resumo;

implementation

uses PGGP001, PGDI003, PGDI033, GSMLIB, PGGP017, ConsOnLineEx;

{$R *.DFM}


procedure Tfrm_DI_Resumo.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Processo }
  Application.CreateForm(Tdatm_DI_Resumo, datm_DI_Resumo);

  with datm_DI_Resumo do
  begin
    qry_resumo_di_.Close;
    qry_resumo_di_.UnPrepare;
    qry_resumo_di_.ParamByName('NR_PROCESSO').AsString := frm_DI.mskedt_cd_unid_neg.Text + '01' +
                                                          frm_DI.mskedt_nr_processo.Text;
    qry_resumo_di_.Prepare;
    qry_resumo_di_.Open;
  end;

end;

procedure Tfrm_DI_Resumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_DI_Resumo.qry_resumo_di_.Close;
//  datm_DI_Resumo.Destroy;
  datm_DI_Resumo.Free;
  Action := caFree;
end;

procedure Tfrm_DI_Resumo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_DI_Resumo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DI_Resumo.SpeedButton1Click(Sender: TObject);
begin
  with datm_di_resumo do
  begin
    ppReport.Template.FileName := cDir_RPT + '\CRDI032.RTM';
    ppReport.Template.LoadFromFile;
    ppReport.AllowPrintToFile  := True;
    ppReport.DeviceType        := 'Screen';

    //Ocorrência - 04551/08
    if (Copy(datm_DI_Resumo.qry_resumo_di_NR_PROCESSO_COMPLETO.AsString,5,2) = 'IE') {or
       (Copy(datm_DI_Resumo.qry_resumo_di_NR_PROCESSO_COMPLETO.AsString,5,2) = 'IN') } then
    begin
      ppLabel50.Visible  := False;
      ppDBText50.Visible := False;
    end
    else
    begin                   // Query alterada para verificar a flag da empresa - Michel - 08/11/2011
      ppLabel50.Visible  := ConsultaLookUPSQL(' SELECT ISNULL(E.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_MARINHA_MERCANTE_ICMS ' +
                                              ' FROM TGRUPO G, TPROCESSO P, TSERVICO S, TEMPRESA_NAC E ' +
                                              ' WHERE P.NR_PROCESSO = ''' + datm_DI_Resumo.qry_resumo_di_NR_PROCESSO_COMPLETO.AsString + ''' ' +
                                              '   AND G.CD_GRUPO    = P.CD_GRUPO ' +
                                              '   AND P.CD_SERVICO  = S.CD_SERVICO ' +
                                              '   AND E.CD_EMPRESA  = P.CD_CLIENTE ', 'IN_MARINHA_MERCANTE_ICMS') = '1';
      ppDBText50.Visible := ppLabel50.Visible;
    end;

    ppLabel56.Visible := ppLabel50.Visible;
    ppDBText57.Visible := ppLabel56.Visible;

    if datm_DI_Resumo.qry_resumo_di_IN_FUNDO_POBREZA.AsString = '0' then
    begin
      // ICMS+Acrésc.
      ppLabel55.Top  := ppLabel50.Top;
      ppDBText59.Top := ppLabel55.Top;

      // ICMS+AFRMM
      ppLabel50.Top  := ppLabel41.Top;
      ppDBText50.Top := ppLabel50.Top;

      // COFINS
      ppLabel41.Top  := ppLabel40.Top;
      ppDBText34.Top := ppLabel41.Top;

      // PIS
      ppLabel40.Top  := ppLabel52.Top;
      ppDBText38.Top := ppLabel40.Top;

      // FECP
      ppLabel52.Visible  := False;
      ppDBText53.Visible := False;
    end;

    ppLabel55.Visible := SameText(datm_DI_Resumo.qry_resumo_di_CD_GRUPO.AsString, 'B40');
    ppDBText59.Visible := ppLabel55.Visible;

    if ppLabel50.Visible and (ConsultaLookUPSQL(' SELECT CASE ' +
                                                '            WHEN SUM(ISNULL(VL_ICMS_A_RECOLHER, ''0'')) < SUM(ISNULL(VL_ICMS_A_RECOLHER_AFRMM, ''0'')) THEN ''1'' ' +
                                                '        ELSE ''0'' ' +
                                                '        END AS IN_AFRMM_UTILIZADO ' +
                                                ' FROM TADICAO_DE_IMPORTACAO ' +
                                                ' WHERE NR_PROCESSO = ''' + datm_DI_Resumo.qry_resumo_di_NR_PROCESSO_COMPLETO.AsString + '''',
                                                'IN_AFRMM_UTILIZADO') = '0') then
    begin
      ppLabel50.Visible := False;           // Caso não use Marinha Mercante no processo, deixa invisíveis as mensagens.     Eric 27/08/2012.
      ppDBText50.Visible := False;
    end;

    if not ppLabel50.Visible then
    begin
      // ICMS+Acrésc.
      ppLabel55.Top  := ppLabel50.Top;
      ppDBText59.Top := ppLabel55.Top;
    end;

      // A linha abaixo foi comentada para que, caso o processo não utilize Marinha Mercante, a linha não apareça.       Eric 27/08/2012.
      //pplabel50.Caption := 'ICMS:';

    // Definição do label de data de chegada - Michel - 09/06/2009
    {01 Marítima        = Chegada do Navio
     02 Fluvial         = Chegada
     03 Lacustre        = Chegada
     04 Aérea           = Chegada do Vôo
     05 Postal          = Chegada
     06 Ferroviária     = Chegada do Trem
     07 Rodoviária      = Chegada do Caminhão
     08 Tubo-Conduto    = Chegada
     09 Meios Próprios  = Chegada
     10 Todas           = Chegada
     11 Rodoferroviário = Chegada
     12 By Sea          = Chegada do Navio}
    if datm_DI_Resumo.qry_resumo_di_CD_VIA_TRANSP_CARG.AsString = '01' then
      TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Caption := 'Dt. Chegada do Navio:'
    else if datm_DI_Resumo.qry_resumo_di_CD_VIA_TRANSP_CARG.AsString = '04' then
      TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Caption := 'Dt. Chegada do Vôo:'
    else if datm_DI_Resumo.qry_resumo_di_CD_VIA_TRANSP_CARG.AsString = '06' then
      TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Caption := 'Dt. Chegada do Trem:'
    else if datm_DI_Resumo.qry_resumo_di_CD_VIA_TRANSP_CARG.AsString = '07' then
      TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Caption := 'Dt. Chegada do Caminhão:'
    else if datm_DI_Resumo.qry_resumo_di_CD_VIA_TRANSP_CARG.AsString = '12' then
      TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Caption := 'Dt. Chegada do Navio:'
    else
      TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Caption := 'Dt. Chegada:';

    // Posiciona o DB de acordo com a posição e tamanho do Label - Michel - 09/06/2009
    TppDBText(datm_DI_Resumo.FindComponent('ppDBText48')).Left := TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Left +
       TppLabel(datm_DI_Resumo.FindComponent('ppLabel48')).Width + 0.1;


    ppReport.Print;
  end;
end;

procedure Tfrm_DI_Resumo.FormShow(Sender: TObject);
begin
  Panel2.Color := clMenuBroker;
  Shape1.Brush.Color := clPnlClaroBroker;
  Shape2.Brush.Color := clPnlClaroBroker;
  Shape4.Brush.Color := clMenuBroker;
  Shape3.Brush.Color := clMenuBroker;
  Shape5.Brush.Color := clMenuBroker;
end;

procedure Tfrm_DI_Resumo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.Font.Color := clBlack;
  TDBGrid(Sender).Canvas.FillRect(Rect);
  if CompareText(datm_DI_Resumo.qryCntrEmbalagemTITULO.AsString, 'Containers') = 0 then
    TDBGrid(Sender).Canvas.Brush.Color := $00E4F4E3 // Verde
  else
    TDBGrid(Sender).Canvas.Brush.Color := clWhite; // Branco
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
