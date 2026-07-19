unit MyGlobal;

interface

type
  TCdState = (cdBrowser, cdEdit, cdInsert, cdDelete);
  TSetOfChar = set of char;
  TIntegracaoDue = (idEnviar, idRetificarCargaAntecipada, idRetificarNormal);


  TConfig = record
    DraftAmbiente: string;
    DraftEndFtpProducao: string;
    DraftEndFtpHomologacao: string;
    DraftUsuarioFtpProducao: string;
    DraftUsuarioFtpHomologacao: string;
    DraftSenhaFtpProducao: string;
    DraftSenhaFtpHomologacao: string;
  end;

var
  Config: TConfig;
  ConfigOld: TConfig;


const
  {Draft}
  cfgDraftAmbiente = 'DraftAmbiente';
  cfgDraftEndFtpProducao = 'DraftEndFtpProducao';
  cfgDraftEndFtpHomologacao = 'DraftEndFtpHomologacao';
  cfgDraftUsuarioFtpProducao = 'DraftUsuarioFtpProducao';
  cfgDraftUsuarioFtpHomologacao = 'DraftUsuarioFtpHomologacao';
  cfgDraftSenhaFtpProducao = 'DraftSenhaFtpProducao';
  cfgDraftSenhaFtpHomologacao = 'DraftSenhaFtpHomologacao';

implementation

end.
