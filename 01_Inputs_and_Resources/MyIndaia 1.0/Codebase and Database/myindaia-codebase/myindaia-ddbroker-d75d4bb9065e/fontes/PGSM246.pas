(*************************************************************************************************

Sistema: DDBroker - Indaiá Logística

PROGRAMA: PGSM246.PAS - frm_atualiza_basf

AUTOR:

DATA:  24/10/2002

Manutenção:

*************************************************************************************************)
unit PGSM246;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Menus, StdCtrls, ComCtrls, Db, FileText;

type
  Tfrm_atualiza_ncm = class(TForm)
    pnl_file_: TPanel;
    menu_: TMainMenu;
    mi_atualizar_: TMenuItem;
    mi_sair_: TMenuItem;
    pnl_integra: TPanel;
    btn_atualizar: TSpeedButton;
    speed_sair_: TSpeedButton;
    edt_nm_file_: TEdit;
    Speed_file_: TSpeedButton;
    open_file_: TOpenDialog;
    Label1: TLabel;
    Panel1: TPanel;
    progress_file_: TProgressBar;
    procedure Speed_file_Click(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure speed_sair_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mi_sair_Click(Sender: TObject);
    procedure edt_nm_file_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_atualizar_Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    tp_leitura : Byte;
  end;

var
  frm_atualiza_ncm: Tfrm_atualiza_ncm;
  Arquivo  : TFileText;
  cItem    : String[3];
  Linha    : String;
  nr_itens : LongInt;
  POFatura : integer;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM247, PGGP017;


procedure Tfrm_atualiza_ncm.Speed_file_Click(Sender: TObject);
begin
  if open_file_.Execute then edt_nm_file_.Text := open_file_.FileName;
end;

procedure Tfrm_atualiza_ncm.btn_atualizarClick(Sender: TObject);
var
   f, ArqMerc: TextFile;
   nMax, count : Real;

begin
  if Length( edt_nm_file_.Text ) = 0 then
  begin
    edt_nm_file_.SetFocus;
    BoxMensagem( 'O nome do arquivo texto para atualização deverá ser informado.', 2 );
    edt_nm_file_.SetFocus;
    Exit;
  end
  else
  begin
    if Not FileExists( edt_nm_file_.Text ) then
    begin
      BoxMensagem( 'O arquivo "'+ edt_nm_file_.Text +'" não existe ou não está disponível. Tente novamente.', 2 );
      edt_nm_file_.SetFocus;
      Exit;
    end
    else
    begin
      AssignFile( f, edt_nm_file_.text );
      {$i-}
      Reset( f );
      {$i+}
      if ioresult <> 0 then
      begin
         BoxMensagem( 'Ocorreu um erro quando o sistema tentou abrir o arquivo "' + edt_nm_file_.Text +'".', 2 );
         edt_nm_file_.SetFocus;
         Exit;
      end;
    end;
  end;

  Arquivo := TFileText.Create;
  Arquivo.Name := edt_nm_file_.Text;
  Arquivo.Open;

  // Faz cálculo p/ progress_bar pq arquivo tem registros de tamanho fixo ( 27 )
  count := 0;
  nMax := (Arquivo.FSize / 27);
  progress_file_.Max  := Round( nMax ) + 1;
  progress_file_.Step := 1;

  {Leitura do Arquivo}
  AssignFile( ArqMerc, edt_nm_file_.Text );
  Reset(ArqMerc);
  nr_itens := 0;
  try
    datm_main.db_broker.StartTransaction;

    while Not EOF(ArqMerc) do
    begin
      ReadLn(ArqMerc, Linha);
      // Grava Mercadoria que tem NCM
      if length(Linha) > 18 then
      begin
        with datm_atualiza_ncm do
        begin
          qry_atualiza_ncm_.Close;
          qry_atualiza_ncm_.ParamByName('CD_MERCADORIA').AsString := Trim( Copy( Linha, 1, 15 ) );
          qry_atualiza_ncm_.Prepare;
          qry_atualiza_ncm_.Open;

          if Not qry_atualiza_ncm_.EOF then
          begin
            if qry_atualiza_ncm_CD_NCM_SH.AsString <> Trim( Copy( Linha, 17, 11 ) ) then
            begin
              qry_atualiza_ncm_.Edit;
              qry_atualiza_ncm_CD_NCM_SH.AsString := Trim( Copy( Linha, 17, 11 ) );
              qry_atualiza_ncm_.Post;
            end;
          end;
        end;
      end;
      Application.ProcessMessages;
      progress_file_.StepIt;
      count := count + 1;
    end;
    datm_main.db_broker.Commit;

    // Faz loop pq nem sempre o txt vem com todas as linhas com tamanho = 27
    While count <  ( Round( nMax ) + 1 ) do
    begin
      progress_file_.StepIt;
      count := count + 1;
    end;

    BoxMensagem( 'Atualização realizada com sucesso!', 3 );
    edt_nm_file_.text := '';
  except
    on E: Exception do
    begin
      BoxMensagem( 'Erro na leitura de arquivos!', 2);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  Arquivo.Close;
  Arquivo.Free;

  progress_file_.Position := 0;
end;

procedure Tfrm_atualiza_ncm.speed_sair_Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_atualiza_ncm.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_Atualiza_NCM, datm_Atualiza_NCM );
end;

procedure Tfrm_atualiza_ncm.mi_sair_Click(Sender: TObject);
begin
  speed_sair_Click(nil);
end;

procedure Tfrm_atualiza_ncm.edt_nm_file_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
     if Sender = edt_nm_file_ then Speed_file_Click(Nil);
end;

procedure Tfrm_atualiza_ncm.mi_atualizar_Click(Sender: TObject);
begin
  btn_atualizarClick(Nil);
end;

procedure Tfrm_atualiza_ncm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

end.

