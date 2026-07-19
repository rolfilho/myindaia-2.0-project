unit PGDI011;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, DB, PGGP001, Buttons, PGDI004, Funcoes;

type
  Tfrm_DI_NVE = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dbedt_cd_especif_ncm: TDBEdit;
    btn_salvar: TButton;
    btn_cancelar: TButton;
    Label1: TLabel;
    dbedt_cd_atributo_ncm: TDBEdit;
    dbedt_desc_atributo: TDBEdit;
    dbedt_desc_especif: TDBEdit;
    btn_co_atributo_nve: TSpeedButton;
    btn_co_espec_nve: TSpeedButton;
    dbedt_cd_nivel: TDBEdit;
    dbedt_nm_nivel: TDBEdit;
    btn_co_nivel: TSpeedButton;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cd_especif_ncmChange(Sender: TObject);
    procedure btn_co_atributo_nveClick(Sender: TObject);
    procedure btn_co_espec_nveClick(Sender: TObject);
    procedure dbedt_cd_atributo_ncmExit(Sender: TObject);
    procedure dbedt_cd_especif_ncmExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_atributo_ncmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_nivelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Code : integer;
    str_filtro : String;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
    procedure monta_filtro;
  end;

var
  frm_DI_NVE: Tfrm_DI_NVE;

implementation

uses GSMLIB, PGSM096, PGDI019, PGSM148;

{$R *.DFM}


procedure Tfrm_DI_NVE.monta_filtro;
begin
  if Not datm_DI_Adicao.qry_nve_CD_NIVEL_NVE.IsNull then
  begin
    if Not datm_DI_Adicao.qry_nve_CD_NIVEL_NVE.IsNull then
    begin
      datm_DI_Adicao.qry_abrangencia_nve_.Close;
      datm_DI_Adicao.qry_abrangencia_nve_.ParamByName('DESCRICAO').AsString := Trim( datm_DI_Adicao.qry_nve_CD_NIVEL_NVE.AsString );
      datm_DI_Adicao.qry_abrangencia_nve_.Prepare;
      datm_DI_Adicao.qry_abrangencia_nve_.Open;
      if datm_DI_Adicao.qry_abrangencia_nve_.RecordCount > 0 then
      begin
        case StrToInt( datm_DI_Adicao.qry_abrangencia_nve_CODIGO.AsString ) of
          2: str_filtro := Copy( datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 4);
          3: str_filtro := datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString;
          4: str_filtro := Copy( datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 5);
          5: str_filtro := Copy( datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 6);
          6: str_filtro := Copy( datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 7);
        else str_filtro := datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString;
        end;
      end;
    end;
  end
end;

procedure Tfrm_DI_NVE.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);
  frm_consulta_padrao.nCodigo            := nCodigo;
  datm_consulta_padrao.Tabela.TableName  := cNomeTabela;
  monta_filtro;
  if nCodigo = 4 then
  begin
    datm_consulta_padrao.Tabela.Filter   := 'CD_NOMENC_NCM = '#39+str_filtro+#39+
                                            ' AND '+
                                            'CD_NIVEL_NCM = '#39+datm_DI_Adicao.qry_abrangencia_nve_CODIGO.AsString+#39;
    datm_consulta_padrao.Tabela.Filtered := True;
  end;
  if nCodigo = 5 then
  begin
    datm_consulta_padrao.Tabela.Filter   := 'CD_NOMENC_NCM = '#39+str_filtro+#39+
                                            ' AND '+
                                            'CD_ATRIBUTO_NCM = '#39+datm_DI_Adicao.qry_nve_CD_ATRIBUTO_NCM.AsString+#39+
                                            ' AND '+
                                            'CD_NIVEL_NCM = '#39+datm_DI_Adicao.qry_abrangencia_nve_CODIGO.AsString+#39;
    datm_consulta_padrao.Tabela.Filtered := True;
  end;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine        := fCampo;
  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_NVE.btn_cancelarClick(Sender: TObject);
begin
  datm_DI_Adicao.qry_nve_.Cancel;
  Close;
end;

procedure Tfrm_DI_NVE.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  datm_DI_Adicao.qry_nve_pesq_.Close;
  datm_DI_Adicao.qry_nve_pesq_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_DI_Adicao.qry_nve_pesq_.ParamByName('NR_ADICAO').AsString := datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString;
  datm_DI_Adicao.qry_nve_pesq_.ParamByName('CD_NIVEL_NCM').AsString := dbedt_cd_atributo_ncm.Text;
  datm_DI_Adicao.qry_nve_pesq_.ParamByName('CD_ATRIBUTO_NCM').AsString := dbedt_cd_atributo_ncm.Text;
  datm_DI_Adicao.qry_nve_pesq_.ParamByName('CD_ESPECIF_NCM').AsString := dbedt_cd_especif_ncm.Text;
  datm_DI_Adicao.qry_nve_pesq_.Prepare;
  datm_DI_Adicao.qry_nve_pesq_.Open;

  if datm_DI_Adicao.qry_nve_pesq_.RecordCount > 0 then
  begin
    BoxMensagem( 'N.V.E. já cadastrada!', 2 );
    datm_DI_Adicao.qry_nve_pesq_.Cancel;
  end
  else {Não existe NVE ! Está OK! Pode gravar}
  begin
    datm_DI_Adicao.qry_nve_.Post;
    //frm_DI_adicao.btn_alterar_item_numerario.Enabled := True;
    //frm_DI_adicao.btn_excluir_item_numerario.Enabled := True;
  end;

  Close;
end;

procedure Tfrm_DI_NVE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_DI_NVE.dbedt_cd_especif_ncmChange(Sender: TObject);
begin
  btn_salvar.Enabled   := True;
  btn_salvar.Default   := True;
  btn_cancelar.Enabled := True;
  btn_cancelar.Default := False;
end;

procedure Tfrm_DI_NVE.btn_co_atributo_nveClick(Sender: TObject);
begin
  Consulta_On_line('TATRIB_VALORACAO_NVE',datm_DI_Adicao.qry_nve_CD_ATRIBUTO_NCM,'[ Atributos NVE ]',28);
//  DBEDT_CD
end;

procedure Tfrm_DI_NVE.btn_co_espec_nveClick(Sender: TObject);
begin
  Consulta_On_line( 'TAB_ESPECIF_VALORACAO_NVE', datm_DI_Adicao.qry_nve_CD_ESPECIF_NCM, 'Especificação - N.V.E.', 5 );
  dbedt_cd_especif_ncmExit(Sender);
end;

procedure Tfrm_DI_NVE.dbedt_cd_atributo_ncmExit(Sender: TObject);
begin
  datm_DI_Adicao.qry_atrib_nve_desc_.Close;
  monta_filtro;
  datm_DI_Adicao.qry_atrib_nve_desc_.ParamByName('CD_NCM').AsString      := str_filtro;
  datm_DI_Adicao.qry_atrib_nve_desc_.ParamByName('CD_NIVEL').AsString    := dbedt_cd_nivel.field.AsString;
  datm_DI_Adicao.qry_atrib_nve_desc_.ParamByName('CD_ATRIBUTO').AsString := dbedt_cd_atributo_ncm.field.AsString;
  datm_DI_Adicao.qry_atrib_nve_desc_.Open;
end;

procedure Tfrm_DI_NVE.dbedt_cd_especif_ncmExit(Sender: TObject);
begin
  datm_DI_Adicao.qry_espec_nve_desc_.Close;
  monta_filtro;
  datm_DI_Adicao.qry_espec_nve_desc_.ParamByName('CD_NCM').AsString := str_filtro;
  datm_DI_Adicao.qry_espec_nve_desc_.ParamByName('CD_NIVEL').AsString := dbedt_cd_nivel.field.AsString;
  datm_DI_Adicao.qry_espec_nve_desc_.ParamByName('CD_ATRIBUTO').AsString := dbedt_cd_atributo_ncm.field.AsString;
  datm_DI_Adicao.qry_espec_nve_desc_.ParamByName('CD_ESPECIF').AsString := dbedt_cd_especif_ncm.field.AsString;
  datm_DI_Adicao.qry_espec_nve_desc_.Open;
end;

procedure Tfrm_DI_NVE.FormShow(Sender: TObject);
begin
  dbedt_cd_atributo_ncmExit(Sender);
  dbedt_cd_especif_ncmExit(Sender);
end;

procedure Tfrm_DI_NVE.dbedt_cd_atributo_ncmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_nivel        then btn_co_nivelClick(nil);
    if Sender = dbedt_cd_atributo_ncm then btn_co_atributo_nveClick(nil);
    if Sender = dbedt_cd_especif_ncm  then btn_co_espec_nveClick(nil);
  end;
end;


procedure Tfrm_DI_NVE.btn_co_nivelClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER','TAB_NIVEL',datm_DI_Adicao.qry_nve_CD_NIVEL_NVE,'[ Níveis NVE ]',27,'','TTable');
end;

end.
