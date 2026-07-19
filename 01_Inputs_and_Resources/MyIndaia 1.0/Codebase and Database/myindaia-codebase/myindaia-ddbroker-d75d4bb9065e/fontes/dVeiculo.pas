unit dVeiculo;
(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: PGSM246.PAS - datm_veiculo
AUTOR: Paulo do Amaral Costa
DATA: 21/06/2002
MANUTENÇÃO:
DATA: 21/06/2002 - ADBC-0007 - Ecotrans
********************************************************************************)
interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_veiculo = class(TDataModule)
    ds_veiculo: TDataSource;
    qry_ult_veiculo_: TQuery;
    upd_qry_veiculo_: TUpdateSQL;
    qry_ult_veiculo_ULTIMO: TStringField;
    qry_veiculo_: TQuery;
    qry_tpais_broker_: TQuery;
    ds_veiculo_lista: TDataSource;
    qry_armador_: TQuery;
    qry_veiculo_CD_BANDEIRA: TStringField;
    qry_veiculo_look_nm_pais: TStringField;
    qry_porto_: TQuery;
    qry_veiculo_rota_: TQuery;
    ds_porto: TDataSource;
    qry_veiculo_rota_CD_VEICULO: TStringField;
    qry_veiculo_rota_CD_ORIGEM: TStringField;
    qry_veiculo_rota_CD_DESTINO: TStringField;
    upd_qry_veiculo_rota_: TUpdateSQL;
    ds_veiculo_rota: TDataSource;
    qry_veiculo_rota_look_nm_local_origem: TStringField;
    qry_veiculo_rota_look_nm_local_destino: TStringField;
    qry_tpais_broker_CD_PAIS: TStringField;
    qry_tpais_broker_NM_PAIS: TStringField;
    qry_veiculo_rota_CD_VEICULO_ROTA: TStringField;
    qry_ult_veiculo_rota_: TQuery;
    qry_ult_veiculo_rota_ULTIMO: TStringField;
    qry_porto_CD_PORTO: TStringField;
    qry_porto_NM_PORTO: TStringField;
    qry_porto_CD_SIGLA: TStringField;
    qry_veiculo_armador_: TQuery;
    ds_veiculo_armador: TDataSource;
    UpDate_Vei_armador: TUpdateSQL;
    qry_veiculo_armador_CD_VEICULO: TStringField;
    qry_veiculo_armador_CD_ARMADOR: TStringField;
    qry_veiculo_armador_NM_ARMADOR: TStringField;
    qry_armador_CODIGO: TStringField;
    qry_armador_DESCRICAO: TStringField;
    qry_veiculo_CD_EMBARCACAO: TStringField;
    qry_veiculo_NM_EMBARCACAO: TStringField;
    qry_veiculo_IN_RORO: TStringField;
    qry_veiculo_IN_ATIVO: TStringField;
    qry_veiculo_IRIN: TStringField;
    procedure qry_veiculo_AfterDelete(DataSet: TDataSet);
    procedure qry_veiculo_AfterPost(DataSet: TDataSet);
    procedure qry_veiculo_rota_AfterDelete(DataSet: TDataSet);
    procedure qry_veiculo_rota_AfterPost(DataSet: TDataSet);
    procedure qry_veiculo_rota_NewRecord(DataSet: TDataSet);
    procedure qry_veiculo_rota_BeforeDelete(DataSet: TDataSet);
    procedure qry_veiculo_rota_BeforePost(DataSet: TDataSet);
    procedure qry_veiculo_rota_BeforeEdit(DataSet: TDataSet);
    procedure qry_veiculo_rota_BeforeInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_veiculo_armador_AfterPost(DataSet: TDataSet);
    procedure qry_veiculo_armador_AfterDelete(DataSet: TDataSet);
    procedure qry_veiculo_BeforePost(DataSet: TDataSet);
  private
    function ChecaChave(qry: TQuery; ValorChave1,ValorChave2,ValorChave3:string): boolean;
    { Private declarations }
  public
    lmensa_delete: boolean; //-->para controlar a mensagem de deleção no grid details do frm_veiculo
    { Public declarations }
  end;

var
  datm_veiculo: Tdatm_veiculo;
  str_cd_veiculo_rota,str_cd_origem,str_cd_destino,str_cd_origem_ins:string;

implementation
uses GSMLIB;
{$R *.DFM}


procedure Tdatm_veiculo.qry_veiculo_AfterDelete(DataSet: TDataSet);
begin
  qry_veiculo_.ApplyUpdates;
end;

procedure Tdatm_veiculo.qry_veiculo_AfterPost(DataSet: TDataSet);
begin
  qry_veiculo_.ApplyUpdates;
end;

procedure Tdatm_veiculo.qry_veiculo_rota_AfterDelete(DataSet: TDataSet);
begin
  qry_veiculo_rota_.ApplyUpdates;
end;

procedure Tdatm_veiculo.qry_veiculo_rota_AfterPost(DataSet: TDataSet);
begin
  qry_veiculo_rota_.ApplyUpdates;
end;

procedure Tdatm_veiculo.qry_veiculo_rota_NewRecord(DataSet: TDataSet);
begin
  qry_veiculo_rota_CD_VEICULO_ROTA.AsString:=str_cd_veiculo_rota;
  qry_veiculo_rota_CD_VEICULO.AsString:=  qry_veiculo_CD_EMBARCACAO.AsString;
  qry_veiculo_rota_CD_ORIGEM.AsString:=str_cd_origem_ins;
end;

procedure Tdatm_veiculo.qry_veiculo_rota_BeforeDelete(DataSet: TDataSet);
begin
  if lmensa_delete then
    if Application.MessageBox('Deseja realmente excluir esta rota?',
                 'Confirmação de Exclusão', MB_IconQuestion + MB_YesNo +
                 MB_DefButton2) = IdNo then
        SysUtils.Abort;
end;

procedure Tdatm_veiculo.qry_veiculo_rota_BeforePost(DataSet: TDataSet);
begin
  if (qry_veiculo_rota_CD_ORIGEM.Value=qry_veiculo_rota_CD_DESTINO.Value) then
  begin
    if Application.MessageBox('Registro de rota não pode ter locais de Origem e Destino iguais!'+#13
                              +'Deseja cancelar?',
                 'Cancelamento de Edição/Inclusão', MB_IconQuestion + MB_YesNo +
                 MB_DefButton2) = IdNo then
      SysUtils.Abort
    else
    begin
      qry_veiculo_rota_.cancel;
      SysUtils.Abort;
    end;
  end;

  if (qry_veiculo_rota_CD_ORIGEM.Value='') or (qry_veiculo_rota_CD_DESTINO.Value='') then
  begin
    if Application.MessageBox('Registro de rota não poder ser gravado com algum campo nulo!'+#13
                              +'Deseja cancelar?',
                 'Cancelamento de Edição/Inclusão', MB_IconQuestion + MB_YesNo +
                 MB_DefButton2) = IdNo then
      SysUtils.Abort
    else
    begin
      qry_veiculo_rota_.cancel;
      SysUtils.Abort;
    end;
  end;

  if ChecaChave (qry_veiculo_rota_,qry_veiculo_rota_CD_VEICULO.Value, qry_veiculo_rota_CD_ORIGEM.Value,qry_veiculo_rota_CD_DESTINO.Value) then
  begin
    if Application.MessageBox('Registro de rota já existente! Deseja cancelar?',
                 'Cancelamento de Edição/Inclusão', MB_IconQuestion + MB_YesNo +
                 MB_DefButton2) = IdNo then
      SysUtils.Abort
    else
    begin
      qry_veiculo_rota_.cancel;
      SysUtils.Abort;
    end;
  end;
end;

function Tdatm_veiculo.ChecaChave(qry: TQuery; ValorChave1,ValorChave2,
    ValorChave3: string): boolean;
begin
   with TQuery.Create(qry.Owner) do
      begin
         DatabaseName := qry.DatabaseName;
         SQL:= qry.SQL;
         ParamByName('CD_EMBARCACAO').AsString := ValorChave1;
         Open;
         First;
         if Locate('CD_ORIGEM;CD_DESTINO',VarArrayOf([ValorChave2,ValorChave3]),[]) then
           if qry.State in [dsEdit] then
           begin
             if (RecNo = qry.RecNo) and (FieldByName('CD_ORIGEM').Value = str_cd_origem)
                 and (FieldByName('CD_DESTINO').Value = str_cd_destino)
             then
               Result:=False
             else
               Result:=True;
           end
           else
             Result:=True;
         Close;
         Free;
      end;
end;

procedure Tdatm_veiculo.qry_veiculo_rota_BeforeEdit(DataSet: TDataSet);
begin
   str_cd_origem:=qry_veiculo_rota_CD_ORIGEM.Value;
   str_cd_destino:=qry_veiculo_rota_CD_DESTINO.Value;
end;

procedure Tdatm_veiculo.qry_veiculo_rota_BeforeInsert(DataSet: TDataSet);
begin
  str_cd_veiculo_rota:=  UltCod(qry_ult_veiculo_rota_,qry_ult_veiculo_rota_ULTIMO);
  str_cd_origem_ins:=qry_veiculo_rota_CD_DESTINO.Value;
end;

procedure Tdatm_veiculo.DataModuleCreate(Sender: TObject);
begin
  lmensa_delete:=true;
end;

procedure Tdatm_veiculo.qry_veiculo_armador_AfterPost(DataSet: TDataSet);
begin
qry_veiculo_armador_.ApplyUpdates;
end;

procedure Tdatm_veiculo.qry_veiculo_armador_AfterDelete(DataSet: TDataSet);
begin
qry_veiculo_armador_.ApplyUpdates;
end;

procedure Tdatm_veiculo.qry_veiculo_BeforePost(DataSet: TDataSet);
begin
   if qry_veiculo_.State in [dsInsert] then
      qry_veiculo_CD_EMBARCACAO.AsString  := UltCod( qry_ult_veiculo_, qry_ult_veiculo_ULTIMO );
end;

end.

