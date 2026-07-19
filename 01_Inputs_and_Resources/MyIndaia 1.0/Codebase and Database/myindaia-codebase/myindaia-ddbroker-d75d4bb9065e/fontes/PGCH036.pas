unit PGCH036;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls, dbtables, ComObj, DBCtrls,
  Db, UCRPE32, ShellApi, Funcoes, ExcelXP, StrUtils;

type
  Tfrm_sel_relat = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_cd_analista: TLabel;
    btn_co_analista: TSpeedButton;
    msk_cd_analista: TMaskEdit;
    edt_nm_analista: TEdit;
    lbl_cd_destino: TLabel;
    btn_co_destino: TSpeedButton;
    msk_cd_destino: TMaskEdit;
    edt_nm_destino: TEdit;
    lbl_cd_modal: TLabel;
    btn_co_modal: TSpeedButton;
    msk_cd_modal: TMaskEdit;
    edt_nm_modal: TEdit;
    lbl_in_faturado: TLabel;
    cbo_faturado: TComboBox;
    Shape1: TShape;
    msk_cd_desp: TMaskEdit;
    lblDespachante: TLabel;
    btn_co_desp: TSpeedButton;
    edt_nm_desp: TEdit;
    crp_sel_relat: TCRPE;
    msk_representante: TMaskEdit;
    edt_representante: TEdit;
    lbl_representante: TLabel;
    btn_representante: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure msk_cd_destinoExit(Sender: TObject);
    procedure msk_cd_modalExit(Sender: TObject);
    procedure msk_cd_analistaExit(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure btn_co_analistaClick(Sender: TObject);
    procedure btn_co_modalClick(Sender: TObject);
    procedure msk_cd_despExit(Sender: TObject);
    function VporPDecimal(Valor:String):String;
    procedure btn_co_despClick(Sender: TObject);
    function Decimais(Valor:String):String;
    procedure btn_representanteClick(Sender: TObject);
    procedure msk_representanteExit(Sender: TObject);
    // 1 -  Relatório de Retenção
    // 2 -  Processos em Andamento
    // 3 -  Processos Desembaraçados
    // 4 -  Mapa Analítico Oxiteno
    // 5 -  Quantidade Processos Indaiá
    // 6 -  Acompanhamento de Processos ( Oxiteno )
    // 7 -  Controle de Embarque
    // 8 -  Relatório de Valores de Retenção
    // 9 -  Relatório Demonstrativo Cobrança de Comissão - DuPont
    // 10 - Fluxo de Caixa Operacional
    // 11 - SDA - Despachantes/Mês

  private
    // Private declarations 
  public
    // Public declarations 
    tp_rel : Byte;
    Cons_OnLine_Texto : String;
    qry_grupo_item : TQuery;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
  end;

var
  frm_sel_relat: Tfrm_sel_relat;

const
  Titulos: array [0..23] of String = ('Nr. Ref. Indaiá',
                                      'Nr. DI',
                                      'Cliente',
                                      'Agente de Carga',
                                      'Via de Transporte',
                                      'Porto / Aeroporto de Destino',
                                      'Porto / Aeroporto de Origem',
                                      'Navio',
                                      'Desembaraço',
                                      'Envio de Nota Fiscal ao Transportador',
                                      'Processo Enviado ao Pré-Faturamento',
                                      'Processo enviado ao Faturamento',
                                      'Emissão Nota Fiscal de Serviço',
                                      'Parceiro',
                                      'Data do Recebimento',
                                      'Desembaraço  X  Faturamento',
                                      'Valor do Desembaraço - Parceiro',
                                      'Valor do SDAS - Parceiro',
                                      'Total Parceiro',
                                      'Valor do Desembaraço - Indaiá',
                                      'Valor do SDAS - Indaiá',
                                      'Total - Indaiá',
                                      'Parceiros X Indaiá',
                                      'Observações');

implementation

uses FILETEXT,PGGP001, PGCH037, GSMLIB, PGCH015, PGSM018, PGSM010, PGSM119, PGSM024,
     PGGP017, PGSM210, PGSM096, PGSM148, PGRE003, PGSM212, PGSM016, PGSM011, PGSM025,
     ConsOnLineEx;


  {$R *.DFM}


procedure Tfrm_sel_relat.FormCreate(Sender: TObject);
begin
  // Cria o data module datm_sel_relat
  Application.CreateForm( Tdatm_sel_relat, datm_sel_relat);
end;

procedure Tfrm_sel_relat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Close;
end;

procedure Tfrm_sel_relat.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  if ( tp_rel = 1 ) or ( tp_rel = 8 ) or ( tp_rel = 9 ) then
  begin
    frm_sel_relat.Caption  := 'Relatório de Retenção';

    if tp_rel = 8 then
      frm_sel_relat.Caption  := 'Relatório de Valores Retenção';

    if tp_rel = 9 then
      frm_sel_relat.Caption := 'Relatório DuPont';
    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    msk_cd_produto.Text    := '01';
    lbl_produto.Visible    := True;
    msk_cd_produto.Visible := True;
    edt_nm_produto.Visible := True;
    btn_co_produto.Visible := True;

    lbl_cd_cliente.Visible := True;
    msk_cd_cliente.Visible := True;
    edt_nm_cliente.Visible := True;
    btn_co_cliente.Visible := True;

    lblGrupo.Top           := 90;
    msk_cd_grupo.Top       := 103;
    edt_nm_grupo.Top       := 103;
    btn_co_grupo.Top       := 103;

    lbl_cd_cliente.Top     := 126;
    msk_cd_cliente.Top     := 140;
    edt_nm_cliente.Top     := 140;
    btn_co_cliente.Top     := 140;

    lbl_periodo.Top        := 172;
    lbl_a.Top              := 202;
    msk_dt_inicio.Top      := 194;
    msk_dt_fim.Top         := 194;
    btn_imprimir.Top       := 254;
    btn_sair.Top           := 254;

    frm_sel_relat.Height   := 326;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_produto.TabOrder  := 1;
    msk_cd_grupo.TabOrder    := 2;
    msk_cd_cliente.TabOrder  := 3;
    msk_dt_inicio.TabOrder   := 4;
    msk_dt_fim.TabOrder      := 5;
    btn_imprimir.TabOrder    := 6;
    btn_sair.TabOrder        := 7;

    msk_dt_inicio.Date     := dt_server;
  end;

  if tp_rel = 2 then
  begin
    frm_sel_relat.Caption  := 'Relatório de Processos em Andamento';

    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    lbl_cd_cliente.Visible := True;
    msk_cd_cliente.Visible := True;
    edt_nm_cliente.Visible := True;
    btn_co_cliente.Visible := True;


    msk_cd_produto.Text    := '01';
    lbl_produto.Visible    := True;
    msk_cd_produto.Visible := True;
    edt_nm_produto.Visible := True;
    btn_co_produto.Visible := True;

    msk_dt_inicio.Visible  := False;
    msk_dt_fim.Visible     := False;
    lbl_a.Visible          := False;
    lbl_periodo.Visible    := False;

    lbl_produto.Top        := 53;
    msk_cd_produto.Top     := 66;
    edt_nm_produto.Top     := 66;
    btn_co_produto.Top     := 66;

    lblGrupo.Top           := 90;
    msk_cd_grupo.Top       := 103;
    edt_nm_grupo.Top       := 103;
    btn_co_grupo.Top       := 103;

    lbl_cd_cliente.Top     := 127;
    msk_cd_cliente.Top     := 140;
    edt_nm_cliente.Top     := 140;
    btn_co_cliente.Top     := 140;

    btn_imprimir.Top       := 195;
    btn_sair.Top           := 195;

    frm_sel_relat.Height   := 270;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_produto.TabOrder  := 1;
    msk_cd_grupo.TabOrder    := 2;
    msk_cd_cliente.TabOrder  := 3;
    btn_imprimir.TabOrder    := 4;
    btn_sair.TabOrder        := 5;

  end;

  if tp_rel = 3 then
  begin
    frm_sel_relat.Caption  := 'Relatório Desembaraços';

    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    lbl_cd_cliente.Visible   := True;
    msk_cd_cliente.Visible   := True;
    edt_nm_cliente.Visible   := True;
    btn_co_cliente.Visible   := True;

    msk_cd_produto.Text      := '01';
    lbl_produto.Visible      := False;
    msk_cd_produto.Visible   := False;
    edt_nm_produto.Visible   := False;
    btn_co_produto.Visible   := False;

    lblGrupo.Top             := 53;
    msk_cd_grupo.Top         := 66;
    edt_nm_grupo.Top         := 66;
    btn_co_grupo.Top         := 66;

    lbl_cd_cliente.Top       := 90;
    msk_cd_cliente.Top       := 103;
    edt_nm_cliente.Top       := 103;
    btn_co_cliente.Top       := 103;

    lbl_periodo.Top          := 135;
    lbl_a.Top                := 165;
    msk_dt_inicio.Top        := 157;
    msk_dt_fim.Top           := 157;
    btn_imprimir.Top         := 217;
    btn_sair.Top             := 217;

    frm_sel_relat.Height     := 289;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_grupo.TabOrder    := 1;
    msk_cd_cliente.TabOrder  := 2;
    msk_dt_inicio.TabOrder   := 3;
    msk_dt_fim.TabOrder      := 4;
    btn_imprimir.TabOrder    := 5;
    btn_sair.TabOrder        := 6;

    msk_dt_inicio.Date       := dt_server;
  end;

  if tp_rel = 37 then
  begin
    frm_sel_relat.Caption  := 'Relatório de Parceiros';

    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    msk_cd_produto.Text      := '01';
    lbl_produto.Visible      := False;
    msk_cd_produto.Visible   := False;
    edt_nm_produto.Visible   := False;
    btn_co_produto.Visible   := False;

    lbl_representante.Visible   := True;
    msk_representante.Visible   := True;
    edt_representante.Visible   := True;
    btn_representante.Visible   := True;

    lblGrupo.Top             := 53;
    msk_cd_grupo.Top         := 66;
    edt_nm_grupo.Top         := 66;
    btn_co_grupo.Top         := 66;

    lbl_representante.Top    := 90;
    msk_representante.Top    := 103;
    edt_representante.Top    := 103;
    btn_representante.Top    := 103;

    lbl_periodo.Top          := 135;
    lbl_a.Top                := 165;
    msk_dt_inicio.Top        := 157;
    msk_dt_fim.Top           := 157;
    btn_imprimir.Top         := 217;
    btn_sair.Top             := 217;

    frm_sel_relat.Height     := 289;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_grupo.TabOrder    := 1;
    msk_representante.TabOrder  := 2;
    msk_dt_inicio.TabOrder   := 3;
    msk_dt_fim.TabOrder      := 4;
    btn_imprimir.TabOrder    := 5;
    btn_sair.TabOrder        := 6;

    msk_dt_inicio.Date       := dt_server;
  end;

  if tp_rel = 4 then
  begin
    frm_sel_relat.Caption  := 'Mapa Analítico - Oxiteno';

    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    lbl_cd_cliente.Visible := True;
    msk_cd_cliente.Visible := True;
    edt_nm_cliente.Visible := True;
    btn_co_cliente.Visible := True;

    msk_cd_produto.Text    := '02';
    lbl_produto.Visible    := False;
    msk_cd_produto.Visible := False;
    edt_nm_produto.Visible := False;
    btn_co_produto.Visible := False;

    lbl_cd_analista.Visible := True;
    msk_cd_analista.Visible := True;
    edt_nm_analista.Visible := True;
    btn_co_analista.Visible := True;

    lbl_cd_destino.Visible := True;
    msk_cd_destino.Visible := True;
    edt_nm_destino.Visible := True;
    btn_co_destino.Visible := True;

    lbl_cd_modal.Visible := True;
    msk_cd_modal.Visible := True;
    edt_nm_modal.Visible := True;
    btn_co_modal.Visible := True;


    lblGrupo.Top           := 53;
    msk_cd_grupo.Top       := 66;
    edt_nm_grupo.Top       := 66;
    btn_co_grupo.Top       := 66;

    lbl_cd_cliente.Top     := 90;
    msk_cd_cliente.Top     := 103;
    edt_nm_cliente.Top     := 103;
    btn_co_cliente.Top     := 103;

    lbl_cd_analista.Top    := 127;
    msk_cd_analista.Top    := 140;
    edt_nm_analista.Top    := 140;
    btn_co_analista.Top    := 140;

    lbl_cd_destino.Top     := 163;
    msk_cd_destino.Top     := 176;
    edt_nm_destino.Top     := 176;
    btn_co_destino.Top     := 176;

    lbl_cd_modal.Top       := 201;
    msk_cd_modal.Top       := 214;
    edt_nm_modal.Top       := 214;
    btn_co_modal.Top       := 214;

    lbl_periodo.Top        := 247;
    lbl_a.Top              := 277;
    msk_dt_inicio.Top      := 269;
    msk_dt_fim.Top         := 269;
    btn_imprimir.Top       := 329;
    btn_sair.Top           := 329;

    frm_sel_relat.Height   := 392;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_grupo.TabOrder    := 1;
    msk_cd_cliente.TabOrder  := 2;
    msk_cd_analista.TabOrder := 3;
    msk_cd_destino.TabOrder  := 4;
    msk_cd_modal.TabOrder    := 5;
    msk_dt_inicio.TabOrder   := 6;
    msk_dt_fim.TabOrder      := 7;
    btn_imprimir.TabOrder    := 8;
    btn_sair.TabOrder        := 9;

    msk_dt_inicio.Date     := dt_server - 30;
    msk_dt_fim.Date        := dt_server;
  end;

  if tp_rel = 5 then
  begin
    frm_sel_relat.Caption  := 'Quantidade de Processos Indaiá';

    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    lbl_cd_cliente.Visible := True;
    msk_cd_cliente.Visible := True;
    edt_nm_cliente.Visible := True;
    btn_co_cliente.Visible := True;

    lbl_produto.Visible    := True;
    msk_cd_produto.Visible := True;
    edt_nm_produto.Visible := True;
    btn_co_produto.Visible := True;

    lbl_cd_analista.Visible   := True;
    msk_cd_analista.Visible   := True;
    edt_nm_analista.Visible   := True;
    btn_co_analista.Visible   := True;
    msk_cd_analista.EditMask  := '9' + msk_cd_analista.EditMask;

    //msk_cd_analista.Enabled := False;
    //msk_cd_analista.TabStop := False;
    //msk_cd_analista.Color   := clMenu;
    //edt_nm_analista.Text    := '';
    //btn_co_analista.Enabled := False;


    lbl_cd_destino.Visible := True;
    msk_cd_destino.Visible := True;
    edt_nm_destino.Visible := True;
    btn_co_destino.Visible := True;

    lbl_cd_modal.Visible := True;
    msk_cd_modal.Visible := True;
    edt_nm_modal.Visible := True;
    btn_co_modal.Visible := True;

    cbo_faturado.Visible    := True;
    lbl_in_faturado.Visible := True;

    lbl_produto.Top        := 53;
    msk_cd_produto.Top     := 66;
    edt_nm_produto.Top     := 66;
    btn_co_produto.Top     := 66;

    lblGrupo.Top           := 90;
    msk_cd_grupo.Top       := 103;
    edt_nm_grupo.Top       := 103;
    btn_co_grupo.Top       := 103;

    lbl_cd_cliente.Top     := 127;
    msk_cd_cliente.Top     := 140;
    edt_nm_cliente.Top     := 140;
    btn_co_cliente.Top     := 140;

    lbl_cd_analista.Top    := 163;
    msk_cd_analista.Top    := 176;
    edt_nm_analista.Top    := 176;
    btn_co_analista.Top    := 176;

    lbl_cd_destino.Top     := 201;
    msk_cd_destino.Top     := 214;
    edt_nm_destino.Top     := 214;
    btn_co_destino.Top     := 214;

    lbl_cd_modal.Top       := 238;
    msk_cd_modal.Top       := 251;
    edt_nm_modal.Top       := 251;
    btn_co_modal.Top       := 251;

    lbl_periodo.Top        := 315;
    lbl_a.Top              := 345;
    msk_dt_inicio.Top      := 337;
    msk_dt_fim.Top         := 337;
    btn_imprimir.Top       := 397;
    btn_sair.Top           := 397;

    lbl_in_faturado.Top    := 275;
    cbo_faturado.Top       := 288;

    frm_sel_relat.Height   := 467;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_produto.TabOrder  := 1;
    msk_cd_grupo.TabOrder    := 2;
    msk_cd_cliente.TabOrder  := 3;
    msk_cd_analista.TabOrder := 4;
    msk_cd_destino.TabOrder  := 5;
    msk_cd_modal.TabOrder    := 6;
    cbo_faturado.TabOrder    := 7;
    msk_dt_inicio.TabOrder   := 8;
    msk_dt_fim.TabOrder      := 9;
    btn_imprimir.TabOrder    := 10;
    btn_sair.TabOrder        := 11;

    msk_dt_inicio.Date     := dt_server - 30;
    msk_dt_fim.Date        := dt_server;
  end;

  if tp_rel = 6 then
  begin
    frm_sel_relat.Caption  := 'Follow-Up Geral ( Oxiteno )';

    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    lbl_cd_cliente.Visible := True;
    msk_cd_cliente.Visible := True;
    edt_nm_cliente.Visible := True;
    btn_co_cliente.Visible := True;

    lbl_produto.Visible    := True;
    msk_cd_produto.Visible := True;
    edt_nm_produto.Visible := True;
    btn_co_produto.Visible := True;

    lbl_produto.Top        := 53;
    msk_cd_produto.Top     := 66;
    edt_nm_produto.Top     := 66;
    btn_co_produto.Top     := 66;

    lblGrupo.Top             := 90;
    msk_cd_grupo.Top         := 103;
    edt_nm_grupo.Top         := 103;
    btn_co_grupo.Top         := 103;

    lbl_cd_cliente.Top       := 127;
    msk_cd_cliente.Top       := 140;
    edt_nm_cliente.Top       := 140;
    btn_co_cliente.Top       := 140;

    lbl_periodo.Top          := 175;
    lbl_a.Top                := 405;
    msk_dt_inicio.Top        := 197;
    msk_dt_fim.Top           := 197;
    btn_imprimir.Top         := 237;
    btn_sair.Top             := 237;

    frm_sel_relat.Height     := 320;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_produto.TabOrder  := 1;
    msk_cd_grupo.TabOrder    := 2;
    msk_cd_cliente.TabOrder  := 3;
    msk_dt_inicio.TabOrder   := 8;
    msk_dt_fim.TabOrder      := 9;
    btn_imprimir.TabOrder    := 10;
    btn_sair.TabOrder        := 11;

    msk_dt_inicio.Date       := dt_server - 30;
    msk_dt_fim.Date          := dt_server;
  end;

  if tp_rel = 7 then
  begin
    frm_sel_relat.Caption  := 'Controle de Embarque';

    lblGrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    lbl_cd_cliente.Visible := True;
    msk_cd_cliente.Visible := True;
    edt_nm_cliente.Visible := True;
    btn_co_cliente.Visible := True;

    lbl_produto.Visible    := True;
    msk_cd_produto.Visible := True;
    edt_nm_produto.Visible := True;
    btn_co_produto.Visible := True;

    lbl_produto.Top        := 53;
    msk_cd_produto.Top     := 66;
    edt_nm_produto.Top     := 66;
    btn_co_produto.Top     := 66;

    lblGrupo.Top             := 90;
    msk_cd_grupo.Top         := 103;
    edt_nm_grupo.Top         := 103;
    btn_co_grupo.Top         := 103;

    lbl_cd_cliente.Top       := 127;
    msk_cd_cliente.Top       := 140;
    edt_nm_cliente.Top       := 140;
    btn_co_cliente.Top       := 140;

    lbl_periodo.Top          := 175;
    lbl_a.Top                := 405;
    msk_dt_inicio.Top        := 197;
    msk_dt_fim.Top           := 197;
    btn_imprimir.Top         := 237;
    btn_sair.Top             := 237;

    frm_sel_relat.Height     := 320;

    msk_cd_unid_neg.TabOrder := 0;
    msk_cd_produto.TabOrder  := 1;
    msk_cd_grupo.TabOrder    := 2;
    msk_cd_cliente.TabOrder  := 3;
    msk_dt_inicio.TabOrder   := 8;
    msk_dt_fim.TabOrder      := 9;
    btn_imprimir.TabOrder    := 10;
    btn_sair.TabOrder        := 11;

    msk_dt_inicio.Date       := dt_server - 30;
    msk_dt_fim.Date          := dt_server;
  end;
  if tp_rel = 11 then
  begin
    frm_sel_relat.Caption  := 'SDA por Despachante';

    lbl_produto.Visible      := True;
    msk_cd_produto.Visible   := True;
    edt_nm_produto.Visible   := True;
    btn_co_produto.Visible   := True;

    msk_cd_desp.Visible      := True;
    lblDespachante.Visible   := True;
    edt_nm_desp.Visible      := True;
    btn_co_desp.Visible      := True;

    lblDespachante.Top       := 94;
    msk_cd_desp.Top          := 107;
    edt_nm_desp.Top          := 107;
    btn_co_desp.Top          := 106;

    msk_cd_desp.TabOrder     := 2;
    msk_dt_inicio.TabOrder   := 3;
    msk_dt_fim.TabOrder      := 4;
    btn_imprimir.TabOrder    := 5;
    btn_sair.TabOrder        := 6;
  end;


  with datm_sel_relat do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
end;


procedure Tfrm_sel_relat.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_prod do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;


procedure Tfrm_sel_relat.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_relat do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;


procedure Tfrm_sel_relat.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto    then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo      then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente    then btn_co_clienteClick(nil);
    if Sender = msk_cd_analista   then btn_co_analistaClick(nil);
    if Sender = msk_cd_destino    then btn_co_destinoClick(nil);
    if Sender = msk_cd_modal      then btn_co_modalClick(nil);
    if Sender = msk_cd_desp       then btn_co_despClick(btn_co_desp);
  end;
end;


procedure Tfrm_sel_relat.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_unid_prod Do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;


procedure Tfrm_sel_relat.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim( msk_cd_produto.text ) = '' then
  begin
    edt_nm_produto.Text := 'Todos';
  end
  else
  begin
    ValCodEdt( msk_cd_produto );
    if msk_cd_produto.Text <> '' then
    begin
      with datm_sel_relat do
      begin
        qry_produto_.Close;
        qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
        qry_produto_.Prepare;
        qry_produto_.Open;
        if qry_produto_.RecordCount > 0 then
        begin
          edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
        end
        else
        begin
          BoxMensagem('Produto não cadastrado!', 2);
          msk_cd_produto.SetFocus;
        end
      end;
    end
    else
    begin
      edt_nm_produto.Text := '';
    end;
  end;
end;


procedure Tfrm_sel_relat.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_grupo.Cons_OnLine_Texto <> '' then msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
end;


procedure Tfrm_sel_relat.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;

  if msk_cd_grupo.Text = '' then
  begin
    edt_nm_grupo.Text := 'Todos';
  end
  else
  begin
    ValCodEdt( msk_cd_grupo );
    with datm_sel_relat.qry_grupo_ do
    begin
      Close;
      ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
      Prepare;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem( 'Grupo não encontrado!', 2 );
        msk_cd_grupo.Clear;
        msk_cd_grupo.SetFocus;
      end
      else
      begin
        edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
      end;

      Close;
    end;
  end;
end;


procedure Tfrm_sel_relat.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;

  if Trim( msk_cd_cliente.text ) = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
  end
  else
  begin
    ValCodEdt( msk_cd_cliente );
    with datm_sel_relat.qry_cliente_ do
    begin
      ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
      Prepare;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem( 'Cliente não encontrado!', 2 );
        msk_cd_cliente.Clear;
        edt_nm_cliente.Clear;
        msk_cd_cliente.SetFocus;
      end
      else
      begin
        edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
        msk_cd_analista.Enabled := True;
        msk_cd_analista.TabStop := True;
        msk_cd_analista.Color   := clWindow;
        btn_co_analista.Enabled := True;
      end;

      Close;
    end;
  end;
end;


procedure Tfrm_sel_relat.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;

  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;


procedure Tfrm_sel_relat.msk_cd_clienteChange(Sender: TObject);
begin
  if Trim( msk_cd_cliente.text ) = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;


procedure Tfrm_sel_relat.msk_cd_grupoChange(Sender: TObject);
begin
  if Trim( msk_cd_grupo.Text ) = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;


procedure Tfrm_sel_relat.btn_imprimirClick(Sender: TObject);
const
  TotalLinhas = 10;
  TotalColunas = 12;
var
  Nr_Identificador, nLinha, jan, fev, mar, abr, mai, jun, jul, ago, sete, outu, nov, dez, aux, ano1, contador_cabec, contador_coluna, contador_linha: integer ;
  nr_processo, ano, ncm, nr_di, vNrPo, vCodFilial, linha, desp, esp, cabec, linhac, vMes : String;
  Excel, xlWorkB, oSheet: OleVariant;
  matriz : array[ 1..totallinhas, 1 ..totalcolunas]  of integer;
  aTotal, aTotalCont, aTotalHon : array [1..12] of Double;
  lin : byte;
  nr_identificador_acomp, meses : integer;
  vUltProcesso, tVlIR, data_mask, data_mask_inicio, data_mask_fim : string;
  vMudouProcesso : Boolean;
  totcomissao, dTotRel, dTotRelCont, dTotRelHon, dTotRelIR, VlIR, aliq : Double;
  I, contador_coluna_grupo: Integer;
begin
  Nr_Identificador := 0;
  Screen.Cursor := crHourGlass;

  if tp_rel = 37 then
  begin
    if msk_dt_inicio.Date > msk_dt_fim.Date then
    begin
      BoxMensagem('Data inicial deve ser menor que a Final... !', 1 );
      msk_dt_inicio.SetFocus;
      Exit;
    end;

    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( 'SELECT F.CD_ITEM FROM TFATURAMENTO_CC F');
      SQL.Add( ' INNER JOIN TGRUPO_ITEM_ITEM GI ON (GI.CD_ITEM = F.CD_ITEM)');
      if (edt_nm_unid_neg.Text <> '') or (edt_representante.Text <> '') or (msk_cd_grupo.Text <> '') Then
        SQL.Add( ' INNER JOIN TPROCESSO P ON (P.NR_PROCESSO = F.NR_PROCESSO)');
      SQL.Add( ' WHERE DT_LANCAMENTO BETWEEN CONVERT(DATETIME,''' + data_mask_inicio + ''', 103) AND  CONVERT(DATETIME,''' + data_mask_fim + ''', 103)');
      SQL.Add( ' AND F.CD_ITEM NOT IN (SELECT CD_ITEM FROM TGRUPO_ITEM_ITEM)');
      if edt_nm_unid_neg.Text <> '' Then
        SQL.Add( ' AND P.CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +'''');
      if edt_representante.Text <> '' Then
        SQL.Add( ' AND P.CD_REPRESENTANTE = '''+ msk_representante.Text +'''');
      if msk_cd_grupo.Text <> '' Then
        SQL.Add( ' AND P.CD_GRUPO = '''+ msk_cd_grupo.Text +'''');
      Open;
      if RecordCount > 0 then
      begin
        ShowMessage('Não foi possível gerar este relatório.'+#13+'Certifique-se de que todos os itens têm grupos cadastrados!');
        Exit;
      end;
    end;

    data_mask := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
    data_mask_inicio := DateToStr(msk_dt_inicio.Date);
    data_mask_fim := DateToStr(msk_dt_fim.Date);
    Excel   := CreateOLEObject('Excel.Application');
    xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_PARCEIROS.XLS' );
    oSheet := Excel.WorkBooks[1].Worksheets[1];

    contador_cabec := 0;
    //Cria Cabeçalho
    for I := 0 to High(Titulos) do
    begin
      oSheet.Cells[3, contador_cabec + 2].value := AnsiUpperCase(Titulos[I]);
      oSheet.Cells[3, contador_cabec + 2].Interior.Color := $00663300;
      oSheet.Cells[3, contador_cabec + 2].Font.ColorIndex := 2;
      oSheet.Cells[3, contador_cabec + 2].Font.Bold := True;
      oSheet.Cells[3, contador_cabec + 2].Columns.AutoFit;
      oSheet.Cells[3, contador_cabec + 2].HorizontalAlignment := xlCenter;
      oSheet.Cells[3, contador_cabec + 2].VerticalAlignment:= xlCenter;
      If AnsiIndexText(Titulos[I], ['Desembaraço', 'Envio de Nota Fiscal ao Transportador', 'Processo Enviado ao Pré-Faturamento',
         'Processo enviado ao Faturamento', 'Emissão Nota Fiscal de Serviço']) >= 0 then
      begin
        oSheet.Range[oSheet.Cells[3, contador_cabec + 2].Address + ':' + oSheet.Cells[3, contador_cabec + 2 + 2].Address].Merge;

        oSheet.Cells[4, contador_cabec + 2].value := 'Prevista';
        oSheet.Cells[4, contador_cabec + 2].Interior.Color := $00663300;
        oSheet.Cells[4, contador_cabec + 2].Font.ColorIndex := 2;
        oSheet.Cells[4, contador_cabec + 2].Font.Bold := True;
        oSheet.Cells[4, contador_cabec + 2].HorizontalAlignment := xlCenter;
        oSheet.Cells[4, contador_cabec + 2].VerticalAlignment:= xlCenter;
        Inc(contador_cabec);

        oSheet.Cells[4, contador_cabec + 2].value := 'KPI';
        oSheet.Cells[4, contador_cabec + 2].Interior.Color := $00663300;
        oSheet.Cells[4, contador_cabec + 2].Font.ColorIndex := 2;
        oSheet.Cells[4, contador_cabec + 2].Font.Bold := True;
        oSheet.Cells[4, contador_cabec + 2].Columns.AutoFit;
        oSheet.Cells[4, contador_cabec + 2].HorizontalAlignment := xlCenter;
        oSheet.Cells[4, contador_cabec + 2].VerticalAlignment:= xlCenter;
        oSheet.Cells[4, contador_cabec + 1].ColumnWidth := (oSheet.Cells[3, contador_cabec + 1].ColumnWidth + oSheet.Cells[3, contador_cabec + 3].ColumnWidth) / 2;
        oSheet.Cells[4, contador_cabec + 3].ColumnWidth := oSheet.Cells[4, contador_cabec + 1].ColumnWidth;
        Inc(contador_cabec);

        oSheet.Cells[4, contador_cabec + 2].value := 'Realizada';
        oSheet.Cells[4, contador_cabec + 2].Interior.Color := $00663300;
        oSheet.Cells[4, contador_cabec + 2].Font.ColorIndex := 2;
        oSheet.Cells[4, contador_cabec + 2].Font.Bold := True;
        oSheet.Cells[4, contador_cabec + 2].HorizontalAlignment := xlCenter;
        oSheet.Cells[4, contador_cabec + 2].VerticalAlignment:= xlCenter;
      end
      else
        oSheet.Cells[4, contador_cabec + 2].Interior.Color := $00663300;
      Inc(contador_cabec);
    end;
    oSheet.Rows[3].RowHeight    := 20;
    oSheet.Rows[4].RowHeight    := 13;

    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( 'SELECT DISTINCT G.NM_GRUPO_ITEM FROM TFATURAMENTO_CC F');
      SQL.Add( ' INNER JOIN TGRUPO_ITEM_ITEM GI ON (GI.CD_ITEM = F.CD_ITEM)');
      SQL.Add( ' INNER JOIN TGRUPO_ITEM G ON (G.CD_GRUPO_ITEM = GI.CD_GRUPO_ITEM)');
      if (edt_nm_unid_neg.Text <> '') or (edt_representante.Text <> '') or (msk_cd_grupo.Text <> '') Then
        SQL.Add( ' INNER JOIN TPROCESSO P ON (P.NR_PROCESSO = F.NR_PROCESSO)');
      SQL.Add( ' WHERE DT_LANCAMENTO BETWEEN CONVERT(DATETIME,''' + data_mask_inicio + ''', 103) AND  CONVERT(DATETIME,''' + data_mask_fim + ''', 103)');
      if edt_nm_unid_neg.Text <> '' Then
        SQL.Add( ' AND P.CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +'''');
      if edt_representante.Text <> '' Then
        SQL.Add( ' AND P.CD_REPRESENTANTE = '''+ msk_representante.Text +'''');
      if msk_cd_grupo.Text <> '' Then
        SQL.Add( ' AND P.CD_GRUPO = '''+ msk_cd_grupo.Text +'''');
      SQL.Add( ' ORDER BY G.NM_GRUPO_ITEM');
      Open;
      DisableControls;
      while not Eof do
      begin
        oSheet.Cells[3, contador_cabec + 2].value := AnsiUpperCase(Fields[0].AsString);
        oSheet.Cells[3, contador_cabec + 2].Interior.Color := $00663300;
        oSheet.Cells[3, contador_cabec + 2].Font.ColorIndex := 2;
        oSheet.Cells[3, contador_cabec + 2].Font.Bold := True;
        oSheet.Cells[3, contador_cabec + 2].Columns.AutoFit;
        oSheet.Cells[3, contador_cabec + 2].HorizontalAlignment := xlCenter;
        oSheet.Cells[3, contador_cabec + 2].VerticalAlignment:= xlCenter;
        oSheet.Cells[4, contador_cabec + 2].Interior.Color := $00663300;
        oSheet.Cells[4, contador_cabec + 2].Font.ColorIndex := 2;
        oSheet.Cells[4, contador_cabec + 2].Font.Bold := True;
        oSheet.Cells[4, contador_cabec + 2].Columns.AutoFit;
        oSheet.Rows[3].RowHeight    := 20;
        oSheet.Rows[4].RowHeight    := 13;
        Inc(contador_cabec);
        Next;
      end;
      EnableControls;
      Close;
      Free;
    end;
    //Finaliza Cabeçalho

    //Cria Resultados
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( ' SELECT DISTINCT SUBSTRING(P.NR_PROCESSO,5,11), P.NR_DI, E.NM_EMPRESA, A.NM_AGENTE,  VIA.NM_VIA_TRANSPORTE, LE.DESCRICAO, LE2.DESCRICAO, ');
      SQL.Add( ' (SELECT NM_EMBARCACAO FROM TEMBARCACAO EM (NOLOCK) WHERE EM.CD_EMBARCACAO = P.CD_EMBARCACAO) AS NAVIO, ');
      SQL.Add( ' F088.DT_PREVISTA, DATEDIFF(DAY,F088.DT_REALIZACAO,F088.DT_PREVISTA) AS F088_KPI, F088.DT_REALIZACAO,');
      SQL.Add( ' F041.DT_PREVISTA, DATEDIFF(DAY,F041.DT_REALIZACAO,F088.DT_PREVISTA) AS F041_KPI, F041.DT_REALIZACAO,');
      SQL.Add( ' F289.DT_PREVISTA, DATEDIFF(DAY,F289.DT_REALIZACAO,F289.DT_PREVISTA) AS F289_KPI, F289.DT_REALIZACAO,');
      SQL.Add( ' F114.DT_PREVISTA, DATEDIFF(DAY,F114.DT_REALIZACAO,F114.DT_PREVISTA) AS F114_KPI, F114.DT_REALIZACAO,');
      SQL.Add( ' F092.DT_PREVISTA, DATEDIFF(DAY,F092.DT_REALIZACAO,F092.DT_PREVISTA) AS F092_KPI, F092.DT_REALIZACAO,');
      SQL.Add( ' ER.AP_EMPRESA, DT_RECEBIMENTO, DATEDIFF(DAY,F092.DT_REALIZACAO,F088.DT_REALIZACAO) AS F092088_KPI, 0 VL_DES_PARC,');
      SQL.Add( ' 0 VL_SDA_PARC, 0 TOTAL_PARC, ');
      SQL.Add( ' (SELECT ISNULL(SUM(VL_ITEM),0) FROM TFATURAMENTO_CC FAT822 (NOLOCK) WHERE FAT822.NR_PROCESSO = P.NR_PROCESSO AND CD_ITEM = ''822''');
      SQL.Add( ' AND FAT822.DT_LANCAMENTO BETWEEN CONVERT(DATETIME, ''' + data_mask_inicio + ''',103) AND CONVERT(DATETIME, ''' + data_mask_fim + ''',103)) AS COMISSAO');
      SQL.Add( ', SDA.VL_PAGTO, 0 AS VL_TOT_IND');
      SQL.Add( ' FROM TPROCESSO P (nolock)');
      SQL.Add( ' LEFT JOIN TEMPRESA_NAC E (nolock) ON E.CD_EMPRESA = P.CD_CLIENTE');
      SQL.Add( ' LEFT JOIN TAGENTE A (nolock)         ON A.CD_AGENTE = P.CD_AGENTE');
      SQL.Add( ' LEFT JOIN TEMPRESA_NAC ER (nolock)    ON ER.CD_EMPRESA = P.CD_REPRESENTANTE');
      SQL.Add( ' LEFT JOIN TSERVICO S (nolock)         ON S.CD_SERVICO = P.CD_SERVICO');
      SQL.Add( ' LEFT JOIN TVIA_TRANSPORTE VIA (nolock) ON  VIA.CD_VIA_TRANSPORTE = S.CD_VIA_TRANSPORTE');
      SQL.Add( ' LEFT JOIN TLOCAL_EMBARQUE LE (nolock)  ON LE.CODIGO = P.CD_LOCAL_DESEMBARQUE');
      SQL.Add( ' LEFT JOIN TLOCAL_EMBARQUE LE2 (nolock)  ON LE2.CODIGO = P.CD_LOCAL_EMBARQUE');
      SQL.Add( ' LEFT JOIN TFOLLOWUP F088 (nolock)     ON (F088.NR_PROCESSO = P.NR_PROCESSO AND F088.CD_EVENTO = ''088'' )');
      SQL.Add( ' LEFT JOIN TFOLLOWUP F041 (nolock)     ON (F041.NR_PROCESSO = P.NR_PROCESSO AND F041.CD_EVENTO = ''041'' )');
      SQL.Add( ' LEFT JOIN TFOLLOWUP F289 (nolock)     ON (F289.NR_PROCESSO = P.NR_PROCESSO AND F289.CD_EVENTO = ''289'' )');
      SQL.Add( ' LEFT JOIN TFOLLOWUP F114 (nolock)     ON (F114.NR_PROCESSO = P.NR_PROCESSO AND F114.CD_EVENTO = ''114'' )');
      SQL.Add( ' LEFT JOIN TFOLLOWUP F092 (nolock)     ON (F092.NR_PROCESSO = P.NR_PROCESSO AND F092.CD_EVENTO = ''092'' )');
      SQL.Add( ' LEFT JOIN TFATURAMENTO_CC FAT (nolock) ON FAT.NR_PROCESSO = P.NR_PROCESSO');
      SQL.Add( ' LEFT JOIN TPROCESSO_SDA SDA (nolock)  ON SDA.NR_PROCESSO = P.NR_PROCESSO');
      SQL.Add( ' WHERE FAT.DT_LANCAMENTO BETWEEN CONVERT(DATETIME, ''' + data_mask_inicio + ''',103) AND CONVERT(DATETIME, ''' + data_mask_fim + ''',103)');

      if edt_nm_unid_neg.Text <> '' Then
        SQL.Add( ' AND P.CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +'''');
      if edt_representante.Text <> '' Then
        SQL.Add( ' AND P.CD_REPRESENTANTE = '''+ msk_representante.Text +'''');
      if msk_cd_grupo.Text <> '' Then
        SQL.Add( ' AND P.CD_GRUPO = '''+ msk_cd_grupo.Text +'''');

      Open;
      contador_coluna := 2;
      contador_linha := 5;
      DisableControls;
      while not Eof do
      begin
        for I:= 0 to Fields.Count -1 do
        begin
          if Fields[I].FullName = 'VL_TOT_IND' then
            oSheet.Cells[contador_linha, contador_coluna].value := '=' + oSheet.Cells[contador_linha, contador_coluna - 1].Address + '+' + oSheet.Cells[contador_linha, contador_coluna - 2].Address
          else
            oSheet.Cells[contador_linha, contador_coluna].value := ' ' + AnsiUpperCase(Fields[I].AsString);
          oSheet.Cells[contador_linha, contador_coluna].Font.ColorIndex := 1;
          oSheet.Cells[contador_linha, contador_coluna].HorizontalAlignment := xlLeft;
          oSheet.Cells[contador_linha, contador_coluna].VerticalAlignment:= xlCenter;
          Inc(contador_coluna);
        end;
        contador_coluna_grupo := contador_coluna + 2;
        contador_coluna := 2;
        Inc(contador_linha);
        Next;
      end;
      EnableControls;
      Close;
      Free;
    end;

    qry_grupo_item := TQuery.Create(Application);
    with qry_grupo_item do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( 'SELECT G.CD_GRUPO_ITEM, G.NM_GRUPO_ITEM FROM TFATURAMENTO_CC F');
      SQL.Add( ' INNER JOIN TGRUPO_ITEM_ITEM GI ON (GI.CD_ITEM = F.CD_ITEM)');
      SQL.Add( ' INNER JOIN TGRUPO_ITEM G ON (G.CD_GRUPO_ITEM = GI.CD_GRUPO_ITEM)');
      if (edt_nm_unid_neg.Text <> '') or (edt_representante.Text <> '') or (msk_cd_grupo.Text <> '') Then
        SQL.Add( ' INNER JOIN TPROCESSO P ON (P.NR_PROCESSO = F.NR_PROCESSO)');
      SQL.Add( ' WHERE DT_LANCAMENTO BETWEEN CONVERT(DATETIME,''' + data_mask_inicio + ''', 103) AND  CONVERT(DATETIME,''' + data_mask_fim + ''', 103)');
      if edt_nm_unid_neg.Text <> '' Then
        SQL.Add( ' AND P.CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +'''');
      if edt_representante.Text <> '' Then
        SQL.Add( ' AND P.CD_REPRESENTANTE = '''+ msk_representante.Text +'''');
      if msk_cd_grupo.Text <> '' Then
        SQL.Add( ' AND P.CD_GRUPO = '''+ msk_cd_grupo.Text +'''');
      SQL.Add( ' GROUP BY G.CD_GRUPO_ITEM, G.NM_GRUPO_ITEM');
      SQL.Add( ' ORDER BY G.NM_GRUPO_ITEM');
      Open;
      DisableControls;
      while not qry_grupo_item.Eof do
      begin
        contador_linha := 5;
        with TQuery.Create(Application) do
        begin
          DataBaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add( ' SELECT SUM(CASE G.CD_GRUPO_ITEM WHEN '''+ qry_grupo_item.Fields[0].AsString +''' THEN VL_ITEM ELSE 0 END)');
          SQL.Add( ' FROM TFATURAMENTO_CC F');
          SQL.Add( ' INNER JOIN TGRUPO_ITEM_ITEM G ON (G.CD_ITEM = F.CD_ITEM)');
          if (edt_nm_unid_neg.Text <> '') or (edt_representante.Text <> '') or (msk_cd_grupo.Text <> '') Then
            SQL.Add( ' INNER JOIN TPROCESSO P ON (P.NR_PROCESSO = F.NR_PROCESSO)');
          SQL.Add( ' WHERE F.DT_LANCAMENTO BETWEEN CONVERT(DATETIME, ''' + data_mask_inicio + ''',103) AND CONVERT(DATETIME, ''' + data_mask_fim + ''',103)');
          if edt_nm_unid_neg.Text <> '' Then
            SQL.Add( ' AND P.CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +'''');
          if edt_representante.Text <> '' Then
            SQL.Add( ' AND P.CD_REPRESENTANTE = '''+ msk_representante.Text +'''');
          if msk_cd_grupo.Text <> '' Then
            SQL.Add( ' AND P.CD_GRUPO = '''+ msk_cd_grupo.Text +'''');
          SQL.Add( ' GROUP BY F.NR_PROCESSO');
          SQL.Add( ' ORDER BY F.NR_PROCESSO');
          Open;
          //ShowMessage(InttoStr(contador_coluna));
          while not Eof do
          begin
            oSheet.Cells[contador_linha, contador_coluna_grupo].value := AnsiUpperCase(Fields[0].AsString);
            oSheet.Cells[contador_linha, contador_coluna_grupo].Font.ColorIndex := 1;
            oSheet.Cells[contador_linha, contador_coluna_grupo].HorizontalAlignment := xlLeft;
            oSheet.Cells[contador_linha, contador_coluna_grupo].VerticalAlignment:= xlCenter;
            Inc(contador_linha);
            Next;
          end;
          Inc(contador_coluna_grupo);
          Close;
        end;
        qry_grupo_item.Next;
      end;
      EnableControls;
    end;

    //Finaliza Resultados

    Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_PARCEIROS' +
          Copy(data_mask, 1, 2) + Copy(data_mask, 4, 2) + Copy(data_mask, 7, 4) + Copy(data_mask, 12,2) + Copy(data_mask, 15,2) + Copy(data_mask, 18,2) + '.XLS');
    Excel.Visible := True;
  end;


  // * * * * * * * * * * * * * * * * * * * *  Relatório de Retenção
  if tp_rel = 1 then
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem('Digite uma Unidade de Negociação... !', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;
    if msk_dt_inicio.Date > msk_dt_fim.Date then
    begin
      BoxMensagem('Data inicial deve ser menor que a Final... !', 1 );
      msk_dt_inicio.SetFocus;
      Exit;
    end;
    with datm_sel_relat do
    begin
      try
        datm_main.db_broker.StartTransaction;
        sp_rel_retencao.Close;
        sp_rel_retencao.UnPrepare;
        sp_rel_retencao.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
        if Trim( msk_cd_produto.Text ) = ''  then
          sp_rel_retencao.ParamByName('@cd_produto').AsString   := 'X'
        else
          sp_rel_retencao.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;
        if Trim( msk_cd_grupo.Text ) = '' then
          sp_rel_retencao.ParamByName('@cd_grupo').AsString   := 'X'
        else
          sp_rel_retencao.ParamByName('@cd_grupo').AsString   := msk_cd_grupo.Text;
        if Trim( msk_cd_cliente.Text ) = '' then
          sp_rel_retencao.ParamByName('@cd_cliente').AsString := 'X'
        else
          sp_rel_retencao.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
        sp_rel_retencao.ParamByName('@dt_inicio').AsDateTime  := msk_dt_inicio.Date;
        sp_rel_retencao.ParamByName('@dt_final').AsDateTime   := msk_dt_fim.Date;
        sp_rel_retencao.Prepare;
        sp_rel_retencao.ExecProc;
        Nr_Identificador := sp_rel_retencao.ParamByName('@nr_identificador').AsInteger;
        sp_rel_retencao.Close;

        qry_rel_retencao_.Close;
        qry_rel_retencao_.ParamByName('NR_IDENTIFICADOR').AsInteger := Nr_Identificador;
        qry_rel_retencao_.Prepare;
        qry_rel_retencao_.Open;

        if qry_rel_retencao_.RecordCount = 0 then
        begin
          BoxMensagem('Não há dados para o filtro especifícado!', 2);
          msk_cd_unid_neg.SetFocus;
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          Exit;
        end
        else
        begin
          ppRelUnidProd.Template.FileName         := cDir_RPT + '\RBFAT004.RTM';
          ppRelUnidProd.Template.LoadFromFile;
          ppRelUnidProd.AllowPrintToFile          := True;
          ppRelUnidProd.PrinterSetup.DocumentName := Caption;
          ppRelUnidProd.DeviceType := 'Screen';
          datm_main.db_broker.Commit;
          ppRelUnidProd.Print;
        end;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_rel_retencao_.Close;
      ApagaDados('TREL_RETENCAO', Nr_Identificador );
    end;
  end;

  // * * * * * * * * * * * * * * * * * * * *  Processos em Andamento
  if tp_rel = 2 then
  begin
    with datm_sel_relat do
    begin
    try
      Screen.Cursor := crHourGlass;

      datm_main.db_broker.StartTransaction;
      CloseStoredProc( sp_rel_proc_andamento );
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_proc_andamento.ParamByName('@cd_unid_neg').AsString := 'X'
      else
        sp_rel_proc_andamento.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      if Trim( msk_cd_produto.Text ) = '' then
        sp_rel_proc_andamento.ParamByName('@cd_produto').AsString := 'X'
      else
        sp_rel_proc_andamento.ParamByName('@cd_produto').AsString := msk_cd_produto.Text;
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_proc_andamento.ParamByName('@cd_grupo').AsString    := 'X'
      else
        sp_rel_proc_andamento.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_proc_andamento.ParamByName('@cd_cliente').AsString  := 'X'
      else
        sp_rel_proc_andamento.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;

      ExecStoredProc( sp_rel_proc_andamento );
      nr_identificador := sp_rel_proc_andamento.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_proc_andamento );
      datm_main.db_broker.Commit;

      qry_rel_proc_andamento_.Close;
      qry_rel_proc_andamento_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_proc_andamento_.Prepare;
      qry_rel_proc_andamento_.Open;

      if qry_rel_proc_andamento_.EOF then
      begin
        BoxMensagem('Não há dados para exibir', 2)
      end
      else
      begin
        try
          Excel := CreateOLEObject('Excel.Application');

          xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_PROC_ANDAMENTO.XLS' );

          Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_PROC_ANDAMENTO_' +
          Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

          oSheet := Excel.WorkBooks[1].Worksheets[1];
        except
          begin
            BoxMensagem('Erro na criação da Planilha.', 2) ;
            Exit;
          end
        end;

         // Filtros da planilha
         oSheet.Cells[ 02, 04 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
         oSheet.Cells[ 02, 04 ].Font.Bold := True;

         if Trim( msk_cd_grupo.Text ) <> '' then
         oSheet.Cells[ 03, 04 ].value := 'Grupo : ' + edt_nm_grupo.text else
         oSheet.Cells[ 03, 04 ].value := 'Cliente : ' + edt_nm_cliente.text;
         oSheet.Cells[ 04, 04 ].value := 'Processos em Andamento' ;
         oSheet.Cells[ 03, 04 ].Font.Bold := True;
         oSheet.Cells[ 04, 04 ].Font.Bold := True;

          nLinha := 8;
          // Alimenta a planilha
          while not datm_sel_relat.qry_rel_proc_andamento_.EOF do
          begin
            begin

              nLinha := nLinha + 1;

              oSheet.Cells[ nLinha, 1 ].value := qry_rel_proc_andamento_NR_PROC_PO.AsString;
              oSheet.Cells[ nLinha, 2 ].value := qry_rel_proc_andamento_NR_ITEM_PO.AsString;
              oSheet.Cells[ nLinha, 3 ].value := qry_rel_proc_andamento_NR_PROCESSO_INDAIA.AsString;
              oSheet.Cells[ nLinha, 4 ].value := qry_rel_proc_andamento_AP_MERCADORIA.AsString;
              oSheet.Cells[ nLinha, 5 ].value := qry_rel_proc_andamento_QT_MERC_UN_COMERC.AsString;
              oSheet.Cells[ nLinha, 6 ].value := qry_rel_proc_andamento_NM_EMPRESA.AsString;
              oSheet.Cells[ nLinha, 7 ].value := qry_rel_proc_andamento_DT_RECEB_PO.AsString;
              oSheet.Cells[ nLinha, 8 ].value := qry_rel_proc_andamento_DT_RECEB_COPIAS.AsString;
              oSheet.Cells[ nLinha, 9 ].value := qry_rel_proc_andamento_NM_EMBARCACAO.AsString;
              oSheet.Cells[ nLinha, 10 ].value := qry_rel_proc_andamento_DT_CHEGADA_EMBARCACAO.AsString;
              oSheet.Cells[ nLinha, 11 ].value := qry_rel_proc_andamento_DT_CAMBIO.AsString;
              oSheet.Cells[ nLinha, 12 ].value := qry_rel_proc_andamento_DT_SOL_NUMERARIO.AsString;
              oSheet.Cells[ nLinha, 13 ].value := qry_rel_proc_andamento_DT_RECEB_NUMERARIO.AsString;
              oSheet.Cells[ nLinha, 14 ].value := qry_rel_proc_andamento_DT_SOL_NUMERARIO_IMP.AsString;
              oSheet.Cells[ nLinha, 15 ].value := qry_rel_proc_andamento_DT_RECEB_DOCUMENTOS.AsString;
              oSheet.Cells[ nLinha, 16 ].value := qry_rel_proc_andamento_DT_EMISSAO_LI.AsString;
              oSheet.Cells[ nLinha, 17 ].value := qry_rel_proc_andamento_DT_REFERIMENTO_LI.AsString;
              oSheet.Cells[ nLinha, 18 ].value := qry_rel_proc_andamento_DT_REGISTRO_DI.AsString;
              oSheet.Cells[ nLinha, 19 ].value := qry_rel_proc_andamento_NM_CANAL.AsString;
              oSheet.Cells[ nLinha, 20 ].value := qry_rel_proc_andamento_DT_SOL_NF.AsString;
              oSheet.Cells[ nLinha, 21 ].value := qry_rel_proc_andamento_DT_REC_NF.AsString;
              oSheet.Cells[ nLinha, 22 ].value := qry_rel_proc_andamento_DT_CI.AsString;
              oSheet.Cells[ nLinha, 23 ].value := qry_rel_proc_andamento_DT_ENTERGA_NF_TRANSP.AsString;
              oSheet.Cells[ nLinha, 24 ].value := qry_rel_proc_andamento_NR_DIAS_DESP.AsString;
              oSheet.Cells[ nLinha, 25 ].value := qry_rel_proc_andamento_TX_OBSERVACOES.AsString;
              oSheet.Cells[ nLinha, 26 ].value := '  ';
            end;
            nr_processo := qry_rel_proc_andamento_NR_PROCESSO_INDAIA.AsString;
            qry_rel_proc_andamento_.next;
          end;

           qry_rel_proc_andamento_.close;
           Screen.Cursor := crDefault;

           // Limpa a tabela auxiliar
           ApagaDados( 'TREL_PROC_ANDAMENTO', nr_identificador );

           Excel.Visible := True;

           // Envia msg de sucesso
           ShowMessage('Planilha gerada com sucesso');

           Screen.Cursor := crDefault;
           Application.ProcessMessages;
      end;
    except
       on E: Exception do
       begin
         if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  // * * * * * * * * * * * * * * * * * * * *  Processos Desembaraçados
  if tp_rel = 3 then
  begin
    with datm_sel_relat do
    begin
      try
        Screen.Cursor := crHourGlass;

        datm_main.db_broker.StartTransaction;
        CloseStoredProc( sp_rel_proc_desembaracados );
        if Trim( msk_cd_unid_neg.Text ) = '' then
          sp_rel_proc_desembaracados.ParamByName('@cd_unid_neg').AsString := 'X'
        else
          sp_rel_proc_desembaracados.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
        if Trim( msk_cd_grupo.Text ) = '' then
          sp_rel_proc_desembaracados.ParamByName('@cd_grupo').AsString    := 'X'
        else
          sp_rel_proc_desembaracados.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
        if Trim( msk_cd_cliente.Text ) = '' then
          sp_rel_proc_desembaracados.ParamByName('@cd_cliente').AsString  := 'X'
        else
          sp_rel_proc_desembaracados.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
          sp_rel_proc_desembaracados.ParamByName('@dt_inicio').AsDate     := msk_dt_inicio.Date;
          sp_rel_proc_desembaracados.ParamByName('@dt_fim').AsDate        := msk_dt_fim.Date;

        ExecStoredProc( sp_rel_proc_desembaracados );
        nr_identificador := sp_rel_proc_desembaracados.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc( sp_rel_proc_desembaracados );
        datm_main.db_broker.Commit;

        qry_rel_proc_desembaracados_.Close;
        qry_rel_proc_desembaracados_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_rel_proc_desembaracados_.Prepare;
        qry_rel_proc_desembaracados_.Open;

        if datm_sel_relat.qry_rel_proc_desembaracados_.RecordCount = 0 then
        begin
          BoxMensagem('Não há dados para exibir', 2)
        end
        else
        begin
          try
            Excel := CreateOLEObject('Excel.Application');

            xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_PROC_DESEMBARACADOS.XLS' );

            Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_PROC_DESEMBARACADOS_' +
            Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

            oSheet := Excel.WorkBooks[1].Worksheets[1];
          except
            begin
              BoxMensagem('Erro na criação da Planilha.', 2) ;
              Exit;
            end
          end;

          // Filtros da planilha
          oSheet.Cells[ 02, 04 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
          oSheet.Cells[ 02, 04 ].Font.Bold := True;

          if Trim( msk_cd_grupo.Text ) <> '' then
           oSheet.Cells[ 03, 04 ].value := 'Grupo : ' + edt_nm_grupo.text else
           oSheet.Cells[ 03, 04 ].value := 'Cliente : ' + edt_nm_cliente.text;
           oSheet.Cells[ 04, 04 ].value := 'Processos Desembaraçados : ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' à ' +
           FormatDateTime( FData, msk_dt_fim.Date );
           oSheet.Cells[ 03, 04 ].Font.Bold := True;
           oSheet.Cells[ 04, 04 ].Font.Bold := True;

            nLinha := 8;
            // Alimenta a planilha
            while not datm_sel_relat.qry_rel_proc_desembaracados_.EOF do
            begin
              begin

                nLinha := nLinha + 1;
                oSheet.Cells[ nLinha, 1 ].value := qry_rel_proc_desembaracados_NR_PROC_PO.AsString;
                oSheet.Cells[ nLinha, 2 ].value := qry_rel_proc_desembaracados_NR_ITEM.AsString;
                oSheet.Cells[ nLinha, 3 ].value := qry_rel_proc_desembaracados_NR_PROCESSO_INDAIA.AsString;
                oSheet.Cells[ nLinha, 4 ].value := qry_rel_proc_desembaracados_AP_MERCADORIA.AsString;

                oSheet.Cells[ nLinha, 5 ].value := qry_rel_proc_desembaracados_NM_UNID_MEDIDA.AsString; //nova coluna   03703/06

                oSheet.Cells[ nLinha, 6 ].value := qry_rel_proc_desembaracados_QT_MERC_UN_COMERC.AsString;
                oSheet.Cells[ nLinha, 7 ].value := qry_rel_proc_desembaracados_NM_EMPRESA.AsString;
                oSheet.Cells[ nLinha, 8 ].value := qry_rel_proc_desembaracados_NM_EMBARCACAO.AsString;
                oSheet.Cells[ nLinha, 9 ].value := qry_rel_proc_desembaracados_DT_CHEGADA_EMBARCACAO.AsString;
                oSheet.Cells[ nLinha, 10 ].value := qry_rel_proc_desembaracados_DT_REG_DI.AsString;
                oSheet.Cells[ nLinha, 11 ].value := qry_rel_proc_desembaracados_TX_CAMBIO.AsString;
                //comentado por Rodrigo Capra em 12/11/2007 - ocorrência 03703/06
                  //oSheet.Cells[ nLinha, 11 ].value := qry_rel_proc_desembaracados_DT_SOL_NF.AsString;
                  //oSheet.Cells[ nLinha, 12 ].value := qry_rel_proc_desembaracados_DT_RECEB_NF.AsString;
                oSheet.Cells[ nLinha, 12 ].value := qry_rel_proc_desembaracados_DT_CI.AsString;
                oSheet.Cells[ nLinha, 13 ].value := qry_rel_proc_desembaracados_DT_ENTERGA_NF_TRANSP.AsString;
                oSheet.Cells[ nLinha, 14 ].value := qry_rel_proc_desembaracados_DT_FATURAMENTO.AsString;
                oSheet.Cells[ nLinha, 15 ].value := qry_rel_proc_desembaracados_NR_DIAS_DESP.AsString;
              end;
              nr_processo := qry_rel_proc_desembaracados_NR_PROCESSO_INDAIA.AsString;
              qry_rel_proc_desembaracados_.next;
            end;

             qry_rel_proc_desembaracados_.close;
             Screen.Cursor := crDefault;

             Excel.Visible := True;

             // Envia msg de sucesso
             ShowMessage('Planilha gerada com sucesso');
             Screen.Cursor := crDefault;
             Application.ProcessMessages;

             // Limpa a tabela auxiliar
             ApagaDados( 'TREL_PROC_DESEMBARACADOS', nr_identificador );

        end;
      except
         on E: Exception do
         begin
           if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end;
    end;

    // * * * * * * * * * * * * * * * * * * * *  Mapa Analítico Oxiteno
    if tp_rel = 4 then
    begin

      with datm_sel_relat do
      begin
        try
          Screen.Cursor := crHourGlass;

          datm_main.db_broker.StartTransaction;
          CloseStoredProc( sp_rel_mapa_an );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_mapa_an.ParamByName('@cd_unid_neg').AsString := 'X'
          else
            sp_rel_mapa_an.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_rel_mapa_an.ParamByName('@cd_grupo').AsString    := 'X'
          else
            sp_rel_mapa_an.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_rel_mapa_an.ParamByName('@cd_cliente').AsString  := 'X'
          else
            sp_rel_mapa_an.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
          if Trim( msk_cd_analista.Text ) = '' then
            sp_rel_mapa_an.ParamByName('@cd_analista').AsString := 'X'
          else
            sp_rel_mapa_an.ParamByName('@cd_analista').AsString := msk_cd_analista.Text;
          if Trim( msk_cd_destino.Text ) = '' then
            sp_rel_mapa_an.ParamByName('@cd_destino').AsString := 'X'
          else
            sp_rel_mapa_an.ParamByName('@cd_destino').AsString := msk_cd_destino.Text;
          if Trim( msk_cd_modal.Text ) = '' then
            sp_rel_mapa_an.ParamByName('@cd_modal').AsString := 'X'
          else
            sp_rel_mapa_an.ParamByName('@cd_modal').AsString := msk_cd_modal.Text;
            sp_rel_mapa_an.ParamByName('@dt_inicio').AsDate     := msk_dt_inicio.Date;
            sp_rel_mapa_an.ParamByName('@dt_fim').AsDate        := msk_dt_fim.Date;

          ExecStoredProc( sp_rel_mapa_an );
          nr_identificador := sp_rel_mapa_an.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_mapa_an );
          datm_main.db_broker.Commit;

          qry_rel_mapa_an_.Close;
          qry_rel_mapa_an_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_rel_mapa_an_.Prepare;
          qry_rel_mapa_an_.Open;

          if datm_sel_relat.qry_rel_mapa_an_.RecordCount = 0 then
          begin
            BoxMensagem('Não há dados para exibir', 2)
          end
          else
          begin
            try
              Excel := CreateOLEObject('Excel.Application');

              xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_MAPA_ANALITICO_OXITENO.XLS' );

              Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_MAPA_ANALITICO_OXITENO_' +
              Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

              oSheet := Excel.WorkBooks[1].Worksheets[1];
            except
              begin
                BoxMensagem('Erro na criação da Planilha.', 2) ;
                Exit;
              end
            end;

            // Filtros da planilha
             oSheet.Cells[ 02, 04 ].value := 'Período :';
             oSheet.Cells[ 03, 04 ].value := 'Unidade :';
             if Trim( msk_cd_grupo.Text ) <> '' then
             oSheet.Cells[ 04, 04 ].value := 'Grupo :' else
             oSheet.Cells[ 04, 04 ].value := 'Cliente :';
             if Trim( msk_cd_analista.Text ) <> '' then
             oSheet.Cells[ 05, 04 ].value := 'Analista :';
             if Trim( msk_cd_destino.Text ) <> '' then
             oSheet.Cells[ 06, 04 ].value := 'Destino :';
             if Trim( msk_cd_modal.Text ) <> '' then
             oSheet.Cells[ 07, 04 ].value := 'Modal :';

             oSheet.Cells[ 02, 05 ].value := FormatDateTime( FData, msk_dt_inicio.Date ) + ' à ' +
             FormatDateTime( FData, msk_dt_fim.Date );
             if Trim( msk_cd_unid_neg.Text ) = '01' then
               oSheet.Cells[ 03, 05 ].value := 'Santos'
             else
               oSheet.Cells[ 03, 05 ].value := 'Rio de Janeiro';

             if Trim( msk_cd_grupo.Text ) <> '' then
             oSheet.Cells[ 04, 05 ].value := edt_nm_grupo.text else
             oSheet.Cells[ 04, 05 ].value := edt_nm_cliente.text;
             if Trim( msk_cd_analista.Text ) <> '' then
             oSheet.Cells[ 05, 05 ].value := edt_nm_analista.Text;
             if Trim( msk_cd_destino.Text ) <> '' then
             oSheet.Cells[ 06, 05 ].value := edt_nm_destino.Text;
             if Trim( msk_cd_modal.Text ) <> '' then
             oSheet.Cells[ 07, 05 ].value := edt_nm_modal.Text;

             oSheet.Cells[ 01, 04 ].Font.Bold := True;
             oSheet.Cells[ 02, 04 ].Font.Bold := True;
             oSheet.Cells[ 03, 04 ].Font.Bold := True;
             oSheet.Cells[ 04, 04 ].Font.Bold := True;
             oSheet.Cells[ 05, 04 ].Font.Bold := True;
             oSheet.Cells[ 06, 04 ].Font.Bold := True;
             oSheet.Cells[ 07, 04 ].Font.Bold := True;

              nLinha := 8;
              // Alimenta a planilha
              while not datm_sel_relat.qry_rel_mapa_an_.EOF do
              begin
                  nLinha := nLinha + 1;
                  oSheet.Cells[ nLinha, 1 ].value := qry_rel_mapa_an_CD_REFERENCIA.AsString;
                  oSheet.Cells[ nLinha, 2 ].value := copy( qry_rel_mapa_an_NR_PROCESSO.AsString, 5, 14 );
                  oSheet.Cells[ nLinha, 3 ].value := qry_rel_mapa_an_AP_EMPRESA.AsString;
                  oSheet.Cells[ nLinha, 4 ].value := qry_rel_mapa_an_AP_MERCADORIA.AsString;
                  oSheet.Cells[ nLinha, 5 ].value := qry_rel_mapa_an_QT_CNTR.AsString;
                  oSheet.Cells[ nLinha, 6 ].value := qry_rel_mapa_an_QT_PESO_LIQ.AsString;
                  oSheet.Cells[ nLinha, 7 ].value := qry_rel_mapa_an_NM_EMBARCACAO.AsString;
                  oSheet.Cells[ nLinha, 8 ].value := qry_rel_mapa_an_NM_AGENTE.AsString;
                  oSheet.Cells[ nLinha, 9 ].value := qry_rel_mapa_an_DESCRICAO.AsString;
                  oSheet.Cells[ nLinha, 10 ].value := qry_rel_mapa_an_DT_PREV_CHEGADA.AsString;
                  oSheet.Cells[ nLinha, 11 ].value := qry_rel_mapa_an_DT_EMBARQUE.AsString;
                  oSheet.Cells[ nLinha, 12 ].value := qry_rel_mapa_an_DT_SAIDA.AsString;
                  oSheet.Cells[ nLinha, 13 ].value := qry_rel_mapa_an_NR_RE.AsString;
                  oSheet.Cells[ nLinha, 14 ].value := qry_rel_mapa_an_NR_SD.AsString;
                  oSheet.Cells[ nLinha, 15 ].value := qry_rel_mapa_an_IN_RE.AsString;
                  oSheet.Cells[ nLinha, 16 ].value := qry_rel_mapa_an_DT_ETA.AsString;
                  oSheet.Cells[ nLinha, 17 ].value := qry_rel_mapa_an_DT_CI.AsString;

                  nr_processo := qry_rel_mapa_an_NR_PROCESSO.AsString;
                  qry_rel_mapa_an_.next;
              end;

               qry_rel_mapa_an_.close;
               Screen.Cursor := crDefault;

               // Envia msg de sucesso
               ShowMessage('Planilha gerada com sucesso');

               Excel.Visible := True;

               Screen.Cursor := crDefault;
               Application.ProcessMessages;

               // Limpa a tabela auxiliae
               ApagaDados( 'TREL_MAPA_ANALITICO_OXITENO', nr_identificador );

          end;
        except
           on E: Exception do
           begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
        end;
      end;
    end;

    // * * * * * * * * * * * * * * * * * * * *  Quantidade Processos Indaiá
    if tp_rel = 5 then
    begin

      with datm_sel_relat do
      begin
        try
          Screen.Cursor := crHourGlass;

          datm_main.db_broker.StartTransaction;
          CloseStoredProc( sp_rel_qt_processos );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_qt_processos.ParamByName('@cd_unid_neg').AsString := 'X'
          else
            sp_rel_qt_processos.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
          if Trim( msk_cd_Produto.Text ) = '' then
            sp_rel_qt_processos.ParamByName('@cd_produto').AsString := 'X'
          else
            sp_rel_qt_processos.ParamByName('@cd_produto').AsString := msk_cd_Produto.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_rel_qt_processos.ParamByName('@cd_grupo').AsString    := 'X'
          else
            sp_rel_qt_processos.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_rel_qt_processos.ParamByName('@cd_cliente').AsString  := 'X'
          else
            sp_rel_qt_processos.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
          if Trim( msk_cd_analista.Text ) = '' then
            sp_rel_qt_processos.ParamByName('@cd_analista').AsString := 'X'
          else
            sp_rel_qt_processos.ParamByName('@cd_analista').AsString := msk_cd_analista.Text;
          if Trim( msk_cd_destino.Text ) = '' then
            sp_rel_qt_processos.ParamByName('@cd_destino').AsString := 'X'
          else
            sp_rel_qt_processos.ParamByName('@cd_destino').AsString := msk_cd_destino.Text;
          if Trim( msk_cd_modal.Text ) = '' then
            sp_rel_qt_processos.ParamByName('@cd_modal').AsString := 'X'
          else
            sp_rel_qt_processos.ParamByName('@cd_modal').AsString := msk_cd_modal.Text;
            sp_rel_qt_processos.ParamByName('@in_faturado').AsInteger := cbo_faturado.itemindex;
            sp_rel_qt_processos.ParamByName('@dt_inicio').AsDate  := msk_dt_inicio.Date;
            sp_rel_qt_processos.ParamByName('@dt_fim').AsDate     := msk_dt_fim.Date;

          ExecStoredProc( sp_rel_qt_processos );
          nr_identificador := sp_rel_qt_processos.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_qt_processos );
          datm_main.db_broker.Commit;

          qry_rel_qt_processos_.Close;
          qry_rel_qt_processos_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_rel_qt_processos_.Prepare;
          qry_rel_qt_processos_.Open;

          if datm_sel_relat.qry_rel_qt_processos_.RecordCount = 0 then
          begin
            BoxMensagem('Não há dados para exibir', 2)
          end
          else
          begin
            try
              Excel := CreateOLEObject('Excel.Application');

              xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_QT_PROCESSOS.XLS' );

              Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_QT_PROCESSOS_' +
              Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

              oSheet := Excel.WorkBooks[1].Worksheets[1];
            except
              begin
                BoxMensagem('Erro na criação da Planilha.', 2) ;
                Exit;
              end
            end;
             // Filtros da planilha
             oSheet.Cells[ 02, 04 ].value := 'Período :';
             oSheet.Cells[ 03, 04 ].value := 'Unidade :';
             oSheet.Cells[ 04, 04 ].value := 'Produto :';
             if Trim( msk_cd_grupo.Text ) <> '' then
             oSheet.Cells[ 05, 04 ].value := 'Grupo :' else
             oSheet.Cells[ 05, 04 ].value := 'Cliente :';
             oSheet.Cells[ 06, 04 ].value := 'Faturados (S/N):';
             if Trim( msk_cd_analista.Text ) <> '' then
             oSheet.Cells[ 07, 04 ].value := 'Analista :';
             if Trim( msk_cd_destino.Text ) <> '' then
             oSheet.Cells[ 08, 04 ].value := 'Destino :';
             if Trim( msk_cd_modal.Text ) <> '' then
             oSheet.Cells[ 09, 04 ].value := 'Modal :';

             oSheet.Cells[ 02, 06 ].value := FormatDateTime( FData, msk_dt_inicio.Date ) + ' à ' +
             FormatDateTime( FData, msk_dt_fim.Date );
             if Trim( msk_cd_unid_neg.Text ) = '01' then
               oSheet.Cells[ 03, 06 ].value := 'Santos'
             else
               oSheet.Cells[ 03, 06 ].value := 'Rio de Janeiro';
             oSheet.Cells[ 04, 06 ].value := edt_nm_produto.text;
             if Trim( msk_cd_grupo.Text ) <> '' then
             oSheet.Cells[ 05, 06 ].value := edt_nm_grupo.text else
             oSheet.Cells[ 05, 06 ].value := edt_nm_cliente.text;
             oSheet.Cells[ 06, 06 ].value := cbo_faturado.Text;
             if Trim( msk_cd_analista.Text ) <> '' then
             oSheet.Cells[ 07, 06 ].value := edt_nm_analista.Text;
             if Trim( msk_cd_destino.Text ) <> '' then
             oSheet.Cells[ 08, 06 ].value := edt_nm_destino.Text;
             if Trim( msk_cd_modal.Text ) <> '' then
             oSheet.Cells[ 09, 06 ].value := edt_nm_modal.Text;

             oSheet.Cells[ 01, 04 ].Font.Bold := True;
             oSheet.Cells[ 02, 04 ].Font.Bold := True;
             oSheet.Cells[ 03, 04 ].Font.Bold := True;
             oSheet.Cells[ 04, 04 ].Font.Bold := True;
             oSheet.Cells[ 05, 04 ].Font.Bold := True;
             oSheet.Cells[ 06, 04 ].Font.Bold := True;
             oSheet.Cells[ 07, 04 ].Font.Bold := True;
             oSheet.Cells[ 08, 04 ].Font.Bold := True;
             oSheet.Cells[ 09, 04 ].Font.Bold := True;

              ano := copy( datetostr(msk_dt_inicio.Date) , 7, 4 );
              nLinha := 12;
              lin := 1;
              while strtoint( ano ) <= strtoint( copy(DateToStr(msk_dt_fim.Date), 7, 4) ) do
              begin
                jan := 0; fev := 0; mar := 0;
                abr := 0; mai := 0; jun := 0;
                jul := 0; ago := 0; sete :=0;
                outu:= 0; nov := 0; dez := 0;
                qry_rel_qt_processos_.First;
                while not datm_sel_relat.qry_rel_qt_processos_.EOF do
                begin
                    if ano = copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 7, 4 ) then
                    begin
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '01' then jan := jan + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '02' then fev := fev + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '03' then mar := mar + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '04' then abr := abr + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '05' then mai := mai + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '06' then jun := jun + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '07' then jul := jul + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '08' then ago := ago + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '09' then sete := sete + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '10' then outu := outu + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '11' then nov := nov + 1;
                      if copy( qry_rel_qt_processos_DT_ABERTURA.AsString, 4, 2 ) = '12' then dez := dez + 1;
                    end;
                    qry_rel_qt_processos_.next;
                end;
              matriz[lin,1]  := jan;
              matriz[lin,2]  := fev;
              matriz[lin,3]  := mar;
              matriz[lin,4]  := abr;
              matriz[lin,5]  := mai;
              matriz[lin,6]  := jun;
              matriz[lin,7]  := jul;
              matriz[lin,8]  := ago;
              matriz[lin,9]  := sete;
              matriz[lin,10] := outu;
              matriz[lin,11] := nov;
              matriz[lin,12] := dez;
              ano := inttostr(strtoint(ano) + 1);
              nLinha := nLinha + 1;
              lin := lin + 1;
              end;
               aux := nLinha;
               nLinha := 12;
               lin := 1;
               ano1 := strtoint(copy(datetostr(msk_dt_inicio.Date),7 ,4));
               // Alimenta a planilha
               while nLinha < aux do
               begin
               oSheet.Cells[ nLinha, 1 ].value  := ano1;
               oSheet.Cells[ nLinha, 2 ].value  := inttostr(matriz[lin,1]);
               oSheet.Cells[ nLinha, 3 ].value  := inttostr(matriz[lin,2]);
               oSheet.Cells[ nLinha, 4 ].value  := inttostr(matriz[lin,3]);
               oSheet.Cells[ nLinha, 5 ].value  := inttostr(matriz[lin,4]);
               oSheet.Cells[ nLinha, 6 ].value  := inttostr(matriz[lin,5]);
               oSheet.Cells[ nLinha, 7 ].value  := inttostr(matriz[lin,6]);
               oSheet.Cells[ nLinha, 8 ].value  := inttostr(matriz[lin,7]);
               oSheet.Cells[ nLinha, 9 ].value  := inttostr(matriz[lin,8]);
               oSheet.Cells[ nLinha, 10 ].value := inttostr(matriz[lin,9]);
               oSheet.Cells[ nLinha, 11 ].value := inttostr(matriz[lin,10]);
               oSheet.Cells[ nLinha, 12 ].value := inttostr(matriz[lin,11]);
               oSheet.Cells[ nLinha, 13 ].value := inttostr(matriz[lin,12]);
               nLinha := nLinha +1;
               lin := lin +1;
               ano1 := ano1 + 1;
               end;
               qry_rel_qt_processos_.close;
               Screen.Cursor := crDefault;

               // Envia msg de sucesso
               ShowMessage('Planilha gerada com sucesso');

               Excel.Visible := True;

               Screen.Cursor := crDefault;
               Application.ProcessMessages;

               // Limpa a tabela auxiliar
               ApagaDados( 'TREL_QT_PROCESSOS', nr_identificador );

          end;
        except
           on E: Exception do
           begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
        end;
      end;
    end;

    // * * * * * * * * * * * * * * * * * * * *  Acompanhamento de Processos ( Oxiteno )
    if tp_rel = 6 then
    begin
      with datm_sel_relat do
      begin
        try
          Screen.Cursor := crHourGlass;

          CloseStoredProc( sp_rel_acomp_proc );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_acomp_proc.ParamByName('@cd_unid_neg').AsString := 'X'
          else
            sp_rel_acomp_proc.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
          if Trim( msk_cd_produto.Text ) = '' then
            sp_rel_acomp_proc.ParamByName('@cd_produto').AsString  := 'X'
          else
            sp_rel_acomp_proc.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_rel_acomp_proc.ParamByName('@cd_grupo').AsString    := 'X'
          else
            sp_rel_acomp_proc.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_rel_acomp_proc.ParamByName('@cd_cliente').AsString  := 'X'
          else
            sp_rel_acomp_proc.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
          sp_rel_acomp_proc.ParamByName('@usuario').AsString       := str_cd_usuario;
          sp_rel_acomp_proc.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
          sp_rel_acomp_proc.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

          ExecStoredProc( sp_rel_acomp_proc );
          nr_identificador_acomp := sp_rel_acomp_proc.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_acomp_proc );

          qry_rel_acomp_proc_.Close;
          qry_rel_acomp_proc_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador_acomp;
          qry_rel_acomp_proc_.Prepare;
          qry_rel_acomp_proc_.Open;

          if qry_rel_acomp_proc_.EOF then
          begin
            BoxMensagem('Não há dados para exibir', 2)
          end
          else
          begin
            try
              Excel := CreateOLEObject('Excel.Application');

              xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\ACOMP_PROCESSOS.XLS' );

              Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\ACOMP_PROCESSOS_' +
              Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

              oSheet := Excel.WorkBooks[1].Worksheets[1];
            except
              begin
                BoxMensagem('Erro na criação da Planilha.', 2) ;
                Exit;
              end
            end;

              // Filtros da planilha
              oSheet.Cells[ 02, 05 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
              oSheet.Cells[ 02, 05 ].Font.Bold := True;

              if Trim( msk_cd_grupo.Text ) <> '' then
                oSheet.Cells[ 03, 05 ].value := 'Grupo : ' + edt_nm_grupo.text
              else oSheet.Cells[ 03, 05 ].value := 'Cliente : ' + edt_nm_cliente.text;
              oSheet.Cells[ 03, 05 ].Font.Bold := True;
              oSheet.Cells[ 04, 05 ].value := 'Período : ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + '  ( Chegada do Navio )';
              oSheet.Cells[ 04, 05 ].Font.Bold := True;
              oSheet.Cells[ 05, 05 ].value := 'Follow-Up Geral' ;

              nLinha := 8;

              vUltProcesso := 'x';

              // Alimenta a planilha
              while not datm_sel_relat.qry_rel_acomp_proc_.EOF do
              begin
                begin

                  vMudouProcesso := (vUltProcesso <> datm_sel_relat.qry_rel_acomp_proc_.FieldByName('NR_PROCESSO_INDAIA').AsString);

                  vUltProcesso := datm_sel_relat.qry_rel_acomp_proc_.FieldByName('NR_PROCESSO_INDAIA').AsString;

                  // Formata campo ncm
                  if length( qry_rel_acomp_proc_CD_NCM.AsString ) > 1 then
                    ncm := COPY( qry_rel_acomp_proc_CD_NCM.AsString, 1, 4 ) + '.' + COPY( qry_rel_acomp_proc_CD_NCM.AsString, 5, 2 ) + '.' + COPY( qry_rel_acomp_proc_CD_NCM.AsString, 7, 2 );
                  // Formata campo nr_di
                  if length( qry_rel_acomp_proc_NR_DI.AsString ) > 1 then
                    nr_di := COPY( qry_rel_acomp_proc_NR_DI.AsString, 1, 2 ) + '/' + COPY( qry_rel_acomp_proc_NR_DI.AsString, 3, 7 ) + '-' + COPY( qry_rel_acomp_proc_NR_DI.AsString, 10, 1 ) ;

                  nLinha := nLinha + 1;
                  if Copy(qry_rel_acomp_proc_NR_PROC_PO.AsString,1,6) = '$NINT$' then begin
                    oSheet.Cells[ nLinha, 1 ].value := Copy(qry_rel_acomp_proc_NR_PROC_PO.AsString,7,7);
                    vNrPo := Copy(qry_rel_acomp_proc_NR_PROC_PO.AsString,7,7);
                  end else begin
                    oSheet.Cells[ nLinha, 1 ].value := qry_rel_acomp_proc_NR_PROC_PO.AsString;
                    vNrPo := qry_rel_acomp_proc_NR_PROC_PO.AsString;
                  end;

                  oSheet.Cells[ nLinha, 2 ].Value := qry_rel_acomp_proc_NR_PROCESSO_INDAIA.AsString;

                  if Copy(vNrPo,1,1) = 'A' then
                    vCodFilial := Copy(vNrPo,3,1)
                  else vCodFilial := Copy(vNrPo,2,1);

                  if UpperCase(vCodFilial) = 'P' then
                    oSheet.Cells[ nLinha, 3 ].value := '440002'
                  else if UpperCase(vCodFilial) = 'T' then
                    oSheet.Cells[ nLinha, 3 ].value := '440012'
                  else if UpperCase(vCodFilial) = 'Q' then
                    oSheet.Cells[ nLinha, 3 ].value := '440011'
                  else if UpperCase(vCodFilial) = 'E' then
                    oSheet.Cells[ nLinha, 3 ].value := '440001'
                  else oSheet.Cells[ nLinha, 3 ].value := '';

                  oSheet.Cells[ nLinha, 4 ].value  := qry_rel_acomp_proc_TP_MERC.AsString;
                  oSheet.Cells[ nLinha, 5 ].value  := qry_rel_acomp_proc_AP_MERCADORIA.AsString;
                  oSheet.Cells[ nLinha, 6 ].value  := ncm;
                  oSheet.Cells[ nLinha, 7 ].value  := qry_rel_acomp_proc_QT_RECEBIDA.AsFloat;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 8 ].value  := qry_rel_acomp_proc_TP_EMBALAGEM.AsString
                  else oSheet.Cells[ nLinha, 8 ].value  := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 9 ].value := qry_rel_acomp_proc_NR_CNTR.AsString
                  else oSheet.Cells[ nLinha, 9 ].value := '" ';
                  oSheet.Cells[ nLinha, 10 ].value := qry_rel_acomp_proc_TP_VIA_TRANSP.AsString;
                  oSheet.Cells[ nLinha, 11 ].value := qry_rel_acomp_proc_CD_INCOTERM.AsString;
                  oSheet.Cells[ nLinha, 12 ].value := qry_rel_acomp_proc_AP_FABRICANTE.AsString;
                  oSheet.Cells[ nLinha, 13 ].value := qry_rel_acomp_proc_NM_PAIS.AsString;
                  oSheet.Cells[ nLinha, 14 ].value := qry_rel_acomp_proc_AP_FORNECEDOR.AsString;
                  oSheet.Cells[ nLinha, 15 ].value := qry_rel_acomp_proc_NR_FATURA.AsString;
                  oSheet.Cells[ nLinha, 16 ].value := qry_rel_acomp_proc_SIGLA_MOEDA_FOB_TOTAL.AsString;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 17 ].value := qry_rel_acomp_proc_VL_FOB_MNEG.AsFloat
                  else oSheet.Cells[ nLinha, 17 ].value := '" ';
                  oSheet.Cells[ nLinha, 18 ].value := qry_rel_acomp_proc_SIGLA_MOEDA_FOB_UNIT.AsString;
                  oSheet.Cells[ nLinha, 19 ].value := qry_rel_acomp_proc_VL_UNITARIO_FOB_MNEG.AsFloat;
                  oSheet.Cells[ nLinha, 20 ].value := qry_rel_acomp_proc_SIGLA_MOEDA_FRETE_TOTAL.AsString;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 21 ].value := qry_rel_acomp_proc_VL_FRETE_MNEG.AsFloat
                  else oSheet.Cells[ nLinha, 21 ].value := '" ';
                  oSheet.Cells[ nLinha, 22 ].value := qry_rel_acomp_proc_SIGLA_MOEDA_FRETE_UNIT.AsString;
                  oSheet.Cells[ nLinha, 23 ].value := qry_rel_acomp_proc_VL_UNITARIO_FRETE_MNEG.AsFloat;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 24 ].value := qry_rel_acomp_proc_VL_SEGURO_MNEG.AsFloat
                  else oSheet.Cells[ nLinha, 24 ].value := '" ';
                  oSheet.Cells[ nLinha, 25 ].value := qry_rel_acomp_proc_TP_DRAWBACK.AsString;
                  oSheet.Cells[ nLinha, 26 ].value := qry_rel_acomp_proc_AP_PORTO_AERO_ORIGEM.AsString;
                  oSheet.Cells[ nLinha, 27 ].value := qry_rel_acomp_proc_AP_PAIS_PROCEDENCIA.AsString;
                  oSheet.Cells[ nLinha, 28 ].value := qry_rel_acomp_proc_AP_PORTO_AERO_DESTINO.AsString;
                  oSheet.Cells[ nLinha, 29 ].value := qry_rel_acomp_proc_AP_NAVIO.AsString;
                  oSheet.Cells[ nLinha, 30 ].value := ' ' + qry_rel_acomp_proc_DT_EMBARQUE.AsString;
                  oSheet.Cells[ nLinha, 31 ].value := ' ' + qry_rel_acomp_proc_DT_CHEGADA.AsString;
                  oSheet.Cells[ nLinha, 32 ].value := ' ' + qry_rel_acomp_proc_DT_DESEMBARACO.AsString;
                  oSheet.Cells[ nLinha, 33 ].value := qry_rel_acomp_proc_TX_OBSERVACOES.AsString;
                  oSheet.Cells[ nLinha, 34 ].value := qry_rel_acomp_proc_NM_DIAS.AsString;
                  oSheet.Cells[ nLinha, 35 ].value := qry_rel_acomp_proc_NM_CANAL.AsString;
                  oSheet.Cells[ nLinha, 36 ].value := qry_rel_acomp_proc_PR_PAGAMENTO.AsString;
                  oSheet.Cells[ nLinha, 37 ].value := nr_di;
                  oSheet.Cells[ nLinha, 38 ].value := ' ' + Copy(qry_rel_acomp_proc_DT_DI.AsString,1,2)+'/'+Copy(qry_rel_acomp_proc_DT_DI.AsString,3,2)+'/'+Copy(qry_rel_acomp_proc_DT_DI.AsString,5,4);

                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 39 ].value := qry_rel_acomp_proc_VL_ADIANTAMENTO_1.AsFloat
                  else oSheet.Cells[ nLinha, 39 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 40 ].value := ' ' + qry_rel_acomp_proc_DT_ADIANTAMENTO_1.AsString
                  else oSheet.Cells[ nLinha, 40 ].value := '" ';

                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 41 ].value := qry_rel_acomp_proc_VL_RECEBIDO_INT_1.AsFloat
                  else oSheet.Cells[ nLinha, 41 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 42 ].value := ' ' + qry_rel_acomp_proc_DT_EMISSAO_INT_1.AsString
                  else oSheet.Cells[ nLinha, 42 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 43 ].value := qry_rel_acomp_proc_VL_RECEBIDO_INT_2.AsFloat
                  else oSheet.Cells[ nLinha, 43 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 44 ].value := ' ' + qry_rel_acomp_proc_DT_EMISSAO_INT_2.AsString
                  else oSheet.Cells[ nLinha, 44 ].value := '" ';

                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 45 ].value := qry_rel_acomp_proc_VL_ADIANTAMENTO_2.AsFloat
                  else oSheet.Cells[ nLinha, 45 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 46 ].value := ' ' + qry_rel_acomp_proc_DT_ADIANTAMENTO_2.AsString
                  else oSheet.Cells[ nLinha, 46 ].value := '" ';

                  oSheet.Cells[ nLinha, 47 ].value := qry_rel_acomp_proc_VL_ACERTO.AsFloat;
                  oSheet.Cells[ nLinha, 48 ].value := ' ' + qry_rel_acomp_proc_DT_ACERTO.AsString;
                  oSheet.Cells[ nLinha, 49 ].value := qry_rel_acomp_proc_VL_HONORARIO.AsFloat;
                  oSheet.Cells[ nLinha, 50 ].value := ' '; // qry_rel_acomp_proc_NR_NOTA_HONORARIO.AsString;
                  oSheet.Cells[ nLinha, 51 ].value := ' '; // ' ' + qry_rel_acomp_proc_DT_PAGAMENTO.AsString;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 52 ].value := qry_rel_acomp_proc_VL_SDA.AsFloat
                  else oSheet.Cells[ nLinha, 52 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 53 ].value := qry_rel_acomp_proc_VL_DESPACHANTES.AsFloat
                  else oSheet.Cells[ nLinha, 53 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 54 ].value := qry_rel_acomp_proc_VL_CPMF.AsFloat
                  else oSheet.Cells[ nLinha, 54 ].value := '" ';
                  oSheet.Cells[ nLinha, 55 ].value := qry_rel_acomp_proc_VL_TAXA_DI.AsFloat;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 56 ].value := qry_rel_acomp_proc_VL_ICMS.AsFloat
                  else oSheet.Cells[ nLinha, 56 ].value := '" ';
                  oSheet.Cells[ nLinha, 57 ].value := ' '; // qry_rel_acomp_proc_NM_BANCO.AsString;
                  oSheet.Cells[ nLinha, 58 ].value := ' ' + qry_rel_acomp_proc_DT_PAGTO_BCO.AsString;
                  oSheet.Cells[ nLinha, 59 ].value := qry_rel_acomp_proc_PC_IPI.AsFloat;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 60 ].value := qry_rel_acomp_proc_VL_IPI.AsFloat
                  else oSheet.Cells[ nLinha, 60 ].value := '" ';
                  oSheet.Cells[ nLinha, 61 ].value := qry_rel_acomp_proc_PC_II.AsFloat;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 62 ].value := qry_rel_acomp_proc_VL_II.AsFloat
                  else oSheet.Cells[ nLinha, 62 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 63 ].value := qry_rel_acomp_proc_VL_AFRMM.AsFloat
                  else oSheet.Cells[ nLinha, 63 ].value := '" ';
                  oSheet.Cells[ nLinha, 64 ].value := qry_rel_acomp_proc_VL_TX_SICOMEX.AsFloat;
                  oSheet.Cells[ nLinha, 65 ].value := qry_rel_acomp_proc_VL_FUNDAF.AsFloat;
                  oSheet.Cells[ nLinha, 66 ].value := qry_rel_acomp_proc_VL_MULTAS.AsFloat;
                  oSheet.Cells[ nLinha, 67 ].value := qry_rel_acomp_proc_NM_MOTIVO.AsString;
                  oSheet.Cells[ nLinha, 68 ].value := qry_rel_acomp_proc_NM_LAUDO_TEC.AsString;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 69 ].value := qry_rel_acomp_proc_VL_CAPATAZIA.AsFloat
                  else oSheet.Cells[ nLinha, 69 ].value := '" ';

                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 70 ].value := qry_rel_acomp_proc_VL_MOVIMENTACAO.AsFloat
                  else oSheet.Cells[ nLinha, 70 ].value := '" ';
                  oSheet.Cells[ nLinha, 71 ].value := qry_rel_acomp_proc_VL_DESP_AERO.AsFloat;
                  oSheet.Cells[ nLinha, 72 ].value := qry_rel_acomp_proc_NM_TERMINAL.AsString;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 73 ].value := qry_rel_acomp_proc_VL_TX_LIB_BL.AsFloat
                  else oSheet.Cells[ nLinha, 73 ].value := '" ';
                  oSheet.Cells[ nLinha, 74 ].value := qry_rel_acomp_proc_NM_FUMIGACAO.AsString;
                  oSheet.Cells[ nLinha, 75 ].value := qry_rel_acomp_proc_VL_FUMIGACAO.AsFloat;
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 76 ].value := qry_rel_acomp_proc_VL_DEMURRAGE.AsFloat
                  else oSheet.Cells[ nLinha, 76 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 77 ].value := ' ' + qry_rel_acomp_proc_DT_PAGTO_DEM.AsString
                  else oSheet.Cells[ nLinha, 77 ].value := '" ';
                  if vMudouProcesso then
                    oSheet.Cells[ nLinha, 78 ].value := qry_rel_acomp_proc_VL_ARMAZENAGEM.AsFloat
                  else oSheet.Cells[ nLinha, 78 ].value := '" ';
                  oSheet.Cells[ nLinha, 79 ].value := qry_rel_acomp_proc_VL_PIS.AsFloat;
                  oSheet.Cells[ nLinha, 80 ].value := qry_rel_acomp_proc_VL_COFINS.AsFloat;
                  oSheet.Rows[nLinha].RowHeight    := 12.75;
                  ncm := '';
                  nr_di := '';
                end;
                qry_rel_acomp_proc_.next;
              end;
               qry_rel_acomp_proc_.close;
               Screen.Cursor := crDefault;

              (* colunas := '105103097095094093089088087084083082079';
              While i > length( colunas ) do
              begin
                nCol := StrToInt( Copy( colunas, i, 3 ) );
                oSheet.Columns[ nCol ].Delete;
                i := i + 3;
              end; *)

              (*
              // Exclui colunas - a pedido de cliente
              oSheet.Columns[ 105 ].Delete;       // coluna Taxa Liberação BL/AWB (US$)
              oSheet.Columns[ 103 ].Delete;       // coluna Frete Taxa Agência
              oSheet.Columns[ 97 ].Delete;        // coluna Desp.Aeroporto (collect fee/delivery fee) US$
              oSheet.Columns[ 96 ].Delete;        // coluna Desp.Aeroporto (collect fee/delivery fee) R$
              oSheet.Columns[ 95 ].Delete;        // coluna Desconsolidação (R$)
              oSheet.Columns[ 94 ].Delete;        // coluna Dragagem (R$)
              oSheet.Columns[ 92 ].Delete;        // coluna Movimentação (R$)
              oSheet.Columns[ 89 ].Delete;        // coluna Receita Federal (Diversos) (R$)
              oSheet.Columns[ 88 ].Delete;        // coluna Laudo Ministério (R$)
              oSheet.Columns[ 87 ].Delete;        // coluna Ministério
              oSheet.Columns[ 84 ].Delete;        // coluna Valor Lancha (R$)
              oSheet.Columns[ 83 ].Delete;        // coluna Lancha (Empresa)
              oSheet.Columns[ 82 ].Delete;        // coluna Taxi (Engenheiro) R$
              oSheet.Columns[ 79 ].Delete;        // coluna Fundaf (R$)
              *)

               //Limpa a tabela auxiliar
               ApagaDados( 'TREL_ACOMP_PROC', nr_identificador_acomp );
               Excel.Visible := True;

               // Envia msg de sucesso
               ShowMessage('Planilha gerada com sucesso');

               Screen.Cursor := crDefault;
               Application.ProcessMessages;
          end;
        except
           on E: Exception do
           begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
        end;
      end;
    end;

    // * * * * * * * * * * * * * * * * * * * *  Controle de Embarque
    if tp_rel = 7 then
    begin
      with datm_sel_relat do
      begin
        try
          Screen.Cursor := crHourGlass;

          datm_main.db_broker.StartTransaction;
          CloseStoredProc( sp_rel_controle_emb );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_controle_emb.ParamByName('@cd_unid_neg').AsString := 'X'
          else
            sp_rel_controle_emb.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
          if Trim( msk_cd_produto.Text ) = '' then
            sp_rel_controle_emb.ParamByName('@cd_produto').AsString  := 'X'
          else
            sp_rel_controle_emb.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_rel_controle_emb.ParamByName('@cd_grupo').AsString    := 'X'
          else
            sp_rel_controle_emb.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_rel_controle_emb.ParamByName('@cd_cliente').AsString  := 'X'
          else
            sp_rel_controle_emb.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
          sp_rel_controle_emb.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
          sp_rel_controle_emb.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

          ExecStoredProc( sp_rel_controle_emb );
          nr_identificador_acomp := sp_rel_controle_emb.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_controle_emb );
          datm_main.db_broker.Commit;

          qry_controle_emb_.Close;
          qry_controle_emb_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador_acomp;
          qry_controle_emb_.Prepare;
          qry_controle_emb_.Open;

          if qry_controle_emb_.EOF then
          begin
            BoxMensagem('Não há dados para exibir', 2)
          end
          else
          begin
            try
              Excel := CreateOLEObject('Excel.Application');

              xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\CONTROLE_EMB.XLS' );

              Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\CONTROLE_EMB_' +
              Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

              oSheet := Excel.WorkBooks[1].Worksheets[1];
            except
              begin
                BoxMensagem('Erro na criação da Planilha.', 2) ;
                Exit;
              end
            end;

            // Filtros da planilha
             oSheet.Cells[ 02, 05 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
             oSheet.Cells[ 02, 05 ].Font.Bold := True;

             if Trim( msk_cd_grupo.Text ) <> '' then
             oSheet.Cells[ 03, 05 ].value := 'Grupo : ' + edt_nm_grupo.text else
             oSheet.Cells[ 03, 05 ].value := 'Cliente : ' + edt_nm_cliente.text;
             oSheet.Cells[ 05, 05 ].value := 'Acompanhamento de Processos' ;
             oSheet.Cells[ 03, 05 ].Font.Bold := True;
             oSheet.Cells[ 04, 05 ].Font.Bold := True;

              nLinha := 8;

              // Alimenta a planilha
              while not datm_sel_relat.qry_controle_emb_.EOF do
              begin
                begin
                  nLinha := nLinha + 1;
                  oSheet.Cells[ nLinha, 1 ].value := qry_controle_emb_NR_PROCESSO.AsString;
                  oSheet.Cells[ nLinha, 2 ].value := qry_controle_emb_NR_PO.AsString;
                  oSheet.Cells[ nLinha, 3 ].value := qry_controle_emb_NM_AGENTE.AsString;
                  oSheet.Cells[ nLinha, 4 ].value := qry_controle_emb_NM_EXPORTADOR.AsString;
                  oSheet.Cells[ nLinha, 5 ].value := qry_controle_emb_TX_MERCADORIA.AsString;
                  oSheet.Cells[ nLinha, 6 ].value := qry_controle_emb_IMO.AsString;
                  oSheet.Cells[ nLinha, 7 ].value := qry_controle_emb_QT_PESO.AsString;
                  oSheet.Cells[ nLinha, 9 ].value := qry_controle_emb_NM_MODALIDADE.AsString;
                  oSheet.Cells[ nLinha, 10 ].value := qry_controle_emb_NR_CNTR.AsString;
                  oSheet.Cells[ nLinha, 11 ].value := qry_controle_emb_QT_EMBALAGEM.AsString;
                  oSheet.Cells[ nLinha, 12 ].value := qry_controle_emb_NM_NAVIO.AsString;
                  oSheet.Cells[ nLinha, 13 ].value := qry_controle_emb_DT_ETD.AsString;
                  oSheet.Cells[ nLinha, 14 ].value := qry_controle_emb_NM_ETD.AsString;
                  oSheet.Cells[ nLinha, 15 ].value := qry_controle_emb_DT_ETA.AsString;
                  oSheet.Cells[ nLinha, 16 ].value := qry_controle_emb_NM_ETA.AsString;
                  oSheet.Cells[ nLinha, 17 ].value := qry_controle_emb_NR_MASTER.AsString;
                  oSheet.Cells[ nLinha, 18 ].value := qry_controle_emb_NR_HOUSE.AsString;
                  oSheet.Cells[ nLinha, 19 ].value := qry_controle_emb_VL_FRETE.AsString;
                  oSheet.Cells[ nLinha, 20 ].value := qry_controle_emb_DT_ENV_DOC.AsString;
                  oSheet.Cells[ nLinha, 21 ].value := qry_controle_emb_TX_OBSERVACAO.AsString;
                  oSheet.Cells[ nLinha, 105 ].value := '  ';
                  oSheet.Rows[nLinha].RowHeight   := 12.75;
                  ncm := '';
                  nr_di := '';
                end;
                qry_controle_emb_.next;
              end;
               qry_controle_emb_.close;
               Screen.Cursor := crDefault;

               // Limpa a tabela auxiliar
               ApagaDados( 'TREL_CONTROLE_EMB', nr_identificador_acomp );
               Excel.Visible := True;

               // Envia msg de sucesso
               ShowMessage('Planilha gerada com sucesso');

               Screen.Cursor := crDefault;
               Application.ProcessMessages;
          end;
        except
           on E: Exception do
           begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
        end;
      end;
    end;

  // * * * * * * * * * * * * * * * * * * * *  Relatório de Valores de Retenção
  if tp_rel = 8 then
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem('Digite uma Unidade de Negociação... !', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if msk_dt_inicio.Date > msk_dt_fim.Date then
    begin
      BoxMensagem('Data inicial deve ser menor que a Final... !', 1 );
      msk_dt_inicio.SetFocus;
      Exit;
    end;

    with datm_sel_relat do
    begin
      try
        datm_main.db_broker.StartTransaction;
        sp_rel_vl_retencao.Close;
        sp_rel_vl_retencao.UnPrepare;
        sp_rel_vl_retencao.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
        if Trim( msk_cd_produto.Text ) = ''  then
          sp_rel_vl_retencao.ParamByName('@cd_produto').AsString   := 'X'
        else
          sp_rel_vl_retencao.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;
        if Trim( msk_cd_grupo.Text ) = '' then
          sp_rel_vl_retencao.ParamByName('@cd_grupo').AsString   := 'X'
        else
          sp_rel_vl_retencao.ParamByName('@cd_grupo').AsString   := msk_cd_grupo.Text;
        if Trim( msk_cd_cliente.Text ) = '' then
          sp_rel_vl_retencao.ParamByName('@cd_cliente').AsString := 'X'
        else
          sp_rel_vl_retencao.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
        sp_rel_vl_retencao.ParamByName('@dt_inicio').AsDateTime  := msk_dt_inicio.Date;
        sp_rel_vl_retencao.ParamByName('@dt_final').AsDateTime   := msk_dt_fim.Date;
        sp_rel_vl_retencao.Prepare;
        sp_rel_vl_retencao.ExecProc;
        Nr_Identificador := sp_rel_vl_retencao.ParamByName('@nr_identificador').AsInteger;
        sp_rel_vl_retencao.Close;

        qry_rel_valor_retencao_.Close;
        qry_rel_valor_retencao_.ParamByName('NR_IDENTIFICADOR').AsInteger := Nr_Identificador;
        qry_rel_valor_retencao_.Prepare;
        qry_rel_valor_retencao_.Open;

        if qry_rel_valor_retencao_.RecordCount = 0 then
        begin
          BoxMensagem('Não há dados para o filtro especifícado!', 2);
          msk_cd_unid_neg.SetFocus;
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          Exit;
        end
        else
        begin
          ppRelUnidProd.Template.FileName         := cDir_RPT + '\RBRET001.RTM';
          ppRelUnidProd.Template.LoadFromFile;
          ppRelUnidProd.AllowPrintToFile          := True;
          ppRelUnidProd.PrinterSetup.DocumentName := Caption;
          ppRelUnidProd.DeviceType := 'Screen';
          datm_main.db_broker.Commit;
          ppRelUnidProd.Print;
        end;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_rel_valor_retencao_.Close;
      ApagaDados('TREL_VL_RETENCAO', Nr_Identificador );
    end;
  end;

  // * * * * * * * * * * * * * * * * * * * *  Relatório DuPont
  if tp_rel = 9 then
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem('Digite uma Unidade de Negociação... !', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if Trim( msk_cd_produto.Text ) = '' then
    begin
      BoxMensagem('Digite um Produto !', 2);
      msk_cd_produto.SetFocus;
      Exit;
    end;

    with datm_sel_relat do
    begin
      try
        datm_main.db_broker.StartTransaction;

        if msk_cd_produto.Text = '01' then
        begin
          qry_rel_dupont_.Close;
          qry_rel_dupont_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          if Trim( msk_cd_produto.Text ) <> '' then
            qry_rel_dupont_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text
          else
            qry_rel_dupont_.ParamByName('CD_PRODUTO').AsString := 'X';
          if Trim( msk_cd_grupo.Text ) <> '' then
            qry_rel_dupont_.ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text
          else
            qry_rel_dupont_.ParamByName('CD_GRUPO').AsString := 'X';
          if Trim( msk_cd_cliente.Text ) <> '' then
            qry_rel_dupont_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text
          else
            qry_rel_dupont_.ParamByName('CD_CLIENTE').AsString := 'X';
          qry_rel_dupont_.ParamByName('DT_INICIAL').AsDate := msk_dt_inicio.Date;
          qry_rel_dupont_.ParamByName('DT_FINAL').AsDate := msk_dt_fim.Date;
          qry_rel_dupont_.Prepare;
          qry_rel_dupont_.Open;

          if qry_rel_dupont_.EOF then
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            BoxMensagem('Não há dados para exibir', 2);
            Exit;
          end;
        end
        else
        begin
          qry_rel_dupont_exp_.Close;
          qry_rel_dupont_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          if Trim( msk_cd_produto.Text ) <> '' then
            qry_rel_dupont_exp_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text
          else
            qry_rel_dupont_exp_.ParamByName('CD_PRODUTO').AsString := 'X';
          if Trim( msk_cd_grupo.Text ) <> '' then
            qry_rel_dupont_exp_.ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text
          else
            qry_rel_dupont_exp_.ParamByName('CD_GRUPO').AsString := 'X';
          if Trim( msk_cd_cliente.Text ) <> '' then
            qry_rel_dupont_exp_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text
          else
            qry_rel_dupont_exp_.ParamByName('CD_CLIENTE').AsString := 'X';
          qry_rel_dupont_exp_.ParamByName('DT_INICIAL').AsDate := msk_dt_inicio.Date;
          qry_rel_dupont_exp_.ParamByName('DT_FINAL').AsDate := msk_dt_fim.Date;
          qry_rel_dupont_exp_.Prepare;
          qry_rel_dupont_exp_.Open;

          if qry_rel_dupont_exp_.EOF then
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            BoxMensagem('Não há dados para exibir', 2);
            Exit;
          end;
        end;

        try
          Excel := CreateOLEObject('Excel.Application');

          xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\COMISSAO.XLS' );

          Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\COMISSAO_' +
            Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

          oSheet := Excel.WorkBooks[1].Worksheets[1];
        except
          begin
            BoxMensagem('Erro na criação da Planilha.', 2) ;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            Exit;
          end;
        end;

          // Filtros da planilha
          oSheet.Cells[ 03, 07 ].value := 'Período :' + DateToStr(msk_dt_inicio.Date) + ' à ' + DateToStr(msk_dt_fim.Date);
          oSheet.Cells[ 03, 07 ].Font.Bold := True;

          if msk_cd_produto.Text = '02' then
            oSheet.Cells[ 10, 07 ].value := 'Local Retirada';

          nLinha := 12;
          totcomissao := 0;

          // Alimenta a planilha
          if msk_cd_produto.Text = '01' then
          begin
            while not datm_sel_relat.qry_rel_dupont_.EOF do
            begin
              oSheet.Cells[ nLinha, 1 ].value := qry_rel_dupont_DT_FATURA.AsDateTime;
              oSheet.Cells[ nLinha, 2 ].value := qry_rel_dupont_NR_NOTA_FATURA.AsString;
              oSheet.Cells[ nLinha, 3 ].value := qry_rel_dupont_NR_PROCESSO.AsString;
              oSheet.Cells[ nLinha, 4 ].value := qry_rel_dupont_REF_EASY.AsString;
              oSheet.Cells[ nLinha, 5 ].value := qry_rel_dupont_REF_SAP.AsString;
              oSheet.Cells[ nLinha, 6 ].value := qry_rel_dupont_VL_NUM_TAXA.AsFloat;
              oSheet.Cells[ nLinha, 7 ].value := qry_rel_dupont_LOCAL_ENTREGA.AsString;
              oSheet.Cells[ nLinha, 8 ].value := qry_rel_dupont_FUMIGACAO.AsString;
              oSheet.Rows[nLinha].RowHeight   := 12.75;
              totcomissao := totcomissao + qry_rel_dupont_VL_NUM_TAXA.AsFloat;
              nLinha := nLinha + 1;
              qry_rel_dupont_.Next;
            end;
          end
          else
          begin
            while not datm_sel_relat.qry_rel_dupont_exp_.EOF do
            begin
              oSheet.Cells[ nLinha, 1 ].value := qry_rel_dupont_exp_DT_FATURA.AsDateTime;
              oSheet.Cells[ nLinha, 2 ].value := qry_rel_dupont_exp_NR_NOTA_FATURA.AsString;
              oSheet.Cells[ nLinha, 3 ].value := qry_rel_dupont_exp_NR_PROCESSO.AsString;
              oSheet.Cells[ nLinha, 4 ].value := qry_rel_dupont_exp_REF_EASY.AsString;
              oSheet.Cells[ nLinha, 5 ].value := qry_rel_dupont_exp_REF_SAP.AsString;
              oSheet.Cells[ nLinha, 6 ].value := qry_rel_dupont_exp_VL_NUM_TAXA.AsFloat;
              oSheet.Cells[ nLinha, 7 ].value := qry_rel_dupont_exp_LOCAL_ENTREGA.AsString;
              oSheet.Cells[ nLinha, 8 ].value := qry_rel_dupont_exp_FUMIGACAO.AsString;
              oSheet.Rows[nLinha].RowHeight   := 12.75;
              totcomissao := totcomissao + qry_rel_dupont_exp_VL_NUM_TAXA.AsFloat;
              nLinha := nLinha + 1;
              qry_rel_dupont_exp_.Next;
            end;
          end;
          // Total da comissão
          oSheet.Cells[ nLinha, 1 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 1 ].value := 'Total';
          oSheet.Cells[ nLinha, 6 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 6 ].value := totcomissao;

          qry_rel_dupont_.Close;
          Screen.Cursor := crDefault;

          Excel.Visible := True;
          datm_main.db_broker.Rollback;

          // Envia msg de sucesso
          ShowMessage('Planilha gerada com sucesso');

          Screen.Cursor := crDefault;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

  end;

  // * * * * * * * * * * * * * * * * * * * *  SDA - Despachantes/Mês
  if tp_rel = 11 then
  begin
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( '  SELECT D.CD_DESPACHANTE, SUBSTRING( D.NM_DESPACHANTE, 1, 23 ), DATEPART( MM, vw.DT_PAGTO ) AS MES,                                         ');
      SQL.Add( '         CONVERT( DECIMAL(16, 2), SUM( ( ISNULL( S.VL_SDA, 0 ) + ISNULL( S.VL_CONTR_ASSIST, 0 ) + ISNULL( VL_COMPL, 0 ) ) ) ) AS VALOR_MES,  ');
      SQL.Add( '         CONVERT( DECIMAL(16, 2), SUM( ISNULL( S.VL_CONTR_ASSIST, 0 ) ) ) AS VALOR_CONT,                                                     ');
      SQL.Add( '         CONVERT( DECIMAL(16, 2), SUM( ISNULL( S.VL_SDA, 0 ) ) )          AS VALOR_HON                                                       ');
      SQL.Add( '    FROM TPROCESSO_SDA S (NOLOCK), TPROCESSO P (NOLOCK), TDESPACHANTE D (NOLOCK), vw_DT_PAGTO_SDA vw                                         ');
      SQL.Add( '   WHERE S.NR_PROCESSO      = P.NR_PROCESSO                                                                                                  ');
      SQL.Add( '     AND S.CD_DESPACHANTE   = D.CD_DESPACHANTE                                                                                               ');
      SQL.Add( '     AND vw.NR_PROCESSO     = p.NR_PROCESSO                                                                                                  ');
      SQL.Add( '     AND ( P.CD_UNID_NEG    = :CD_UNID_NEG    OR :CD_UNID_NEG = "" )                                                                         ');
      SQL.Add( '     AND ( P.CD_PRODUTO     = :CD_PRODUTO     OR :CD_PRODUTO = "" )                                                                          ');
      SQL.Add( '     AND ( D.CD_DESPACHANTE = :CD_DESPACHANTE OR :CD_DESPACHANTE = "" )                                                                      ');
      SQL.Add( '     AND P.IN_CANCELADO     = "0"                                                                                                            ');
      SQL.Add( '     AND P.IN_LIBERADO      = "1"                                                                                                            ');
      SQL.Add( '     AND S.DT_CANCEL IS NULL                                                                                                                 ');
      SQL.Add( '     AND vw.DT_PAGTO BETWEEN :DT_INICIAL AND DATEADD(DAY, 1, :DT_FINAL )                                                                     ');
      SQL.Add( '  GROUP BY D.CD_DESPACHANTE, D.NM_DESPACHANTE, DATEPART( MM, vw.DT_PAGTO )                                                                   ');
      SQL.Add( '  ORDER BY D.NM_DESPACHANTE, DATEPART( MM, vw.DT_PAGTO )                                                                                     ');
      ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
      ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
      ParamByName('CD_DESPACHANTE').AsString := msk_cd_desp.Text;
      ParamByName('DT_INICIAL').AsDateTime   := msk_dt_inicio.Date;
      ParamByName('DT_FINAL').AsDateTime     := msk_dt_fim.Date;
      Open;

      if RecordCount <> 0 then
      begin
        Screen.Cursor := crHourGlass;
        with crp_sel_relat do
        begin
          Connect := 'DSN=BROKER; UID=SA; PWD=123; DSQ=BROKER';

          // Lista valores
          linha := '';  cabec := '0';
          desp := '';   esp := '                       ';
          linhac := '    DESPACHANTE         ';
          while not EOF  do
          begin
            if desp <> Fields[1].AsString then
            begin
              if desp <> '' then
              begin
                if cabec = '0' then
                begin
                  with Tquery.Create(Application) do
                  begin
                    DataBaseName := 'DBBROKER';
                    SQL.Clear;
                    SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
                    SQL.Add('VALUES (809,' + QuotedStr('C') + ', :NM_LINHA)');
                    ParamByName('NM_LINHA').AsString        := linhac;
                    ExecSQL;
                    Free;


                    cabec := '1';
                  end;
                end;
                with Tquery.Create(Application) do
                begin
                  DataBaseName := 'DBBROKER';
                  SQL.Clear;
                  SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
                  SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
                  ParamByName('NM_LINHA').AsString        := linha;
                  ExecSQL;
                  Free;
                end;
                desp := Fields[1].AsString
              end
              else
              begin
                desp := Fields[1].AsString;
                ReportName  := cDir_Rpt + '\CRSDA002.RPT';
                ReportTitle := 'Período:  ' + DateToStr( msk_dt_inicio.Date ) + '  à  ' + DateToStr( msk_dt_fim.Date ) + #13 +
                               'Emitido por:  ' + ConsultaLookUP('TUSUARIO','CD_USUARIO',str_cd_usuario,'AP_USUARIO');
              end;
              linha := JustificaString( Fields[1].AsString, 24 );
            end;

            if cabec = '0' then
            begin
              case StrToInt( Fields[2].AsString ) of
                1: linhac := linhac + '     Janeiro';
                2: linhac := linhac + '   Fevereiro';
                3: linhac := linhac + '       Março';
                4: linhac := linhac + '       Abril';
                5: linhac := linhac + '        Maio';
                6: linhac := linhac + '       Junho';
                7: linhac := linhac + '       Julho';
                8: linhac := linhac + '      Agosto';
                9: linhac := linhac + '    Setembro';
                10: linhac := linhac + '     Outubro';
                11: linhac := linhac + '    Novembro';
                12: linhac := linhac + '    Dezembro';
              end;
            end;

            vMes := VporPDecimal( FloatToStr( Fields[3].AsFloat ) );
            linha := linha + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;

            case StrToInt( Fields[2].AsString ) of
              1: begin
                   aTotal[1] := aTotal[1] + Fields[3].AsFloat;
                   aTotalCont[1] := aTotalCont[1] + Fields[4].AsFloat;
                   aTotalHon[1] := aTotalHon[1] + Fields[5].AsFloat;
                 end;
              2: begin
                   aTotal[2] := aTotal[2] + Fields[3].AsFloat;
                   aTotalCont[2] := aTotalCont[2] + Fields[4].AsFloat;
                   aTotalHon[2] := aTotalHon[2] + Fields[5].AsFloat;
                 end;
              3: begin
                   aTotal[3] := aTotal[3] + Fields[3].AsFloat;
                   aTotalCont[3] := aTotalCont[3] + Fields[4].AsFloat;
                   aTotalHon[3] := aTotalHon[3] + Fields[5].AsFloat;
                 end;
              4: begin
                   aTotal[4] := aTotal[4] + Fields[3].AsFloat;
                   aTotalCont[4] := aTotalCont[4] + Fields[4].AsFloat;
                   aTotalHon[4] := aTotalHon[4] + Fields[5].AsFloat;
                 end;
              5: begin
                   aTotal[5] := aTotal[5] + Fields[3].AsFloat;
                   aTotalCont[5] := aTotalCont[5] + Fields[4].AsFloat;
                   aTotalHon[5] := aTotalHon[5] + Fields[5].AsFloat;
                 end;
              6: begin
                   aTotal[6] := aTotal[6] + Fields[3].AsFloat;
                   aTotalCont[6] := aTotalCont[6] + Fields[4].AsFloat;
                   aTotalHon[6] := aTotalHon[6] + Fields[5].AsFloat;
                 end;
              7: begin
                   aTotal[7] := aTotal[7] + Fields[3].AsFloat;
                   aTotalCont[7] := aTotalCont[7] + Fields[4].AsFloat;
                   aTotalHon[7] := aTotalHon[7] + Fields[5].AsFloat;
                 end;
              8: begin
                   aTotal[8] := aTotal[8] + Fields[3].AsFloat;
                   aTotalCont[8] := aTotalCont[8] + Fields[4].AsFloat;
                   aTotalHon[8] := aTotalHon[8] + Fields[5].AsFloat;
                 end;
              9: begin
                   aTotal[9] := aTotal[9] + Fields[3].AsFloat;
                   aTotalCont[9] := aTotalCont[9] + Fields[4].AsFloat;
                   aTotalHon[9] := aTotalHon[9] + Fields[5].AsFloat;
                 end;
              10: begin
                    aTotal[10] := aTotal[10] + Fields[3].AsFloat;
                    aTotalCont[10] := aTotalCont[10] + Fields[4].AsFloat;
                    aTotalHon[10] := aTotalHon[10] + Fields[5].AsFloat;
                  end;
              11: begin
                    aTotal[11] := aTotal[11] + Fields[3].AsFloat;
                    aTotalCont[11] := aTotalCont[11] + Fields[4].AsFloat;
                    aTotalHon[11] := aTotalHon[11] + Fields[5].AsFloat;
                  end;
              12: begin
                    aTotal[12] := aTotal[12] + Fields[3].AsFloat;
                    aTotalCont[12] := aTotalCont[12] + Fields[4].AsFloat;
                    aTotalHon[12] := aTotalHon[12] + Fields[5].AsFloat;
                  end;
            end;
            vMes := '';

            Next;
          end;
          if cabec = '0' then
          begin
            with Tquery.Create(Application) do
            begin
              DataBaseName := 'DBBROKER';
              SQL.Clear;
              SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
              SQL.Add('VALUES (809, ' + QuotedStr('C') + ', :NM_LINHA)');
              ParamByName('NM_LINHA').AsString        := linhac;
              ExecSQL;
              Free;
              cabec := '1';
            end;
          end;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;
          // Linha em Branco
          linha := esp;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;

          // Total Mensal
          linha := ' TOTAL MENSAL           ';
          dTotRel := 0;
          for lin := 1 to 12 do
          begin
            if aTotal[lin] <> 0 then
            begin
              dTotRel := dTotRel + aTotal[lin];
              vMes := VporPDecimal( FloatToStr( aTotal[lin] ) );
              linha := linha + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
            end;
          end;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;

          // Total IRRF 27,5%
          linha := ' IRRF 27,5%             ';
          dTotRelIR := 0;
          aliq := 27.5;
          for lin := 1 to 12 do
          begin
            if aTotal[lin] <> 0 then
            begin
              tVlIR := FloatToStr( ( ( aliq *  aTotal[lin] ) / 100 ) );
              VlIR := StrToFloat( Decimais(tVlIR) );
              dTotRelIR := dTotRelIR + VlIR;
              vMes := VporPDecimal( FloatToStr( VlIR ) );
              linha := linha + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
            end;
          end;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;

          // Total Contribuição
          linha := ' TOTAL CONTRIBUIÇÃO     ';
          dTotRelCont := 0;
          for lin := 1 to 12 do
          begin
            if aTotalCont[lin] <> 0 then
            begin
              dTotRelCont := dTotRelCont + aTotalCont[lin];
              vMes := VporPDecimal( FloatToStr( aTotalCont[lin] ) );
              linha := linha + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
            end;
          end;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;

          // Total Honorário
          linha := ' TOTAL HONORÁRIO        ';
          dTotRelHon := 0;
          for lin := 1 to 12 do
          begin
            if aTotalHon[lin] <> 0 then
            begin
              dTotRelHon := dTotRelHon + aTotalHon[lin];
              vMes := VporPDecimal( FloatToStr( aTotalHon[lin] ) );
              linha := linha + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
            end;
          end;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;

          // Linha em Branco
          linha := ' ';
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('D') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;

          // Total Relatório
          linha := '  Total do Relatório    ';
          vMes := VporPDecimal( FloatToStr( dTotRel ) );
          linha := linha  + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('R') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;
          // Total IRRF
          linha := '  Total do IRRF         ';
          vMes := VporPDecimal( FloatToStr( dTotRelIR ) );
          linha := linha  + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('R') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;
          // Total Contribuição
          linha := '  Total da Contribuição ';
          vMes := VporPDecimal( FloatToStr( dTotRelCont ) );
          linha := linha  + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('R') + ', :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;
          // Total Honorário
          linha := '  Total do Honorário    ';
          vMes := VporPDecimal( FloatToStr( dTotRelHon ) );
          linha := linha  + Copy( esp, 1, 12 - length( vMes  ) ) + vMes;
          with Tquery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TREL_ARMAZ_REM (NR_IDENTIFICADOR, NR_PROCESSO, NM_EMBALAGEM)');
            SQL.Add('VALUES (809, ' + QuotedStr('R') + ',  :NM_LINHA)');
            ParamByName('NM_LINHA').AsString        := linha;
            ExecSQL;
            Free;
          end;

          Execute;
          ApagaDados( 'TREL_ARMAZ_REM', 809 );
        end;
        Screen.Cursor := crDefault;
      end
      else
        BoxMensagem('Não há dados para exibir', 2);

    end;
  end;

  Screen.Cursor := crDefault;
end;


procedure Tfrm_sel_relat.msk_cd_destinoExit(Sender: TObject);
begin
  if Trim( msk_cd_destino.text ) = '' then
  begin
    edt_nm_destino.Text := 'Todos';
  end
  else
  begin
    ValCodEdt( msk_cd_destino );
    if msk_cd_destino.Text <> '' then
    begin
      with datm_sel_relat do
      begin
        qry_destino_.Close;
        qry_destino_.ParamByName('CODIGO').AsString := msk_cd_destino.Text;
        qry_destino_.Prepare;
        qry_destino_.Open;
        if qry_destino_.RecordCount > 0 then
        begin
          edt_nm_destino.Text := qry_destino_DESCRICAO.AsString;
        end
        else
        begin
          BoxMensagem('País não cadastrado!', 2);
          msk_cd_destino.SetFocus;
        end
      end;
    end
    else
    begin
      edt_nm_destino.Text := '';
    end;
  end;
end;


procedure Tfrm_sel_relat.msk_cd_modalExit(Sender: TObject);
begin
  if Trim( msk_cd_modal.text ) = '' then
  begin
    edt_nm_modal.Text := 'Todos';
  end
  else
  begin
    ValCodEdt( msk_cd_modal );
    if msk_cd_modal.Text <> '' then
    begin
      with datm_sel_relat do
      begin
        qry_modal_.Close;
        qry_modal_.ParamByName('CD_VIA_TRANSPORTE').AsString := msk_cd_modal.Text;
        qry_modal_.Prepare;
        qry_modal_.Open;
        if qry_modal_.RecordCount > 0 then
        begin
          edt_nm_modal.Text := qry_modal_DESCRICAO.AsString;
        end
        else
        begin
          BoxMensagem('País não cadastrado!', 2);
          msk_cd_modal.SetFocus;
        end
      end;
    end
    else
    begin
      edt_nm_modal.Text := '';
    end;
  end;
end;


procedure Tfrm_sel_relat.msk_cd_analistaExit(Sender: TObject);
begin
   if Trim(msk_cd_analista.Text) = '' then
    begin
      edt_nm_analista.Text := 'Todos';
      Exit;
    end;
   if tp_rel = 5 then
   begin
     edt_nm_analista.Text := ConsultaLookUP('TUSUARIO ', 'CD_USUARIO', msk_cd_analista.Text, 'NM_USUARIO');
     if edt_nm_analista.Text = '' then
     begin
       BoxMensagem('Analista não cadastrado!', 2);
       edt_nm_analista.Text := '';
       msk_cd_analista.SetFocus;
     end;
   end
   else
   begin
     ValCodEdt( msk_cd_analista );
     if msk_cd_analista.Text <> '' then
     begin
       with datm_sel_relat do
       begin
         qry_analista_cliente_.Close;
         qry_analista_cliente_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
         qry_analista_cliente_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
         qry_analista_cliente_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
         qry_analista_cliente_.ParamByName('CD_CONTATO').AsString := msk_cd_analista.Text;
         qry_analista_cliente_.Prepare;
         qry_analista_cliente_.Open;
         if qry_analista_cliente_.RecordCount > 0 then
         begin
           edt_nm_analista.Text := qry_analista_cliente_NM_CONTATO.AsString;
         end
         else
         begin
           BoxMensagem('Analista não cadastrado!', 2);
           edt_nm_analista.Text := '';
           msk_cd_analista.SetFocus;
         end
       end;
     end
     else
     begin
       edt_nm_analista.Text := '';
     end;
   end;
end;


procedure Tfrm_sel_relat.btn_co_destinoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_pais, frm_pais );

  with frm_pais do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_destino.Text := frm_pais.Cons_OnLine_Texto;
  msk_cd_destinoExit(nil);
end;


procedure Tfrm_sel_relat.btn_co_analistaClick(Sender: TObject);
begin
  if tp_rel = 5 then
  begin
    msk_cd_analista.Text := ConsultaOnLineExFiltro('TUSUARIO', 'Analista Comissária',
       ['CD_USUARIO', 'NM_USUARIO'], ['Código', 'Nome'], 'CD_USUARIO', 'IN_ATIVO = ''1''', nil, msk_cd_analista.Text, 1);
    msk_cd_analistaExit(nil);
  end
  else
  begin
    Application.CreateForm( Tfrm_cliente_contato, frm_cliente_contato );
    with frm_cliente_contato do
    begin
      str_cliente        := msk_cd_cliente.Text;
      str_unid           := msk_cd_unid_neg.text;
      str_produto        := msk_cd_produto.Text;
      lCons_OnLine       := True;
      Caption            := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
      if frm_cliente_contato.Cons_OnLine_Texto <> '' then
      begin
        msk_cd_analista.Text := frm_cliente_contato.Cons_OnLine_Texto;
        msk_cd_analistaExit(nil);
      end;
    end;
  end;
end;


procedure Tfrm_sel_relat.btn_co_modalClick(Sender: TObject);
begin
  Consulta_On_line( 'TVIA_TRANSPORTE', datm_sel_relat.qry_modal_CD_VIA_TRANSPORTE, 'Via de Transporte', 56 );

  msk_cd_modalExit(nil);
  msk_cd_modal.SetFocus;
end;


procedure Tfrm_sel_relat.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine        := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_modal.text := Cons_Online_Texto;
  end;
end;


procedure Tfrm_sel_relat.msk_cd_despExit(Sender: TObject);
begin
  if msk_cd_desp.Text = '' then
  begin
    edt_nm_desp.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_desp );

  if msk_cd_desp.Text <> '' then
  begin
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( 'SELECT SUBSTRING( NM_DESPACHANTE, 1, 23 ) AS DESPACHANTES ' );
      SQL.Add( 'FROM TDESPACHANTE (NOLOCK) ' );
      SQL.Add( 'WHERE CD_DESPACHANTE = :CD_DESPACHANTE ' );
      ParamByName('CD_DESPACHANTE').AsString := msk_cd_desp.Text;
      Open;

      if RecordCount <> 0 then
      begin
        edt_nm_desp.Text := Fields[0].AsString;
      end
      else
      begin
        BoxMensagem('Despachante não cadastrado!', 2);
        edt_nm_desp.Text := '';
        msk_cd_desp.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_desp.Text := '';
  end;
end;


function Tfrm_sel_relat.VporPDecimal(Valor:String):String;
var decimal : string;
begin
  // Coloca as casas decimais na string
  if Pos( ',', Valor ) <= 0 then
    decimal := Valor + ',00'
  else
  begin
    if length(Valor) - ( Pos( ',', Valor ) ) = 1 then
      decimal := Valor + '0'
    else
      decimal := Valor;
  end;

  // Coloca o ponto de milhar na string
  if length(decimal) > 6 then
    VporPDecimal := Copy( decimal, 1, length(decimal) - 6 ) + '.' + Copy ( decimal,( length(decimal) - 5 )  , 6 )
  else
    VporPDecimal := decimal;
end;


function Tfrm_sel_relat.Decimais(Valor:String):String;
begin
  if Pos( ',', Valor ) > 0 then
    Decimais := Copy( Valor, 1, Pos( ',', Valor ) - 1 ) + ',' + Copy ( Valor, Pos( ',', Valor ) + 1  ,2 )
  else
    Decimais := Valor;  
end;


procedure Tfrm_sel_relat.btn_co_despClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
   msk_cd_desp.Text := ConsultaOnlineEx('TDESPACHANTE', 'Despachante',
                                         ['CD_DESPACHANTE', 'NM_DESPACHANTE'],
                                         ['Código',         'Nome'],
                                         'CD_DESPACHANTE', nil, 1,
                                         msk_cd_desp.Text);
  end else
    edt_nm_desp.Text := ConsultaLookUp('TDESPACHANTE', 'CD_DESPACHANTE', msk_cd_desp.Text, 'NM_DESPACHANTE');

  msk_cd_despExit(nil);
end;

procedure Tfrm_sel_relat.btn_representanteClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add(' SELECT CD_EMPRESA, AP_EMPRESA FROM TEMPRESA_NAC WHERE IN_REPRESENTANTE = 1 ');
  msk_representante.Text := ConsultaOnLineExSQLList(vListAux,'Representantes',['CD_EMPRESA',  'AP_EMPRESA'],['Código', 'Empresa'],'CD_EMPRESA',nil, msk_representante.Text);
  msk_representanteExit(msk_representante);
  vListAux.Free;
end;

procedure Tfrm_sel_relat.msk_representanteExit(Sender: TObject);
begin
  if msk_representante.Text <> '' then
  begin
    msk_representante.Text := StrZero(StrToInt(msk_representante.Text),5);
    edt_representante.Text := ConsultaLookUpSQL('SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE IN_REPRESENTANTE = 1 AND CD_EMPRESA = ''' +msk_representante.Text+'''','NM_EMPRESA');
  end;
end;

end.
