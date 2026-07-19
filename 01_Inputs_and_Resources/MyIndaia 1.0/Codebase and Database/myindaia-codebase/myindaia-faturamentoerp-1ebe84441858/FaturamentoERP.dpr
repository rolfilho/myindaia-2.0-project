program FaturamentoERP;

uses
  Forms,
  ClassesERP in 'ClassesERP.pas' {frmFaturamentoERP},
  DadosFaturamentoERP in 'DadosFaturamentoERP.pas' {dtmFaturamentoERP},
  GeraNotaFiscal in 'GeraNotaFiscal.pas' {frmGeraNotaFiscal},
  Sapiens_NotaFiscal in 'Sapiens_NotaFiscal.pas',
  Funcoes in 'Funcoes.pas',
  DadosEnvioERP in 'DadosEnvioERP.pas' {dtmEnvioERP},
  Global in 'Global.pas',
  DebugDataset in 'DebugDataset.pas' {frmDebugDataSet},
  ImpressaoDocumentos in 'ImpressaoDocumentos.pas' {frmImpressaoDocumentos},
  DocumentosFaturamento in 'DocumentosFaturamento.pas' {dtmDocumentosFaturamento: TDataModule},
  DDENFSEIntf in 'DDENFSEIntf.pas',
  Integracao in 'Integracao.pas' {dtmIntegracao: TDataModule},
  InterfacesERP in 'InterfacesERP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFaturamentoERP, frmFaturamentoERP);
  Application.CreateForm(TdtmFaturamentoERP, dtmFaturamentoERP);
  Application.CreateForm(TdtmEnvioERP, dtmEnvioERP);
  Application.CreateForm(TfrmDebugDataSet, frmDebugDataSet);
  Application.CreateForm(TdtmIntegracao, dtmIntegracao);
  Application.CreateForm(TdtmIntegracao, dtmIntegracao);
  Application.Run;
end.
