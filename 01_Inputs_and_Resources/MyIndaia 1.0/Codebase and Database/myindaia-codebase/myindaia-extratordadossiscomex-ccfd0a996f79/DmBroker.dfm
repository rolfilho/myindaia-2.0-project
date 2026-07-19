object dmdBroker: TdmdBroker
  OldCreateOrder = False
  Height = 513
  Width = 506
  object dbBroker: TFDConnection
    ConnectionName = 'Broker'
    Params.Strings = (
      'Database=ExtratorDocumentos'
      'User_Name=SA'
      'Password=123'
      'Server=antuerpia'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object qryInsertDue: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'Select top 10 * from ExpoDueImportada')
    Left = 220
    Top = 88
    object qryInsertDueNrDue: TStringField
      FieldName = 'NrDue'
      Origin = 'NrDue'
      Size = 14
    end
    object qryInsertDueDataRegistro: TSQLTimeStampField
      FieldName = 'DataRegistro'
      Origin = 'DataRegistro'
    end
    object qryInsertDueDataEmbarque: TSQLTimeStampField
      FieldName = 'DataEmbarque'
      Origin = 'DataEmbarque'
    end
    object qryInsertDueNrRuc: TStringField
      FieldName = 'NrRuc'
      Origin = 'NrRuc'
      Size = 35
    end
    object qryInsertDueSituacao: TStringField
      FieldName = 'Situacao'
      Origin = 'Situacao'
      Size = 50
    end
    object qryInsertDueBloqueio: TStringField
      FieldName = 'Bloqueio'
      Origin = 'Bloqueio'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueCanal: TStringField
      FieldName = 'Canal'
      Origin = 'Canal'
      Size = 15
    end
    object qryInsertDueChaveDeAcesso: TStringField
      FieldName = 'ChaveDeAcesso'
      Origin = 'ChaveDeAcesso'
      Size = 44
    end
    object qryInsertDueDeclaranteNrDocumento: TStringField
      FieldName = 'DeclaranteNrDocumento'
      Origin = 'DeclaranteNrDocumento'
    end
    object qryInsertDueDeclaranteTpDocumento: TStringField
      FieldName = 'DeclaranteTpDocumento'
      Origin = 'DeclaranteTpDocumento'
      Size = 10
    end
    object qryInsertDueDeclaranteNome: TStringField
      FieldName = 'DeclaranteNome'
      Origin = 'DeclaranteNome'
      Size = 150
    end
    object qryInsertDueDeclaranteNacCodigo: TIntegerField
      FieldName = 'DeclaranteNacCodigo'
      Origin = 'DeclaranteNacCodigo'
    end
    object qryInsertDueDeclaranteNacNome: TStringField
      FieldName = 'DeclaranteNacNome'
      Origin = 'DeclaranteNacNome'
      Size = 50
    end
    object qryInsertDueDeclaranteNacNomeResumido: TStringField
      FieldName = 'DeclaranteNacNomeResumido'
      Origin = 'DeclaranteNacNomeResumido'
      Size = 3
    end
    object qryInsertDueDeclaranteEstrangeiro: TStringField
      FieldName = 'DeclaranteEstrangeiro'
      Origin = 'DeclaranteEstrangeiro'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueItensNumero: TIntegerField
      FieldName = 'ItensNumero'
      Origin = 'ItensNumero'
    end
    object qryInsertDueItensNcmCodigo: TStringField
      FieldName = 'ItensNcmCodigo'
      Origin = 'ItensNcmCodigo'
      Size = 8
    end
    object qryInsertDueItensNcmDescricao: TStringField
      FieldName = 'ItensNcmDescricao'
      Origin = 'ItensNcmDescricao'
      Size = 150
    end
    object qryInsertDueItensItemNFExpoCodProduto: TStringField
      FieldName = 'ItensItemNFExpoCodProduto'
      Origin = 'ItensItemNFExpoCodProduto'
      Size = 60
    end
    object qryInsertDueItensDescricaoMercadoria: TMemoField
      FieldName = 'ItensDescricaoMercadoria'
      Origin = 'ItensDescricaoMercadoria'
      BlobType = ftMemo
    end
    object qryInsertDueItensQtdUnidEstatistica: TFloatField
      FieldName = 'ItensQtdUnidEstatistica'
      Origin = 'ItensQtdUnidEstatistica'
    end
    object qryInsertDueItensNcmUnidMedEstatistica: TStringField
      FieldName = 'ItensNcmUnidMedEstatistica'
      Origin = 'ItensNcmUnidMedEstatistica'
      Size = 25
    end
    object qryInsertDueItensQtdUnidComercializada: TFloatField
      FieldName = 'ItensQtdUnidComercializada'
      Origin = 'ItensQtdUnidComercializada'
    end
    object qryInsertDueItensUnidComercializada: TStringField
      FieldName = 'ItensUnidComercializada'
      Origin = 'ItensUnidComercializada'
    end
    object qryInsertDueItensPesoLiqTotal: TFloatField
      FieldName = 'ItensPesoLiqTotal'
      Origin = 'ItensPesoLiqTotal'
    end
    object qryInsertDueItensValorMercLocalEmbarque: TFloatField
      FieldName = 'ItensValorMercLocalEmbarque'
      Origin = 'ItensValorMercLocalEmbarque'
    end
    object qryInsertDueItensValorMercCondicaoVenda: TFloatField
      FieldName = 'ItensValorMercCondicaoVenda'
      Origin = 'ItensValorMercCondicaoVenda'
    end
    object qryInsertDueItensValorMercLocalEmbarqueEmReais: TFloatField
      FieldName = 'ItensValorMercLocalEmbarqueEmReais'
      Origin = 'ItensValorMercLocalEmbarqueEmReais'
    end
    object qryInsertDueItensitemNFExpoNFChaveAcesso: TStringField
      FieldName = 'ItensitemNFExpoNFChaveAcesso'
      Origin = 'ItensitemNFExpoNFChaveAcesso'
      Size = 44
    end
    object qryInsertDueItensItemNFExpoNFNumero: TIntegerField
      FieldName = 'ItensItemNFExpoNFNumero'
      Origin = 'ItensItemNFExpoNFNumero'
    end
    object qryInsertDueItensItemNFExpoNrItem: TIntegerField
      FieldName = 'ItensItemNFExpoNrItem'
      Origin = 'ItensItemNFExpoNrItem'
    end
    object qryInsertDueItensItemNFExpoNFModelo: TStringField
      FieldName = 'ItensItemNFExpoNFModelo'
      Origin = 'ItensItemNFExpoNFModelo'
      Size = 2
    end
    object qryInsertDuetensItemNFExpoNFSerie: TIntegerField
      FieldName = 'tensItemNFExpoNFSerie'
      Origin = 'tensItemNFExpoNFSerie'
    end
    object qryInsertDueItensItemNFExpoNFUfEmissor: TStringField
      FieldName = 'ItensItemNFExpoNFUfEmissor'
      Origin = 'ItensItemNFExpoNFUfEmissor'
      Size = 2
    end
    object qryInsertDueItensItemNFExpoNFIdEmitenteNumero: TStringField
      FieldName = 'ItensItemNFExpoNFIdEmitenteNumero'
      Origin = 'ItensItemNFExpoNFIdEmitenteNumero'
      Size = 14
    end
    object qryInsertDueItensItemNFExpoNFIdEmitenteCnpj: TStringField
      FieldName = 'ItensItemNFExpoNFIdEmitenteCnpj'
      Origin = 'ItensItemNFExpoNFIdEmitenteCnpj'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueItensItemNFExpoNFIdEmitenteCpf: TStringField
      FieldName = 'ItensItemNFExpoNFIdEmitenteCpf'
      Origin = 'ItensItemNFExpoNFIdEmitenteCpf'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueItensItemNFExpoNFFinalidade: TStringField
      FieldName = 'ItensItemNFExpoNFFinalidade'
      Origin = 'ItensItemNFExpoNFFinalidade'
      Size = 25
    end
    object qryInsertDueItensItemNFExpoNfNfEletronica: TStringField
      FieldName = 'ItensItemNFExpoNfNfEletronica'
      Origin = 'ItensItemNFExpoNfNfEletronica'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueItensItemNFExpoCfop: TIntegerField
      FieldName = 'ItensItemNFExpoCfop'
      Origin = 'ItensItemNFExpoCfop'
    end
    object qryInsertDueMoedaCodigo: TIntegerField
      FieldName = 'MoedaCodigo'
      Origin = 'MoedaCodigo'
    end
    object qryInsertDueItensCondVendaCodigo: TStringField
      FieldName = 'ItensCondVendaCodigo'
      Origin = 'ItensCondVendaCodigo'
      Size = 3
    end
    object qryInsertDueItensNomeImportador: TStringField
      FieldName = 'ItensNomeImportador'
      Origin = 'ItensNomeImportador'
      Size = 60
    end
    object qryInsertDueItensEnderecoImportador: TStringField
      FieldName = 'ItensEnderecoImportador'
      Origin = 'ItensEnderecoImportador'
      Size = 380
    end
    object qryInsertDueItensPaisDestinoCodigo: TIntegerField
      FieldName = 'ItensPaisDestinoCodigo'
      Origin = 'ItensPaisDestinoCodigo'
    end
    object qryInsertDuePaisImportadorCodigo: TIntegerField
      FieldName = 'PaisImportadorCodigo'
      Origin = 'PaisImportadorCodigo'
    end
    object qryInsertDueitensEnquadramento01Codigo: TIntegerField
      FieldName = 'itensEnquadramento01Codigo'
      Origin = 'itensEnquadramento01Codigo'
    end
    object qryInsertDueitensEnquadramento02Codigo: TIntegerField
      FieldName = 'itensEnquadramento02Codigo'
      Origin = 'itensEnquadramento02Codigo'
    end
    object qryInsertDueitensEnquadramento03Codigo: TIntegerField
      FieldName = 'itensEnquadramento03Codigo'
      Origin = 'itensEnquadramento03Codigo'
    end
    object qryInsertDueitensEnquadramento04Codigo: TIntegerField
      FieldName = 'itensEnquadramento04Codigo'
      Origin = 'itensEnquadramento04Codigo'
    end
    object qryInsertDueUnidLocalDespachoCodigo: TStringField
      FieldName = 'UnidLocalDespachoCodigo'
      Origin = 'UnidLocalDespachoCodigo'
      Size = 7
    end
    object qryInsertDueUnidLocalEmbarqueCodigo: TStringField
      FieldName = 'UnidLocalEmbarqueCodigo'
      Origin = 'UnidLocalEmbarqueCodigo'
      Size = 7
    end
    object qryInsertDueEmbarqueRecintoAlfandegado: TStringField
      FieldName = 'EmbarqueRecintoAlfandegado'
      Origin = 'EmbarqueRecintoAlfandegado'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueDespachoRecintoAlfandegado: TStringField
      FieldName = 'DespachoRecintoAlfandegado'
      Origin = 'DespachoRecintoAlfandegado'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueImpedidoEmbarque: TStringField
      FieldName = 'ImpedidoEmbarque'
      Origin = 'ImpedidoEmbarque'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueInformacoesComplementares: TMemoField
      FieldName = 'InformacoesComplementares'
      Origin = 'InformacoesComplementares'
      BlobType = ftMemo
    end
    object qryInsertDueRecintoAduaneiroDespachoCodigo: TStringField
      FieldName = 'RecintoAduaneiroDespachoCodigo'
      Origin = 'RecintoAduaneiroDespachoCodigo'
      Size = 7
    end
    object qryInsertDueRecintoAduaneiroEmbarqueCodigo: TStringField
      FieldName = 'RecintoAduaneiroEmbarqueCodigo'
      Origin = 'RecintoAduaneiroEmbarqueCodigo'
      Size = 7
    end
    object qryInsertDueResponsavelPeloACD: TStringField
      FieldName = 'ResponsavelPeloACD'
      Origin = 'ResponsavelPeloACD'
      Size = 25
    end
    object qryInsertDueDespachoRecintoDomiciliar: TStringField
      FieldName = 'DespachoRecintoDomiciliar'
      Origin = 'DespachoRecintoDomiciliar'
      FixedChar = True
      Size = 1
    end
    object qryInsertDuedat: TStringField
      FieldName = 'dat'
      Origin = 'dat'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueoea: TStringField
      FieldName = 'oea'
      Origin = 'oea'
      FixedChar = True
      Size = 1
    end
    object qryInsertDueItensDataConversao: TDateTimeField
      FieldName = 'ItensDataConversao'
    end
  end
  object qryRelatorioExpo: TFDQuery
    Connection = dbBroker
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      'SELECT top 10 * FROM ExpoDueImportada ')
    Left = 136
    Top = 208
    object qryRelatorioExpoNrDue: TStringField
      FieldName = 'NrDue'
      Origin = 'NrDue'
      Size = 14
    end
    object qryRelatorioExpoDataRegistro: TSQLTimeStampField
      FieldName = 'DataRegistro'
      Origin = 'DataRegistro'
    end
    object qryRelatorioExpoDataEmbarque: TSQLTimeStampField
      FieldName = 'DataEmbarque'
      Origin = 'DataEmbarque'
    end
    object qryRelatorioExpoNrRuc: TStringField
      FieldName = 'NrRuc'
      Origin = 'NrRuc'
      Size = 35
    end
    object qryRelatorioExpoSituacao: TStringField
      FieldName = 'Situacao'
      Origin = 'Situacao'
      Size = 50
    end
    object qryRelatorioExpoBloqueio: TStringField
      FieldName = 'Bloqueio'
      Origin = 'Bloqueio'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoCanal: TStringField
      FieldName = 'Canal'
      Origin = 'Canal'
      Size = 15
    end
    object qryRelatorioExpoChaveDeAcesso: TStringField
      FieldName = 'ChaveDeAcesso'
      Origin = 'ChaveDeAcesso'
      Size = 14
    end
    object qryRelatorioExpoDeclaranteNrDocumento: TStringField
      FieldName = 'DeclaranteNrDocumento'
      Origin = 'DeclaranteNrDocumento'
    end
    object qryRelatorioExpoDeclaranteTpDocumento: TStringField
      FieldName = 'DeclaranteTpDocumento'
      Origin = 'DeclaranteTpDocumento'
      Size = 10
    end
    object qryRelatorioExpoDeclaranteNome: TStringField
      FieldName = 'DeclaranteNome'
      Origin = 'DeclaranteNome'
      Size = 150
    end
    object qryRelatorioExpoDeclaranteNacCodigo: TIntegerField
      FieldName = 'DeclaranteNacCodigo'
      Origin = 'DeclaranteNacCodigo'
    end
    object qryRelatorioExpoDeclaranteNacNome: TStringField
      FieldName = 'DeclaranteNacNome'
      Origin = 'DeclaranteNacNome'
      Size = 50
    end
    object qryRelatorioExpoDeclaranteNacNomeResumido: TStringField
      FieldName = 'DeclaranteNacNomeResumido'
      Origin = 'DeclaranteNacNomeResumido'
      Size = 3
    end
    object qryRelatorioExpoDeclaranteEstrangeiro: TStringField
      FieldName = 'DeclaranteEstrangeiro'
      Origin = 'DeclaranteEstrangeiro'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoItensNumero: TIntegerField
      FieldName = 'ItensNumero'
      Origin = 'ItensNumero'
    end
    object qryRelatorioExpoItensNcmCodigo: TStringField
      FieldName = 'ItensNcmCodigo'
      Origin = 'ItensNcmCodigo'
      Size = 8
    end
    object qryRelatorioExpoItensNcmDescricao: TStringField
      FieldName = 'ItensNcmDescricao'
      Origin = 'ItensNcmDescricao'
      Size = 150
    end
    object qryRelatorioExpoItensItemNFExpoCodProduto: TStringField
      FieldName = 'ItensItemNFExpoCodProduto'
      Origin = 'ItensItemNFExpoCodProduto'
      Size = 60
    end
    object qryRelatorioExpoItensDescricaoMercadoria: TMemoField
      FieldName = 'ItensDescricaoMercadoria'
      Origin = 'ItensDescricaoMercadoria'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryRelatorioExpoItensQtdUnidEstatistica: TFloatField
      FieldName = 'ItensQtdUnidEstatistica'
      Origin = 'ItensQtdUnidEstatistica'
    end
    object qryRelatorioExpoItensNcmUnidMedEstatistica: TStringField
      FieldName = 'ItensNcmUnidMedEstatistica'
      Origin = 'ItensNcmUnidMedEstatistica'
      Size = 25
    end
    object qryRelatorioExpoItensQtdUnidComercializada: TFloatField
      FieldName = 'ItensQtdUnidComercializada'
      Origin = 'ItensQtdUnidComercializada'
    end
    object qryRelatorioExpoItensUnidComercializada: TStringField
      FieldName = 'ItensUnidComercializada'
      Origin = 'ItensUnidComercializada'
    end
    object qryRelatorioExpoItensPesoLiqTotal: TFloatField
      FieldName = 'ItensPesoLiqTotal'
      Origin = 'ItensPesoLiqTotal'
    end
    object qryRelatorioExpoItensValorMercLocalEmbarque: TFloatField
      FieldName = 'ItensValorMercLocalEmbarque'
      Origin = 'ItensValorMercLocalEmbarque'
    end
    object qryRelatorioExpoItensValorMercCondicaoVenda: TFloatField
      FieldName = 'ItensValorMercCondicaoVenda'
      Origin = 'ItensValorMercCondicaoVenda'
    end
    object qryRelatorioExpoItensValorMercLocalEmbarqueEmReais: TFloatField
      FieldName = 'ItensValorMercLocalEmbarqueEmReais'
      Origin = 'ItensValorMercLocalEmbarqueEmReais'
    end
    object qryRelatorioExpoItensitemNFExpoNFChaveAcesso: TStringField
      FieldName = 'ItensitemNFExpoNFChaveAcesso'
      Origin = 'ItensitemNFExpoNFChaveAcesso'
      Size = 44
    end
    object qryRelatorioExpoItensItemNFExpoNFNumero: TIntegerField
      FieldName = 'ItensItemNFExpoNFNumero'
      Origin = 'ItensItemNFExpoNFNumero'
    end
    object qryRelatorioExpoItensItemNFExpoNrItem: TIntegerField
      FieldName = 'ItensItemNFExpoNrItem'
      Origin = 'ItensItemNFExpoNrItem'
    end
    object qryRelatorioExpoItensItemNFExpoNFModelo: TStringField
      FieldName = 'ItensItemNFExpoNFModelo'
      Origin = 'ItensItemNFExpoNFModelo'
      Size = 2
    end
    object qryRelatorioExpotensItemNFExpoNFSerie: TIntegerField
      FieldName = 'tensItemNFExpoNFSerie'
      Origin = 'tensItemNFExpoNFSerie'
    end
    object qryRelatorioExpoItensItemNFExpoNFUfEmissor: TStringField
      FieldName = 'ItensItemNFExpoNFUfEmissor'
      Origin = 'ItensItemNFExpoNFUfEmissor'
      Size = 2
    end
    object qryRelatorioExpoItensItemNFExpoNFIdEmitenteNumero: TStringField
      FieldName = 'ItensItemNFExpoNFIdEmitenteNumero'
      Origin = 'ItensItemNFExpoNFIdEmitenteNumero'
      Size = 14
    end
    object qryRelatorioExpoItensItemNFExpoNFIdEmitenteCnpj: TStringField
      FieldName = 'ItensItemNFExpoNFIdEmitenteCnpj'
      Origin = 'ItensItemNFExpoNFIdEmitenteCnpj'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoItensItemNFExpoNFIdEmitenteCpf: TStringField
      FieldName = 'ItensItemNFExpoNFIdEmitenteCpf'
      Origin = 'ItensItemNFExpoNFIdEmitenteCpf'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoItensItemNFExpoNFFinalidade: TStringField
      FieldName = 'ItensItemNFExpoNFFinalidade'
      Origin = 'ItensItemNFExpoNFFinalidade'
      Size = 25
    end
    object qryRelatorioExpoItensItemNFExpoNfNfEletronica: TStringField
      FieldName = 'ItensItemNFExpoNfNfEletronica'
      Origin = 'ItensItemNFExpoNfNfEletronica'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoItensItemNFExpoCfop: TIntegerField
      FieldName = 'ItensItemNFExpoCfop'
      Origin = 'ItensItemNFExpoCfop'
    end
    object qryRelatorioExpoMoedaCodigo: TIntegerField
      FieldName = 'MoedaCodigo'
      Origin = 'MoedaCodigo'
    end
    object qryRelatorioExpoItensCondVendaCodigo: TStringField
      FieldName = 'ItensCondVendaCodigo'
      Origin = 'ItensCondVendaCodigo'
      Size = 3
    end
    object qryRelatorioExpoItensNomeImportador: TStringField
      FieldName = 'ItensNomeImportador'
      Origin = 'ItensNomeImportador'
      Size = 60
    end
    object qryRelatorioExpoItensEnderecoImportador: TStringField
      FieldName = 'ItensEnderecoImportador'
      Origin = 'ItensEnderecoImportador'
      Size = 380
    end
    object qryRelatorioExpoItensPaisDestinoCodigo: TIntegerField
      FieldName = 'ItensPaisDestinoCodigo'
      Origin = 'ItensPaisDestinoCodigo'
    end
    object qryRelatorioExpoPaisImportadorCodigo: TIntegerField
      FieldName = 'PaisImportadorCodigo'
      Origin = 'PaisImportadorCodigo'
    end
    object qryRelatorioExpoitensEnquadramento01Codigo: TIntegerField
      FieldName = 'itensEnquadramento01Codigo'
      Origin = 'itensEnquadramento01Codigo'
    end
    object qryRelatorioExpoUnidLocalDespachoCodigo: TStringField
      FieldName = 'UnidLocalDespachoCodigo'
      Origin = 'UnidLocalDespachoCodigo'
      Size = 7
    end
    object qryRelatorioExpoUnidLocalEmbarqueCodigo: TStringField
      FieldName = 'UnidLocalEmbarqueCodigo'
      Origin = 'UnidLocalEmbarqueCodigo'
      Size = 7
    end
    object qryRelatorioExpoEmbarqueRecintoAlfandegado: TStringField
      FieldName = 'EmbarqueRecintoAlfandegado'
      Origin = 'EmbarqueRecintoAlfandegado'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoDespachoRecintoAlfandegado: TStringField
      FieldName = 'DespachoRecintoAlfandegado'
      Origin = 'DespachoRecintoAlfandegado'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoImpedidoEmbarque: TStringField
      FieldName = 'ImpedidoEmbarque'
      Origin = 'ImpedidoEmbarque'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoInformacoesComplementares: TMemoField
      FieldName = 'InformacoesComplementares'
      Origin = 'InformacoesComplementares'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryRelatorioExpoRecintoAduaneiroDespachoCodigo: TStringField
      FieldName = 'RecintoAduaneiroDespachoCodigo'
      Origin = 'RecintoAduaneiroDespachoCodigo'
      Size = 7
    end
    object qryRelatorioExpoRecintoAduaneiroEmbarqueCodigo: TStringField
      FieldName = 'RecintoAduaneiroEmbarqueCodigo'
      Origin = 'RecintoAduaneiroEmbarqueCodigo'
      Size = 7
    end
    object qryRelatorioExpoResponsavelPeloACD: TStringField
      FieldName = 'ResponsavelPeloACD'
      Origin = 'ResponsavelPeloACD'
      Size = 25
    end
    object qryRelatorioExpoDespachoRecintoDomiciliar: TStringField
      FieldName = 'DespachoRecintoDomiciliar'
      Origin = 'DespachoRecintoDomiciliar'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpodat: TStringField
      FieldName = 'dat'
      Origin = 'dat'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpooea: TStringField
      FieldName = 'oea'
      Origin = 'oea'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioExpoitensEnquadramento02Codigo: TIntegerField
      FieldName = 'itensEnquadramento02Codigo'
      Origin = 'itensEnquadramento02Codigo'
    end
    object qryRelatorioExpoitensEnquadramento03Codigo: TIntegerField
      FieldName = 'itensEnquadramento03Codigo'
      Origin = 'itensEnquadramento03Codigo'
    end
    object qryRelatorioExpoitensEnquadramento04Codigo: TIntegerField
      FieldName = 'itensEnquadramento04Codigo'
      Origin = 'itensEnquadramento04Codigo'
    end
    object qryRelatorioExpoItensDataConversao: TSQLTimeStampField
      FieldName = 'ItensDataConversao'
      Origin = 'ItensDataConversao'
    end
    object qryRelatorioExpoDataCCE: TSQLTimeStampField
      FieldName = 'DataCCE'
      Origin = 'DataCCE'
    end
    object qryRelatorioExpoDataCriacao: TSQLTimeStampField
      FieldName = 'DataCriacao'
      Origin = 'DataCriacao'
    end
    object qryRelatorioExpoDataDueImportada: TSQLTimeStampField
      FieldName = 'DataDueImportada'
      Origin = 'DataDueImportada'
    end
  end
  object dtsRelatorioExpo: TDataSource
    DataSet = qryRelatorioExpo
    Left = 40
    Top = 208
  end
  object qryFilaExpo: TFDQuery
    Connection = dbBroker
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      
        'SELECT NrDue, DataControle, DataDueImportada, CodigoCertificadoD' +
        'espachante, NomeDespachante, StatusConsulta'
      'FROM ExpoDueImportadaControle A'
      
        'LEFT JOIN CertificadoDespachante B ON B.Codigo = A.CodigoCertifi' +
        'cadoDespachante'
      'WHERE DataDueImportada IS NULL  '
      'ORDER BY A.CODIGO, B.OrdemConsulta'
      '')
    Left = 120
    Top = 143
    object qryFilaExpoNrDue: TStringField
      FieldName = 'NrDue'
      Origin = 'NrDue'
      Required = True
      Size = 14
    end
    object qryFilaExpoDataControle: TSQLTimeStampField
      FieldName = 'DataControle'
      Origin = 'DataControle'
      Required = True
    end
    object qryFilaExpoDataDueImportada: TSQLTimeStampField
      FieldName = 'DataDueImportada'
      Origin = 'DataDueImportada'
    end
    object qryFilaExpoCodigoCertificadoDespachante: TIntegerField
      FieldName = 'CodigoCertificadoDespachante'
      Origin = 'CodigoCertificadoDespachante'
    end
    object qryFilaExpoNomeDespachante: TStringField
      FieldName = 'NomeDespachante'
      Origin = 'NomeDespachante'
      Size = 50
    end
    object qryFilaExpoStatusConsulta: TStringField
      FieldName = 'StatusConsulta'
      Origin = 'StatusConsulta'
      Size = 200
    end
  end
  object dtsFilaExpo: TDataSource
    DataSet = qryFilaExpo
    Left = 48
    Top = 144
  end
  object qryInsertDi: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      '')
    Left = 32
    Top = 320
  end
  object qryRelatorioImpo: TFDQuery
    Connection = dbBroker
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      'SELECT * FROM ImpoDiImportada')
    Left = 127
    Top = 386
    object qryRelatorioImponumeroDI: TStringField
      FieldName = 'numeroDI'
      Origin = 'numeroDI'
      Required = True
      Size = 10
    end
    object qryRelatorioImpodataRegistro: TSQLTimeStampField
      FieldName = 'dataRegistro'
      Origin = 'dataRegistro'
    end
    object qryRelatorioImpodataDiImportada: TSQLTimeStampField
      FieldName = 'dataDiImportada'
      Origin = 'dataDiImportada'
    end
    object qryRelatorioImpotipoDeclaracaoCodigo: TStringField
      FieldName = 'tipoDeclaracaoCodigo'
      Origin = 'tipoDeclaracaoCodigo'
      Size = 2
    end
    object qryRelatorioImpotipoDeclaracaoNome: TStringField
      FieldName = 'tipoDeclaracaoNome'
      Origin = 'tipoDeclaracaoNome'
      Size = 50
    end
    object qryRelatorioImpomodalidadeDespachoCodigo: TStringField
      FieldName = 'modalidadeDespachoCodigo'
      Origin = 'modalidadeDespachoCodigo'
      Size = 1
    end
    object qryRelatorioImpomodalidadeDespachoNome: TStringField
      FieldName = 'modalidadeDespachoNome'
      Origin = 'modalidadeDespachoNome'
      Size = 10
    end
    object qryRelatorioImpodataDesembaraco: TSQLTimeStampField
      FieldName = 'dataDesembaraco'
      Origin = 'dataDesembaraco'
    end
    object qryRelatorioImpooperacaoFundap: TStringField
      FieldName = 'operacaoFundap'
      Origin = 'operacaoFundap'
      Size = 1
    end
    object qryRelatorioImpourfDespachoCodigo: TStringField
      FieldName = 'urfDespachoCodigo'
      Origin = 'urfDespachoCodigo'
      Size = 7
    end
    object qryRelatorioImpourfDespachoNome: TStringField
      FieldName = 'urfDespachoNome'
      Origin = 'urfDespachoNome'
      Size = 60
    end
    object qryRelatorioImpolocalDescargaTotalDolares: TFloatField
      FieldName = 'localDescargaTotalDolares'
      Origin = 'localDescargaTotalDolares'
    end
    object qryRelatorioImpolocalDescargaTotalReais: TFloatField
      FieldName = 'localDescargaTotalReais'
      Origin = 'localDescargaTotalReais'
    end
    object qryRelatorioImpolocalEmbarqueTotalDolares: TFloatField
      FieldName = 'localEmbarqueTotalDolares'
      Origin = 'localEmbarqueTotalDolares'
    end
    object qryRelatorioImpolocalEmbarqueTotalReais: TFloatField
      FieldName = 'localEmbarqueTotalReais'
      Origin = 'localEmbarqueTotalReais'
    end
    object qryRelatorioImpoviaTransporteCodigo: TStringField
      FieldName = 'viaTransporteCodigo'
      Origin = 'viaTransporteCodigo'
      Size = 2
    end
    object qryRelatorioImpoviaTransporteMultimodal: TStringField
      FieldName = 'viaTransporteMultimodal'
      Origin = 'viaTransporteMultimodal'
      Size = 1
    end
    object qryRelatorioImpoviaTransporteNome: TStringField
      FieldName = 'viaTransporteNome'
      Origin = 'viaTransporteNome'
      Size = 50
    end
    object qryRelatorioImpoviaTransporteNomeTransportador: TStringField
      FieldName = 'viaTransporteNomeTransportador'
      Origin = 'viaTransporteNomeTransportador'
      Size = 100
    end
    object qryRelatorioImpoviaTransportePaisTransportadorCodigo: TStringField
      FieldName = 'viaTransportePaisTransportadorCodigo'
      Origin = 'viaTransportePaisTransportadorCodigo'
      Size = 3
    end
    object qryRelatorioImpoviaTransportePaisTransportadorNome: TStringField
      FieldName = 'viaTransportePaisTransportadorNome'
      Origin = 'viaTransportePaisTransportadorNome'
      Size = 50
    end
    object qryRelatorioImposequencialRetificacao: TStringField
      FieldName = 'sequencialRetificacao'
      Origin = 'sequencialRetificacao'
      Size = 2
    end
    object qryRelatorioImposituacaoEntregaCarga: TStringField
      FieldName = 'situacaoEntregaCarga'
      Origin = 'situacaoEntregaCarga'
      Size = 200
    end
    object qryRelatorioImpocanalSelecaoParametrizada: TStringField
      FieldName = 'canalSelecaoParametrizada'
      Origin = 'canalSelecaoParametrizada'
      Size = 3
    end
    object qryRelatorioImpocaracterizacaoOperacaoCodigoTipo: TStringField
      FieldName = 'caracterizacaoOperacaoCodigoTipo'
      Origin = 'caracterizacaoOperacaoCodigoTipo'
      Size = 1
    end
    object qryRelatorioImpocaracterizacaoOperacaoDescricaoTipo: TStringField
      FieldName = 'caracterizacaoOperacaoDescricaoTipo'
      Origin = 'caracterizacaoOperacaoDescricaoTipo'
      Size = 30
    end
    object qryRelatorioImpocargaDataChegada: TSQLTimeStampField
      FieldName = 'cargaDataChegada'
      Origin = 'cargaDataChegada'
    end
    object qryRelatorioImpocargaNumeroAgente: TStringField
      FieldName = 'cargaNumeroAgente'
      Origin = 'cargaNumeroAgente'
      Size = 14
    end
    object qryRelatorioImpocargaPaisProcedenciaCodigo: TStringField
      FieldName = 'cargaPaisProcedenciaCodigo'
      Origin = 'cargaPaisProcedenciaCodigo'
      Size = 3
    end
    object qryRelatorioImpocargaPaisProcedenciaNome: TStringField
      FieldName = 'cargaPaisProcedenciaNome'
      Origin = 'cargaPaisProcedenciaNome'
      Size = 50
    end
    object qryRelatorioImpocargaPesoBruto: TFloatField
      FieldName = 'cargaPesoBruto'
      Origin = 'cargaPesoBruto'
    end
    object qryRelatorioImpocargaPesoLiquido: TFloatField
      FieldName = 'cargaPesoLiquido'
      Origin = 'cargaPesoLiquido'
    end
    object qryRelatorioImpocargaUrfEntradaCodigo: TStringField
      FieldName = 'cargaUrfEntradaCodigo'
      Origin = 'cargaUrfEntradaCodigo'
      Size = 7
    end
    object qryRelatorioImpocargaUrfEntradaNome: TStringField
      FieldName = 'cargaUrfEntradaNome'
      Origin = 'cargaUrfEntradaNome'
      Size = 60
    end
    object qryRelatorioImpoconhecimentoCargaEmbarqueData: TSQLTimeStampField
      FieldName = 'conhecimentoCargaEmbarqueData'
      Origin = 'conhecimentoCargaEmbarqueData'
    end
    object qryRelatorioImpoconhecimentoCargaEmbarqueLocal: TStringField
      FieldName = 'conhecimentoCargaEmbarqueLocal'
      Origin = 'conhecimentoCargaEmbarqueLocal'
      Size = 50
    end
    object qryRelatorioImpoconhecimentoCargaId: TStringField
      FieldName = 'conhecimentoCargaId'
      Origin = 'conhecimentoCargaId'
      Size = 18
    end
    object qryRelatorioImpoconhecimentoCargaIdMaster: TStringField
      FieldName = 'conhecimentoCargaIdMaster'
      Origin = 'conhecimentoCargaIdMaster'
      Size = 15
    end
    object qryRelatorioImpoconhecimentoCargaTipoCodigo: TStringField
      FieldName = 'conhecimentoCargaTipoCodigo'
      Origin = 'conhecimentoCargaTipoCodigo'
      Size = 2
    end
    object qryRelatorioImpoconhecimentoCargaTipoNome: TStringField
      FieldName = 'conhecimentoCargaTipoNome'
      Origin = 'conhecimentoCargaTipoNome'
      Size = 50
    end
    object qryRelatorioImpoconhecimentoCargaUtilizacao: TStringField
      FieldName = 'conhecimentoCargaUtilizacao'
      Origin = 'conhecimentoCargaUtilizacao'
      Size = 1
    end
    object qryRelatorioImpoconhecimentoCargaUtilizacaoNome: TStringField
      FieldName = 'conhecimentoCargaUtilizacaoNome'
      Origin = 'conhecimentoCargaUtilizacaoNome'
      Size = 50
    end
    object qryRelatorioImpovalorTotalMultaARecolherAjustado: TFloatField
      FieldName = 'valorTotalMultaARecolherAjustado'
      Origin = 'valorTotalMultaARecolherAjustado'
    end
    object qryRelatorioImposeguroMoedaNegociadaCodigo: TStringField
      FieldName = 'seguroMoedaNegociadaCodigo'
      Origin = 'seguroMoedaNegociadaCodigo'
      Size = 3
    end
    object qryRelatorioImposeguroMoedaNegociadaNome: TStringField
      FieldName = 'seguroMoedaNegociadaNome'
      Origin = 'seguroMoedaNegociadaNome'
      Size = 50
    end
    object qryRelatorioImposeguroTotalDolares: TFloatField
      FieldName = 'seguroTotalDolares'
      Origin = 'seguroTotalDolares'
    end
    object qryRelatorioImposeguroTotalMoedaNegociada: TFloatField
      FieldName = 'seguroTotalMoedaNegociada'
      Origin = 'seguroTotalMoedaNegociada'
    end
    object qryRelatorioImposeguroTotalReais: TFloatField
      FieldName = 'seguroTotalReais'
      Origin = 'seguroTotalReais'
    end
    object qryRelatorioImpofreteCollect: TStringField
      FieldName = 'freteCollect'
      Origin = 'freteCollect'
      Size = 15
    end
    object qryRelatorioImpofreteEmTerritorioNacional: TStringField
      FieldName = 'freteEmTerritorioNacional'
      Origin = 'freteEmTerritorioNacional'
      Size = 15
    end
    object qryRelatorioImpofreteMoedaNegociadaCodigo: TStringField
      FieldName = 'freteMoedaNegociadaCodigo'
      Origin = 'freteMoedaNegociadaCodigo'
      Size = 3
    end
    object qryRelatorioImpofreteMoedaNegociadaNome: TStringField
      FieldName = 'freteMoedaNegociadaNome'
      Origin = 'freteMoedaNegociadaNome'
      Size = 50
    end
    object qryRelatorioImpofretePrepaid: TStringField
      FieldName = 'fretePrepaid'
      Origin = 'fretePrepaid'
      Size = 15
    end
    object qryRelatorioImpofreteTotalDolares: TFloatField
      FieldName = 'freteTotalDolares'
      Origin = 'freteTotalDolares'
    end
    object qryRelatorioImpofreteTotalMoeda: TFloatField
      FieldName = 'freteTotalMoeda'
      Origin = 'freteTotalMoeda'
    end
    object qryRelatorioImpofreteTotalReais: TFloatField
      FieldName = 'freteTotalReais'
      Origin = 'freteTotalReais'
    end
    object qryRelatorioImpoimportadorCodigoTipo: TStringField
      FieldName = 'importadorCodigoTipo'
      Origin = 'importadorCodigoTipo'
      Size = 1
    end
    object qryRelatorioImpoimportadorCpfRepresentanteLegal: TStringField
      FieldName = 'importadorCpfRepresentanteLegal'
      Origin = 'importadorCpfRepresentanteLegal'
      Size = 11
    end
    object qryRelatorioImpoimportadorEnderecoBairro: TStringField
      FieldName = 'importadorEnderecoBairro'
      Origin = 'importadorEnderecoBairro'
    end
    object qryRelatorioImpoimportadorEnderecoCep: TStringField
      FieldName = 'importadorEnderecoCep'
      Origin = 'importadorEnderecoCep'
      Size = 8
    end
    object qryRelatorioImpoimportadorEnderecoLogradouro: TStringField
      FieldName = 'importadorEnderecoLogradouro'
      Origin = 'importadorEnderecoLogradouro'
      Size = 40
    end
    object qryRelatorioImpoimportadorEnderecoMunicipio: TStringField
      FieldName = 'importadorEnderecoMunicipio'
      Origin = 'importadorEnderecoMunicipio'
    end
    object qryRelatorioImpoimportadorEnderecoNumero: TStringField
      FieldName = 'importadorEnderecoNumero'
      Origin = 'importadorEnderecoNumero'
      Size = 6
    end
    object qryRelatorioImpoimportadorEnderecoUf: TStringField
      FieldName = 'importadorEnderecoUf'
      Origin = 'importadorEnderecoUf'
      Size = 2
    end
    object qryRelatorioImpoimportadorNome: TStringField
      FieldName = 'importadorNome'
      Origin = 'importadorNome'
      Size = 60
    end
    object qryRelatorioImpoimportadorNomeRepresentanteLegal: TStringField
      FieldName = 'importadorNomeRepresentanteLegal'
      Origin = 'importadorNomeRepresentanteLegal'
      Size = 100
    end
    object qryRelatorioImpoimportadorNumero: TStringField
      FieldName = 'importadorNumero'
      Origin = 'importadorNumero'
      Size = 14
    end
    object qryRelatorioImpoarmazenamentoRecintoAduaneiroCodigo: TStringField
      FieldName = 'armazenamentoRecintoAduaneiroCodigo'
      Origin = 'armazenamentoRecintoAduaneiroCodigo'
      Size = 7
    end
    object qryRelatorioImpoarmazenamentoRecintoAduaneiroNome: TStringField
      FieldName = 'armazenamentoRecintoAduaneiroNome'
      Origin = 'armazenamentoRecintoAduaneiroNome'
      Size = 70
    end
    object qryRelatorioImpoarmazenamentoSetor: TStringField
      FieldName = 'armazenamentoSetor'
      Origin = 'armazenamentoSetor'
      Size = 3
    end
    object qryRelatorioImpoinformacaoComplementar: TMemoField
      FieldName = 'informacaoComplementar'
      Origin = 'informacaoComplementar'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryRelatorioImpototalAdicoes: TIntegerField
      FieldName = 'totalAdicoes'
      Origin = 'totalAdicoes'
    end
    object qryRelatorioImponomeArmazem: TStringField
      FieldName = 'nomeArmazem'
      Origin = 'nomeArmazem'
      Size = 50
    end
    object qryRelatorioImpoagenciaIcms: TStringField
      FieldName = 'agenciaIcms'
      Origin = 'agenciaIcms'
      Size = 5
    end
    object qryRelatorioImpobancoIcms: TStringField
      FieldName = 'bancoIcms'
      Origin = 'bancoIcms'
      Size = 3
    end
    object qryRelatorioImpocodigoTipoRecolhimentoIcms: TStringField
      FieldName = 'codigoTipoRecolhimentoIcms'
      Origin = 'codigoTipoRecolhimentoIcms'
      Size = 1
    end
    object qryRelatorioImpocpfResponsavelRegistroIcms: TStringField
      FieldName = 'cpfResponsavelRegistroIcms'
      Origin = 'cpfResponsavelRegistroIcms'
      Size = 11
    end
    object qryRelatorioImpodataPagamentoIcms: TSQLTimeStampField
      FieldName = 'dataPagamentoIcms'
      Origin = 'dataPagamentoIcms'
    end
    object qryRelatorioImpodataRegistroIcms: TSQLTimeStampField
      FieldName = 'dataRegistroIcms'
      Origin = 'dataRegistroIcms'
    end
    object qryRelatorioImpohoraRegistroIcms: TStringField
      FieldName = 'horaRegistroIcms'
      Origin = 'horaRegistroIcms'
      Size = 6
    end
    object qryRelatorioImponomeTipoRecolhimentoIcms: TStringField
      FieldName = 'nomeTipoRecolhimentoIcms'
      Origin = 'nomeTipoRecolhimentoIcms'
      Size = 55
    end
    object qryRelatorioImponumeroSequencialIcms: TStringField
      FieldName = 'numeroSequencialIcms'
      Origin = 'numeroSequencialIcms'
      Size = 3
    end
    object qryRelatorioImpoufIcms: TStringField
      FieldName = 'ufIcms'
      Origin = 'ufIcms'
      Size = 2
    end
    object qryRelatorioImpovalorTotalIcms: TFloatField
      FieldName = 'valorTotalIcms'
      Origin = 'valorTotalIcms'
    end
    object qryRelatorioImpodocumentoChegadaCargaCodigoTipo: TStringField
      FieldName = 'documentoChegadaCargaCodigoTipo'
      Origin = 'documentoChegadaCargaCodigoTipo'
      Size = 1
    end
    object qryRelatorioImpodocumentoChegadaCargaNome: TStringField
      FieldName = 'documentoChegadaCargaNome'
      Origin = 'documentoChegadaCargaNome'
      Size = 50
    end
    object qryRelatorioImpodocumentoChegadaCargaNumero: TStringField
      FieldName = 'documentoChegadaCargaNumero'
      Origin = 'documentoChegadaCargaNumero'
    end
    object qryRelatorioImpoa_numeroAdicao: TStringField
      FieldName = 'a_numeroAdicao'
      Origin = 'a_numeroAdicao'
      Size = 3
    end
    object qryRelatorioImpoa_numeroLI: TStringField
      FieldName = 'a_numeroLI'
      Origin = 'a_numeroLI'
      Size = 10
    end
    object qryRelatorioImpoa_sequencialRetificacao: TStringField
      FieldName = 'a_sequencialRetificacao'
      Origin = 'a_sequencialRetificacao'
      Size = 2
    end
    object qryRelatorioImpoa_dadosMercadoriaAplicacao: TStringField
      FieldName = 'a_dadosMercadoriaAplicacao'
      Origin = 'a_dadosMercadoriaAplicacao'
      Size = 7
    end
    object qryRelatorioImpoa_dadosMercadoriaCodigoNaladiNCCA: TStringField
      FieldName = 'a_dadosMercadoriaCodigoNaladiNCCA'
      Origin = 'a_dadosMercadoriaCodigoNaladiNCCA'
      Size = 7
    end
    object qryRelatorioImpoa_dadosMercadoriaCodigoNaladiSH: TStringField
      FieldName = 'a_dadosMercadoriaCodigoNaladiSH'
      Origin = 'a_dadosMercadoriaCodigoNaladiSH'
      Size = 8
    end
    object qryRelatorioImpoa_dadosMercadoriaCodigoNcm: TStringField
      FieldName = 'a_dadosMercadoriaCodigoNcm'
      Origin = 'a_dadosMercadoriaCodigoNcm'
      Size = 8
    end
    object qryRelatorioImpoa_dadosMercadoriaCondicao: TStringField
      FieldName = 'a_dadosMercadoriaCondicao'
      Origin = 'a_dadosMercadoriaCondicao'
      Size = 30
    end
    object qryRelatorioImpoa_dadosMercadoriaMedidaEstatisticaQuantidade: TFloatField
      FieldName = 'a_dadosMercadoriaMedidaEstatisticaQuantidade'
      Origin = 'a_dadosMercadoriaMedidaEstatisticaQuantidade'
    end
    object qryRelatorioImpoa_dadosMercadoriaMedidaEstatisticaUnidade: TStringField
      FieldName = 'a_dadosMercadoriaMedidaEstatisticaUnidade'
      Origin = 'a_dadosMercadoriaMedidaEstatisticaUnidade'
    end
    object qryRelatorioImpoa_dadosMercadoriaNomeNcm: TStringField
      FieldName = 'a_dadosMercadoriaNomeNcm'
      Origin = 'a_dadosMercadoriaNomeNcm'
      Size = 70
    end
    object qryRelatorioImpoa_dadosMercadoriaPesoLiquido: TFloatField
      FieldName = 'a_dadosMercadoriaPesoLiquido'
      Origin = 'a_dadosMercadoriaPesoLiquido'
    end
    object qryRelatorioImpoa_paisAquisicaoMercadoriaCodigo: TStringField
      FieldName = 'a_paisAquisicaoMercadoriaCodigo'
      Origin = 'a_paisAquisicaoMercadoriaCodigo'
      Size = 3
    end
    object qryRelatorioImpoa_paisAquisicaoMercadoriaNome: TStringField
      FieldName = 'a_paisAquisicaoMercadoriaNome'
      Origin = 'a_paisAquisicaoMercadoriaNome'
      Size = 50
    end
    object qryRelatorioImpoa_paisOrigemMercadoriaCodigo: TStringField
      FieldName = 'a_paisOrigemMercadoriaCodigo'
      Origin = 'a_paisOrigemMercadoriaCodigo'
      Size = 3
    end
    object qryRelatorioImpoa_paisOrigemMercadoriaNome: TStringField
      FieldName = 'a_paisOrigemMercadoriaNome'
      Origin = 'a_paisOrigemMercadoriaNome'
      Size = 50
    end
    object qryRelatorioImpoa_fornecedorCidade: TStringField
      FieldName = 'a_fornecedorCidade'
      Origin = 'a_fornecedorCidade'
      Size = 30
    end
    object qryRelatorioImpoa_fornecedorComplemento: TStringField
      FieldName = 'a_fornecedorComplemento'
      Origin = 'a_fornecedorComplemento'
      Size = 30
    end
    object qryRelatorioImpoa_fornecedorEstado: TStringField
      FieldName = 'a_fornecedorEstado'
      Origin = 'a_fornecedorEstado'
      Size = 30
    end
    object qryRelatorioImpoa_fornecedorLogradouro: TStringField
      FieldName = 'a_fornecedorLogradouro'
      Origin = 'a_fornecedorLogradouro'
      Size = 50
    end
    object qryRelatorioImpoa_fornecedorNome: TStringField
      FieldName = 'a_fornecedorNome'
      Origin = 'a_fornecedorNome'
      Size = 100
    end
    object qryRelatorioImpoa_fornecedorNumero: TStringField
      FieldName = 'a_fornecedorNumero'
      Origin = 'a_fornecedorNumero'
      Size = 7
    end
    object qryRelatorioImpoa_codigoRelacaoCompradorVendedor: TStringField
      FieldName = 'a_codigoRelacaoCompradorVendedor'
      Origin = 'a_codigoRelacaoCompradorVendedor'
      Size = 1
    end
    object qryRelatorioImpoa_relacaoCompradorVendedor: TStringField
      FieldName = 'a_relacaoCompradorVendedor'
      Origin = 'a_relacaoCompradorVendedor'
      Size = 30
    end
    object qryRelatorioImpoa_codigoVinculoCompradorVendedor: TStringField
      FieldName = 'a_codigoVinculoCompradorVendedor'
      Origin = 'a_codigoVinculoCompradorVendedor'
      Size = 70
    end
    object qryRelatorioImpoa_vinculoCompradorVendedor: TStringField
      FieldName = 'a_vinculoCompradorVendedor'
      Origin = 'a_vinculoCompradorVendedor'
      Size = 100
    end
    object qryRelatorioImpoa_dadosCambiaisCoberturaCambialCodigo: TStringField
      FieldName = 'a_dadosCambiaisCoberturaCambialCodigo'
      Origin = 'a_dadosCambiaisCoberturaCambialCodigo'
      Size = 1
    end
    object qryRelatorioImpoa_dadosCambiaisCoberturaCambialNome: TStringField
      FieldName = 'a_dadosCambiaisCoberturaCambialNome'
      Origin = 'a_dadosCambiaisCoberturaCambialNome'
      Size = 60
    end
    object qryRelatorioImpoa_dadosCambiaisInstituicaoFinanciadoraCodigo: TStringField
      FieldName = 'a_dadosCambiaisInstituicaoFinanciadoraCodigo'
      Origin = 'a_dadosCambiaisInstituicaoFinanciadoraCodigo'
      Size = 2
    end
    object qryRelatorioImpoa_dadosCambiaisInstituicaoFinanciadoraNome: TStringField
      FieldName = 'a_dadosCambiaisInstituicaoFinanciadoraNome'
      Origin = 'a_dadosCambiaisInstituicaoFinanciadoraNome'
      Size = 50
    end
    object qryRelatorioImpoa_dadosCambiaisMotivoSemCoberturaCodigo: TStringField
      FieldName = 'a_dadosCambiaisMotivoSemCoberturaCodigo'
      Origin = 'a_dadosCambiaisMotivoSemCoberturaCodigo'
      Size = 2
    end
    object qryRelatorioImpoa_dadosCambiaisMotivoSemCoberturaNome: TStringField
      FieldName = 'a_dadosCambiaisMotivoSemCoberturaNome'
      Origin = 'a_dadosCambiaisMotivoSemCoberturaNome'
      Size = 100
    end
    object qryRelatorioImpoa_dadosCambiaisValorRealCambio: TFloatField
      FieldName = 'a_dadosCambiaisValorRealCambio'
      Origin = 'a_dadosCambiaisValorRealCambio'
    end
    object qryRelatorioImpoa_dadosCargaPaisProcedenciaCodigo: TStringField
      FieldName = 'a_dadosCargaPaisProcedenciaCodigo'
      Origin = 'a_dadosCargaPaisProcedenciaCodigo'
      Size = 3
    end
    object qryRelatorioImpoa_dadosCargaUrfEntradaCodigo: TStringField
      FieldName = 'a_dadosCargaUrfEntradaCodigo'
      Origin = 'a_dadosCargaUrfEntradaCodigo'
      Size = 7
    end
    object qryRelatorioImpoa_dadosCargaViaTransporteCodigo: TStringField
      FieldName = 'a_dadosCargaViaTransporteCodigo'
      Origin = 'a_dadosCargaViaTransporteCodigo'
      Size = 2
    end
    object qryRelatorioImpoa_condicaoVendaLocal: TStringField
      FieldName = 'a_condicaoVendaLocal'
      Origin = 'a_condicaoVendaLocal'
      Size = 50
    end
    object qryRelatorioImpoa_condicaoVendaMetodoValoracaoCodigo: TStringField
      FieldName = 'a_condicaoVendaMetodoValoracaoCodigo'
      Origin = 'a_condicaoVendaMetodoValoracaoCodigo'
      Size = 2
    end
    object qryRelatorioImpoa_condicaoVendaMetodoValoracaoNome: TStringField
      FieldName = 'a_condicaoVendaMetodoValoracaoNome'
      Origin = 'a_condicaoVendaMetodoValoracaoNome'
      Size = 100
    end
    object qryRelatorioImpoa_condicaoVendaMoedaCodigo: TStringField
      FieldName = 'a_condicaoVendaMoedaCodigo'
      Origin = 'a_condicaoVendaMoedaCodigo'
      Size = 3
    end
    object qryRelatorioImpoa_condicaoVendaMoedaNome: TStringField
      FieldName = 'a_condicaoVendaMoedaNome'
      Origin = 'a_condicaoVendaMoedaNome'
      Size = 50
    end
    object qryRelatorioImpoa_condicaoVendaValorMoeda: TFloatField
      FieldName = 'a_condicaoVendaValorMoeda'
      Origin = 'a_condicaoVendaValorMoeda'
    end
    object qryRelatorioImpoa_condicaoVendaValorReais: TFloatField
      FieldName = 'a_condicaoVendaValorReais'
      Origin = 'a_condicaoVendaValorReais'
    end
    object qryRelatorioImpoa_cideValorAliquotaEspecifica: TFloatField
      FieldName = 'a_cideValorAliquotaEspecifica'
      Origin = 'a_cideValorAliquotaEspecifica'
    end
    object qryRelatorioImpoa_cideValorDevido: TFloatField
      FieldName = 'a_cideValorDevido'
      Origin = 'a_cideValorDevido'
    end
    object qryRelatorioImpoa_cideValorRecolher: TFloatField
      FieldName = 'a_cideValorRecolher'
      Origin = 'a_cideValorRecolher'
    end
    object qryRelatorioImpoa_dcrCoeficienteReducao: TStringField
      FieldName = 'a_dcrCoeficienteReducao'
      Origin = 'a_dcrCoeficienteReducao'
      Size = 5
    end
    object qryRelatorioImpoa_dcrIdentificacao: TStringField
      FieldName = 'a_dcrIdentificacao'
      Origin = 'a_dcrIdentificacao'
      Size = 8
    end
    object qryRelatorioImpoa_dcrValorDevido: TFloatField
      FieldName = 'a_dcrValorDevido'
      Origin = 'a_dcrValorDevido'
    end
    object qryRelatorioImpoa_dcrValorDolar: TFloatField
      FieldName = 'a_dcrValorDolar'
      Origin = 'a_dcrValorDolar'
    end
    object qryRelatorioImpoa_dcrValorReal: TFloatField
      FieldName = 'a_dcrValorReal'
      Origin = 'a_dcrValorReal'
    end
    object qryRelatorioImpoa_dcrValorRecolher: TFloatField
      FieldName = 'a_dcrValorRecolher'
      Origin = 'a_dcrValorRecolher'
    end
    object qryRelatorioImpoa_valorMultaARecolher: TFloatField
      FieldName = 'a_valorMultaARecolher'
      Origin = 'a_valorMultaARecolher'
    end
    object qryRelatorioImpoa_valorMultaARecolherAjustado: TFloatField
      FieldName = 'a_valorMultaARecolherAjustado'
      Origin = 'a_valorMultaARecolherAjustado'
    end
    object qryRelatorioImpoa_valorReaisFreteInternacional: TFloatField
      FieldName = 'a_valorReaisFreteInternacional'
      Origin = 'a_valorReaisFreteInternacional'
    end
    object qryRelatorioImpoa_valorReaisSeguroInternacional: TFloatField
      FieldName = 'a_valorReaisSeguroInternacional'
      Origin = 'a_valorReaisSeguroInternacional'
    end
    object qryRelatorioImpoa_valorTotalCondicaoVenda: TFloatField
      FieldName = 'a_valorTotalCondicaoVenda'
      Origin = 'a_valorTotalCondicaoVenda'
    end
    object qryRelatorioImpoa_freteMoedaNegociadaCodigo: TStringField
      FieldName = 'a_freteMoedaNegociadaCodigo'
      Origin = 'a_freteMoedaNegociadaCodigo'
      Size = 3
    end
    object qryRelatorioImpoa_freteValorMoedaNegociada: TFloatField
      FieldName = 'a_freteValorMoedaNegociada'
      Origin = 'a_freteValorMoedaNegociada'
    end
    object qryRelatorioImpoa_freteValorReais: TFloatField
      FieldName = 'a_freteValorReais'
      Origin = 'a_freteValorReais'
    end
    object qryRelatorioImpoa_seguroMoedaNegociadaCodigo: TStringField
      FieldName = 'a_seguroMoedaNegociadaCodigo'
      Origin = 'a_seguroMoedaNegociadaCodigo'
      Size = 3
    end
    object qryRelatorioImpoa_seguroValorMoedaNegociada: TFloatField
      FieldName = 'a_seguroValorMoedaNegociada'
      Origin = 'a_seguroValorMoedaNegociada'
    end
    object qryRelatorioImpoa_seguroValorReais: TFloatField
      FieldName = 'a_seguroValorReais'
      Origin = 'a_seguroValorReais'
    end
    object qryRelatorioImpoa_iiAcordoTarifarioTipoCodigo: TStringField
      FieldName = 'a_iiAcordoTarifarioTipoCodigo'
      Origin = 'a_iiAcordoTarifarioTipoCodigo'
      Size = 1
    end
    object qryRelatorioImpoa_iiAliquotaAcordo: TFloatField
      FieldName = 'a_iiAliquotaAcordo'
      Origin = 'a_iiAliquotaAcordo'
    end
    object qryRelatorioImpoa_iiAliquotaAdValorem: TFloatField
      FieldName = 'a_iiAliquotaAdValorem'
      Origin = 'a_iiAliquotaAdValorem'
    end
    object qryRelatorioImpoa_iiAliquotaPercentualReducao: TFloatField
      FieldName = 'a_iiAliquotaPercentualReducao'
      Origin = 'a_iiAliquotaPercentualReducao'
    end
    object qryRelatorioImpoa_iiAliquotaReduzida: TFloatField
      FieldName = 'a_iiAliquotaReduzida'
      Origin = 'a_iiAliquotaReduzida'
    end
    object qryRelatorioImpoa_iiAliquotaValorCalculado: TFloatField
      FieldName = 'a_iiAliquotaValorCalculado'
      Origin = 'a_iiAliquotaValorCalculado'
    end
    object qryRelatorioImpoa_iiAliquotaValorDevido: TFloatField
      FieldName = 'a_iiAliquotaValorDevido'
      Origin = 'a_iiAliquotaValorDevido'
    end
    object qryRelatorioImpoa_iiAliquotaValorRecolher: TFloatField
      FieldName = 'a_iiAliquotaValorRecolher'
      Origin = 'a_iiAliquotaValorRecolher'
    end
    object qryRelatorioImpoa_iiAliquotaValorReduzido: TFloatField
      FieldName = 'a_iiAliquotaValorReduzido'
      Origin = 'a_iiAliquotaValorReduzido'
    end
    object qryRelatorioImpoa_iiBaseCalculo: TFloatField
      FieldName = 'a_iiBaseCalculo'
      Origin = 'a_iiBaseCalculo'
    end
    object qryRelatorioImpoa_iiFundamentoLegalCodigo: TStringField
      FieldName = 'a_iiFundamentoLegalCodigo'
      Origin = 'a_iiFundamentoLegalCodigo'
      Size = 2
    end
    object qryRelatorioImpoa_iiMotivoAdmissaoTemporariaCodigo: TStringField
      FieldName = 'a_iiMotivoAdmissaoTemporariaCodigo'
      Origin = 'a_iiMotivoAdmissaoTemporariaCodigo'
      Size = 2
    end
    object qryRelatorioImpoa_iiRegimeTributacaoCodigo: TStringField
      FieldName = 'a_iiRegimeTributacaoCodigo'
      Origin = 'a_iiRegimeTributacaoCodigo'
      Size = 1
    end
    object qryRelatorioImpoa_iiRegimeTributacaoNome: TStringField
      FieldName = 'a_iiRegimeTributacaoNome'
      Origin = 'a_iiRegimeTributacaoNome'
      Size = 50
    end
    object qryRelatorioImpoa_ipiAliquotaAdValorem: TFloatField
      FieldName = 'a_ipiAliquotaAdValorem'
      Origin = 'a_ipiAliquotaAdValorem'
    end
    object qryRelatorioImpoa_ipiAliquotaEspecificaCapacidadeRecipciente: TFloatField
      FieldName = 'a_ipiAliquotaEspecificaCapacidadeRecipciente'
      Origin = 'a_ipiAliquotaEspecificaCapacidadeRecipciente'
    end
    object qryRelatorioImpoa_ipiAliquotaEspecificaQuantidadeUnidadeMedida: TFloatField
      FieldName = 'a_ipiAliquotaEspecificaQuantidadeUnidadeMedida'
      Origin = 'a_ipiAliquotaEspecificaQuantidadeUnidadeMedida'
    end
    object qryRelatorioImpoa_ipiAliquotaEspecificaTipoRecipienteCodigo: TFloatField
      FieldName = 'a_ipiAliquotaEspecificaTipoRecipienteCodigo'
      Origin = 'a_ipiAliquotaEspecificaTipoRecipienteCodigo'
    end
    object qryRelatorioImpoa_ipiAliquotaEspecificaValorUnidadeMedida: TFloatField
      FieldName = 'a_ipiAliquotaEspecificaValorUnidadeMedida'
      Origin = 'a_ipiAliquotaEspecificaValorUnidadeMedida'
    end
    object qryRelatorioImpoa_ipiAliquotaNotaComplementarTIPI: TFloatField
      FieldName = 'a_ipiAliquotaNotaComplementarTIPI'
      Origin = 'a_ipiAliquotaNotaComplementarTIPI'
    end
    object qryRelatorioImpoa_ipiAliquotaReduzida: TFloatField
      FieldName = 'a_ipiAliquotaReduzida'
      Origin = 'a_ipiAliquotaReduzida'
    end
    object qryRelatorioImpoa_ipiAliquotaValorDevido: TFloatField
      FieldName = 'a_ipiAliquotaValorDevido'
      Origin = 'a_ipiAliquotaValorDevido'
    end
    object qryRelatorioImpoa_ipiAliquotaValorRecolher: TFloatField
      FieldName = 'a_ipiAliquotaValorRecolher'
      Origin = 'a_ipiAliquotaValorRecolher'
    end
    object qryRelatorioImpoa_ipiRegimeTributacaoCodigo: TStringField
      FieldName = 'a_ipiRegimeTributacaoCodigo'
      Origin = 'a_ipiRegimeTributacaoCodigo'
      Size = 1
    end
    object qryRelatorioImpoa_ipiRegimeTributacaoNome: TStringField
      FieldName = 'a_ipiRegimeTributacaoNome'
      Origin = 'a_ipiRegimeTributacaoNome'
      Size = 50
    end
    object qryRelatorioImpoa_cofinsAliquotaAdValorem: TFloatField
      FieldName = 'a_cofinsAliquotaAdValorem'
      Origin = 'a_cofinsAliquotaAdValorem'
    end
    object qryRelatorioImpoa_cofinsAliquotaEspecificaQuantidadeUnidade: TFloatField
      FieldName = 'a_cofinsAliquotaEspecificaQuantidadeUnidade'
      Origin = 'a_cofinsAliquotaEspecificaQuantidadeUnidade'
    end
    object qryRelatorioImpoa_cofinsAliquotaEspecificaValor: TFloatField
      FieldName = 'a_cofinsAliquotaEspecificaValor'
      Origin = 'a_cofinsAliquotaEspecificaValor'
    end
    object qryRelatorioImpoa_cofinsAliquotaReduzida: TFloatField
      FieldName = 'a_cofinsAliquotaReduzida'
      Origin = 'a_cofinsAliquotaReduzida'
    end
    object qryRelatorioImpoa_cofinsAliquotaValorDevido: TFloatField
      FieldName = 'a_cofinsAliquotaValorDevido'
      Origin = 'a_cofinsAliquotaValorDevido'
    end
    object qryRelatorioImpoa_cofinsAliquotaValorRecolher: TFloatField
      FieldName = 'a_cofinsAliquotaValorRecolher'
      Origin = 'a_cofinsAliquotaValorRecolher'
    end
    object qryRelatorioImpoa_pisCofinsBaseCalculoAliquotaICMS: TFloatField
      FieldName = 'a_pisCofinsBaseCalculoAliquotaICMS'
      Origin = 'a_pisCofinsBaseCalculoAliquotaICMS'
    end
    object qryRelatorioImpoa_pisCofinsBaseCalculoFundamentoLegalCodigo: TFloatField
      FieldName = 'a_pisCofinsBaseCalculoFundamentoLegalCodigo'
      Origin = 'a_pisCofinsBaseCalculoFundamentoLegalCodigo'
    end
    object qryRelatorioImpoa_pisCofinsBaseCalculoPercentualReducao: TFloatField
      FieldName = 'a_pisCofinsBaseCalculoPercentualReducao'
      Origin = 'a_pisCofinsBaseCalculoPercentualReducao'
    end
    object qryRelatorioImpoa_pisCofinsBaseCalculoValor: TFloatField
      FieldName = 'a_pisCofinsBaseCalculoValor'
      Origin = 'a_pisCofinsBaseCalculoValor'
    end
    object qryRelatorioImpoa_pisCofinsFundamentoLegalReducaoCodigo: TStringField
      FieldName = 'a_pisCofinsFundamentoLegalReducaoCodigo'
      Origin = 'a_pisCofinsFundamentoLegalReducaoCodigo'
      Size = 2
    end
    object qryRelatorioImpoa_pisCofinsRegimeTributacaoCodigo: TStringField
      FieldName = 'a_pisCofinsRegimeTributacaoCodigo'
      Origin = 'a_pisCofinsRegimeTributacaoCodigo'
      Size = 1
    end
    object qryRelatorioImpoa_pisCofinsRegimeTributacaoNome: TStringField
      FieldName = 'a_pisCofinsRegimeTributacaoNome'
      Origin = 'a_pisCofinsRegimeTributacaoNome'
      Size = 50
    end
    object qryRelatorioImpoa_pisPasepAliquotaAdValorem: TFloatField
      FieldName = 'a_pisPasepAliquotaAdValorem'
      Origin = 'a_pisPasepAliquotaAdValorem'
    end
    object qryRelatorioImpoa_pisPasepAliquotaEspecificaQuantidadeUnidade: TFloatField
      FieldName = 'a_pisPasepAliquotaEspecificaQuantidadeUnidade'
      Origin = 'a_pisPasepAliquotaEspecificaQuantidadeUnidade'
    end
    object qryRelatorioImpoa_pisPasepAliquotaEspecificaValor: TFloatField
      FieldName = 'a_pisPasepAliquotaEspecificaValor'
      Origin = 'a_pisPasepAliquotaEspecificaValor'
    end
    object qryRelatorioImpoa_pisPasepAliquotaReduzida: TFloatField
      FieldName = 'a_pisPasepAliquotaReduzida'
      Origin = 'a_pisPasepAliquotaReduzida'
    end
    object qryRelatorioImpoa_pisPasepAliquotaValorDevido: TFloatField
      FieldName = 'a_pisPasepAliquotaValorDevido'
      Origin = 'a_pisPasepAliquotaValorDevido'
    end
    object qryRelatorioImpoa_pisPasepAliquotaValorRecolher: TFloatField
      FieldName = 'a_pisPasepAliquotaValorRecolher'
      Origin = 'a_pisPasepAliquotaValorRecolher'
    end
    object qryRelatorioImpoa_condicaoVendaIncoterm: TStringField
      FieldName = 'a_condicaoVendaIncoterm'
      Origin = 'a_condicaoVendaIncoterm'
      Size = 3
    end
    object qryRelatorioImpoa_fabricanteNome: TStringField
      FieldName = 'a_fabricanteNome'
      Origin = 'a_fabricanteNome'
      Size = 100
    end
    object qryRelatorioImpoa_fabricanteCidade: TStringField
      FieldName = 'a_fabricanteCidade'
      Origin = 'a_fabricanteCidade'
      Size = 30
    end
    object qryRelatorioImpoa_fabricanteComplemento: TStringField
      FieldName = 'a_fabricanteComplemento'
      Origin = 'a_fabricanteComplemento'
      Size = 50
    end
    object qryRelatorioImpoa_fabricanteEstado: TStringField
      FieldName = 'a_fabricanteEstado'
      Origin = 'a_fabricanteEstado'
      Size = 50
    end
    object qryRelatorioImpoa_fabricanteLogradouro: TStringField
      FieldName = 'a_fabricanteLogradouro'
      Origin = 'a_fabricanteLogradouro'
      Size = 50
    end
    object qryRelatorioImpoa_fabricanteNumero: TStringField
      FieldName = 'a_fabricanteNumero'
      Origin = 'a_fabricanteNumero'
      Size = 7
    end
    object qryRelatorioImpoa_numeroDestaque: TStringField
      FieldName = 'a_numeroDestaque'
      Origin = 'a_numeroDestaque'
      Size = 3
    end
    object qryRelatorioImpoi_descricaoMercadoria: TMemoField
      FieldName = 'i_descricaoMercadoria'
      Origin = 'i_descricaoMercadoria'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryRelatorioImpoi_numeroSequencialItem: TStringField
      FieldName = 'i_numeroSequencialItem'
      Origin = 'i_numeroSequencialItem'
      Size = 2
    end
    object qryRelatorioImpoi_quantidade: TFloatField
      FieldName = 'i_quantidade'
      Origin = 'i_quantidade'
    end
    object qryRelatorioImpoi_unidadeMedida: TStringField
      FieldName = 'i_unidadeMedida'
      Origin = 'i_unidadeMedida'
    end
    object qryRelatorioImpoi_valorUnitario: TFloatField
      FieldName = 'i_valorUnitario'
      Origin = 'i_valorUnitario'
    end
    object qryRelatorioImpoi_vmle: TFloatField
      FieldName = 'i_vmle'
      Origin = 'i_vmle'
    end
    object qryRelatorioImpoi_quantidadeEstatistica: TFloatField
      FieldName = 'i_quantidadeEstatistica'
      Origin = 'i_quantidadeEstatistica'
    end
  end
  object dtsRelatorioImpo: TDataSource
    DataSet = qryRelatorioImpo
    Left = 32
    Top = 386
  end
  object qrySelectCertificados: TFDQuery
    Connection = dbBroker
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      'SELECT * FROM CertificadoDespachante ORDER BY OrdemConsulta')
    Left = 144
    Top = 16
    object qrySelectCertificadosCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
    end
    object qrySelectCertificadosNomeDespachante: TStringField
      FieldName = 'NomeDespachante'
      Origin = 'NomeDespachante'
      Required = True
      Size = 50
    end
    object qrySelectCertificadosNomeArquivo: TStringField
      FieldName = 'NomeArquivo'
      Origin = 'NomeArquivo'
      Required = True
      Size = 30
    end
    object qrySelectCertificadosOrdemConsulta: TIntegerField
      FieldName = 'OrdemConsulta'
      Origin = 'OrdemConsulta'
    end
    object qrySelectCertificadosVencimento: TSQLTimeStampField
      FieldName = 'Vencimento'
      Origin = 'Vencimento'
    end
  end
  object dtsCadDespachantes: TDataSource
    DataSet = qryCadDespachantes
    Left = 272
    Top = 14
  end
  object qryCadDespachantes: TFDQuery
    Connection = dbBroker
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      'SELECT * FROM CertificadoDespachante')
    Left = 384
    Top = 14
    object qryCadDespachantesCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
    end
    object qryCadDespachantesNomeDespachante: TStringField
      FieldName = 'NomeDespachante'
      Origin = 'NomeDespachante'
      Required = True
      Size = 50
    end
    object qryCadDespachantesNomeArquivo: TStringField
      FieldName = 'NomeArquivo'
      Origin = 'NomeArquivo'
      Required = True
      Size = 30
    end
    object qryCadDespachantesOrdemConsulta: TIntegerField
      FieldName = 'OrdemConsulta'
      Origin = 'OrdemConsulta'
    end
    object qryCadDespachantesVencimento: TSQLTimeStampField
      FieldName = 'Vencimento'
      Origin = 'Vencimento'
    end
  end
  object qryHistoricoDi: TFDQuery
    Connection = dbBroker
    Left = 199
    Top = 317
  end
  object qryDeleteDi: TFDQuery
    Connection = dbBroker
    Left = 112
    Top = 319
  end
  object qryHistoricoDue: TFDQuery
    Connection = dbBroker
    Left = 302
    Top = 87
  end
  object qryDeleteDue: TFDQuery
    Connection = dbBroker
    Left = 142
    Top = 88
  end
  object qryDeleteDueFila: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      
        'DELETE FROM ExpoDueImportadaControle WHERE DataDueImportada IS N' +
        'ULL')
    Left = 205
    Top = 142
  end
  object qrySelectDeleteDue: TFDQuery
    Connection = dbBroker
    Left = 51
    Top = 88
  end
end
