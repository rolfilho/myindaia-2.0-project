object frmRelCertificadoVigilanciaSanitariaNestle: TfrmRelCertificadoVigilanciaSanitariaNestle
  Left = -1169
  Top = 106
  Width = 996
  Height = 872
  VertScrollBar.Position = 72
  Caption = 'Certificado Vigil'#226'ncia Sanit'#225'ria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 5
    Top = -67
    Width = 794
    Height = 1123
    DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object GrupoProcesso: TRLGroup
      Left = 38
      Top = 38
      Width = 718
      Height = 792
      DataFields = 'NR_PROCESSO'
      object DetailInglesEspanhol: TRLSubDetail
        Left = 0
        Top = 601
        Width = 718
        Height = 75
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
        BeforePrint = DetailInglesEspanholBeforePrint
        object titulosInglesEspanhol: TRLBand
          Left = 1
          Top = 0
          Width = 716
          Height = 36
          BandType = btHeader
          object RLPanel22: TRLPanel
            Left = 0
            Top = 0
            Width = 716
            Height = 36
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Color = clWhite
            ParentColor = False
            Transparent = False
            object RLPanel23: TRLPanel
              Left = 0
              Top = 1
              Width = 180
              Height = 34
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlDescricaoProdutos: TRLLabel
                Left = 8
                Top = 0
                Width = 162
                Height = 17
                Align = faCenterTop
                Alignment = taCenter
                Caption = 'Description of products:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RLPanel24: TRLPanel
              Left = 308
              Top = 1
              Width = 113
              Height = 34
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlCertificacaoPara: TRLMemo
                Left = 6
                Top = 0
                Width = 100
                Height = 34
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Products certified for:')
                ParentFont = False
              end
            end
            object RLPanel25: TRLPanel
              Left = 421
              Top = 1
              Width = 96
              Height = 34
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlTipoEmbalagem: TRLMemo
                Left = 1
                Top = 0
                Width = 93
                Height = 34
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Type of packaging:')
                ParentFont = False
              end
            end
            object RLPanel26: TRLPanel
              Left = 517
              Top = 1
              Width = 134
              Height = 34
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlLote: TRLLabel
                Left = 14
                Top = 0
                Width = 104
                Height = 17
                Align = faCenterTop
                Alignment = taCenter
                Caption = 'Batch Number:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RLPanel27: TRLPanel
              Left = 651
              Top = 1
              Width = 65
              Height = 34
              Align = faLeft
              object rlQuantidade: TRLLabel
                Left = 0
                Top = 0
                Width = 65
                Height = 17
                Align = faCenterTop
                Alignment = taCenter
                Caption = 'Quantity:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RLPanel57: TRLPanel
              Left = 180
              Top = 1
              Width = 128
              Height = 34
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlMarcacaoVolume: TRLMemo
                Left = 13
                Top = 8
                Width = 100
                Height = 17
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Marks:')
                ParentFont = False
              end
            end
          end
        end
        object itensInglesEspanhol: TRLBand
          Left = 1
          Top = 36
          Width = 716
          Height = 38
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLPanel28: TRLPanel
            Left = 0
            Top = 0
            Width = 180
            Height = 37
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbMercadoria: TRLDBMemo
              Left = 5
              Top = 0
              Width = 165
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'MERCADORIA_ING'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
              BeforePrint = rldbMercadoriaBeforePrint
            end
            object rldbMarcas: TRLDBMemo
              Left = 5
              Top = 18
              Width = 165
              Height = 17
              Alignment = taJustify
              Anchors = [fkBottom]
              Behavior = [beSiteExpander]
              DataField = 'MARCA_ING'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
              BeforePrint = rldbMercadoriaBeforePrint
            end
          end
          object RLPanel50: TRLPanel
            Left = 308
            Top = 0
            Width = 113
            Height = 37
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbCertificacao: TRLDBMemo
              Left = 5
              Top = 0
              Width = 105
              Height = 17
              Behavior = [beSiteExpander]
              DataField = 'CERTIFICADO_PARA_ING'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
            end
          end
          object RLPanel51: TRLPanel
            Left = 421
            Top = 0
            Width = 96
            Height = 37
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbEmbalagem: TRLDBMemo
              Left = 0
              Top = 0
              Width = 95
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'UNIDADE_MEDIDA_ING'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
            end
          end
          object RLPanel31: TRLPanel
            Left = 517
            Top = 0
            Width = 134
            Height = 37
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbLote: TRLDBMemo
              Left = 0
              Top = 0
              Width = 140
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'CD_LOTE'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
            end
          end
          object RLPanel32: TRLPanel
            Left = 651
            Top = 0
            Width = 70
            Height = 37
            Align = faLeft
            AutoExpand = True
            object rldbQtMercadoria: TRLDBMemo
              Left = 4
              Top = 0
              Width = 60
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'QT_MERCADORIA'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
            end
          end
          object RLPanel58: TRLPanel
            Left = 180
            Top = 0
            Width = 128
            Height = 37
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbMarcacaoVolume: TRLDBMemo
              Left = 5
              Top = 0
              Width = 120
              Height = 17
              Behavior = [beSiteExpander]
              DataField = 'TX_MARCACAO_VOLUME'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
            end
          end
        end
      end
      object rldetail: TRLBand
        Left = 0
        Top = 127
        Width = 718
        Height = 384
        AutoSize = True
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 39
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = clSilver
          ParentColor = False
          Transparent = False
          object rlCertificadoDeVenda: TRLLabel
            Left = 10
            Top = 11
            Width = 698
            Height = 17
            Align = faCenter
            Caption = 'FREE SALES CERTIFICATE FOR FOOD EXPORTS (CVLEA) - N'#186':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLPanel2: TRLPanel
          Left = 0
          Top = 39
          Width = 718
          Height = 56
          Align = faTop
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object RLPanel3: TRLPanel
            Left = 1
            Top = 0
            Width = 346
            Height = 55
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object rlConsignatario: TRLLabel
              Left = 2
              Top = 2
              Width = 140
              Height = 17
              Caption = 'Consignor/Exporter:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbExportador: TRLDBText
              Left = 3
              Top = 20
              Width = 139
              Height = 17
              DataField = 'EXPORT_EMPRESA'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
            object rldbExportadorEndereco: TRLDBMemo
              Left = 3
              Top = 37
              Width = 318
              Height = 17
              Behavior = [beSiteExpander]
              DataField = 'EXPORTADOR_ENDERECO'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
          object RLPanel4: TRLPanel
            Left = 340
            Top = 0
            Width = 377
            Height = 55
            Align = faRight
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object rlImportador: TRLLabel
              Left = 2
              Top = 2
              Width = 273
              Height = 17
              Caption = 'Consignee/Importer (name and address):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbImportador: TRLDBText
              Left = 3
              Top = 20
              Width = 138
              Height = 17
              DataField = 'IMPORT_EMPRESA'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
            object rldbImportadorEnderenco: TRLDBMemo
              Left = 4
              Top = 37
              Width = 358
              Height = 17
              Behavior = [beSiteExpander]
              DataField = 'IMPORT_CIDADE_ESTADO_PAIS'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
        end
        object RLPanel5: TRLPanel
          Left = 0
          Top = 95
          Width = 718
          Height = 37
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLPanel6: TRLPanel
            Left = 1
            Top = 0
            Width = 342
            Height = 37
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlPaisOrigem: TRLLabel
              Left = 2
              Top = 2
              Width = 120
              Height = 17
              Caption = 'Country of origin:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbPaisOrigem: TRLDBText
              Left = 3
              Top = 19
              Width = 103
              Height = 17
              DataField = 'PAIS_ORIGEM'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
          object RLPanel7: TRLPanel
            Left = 340
            Top = 0
            Width = 377
            Height = 37
            Align = faRight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlPaisDestino: TRLLabel
              Left = 2
              Top = 2
              Width = 154
              Height = 17
              Caption = 'Country of destination:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbDestinoFinal: TRLDBText
              Left = 3
              Top = 19
              Width = 154
              Height = 17
              DataField = 'DESTINO_FINAL_ING'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
        end
        object RLPanel8: TRLPanel
          Left = 0
          Top = 169
          Width = 718
          Height = 20
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object rlViaTransporte: TRLLabel
            Left = 2
            Top = 2
            Width = 134
            Height = 17
            Caption = 'Means of transport:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object rldbViaTransporte: TRLDBText
            Left = 164
            Top = 2
            Width = 202
            Height = 17
            DataField = 'NM_VIA_TRANSPORTE_ING'
            DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
          end
        end
        object RLPanel11: TRLPanel
          Left = 0
          Top = 132
          Width = 718
          Height = 37
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLPanel12: TRLPanel
            Left = 1
            Top = 0
            Width = 342
            Height = 37
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlLocaldeEmbarque: TRLLabel
              Left = 2
              Top = 2
              Width = 281
              Height = 17
              Caption = 'Place of loading from the country of origin:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbPortoEmbarque: TRLDBText
              Left = 2
              Top = 19
              Width = 173
              Height = 17
              DataField = 'DS_PORTO_EMBARQUE'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
          object RLPanel13: TRLPanel
            Left = 340
            Top = 0
            Width = 377
            Height = 37
            Align = faRight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlLocalDesembarque: TRLLabel
              Left = 2
              Top = 2
              Width = 242
              Height = 17
              Caption = 'Point of entry of destination country:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbPortoDesembarque: TRLDBText
              Left = 2
              Top = 19
              Width = 153
              Height = 17
              DataField = 'DS_PORTO_DESTINO'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
        end
        object RLPanel9: TRLPanel
          Left = 0
          Top = 189
          Width = 718
          Height = 38
          Align = faTop
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object rlArmazenagem: TRLLabel
            Left = 2
            Top = 2
            Width = 223
            Height = 17
            Caption = 'Conditions for transport/storage: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object rldbCondicaoTransporte: TRLDBMemo
            Left = 4
            Top = 19
            Width = 707
            Height = 17
            Behavior = [beSiteExpander]
            DataField = 'CONDICAO_TRANSPORTE_ING'
            DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
          end
        end
        object RLPanel10: TRLPanel
          Left = 0
          Top = 227
          Width = 718
          Height = 38
          Align = faTop
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object rlIdentificacao: TRLLabel
            Left = 2
            Top = 2
            Width = 223
            Height = 17
            Caption = 'Identification of the commodities:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object rldbIdentificacao: TRLDBMemo
            Left = 6
            Top = 19
            Width = 707
            Height = 17
            Behavior = [beSiteExpander]
            DataField = 'IDENTIFICACAO'
            DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
          end
        end
        object RLPanel14: TRLPanel
          Left = 0
          Top = 265
          Width = 718
          Height = 21
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = clSilver
          ParentColor = False
          Transparent = False
          object rlInfoFabricante: TRLLabel
            Left = 2
            Top = 3
            Width = 192
            Height = 17
            Caption = 'Manufacturer'#39's identification'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel15: TRLPanel
          Left = 0
          Top = 286
          Width = 718
          Height = 40
          Align = faTop
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLPanel16: TRLPanel
            Left = 1
            Top = 0
            Width = 347
            Height = 40
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlFabricanteNome: TRLLabel
              Left = 2
              Top = 2
              Width = 115
              Height = 17
              Caption = 'Corporate name:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbFabricante: TRLDBMemo
              Left = 1
              Top = 21
              Width = 344
              Height = 17
              Behavior = [beSiteExpander]
              DataField = 'FABRICANTE_NOME'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
          object RLPanel17: TRLPanel
            Left = 348
            Top = 0
            Width = 369
            Height = 40
            Align = faRight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlFabricanteLicenca: TRLLabel
              Left = 2
              Top = 2
              Width = 131
              Height = 17
              Caption = 'Operating License:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbLicencaSanitaria: TRLDBText
              Left = 4
              Top = 21
              Width = 185
              Height = 17
              DataField = 'DS_LICENCA_SANITARIA'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
        end
        object RLPanel18: TRLPanel
          Left = 0
          Top = 326
          Width = 718
          Height = 38
          Align = faTop
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLPanel19: TRLPanel
            Left = 1
            Top = 0
            Width = 347
            Height = 38
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlFabricanteEndereco: TRLLabel
              Left = 2
              Top = 2
              Width = 64
              Height = 17
              Caption = 'Address:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbFabricanteEndereco: TRLDBMemo
              Left = 1
              Top = 19
              Width = 345
              Height = 17
              Behavior = [beSiteExpander]
              DataField = 'FABR_CIDADE_ESTADO_PAIS'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
          object RLPanel20: TRLPanel
            Left = 348
            Top = 0
            Width = 369
            Height = 38
            Align = faRight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlFabricanteCNPJ: TRLLabel
              Left = 2
              Top = 2
              Width = 157
              Height = 17
              Caption = 'Tax id number (CNPJ):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbFabricanteCNPJ: TRLDBText
              Left = 3
              Top = 19
              Width = 87
              Height = 17
              DataField = 'FABR_CNPJ'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaS
            end
          end
        end
        object RLPanel21: TRLPanel
          Left = 0
          Top = 364
          Width = 718
          Height = 20
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          Color = clSilver
          ParentColor = False
          Transparent = False
          object rlIdProdutos: TRLLabel
            Left = 2
            Top = 2
            Width = 197
            Height = 17
            Caption = 'Identification of the products:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object rlHeader: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 127
        BandType = btHeader
        object RLImage1: TRLImage
          Left = 11
          Top = 1
          Width = 138
          Height = 125
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D494844520000007E
            0000007E08020000006D4132DF000000017352474200AECE1CE9000000046741
            4D410000B18F0BFC6105000000097048597300000EBC00000EBC0195BC724900
            00733C49444154785EEDFD05581BDBF63E8E4F081A2024B814284E5DA0B83B14
            A7D4DDDDD002A558A12D14770D210A71DCDD5D8AD7BDC5AD4221FF09EDB573CF
            B9F7F47ECF95E7F7FFBCCF3C21442633EFACFDAEB5F65E7B0FC0FC3FFC97F07F
            D4FFD7F07FD4FFD7F07FD4FFD7F03F4DFD2A73657965A5B122A5A33EE7EBCA2A
            F8C2F2CA976FE0CB7F876F2BCBCB2B9FBF3F1FEC29A82C08F9F4656995B9FA6D
            15FCDECAAF7DE3BF8FFF75ABFFF071AA9B24375CB0AEBDB1E8D5CB17BFCDE10A
            7861DE7DF8D8D5D1D857A8F3980E1B1D7BB4F6F2CAEAEA37D645FCDFC3FF34F5
            AF5E8C15D2D03D051A13D57006DEBF22D7F4E5E39E1FEFFD1DDEBF7B5A477221
            E7F8BFA8DE3456225B42458F3E6A5965828D64196C3D3F3EF4BF84FF02F56B34
            B08C718D11500E409BFC2BAB04FF014D75EDF5D6D2CB5504AB66FA89895AB62A
            5AD8005DA2B138A4BE1A3F33330D7E7069E9EBE4C40CEBC9E2E7D6066209FDDE
            78B16029E5EE9B4AE1CE029372D2F126F2EEA5CF5FC05DFDCDFEFF0450885657
            97BF319799AC8D7514BFFAB17F1FFE3B56FFE9EBF7BFE03983E7FB6D153CEB3F
            9F36784156BF814CB4B5B4B4145FEAA26FACA1BB4DD500F50C9F4E9A4A53815B
            658E5A5BC5EDC989A5E67A5445E19DA9A92F5D7569CDB9EBCB49DE830CB932CA
            DD892ACE66FAE936864D67BE4D7D5DE5E7E52F7FD9F95F81D52098ACE3007F0C
            BC08E0DFFFEF53FFE6E5587DE1B5D1478D73F3B38B9F41927F01D6F9BF18EF2C
            436B5430420668EB4BC87740361B19A7DBA87AAD4567BA0B8CDB8B0F64A5DF69
            29961C6D4464A7FA34E45F1A2B51A9CABFD599BBA12ADF77B20A5ACDF0ECA66C
            6C29BC59986D34DC45FFBEDF5FE0EB37E6FCC2DCF3E7FDF5859E4F86AA7FBCFA
            1FC47F8E7AD0A6D6AC9B39D45BF6A214E8A4E95288110DD423CF467ADFBE79B1
            04C6237FC2CCDCA7A64ACCF36244293970B058A538D7E36599707B817D03C5B9
            99BEBFBDC0A9A3700F29E7586F29D04E612B269AD4D3CEF5317636E45F6DA1E8
            D6E55FFC50CE5D440A1AA0AF2FA1DF795C2CD6501CF87E6AE1C7AEC186B6CCFC
            F0EEE3CB97CF5B4A6ED009771AA8C7DF9400BDF5F16B3F0FB683FF1CFE73D4AF
            AC7E05F5FDF3D7AF2DCD1DFDF99AD3B53C457941EDD475B58C8BF9F86B6D85C7
            9F8C8D3D1D1F9F59F85C9FEF5B4489EACF57AA675C6CA76B9792CE8C956EEFCB
            57ABA19C6EA25AB7E41FAA406F6BACDEDE7441BCC14ABABD4EAA08B5BDB3C0B0
            8971A4916AD356E0FABC54A238CF63A8606B31C577B4705D3923BA2AEFDCECDC
            C4EB57AF5EBC78D95EE95B423C5C460D1EA0F031F2025F5748BF2C15ABAC2C9E
            5B985FA3FE3FA739FF41AB67394EE6BB17FD0CF49E626AE8540D4757817515E9
            FA60BE52293568BC80B7881A56863729A3DF69236B35159EEECC77E864983552
            F7D693AC3AF2ED870BC4AB48573A18465594B3D504DE1612725059F1A5B85C73
            12B291CA5D93E7D04AB7ABA51F1E606C1F2C522F279D68A31A37304E75D035AA
            8B7CCB33646B4A226BF0DAF9D4A461866815F5460FDDA0916255473BB7500754
            52DCE8E8A3E3FD25FF39D6D7F01FB4FA35837AFEA4AF972A5849BED6C9D8FDB1
            86A328EF7E0F4DB19671AB237F577BE1DEE682039DE49D8D05D70669DB4A73AE
            F552379492AFB793D56AC987DE5420F3B157FA0B75F02957DBCBB99B4F8A4F21
            556605955A4CD7F7D672E3528EE66759A6C61D4C8C308DBE7BB6896C564B3BD2
            C530EC283A9B1A7DF896FF859C38DD76AA561DEDCA60817C09EDC1A37CF1C2BC
            E097655223259B4A48F7FB69F0A19EC2FF0F53BFF2F9CB524519BD9E72F11143
            86410C9BACE569A39B5693CE76D0B5ABA8BE8305EBCB190F9E9548A1A3CF9CF5
            DDA47BD3B0122D564EF3192DDA518C3BFDA61A5984BDD28857A3E0ACBAF2041E
            CBC8B54A2B50E5E5DF09CAB7460A9415ECBCEF6D909B99F288518A4E4717A429
            95E5B9F7D0941F061CC1C43C789C4D2C4C0FF5B879A23243BC917EBC99E1DA44
            B1AE209D9BAB058AF37C3BA93BC058289F415A586085AAFF31FCE7A8073131F9
            AA0AB5B98811DD47DF5A493ED44C7198A8E6A4E2FDFA28CA65E4D047F92A0DD4
            9BBEBE7A4AC7D5393C2C60FE4698708102D4B9CC703562FAE517A5C295B9E7F2
            D337F4D573B438CA4C0B281EDFAB79DF4FE2AD986AF74ED9DE1AAEC47B52C315
            154CDFD0763225E4864E559E772F433138E86A7D2E9E19F260BEA1EB5EE0D90E
            22A2867EBF8FBE9E41F07D5E223558A25E91E73E5820514A8BABC9517D3EDEFE
            E340FF23F88F52FFF4CDC7769A616FFEB632F2DD21BA743E21F85525A28D6A55
            95EBD248B7A8205CB9E4A600DC77E6F13210BAA82774CDD060CF0ED5EBBAAA67
            76A5441C7D5129538CD9C7206CEECEE47925AA50B4514528DA865623D2E92CF3
            4640B1C95F380FBB2E2931B62DBFF084D7858D67B47171D603F9D64584D3F10F
            0EA7E4A0E3125393EEAAB6D1CDA2421DAB72741B6847E71B3948599EE529DBAB
            68D75B192E6044343E3CF0E340FF23F8CF51FF6565B58211564A4F1ACB17ACA6
            DF6826399464BAD4E6EDFD50C54DCFF17AC4587FF5F67EDE6B865CB136E2FBD5
            458E6BF2445823F769725CD133F3DC5481767854A459815EDF5229DE66BD6E4A
            50D1E5980E14ED58DB25D44F453E15537EB455BEBD008E8A924A0D5575DEE72C
            777AB7E459C53BA147FB683B7322F7AA1ED2363D67D18D97CECDBA161119F130
            DA2F374AA51265703ED8D7EA9C5E192974AC48A0B6F04148A81B869EF7E3707F
            0B6B0EE10FF10A7F20F5ABB3731F5F3F1D9C999D7FF77AECF58B4733734B2F9E
            F7BF7A3D3C3D3FF7FA79FFE3F167F5B95A8DF94E0D45B7DAF1E24E570F5C7093
            A5617C9E9588B7D36D93EF3A4BFAA871865A881DDE85F031E3BF6DC6176C8AB8
            6306BDBFDBC3DBBA8362969F65D351C8D51A8B7C27A2C0D8A4CA9D6CCB8176AE
            6F119A9FE76CD823FD9E5FB9FD86785D21ECAEBF534F754D676AB6D3B513E2A7
            F48F7AEDA0249F09B82BBFF9AA3A2142E2FEFDB08587A913B129A88CAC20BFDB
            AADE766C610EF141B23D25479A181EC7BC04919E56E5A58CE9B9A5E74F074646
            DAA726671F8FB73C79DC333935373ED231F9F1EDFF26F5CCFED6DC9E3C4453C1
            69724E741346BCA9F03605E5D38617A9294E2D401D69CC532F23DF1B2F12A1A7
            BBEFBEA907B8EBDADE926FC0EA5491CE4C5572DB5FB4E4BD68207C510779D318
            1168227E419F3FCC1CC0EE31F0DA5A9A7DB98EA89715E7D257C5DB6128338B54
            B03AAB0390F7726739D4352398ABECBD45887151C5470A4A1D34DE7BA1F64F4A
            1B98686C7B75ADA28906B0576DBBFBCEBD67B7885D35BA7ED32131F2E247742E
            33974CCA2B403DB4D972670B90E5B8FE96FEC3D0AB2F0B657D424C80704BC72B
            B67585D19D047112EA6A75C19D168C582E3AB8817162288FBBB526F9FB99FECF
            51FFFC71F768A90C18365451CE5553AF0F17C02A1941ADF90E430CD1CA82F47E
            867223C3A920EBA2ED51591E2F73FE53DAE6179CFAF23614A41DC7862A48F968
            889DD416723384FB99089DD742BA1920EE9A72BB1BDA9C510C0976C244AB3516
            49B7DE159E402A90B76C8466D941882EDC192ED5AD02CC25CE85398EDA03EB26
            601B5A4E8A955161777C2FE711F111F7EE1A3B99AD3F620CF331658BD80D4D74
            70F1D4C7872A07DDBDE91E11E2E779B43A4350CBCF9C33D8842372B7DCB16D9E
            DEDA17AEEDE70CB594BE659B9F203550625F45BF3794CF5B4DBD5645BB345707
            8C96283C1E69054F13E4FD7F8EFAF191411A31014CFD67EB800AF2D572D2C5A1
            7CC1124A54075DB78FAE51424F1EA0AD73F5B0827A990ADD34E0F5D0B73E63E3
            79DB49CB6BBBF061037E77434490B1E0591D816B7A9C190E5C8976C8F3DAA287
            35A15EC6C2A70D023D54FBAA397BB6AE9F109437BEA207C9DD03C1397383AEA2
            15C15C82323F4306ABF8C66494462515DBF0B0F438EDACFB1AE1412EE9416123
            24DAD18B67B9F6AB41A3ADB9E22DACAE5967068AAB1CDC14132A59473CE0EA71
            48E0ACB6E0152D9E1053CEE0DD0AC776F2DF37E1B963A47B541D977673AC50AC
            8C7C063C91855A60B4680B9D18DFDFDB0C9EE61FC23B883F92FABE4674136117
            8D143F5AB469B61628CB75ABCA3D3E40976190237BE92ADD05CE11A117B9C3F5
            B8C32DF9A3AC0542AD24CEA8F3B81B723DB0425C33103AAE8DBC6D28744D1771
            DD00E9A52F76420379D180E79A8EEA298B601F959AC2754D9EC233020A59EA9B
            38321CA07867907A9E4CE71FD4CFB32DCE71349C959AE6536AD9B3AEB57A5D51
            A6A4F7CDE3DDF1C92BE9B9A7BD2EEE3CA82A7BC1081AB71B48B637B8ADB1C569
            F3794F9D2ABC47E85D099EB0DDC22734056F1AC012AD787D4DB8504E8297F5C0
            D0D6D27B6B3EEA5039D97DBA06182A526790625BF2B6B6D744FD38D53F027F24
            F5AF5E0C7531D4FBE92AF4DCC8A1C29DB3B5D042E2CD9ABC3D3DD44DF9790FBB
            49EB4DAFE902190E4257F4852EEB0BF8E883AE52ECB0AEE009CD75669BD7196E
            12BA68000B30439ED5E5BE630644ED163EBBCBEEAA7666940D29D3B0A7887D60
            B3DC4B3105DDEB0600C9851DA41EEF0CCBF841FDCA1C94F989FD518DC023A5F5
            CF2415BAD3E1B958554CC2A1F8A0FD19B1FE11B72C4AD20C703136B73C0C74AF
            AA73049B73DF35977773ACC950898CB0E18AB7E34875103AAACEF7D08AD7CF18
            4270153CA2068BB186865AF8F93BCC35B00F14EE6210E2FBF3E5BBE8EACF1EAF
            8D7CFD41F823A91FEC6DA59153DB19967D34054A6E785FBED66C35904F00D9B7
            EF6468253FF490BCA42D70DB58F4A026C2D380FFAE156FA495D0791D78B0A994
            E536A1236A700F437E1F632977038D1B4687BD76C5859A17A7DB3352763595CB
            B69D175B842B276B6E85E43841082EA0C983D473FDC9EA57E6D8BFCD717E5EE4
            A8BD2A31C9BBA1D352AAB5129197BC25C2DF34F4B65A52B0B54F80E5911B3BF5
            4F19ECDABF49D8792710670BA0AC4F781878F85FE30B34E34AB011BC6D027B68
            CB774B9F03B747C8DD903DCB05EA697AC14F6C80A155807FD04F976E67D81692
            525A9B0AD64EF48F51FB3F92FAFE564C0745AC827ABF817EB88FBA8E820BEA64
            E84DD4701513AE35932C624236C0C22CC54E6823AEEB73A4DB0B5ED415BEA40B
            0B33173E6380F03414083415B86B2676493FE8BA5961B259538E5E31EE64115A
            1F9FAADD47E11D91537C27ACB0F9961190B70F82730270CEE0F657D443BF4DB3
            AF7E810E75C1FB14D73F1756EE8816A411943DDC3DABA8D4FB61215BF66F3639
            631318BACE3BD0C1276497BD879D4CB03697CFEE0D47777026D9223C8C10B74D
            B8136C90977539B21CF9024CB952EC79DD0D76DFDC5D88F1EDA3AF6B641C29A5
            3FE8A688B5D5C5AC9DE8FF1EF56F5E3D6BCDDFF7B4005E41F5ADA49CEFA64931
            08B7BAC8BA63547829E9AA7BA02DE7036369A31D7C7EC6DCD1362207D5F9FC4D
            F9432D856EEA831BF29A2167A0D9057F850A94756196053DCBB91C6D818B336F
            AF15A83FB46E514021467723807561C3EF01FE8EFAD559B66FB36CE005F8F289
            BDCE5D72022EDFA52DD75C024B4BF161A2A82384DCE05B2605C98E4F8A540B13
            6CCB522CEB33CD09D17B0E78A98B1CD5E44239F0243A081FD6E04EB4163CAB0F
            F733E27D60C37FC7842BD0C4D8CBA62F4FB6BEE0623DE3CE5811AC95BEEFC593
            B1B513FD631CEDFF3BF57F3181C1DECAC2BCF01A86FBF322A106CAD90ACA8DFA
            1C85DD57F71CBE225714217DFAAA3D9FB791D8DE9DB01073A48F311BD6098AD9
            2B764A5BF284B6F0795DDEDBC61B0F69A405D80E1729E425DB53D25D0A33B408
            399A1DD9024FA5E4C6A51437F89B02792EEC584700E7B2B63983C1655D3392B9
            C80E0ACECA2C0748FDEA67C8933ECEDE2D0AEF914AADC188B2A2ED79A959D9D1
            FEEE979DEB31EB6F786CDFE265B8EDA689CB991D373CADA3FCB75B3968F20699
            015457C44D43789819D2CB04E1652470D75CECA8367B948D64A03636EE142AE9
            3A2916D990EF5942BDDB5C875F3BD11F23896B67FEAF5F863F84FA1F18E8AEEA
            C913EC2A3C1D14B02F271A568775B0BA600178EB68DAEF6815933EAC21C17D51
            4FC0D7486CBF86A08F29C2CB50F8B8A6C84D7D9E442BB8AF91A4DD4EC92BDA1B
            AE3A64854A55E6185252AC32626C5BAB81767BE945845288294BE5D9F08E509C
            3314E7C286750640AD47D9D5B620994B20E9ECAB2CEA21AB736C5F3FB1D50788
            BE452A3DDA21DFC6006E5CD18C0BDE4E4B37ABCF51D97B529B2BD81C1261CD79
            519F7FEF4EBE4053C10853D14B7A3C09765C6976825E464217B539D1CEC2B78C
            44CEEA704558022897C3EE46273DE5242F5915661D7D44116CABC72DFF15D5AB
            CC6F2B2BFFFAE8CA1F2038F34B9F5FBE9D692A0D6B2CF66A2C0CCB79288F70B7
            DA7645FDE80579FE335A307FD31D073493C5651FAE533EA0AEC2E369CC1F6C26
            E4652878C310E969280C86ED378CA50E690ADCD0670B34973BBF2BCCCFB093BC
            21277A37235BB13345E085A4C223190585007320CF990DEF02C1EE05F0FB018C
            2B80DD07A4EDAB6E0405879B39CBC55CE4602EB2311720CC4F6C4F86B97AB62B
            BF472AB4DD12AD6448A21E9A36E76EA7A45AD3D34DFDDC8C84EE1872C5832A67
            2C72428B8DE42A0A1EC9290D84AFB1E8395D098B2D60E4CA8171143CAF09B600
            76A2A3C84D1D99D36A40927DA09F521D23B08E71A22EDFEDF1B3E753D3F39F97
            7F0CEDFFCBF897A95F9D9D9D7FF37EB6B622AB9D66DC581002CAFA40A15479AA
            99B29B13579819DCCB98DBDD84FF9A21EF35DD6B3B552225E4B3D6C96749CAA9
            996F153CA685BCAA0FBB6FC9EB6382002DF1B619C72D13E42D230B0FFDE4606B
            4A9A6949A631366E734F25BCC344E61342DECD662740D80B64EF05D25DF85377
            CB659AAAA335CD303B9DB2B79694C29E0E703D7BC4FB6218F67A8C6BEA35E7A7
            2908F31B6763A4C807A4E2808A42573E7F6E926A45D64E62822925D9A53CCBE0
            F8193DD85543FE7BE622677585DC0DF863AC911775446F1A099ED592D6DB2C70
            458F3BC19E37D246F4A80607CA4EC0CD90DBC7084039AA7BBA34E6688F14CA17
            E57AD7E4BBB5E66D2D63C43C7EFAEAEDEBD12F5F7E54BDFD2C7E86FA55E6F2EA
            E7C9E9C957AF3E3436D535128D3B8A6C18F8903ABACB2803D65DE25A4E8F3E7F
            4D83D3470771DD08E969C4EF6F2474420771424B67EFE6FBEBE508E272411232
            45224A1A765B04AEEAC16EEAF3BB190A5DD493BA6366EEA575DBDB8414BFBB08
            658A4BDA9D11615249156B89407E4028B608A98ADF32DB84323E4B5646570B36
            36421F3503FD6DDCFDCDBCED2D88BA2691C626446F336CB41578D101BCEA838C
            F7404607B83B5AF9EBB7C8CF712B379D156FADE04F0D37C227DA32D24DC828D7
            DC286DB3336A90302BF0DA8B1ED716BAA42776581B79598F2F7EB7D8D15DC2C7
            34C50F6870C5D808DC32E47B6081F43446FA19F3865B23EFE80606E854D2A23B
            8B4C46E9FC4DF9C70A48413D74C37AFC96CAF282D1A1C197CF47BF7D5BFE41D4
            EFC3CF59FDE4D44435C668A850A5947CAD98E8DB43DF3C5C24599B7FA38E1E3A
            50B09592A42476DB82D7CB44F4B0165792ADA09789E0355D58B28360A8C5DD3D
            4A940D326E665B4E9B6CBE7E766341AA48809FC3BD20B58820077CA41635C996
            91664D4D372525DB12138DD322D5DA8B10AD1B15C7D72BE55D11A3D5718D7671
            B434CB2417DB9CA37A19E392543145329816514C1F32A74F2AA75D29A7421B8D
            3E40B81BC438985FBDF15127D7935EB6D287F0812D0A03A24AAD3982B8A40D39
            7196E4346B5292312E4E9FF0D0709F870122CA9A3B71B7E00D7DD1FDBBC45CD4
            842FEA70A5380AB81B085DD01672D7173AAF2BE46624E06F2E04CA51A0394F98
            C9BA3BF6C5E90ADD0C8312EA835ADAD1E102F176AA6E0139B88674FC45B1783D
            66F3DBF7EF7FD0F4FBF07356BFF4E94B7BD98D896ADEF91A60B844B320CFBF9A
            7CB9244D312A44A79CEC77CCCB1292B99B37D85CF8B21E778E3318BF233CC148
            DC79A39751C49D83769777285E33E1BBA9AB77D9BC26C7F2498972798E4311DA
            84966E4BCD70A0A79AE2E3AD89C9D6A858D302A2747E8850D755E4701D5B4BBF
            D8BDD2FDDA982C9E8C5120EB2380F9023098006D05C86702694FE0F11DAC7FE9
            5F003A13C083AF4C40B39EA9A2C8D769974ABB1547DA218F02F86957242A29E2
            39D17AF8647B5C94F6C3A0AD4E178CEF7AE85F3CA1B1C961A7F05E757888095F
            ACAD98EB0E89235AC89BFAA22E3B78A3ED440FEF82DF04BD112B0E163D6FC8EB
            6BCC196672E1BA6335CDAB87BAB593BEB588E05342F17852A6B0580BBCAE15EF
            2CF5FEFCF5E76A497E82FA155675DCB7F1C7E3547C5463C1E9B795F0D95A6030
            DFD0FA9AA3A8EFAEA410E1CDD7F478226C78D276F3F9980B0498881CD711B8AA
            CF1762A1747487C2357D8E07BBB9034CD8636DEDAEA825F819C685683EB8BDF1
            FE1D07728A3939D99290EC909B6C818DDB1DEEA7594FE77EDC02D4758A9FCAF7
            12CAE904B08B0005E4FA9B4C4AA35E62052FEA3157C6885C4AC72D525D7C41ED
            C6B446EE8C11DECC51F5E4EA1D7125007D19A0AE0284CFBCD943F6A4704ADBA6
            27ED40570547C49D1D990FF4F2128C42FDEC39FC0C391FDA4B05190A8658F284
            59097819099FD1153AA72778464BF0ACB68CE626E1A35A3CE1960237F511B78C
            D9A87B11BE8682570D386F9B595E566F266D2F21DC2CC27B8D956E9EAD015E54
            48D4D12F533111FD837D3F68FADDF859EA99CF9F0D95A0351A69874A731FB6E5
            1FA6244AF0DFB300D04EB2BBB7F0831969A08988BF397802B0786BE1E35A8820
            13F83D4BB8BB215780292CC65AF8929EC05D4BF1B39AC241A6EC77ED38AF1B87
            FBECCC89B24A0AB7C5C51A64849B85F8EC28C0F18FF4F1F8300E23511D006A1A
            C8780310A721F8B752892D29E54D6F5FBD882416C3923A6C934B1627DF3097E7
            AFA14B60A95DD7B229EF5F3E67B4F5AA2656B1635E02B95300EA1D80FAC0891E
            3F45F4ECEA156E28E608F154490E037F454DE59A2910B19BEDB229A797158005
            83A5BDC2577505DDF4053D4D854F6B8BDB6E5B67B955E8BAA1D00D034498051B
            D9953BDE46E8BA1EEF1DD32DEE66055957070A34A76B21CFCB64AAC9270B4941
            CD74872AB4CAE3F1AEEF2CFD7EFC94E0ACAE3097BF7EFED25F1F3BC050EB65C8
            36E51DB4BDE1CC156C02BF6DC61D680EF7358525DB8B1E52E7BD6FC59D6A27E4
            61C841748183E1B38F2967A839106D078975667333E33D67880C30960FD5B179
            A04EC30B955364CAF345AB72254AF3E0032D4059BBFCAEAC1C00F31960AC0A64
            F6F9620BCEE06B55E3CB15626BEB3A7B99CCA538462524F7A358463FB1A2915A
            5BAF96D90E90E62EE0AA999FA68746877624964BC7361DCDA9F4C3956C486F67
            69117E553ABD125BA33DDA0D5452F8ABF162D43CE13086FC851805D76BCA3B6E
            EC107A68C299E8C87EDD02887580243973DFB586DF02AF819E98D30EE4455D9E
            445B0E948BE831759E086BF13BC60378AEE755EBAB88A70A091E2D34CB019A74
            4F81614F7DCAE72F0B3F9B5EFD2CF56030BBD2DBDB4EC705D4158494651AABDC
            D1E57533143EA50DC53B0B9DD7E34EB5E7F331614BDDCD77D188F7AC21BBA719
            E48A095780B5FC811D1A47559DD2B7F9A44A2513C5C805B0EA02787BAE704B22
            A2C357B47B8F04FDBAD8E37E20B5CC088EEA03C82B00FD133BE6C5898CE26F0B
            13CB93AFF4B35B01CA97DD89258708AD5B135B80CC6920E50534B20F1233C616
            370AA0179563DA1D89BDFB13F281DC79C9ECAE5760C6BFFC298054C593310CD0
            3EB32428E7C52DEAB1E743909210D10E67893137B1BE18442756A089C25792CF
            9752217E1BB3EE50C206358CA1680218F5EB01310E40941DEC982EDF492D20C7
            05714A8B2DCB9123DE3222C4B93CF74A1349BB97AAD842DF53CEB8CF20B8B7B7
            56B0E8F93752CF2A9A043DC9CAB3F1AED63CA54745DB93A2F7C31FECE648B187
            FB5900D92EB0FD5A6CD74DB9DC8C44DD0C3679E81AFBAA1E4ADF1094BD2E8321
            594FE6EF6170F7E7C00623F9866E880C384A0EEE58FF5C46F19D80CA1B6E9556
            BDF5CF5B2141057BD9D1AF78D2C70433FAD6A5B409C4351AA45736F6F655B4F4
            1A259602E8696862AF441ADD8C10E54D3BFDB0D426A1DC20B14C3FA6D4CA3FFF
            B07D5E886C069D2BB60DC859D8105F85AD6E1E1C1FDE832A4726B6C9C65623B2
            1E89A6F40198D9E3048FA77D6CAD8724DF702B4D2314DFAD5318DB263B68BD6E
            E8BCE848A8C050166C80C1D55026904716B94F903E43DB6E92A1AEB15745FC96
            318F970990E80CA4383B1CDFD547DD56473F51410B6B629C1ECC97EFA0C88C8F
            3683E4FCECE4959FB27A70E75FD76C7FB5BBA3A0BFE4C883D0EDC0752381109B
            75017AEA11DAFBC2377A46CBC661C4A9644455B1403789672015FE384068F48C
            D823AB7543AAEB9F8928BFE3547D05A8BEE3D8F85A40694846BE6FA77CD96ED9
            276D90A0222720EB0D40FBB439B5A1A2B1A5A6A15136BD0FA0CDEF882AE74C18
            154B6E384971A3D5A9F6B6F17634C34B6A15D135FA495556099596A84AA3FCDA
            0DCD4DFC83CD5CE50D8A1E8C93CAC90540E28846543140F880C0BF209556B577
            759AA596813B07308B87F26E3D1F021847A47295B774C8AABC1656F80C935FE2
            905BE096FF20ACF45471FD9881CCC80989673E22A331027D44EE269A30838A48
            A68BDD222B1FCCD9BCE7C296B4E8CBA5B803AD44B9F6BC1D2D8557DA1A4A4029
            6095A6FF64B5ECCF090E18E17CFBF675FAC3BB224A3A26F5641AD631142F812B
            102FABE46B2C80F760F9FB2311A3D7C5875DC41F6BCA8ECA29BD862BBFE5DAF0
            824DE5258FCA98986AD706D9562BD9F673125DA1227D04C4D316EE860ADEEE4E
            B6A47223F6EC9700751920CC1CCE2C642ECD80C27D2A9502BA4AB6E4C14B7997
            3A3B91BDCD9CF7F31DF432EE23331AA0E8D7A00903B84500B704606781EC7742
            E84E2D5CCE2DFAD1863AF1A16E9EC082BDF0C4262067D6268631F9F63993F9E5
            0EBE8813FD1CA02F0298054FF299813EC8D6873A8211B6DB7C4C6DCE185C72D6
            88D1DB52A4A238B04EF183C0FA594EB97998E21472FD9B754A4F76C98DDA8B8F
            5D141F0843F4660A34150A3756F1F6D5426BCB11A525FB70E90729D8E0D7AF9E
            7C664DDDFA77520F0ACEC2D2E75246E07013FFA36AA03B9E77240431705264D0
            58664C59EE1952E905A7CA6BAE4D4FF9559E882BF76D55EC325FD77652AA2358
            A213CB3FDCC8F5E619747A06F8F405B2B2CAC664724C4F70F675711537280B64
            7402A4AF00FA256F4C935C72BD1BB1CA2BAF9C2F75582D1D55D620D3DF05BB48
            BC2498D505E0BE6825D46BA73501A425206F16C89D03A8D3006516A02C00E44F
            0019BC729F39508F5DB0214DCD123DED7C0EE8BBDC49E347307541E452E59446
            784C3D24F331409A87A05EA7941B57B4F270A6DB03D40300C505C87301704E6C
            194EC887362AB74CED4EE9B8D9EF4AD3DE54A6BAA15F52E9B580FC1C4C719647
            615250E98DBCDC90AE6CE701D92E5F644F34ACAF10F2AA8BA3807CF4C3E4BB7F
            A3D6833B5E5D9B86313ED25B865FD75F0229575778C5A53201571A15517AB255
            E6B1AD74CF19C9AE20D19E1CC45025EFD341DE0F13EC0B9FA1AB4C08EB879601
            E66780B90430E781D5798E2FB35C9DCDF0C15EAEAD283C807E6F905CEC45A93D
            99560250E7A1A82790889EBD84BBE3BD4046999E64461D80FF0AD0BF02C449FF
            C2AEF1D14193EC46437CB75D5A294FD6289432CD46990428D30019DCC0CBB004
            E4AEC033FB0369075EF4015E8CC390D84ECEB411D04BDBA7978551ABED53CBD8
            339F0865B475B68A079065812C1700CFEA0705082E00D10520EF0168AE00750F
            407201B0CE9C297632A156BBBC4D1C4F69DF74DC19ADB783A4B4B95D4CF9BD80
            CA5B6EC5FAF52AED389E7212ACBDA5F43B453F859F72B32056DFBC79D3D2509E
            9B71259FB0A387CEDBBD436616A112B345C5F5810AA156F8FD5B76E63268D1E0
            6E41AED95796A0CC0576E61CC72A6B2803585DDBBE2D80ECB33F1BE01BEF81B8
            118F03F87980F0DE8F5CC7642E0C3F1ED78EA6015913C7891E6FFA818B791701
            F41B80FC0D4A9B85E44E49A7B516B582F1E5CAF4C4C78589D741E43228FE1D94
            32C50632CEE29DB541C85310F20C4005657DDA2627F2710FDBBD422720F3DDC6
            E8D296CE4EF0F8B34AAB20981740DEB275F6C327BDC0D6542330AEFF3EF602C1
            3943B1CE6C6BA38F00DE85F598EB02505D01F27E56FF5DD67E64A2B573DCA67B
            260AEF85E586E4947A33E07574E59C749F9A72FAF040F5D7AF3FD78FF68FA95F
            33F43F0154B296FAA23AACFC004DB6BB747F499E7B316D53179DA77BEBFAF742
            F2E76D35C198725386C94D927249A3C8BBA7ECCCD9EF66CE069AF9CA1CDBEA2C
            E43BF5AB736C8BD31CBD4DDCE58DB2F0AC3E80FA198A7D7135ABA06FF0516A59
            2B5FCAF0418CEFDB01C015EB0F603E01D4450865963D6BEC4812E9EDE3312673
            F91BAB8B9C39FCF8B9246A004A99839266A020D7E4A91FD4936620944936D214
            405D0088CB3BB3D0E3DD5C01545758E2901FBDFED1E8A36042116FFA30F8A310
            ECCB9C72AD9C1241209335F602C13981D4B3615DD8BE8FC6E0F700785700B507
            4875904F35DE8756CBAE10EF7FC6DD7C17F9729DE2A08C4A7FBA00AA4458EFAA
            755DAEED2843BC9528565E9839FF17F2D77803BDE36F8BD0EFA19E95C4BE7F3B
            DADB945494EB5349F36A669C6AA71B0F146C6EC6CA3514033D79B0471B1467E1
            0A679DD401F40120DB953DC56E7B8AC165E2065AADD09B512EE60CC0FC0A612E
            4198F31056F5C022747C083ED2C17198E00390BF00798BBC91553CE98F40A396
            8D69DB8A223EE9855CC83D0FFA43968EAF710A21BCDF88EA0F2D697DFDF1EDF7
            23FBF8E19D3AA613425A64274F42D78CFD3BF57FDE20E46936DA24405C31C98E
            7DDE07B8E0830463FB95921BB8B29FF045D502F8F7008DA9918D1DEBE6DA91AE
            03E0F6B0066140BA41D9010D1CB51F4871944B363B4CD89A532E35F6888F3903
            61AE02EDF142CF8495C625947A1305A864C1F59774A03E0649E106CD251E9594
            3BB58C5B3D55D7C67B0ABEB166E181CC7D5D5DFDB23685E9D7F10FA8FF71C5C0
            8777EF3F91B33D5A080A63C5EBFA0B36B7312CEA68E74A29EEA5F8DB79299772
            710ABD38BE21E5F5330885734E6A00D685D54EC147D43ECE1407D554C333D8CD
            E44A91D7E3DCCC6936E6274EE6227B4713ACAE455628AB5320635027A3F12E96
            2A9EF318C89B84A63EAA68904E2D3186A0DFB151E7FFA4E0208F6B229E39925D
            DDCFFCBA90DFD4D5D0D91382A5B263DE4229A0D58322F377D49366D828D350DA
            14809BBB40BA30DCCD239E5E001097F8B04FFCD0C5B659F5C2695DD0AC27B81A
            AD38863890B517208036EE0249715C9F68750ABB995023FC6C949B39B566315F
            A09FBEB235458A3D15511A1753ED8B122827F3CBBAEBF19ED2E6F230BA7CCEB8
            3F5F6FB068631F43A589B493987D636868646909748ACB6B13547F13FF907A50
            7D1767BB6A1F7415ED6DCCBF58410B2CCC0B2C26DD68A01E6CA5585463B6999F
            D73BEB6E177C7D23369BBF07C73F24273F2BA070CE650780DD03B2CF8E75059B
            3080DB0B64EF03925D6492CC8EE66CC356C93437F30D74B079524F00B84F2A09
            B58F7A7AC0A34CA795C01F369FA75CE8EDE217076318EA6776F2044BB5BF53C9
            F2A5D340DE476F52F583FC7AB6B42176D413F1E4566ECC7336CA1C1B05E4FD97
            D403D43976D2343B7855A84B90CC67B49A0DA965A6D0980E4F1499F96571F6F5
            73AB844280386B8FB9DFDFC3291B63BA29D5F4127E33AD5AF8C3E3EF52095A09
            E893D8C036BAF499A3264A744C54F1B9906A5B8470793E6CD3F1AD00C6197945
            9FFF9A81C6818D79E9FB4AF2BCCAC881B50CB7CE92FD43F99BEAA82E1F3EBC5A
            A371AD05FC1AFEB1E03027A7A62AF026EFCB81C90A60A20A98ACE67F5DB9A1BF
            C8A225FF1036F190C87503FE2003A70B9B769CD6C82E15EB4F838F492B4F20E5
            8EBB6A02387BB0F14259E3D78E001EDC40E9041BB22B90E26410AD39D2C3BD05
            0C6C285F60982739F9E5CFC7C7CE10EA05329A7A3A054EE26F00C4AF6B66FE17
            1ED9C893ECE4190ED28C547C0D671618AE2C00D41980B6043E42C893C09FAF10
            68EC9429B01D40C8EF01FC0728759A9D32CB46035FFFBA2B3BF5710F645B364E
            37B3F9E9D8A3BAFA1AE9AC6E80F6058C595BDB44F219881763A030B231BF022C
            C61780D559286B5BE058FCC2DE9020342EAAF05C48BE2B40A8BC1EB6FDF40E9E
            2B866CE43D82370D458EECE2F236F708D1FB508DF858094C5400933590F7957C
            0D24938F1F406DFCFA0FC4FE9F500FE2ED9B67B545B13574F746DAB9F64287FE
            C29DE385EBDFD78A30D2C584FCCC78038C39022D450FE849DED0CB2D407427F3
            3F91529916943FB65713C03A41C0706D2D78003736D08F119C80ECFD6728AA15
            4DB2A0E642680BECE9E3D2F1F52AE96D1231CD87C81E6D4D0838AA7F2D4EFF41
            E5F78D8D3C0D069120A7AC70FEAFE299BFDF40070BA1CE20B2C77523E900FE2D
            EBF324B0D1CC43B1AFF0155B1E9638214077925A2395DAC517DBCE419B0370D3
            71F9A6CFFAA15F2739990B7F0E045871C1F202E7A7CFD0A644C1E17572AF902A
            9D3EA2F5E5FC6AFB37C0AE5B885ED1E54A7544DE3291B4DE0964DADBDCD66C27
            D9D633CED532BCCB28774AF351131F3FB228FF8783E6FF9C7AF0ABAD3525D518
            AD0EBA691D797F2DF56825E54A3DC5CB33D09933C186FF8E99C07503B88F1EF7
            111D0D974D3564FEB604E4634930FB5038BA0FB47D0756B0FC23747362C33BB1
            A73B632A04C3F21D01C2278034BB2DAA1091D90F1017A0E8A7D4EA8D01608293
            0B32FB172BFED3060AF70C3B65821D64FF57DEFDAB0D6C2BD4C575E99DE3033D
            C770CD5B737AF4D2AB61198300E993132EBCAB152696DD083A768E9C171A9154
            00FB01A0305DF18163DD9C6FC6B9988B7F45FD02F4D3179077A1C7628AAFE12A
            2D1E62758DFCDBC3B51156EA5CE9B65CA936704F03FE0766703F5300E3E8E0A3
            DF9EBBA7AFC0AA93ACD6889569AEFA5E33020A3D68F5FFAAE0B0B0BABAF469A1
            BBEE5E47C1E106C6BE6E9A6D0745AB3943F2D61D3520DD8123C54EE0B8F6968B
            FA69EB95CFC92A966C92A9A4F3B63D147C21AA3021A8B4FFA0164070066D1F8C
            97217847287E2F32DDBAAE99634F6E2004FDD224ADAEAEABBBA4ADC728A1687D
            6AD14007AF2E1605E47DF96BA9F9BE815E940D546D964705C5E4CFD483DE7516
            429E0383993F7F12B47158F6E373F8DA956F4B8B33331F5F3F7F48AFE6403F03
            AF875476537707CC0813BE39B636B3A2A96F68C41555C99339B6299B36D8CEFB
            789887390FFDCE3B68FE5FBF421A3304472494DFF26F68B92ADE52CBA51DB80B
            4875E4F7356627B8F0C459232FEB22AFE97127D8B0C7EF0EB9BBBB29DBF48ABF
            8CB3A7524371FCE71F03E5DF43CBFF07AB5F5B28823937F79541BCDD4CDFDF5C
            74362BE194E14933F3B3CE6C19766C0447C10BBAD2EE86212A2A77A4E4DD4595
            2237CBF7E4F3B685215F8AC9BD1756D87F5003CC15D9C00BC0AA1A7355C8B4E8
            6AE7D0C84141B06F8E661633BFCC7E7AFF521DDD67818D6C6B1514C96EF92B66
            FFC906254DB251E7D8A8A01B00FF5DFB16655638BE318D92CF5C98F93E4D7776
            7E62437A0B2838E05BEC9837D4DACD3EB4A382A983A36323CCD52F219462EECC
            11314C5B53E3BA915ECE1530F69D655B5D645BFAC2D6942E3C24ADFC815FA9E3
            8C585715B77EA406BB8F15DF6D53BE87D63CA97602FE66F05B06E20EDBB9236D
            A4CEE99C3F7D48D7E7381068BDDDEFF0FB37B36BACFD73FC0EEA594D06DCBE8D
            0F147633F4464BB57362D4F8428DF82E68097A1808DC3517B9610C8DB716BBAC
            DF292C1D20274B105338E8B8A1B49AA72D00F94A58E59DB082EB214D80E0C852
            1ECC9E5DD9DABDCD024A399510DA8A785A6718A5EA0AA17C7D6CB317ED04B56E
            1B4736689EBF2A38BFB2811E15C0BF8610A7D9C1EC892544AC1739F0EFB6E574
            A5D67630573EB1569F589A3C496A074323B02541F033778B1D33CBD591099DE7
            B34BEED22A77663483BE1A861BA3556F1EEE807E9B83823AF37919D29C29342C
            A9F09157B5F9A47867038FD3494520DA9E37C956ECD02EEE6C07E41D43CE047B
            9E2073F1235A62CEEAE24EDBF9DCB480184BC1CB5AE9341C8BAFDF34F4BFC1EF
            A11EDCD30A93D553CF1C1C7E52CF0842279F10BE6382B8A22774515BE4821EFF
            2D43848F094F92B5968D9ADC510D416F135E570D8DEB5B6A4BF9DBBC84DF2195
            3F08CB3A9CD0047259F9A129665747335212D705A52DC2527B81F83E80380DA0
            3E44179925565800789050504066D63AC5FE913B5D139939ADA44AA5B43600FD
            16C0BE86903EB2DE625D834F5B539BE73FBE49A9EC082A6BF1CC66F064F4B381
            864F5CB840BF5150ABC4837A02102681D4715842278436CB91F31253B97DA493
            737596E3EB325B1B063924ADFA814FB1699F447F3DCC3A4393F3823E67961307
            DE05E169C8136583F031064306F82D13F86D1331C71DF06B7A02FEA6481F2391
            20CB86E62690A56FFF208FFA2BFC1EEA41FCD0ACDE478FD2EFA991C384E5FC8D
            C49C7671C75BF30799216F1AC0DD4DB8C3CD61B74D791E580A1FD31039A6C576
            D766CFA54DFD0D88961BA2EF05955E89AD773AA20BA62DB6B89D2D0DC222F801
            80F15931AD754F46A9726A2B3CA92BAB44EB5E29188FCE8282CE419E87E05F03
            B88F10CA029891B2816AFE57EACF0A1FC148066C1CE8D7F125AD2D8F8643CB5A
            5C92F2D971AF21D44936D23494BA289DDA711D5DC4811A05B35628FA397BEE5B
            D02500C4C5A379C1D52D720249ED0AA98D96D9D506C9E5ACE007F73AAB4263B4
            9BF3F327CEF61CA1013985493EE55617C9BE3A8EBDDECA40B81DD2C30076CF82
            83BC873BC058F8823E478A233BDA5ED8D3843BCE52C0C308EE6B247A5853D0CB
            50DCDDB4BEA5618DAC3F92FA1F084B8DE1F634D872CE5AE2B69940B039EF3D33
            588495D01D5391B35AF0EB06BC21A6DC19CE128E5BE197F5F9EE186DDDAB1FED
            B3BDA99AB7E9B2C447018577C2EB6D8EEB99E2B737348B0AE1FBE0693DF7F31B
            571727CAEB5AF813BB332AD4EE173B000456E7171B7D4131B5C93AB518C87905
            603FB211DFB3FA267F50CF72B310F23C32B5C79F5C3E3735C13AACF9298D9C0E
            B01180692D147CA44D72625F015963000D6C40F32C570CFA67D22490BB74941C
            58D7B49E27A92B2ABF8239FF31AFA17B5D523B04F332BB5CBB7F80B3052DD62F
            BB718A57A1C94EAABD1AE68A5707EEDA202EEA09DD3113F2346023EEE1BB6D24
            EC660421ED85E6D8233C8D607176FCC120039632065B9097F4A53D2CDA3B5993
            9E7F9FD1FF24F504463EA7BF118F9FB1C0351DF65C17813B26AC190AE166B064
            07D1E35A7C7EA67C0FACE061E6C2A7F4440EED12BBA8B9D559D534785B772D67
            DB31D98F08A5C7220AF72ECA36B68A88637AF952FB83A8555FE63F96D4D723E3
            DBA38BCCE3CACD40C10168F340DEF4EE9C96178F47AF521AAF515BB46219905C
            3059FDA1E6A0D583E92B0C3D6E8F6D1B7DF10214C3C5F72F4CB35BC1B7A094D9
            B58ECC1928751E6C166B17098C35595F6127CD00B90B1729378B1BD72313DA92
            69E5DF663F626BDBD62536B267BFC0D66FAB48101C90539AE2536A3591EFABE3
            0A0C1163F73287905D042F19087818F08558F0C4DA806D1A1EB51B4A7466CB75
            860798087A99C0A2ADE1EE4692969B39A2AD941F1E7BF98C95C1FECE91C27F4E
            3DABF9ACADDCB6B4B4584A4910F7301239A7236EB95D20C49C27C452E8A48640
            B005779AADD04D23094735811B0650B4A380978190B7B140B40DFC8436F75953
            B3C8EDDDD5ECCD4745A67855064D25DA5A05E431F5007D592AB96B5F7A91546A
            2F57CA736FDA29429D061BE60D37FAA9554E6369D7A335DFFE756C745836BB9B
            95DCFEB07A306902399D657963FCC7604A4D6259EB5E62BB596A3127E1ED5AF4
            09C6A053A0ECAC893EAB8381D58F469960B910C24C70E1DE9CF2EDDCA9C3A2E9
            3DD6E9E53B53AA01EA371EDC38A949A1F7B8C4148F6A9BC9FADE520E227A47D6
            3D63032B4D58B0293CC84CF8E82E8E7407C46D23BEBBE6FC20F50427DE247BF8
            7D0BA193DAFC2116220776C11F58024956F6B7CC5F3F63CD37FFF6FB86AB7E07
            F5ABCB601CF665F96B5DC98366ACB8D191AD884BFA92363B40EAF91ED8089DD2
            447818F1C6DBF03EB016DEBB4BC0CD903FC082F79E253CDE5EC4D350F8C04E91
            ABFAF0ABE6F1613B3A1A60ADCE32FD9B551FB570ED40E7828ACC95F314886E01
            B09300FAA50B26B0B1550C89EE144A6C8B25172DCE4C7DFF755A53371BE625C8
            E99FA9FFF30621CDCA27D6F3658EB186AB881FD9595D0860DEFB779D39AC6478
            8665F898D784DA1D770AF6B065BC00B0EF81847E9EF47E80BE2882EDA96B91EA
            B1966AD792EB2AE1C6676E4C8F76A4A5EC09BBA5237A5A13E1662CBE6F1707DE
            0911628AB8AACD9BECC09B6207BF632A10642C70CB48E0B29EE8612D1E1F13D9
            7356F8E82D15B967E6E6E759E6FA3BF07B0487152CBD7B33594C49AE2BBC7FF1
            D67E6E2F7DE42503A193BBB8704E1C041778B0B9C84D7D58AC0DFC8A9EA08FB1
            C01D73C1531A4237F404BD8CF87C8C39926CCD6FEC284FDE5692B3BEA71A96BF
            6FDDA3027607E25D80FC0582FF7029B330A2A8D13AB55431A370A003B60B8301
            E31308EA9537AD99F9EDF3E3A7E3C3033DDA490D10502EFE9E50D0B4A9336CD4
            2976D0A2A9B320E9A010FDEA4562E5689439B1ECFACE36B8252E727B525318A3
            EE2EB188377B04A07E55C13006EAF90AF64877D3780AF1D295D93BABB1EA7578
            8D824C7DA55BC6305F1309573528DE892FD646F4C04E769433E2B631578CADC8
            712D714F63B1D3BAC89B86623E5A1161B6B5F45B85C47B037D6D3F68FB67F85D
            5AFFFAF9582DD1B08F213F5CA8589FAD2AEB6F0960ECC5F768081F51E78BB0E0
            CA724180795DA425BFBB3E283B5C69B6A2FBD5B96277F3C6EC86059B700799F9
            BAEB166498A487DBE5246E682B1718A8030218AE00616E5D7263673F6B4E5E62
            612B2CA5ABB056D1837212546480346F93D3985C50259AD22D9DD1219350CF96
            F72BB60C12CAC6B2E8599071F009C072A72C85F9E5C7BE6700799F2D710FBBDB
            6192A9951709601CB234F5EEA5467225409C73C5DE1F6A616F2CE0A2E728A6DE
            B7C5275817A32C1A89C695193BB7FAE9B3C7DA22DD8CD8F39C79E26C044FEA70
            4558F3051A81DE55F0BC9EC05D53FE40536884E5E1EBC603D41D4325AAE365D2
            CD7899DEF6EFB3DDD6B4FAB7F1CFA90775ABA2945E9E7BA28A7EA38474BD8CE4
            EEEBB79B33DA8A3DD34E74AF86D0155DBE2033B8BF91E0691DE40D4364A01567
            C66EF81D73086DAF80A711DF65DD4DFBF450E176E44C4B4A8A012ACA243B666B
            631937A36E1334EBA56C724B20ADBEA3B7F74C76152CB1EF12ED5A7DA3180F6A
            0C425D42A675F326F7B0469AA84B007DE15793ACB5F0FF7B5FC2F730FFD7EC7D
            6D63459698C9B4529DD452539E9401C7D4B2EACEEE948AE66D49F540F6FB0745
            B6FD4D1CB824E5EC08CBBC547D4ABA496CA076E603035C9CBDEA153DCE702B84
            BB0117DE091E692D749ED594B9D3ED04DD8C38D3EC85CFEBC2FC4D44CEEC4A0C
            33AFA3B995E67915923C4BF3DCF269A8F94596DCAFD528B092EA5FC53FA17E79
            7979B01DD3596C3F5860F8B46CCBFB1AB1895A9E7785EC27BD548124078E4C07
            84BB3EE87C78921C79EF5980ECC3E26CF9EF9AF2DE3647DC35133AAC8E0CD00F
            BCB3AD126D464D37A1A639E7A63AE3226DA2439407BAE08A99F900ED0B77E6D8
            A6C8425682839F964D2B1EECE173C4040279CB6B81FC5F72D45FDFBE1B3B750A
            A0CEB3BA2759D6BD16D2FCFD46F9BC312377BC0B6A9C1307E47C04F26614A32B
            8492DA01FA121FAA1FF4315931D219E1D6A4647B5AA63339C166DB199D836E26
            A569BBD5F66EE7BBA8237C52031E69C31B6421725A8703ED008BB181859AC37D
            CD852EE941A36CEDBDF59E97C0A76A39A66A393FD488BEAA5A3F56BCB5A3F0C6
            FCCCCC9ADDFE2BD4B31ACBC7C98F1518DDF7E5C0C71AE9C7A53BBB0A6CEB6927
            CA28578AD0974FBA69C01EE803287B3095E50F34E1C4D873F89B725FD51538A9
            833C0CBE65C97FD2C0EA8CD985B39BD3231C0AB29D48E956B40C3362A2F13D5F
            C3F62AAEABB4F300F11348AE60428B5A46D3C1F412BEB80EF782D36D2DA2C8F4
            4E36F21294FAF1D779FCD3C6D219CA3C37FE258079C76A1FA4598030C11A95FD
            C527290BA069A3CB77626AB4D813070EC7E76BA29AA5E26AC00B00FA1B1374CC
            700FF4E16D6D4CAC0D25C588966A4D8CB657F53092BDA59B176378D9C79CDF41
            4BE4B486E02D63B89F3157BA1334D709E1C172B07CFE16DCA9F6B227D56FB99D
            64E03D4B72AFD4D3CF77336CC7CAD45F5708D610B73E7B3EC65C05DDE4BF4AFD
            CACACA8B673D9DF5444A8E5F15FD5A0BE3481BC9A88FB1B9AF60732749F776D0
            E9AD371DE1177560877608BAECD86DBDCD699BF2BD4D2ADEBA9BA10FCC0E9E94
            3D77418FD3DBDCF58A7A618A5E4AB0E13D1FD3DC54474CF4E6E662DEB27625BE
            EC47A0C1CA6776F5F7777F9EFD7018D320145FDBD1860C29700630736C602AFB
            170DF915F367274D43E8B3B269DD8733CA11E9BDAAA82EFDB84208F1C3F70F43
            58E91518F380D7E3CB1EECEDF13EB60D49399A694DEF5FBFF8F06CD414D5C8EA
            53CB9948AA30E96BE6C88E5620C4DB10929CA969368C646DADF3FA6CEE26AEA7
            2C4991167A67B7F05FD011B9A48BF03000A8FB79C19CC66187E86575856B3AB2
            E63B842FE9C85E35CA8BDB3A5CB0A99DA2D74CDF9B87F668AE2D7FF3FA196B65
            C9EFAB4BFE067E979BFDB4CCAC2B896AC12BF4D2D59B0A4E54E4DF2A23DFAEA3
            9CEF6758B6674BA704AF77BDB947ED880D495CAE405C2E56523A4056D9C05CF5
            81B7AECAF11D3C7E26827E16910166C73C8DD54F6B621F1A31509B2BF0FC8F1A
            39ED8961A0E11B25143F1AEC9DFEF8FE12AA803DEDA91126E5793FB007E30FE0
            3FB36C99159CFC9A8F654538A0D52F0A663E1A1819E91A1A7A3A3E7E8158BD66
            CBAC7741D7CA015E83BC2FDBB272C6BA39CEE65E02D23EDA27163D7EF2F8C3EB
            6787520B01DCCC6634B5B7939791852C25AE07ADBE20CD849A65474A74DCB967
            3BBF8711F292A6A3F796EB570D440FE9899CD7E18EB3E6BF63BADE49D3EEDC3E
            FF9B9B6C76AFE7F33703B26D1C3DF40BF0FE0DF99ECDF9FB5AF3D45BCA1F2EFD
            CABAA9BF82DF413D18D733BFAEAC305FBF7A47A766551376F75315868A25FBF3
            B7B7339CEA19374B280194E4EBB117F423D6C9DD9191C74A2B7848CBB5082B6A
            99EB4222CC458F6872A6D89B9FD4DEE266C8E7671CE0665E4A585F7F5BA8D11B
            51D8B69E3FAB179135A298DE792C8E00E03F00C429B698DE8BB9D75FF40166D9
            31007E09A0CEFD96E28372C4419CB2C636BF9B5CEB4E58F97A2CAF0160C5426B
            9F07BF95B7AC9C59D8DBC61B576CC111DD0EB0EAEE17ED12A83BD2EB90E90390
            EC97D195167D995C5507D655E78B27875B13526C4A5086BEB77491977545F66B
            82492C2C6AB7BF9B9E8ED306D86D53E4498DAD9A8A6EE764BD028E69DF74401E
            DDC59E6AB7C5DDBE93B8ED45B9541775671935EED5BBD935D6C1877F14DB7CC7
            EFB1FABFAC39FCEAE54877F9E5D6A28B958CA03AC6EDD67CE7DEFC9D15999BB5
            CE6FB2B796AB472A0449ACBF242D1B2529E7AFB845E284366786A3E04D438E0C
            5BF1039A8217F4E03E0627AF6837E40BB55D90E8579479DE009CC87303729900
            759123A94335B9F104B1F602AA084879E24B3D06B2EF8C0D01726658853ADF43
            46563C330359F3A82CEA49738AD12594A2B285990FACC35B5E1AECEED81953CA
            629FB204E056D432B13DEDF0CC522DAED401FBF42A4F42D58EB426CE8476D6C4
            071A533B3BEB792FFB808974A7F1FAC60A2421662721D92A31C452F9AA211BDE
            45F8B086C0296DAE3407B700CB43AE3A22F6DB854F6820DD7525BCF5A089665C
            977585CF188879E86446593553C36A0821F9A8338D6BA5DE6B0B24FF41D9EC9F
            F13D4A052F684FDF6031CA749422D55F605C433F8F4B38271D64092438489FD4
            76DBACE423A958282FE3BA539527D49CEFB6096FA805EF7D73C475039113EA02
            A156E6D777B596F077B8487F80AB145F13E91EE0574C2F6215BAE64E1DCAAC60
            CE7C9CF8F8E1402215481ABA46BEF0AA1F08A1BBF2650C01B92BA05700A59F95
            34FDC9EAA1A4691EEC0B61CC631774F5C2C7F73E94865DE80E713041257E01D0
            2F4E106F3CE9E2882ADECD9DF4482F227F687494B9B2789B58C2817BCE46FDCC
            9FDE5FD6AA581A2BFC5848A54F43A6A540909ABEBD8DB825D8673BF2942634D7
            852FC49CDFCF04166EE97043EFCC912D7CEEC650F23EBE003368B6132CCA46CA
            6E2BC2437F93CBB66037113BCF1D1B3DF78BBB39F83DBCBFF2BD02E7F7E1E7A8
            FF9123ACAEDE08BC6C78D936EAE1951E9266135A716BA0095F80057B94257BCC
            6E9573BB2E1E55333A63CA8E7346DC321239A42D79408323C3117159174C4336
            9F506BA0C33B8D642684554A3DC4FA3A3908353B78B2C601F292496A75576F4F
            674FBF52562F4B2EA2064D30715D1D428D0D22CEB9C13CA82100F705A07C0328
            8BDF55084A9EE3A0CE826D822BE7F995741A47CE2B80C484A0A7F4B169E42AE5
            E16E8ED379EE40643718F620D123D4EAC6B1B191E359C52C93C74C3C64383777
            71EB5CD71F58B7FEA9AA7253AE504EB40E39C5C2EDB62EAFA729DF7D73EE245B
            44A80DDCC748E8AAE6FA936A50D27E0EAC03D2CF14116526EC6EC499EA0443D9
            891CD4E23C6704F5350182750F3CBCFAF6ED8FF2ACDF899FA0FEAF1198160778
            EB4A1D57DD7343D9CBF7F4C61BBBE1BEC61256DB78EF5942888ED2D7CCD69FD5
            E74E75E0C8DA2DEAAC2E7C5E9B3FCC9237C01C76D3604BA06623956778BBDCB8
            84C220053932C80386DB21746720EBA37046BF64FA80613499277B5C3ABDFF16
            8A0E4F1E5F975071B7C869A48DBDBE59FC06FDEC4614952BF329903DCF9A4A88
            5F01882B40CE32F82FFB8366D98CE213249FFC868DA31D4046B9F1A6140257E2
            E04D74B17A7A2307E6A566144336B34F22A513404F1FC37BBFE883EA66EAF03D
            B4AF53DEF84646B133870F9FAE9697EC14787B176FA429D2C78CE7AE99E0397D
            91836AFC3E26025E861C6417AE443B91B3BAF03BA61C59F6EC3817DE304B91FD
            BB046EE8B34759E9851CFAF0FCF50F6A7E377E8AFAEFAE83F558585C257A4C03
            B94F93F3AA1134C606794E0B9AE3C877CF0AE965C89DBE87C7DF882FC85C6CAF
            262CC54EF898262CD61AE16B24E06DC41E6B65E1BDB583C0FB4C5179445E7EB4
            8177E5137B7F0BCF937EE06AEE1930A004688B00E1834264497E553DF3DB12A9
            AC4E34AE1DC8995C9F98E7CE38DAD82C3ED8C951D7209D59AA73B7608F37FDBC
            3BE3EC9D82FD492586A50DAA8FBA383BDBE1E1C5365B533380ACF73CC94391E4
            62E6D7C59EBE7EED481A807DCBDA3991699373FF453FC751EC4600EDCA996E4B
            DAB1E58DB85C47AC707E8E6A21CA30E38193A2F76ECE743B09C79D120E6A9CF1
            BBB962ADE1F72C79E2768B1CD614DBA7C67FC782DFDF18E16328725A4BDC79A7
            C0353DD18B268C42068B97DFD94FFF27FC2CF5ACBD2FCCCF76169ED13FABC873
            C570DD3E0D769C83D8116DDE10732E9C0B9849C103CC04FD4C39702EA2273545
            8EEE12BCA8CBFBD0863BC14EE4D02EA14B46076294FBD3799FAD937BA4AEF46A
            8087F909FA799AABA395F7591FDBB5BC73AC697FF46F9CD85789057513AF9F3E
            A0D502E40981CCC7167165BC492F84A2EBB5D0396729EED15576A426B59206E5
            92FA8DF4C61D493566D7F34F9B60D344E3CA7812472C929B25929B01F2FC796C
            C3DB17A3F98DCDFCD9E3AC0E09CC8203F6DEEB3EE8F53C2520C31920BA0238C7
            58FDAD13C20A5D3EE274E2A6BCF47DD53946478E6D82C4D9891E51475C338052
            5C916094E96600071535D1963FC58E3BDE1A19642E725E4FF09A1E6F9415346E
            B7E5A51DAF473BD7E8F9F751CFDA336B2EFA507F4B2DCED233F808E7436B9E18
            2B84BFA9F0591D91F3BA083F03648885F8496DF84D43AE8CDD823EC6C2C7B585
            2E6A0ABA1973A259850B5C21D657C99BFA1F205F092B7659AD9B7AC3CD9C675F
            5DE059FAC8D3D3C43DDA032A8F0B67E66380F8592DA6786B56DBD6B82AA1B816
            6F5ADDD4FB7705F52DE249AD00E193E48306B6B8314464133BEA2914F50A11D5
            C81E37281DD10CA03F70678E67E697CF4FBE4B2A6E944C68548AADDC9CD5AE95
            50C186FE00664FE789375EF5436EE6CA03692E10C21EE85A59FD0DC71DD3424A
            9DE7252AA852B474135A9AABD93903F8653D010F63DE0053589CAD98AB1AE872
            B9D3ECB893EDB852ED10AC21396DB1E35AFC11D6B0584BCEDB16F7835CBA9BA8
            2BBF7744F62FF829EA57593FC0648E0E76D7D2834AB2B4771EDCC473C70279C5
            40ECC82E0190DF3427DE7073E40D3D910B7AEC1827215F33013F33E1D3BBE00F
            AD913E86FCC1669C61E60FD365BBBC453F2055DB8E8A2FCC405741EA6721CC45
            C8E729687F0BEF8B01805CBD5531B300C02CB3EC9432CB97D27F975ACBFC3CDB
            D2D289CC7CC48F7D4AAC6A6EEDEE76C9AE02F2E601F2A269667D737B777D6797
            54460F27FA35A1B882F96936A7B25934A90DC803E35130CA5C15CC680D2FB019
            EF613B84DE0264EE81E05C2178470881553EEF72427B5250B1DB55A2B4403437
            F5C0BD0023812873C16B068217B4E12116221774448F6808DC31E5F73713F064
            8DC10A5F3610BAA4C3EF6DC41160CE71DDECE8758526F2D1CED6A265D60209FF
            3EAB67ED7A656666AA9E6AFB8821D15BB8F756F041F85D43BE2033D10B7A82EE
            86FC41A600632F94B6171E64068BB614F437E34AB213B9A8C3857516BAAA2F76
            4A53E0A66E0655BCE7B8F87B8452FB2DC92F8B3F4ABD58554773D09525F6DA2A
            38BD946FA083EF2CF50657D6302BE4A7AF48A5B45E42951A65B622E21A4CE218
            63E3A34CE69700422507FA39807F7732B384B93039F9F1EDC124067F5CBB667A
            D589ACD21DF195A07081010F90FD76372EBCB24176B41D308FDBC55A5E04BF56
            0D87674D6100482EDA1E862F4515C1E8BEBE90AF2865E781D3DA40AA0DEF7D0B
            C1EB0642D78C4007CB9DE9C441746227B9085ED613BEA0C3F3D08203EDC093E1
            A015AEE515EC508CBD3658B4B90E23F7FAF1BF73B6F85A4CBFF2FAC52B5A8E5B
            3523AC0A7F3C396493EA995D6014CC497410F2321139AD2710600A2A20578A9D
            E8357D410F2376E21E413F139E347B9E07D68873DA82C976B462C147BB655E21
            153B93902B5FFEAAD06E917D6592E302762B479CE33982D2603B50DDA8EC800F
            E5497F06C624006A12749250D21C6FCED36398EA7BD44AB5D46A6EF41376DCAB
            0D294D3708555E84327ED46380340190BF02B829207B12741BBB505959E546C3
            5D90BE56E8F347DCE10C05489AE3F72AC435EA9D805C27D9BB168F25554676C8
            761622D3229D0D8F19F3049908F898C383CDC50EA87364EF81E639C3508EF060
            33C943BB90B72D056E9B0AEF57DBE8B431DC537C8880182D35A9A6F8E513FD07
            FBFFADB3C599DF98ABDFC6865A9A0B8E14644AEDBE22237A5E933FD044E8A22E
            7FB025CF7D7330E59372DC01F732E60F30153EA683BC61C04E72E6F732E2BD67
            010FB7644FB4954C316FA3090FEBC83D9750EE63C0985F80B5A59B80D57996E6
            A41549B183D410F600D9AE5249A6F71812235D90DA06D9AB941BAA3955D0ECD7
            AC5E1D0A13487F02491B0768CB00E50B041425DA2A90FD8E2D6990F556EE2708
            FABD14AA795F6E08AE7CDB481774A8033AD8C937F79E9BF989FDCB04E7C9EC6D
            AC8922A0CAE39C3958D5B84EB004BB0625A5A77272036404234DD2F9D626C471
            2DBE20533E7F13C12B7AB087D602B72D90D78D10370D38318E5CC936A2601E7B
            5E972BC5019A6AAF70452DECAEE80885A79DA0D55597BCFC33F914889F139CF9
            F9A52AACDE4C0570EFF646E0B623DF657D91939A02EE86A008C203CDF8EE5908
            82BA7F489D27DC0A6C95BCF1368277CC1197F5E15774F9DD0C80787B75DF1DFD
            349E910D4AA38A8A636DBCAB9F20CBB3D0AF739C202F5D9D7CE289A60016F47E
            8EACAA7CBC2BE80C15538DFCE8B28D8D90FE365E72F38E1B55A76CA9111B7145
            82E8363ED4239EAC316ED4083F6A4028BB43095B6E91977CA1D43DB3C9B0B959
            EC7107F0A49363A81BF6F12548FAF71945ACEAEDB7A3EC5B537401AC2B1BCE85
            1DE7C44674E6C876C46F577923A9D893269C9B6173FED64181F33A9CC9D682E7
            74E0BEE6B0682BFE103384AF016796334FA40D28FD92473405BD4D78C2AD91E7
            B560E70DD8AF996EBDB4DDD85FF2C215F937AF9EFDE0E9F7E1E704E7D3E7C5EE
            FAB4CE9AC082DCE42BD71405F729B1FB19C043CD9167B525F66BF03EDCCD176B
            2D7A5E4FC678ABF0092DC4757DE1BDBB5865591774C58E6A481ED3397959E151
            1EEFD3750A3D3BA4DF3DE7662EB27D9B63CD739B7EC56E9AA209A0F742084EEC
            58D6842696611240517605D59933CB411DAB139B20328401C66A383B5A10752D
            42D5ADD2E5CD52E54DB2552DB275ADE29D2D42430DB0815C8EDA34AEB64EAE57
            2FB866A738994BECCC798E55D08BCCB17D973590FDE20621BE441BD6E4293C98
            1981E6EFF2D068DBB4B07CE703B13A8A78EC7D4369D08C3C4D7922CD7932EC44
            BC4D24F769802E57F4B0BA94CD5691F33AC237F4C146CC1F6A267C4A53F8BC1E
            34D81070D753F5754DC8C9589CFFB99B3EFC0CF5AC9C8155430B7ADBF71F5E3D
            6AC0246484297AD9025E5ABC3E8682E7F5E07EC6424776891ED312B869287A46
            4774FF2EA153BA7C0FAD40933FB86353294CF1DE65B1DE5461D0ADB55B49CFCC
            805C4056E7A1DF66D93C70AA40166BED50D0F5B1E1F6AC2DE8E7C4A29EBC07C8
            7590BA6B79D54ABD5554E50DEF867669857C57F15A12A4A1809B8131A7669BD7
            D291CD056CF9E7041B94145FF02B3E16546A7492EDA5084C81D47F63632E8182
            06C6517F722AF300731E728F220D497301950D8A07E5DEE5F45EF5593EA50E6F
            C112D2464A929EB185BCF07E2D415F53A4076BED457890B9E05543D17D1A22FB
            3510D7F441F30255881DE5C08677828599197B1F6054142E4C4C7E67E8A7F073
            D4B3EE9CF6E39F1FE86BEC70B97381C7D71048310350F63CC1563C41C69C9196
            5CFE26DC3774B98EAB231CB6C30F69DF905588D490CECF14E80E157A0357EE38
            23BDB0C4F16D9E9DB908902A856149BB01FC5E36BC2B14EB0AC539B366405058
            8A2C1B62E669A3D6BF4E71955BF12D52B5CB54B62754B883CC554BDAF5A89B36
            32F6B2AB73F0F1485D35CDB285C6D1138BE877107F22A634C5A9F25858A9CD59
            A6072FF4618A83B9CA0E9AFFEA1CD8C2D8BEAE35B2F9B71C4E99DBC06C960D6C
            5B797BCD2E68BD872B761E17AF29968CF273D8A5BA1979581DE163CC95610BCD
            7705F2F7F18269948F31FC8E09C2C350E4E02E1130DCBC66C0EB6B247DC9A8A6
            FA5FBF97D84F09CEAFE3D3DC427E55F1B9D8DBDB2E59899F53035359E45933A5
            BDCA5BCE68DB7A9CDAB345C94D4CF6EE3AF9B30764AA0B101DD7245EC114DB83
            8557BEB016221E1FE4514A30058505145F0ED0E4894E00690F90E724136CE963
            B573404A6E9157E18DB04287B94C471CA2B588BF8C26921EB92D2BF10AE8D226
            A6A79F3C1E040F809C139B11AEC6C04A3696213B3311ADAE52CFC4367EE4561C
            17556AB193EEC8139C98E45C5D015B00F4DB0C277396F5646800269F6002E0F7
            01792E9B6E19BD1152E8B1966D2B811B1D54E1BB69C899650B4632B06C57EE64
            1B016F43914B7AFC91D63CF17660CB1677DD897437E1BA6D084498C85E312EAA
            28FE4EC2BF80FF57EA7FF465AE3D6BAB26643DDC9D19134E0D5F5793AA40CB0E
            A36658046A4961C565C4CE1BF2BA1B9319E2FDAE32AF05543AB20598ABD0F9B7
            50FBB49D603C0325B0D40620B3226EE500CBDB16DB8624E4BEF028BC1297EB72
            58D7920CEFACE52B2529A163F419293BA949869814CF6F2B2BEF3F7E181B0163
            7C661E269218A3599CBE2B3BCABC10ABDC5A23D08CE7EB392C3526ABFC9E63C3
            63A46293F5BA6EACE08709AE95558EB5D56039999F21D42A619E447BF0328B45
            EC1E9054ECDF29D75E0E5B17A40FD00FC1432D843D8C10774CC48E69224FE923
            AFE88B781BC1EF98099DD31338AFC5755D63938FFDBDAC98477DBD5F967F57D7
            FCAFE21F500F72BA3A3733FBEDD3124B6B586AF3E38D5F007CE77B45F98BD76F
            AB8A92474B370C96A997D31EF4166AE7846F917536E5BFAC07BFA027E7BAA1A9
            10DE63283326B161A84280F989E31E4516487764157FB3A6633B29F85BDCB1DC
            3124A9F8854BE1A98452EF7EB1EE7444572577095129FBC1C698A03DE9119635
            69DBE9A97A78CCDDE5D595898F1FC746C6C1DFCDA7A030515B3BE81AE418DDE8
            30AB98002D72C696AE72B64E225FE705D1470A0A1FD8373E155468B79569C720
            DF7DE0609DF527287306EA86077D8C0B2CC5B64445794C5EA1BF00A695A20FF3
            0123FA5DFC774C38936D595110D61148D80DDCD105822C810C1B4E5F83E3B72E
            0F77FDCA0D65C0649FB568CADA38F8CAA74F7333D3BF49D91A7E9BFAB52E8986
            AE2E34A308DCD5CAEA32AB02F01FE2D978CB239A5847815E3125A993A1DA9067
            5E84758B7F28271C60C81B62B53954B7B31CD6BF516640596E6298B3B2451891
            6A0B90F781A42B069A06996C1D12975B8429BE9096EF3C22D581156CADE42DC1
            C9DE0F3277BDEBBF31862E9ED62294D6611A1E838DDAC9A0267FFBB63239F171
            6C94B5C8706D793E295E8B9864627E3F5424B55332AD59ED3EE18CEFD1DC2485
            D672BE0EAA40D715F15115B90F9C1B9F22155BADA5DB71F077135026937DEA2D
            8771BA1690E69CA1B5F19DA462270176D85D5EC06EBBA08F113CCA9A2FDC0C12
            6D078F30DCE6A363E177C6C543F15CC81E7205E3D3E2E2F7F3FD05BE8104B16E
            A4CA32D99CFCE286AE9E35EA7F93FDDFA4FEFBD5EB7DFA6C7338AD7314342E90
            FD7FD2B8063A0B0AF1C7CA19498334896AB26361EEADDE5CC1333E0A0A07D560
            9E965661DB7AC8C87169A52123E9DE4EFE8D5946408E8B6A80C95D939D4F85E5
            1760F24F15957ACE8B77E5F2B595C34AF35432EEBB9C0A3D8748EA03480B00E3
            0B6B3127FA37CEACB1B8E85D558584AFCBCB137FA2BEA1B6929EAA7E24D09755
            CF435F06E84B00FD338099507F181B1670AE00BBA5A14AB88786ECF1141BD926
            FB8A5BF909AF7293F9FAAE6CC4EC2457EF089F589A9987B5FA0741C5AE38C4F5
            3405DE206BFE304BC45D73111FF38DD77443EE1CEDC188B4522E96E77AF554FE
            F95E25BF4228ABF1AF5967D7E8E36D11A4474F9F83AFAD5D895FC7DF50BF56B5
            F3036B7B5F79FDFEBD6C5A9729BA617EF6FB228E6B7BFA8DBDBD78F9A6827E7F
            385FA88E7CBC98E8355D0B6BC6A9CA9CB4E3B865C07B4DFF74A81CE803DF08AB
            343A4BEECED826E76D1A6AB67D444C7E8E4B614C597EC04D748001A391E0FB92
            3619BA6D0DF3B3D38E2B5A9B4EFF19429B8650E720F43976CA1C023D141BA75B
            C0C8FBB2FC8925386BD497959497246BEE8D7CC8465A80D066D929336CD40936
            5635C327E9C4E6E4D8BDD177E4AD633432CBC57A4AF8870285FAD5645F72AA3C
            856F68B7961942F3DFA14B1D75567B2DA0DC158808C3C870DF31857B80B263C0
            79CE28F50E7F5FA16B39C56FB490BF89717C68A8FF3BBFBF410068ACAB4BB313
            66E816F9B4E6371F5EAF31F5E3B373B3BF9C63F537D467911831F9B5ED8363CC
            6FA0BEB3303B336582EF04506F02E955CCE54FE06E9657BFAEAC8021E6AF24CD
            E32375BD24C10EFAE13ACAD5C57AC878897211312C2168A3F8016DBE23BAB723
            D77585235F0B2BA46C5308D2D93226A230CFA332BE49B6C75BBCBF0C5E40E73F
            19A5CA1F6303BD690149B2153A63C61D48652DC4026EA44F00E61580790B9097
            B888AF2E041D25A052BE7D5BFEF027ABA712499848A3AD7128566727691E20CE
            83A4B3A68B50E781FC950D9EE1F64765814C57CE381BCBEBAA1964F14795B081
            30C480A6F42B1E951708A506E375E11A4A2F85143A2E8A669024E19E467CEE26
            823777D8B9DB56E2EDBEB6003D74AB7A6A401F55B0ABEEE11A97BF2DBCCB8BC1
            D47A20E7A509AE677A7AEAFBC5989FFC10CBA8CD20B38653FE1A7F43FDB3B72F
            E51E16F347375E26B7F50E8F813B6232BF1E207702B9D37CE943A486F6EFB203
            4617BF6AF8230355053837DF0791E7826D62E37518E83BFD052AAD052E7E3EFB
            117E9A11F9EB3B3C242784643F2295A77895C776ADEFF717EA29E7C112055DCE
            498BB96E5370D0628F74E00BB112F63614F4D2E5F7358507644BA7D5394706DF
            8E3AEB79F7E8D6240240FE2490D0E99F8C5D5D59FE383131BE467D1216AF149E
            0BC99BE2C28CECBE177932E6D6D628321BEE25AB76F3361AE661CBE9610C8BDB
            2D76489BEF900EA78799B1D7E6389C486B05FF4084C080C9FAE770D5097E8519
            61856E47294691103CC2422CC03224E8E83055AA9E7A2B27D9CE3DC2D83BF826
            2D27A0B906B576A2BF76F22CAC521B3A785983F87347F3BA9860FAB9BCD0333C
            AA96D1AA1459F8FCDD2F476E7FA1F5ABE4E64E734C3380FE2891D9EF466B1C1F
            1DBA45A983800D9F3CA394DAD63FC48A28965740EE7F0553EF5FFB0704F15C78
            0804D601BE45AEFEE75A08C635F9118F0B457DEF3853A8B29DFB245EF16CE8D7
            5E3F745F68B0802F0323BCDB7703FF793D0BA7F521BE46EE576C24BC77F20558
            889DD29438AA0DC53B085C35F576D36AC668B711AD6AB36CEF2798407013A039
            9F27B5AF2C7F99F8F8617474183CE6E0A216003F05FA03B5A898A2448B469426
            23CDFE66DC69B92B89C80BBABC71964217F41097B5C4F6A98B9DD5E57E68CDED
            67CE79CB6C1BCEE401637D7B09EF508AC080A5E453844AD72E998A12B8D20DFD
            07C112EDF9373A8AAF1092370879E181C046D89598CBDEE79F0EB2EED00332FF
            AB8D7E60645C31A30B20CF4388EF6F51EB8747076E521A24D27B81D4114AD3AF
            DC8DFE6FA86755C67E5A1C7C342A99DEC76AB3D809D9B4EEED09E5ECC4F7AC22
            80BC09C3CCFA89B7AC392B6B9352598D0F3C0C5650B5F6BCA8BA4E288CC6ED87
            E50A2E04C2AB808042873B51FD14A9B6026B12FA6E5B096FD925A1BE08E1EE5A
            AEC44229FD502DBEF3BA6CEEC63C81E6EBBD7412438EF4137738F858B1653970
            653809DC3683C559C0FCCDB6DFDC94977CA61267548ADABB2FC10D42642DBD75
            8ED2C65CFEFC6162627874046C88A1C5CD007E0254F90D49785292433D5EBF34
            F75C458AD416673DF6781B91939A92F63B448E68C36F9B7166DBC2622C85AFE8
            71465A7378990AD8AAED7252791027DE56CB37948EA83B21D542E30F0BB0ADCD
            BF32C6E0A2A2AF6FF18C0542AB39027279EEE4C3622B1F12B06B15AC20F17F31
            FCEF13743FBE7F6D90DE08E44E42A8D3D0DC09B5F852C9CC3ED6040ACA927B6E
            1DF3D3FCF70FFF35FE96FAD5EF6BB2AF6654B74033C75915BC20E3B95310DA24
            5BDE1C1B7901C0BF3B8C69FC34FB11FCD03716E9AC82CEE535B73E3C3EBA39B5
            19A07FE2C918867BE339FDE9C0FD4AC86DE299A0932383FDC5048FB17A60B809
            9A90C4A777631BF4A6019BBFA560A005D2C704E966C4EF6BA27C46E342A0EE99
            B3F61267B578838CF9C3ADC58E69216E9900894E67BD77779035AE8778F3A09E
            B051400B985CA31EB4FA899131907A6658712B40F8C05AB188F0EE58A07F0BD1
            A8007BE992EF565E375D81502BC14BFABC81E6A287D4E1BE26823E6622578D44
            6E1A09DE3410049BC2392D20DE098877918B36BE9329D352CB3FDD0F8D08556B
            6CEEEC6F8877F63D03045572F911F90269DC845700E39368DA4079076B29A95F
            28CEE2EC8783D87A00F7EEFB845356A51089D53A410239329FCEBC7FB3F6A95F
            CAD4DF50FF6DF5DBF708F2DBE7D90BC45A00FB064A9D8150E6A0E44928698255
            C90E5E09CC0B774AEDB74FACBB75831F05B308B0F5BD79FBD224A311204E7192
            E7A18C7920EB236740098F2F1672B79AFD76614649FDE8404945BE2B215EDFF2
            A433E06EC5EB6B2474458F2FC38E3BC789CFDF9827663740DC0344598A5ED716
            7633143CA32778595BE4A6A1909B2184ECBAE1EA664AB8B9762815C8FFC29AFE
            9A377D8EFA0BEA5B00C247D6E2158C4FF2F7AB0A51D6B4F4DD32376C1157B505
            DD8DB8636C844F6A09B81B7266D973A25D1021269C787B76E21E84BF057F8425
            2CDE86DFDF047E588BFDB09E4C90CE957B528EA7B734373566977573F8D161DE
            58AEA80EF0C4A1D43976563DE19C526A73773F984FFD85C795A5190F52356BEE
            2E48CEF7B238F23407699675A8D837178875ACCFFCB0E9BFC1DF520F120962AD
            054DBC7F698C6A0088936C14D6BE20AC156926C09F87921720D94FFDF25BC080
            87F515B0BD7DFA729DDA085E73F0E459D359F1D3FBB37C76A17238A23AF97D70
            807F3EFF6D1CB1B4F6D3E7E5C181E162DCF163B79484F7190BECD92174598F3F
            D08C3FD44CE8BC3677A23507C1151E6CC9F3C08A03E500F3B7E27237E5BD6C24
            70CB007159EFD4B57D49C94EE2A995006111A02E9E2E62CD4599595A7AFCEA25
            F8E46E752F6B9C36EF13176AE472D4A52AF4F11BB795A0C19688C3DAC06D2BDE
            F37A4257F5B9B29DB9583D33C6B0084B4EB4B3D0055D91D33AF0003384A7B1F8
            BE9DC8ABFA90784B591F872C12F9C5D327D49A3A61F70C2EBF3C48F28814AA96
            03F71A0C5539C8936CD429500334B3EADFBCFF00FE2E0BCB9F03E9B56CA8A760
            9BFBD30CD399B5E92E3360EB3443357C7CF7862549BF168FFEC2CDFE096B4D6A
            60785431BD15DC173BAB987D92236F0624971DB4FDBCB740C25844491BF30B18
            ABAE4E4F7ED4C969074833AC9567085FECD00F6A2AF873E80ADBD3B040F263CE
            9012366FACC29D9C9E91C7B3D36FBA49C28DE4CBF7BC4D36B96903E1B6EC9136
            42A0089CD2143AAFC71B66CE7FDF52F89836F2B28179B4DA9EA42D2AEE5AC206
            DB6196EAEB6E9A0C53B8B06947CE45DDDC1E9C763930E1717D6D5751692381F8
            A2B139283C43DE1FEB141F14107575A20C1619768CFFA205DF714DE5E36A4EDE
            4A7BEF6E140831857B190B1DD7E6F734E40FB1123BA42576469B27DE862D770F
            247F2F5BAE33106981BCB29344A3B0CE7AF0918A5B0C70B79C2DFB955E627442
            9AECC5DC0BE02587501701D0B6C0B6857A5CD2BD766FB02F0B0F8B9BA1604843
            5D8082A7BFB632CFDABA775300795631BD6D68981595FC167E8B7A308A64294F
            7E4B97405A37E8B541D2A124D0F62740E3DA9E90798F64221B4D082D19642E2F
            7DFE3CEB8C6B03035080B4B4359BD8D3C687C957A6E4AFCFCE100DCC77154377
            02F143C02D9C8E6FC2C0404F495E4039E3EED312C9BCB46B910F94B55D55850F
            6BB286D41FD808879A0B7B1A085CD0E3F1328DC6AD5B1AE0E8AD652B2472DFF3
            833B06AAA4840996A24E94A62A93F5760C8BCB8FCAA834AD53AE94521A975119
            9654A06E54A98859579871A2032BE07E4BC62B5A9C9A04ED6400D37DECF96421
            097B35917D1A8281E6B0386B5E50611E58C11E5821BD0CF8FD4C61615612B70C
            AC6FDB84049D652E4D8FF6F66A79C701719D82984193A47B7938A184AC2D65E5
            220E98BB5CA983C2A86E803A2992DE37FCE2391879C7143573658E81BCB391A7
            407240715F9B4AC75A800A91F2A8B8E59FDCB3F9D7A907DDE7F2CA324B79BE7D
            4DAB68E2C91A056833ECAC197B0B40CE87DBA4BD45D552DB23A3E4620977E84D
            CCCFF335BD2382E9FDB0CC1E1C43C53BD336BF7C9D7F8C667D1D22086F7725DC
            44272B099AF51A08ADB0B99BD1505B375EA8D4CED85B8A3D1D795F4CCE5B9727
            DA46F4AABEA4D57629B32D822775056E1AF1785BC463C4B2A8DA96E9D1FEB413
            B9657A0D65F2354562F534A1721C678DA6D457A4C22CB77C95A344E549D1692E
            C555B842DF46D9DC188142A274214D318FBE259966E941BE688A4AB887B7CBA7
            C285028DE02166081F635E7F6358B41557B61DC2CF08D431C4596DD8397D854B
            1AE177B68FB7D716B5F76D8D2F07509370E2F328927A3641765FD8C1BC3255AF
            04D3FA1A313255CA28299033733CB3A2637571EA6E7E2307C83B19E47D1AF485
            10CAC7EF9A0CD016793306332A5AD7F49BC5E40F4EFF0EBF61F56B92F35DF499
            5F97EE173480AD0CCC1561D8173EE40384928D9A09D1F164CDD45CE5ED5111DE
            E4E66F736F4B3A8754138B364745DCCA304FC66FCCA66DABA915DE72F7A14FB6
            4559B1D0CDDC63D0CC27B0F07247AFCB19F11AE8642FE36B6A901053BE6BFAA2
            473505024C78C3AD78A2770BDCD2E7CCB00152ED63728522A8F6008E09603F03
            E8F7BCA87EC5AC0A237CF69E9C7B593ABB7AD4D7B75BCB0E56C19F77C29A9DA4
            7AB5D7D3B6A95924C66CC2160AA29A39735E0239730061192030AF12DC680401
            8E335A9C4777C08FA923CEE9099FD3113AA9CBE966C871560FE96724EFBB4BC4
            5F53F5A0B66D643A14FD961333E6820BDA9298432C56C8206EBC8439ED956E51
            5024713EDEE130DE5D20A135ABAE6B75EAF52D7A3D2403B47730EA5B2BE467CD
            E1624DA8634DA4CE1ABF5F58B7968D7E97ED9FA7FEAFB1F269CE93540FA0DEAA
            A52463C8CA8A0FB1660F7DA9856217629DD4131340E77E9CD8B230F96E60ECC9
            AED44E95B8846BF1B6D53532EA09A9AE3157BADA9077B24C1BCB79C253B76AFA
            B8AD0F8C87A6BE940AC471DD76E4BDA30FF7D6E2BEAA0164580259961C6EBB80
            100320CE9CFF8A767A02EC21CD8A9528D1E600DA024065F59DB16A0E705FEF69
            3832CE8B3C7F055B5962FFFA89FDF50457B19F70E6666320E323EBE619D455D6
            9A68B4B5152D72E7AFE55E2DC5F3589D35DBEB7B69DD015DE8554D20561FB8B2
            6BFB89ADF703E431F74EE122250C7C2E03515D00EA955046BB565A6A4B313435
            5753232EF532FA782C51834857B89CB0071947114E182CEE1A5A7AFFF40C11A4
            E2D55A1C39BB36E3E5FB4C0AF0F902807EEA45AAFBF66B51FCDFE39F530F469C
            E0A5FBBA387393DCC89ED6C79DD217926B752C6A6F51C97A675C28805B01702F
            80CC37C64995638F9FCC4FBE3893DB251D430DC8B339FCE04466C9F6F4825D99
            25DA6919D28402A58B19471EA46BE8A786F3E2C6D973DE217CD234CFD8EEF33B
            7123C9F352BCDFE5283FAFF4F0945C1425975843DC104E01A9FFC25ACB9EF815
            202C0198091ECC6331545DA6A6D94B31F9AE0C247315C26442FA0B90E3B2F2D5
            1BD51512A8084C3F5BCE330037C35ADD0BFC62DECA35C2954EAA786B5D119882
            77F7743EC42485A063887984266A7C7EF6A683F1F188B40100FB492EB3EC61AE
            5151B9B46BEA8DD8DC9D19992291F99687A20E62F3946FE73902C983C6393DE3
            8F479F8C0F196736B066BFD05896BE16CCACD5FB83BC833910FAA93BB9E6DBE2
            1FB714D1B7D59535F6999F17666ED09B41968F12DC4B182281144708E6FD2634
            2596A2792563BF5DE24DE9B4DEBC967EE6EC9B8CBA21A9B856857B09B709963C
            192388E46642C18683C9A7C8958A7169CA45856289145D99A47C31CC2318FEE3
            0EF45808ADA3B37B843933FDFD17418CB55987E1CD39921E6D42D30E1202BC72
            8FC7520C08D40D38AC7495F6FAF7424A8D09C2231D9C7D4DF0963CBE17E28ADD
            5B5488A962B47C59346D4B18D9EE3CF99A6E0E8A3765E062E6B927CD9A0B0BAC
            2CE43BBE4E4E95F53EDE4FEAE74D1D04725E6A61508124A7BB696A95158249B9
            3BC24986A7B24E9557897435F28524A9ABA352F8E3EBDC189D0B6F9E329A7B15
            D23BC0681B4C6EBEC7336BCBC8825233CB5A5203F5D88B52FF658E750A2BBF4C
            B97E1DBF4B70FE8CE5C5690F72235BF2C07A7C1D07EEBD30BA1BD4FDC4ACCDB5
            65026649C140CE3477D69827A56569E2EDD0F3E70EB82620AE1720330DD029F4
            62B900825572EE4652913C8AB2955CAC109CB4EB3AF63867D6A8587A159033C5
            9BFDC286D01F5BDA323A363A3F3131D66CF1B8155A5D2ED35E26D246177C4403
            AA717AF5189172E291F25D9A4FE08205A642DDF2623D92E2852682A3C2A2DD1B
            D5E9A8338D38A1229C593F1DDA4FE5EB2D13AAAE92EA6F1078D9A6FE69EAE3D2
            ECFBBAFEC15BF99D3B30BD40FA1867E63090BBC89F3DCC285149C76D44913645
            E2D54BAA6508859B3D92779796ADD38E8F944EC997497D4469EB9B79F5D487DE
            CC037E85FC7D6217986682290E483D6B155330FC63CB78EC47A95D599CFB41D3
            EFC34F50BF96B82E83796C78713347C66B803877276F1F1AAB9046DE72376D57
            2669AB07CA09867F026067B727B595F70CAD4CBFCDACEB964E6D154C2F89A2E9
            E14A367926DA90CB37D04BE48F45B9D2CA14D57179CED9C189B80D7BD23C8EE2
            BD38730601D40447CA885E76CBC5B41BE9045D42822435C5B006E33A5F0234E4
            078F15C8361685627DDD6B2E5FAF3D71E9D14D9F3E77BFFA53D7EB2F5CA579DE
            28A386BD2C5D5F458D98ABE46CC79B94A4D996258BD008EA9168E78B847AB5EC
            7648F263685A2F807AE19A73879CBFEE16D115B49513796E2DCD485C81AA7F9C
            16A364FDB9C443A128A38D0FE381E8E63DD8E677A343D57D835BD3FB01CC0C28
            29ACF9E9DFF355D62A2F73EC6BBCF3660D46173530BFFC5C110E889FB1FAD595
            655642FC8DF96D0153DB249CDCA59A8EBD9FBE331AB53387BA298FB6AEA44458
            2CBB0D867E7C0275522ABAF034E9D18757CF7B5BEB94FD72381F960BA47679E3
            0E50E832944299DB29C6C9651640CA8BE422D368D496DC02191A45EC22EE8451
            7ADC7EBC07289A007E01887AC71BD9AA965ABD37392E0C752038259C94B6BD94
            91F4F4F5CBDEA181F1E7C39FBF7DFABCB2F4EAED8B9E81FE77936F9A2A89E5D9
            4A09C9BE9939E6DE1997EC93319B12183C71C340DC00181003F8372772CEA6D0
            B4EE63F53164258F6C87CADA75F2D9D58259DD154D9251385D327DDDF5E4031A
            E9193C296D9C01556E3119BD6DCD6EF9FDC209CDB6683F234C2240602D2FB236
            2D7D8A8D048ACC24903B279AD689ABED0473DAEFFCACD1F47BF17382036AD89F
            64EC5B79779F626A1F7B6AB745A21F8124E31FAA6C9912086096AE104F0F74B0
            39C45DD68C0D96CFE84BAFEAA6D3E81BBC92D942CA0413AAAC71F196A9C179F9
            72A134BB6D8929C55532D159BB6E904E6C88C35826F86511552A4B9142A85EBE
            9C319FBCC3E7F3AECA45A64A6595F1A775712476F125768B658D6ECA19DB9ADC
            AD8F1930250C9B1107ADF0ED9AA9CD9A986195CC6E81E846FEA42E8EF83EFEA4
            467852AB6A324E3F392183A1BE09C5E0C04D6414EEB88DD95D58219F8A52F621
            EEB99F6B76857205F4B13770478BCBA5EC73EE01592FD9A39A053CD12783A2C3
            A815CA99BDECA9ED4E591E7954496A81F4862C0640596423B13A0958BD78F8E9
            CD998D555D3D7FA1E4B7E3C85FC5CF51FF677CBF47D59367E30E841ECE94CE13
            D80BC7B3AE0339F35B3194DA22E4BD48191265FD850C1796FDE64C18E3BB8F87
            67895E8EE4B88565BBDB08891FD5CFCC74431F7A90B03102AB9943DB7034ED8A
            5E72A26B866762BA4C366D3B0FEEB96A36A3BB55E25CC291B84CB9824A65EF48
            FD87393B41C7AE9712E182F13E9177533BD2DF06E36F80890430CFB7A1510ED9
            FED6715E6125FBBC92CDDDA32DC232B4EF6699C6E337DFCC3CDC5A045CC51D00
            83A5C3793EF7F38CEEE01D52701B29450AD104FD07743380BC08CB7E269A5007
            44F5C06EE7C22FC76DB81EBD2DB119487DB52FC71345510A4DD989A1AB66E46D
            CE2A5587E53C6175E380C14CF6D3FDB8FA174F5943D6DF09F917F0AF51BFFA6D
            757979ED5797663E06E5777026F403F86F3CF867D9855B43E3B713F1829904D9
            58CCB620BC814A521E807D07E0A611F78A613E44985B3ACC3B1B1A54C516DEA6
            92982B975EE64774292A93894F57282B93AEAD104395EA42305336F8D8FE76B8
            6BF83954FE8E088AB575B437BD58F101C93605AD585D23783671BF5F825A1E55
            869A2F6D961D1349D2A9A0420F449CEAEE92B898788450B8E14AC6091A552216
            AB7E36FB120ABD1EC39013C40CAA622BE895D271B99AB1B93AE7B2AF3E60ECDE
            8AA172A1C639235BB97CC9F06BC97CDE44E041074F4AEF61C2753F8C430E5E26
            87A484A76EB898EC1C99BAB9A290DF18FB10C8FB8448EB0D29685D9A79079EFE
            7713FCD7F02F5AFDDA7223CBDF4748C08CABAABD4F23BB9523ADC32AC9F77CDA
            D1916EAE88B4AD09846DD85CD9B454F12351875492735965EFD88FDC312DFC7E
            541E0F14AF079ADD8F0289688227B46CCACEDF1E977235C7E536C12196AA0364
            4F7AD34FA616186C0A4F29AA5F1F44303B9D7822364FF32AEE644CF68E861609
            F774ABCB697BCB6A65880C25ADA484348A5A729AAC455604AA5C5B2B291C57A5
            6E9CFC90962F9991AB7A1E7DB6BD957FB019BA1717C89EF3313CD7FA01C96C53
            4E01982143633A39024B793C32796FA4C27C09DCB10DBCD98F8C51D13B1292CB
            4A248824B9F391F67985CA18D226EF4CBBB30F6CC373B5459319DA59AD351DBD
            CC952F20092B6B29FF7742FE05FC8BD4FF19ACC192B5BF13EFDE78D39B38539E
            C8A7E15D92CE66E66D7F98AD964DDDF42063173A43343551CC33DDCA243B1A20
            2C00C425F6D461585819871F89C72D07E68E620F2CE578D808FA43F19446E554
            12246FFE06E68815261C91D3D15827B83FEEF2898CB328C6D624BA6E54CEAE92
            2A698B94FB67722ED0CA36E28B371F48BD5C56275B55297A99702ABB50CB2AED
            415E958639EA6104DDACBA01BE3FEEBA4F8E834DFADDDD196190BC499E940148
            7417F45E039F171A763D91DB0BC71956C2993A0C9016208C55F5E4B4BE2AC025
            CBD30FEB50522209A6B20FD33613E8B209799A1CA97DA2F14D5EF4B6990F2F7E
            9CF7FF33FE5FA9075BDC3730E9FA5E7EF675A1AE6FC00ADD0DC43DD647DD0F27
            E9ED4EF6A7E44BE760E413B0AA0D95BC6014742676DF61B4BB2CBA11C02D0827
            544A04A3B8428BE05E18811B897C6E68F6807CE8FD1ADED856A1D84A9ECC1121
            CC903331E812E1D8C107C7E2A81A51346DE764B7D24AF1409C935FA24110DA38
            1063F0204D339DBC2134CF34146BEA9D6E6898FAF008FADCB6348232B6CA1C1F
            2194DAC19FDA01491AE1086F8207D3F93C717CD792E06E29FC4114AEF816C938
            0A0CF3941FFF4C22BB812D779A0F357234C72DB14847232196C6902E2A903A9B
            74DC16E3271D8BB5C3B4D6F40F3157583D336098F7EDD7863E7E16FFAFD4836D
            6E2DDE676D6BB6B0F275763ABBAE73477A1790F20499D1984657778CBB412D53
            0C8DDDE67D5F9D5A20535C2C4CA64879635DBDB2EDDCB39D21E88F00661A9A32
            C879AF0AE697C7EB9ECDE39EC6E38EE5F22572FBE305034B14527B45D37A7893
            DBD892FB809461C944BA6A1A5A329A289240118CA78B4511E0F11540429F704C
            3E341E6C763D5CC943E2E9DD02E1D56C01259C01544E4F0CDF8D547EF7147EAF
            1CAEBB859C89DDECD85710CA1C17FAC903ACC9BEE4CB0F899A64BACC2E2C16A0
            AEF2A287E9E5CA56A9A157738FF9E16D9049D51B3386D3EBFBBE2C7C2FE35E61
            9504B0FA74FF07ACFE4F5813FDBFC2E4DB3731159D9BB3DA81B83E9ECCE6F8BC
            ED6149DB6F469924E4EA24527686A69B10E9F258B21C8AA0782D6D8F696C9064
            5AB500669003FD8433738427BA91FB5E29770095CD037D29163FF9FE55EFD893
            A2EE214CE3507CCD4060C5E8516CD329C6A3938523C70B468ED307F6A2EBBD4A
            8682AB4613EB06092D8F6A7A06471E8F9E8C45B3B965F3F8E6F18695C0A25B79
            324639081FD8E80B00639115A210A6AFA30ED068724928E5F272642646DE25E2
            1468F840EEA783186FA7B49B40C26B95E4CE88AA9EE91F23AB3FF00750FE27FC
            51D4FF0DD68E0F7C587EF3EA796475DFB6AC0EFEF84AB18C8A13A9C76EC5EA26
            E15462883AE159DA7104F538A2260AA3505DC67523442B356FF335CC7EFEDC37
            6CF42F60A2C89EF701C0BD09ABF8EBC01904F8FCDBCB9181A997CF582394CB4B
            8B936F86BA5B5877E85BAB15F833EE967680911547DE04076D9A8DFE09A0CFAD
            8DF67CEF659C0123AE609A5D246E573C717B1656351BAF7037613337988AE72D
            00497D5A8925B1956DAFDEBEFFC53EFF58FC7BA85F5DF9B6B2BACC3A6E1653D3
            1F5EA6D50D9860BA11891DF098A2CD0F22BC5096BE4946688C744191544CA6DA
            35E2E9DB38FB24FCCE6CB2AA306E10001316CA14843ACB99F392D0DC0B3AF215
            E6322B9A001BFC5A0DE3FB0FEF9E3CFE31F6F6FAD5EBD72F59EB1380F1066B41
            14E6F7CAB8556C733F4B58E8331CE4C91F4BD381FB64F5C0B07A0200CA27BDEC
            0C3255944C953C1873C43BD7CE24D55F206DC006D388AEEF9E9CFA413ACB93FD
            11DAF2ABF8B7500F82A5866B152A7F1EA6F9B63055DF3B7C397F4021FB1134BA
            0D99C438987AF91CEAC8832C7DC3D48474C696649C5A24DD8C0DFF7E6D316F90
            A95978E660DD235605FDCADF5ADFDBB76FABAB2A9F3C79FCECE9D39AEA6AF011
            7C91F57B3F7E8EF5B34D436388CC0128791EA49EB594142B1502A95FBB7115B8
            73EA1C8C38E64570B68D39251C5D2897D47B9E3CD0D833C85CF84BEF29B8933F
            39B07F0BFE5DD4FF1AC0D360757EBE79FD86D03278883C2891DC0B248EC2934B
            00F4F343E82BA9F88DA639D100799E1D4CD641F6297352A8DEE1272CEB5EBB88
            7F414747C793274FDEBD7D076E2F5FBC6C696AFEF677530CC65EBC52400DB051
            16D8596B1D4F73B0D6CF9965DD5C8632C7AACBC44D0059CFA4131B0F11DA41F7
            F01A14F495BF742CFF67F09FA39E1508AD7C5DCBC558FF3197175EBF7D9DD7D2
            7B81DAAD95D3C9973AC496D20B603EB06EECC21A999A0533004354D3EC246B85
            A75F4414030303ADADADA323A363A3639D1D9D5D1D9D7F5F8A383F336394D306
            10D67605FAD5BC3900FF11C87986440D6BA1DBAED09AC9CD9D6FDEBF5BBBC3C0
            F79D83D7174C94FE5D36FEF7F8CF51BF967CB1CA7640B906FFAC89F61ABE7D59
            F8F8B679702CBEA6EF2CA5431BD32994D9C3993EBC35B3A5A893556C045EAD5F
            50FFE5CB97B2B2B28F1F3FCE4CCF549457FC7DFDF41A560BBAFAB764B5F1A40D
            08670E68E2BACF915B53AA7B5A1F8D2C4EBDFD9E8EAE01F40DDFA363D6A1FD78
            ED3F82FFA4E0FC0E7CFBB2343335FCEC55FBD8930FACFB3AFD2617CF9F3F6F68
            68A8AFAF1F1D1DFDCB55FC25562626DF768E8D0CBF78B1303DC5FCC6AAD9FADF
            C1FF18F5FFFF84FFA3FEBF86FFA3FEBF86FFA3FEBF86FFA3FEBF0426F3FF0794
            3185CE6205497B0000000049454E44AE426082}
        end
        object RLLabel1: TRLLabel
          Left = 166
          Top = 57
          Width = 429
          Height = 23
          Caption = 'SISTEMA DE VIGILANCIA SANITARIA DE BRASIL - SNVS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object rlFooter: TRLBand
        Left = 0
        Top = 676
        Width = 718
        Height = 117
        AutoExpand = False
        BandType = btSummary
        object RLPanel33: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 20
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = clSilver
          ParentColor = False
          Transparent = False
          object rlDeclaracao: TRLLabel
            Left = 2
            Top = 1
            Width = 79
            Height = 17
            Caption = 'Declaration'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLPanel34: TRLPanel
          Left = 0
          Top = 20
          Width = 718
          Height = 36
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLPanel35: TRLPanel
          Left = 0
          Top = 56
          Width = 718
          Height = 20
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = clWhite
          ParentColor = False
          Transparent = False
          object rlName: TRLLabel
            Left = 2
            Top = 2
            Width = 42
            Height = 17
            Caption = 'Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLPanel41: TRLPanel
            Left = 381
            Top = 0
            Width = 336
            Height = 19
            Align = faRight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object rlCargo: TRLLabel
              Left = 2
              Top = 2
              Width = 148
              Height = 17
              Caption = 'Qualification and title:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
          end
        end
        object RLPanel36: TRLPanel
          Left = 0
          Top = 76
          Width = 718
          Height = 20
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = clWhite
          ParentColor = False
          Transparent = False
          object RLPanel38: TRLPanel
            Left = 1
            Top = 0
            Width = 190
            Height = 19
            Align = faLeft
            object rlDataEmissao: TRLLabel
              Left = 2
              Top = 2
              Width = 75
              Height = 17
              Caption = 'Issue Date'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
          end
          object RLPanel39: TRLPanel
            Left = 191
            Top = 0
            Width = 190
            Height = 19
            Align = faLeft
            object rlDataVencimento: TRLLabel
              Left = 2
              Top = 2
              Width = 109
              Height = 17
              Caption = 'Expiration date:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
          end
          object RLPanel40: TRLPanel
            Left = 381
            Top = 0
            Width = 336
            Height = 19
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object rlAutoridadeCompetente: TRLLabel
              Left = 2
              Top = 2
              Width = 144
              Height = 17
              Caption = 'Competent authority:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
          end
        end
        object RLPanel37: TRLPanel
          Left = 0
          Top = 96
          Width = 718
          Height = 20
          Align = faTop
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = clSilver
          ParentColor = False
          Transparent = False
          object rlAnexos: TRLLabel
            Left = 2
            Top = 1
            Width = 92
            Height = 17
            Caption = 'Attachments:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
      end
      object DetailColombia: TRLSubDetail
        Left = 0
        Top = 511
        Width = 718
        Height = 90
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
        BeforePrint = DetailColombiaBeforePrint
        object titulosColombia: TRLBand
          Left = 1
          Top = 0
          Width = 716
          Height = 54
          BandType = btHeader
          object RLPanel42: TRLPanel
            Left = 0
            Top = 0
            Width = 716
            Height = 54
            Align = faClient
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Color = clWhite
            ParentColor = False
            Transparent = False
            object RLPanel43: TRLPanel
              Left = 0
              Top = 1
              Width = 188
              Height = 52
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlDescricaoMercColombia: TRLMemo
                Left = 20
                Top = 9
                Width = 146
                Height = 34
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Nombre de lo producto:')
                ParentFont = False
              end
            end
            object RLPanel44: TRLPanel
              Left = 188
              Top = 1
              Width = 96
              Height = 52
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlCertificadoParaColombia: TRLMemo
                Left = 0
                Top = 0
                Width = 94
                Height = 51
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Producto certificado para:')
                ParentFont = False
              end
            end
            object RLPanel45: TRLPanel
              Left = 284
              Top = 1
              Width = 95
              Height = 52
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlEmbalagemColombia: TRLMemo
                Left = 5
                Top = 9
                Width = 84
                Height = 34
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Tipo de embalaje:')
                ParentFont = False
              end
            end
            object RLPanel46: TRLPanel
              Left = 379
              Top = 1
              Width = 85
              Height = 52
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object rlFabricacaoColombia: TRLMemo
                Left = 2
                Top = 9
                Width = 80
                Height = 34
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Fecha de fabricaci'#243'n:')
                ParentFont = False
              end
            end
            object RLPanel47: TRLPanel
              Left = 464
              Top = 1
              Width = 82
              Height = 52
              Align = faLeft
              object rlVencimentoColombia: TRLMemo
                Left = -17
                Top = 9
                Width = 116
                Height = 34
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Fecha de Validade:')
                ParentFont = False
              end
            end
            object RLPanel53: TRLPanel
              Left = 546
              Top = 1
              Width = 103
              Height = 52
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              object rlLoteColombia: TRLMemo
                Left = -8
                Top = 17
                Width = 120
                Height = 17
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Lote:')
                ParentFont = False
              end
            end
            object RLPanel54: TRLPanel
              Left = 649
              Top = 1
              Width = 67
              Height = 52
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              object rlQuantidadeColombia: TRLMemo
                Left = -39
                Top = 17
                Width = 146
                Height = 17
                Align = faCenter
                Alignment = taCenter
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Cantidad:')
                ParentFont = False
              end
            end
          end
        end
        object ItensColombia: TRLBand
          Left = 1
          Top = 54
          Width = 716
          Height = 37
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLPanel48: TRLPanel
            Left = 0
            Top = 0
            Width = 188
            Height = 36
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbMercadoriaColombia: TRLDBMemo
              Left = 4
              Top = 0
              Width = 166
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'MERCADORIA_ESP'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaColombiaAfterPrint
              BeforePrint = rldbMercadoriaColombiaBeforePrint
            end
            object rldbMarcasColombia: TRLDBMemo
              Left = 4
              Top = 18
              Width = 167
              Height = 17
              Alignment = taJustify
              Anchors = [fkBottom]
              Behavior = [beSiteExpander]
              DataField = 'MARCA_ESP'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaAfterPrint
              BeforePrint = rldbMercadoriaBeforePrint
            end
          end
          object RLPanel29: TRLPanel
            Left = 188
            Top = 0
            Width = 96
            Height = 36
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbCertificacaoColombia: TRLDBMemo
              Left = 5
              Top = 0
              Width = 78
              Height = 17
              Behavior = [beSiteExpander]
              DataField = 'CERTIFICADO_PARA_ESP'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaColombiaAfterPrint
            end
          end
          object RLPanel30: TRLPanel
            Left = 284
            Top = 0
            Width = 95
            Height = 36
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbEmbalagemColombia: TRLDBMemo
              Left = 5
              Top = 0
              Width = 82
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'UNIDADE_MEDIDA_ESP'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaColombiaAfterPrint
            end
          end
          object RLPanel49: TRLPanel
            Left = 379
            Top = 0
            Width = 85
            Height = 36
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbDataFabricacaoColombia: TRLDBMemo
              Left = 2
              Top = 0
              Width = 82
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'DT_FABRICACAO'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaColombiaAfterPrint
            end
          end
          object RLPanel52: TRLPanel
            Left = 464
            Top = 0
            Width = 83
            Height = 36
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbDataVencimentoColombia: TRLDBMemo
              Left = 0
              Top = 0
              Width = 82
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'DT_VENCIMENTO'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaColombiaAfterPrint
            end
          end
          object RLPanel55: TRLPanel
            Left = 547
            Top = 0
            Width = 103
            Height = 36
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbLoteColombia: TRLDBMemo
              Left = 5
              Top = 0
              Width = 82
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'CD_LOTE'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaColombiaAfterPrint
            end
          end
          object RLPanel56: TRLPanel
            Left = 650
            Top = 0
            Width = 68
            Height = 36
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object rldbQuantidadeColombia: TRLDBMemo
              Left = 6
              Top = 0
              Width = 50
              Height = 17
              Alignment = taJustify
              Behavior = [beSiteExpander]
              DataField = 'QT_MERCADORIA'
              DataSource = datm_RelatorioNestle.dsCertificadoVigilanciaSItem
              AfterPrint = rldbMercadoriaColombiaAfterPrint
            end
          end
        end
      end
    end
    object rlRodape: TRLBand
      Left = 38
      Top = 830
      Width = 718
      Height = 44
      AlignToBottom = True
      BandType = btFooter
      object RLImage2: TRLImage
        Left = 10
        Top = 0
        Width = 105
        Height = 43
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000065
          0000002C0802000000F349E13C000000017352474200AECE1CE9000000046741
          4D410000B18F0BFC6105000000097048597300000EBC00000EBC0195BC724900
          0010F3494441546843ED5A095454579A9E9933333D11D9A902341D8CDD9A9393
          3199CE2CDD39494685026AA350448D1A3B1EF7B4311DD3B6DA2A5B51D4F25E55
          41012ABB6C2282208B6C0A0AC82A8828B2A888228B20FB5645EDF3DFF78A554C
          9B4C0F70CEE4E3AF5BF7DD77D7EFFDFF7FFFFB8ABFD32F2668F47A1DFCE9B5F0
          81942833009512DF5081C840DD05C0E2E26B0643AF075423685D002C2EBE54AA
          F1AEDEA18E9E91CE9EE10E90DEA176B89C90B6DEC1E7BD03A30A25D424285B00
          2C2EBEEE3FEB5EBB4FB66647D0BF7FE9FFD14ED9875F9E01F96842D67C19F8E1
          0E516AD13DA2AE9A48E71B8B8BAF7BCD1DBFDEC83771945AD3FCCC9C4566CEB8
          B93366EE242252CCC4093775F68BBB7617744BA3D7BCA1F1FE6DB1C8F4EB49D7
          EA2D324B66A00DCB9FE2021240719152D8909152D9522A4B6CC3F6BB781DE997
          DAE0F5E71B8B8DAFEED55B02A90C311508E2E0366CA9B58BC4206CA915A42C5E
          C2F5FB50538B36CA05C0CF7CFD38FCCCD78FC3CF7CFD38CC3F5FB04CB452C3D7
          4CDC7BD2BD6A4B108529A27070AA8BC486ED3FC5978BC4D2C59FCAE22710FE7E
          2E770F259385D0371C004879759C9F8E05E10BAD0A1484D4914901C0FEF8DEE6
          402A4B487115505D6037049AC40661E3B0455A33FDE2F3219E809633DA120225
          538544F72483E8EA6F8505B14758002C03024E90692B447CBD786FB38CCA8000
          4266E50A2A26A570A428B0E0F843DE8625B5417CD5424DCD4CAEA709C91AFA9B
          2686C2492146FB29986FBE08B520412C05A900B104620D35CDDDCB5D8526EB7C
          8DED7123276F639AEF5247DE521A0F5263473F630781B1BD676CDE1DA239A938
          6427A82DD101A4C0A452AF1B278D5147A63AC8E8B43A102D2144CD9F8405F3F7
          A05AB026A4608602848E01F941D9E57DA20BFBB1D47D78E2412CE9003E25FBB1
          E4DDC284F2A66786DAAF8716B1091C41AA57EA74489309CE885BFF2B18F88247
          A0D742B7F034F4636A4DEFB0BC6F58D13BACE81952C8C7E17CAB1A57ABFAC795
          43E3CAE171A5564B0E0ABAA21D556986956ADDC4E16444A5EE1B52F48DC8BB47
          142F87150AD416A68966DA333052D1D0FEECC560DFC0485B57CFA3D6F6DAA647
          B76A6A734A2B2FE51547A515F8C7667B04A59F8CCAF68ACCE046669D8EBAE615
          95E71D95E31D9943A650E8019988AB7EE1995E1190C902F12184CCC32DEFF0AB
          3E91990DED3DE47C6A1B9F06C45E492FACAA7EF0A8E365BF5CA51A1D5795D634
          C9956AA51A2D56ADD1C9D51A10C8CB952A159AE9F427381B06BE544847B54AA5
          F25C5A09FD8FC16B76887EE52E58E926B66389F8D1B9702B29FBCE6FF704AEDB
          1BC83E74A6A5E325D148AB52A9FE244EDA7E2A4A21970F2B5567936E381F0A5E
          B34DFCEE66DF5FBA4BED38A2E0E402A2263C097DFEEDC6951B45BFDE26FBCFBD
          67E87F8ADAEA0D4A74E94840CAF1E0CCBF845C3D1E9A8E5D2EB1FF43E83F7DEA
          6DEAE06BEAC05D42131A3BF89938F06608D8A6BDAFD17AAED17A329D14DFA5EB
          B84BEC7D8CD6799B3A72AF573591CB4EBF59BDC7273A24AD34FE7A755446193F
          2C39BDA47E8F776C7456A55FD895E482BBD2985CEFF04C41446AE1EDBAA0A402
          59429E428966FB3A4CD9E3E3CE7EFC428109CDFB1F1DF0159B645FF12F1F0ABC
          F2357629ED06F2AFC1972A97D0D08CDF666175ADBD6413855AC33912FAD14EBC
          4731EE199145F96FDE5BEB852BB74A77892E1F0E48FD164FCE2DAF27E68D6670
          FD76E332066F295DB2D459B2D451B084C635A2F918390BCCE8980D43B09CEE49
          FB43507271A3D3F731BF80633627D0968DD9B0211093CC25D2574BACD9120A47
          4C65E3CB36480A6A1EC3B83070C19D662CB1E80896C88DCCF6BB70639B573437
          2EFF6458CEF781C9BB78B1A7C3B24E9CCB3A1D791D8BCEE045647C1398F1D5A9
          90BE6139B9BA3931C59720BEE0A31D625386CCD451C28B2834941AA00B4F2933
          67F1ACD8A2773749EA9E1BF8926BB4AE27E23F39105CD5D4F5A1BBD492213661
          8AA44925E45D12E0374833CFBFDD64E722B466E1CB98E2652C88AD200485750A
          A92E1895194061049BD2A4EB0E85A5DDAA75387CEE2D67CC06C55F10494CC55F
          3F2852E890CA4161C7F20D921B35CDE4D8F52D1D7874FAA5BC92D2DA8705D50D
          A1692539550D576FDCCE2CB9179A5A5054FBA8E076C3CD9A8765B50D99E57541
          A94571570B47C614A8ED6B30C5D71EFE253B57810D4B62EDE4B7F9784CCDA38E
          71D594738C4CAAB6604860A75FB54156DFDA479469C6D5EA0D27623E3B189C7E
          F3A11D0BA37084560CEE6EAF84BA96EEF109A5863D09ED5988AF87762E98151B
          B781C06A6291CB5992B799525B56008523B174C541DD58DF855C29AEFDF4EB50
          5347E144B5379139F9D20C2B94650D8F1B5B3B267D52EFF0B05EFDAAC5A19512
          75741ACD9BD9E389D0ECF736F1A90C9CE21268CC02E785BB1F8D0E4F2F1D1883
          7D4C1F96526ECA125058D82A37ACFE39E94DC165AADC8F477FB23F2CFF7ECB8A
          4D3E16ACB336EC202B67FEEA4D32F7937151399563246D06BE9ADE01BE5C706B
          0EE88E41A81C60199D7E60CD84364997380A5D8F4727173EF8DD9E606327D132
          3049A8C0C16DD9C0C8B4E3D16C99C157C15DB04734F0E59C921B771FC5679414
          DF6DBADFD0FAB8B52BB7B4BAB9A3B7E241736BCF604B7B775DC363145FA0870A
          B1077A4B444476E4F524C95398E44B53D2D0FA8D38C974ED690B46A0858BC48C
          213372109AADF7F84E98A4D46822522BCD20EC66E1AB368A1B0DFE4B3BAED6B8
          1D8FFBEDEE90CE51F95EBF58B3CF79E6D0968399D2CFBEE5C837B3F73C294B57
          A1080BF15550D5F83647444121FB7401B2A61B1D3CAD003307DEB6537109C575
          BFD925B5701482D95AB962B610ACCE6E3B5D66E917C9973E26B5F4E6BDA71169
          95C2E8BCA341291EA179C1498582B87CFF0B79C965F59E61295E9199C5F79F10
          7581284412B0AC2599FB21BE342390B4F78D7E234AB473F15DE2E06942134090
          6DCE0A7C9BC52F7FD8713EFD8E394B446562AB37E28DADA47E69C6356AB7E331
          BFDB2D538C8FB5BCECDFEF9DB09CC535723805A604F665CA0C58E12AAA69EE24
          B51DF1E5FA2A5FD30588C3A8E89028A3D87B7FC54D8CBB59BB7A478085A36C19
          2BC8CA55045AF64A9349999BAF9CE2068F33C9A7CE66855F293F9F571C1077D3
          3F2A57109D2B89CD4F28B8CF3D9BCA0FCB2C258C1742B6097A1051909F83AD49
          BE34282C465A00F673ABFE299E7CCBED58C43B742E851D64EC2C0ACDB81D9D59
          63C114D8005F6E9206837EA9E46AD5C6BFC47CBC3768700CD1ADD4E88AEE3FC1
          2EDEE41C39F74B868F25D0CDC4E373AAC8A1DF802FC224D9FE5476105066E1C0
          3BC04F8DBE59B3EA0BA9A563803532CCD9F5A7C94C7B34F0A5912B15A5771B1B
          9E77F70C8D76F475B6BFE869EBECEB536AAA1BDB3A5F763D6E7B79B7FE899A70
          583A3812205300806E01612A725B9F05035FE82717045818D9460F2102EB7098
          055D6C4EE7865D298BCDBC63C1F005BE56BAC91ADB07892A5AE8D2F578EC7FEC
          3B372C27E352284078DE3FB27EDF39333A6E45E7C75FBDFDE67C914E8A0A94C1
          9991ED6F69EFF76D40466441B59D3B4E71C26C7F68BB9CC1573EE1BFB4C4D60C
          9FFBCD2DC4BC006A857A34A7AC2EAFB4765C394A1669B5EA070F1A55285CD7D7
          3F6AED1E1C468570A8D2CFB1514ED823BA3D1DDA7EE5A8E391F3460C8935CBAB
          B0A6A5FC41872DCBCF9A29A132C5A169A564A57BCDEDEFB9F1F7F25367FDF8D0
          3938F4D981A8A5CE523BB65F455D1B4C1A0AAF57372D77C5812F1B17D8220961
          837D11EE9C5830A440962D5B620BB738607D98054762E52038167C3D34BB72C5
          465F73BAD08A2D861D96482584408614C843396EC5C26D5CB1FCBB8F6044D092
          C7AD9D92F89BC7CFA5E5DD6E4ACCBE0DA795E6AEAE7D1E313E11B9B5CD6D0959
          4539E50D45D54DD74AEEC00E90927FE77BC1F9CB45B5297995700C201FF32C4C
          F2A52EAB6F1627E41CF24F3D22CBF8734006E7688CB133F68BB59E3B4F478D82
          7F526B77F9249AACF3366788576C961C0DCAE247167CBC0318F1AD7CF01C827B
          7E5CCEA100689BFE675986D377314B1D71A375A70F08E2146AA012F8D2655636
          584180EA2832751699D3714B266EC5145B33312B170105824CA63FD047126703
          DB25981EB23E319529B176F4F508BF169251FA2E876F4C1799D0F9664E3C1347
          B1194D644E139262E62832A309ADD7FB9AD9E354679FFCEA46B426BD3E28F64A
          606AC9412C65B74FEC5E7EECBDE6B6DE8191E0A4A2C3E2A4736965C7022E7E2D
          BCE8119E1D91557A32E89277D8553851EDF58D3ECC8FAF6F81C73C0726F8D2EB
          E3F32A9C0E62A6F6A7CD9D04D6349E2D8DF7C196806FB0E4A72F0DD6D7D2DBBB
          8B1B6943E7FDF3A7BE7FFFF1B17FF82FAFD55FC081A71A26F67C50FEF91E91A9
          83A78593D0C2C9D78ACEFB607BC0F78157DA864660D2C44B027D5553EBD66367
          3F3F10F29B9D67DFDF1A60B701B3650A284E7E268EBEC6F63EC69F792F59CB33
          72E02FB5E71BDB0B4C1C84263421BAE5C433A6712DD61E3B11927BB9A83E34A3
          2A26A7F66256757C76754CF69D981C4250A626361BCAABCE67D7C2656737EC48
          483BF2CBEF8AC293022E5CF3BF98CF8BCE6C1F1CEDEC1D144767FA8465476456
          7A06274B2E1406A7949E0EC988CAABC2E3F3799199A1196581B1597DC3066B9D
          8509BEB4FA9EBE91FAE68EF28667158D4F4B1B5B4A1A9E3C6CEF22351276030D
          3AE4EBC734DAACCA2641CC0D9F889CB09CF207DD03E8B65AAD1AD7D63D6E27DB
          9635B554343E79663863A2B6E86D0184345ABD5CA71D908F77BC1C6A7AF6A2AA
          F1E98DEA47578A1F9ECFAD3B975AE19F50742ABCF048E0B56FFDAF1EC2D30F0A
          53F6F826EEF44DDAC64DDEE293B4C5E3E20E8F98827B8F832FE6DC7BF89CECF9
          07814203983C3CA8DEE131B94607F6D13B2657EBD470A35FAEEC1B958357EF1F
          1B1A552BC7D4EAA15130039D5C313E3A3202731D1C253DD70C2743C2C0177444
          665E018CAA5112AE9D7860535F06C06D1D508134E815402408EE96789B31B3D1
          9C28B9DFE276E2FC468F8B9B3C13DDBD12B77827FDDEEBD26E6EE21EBFA403A2
          B48358E6D1E04C8FF0ACE4BC0AA84CE82C744C080A95E012E6480AACFDD50109
          B78076BD89A91A76C3E915C9FC64C91C9336F085D60C0F043D13581EC4B86A50
          2843DC0BED88A7055324788151E116F1D1AAE07808D7936D811D9D5EA583E6C4
          BCA02F282580BA21FED0C4890E89CE75C49B241D34D12515D59BD3C000311327
          913108783A07CCCC416046E39AD0B84BD7737FE5E2274A2A4F2F46EF0B6144A2
          CF09CA5067D015D9296C75E8F6040C63A269922441A2D56AB4A06C001478C16A
          D082F470004453269ACC8D497F3F21E883C6066A662E962C3794C0A840D3C443
          9EAC80EA904411B5C872437606C8F22941DA7DADE6F13B6C3E950551051214CD
          A3DF3BE00C848E4114967895BB3424BD3CF7167A5F42323007C80E5F83693761
          BA0621CAA03B52A655990B53FE7EA1806647F055D6F46CA51BEC95643C355BA8
          2CB1DD267144564541653D6AF157D6F57F8505E70B2D9C3C5ADC7BDAF9FE5631
          0419D4B9E252D0BBE51C2C2CB3A2EAC153D48AD48C79C7C2F2859484B0019434
          BFE8FBB7DF07425C36375F10BEB3F0A0CBB79A9E42AC807C85A18FF9C582F305
          3E11BE50A66B50FEC9FE300B0646999B2FA9250317C6E6B6BF84B32AF8E6FF8F
          7C4D029136A2503AFD31D2928E8EDCB62ED8321664A6BF71969839F34F9DC91E
          51C0C118B4D2F0F3CF3C6391F085A0D26ADD3D2E983B8BD0BF7D71706B74F6F6
          2752E210EE223161F0F6FB5D46A1222825A997F38E45C417601F9E66B4CECB9C
          89993005A60CDC9C8E59D085A498D1B17F71C49D0E870EAAE568E35F00DD4258
          5C7C09E20ADFDF80ADF92268CD76D99A6DC1FFBA3DF883ED4193F2FED660F6A1
          339DA3A3C8DB4D8FF2E6118B8A2FDDE0D8705BCF4047DF5067FFC08BFEA1CEBE
          918EFEE18EBE6194F60FB5F50DBCE81B52A995289A20F7D579C7E2E2CBF0FD5A
          1015D0ABE08509BE008BCB1E173F7EE6EBC740AFFF1F11D4053A6CE8DE140000
          000049454E44AE426082}
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    FileName = 'C:\Users\programador.INDAIA\Desktop\teste.pdf'
    DisplayName = 'Documento PDF'
    Left = 687
    Top = 7
  end
  object RLRichFilter1: TRLRichFilter
    DisplayName = 'Formato RichText'
    Left = 697
    Top = 83
  end
end
