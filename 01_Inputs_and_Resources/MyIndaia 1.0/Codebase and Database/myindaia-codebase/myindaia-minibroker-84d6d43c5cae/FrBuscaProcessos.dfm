object FrBuscaProcessos: TFrBuscaProcessos
  Left = 0
  Top = 0
  Width = 451
  Height = 249
  Align = alTop
  TabOrder = 0
  object pnlFiltroProcesso: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 249
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlStyle1: TPanel
      Left = 0
      Top = 0
      Width = 344
      Height = 4
      Align = alTop
      BevelOuter = bvNone
      Color = 16758122
      ParentBackground = False
      TabOrder = 0
    end
    object pnlFiltroProc: TPanel
      Left = 0
      Top = 4
      Width = 344
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lblUnidNeg: TLabel
        Left = 10
        Top = 13
        Width = 110
        Height = 14
        Caption = 'Unidade de Neg'#243'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblProduto: TLabel
        Left = 297
        Top = 13
        Width = 44
        Height = 14
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFiltroProcesso: TLabel
        Left = 583
        Top = 10
        Width = 48
        Height = 14
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbcbUnidNegocioNome: TDBLookupComboBox
        Left = 50
        Top = 30
        Width = 230
        Height = 22
        Color = clWhite
        DropDownWidth = 272
        KeyField = 'CdUnidNeg'
        ListField = 'NmUnidNeg'
        ListSource = dtsUnidade
        NullValueKey = 16401
        TabOrder = 0
        TabStop = False
        OnCloseUp = dbcbUnidNegocioNomeCloseUp
        OnExit = dbcbUnidNegocioNomeExit
        OnKeyDown = dbcbUnidNegocioNomeKeyDown
      end
      object dbcbProdutoNome: TDBLookupComboBox
        Left = 336
        Top = 30
        Width = 230
        Height = 22
        Color = clWhite
        DropDownWidth = 272
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'CdProduto'
        ListField = 'NmProduto'
        ListSource = dtsProduto
        NullValueKey = 16401
        ParentFont = False
        TabOrder = 1
        TabStop = False
        OnCloseUp = dbcbProdutoNomeCloseUp
        OnExit = dbcbProdutoNomeExit
        OnKeyDown = dbcbProdutoNomeKeyDown
      end
      object edtProcesso: TcxMaskEdit
        Left = 583
        Top = 30
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.EditMask = 'll-999999-99;1;_'
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Text = '  -      -  '
        OnEnter = edtProcessoEnter
        OnKeyDown = edtProcessoKeyDown
        OnKeyPress = edtProcessoKeyPress
        Width = 100
      end
      object edtProduto: TcxMaskEdit
        Left = 297
        Top = 30
        ParentFont = False
        Properties.EditMask = '99;1; '
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Text = '  '
        OnEnter = edtProdutoEnter
        OnExit = edtProdutoExit
        OnKeyDown = edtProdutoKeyDown
        OnKeyPress = edtProdutoKeyPress
        Width = 35
      end
      object edtUnidadeNeg: TcxMaskEdit
        Left = 10
        Top = 30
        ParentFont = False
        Properties.EditMask = '99;1; '
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Text = '  '
        OnExit = edtUnidadeNegExit
        OnKeyDown = edtUnidadeNegKeyDown
        OnKeyPress = edtUnidadeNegKeyPress
        Width = 35
      end
    end
    object pnlResumoProc: TPanel
      Left = 0
      Top = 69
      Width = 344
      Height = 108
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object lblCliente: TLabel
        Left = 11
        Top = 60
        Width = 37
        Height = 14
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCnpj: TLabel
        Left = 374
        Top = 60
        Width = 52
        Height = 14
        Caption = 'CNPJ/CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblServico: TLabel
        Left = 168
        Top = 8
        Width = 39
        Height = 14
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblProcesso: TLabel
        Left = 11
        Top = 8
        Width = 48
        Height = 14
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnlStyle2: TPanel
        Left = 0
        Top = 0
        Width = 791
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        Color = 16758122
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 344
      end
      object dbedtCliente: TDBEdit
        Left = 11
        Top = 77
        Width = 357
        Height = 22
        Color = 14935011
        DataField = 'Cliente.NmEmpresa'
        DataSource = dtsProcesso
        TabOrder = 1
      end
      object dbedtCNPJ: TDBEdit
        Left = 374
        Top = 77
        Width = 121
        Height = 22
        Color = 14935011
        DataField = 'CnpjCliente'
        DataSource = dtsProcesso
        TabOrder = 2
      end
      object dbedtServico: TDBEdit
        Left = 168
        Top = 25
        Width = 304
        Height = 22
        Color = 14935011
        DataField = 'Servico.NmServico'
        DataSource = dtsProcesso
        TabOrder = 3
      end
      object dbedtProcesso: TDBEdit
        Left = 11
        Top = 25
        Width = 142
        Height = 22
        Color = 14935011
        DataField = 'NrProcesso'
        DataSource = dtsProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  object pnlBuscarProcesso: TPanel
    Left = 344
    Top = 0
    Width = 107
    Height = 249
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnPesquisar: TBitBtn
      Left = 15
      Top = 20
      Width = 75
      Height = 34
      Caption = 'Buscar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnPesquisarClick
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
        Name = 'NrViagem'
        DataType = ftString
        Size = 15
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
        Name = 'TpFrete'
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
        Name = 'CdLinguaPedido'
        DataType = ftString
        Size = 1
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
        Name = 'InProcessoConsolidado'
        DataType = ftBoolean
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
        Name = 'Cliente.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Cliente.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Cliente.EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Cliente.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Cliente.EndCep'
        DataType = ftString
        Size = 8
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
        Name = 'Cliente.InAtivo'
        DataType = ftString
        Size = 1
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
        Name = 'Cliente.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente.CdPaisImportador'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Cliente.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente.EndCompl'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cliente.EndComplemento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cliente.CdGrupo'
        DataType = ftVariant
      end
      item
        Name = 'Cliente.CdGrupo.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Cliente.CdGrupo.NmGrupo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cliente.CdGrupo.DtInclusao'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente.CdGrupo.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Cliente.CdGrupo.CnpjGrupo'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Cliente.CdGrupo.DtNovoFollowupImp'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente.CdGrupo.DtNovoFollowupExp'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente.CdGrupo.NmEmailDraftBl'
        DataType = ftString
        Size = 100
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
        Name = 'Usuario.NmEmail'
        DataType = ftString
        Size = 2000
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
        Name = 'Exportador.CdGrupo'
        DataType = ftVariant
      end
      item
        Name = 'Exportador.CdGrupo.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Exportador.CdGrupo.NmGrupo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Exportador.CdGrupo.DtInclusao'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.CdGrupo.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Exportador.CdGrupo.CnpjGrupo'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Exportador.CdGrupo.DtNovoFollowupImp'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.CdGrupo.DtNovoFollowupExp'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.CdGrupo.NmEmailDraftBl'
        DataType = ftString
        Size = 100
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
        Name = 'Servico.InNovoServico'
        DataType = ftInteger
      end
      item
        Name = 'Agente'
        DataType = ftVariant
      end
      item
        Name = 'Agente.CdAgente'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Agente.NmAgente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Agente.NrCgcAgente'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Agente.NrSigla'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Agente.DsEndereco'
        DataType = ftString
        Size = 260
      end
      item
        Name = 'Agente.NrZipCode'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Agente.DsEmail'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Agente.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Agente.DsScacCode'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Agente.CdCidade'
        DataType = ftVariant
      end
      item
        Name = 'Agente.CdCidade.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Agente.CdCidade.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Agente.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Agente.Pais.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Agente.Pais.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Agente.Pais.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Notify1Proc'
        DataType = ftVariant
      end
      item
        Name = 'Notify1Proc.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Notify1Proc.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify1Proc.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Notify1Proc.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify1Proc.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Notify1Proc.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Notify1Proc.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify1Proc.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify1Proc.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Notify1Proc.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Notify1Proc.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Notify1Proc.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Notify1Proc.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Notify1Proc.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Notify1Proc.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Notify1Proc.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Notify1Proc.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Notify1Proc.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Notify1Proc.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify1Proc.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify1Proc.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Notify1Proc.Pais.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Notify1Proc.Pais.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Notify1Proc.Pais.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Notify2Proc'
        DataType = ftVariant
      end
      item
        Name = 'Notify2Proc.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Notify2Proc.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify2Proc.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Notify2Proc.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify2Proc.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Notify2Proc.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Notify2Proc.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify2Proc.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify2Proc.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Notify2Proc.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Notify2Proc.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Notify2Proc.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Notify2Proc.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Notify2Proc.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Notify2Proc.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Notify2Proc.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Notify2Proc.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Notify2Proc.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Notify2Proc.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify2Proc.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify2Proc.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Notify2Proc.Pais.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Notify2Proc.Pais.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Notify2Proc.Pais.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Consignee'
        DataType = ftVariant
      end
      item
        Name = 'Consignee.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Consignee.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Consignee.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Consignee.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Consignee.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Consignee.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Consignee.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Consignee.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Consignee.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Consignee.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Consignee.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Consignee.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Consignee.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Consignee.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Consignee.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Consignee.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Consignee.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Consignee.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Consignee.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Consignee.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Consignee.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Consignee.Pais.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Consignee.Pais.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Consignee.Pais.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Embarcacao'
        DataType = ftVariant
      end
      item
        Name = 'Embarcacao.CdEmbarcacao'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Embarcacao.NmEmbarcacao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'LocalEmbarque'
        DataType = ftVariant
      end
      item
        Name = 'LocalEmbarque.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'LocalEmbarque.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LocalDesembarque'
        DataType = ftVariant
      end
      item
        Name = 'LocalDesembarque.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'LocalDesembarque.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ProcessoExp'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    OnCalcFields = adsProcessoCalcFields
    SubpropsDepth = 2
    SyncSubprops = True
    Left = 744
    Top = 87
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
    object adsProcessoUnidNeg: TAureliusEntityField
      FieldName = 'UnidNeg'
      Required = True
    end
    object adsProcessoProduto: TAureliusEntityField
      FieldName = 'Produto'
      Required = True
    end
    object adsProcessoCliente: TAureliusEntityField
      FieldName = 'Cliente'
    end
    object adsProcessoClienteNmEmpresa: TStringField
      FieldName = 'Cliente.NmEmpresa'
      Size = 80
    end
    object adsProcessoClienteCgcEmpresa: TStringField
      FieldName = 'Cliente.CgcEmpresa'
      Size = 14
    end
    object adsProcessoServicoNmServico: TStringField
      FieldName = 'Servico.NmServico'
      Size = 50
    end
    object adsProcessoCNPJ_CLIENTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CnpjCliente'
      Size = 18
      Calculated = True
    end
    object adsProcessoCdLinguaPedido: TStringField
      FieldName = 'CdLinguaPedido'
      Size = 1
    end
  end
  object dtsProcesso: TDataSource
    AutoEdit = False
    DataSet = adsProcesso
    Left = 752
    Top = 87
  end
  object adsProduto: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdProduto'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NmProduto'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ApProduto'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CdViatransp'
        DataType = ftString
        Size = 1
      end>
    Left = 640
    Top = 87
    DesignClass = 'MyEntitiesBroker.TTproduto'
    object adsProdutoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProdutoCdProduto: TStringField
      FieldName = 'CdProduto'
      Required = True
      Size = 2
    end
    object adsProdutoNmProduto: TStringField
      FieldName = 'NmProduto'
      Required = True
      Size = 40
    end
  end
  object dtsProduto: TDataSource
    AutoEdit = False
    DataSet = adsProduto
    Left = 656
    Top = 87
  end
  object adsUnidade: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdUnidNeg'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NmUnidNeg'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ApUnidNeg'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end>
    Left = 552
    Top = 87
    DesignClass = 'MyEntitiesBroker.TTunidNeg'
    object adsUnidadeSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsUnidadeCdUnidNeg: TStringField
      FieldName = 'CdUnidNeg'
      Required = True
      Size = 2
    end
    object adsUnidadeNmUnidNeg: TStringField
      FieldName = 'NmUnidNeg'
      Required = True
      Size = 50
    end
  end
  object dtsUnidade: TDataSource
    AutoEdit = False
    DataSet = adsUnidade
    Left = 544
    Top = 87
  end
end
