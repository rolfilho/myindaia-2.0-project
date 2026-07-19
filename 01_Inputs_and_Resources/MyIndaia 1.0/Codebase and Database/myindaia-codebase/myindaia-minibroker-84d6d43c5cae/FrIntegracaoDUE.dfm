inherited formIntegracaoDue: TformIntegracaoDue
  Caption = 'Integracao Due'
  ClientHeight = 739
  ClientWidth = 1112
  WindowState = wsNormal
  OnActivate = FormActivate
  ExplicitWidth = 1128
  ExplicitHeight = 778
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1021
    Height = 739
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object SplitterDetail: TSplitter
      Left = 0
      Top = 217
      Width = 1021
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Color = 16758122
      ParentColor = False
      ExplicitLeft = 1
      ExplicitTop = 289
      ExplicitWidth = 815
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 1021
      Height = 217
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 20
      Padding.Top = 30
      Padding.Right = 20
      Padding.Bottom = 40
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 24
        Top = 12
        Width = 23
        Height = 13
        Caption = 'XML:'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object txtXML: TMemo
        Left = 20
        Top = 30
        Width = 981
        Height = 147
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = txtXMLDblClick
      end
      object chkCienteAlerta: TCheckBox
        Left = 20
        Top = 189
        Width = 953
        Height = 17
        Caption = 
          'Estou ciente dos alertas "n'#227'o impeditivos de registro" e desejo ' +
          'confirmar a transmiss'#227'o da Due.'
        TabOrder = 1
        OnClick = chkCienteAlertaClick
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 221
      Width = 1021
      Height = 518
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 20
      Padding.Top = 30
      Padding.Right = 20
      Padding.Bottom = 20
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 10
        Width = 49
        Height = 13
        Caption = 'Resposta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 20
        Top = 30
        Width = 981
        Height = 468
        Align = alClient
        BevelOuter = bvNone
        BiDiMode = bdRightToLeftNoAlign
        BorderWidth = 1
        Color = clBtnShadow
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 0
        object webBrowserOutput: TWebBrowser
          Left = 1
          Top = 1
          Width = 979
          Height = 466
          Align = alClient
          DragMode = dmAutomatic
          TabOrder = 0
          ExplicitWidth = 300
          ExplicitHeight = 150
          ControlData = {
            4C0000002F6500002A3000000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 1021
    Top = 0
    Width = 91
    Height = 739
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      91
      739)
    object btnConectar: TButton
      Left = 3
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Conectar'
      TabOrder = 0
      OnClick = btnConectarClick
    end
    object btnEnviar: TButton
      Left = 6
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Enviar'
      Default = True
      TabOrder = 1
      OnClick = btnEnviarClick
    end
    object Button1: TButton
      Left = 3
      Top = 141
      Width = 75
      Height = 25
      Caption = 'teste'
      TabOrder = 2
      Visible = False
      OnClick = Button1Click
    end
  end
  object idHttp: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 824
    Top = 192
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 2
    Left = 856
    Top = 216
  end
  object XMLDocument1: TXMLDocument
    Left = 713
    Top = 345
  end
  object adsProcessoExp: TAureliusDataset
    DatasetField = adsProcessoProcessoExp
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdAgente'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdViaTransporte'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CdTransportadora'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdSeguradora'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CdRepresentante'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CdLocalOrigem'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdLocalDestino'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdTipoFrete'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DtRegistroPedido'
        DataType = ftDateTime
      end
      item
        Name = 'VlFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'VlPesoLiquido'
        DataType = ftFloat
      end
      item
        Name = 'VlDesconto'
        DataType = ftFloat
      end
      item
        Name = 'VlComissaoPercent'
        DataType = ftFloat
      end
      item
        Name = 'VlTotMcv'
        DataType = ftFloat
      end
      item
        Name = 'VlTotExw'
        DataType = ftFloat
      end
      item
        Name = 'InDue'
        DataType = ftBoolean
      end
      item
        Name = 'InRecAlfandegadoDespacho'
        DataType = ftBoolean
      end
      item
        Name = 'NmRefEndRecAlfandDespacho'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'InUmEnquadPorProc'
        DataType = ftBoolean
      end
      item
        Name = 'TxInformacoesAdicionais'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CdStatusDue'
        DataType = ftInteger
      end
      item
        Name = 'DtEnvioDue'
        DataType = ftDateTime
      end
      item
        Name = 'CdChaveAcessoDue'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'InTipoDocumentoDue'
        DataType = ftInteger
      end
      item
        Name = 'NrProcesssoAdmImp'
        DataType = ftString
        Size = 17
      end
      item
        Name = 'TxMotivoRetificacao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'QtDiasPrazoValidadeExpTemp'
        DataType = ftInteger
      end
      item
        Name = 'InRecAlfandegadoEmbarque'
        DataType = ftBoolean
      end
      item
        Name = 'NmRefEndRecAlfandEmbarque'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Incoterm'
        DataType = ftVariant
      end
      item
        Name = 'Incoterm.Codigo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Incoterm.Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Incoterm.Sinal'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Incoterm.InTipoFrete'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PaisDestino'
        DataType = ftVariant
      end
      item
        Name = 'PaisDestino.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PaisDestino.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'PaisDestino.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Moeda'
        DataType = ftVariant
      end
      item
        Name = 'Moeda.CdMoeda'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Moeda.NmMoeda'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Moeda.ApMoeda'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Moeda.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'UrfDespacho'
        DataType = ftVariant
      end
      item
        Name = 'UrfDespacho.Codigo'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'UrfDespacho.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'UrfDespacho.CdDigito'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'UrfDespacho.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UrfDestino'
        DataType = ftVariant
      end
      item
        Name = 'UrfDestino.Codigo'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'UrfDestino.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'UrfDestino.CdDigito'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'UrfDestino.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'RecAlfandegadoDespacho'
        DataType = ftVariant
      end
      item
        Name = 'RecAlfandegadoDespacho.Codigo'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'RecAlfandegadoDespacho.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'RecAlfandegadoDespacho.CodOrgaoRec'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'RecAlfandegadoEmbarque'
        DataType = ftVariant
      end
      item
        Name = 'RecAlfandegadoEmbarque.Codigo'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'RecAlfandegadoEmbarque.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'RecAlfandegadoEmbarque.CodOrgaoRec'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Exportador'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'Exportador.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Exportador.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Exportador.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Exportador.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Exportador.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Exportador.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Exportador.EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Exportador.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Exportador.EndCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Exportador.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Exportador.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Exportador.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Exportador.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Exportador.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Exportador.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Exportador.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.CdPaisImportador'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Exportador.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.EndCompl'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Exportador.EndComplemento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EnquadOp'
        DataType = ftVariant
      end
      item
        Name = 'EnquadOp.CdEnquadOp'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'EnquadOp.NmEnquadOp'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EnquadOp.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Despachante'
        DataType = ftVariant
      end
      item
        Name = 'Despachante.CdDespachante'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Despachante.NmDespachante'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Despachante.ApDespachante'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Despachante.VlMinSda'
        DataType = ftFloat
      end
      item
        Name = 'Despachante.VlMaxSda'
        DataType = ftFloat
      end
      item
        Name = 'Despachante.CdRisc'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Despachante.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Despachante.CdModSda'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Despachante.NrRegistro'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Despachante.CpfDespachante'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Despachante.CdDespSda'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Despachante.CdProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Despachante.NmSenha'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Despachante.InConsultaSiscomex'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Despachante.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Despachante.DtSenha'
        DataType = ftDateTime
      end
      item
        Name = 'Processo'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'Processo.NrProcesso'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Processo.DtAbertura'
        DataType = ftDateTime
      end
      item
        Name = 'Processo.InCancelado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.VlMleMneg'
        DataType = ftFloat
      end
      item
        Name = 'Processo.VlFretePrepaidMneg'
        DataType = ftFloat
      end
      item
        Name = 'Processo.VlSeguroMn'
        DataType = ftFloat
      end
      item
        Name = 'Processo.NrProcessoExpTemp'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Processo.VlPesoLiquido'
        DataType = ftFloat
      end
      item
        Name = 'Processo.VlPesoBruto'
        DataType = ftFloat
      end
      item
        Name = 'Processo.TpProcesso'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.TpFrete'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.NrFatura'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.CdRuc'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Processo.CdDue'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.VlDescontoMn'
        DataType = ftFloat
      end
      item
        Name = 'Processo.VlAcrescimoMn'
        DataType = ftFloat
      end
      item
        Name = 'Processo.InProcessoConsolidado'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.UnidNeg'
        DataType = ftVariant
      end
      item
        Name = 'Processo.UnidNeg.CdUnidNeg'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.UnidNeg.NmUnidNeg'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.UnidNeg.ApUnidNeg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.UnidNeg.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Produto'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Produto.CdProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Produto.NmProduto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Processo.Produto.ApProduto'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Produto.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Produto.CdViatransp'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Cliente'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Cliente.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Processo.Cliente.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Processo.Cliente.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Cliente.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.Cliente.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Processo.Cliente.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Cliente.EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Cliente.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Cliente.EndCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Processo.Cliente.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Cliente.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.Cliente.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Processo.Cliente.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Processo.Cliente.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Cliente.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Cliente.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Cliente.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Cliente.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Cliente.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Cliente.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Cliente.CdPaisImportador'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Cliente.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Cliente.EndCompl'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.Cliente.EndComplemento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Processo.Servico'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Servico.CdServico'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Servico.NmServico'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.Servico.CdClassificacao'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Servico.CdViaTransporte'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Servico.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Servico.InCheck'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Usuario'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Usuario.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.Usuario.CdSenha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Usuario.CdCargo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Usuario.NmUsuario'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.Usuario.ApUsuario'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Processo.Usuario.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Usuario.NmEmail'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'Processo.MoedaMle'
        DataType = ftVariant
      end
      item
        Name = 'Processo.MoedaMle.CdMoeda'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.MoedaMle.NmMoeda'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.MoedaMle.ApMoeda'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Processo.MoedaMle.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.PaisDestino'
        DataType = ftVariant
      end
      item
        Name = 'Processo.PaisDestino.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.PaisDestino.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Processo.PaisDestino.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Despachante'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Despachante.CdDespachante'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Despachante.NmDespachante'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.Despachante.ApDespachante'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Despachante.VlMinSda'
        DataType = ftFloat
      end
      item
        Name = 'Processo.Despachante.VlMaxSda'
        DataType = ftFloat
      end
      item
        Name = 'Processo.Despachante.CdRisc'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Despachante.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Despachante.CdModSda'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Despachante.NrRegistro'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Processo.Despachante.CpfDespachante'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Processo.Despachante.CdDespSda'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Processo.Despachante.CdProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Despachante.NmSenha'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Processo.Despachante.InConsultaSiscomex'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Despachante.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.Despachante.DtSenha'
        DataType = ftDateTime
      end
      item
        Name = 'Processo.Incoterm'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Incoterm.Codigo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Incoterm.Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Processo.Incoterm.Sinal'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Incoterm.InTipoFrete'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Exportador'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Exportador.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Processo.Exportador.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Processo.Exportador.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Exportador.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.Exportador.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Processo.Exportador.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Exportador.EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Exportador.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Exportador.EndCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Processo.Exportador.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Exportador.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.Exportador.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Processo.Exportador.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Processo.Exportador.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Exportador.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Exportador.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Exportador.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Exportador.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Exportador.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Exportador.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Exportador.CdPaisImportador'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.Exportador.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Exportador.EndCompl'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.Exportador.EndComplemento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Processo.Importador'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Importador.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Processo.Importador.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Importador.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Importador.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Importador.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Processo.Importador.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Processo.Importador.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Importador.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Importador.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Importador.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Importador.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Importador.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Importador.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Importador.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Importador.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Processo.Importador.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Importador.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.Importador.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Importador.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Importador.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Importador.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Processo.ProcessoExp'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'Importador'
        DataType = ftVariant
      end
      item
        Name = 'Importador.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Importador.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Importador.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Importador.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Importador.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Importador.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Importador.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Importador.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Importador.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Importador.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Importador.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Importador.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Importador.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Importador.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Importador.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Importador.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Importador.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Importador.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Importador.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Importador.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Importador.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Importador.Pais.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Importador.Pais.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Importador.Pais.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end>
    SubpropsDepth = 2
    Left = 530
    Top = 92
    DesignClass = 'MyEntitiesBroker.TTprocessoExp'
    object adsProcessoExpSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcessoExpCdImportador: TStringField
      FieldName = 'CdImportador'
      Size = 5
    end
    object adsProcessoExpCdAgente: TStringField
      FieldName = 'CdAgente'
      Size = 4
    end
    object adsProcessoExpCdViaTransporte: TStringField
      FieldName = 'CdViaTransporte'
      Size = 2
    end
    object adsProcessoExpCdTransportadora: TStringField
      FieldName = 'CdTransportadora'
      Size = 4
    end
    object adsProcessoExpCdSeguradora: TStringField
      FieldName = 'CdSeguradora'
      Size = 5
    end
    object adsProcessoExpCdRepresentante: TStringField
      FieldName = 'CdRepresentante'
      Size = 5
    end
    object adsProcessoExpCdLocalOrigem: TStringField
      FieldName = 'CdLocalOrigem'
      Size = 4
    end
    object adsProcessoExpCdLocalDestino: TStringField
      FieldName = 'CdLocalDestino'
      Size = 4
    end
    object adsProcessoExpDtRegistroPedido: TDateTimeField
      FieldName = 'DtRegistroPedido'
    end
    object adsProcessoExpVlFrete: TFloatField
      FieldName = 'VlFrete'
    end
    object adsProcessoExpVlSeguro: TFloatField
      FieldName = 'VlSeguro'
    end
    object adsProcessoExpVlPesoLiquido: TFloatField
      FieldName = 'VlPesoLiquido'
    end
    object adsProcessoExpVlDesconto: TFloatField
      FieldName = 'VlDesconto'
    end
    object adsProcessoExpVlComissaoPercent: TFloatField
      FieldName = 'VlComissaoPercent'
    end
    object adsProcessoExpVlTotMcv: TFloatField
      FieldName = 'VlTotMcv'
    end
    object adsProcessoExpVlTotExw: TFloatField
      FieldName = 'VlTotExw'
    end
    object adsProcessoExpInDue: TBooleanField
      FieldName = 'InDue'
    end
    object adsProcessoExpInRecAlfandegadoDespacho: TBooleanField
      FieldName = 'InRecAlfandegadoDespacho'
    end
    object adsProcessoExpNmRefEndRecAlfandDespacho: TStringField
      FieldName = 'NmRefEndRecAlfandDespacho'
      Size = 200
    end
    object adsProcessoExpInRecAlfandegadoEmbarque: TBooleanField
      FieldName = 'InRecAlfandegadoEmbarque'
    end
    object adsProcessoExpNmRefEndRecAlfandEmbarque: TStringField
      FieldName = 'NmRefEndRecAlfandEmbarque'
      Size = 200
    end
    object adsProcessoExpInUmEnquadPorProc: TBooleanField
      FieldName = 'InUmEnquadPorProc'
    end
    object adsProcessoExpTxInformacoesAdicionais: TStringField
      DisplayWidth = 1500
      FieldName = 'TxInformacoesAdicionais'
      Size = 1500
    end
    object adsProcessoExpCdStatusDue: TIntegerField
      FieldName = 'CdStatusDue'
    end
    object adsProcessoExpDtEnvioDue: TDateTimeField
      FieldName = 'DtEnvioDue'
    end
    object adsProcessoExpCdChaveAcessoDue: TStringField
      FieldName = 'CdChaveAcessoDue'
    end
    object adsProcessoExpIncoterm: TAureliusEntityField
      FieldName = 'Incoterm'
    end
    object adsProcessoExpIncotermCodigo: TStringField
      FieldName = 'Incoterm.Codigo'
      Size = 3
    end
    object adsProcessoExpIncotermDescricao: TStringField
      FieldName = 'Incoterm.Descricao'
      Size = 60
    end
    object adsProcessoExpIncotermSinal: TStringField
      FieldName = 'Incoterm.Sinal'
      Size = 1
    end
    object adsProcessoExpIncotermInTipoFrete: TStringField
      FieldName = 'Incoterm.InTipoFrete'
      Size = 2
    end
    object adsProcessoExpPaisDestino: TAureliusEntityField
      FieldName = 'PaisDestino'
    end
    object adsProcessoExpPaisDestinoCdPais: TStringField
      FieldName = 'PaisDestino.CdPais'
      Size = 3
    end
    object adsProcessoExpPaisDestinoNmPais: TStringField
      FieldName = 'PaisDestino.NmPais'
      Size = 120
    end
    object adsProcessoExpPaisDestinoNmSiglaCrt: TStringField
      FieldName = 'PaisDestino.NmSiglaCrt'
      Size = 2
    end
    object adsProcessoExpMoeda: TAureliusEntityField
      FieldName = 'Moeda'
    end
    object adsProcessoExpMoedaCdMoeda: TStringField
      FieldName = 'Moeda.CdMoeda'
      Size = 3
    end
    object adsProcessoExpMoedaNmMoeda: TStringField
      FieldName = 'Moeda.NmMoeda'
      Size = 30
    end
    object adsProcessoExpMoedaApMoeda: TStringField
      FieldName = 'Moeda.ApMoeda'
      Size = 6
    end
    object adsProcessoExpMoedaInAtivo: TStringField
      FieldName = 'Moeda.InAtivo'
      Size = 1
    end
    object adsProcessoExpMoedaCdMoedaScx: TStringField
      FieldName = 'Moeda.CdMoedaScx'
      Size = 3
    end
    object adsProcessoExpMoedaNmMoedaSing: TStringField
      FieldName = 'Moeda.NmMoedaSing'
    end
    object adsProcessoExpMoedaNmMoedaPlural: TStringField
      FieldName = 'Moeda.NmMoedaPlural'
    end
    object adsProcessoExpMoedaNmCentavosSing: TStringField
      FieldName = 'Moeda.NmCentavosSing'
    end
    object adsProcessoExpMoedaNmCentavosPlural: TStringField
      FieldName = 'Moeda.NmCentavosPlural'
    end
    object adsProcessoExpMoedaApMoedaIngles: TStringField
      FieldName = 'Moeda.ApMoedaIngles'
      Size = 6
    end
    object adsProcessoExpMoedaNmMoedaSingIng: TStringField
      FieldName = 'Moeda.NmMoedaSingIng'
    end
    object adsProcessoExpMoedaNmMoedaPluralIng: TStringField
      FieldName = 'Moeda.NmMoedaPluralIng'
    end
    object adsProcessoExpMoedaNmCentavosSingIng: TStringField
      FieldName = 'Moeda.NmCentavosSingIng'
    end
    object adsProcessoExpMoedaNmCentavosPluralIng: TStringField
      FieldName = 'Moeda.NmCentavosPluralIng'
    end
    object adsProcessoExpMoedaNmMoedaSingEsp: TStringField
      FieldName = 'Moeda.NmMoedaSingEsp'
    end
    object adsProcessoExpMoedaNmMoedaPluralEsp: TStringField
      FieldName = 'Moeda.NmMoedaPluralEsp'
    end
    object adsProcessoExpMoedaNmCentavosSingEsp: TStringField
      FieldName = 'Moeda.NmCentavosSingEsp'
    end
    object adsProcessoExpMoedaNmCentavosPluralEsp: TStringField
      FieldName = 'Moeda.NmCentavosPluralEsp'
    end
    object adsProcessoExpUrfDespacho: TAureliusEntityField
      FieldName = 'UrfDespacho'
    end
    object adsProcessoExpUrfDespachoCodigo: TStringField
      FieldName = 'UrfDespacho.Codigo'
      Size = 7
    end
    object adsProcessoExpUrfDespachoDescricao: TStringField
      FieldName = 'UrfDespacho.Descricao'
      Size = 120
    end
    object adsProcessoExpUrfDespachoCdDigito: TStringField
      FieldName = 'UrfDespacho.CdDigito'
      Size = 1
    end
    object adsProcessoExpUrfDespachoEndUf: TStringField
      FieldName = 'UrfDespacho.EndUf'
      Size = 2
    end
    object adsProcessoExpUrfDestino: TAureliusEntityField
      FieldName = 'UrfDestino'
    end
    object adsProcessoExpUrfDestinoCodigo: TStringField
      FieldName = 'UrfDestino.Codigo'
      Size = 7
    end
    object adsProcessoExpUrfDestinoDescricao: TStringField
      FieldName = 'UrfDestino.Descricao'
      Size = 120
    end
    object adsProcessoExpUrfDestinoCdDigito: TStringField
      FieldName = 'UrfDestino.CdDigito'
      Size = 1
    end
    object adsProcessoExpUrfDestinoEndUf: TStringField
      FieldName = 'UrfDestino.EndUf'
      Size = 2
    end
    object adsProcessoExpRecAlfandegadoDespacho: TAureliusEntityField
      FieldName = 'RecAlfandegadoDespacho'
    end
    object adsProcessoExpRecAlfandegadoDespachoCodigo: TStringField
      FieldName = 'RecAlfandegadoDespacho.Codigo'
      Size = 7
    end
    object adsProcessoExpRecAlfandegadoDespachoDescricao: TStringField
      FieldName = 'RecAlfandegadoDespacho.Descricao'
      Size = 120
    end
    object adsProcessoExpRecAlfandegadoDespachoCodOrgaoRec: TStringField
      FieldName = 'RecAlfandegadoDespacho.CodOrgaoRec'
      Size = 7
    end
    object adsProcessoExpRecAlfandegadoEmbarque: TAureliusEntityField
      FieldName = 'RecAlfandegadoEmbarque'
    end
    object adsProcessoExpRecAlfandegadoEmbarqueCodigo: TStringField
      FieldName = 'RecAlfandegadoEmbarque.Codigo'
      Size = 7
    end
    object adsProcessoExpRecAlfandegadoEmbarqueDescricao: TStringField
      FieldName = 'RecAlfandegadoEmbarque.Descricao'
      Size = 120
    end
    object adsProcessoExpRecAlfandegadoEmbarqueCodOrgaoRec: TStringField
      FieldName = 'RecAlfandegadoEmbarque.CodOrgaoRec'
      Size = 7
    end
    object adsProcessoExpExportador: TAureliusEntityField
      FieldName = 'Exportador'
      Required = True
    end
    object adsProcessoExpExportadorCdEmpresa: TStringField
      FieldName = 'Exportador.CdEmpresa'
      Size = 5
    end
    object adsProcessoExpExportadorNmEmpresa: TStringField
      FieldName = 'Exportador.NmEmpresa'
      Size = 80
    end
    object adsProcessoExpExportadorApEmpresa: TStringField
      FieldName = 'Exportador.ApEmpresa'
      Size = 10
    end
    object adsProcessoExpExportadorEndEmpresa: TStringField
      FieldName = 'Exportador.EndEmpresa'
      Size = 50
    end
    object adsProcessoExpExportadorCdTipoPessoa: TStringField
      FieldName = 'Exportador.CdTipoPessoa'
      Size = 1
    end
    object adsProcessoExpExportadorCgcEmpresa: TStringField
      FieldName = 'Exportador.CgcEmpresa'
      Size = 14
    end
    object adsProcessoExpExportadorCpfEmpresa: TStringField
      FieldName = 'Exportador.CpfEmpresa'
      Size = 11
    end
    object adsProcessoExpExportadorIeEmpresa: TStringField
      FieldName = 'Exportador.IeEmpresa'
    end
    object adsProcessoExpExportadorInCliente: TBooleanField
      FieldName = 'Exportador.InCliente'
    end
    object adsProcessoExpExportadorInImportador: TBooleanField
      FieldName = 'Exportador.InImportador'
    end
    object adsProcessoExpExportadorInExportador: TBooleanField
      FieldName = 'Exportador.InExportador'
    end
    object adsProcessoExpExportadorInOutros: TBooleanField
      FieldName = 'Exportador.InOutros'
    end
    object adsProcessoExpExportadorCdGrupo: TStringField
      FieldName = 'Exportador.CdGrupo'
      Size = 3
    end
    object adsProcessoExpExportadorInRepresentante: TBooleanField
      FieldName = 'Exportador.InRepresentante'
    end
    object adsProcessoExpExportadorInSeguradora: TBooleanField
      FieldName = 'Exportador.InSeguradora'
    end
    object adsProcessoExpEnquadOp: TAureliusEntityField
      FieldName = 'EnquadOp'
    end
    object adsProcessoExpEnquadOpCdEnquadOp: TStringField
      FieldName = 'EnquadOp.CdEnquadOp'
      Size = 5
    end
    object adsProcessoExpEnquadOpNmEnquadOp: TStringField
      FieldName = 'EnquadOp.NmEnquadOp'
      Size = 60
    end
    object adsProcessoExpEnquadOpInAtivo: TStringField
      FieldName = 'EnquadOp.InAtivo'
      Size = 1
    end
    object adsProcessoExpDespachante: TAureliusEntityField
      FieldName = 'Despachante'
    end
    object adsProcessoExpDespachanteCdDespachante: TStringField
      FieldName = 'Despachante.CdDespachante'
      Size = 3
    end
    object adsProcessoExpDespachanteNmDespachante: TStringField
      FieldName = 'Despachante.NmDespachante'
      Size = 50
    end
    object adsProcessoExpDespachanteApDespachante: TStringField
      FieldName = 'Despachante.ApDespachante'
      Size = 10
    end
    object adsProcessoExpDespachanteVlMinSda: TFloatField
      FieldName = 'Despachante.VlMinSda'
    end
    object adsProcessoExpDespachanteVlMaxSda: TFloatField
      FieldName = 'Despachante.VlMaxSda'
    end
    object adsProcessoExpDespachanteCdRisc: TStringField
      FieldName = 'Despachante.CdRisc'
      Size = 3
    end
    object adsProcessoExpDespachanteInAtivo: TStringField
      FieldName = 'Despachante.InAtivo'
      Size = 1
    end
    object adsProcessoExpDespachanteCdFavorecido: TStringField
      FieldName = 'Despachante.CdFavorecido'
      Size = 5
    end
    object adsProcessoExpDespachanteCdModSda: TStringField
      FieldName = 'Despachante.CdModSda'
      Size = 2
    end
    object adsProcessoExpDespachanteNrRegistro: TStringField
      FieldName = 'Despachante.NrRegistro'
      Size = 9
    end
    object adsProcessoExpDespachanteCpfDespachante: TStringField
      FieldName = 'Despachante.CpfDespachante'
      Size = 11
    end
    object adsProcessoExpDespachanteNrContaCorrente: TStringField
      FieldName = 'Despachante.NrContaCorrente'
      Size = 10
    end
    object adsProcessoExpDespachanteNrDigitoContaCorrente: TStringField
      FieldName = 'Despachante.NrDigitoContaCorrente'
      Size = 1
    end
    object adsProcessoExpDespachanteCdDespSda: TStringField
      FieldName = 'Despachante.CdDespSda'
      Size = 12
    end
    object adsProcessoExpDespachanteCdProduto: TStringField
      FieldName = 'Despachante.CdProduto'
      Size = 2
    end
    object adsProcessoExpDespachanteNmSenha: TStringField
      FieldName = 'Despachante.NmSenha'
      Size = 12
    end
    object adsProcessoExpDespachanteInConsultaSiscomex: TStringField
      FieldName = 'Despachante.InConsultaSiscomex'
      Size = 1
    end
    object adsProcessoExpDespachanteCdUsuario: TStringField
      FieldName = 'Despachante.CdUsuario'
      Size = 4
    end
    object adsProcessoExpDespachanteDtSenha: TDateTimeField
      FieldName = 'Despachante.DtSenha'
    end
    object adsProcessoExpProcesso: TAureliusEntityField
      FieldName = 'Processo'
      Required = True
    end
    object adsProcessoExpProcessoNrProcesso: TStringField
      FieldName = 'Processo.NrProcesso'
      Size = 18
    end
    object adsProcessoExpProcessoDtAbertura: TDateTimeField
      FieldName = 'Processo.DtAbertura'
    end
    object adsProcessoExpProcessoInCancelado: TStringField
      FieldName = 'Processo.InCancelado'
      Size = 1
    end
    object adsProcessoExpProcessoVlMleMneg: TFloatField
      FieldName = 'Processo.VlMleMneg'
    end
    object adsProcessoExpProcessoVlFretePrepaidMneg: TFloatField
      FieldName = 'Processo.VlFretePrepaidMneg'
    end
    object adsProcessoExpProcessoVlSeguroMn: TFloatField
      FieldName = 'Processo.VlSeguroMn'
    end
    object adsProcessoExpProcessoNrProcessoExpTemp: TStringField
      FieldName = 'Processo.NrProcessoExpTemp'
      Size = 5
    end
    object adsProcessoExpProcessoVlPesoLiquido: TFloatField
      FieldName = 'Processo.VlPesoLiquido'
    end
    object adsProcessoExpProcessoVlPesoBruto: TFloatField
      FieldName = 'Processo.VlPesoBruto'
    end
    object adsProcessoExpProcessoTpProcesso: TStringField
      FieldName = 'Processo.TpProcesso'
      Size = 1
    end
    object adsProcessoExpProcessoNrFatura: TStringField
      FieldName = 'Processo.NrFatura'
      Size = 30
    end
    object adsProcessoExpProcessoCdGrupo: TStringField
      FieldName = 'Processo.CdGrupo'
      Size = 3
    end
    object adsProcessoExpProcessoCdRuc: TStringField
      FieldName = 'Processo.CdRuc'
      Size = 35
    end
    object adsProcessoExpProcessoCdDue: TStringField
      FieldName = 'Processo.CdDue'
      Size = 14
    end
    object adsProcessoExpProcessoVlDescontoMn: TFloatField
      FieldName = 'Processo.VlDescontoMn'
    end
    object adsProcessoExpProcessoVlAcrescimoMn: TFloatField
      FieldName = 'Processo.VlAcrescimoMn'
    end
    object adsProcessoExpProcessoUnidNeg: TAureliusEntityField
      FieldName = 'Processo.UnidNeg'
    end
    object adsProcessoExpProcessoUnidNegCdUnidNeg: TStringField
      FieldName = 'Processo.UnidNeg.CdUnidNeg'
      Size = 2
    end
    object adsProcessoExpProcessoUnidNegNmUnidNeg: TStringField
      FieldName = 'Processo.UnidNeg.NmUnidNeg'
      Size = 50
    end
    object adsProcessoExpProcessoUnidNegApUnidNeg: TStringField
      FieldName = 'Processo.UnidNeg.ApUnidNeg'
      Size = 10
    end
    object adsProcessoExpProcessoUnidNegInAtivo: TStringField
      FieldName = 'Processo.UnidNeg.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoUnidNegVlAliqIss: TFloatField
      FieldName = 'Processo.UnidNeg.VlAliqIss'
    end
    object adsProcessoExpProcessoUnidNegCgcUnidNeg: TStringField
      FieldName = 'Processo.UnidNeg.CgcUnidNeg'
      Size = 14
    end
    object adsProcessoExpProcessoUnidNegCdFilial: TStringField
      FieldName = 'Processo.UnidNeg.CdFilial'
      Size = 3
    end
    object adsProcessoExpProcessoUnidNegEndUnidNeg: TStringField
      FieldName = 'Processo.UnidNeg.EndUnidNeg'
      Size = 50
    end
    object adsProcessoExpProcessoUnidNegEndNumero: TStringField
      FieldName = 'Processo.UnidNeg.EndNumero'
      Size = 6
    end
    object adsProcessoExpProcessoUnidNegEndCompl: TStringField
      FieldName = 'Processo.UnidNeg.EndCompl'
    end
    object adsProcessoExpProcessoUnidNegEndBairro: TStringField
      FieldName = 'Processo.UnidNeg.EndBairro'
      Size = 30
    end
    object adsProcessoExpProcessoUnidNegEndCidade: TStringField
      FieldName = 'Processo.UnidNeg.EndCidade'
      Size = 30
    end
    object adsProcessoExpProcessoUnidNegEndUf: TStringField
      FieldName = 'Processo.UnidNeg.EndUf'
      Size = 2
    end
    object adsProcessoExpProcessoUnidNegIeUnidNeg: TStringField
      FieldName = 'Processo.UnidNeg.IeUnidNeg'
    end
    object adsProcessoExpProcessoUnidNegImUnidNeg: TStringField
      FieldName = 'Processo.UnidNeg.ImUnidNeg'
    end
    object adsProcessoExpProcessoUnidNegNrFone: TStringField
      FieldName = 'Processo.UnidNeg.NrFone'
    end
    object adsProcessoExpProcessoUnidNegEndCep: TStringField
      FieldName = 'Processo.UnidNeg.EndCep'
      Size = 8
    end
    object adsProcessoExpProcessoUnidNegNrFax1: TStringField
      FieldName = 'Processo.UnidNeg.NrFax1'
    end
    object adsProcessoExpProcessoUnidNegNrFax2: TStringField
      FieldName = 'Processo.UnidNeg.NrFax2'
    end
    object adsProcessoExpProcessoUnidNegNmSlogan: TStringField
      FieldName = 'Processo.UnidNeg.NmSlogan'
      Size = 100
    end
    object adsProcessoExpProcessoUnidNegNrNotaFatura: TStringField
      FieldName = 'Processo.UnidNeg.NrNotaFatura'
      Size = 6
    end
    object adsProcessoExpProcessoUnidNegNmEmail: TStringField
      FieldName = 'Processo.UnidNeg.NmEmail'
      Size = 100
    end
    object adsProcessoExpProcessoUnidNegPathRelatorios: TStringField
      FieldName = 'Processo.UnidNeg.PathRelatorios'
      Size = 100
    end
    object adsProcessoExpProcessoUnidNegPathSiscomex: TStringField
      FieldName = 'Processo.UnidNeg.PathSiscomex'
      Size = 100
    end
    object adsProcessoExpProcessoUnidNegPathRei: TStringField
      FieldName = 'Processo.UnidNeg.PathRei'
      Size = 100
    end
    object adsProcessoExpProcessoUnidNegNmDiretor: TStringField
      FieldName = 'Processo.UnidNeg.NmDiretor'
      Size = 50
    end
    object adsProcessoExpProcessoUnidNegNrCpfDiretor: TStringField
      FieldName = 'Processo.UnidNeg.NrCpfDiretor'
      Size = 11
    end
    object adsProcessoExpProcessoUnidNegNmContador: TStringField
      FieldName = 'Processo.UnidNeg.NmContador'
      Size = 50
    end
    object adsProcessoExpProcessoUnidNegNrCrcContador: TStringField
      FieldName = 'Processo.UnidNeg.NrCrcContador'
      Size = 15
    end
    object adsProcessoExpProcessoUnidNegNmProcurador: TStringField
      FieldName = 'Processo.UnidNeg.NmProcurador'
      Size = 50
    end
    object adsProcessoExpProcessoUnidNegNrCpfProcurador: TStringField
      FieldName = 'Processo.UnidNeg.NrCpfProcurador'
      Size = 11
    end
    object adsProcessoExpProcessoUnidNegCdPais: TStringField
      FieldName = 'Processo.UnidNeg.CdPais'
      Size = 3
    end
    object adsProcessoExpProcessoUnidNegNrProcNfPref: TStringField
      FieldName = 'Processo.UnidNeg.NrProcNfPref'
    end
    object adsProcessoExpProcessoUnidNegNrLivro: TStringField
      FieldName = 'Processo.UnidNeg.NrLivro'
      Size = 5
    end
    object adsProcessoExpProcessoUnidNegNmSigla: TStringField
      FieldName = 'Processo.UnidNeg.NmSigla'
      Size = 3
    end
    object adsProcessoExpProcessoUnidNegVlPercIss: TFloatField
      FieldName = 'Processo.UnidNeg.VlPercIss'
    end
    object adsProcessoExpProcessoUnidNegCdBancoConciliacao: TStringField
      FieldName = 'Processo.UnidNeg.CdBancoConciliacao'
      Size = 3
    end
    object adsProcessoExpProcessoUnidNegCdDac: TStringField
      FieldName = 'Processo.UnidNeg.CdDac'
    end
    object adsProcessoExpProcessoUnidNegCdCtCusto: TStringField
      FieldName = 'Processo.UnidNeg.CdCtCusto'
      Size = 4
    end
    object adsProcessoExpProcessoUnidNegIdArquivoNovoex: TStringField
      FieldName = 'Processo.UnidNeg.IdArquivoNovoex'
      Size = 10
    end
    object adsProcessoExpProcessoProduto: TAureliusEntityField
      FieldName = 'Processo.Produto'
    end
    object adsProcessoExpProcessoProdutoCdProduto: TStringField
      FieldName = 'Processo.Produto.CdProduto'
      Size = 2
    end
    object adsProcessoExpProcessoProdutoNmProduto: TStringField
      FieldName = 'Processo.Produto.NmProduto'
      Size = 40
    end
    object adsProcessoExpProcessoProdutoApProduto: TStringField
      FieldName = 'Processo.Produto.ApProduto'
      Size = 10
    end
    object adsProcessoExpProcessoProdutoInAtivo: TStringField
      FieldName = 'Processo.Produto.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoProdutoCdViatransp: TStringField
      FieldName = 'Processo.Produto.CdViatransp'
      Size = 1
    end
    object adsProcessoExpProcessoProdutoCdCtGerencial: TStringField
      FieldName = 'Processo.Produto.CdCtGerencial'
      Size = 4
    end
    object adsProcessoExpProcessoProdutoTpFatSemReceita: TStringField
      FieldName = 'Processo.Produto.TpFatSemReceita'
      Size = 1
    end
    object adsProcessoExpProcessoProdutoTpProduto: TStringField
      FieldName = 'Processo.Produto.TpProduto'
      Size = 2
    end
    object adsProcessoExpProcessoCliente: TAureliusEntityField
      FieldName = 'Processo.Cliente'
    end
    object adsProcessoExpProcessoClienteCdEmpresa: TStringField
      FieldName = 'Processo.Cliente.CdEmpresa'
      Size = 5
    end
    object adsProcessoExpProcessoClienteNmEmpresa: TStringField
      FieldName = 'Processo.Cliente.NmEmpresa'
      Size = 80
    end
    object adsProcessoExpProcessoClienteApEmpresa: TStringField
      FieldName = 'Processo.Cliente.ApEmpresa'
      Size = 10
    end
    object adsProcessoExpProcessoClienteEndEmpresa: TStringField
      FieldName = 'Processo.Cliente.EndEmpresa'
      Size = 50
    end
    object adsProcessoExpProcessoClienteCdTipoPessoa: TStringField
      FieldName = 'Processo.Cliente.CdTipoPessoa'
      Size = 1
    end
    object adsProcessoExpProcessoClienteCgcEmpresa: TStringField
      FieldName = 'Processo.Cliente.CgcEmpresa'
      Size = 14
    end
    object adsProcessoExpProcessoClienteCpfEmpresa: TStringField
      FieldName = 'Processo.Cliente.CpfEmpresa'
      Size = 11
    end
    object adsProcessoExpProcessoClienteIeEmpresa: TStringField
      FieldName = 'Processo.Cliente.IeEmpresa'
    end
    object adsProcessoExpProcessoClienteInCliente: TBooleanField
      FieldName = 'Processo.Cliente.InCliente'
    end
    object adsProcessoExpProcessoClienteInImportador: TBooleanField
      FieldName = 'Processo.Cliente.InImportador'
    end
    object adsProcessoExpProcessoClienteInExportador: TBooleanField
      FieldName = 'Processo.Cliente.InExportador'
    end
    object adsProcessoExpProcessoClienteInOutros: TBooleanField
      FieldName = 'Processo.Cliente.InOutros'
    end
    object adsProcessoExpProcessoClienteCdGrupo: TStringField
      FieldName = 'Processo.Cliente.CdGrupo'
      Size = 3
    end
    object adsProcessoExpProcessoClienteInRepresentante: TBooleanField
      FieldName = 'Processo.Cliente.InRepresentante'
    end
    object adsProcessoExpProcessoClienteInSeguradora: TBooleanField
      FieldName = 'Processo.Cliente.InSeguradora'
    end
    object adsProcessoExpProcessoServico: TAureliusEntityField
      FieldName = 'Processo.Servico'
    end
    object adsProcessoExpProcessoServicoCdServico: TStringField
      FieldName = 'Processo.Servico.CdServico'
      Size = 3
    end
    object adsProcessoExpProcessoServicoNmServico: TStringField
      FieldName = 'Processo.Servico.NmServico'
      Size = 50
    end
    object adsProcessoExpProcessoServicoCdClassificacao: TStringField
      FieldName = 'Processo.Servico.CdClassificacao'
      Size = 2
    end
    object adsProcessoExpProcessoServicoCdViaTransporte: TStringField
      FieldName = 'Processo.Servico.CdViaTransporte'
      Size = 2
    end
    object adsProcessoExpProcessoServicoInAtivo: TStringField
      FieldName = 'Processo.Servico.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoServicoNrDiasConclusao: TIntegerField
      FieldName = 'Processo.Servico.NrDiasConclusao'
    end
    object adsProcessoExpProcessoServicoCdEventoConclusor: TStringField
      FieldName = 'Processo.Servico.CdEventoConclusor'
      Size = 3
    end
    object adsProcessoExpProcessoServicoInFollowup: TStringField
      FieldName = 'Processo.Servico.InFollowup'
      Size = 1
    end
    object adsProcessoExpProcessoServicoInAdmTemp: TStringField
      FieldName = 'Processo.Servico.InAdmTemp'
      Size = 1
    end
    object adsProcessoExpProcessoServicoInIndent: TStringField
      FieldName = 'Processo.Servico.InIndent'
      Size = 1
    end
    object adsProcessoExpProcessoServicoCdEvIni: TStringField
      FieldName = 'Processo.Servico.CdEvIni'
      Size = 3
    end
    object adsProcessoExpProcessoServicoCdEvFim: TStringField
      FieldName = 'Processo.Servico.CdEvFim'
      Size = 3
    end
    object adsProcessoExpProcessoServicoCdGrupo: TStringField
      FieldName = 'Processo.Servico.CdGrupo'
      Size = 3
    end
    object adsProcessoExpProcessoServicoTpCtrlVencto: TStringField
      FieldName = 'Processo.Servico.TpCtrlVencto'
      Size = 1
    end
    object adsProcessoExpProcessoServicoInCheck: TStringField
      FieldName = 'Processo.Servico.InCheck'
      Size = 1
    end
    object adsProcessoExpProcessoServicoTpServico: TStringField
      FieldName = 'Processo.Servico.TpServico'
      Size = 1
    end
    object adsProcessoExpProcessoUsuario: TAureliusEntityField
      FieldName = 'Processo.Usuario'
    end
    object adsProcessoExpProcessoUsuarioCdUsuario: TStringField
      FieldName = 'Processo.Usuario.CdUsuario'
      Size = 4
    end
    object adsProcessoExpProcessoUsuarioCdSenha: TStringField
      FieldName = 'Processo.Usuario.CdSenha'
      Size = 10
    end
    object adsProcessoExpProcessoUsuarioCdCargo: TStringField
      FieldName = 'Processo.Usuario.CdCargo'
      Size = 3
    end
    object adsProcessoExpProcessoUsuarioNmUsuario: TStringField
      FieldName = 'Processo.Usuario.NmUsuario'
      Size = 50
    end
    object adsProcessoExpProcessoUsuarioApUsuario: TStringField
      FieldName = 'Processo.Usuario.ApUsuario'
      Size = 15
    end
    object adsProcessoExpProcessoUsuarioInAtivo: TStringField
      FieldName = 'Processo.Usuario.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioCdInstalacao: TStringField
      FieldName = 'Processo.Usuario.CdInstalacao'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioNmEmail: TStringField
      FieldName = 'Processo.Usuario.NmEmail'
      Size = 2000
    end
    object adsProcessoExpProcessoUsuarioInAvisoPo: TStringField
      FieldName = 'Processo.Usuario.InAvisoPo'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioCdCelula: TStringField
      FieldName = 'Processo.Usuario.CdCelula'
      Size = 2
    end
    object adsProcessoExpProcessoUsuarioCdTranspRod: TStringField
      FieldName = 'Processo.Usuario.CdTranspRod'
      Size = 4
    end
    object adsProcessoExpProcessoUsuarioInSelecionado: TStringField
      FieldName = 'Processo.Usuario.InSelecionado'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioCdIdioma: TIntegerField
      FieldName = 'Processo.Usuario.CdIdioma'
    end
    object adsProcessoExpProcessoUsuarioDtUltAltSenha: TDateTimeField
      FieldName = 'Processo.Usuario.DtUltAltSenha'
    end
    object adsProcessoExpProcessoUsuarioInAltStatusReceb: TStringField
      FieldName = 'Processo.Usuario.InAltStatusReceb'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioCdEmpresa: TStringField
      FieldName = 'Processo.Usuario.CdEmpresa'
      Size = 5
    end
    object adsProcessoExpProcessoUsuarioCdChefia: TStringField
      FieldName = 'Processo.Usuario.CdChefia'
      Size = 4
    end
    object adsProcessoExpProcessoUsuarioInModoPreview: TStringField
      FieldName = 'Processo.Usuario.InModoPreview'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioInFecharMovFinanc: TStringField
      FieldName = 'Processo.Usuario.InFecharMovFinanc'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioInPermiteFaturamento: TStringField
      FieldName = 'Processo.Usuario.InPermiteFaturamento'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioInPermiteAlteraRegDde: TStringField
      FieldName = 'Processo.Usuario.InPermiteAlteraRegDde'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioCdComputador: TIntegerField
      FieldName = 'Processo.Usuario.CdComputador'
    end
    object adsProcessoExpProcessoUsuarioExibeResumo: TStringField
      FieldName = 'Processo.Usuario.ExibeResumo'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioExibeDetalhe: TStringField
      FieldName = 'Processo.Usuario.ExibeDetalhe'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioInZeraLiquidacao: TStringField
      FieldName = 'Processo.Usuario.InZeraLiquidacao'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioGrupoRap: TStringField
      FieldName = 'Processo.Usuario.GrupoRap'
      Size = 3
    end
    object adsProcessoExpProcessoUsuarioSupervisaPendencias: TStringField
      FieldName = 'Processo.Usuario.SupervisaPendencias'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioNmSenhaInicial: TStringField
      FieldName = 'Processo.Usuario.NmSenhaInicial'
    end
    object adsProcessoExpProcessoUsuarioInManager: TStringField
      FieldName = 'Processo.Usuario.InManager'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioInOnline: TStringField
      FieldName = 'Processo.Usuario.InOnline'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioDtUltAcesso: TDateTimeField
      FieldName = 'Processo.Usuario.DtUltAcesso'
    end
    object adsProcessoExpProcessoUsuarioCdTema: TStringField
      FieldName = 'Processo.Usuario.CdTema'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioCdGrupoDetalhes: TStringField
      FieldName = 'Processo.Usuario.CdGrupoDetalhes'
      Size = 3
    end
    object adsProcessoExpProcessoUsuarioInManagerSite: TStringField
      FieldName = 'Processo.Usuario.InManagerSite'
      Size = 1
    end
    object adsProcessoExpProcessoUsuarioCdSuperiorDireto: TStringField
      FieldName = 'Processo.Usuario.CdSuperiorDireto'
      Size = 4
    end
    object adsProcessoExpProcessoUsuarioDtAcessoAgora: TDateTimeField
      FieldName = 'Processo.Usuario.DtAcessoAgora'
    end
    object adsProcessoExpProcessoUsuarioDtUltimaAcao: TDateTimeField
      FieldName = 'Processo.Usuario.DtUltimaAcao'
    end
    object adsProcessoExpProcessoUsuarioNrServerMoney: TIntegerField
      FieldName = 'Processo.Usuario.NrServerMoney'
    end
    object adsProcessoExpProcessoMoedaMle: TAureliusEntityField
      FieldName = 'Processo.MoedaMle'
    end
    object adsProcessoExpProcessoMoedaMleCdMoeda: TStringField
      FieldName = 'Processo.MoedaMle.CdMoeda'
      Size = 3
    end
    object adsProcessoExpProcessoMoedaMleNmMoeda: TStringField
      FieldName = 'Processo.MoedaMle.NmMoeda'
      Size = 30
    end
    object adsProcessoExpProcessoMoedaMleApMoeda: TStringField
      FieldName = 'Processo.MoedaMle.ApMoeda'
      Size = 6
    end
    object adsProcessoExpProcessoMoedaMleInAtivo: TStringField
      FieldName = 'Processo.MoedaMle.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoMoedaMleCdMoedaScx: TStringField
      FieldName = 'Processo.MoedaMle.CdMoedaScx'
      Size = 3
    end
    object adsProcessoExpProcessoMoedaMleNmMoedaSing: TStringField
      FieldName = 'Processo.MoedaMle.NmMoedaSing'
    end
    object adsProcessoExpProcessoMoedaMleNmMoedaPlural: TStringField
      FieldName = 'Processo.MoedaMle.NmMoedaPlural'
    end
    object adsProcessoExpProcessoMoedaMleNmCentavosSing: TStringField
      FieldName = 'Processo.MoedaMle.NmCentavosSing'
    end
    object adsProcessoExpProcessoMoedaMleNmCentavosPlural: TStringField
      FieldName = 'Processo.MoedaMle.NmCentavosPlural'
    end
    object adsProcessoExpProcessoMoedaMleApMoedaIngles: TStringField
      FieldName = 'Processo.MoedaMle.ApMoedaIngles'
      Size = 6
    end
    object adsProcessoExpProcessoMoedaMleNmMoedaSingIng: TStringField
      FieldName = 'Processo.MoedaMle.NmMoedaSingIng'
    end
    object adsProcessoExpProcessoMoedaMleNmMoedaPluralIng: TStringField
      FieldName = 'Processo.MoedaMle.NmMoedaPluralIng'
    end
    object adsProcessoExpProcessoMoedaMleNmCentavosSingIng: TStringField
      FieldName = 'Processo.MoedaMle.NmCentavosSingIng'
    end
    object adsProcessoExpProcessoMoedaMleNmCentavosPluralIng: TStringField
      FieldName = 'Processo.MoedaMle.NmCentavosPluralIng'
    end
    object adsProcessoExpProcessoMoedaMleNmMoedaSingEsp: TStringField
      FieldName = 'Processo.MoedaMle.NmMoedaSingEsp'
    end
    object adsProcessoExpProcessoMoedaMleNmMoedaPluralEsp: TStringField
      FieldName = 'Processo.MoedaMle.NmMoedaPluralEsp'
    end
    object adsProcessoExpProcessoMoedaMleNmCentavosSingEsp: TStringField
      FieldName = 'Processo.MoedaMle.NmCentavosSingEsp'
    end
    object adsProcessoExpProcessoMoedaMleNmCentavosPluralEsp: TStringField
      FieldName = 'Processo.MoedaMle.NmCentavosPluralEsp'
    end
    object adsProcessoExpProcessoPaisDestino: TAureliusEntityField
      FieldName = 'Processo.PaisDestino'
    end
    object adsProcessoExpProcessoPaisDestinoCdPais: TStringField
      FieldName = 'Processo.PaisDestino.CdPais'
      Size = 3
    end
    object adsProcessoExpProcessoPaisDestinoNmPais: TStringField
      FieldName = 'Processo.PaisDestino.NmPais'
      Size = 120
    end
    object adsProcessoExpProcessoPaisDestinoNmSiglaCrt: TStringField
      FieldName = 'Processo.PaisDestino.NmSiglaCrt'
      Size = 2
    end
    object adsProcessoExpProcessoDespachante: TAureliusEntityField
      FieldName = 'Processo.Despachante'
    end
    object adsProcessoExpProcessoDespachanteCdDespachante: TStringField
      FieldName = 'Processo.Despachante.CdDespachante'
      Size = 3
    end
    object adsProcessoExpProcessoDespachanteNmDespachante: TStringField
      FieldName = 'Processo.Despachante.NmDespachante'
      Size = 50
    end
    object adsProcessoExpProcessoDespachanteApDespachante: TStringField
      FieldName = 'Processo.Despachante.ApDespachante'
      Size = 10
    end
    object adsProcessoExpProcessoDespachanteVlMinSda: TFloatField
      FieldName = 'Processo.Despachante.VlMinSda'
    end
    object adsProcessoExpProcessoDespachanteVlMaxSda: TFloatField
      FieldName = 'Processo.Despachante.VlMaxSda'
    end
    object adsProcessoExpProcessoDespachanteCdRisc: TStringField
      FieldName = 'Processo.Despachante.CdRisc'
      Size = 3
    end
    object adsProcessoExpProcessoDespachanteInAtivo: TStringField
      FieldName = 'Processo.Despachante.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoDespachanteCdFavorecido: TStringField
      FieldName = 'Processo.Despachante.CdFavorecido'
      Size = 5
    end
    object adsProcessoExpProcessoDespachanteCdModSda: TStringField
      FieldName = 'Processo.Despachante.CdModSda'
      Size = 2
    end
    object adsProcessoExpProcessoDespachanteNrRegistro: TStringField
      FieldName = 'Processo.Despachante.NrRegistro'
      Size = 9
    end
    object adsProcessoExpProcessoDespachanteCpfDespachante: TStringField
      FieldName = 'Processo.Despachante.CpfDespachante'
      Size = 11
    end
    object adsProcessoExpProcessoDespachanteNrContaCorrente: TStringField
      FieldName = 'Processo.Despachante.NrContaCorrente'
      Size = 10
    end
    object adsProcessoExpProcessoDespachanteNrDigitoContaCorrente: TStringField
      FieldName = 'Processo.Despachante.NrDigitoContaCorrente'
      Size = 1
    end
    object adsProcessoExpProcessoDespachanteCdDespSda: TStringField
      FieldName = 'Processo.Despachante.CdDespSda'
      Size = 12
    end
    object adsProcessoExpProcessoDespachanteCdProduto: TStringField
      FieldName = 'Processo.Despachante.CdProduto'
      Size = 2
    end
    object adsProcessoExpProcessoDespachanteNmSenha: TStringField
      FieldName = 'Processo.Despachante.NmSenha'
      Size = 12
    end
    object adsProcessoExpProcessoDespachanteInConsultaSiscomex: TStringField
      FieldName = 'Processo.Despachante.InConsultaSiscomex'
      Size = 1
    end
    object adsProcessoExpProcessoDespachanteCdUsuario: TStringField
      FieldName = 'Processo.Despachante.CdUsuario'
      Size = 4
    end
    object adsProcessoExpProcessoDespachanteDtSenha: TDateTimeField
      FieldName = 'Processo.Despachante.DtSenha'
    end
    object adsProcessoExpProcessoIncoterm: TAureliusEntityField
      FieldName = 'Processo.Incoterm'
    end
    object adsProcessoExpProcessoIncotermCodigo: TStringField
      FieldName = 'Processo.Incoterm.Codigo'
      Size = 3
    end
    object adsProcessoExpProcessoIncotermDescricao: TStringField
      FieldName = 'Processo.Incoterm.Descricao'
      Size = 60
    end
    object adsProcessoExpProcessoIncotermSinal: TStringField
      FieldName = 'Processo.Incoterm.Sinal'
      Size = 1
    end
    object adsProcessoExpProcessoIncotermInTipoFrete: TStringField
      FieldName = 'Processo.Incoterm.InTipoFrete'
      Size = 2
    end
    object adsProcessoExpProcessoExportador: TAureliusEntityField
      FieldName = 'Processo.Exportador'
    end
    object adsProcessoExpProcessoExportadorCdEmpresa: TStringField
      FieldName = 'Processo.Exportador.CdEmpresa'
      Size = 5
    end
    object adsProcessoExpProcessoExportadorNmEmpresa: TStringField
      FieldName = 'Processo.Exportador.NmEmpresa'
      Size = 80
    end
    object adsProcessoExpProcessoExportadorApEmpresa: TStringField
      FieldName = 'Processo.Exportador.ApEmpresa'
      Size = 10
    end
    object adsProcessoExpProcessoExportadorEndEmpresa: TStringField
      FieldName = 'Processo.Exportador.EndEmpresa'
      Size = 50
    end
    object adsProcessoExpProcessoExportadorCdTipoPessoa: TStringField
      FieldName = 'Processo.Exportador.CdTipoPessoa'
      Size = 1
    end
    object adsProcessoExpProcessoExportadorCgcEmpresa: TStringField
      FieldName = 'Processo.Exportador.CgcEmpresa'
      Size = 14
    end
    object adsProcessoExpProcessoExportadorCpfEmpresa: TStringField
      FieldName = 'Processo.Exportador.CpfEmpresa'
      Size = 11
    end
    object adsProcessoExpProcessoExportadorIeEmpresa: TStringField
      FieldName = 'Processo.Exportador.IeEmpresa'
    end
    object adsProcessoExpProcessoExportadorInCliente: TBooleanField
      FieldName = 'Processo.Exportador.InCliente'
    end
    object adsProcessoExpProcessoExportadorInImportador: TBooleanField
      FieldName = 'Processo.Exportador.InImportador'
    end
    object adsProcessoExpProcessoExportadorInExportador: TBooleanField
      FieldName = 'Processo.Exportador.InExportador'
    end
    object adsProcessoExpProcessoExportadorInOutros: TBooleanField
      FieldName = 'Processo.Exportador.InOutros'
    end
    object adsProcessoExpProcessoExportadorCdGrupo: TStringField
      FieldName = 'Processo.Exportador.CdGrupo'
      Size = 3
    end
    object adsProcessoExpProcessoExportadorInRepresentante: TBooleanField
      FieldName = 'Processo.Exportador.InRepresentante'
    end
    object adsProcessoExpProcessoExportadorInSeguradora: TBooleanField
      FieldName = 'Processo.Exportador.InSeguradora'
    end
    object adsProcessoExpProcessoProcessoExp: TDataSetField
      FieldName = 'Processo.ProcessoExp'
      ReadOnly = True
    end
    object adsProcessoExpInTipoDocumentoDue: TIntegerField
      FieldName = 'InTipoDocumentoDue'
    end
    object adsProcessoExpExportadorInAtivo: TStringField
      FieldName = 'Exportador.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoClienteInAtivo: TStringField
      FieldName = 'Processo.Cliente.InAtivo'
      Size = 1
    end
    object adsProcessoExpProcessoExportadorInAtivo: TStringField
      FieldName = 'Processo.Exportador.InAtivo'
      Size = 1
    end
    object adsProcessoExpExportadorEndNumero: TStringField
      FieldName = 'Exportador.EndNumero'
      Size = 6
    end
    object adsProcessoExpExportadorEndCidade: TStringField
      FieldName = 'Exportador.EndCidade'
      Size = 30
    end
    object adsProcessoExpExportadorEndBairro: TStringField
      FieldName = 'Exportador.EndBairro'
      Size = 30
    end
    object adsProcessoExpExportadorEndUf: TStringField
      FieldName = 'Exportador.EndUf'
      Size = 2
    end
    object adsProcessoExpExportadorEndCep: TStringField
      FieldName = 'Exportador.EndCep'
      Size = 8
    end
    object adsProcessoExpExportadorCdPaisImportador: TStringField
      FieldName = 'Exportador.CdPaisImportador'
      Size = 3
    end
    object adsProcessoExpExportadorEndCompl: TStringField
      FieldName = 'Exportador.EndCompl'
      Size = 50
    end
    object adsProcessoExpExportadorEndComplemento: TStringField
      FieldName = 'Exportador.EndComplemento'
      Size = 60
    end
    object adsProcessoExpProcessoClienteEndNumero: TStringField
      FieldName = 'Processo.Cliente.EndNumero'
      Size = 6
    end
    object adsProcessoExpProcessoClienteEndCidade: TStringField
      FieldName = 'Processo.Cliente.EndCidade'
      Size = 30
    end
    object adsProcessoExpProcessoClienteEndBairro: TStringField
      FieldName = 'Processo.Cliente.EndBairro'
      Size = 30
    end
    object adsProcessoExpProcessoClienteEndUf: TStringField
      FieldName = 'Processo.Cliente.EndUf'
      Size = 2
    end
    object adsProcessoExpProcessoClienteEndCep: TStringField
      FieldName = 'Processo.Cliente.EndCep'
      Size = 8
    end
    object adsProcessoExpProcessoClienteCdPaisImportador: TStringField
      FieldName = 'Processo.Cliente.CdPaisImportador'
      Size = 3
    end
    object adsProcessoExpProcessoClienteEndCompl: TStringField
      FieldName = 'Processo.Cliente.EndCompl'
      Size = 50
    end
    object adsProcessoExpProcessoClienteEndComplemento: TStringField
      FieldName = 'Processo.Cliente.EndComplemento'
      Size = 60
    end
    object adsProcessoExpProcessoExportadorEndNumero: TStringField
      FieldName = 'Processo.Exportador.EndNumero'
      Size = 6
    end
    object adsProcessoExpProcessoExportadorEndCidade: TStringField
      FieldName = 'Processo.Exportador.EndCidade'
      Size = 30
    end
    object adsProcessoExpProcessoExportadorEndBairro: TStringField
      FieldName = 'Processo.Exportador.EndBairro'
      Size = 30
    end
    object adsProcessoExpProcessoExportadorEndUf: TStringField
      FieldName = 'Processo.Exportador.EndUf'
      Size = 2
    end
    object adsProcessoExpProcessoExportadorEndCep: TStringField
      FieldName = 'Processo.Exportador.EndCep'
      Size = 8
    end
    object adsProcessoExpProcessoExportadorCdPaisImportador: TStringField
      FieldName = 'Processo.Exportador.CdPaisImportador'
      Size = 3
    end
    object adsProcessoExpProcessoExportadorEndCompl: TStringField
      FieldName = 'Processo.Exportador.EndCompl'
      Size = 50
    end
    object adsProcessoExpProcessoExportadorEndComplemento: TStringField
      FieldName = 'Processo.Exportador.EndComplemento'
      Size = 60
    end
    object adsProcessoExpImportador: TAureliusEntityField
      FieldName = 'Importador'
    end
    object adsProcessoExpImportadorCdEmpresa: TStringField
      FieldName = 'Importador.CdEmpresa'
      Size = 5
    end
    object adsProcessoExpImportadorNmEmpresa: TStringField
      FieldName = 'Importador.NmEmpresa'
      Size = 100
    end
    object adsProcessoExpImportadorApEmpresa: TStringField
      FieldName = 'Importador.ApEmpresa'
      Size = 10
    end
    object adsProcessoExpImportadorEndEmpresa: TStringField
      FieldName = 'Importador.EndEmpresa'
      Size = 100
    end
    object adsProcessoExpImportadorEndNumero: TStringField
      FieldName = 'Importador.EndNumero'
      Size = 6
    end
    object adsProcessoExpImportadorEndCompl: TStringField
      FieldName = 'Importador.EndCompl'
      Size = 41
    end
    object adsProcessoExpImportadorEndCidade: TStringField
      FieldName = 'Importador.EndCidade'
      Size = 30
    end
    object adsProcessoExpImportadorEndEstado: TStringField
      FieldName = 'Importador.EndEstado'
      Size = 30
    end
    object adsProcessoExpImportadorInAtivo: TStringField
      FieldName = 'Importador.InAtivo'
      Size = 1
    end
    object adsProcessoExpImportadorInAgente: TBooleanField
      FieldName = 'Importador.InAgente'
    end
    object adsProcessoExpImportadorInBanco: TBooleanField
      FieldName = 'Importador.InBanco'
    end
    object adsProcessoExpImportadorInImportador: TBooleanField
      FieldName = 'Importador.InImportador'
    end
    object adsProcessoExpImportadorInSeguradora: TBooleanField
      FieldName = 'Importador.InSeguradora'
    end
    object adsProcessoExpImportadorInExportador: TBooleanField
      FieldName = 'Importador.InExportador'
    end
    object adsProcessoExpImportadorNrCliente: TStringField
      FieldName = 'Importador.NrCliente'
      Size = 15
    end
    object adsProcessoExpImportadorInComprador: TBooleanField
      FieldName = 'Importador.InComprador'
    end
    object adsProcessoExpImportadorCgcEmpresa: TStringField
      FieldName = 'Importador.CgcEmpresa'
      Size = 14
    end
    object adsProcessoExpImportadorInPoTrans: TStringField
      FieldName = 'Importador.InPoTrans'
      Size = 1
    end
    object adsProcessoExpImportadorNrRuc: TStringField
      FieldName = 'Importador.NrRuc'
      Size = 25
    end
    object adsProcessoExpImportadorNrNit: TStringField
      FieldName = 'Importador.NrNit'
      Size = 25
    end
    object adsProcessoExpImportadorPais: TAureliusEntityField
      FieldName = 'Importador.Pais'
    end
    object adsProcessoExpImportadorPaisCdPais: TStringField
      FieldName = 'Importador.Pais.CdPais'
      Size = 3
    end
    object adsProcessoExpImportadorPaisNmPais: TStringField
      FieldName = 'Importador.Pais.NmPais'
      Size = 120
    end
    object adsProcessoExpImportadorPaisNmSiglaCrt: TStringField
      FieldName = 'Importador.Pais.NmSiglaCrt'
      Size = 2
    end
    object adsProcessoExpNrProcesssoAdmImp: TStringField
      FieldName = 'NrProcesssoAdmImp'
      Size = 17
    end
    object adsProcessoExpDtPrazoValidadeExpTemp: TDateTimeField
      FieldName = 'DtPrazoValidadeExpTemp'
    end
    object adsProcessoExpTxMotivoRetificacao: TStringField
      FieldName = 'TxMotivoRetificacao'
      Size = 200
    end
    object adsProcessoExpQtDiasPrazoValidadeExpTemp: TIntegerField
      FieldName = 'QtDiasPrazoValidadeExpTemp'
    end
  end
  object adsProcessoExpNfItem: TAureliusDataset
    DatasetField = adsProcessoExpNfProcessoExpNfItem
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PlMercadoria'
        DataType = ftFloat
      end
      item
        Name = 'CdMercadoria'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NmMercadoria'
        DataType = ftMemo
      end
      item
        Name = 'ApMercadoria'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'VlLocalEmbarque'
        DataType = ftFloat
      end
      item
        Name = 'VlCondicaoVenda'
        DataType = ftFloat
      end
      item
        Name = 'VlItem'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDesp'
        DataType = ftFloat
      end
      item
        Name = 'VlDesconto'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'UnComercial'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'QtComercial'
        DataType = ftFloat
      end
      item
        Name = 'UnTributavel'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'QtTributavel'
        DataType = ftFloat
      end
      item
        Name = 'VlItemMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDespMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlDescontoMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalFreteMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguroMneg'
        DataType = ftFloat
      end
      item
        Name = 'TxLog'
        DataType = ftMemo
      end
      item
        Name = 'CdNcmDestaqueDominio'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrItemNf'
        DataType = ftInteger
      end
      item
        Name = 'NrItemDue'
        DataType = ftInteger
      end
      item
        Name = 'InVerificacaoEstatistica'
        DataType = ftBoolean
      end
      item
        Name = 'NrDeclaracaoImp'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrAdicaoImp'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrAtoConcessorioDrawback'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrItemAtoConcessorioDrawback'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CnpjAtoConcessorioDrawback'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NmSituacaoNcmAtributo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TratamentoPrioritario'
        DataType = ftVariant
      end
      item
        Name = 'TratamentoPrioritario.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TratamentoPrioritario.Descricao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ProcessoExpNf'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'ProcessoExpNf.NrProcesso'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ProcessoExpNf.NrNf'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ProcessoExpNf.DtNota'
        DataType = ftDateTime
      end
      item
        Name = 'ProcessoExpNf.VlNota'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.NfSerie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ProcessoExpNf.VlTaxa'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.NrRe'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ProcessoExpNf.ChaveNota'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'ProcessoExpNf.VlTotalProdutos'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlFrete'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlTotalDescontos'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlOutrasDespesas'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.PlMercadoriaTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.QtComercialTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.QtTributavelTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlMleMneg'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlLocalEmbarqueTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlCondicaoVendaTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.InNfRetificacao'
        DataType = ftBoolean
      end
      item
        Name = 'ProcessoExpNf.ProcessoExpNfItem'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'Ncm'
        DataType = ftVariant
      end
      item
        Name = 'Ncm.Codigo'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Ncm.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Ncm.UnidadeMedida'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Ncm.CdAtributo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CdCfop'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'InExportBeneficAtoConcessorio'
        DataType = ftBoolean
      end
      item
        Name = 'NrNcmAtoConcessorioDrawback'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'QtUtilizadaAtoConcessorioDrawback'
        DataType = ftFloat
      end
      item
        Name = 'VmleCCobertCambialAtoConcessorio'
        DataType = ftFloat
      end
      item
        Name = 'VmleSCobertCambialAtoConcessorio'
        DataType = ftFloat
      end>
    SubpropsDepth = 1
    Left = 530
    Top = 196
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItem'
    object adsProcessoExpNfItemSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcessoExpNfItemPlMercadoria: TFloatField
      FieldName = 'PlMercadoria'
    end
    object adsProcessoExpNfItemCdMercadoria: TStringField
      FieldName = 'CdMercadoria'
      Size = 30
    end
    object adsProcessoExpNfItemNmMercadoria: TStringField
      DisplayWidth = 1500
      FieldName = 'NmMercadoria'
      Size = 1500
    end
    object adsProcessoExpNfItemApMercadoria: TStringField
      FieldName = 'ApMercadoria'
      Size = 50
    end
    object adsProcessoExpNfItemCdUnMed: TStringField
      FieldName = 'CdUnMed'
      Size = 3
    end
    object adsProcessoExpNfItemVlLocalEmbarque: TFloatField
      FieldName = 'VlLocalEmbarque'
    end
    object adsProcessoExpNfItemVlCondicaoVenda: TFloatField
      FieldName = 'VlCondicaoVenda'
    end
    object adsProcessoExpNfItemQtUnidadeEstatistica: TFloatField
      FieldName = 'QtUnidadeEstatistica'
    end
    object adsProcessoExpNfItemVlItem: TFloatField
      FieldName = 'VlItem'
    end
    object adsProcessoExpNfItemVlOutrasDesp: TFloatField
      FieldName = 'VlOutrasDesp'
    end
    object adsProcessoExpNfItemVlDesconto: TFloatField
      FieldName = 'VlDesconto'
    end
    object adsProcessoExpNfItemVlTotalFrete: TFloatField
      FieldName = 'VlTotalFrete'
    end
    object adsProcessoExpNfItemVlSeguro: TFloatField
      FieldName = 'VlSeguro'
    end
    object adsProcessoExpNfItemUnComercial: TStringField
      FieldName = 'UnComercial'
      Size = 3
    end
    object adsProcessoExpNfItemQtComercial: TFloatField
      FieldName = 'QtComercial'
    end
    object adsProcessoExpNfItemUnTributavel: TStringField
      FieldName = 'UnTributavel'
      Size = 3
    end
    object adsProcessoExpNfItemQtTributavel: TFloatField
      FieldName = 'QtTributavel'
    end
    object adsProcessoExpNfItemTxLog: TStringField
      FieldName = 'TxLog'
      Size = 200
    end
    object adsProcessoExpNfItemNrItemNf: TIntegerField
      FieldName = 'NrItemNf'
    end
    object adsProcessoExpNfItemNrItemDue: TIntegerField
      FieldName = 'NrItemDue'
    end
    object adsProcessoExpNfItemTratamentoPrioritario: TAureliusEntityField
      FieldName = 'TratamentoPrioritario'
    end
    object adsProcessoExpNfItemProcessoExpNf: TAureliusEntityField
      FieldName = 'ProcessoExpNf'
      Required = True
    end
    object adsProcessoExpNfItemCdNcmDestaqueDominio: TStringField
      FieldName = 'CdNcmDestaqueDominio'
      Size = 2
    end
    object adsProcessoExpNfItemNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsProcessoExpNfItemNcm: TAureliusEntityField
      FieldName = 'Ncm'
    end
    object adsProcessoExpNfItemNcmCodigo: TStringField
      FieldName = 'Ncm.Codigo'
      Size = 8
    end
    object adsProcessoExpNfItemNcmDescricao: TStringField
      FieldName = 'Ncm.Descricao'
      Size = 120
    end
    object adsProcessoExpNfItemNcmUnidadeMedida: TStringField
      FieldName = 'Ncm.UnidadeMedida'
      Size = 4
    end
    object adsProcessoExpNfItemNcmCdAtributo: TStringField
      FieldName = 'Ncm.CdAtributo'
      Size = 10
    end
    object adsProcessoExpNfItemInVerificacaoEstatistica: TBooleanField
      FieldName = 'InVerificacaoEstatistica'
    end
    object adsProcessoExpNfItemVlItemMneg: TFloatField
      FieldName = 'VlItemMneg'
    end
    object adsProcessoExpNfItemVlOutrasDespMneg: TFloatField
      FieldName = 'VlOutrasDespMneg'
    end
    object adsProcessoExpNfItemVlDescontoMneg: TFloatField
      FieldName = 'VlDescontoMneg'
    end
    object adsProcessoExpNfItemVlTotalFreteMneg: TFloatField
      FieldName = 'VlTotalFreteMneg'
    end
    object adsProcessoExpNfItemVlSeguroMneg: TFloatField
      FieldName = 'VlSeguroMneg'
    end
    object adsProcessoExpNfItemTratamentoPrioritarioCodigo: TStringField
      FieldName = 'TratamentoPrioritario.Codigo'
      Size = 4
    end
    object adsProcessoExpNfItemTratamentoPrioritarioDescricao: TStringField
      FieldName = 'TratamentoPrioritario.Descricao'
      Size = 200
    end
    object adsProcessoExpNfItemNrDeclaracaoImp: TStringField
      FieldName = 'NrDeclaracaoImp'
      Size = 10
    end
    object adsProcessoExpNfItemNrAdicaoImp: TStringField
      FieldName = 'NrAdicaoImp'
      Size = 3
    end
    object adsProcessoExpNfItemNrAtoConcessorioDrawback: TStringField
      FieldName = 'NrAtoConcessorioDrawback'
      Size = 14
    end
    object adsProcessoExpNfItemNrItemAtoConcessorioDrawback: TStringField
      FieldName = 'NrItemAtoConcessorioDrawback'
      Size = 3
    end
    object adsProcessoExpNfItemCnpjAtoConcessorioDrawback: TStringField
      FieldName = 'CnpjAtoConcessorioDrawback'
      Size = 14
    end
    object adsProcessoExpNfItemNmSituacaoNcmAtributo: TStringField
      FieldName = 'NmSituacaoNcmAtributo'
      Size = 40
    end
    object adsProcessoExpNfItemInExportBeneficAtoConcessorio: TBooleanField
      FieldName = 'InExportBeneficAtoConcessorio'
    end
    object adsProcessoExpNfItemNrNcmAtoConcessorioDrawback: TStringField
      FieldName = 'NrNcmAtoConcessorioDrawback'
      Size = 14
    end
    object adsProcessoExpNfItemQtUtilizadaAtoConcessorioDrawback: TFloatField
      FieldName = 'QtUtilizadaAtoConcessorioDrawback'
    end
    object adsProcessoExpNfItemVmleCCobertCambialAtoConcessorio: TFloatField
      FieldName = 'VmleCCobertCambialAtoConcessorio'
    end
    object adsProcessoExpNfItemVmleSCobertCambialAtoConcessorio: TFloatField
      FieldName = 'VmleSCobertCambialAtoConcessorio'
    end
  end
  object adsProcessoExpNf: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtNota'
        DataType = ftDateTime
      end
      item
        Name = 'VlNota'
        DataType = ftFloat
      end
      item
        Name = 'NfSerie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'VlTaxa'
        DataType = ftFloat
      end
      item
        Name = 'NrRe'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ChaveNota'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'VlTotalProdutos'
        DataType = ftFloat
      end
      item
        Name = 'VlFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalDescontos'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDespesas'
        DataType = ftFloat
      end
      item
        Name = 'PlMercadoriaTotal'
        DataType = ftFloat
      end
      item
        Name = 'QtComercialTotal'
        DataType = ftFloat
      end
      item
        Name = 'QtTributavelTotal'
        DataType = ftFloat
      end
      item
        Name = 'VlMleMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlLocalEmbarqueTotal'
        DataType = ftFloat
      end
      item
        Name = 'VlCondicaoVendaTotal'
        DataType = ftFloat
      end
      item
        Name = 'InNfRetificacao'
        DataType = ftBoolean
      end
      item
        Name = 'ProcessoExpNfItem'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    Left = 529
    Top = 144
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNf'
    object adsProcessoExpNfSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcessoExpNfNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsProcessoExpNfNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsProcessoExpNfDtNota: TDateTimeField
      FieldName = 'DtNota'
    end
    object adsProcessoExpNfVlNota: TFloatField
      FieldName = 'VlNota'
    end
    object adsProcessoExpNfNfSerie: TStringField
      FieldName = 'NfSerie'
      Size = 3
    end
    object adsProcessoExpNfVlTaxa: TFloatField
      FieldName = 'VlTaxa'
    end
    object adsProcessoExpNfNrRe: TStringField
      FieldName = 'NrRe'
      Size = 12
    end
    object adsProcessoExpNfChaveNota: TStringField
      FieldName = 'ChaveNota'
      Size = 44
    end
    object adsProcessoExpNfVlTotalProdutos: TFloatField
      FieldName = 'VlTotalProdutos'
    end
    object adsProcessoExpNfVlFrete: TFloatField
      FieldName = 'VlFrete'
    end
    object adsProcessoExpNfVlSeguro: TFloatField
      FieldName = 'VlSeguro'
    end
    object adsProcessoExpNfVlTotalDescontos: TFloatField
      FieldName = 'VlTotalDescontos'
    end
    object adsProcessoExpNfVlOutrasDespesas: TFloatField
      FieldName = 'VlOutrasDespesas'
    end
    object adsProcessoExpNfPlMercadoriaTotal: TFloatField
      FieldName = 'PlMercadoriaTotal'
    end
    object adsProcessoExpNfQtComercialTotal: TFloatField
      FieldName = 'QtComercialTotal'
    end
    object adsProcessoExpNfQtTributavelTotal: TFloatField
      FieldName = 'QtTributavelTotal'
    end
    object adsProcessoExpNfVlMleMneg: TFloatField
      FieldName = 'VlMleMneg'
    end
    object adsProcessoExpNfProcessoExpNfItem: TDataSetField
      FieldName = 'ProcessoExpNfItem'
      ReadOnly = True
    end
  end
  object adsProcesso: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'DtAbertura'
        DataType = ftDateTime
      end
      item
        Name = 'InCancelado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VlMleMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlFretePrepaidMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguroMn'
        DataType = ftFloat
      end
      item
        Name = 'NrProcessoExpTemp'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'VlPesoLiquido'
        DataType = ftFloat
      end
      item
        Name = 'VlPesoBruto'
        DataType = ftFloat
      end
      item
        Name = 'TpProcesso'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrFatura'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdRuc'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CdDue'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'VlDescontoMn'
        DataType = ftFloat
      end
      item
        Name = 'VlAcrescimoMn'
        DataType = ftFloat
      end
      item
        Name = 'UnidNeg'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'UnidNeg.CdUnidNeg'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UnidNeg.NmUnidNeg'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UnidNeg.ApUnidNeg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UnidNeg.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'UnidNeg.VlAliqIss'
        DataType = ftFloat
      end
      item
        Name = 'UnidNeg.CgcUnidNeg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'UnidNeg.CdFilial'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UnidNeg.EndUnidNeg'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UnidNeg.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'UnidNeg.EndCompl'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UnidNeg.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UnidNeg.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UnidNeg.IeUnidNeg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.ImUnidNeg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.NrFone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.EndCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'UnidNeg.NrFax1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.NrFax2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.NmSlogan'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UnidNeg.NrNotaFatura'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'UnidNeg.NmEmail'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UnidNeg.PathRelatorios'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UnidNeg.PathSiscomex'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UnidNeg.PathRei'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UnidNeg.NmDiretor'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UnidNeg.NrCpfDiretor'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'UnidNeg.NmContador'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UnidNeg.NrCrcContador'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'UnidNeg.NmProcurador'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UnidNeg.NrCpfProcurador'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'UnidNeg.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UnidNeg.NrProcNfPref'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.NrLivro'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'UnidNeg.NmSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UnidNeg.VlPercIss'
        DataType = ftFloat
      end
      item
        Name = 'UnidNeg.CdBancoConciliacao'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UnidNeg.CdDac'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UnidNeg.CdCtCusto'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'UnidNeg.IdArquivoNovoex'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Produto'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'Produto.CdProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Produto.NmProduto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Produto.ApProduto'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Produto.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Produto.CdViatransp'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Produto.CdCtGerencial'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Produto.TpFatSemReceita'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Produto.TpProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Cliente'
        DataType = ftVariant
      end
      item
        Name = 'Cliente.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Cliente.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Cliente.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Cliente.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cliente.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Cliente.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Cliente.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Cliente.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cliente.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Cliente.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Servico'
        DataType = ftVariant
      end
      item
        Name = 'Servico.CdServico'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Servico.NmServico'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Servico.CdClassificacao'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Servico.CdViaTransporte'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Servico.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Servico.NrDiasConclusao'
        DataType = ftInteger
      end
      item
        Name = 'Servico.CdEventoConclusor'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Servico.InFollowup'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Servico.InAdmTemp'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Servico.InIndent'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Servico.CdEvIni'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Servico.CdEvFim'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Servico.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Servico.TpCtrlVencto'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Servico.InCheck'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Servico.TpServico'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario'
        DataType = ftVariant
      end
      item
        Name = 'Usuario.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Usuario.CdSenha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Usuario.CdCargo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Usuario.NmUsuario'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Usuario.ApUsuario'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Usuario.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.CdInstalacao'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.NmEmail'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'Usuario.InAvisoPo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.CdCelula'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Usuario.CdTranspRod'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Usuario.InSelecionado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.CdIdioma'
        DataType = ftInteger
      end
      item
        Name = 'Usuario.DtUltAltSenha'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario.InAltStatusReceb'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Usuario.CdChefia'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Usuario.InModoPreview'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.InFecharMovFinanc'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.InPermiteFaturamento'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.InPermiteAlteraRegDde'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.CdComputador'
        DataType = ftInteger
      end
      item
        Name = 'Usuario.ExibeResumo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.ExibeDetalhe'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.InZeraLiquidacao'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.GrupoRap'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Usuario.SupervisaPendencias'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.NmSenhaInicial'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Usuario.InManager'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.InOnline'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.DtUltAcesso'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario.CdTema'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.CdGrupoDetalhes'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Usuario.InManagerSite'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Usuario.CdSuperiorDireto'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Usuario.DtAcessoAgora'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario.DtUltimaAcao'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario.NrServerMoney'
        DataType = ftInteger
      end
      item
        Name = 'MoedaMle'
        DataType = ftVariant
      end
      item
        Name = 'MoedaMle.CdMoeda'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MoedaMle.NmMoeda'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MoedaMle.ApMoeda'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'MoedaMle.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MoedaMle.CdMoedaScx'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MoedaMle.NmMoedaSing'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmMoedaPlural'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmCentavosSing'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmCentavosPlural'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.ApMoedaIngles'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'MoedaMle.NmMoedaSingIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmMoedaPluralIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmCentavosSingIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmCentavosPluralIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmMoedaSingEsp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmMoedaPluralEsp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmCentavosSingEsp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MoedaMle.NmCentavosPluralEsp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PaisDestino'
        DataType = ftVariant
      end
      item
        Name = 'PaisDestino.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PaisDestino.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'PaisDestino.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Despachante'
        DataType = ftVariant
      end
      item
        Name = 'Despachante.CdDespachante'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Despachante.NmDespachante'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Despachante.ApDespachante'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Despachante.VlMinSda'
        DataType = ftFloat
      end
      item
        Name = 'Despachante.VlMaxSda'
        DataType = ftFloat
      end
      item
        Name = 'Despachante.CdRisc'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Despachante.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Despachante.CdFavorecido'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Despachante.CdModSda'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Despachante.NrRegistro'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Despachante.CpfDespachante'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Despachante.NrContaCorrente'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Despachante.NrDigitoContaCorrente'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Despachante.CdDespSda'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Despachante.CdProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Despachante.NmSenha'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Despachante.InConsultaSiscomex'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Despachante.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Despachante.DtSenha'
        DataType = ftDateTime
      end
      item
        Name = 'Incoterm'
        DataType = ftVariant
      end
      item
        Name = 'Incoterm.Codigo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Incoterm.Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Incoterm.Sinal'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Incoterm.InTipoFrete'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Exportador'
        DataType = ftVariant
      end
      item
        Name = 'Exportador.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Exportador.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Exportador.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Exportador.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Exportador.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Exportador.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Exportador.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Exportador.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Exportador.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Exportador.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'Exportador.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'ProcessoExp'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    SubpropsDepth = 2
    Left = 530
    Top = 41
    DesignClass = 'MyEntitiesBroker.TTprocesso'
    object adsProcessoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcessoNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsProcessoDtAbertura: TDateTimeField
      FieldName = 'DtAbertura'
    end
    object adsProcessoInCancelado: TStringField
      FieldName = 'InCancelado'
      Size = 1
    end
    object adsProcessoVlMleMneg: TFloatField
      FieldName = 'VlMleMneg'
    end
    object adsProcessoVlFretePrepaidMneg: TFloatField
      FieldName = 'VlFretePrepaidMneg'
    end
    object adsProcessoVlSeguroMn: TFloatField
      FieldName = 'VlSeguroMn'
    end
    object adsProcessoNrProcessoExpTemp: TStringField
      FieldName = 'NrProcessoExpTemp'
      Size = 5
    end
    object adsProcessoVlPesoLiquido: TFloatField
      FieldName = 'VlPesoLiquido'
    end
    object adsProcessoVlPesoBruto: TFloatField
      FieldName = 'VlPesoBruto'
    end
    object adsProcessoTpProcesso: TStringField
      FieldName = 'TpProcesso'
      Size = 1
    end
    object adsProcessoNrFatura: TStringField
      FieldName = 'NrFatura'
      Size = 30
    end
    object adsProcessoCdGrupo: TStringField
      FieldName = 'CdGrupo'
      Size = 3
    end
    object adsProcessoCdRuc: TStringField
      FieldName = 'CdRuc'
      Size = 35
    end
    object adsProcessoCdDue: TStringField
      FieldName = 'CdDue'
      Size = 14
    end
    object adsProcessoVlDescontoMn: TFloatField
      FieldName = 'VlDescontoMn'
    end
    object adsProcessoVlAcrescimoMn: TFloatField
      FieldName = 'VlAcrescimoMn'
    end
    object adsProcessoUnidNeg: TAureliusEntityField
      FieldName = 'UnidNeg'
      Required = True
    end
    object adsProcessoUnidNegCdUnidNeg: TStringField
      FieldName = 'UnidNeg.CdUnidNeg'
      Size = 2
    end
    object adsProcessoUnidNegNmUnidNeg: TStringField
      FieldName = 'UnidNeg.NmUnidNeg'
      Size = 50
    end
    object adsProcessoUnidNegApUnidNeg: TStringField
      FieldName = 'UnidNeg.ApUnidNeg'
      Size = 10
    end
    object adsProcessoUnidNegInAtivo: TStringField
      FieldName = 'UnidNeg.InAtivo'
      Size = 1
    end
    object adsProcessoUnidNegVlAliqIss: TFloatField
      FieldName = 'UnidNeg.VlAliqIss'
    end
    object adsProcessoUnidNegCgcUnidNeg: TStringField
      FieldName = 'UnidNeg.CgcUnidNeg'
      Size = 14
    end
    object adsProcessoUnidNegCdFilial: TStringField
      FieldName = 'UnidNeg.CdFilial'
      Size = 3
    end
    object adsProcessoUnidNegEndUnidNeg: TStringField
      FieldName = 'UnidNeg.EndUnidNeg'
      Size = 50
    end
    object adsProcessoUnidNegEndNumero: TStringField
      FieldName = 'UnidNeg.EndNumero'
      Size = 6
    end
    object adsProcessoUnidNegEndCompl: TStringField
      FieldName = 'UnidNeg.EndCompl'
    end
    object adsProcessoUnidNegEndBairro: TStringField
      FieldName = 'UnidNeg.EndBairro'
      Size = 30
    end
    object adsProcessoUnidNegEndCidade: TStringField
      FieldName = 'UnidNeg.EndCidade'
      Size = 30
    end
    object adsProcessoUnidNegEndUf: TStringField
      FieldName = 'UnidNeg.EndUf'
      Size = 2
    end
    object adsProcessoUnidNegIeUnidNeg: TStringField
      FieldName = 'UnidNeg.IeUnidNeg'
    end
    object adsProcessoUnidNegImUnidNeg: TStringField
      FieldName = 'UnidNeg.ImUnidNeg'
    end
    object adsProcessoUnidNegNrFone: TStringField
      FieldName = 'UnidNeg.NrFone'
    end
    object adsProcessoUnidNegEndCep: TStringField
      FieldName = 'UnidNeg.EndCep'
      Size = 8
    end
    object adsProcessoUnidNegNrFax1: TStringField
      FieldName = 'UnidNeg.NrFax1'
    end
    object adsProcessoUnidNegNrFax2: TStringField
      FieldName = 'UnidNeg.NrFax2'
    end
    object adsProcessoUnidNegNmSlogan: TStringField
      FieldName = 'UnidNeg.NmSlogan'
      Size = 100
    end
    object adsProcessoUnidNegNrNotaFatura: TStringField
      FieldName = 'UnidNeg.NrNotaFatura'
      Size = 6
    end
    object adsProcessoUnidNegNmEmail: TStringField
      FieldName = 'UnidNeg.NmEmail'
      Size = 100
    end
    object adsProcessoUnidNegPathRelatorios: TStringField
      FieldName = 'UnidNeg.PathRelatorios'
      Size = 100
    end
    object adsProcessoUnidNegPathSiscomex: TStringField
      FieldName = 'UnidNeg.PathSiscomex'
      Size = 100
    end
    object adsProcessoUnidNegPathRei: TStringField
      FieldName = 'UnidNeg.PathRei'
      Size = 100
    end
    object adsProcessoUnidNegNmDiretor: TStringField
      FieldName = 'UnidNeg.NmDiretor'
      Size = 50
    end
    object adsProcessoUnidNegNrCpfDiretor: TStringField
      FieldName = 'UnidNeg.NrCpfDiretor'
      Size = 11
    end
    object adsProcessoUnidNegNmContador: TStringField
      FieldName = 'UnidNeg.NmContador'
      Size = 50
    end
    object adsProcessoUnidNegNrCrcContador: TStringField
      FieldName = 'UnidNeg.NrCrcContador'
      Size = 15
    end
    object adsProcessoUnidNegNmProcurador: TStringField
      FieldName = 'UnidNeg.NmProcurador'
      Size = 50
    end
    object adsProcessoUnidNegNrCpfProcurador: TStringField
      FieldName = 'UnidNeg.NrCpfProcurador'
      Size = 11
    end
    object adsProcessoUnidNegCdPais: TStringField
      FieldName = 'UnidNeg.CdPais'
      Size = 3
    end
    object adsProcessoUnidNegNrProcNfPref: TStringField
      FieldName = 'UnidNeg.NrProcNfPref'
    end
    object adsProcessoUnidNegNrLivro: TStringField
      FieldName = 'UnidNeg.NrLivro'
      Size = 5
    end
    object adsProcessoUnidNegNmSigla: TStringField
      FieldName = 'UnidNeg.NmSigla'
      Size = 3
    end
    object adsProcessoUnidNegVlPercIss: TFloatField
      FieldName = 'UnidNeg.VlPercIss'
    end
    object adsProcessoUnidNegCdBancoConciliacao: TStringField
      FieldName = 'UnidNeg.CdBancoConciliacao'
      Size = 3
    end
    object adsProcessoUnidNegCdDac: TStringField
      FieldName = 'UnidNeg.CdDac'
    end
    object adsProcessoUnidNegCdCtCusto: TStringField
      FieldName = 'UnidNeg.CdCtCusto'
      Size = 4
    end
    object adsProcessoUnidNegIdArquivoNovoex: TStringField
      FieldName = 'UnidNeg.IdArquivoNovoex'
      Size = 10
    end
    object adsProcessoProduto: TAureliusEntityField
      FieldName = 'Produto'
      Required = True
    end
    object adsProcessoProdutoCdProduto: TStringField
      FieldName = 'Produto.CdProduto'
      Size = 2
    end
    object adsProcessoProdutoNmProduto: TStringField
      FieldName = 'Produto.NmProduto'
      Size = 40
    end
    object adsProcessoProdutoApProduto: TStringField
      FieldName = 'Produto.ApProduto'
      Size = 10
    end
    object adsProcessoProdutoInAtivo: TStringField
      FieldName = 'Produto.InAtivo'
      Size = 1
    end
    object adsProcessoProdutoCdViatransp: TStringField
      FieldName = 'Produto.CdViatransp'
      Size = 1
    end
    object adsProcessoProdutoCdCtGerencial: TStringField
      FieldName = 'Produto.CdCtGerencial'
      Size = 4
    end
    object adsProcessoProdutoTpFatSemReceita: TStringField
      FieldName = 'Produto.TpFatSemReceita'
      Size = 1
    end
    object adsProcessoProdutoTpProduto: TStringField
      FieldName = 'Produto.TpProduto'
      Size = 2
    end
    object adsProcessoCliente: TAureliusEntityField
      FieldName = 'Cliente'
    end
    object adsProcessoClienteCdEmpresa: TStringField
      FieldName = 'Cliente.CdEmpresa'
      Size = 5
    end
    object adsProcessoClienteNmEmpresa: TStringField
      FieldName = 'Cliente.NmEmpresa'
      Size = 80
    end
    object adsProcessoClienteApEmpresa: TStringField
      FieldName = 'Cliente.ApEmpresa'
      Size = 10
    end
    object adsProcessoClienteEndEmpresa: TStringField
      FieldName = 'Cliente.EndEmpresa'
      Size = 50
    end
    object adsProcessoClienteCdTipoPessoa: TStringField
      FieldName = 'Cliente.CdTipoPessoa'
      Size = 1
    end
    object adsProcessoClienteCgcEmpresa: TStringField
      FieldName = 'Cliente.CgcEmpresa'
      Size = 14
    end
    object adsProcessoClienteCpfEmpresa: TStringField
      FieldName = 'Cliente.CpfEmpresa'
      Size = 11
    end
    object adsProcessoClienteIeEmpresa: TStringField
      FieldName = 'Cliente.IeEmpresa'
    end
    object adsProcessoClienteInCliente: TBooleanField
      FieldName = 'Cliente.InCliente'
    end
    object adsProcessoClienteInImportador: TBooleanField
      FieldName = 'Cliente.InImportador'
    end
    object adsProcessoClienteInExportador: TBooleanField
      FieldName = 'Cliente.InExportador'
    end
    object adsProcessoClienteInOutros: TBooleanField
      FieldName = 'Cliente.InOutros'
    end
    object adsProcessoClienteCdGrupo: TStringField
      FieldName = 'Cliente.CdGrupo'
      Size = 3
    end
    object adsProcessoClienteInRepresentante: TBooleanField
      FieldName = 'Cliente.InRepresentante'
    end
    object adsProcessoClienteInSeguradora: TBooleanField
      FieldName = 'Cliente.InSeguradora'
    end
    object adsProcessoServico: TAureliusEntityField
      FieldName = 'Servico'
    end
    object adsProcessoServicoCdServico: TStringField
      FieldName = 'Servico.CdServico'
      Size = 3
    end
    object adsProcessoServicoNmServico: TStringField
      FieldName = 'Servico.NmServico'
      Size = 50
    end
    object adsProcessoServicoCdClassificacao: TStringField
      FieldName = 'Servico.CdClassificacao'
      Size = 2
    end
    object adsProcessoServicoCdViaTransporte: TStringField
      FieldName = 'Servico.CdViaTransporte'
      Size = 2
    end
    object adsProcessoServicoInAtivo: TStringField
      FieldName = 'Servico.InAtivo'
      Size = 1
    end
    object adsProcessoServicoNrDiasConclusao: TIntegerField
      FieldName = 'Servico.NrDiasConclusao'
    end
    object adsProcessoServicoCdEventoConclusor: TStringField
      FieldName = 'Servico.CdEventoConclusor'
      Size = 3
    end
    object adsProcessoServicoInFollowup: TStringField
      FieldName = 'Servico.InFollowup'
      Size = 1
    end
    object adsProcessoServicoInAdmTemp: TStringField
      FieldName = 'Servico.InAdmTemp'
      Size = 1
    end
    object adsProcessoServicoInIndent: TStringField
      FieldName = 'Servico.InIndent'
      Size = 1
    end
    object adsProcessoServicoCdEvIni: TStringField
      FieldName = 'Servico.CdEvIni'
      Size = 3
    end
    object adsProcessoServicoCdEvFim: TStringField
      FieldName = 'Servico.CdEvFim'
      Size = 3
    end
    object adsProcessoServicoCdGrupo: TStringField
      FieldName = 'Servico.CdGrupo'
      Size = 3
    end
    object adsProcessoServicoTpCtrlVencto: TStringField
      FieldName = 'Servico.TpCtrlVencto'
      Size = 1
    end
    object adsProcessoServicoInCheck: TStringField
      FieldName = 'Servico.InCheck'
      Size = 1
    end
    object adsProcessoServicoTpServico: TStringField
      FieldName = 'Servico.TpServico'
      Size = 1
    end
    object adsProcessoUsuario: TAureliusEntityField
      FieldName = 'Usuario'
    end
    object adsProcessoUsuarioCdUsuario: TStringField
      FieldName = 'Usuario.CdUsuario'
      Size = 4
    end
    object adsProcessoUsuarioCdSenha: TStringField
      FieldName = 'Usuario.CdSenha'
      Size = 10
    end
    object adsProcessoUsuarioCdCargo: TStringField
      FieldName = 'Usuario.CdCargo'
      Size = 3
    end
    object adsProcessoUsuarioNmUsuario: TStringField
      FieldName = 'Usuario.NmUsuario'
      Size = 50
    end
    object adsProcessoUsuarioApUsuario: TStringField
      FieldName = 'Usuario.ApUsuario'
      Size = 15
    end
    object adsProcessoUsuarioInAtivo: TStringField
      FieldName = 'Usuario.InAtivo'
      Size = 1
    end
    object adsProcessoUsuarioCdInstalacao: TStringField
      FieldName = 'Usuario.CdInstalacao'
      Size = 1
    end
    object adsProcessoUsuarioNmEmail: TStringField
      FieldName = 'Usuario.NmEmail'
      Size = 2000
    end
    object adsProcessoUsuarioInAvisoPo: TStringField
      FieldName = 'Usuario.InAvisoPo'
      Size = 1
    end
    object adsProcessoUsuarioCdCelula: TStringField
      FieldName = 'Usuario.CdCelula'
      Size = 2
    end
    object adsProcessoUsuarioCdTranspRod: TStringField
      FieldName = 'Usuario.CdTranspRod'
      Size = 4
    end
    object adsProcessoUsuarioInSelecionado: TStringField
      FieldName = 'Usuario.InSelecionado'
      Size = 1
    end
    object adsProcessoUsuarioCdIdioma: TIntegerField
      FieldName = 'Usuario.CdIdioma'
    end
    object adsProcessoUsuarioDtUltAltSenha: TDateTimeField
      FieldName = 'Usuario.DtUltAltSenha'
    end
    object adsProcessoUsuarioInAltStatusReceb: TStringField
      FieldName = 'Usuario.InAltStatusReceb'
      Size = 1
    end
    object adsProcessoUsuarioCdEmpresa: TStringField
      FieldName = 'Usuario.CdEmpresa'
      Size = 5
    end
    object adsProcessoUsuarioCdChefia: TStringField
      FieldName = 'Usuario.CdChefia'
      Size = 4
    end
    object adsProcessoUsuarioInModoPreview: TStringField
      FieldName = 'Usuario.InModoPreview'
      Size = 1
    end
    object adsProcessoUsuarioInFecharMovFinanc: TStringField
      FieldName = 'Usuario.InFecharMovFinanc'
      Size = 1
    end
    object adsProcessoUsuarioInPermiteFaturamento: TStringField
      FieldName = 'Usuario.InPermiteFaturamento'
      Size = 1
    end
    object adsProcessoUsuarioInPermiteAlteraRegDde: TStringField
      FieldName = 'Usuario.InPermiteAlteraRegDde'
      Size = 1
    end
    object adsProcessoUsuarioCdComputador: TIntegerField
      FieldName = 'Usuario.CdComputador'
    end
    object adsProcessoUsuarioExibeResumo: TStringField
      FieldName = 'Usuario.ExibeResumo'
      Size = 1
    end
    object adsProcessoUsuarioExibeDetalhe: TStringField
      FieldName = 'Usuario.ExibeDetalhe'
      Size = 1
    end
    object adsProcessoUsuarioInZeraLiquidacao: TStringField
      FieldName = 'Usuario.InZeraLiquidacao'
      Size = 1
    end
    object adsProcessoUsuarioGrupoRap: TStringField
      FieldName = 'Usuario.GrupoRap'
      Size = 3
    end
    object adsProcessoUsuarioSupervisaPendencias: TStringField
      FieldName = 'Usuario.SupervisaPendencias'
      Size = 1
    end
    object adsProcessoUsuarioNmSenhaInicial: TStringField
      FieldName = 'Usuario.NmSenhaInicial'
    end
    object adsProcessoUsuarioInManager: TStringField
      FieldName = 'Usuario.InManager'
      Size = 1
    end
    object adsProcessoUsuarioInOnline: TStringField
      FieldName = 'Usuario.InOnline'
      Size = 1
    end
    object adsProcessoUsuarioDtUltAcesso: TDateTimeField
      FieldName = 'Usuario.DtUltAcesso'
    end
    object adsProcessoUsuarioCdTema: TStringField
      FieldName = 'Usuario.CdTema'
      Size = 1
    end
    object adsProcessoUsuarioCdGrupoDetalhes: TStringField
      FieldName = 'Usuario.CdGrupoDetalhes'
      Size = 3
    end
    object adsProcessoUsuarioInManagerSite: TStringField
      FieldName = 'Usuario.InManagerSite'
      Size = 1
    end
    object adsProcessoUsuarioCdSuperiorDireto: TStringField
      FieldName = 'Usuario.CdSuperiorDireto'
      Size = 4
    end
    object adsProcessoUsuarioDtAcessoAgora: TDateTimeField
      FieldName = 'Usuario.DtAcessoAgora'
    end
    object adsProcessoUsuarioDtUltimaAcao: TDateTimeField
      FieldName = 'Usuario.DtUltimaAcao'
    end
    object adsProcessoUsuarioNrServerMoney: TIntegerField
      FieldName = 'Usuario.NrServerMoney'
    end
    object adsProcessoMoedaMle: TAureliusEntityField
      FieldName = 'MoedaMle'
    end
    object adsProcessoMoedaMleCdMoeda: TStringField
      FieldName = 'MoedaMle.CdMoeda'
      Size = 3
    end
    object adsProcessoMoedaMleNmMoeda: TStringField
      FieldName = 'MoedaMle.NmMoeda'
      Size = 30
    end
    object adsProcessoMoedaMleApMoeda: TStringField
      FieldName = 'MoedaMle.ApMoeda'
      Size = 6
    end
    object adsProcessoMoedaMleInAtivo: TStringField
      FieldName = 'MoedaMle.InAtivo'
      Size = 1
    end
    object adsProcessoMoedaMleCdMoedaScx: TStringField
      FieldName = 'MoedaMle.CdMoedaScx'
      Size = 3
    end
    object adsProcessoMoedaMleNmMoedaSing: TStringField
      FieldName = 'MoedaMle.NmMoedaSing'
    end
    object adsProcessoMoedaMleNmMoedaPlural: TStringField
      FieldName = 'MoedaMle.NmMoedaPlural'
    end
    object adsProcessoMoedaMleNmCentavosSing: TStringField
      FieldName = 'MoedaMle.NmCentavosSing'
    end
    object adsProcessoMoedaMleNmCentavosPlural: TStringField
      FieldName = 'MoedaMle.NmCentavosPlural'
    end
    object adsProcessoMoedaMleApMoedaIngles: TStringField
      FieldName = 'MoedaMle.ApMoedaIngles'
      Size = 6
    end
    object adsProcessoMoedaMleNmMoedaSingIng: TStringField
      FieldName = 'MoedaMle.NmMoedaSingIng'
    end
    object adsProcessoMoedaMleNmMoedaPluralIng: TStringField
      FieldName = 'MoedaMle.NmMoedaPluralIng'
    end
    object adsProcessoMoedaMleNmCentavosSingIng: TStringField
      FieldName = 'MoedaMle.NmCentavosSingIng'
    end
    object adsProcessoMoedaMleNmCentavosPluralIng: TStringField
      FieldName = 'MoedaMle.NmCentavosPluralIng'
    end
    object adsProcessoMoedaMleNmMoedaSingEsp: TStringField
      FieldName = 'MoedaMle.NmMoedaSingEsp'
    end
    object adsProcessoMoedaMleNmMoedaPluralEsp: TStringField
      FieldName = 'MoedaMle.NmMoedaPluralEsp'
    end
    object adsProcessoMoedaMleNmCentavosSingEsp: TStringField
      FieldName = 'MoedaMle.NmCentavosSingEsp'
    end
    object adsProcessoMoedaMleNmCentavosPluralEsp: TStringField
      FieldName = 'MoedaMle.NmCentavosPluralEsp'
    end
    object adsProcessoPaisDestino: TAureliusEntityField
      FieldName = 'PaisDestino'
    end
    object adsProcessoPaisDestinoCdPais: TStringField
      FieldName = 'PaisDestino.CdPais'
      Size = 3
    end
    object adsProcessoPaisDestinoNmPais: TStringField
      FieldName = 'PaisDestino.NmPais'
      Size = 120
    end
    object adsProcessoPaisDestinoNmSiglaCrt: TStringField
      FieldName = 'PaisDestino.NmSiglaCrt'
      Size = 2
    end
    object adsProcessoDespachante: TAureliusEntityField
      FieldName = 'Despachante'
    end
    object adsProcessoDespachanteCdDespachante: TStringField
      FieldName = 'Despachante.CdDespachante'
      Size = 3
    end
    object adsProcessoDespachanteNmDespachante: TStringField
      FieldName = 'Despachante.NmDespachante'
      Size = 50
    end
    object adsProcessoDespachanteApDespachante: TStringField
      FieldName = 'Despachante.ApDespachante'
      Size = 10
    end
    object adsProcessoDespachanteVlMinSda: TFloatField
      FieldName = 'Despachante.VlMinSda'
    end
    object adsProcessoDespachanteVlMaxSda: TFloatField
      FieldName = 'Despachante.VlMaxSda'
    end
    object adsProcessoDespachanteCdRisc: TStringField
      FieldName = 'Despachante.CdRisc'
      Size = 3
    end
    object adsProcessoDespachanteInAtivo: TStringField
      FieldName = 'Despachante.InAtivo'
      Size = 1
    end
    object adsProcessoDespachanteCdFavorecido: TStringField
      FieldName = 'Despachante.CdFavorecido'
      Size = 5
    end
    object adsProcessoDespachanteCdModSda: TStringField
      FieldName = 'Despachante.CdModSda'
      Size = 2
    end
    object adsProcessoDespachanteNrRegistro: TStringField
      FieldName = 'Despachante.NrRegistro'
      Size = 9
    end
    object adsProcessoDespachanteCpfDespachante: TStringField
      FieldName = 'Despachante.CpfDespachante'
      Size = 11
    end
    object adsProcessoDespachanteNrContaCorrente: TStringField
      FieldName = 'Despachante.NrContaCorrente'
      Size = 10
    end
    object adsProcessoDespachanteNrDigitoContaCorrente: TStringField
      FieldName = 'Despachante.NrDigitoContaCorrente'
      Size = 1
    end
    object adsProcessoDespachanteCdDespSda: TStringField
      FieldName = 'Despachante.CdDespSda'
      Size = 12
    end
    object adsProcessoDespachanteCdProduto: TStringField
      FieldName = 'Despachante.CdProduto'
      Size = 2
    end
    object adsProcessoDespachanteNmSenha: TStringField
      FieldName = 'Despachante.NmSenha'
      Size = 12
    end
    object adsProcessoDespachanteInConsultaSiscomex: TStringField
      FieldName = 'Despachante.InConsultaSiscomex'
      Size = 1
    end
    object adsProcessoDespachanteCdUsuario: TStringField
      FieldName = 'Despachante.CdUsuario'
      Size = 4
    end
    object adsProcessoDespachanteDtSenha: TDateTimeField
      FieldName = 'Despachante.DtSenha'
    end
    object adsProcessoIncoterm: TAureliusEntityField
      FieldName = 'Incoterm'
    end
    object adsProcessoIncotermCodigo: TStringField
      FieldName = 'Incoterm.Codigo'
      Size = 3
    end
    object adsProcessoIncotermDescricao: TStringField
      FieldName = 'Incoterm.Descricao'
      Size = 60
    end
    object adsProcessoIncotermSinal: TStringField
      FieldName = 'Incoterm.Sinal'
      Size = 1
    end
    object adsProcessoIncotermInTipoFrete: TStringField
      FieldName = 'Incoterm.InTipoFrete'
      Size = 2
    end
    object adsProcessoExportador: TAureliusEntityField
      FieldName = 'Exportador'
    end
    object adsProcessoExportadorCdEmpresa: TStringField
      FieldName = 'Exportador.CdEmpresa'
      Size = 5
    end
    object adsProcessoExportadorNmEmpresa: TStringField
      FieldName = 'Exportador.NmEmpresa'
      Size = 80
    end
    object adsProcessoExportadorApEmpresa: TStringField
      FieldName = 'Exportador.ApEmpresa'
      Size = 10
    end
    object adsProcessoExportadorEndEmpresa: TStringField
      FieldName = 'Exportador.EndEmpresa'
      Size = 50
    end
    object adsProcessoExportadorCdTipoPessoa: TStringField
      FieldName = 'Exportador.CdTipoPessoa'
      Size = 1
    end
    object adsProcessoExportadorCgcEmpresa: TStringField
      FieldName = 'Exportador.CgcEmpresa'
      Size = 14
    end
    object adsProcessoExportadorCpfEmpresa: TStringField
      FieldName = 'Exportador.CpfEmpresa'
      Size = 11
    end
    object adsProcessoExportadorIeEmpresa: TStringField
      FieldName = 'Exportador.IeEmpresa'
    end
    object adsProcessoExportadorInCliente: TBooleanField
      FieldName = 'Exportador.InCliente'
    end
    object adsProcessoExportadorInImportador: TBooleanField
      FieldName = 'Exportador.InImportador'
    end
    object adsProcessoExportadorInExportador: TBooleanField
      FieldName = 'Exportador.InExportador'
    end
    object adsProcessoExportadorInOutros: TBooleanField
      FieldName = 'Exportador.InOutros'
    end
    object adsProcessoExportadorCdGrupo: TStringField
      FieldName = 'Exportador.CdGrupo'
      Size = 3
    end
    object adsProcessoExportadorInRepresentante: TBooleanField
      FieldName = 'Exportador.InRepresentante'
    end
    object adsProcessoExportadorInSeguradora: TBooleanField
      FieldName = 'Exportador.InSeguradora'
    end
    object adsProcessoProcessoExp: TDataSetField
      FieldName = 'ProcessoExp'
      ReadOnly = True
    end
    object adsProcessoCdChaveAcessoDue: TStringField
      FieldName = 'CdChaveAcessoDue'
    end
  end
  object adsNCMDestaque: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CodigoNcm'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CdAtributo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CdDominio'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NmDominio'
        DataType = ftString
        Size = 200
      end>
    Left = 660
    Top = 44
    DesignClass = 'MyEntitiesBroker.TTncmExpDestaque'
    object adsNCMDestaqueSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsNCMDestaqueCodigoNcm: TStringField
      FieldName = 'CodigoNcm'
      Required = True
      Size = 8
    end
    object adsNCMDestaqueCdAtributo: TStringField
      FieldName = 'CdAtributo'
      Required = True
      Size = 10
    end
    object adsNCMDestaqueCdDominio: TStringField
      FieldName = 'CdDominio'
      Required = True
      Size = 2
    end
    object adsNCMDestaqueNmDominio: TStringField
      FieldName = 'NmDominio'
      Size = 200
    end
  end
  object adsProcExpNfItemEnquadramento: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdEnquadramento'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end>
    Left = 372
    Top = 41
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemEnquadramento'
    object adsProcExpNfItemEnquadramentoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcExpNfItemEnquadramentoNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsProcExpNfItemEnquadramentoNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsProcExpNfItemEnquadramentoNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsProcExpNfItemEnquadramentoCdEnquadramento: TStringField
      FieldName = 'CdEnquadramento'
      Required = True
      Size = 5
    end
  end
  object adsProcExpNfItemNfRef: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrItemNfRef'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ChaveAcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 44
      end
      item
        Name = 'QtTributavel'
        DataType = ftFloat
      end
      item
        Name = 'NrItemNfRefItem'
        DataType = ftInteger
      end
      item
        Name = 'NrCpfCnpjSubmitter'
        DataType = ftString
        Size = 14
      end>
    Left = 372
    Top = 97
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemNotaReferenciada'
    object adsProcExpNfItemNfRefSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcExpNfItemNfRefNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsProcExpNfItemNfRefNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsProcExpNfItemNfRefNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsProcExpNfItemNfRefNrItemNfRef: TIntegerField
      FieldName = 'NrItemNfRef'
      Required = True
    end
    object adsProcExpNfItemNfRefChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Required = True
      Size = 44
    end
    object adsProcExpNfItemNfRefQtTributavel: TFloatField
      FieldName = 'QtTributavel'
    end
    object adsProcExpNfItemNfRefNrItemNfRefItem: TIntegerField
      FieldName = 'NrItemNfRefItem'
    end
    object adsProcExpNfItemNfRefNrCpfCnpjSubmitter: TStringField
      FieldName = 'NrCpfCnpjSubmitter'
      Size = 14
    end
  end
  object dtsLPCO: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdLpco'
        Attributes = [faRequired]
        DataType = ftString
        Size = 11
      end>
    SubpropsDepth = 2
    Left = 373
    Top = 151
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemLpco'
    object dtsLPCOSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsLPCONrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object dtsLPCONrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object dtsLPCONrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object dtsLPCOCdLpco: TStringField
      FieldName = 'CdLpco'
      Required = True
      Size = 11
    end
  end
  object adsProcExpNfItemNfComplementar: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ChaveAcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 44
      end
      item
        Name = 'NrItemNfComplementarItem'
        DataType = ftInteger
      end>
    Left = 372
    Top = 201
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemNfComplementar'
    object adsProcExpNfItemNfComplementarSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcExpNfItemNfComplementarNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsProcExpNfItemNfComplementarNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsProcExpNfItemNfComplementarNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsProcExpNfItemNfComplementarChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Required = True
      Size = 44
    end
    object adsProcExpNfItemNfComplementarNrItemNfComplementarItem: TIntegerField
      FieldName = 'NrItemNfComplementarItem'
    end
  end
  object adsProcExpNfItemACDrawback: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrSeqNfDrawback'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NrChaveAcessoNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 44
      end
      item
        Name = 'QuantidadeNf'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DataNf'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ValorMoedaNegociacaoNf'
        Attributes = [faRequired]
        DataType = ftFloat
      end>
    SubpropsDepth = 1
    Left = 658
    Top = 212
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemNfDrawback'
    object adsProcExpNfItemACDrawbackSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcExpNfItemACDrawbackNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsProcExpNfItemACDrawbackNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsProcExpNfItemACDrawbackNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsProcExpNfItemACDrawbackNrSeqNfDrawback: TIntegerField
      FieldName = 'NrSeqNfDrawback'
      Required = True
    end
    object adsProcExpNfItemACDrawbackNrChaveAcessoNf: TStringField
      FieldName = 'NrChaveAcessoNf'
      Required = True
      Size = 44
    end
    object adsProcExpNfItemACDrawbackQuantidadeNf: TFloatField
      FieldName = 'QuantidadeNf'
      Required = True
    end
    object adsProcExpNfItemACDrawbackDataNf: TDateField
      FieldName = 'DataNf'
      Required = True
    end
    object adsProcExpNfItemACDrawbackValorMoedaNegociacaoNf: TFloatField
      FieldName = 'ValorMoedaNegociacaoNf'
      Required = True
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 932
    Top = 531
  end
end
