object frmRelCaricomNestleING: TfrmRelCaricomNestleING
  Left = 609
  Top = 201
  Width = 844
  Height = 706
  VertScrollBar.Position = 114
  Caption = 'frmRelCaricomNestleING'
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
    Left = 8
    Top = -105
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = datm_RelatorioNestle.dsCaricom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Times New Roman'
    Font.Style = []
    object RLGroup1: TRLGroup
      Left = 39
      Top = 39
      Width = 716
      Height = 586
      DataFields = 'NR_PROCESSO'
      object RLBand2: TRLBand
        Left = 0
        Top = 27
        Width = 716
        Height = 363
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 717
          Height = 106
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLPanel4: TRLPanel
            Left = 304
            Top = 0
            Width = 412
            Height = 105
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLPanel7: TRLPanel
              Left = 1
              Top = 0
              Width = 452
              Height = 30
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = True
              Borders.FixedBottom = True
              object RLPanel10: TRLPanel
                Left = 224
                Top = -1
                Width = 187
                Height = 30
                Borders.Sides = sdCustom
                Borders.DrawLeft = True
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = False
                object RLLabel5: TRLLabel
                  Left = 4
                  Top = 1
                  Width = 104
                  Height = 12
                  Caption = 'CUSTOMER  ORDER NO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object RLLabel4: TRLLabel
                Left = 4
                Top = 1
                Width = 106
                Height = 12
                Caption = 'INVOICE DATE AND NO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
              end
              object RLDBText4: TRLDBText
                Left = 4
                Top = 14
                Width = 92
                Height = 12
                DataField = 'CONTROLE_NESTLE'
                DataSource = datm_RelatorioNestle.dsCaricom
              end
            end
            object RLPanel8: TRLPanel
              Left = 1
              Top = 30
              Width = 411
              Height = 30
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = True
              Borders.FixedBottom = True
              object RLLabel6: TRLLabel
                Left = 4
                Top = 0
                Width = 94
                Height = 12
                Caption = 'OTHER REFERENCES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
              end
            end
            object RLLabel18: TRLLabel
              Left = 4
              Top = 64
              Width = 129
              Height = 12
              Caption = 'BUYER (If other than consignee)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText5: TRLDBText
              Left = 4
              Top = 84
              Width = 86
              Height = 12
              DataField = 'IMPORT_EMPRESA'
              DataSource = datm_RelatorioNestle.dsCaricom
            end
          end
          object RLLabel3: TRLLabel
            Left = 4
            Top = 1
            Width = 148
            Height = 12
            Caption = 'SELLER (Name, full address, country)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 4
            Top = 16
            Width = 87
            Height = 12
            DataField = 'EXPORT_EMPRESA'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
          object RLDBText2: TRLDBText
            Left = 4
            Top = 29
            Width = 133
            Height = 12
            DataField = 'EXPORT_EMPRESA_NUMERO'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
          object RLDBText3: TRLDBText
            Left = 4
            Top = 42
            Width = 121
            Height = 12
            DataField = 'EXPORT_CIDADE_ESTADO'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
        end
        object RLPanel2: TRLPanel
          Left = 304
          Top = 106
          Width = 411
          Height = 172
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLPanel5: TRLPanel
            Left = 1
            Top = 0
            Width = 411
            Height = 37
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Borders.FixedBottom = True
            object RLLabel7: TRLLabel
              Left = 4
              Top = 0
              Width = 89
              Height = 12
              Caption = 'PRESENTING BANK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLPanel6: TRLPanel
            Left = 1
            Top = 37
            Width = 411
            Height = 32
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Borders.FixedBottom = True
            object RLLabel17: TRLLabel
              Left = 4
              Top = 0
              Width = 145
              Height = 12
              Caption = 'COUNTRY OF ORIGIN OF GOODS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
            object RLLabel40: TRLLabel
              Left = 4
              Top = 14
              Width = 35
              Height = 12
              Caption = 'BRASIL'
            end
          end
          object RLPanel9: TRLPanel
            Left = 1
            Top = 139
            Width = 411
            Height = 33
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel16: TRLLabel
              Left = 4
              Top = 3
              Width = 93
              Height = 12
              Caption = 'CURRENCY OF SALE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText15: TRLDBText
              Left = 12
              Top = 18
              Width = 55
              Height = 12
              DataField = 'AP_MOEDA'
              DataSource = datm_RelatorioNestle.dsCaricom
            end
          end
          object RLLabel8: TRLLabel
            Left = 4
            Top = 72
            Width = 255
            Height = 12
            Caption = 'TERMS AND CONDIGITONS OF DELIVERY AND PAYMENT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText6: TRLDBText
            Left = 4
            Top = 87
            Width = 91
            Height = 12
            DataField = 'NM_TERMO_PAGTO'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
        end
        object RLPanel3: TRLPanel
          Left = 0
          Top = 278
          Width = 716
          Height = 84
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLPanel14: TRLPanel
            Left = 304
            Top = 1
            Width = 412
            Height = 82
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLPanel15: TRLPanel
              Left = 294
              Top = 0
              Width = 117
              Height = 42
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = True
              object RLLabel19: TRLLabel
                Left = 4
                Top = 1
                Width = 71
                Height = 12
                Caption = 'GROSS WEIGHT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
              end
              object RLLabel21: TRLLabel
                Left = 4
                Top = 12
                Width = 18
                Height = 12
                Caption = 'KG.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
              end
              object RLDBText22: TRLDBText
                Left = 8
                Top = 25
                Width = 79
                Height = 12
                Alignment = taRightJustify
                DataField = 'VL_PESO_BRUTO'
                DataSource = datm_RelatorioNestle.dsCaricom
              end
            end
            object RLPanel16: TRLPanel
              Left = 294
              Top = 42
              Width = 117
              Height = 40
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              object RLLabel20: TRLLabel
                Left = 4
                Top = 1
                Width = 27
                Height = 12
                Caption = 'CUBE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
              end
              object RLLabel22: TRLLabel
                Left = 4
                Top = 12
                Width = 15
                Height = 12
                Caption = 'M3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
              end
              object RLDBText23: TRLDBText
                Left = 55
                Top = 22
                Width = 32
                Height = 12
                Alignment = taRightJustify
                DataField = 'VL_M3'
                DataSource = datm_RelatorioNestle.dsCaricom
              end
            end
            object RLLabel15: TRLLabel
              Left = 4
              Top = 1
              Width = 196
              Height = 12
              Caption = 'MARKS AND NUMBERS (Description of Goods)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
            object RLDBMemo5: TRLDBMemo
              Left = 5
              Top = 16
              Width = 285
              Height = 61
              AutoSize = False
              Behavior = [beSiteExpander]
              DataField = 'TX_MARCACAO_VOLUME'
              DataSource = datm_RelatorioNestle.dsCaricom
            end
          end
          object RLLabel14: TRLLabel
            Left = 4
            Top = 1
            Width = 156
            Height = 12
            Caption = 'OTHER TRANSPORT INFORMATION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText13: TRLDBText
            Left = 4
            Top = 24
            Width = 87
            Height = 12
            DataField = 'EXPORT_EMPRESA'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
          object RLDBText14: TRLDBText
            Left = 5
            Top = 39
            Width = 115
            Height = 12
            DataField = 'NR_CONHECIMENTO'
            DataSource = datm_RelatorioNestle.dsCaricom
            Text = 'B/L: '
          end
          object RLDBText7: TRLDBText
            Left = 5
            Top = 56
            Width = 36
            Height = 12
            DataField = 'REF_CC'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
        end
        object RLPanel11: TRLPanel
          Left = 0
          Top = 233
          Width = 304
          Height = 45
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLPanel13: TRLPanel
            Left = 147
            Top = 1
            Width = 156
            Height = 44
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel11: TRLLabel
              Left = 4
              Top = 1
              Width = 64
              Height = 12
              Caption = 'SHIP/AIR/ETC.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText12: TRLDBText
              Left = 4
              Top = 27
              Width = 103
              Height = 12
              DataField = 'NM_VIA_TRANSPORTE'
              DataSource = datm_RelatorioNestle.dsCaricom
            end
          end
          object RLLabel12: TRLLabel
            Left = 4
            Top = 1
            Width = 93
            Height = 12
            Caption = 'COUNTRY OF FINAL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel13: TRLLabel
            Left = 4
            Top = 12
            Width = 64
            Height = 12
            Caption = 'DESTINATION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText11: TRLDBText
            Left = 4
            Top = 27
            Width = 82
            Height = 12
            DataField = 'MARCA_NM_PAIS'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
        end
        object RLPanel12: TRLPanel
          Left = 0
          Top = 106
          Width = 304
          Height = 95
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLLabel9: TRLLabel
            Left = 4
            Top = 0
            Width = 165
            Height = 12
            Caption = 'CONSIGNEE(Name, full address, country)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText9: TRLDBText
            Left = 4
            Top = 16
            Width = 86
            Height = 12
            DataField = 'CONSIG_EMPRESA'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
          object RLDBMemo2: TRLDBMemo
            Left = 5
            Top = 31
            Width = 283
            Height = 55
            AutoSize = False
            Behavior = [beSiteExpander]
            DataField = 'CONSIG_ENDERECO'
            DataSource = datm_RelatorioNestle.dsCaricom
          end
        end
        object RLLabel10: TRLLabel
          Left = 4
          Top = 201
          Width = 86
          Height = 12
          Caption = 'PORT OF LOADING'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText10: TRLDBText
          Left = 4
          Top = 215
          Width = 108
          Height = 12
          DataField = 'DS_PORTO_EMBARQUE'
          DataSource = datm_RelatorioNestle.dsCaricom
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 27
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 224
          Top = 8
          Width = 272
          Height = 16
          Caption = 'CARICOM (CARIBBEAN COMMON MARKET)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 648
          Top = 8
          Width = 41
          Height = 15
          Caption = 'Invoice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlVersaoFatura: TRLLabel
          Left = 530
          Top = 4
          Width = 90
          Height = 18
          Caption = 'ORIGINAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 390
        Width = 716
        Height = 195
        AllowedBands = [btColumnHeader, btDetail, btColumnFooter]
        DataSource = datm_RelatorioNestle.dsCaricomItem
        BeforePrint = RLSubDetail1BeforePrint
        object RL1Title: TRLBand
          Left = 0
          Top = 0
          Width = 716
          Height = 40
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          IntegralHeight = False
          object RLPanel22: TRLPanel
            Left = 325
            Top = 0
            Width = 80
            Height = 40
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel23: TRLLabel
              Left = 22
              Top = 15
              Width = 39
              Height = 12
              Caption = 'WEIGHT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
            object RLLabel24: TRLLabel
              Left = 30
              Top = 4
              Width = 20
              Height = 12
              Caption = 'NET'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
            object RLLabel25: TRLLabel
              Left = 32
              Top = 26
              Width = 18
              Height = 12
              Caption = 'KG.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLPanel23: TRLPanel
            Left = 413
            Top = 0
            Width = 88
            Height = 40
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel26: TRLLabel
              Left = 15
              Top = 11
              Width = 64
              Height = 12
              Caption = 'QUANTITY Lbs'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLPanel24: TRLPanel
            Left = 502
            Top = 0
            Width = 92
            Height = 40
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel28: TRLLabel
              Left = 20
              Top = 11
              Width = 53
              Height = 12
              Caption = 'UNIT PRICE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLPanel25: TRLPanel
            Left = 598
            Top = 0
            Width = 115
            Height = 40
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel27: TRLLabel
              Left = 43
              Top = 13
              Width = 43
              Height = 12
              Caption = 'AMOUNT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLLabel29: TRLLabel
            Left = 7
            Top = 9
            Width = 51
            Height = 12
            Caption = 'NO & KIND'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel30: TRLLabel
            Left = 7
            Top = 23
            Width = 44
            Height = 12
            Caption = 'OF PKGE.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel31: TRLLabel
            Left = 137
            Top = 9
            Width = 152
            Height = 12
            Caption = 'SPECIFICATION OF COMMODITIES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel32: TRLLabel
            Left = 151
            Top = 21
            Width = 123
            Height = 12
            Caption = '(IN CODE AND/OR IN FULL)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
        end
        object RL2Detail: TRLBand
          Left = 0
          Top = 40
          Width = 716
          Height = 20
          AutoExpand = False
          AutoSize = True
          Completion = ctFullPage
          IntegralHeight = False
          object RLPanel18: TRLPanel
            Left = 598
            Top = 0
            Width = 116
            Height = 20
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Borders.FixedLeft = True
            object RLDBText29: TRLDBText
              Left = 32
              Top = 6
              Width = 63
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VL_TOT_ITEM'
              DataSource = datm_RelatorioNestle.dsCaricomItem
            end
          end
          object RLPanel19: TRLPanel
            Left = 502
            Top = 0
            Width = 92
            Height = 20
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText28: TRLDBText
              Left = 14
              Top = 6
              Width = 64
              Height = 12
              Alignment = taRightJustify
              DataField = 'VL_UNITARIO'
              DataSource = datm_RelatorioNestle.dsCaricomItem
            end
          end
          object RLPanel20: TRLPanel
            Left = 413
            Top = 0
            Width = 88
            Height = 20
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText27: TRLDBText
              Left = 4
              Top = 6
              Width = 82
              Height = 12
              Alignment = taRightJustify
              DataField = 'QT_MERCADORIA'
              DataSource = datm_RelatorioNestle.dsCaricomItem
            end
          end
          object RLDBText24: TRLDBText
            Left = 3
            Top = 8
            Width = 82
            Height = 12
            DataField = 'QT_MERCADORIA'
            DataSource = datm_RelatorioNestle.dsCaricomItem
          end
          object RLDBText19: TRLDBText
            Left = 52
            Top = 8
            Width = 111
            Height = 12
            DataField = 'NM_UNID_MEDIDA_ING'
            DataSource = datm_RelatorioNestle.dsCaricomItem
          end
          object RLPanel45: TRLPanel
            Left = 325
            Top = 0
            Width = 80
            Height = 20
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText26: TRLDBText
              Left = 12
              Top = 6
              Width = 60
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VL_TOT_PESO_LIQ'
              DataSource = datm_RelatorioNestle.dsCaricomItem
            end
          end
          object RLDBMemo1: TRLDBMemo
            Left = 106
            Top = 8
            Width = 216
            Height = 12
            AutoSize = False
            Behavior = [beSiteExpander]
            DataField = 'TX_MERCADORIA'
            DataSource = datm_RelatorioNestle.dsCaricomItem
          end
        end
        object RL3Summary: TRLBand
          Left = 0
          Top = 60
          Width = 716
          Height = 134
          AlignToBottom = True
          AutoExpand = False
          BandType = btColumnFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          IntegralHeight = False
          object RLPanel17: TRLPanel
            Left = 325
            Top = 0
            Width = 390
            Height = 134
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLPanel26: TRLPanel
              Left = 273
              Top = 1
              Width = 116
              Height = 108
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              object RLPanel39: TRLPanel
                Left = 2
                Top = 0
                Width = 113
                Height = 25
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLDBText31: TRLDBText
                  Left = 32
                  Top = 8
                  Width = 63
                  Height = 12
                  Alignment = taRightJustify
                  AutoSize = False
                  DataField = 'VL_MLE_MNEG'
                  DataSource = datm_RelatorioNestle.dsCaricom
                end
              end
              object RLPanel40: TRLPanel
                Left = 2
                Top = 26
                Width = 113
                Height = 20
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLDBText32: TRLDBText
                  Left = 32
                  Top = 4
                  Width = 63
                  Height = 12
                  Alignment = taRightJustify
                  AutoSize = False
                  DataField = 'VL_PACKING'
                  DataSource = datm_RelatorioNestle.dsCaricom
                end
              end
              object RLPanel41: TRLPanel
                Left = 2
                Top = 47
                Width = 113
                Height = 20
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLDBText33: TRLDBText
                  Left = 32
                  Top = 4
                  Width = 63
                  Height = 12
                  Alignment = taRightJustify
                  AutoSize = False
                  DataField = 'VL_FRETE_PREPAID_MNEG'
                  DataSource = datm_RelatorioNestle.dsCaricom
                end
              end
              object RLPanel42: TRLPanel
                Left = 2
                Top = 68
                Width = 113
                Height = 20
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLDBText34: TRLDBText
                  Left = 32
                  Top = 4
                  Width = 63
                  Height = 12
                  Alignment = taRightJustify
                  AutoSize = False
                  DataField = 'VL_OTHER'
                  DataSource = datm_RelatorioNestle.dsCaricom
                end
              end
              object RLPanel43: TRLPanel
                Left = 2
                Top = 89
                Width = 113
                Height = 19
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                object RLDBText35: TRLDBText
                  Left = 32
                  Top = 4
                  Width = 63
                  Height = 12
                  Alignment = taRightJustify
                  AutoSize = False
                  DataField = 'VL_SEGURO'
                  DataSource = datm_RelatorioNestle.dsCaricom
                end
              end
            end
            object RLPanel27: TRLPanel
              Left = 1
              Top = 1
              Width = 178
              Height = 108
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              object RLPanel29: TRLPanel
                Left = 0
                Top = 0
                Width = 176
                Height = 25
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLDBText25: TRLDBText
                  Left = 7
                  Top = 8
                  Width = 70
                  Height = 12
                  Alignment = taRightJustify
                  AutoSize = False
                  DataField = 'CD_INCOTERM'
                  DataSource = datm_RelatorioNestle.dsCaricom
                end
              end
              object RLPanel30: TRLPanel
                Left = 0
                Top = 26
                Width = 176
                Height = 20
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLLabel34: TRLLabel
                  Left = 7
                  Top = 4
                  Width = 45
                  Height = 12
                  Caption = 'PACKING'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object RLPanel31: TRLPanel
                Left = 0
                Top = 47
                Width = 176
                Height = 20
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLLabel35: TRLLabel
                  Left = 7
                  Top = 4
                  Width = 41
                  Height = 12
                  Caption = 'FREIGHT'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object RLPanel32: TRLPanel
                Left = 0
                Top = 68
                Width = 176
                Height = 20
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLLabel36: TRLLabel
                  Left = 7
                  Top = 4
                  Width = 33
                  Height = 12
                  Caption = 'OTHER'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object RLPanel33: TRLPanel
                Left = 0
                Top = 88
                Width = 176
                Height = 20
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
                object RLLabel37: TRLLabel
                  Left = 7
                  Top = 4
                  Width = 49
                  Height = 12
                  Caption = 'ISURANCE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                end
              end
            end
            object RLPanel28: TRLPanel
              Left = 177
              Top = 1
              Width = 96
              Height = 110
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              object RLPanel34: TRLPanel
                Left = 1
                Top = 68
                Width = 95
                Height = 20
                Align = faWidth
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
              end
              object RLPanel35: TRLPanel
                Left = 1
                Top = 47
                Width = 95
                Height = 20
                Align = faWidth
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
              end
              object RLPanel36: TRLPanel
                Left = 1
                Top = 5
                Width = 95
                Height = 20
                Align = faWidth
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
              end
              object RLPanel37: TRLPanel
                Left = 1
                Top = 26
                Width = 95
                Height = 20
                Align = faWidth
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
              end
              object RLPanel38: TRLPanel
                Left = 1
                Top = 88
                Width = 95
                Height = 20
                Align = faWidth
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = True
                Borders.FixedBottom = True
              end
            end
            object RLPanel44: TRLPanel
              Left = 1
              Top = 110
              Width = 177
              Height = 24
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel38: TRLLabel
                Left = 7
                Top = 4
                Width = 72
                Height = 12
                Caption = 'INVOICE TOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
              end
            end
            object RLDBText36: TRLDBText
              Left = 306
              Top = 113
              Width = 63
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VL_TOT_MCV'
              DataSource = datm_RelatorioNestle.dsCaricom
            end
          end
          object RLMemo1: TRLMemo
            Left = 8
            Top = 31
            Width = 273
            Height = 40
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Times New Roman'
            Font.Style = []
            Lines.Strings = (
              'IT IS HEREBY CERTIFIED THAT THIS INVOICE SHOWS THE ACTUAL'
              'PRICE OF THE GOODS DESCRIBED. THAT NO OTHER INVOICE HAS'
              'SEEN OR WILL BE ISSUED AND THAT ALL PARTICULARS ARE TRUE '
              'AND CORRECT')
            ParentFont = False
          end
          object RLLabel39: TRLLabel
            Left = 7
            Top = 85
            Width = 229
            Height = 12
            Caption = 'SIGNATURE AND STATUS OF AUTHORISED PERSON'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object rlExportCoordinator: TRLLabel
            Left = 7
            Top = 101
            Width = 177
            Height = 12
            Caption = 'NM_USUARIO - EXPORT COORDINATOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object rlCpfExportCoordinator: TRLLabel
            Left = 7
            Top = 117
            Width = 21
            Height = 12
            Caption = 'CPF '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 688
    Top = 113
  end
end
