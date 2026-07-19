unit PGSM039;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, DB, DBTables;

type
  Tfrm_observacoes_processo = class(TForm)
    BitBtn1: TBitBtn;
    DBMemo1: TDBMemo;
    BitBtn2: TBitBtn;
    qry_processo: TQuery;
    ds_processo: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Configura(cd_tabela, nr_processo, cd_cliente, cd_servico:string);
    procedure FormActivate(Sender: TObject);
  private
    st_cd_tabela,
    st_nr_processo,
    st_cd_cliente,
    st_cd_servico:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_observacoes_processo: Tfrm_observacoes_processo;

implementation

uses PGGP017, GSMLIB;


{$R *.DFM}


procedure Tfrm_observacoes_processo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_observacoes_processo.BitBtn1Click(Sender: TObject);
begin
  if qry_processo.State in [dsEdit] then qry_processo.Cancel;
  close;
end;

procedure Tfrm_observacoes_processo.BitBtn2Click(Sender: TObject);
begin
  if st_cd_tabela = '' then exit;
  if qry_processo.State in [dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      qry_processo.Post;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        qry_processo.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
  close;
end;

procedure Tfrm_observacoes_processo.Configura(cd_tabela, nr_processo, cd_cliente, cd_servico:string);
begin
  st_cd_tabela   := cd_tabela;
  st_nr_processo := nr_processo;
  st_cd_cliente  := cd_cliente;
  st_cd_servico  := cd_servico;
  with qry_processo do
  begin
    ParamByName('nr_processo').AsString := st_nr_processo;
    ParamByName('cd_cliente').AsString  := st_cd_cliente;
    ParamByName('cd_servico').AsString  := st_cd_servico;
    Prepare;
    Open;
  end;
end;

procedure Tfrm_observacoes_processo.FormActivate(Sender: TObject);
begin
  if st_cd_tabela = '' then
  begin
    BoxMensagem( 'Deve ser utilizado a função "CONFIGURA" antes de chamar este módulo.', 3);
    Close;
  end;
  DBMemo1.SetFocus;
end;

end.
