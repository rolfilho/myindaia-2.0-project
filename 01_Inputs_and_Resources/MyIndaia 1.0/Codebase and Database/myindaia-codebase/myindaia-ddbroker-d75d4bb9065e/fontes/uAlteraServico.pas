unit uAlteraServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Tabs, Buttons, StdCtrls;

type
  Tfrm_altera_servico = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    TabSet1: TTabSet;
    Notebook1: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    btn_co_servico: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_altera_servico: Tfrm_altera_servico;

implementation

{$R *.dfm}

procedure Tfrm_altera_servico.TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  NoteBook1.PageIndex := NewTab;
end;

end.
