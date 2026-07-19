unit ureclassificacaoitens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, StdCtrls;

type
  Tfrm_reclassificacao_itens = class(TForm)
    sp_reclassificacao_itens: TStoredProc;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    vProcesso : String;
    { Public declarations }
  end;

var
  frm_reclassificacao_itens: Tfrm_reclassificacao_itens;

implementation                                                            

{$R *.DFM}

uses PGGP017, GSMLIB, PGGP001;

procedure Tfrm_reclassificacao_itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_reclassificacao_itens.FormActivate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  CloseStoredProc(sp_reclassificacao_itens);
  sp_reclassificacao_itens.ParamByName('@NR_PROCESSO').AsString := vProcesso;
  ExecStoredProc(sp_reclassificacao_itens);
  CloseStoredProc(sp_reclassificacao_itens);
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  CLOSE;
end;

end.

