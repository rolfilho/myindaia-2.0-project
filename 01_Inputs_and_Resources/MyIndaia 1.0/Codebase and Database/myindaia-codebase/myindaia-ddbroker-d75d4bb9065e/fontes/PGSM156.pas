unit PGSM156;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, Menus, SpellChk, DBTables, Mask,
  ServicoNovo;

type
  Tfrm_follow_obs = class(TForm)
    pnl_obs: TPanel;
    btn_sair: TSpeedButton;
    btn_clear: TSpeedButton;
    pnl_dados: TPanel;
    Label1: TLabel;
    DBObs: TDBMemo;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_menu: TMainMenu;
    mi_clear: TMenuItem;
    mi_salvar: TMenuItem;
    mi_sair: TMenuItem;
    mi_cancelar: TMenuItem;
    pnl_procs: TPanel;
    lbl_processo: TLabel;
    lbl_evento: TLabel;
    lbl_barra: TLabel;
    dbchk_importante: TDBCheckBox;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    spell: TSpellCheck;
    Panel1: TPanel;
    lbl_nr_processo: TLabel;
    medt_nr_processo: TMaskEdit;
    btn_processo: TSpeedButton;
    lbl_proc: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_clearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_salvarClick(Sender: TObject);
    procedure DBObsChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbchk_importanteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure medt_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    CodEvento: String;
  public
    { Public declarations }
  end;

var
  frm_follow_obs: Tfrm_follow_obs;
  vAlterouProc : Boolean;
  Vprocesso,codigo: string;

implementation

uses GSMLIB, PGGP017, uFollowUp, PGGA004, Funcoes, ConsOnLineEx;

{$R *.DFM}

procedure VerAlt;
begin
  if frm_followup.qryFollowUp.State in [dsEdit, dsInsert] then
  begin
    if BoxMensagem('O campo de observações foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
       try
          frm_followup.qryFollowUp.Post;
       except
       end;
    end
    else frm_followup.qryFollowUp.Cancel;
  end;
end;

procedure Tfrm_follow_obs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure Tfrm_follow_obs.btn_sairClick(Sender: TObject);
begin
  VerAlt;
  frm_follow_obs.Close;
  if medt_nr_processo.Text <> '' then
  begin
   Vprocesso:=medt_nr_processo.Text;
   frm_followup.medt_nr_processo.Text:= Vprocesso;
   frm_followup.medt_nr_processoExit(nil);
  end
  else
  begin
    if vAlterouProc = True then
    begin
      frm_followup.qryFollowUp.Close;
      frm_followup.qryFollowUp.ParamByName('NR_PROCESSO').AsString :=  '';
      frm_followup.qryFollowUp.Prepare;
      frm_followup.qryFollowUp.Open;
      frm_followup.medt_nr_processo.Text := '';
    end;
  end;
end;

procedure Tfrm_follow_obs.btn_clearClick(Sender: TObject);
begin
(*  if BoxMensagem('Deseja apagar a observação?' + #13#10 , 1) then
  Begin
    if Not ( datm_proc_realiza.qry_tfollowup_.State in [dsInsert, dsEdit] ) then
    begin
      datm_proc_realiza.qry_tfollowup_.Edit;
    end;
    DBObs.Text := '';
  end;
  DBObs.SetFocus;*)
end;

procedure Tfrm_follow_obs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if Key = 27 then
  Begin
     VerAlt;
     Close;
  End;}
end;

procedure Tfrm_follow_obs.btn_salvarClick(Sender: TObject);
var
vTexto: string;
begin
  with frm_followup do
  begin
    if qryfollowup.State in [dsInsert, dsEdit] then
      qryfollowup.Post;

    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('EXEC sp_atz_obs_followup ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + ''', ''' + qryFollowUp.FieldByName('CD_EVENTO').AsString + '''');
      ExecSQL;
      Free;
    end;

//    if qry_processo_aux_.State in [dsInsert, dsEdit] then
//      qry_processo_aux_.Post;

    ActiveControl := nil;
    btn_salvar.Enabled   := False;
    btn_cancelar.Enabled := False;
    mi_salvar.Enabled    := False;
    mi_cancelar.Enabled  := False;
  end;
end;

procedure Tfrm_follow_obs.DBObsChange(Sender: TObject);
begin
  btn_salvar.Enabled   := frm_followup.qryfollowup.State in [dsInsert, dsEdit];
  mi_salvar.Enabled    := frm_followup.qryfollowup.State in [dsInsert, dsEdit];
  btn_cancelar.Enabled := frm_followup.qryfollowup.State in [dsInsert, dsEdit];
  mi_cancelar.Enabled  := frm_followup.qryfollowup.State in [dsInsert, dsEdit];
end;

procedure Tfrm_follow_obs.btn_cancelarClick(Sender: TObject);
begin
  with frm_followup do
  begin
    if qryfollowup.State in [dsInsert, dsEdit] then
      qryfollowup.Cancel;

//    if qry_processo_aux_.State in [dsInsert, dsEdit] then
//      qry_processo_aux_.Cancel;
  end;

  btn_salvar.Enabled   := False;
  btn_cancelar.Enabled := False;
  mi_salvar.Enabled    := False;
  mi_cancelar.Enabled  := False;
end;

procedure Tfrm_follow_obs.dbchk_importanteClick(Sender: TObject);
begin
  with datm_proc_realiza do
  begin
    if qry_processo_aux_.State in [dsEdit] then
    begin
      btn_salvar.Enabled   := True;
      mi_salvar.Enabled    := True;
      btn_cancelar.Enabled := True;
      mi_cancelar.Enabled  := True;
    end;
  end;
end;

procedure Tfrm_follow_obs.SpeedButton1Click(Sender: TObject);
begin
  if vEvento='notes' then
  begin
    Spell.Language := wdEnglishUS;
    SpeedButton2.Enabled:= true;
    PoeEmEdicao(frm_followup.qryFollowUp);
    spell.CheckMemoTextSpelling(DBObs);
  end
  else
  begin
    SpeedButton2.Enabled:= true;
  end;

  if vEvento='obs' then
  begin
    Spell.Language := wdBrazilianPortuguese;
    PoeEmEdicao(frm_followup.qryFollowUp);
    spell.CheckMemoTextSpelling(DBObs);
  end;
end;

procedure Tfrm_follow_obs.btn_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + frm_followup.medt_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + frm_followup.medt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  medt_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
  medt_nr_processoExit(nil);
end;

procedure Tfrm_follow_obs.medt_nr_processoExit(Sender: TObject);
begin
 if medt_nr_processo.Text <> '' then
  begin
    frm_followup.medt_nr_processo.Text:=medt_nr_processo.Text; //by carlos - 16/05/2011
    frm_followup.qryFollowUp.Close;
//    frm_followup.qryFollowUp.ParamByName('NR_PROCESSO').AsString :=   frm_followup.medt_cd_unid_neg.Text +   frm_followup.medt_cd_produto.Text + medt_nr_processo.Text; // by carlos 16/05/2011 (faltou incluir o frm_followup.)
    frm_followup.qryFollowUp.ParamByName('NR_PROCESSO').AsString :=   frm_followup.medt_cd_unid_neg.Text +   frm_followup.medt_cd_produto.Text + frm_followup.medt_nr_processo.Text; // by carlos 16/05/2011
    frm_followup.qryFollowUp.Prepare;
    frm_followup.qryFollowUp.Open;
    lbl_proc.Caption := medt_nr_processo.Text;
    frm_followup.qryFollowUp.Locate('CD_EVENTO', CodEvento, [loCaseInsensitive]);
    vAlterouProc := frm_followup.qryFollowUp.RecordCount > 0;
  end;
end;

procedure Tfrm_follow_obs.FormShow(Sender: TObject);
begin
  vAlterouProc := False;
  CodEvento := frm_followup.qryFollowUp.FieldByName('CD_EVENTO').AsString;
  if vEvento='notes' then
  begin
    Label1.caption:= 'Notes';
    frm_follow_obs.Caption:='Follow-up Notes';
    SpeedButton1.Enabled:= false;
    SpeedButton3.enabled:=true;

  end
  else
  begin
    Label1.caption:= 'Observações';
    frm_follow_obs.Caption:='Follow-up Observações';
    SpeedButton1.Enabled:= true;
     SpeedButton3.enabled:=false;
  end;


end;

procedure Tfrm_follow_obs.SpeedButton3Click(Sender: TObject);
var
  vListAux : TStringList;
  vTexto,vCodigo,vUsuario,vdata:string;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT CD_OBS,TX_DESCRICAO');
  vListAux.Add('FROM TOBSERVACOES (NOLOCK)');
  vListAux.Add('WHERE CD_PRODUTO = ''' + frm_followup.medt_cd_produto.Text + '''');
  vCodigo := ConsultaOnLineExSQLList(vListAux, 'Modelo de Observações', ['CD_OBS', 'TX_DESCRICAO'], ['Codigo', 'Observações'], 'CD_OBS', nil);
  vListAux.Free;

  vUsuario:=ConsultaLookUp('TUSUARIO','AP_USUARIO', frm_followup.qryFollowUpAP_USUARIO.AsString, 'SUBSTRING(nm_usuario,1,charindex('' '',NM_USUARIO,1))');
  vTexto:=ConsultaLookUp('TOBSERVACOES','CD_OBS', vCodigo, 'TX_OBS');

  If vTexto <> '' then
  begin
    frm_followup.qryfollowup.Edit;
    vdata:= (FormatDateTime( 'dd/mm', Date ));
     DBObs.Lines.Add( ' ' );
    DBObs.Lines.Add( vdata + ' - ' + vTexto +' - '+ vUsuario  );
  end;

end;

end.
