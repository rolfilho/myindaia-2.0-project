unit PGPO007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls, Menus, Funcoes, ConsOnLineEx;

type
  Tfrm_po_consulta_itens = class(TForm)
    main_cons_itens: TMainMenu;
    mi_sair: TMenuItem;
    pnl_comandos: TPanel;
    btn_sair: TSpeedButton;
    bvl_consulta: TBevel;
    msk_nr_processo: TMaskEdit;
    lbl_nr_processo: TLabel;
    btn_nr_processo: TSpeedButton;
    dbgrd_consulta_itens: TDBGrid;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_nr_processoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_po_consulta_itens: Tfrm_po_consulta_itens;
  NR_PROC_CONSULTA : String[18];

implementation

uses GSMLIB, PGPO008;

{$R *.DFM}

procedure Tfrm_po_consulta_itens.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_po_consulta_itens.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_Po_Consulta_Itens, datm_Po_Consulta_Itens );
end;

procedure Tfrm_po_consulta_itens.msk_nr_processoExit(Sender: TObject);
begin
  with datm_po_consulta_itens do
  begin
    if msk_nr_processo.Text <> '' then
    begin
      qry_po_itens_.Close;
      qry_po_itens_.ParamByName('NR_PROCESSO').AsString := msk_nr_processo.Text;
      qry_po_itens_.Prepare;
      qry_po_itens_.Open;
      if qry_po_itens_.RecordCount = 0 then
      begin
        qry_po_itens_.Close;
        MessageDlg('Não há Itens para este Processo !!', mtError, [mbOk], 0);
        msk_nr_processo.Text := '';
        msk_nr_processo.Setfocus;
        Exit;
      end;
    end
    else
    begin
      // dbgrd_consulta_itens.Enabled := False;
      Exit;
    end;
  end;
  str_nr_processo := msk_nr_processo.Text;
  //dbgrd_consulta_itens.Enabled := True;
end;

procedure Tfrm_po_consulta_itens.FormShow(Sender: TObject);
begin
  //dbgrd_consulta_itens.Enabled := False;
  msk_nr_processo.Text := '';
end;

procedure Tfrm_po_consulta_itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_po_consulta_itens do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_po_itens_.Close;

    Free;
  end;
  Action := caFree
end;

procedure Tfrm_po_consulta_itens.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
    if Sender = msk_nr_processo then btn_nr_processoClick(nil);
end;

procedure Tfrm_po_consulta_itens.mi_sairClick(Sender: TObject);
begin
  btn_fecharClick(nil);
end;

procedure Tfrm_po_consulta_itens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then btn_fecharClick(nil);;
end;

procedure Tfrm_po_consulta_itens.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT P.NR_PROCESSO, P.CD_IMPORTADOR, E.NM_EMPRESA, P.DT_ABERTURA, NR_DA');
  vListAux.Add('FROM TPO P ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC E ( NOLOCK ) ON E.CD_EMPRESA = P.CD_IMPORTADOR');
  vListAux.Add('WHERE ISNULL( NR_DA, '''' ) = '''' ');
  vListAux.Add('ORDER BY P.NR_PROCESSO');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Pedidos de Importação',['NR_PROCESSO','CD_IMPORTADOR','NM_EMPRESA','DT_ABERTURA','NR_DA'],['Processo','Cód.','Importador','Dt. Abertura','Nr. DA'],'NR_PROCESSO',nil);
  vListAux.Free;
  msk_nr_processoExit(nil);
end;

end.
