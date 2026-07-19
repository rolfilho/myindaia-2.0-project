unit ParametrosDoSistema;

interface

type
  RParametrosDoSistema = record
    ModoTeste: Boolean;
    CaminhoCertificados: String;
    CaminhoLog: String;
    CaminhoDisImportadas: String;
  end;

var
  Parametros: RParametrosDoSistema;

implementation

end.
