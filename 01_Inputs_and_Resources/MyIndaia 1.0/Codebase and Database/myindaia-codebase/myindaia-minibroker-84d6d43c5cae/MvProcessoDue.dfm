inherited formMvProcessoDue: TformMvProcessoDue
  Caption = 'Processo DUE'
  ClientHeight = 749
  ClientWidth = 1126
  ExplicitWidth = 1142
  ExplicitHeight = 788
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 729
    Width = 1126
    ExplicitTop = 729
    ExplicitWidth = 1126
  end
  inherited PageControl: TPageControl
    Width = 1126
    Height = 729
    ExplicitWidth = 1126
    ExplicitHeight = 729
    inherited tshGrid: TTabSheet
      ExplicitWidth = 1118
      ExplicitHeight = 695
      inherited pnlButtonGrid: TPanel
        Left = 1015
        Height = 695
        ExplicitLeft = 1015
        ExplicitHeight = 695
        object Bevel1: TBevel [0]
          Left = 15
          Top = 128
          Width = 81
          Height = 2
        end
        object Bevel2: TBevel [1]
          Left = 15
          Top = 227
          Width = 81
          Height = 2
        end
        object Bevel3: TBevel [2]
          Left = 15
          Top = 171
          Width = 81
          Height = 2
        end
        inherited btnIncluir: TButton
          Width = 84
          Enabled = False
          ExplicitWidth = 84
        end
        inherited btnAlterar: TButton
          Width = 84
          ExplicitWidth = 84
        end
        object btnContexto: TButton [5]
          Left = 15
          Top = 137
          Width = 84
          Height = 25
          Hint = 'Atalho: [Ctrl + P]'
          Anchors = [akTop, akRight]
          Caption = 'Pesquisar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnContextoClick
        end
        object btnDue: TButton [6]
          Left = 15
          Top = 168
          Width = 84
          Height = 25
          Hint = 'Converter em DU-e'
          Anchors = [akTop, akRight]
          Caption = '+ DUE  '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnDueClick
        end
        object btnEnviar: TButton [7]
          Left = 15
          Top = 233
          Width = 84
          Height = 25
          Hint = 'Enviar DUE'
          Anchors = [akTop, akRight]
          Caption = 'Enviar DUE'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnEnviarClick
        end
        inherited btnConsultar: TButton
          Width = 84
          Enabled = False
          ExplicitWidth = 84
        end
        inherited btnExcluir: TButton
          Width = 84
          Enabled = False
          ExplicitWidth = 84
        end
        inherited cbxAltRapida: TCheckBox
          Left = 15
          Top = 291
          Width = 92
          TabOrder = 7
          ExplicitLeft = 15
          ExplicitTop = 291
          ExplicitWidth = 92
        end
        object btnNF: TButton
          Left = 15
          Top = 199
          Width = 84
          Height = 25
          Hint = 'Tela de NF'
          Anchors = [akTop, akRight]
          Caption = 'NF'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = btnNFClick
        end
        object btnRetificarDue: TButton
          Left = 15
          Top = 261
          Width = 84
          Height = 25
          Hint = 'Enviar DUE'
          Anchors = [akTop, akRight]
          Caption = 'Retificar DUE'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = btnRetificarDueClick
        end
      end
      inherited pnlGrid: TPanel
        Width = 1015
        Height = 695
        ExplicitWidth = 1015
        ExplicitHeight = 695
        inherited SplitterGridDetail: TSplitter
          Top = 579
          Width = 1015
          ExplicitTop = 331
          ExplicitWidth = 804
        end
        inherited cxGrid: TcxGrid
          Width = 1015
          Height = 575
          ExplicitWidth = 1015
          ExplicitHeight = 575
          inherited cxGridDBTableView: TcxGridDBTableView
            Filtering.ColumnAddValueItems = True
            Filtering.ColumnFilteredItemsList = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            object cxGridDBTableViewProcessoExp: TcxGridDBColumn
              DataBinding.FieldName = 'ProcessoExp'
              Visible = False
            end
            object cxGridDBTableViewNrProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'NrProcesso'
            end
            object cxGridDBTableViewDtAbertura: TcxGridDBColumn
              DataBinding.FieldName = 'DtAbertura'
              Visible = False
              Width = 90
            end
            object cxGridDBTableViewProcExpCdExportador: TcxGridDBColumn
              DataBinding.FieldName = 'ProcExpCdExportador'
              Visible = False
              Width = 75
            end
            object cxGridDBTableViewProcExpNmExportador: TcxGridDBColumn
              DataBinding.FieldName = 'ProcExpNmExportador'
              Width = 200
            end
            object cxGridDBTableViewProcExpCNPJExportador: TcxGridDBColumn
              DataBinding.FieldName = 'ProcExpCNPJExportador'
              Width = 130
            end
            object cxGridDBTableViewClienteCdEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.CdEmpresa'
              Visible = False
              Width = 76
            end
            object cxGridDBTableViewClienteNmEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.NmEmpresa'
              Visible = False
            end
            object cxGridDBTableViewClienteCgcEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.CgcEmpresa'
              Visible = False
              Width = 20
            end
            object cxGridDBTableViewCdRuc: TcxGridDBColumn
              DataBinding.FieldName = 'CdRuc'
              Visible = False
            end
            object cxGridDBTableViewCdDue: TcxGridDBColumn
              DataBinding.FieldName = 'CdDue'
            end
            object cxGridDBTableViewtxStatusDue: TcxGridDBColumn
              DataBinding.FieldName = 'txStatusDue'
            end
            object cxGridDBTableViewInExisteProcessoExp: TcxGridDBColumn
              DataBinding.FieldName = 'InExisteProcessoExp'
              Width = 127
            end
            object cxGridDBTableViewInDue: TcxGridDBColumn
              DataBinding.FieldName = 'InDue'
              Visible = False
            end
            object cxGridDBTableViewSelf: TcxGridDBColumn
              DataBinding.FieldName = 'Self'
              Visible = False
            end
            object cxGridDBTableViewInCancelado: TcxGridDBColumn
              DataBinding.FieldName = 'InCancelado'
              Visible = False
            end
            object cxGridDBTableViewVlMleMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlMleMneg'
              Visible = False
            end
            object cxGridDBTableViewVlFretePrepaidMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlFretePrepaidMneg'
              Visible = False
            end
            object cxGridDBTableViewVlSeguroMn: TcxGridDBColumn
              DataBinding.FieldName = 'VlSeguroMn'
              Visible = False
            end
            object cxGridDBTableViewNrProcessoExpTemp: TcxGridDBColumn
              DataBinding.FieldName = 'NrProcessoExpTemp'
              Visible = False
            end
            object cxGridDBTableViewVlPesoLiquido: TcxGridDBColumn
              DataBinding.FieldName = 'VlPesoLiquido'
              Visible = False
            end
            object cxGridDBTableViewVlPesoBruto: TcxGridDBColumn
              DataBinding.FieldName = 'VlPesoBruto'
              Visible = False
            end
            object cxGridDBTableViewTpProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'TpProcesso'
              Visible = False
            end
            object cxGridDBTableViewNrFatura: TcxGridDBColumn
              DataBinding.FieldName = 'NrFatura'
              Visible = False
            end
            object cxGridDBTableViewCdGrupo: TcxGridDBColumn
              DataBinding.FieldName = 'CdGrupo'
              Visible = False
            end
            object cxGridDBTableViewVlDescontoMn: TcxGridDBColumn
              DataBinding.FieldName = 'VlDescontoMn'
              Visible = False
            end
            object cxGridDBTableViewVlAcrescimoMn: TcxGridDBColumn
              DataBinding.FieldName = 'VlAcrescimoMn'
              Visible = False
            end
            object cxGridDBTableViewUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegCdUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.CdUnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNmUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NmUnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegApUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.ApUnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.InAtivo'
              Visible = False
            end
            object cxGridDBTableViewUnidNegVlAliqIss: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.VlAliqIss'
              Visible = False
            end
            object cxGridDBTableViewUnidNegCgcUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.CgcUnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegCdFilial: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.CdFilial'
              Visible = False
            end
            object cxGridDBTableViewUnidNegEndUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.EndUnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegEndNumero: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.EndNumero'
              Visible = False
            end
            object cxGridDBTableViewUnidNegEndCompl: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.EndCompl'
              Visible = False
            end
            object cxGridDBTableViewUnidNegEndBairro: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.EndBairro'
              Visible = False
            end
            object cxGridDBTableViewUnidNegEndCidade: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.EndCidade'
              Visible = False
            end
            object cxGridDBTableViewUnidNegEndUf: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.EndUf'
              Visible = False
            end
            object cxGridDBTableViewUnidNegIeUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.IeUnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegImUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.ImUnidNeg'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrFone: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrFone'
              Visible = False
            end
            object cxGridDBTableViewUnidNegEndCep: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.EndCep'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrFax1: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrFax1'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrFax2: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrFax2'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNmSlogan: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NmSlogan'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrNotaFatura: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrNotaFatura'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNmEmail: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NmEmail'
              Visible = False
            end
            object cxGridDBTableViewUnidNegPathRelatorios: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.PathRelatorios'
              Visible = False
            end
            object cxGridDBTableViewUnidNegPathSiscomex: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.PathSiscomex'
              Visible = False
            end
            object cxGridDBTableViewUnidNegPathRei: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.PathRei'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNmDiretor: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NmDiretor'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrCpfDiretor: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrCpfDiretor'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNmContador: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NmContador'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrCrcContador: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrCrcContador'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNmProcurador: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NmProcurador'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrCpfProcurador: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrCpfProcurador'
              Visible = False
            end
            object cxGridDBTableViewUnidNegCdPais: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.CdPais'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrProcNfPref: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrProcNfPref'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNrLivro: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NrLivro'
              Visible = False
            end
            object cxGridDBTableViewUnidNegNmSigla: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.NmSigla'
              Visible = False
            end
            object cxGridDBTableViewUnidNegVlPercIss: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.VlPercIss'
              Visible = False
            end
            object cxGridDBTableViewUnidNegCdBancoConciliacao: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.CdBancoConciliacao'
              Visible = False
            end
            object cxGridDBTableViewUnidNegCdDac: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.CdDac'
              Visible = False
            end
            object cxGridDBTableViewUnidNegCdCtCusto: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.CdCtCusto'
              Visible = False
            end
            object cxGridDBTableViewUnidNegIdArquivoNovoex: TcxGridDBColumn
              DataBinding.FieldName = 'UnidNeg.IdArquivoNovoex'
              Visible = False
            end
            object cxGridDBTableViewProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Produto'
              Visible = False
            end
            object cxGridDBTableViewProdutoCdProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.CdProduto'
              Visible = False
            end
            object cxGridDBTableViewProdutoNmProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.NmProduto'
              Visible = False
            end
            object cxGridDBTableViewProdutoApProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.ApProduto'
              Visible = False
            end
            object cxGridDBTableViewProdutoInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.InAtivo'
              Visible = False
            end
            object cxGridDBTableViewProdutoCdViatransp: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.CdViatransp'
              Visible = False
            end
            object cxGridDBTableViewProdutoCdCtGerencial: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.CdCtGerencial'
              Visible = False
            end
            object cxGridDBTableViewProdutoTpFatSemReceita: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.TpFatSemReceita'
              Visible = False
            end
            object cxGridDBTableViewProdutoTpProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Produto.TpProduto'
              Visible = False
            end
            object cxGridDBTableViewCliente: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente'
              Visible = False
            end
            object cxGridDBTableViewClienteApEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.ApEmpresa'
              Visible = False
            end
            object cxGridDBTableViewClienteEndEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.EndEmpresa'
              Visible = False
            end
            object cxGridDBTableViewClienteCdTipoPessoa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.CdTipoPessoa'
              Visible = False
            end
            object cxGridDBTableViewClienteCpfEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.CpfEmpresa'
              Visible = False
            end
            object cxGridDBTableViewClienteIeEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.IeEmpresa'
              Visible = False
            end
            object cxGridDBTableViewClienteInCliente: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.InCliente'
              Visible = False
            end
            object cxGridDBTableViewClienteInImportador: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.InImportador'
              Visible = False
            end
            object cxGridDBTableViewClienteInExportador: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.InExportador'
              Visible = False
            end
            object cxGridDBTableViewClienteInOutros: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.InOutros'
              Visible = False
            end
            object cxGridDBTableViewClienteCdGrupo: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.CdGrupo'
              Visible = False
            end
            object cxGridDBTableViewClienteInRepresentante: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.InRepresentante'
              Visible = False
            end
            object cxGridDBTableViewClienteInSeguradora: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente.InSeguradora'
              Visible = False
            end
            object cxGridDBTableViewServico: TcxGridDBColumn
              DataBinding.FieldName = 'Servico'
              Visible = False
            end
            object cxGridDBTableViewServicoCdServico: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.CdServico'
              Visible = False
            end
            object cxGridDBTableViewServicoNmServico: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.NmServico'
              Visible = False
            end
            object cxGridDBTableViewServicoCdClassificacao: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.CdClassificacao'
              Visible = False
            end
            object cxGridDBTableViewServicoCdViaTransporte: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.CdViaTransporte'
              Visible = False
            end
            object cxGridDBTableViewServicoInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.InAtivo'
              Visible = False
            end
            object cxGridDBTableViewServicoNrDiasConclusao: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.NrDiasConclusao'
              Visible = False
            end
            object cxGridDBTableViewServicoCdEventoConclusor: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.CdEventoConclusor'
              Visible = False
            end
            object cxGridDBTableViewServicoInFollowup: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.InFollowup'
              Visible = False
            end
            object cxGridDBTableViewServicoInAdmTemp: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.InAdmTemp'
              Visible = False
            end
            object cxGridDBTableViewServicoInIndent: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.InIndent'
              Visible = False
            end
            object cxGridDBTableViewServicoCdEvIni: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.CdEvIni'
              Visible = False
            end
            object cxGridDBTableViewServicoCdEvFim: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.CdEvFim'
              Visible = False
            end
            object cxGridDBTableViewServicoCdGrupo: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.CdGrupo'
              Visible = False
            end
            object cxGridDBTableViewServicoTpCtrlVencto: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.TpCtrlVencto'
              Visible = False
            end
            object cxGridDBTableViewServicoInCheck: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.InCheck'
              Visible = False
            end
            object cxGridDBTableViewServicoTpServico: TcxGridDBColumn
              DataBinding.FieldName = 'Servico.TpServico'
              Visible = False
            end
            object cxGridDBTableViewUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdUsuario'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdSenha: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdSenha'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdCargo: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdCargo'
              Visible = False
            end
            object cxGridDBTableViewUsuarioNmUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.NmUsuario'
              Visible = False
            end
            object cxGridDBTableViewUsuarioApUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.ApUsuario'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InAtivo'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdInstalacao: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdInstalacao'
              Visible = False
            end
            object cxGridDBTableViewUsuarioNmEmail: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.NmEmail'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInAvisoPo: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InAvisoPo'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdCelula: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdCelula'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdTranspRod: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdTranspRod'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInSelecionado: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InSelecionado'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdIdioma: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdIdioma'
              Visible = False
            end
            object cxGridDBTableViewUsuarioDtUltAltSenha: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.DtUltAltSenha'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInAltStatusReceb: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InAltStatusReceb'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdEmpresa'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdChefia: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdChefia'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInModoPreview: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InModoPreview'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInFecharMovFinanc: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InFecharMovFinanc'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInPermiteFaturamento: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InPermiteFaturamento'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInPermiteAlteraRegDde: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InPermiteAlteraRegDde'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdComputador: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdComputador'
              Visible = False
            end
            object cxGridDBTableViewUsuarioExibeResumo: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.ExibeResumo'
              Visible = False
            end
            object cxGridDBTableViewUsuarioExibeDetalhe: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.ExibeDetalhe'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInZeraLiquidacao: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InZeraLiquidacao'
              Visible = False
            end
            object cxGridDBTableViewUsuarioGrupoRap: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.GrupoRap'
              Visible = False
            end
            object cxGridDBTableViewUsuarioSupervisaPendencias: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.SupervisaPendencias'
              Visible = False
            end
            object cxGridDBTableViewUsuarioNmSenhaInicial: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.NmSenhaInicial'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInManager: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InManager'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInOnline: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InOnline'
              Visible = False
            end
            object cxGridDBTableViewUsuarioDtUltAcesso: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.DtUltAcesso'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdTema: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdTema'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdGrupoDetalhes: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdGrupoDetalhes'
              Visible = False
            end
            object cxGridDBTableViewUsuarioInManagerSite: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.InManagerSite'
              Visible = False
            end
            object cxGridDBTableViewUsuarioCdSuperiorDireto: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.CdSuperiorDireto'
              Visible = False
            end
            object cxGridDBTableViewUsuarioDtAcessoAgora: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.DtAcessoAgora'
              Visible = False
            end
            object cxGridDBTableViewUsuarioDtUltimaAcao: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.DtUltimaAcao'
              Visible = False
            end
            object cxGridDBTableViewUsuarioNrServerMoney: TcxGridDBColumn
              DataBinding.FieldName = 'Usuario.NrServerMoney'
              Visible = False
            end
            object cxGridDBTableViewMoedaMle: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleCdMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.CdMoeda'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmMoeda'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleApMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.ApMoeda'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.InAtivo'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleCdMoedaScx: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.CdMoedaScx'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmMoedaSing: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmMoedaSing'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmMoedaPlural: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmMoedaPlural'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmCentavosSing: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmCentavosSing'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmCentavosPlural: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmCentavosPlural'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleApMoedaIngles: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.ApMoedaIngles'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmMoedaSingIng: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmMoedaSingIng'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmMoedaPluralIng: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmMoedaPluralIng'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmCentavosSingIng: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmCentavosSingIng'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmCentavosPluralIng: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmCentavosPluralIng'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmMoedaSingEsp: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmMoedaSingEsp'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmMoedaPluralEsp: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmMoedaPluralEsp'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmCentavosSingEsp: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmCentavosSingEsp'
              Visible = False
            end
            object cxGridDBTableViewMoedaMleNmCentavosPluralEsp: TcxGridDBColumn
              DataBinding.FieldName = 'MoedaMle.NmCentavosPluralEsp'
              Visible = False
            end
            object cxGridDBTableViewPaisDestino: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino'
              Visible = False
            end
            object cxGridDBTableViewPaisDestinoCdPais: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino.CdPais'
              Visible = False
            end
            object cxGridDBTableViewPaisDestinoNmPais: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino.NmPais'
              Visible = False
            end
            object cxGridDBTableViewPaisDestinoNmSiglaCrt: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino.NmSiglaCrt'
              Visible = False
            end
            object cxGridDBTableViewDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCdDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdDespachante'
              Visible = False
            end
            object cxGridDBTableViewDespachanteNmDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NmDespachante'
              Visible = False
            end
            object cxGridDBTableViewDespachanteApDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.ApDespachante'
              Visible = False
            end
            object cxGridDBTableViewDespachanteVlMinSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.VlMinSda'
              Visible = False
            end
            object cxGridDBTableViewDespachanteVlMaxSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.VlMaxSda'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCdRisc: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdRisc'
              Visible = False
            end
            object cxGridDBTableViewDespachanteInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.InAtivo'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCdFavorecido: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdFavorecido'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCdModSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdModSda'
              Visible = False
            end
            object cxGridDBTableViewDespachanteNrRegistro: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NrRegistro'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCpfDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CpfDespachante'
              Visible = False
            end
            object cxGridDBTableViewDespachanteNrContaCorrente: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NrContaCorrente'
              Visible = False
            end
            object cxGridDBTableViewDespachanteNrDigitoContaCorrente: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NrDigitoContaCorrente'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCdDespSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdDespSda'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCdProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdProduto'
              Visible = False
            end
            object cxGridDBTableViewDespachanteNmSenha: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NmSenha'
              Visible = False
            end
            object cxGridDBTableViewDespachanteInConsultaSiscomex: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.InConsultaSiscomex'
              Visible = False
            end
            object cxGridDBTableViewDespachanteCdUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdUsuario'
              Visible = False
            end
            object cxGridDBTableViewDespachanteDtSenha: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.DtSenha'
              Visible = False
            end
            object cxGridDBTableViewIncoterm: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm'
              Visible = False
            end
            object cxGridDBTableViewIncotermCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.Codigo'
              Visible = False
            end
            object cxGridDBTableViewIncotermDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.Descricao'
              Visible = False
            end
            object cxGridDBTableViewIncotermSinal: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.Sinal'
              Visible = False
            end
            object cxGridDBTableViewIncotermInTipoFrete: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.InTipoFrete'
              Visible = False
            end
            object cxGridDBTableViewExportador: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador'
              Visible = False
            end
            object cxGridDBTableViewExportadorCdEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CdEmpresa'
              Visible = False
            end
            object cxGridDBTableViewExportadorNmEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.NmEmpresa'
              Visible = False
            end
            object cxGridDBTableViewExportadorApEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.ApEmpresa'
              Visible = False
            end
            object cxGridDBTableViewExportadorEndEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.EndEmpresa'
              Visible = False
            end
            object cxGridDBTableViewExportadorCdTipoPessoa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CdTipoPessoa'
              Visible = False
            end
            object cxGridDBTableViewExportadorCgcEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CgcEmpresa'
              Visible = False
            end
            object cxGridDBTableViewExportadorCpfEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CpfEmpresa'
              Visible = False
            end
            object cxGridDBTableViewExportadorIeEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.IeEmpresa'
              Visible = False
            end
            object cxGridDBTableViewExportadorInCliente: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InCliente'
              Visible = False
            end
            object cxGridDBTableViewExportadorInImportador: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InImportador'
              Visible = False
            end
            object cxGridDBTableViewExportadorInExportador: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InExportador'
              Visible = False
            end
            object cxGridDBTableViewExportadorInOutros: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InOutros'
              Visible = False
            end
            object cxGridDBTableViewExportadorCdGrupo: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CdGrupo'
              Visible = False
            end
            object cxGridDBTableViewExportadorInRepresentante: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InRepresentante'
              Visible = False
            end
            object cxGridDBTableViewExportadorInSeguradora: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InSeguradora'
              Visible = False
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 583
          Width = 1015
          ExplicitTop = 583
          ExplicitWidth = 1015
          inherited cxGridDBTableViewDetailList: TcxGridDBTableView
            DataController.DataSource = nil
            object cxGridDBTableViewDetailListSelf: TcxGridDBColumn
              DataBinding.FieldName = 'Self'
            end
            object cxGridDBTableViewDetailListCdImportador: TcxGridDBColumn
              DataBinding.FieldName = 'CdImportador'
            end
            object cxGridDBTableViewDetailListCdAgente: TcxGridDBColumn
              DataBinding.FieldName = 'CdAgente'
            end
            object cxGridDBTableViewDetailListCdViaTransporte: TcxGridDBColumn
              DataBinding.FieldName = 'CdViaTransporte'
            end
            object cxGridDBTableViewDetailListCdTransportadora: TcxGridDBColumn
              DataBinding.FieldName = 'CdTransportadora'
            end
            object cxGridDBTableViewDetailListCdSeguradora: TcxGridDBColumn
              DataBinding.FieldName = 'CdSeguradora'
            end
            object cxGridDBTableViewDetailListCdRepresentante: TcxGridDBColumn
              DataBinding.FieldName = 'CdRepresentante'
            end
            object cxGridDBTableViewDetailListCdLocalOrigem: TcxGridDBColumn
              DataBinding.FieldName = 'CdLocalOrigem'
            end
            object cxGridDBTableViewDetailListCdLocalDestino: TcxGridDBColumn
              DataBinding.FieldName = 'CdLocalDestino'
            end
            object cxGridDBTableViewDetailListDtRegistroPedido: TcxGridDBColumn
              DataBinding.FieldName = 'DtRegistroPedido'
            end
            object cxGridDBTableViewDetailListVlFrete: TcxGridDBColumn
              DataBinding.FieldName = 'VlFrete'
            end
            object cxGridDBTableViewDetailListVlSeguro: TcxGridDBColumn
              DataBinding.FieldName = 'VlSeguro'
            end
            object cxGridDBTableViewDetailListVlPesoLiquido: TcxGridDBColumn
              DataBinding.FieldName = 'VlPesoLiquido'
            end
            object cxGridDBTableViewDetailListVlDesconto: TcxGridDBColumn
              DataBinding.FieldName = 'VlDesconto'
            end
            object cxGridDBTableViewDetailListVlComissaoPercent: TcxGridDBColumn
              DataBinding.FieldName = 'VlComissaoPercent'
            end
            object cxGridDBTableViewDetailListVlTotMcv: TcxGridDBColumn
              DataBinding.FieldName = 'VlTotMcv'
            end
            object cxGridDBTableViewDetailListVlTotExw: TcxGridDBColumn
              DataBinding.FieldName = 'VlTotExw'
            end
            object cxGridDBTableViewDetailListInDue: TcxGridDBColumn
              DataBinding.FieldName = 'InDue'
            end
            object cxGridDBTableViewDetailListInRecAlfandegadoDespacho: TcxGridDBColumn
              DataBinding.FieldName = 'InRecAlfandegadoDespacho'
            end
            object cxGridDBTableViewDetailListNmRefEndRecAlfandDespacho: TcxGridDBColumn
              DataBinding.FieldName = 'NmRefEndRecAlfandDespacho'
            end
            object cxGridDBTableViewDetailListInUmEnquadPorProc: TcxGridDBColumn
              DataBinding.FieldName = 'InUmEnquadPorProc'
            end
            object cxGridDBTableViewDetailListTxInformacoesAdicionais: TcxGridDBColumn
              DataBinding.FieldName = 'TxInformacoesAdicionais'
            end
            object cxGridDBTableViewDetailListCdStatusDue: TcxGridDBColumn
              DataBinding.FieldName = 'CdStatusDue'
            end
            object cxGridDBTableViewDetailListDtEnvioDue: TcxGridDBColumn
              DataBinding.FieldName = 'DtEnvioDue'
            end
            object cxGridDBTableViewDetailListCdChaveAcessoDue: TcxGridDBColumn
              DataBinding.FieldName = 'CdChaveAcessoDue'
            end
            object cxGridDBTableViewDetailListIncoterm: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm'
            end
            object cxGridDBTableViewDetailListIncotermCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.Codigo'
            end
            object cxGridDBTableViewDetailListIncotermDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.Descricao'
            end
            object cxGridDBTableViewDetailListIncotermSinal: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.Sinal'
            end
            object cxGridDBTableViewDetailListIncotermInTipoFrete: TcxGridDBColumn
              DataBinding.FieldName = 'Incoterm.InTipoFrete'
            end
            object cxGridDBTableViewDetailListPaisDestino: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino'
            end
            object cxGridDBTableViewDetailListPaisDestinoCdPais: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino.CdPais'
            end
            object cxGridDBTableViewDetailListPaisDestinoNmPais: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino.NmPais'
            end
            object cxGridDBTableViewDetailListPaisDestinoNmSiglaCrt: TcxGridDBColumn
              DataBinding.FieldName = 'PaisDestino.NmSiglaCrt'
            end
            object cxGridDBTableViewDetailListMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda'
            end
            object cxGridDBTableViewDetailListMoedaCdMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.CdMoeda'
            end
            object cxGridDBTableViewDetailListMoedaNmMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmMoeda'
            end
            object cxGridDBTableViewDetailListMoedaApMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.ApMoeda'
            end
            object cxGridDBTableViewDetailListMoedaInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.InAtivo'
            end
            object cxGridDBTableViewDetailListMoedaCdMoedaScx: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.CdMoedaScx'
            end
            object cxGridDBTableViewDetailListMoedaNmMoedaSing: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmMoedaSing'
            end
            object cxGridDBTableViewDetailListMoedaNmMoedaPlural: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmMoedaPlural'
            end
            object cxGridDBTableViewDetailListMoedaNmCentavosSing: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmCentavosSing'
            end
            object cxGridDBTableViewDetailListMoedaNmCentavosPlural: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmCentavosPlural'
            end
            object cxGridDBTableViewDetailListMoedaApMoedaIngles: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.ApMoedaIngles'
            end
            object cxGridDBTableViewDetailListMoedaNmMoedaSingIng: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmMoedaSingIng'
            end
            object cxGridDBTableViewDetailListMoedaNmMoedaPluralIng: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmMoedaPluralIng'
            end
            object cxGridDBTableViewDetailListMoedaNmCentavosSingIng: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmCentavosSingIng'
            end
            object cxGridDBTableViewDetailListMoedaNmCentavosPluralIng: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmCentavosPluralIng'
            end
            object cxGridDBTableViewDetailListMoedaNmMoedaSingEsp: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmMoedaSingEsp'
            end
            object cxGridDBTableViewDetailListMoedaNmMoedaPluralEsp: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmMoedaPluralEsp'
            end
            object cxGridDBTableViewDetailListMoedaNmCentavosSingEsp: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmCentavosSingEsp'
            end
            object cxGridDBTableViewDetailListMoedaNmCentavosPluralEsp: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda.NmCentavosPluralEsp'
            end
            object cxGridDBTableViewDetailListUrfDespacho: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDespacho'
            end
            object cxGridDBTableViewDetailListUrfDespachoCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDespacho.Codigo'
            end
            object cxGridDBTableViewDetailListUrfDespachoDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDespacho.Descricao'
            end
            object cxGridDBTableViewDetailListUrfDespachoCdDigito: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDespacho.CdDigito'
            end
            object cxGridDBTableViewDetailListUrfDespachoEndUf: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDespacho.EndUf'
            end
            object cxGridDBTableViewDetailListUrfDestino: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDestino'
            end
            object cxGridDBTableViewDetailListUrfDestinoCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDestino.Codigo'
            end
            object cxGridDBTableViewDetailListUrfDestinoDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDestino.Descricao'
            end
            object cxGridDBTableViewDetailListUrfDestinoCdDigito: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDestino.CdDigito'
            end
            object cxGridDBTableViewDetailListUrfDestinoEndUf: TcxGridDBColumn
              DataBinding.FieldName = 'UrfDestino.EndUf'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoDespacho: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoDespacho'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoDespachoCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoDespacho.Codigo'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoDespachoDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoDespacho.Descricao'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoDespachoCodOrgaoRec: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoDespacho.CodOrgaoRec'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoEmbarque: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoEmbarque'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoEmbarqueCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoEmbarque.Codigo'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoEmbarqueDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoEmbarque.Descricao'
            end
            object cxGridDBTableViewDetailListRecAlfandegadoEmbarqueCodOrgaoRec: TcxGridDBColumn
              DataBinding.FieldName = 'RecAlfandegadoEmbarque.CodOrgaoRec'
            end
            object cxGridDBTableViewDetailListExportador: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador'
            end
            object cxGridDBTableViewDetailListExportadorCdEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CdEmpresa'
            end
            object cxGridDBTableViewDetailListExportadorNmEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.NmEmpresa'
            end
            object cxGridDBTableViewDetailListExportadorApEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.ApEmpresa'
            end
            object cxGridDBTableViewDetailListExportadorEndEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.EndEmpresa'
            end
            object cxGridDBTableViewDetailListExportadorCdTipoPessoa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CdTipoPessoa'
            end
            object cxGridDBTableViewDetailListExportadorCgcEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CgcEmpresa'
            end
            object cxGridDBTableViewDetailListExportadorCpfEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CpfEmpresa'
            end
            object cxGridDBTableViewDetailListExportadorIeEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.IeEmpresa'
            end
            object cxGridDBTableViewDetailListExportadorInCliente: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InCliente'
            end
            object cxGridDBTableViewDetailListExportadorInImportador: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InImportador'
            end
            object cxGridDBTableViewDetailListExportadorInExportador: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InExportador'
            end
            object cxGridDBTableViewDetailListExportadorInOutros: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InOutros'
            end
            object cxGridDBTableViewDetailListExportadorCdGrupo: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.CdGrupo'
            end
            object cxGridDBTableViewDetailListExportadorInRepresentante: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InRepresentante'
            end
            object cxGridDBTableViewDetailListExportadorInSeguradora: TcxGridDBColumn
              DataBinding.FieldName = 'Exportador.InSeguradora'
            end
            object cxGridDBTableViewDetailListEnquadOp: TcxGridDBColumn
              DataBinding.FieldName = 'EnquadOp'
            end
            object cxGridDBTableViewDetailListEnquadOpCdEnquadOp: TcxGridDBColumn
              DataBinding.FieldName = 'EnquadOp.CdEnquadOp'
            end
            object cxGridDBTableViewDetailListEnquadOpNmEnquadOp: TcxGridDBColumn
              DataBinding.FieldName = 'EnquadOp.NmEnquadOp'
            end
            object cxGridDBTableViewDetailListEnquadOpInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'EnquadOp.InAtivo'
            end
            object cxGridDBTableViewDetailListDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante'
            end
            object cxGridDBTableViewDetailListDespachanteCdDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdDespachante'
            end
            object cxGridDBTableViewDetailListDespachanteNmDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NmDespachante'
            end
            object cxGridDBTableViewDetailListDespachanteApDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.ApDespachante'
            end
            object cxGridDBTableViewDetailListDespachanteVlMinSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.VlMinSda'
            end
            object cxGridDBTableViewDetailListDespachanteVlMaxSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.VlMaxSda'
            end
            object cxGridDBTableViewDetailListDespachanteCdRisc: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdRisc'
            end
            object cxGridDBTableViewDetailListDespachanteInAtivo: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.InAtivo'
            end
            object cxGridDBTableViewDetailListDespachanteCdFavorecido: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdFavorecido'
            end
            object cxGridDBTableViewDetailListDespachanteCdModSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdModSda'
            end
            object cxGridDBTableViewDetailListDespachanteNrRegistro: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NrRegistro'
            end
            object cxGridDBTableViewDetailListDespachanteCpfDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CpfDespachante'
            end
            object cxGridDBTableViewDetailListDespachanteNrContaCorrente: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NrContaCorrente'
            end
            object cxGridDBTableViewDetailListDespachanteNrDigitoContaCorrente: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NrDigitoContaCorrente'
            end
            object cxGridDBTableViewDetailListDespachanteCdDespSda: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdDespSda'
            end
            object cxGridDBTableViewDetailListDespachanteCdProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdProduto'
            end
            object cxGridDBTableViewDetailListDespachanteNmSenha: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.NmSenha'
            end
            object cxGridDBTableViewDetailListDespachanteInConsultaSiscomex: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.InConsultaSiscomex'
            end
            object cxGridDBTableViewDetailListDespachanteCdUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.CdUsuario'
            end
            object cxGridDBTableViewDetailListDespachanteDtSenha: TcxGridDBColumn
              DataBinding.FieldName = 'Despachante.DtSenha'
            end
            object cxGridDBTableViewDetailListProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'Processo'
            end
            object cxGridDBTableViewDetailListProcessoNrProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.NrProcesso'
            end
            object cxGridDBTableViewDetailListProcessoDtAbertura: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.DtAbertura'
            end
            object cxGridDBTableViewDetailListProcessoInCancelado: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.InCancelado'
            end
            object cxGridDBTableViewDetailListProcessoVlMleMneg: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.VlMleMneg'
            end
            object cxGridDBTableViewDetailListProcessoVlFretePrepaidMneg: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.VlFretePrepaidMneg'
            end
            object cxGridDBTableViewDetailListProcessoVlSeguroMn: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.VlSeguroMn'
            end
            object cxGridDBTableViewDetailListProcessoNrProcessoExpTemp: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.NrProcessoExpTemp'
            end
            object cxGridDBTableViewDetailListProcessoVlPesoLiquido: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.VlPesoLiquido'
            end
            object cxGridDBTableViewDetailListProcessoVlPesoBruto: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.VlPesoBruto'
            end
            object cxGridDBTableViewDetailListProcessoTpProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.TpProcesso'
            end
            object cxGridDBTableViewDetailListProcessoNrFatura: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.NrFatura'
            end
            object cxGridDBTableViewDetailListProcessoCdGrupo: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.CdGrupo'
            end
            object cxGridDBTableViewDetailListProcessoCdRuc: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.CdRuc'
            end
            object cxGridDBTableViewDetailListProcessoCdDue: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.CdDue'
            end
            object cxGridDBTableViewDetailListProcessoVlDescontoMn: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.VlDescontoMn'
            end
            object cxGridDBTableViewDetailListProcessoVlAcrescimoMn: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.VlAcrescimoMn'
            end
            object cxGridDBTableViewDetailListProcessoUnidNeg: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.UnidNeg'
            end
            object cxGridDBTableViewDetailListProcessoProduto: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.Produto'
            end
            object cxGridDBTableViewDetailListProcessoCliente: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.Cliente'
            end
            object cxGridDBTableViewDetailListProcessoServico: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.Servico'
            end
            object cxGridDBTableViewDetailListProcessoUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.Usuario'
            end
            object cxGridDBTableViewDetailListProcessoMoedaMle: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.MoedaMle'
            end
            object cxGridDBTableViewDetailListProcessoPaisDestino: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.PaisDestino'
            end
            object cxGridDBTableViewDetailListProcessoDespachante: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.Despachante'
            end
            object cxGridDBTableViewDetailListProcessoIncoterm: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.Incoterm'
            end
            object cxGridDBTableViewDetailListProcessoExportador: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.Exportador'
            end
            object cxGridDBTableViewDetailListProcessoProcessoExp: TcxGridDBColumn
              DataBinding.FieldName = 'Processo.ProcessoExp'
            end
          end
        end
        inherited pnlStyle1: TPanel
          Width = 1015
          ExplicitWidth = 1015
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 30
      ExplicitWidth = 1118
      ExplicitHeight = 695
      inherited pnlEditButon: TPanel
        Left = 1015
        Height = 695
        ExplicitLeft = 1015
        ExplicitHeight = 695
        object Bevel4: TBevel [0]
          Left = 14
          Top = 67
          Width = 72
          Height = 2
        end
        object Button1: TButton
          Left = 14
          Top = 75
          Width = 75
          Height = 25
          Hint = 'Tela de NF'
          Anchors = [akTop, akRight]
          Caption = 'NF'
          TabOrder = 2
          OnClick = btnNFClick
        end
      end
      inherited pnlFundo: TPanel
        Width = 1015
        Height = 695
        ExplicitWidth = 1015
        ExplicitHeight = 695
        inherited pnlStyle2: TPanel
          Width = 1015
          ExplicitWidth = 1015
        end
        inherited pnlDetails: TPanel
          Width = 1015
          Height = 691
          ExplicitWidth = 1015
          ExplicitHeight = 691
          inherited SplitterDetail: TSplitter
            Top = 97
            Width = 1015
            ExplicitTop = 89
            ExplicitWidth = 806
          end
          inherited PanelDetail: TPanel
            Top = 101
            Width = 1015
            Height = 590
            ExplicitTop = 101
            ExplicitWidth = 1015
            ExplicitHeight = 590
            inherited pgDetails: TPageControl
              Width = 1015
              Height = 590
              ExplicitWidth = 1015
              ExplicitHeight = 590
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 30
                ExplicitWidth = 1007
                ExplicitHeight = 556
                inherited PageControlDetail: TPageControl
                  Width = 1007
                  Height = 556
                  ActivePage = tshDetailEdit
                  ExplicitWidth = 1007
                  ExplicitHeight = 556
                  inherited tshDetailGrid: TTabSheet
                    ExplicitWidth = 999
                    ExplicitHeight = 525
                    inherited pnlEditButonDetail: TPanel
                      Left = 908
                      Height = 525
                      ExplicitLeft = 908
                      ExplicitHeight = 525
                      inherited btnDetailIncluir: TButton
                        Enabled = False
                      end
                      inherited btnDetailConsultar: TButton
                        Enabled = False
                      end
                      inherited btnDetailExcluir: TButton
                        Enabled = False
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Width = 908
                      Height = 525
                      ExplicitWidth = 908
                      ExplicitHeight = 525
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        DataController.DataModeController.GridMode = True
                        object cxGridDBTableViewDetailProcessoNrProcesso: TcxGridDBColumn
                          DataBinding.FieldName = 'Processo.NrProcesso'
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitWidth = 999
                    ExplicitHeight = 525
                    inherited Panel8: TPanel
                      Left = 908
                      Height = 525
                      ExplicitLeft = 908
                      ExplicitHeight = 525
                      inherited btnDetailSalvar: TButton
                        Default = False
                      end
                    end
                    object Panel4: TPanel
                      Left = 0
                      Top = 0
                      Width = 908
                      Height = 525
                      Align = alClient
                      TabOrder = 1
                      object Label2: TLabel
                        Left = 9
                        Top = 305
                        Width = 124
                        Height = 16
                        Caption = 'Comiss'#227'o agente (%)'
                        FocusControl = DBEdit2
                      end
                      object Label7: TLabel
                        Left = 8
                        Top = 351
                        Width = 132
                        Height = 16
                        Caption = 'Informa'#231#245'es Adicionais'
                      end
                      object btnInformacoesAdicionais: TSpeedButton
                        Left = 644
                        Top = 366
                        Width = 23
                        Height = 23
                        Glyph.Data = {
                          F6060000424DF606000000000000360000002800000018000000180000000100
                          180000000000C0060000C40E0000C40E0000000000000000000000BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFD5DAE0B1BBC5
                          E0E4E800BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFA3
                          AFBA38516B25405D8695A500BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF687B8E173452002041223E5AA4AFBB00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFB9C2CBC0C8D0
                          00BFBF00BFBFCED4DA2E4863062545002041445B74BAC3CC00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF78899A10
                          2E4D102E4D052445102E4DB4BDC70928480020410625457E8E9FE6E9EC00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF77889A1E3A578191A100BFBF00BFBF6A7D900020410020412C4662D1D7DD00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBFC4CBD34159716C7E9100BFBF00BFBF00BFBF00BFBF4C627A586D
                          8300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBFA4AFBB4E647B99A6B300BFBF00BFBF00BFBF
                          00BFBFA2AEBA102E4D00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFBBC4CC4F657C8191A100
                          BFBF00BFBF00BFBF00BFBF708294344D6800BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFF3F5
                          F65A6F843E566FB2BCC600BFBF00BFBFAEB8C312304E98A5B200BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBFB0BAC44058713F57706175895D7186354E684B627900BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFC7CED57586984B6279445B74
                          8393A300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                          00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                          BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                          BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF}
                        OnClick = btnInformacoesAdicionaisClick
                      end
                      object lblExportador: TLabel
                        Left = 8
                        Top = 7
                        Width = 62
                        Height = 16
                        Caption = 'Exportador'
                      end
                      object Label8: TLabel
                        Left = 8
                        Top = 66
                        Width = 173
                        Height = 16
                        Caption = 'Incoterm (Condi'#231#227'o de venda)'
                      end
                      object Label12: TLabel
                        Left = 8
                        Top = 152
                        Width = 38
                        Height = 16
                        Caption = 'Moeda'
                      end
                      object lblEnquadramento: TLabel
                        Left = 8
                        Top = 198
                        Width = 90
                        Height = 16
                        Caption = 'Enquadramento'
                      end
                      object Label6: TLabel
                        Left = 8
                        Top = 108
                        Width = 86
                        Height = 16
                        Caption = 'Pa'#237's de destino'
                      end
                      object Label9: TLabel
                        Left = 343
                        Top = 49
                        Width = 100
                        Height = 16
                        Caption = 'URF de Despacho'
                      end
                      object chkRecintoAduaneiroEmbarque: TLabel
                        Left = 343
                        Top = 178
                        Width = 103
                        Height = 16
                        Caption = 'URF de Embarque'
                      end
                      object Label3: TLabel
                        Left = 8
                        Top = 262
                        Width = 73
                        Height = 16
                        Caption = 'Despachante'
                      end
                      object lblImportador: TLabel
                        Left = 8
                        Top = 431
                        Width = 64
                        Height = 16
                        Caption = 'Importador'
                        Visible = False
                      end
                      object lblProcessoAdministrativoImp: TLabel
                        Left = 678
                        Top = 211
                        Width = 136
                        Height = 16
                        Caption = 'Processo Administrativo'
                      end
                      object lblDiasPrazoValidadeExpTemp: TLabel
                        Left = 678
                        Top = 251
                        Width = 184
                        Height = 16
                        Caption = 'Prazo Validade Exp. Tempor'#225'ria'
                      end
                      object lblMotivoRetificacao: TLabel
                        Left = 8
                        Top = 475
                        Width = 103
                        Height = 16
                        Caption = 'Motivo Retifica'#231#227'o'
                      end
                      object lblCnpjExportador: TLabel
                        Left = 9
                        Top = 46
                        Width = 33
                        Height = 16
                        Caption = 'CNPJ:'
                      end
                      object chkUmEnquadramento: TDBCheckBox
                        Left = 8
                        Top = 239
                        Width = 266
                        Height = 17
                        Caption = 'Apenas um enquadramento no processo'
                        DataField = 'InUmEnquadPorProc'
                        DataSource = dtsDetail
                        TabOrder = 10
                        OnClick = chkUmEnquadramentoClick
                      end
                      object DBEdit2: TDBEdit
                        Left = 8
                        Top = 321
                        Width = 105
                        Height = 24
                        DataField = 'VlComissaoPercent'
                        DataSource = dtsDetail
                        TabOrder = 13
                      end
                      object rdgDespachoRecAlfandegado: TRadioGroup
                        Left = 343
                        Top = 93
                        Width = 323
                        Height = 36
                        Caption = ' Despacho em recinto alfandegado '
                        Columns = 2
                        Items.Strings = (
                          'Sim'
                          'N'#227'o')
                        TabOrder = 14
                        OnClick = rdgDespachoRecAlfandegadoClick
                      end
                      object dbmInfAd: TDBMemo
                        Left = 8
                        Top = 366
                        Width = 629
                        Height = 62
                        DataField = 'TxInformacoesAdicionais'
                        DataSource = dtsDetail
                        ScrollBars = ssVertical
                        TabOrder = 19
                      end
                      object dbeCdExp: TDBLookupComboBox
                        Left = 8
                        Top = 22
                        Width = 75
                        Height = 24
                        DataField = 'Exportador'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'CdEmpresa'
                        ListSource = dsEmpresaNac
                        TabOrder = 0
                        OnExit = dbeCdExpExit
                      end
                      object dbenmExp: TDBLookupComboBox
                        Left = 82
                        Top = 22
                        Width = 585
                        Height = 24
                        DataField = 'Exportador'
                        DataSource = dtsDetail
                        DropDownRows = 20
                        DropDownWidth = 500
                        KeyField = 'Self'
                        ListField = 'CgcEmpresa; NmEmpresa'
                        ListFieldIndex = 1
                        ListSource = dsEmpresaNac
                        TabOrder = 1
                        OnClick = dbenmExpClick
                        OnExit = dbeCdExpExit
                      end
                      object DBLookupComboBox5: TDBLookupComboBox
                        Left = 8
                        Top = 82
                        Width = 75
                        Height = 24
                        DataField = 'Incoterm'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'codigo'
                        ListSource = dsIncoterm
                        TabOrder = 2
                      end
                      object DBLookupComboBox1: TDBLookupComboBox
                        Left = 82
                        Top = 82
                        Width = 250
                        Height = 24
                        DataField = 'Incoterm'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'descricao;codigo'
                        ListSource = dsIncoterm
                        TabOrder = 3
                      end
                      object DBLookupComboBox6: TDBLookupComboBox
                        Left = 8
                        Top = 168
                        Width = 75
                        Height = 24
                        DataField = 'Moeda'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'CdMoeda'
                        ListSource = dsMoeda
                        TabOrder = 6
                      end
                      object DBLookupComboBox8: TDBLookupComboBox
                        Left = 82
                        Top = 168
                        Width = 250
                        Height = 24
                        DataField = 'Moeda'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'NmMoeda'
                        ListSource = dsMoeda
                        TabOrder = 7
                      end
                      object dblenquadramentoCod: TDBLookupComboBox
                        Left = 8
                        Top = 214
                        Width = 75
                        Height = 24
                        DataField = 'EnquadOp'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'CdEnquadOp'
                        ListSource = dsEnquadramento
                        TabOrder = 8
                        OnExit = dblenquadramentoCodExit
                      end
                      object dblEnquadramentoDescricao: TDBLookupComboBox
                        Left = 82
                        Top = 214
                        Width = 250
                        Height = 24
                        DataField = 'EnquadOp'
                        DataSource = dtsDetail
                        DropDownWidth = 300
                        KeyField = 'Self'
                        ListField = 'NmEnquadOp'
                        ListSource = dsEnquadramento
                        TabOrder = 9
                        OnExit = dblenquadramentoCodExit
                      end
                      object DBLookupComboBox3: TDBLookupComboBox
                        Left = 9
                        Top = 124
                        Width = 75
                        Height = 24
                        DataField = 'PaisDestino'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'CdPais'
                        ListSource = dsPais
                        TabOrder = 4
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 82
                        Top = 124
                        Width = 250
                        Height = 24
                        DataField = 'PaisDestino'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'NmPais'
                        ListSource = dsPais
                        TabOrder = 5
                      end
                      object dblURFDespachoCod: TDBLookupComboBox
                        Left = 343
                        Top = 65
                        Width = 75
                        Height = 24
                        DataField = 'UrfDespacho'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'Codigo'
                        ListSource = dsURFDespacho
                        TabOrder = 15
                        OnExit = dblURFDespachoCodExit
                      end
                      object dblURFDespachoNome: TDBLookupComboBox
                        Left = 417
                        Top = 65
                        Width = 250
                        Height = 24
                        DataField = 'UrfDespacho'
                        DataSource = dtsDetail
                        DropDownWidth = 300
                        KeyField = 'Self'
                        ListField = 'Descricao; Codigo'
                        ListSource = dsURFDespacho
                        TabOrder = 16
                        OnExit = dblURFDespachoCodExit
                      end
                      object dblURFEmbarqueCod: TDBLookupComboBox
                        Left = 343
                        Top = 195
                        Width = 75
                        Height = 24
                        DataField = 'UrfDestino'
                        DataSource = dtsDetail
                        KeyField = 'Self'
                        ListField = 'Codigo'
                        ListSource = dsURFDesembraraco
                        TabOrder = 17
                        OnExit = dblURFEmbarqueCodExit
                      end
                      object dblURFEmbarqueNome: TDBLookupComboBox
                        Left = 417
                        Top = 195
                        Width = 250
                        Height = 24
                        DataField = 'UrfDestino'
                        DataSource = dtsDetail
                        DropDownWidth = 300
                        KeyField = 'Self'
                        ListField = 'descricao; codigo'
                        ListSource = dsURFDesembraraco
                        TabOrder = 18
                        OnExit = dblURFEmbarqueCodExit
                      end
                      object DBLookupComboBox4: TDBLookupComboBox
                        Left = 8
                        Top = 278
                        Width = 75
                        Height = 24
                        DataField = 'Despachante'
                        DataSource = dtsDetail
                        KeyField = 'Despachante'
                        ListField = 'Despachante.CdDespachante'
                        ListSource = dsDespachante
                        TabOrder = 11
                      end
                      object DBLookupComboBox7: TDBLookupComboBox
                        Left = 82
                        Top = 278
                        Width = 250
                        Height = 24
                        DataField = 'Despachante'
                        DataSource = dtsDetail
                        DropDownWidth = 300
                        KeyField = 'Despachante'
                        ListField = 'Despachante.NmDespachante;Despachante.CdDespachante'
                        ListSource = dsDespachante
                        TabOrder = 12
                      end
                      object rdgTipoDocumento: TDBRadioGroup
                        Left = 678
                        Top = 22
                        Width = 199
                        Height = 91
                        Caption = ' Tipo de documento '
                        DataField = 'InTipoDocumentoDue'
                        DataSource = dtsDetail
                        Items.Strings = (
                          'Nota Fiscal Eletr'#244'nica (NF-e)'
                          'Nota Fiscal Formul'#225'rio'
                          'Sem Nota Fiscal')
                        TabOrder = 20
                        Values.Strings = (
                          '1'
                          '2'
                          '3')
                        OnChange = rdgTipoDocumentoChange
                      end
                      object cbxImportadorCod: TDBLookupComboBox
                        Left = 8
                        Top = 447
                        Width = 75
                        Height = 24
                        DataField = 'Importador'
                        DataSource = dtsDetail
                        KeyField = 'EmpresaEst'
                        ListField = 'EmpresaEst.CdEmpresa'
                        ListSource = dsEmpresaEst
                        TabOrder = 21
                        Visible = False
                      end
                      object cbxImportadorNome: TDBLookupComboBox
                        Left = 82
                        Top = 447
                        Width = 585
                        Height = 24
                        DataField = 'Importador'
                        DataSource = dtsDetail
                        DropDownRows = 20
                        DropDownWidth = 500
                        KeyField = 'EmpresaEst'
                        ListField = 'EmpresaEst.NmEmpresa'
                        ListFieldIndex = 1
                        ListSource = dsEmpresaEst
                        TabOrder = 22
                        Visible = False
                      end
                      object dbeProcessoAdministrativoImp: TDBEdit
                        Left = 678
                        Top = 226
                        Width = 185
                        Height = 24
                        DataField = 'NrProcesssoAdmImp'
                        DataSource = dtsDetail
                        TabOrder = 24
                        Visible = False
                      end
                      object rdgTipoDocumentoRetificacaoGranel: TRadioGroup
                        Left = 678
                        Top = 119
                        Width = 199
                        Height = 87
                        Caption = ' Tipo de doc. retifica'#231#227'o granel '
                        Enabled = False
                        ItemIndex = 0
                        Items.Strings = (
                          'Nota Fiscal Eletr'#244'nica (NF-e)'
                          'Nota Fiscal Formul'#225'rio'
                          'Sem Nota Fiscal')
                        TabOrder = 25
                      end
                      object dbeMotivoRetificacao: TDBEdit
                        Left = 8
                        Top = 490
                        Width = 659
                        Height = 24
                        DataField = 'TxMotivoRetificacao'
                        DataSource = dtsDetail
                        TabOrder = 23
                      end
                      object dbeDiasPrazoValidadeExpTemp: TDBEdit
                        Left = 678
                        Top = 266
                        Width = 185
                        Height = 24
                        DataField = 'QtDiasPrazoValidadeExpTemp'
                        DataSource = dtsDetail
                        TabOrder = 26
                      end
                      object rdgEmbarqueRecAlfandegado: TRadioGroup
                        Left = 344
                        Top = 222
                        Width = 323
                        Height = 36
                        Caption = ' Embarque em recinto alfandegado '
                        Columns = 2
                        Items.Strings = (
                          'Sim'
                          'N'#227'o')
                        TabOrder = 27
                        OnClick = rdgEmbarqueRecAlfandegadoClick
                      end
                      object pnlEmbarque: TPanel
                        Left = 343
                        Top = 262
                        Width = 335
                        Height = 68
                        Color = clAppWorkSpace
                        ParentBackground = False
                        TabOrder = 28
                        object pgcEmbarque: TPageControl
                          Left = -5
                          Top = -4
                          Width = 343
                          Height = 65
                          Margins.Left = 0
                          Margins.Top = 0
                          Margins.Right = 0
                          Margins.Bottom = 0
                          ActivePage = tbsRecintoEmbarque
                          Align = alCustom
                          DoubleBuffered = False
                          MultiLine = True
                          OwnerDraw = True
                          ParentDoubleBuffered = False
                          TabHeight = 10
                          TabOrder = 0
                          object tbsRecintoEmbarque: TTabSheet
                            Margins.Left = 0
                            Margins.Top = 0
                            Margins.Right = 0
                            Margins.Bottom = 0
                            Caption = 'Recinto Embarque'
                            DoubleBuffered = False
                            ParentDoubleBuffered = False
                            ParentShowHint = False
                            ShowHint = False
                            DesignSize = (
                              335
                              45)
                            object lblRecintoAduaneiroEmbarque: TLabel
                              Left = 1
                              Top = -1
                              Width = 183
                              Height = 16
                              Anchors = [akTop]
                              Caption = 'Recinto aduaneiro de embarque'
                            end
                            object DBLookupComboBox12: TDBLookupComboBox
                              Left = 1
                              Top = 16
                              Width = 75
                              Height = 24
                              Anchors = [akTop]
                              DataField = 'RecAlfandegadoEmbarque'
                              DataSource = dtsDetail
                              KeyField = 'RecintoAlfandegado'
                              ListField = 'RecintoAlfandegado.Codigo'
                              ListSource = dsRecindoEmbarque
                              TabOrder = 0
                            end
                            object cmbRecintoAduaneiroEmbarque: TDBLookupComboBox
                              Left = 75
                              Top = 16
                              Width = 250
                              Height = 24
                              Anchors = [akTop]
                              DataField = 'RecAlfandegadoEmbarque'
                              DataSource = dtsDetail
                              DropDownWidth = 300
                              KeyField = 'RecintoAlfandegado'
                              ListField = 'RecintoAlfandegado.Descricao; RecintoAlfandegado.Codigo'
                              ListSource = dsRecindoEmbarque
                              TabOrder = 1
                            end
                          end
                          object tbsReferenciaEmbarque: TTabSheet
                            Caption = 'Referencia Embarque'
                            ImageIndex = 1
                            DesignSize = (
                              335
                              45)
                            object Label10: TLabel
                              Left = 1
                              Top = 0
                              Width = 198
                              Height = 16
                              Margins.Left = 0
                              Margins.Bottom = 0
                              Anchors = [akTop]
                              Caption = 'Refer'#234'ncia de endere'#231'o Embarque'
                              FocusControl = DBEdit3
                            end
                            object DBEdit3: TDBEdit
                              Left = 1
                              Top = 16
                              Width = 324
                              Height = 24
                              Margins.Left = 0
                              Margins.Bottom = 0
                              Anchors = [akTop]
                              DataField = 'NmRefEndRecAlfandEmbarque'
                              DataSource = dtsDetail
                              TabOrder = 0
                            end
                          end
                        end
                      end
                      object pnlDespacho: TPanel
                        Left = 343
                        Top = 129
                        Width = 335
                        Height = 43
                        BevelOuter = bvNone
                        Color = clAppWorkSpace
                        ParentBackground = False
                        TabOrder = 29
                        object pgcDespacho: TPageControl
                          Left = -5
                          Top = -4
                          Width = 343
                          Height = 55
                          Margins.Left = 0
                          Margins.Top = 0
                          Margins.Right = 0
                          Margins.Bottom = 0
                          ActivePage = tbsRecintoDespacho
                          Align = alCustom
                          DoubleBuffered = False
                          MultiLine = True
                          OwnerDraw = True
                          ParentDoubleBuffered = False
                          TabHeight = 10
                          TabOrder = 0
                          object tbsRecintoDespacho: TTabSheet
                            Margins.Left = 0
                            Margins.Top = 0
                            Margins.Right = 0
                            Margins.Bottom = 0
                            Caption = 'Recinto Despacho'
                            DoubleBuffered = False
                            ParentDoubleBuffered = False
                            ParentShowHint = False
                            ShowHint = False
                            object lblRecintoAduaneiroDespacho: TLabel
                              Left = 1
                              Top = -1
                              Width = 194
                              Height = 16
                              Caption = 'Recinto Alfandegado de Despacho'
                            end
                            object dblRecintoDespachoCod: TDBLookupComboBox
                              Left = 1
                              Top = 16
                              Width = 75
                              Height = 24
                              DataField = 'RecAlfandegadoDespacho'
                              DataSource = dtsDetail
                              KeyField = 'RecintoAlfandegado'
                              ListField = 'RecintoAlfandegado.Codigo'
                              ListSource = dsRecindoDespacho
                              TabOrder = 0
                            end
                            object dblRecintoDespachoNome: TDBLookupComboBox
                              Left = 77
                              Top = 16
                              Width = 250
                              Height = 24
                              DataField = 'RecAlfandegadoDespacho'
                              DataSource = dtsDetail
                              DropDownWidth = 300
                              KeyField = 'RecintoAlfandegado'
                              ListField = 'RecintoAlfandegado.Descricao; RecintoAlfandegado.Codigo'
                              ListSource = dsRecindoDespacho
                              TabOrder = 1
                            end
                          end
                          object tbsReferenciaDespacho: TTabSheet
                            Caption = 'Referencia Despacho'
                            ImageIndex = 1
                            object lblRefEndDesp: TLabel
                              Left = 1
                              Top = 0
                              Width = 195
                              Height = 16
                              Caption = 'Refer'#234'ncia de endere'#231'o Despacho'
                              FocusControl = dbeRefEndDesp
                            end
                            object dbeRefEndDesp: TDBEdit
                              Left = 1
                              Top = 16
                              Width = 324
                              Height = 24
                              DataField = 'NmRefEndRecAlfandDespacho'
                              DataSource = dtsDetail
                              TabOrder = 0
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Width = 1015
            Height = 97
            ExplicitWidth = 1015
            ExplicitHeight = 97
            object Label1: TLabel
              Left = 4
              Top = 4
              Width = 77
              Height = 16
              Caption = 'Nr. Processo:'
              FocusControl = DBEdit1
            end
            object Label4: TLabel
              Left = 125
              Top = 3
              Width = 67
              Height = 16
              Caption = 'C'#243'digo RUC'
              FocusControl = DBEdit5
            end
            object Label5: TLabel
              Left = 485
              Top = 3
              Width = 65
              Height = 16
              Caption = 'C'#243'digo Due'
              FocusControl = edtCodDue
            end
            object Label44: TLabel
              Left = 245
              Top = 45
              Width = 78
              Height = 16
              Caption = 'Vl. Acrescimo'
              FocusControl = EdtVlAcrescimo
            end
            object Label45: TLabel
              Left = 366
              Top = 45
              Width = 60
              Height = 16
              Caption = 'Vl. Seguro'
              FocusControl = edtVlSeguro
            end
            object Label47: TLabel
              Left = 125
              Top = 45
              Width = 71
              Height = 16
              Caption = 'Vl. Desconto'
              FocusControl = edtVlDescont
            end
            object Label48: TLabel
              Left = 485
              Top = 45
              Width = 78
              Height = 16
              Caption = 'Frete M. Neg.'
            end
            object Label57: TLabel
              Left = 5
              Top = 45
              Width = 71
              Height = 16
              Caption = 'FOB M. Neg.'
              FocusControl = edtVlFob
            end
            object Label63: TLabel
              Left = 606
              Top = 45
              Width = 39
              Height = 16
              Caption = 'TOTAL'
            end
            object DBEdit1: TDBEdit
              Left = 4
              Top = 19
              Width = 115
              Height = 24
              DataField = 'NrProcesso'
              DataSource = dtsMain
              Enabled = False
              TabOrder = 0
            end
            object DBEdit5: TDBEdit
              Left = 125
              Top = 19
              Width = 279
              Height = 24
              DataField = 'CdRuc'
              DataSource = dtsMain
              TabOrder = 1
            end
            object edtCodDue: TDBEdit
              Left = 493
              Top = 18
              Width = 157
              Height = 24
              DataField = 'CdDue'
              DataSource = dtsMain
              TabOrder = 2
            end
            object btnGerarRuc: TButton
              Left = 406
              Top = 15
              Width = 47
              Height = 25
              Caption = 'Gerar'
              TabOrder = 8
              OnClick = btnGerarRucClick
            end
            object EdtVlAcrescimo: TDBEdit
              Left = 245
              Top = 61
              Width = 115
              Height = 24
              DataField = 'VlAcrescimoMn'
              DataSource = dtsMain
              TabOrder = 5
            end
            object edtVlSeguro: TDBEdit
              Left = 366
              Top = 61
              Width = 115
              Height = 24
              DataField = 'VlSeguroMn'
              DataSource = dtsMain
              TabOrder = 6
            end
            object edtVlDescont: TDBEdit
              Left = 125
              Top = 61
              Width = 115
              Height = 24
              DataField = 'VlDescontoMn'
              DataSource = dtsMain
              TabOrder = 4
            end
            object edtVlFob: TDBEdit
              Left = 4
              Top = 61
              Width = 115
              Height = 24
              DataField = 'VlMleMneg'
              DataSource = dtsMain
              TabOrder = 3
            end
            object edtTotalValoresProcesso: TEdit
              Left = 606
              Top = 61
              Width = 114
              Height = 24
              ReadOnly = True
              TabOrder = 7
            end
            object chkProcessoConsolidado: TDBCheckBox
              Left = 656
              Top = 21
              Width = 153
              Height = 17
              Caption = 'Processo Consolidado'
              DataField = 'InProcessoConsolidado'
              DataSource = dtsMain
              TabOrder = 9
            end
            object edtVlFrete: TDBEdit
              Left = 485
              Top = 61
              Width = 115
              Height = 24
              DataField = 'VlFretePrepaidMneg'
              DataSource = dtsMain
              TabOrder = 10
            end
          end
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    Left = 648
    Top = 400
  end
  inherited dtsDetail: TDataSource
    Left = 552
    Top = 400
  end
  inherited adsMain: TAureliusDataset
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
        Name = 'Cliente.Grupo'
        DataType = ftVariant
      end
      item
        Name = 'Cliente.Grupo.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Cliente.Grupo.NmGrupo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cliente.Grupo.DtInclusao'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente.Grupo.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Cliente.Grupo.CnpjGrupo'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Cliente.Grupo.DtNovoFollowupImp'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente.Grupo.DtNovoFollowupExp'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente.Grupo.NmEmailDraftBl'
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
        Name = 'PaisDestino.NmSigla2l'
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
        Name = 'Exportador.Grupo'
        DataType = ftVariant
      end
      item
        Name = 'Exportador.Grupo.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Exportador.Grupo.NmGrupo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Exportador.Grupo.DtInclusao'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.Grupo.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Exportador.Grupo.CnpjGrupo'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Exportador.Grupo.DtNovoFollowupImp'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.Grupo.DtNovoFollowupExp'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.Grupo.NmEmailDraftBl'
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
        Name = 'Importador.Pais.NmSigla2l'
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
        Name = 'Agente.CdCidade.CdSigla'
        DataType = ftString
        Size = 3
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
        Name = 'Agente.Pais.NmSigla2l'
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
        Name = 'Notify1Proc.Pais.NmSigla2l'
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
        Name = 'Notify2Proc.Pais.NmSigla2l'
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
        Name = 'Consignee.Pais.NmSigla2l'
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
        Name = 'LocalEmbarque.CdSigla'
        DataType = ftString
        Size = 3
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
        Name = 'LocalDesembarque.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'LocalEntrega'
        DataType = ftVariant
      end
      item
        Name = 'LocalEntrega.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'LocalEntrega.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LocalEntrega.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TpFrete'
        DataType = ftVariant
      end
      item
        Name = 'TpFrete.Codigo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TpFrete.Descricao'
        DataType = ftString
        Size = 30
      end>
    FieldInclusions = [Entity]
    AfterPost = adsMainAfterPost
    AfterScroll = adsMainAfterScroll
    OnCalcFields = adsMainCalcFields
    SubpropsDepth = 2
    SyncSubprops = True
    Left = 688
    Top = 400
    DesignClass = 'MyEntitiesBroker.TTprocesso'
    object adsMainProcessoExp: TDataSetField
      FieldName = 'ProcessoExp'
      ReadOnly = True
      Visible = False
    end
    object adsMainNrProcesso: TStringField
      DisplayLabel = 'N'#250'mero do Processo'
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsMainDtAbertura: TDateTimeField
      DisplayLabel = 'Data de Abertura'
      DisplayWidth = 12
      FieldName = 'DtAbertura'
    end
    object adsMainProcExpCdExportador: TStringField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldKind = fkCalculated
      FieldName = 'ProcExpCdExportador'
      Size = 5
      Calculated = True
    end
    object adsMainProcExpNmExportador: TStringField
      DisplayLabel = 'Nome Empresa'
      FieldKind = fkCalculated
      FieldName = 'ProcExpNmExportador'
      Size = 40
      Calculated = True
    end
    object adsMainProcExpCNPJExportador: TStringField
      DisplayLabel = 'CNPJ Empresa'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'ProcExpCNPJExportador'
      Size = 18
      Calculated = True
    end
    object adsMainClienteCdEmpresa: TStringField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'Cliente.CdEmpresa'
      Visible = False
      Size = 5
    end
    object adsMainClienteNmEmpresa: TStringField
      DisplayLabel = 'Nome da Empresa'
      DisplayWidth = 40
      FieldName = 'Cliente.NmEmpresa'
      Visible = False
      Size = 80
    end
    object adsMainClienteCgcEmpresa: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'Cliente.CgcEmpresa'
      Visible = False
      Size = 14
    end
    object adsMainCdRuc: TStringField
      DisplayLabel = 'C'#243'digo RUC'
      DisplayWidth = 20
      FieldName = 'CdRuc'
      Size = 35
    end
    object adsMainCdDue: TStringField
      DisplayLabel = 'C'#243'digo DUE'
      DisplayWidth = 16
      FieldName = 'CdDue'
      Size = 14
    end
    object adsMaintxStatusDue: TStringField
      DisplayLabel = 'Status Due'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'txStatusDue'
      OnGetText = adsMaintxStatusDueGetText
      Calculated = True
    end
    object adsMainInExisteProcessoExp: TStringField
      DisplayLabel = 'Existe Processo Exp'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'InExisteProcessoExp'
      Calculated = True
    end
    object adsMainInDue: TStringField
      DisplayLabel = 'Processo '#233' DUE'
      FieldKind = fkCalculated
      FieldName = 'InDue'
      Calculated = True
    end
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsMainInCancelado: TStringField
      FieldName = 'InCancelado'
      Visible = False
      Size = 1
    end
    object adsMainVlMleMneg: TFloatField
      FieldName = 'VlMleMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlFretePrepaidMneg: TFloatField
      FieldName = 'VlFretePrepaidMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlSeguroMn: TFloatField
      FieldName = 'VlSeguroMn'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainNrProcessoExpTemp: TStringField
      FieldName = 'NrProcessoExpTemp'
      Visible = False
      Size = 5
    end
    object adsMainVlPesoLiquido: TFloatField
      FieldName = 'VlPesoLiquido'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlPesoBruto: TFloatField
      FieldName = 'VlPesoBruto'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainTpProcesso: TStringField
      FieldName = 'TpProcesso'
      Visible = False
      Size = 1
    end
    object adsMainNrFatura: TStringField
      FieldName = 'NrFatura'
      Visible = False
      Size = 30
    end
    object adsMainCdGrupo: TStringField
      FieldName = 'CdGrupo'
      Visible = False
      Size = 3
    end
    object adsMainVlDescontoMn: TFloatField
      FieldName = 'VlDescontoMn'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlAcrescimoMn: TFloatField
      FieldName = 'VlAcrescimoMn'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainUnidNeg: TAureliusEntityField
      FieldName = 'UnidNeg'
      Required = True
      Visible = False
    end
    object adsMainUnidNegCdUnidNeg: TStringField
      FieldName = 'UnidNeg.CdUnidNeg'
      Visible = False
      Size = 2
    end
    object adsMainUnidNegNmUnidNeg: TStringField
      FieldName = 'UnidNeg.NmUnidNeg'
      Visible = False
      Size = 50
    end
    object adsMainUnidNegApUnidNeg: TStringField
      FieldName = 'UnidNeg.ApUnidNeg'
      Visible = False
      Size = 10
    end
    object adsMainUnidNegInAtivo: TStringField
      FieldName = 'UnidNeg.InAtivo'
      Visible = False
      Size = 1
    end
    object adsMainUnidNegVlAliqIss: TFloatField
      FieldName = 'UnidNeg.VlAliqIss'
      Visible = False
    end
    object adsMainUnidNegCgcUnidNeg: TStringField
      FieldName = 'UnidNeg.CgcUnidNeg'
      Visible = False
      Size = 14
    end
    object adsMainUnidNegCdFilial: TStringField
      FieldName = 'UnidNeg.CdFilial'
      Visible = False
      Size = 3
    end
    object adsMainUnidNegEndUnidNeg: TStringField
      FieldName = 'UnidNeg.EndUnidNeg'
      Visible = False
      Size = 50
    end
    object adsMainUnidNegEndNumero: TStringField
      FieldName = 'UnidNeg.EndNumero'
      Visible = False
      Size = 6
    end
    object adsMainUnidNegEndCompl: TStringField
      FieldName = 'UnidNeg.EndCompl'
      Visible = False
    end
    object adsMainUnidNegEndBairro: TStringField
      FieldName = 'UnidNeg.EndBairro'
      Visible = False
      Size = 30
    end
    object adsMainUnidNegEndCidade: TStringField
      FieldName = 'UnidNeg.EndCidade'
      Visible = False
      Size = 30
    end
    object adsMainUnidNegEndUf: TStringField
      FieldName = 'UnidNeg.EndUf'
      Visible = False
      Size = 2
    end
    object adsMainUnidNegIeUnidNeg: TStringField
      FieldName = 'UnidNeg.IeUnidNeg'
      Visible = False
    end
    object adsMainUnidNegImUnidNeg: TStringField
      FieldName = 'UnidNeg.ImUnidNeg'
      Visible = False
    end
    object adsMainUnidNegNrFone: TStringField
      FieldName = 'UnidNeg.NrFone'
      Visible = False
    end
    object adsMainUnidNegEndCep: TStringField
      FieldName = 'UnidNeg.EndCep'
      Visible = False
      Size = 8
    end
    object adsMainUnidNegNrFax1: TStringField
      FieldName = 'UnidNeg.NrFax1'
      Visible = False
    end
    object adsMainUnidNegNrFax2: TStringField
      FieldName = 'UnidNeg.NrFax2'
      Visible = False
    end
    object adsMainUnidNegNmSlogan: TStringField
      FieldName = 'UnidNeg.NmSlogan'
      Visible = False
      Size = 100
    end
    object adsMainUnidNegNrNotaFatura: TStringField
      FieldName = 'UnidNeg.NrNotaFatura'
      Visible = False
      Size = 6
    end
    object adsMainUnidNegNmEmail: TStringField
      FieldName = 'UnidNeg.NmEmail'
      Visible = False
      Size = 100
    end
    object adsMainUnidNegPathRelatorios: TStringField
      FieldName = 'UnidNeg.PathRelatorios'
      Visible = False
      Size = 100
    end
    object adsMainUnidNegPathSiscomex: TStringField
      FieldName = 'UnidNeg.PathSiscomex'
      Visible = False
      Size = 100
    end
    object adsMainUnidNegPathRei: TStringField
      FieldName = 'UnidNeg.PathRei'
      Visible = False
      Size = 100
    end
    object adsMainUnidNegNmDiretor: TStringField
      FieldName = 'UnidNeg.NmDiretor'
      Visible = False
      Size = 50
    end
    object adsMainUnidNegNrCpfDiretor: TStringField
      FieldName = 'UnidNeg.NrCpfDiretor'
      Visible = False
      Size = 11
    end
    object adsMainUnidNegNmContador: TStringField
      FieldName = 'UnidNeg.NmContador'
      Visible = False
      Size = 50
    end
    object adsMainUnidNegNrCrcContador: TStringField
      FieldName = 'UnidNeg.NrCrcContador'
      Visible = False
      Size = 15
    end
    object adsMainUnidNegNmProcurador: TStringField
      FieldName = 'UnidNeg.NmProcurador'
      Visible = False
      Size = 50
    end
    object adsMainUnidNegNrCpfProcurador: TStringField
      FieldName = 'UnidNeg.NrCpfProcurador'
      Visible = False
      Size = 11
    end
    object adsMainUnidNegCdPais: TStringField
      FieldName = 'UnidNeg.CdPais'
      Visible = False
      Size = 3
    end
    object adsMainUnidNegNrProcNfPref: TStringField
      FieldName = 'UnidNeg.NrProcNfPref'
      Visible = False
    end
    object adsMainUnidNegNrLivro: TStringField
      FieldName = 'UnidNeg.NrLivro'
      Visible = False
      Size = 5
    end
    object adsMainUnidNegNmSigla: TStringField
      FieldName = 'UnidNeg.NmSigla'
      Visible = False
      Size = 3
    end
    object adsMainUnidNegVlPercIss: TFloatField
      FieldName = 'UnidNeg.VlPercIss'
      Visible = False
    end
    object adsMainUnidNegCdBancoConciliacao: TStringField
      FieldName = 'UnidNeg.CdBancoConciliacao'
      Visible = False
      Size = 3
    end
    object adsMainUnidNegCdDac: TStringField
      FieldName = 'UnidNeg.CdDac'
      Visible = False
    end
    object adsMainUnidNegCdCtCusto: TStringField
      FieldName = 'UnidNeg.CdCtCusto'
      Visible = False
      Size = 4
    end
    object adsMainUnidNegIdArquivoNovoex: TStringField
      FieldName = 'UnidNeg.IdArquivoNovoex'
      Visible = False
      Size = 10
    end
    object adsMainProduto: TAureliusEntityField
      FieldName = 'Produto'
      Required = True
      Visible = False
    end
    object adsMainProdutoCdProduto: TStringField
      FieldName = 'Produto.CdProduto'
      Visible = False
      Size = 2
    end
    object adsMainProdutoNmProduto: TStringField
      FieldName = 'Produto.NmProduto'
      Visible = False
      Size = 40
    end
    object adsMainProdutoApProduto: TStringField
      FieldName = 'Produto.ApProduto'
      Visible = False
      Size = 10
    end
    object adsMainProdutoInAtivo: TStringField
      FieldName = 'Produto.InAtivo'
      Visible = False
      Size = 1
    end
    object adsMainProdutoCdViatransp: TStringField
      FieldName = 'Produto.CdViatransp'
      Visible = False
      Size = 1
    end
    object adsMainProdutoCdCtGerencial: TStringField
      FieldName = 'Produto.CdCtGerencial'
      Visible = False
      Size = 4
    end
    object adsMainProdutoTpFatSemReceita: TStringField
      FieldName = 'Produto.TpFatSemReceita'
      Visible = False
      Size = 1
    end
    object adsMainProdutoTpProduto: TStringField
      FieldName = 'Produto.TpProduto'
      Visible = False
      Size = 2
    end
    object adsMainCliente: TAureliusEntityField
      FieldName = 'Cliente'
      Visible = False
    end
    object adsMainClienteApEmpresa: TStringField
      FieldName = 'Cliente.ApEmpresa'
      Visible = False
      Size = 10
    end
    object adsMainClienteEndEmpresa: TStringField
      FieldName = 'Cliente.EndEmpresa'
      Visible = False
      Size = 50
    end
    object adsMainClienteCdTipoPessoa: TStringField
      FieldName = 'Cliente.CdTipoPessoa'
      Visible = False
      Size = 1
    end
    object adsMainClienteCpfEmpresa: TStringField
      FieldName = 'Cliente.CpfEmpresa'
      Visible = False
      Size = 11
    end
    object adsMainClienteIeEmpresa: TStringField
      FieldName = 'Cliente.IeEmpresa'
      Visible = False
    end
    object adsMainClienteInCliente: TBooleanField
      FieldName = 'Cliente.InCliente'
      Visible = False
    end
    object adsMainClienteInImportador: TBooleanField
      FieldName = 'Cliente.InImportador'
      Visible = False
    end
    object adsMainClienteInExportador: TBooleanField
      FieldName = 'Cliente.InExportador'
      Visible = False
    end
    object adsMainClienteInOutros: TBooleanField
      FieldName = 'Cliente.InOutros'
      Visible = False
    end
    object adsMainClienteCdGrupo: TStringField
      FieldName = 'Cliente.CdGrupo'
      Visible = False
      Size = 3
    end
    object adsMainClienteInRepresentante: TBooleanField
      FieldName = 'Cliente.InRepresentante'
      Visible = False
    end
    object adsMainClienteInSeguradora: TBooleanField
      FieldName = 'Cliente.InSeguradora'
      Visible = False
    end
    object adsMainUsuario: TAureliusEntityField
      FieldName = 'Usuario'
      Visible = False
    end
    object adsMainUsuarioCdUsuario: TStringField
      FieldName = 'Usuario.CdUsuario'
      Visible = False
      Size = 4
    end
    object adsMainUsuarioCdSenha: TStringField
      FieldName = 'Usuario.CdSenha'
      Visible = False
      Size = 10
    end
    object adsMainUsuarioCdCargo: TStringField
      FieldName = 'Usuario.CdCargo'
      Visible = False
      Size = 3
    end
    object adsMainUsuarioNmUsuario: TStringField
      FieldName = 'Usuario.NmUsuario'
      Visible = False
      Size = 50
    end
    object adsMainUsuarioApUsuario: TStringField
      FieldName = 'Usuario.ApUsuario'
      Visible = False
      Size = 15
    end
    object adsMainUsuarioInAtivo: TStringField
      FieldName = 'Usuario.InAtivo'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioCdInstalacao: TStringField
      FieldName = 'Usuario.CdInstalacao'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioNmEmail: TStringField
      FieldName = 'Usuario.NmEmail'
      Visible = False
      Size = 2000
    end
    object adsMainUsuarioInAvisoPo: TStringField
      FieldName = 'Usuario.InAvisoPo'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioCdCelula: TStringField
      FieldName = 'Usuario.CdCelula'
      Visible = False
      Size = 2
    end
    object adsMainUsuarioCdTranspRod: TStringField
      FieldName = 'Usuario.CdTranspRod'
      Visible = False
      Size = 4
    end
    object adsMainUsuarioInSelecionado: TStringField
      FieldName = 'Usuario.InSelecionado'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioCdIdioma: TIntegerField
      FieldName = 'Usuario.CdIdioma'
      Visible = False
    end
    object adsMainUsuarioDtUltAltSenha: TDateTimeField
      FieldName = 'Usuario.DtUltAltSenha'
      Visible = False
    end
    object adsMainUsuarioInAltStatusReceb: TStringField
      FieldName = 'Usuario.InAltStatusReceb'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioCdEmpresa: TStringField
      FieldName = 'Usuario.CdEmpresa'
      Visible = False
      Size = 5
    end
    object adsMainUsuarioCdChefia: TStringField
      FieldName = 'Usuario.CdChefia'
      Visible = False
      Size = 4
    end
    object adsMainUsuarioInModoPreview: TStringField
      FieldName = 'Usuario.InModoPreview'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioInFecharMovFinanc: TStringField
      FieldName = 'Usuario.InFecharMovFinanc'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioInPermiteFaturamento: TStringField
      FieldName = 'Usuario.InPermiteFaturamento'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioInPermiteAlteraRegDde: TStringField
      FieldName = 'Usuario.InPermiteAlteraRegDde'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioCdComputador: TIntegerField
      FieldName = 'Usuario.CdComputador'
      Visible = False
    end
    object adsMainUsuarioExibeResumo: TStringField
      FieldName = 'Usuario.ExibeResumo'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioExibeDetalhe: TStringField
      FieldName = 'Usuario.ExibeDetalhe'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioInZeraLiquidacao: TStringField
      FieldName = 'Usuario.InZeraLiquidacao'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioGrupoRap: TStringField
      FieldName = 'Usuario.GrupoRap'
      Visible = False
      Size = 3
    end
    object adsMainUsuarioSupervisaPendencias: TStringField
      FieldName = 'Usuario.SupervisaPendencias'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioNmSenhaInicial: TStringField
      FieldName = 'Usuario.NmSenhaInicial'
      Visible = False
    end
    object adsMainUsuarioInManager: TStringField
      FieldName = 'Usuario.InManager'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioInOnline: TStringField
      FieldName = 'Usuario.InOnline'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioDtUltAcesso: TDateTimeField
      FieldName = 'Usuario.DtUltAcesso'
      Visible = False
    end
    object adsMainUsuarioCdTema: TStringField
      FieldName = 'Usuario.CdTema'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioCdGrupoDetalhes: TStringField
      FieldName = 'Usuario.CdGrupoDetalhes'
      Visible = False
      Size = 3
    end
    object adsMainUsuarioInManagerSite: TStringField
      FieldName = 'Usuario.InManagerSite'
      Visible = False
      Size = 1
    end
    object adsMainUsuarioCdSuperiorDireto: TStringField
      FieldName = 'Usuario.CdSuperiorDireto'
      Visible = False
      Size = 4
    end
    object adsMainUsuarioDtAcessoAgora: TDateTimeField
      FieldName = 'Usuario.DtAcessoAgora'
      Visible = False
    end
    object adsMainUsuarioDtUltimaAcao: TDateTimeField
      FieldName = 'Usuario.DtUltimaAcao'
      Visible = False
    end
    object adsMainUsuarioNrServerMoney: TIntegerField
      FieldName = 'Usuario.NrServerMoney'
      Visible = False
    end
    object adsMainMoedaMle: TAureliusEntityField
      FieldName = 'MoedaMle'
      Visible = False
    end
    object adsMainMoedaMleCdMoeda: TStringField
      FieldName = 'MoedaMle.CdMoeda'
      Visible = False
      Size = 3
    end
    object adsMainMoedaMleNmMoeda: TStringField
      FieldName = 'MoedaMle.NmMoeda'
      Visible = False
      Size = 30
    end
    object adsMainMoedaMleApMoeda: TStringField
      FieldName = 'MoedaMle.ApMoeda'
      Visible = False
      Size = 6
    end
    object adsMainMoedaMleInAtivo: TStringField
      FieldName = 'MoedaMle.InAtivo'
      Visible = False
      Size = 1
    end
    object adsMainMoedaMleCdMoedaScx: TStringField
      FieldName = 'MoedaMle.CdMoedaScx'
      Visible = False
      Size = 3
    end
    object adsMainMoedaMleNmMoedaSing: TStringField
      FieldName = 'MoedaMle.NmMoedaSing'
      Visible = False
    end
    object adsMainMoedaMleNmMoedaPlural: TStringField
      FieldName = 'MoedaMle.NmMoedaPlural'
      Visible = False
    end
    object adsMainMoedaMleNmCentavosSing: TStringField
      FieldName = 'MoedaMle.NmCentavosSing'
      Visible = False
    end
    object adsMainMoedaMleNmCentavosPlural: TStringField
      FieldName = 'MoedaMle.NmCentavosPlural'
      Visible = False
    end
    object adsMainMoedaMleApMoedaIngles: TStringField
      FieldName = 'MoedaMle.ApMoedaIngles'
      Visible = False
      Size = 6
    end
    object adsMainMoedaMleNmMoedaSingIng: TStringField
      FieldName = 'MoedaMle.NmMoedaSingIng'
      Visible = False
    end
    object adsMainMoedaMleNmMoedaPluralIng: TStringField
      FieldName = 'MoedaMle.NmMoedaPluralIng'
      Visible = False
    end
    object adsMainMoedaMleNmCentavosSingIng: TStringField
      FieldName = 'MoedaMle.NmCentavosSingIng'
      Visible = False
    end
    object adsMainMoedaMleNmCentavosPluralIng: TStringField
      FieldName = 'MoedaMle.NmCentavosPluralIng'
      Visible = False
    end
    object adsMainMoedaMleNmMoedaSingEsp: TStringField
      FieldName = 'MoedaMle.NmMoedaSingEsp'
      Visible = False
    end
    object adsMainMoedaMleNmMoedaPluralEsp: TStringField
      FieldName = 'MoedaMle.NmMoedaPluralEsp'
      Visible = False
    end
    object adsMainMoedaMleNmCentavosSingEsp: TStringField
      FieldName = 'MoedaMle.NmCentavosSingEsp'
      Visible = False
    end
    object adsMainMoedaMleNmCentavosPluralEsp: TStringField
      FieldName = 'MoedaMle.NmCentavosPluralEsp'
      Visible = False
    end
    object adsMainPaisDestino: TAureliusEntityField
      FieldName = 'PaisDestino'
      Visible = False
    end
    object adsMainPaisDestinoCdPais: TStringField
      FieldName = 'PaisDestino.CdPais'
      Visible = False
      Size = 3
    end
    object adsMainPaisDestinoNmPais: TStringField
      FieldName = 'PaisDestino.NmPais'
      Visible = False
      Size = 120
    end
    object adsMainPaisDestinoNmSiglaCrt: TStringField
      FieldName = 'PaisDestino.NmSiglaCrt'
      Visible = False
      Size = 2
    end
    object adsMainDespachante: TAureliusEntityField
      FieldName = 'Despachante'
      Visible = False
    end
    object adsMainDespachanteCdDespachante: TStringField
      FieldName = 'Despachante.CdDespachante'
      Visible = False
      Size = 3
    end
    object adsMainDespachanteNmDespachante: TStringField
      FieldName = 'Despachante.NmDespachante'
      Visible = False
      Size = 50
    end
    object adsMainDespachanteApDespachante: TStringField
      FieldName = 'Despachante.ApDespachante'
      Visible = False
      Size = 10
    end
    object adsMainDespachanteVlMinSda: TFloatField
      FieldName = 'Despachante.VlMinSda'
      Visible = False
    end
    object adsMainDespachanteVlMaxSda: TFloatField
      FieldName = 'Despachante.VlMaxSda'
      Visible = False
    end
    object adsMainDespachanteCdRisc: TStringField
      FieldName = 'Despachante.CdRisc'
      Visible = False
      Size = 3
    end
    object adsMainDespachanteInAtivo: TStringField
      FieldName = 'Despachante.InAtivo'
      Visible = False
      Size = 1
    end
    object adsMainDespachanteCdFavorecido: TStringField
      FieldName = 'Despachante.CdFavorecido'
      Visible = False
      Size = 5
    end
    object adsMainDespachanteCdModSda: TStringField
      FieldName = 'Despachante.CdModSda'
      Visible = False
      Size = 2
    end
    object adsMainDespachanteNrRegistro: TStringField
      FieldName = 'Despachante.NrRegistro'
      Visible = False
      Size = 9
    end
    object adsMainDespachanteCpfDespachante: TStringField
      FieldName = 'Despachante.CpfDespachante'
      Visible = False
      Size = 11
    end
    object adsMainDespachanteNrContaCorrente: TStringField
      FieldName = 'Despachante.NrContaCorrente'
      Visible = False
      Size = 10
    end
    object adsMainDespachanteNrDigitoContaCorrente: TStringField
      FieldName = 'Despachante.NrDigitoContaCorrente'
      Visible = False
      Size = 1
    end
    object adsMainDespachanteCdDespSda: TStringField
      FieldName = 'Despachante.CdDespSda'
      Visible = False
      Size = 12
    end
    object adsMainDespachanteCdProduto: TStringField
      FieldName = 'Despachante.CdProduto'
      Visible = False
      Size = 2
    end
    object adsMainDespachanteNmSenha: TStringField
      FieldName = 'Despachante.NmSenha'
      Visible = False
      Size = 12
    end
    object adsMainDespachanteInConsultaSiscomex: TStringField
      FieldName = 'Despachante.InConsultaSiscomex'
      Visible = False
      Size = 1
    end
    object adsMainDespachanteCdUsuario: TStringField
      FieldName = 'Despachante.CdUsuario'
      Visible = False
      Size = 4
    end
    object adsMainDespachanteDtSenha: TDateTimeField
      FieldName = 'Despachante.DtSenha'
      Visible = False
    end
    object adsMainIncoterm: TAureliusEntityField
      FieldName = 'Incoterm'
      Visible = False
    end
    object adsMainIncotermCodigo: TStringField
      FieldName = 'Incoterm.Codigo'
      Visible = False
      Size = 3
    end
    object adsMainIncotermDescricao: TStringField
      FieldName = 'Incoterm.Descricao'
      Visible = False
      Size = 60
    end
    object adsMainIncotermSinal: TStringField
      FieldName = 'Incoterm.Sinal'
      Visible = False
      Size = 1
    end
    object adsMainIncotermInTipoFrete: TStringField
      FieldName = 'Incoterm.InTipoFrete'
      Visible = False
      Size = 2
    end
    object adsMainExportador: TAureliusEntityField
      FieldName = 'Exportador'
      Visible = False
    end
    object adsMainExportadorCdEmpresa: TStringField
      FieldName = 'Exportador.CdEmpresa'
      Visible = False
      Size = 5
    end
    object adsMainExportadorNmEmpresa: TStringField
      FieldName = 'Exportador.NmEmpresa'
      Visible = False
      Size = 80
    end
    object adsMainExportadorApEmpresa: TStringField
      FieldName = 'Exportador.ApEmpresa'
      Visible = False
      Size = 10
    end
    object adsMainExportadorEndEmpresa: TStringField
      FieldName = 'Exportador.EndEmpresa'
      Visible = False
      Size = 50
    end
    object adsMainExportadorCdTipoPessoa: TStringField
      FieldName = 'Exportador.CdTipoPessoa'
      Visible = False
      Size = 1
    end
    object adsMainExportadorCgcEmpresa: TStringField
      FieldName = 'Exportador.CgcEmpresa'
      Visible = False
      Size = 14
    end
    object adsMainExportadorCpfEmpresa: TStringField
      FieldName = 'Exportador.CpfEmpresa'
      Visible = False
      Size = 11
    end
    object adsMainExportadorIeEmpresa: TStringField
      FieldName = 'Exportador.IeEmpresa'
      Visible = False
    end
    object adsMainExportadorInCliente: TBooleanField
      FieldName = 'Exportador.InCliente'
      Visible = False
    end
    object adsMainExportadorInImportador: TBooleanField
      FieldName = 'Exportador.InImportador'
      Visible = False
    end
    object adsMainExportadorInExportador: TBooleanField
      FieldName = 'Exportador.InExportador'
      Visible = False
    end
    object adsMainExportadorInOutros: TBooleanField
      FieldName = 'Exportador.InOutros'
      Visible = False
    end
    object adsMainExportadorCdGrupo: TStringField
      FieldName = 'Exportador.CdGrupo'
      Visible = False
      Size = 3
    end
    object adsMainExportadorInRepresentante: TBooleanField
      FieldName = 'Exportador.InRepresentante'
      Visible = False
    end
    object adsMainExportadorInSeguradora: TBooleanField
      FieldName = 'Exportador.InSeguradora'
      Visible = False
    end
    object adsMainClienteEndNumero: TStringField
      FieldName = 'Cliente.EndNumero'
      Size = 6
    end
    object adsMainClienteEndCidade: TStringField
      FieldName = 'Cliente.EndCidade'
      Size = 30
    end
    object adsMainClienteEndBairro: TStringField
      FieldName = 'Cliente.EndBairro'
      Size = 30
    end
    object adsMainClienteEndUf: TStringField
      FieldName = 'Cliente.EndUf'
      Size = 2
    end
    object adsMainClienteEndCep: TStringField
      FieldName = 'Cliente.EndCep'
      Size = 8
    end
    object adsMainClienteInAtivo: TStringField
      FieldName = 'Cliente.InAtivo'
      Size = 1
    end
    object adsMainClienteCdPaisImportador: TStringField
      FieldName = 'Cliente.CdPaisImportador'
      Size = 3
    end
    object adsMainClienteEndCompl: TStringField
      FieldName = 'Cliente.EndCompl'
      Size = 50
    end
    object adsMainClienteEndComplemento: TStringField
      FieldName = 'Cliente.EndComplemento'
      Size = 60
    end
    object adsMainExportadorEndNumero: TStringField
      FieldName = 'Exportador.EndNumero'
      Size = 6
    end
    object adsMainExportadorEndCidade: TStringField
      FieldName = 'Exportador.EndCidade'
      Size = 30
    end
    object adsMainExportadorEndBairro: TStringField
      FieldName = 'Exportador.EndBairro'
      Size = 30
    end
    object adsMainExportadorEndUf: TStringField
      FieldName = 'Exportador.EndUf'
      Size = 2
    end
    object adsMainExportadorEndCep: TStringField
      FieldName = 'Exportador.EndCep'
      Size = 8
    end
    object adsMainExportadorInAtivo: TStringField
      FieldName = 'Exportador.InAtivo'
      Size = 1
    end
    object adsMainExportadorCdPaisImportador: TStringField
      FieldName = 'Exportador.CdPaisImportador'
      Size = 3
    end
    object adsMainExportadorEndCompl: TStringField
      FieldName = 'Exportador.EndCompl'
      Size = 50
    end
    object adsMainExportadorEndComplemento: TStringField
      FieldName = 'Exportador.EndComplemento'
      Size = 60
    end
    object adsMainImportador: TAureliusEntityField
      FieldName = 'Importador'
    end
    object adsMainImportadorCdEmpresa: TStringField
      FieldName = 'Importador.CdEmpresa'
      Size = 5
    end
    object adsMainImportadorNmEmpresa: TStringField
      FieldName = 'Importador.NmEmpresa'
      Size = 100
    end
    object adsMainImportadorApEmpresa: TStringField
      FieldName = 'Importador.ApEmpresa'
      Size = 10
    end
    object adsMainImportadorEndEmpresa: TStringField
      FieldName = 'Importador.EndEmpresa'
      Size = 100
    end
    object adsMainImportadorEndNumero: TStringField
      FieldName = 'Importador.EndNumero'
      Size = 6
    end
    object adsMainImportadorEndCompl: TStringField
      FieldName = 'Importador.EndCompl'
      Size = 41
    end
    object adsMainImportadorEndCidade: TStringField
      FieldName = 'Importador.EndCidade'
      Size = 30
    end
    object adsMainImportadorEndEstado: TStringField
      FieldName = 'Importador.EndEstado'
      Size = 30
    end
    object adsMainImportadorInAtivo: TStringField
      FieldName = 'Importador.InAtivo'
      Size = 1
    end
    object adsMainImportadorInAgente: TBooleanField
      FieldName = 'Importador.InAgente'
    end
    object adsMainImportadorInBanco: TBooleanField
      FieldName = 'Importador.InBanco'
    end
    object adsMainImportadorInImportador: TBooleanField
      FieldName = 'Importador.InImportador'
    end
    object adsMainImportadorInSeguradora: TBooleanField
      FieldName = 'Importador.InSeguradora'
    end
    object adsMainImportadorInExportador: TBooleanField
      FieldName = 'Importador.InExportador'
    end
    object adsMainImportadorNrCliente: TStringField
      FieldName = 'Importador.NrCliente'
      Size = 15
    end
    object adsMainImportadorInComprador: TBooleanField
      FieldName = 'Importador.InComprador'
    end
    object adsMainImportadorCgcEmpresa: TStringField
      FieldName = 'Importador.CgcEmpresa'
      Size = 14
    end
    object adsMainImportadorInPoTrans: TStringField
      FieldName = 'Importador.InPoTrans'
      Size = 1
    end
    object adsMainImportadorNrRuc: TStringField
      FieldName = 'Importador.NrRuc'
      Size = 25
    end
    object adsMainImportadorNrNit: TStringField
      FieldName = 'Importador.NrNit'
      Size = 25
    end
    object adsMainImportadorPais: TAureliusEntityField
      FieldName = 'Importador.Pais'
    end
    object adsMainImportadorPaisCdPais: TStringField
      FieldName = 'Importador.Pais.CdPais'
      Size = 3
    end
    object adsMainImportadorPaisNmPais: TStringField
      FieldName = 'Importador.Pais.NmPais'
      Size = 120
    end
    object adsMainImportadorPaisNmSiglaCrt: TStringField
      FieldName = 'Importador.Pais.NmSiglaCrt'
      Size = 2
    end
    object adsMainInProcessoConsolidado: TBooleanField
      FieldName = 'InProcessoConsolidado'
    end
    object adsMainServico: TAureliusEntityField
      FieldName = 'Servico'
    end
    object adsMainServicoCdServico: TStringField
      FieldName = 'Servico.CdServico'
      Size = 3
    end
    object adsMainServicoNmServico: TStringField
      FieldName = 'Servico.NmServico'
      Size = 50
    end
    object adsMainServicoCdViaTransporte: TStringField
      FieldName = 'Servico.CdViaTransporte'
      Size = 2
    end
    object adsMainServicoInAtivo: TStringField
      FieldName = 'Servico.InAtivo'
      Size = 1
    end
    object adsMainServicoInNovoServico: TIntegerField
      FieldName = 'Servico.InNovoServico'
    end
    object adsMainTpFrete: TAureliusEntityField
      FieldName = 'TpFrete'
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 296
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainProcessoExp
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
        Name = 'DtRegistroPedido'
        DataType = ftDateTime
      end
      item
        Name = 'TxMarcacaoVolume'
        DataType = ftMemo
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
        DataType = ftMemo
      end
      item
        Name = 'InUmEnquadPorProc'
        DataType = ftBoolean
      end
      item
        Name = 'TxInformacoesAdicionais'
        DataType = ftMemo
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
        DataType = ftMemo
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
        Name = 'PaisDestino.NmSigla2l'
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
        Name = 'Exportador.Grupo'
        DataType = ftVariant
      end
      item
        Name = 'Exportador.Grupo.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Exportador.Grupo.NmGrupo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Exportador.Grupo.DtInclusao'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.Grupo.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Exportador.Grupo.CnpjGrupo'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Exportador.Grupo.DtNovoFollowupImp'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.Grupo.DtNovoFollowupExp'
        DataType = ftDateTime
      end
      item
        Name = 'Exportador.Grupo.NmEmailDraftBl'
        DataType = ftString
        Size = 100
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
        Name = 'Processo.NrViagem'
        DataType = ftString
        Size = 15
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
        Name = 'Processo.CdLinguaPedido'
        DataType = ftString
        Size = 1
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
        Name = 'Processo.Cliente.Grupo'
        DataType = ftVariant
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
        Name = 'Processo.PaisDestino.NmSigla2l'
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
        Name = 'Processo.Exportador.Grupo'
        DataType = ftVariant
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
        Name = 'Processo.Servico.InNovoServico'
        DataType = ftInteger
      end
      item
        Name = 'Processo.Agente'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Agente.CdAgente'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.Agente.NmAgente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Processo.Agente.NrCgcAgente'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.Agente.NrSigla'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Processo.Agente.DsEndereco'
        DataType = ftString
        Size = 260
      end
      item
        Name = 'Processo.Agente.NrZipCode'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Processo.Agente.DsEmail'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Processo.Agente.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Processo.Agente.DsScacCode'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.Agente.CdCidade'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Agente.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Notify1Proc'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Notify1Proc.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Processo.Notify1Proc.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Notify1Proc.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Notify1Proc.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Notify1Proc.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Processo.Notify1Proc.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Processo.Notify1Proc.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Notify1Proc.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Notify1Proc.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Notify1Proc.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify1Proc.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify1Proc.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify1Proc.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify1Proc.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify1Proc.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Processo.Notify1Proc.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify1Proc.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.Notify1Proc.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Notify1Proc.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Notify1Proc.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Notify1Proc.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Notify2Proc'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Notify2Proc.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Processo.Notify2Proc.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Notify2Proc.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Notify2Proc.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Notify2Proc.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Processo.Notify2Proc.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Processo.Notify2Proc.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Notify2Proc.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Notify2Proc.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Notify2Proc.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify2Proc.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify2Proc.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify2Proc.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify2Proc.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify2Proc.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Processo.Notify2Proc.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Notify2Proc.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.Notify2Proc.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Notify2Proc.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Notify2Proc.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Notify2Proc.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Consignee'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Consignee.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Processo.Consignee.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Consignee.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Processo.Consignee.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Processo.Consignee.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Processo.Consignee.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Processo.Consignee.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Consignee.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Processo.Consignee.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Consignee.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Consignee.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Consignee.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Consignee.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Consignee.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Consignee.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Processo.Consignee.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'Processo.Consignee.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Processo.Consignee.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.Consignee.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Consignee.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Processo.Consignee.Pais'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Embarcacao'
        DataType = ftVariant
      end
      item
        Name = 'Processo.Embarcacao.CdEmbarcacao'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.Embarcacao.NmEmbarcacao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Processo.LocalEmbarque'
        DataType = ftVariant
      end
      item
        Name = 'Processo.LocalEmbarque.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.LocalEmbarque.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.LocalEmbarque.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.LocalDesembarque'
        DataType = ftVariant
      end
      item
        Name = 'Processo.LocalDesembarque.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.LocalDesembarque.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.LocalDesembarque.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.LocalEntrega'
        DataType = ftVariant
      end
      item
        Name = 'Processo.LocalEntrega.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Processo.LocalEntrega.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Processo.LocalEntrega.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Processo.TpFrete'
        DataType = ftVariant
      end
      item
        Name = 'Processo.TpFrete.Codigo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Processo.TpFrete.Descricao'
        DataType = ftString
        Size = 30
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
      end
      item
        Name = 'Importador.Pais.NmSigla2l'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TipoFrete'
        DataType = ftVariant
      end
      item
        Name = 'TipoFrete.Codigo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TipoFrete.Descricao'
        DataType = ftString
        Size = 30
      end>
    SubpropsDepth = 2
    Left = 600
    Top = 400
    DesignClass = 'MyEntitiesBroker.TTprocessoExp'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsDetailCdImportador: TStringField
      FieldName = 'CdImportador'
      Visible = False
      Size = 5
    end
    object adsDetailCdAgente: TStringField
      FieldName = 'CdAgente'
      Visible = False
      Size = 4
    end
    object adsDetailCdViaTransporte: TStringField
      FieldName = 'CdViaTransporte'
      Visible = False
      Size = 2
    end
    object adsDetailCdTransportadora: TStringField
      FieldName = 'CdTransportadora'
      Visible = False
      Size = 4
    end
    object adsDetailCdSeguradora: TStringField
      FieldName = 'CdSeguradora'
      Visible = False
      Size = 5
    end
    object adsDetailCdRepresentante: TStringField
      FieldName = 'CdRepresentante'
      Visible = False
      Size = 5
    end
    object adsDetailCdLocalOrigem: TStringField
      FieldName = 'CdLocalOrigem'
      Visible = False
      Size = 4
    end
    object adsDetailCdLocalDestino: TStringField
      FieldName = 'CdLocalDestino'
      Visible = False
      Size = 4
    end
    object adsDetailDtRegistroPedido: TDateTimeField
      FieldName = 'DtRegistroPedido'
      Visible = False
    end
    object adsDetailVlFrete: TFloatField
      FieldName = 'VlFrete'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlSeguro: TFloatField
      FieldName = 'VlSeguro'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlPesoLiquido: TFloatField
      FieldName = 'VlPesoLiquido'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlDesconto: TFloatField
      FieldName = 'VlDesconto'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlComissaoPercent: TFloatField
      FieldName = 'VlComissaoPercent'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlTotMcv: TFloatField
      FieldName = 'VlTotMcv'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlTotExw: TFloatField
      FieldName = 'VlTotExw'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailInDue: TBooleanField
      FieldName = 'InDue'
      Visible = False
    end
    object adsDetailInRecAlfandegadoDespacho: TBooleanField
      FieldName = 'InRecAlfandegadoDespacho'
      Visible = False
    end
    object adsDetailNmRefEndRecAlfandDespacho: TStringField
      FieldName = 'NmRefEndRecAlfandDespacho'
      Visible = False
      Size = 200
    end
    object adsDetailInUmEnquadPorProc: TBooleanField
      FieldName = 'InUmEnquadPorProc'
      Visible = False
    end
    object adsDetailTxInformacoesAdicionais: TStringField
      DisplayWidth = 1500
      FieldName = 'TxInformacoesAdicionais'
      Visible = False
      Size = 1500
    end
    object adsDetailCdStatusDue: TIntegerField
      FieldName = 'CdStatusDue'
      Visible = False
    end
    object adsDetailDtEnvioDue: TDateTimeField
      FieldName = 'DtEnvioDue'
      Visible = False
    end
    object adsDetailCdChaveAcessoDue: TStringField
      FieldName = 'CdChaveAcessoDue'
      Visible = False
    end
    object adsDetailIncoterm: TAureliusEntityField
      FieldName = 'Incoterm'
      Visible = False
    end
    object adsDetailIncotermCodigo: TStringField
      FieldName = 'Incoterm.Codigo'
      Visible = False
      Size = 3
    end
    object adsDetailIncotermDescricao: TStringField
      DisplayLabel = 'Incoterm'
      FieldName = 'Incoterm.Descricao'
      Size = 60
    end
    object adsDetailIncotermSinal: TStringField
      FieldName = 'Incoterm.Sinal'
      Visible = False
      Size = 1
    end
    object adsDetailIncotermInTipoFrete: TStringField
      FieldName = 'Incoterm.InTipoFrete'
      Visible = False
      Size = 2
    end
    object adsDetailPaisDestino: TAureliusEntityField
      FieldName = 'PaisDestino'
      Visible = False
    end
    object adsDetailPaisDestinoCdPais: TStringField
      FieldName = 'PaisDestino.CdPais'
      Visible = False
      Size = 3
    end
    object adsDetailPaisDestinoNmPais: TStringField
      DisplayLabel = 'Pais Destino'
      FieldName = 'PaisDestino.NmPais'
      Size = 120
    end
    object adsDetailPaisDestinoNmSiglaCrt: TStringField
      FieldName = 'PaisDestino.NmSiglaCrt'
      Visible = False
      Size = 2
    end
    object adsDetailMoeda: TAureliusEntityField
      FieldName = 'Moeda'
      Visible = False
    end
    object adsDetailMoedaCdMoeda: TStringField
      FieldName = 'Moeda.CdMoeda'
      Visible = False
      Size = 3
    end
    object adsDetailMoedaNmMoeda: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'Moeda.NmMoeda'
      Size = 30
    end
    object adsDetailMoedaApMoeda: TStringField
      FieldName = 'Moeda.ApMoeda'
      Visible = False
      Size = 6
    end
    object adsDetailMoedaInAtivo: TStringField
      FieldName = 'Moeda.InAtivo'
      Visible = False
      Size = 1
    end
    object adsDetailMoedaCdMoedaScx: TStringField
      FieldName = 'Moeda.CdMoedaScx'
      Visible = False
      Size = 3
    end
    object adsDetailMoedaNmMoedaSing: TStringField
      FieldName = 'Moeda.NmMoedaSing'
      Visible = False
    end
    object adsDetailMoedaNmMoedaPlural: TStringField
      FieldName = 'Moeda.NmMoedaPlural'
      Visible = False
    end
    object adsDetailMoedaNmCentavosSing: TStringField
      FieldName = 'Moeda.NmCentavosSing'
      Visible = False
    end
    object adsDetailMoedaNmCentavosPlural: TStringField
      FieldName = 'Moeda.NmCentavosPlural'
      Visible = False
    end
    object adsDetailMoedaApMoedaIngles: TStringField
      FieldName = 'Moeda.ApMoedaIngles'
      Visible = False
      Size = 6
    end
    object adsDetailMoedaNmMoedaSingIng: TStringField
      FieldName = 'Moeda.NmMoedaSingIng'
      Visible = False
    end
    object adsDetailMoedaNmMoedaPluralIng: TStringField
      FieldName = 'Moeda.NmMoedaPluralIng'
      Visible = False
    end
    object adsDetailMoedaNmCentavosSingIng: TStringField
      FieldName = 'Moeda.NmCentavosSingIng'
      Visible = False
    end
    object adsDetailMoedaNmCentavosPluralIng: TStringField
      FieldName = 'Moeda.NmCentavosPluralIng'
      Visible = False
    end
    object adsDetailMoedaNmMoedaSingEsp: TStringField
      FieldName = 'Moeda.NmMoedaSingEsp'
      Visible = False
    end
    object adsDetailMoedaNmMoedaPluralEsp: TStringField
      FieldName = 'Moeda.NmMoedaPluralEsp'
      Visible = False
    end
    object adsDetailMoedaNmCentavosSingEsp: TStringField
      FieldName = 'Moeda.NmCentavosSingEsp'
      Visible = False
    end
    object adsDetailMoedaNmCentavosPluralEsp: TStringField
      FieldName = 'Moeda.NmCentavosPluralEsp'
      Visible = False
    end
    object adsDetailUrfDespacho: TAureliusEntityField
      FieldName = 'UrfDespacho'
      Visible = False
    end
    object adsDetailUrfDespachoCodigo: TStringField
      FieldName = 'UrfDespacho.Codigo'
      Visible = False
      Size = 7
    end
    object adsDetailUrfDespachoDescricao: TStringField
      FieldName = 'UrfDespacho.Descricao'
      Visible = False
      Size = 120
    end
    object adsDetailUrfDespachoCdDigito: TStringField
      FieldName = 'UrfDespacho.CdDigito'
      Visible = False
      Size = 1
    end
    object adsDetailUrfDespachoEndUf: TStringField
      FieldName = 'UrfDespacho.EndUf'
      Visible = False
      Size = 2
    end
    object adsDetailUrfDestino: TAureliusEntityField
      FieldName = 'UrfDestino'
      Visible = False
    end
    object adsDetailUrfDestinoCodigo: TStringField
      FieldName = 'UrfDestino.Codigo'
      Visible = False
      Size = 7
    end
    object adsDetailUrfDestinoDescricao: TStringField
      FieldName = 'UrfDestino.Descricao'
      Visible = False
      Size = 120
    end
    object adsDetailUrfDestinoCdDigito: TStringField
      FieldName = 'UrfDestino.CdDigito'
      Visible = False
      Size = 1
    end
    object adsDetailUrfDestinoEndUf: TStringField
      FieldName = 'UrfDestino.EndUf'
      Visible = False
      Size = 2
    end
    object adsDetailRecAlfandegadoDespacho: TAureliusEntityField
      FieldName = 'RecAlfandegadoDespacho'
      Visible = False
    end
    object adsDetailRecAlfandegadoDespachoCodigo: TStringField
      FieldName = 'RecAlfandegadoDespacho.Codigo'
      Visible = False
      Size = 7
    end
    object adsDetailRecAlfandegadoDespachoDescricao: TStringField
      FieldName = 'RecAlfandegadoDespacho.Descricao'
      Visible = False
      Size = 120
    end
    object adsDetailRecAlfandegadoDespachoCodOrgaoRec: TStringField
      FieldName = 'RecAlfandegadoDespacho.CodOrgaoRec'
      Visible = False
      Size = 7
    end
    object adsDetailRecAlfandegadoEmbarque: TAureliusEntityField
      FieldName = 'RecAlfandegadoEmbarque'
      Visible = False
    end
    object adsDetailRecAlfandegadoEmbarqueCodigo: TStringField
      FieldName = 'RecAlfandegadoEmbarque.Codigo'
      Visible = False
      Size = 7
    end
    object adsDetailRecAlfandegadoEmbarqueDescricao: TStringField
      FieldName = 'RecAlfandegadoEmbarque.Descricao'
      Visible = False
      Size = 120
    end
    object adsDetailRecAlfandegadoEmbarqueCodOrgaoRec: TStringField
      FieldName = 'RecAlfandegadoEmbarque.CodOrgaoRec'
      Visible = False
      Size = 7
    end
    object adsDetailExportador: TAureliusEntityField
      FieldName = 'Exportador'
      Required = True
      Visible = False
    end
    object adsDetailExportadorCdEmpresa: TStringField
      FieldName = 'Exportador.CdEmpresa'
      Visible = False
      Size = 5
    end
    object adsDetailExportadorNmEmpresa: TStringField
      FieldName = 'Exportador.NmEmpresa'
      Visible = False
      Size = 80
    end
    object adsDetailExportadorApEmpresa: TStringField
      FieldName = 'Exportador.ApEmpresa'
      Visible = False
      Size = 10
    end
    object adsDetailExportadorEndEmpresa: TStringField
      FieldName = 'Exportador.EndEmpresa'
      Visible = False
      Size = 50
    end
    object adsDetailExportadorCdTipoPessoa: TStringField
      FieldName = 'Exportador.CdTipoPessoa'
      Visible = False
      Size = 1
    end
    object adsDetailExportadorCgcEmpresa: TStringField
      FieldName = 'Exportador.CgcEmpresa'
      Visible = False
      Size = 14
    end
    object adsDetailExportadorCpfEmpresa: TStringField
      FieldName = 'Exportador.CpfEmpresa'
      Visible = False
      Size = 11
    end
    object adsDetailExportadorIeEmpresa: TStringField
      FieldName = 'Exportador.IeEmpresa'
      Visible = False
    end
    object adsDetailExportadorInCliente: TBooleanField
      FieldName = 'Exportador.InCliente'
      Visible = False
    end
    object adsDetailExportadorInImportador: TBooleanField
      FieldName = 'Exportador.InImportador'
      Visible = False
    end
    object adsDetailExportadorInExportador: TBooleanField
      FieldName = 'Exportador.InExportador'
      Visible = False
    end
    object adsDetailExportadorInOutros: TBooleanField
      FieldName = 'Exportador.InOutros'
      Visible = False
    end
    object adsDetailExportadorInRepresentante: TBooleanField
      FieldName = 'Exportador.InRepresentante'
      Visible = False
    end
    object adsDetailExportadorInSeguradora: TBooleanField
      FieldName = 'Exportador.InSeguradora'
      Visible = False
    end
    object adsDetailEnquadOp: TAureliusEntityField
      FieldName = 'EnquadOp'
      Visible = False
    end
    object adsDetailEnquadOpCdEnquadOp: TStringField
      FieldName = 'EnquadOp.CdEnquadOp'
      Visible = False
      Size = 5
    end
    object adsDetailEnquadOpNmEnquadOp: TStringField
      FieldName = 'EnquadOp.NmEnquadOp'
      Visible = False
      Size = 60
    end
    object adsDetailEnquadOpInAtivo: TStringField
      FieldName = 'EnquadOp.InAtivo'
      Visible = False
      Size = 1
    end
    object adsDetailDespachante: TAureliusEntityField
      FieldName = 'Despachante'
      Visible = False
    end
    object adsDetailDespachanteCdDespachante: TStringField
      FieldName = 'Despachante.CdDespachante'
      Visible = False
      Size = 3
    end
    object adsDetailDespachanteNmDespachante: TStringField
      FieldName = 'Despachante.NmDespachante'
      Visible = False
      Size = 50
    end
    object adsDetailDespachanteApDespachante: TStringField
      FieldName = 'Despachante.ApDespachante'
      Visible = False
      Size = 10
    end
    object adsDetailDespachanteVlMinSda: TFloatField
      FieldName = 'Despachante.VlMinSda'
      Visible = False
    end
    object adsDetailDespachanteVlMaxSda: TFloatField
      FieldName = 'Despachante.VlMaxSda'
      Visible = False
    end
    object adsDetailDespachanteCdRisc: TStringField
      FieldName = 'Despachante.CdRisc'
      Visible = False
      Size = 3
    end
    object adsDetailDespachanteInAtivo: TStringField
      FieldName = 'Despachante.InAtivo'
      Visible = False
      Size = 1
    end
    object adsDetailDespachanteCdFavorecido: TStringField
      FieldName = 'Despachante.CdFavorecido'
      Visible = False
      Size = 5
    end
    object adsDetailDespachanteCdModSda: TStringField
      FieldName = 'Despachante.CdModSda'
      Visible = False
      Size = 2
    end
    object adsDetailDespachanteNrRegistro: TStringField
      FieldName = 'Despachante.NrRegistro'
      Visible = False
      Size = 9
    end
    object adsDetailDespachanteCpfDespachante: TStringField
      FieldName = 'Despachante.CpfDespachante'
      Visible = False
      Size = 11
    end
    object adsDetailDespachanteNrContaCorrente: TStringField
      FieldName = 'Despachante.NrContaCorrente'
      Visible = False
      Size = 10
    end
    object adsDetailDespachanteNrDigitoContaCorrente: TStringField
      FieldName = 'Despachante.NrDigitoContaCorrente'
      Visible = False
      Size = 1
    end
    object adsDetailDespachanteCdDespSda: TStringField
      FieldName = 'Despachante.CdDespSda'
      Visible = False
      Size = 12
    end
    object adsDetailDespachanteCdProduto: TStringField
      FieldName = 'Despachante.CdProduto'
      Visible = False
      Size = 2
    end
    object adsDetailDespachanteNmSenha: TStringField
      FieldName = 'Despachante.NmSenha'
      Visible = False
      Size = 12
    end
    object adsDetailDespachanteInConsultaSiscomex: TStringField
      FieldName = 'Despachante.InConsultaSiscomex'
      Visible = False
      Size = 1
    end
    object adsDetailDespachanteCdUsuario: TStringField
      FieldName = 'Despachante.CdUsuario'
      Visible = False
      Size = 4
    end
    object adsDetailDespachanteDtSenha: TDateTimeField
      FieldName = 'Despachante.DtSenha'
      Visible = False
    end
    object adsDetailProcesso: TAureliusEntityField
      FieldName = 'Processo'
      Required = True
      Visible = False
    end
    object adsDetailInTipoDocumentoDue: TIntegerField
      FieldName = 'InTipoDocumentoDue'
    end
    object adsDetailExportadorInAtivo: TStringField
      FieldName = 'Exportador.InAtivo'
      Size = 1
    end
    object adsDetailExportadorEndNumero: TStringField
      FieldName = 'Exportador.EndNumero'
      Size = 6
    end
    object adsDetailExportadorEndCidade: TStringField
      FieldName = 'Exportador.EndCidade'
      Size = 30
    end
    object adsDetailExportadorEndBairro: TStringField
      FieldName = 'Exportador.EndBairro'
      Size = 30
    end
    object adsDetailExportadorEndUf: TStringField
      FieldName = 'Exportador.EndUf'
      Size = 2
    end
    object adsDetailExportadorEndCep: TStringField
      FieldName = 'Exportador.EndCep'
      Size = 8
    end
    object adsDetailExportadorCdPaisImportador: TStringField
      FieldName = 'Exportador.CdPaisImportador'
      Size = 3
    end
    object adsDetailExportadorEndCompl: TStringField
      FieldName = 'Exportador.EndCompl'
      Size = 50
    end
    object adsDetailExportadorEndComplemento: TStringField
      FieldName = 'Exportador.EndComplemento'
      Size = 60
    end
    object adsDetailProcessoImportador: TAureliusEntityField
      FieldName = 'Processo.Importador'
    end
    object adsDetailImportador: TAureliusEntityField
      FieldName = 'Importador'
    end
    object adsDetailImportadorNmEmpresa: TStringField
      FieldName = 'Importador.NmEmpresa'
      Size = 100
    end
    object adsDetailImportadorApEmpresa: TStringField
      FieldName = 'Importador.ApEmpresa'
      Size = 10
    end
    object adsDetailImportadorEndEmpresa: TStringField
      FieldName = 'Importador.EndEmpresa'
      Size = 100
    end
    object adsDetailImportadorEndNumero: TStringField
      FieldName = 'Importador.EndNumero'
      Size = 6
    end
    object adsDetailImportadorEndCompl: TStringField
      FieldName = 'Importador.EndCompl'
      Size = 41
    end
    object adsDetailImportadorEndCidade: TStringField
      FieldName = 'Importador.EndCidade'
      Size = 30
    end
    object adsDetailImportadorEndEstado: TStringField
      FieldName = 'Importador.EndEstado'
      Size = 30
    end
    object adsDetailImportadorInAtivo: TStringField
      FieldName = 'Importador.InAtivo'
      Size = 1
    end
    object adsDetailImportadorInAgente: TBooleanField
      FieldName = 'Importador.InAgente'
    end
    object adsDetailImportadorInBanco: TBooleanField
      FieldName = 'Importador.InBanco'
    end
    object adsDetailImportadorInImportador: TBooleanField
      FieldName = 'Importador.InImportador'
    end
    object adsDetailImportadorInSeguradora: TBooleanField
      FieldName = 'Importador.InSeguradora'
    end
    object adsDetailImportadorInExportador: TBooleanField
      FieldName = 'Importador.InExportador'
    end
    object adsDetailImportadorNrCliente: TStringField
      FieldName = 'Importador.NrCliente'
      Size = 15
    end
    object adsDetailImportadorInComprador: TBooleanField
      FieldName = 'Importador.InComprador'
    end
    object adsDetailImportadorCgcEmpresa: TStringField
      FieldName = 'Importador.CgcEmpresa'
      Size = 14
    end
    object adsDetailImportadorInPoTrans: TStringField
      FieldName = 'Importador.InPoTrans'
      Size = 1
    end
    object adsDetailImportadorNrRuc: TStringField
      FieldName = 'Importador.NrRuc'
      Size = 25
    end
    object adsDetailImportadorNrNit: TStringField
      FieldName = 'Importador.NrNit'
      Size = 25
    end
    object adsDetailImportadorPais: TAureliusEntityField
      FieldName = 'Importador.Pais'
    end
    object adsDetailImportadorCdEmpresa: TStringField
      FieldName = 'Importador.CdEmpresa'
      Size = 5
    end
    object adsDetailNrProcesssoAdmImp: TStringField
      FieldName = 'NrProcesssoAdmImp'
      Size = 17
    end
    object adsDetailDtPrazoValidadeExpTemp: TDateTimeField
      FieldName = 'DtPrazoValidadeExpTemp'
    end
    object adsDetailTxMotivoRetificacao: TStringField
      FieldName = 'TxMotivoRetificacao'
      Size = 200
    end
    object adsDetailQtDiasPrazoValidadeExpTemp: TIntegerField
      FieldName = 'QtDiasPrazoValidadeExpTemp'
    end
    object adsDetailProcessoVlFretePrepaidMneg: TFloatField
      FieldName = 'Processo.VlFretePrepaidMneg'
    end
    object adsDetailProcessoNrProcesso: TStringField
      FieldName = 'Processo.NrProcesso'
      Size = 18
    end
    object adsDetailInRecAlfandegadoEmbarque: TBooleanField
      FieldName = 'InRecAlfandegadoEmbarque'
    end
    object adsDetailNmRefEndRecAlfandEmbarque: TStringField
      FieldName = 'NmRefEndRecAlfandEmbarque'
      Size = 255
    end
    object adsDetailExportadorGrupoCdGrupo: TStringField
      FieldName = 'Exportador.Grupo.CdGrupo'
      Size = 3
    end
    object adsDetailProcessoLocalEmbarque: TAureliusEntityField
      FieldName = 'Processo.LocalEmbarque'
    end
    object adsDetailTipoFrete: TAureliusEntityField
      FieldName = 'TipoFrete'
    end
  end
  object dsIncoterm: TDataSource
    DataSet = adsIncoterm
    Left = 200
    Top = 202
  end
  object adsIncoterm: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Codigo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Sinal'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'InTipoFrete'
        DataType = ftString
        Size = 2
      end>
    Left = 228
    Top = 202
    DesignClass = 'MyEntitiesBroker.TTincotermsVenda'
    object adsIncotermSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsIncotermCodigo: TStringField
      FieldName = 'Codigo'
      Required = True
      Size = 3
    end
    object adsIncotermDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object adsIncotermSinal: TStringField
      FieldName = 'Sinal'
      Size = 1
    end
    object adsIncotermInTipoFrete: TStringField
      FieldName = 'InTipoFrete'
      Size = 2
    end
  end
  object dsPais: TDataSource
    DataSet = adsPais
    Left = 204
    Top = 246
  end
  object adsPais: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdPais'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'NmSiglaCrt'
        DataType = ftString
        Size = 2
      end>
    Left = 228
    Top = 246
    DesignClass = 'MyEntitiesBroker.TTpaisBroker'
    object adsPaisSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsPaisCdPais: TStringField
      FieldName = 'CdPais'
      Required = True
      Size = 3
    end
    object adsPaisNmPais: TStringField
      FieldName = 'NmPais'
      Size = 120
    end
    object adsPaisNmSiglaCrt: TStringField
      FieldName = 'NmSiglaCrt'
      Size = 2
    end
  end
  object dsEnquadramento: TDataSource
    DataSet = adsEnquadramento
    Left = 259
    Top = 337
  end
  object adsEnquadramento: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdEnquadOp'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NmEnquadOp'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end>
    Left = 287
    Top = 333
    DesignClass = 'MyEntitiesBroker.TTenquadOp'
    object adsEnquadramentoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsEnquadramentoCdEnquadOp: TStringField
      FieldName = 'CdEnquadOp'
      Required = True
      Size = 5
    end
    object adsEnquadramentoNmEnquadOp: TStringField
      FieldName = 'NmEnquadOp'
      Required = True
      Size = 60
    end
    object adsEnquadramentoInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Size = 1
    end
  end
  object dsMoeda: TDataSource
    DataSet = adsMoeda
    Left = 204
    Top = 290
  end
  object adsMoeda: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdMoeda'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NmMoeda'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ApMoeda'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CdMoedaScx'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NmMoedaSing'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmMoedaPlural'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmCentavosSing'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmCentavosPlural'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ApMoedaIngles'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NmMoedaSingIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmMoedaPluralIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmCentavosSingIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmCentavosPluralIng'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmMoedaSingEsp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmMoedaPluralEsp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmCentavosSingEsp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmCentavosPluralEsp'
        DataType = ftString
        Size = 20
      end>
    Left = 228
    Top = 290
    DesignClass = 'MyEntitiesBroker.TTmoedaBroker'
    object adsMoedaSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMoedaCdMoeda: TStringField
      FieldName = 'CdMoeda'
      Required = True
      Size = 3
    end
    object adsMoedaNmMoeda: TStringField
      FieldName = 'NmMoeda'
      Required = True
      Size = 30
    end
  end
  object dsURFDespacho: TDataSource
    DataSet = adsURFDespacho
    Left = 635
    Top = 170
  end
  object adsURFDespacho: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Codigo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CdDigito'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EndUf'
        DataType = ftString
        Size = 2
      end>
    Left = 659
    Top = 170
    DesignClass = 'MyEntitiesBroker.TTurf'
    object adsURFDespachoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsURFDespachoCodigo: TStringField
      FieldName = 'Codigo'
      Required = True
      Size = 7
    end
    object adsURFDespachoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object adsURFDespachoCdDigito: TStringField
      FieldName = 'CdDigito'
      Size = 1
    end
    object adsURFDespachoEndUf: TStringField
      FieldName = 'EndUf'
      Size = 2
    end
  end
  object dsRecindoDespacho: TDataSource
    DataSet = adsRecindoDespacho
    Left = 960
    Top = 329
  end
  object adsRecindoDespacho: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdArmazem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NmArmazem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NmSigla'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InAtracacao'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RecintoAlfandegado'
        DataType = ftVariant
      end
      item
        Name = 'RecintoAlfandegado.Codigo'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'RecintoAlfandegado.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'RecintoAlfandegado.CodOrgaoRec'
        DataType = ftString
        Size = 7
      end>
    SubpropsDepth = 2
    Left = 988
    Top = 329
    DesignClass = 'MyEntitiesBroker.TTarmazem'
    object adsRecindoDespachoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsRecindoDespachoCdArmazem: TStringField
      FieldName = 'CdArmazem'
      Required = True
      Size = 4
    end
    object adsRecindoDespachoNmArmazem: TStringField
      FieldName = 'NmArmazem'
      Required = True
      Size = 50
    end
    object adsRecindoDespachoNmSigla: TStringField
      FieldName = 'NmSigla'
      Size = 10
    end
    object adsRecindoDespachoInAtracacao: TStringField
      FieldName = 'InAtracacao'
      Size = 1
    end
    object adsRecindoDespachoInAtivo: TStringField
      FieldName = 'InAtivo'
      Size = 1
    end
    object adsRecindoDespachoRecintoAlfandegado: TAureliusEntityField
      FieldName = 'RecintoAlfandegado'
    end
    object adsRecindoDespachoRecintoAlfandegadoCodigo: TStringField
      FieldName = 'RecintoAlfandegado.Codigo'
      Size = 7
    end
    object adsRecindoDespachoRecintoAlfandegadoDescricao: TStringField
      FieldName = 'RecintoAlfandegado.Descricao'
      Size = 120
    end
    object adsRecindoDespachoRecintoAlfandegadoCodOrgaoRec: TStringField
      FieldName = 'RecintoAlfandegado.CodOrgaoRec'
      Size = 7
    end
  end
  object dsURFDesembraraco: TDataSource
    DataSet = adsURFDesembraraco
    Left = 953
    Top = 372
  end
  object adsURFDesembraraco: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Codigo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CdDigito'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EndUf'
        DataType = ftString
        Size = 2
      end>
    Left = 981
    Top = 372
    DesignClass = 'MyEntitiesBroker.TTurf'
    object AureliusEntityField1: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'Codigo'
      Required = True
      Size = 7
    end
    object StringField2: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object adsFrameCdDigito: TStringField
      FieldName = 'CdDigito'
      Size = 1
    end
    object adsFrameEndUf: TStringField
      FieldName = 'EndUf'
      Size = 2
    end
  end
  object dsRecindoEmbarque: TDataSource
    DataSet = adsRecindoEmbarque
    Left = 949
    Top = 425
  end
  object adsRecindoEmbarque: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdArmazem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NmArmazem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NmSigla'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InAtracacao'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RecintoAlfandegado'
        DataType = ftVariant
      end
      item
        Name = 'RecintoAlfandegado.Codigo'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'RecintoAlfandegado.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'RecintoAlfandegado.CodOrgaoRec'
        DataType = ftString
        Size = 7
      end>
    SubpropsDepth = 2
    Left = 981
    Top = 425
    DesignClass = 'MyEntitiesBroker.TTarmazem'
    object adsRecindoEmbarqueSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsRecindoEmbarqueCdArmazem: TStringField
      FieldName = 'CdArmazem'
      Required = True
      Size = 4
    end
    object adsRecindoEmbarqueNmArmazem: TStringField
      FieldName = 'NmArmazem'
      Required = True
      Size = 50
    end
    object adsRecindoEmbarqueNmSigla: TStringField
      FieldName = 'NmSigla'
      Size = 10
    end
    object adsRecindoEmbarqueInAtracacao: TStringField
      FieldName = 'InAtracacao'
      Size = 1
    end
    object adsRecindoEmbarqueInAtivo: TStringField
      FieldName = 'InAtivo'
      Size = 1
    end
    object adsRecindoEmbarqueRecintoAlfandegado: TAureliusEntityField
      FieldName = 'RecintoAlfandegado'
    end
    object adsRecindoEmbarqueRecintoAlfandegadoCodigo: TStringField
      FieldName = 'RecintoAlfandegado.Codigo'
      Size = 7
    end
    object adsRecindoEmbarqueRecintoAlfandegadoDescricao: TStringField
      FieldName = 'RecintoAlfandegado.Descricao'
      Size = 120
    end
    object adsRecindoEmbarqueRecintoAlfandegadoCodOrgaoRec: TStringField
      FieldName = 'RecintoAlfandegado.CodOrgaoRec'
      Size = 7
    end
  end
  object adsEmpresaNac: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdEmpresa'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'InCliente'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'InImportador'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'InExportador'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'InOutros'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'InRepresentante'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'InSeguradora'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    Left = 228
    Top = 156
    DesignClass = 'MyEntitiesBroker.TTempresaNac'
    object adsEmpresaNacSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsEmpresaNacCdEmpresa: TStringField
      FieldName = 'CdEmpresa'
      Required = True
      Size = 5
    end
    object adsEmpresaNacNmEmpresa: TStringField
      FieldName = 'NmEmpresa'
      Size = 80
    end
    object adsEmpresaNacApEmpresa: TStringField
      FieldName = 'ApEmpresa'
      Size = 10
    end
    object adsEmpresaNacEndEmpresa: TStringField
      FieldName = 'EndEmpresa'
      Size = 50
    end
    object adsEmpresaNacCdTipoPessoa: TStringField
      FieldName = 'CdTipoPessoa'
      Size = 1
    end
    object adsEmpresaNacCgcEmpresa: TStringField
      FieldName = 'CgcEmpresa'
      Size = 14
    end
    object adsEmpresaNacCpfEmpresa: TStringField
      FieldName = 'CpfEmpresa'
      Size = 11
    end
    object adsEmpresaNacIeEmpresa: TStringField
      FieldName = 'IeEmpresa'
    end
    object adsEmpresaNacInAtivo: TStringField
      FieldName = 'InAtivo'
      Size = 1
    end
    object adsEmpresaNacInCliente: TBooleanField
      FieldName = 'InCliente'
      Required = True
    end
    object adsEmpresaNacInImportador: TBooleanField
      FieldName = 'InImportador'
      Required = True
    end
    object adsEmpresaNacInExportador: TBooleanField
      FieldName = 'InExportador'
      Required = True
    end
    object adsEmpresaNacInOutros: TBooleanField
      FieldName = 'InOutros'
      Required = True
    end
    object adsEmpresaNacInRepresentante: TBooleanField
      FieldName = 'InRepresentante'
      Required = True
    end
    object adsEmpresaNacInSeguradora: TBooleanField
      FieldName = 'InSeguradora'
      Required = True
    end
  end
  object dsEmpresaNac: TDataSource
    DataSet = adsEmpresaNac
    Left = 200
    Top = 156
  end
  object dsDespachante: TDataSource
    DataSet = adsDespachante
    Left = 96
    Top = 388
  end
  object adsDespachante: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Empresa'
        DataType = ftVariant
      end
      item
        Name = 'Empresa.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Empresa.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Empresa.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Empresa.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Empresa.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Empresa.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Empresa.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Empresa.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Empresa.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Empresa.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'Empresa.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'Empresa.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'Empresa.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'Empresa.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Empresa.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'Empresa.InSeguradora'
        DataType = ftBoolean
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
        Name = 'Tipo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end>
    SubpropsDepth = 2
    SyncSubprops = True
    Left = 152
    Top = 388
    DesignClass = 'MyEntitiesBroker.TTdespachanteCliente'
    object adsDespachanteSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsDespachanteDespachante: TAureliusEntityField
      FieldName = 'Despachante'
      Visible = False
    end
    object adsDespachanteEmpresaCdEmpresa: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'Empresa.CdEmpresa'
      Size = 5
    end
    object adsDespachanteTipo: TStringField
      FieldName = 'Tipo'
      Required = True
      Size = 5
    end
    object adsDespachanteDespachanteCdDespachante: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Despachante.CdDespachante'
      Size = 3
    end
    object adsDespachanteDespachanteNmDespachante: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Despachante.NmDespachante'
      Size = 25
    end
    object adsDespachanteDespachanteApDespachante: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'Despachante.ApDespachante'
      Visible = False
      Size = 10
    end
  end
  object dsEmpresaEst: TDataSource
    DataSet = adsEmpresaEst
    Left = 296
    Top = 508
  end
  object adsEmpresaEst: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdGrupo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'EmpresaEst'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'EmpresaEst.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'EmpresaEst.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'EmpresaEst.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EmpresaEst.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'EmpresaEst.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'EmpresaEst.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'EmpresaEst.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EmpresaEst.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EmpresaEst.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EmpresaEst.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'EmpresaEst.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'EmpresaEst.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'EmpresaEst.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'EmpresaEst.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'EmpresaEst.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EmpresaEst.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'EmpresaEst.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'EmpresaEst.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EmpresaEst.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'EmpresaEst.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'EmpresaEst.Pais'
        DataType = ftVariant
      end
      item
        Name = 'EmpresaEst.Pais.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'EmpresaEst.Pais.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'EmpresaEst.Pais.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end>
    SubpropsDepth = 3
    Left = 324
    Top = 508
    DesignClass = 'MyEntitiesBroker.TTempresaEstGrupo'
    object adsEmpresaEstSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsEmpresaEstCdGrupo: TStringField
      FieldName = 'CdGrupo'
      Required = True
      Size = 3
    end
    object adsEmpresaEstEmpresaEst: TAureliusEntityField
      FieldName = 'EmpresaEst'
      Required = True
    end
    object adsEmpresaEstEmpresaEstCdEmpresa: TStringField
      FieldName = 'EmpresaEst.CdEmpresa'
      Size = 5
    end
    object adsEmpresaEstEmpresaEstNmEmpresa: TStringField
      FieldName = 'EmpresaEst.NmEmpresa'
      Size = 100
    end
    object adsEmpresaEstEmpresaEstApEmpresa: TStringField
      FieldName = 'EmpresaEst.ApEmpresa'
      Size = 10
    end
    object adsEmpresaEstEmpresaEstEndEmpresa: TStringField
      FieldName = 'EmpresaEst.EndEmpresa'
      Size = 100
    end
    object adsEmpresaEstEmpresaEstEndNumero: TStringField
      FieldName = 'EmpresaEst.EndNumero'
      Size = 6
    end
    object adsEmpresaEstEmpresaEstEndCompl: TStringField
      FieldName = 'EmpresaEst.EndCompl'
      Size = 41
    end
    object adsEmpresaEstEmpresaEstEndCidade: TStringField
      FieldName = 'EmpresaEst.EndCidade'
      Size = 30
    end
    object adsEmpresaEstEmpresaEstEndEstado: TStringField
      FieldName = 'EmpresaEst.EndEstado'
      Size = 30
    end
    object adsEmpresaEstEmpresaEstInAtivo: TStringField
      FieldName = 'EmpresaEst.InAtivo'
      Size = 1
    end
    object adsEmpresaEstEmpresaEstInAgente: TBooleanField
      FieldName = 'EmpresaEst.InAgente'
    end
    object adsEmpresaEstEmpresaEstInBanco: TBooleanField
      FieldName = 'EmpresaEst.InBanco'
    end
    object adsEmpresaEstEmpresaEstInImportador: TBooleanField
      FieldName = 'EmpresaEst.InImportador'
    end
    object adsEmpresaEstEmpresaEstInSeguradora: TBooleanField
      FieldName = 'EmpresaEst.InSeguradora'
    end
    object adsEmpresaEstEmpresaEstInExportador: TBooleanField
      FieldName = 'EmpresaEst.InExportador'
    end
    object adsEmpresaEstEmpresaEstNrCliente: TStringField
      FieldName = 'EmpresaEst.NrCliente'
      Size = 15
    end
    object adsEmpresaEstEmpresaEstInComprador: TBooleanField
      FieldName = 'EmpresaEst.InComprador'
    end
    object adsEmpresaEstEmpresaEstCgcEmpresa: TStringField
      FieldName = 'EmpresaEst.CgcEmpresa'
      Size = 14
    end
    object adsEmpresaEstEmpresaEstInPoTrans: TStringField
      FieldName = 'EmpresaEst.InPoTrans'
      Size = 1
    end
    object adsEmpresaEstEmpresaEstNrRuc: TStringField
      FieldName = 'EmpresaEst.NrRuc'
      Size = 25
    end
    object adsEmpresaEstEmpresaEstNrNit: TStringField
      FieldName = 'EmpresaEst.NrNit'
      Size = 25
    end
    object adsEmpresaEstEmpresaEstPais: TAureliusEntityField
      FieldName = 'EmpresaEst.Pais'
    end
    object adsEmpresaEstEmpresaEstPaisCdPais: TStringField
      FieldName = 'EmpresaEst.Pais.CdPais'
      Size = 3
    end
    object adsEmpresaEstEmpresaEstPaisNmPais: TStringField
      FieldName = 'EmpresaEst.Pais.NmPais'
      Size = 120
    end
    object adsEmpresaEstEmpresaEstPaisNmSiglaCrt: TStringField
      FieldName = 'EmpresaEst.Pais.NmSiglaCrt'
      Size = 2
    end
  end
  object qryValidaCampos: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    Left = 604
    Top = 526
  end
end
