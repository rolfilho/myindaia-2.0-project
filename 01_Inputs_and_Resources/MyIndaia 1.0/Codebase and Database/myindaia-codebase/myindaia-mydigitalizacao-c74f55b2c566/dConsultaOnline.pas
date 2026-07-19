unit dConsultaOnline;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdtmMyDigConsultaOnline = class(TDataModule)
    qryConsultaOnline: TADOQuery;
    qryConsulta: TADOQuery;
    dsConsultaOnline: TDataSource;
    qryExecuta: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMyDigConsultaOnline: TdtmMyDigConsultaOnline;

implementation

uses
  dDigitalizacao;

{$R *.dfm}

end.
