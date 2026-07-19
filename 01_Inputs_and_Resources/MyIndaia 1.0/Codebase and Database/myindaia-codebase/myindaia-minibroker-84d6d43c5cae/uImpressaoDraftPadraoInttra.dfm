inherited frmImpressaoDraftPadraoInttra: TfrmImpressaoDraftPadraoInttra
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Draft BL - Inttra'
  ClientHeight = 1272
  ClientWidth = 910
  Visible = True
  ExplicitTop = -117
  ExplicitWidth = 916
  ExplicitHeight = 1300
  PixelsPerInch = 96
  TextHeight = 16
  object RLReport1: TRLReport
    Left = 8
    Top = 8
    Width = 889
    Height = 1219
    DataSource = dtmGerarArquivosDraft.dtsDraft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -10
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpA4_Extra
    BeforePrint = RLReport1BeforePrint
    object RLGroup1: TRLGroup
      AlignWithMargins = True
      Left = 38
      Top = 38
      Width = 813
      Height = 1450
      DataFields = 'NR_PROCESSO;NR_AMEND'
      IntegralHeight = True
      object rlbndCliente_2: TRLBand
        Left = 0
        Top = 70
        Width = 813
        Height = 130
        AutoExpand = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLPanel2: TRLPanel
          Left = 1
          Top = 0
          Width = 175
          Height = 130
          Align = faLeft
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLDBMemo1: TRLDBMemo
            Left = 3
            Top = 41
            Width = 161
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'CLIENTE_END_COMPLETO'
            DataSource = dtmGerarArquivosDraft.dtsDraft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel1: TRLLabel
            Left = 3
            Top = 6
            Width = 48
            Height = 12
            Caption = 'SHIPPER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBMemo2: TRLDBMemo
            Left = 3
            Top = 22
            Width = 162
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'CLIENTE_NOME'
            DataSource = dtmGerarArquivosDraft.dtsDraft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLPanel4: TRLPanel
          Left = 176
          Top = 0
          Width = 180
          Height = 130
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel2: TRLLabel
            Left = 6
            Top = 6
            Width = 109
            Height = 12
            Caption = 'FORWARDING AGENT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLMemo1: TRLMemo
            Left = 6
            Top = 22
            Width = 167
            Height = 26
            Behavior = [beSiteExpander]
            Lines.Strings = (
              'INDAIA LOGISTICA INTERNACIONAL LTDA')
          end
          object RLMemo10: TRLMemo
            Left = 6
            Top = 54
            Width = 167
            Height = 39
            Behavior = [beSiteExpander]
            Lines.Strings = (
              'Rua XV de Novembro, 170'
              'CEP 11010-150 - Santos/SP'
              'Fone: 55 13 3211-4000')
          end
        end
        object RLPanel9: TRLPanel
          Left = 356
          Top = 0
          Width = 210
          Height = 130
          Align = faLeft
          object RLPanel6: TRLPanel
            Left = 0
            Top = 40
            Width = 210
            Height = 90
            Align = faClient
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLLabel6: TRLLabel
              Left = 3
              Top = 6
              Width = 116
              Height = 12
              Caption = 'EXPORT REFERENCES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBMemo5: TRLDBMemo
              Left = 101
              Top = 20
              Width = 110
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'REFERENCIA_EMBARQUE'
              DataSource = dtmGerarArquivosDraft.dtsDraft
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              WordWrap = False
            end
            object RLDBMemo6: TRLDBMemo
              Left = 101
              Top = 34
              Width = 110
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'REFERENCIA_INDAIA'
              DataSource = dtmGerarArquivosDraft.dtsDraft
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              WordWrap = False
            end
            object RLDBMemo7: TRLDBMemo
              Left = 3
              Top = 62
              Width = 100
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'CD_RUC'
              DataSource = dtmGerarArquivosDraft.dtsDraft
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLLabel10: TRLLabel
              Left = 3
              Top = 20
              Width = 97
              Height = 12
              Caption = 'Shipper Reference:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel27: TRLLabel
              Left = 3
              Top = 35
              Width = 97
              Height = 12
              Caption = 'Shipper Reference:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel28: TRLLabel
              Left = 3
              Top = 49
              Width = 97
              Height = 12
              Caption = 'Shipper Reference:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel29: TRLLabel
              Left = 101
              Top = 49
              Width = 24
              Height = 13
              Caption = 'RUC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLPanel5: TRLPanel
            Left = 0
            Top = 0
            Width = 210
            Height = 40
            Align = faTop
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLLabel3: TRLLabel
              Left = 3
              Top = 4
              Width = 120
              Height = 12
              Caption = 'CARRIER BOOKING NO.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBMemo3: TRLDBMemo
              Left = 3
              Top = 18
              Width = 224
              Height = 13
              AutoSize = False
              Behavior = [beSiteExpander]
              DataField = 'AGENTE_NOME'
              DataSource = dtmGerarArquivosDraft.dtsDraft
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object RLPanel17: TRLPanel
          Left = 566
          Top = 0
          Width = 246
          Height = 130
          Align = faClient
          object RLPanel8: TRLPanel
            Left = 0
            Top = 40
            Width = 246
            Height = 90
            Align = faClient
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel5: TRLLabel
              Left = 3
              Top = 3
              Width = 157
              Height = 12
              Caption = 'CUSTOMER SUBMISSION DATE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBMemo4: TRLDBMemo
              Left = 5
              Top = 16
              Width = 100
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'CD_RUC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLPanel7: TRLPanel
            Left = 0
            Top = 0
            Width = 246
            Height = 40
            Align = faTop
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object RLLabel4: TRLLabel
              Left = 1
              Top = 3
              Width = 148
              Height = 12
              Caption = 'SHIPPING INSTRUCTION NO. /'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel61: TRLLabel
              Left = 3
              Top = 13
              Width = 73
              Height = 12
              Caption = 'REVISION NO.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBMemo21: TRLDBMemo
              Left = 5
              Top = 22
              Width = 100
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'CD_RUC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
      object rlbndConsig_1: TRLBand
        Left = 0
        Top = 200
        Width = 813
        Height = 119
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLPanel10: TRLPanel
          Left = 1
          Top = 1
          Width = 175
          Height = 118
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLDBMemo8: TRLDBMemo
            Left = 3
            Top = 18
            Width = 155
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'CONSIG_NOME'
            DataSource = dtmGerarArquivosDraft.dtsDraft
          end
          object RLLabel7: TRLLabel
            Left = 3
            Top = 4
            Width = 64
            Height = 12
            Caption = 'CONSIGNEE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel11: TRLPanel
          Left = 176
          Top = 1
          Width = 180
          Height = 118
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel8: TRLLabel
            Left = 3
            Top = 4
            Width = 75
            Height = 12
            Caption = 'NOTIFY PARTY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBMemo9: TRLDBMemo
            Left = 3
            Top = 18
            Width = 155
            Height = 13
            AutoSize = False
            Behavior = [beSiteExpander]
            DataField = 'NOTIFY1_NOME'
            DataSource = dtmGerarArquivosDraft.dtsDraft
          end
        end
        object RLPanel12: TRLPanel
          Left = 356
          Top = 1
          Width = 210
          Height = 118
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel9: TRLLabel
            Left = 3
            Top = 4
            Width = 156
            Height = 12
            Caption = '1st ADDITIONAL NOTIFY PARTY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBMemo10: TRLDBMemo
            Left = 3
            Top = 18
            Width = 224
            Height = 13
            AutoSize = False
            Behavior = [beSiteExpander]
            DataField = 'NOTIFY2_NOME'
            DataSource = dtmGerarArquivosDraft.dtsDraft
          end
          object RLDBMemo13: TRLDBMemo
            Left = 4
            Top = 37
            Width = 224
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'NOTIFY2_END_COMPLETO'
            DataSource = dtmGerarArquivosDraft.dtsDraft
          end
        end
        object RLPanel13: TRLPanel
          Left = 566
          Top = 1
          Width = 246
          Height = 118
          Align = faClient
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLLabel62: TRLLabel
            Left = 5
            Top = 4
            Width = 159
            Height = 12
            Caption = '2nd ADDITIONAL NOTIFY PARTY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object rlbndContactParty: TRLBand
        Left = 0
        Top = 319
        Width = 813
        Height = 30
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLPanel19: TRLPanel
          Left = 1
          Top = 1
          Width = 175
          Height = 29
          Align = faLeft
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel11: TRLLabel
            Left = 3
            Top = 3
            Width = 92
            Height = 12
            Caption = 'CONTRACT PARTY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel20: TRLPanel
          Left = 176
          Top = 1
          Width = 180
          Height = 29
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel12: TRLLabel
            Left = 3
            Top = 3
            Width = 84
            Height = 12
            Caption = 'FREIGHT PAYER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel21: TRLPanel
          Left = 566
          Top = 1
          Width = 246
          Height = 29
          Align = faClient
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLLabel14: TRLLabel
            Left = 3
            Top = 3
            Width = 43
            Height = 12
            Caption = 'SHIP TO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel22: TRLPanel
          Left = 356
          Top = 1
          Width = 210
          Height = 29
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel13: TRLLabel
            Left = 3
            Top = 3
            Width = 140
            Height = 12
            Caption = 'MANUFACTURER/SUPPLIER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object rlbndLocalEmbarque: TRLBand
        Left = 0
        Top = 415
        Width = 813
        Height = 45
        Margins.BottomMargin = 2.000000000000000000
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLPanel23: TRLPanel
          Left = 1
          Top = 1
          Width = 175
          Height = 36
          Align = faLeft
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel21: TRLLabel
            Left = 3
            Top = 4
            Width = 137
            Height = 12
            Caption = 'PLACE OF INITIAL RECEIPT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel24: TRLPanel
          Left = 176
          Top = 1
          Width = 180
          Height = 36
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel22: TRLLabel
            Left = 3
            Top = 4
            Width = 78
            Height = 12
            Caption = 'PORT OF LOAD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBMemo16: TRLDBMemo
            Left = 3
            Top = 18
            Width = 175
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'LOCAL_EMBARQUE'
            DataSource = dtmGerarArquivosDraft.dtsDraft
          end
        end
        object RLPanel25: TRLPanel
          Left = 566
          Top = 1
          Width = 246
          Height = 36
          Align = faClient
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLLabel24: TRLLabel
            Left = 3
            Top = 4
            Width = 108
            Height = 12
            Caption = 'PLACE OF DELIVERY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel26: TRLPanel
          Left = 356
          Top = 1
          Width = 210
          Height = 36
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel23: TRLLabel
            Left = 3
            Top = 4
            Width = 110
            Height = 12
            Caption = 'PORT OF DISCHARGE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBMemo17: TRLDBMemo
            Left = 3
            Top = 18
            Width = 165
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'LOCAL_DESEMBARQUE'
          end
        end
      end
      object rlbndOriginOfGoods: TRLBand
        Left = 0
        Top = 379
        Width = 813
        Height = 36
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLPanel27: TRLPanel
          Left = 1
          Top = 1
          Width = 175
          Height = 35
          Align = faLeft
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLMemo11: TRLMemo
            Left = 3
            Top = 5
            Width = 166
            Height = 27
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Lines.Strings = (
              'POINT AND COUNTRY OF ORIGIN OF GOODS')
            ParentFont = False
          end
        end
        object RLPanel28: TRLPanel
          Left = 176
          Top = 1
          Width = 180
          Height = 35
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel18: TRLLabel
            Left = 3
            Top = 4
            Width = 80
            Height = 12
            Caption = 'TYPE OF MOVE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBMemo15: TRLDBMemo
            Left = 3
            Top = 18
            Width = 150
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'MOVIMENTO_DESCRICAO'
          end
        end
        object RLPanel29: TRLPanel
          Left = 566
          Top = 1
          Width = 246
          Height = 35
          Align = faClient
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLDBMemo14: TRLDBMemo
            Left = 3
            Top = 18
            Width = 92
            Height = 13
            Behavior = [beSiteExpander]
            DataField = 'VIAGEM_NAVIO'
          end
          object RLLabel63: TRLLabel
            Left = 3
            Top = 5
            Width = 145
            Height = 12
            Caption = 'CARRIER, VESSEL, VOYAGE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel30: TRLPanel
          Left = 356
          Top = 1
          Width = 210
          Height = 35
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel19: TRLLabel
            Left = 6
            Top = 5
            Width = 84
            Height = 12
            Caption = 'SHIPMENT TYPE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel20: TRLLabel
            Left = 3
            Top = 18
            Width = 125
            Height = 13
            Caption = 'FCL (Full Container Load)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object rlbndConsolidatorStuffer: TRLBand
        Left = 0
        Top = 349
        Width = 813
        Height = 30
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLPanel31: TRLPanel
          Left = 1
          Top = 1
          Width = 175
          Height = 29
          Align = faLeft
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel15: TRLLabel
            Left = 3
            Top = 4
            Width = 131
            Height = 12
            Caption = 'CONSOLIDATOR/STUFFER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel32: TRLPanel
          Left = 176
          Top = 1
          Width = 180
          Height = 29
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel16: TRLLabel
            Left = 3
            Top = 4
            Width = 56
            Height = 12
            Caption = 'IMPORTER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel33: TRLPanel
          Left = 566
          Top = 1
          Width = 246
          Height = 29
          Align = faClient
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
        end
        object RLPanel34: TRLPanel
          Left = 356
          Top = 1
          Width = 210
          Height = 29
          Align = faLeft
          AutoExpand = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
        end
      end
      object rlbndDadosIndaia: TRLBand
        Left = 0
        Top = 0
        Width = 813
        Height = 70
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel25: TRLLabel
          Left = 4
          Top = 4
          Width = 190
          Height = 15
          Caption = 'INTTRA SHIPPING INSTRUCTION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel26: TRLLabel
          Left = 5
          Top = 27
          Width = 181
          Height = 13
          Caption = 'SHIPPING INSTRUCTION CREATOR:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel30: TRLLabel
          Left = 4
          Top = 40
          Width = 212
          Height = 12
          Caption = 'INDAIA LOGISTICA INTERNACIONAL LTDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLImage1: TRLImage
          Left = 548
          Top = 1
          Width = 169
          Height = 68
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D49484452000000A2
            000000400802000000161C3BC5000000017352474200AECE1CE9000000046741
            4D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA86400
            00372C49444154785EED7D079C1D55D9FECC393373FBDEEDBD97F45E20900609
            0955A4891401012B6241055101515011411041AC282845C48040282181001142
            020112D2369BEDBDEFDD5BA79CF37FDEB99B641350FC2BF8F97DBFBCDCCDDE3B
            E594B73CEFF39E397751A594CA61F9BF2E6CECF761F93F2D874673C2B204B31A
            13ECC1E6EEC7FA52CD1123257C822B2A93CCB1431EABC66B4FF2F2B9B9A109D9
            C1DAA051C8558FB0E93C3C86294295AAC21D95DC477504E77CACDDC3F21F1455
            55C7DEED9343CD1CB7A24F7758D76FED6A902147711C2184EAC57D8A604CF108
            6672C534846D3BBEB01C2DE59169F9DEF9C5594715655779D4A0E230A9688A2E
            54D5A186550FAC7F58FEE3F2FE667E7178F492E79B9A793662533055485B417C
            2ADCB59AC4FDAA24CB091CA34F1CEF3C221572A273B2D90925198BCBC2E53E16
            165293366CCE99FFD00E0FCB872FEF6FE62B5FDB7B77A737A101772D47092952
            28AA0D332BB84A4DA94241BC02BF2542960C4DFF288873C13421744584596271
            8E3CBD22F7C8FC50D01039AA71D8CCFF79797F33CF5DBFF39DA14C4BB3B9A33B
            8A47AAA6C22C32335DEAA8C22B755565A6B47110484E0959151C295968968AF8
            3799EE68428F4C32ACD38B733F5E935DEE31BC8EB0E13712B18F2B91C691E881
            EB87F1FCC392F737F3C4B5BBF746FD92AB8A34044EA5E3D50567433A5C89E72A
            B1237D862F1474986A0A319A32BBE3A9FEA48C4A4F82F96C4D03C6339B336132
            16CFD393C714FBCFAB2A5810E43E957115E0EFC0C0C07B7ED8CC1F9ABCBF9997
            AEDFF972242C19E7A05F0AE01A4168206E41B36B64F43353C3CB2BB34B390F21
            6B2343D34B2485EC35E58E11734BEFE88EDEE8AE21BB5BE571C3AF7083DB8E60
            76A6195B96E33F7F62F69CC240A66A19701B4563698478D7800ECBBF2FEF6FE6
            2FBDB1E7171DBAC502DC490AD5911236D65511AF6023772CAA5E9EE1F1523C6A
            0876DC46774A09D4C62F04A9A3A871C95A92F61B3D23ABDB86370D3BC3423799
            5F489DCB7848C41666EB974CC85D9A1F0809C4334B8BDBED61F920E5FDCDFC70
            67DFA5AFF5C5B43C2E123683357D30A421863E566EFC7C56995F0A87332EC1C1
            71178818D8B7449E85D1C8DA78033E0E2C579CA86AB4C6C533ED03CFB58D6C19
            D1637A504A1B893CD34E2DCE362F9E5AB02227A4211970EA03C348F77EE0DD61
            797F39C870644AD21E1D7C37EF39D4CCCD56E2DC67DA37CB0CCDB6525E068865
            4A3220E2374D0B5C5253A401C7B9A2C1B08A69AA5E14D53AC0DBB5B12381C2C8
            BA36AC8F6A5B911C14DC745453179B07130FED197AB1DB1A50BD4989EC6D86C4
            E83179EA67A715CFCB0C791513F95C285C72F079A1216B1F36F5DF17A90807B4
            9702CC029D1D673C4610A9C234A8638DB163FB845F7FFDF5636F5DD1153960DB
            7F1B302DD5436DE216C5822F1C57E49D97E9E1C8D730A6CA1C85EB222515BB53
            E52F8E24D6F5465EE8E8DB3212DF93B2A3386F780C263DD2B2349EA18A1A8F7A
            5C49E6D2D240961AEB890C0FB3409467D7273DCF36F70F0E8F966606033E6E73
            4B571C2AD5193B6CE67F20B02BA3C042A98200650A2D63405FD099E0D201B9C5
            11E870ECEA7D7268343B66AA5E28E7AEDDB3DDC99342388C6B3209C6F4955A79
            FD947CAF6D23CF2A52B7088113AF45F4EF6C6CDC1AF399AADF213F833F395C4B
            E6CAF894B036B3286B4541464D862F8B49B7CAB66D556DB1F9C37B7AFEDA38D8
            60054D2328B544B11DBFB83A745E6D41B98E224D688A1769616C3487E56081A9
            1079B02DEC309C48A5848D8F63E7E8142A22E458519A953576689F1C6A665324
            1DC97FDED07DFD3BC9A49A65EB8E6E272D163A3ED4F7DBA57579D2E2C054A93B
            C2EA53C5A7D6B63D97CA44354D4D003F10EA82E30E8701BAE10776C01AAD0828
            2B4B821F2DCF99E8D7BD289C553525647FCABEBFA5EBDED6D1AE7898E09DDB93
            FDA92F4FCA3FB92498A182E069E9C11C9643649F99EDFE983CF7B3DFED1D9108
            ACB1532A50D009F0C439A72DBBE293A7A60FEE9743413B256D43F0D2ECC0AB9D
            C39DA65FB024ACA0097F343EB0B424540A307639367ADB9BB06FD93610E3414D
            49A26786E4AC23C726198B1932A95916133CC6437D4E70F3A0F3706BDF2B0331
            A9E9255E3D83A93E4D3B322713B6379C44C3E8684CE83DB6B6BEBD7F4F4FA422
            3B9C6970247687AA3500905BB729F02460411AA03E78A11E3025613B52B58858
            52F14000E48E21450C13CE4C153FA1E3BF210835425B61428948B148A4FB3BC2
            11D4AF78AF224BFEA3996244CEFA2D8D7F78627344682947A61C6554B084700C
            35FEE9F3565C7AEE4A831D1A278746B32D4D849723E2AB87D4CFBFDC35ACEA52
            33A4A33119BFAC92DD38ADC4031A06453872AB691FFF4CDB10CBE36CD8D17C5A
            52F5B2DE45D99E638BC385019FA6B291A4D9124DEC1D4E6CED8D774BBF507C8A
            EA5405AD73CBFDA75765E71BC22F9DC737ECBE657DC3F68104260C47F1D84A9E
            327A64BE2F4F175FFFE2F9D9012150A28FADB55A0C15FC876366E89741EDC27E
            7D57EB7DABD68179A48F83E340FD16534E5B3A63E5D173B8AAFD9BC4018D592A
            674EB2A573F8B6DF3D26F6712540215EB62ACB0A825FB9E474BF66B80FF90E15
            D7ED2CC5115FBBE5E147D6BE23D114D88CAAA48419F458D75DFEB18FAD3CC20F
            424B8A3A48DE6DE694AD18BA484625BB797BE7ED8D8E25B36D3D6A586A81341F
            5E5934DBAF33019FE64DD2397B75FD5B30B31217AACF6BDA179525BE3EB7B208
            9D806923CDABAAAD3A51451B906C47F7D04BDD032F768BC644A6A2444B8CD18F
            D7E49E5A95FF8BDBEF7BFAF9BDF4380B5340E40AD46A1AB7A5373774CB8F3EB3
            B4D493C93494E3B002971F6291EDEAC03615F58E079EBDE3BE176895D73D4E2B
            B30014357EF7F59F3861C15406B5FEBB7E96B490B81CE591675EBFFAA7AB50AD
            A48FBADD21B3A64E59527BEB372FF593EDDEA32332B3B44693CEB2F3AFEB8D30
            AE4AB7053BDF1FBFF1CA8B8E3B7286A1BA5995E8F34172A8E298A2039615550F
            29F69726942CC8B6841ED36C5AFDE866C19FEFE81C54B9EDAA25475317E61A86
            884BA9A90ECAA0E429D585E5326EE00346C9E0F942B7D56C21EA54715251F886
            D9E57F595171F7D1C68A1C7534EEBF6347E233AB773D551F7138E7424346D76C
            4D95B809DA96DD392557BCD67EE3B6A1261B706493BFD213940F4BE05F04A50A
            DBD1D069293EBC45558817B01AFF7A6462466DA9264045C97DFF3D812FABC8A3
            6FD7B759D25DFADDD70B6A512ECDA9D5255E07519D76B3770B8A55F9EA9BF5FD
            510C986A1E2EE22521E727D77EF6F8A3A67A353066F751F0BBE4503303913599
            025409E60BEBF2A6D9953562C8513D806DDB90ABBBD4F5ED7D549A311990CE89
            130A0256DC816D68FD32113200E8D407651D94CF52824BB9E1400FAF7C52AD50
            E4D979819F2F2E7BE884D2332A6424369CEC4FA94EC2E296006B037652F96D30
            8707B2333BBDD9BF6EB42F5AD7F07CBF95921E17C40E993C3EFEBD23EF3E9596
            F4F1434EB98829415F45D39E66D00257104CF492D2C9CE0E65E764D94CDF0FE6
            EFD98A2B7FE7F03E915257250A5CB9A3B109FEBDBF179C22DF52C484C93570B1
            F4B5EEBF24FB1B85E211406B5FDCE4280686EC485953E0FBED4D972F9A5185A4
            033C84FEC914EF924329184405AAEC73BA4255CDCDD63774F62664B622CD1437
            DA3ABA8F28CFCA25F6C0F3FD7CC7707C8F6DA00EC304E66639D3330270311032
            461C1025B096661310209ECA34C6784055CB3C0C293C2F157FF9B94D704B9CC7
            3C8833D25B7C885D7AF6514273DAA5AF5D78D7B7454692C949397EAFE270C701
            AE802C41FBF458455AC4CD08F1118B8E035FA74F6884089CAB1AE270FB04D7D8
            128C0A959F80AE7101DD2D403414A8D86AEF8FFFEA4FCF5BB875BFD0B8B425B3
            8B3F72CC11F4AC856A0A0AB4343D746FC76FD491342829106938439FE93EF72C
            BD54E4308C1942DD81618DC4E43D0F3EE5D88E8F2B1E2EF14280305D6678E4E7
            2FFC48D8A723304825B0188C4FAC8D5A43794BB4486153EBAACE5C31F7CCE533
            4F5E3AF993672FAF2ECB43918BA29722817482747D68457A686E1EFF1177988A
            65DBFC57F57DDF6D88C455037DEB32705A70F4B685953ECD4406DB18572F5EDF
            D0611538BA797CF6E81F17D486A10B4608AB49FE77090B714DE7AE3FBF70DB6F
            9E77280BB96A7105DEC3D4A1B50F7D5F867C77EF1C78B87E6450CBE42C71842F
            7EDDACF2F9B93E9DA6CF34A46A32A69382C12537E326D46118BA613028490331
            A0CB002DE3CD4CFDDA8A9D223BE818413291F47875BCE094BA34D76E6EBCE45B
            F748CD0F681CBBDEDDFCF4E50B8EF8F2274EA186C6250E6A1F064009A97047B2
            84655B960D53689C1B9AE6A1C53C80328641E8EA6EC920C8B314C5009531F5C1
            A8435BABF64F9B0C4A019111D6A4E4062627A93EC688C13DC957A46609B4059E
            2A5329C7B61DA22AAAEEF52217DB806A427052243C49E3FF5F6626FF544CE688
            1EC5FBA36DADF73439095F48332D8F6D7F7D32FFFC84FC2CA94434FD9E5D5D37
            ECB0235E2DDF8AFC6669F98A0C031D2719F74AF4F7F7CC2C13427CEDA6DF3FBE
            BE999E51A767E48AC58C922CFD993F7C330CD509E3B981E465773C114DF9194B
            545A899595C10C284DCA734E5B5A529CBF797BE3136B5E7D736BC348CC81B36B
            BA5A525CB072C184B34E3E363B68C04F358D80313D295B58B62A3AFBE3ABD76E
            DEB069576B47B769A5C0EA0A0BF3562E9E75FEA9C7DCB7EAF9DBEE7B51A870A4
            03395857ECBB6EB8F084232653FA41BD899052293745E2D66B6FD7BFB57DCFCE
            BD9DEDDD0351D8D946340BCE38D84D7666A0AA346FFAE4EA658BE6551766E9B4
            DE000C70EDAD98AF6C695CFBDA3644117872BA17623352CC9B5876D2B2397074
            371E2DE8DF963C29B5A6F6BE4D5B766DDBD1DADCDED73310B12D09E002EA69DC
            F17A585141B8BAAA78C911D38F9E3DC9EBA1DCE6618752B07F68660CCCB1935C
            D8424D58FAD56FB4FDB947B5184AB5405889FC7476C947CA3D3EC97A157EF586
            FA558321B4B5303B75F7A2AA0A695B1A40081E7DA85BA505481417F2D44BBFB7
            BB138938469B0DF695F91EC58ED6D61C7FEEF197CD2D9AE853067B473E7AE98F
            BB44D0E7A4C02A3D4E1CD113D292F7DCF1F507FFB27AF50B6F5B2288821DDC83
            D0070356A52E12736B737E73CB95612F18093C8D5802E22CE1C85F3FB2F6FE87
            D7F60EA342447587F801EE60C22041A905538A15EE7B755B175DBDCFE930A690
            663D7ACFD5130A334034E02852E16DFDD1FB57AD7B72EDA6AEA1A4CA74B80502
            685F464CDF88C96030B6C6A557939F3E73D967CE5911F6201629D8924CBDEEB6
            47EF7FF64D588A8B31FDC068B0EB372F3EEE73E72E8237D9484F8A9272B4E736
            EFBEE7CFEBDEDEDE0C02E4E062463B37DC029352214A5F3409D810B6A52BD694
            9A9C1BAEBE684A659E9F8F11F8FDF21EB979BF50BA54B9A6D256011F97B38B42
            7BBA7BF75A011BD986199BBA46A7E6EB355E94CBF6A482ACCDED23EDAAD13FEA
            E4E98979E110744820B5BF04A22757F8B53FB865E7E0C82F1F5897740CC92C5A
            89DD774AA856C1F4A9DBB4AC75AD7D1E7F68B8A3EFE9B55B1CE811C947A6E0FD
            36F778BCEA96779A37BCD162711F0C8C8C48EBE1945FF1AFB4B4506FFF707176
            60E6C40A6AD14DBD91A473CD8FEEB9FF8977464DC3D190092D5A014626135028
            B399BFAD2FDADD3B42DC92D0EF80994BF3BC979E77BCD7CDB229A1AD7F6DC797
            BE7DE786B73A22290317524604C82A96FB925C080355A404B6131B412EB56CF6
            D6F6FA82FCCC6975657029478AA4C37EF387677BFB89B7731A33BD306FBFE27C
            FAEC6515C5D902D6970C5CFA7BB73D74E7BDEB5A7A2C9BB6F1905535C42A5239
            B01B6F043C180E8A29A03390EC40EF5062EBDB5B4F5EB93068E8E9F1EF977D66
            782F61B434899484980093D24AB9F2C3C5350B030950065BE8AD5CBB7263EBE6
            282046D6E8DAF7161454CBFE8411BA6B6B6C5D049534A8335433A6AF7DB1BA5F
            9CC6F69E515303F121C43E607E78867ED5CA09372DCC65AAF3DDCD2D37AFDD46
            4644392898831A4D728F6D46E3DA8EC67ED8833BB666DB983CBA715F0845C61D
            D366C16DBB9AE06444CDA49DB49D6B7FF2FBC75FD99B228E6641DB684D308F40
            34A8C001D5B091DA01C5405653D08103E3995053E8E5CCB181A1CE331BB67DF9
            FA5F758C785074C13012DA9706D4833221E817012FB2ABE3D02E397719871E2C
            407B3C21BC7F7EEE15502FD2A4BBB2DFD0DA6E71840A6140FA85697BFC4A4D45
            2E280DDC6E249EBAEA07BF7A64FD8EB830C8775DFE21550F98A3A198D941C072
            8AB8020C8C215203E080493458DF3AFADA5BF5E9918F977F64E6F142A396BC86
            ABB72C2A5F1488C1E1E056ADA9822F6F6CDB9CD43DB658146237CE2BCE97FD9D
            3C70F596A1DD09746C124374D3804B350FE80ED0B77D77333DCF24EB1C2401A6
            1C559AFDB112EDCE95934ECBD39BDB876CE6454E133C49EC5DE196A2C1505183
            8F169746AB26C6BC2168EB60A15E1389242E473D0AF2F2C853AFACD9B0C34242
            182F0E0FEACE85A7CEBFFE8BA79E7DE274BF063287F6A19071CD4939ADB65A80
            89EABCB17DF047B7FED1127E7806DC4E820C2141A8D1150BCA1FF8E957D6DF7F
            E3FA07AFBBF78ECBF23375B7F61B2F6A7B5B2765029779EF69EE4C5A2EE122C5
            EC13290A7333B233433406A9FCF2DEA736BEDE084E09FB931A550B289CE34F7E
            FBCBC7BDF0E095CFFDF1EA350F5E77F119D335A2740709AEEE68EF1CFB304EFE
            5933032C008808BD699A73E782AA63BD831EF000A6EC88F9BFB1A1E32D617361
            9E9497FD9D39D9413ED834EABDFAD5A6B6A401C662222B92971C2428ACB7D7B7
            29149D502A4E1E389F99AB850BF274199AE7356E5A58573DD2E868C3364729C5
            5D0BA022537C2C5EBE68BE76CAC9E6492729732627E8D1D63821E772B273C254
            462AB27FD4FCC5FD6B1200C583C5AF0D5DF3E5D3AFB9FCD4F34E9D73ED15E7CC
            9F5EE9D621E884EE4A5F83A89E525B064A05B08D4406CF3C7DE95927CD5AB9A0
            F8A8C9D9134B7C456171ECECD29F7EF3E28555A15C8F96E7E3474C289D3BB994
            C12DF6499AEBB886A739C24D77D4B7C2E1C87EE3889EAA38936A4A340E826747
            E3B1A2828CF3CF58FAD1636A97CCCA9B5257989F1BCAF1A66EB9EA824B4E3AB2
            349491EB31CAC2C133572CDA9F5CF60BBAA34CF22EF9679F050184E17D941584
            51ED4DFD6C51DD351BEA1F4F8550FBBD159597BDD276F7511533BCF65945B972
            16BBE6CDDE17A3E1AB3635DD7E7465B68EA28EC0D4ED1D3F3432D4AA7B1ABB08
            CAC9247468FFD0A6D45579917F29B094D11173B03FCE845F4304031A6916C0D6
            E4D2B915177FF6B8EF6DDCB3197CC69B4174986CE30A35447E55525288866D95
            3DBAE6A58E21D063400295D4698182E64D2EFBC8D2B91E09C831BCAA04C3407D
            EA5680634DC13F0D834FA82DC2F8E1E373A754CE983A91D6F7A81006A8C8482A
            3912896F6BE96EEFEAED1F8999A3F168DC7A634F0739E4BE9E48E9AA2C2A2A44
            BB780B1EB77B6F07801D172037BBE0E15EA62893EBCA914DA02A8FA15F70E612
            A03D98139CC476C0C59CE1582C1EB75E7AA3B17D6834361289C6EC8696FEF462
            D43E190387E2A222F7F741F2CF9A198345F94D4BCB94AED52A4DDE7AF444FB8D
            DD4F8FA849CDB325E9F9CACBCD3F5E5239C3C7CE290EA614FEBD2D03CF0E6B5F
            DBDCF4FDF9B595E04D344B4A2FAA62227BF647ACA6EE01C1FD4887B40080725C
            3896E2C7A466571683BD61FA80E8ADF52D2925885BA173388A80318499E29EA3
            674E3F222C7FB16CF2F737B63D13E9352C2A2FDC6192CBA0315D26A7D696A08D
            94A3AC5EBFC9D474C4093C84CA5725A5089F509227AF98EB3530170DB79896D8
            DBDE056AC6508E221DA982036015BDBCC09B9B19A40298029AA3B84276EC1A4C
            BCF4DAF64D5BF7BC55DFD63B381437D1003D2A3044CA621E9BB6C7ECB73204BC
            499952594C4B09B69A54E4B68656A2F71052BE0022625086B4A7D615826C684C
            A5671BE4726A42C8B77637BEBA69FB966D4D0D6DBD9108D210AED540297016B3
            A3FDD3FBE64D6EA9AA86AE4EA828183B304EFE59D02633916B524D4E6B5B4C66
            79C56D474EF9786ED2278615C7DA68E75EF142D396D198C2D9C5C5FACDB3F333
            35F974AFFEED0D7B9B51D202B6A46573CB641A88EFDE86269B1EAD60D0E4EDF4
            0BEDD33A8239755235264B644A683BEB5B5CD4831F1003A6472FB4EA62B3A26C
            445A9D66DE7A54F9ECE428B8C1D828D32285DF5027D5940B21FB064777377690
            6792E6713750852602B67AE4BC193808AF40961C1A8D77F60CB9E180F3B89886
            832A012AF3A0185751519A96E27DA72DFEF51F3F7CF2A5377EEB8EC756BDD4D0
            D8118F247DB612B015C3567C96EA3115AF80B3827A1F1002E7A9132AC89A8C45
            1366736B97DB8BDB1BFAC1058AE2D3595D75058D4E3AD0ED88D0FEFCDCE6733E
            77F3C55FFADD2FFEB871F38EBEAE881E53C349164CA93E8B193663D0A47BEB7E
            C107919DE12DC9078F3B54FE59331F2260BC0693A53C75C311D5E7576464A662
            2837B638FECFBF3AF04A7F0AF63ABD4CFBE9BC8202CD7A321AFAC2C6BD8D26D5
            F4BA295029A23ADA5EDF0CA874D541AA4783704CD445018F535D59448708DFD8
            EE86B67477107742764CD3229EC09D2DF1FBDB86E150414B44BA9AB84CBA978C
            8950ECE2C27038E0C1BC7736B4A5C0C4DDD5C77484A15C81DF94E465E4658650
            75A27340C13BF5AD42F52181B8B488BAA2DD8B8A39754209EE75A49394EA038F
            BF78F1176F7D7CDD8EE1A4D7925E9B021E3A50756105D5C4D412CF4716D5CE9B
            58E8751228D5DCAED282846F4F4635E5FA534B477F0C08831E8892525F4C5246
            AEC4807C3E38962D597B6FE40BD7DD7DEDED0FBED33E12D7BDA6E633050A2A80
            A9A3A9897C5F6CD1F4EC338E9B1E2246929E1389FB50D0AAAD2E0470A58F8C97
            7FD1CC005E5D18494D2952E50FA7E77C657A76AE48C132BB4DEDB31BFBFED281
            E4AB9F986FDCB5A47CB21E79B59F5FF2C2CEBF45D50833B815477CBED5D0EE96
            F66933E38752B7509D9282204092C25C5112A66868EAA5B3AECFC250489D2878
            8BF2836A20F3DBAF0FDCB66B646BDF40EF484CC871F48AAA1631656299BBFD94
            35B6F5493540DA80D5A067371D62CE1545619FC1093C714851B7ED6EB3849716
            28E90284147E20CE8C89E5529AA630EE5BF5E20F7FF5D7BE94428FE214A92BC2
            83F1CA6441D0FAC2C78F7AE2D7573FF1AB6FDCFAAD4BAA8B0CC652E3B50F6008
            077D65C5994CD03AF5B6DD2D8E6A50A14BC985CC8CD21D7E30A9A6D88B624B55
            3A86139FBAEA671BB6742695A08D81F22852336A56438C2C9C9CF9F3EB2E7CE1
            4F37FDFEE6CB3F73CEB1CC4EB82D8C0963C414E197F8F56EF917CD8C520EFAF4
            BB5E96A1AA5F9814BE665646894880E17739FA156F0FFCBA6910FE7EAC5FFBDD
            92AA8599DADBC9AC2FBDDCF0C44034AE2B49C7D9D3D84BD8449A874E296352CD
            AA2AB595451AA0C80DBCDE91D19EBE58BA3B12D8C7F1042D6B654DE8FB4BCA4A
            B8F3B31D03D7AC6D5153019F9D18BB262D52995C5B9686E9E19198C2A8C281BA
            E1E4A4573039C50E0428767108C40041B1634F3BB88744FEA64BD2D1C00CE64C
            A82E45E1D4D03EF0F37B9F8949BFC5B94D8F27911A7524E9ECB0E7F61F5C7EC5
            25A74C2CF27B9404CCBE6D4F6B02E919497CBF48A5B8303333E4879F0929802E
            2EB2B8FFA1234A49188F985C57ACA9B4C676E7BD8FD777A2299038C61C44859F
            833C2AA93357CEFEE54D5F397EC1E49087E1CAFA868E283DF33B40ADD0161762
            4A6D3952CCD8A171F22F9A99BE88C1297D2171C14020BB9794057FB2A8789277
            58AACE8815BCE9EDE1EBDF6AEE61BCC6C37FB1B8F4A262D165F22B5FEDFE69C3
            484BDF68C760D446DDC94C0011050E6054857DC5D4BA4ABC855B03DFB6377624
            69C9EF8068AA1AE7D6944955CBB2FDB71E5B59A5AB6FECEE3075D56607A91546
            98555B0EB044C3A02442B1489D480A085ED44C12FE24BB86A2091BCC5B3585BA
            7D6FDBA66DBB5D9A68C3F90838A921B5223F23271C423B8F3EF7CA806970851B
            8ED0E8092B7D8F1054E9B885D3E64D2A3484AD72646575E3F696D68E880E12E7
            BA695A30C129138A680107E51348E5DE1EC26E7C24DCA680C6A8803F53E04F70
            CA88F3C4F36FD143191C26A0715031C3293D32F1F9F34FCAF20000E12A66C2E1
            4FAEDD48CFC2C857C604042FA0E9D36BCADC0D4E87CABF68E6F1221461B99976
            6586FEABA5B54705635C75A22CEF376DC6575FDEDB6039853C79E39CE2EB6766
            ABAA76EB9BB1AF6F6C1CF464608EAE3A283808256928D64444A1EBDDF8BCABA1
            15EA1C2F49185413936BCA0C452E092AB72C282F1EC235A8D90FCC1612F2EB65
            C5F92EFCAA8539993A8A21A8920028BD1F029993BDB3ABF59E479E79A3B177D5
            0B6F5D75C36F62A9033D51B011E33327D69440DD8AD077ED687CAFFD49727078
            306A2A09C51875E4FAB73BAFFBD17DA613809B8D1F8D6BE64A8A5A551D8C24BA
            3A07601A50525A55A5ADECC49B3C8632A1A612EEDDD4D4964A3A20DF2E071C13
            641F0CA8B37F3826595C615DA3CE8DBF5AB5EE8D3DA0EE6E013626BACAF3B27D
            D95961F5BDAAA70FC0CC7073F4E2685EAF6ECCF1B13F2C9A745171D4CBBB131A
            7F6A28F0A9B54DEB86548DB10BABF27FBDB0A83C4B7B5DE419A79CA496552769
            AF83AA53F0E025B86A4EADABA031AA0EAA9F1DBBDB69DD71BF60E24CF11BCAA4
            CA12A016E0734AAE478E740B55319C03CB1190E282506E56404A40A0327746AD
            8725A91623AF22DD213F4037A6F4DCF1DB17CEFBDC6DDFBEE92F8D5DAAED1CE0
            EA84E5B4020AFE55417B31142595A27D16E9B3FB05BEB266F3DE532EFDDEC7BF
            72F70917DFF085AB7FDEDE63D24CE8D1C201ED0321A6D695A12073A4DDD4D61F
            8B2140DDE29CBC41C78880B1654559E120721575047F20201F676647D5626AC6
            A7BEF58B8F5EF6E3B3BFF493532FB8FE81C7B6584E26CAC2F1E6C3EC2ACAB2BC
            1ED487EF61D30FC0CC1891262DD4426EB2D3F3B9BC7E5EF97726840ACD4110EB
            ED22EB732F35FFB6A937A1A8CBB3D8438BF34F2EB3ED4050AC38569F3733E637
            84E68E418AD292FC70C88B77A89E2D5BEC69E8A46F7090DEDD17E566A72C2F27
            2B0893C054DEE1F67E2B62398A0FBC2C7D8D2B72EA4414EAA03B948B2BCB7216
            1C31C54D863A133A712BD4BE805D45B394408A05529C712F5077CCD7DC176D99
            009D995C57A100909939757A2D3C8F46B0AF0F5700A07A478FFDE6CEC1962E7A
            72555C92C3798A0E53161A6BCD63F08A927C5AEC63EA8EFA36B7762757432FEE
            0B16775C0C8367D8B575155E2F0762B9B78E09A76F573849DBBB736F746BC368
            BFA917E767863DA8F1D2597EEC85E1D5551701EE29EEDE251F809961674E0BEE
            F4752803BECA7916E7974C28F9E5A2B2893CCA99D9A7877FB475E8EA375AF65A
            BC5267371F51F5BDD959614FDC9C355F3FE1A3C9B26C70065D38932A8BC0BE2C
            38B3D07BFA87FA231155F512B6ED7B61B6D327968253D237A5A582E46DDAB45C
            8A344FC529D3A13500DB84AA3C4E5512B289A333F9EDCBCEAECD0756A4E81112
            8EBA8F13306AA1A1843267947B3E7FD14A00E0818E903C25F76A5A5545215239
            DABFF08CE3EAF2B92EC124F6097165B293CA3C5CA6727CCAB5979DBCFCE86A18
            D8510C24DFFDAD79FD063160610AC977ED013E513EA2710272C93A2893AC6913
            4A2980155E9895F1B973967BC4105D41F42ACD5A685104451DEA64F8E7515372
            EEFAFE258EB0D2C96E7F476827239441CF38D2233C58FED183C87F5208786835
            9FEAA0B4008FE03EA501637971A029DEDF34CCE22CBC2BEEBCDED2599D1D9AE0
            57A7661A734A735A4647DA159D55CCD475C5CF46CF5E3A6D7E6D1988186269EB
            DE9657DFD99EE9F3E4F9B46CBF9E7EE505ED8F2C9F3FAD0EF48A22EB954D6FB4
            B777E4FA95DC2057799807FCD95922D76B5CF0B115853961D42D9C6A2B11F479
            962E9A178B0CF475B7A72CF20BF892CEECA2B075D1E94BAFB9E213DD6DCD6D4D
            ED593EDF58470196E377269686CF3B63191010E1160AF8162F9A178FF477F574
            A5AC04ACC6548171FAA5407177E2B289D75E79EE927993F6D4EFED6C6FCD0DB0
            5C9F96E5F78CB5E6554F3B7E81D74022509E7AF6453B25F69DD272FD322720F2
            42F213A7AF28CA0E315A01135327D5545595B6B67745224360FE8CD19656CDB2
            428639B52AFCB90B8FFFEAA74ECB0EF267D7BD180EA8B93E23DB8F97DB51504E
            ABCE993F63527A056BCC36FB040A3BC8FC877CFC1784EE4740D2D29B6AA9E6A8
            E4BFAFEFBD7D77AC470F81F3179889CFD468174FCE2C6472487AFEB077F8AE5D
            23BD4AD67CDFD09766172CCA0E045513E1E0206583FCA068DD37606225B4DC48
            7B3F89B34A01F055183EE19CBD763876EBABF5E74CAE38B1223F57313DF468D8
            E7C68C8DB0A0E7F70AEB1B1EDDDDDA313434C2392F2ACCABA9280CEA7085942D
            35106CCAC86E47146A922394B892D4702FE6434C8C012587E2A93DCD1D838323
            8978CAE7F115E567D7541665F8DD054A0982A70BB7AA461BF410382D30122240
            3131669B36DBD2D9F41977E99736ADC199684585733890BB9D8C2785DADED5DB
            DCD1331C4BA0DDBC704655795E497E9681244F1BE9459CA1420398E0EEFD0603
            DED0D36FE81D746CECD83EF930CC8C264863681A0865A92900E84B43D68F37B5
            BF1353868D80D7B11665EA57CECE9F13C6256AC3A87DDB5B6DEBFA8564C69945
            E253D34B6A0D1E64220537A6AF02EC1BB19BD2D0B6CB5FD2C98F72134C89690F
            0B76FDDBBD0F36C716E6B2CB6715CF0FB290EAD09308A29D0046DCE8D222BA79
            CC9A684D45A6542CC221492BDB6342491D2FF4EBD01296CB6890E9A922A2E368
            0AA7E8207923791FB8308A4B57E36EDBEE900EB82786E8BE23C5D078F677C490
            EFD1E018AFC668D277E35FDA9DE526782407AA9514DA354484012F5AEE22EFD7
            293513B0D34D10D7DF718D8D54A51EBAADE00300ED4305E9C49D29A259512C4D
            E19AAD55F8D5632AB2864572F7483CA1781A6DFE424BB72ED9B4CC40A98F2D2E
            CFAE0CF1FAFEC88B11EFEA96DE61E1546767642A4C070142B14FDFE8C4946136
            94C4A424A88B5C99D2236C45ABA71EC50C6578FFBA37F966CAFB4A536B452E52
            838FD12A38ED1170C3865EF848C14AC3437D4CB9C5F51A0400C64B099ED6E2C8
            0EB44BD2552BCE921E692E741AD7E38538248DD31F5C482B39DD0B3ED060700A
            ED806F43EFF0A131BF44BEA7BC8F948C2EE0492A821BD711EB26FB80A1A1024C
            37020C82E3518F380BD046B54C364E6F8BC621DC0F6DB89B3E30667AA5791F39
            1C3A727DC21DD601F9E0CD4CDAC708C9F188A2E0130405959F290B0AC2933338
            ECD86F1B11E95D3F18DBDC37589DE9ABD2D89CB0EFF8F24C2E523B86ADBF759B
            8F370E4755591C06EF047A531450F2277D70F00D80409AFF500FA40C7067EE35
            8C577B069B4DEF30373A867B4F29CFF3AAA40BDA204293A72BE9DFB4D07BFA0D
            DC277D91C10EBCC6EE702F4C0B4D8B5E64FBF4BD641F3A31F6D1FDE01E475C83
            15C28812F59243CF0A699C6479D7C9885D536D4D79847EC13E294203DC87AE69
            432A4D8AF80D3D78C547FA7163C7754F62EC680E99881E64D12DA498B45FE24A
            400D8DC1ED71BC7C08D1EC4ADACBDDDFE897DE08C5F23BE6D4806F41455632D5
            BB7BD8B494DCF6045FDDDA615976456EB0C8608B0BF42525A161CB7A7354FEAD
            47F96BEBC8B0885787FC394444C07439720FEC4C0BCBAE078D09700D25B593DA
            14315F1F5635E1E9158999413E39E8E7E4FDFBC642C6480FC81DD101197F38FD
            FABBF25E571CF4C93D8B0C213A7AA25CE7866ED048C91BE838D98C0C831F87D1
            521720586DEDEA4FA592C120ADCCBB90009B2305107280DE60BAB6A2F60C8E60
            F4BA4E5FE2A2A825DB931FA43BC4F528D0D3E90687DEBDD3F2C332F37B09EDB3
            C40C72356D6551EEE44C5E3FD0D1CBB4849AF5B748F2B996C14C2F9B90E12DD5
            8C954581B985FA682CDED2CFD70F6B7F6AE9782796F4EB46A14E500B77E12281
            D922265CC31188A7A44C2AEAA35DF1EDB404A7268C008FF59D5091AF13821DEA
            DA1FBEC89422CFBAF0AAAABA8AF2A20214F9C251056DFEB19863DA369C00D06F
            8342C22CCD1DDDF73EF4D8E4895599012FFC17212F1C1BB0DD1FB5573DF55241
            7189C7E3B514E5BA1B6F0D64042A4A507A39169A02D372620002146A26608E36
            E1826E12BE63BEF410FD60F9E029D8DF138B3820A5172456B068E1381D96FAB3
            9D7D0F340E46782EE61712F113F3E4E5B3CAEA029E803447156DC360F2DE9D3D
            7FEB9551CDEFB1876667788E2A092C290E4EC9F46729EEF2A36B665495A6642F
            8D263EF7527BAB0873D5944E460D6B5C7DD20CA483FF01330B31A288E3CEFCD6
            35DFB8A020E8FDEBDAD7A2A3B6CF6FCC9C5579CAA223563DFDD25BBBDA354D81
            0FF8F5E4ECB9B31E5EB5E64B979DFBE85F9FAFAFEF702C272BC777DE59CBFFF2
            F4E67B1E58BBE2D823B3B5D885179EB66AF5DF161E392D2F23E381C7D70F8EA6
            BC9AB2E48849C71E3DFDE1275F7E6367078C5C9C1FBCE89C13F3439A4659F2D0
            7DDAFF3915E86EF24187084484A5C6F452AF71CDEC920796541D1988786562C8
            F03F3CEA3D734DEB77B6F6EEB454BF748ECF327EBFA8FA4FCB8BCF2F747235CF
            AB71EF4F1AE4C7D6761FB77AEF051B9BAFDBD1FDCBDD3DF7B70CDEB9B7EF6B6F
            767D796D5397E397CC41498B6E462D3E084414071ED7200636F5F4EC49A652C2
            B2848D32009121E8EB39F46EECA20F4228E9D2D741E8BB9C77DFFB4C73F7C8A9
            CB666685FD3FB8F3F11DADDDDFFFE5C355D5C5CB17CF78EA95AD1BB7EEEE1B8A
            3DF6F4C6D1A879D77DAB12CC5B36A57A20CEFA87535369C3AF3E7756C5F2C533
            B3827CCD0BAFB77474FFFA4FCF6DDAD571C2E2E9C5F9A1675E7A2D66D97B9A47
            8A0A0BA64E9FF09735AFBFBC6587EBF8872236E43FE8E934024416252AB01E8D
            12AD1A5294A3F3FCBF3DA6FA6B93322AED189869A7EEFF5D7DF4A2E79A6F6F1E
            6A178845674126BB617EE17DC7957DAD469FA50FA9DC6A75FCABFBBC3F691457
            ED4E5DB635FA8DED897B3AADBDDE7C93FB404ABD496E7B531E2EFDE86BDC022F
            D07048D5BEFADC8E473A1323AA92023F029F11B48BD6AD5B3E3001DB42A35C4D
            69C2B6CC645D55E19CF95326CDA8D1E4A86A39DCD166D4D5CD9D3C292B33C7FD
            1E06F5EDF3784E3FE5344DF5B5B5F7BEF6FACE0DEBDFA8AD2C43A55D3B71E2CE
            A67E007892794CC923F1786D51C6C279538F59347FC1B4DA8E9E91BFAE7919F5
            5DC24A5828A42C64684AD563E31827FFC9DC7C90A49F3E5155ABA86155392A4F
            5B5A91998CC4DA2322E609742BDA2B3DB1E7DB7A75E6540443F9D229F42847E6
            FB4EAF29805B7845DC8E58A9844CE986A978E8AFD9D06E71B487FA4D38DCE351
            86CFC9D73E5A9EE3A5C2649F77236FF97D0F348DDCD79C6CED8F54E7047D5EA9
            2B094E4F845C9EF40109E830A063CDFA97972D989D150EAF7D7AE3C38FAE7BF1
            B59D4B664E3AE5F8A33BFA228F3EF6D4DA75EB63299E11E073A6D76E7DF3ED8F
            9EBCECCF0F3DDADFD70F8A8E147BC292D95326976C7CF3ED279E7EB6B3ADEF8C
            5396BFBAE9B523A7544F9A50F5E49ABF3DF4C48B8F3EFF7AC0A32D9A3F67E3A6
            2DA37DFD825651ACA3664F9850590C4B13C33B58FE73B9F9100195DCEF780E3D
            4D62A65452C2D93290BC637BE7CBC39E3828B326FDA63621983CBFDAFFB18A70
            1ED7C0AFA04453D1071D7BFB68727DF7E88E61A7B1DFEC37952463027C5CB5CB
            98F84845E6A7271614731BA9D97D86488232272A9C2BDF68FF6D978F4B63A2D2
            77C9C48C73EAB2FCAA61A89CB6147D40620B87D9B2D771B234DD5265CA82E52C
            53D5F27D1261F7C33B1FCC29AE2D2ECC796CD5BAC9B5F95FFFC227A4E5783CDC
            B29D44D216DCE19A37A823AF25476D4F2C150FEAC1A0AA8C4A2B80991B86650B
            3361995CCBF241412202AE9EB07C9A6632DD001A2068E871E07F8B99DD7E5CCD
            BAFD0997898AF4F752A2525BD53278CFAEFE3D096F44F370AE04CD6895479E5D
            977152594E2D7D01CF7D24EBA02261492613AA3260ABB1B8E5384EC0D0B27D9E
            1C91A41A95F66A71226198253987837AF6F6C6A1EFEC46779650759F651F1932
            AF9C95BD34178A4D073D95A6AEC1D36FF016880EADB96FC60A18FCA4F5E69E1F
            BB94E641C53CAD6CD15F304972C7E3708BD3561F9DBE60E75344CA52E4AB6FED
            7971F31E4CB7302B78F209471766D27797D2EB2D92BE866E01091CA6A36EA6F2
            9AC51CE9D3A466E23F9B9B1C994EE88E0DA3C26B3547A63445978CC3B3907E30
            51E40AA663C634AC71F23F16CDEF92B49A68870B47A528E55E4779B2A9E7FE9D
            237BA437A905E0ED9CA72A54F3C442CF5913F3A7060D3FC68AB9C1EFA1265A38
            1C2B1B0DA88C0A0ED2130CC5A0053211C8186DE2BDA5B1FFFBDB2D9B81ACA1BC
            E1AACEA6A75A1F3869569D8EBA931E649B6A922393388AC9552F3D79067EA001
            9881161DA95A70FF4E1D750774A4050D8C9B7AC0042823539F7883B1E016989C
            16EF383EA65774688CE415EEF5B880B62C1163A3521B53D0681ED2D240C4E91A
            BA9296E50052AAE5B60C0A4D0BA4384795377D89D16B2BA6BB020AF7471FC83E
            E4D8D4EA38F91FCBCDEF128C6C2CBAA10B9495D952999B193ABE2E33C4535DFD
            C351C527AC40BF1A78336E3FDAD0F5DA4022225981DFEFE5AA45551AF48BDBE9
            0B90B46A86C9C2BA82F6C5A39074FF0611EDF58A2AE28FBB86B7A6FCAEA2A86E
            7514232EC5D42C6D7AD88FA00743C431604067CFC0D3CFBF3465422D2DC4D0F0
            E8B999BBACC86C6A8CA2962C0E2BD2597C24E74AAF43C23AB4E2E8BA053A02CD
            73EF45794B6F70C435189CCF5DDFA0679D7417FDA144E1FCE5C9E7C2C8E7213F
            B54D9DBA9D51F54FEF5D2DD9B4AE42BDC0C5605ACC0285037F7CCD4655D372B3
            82C432DC518C97FF1E338F091C18286942A150367732B9589A957162654E368F
            B44463092769AABE84C86C8AEBCFF54657B5B6EF1E8CEADC13A067374C53E83B
            3EB4744C8B4B42D017D728E2901F1525999072F5A0F5FB1DD1080F48F20CE88C
            F6E8A754BD90C796176669B4C9CB559154FA22F1CDDB1A8F9C3D25665B29A946
            926682FED71D2C612957DF7097D4B4FCBC5CDB01F4B368D219356DB00A0CDC76
            AC982D930A8B25C8B5128E9274B484698FA600921C1091549468D21A8D3B36EC
            4DA0A54452329A349328EB38FA77D66DDE5551511408062371114D39299A0887
            7BA09784CD461336920DDD2995A8A90CC54D33E9A8CC00105DF7C3DF1616E74F
            AB2B75A7E062C438F9EF01ED3149D7B00E619A43EBCBF4180895AD6249B5C911
            AB9B06FEDC12DD9604AE79A5036843AE52981DCBD7E2737282F3B23CD3F302B5
            217F86AE211C7C693A2F1518B85928EB5A06EFDE39D46EE7DA5ACA412676B8D4
            E3AAA3735B5999357CDFE2C91980F1F4FA8D235FDBD574ED4DBF7FF8D7DFBDF8
            8B37E614E6EE6DAC67AAEF9B975FD0D13D74EBAF1FCBC9F4156524CF3BFB3430
            DC3F3DFA6438273C301C3FF3C4E515A5793FB9EB217F56B8A7B5F5D3179EB5B7
            B5634F4B7F5F4FDB4822F991958BBE78E119DFB9E597AD1DBD5E6F607820FEAD
            2B3EE908FB873FBBCFB12DDBB467CE9C78D5173E71C995B77DF38B67EEA8EF79
            64D51AD81DDC6DC6C48AAF5CFEC92F7EF57B052565BBF6EC0A1859D77EE3C240
            C0B8F6073FCB0987A331272FA7E03BDFBAF45397DD78DE79279D73FC1C0646F2
            AEC5CE43CDFE3F2F2EAEE90A33145811C411C442E34CF3327D922EAF9858F0E7
            65B577CFCC59E649E458294578C0BA93BABF55943CD1EFFD6E7DF2E31B3A4F5A
            BDF38C350D9FDCD0FED9CDBD9F7FB3FF93AFF79CFD4AD7294F375EB32DDAA884
            4D9D9017A6941CD41C6E405F6C4C269D38C1880045A21D44A8CD4DAB6B300E93
            F70C3A0B664C7EF01737D7544F78E1C52D679CBC303F1C38E7EC15B7DF7CC3A2
            A3163CB576836A1496965479FD59AFBCBC2565AB3DBDE2EB5FBCE473179D89C2
            7D7054082D78EF5D377EF6931F7F72CD969423C3F97505C5D5D555752349F6CE
            EEE6B52FBD9D9357F4BB5F7EE7D65BBE3A77E624B8576FDF4032653FFBF2EBC7
            2C9A75EFCFAFFDC2E72F7A76FD5B495B69EB672B8F59F0C06F6F0E66176C786D
            B7609E9CAAE98505951535B5AFBEB177241E456E068FA30CF25E81FA5F67665A
            D71F93F45B1C01A5706B04A6C1FCA59C9D56917BEFB2AA3F2CC9FA44C148B91C
            3250ADA829226F8EDF52C24D5AEE2633E38921DF1FBA7C7F68958F743AEB06D4
            762598D0FCEE773B8094C4C201EF9A0D46430F2BF3BC3E0FEC4E4935FD909180
            91A9969BE9AD8AF2C2CC903727379410A602CAE7E17B5A7A7F72E79F9E7FE975
            EE0F86F3B28E5C346BCEDC69B3674FB5A4C4D9AAE2ACB34E5A7ACAF1C7E8AA59
            9217CC0B78CBF24248A08383837F797C75DDA48AD9F3EB50009A8AA5073CDD7D
            C39BB7EC7DF195DD6BD7BF1CB7C1B368CD46D7B4E6F6C1CD6FB76DDDD6ECF764
            D0D7DA25AB2B2DCA0BFAB272C2F1947C65E31BF57B5B162C999B5792279866D1
            8CE0B7C072B8F0A18919F25F979BFF81C0485479486128C22B65B55F5B51163C
            B12AABCE48A592FD83485586C64480763380B00294057D271DC5098C47D3270D
            1C50012892C3345037BF19FD447578618EA1D38303B72A519494653976F29823
            6645A343F3A7D7E66705E3F158495E785A6D556676C6DEA6D64C1F3B79E5D133
            A6D5F57774B5D4EF7692F163E6CFCCCF0BEBCC3E7ACE441D8C89ABF158A4BC24
            7B5265A96DA3E249AD587C04485E77535B62383A7352DDF40925CB17CD894523
            3B7735448713CB16CF9E3EB93A3ADC77D48C2973A6D675760DEDDCD3A49AD605
            67AD9C58991B8B0F1D3D775230E01D8D8DD494E5E28291C1A1AE86E6829C4065
            7178D1BC49662C3A637255495EB6FB1CFA504BFFD7E5E67F2048D84056302C8C
            D244A8D39F300345D192F457F99D3DA3F69AF6E197BB46770EF1A8A627354EDF
            D162F0702099CB6DC9D0E367077623037674B11EBD7DC58C1A1DF415350F421A
            350D4356C7A554D1D2E342DA5B295464109DD157C150FE7A74055C8F16E9690D
            5DA167851E693B1A6D3BD4A405D807F4A305BC0C779B08489887565E294F40A8
            20C388047D09C074BFDE40741AB7309449865462B6427FD418441A97E2544A55
            7114F751C18959019468FB333176021FD572A00C263522F970D7FFCD66A6BDB7
            6EAD44CA10B41F0E3C8DD6C5307755D7E9FF99859249DD9B705EED197AA927B1
            7350F4A49074B9AD1A0E3388A2C255088F611FC1851D729C2579CEB573CBA67B
            60328A757A904BDFBAC06F28CD54A41786843BA077D8DD56E92F57286AD47182
            E85710FF43F9A6A5CDC92530172A760CDCECA649AAA960095AE10611B7B8F050
            71ECBA1C8602B20DEE4D4B0552F3C017E9A1318D10C7E16E1AD566265C094445
            87ADE96F7CE8E8DB42418571D2821F95D470254EE98AEA6C8C14990E07D28034
            5EFE3799D95526646C0EFB3EEC3F383672C49F23594C95438EE88A25770CA71A
            6266C348BCCB11430E4B295E9F6AE7E9F6CCB077797EF8E84C7F067DED86D27F
            FA76B79D7417636FC677E09E3870DCED9DA2367D9C6AB431DC480BCE40E8E0F8
            37E9EB71F1B8C193A43FA4C53D943646DA68E99B0EBE61EC68FAD48133EF1FCD
            87E5FFA4EC77E1C3F27F5714E5FF01EF73A47DF13C03AC0000000049454E44AE
            426082}
        end
      end
      object SubDetail: TRLSubDetail
        Left = 0
        Top = 460
        Width = 813
        Height = 500
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataSource = dtmGerarArquivosDraft.dtsContainer
        BeforePrint = SubDetailBeforePrint
        object rlbndParticulars: TRLBand
          Left = 0
          Top = 0
          Width = 813
          Height = 18
          BandType = btTitle
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel31: TRLLabel
            Left = 3
            Top = 3
            Width = 73
            Height = 12
            Caption = 'PARTICULARS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object rlbndTitulos: TRLBand
          Left = 0
          Top = 18
          Width = 813
          Height = 40
          AutoExpand = False
          BandType = btTitle
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLPanel46: TRLPanel
            Left = 1
            Top = 1
            Width = 125
            Height = 39
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLLabel32: TRLLabel
              Left = 3
              Top = 4
              Width = 61
              Height = 12
              Caption = 'CONTAINER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel47: TRLPanel
            Left = 126
            Top = 1
            Width = 62
            Height = 39
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLMemo4: TRLMemo
              Left = 3
              Top = 4
              Width = 57
              Height = 36
              Behavior = [beSiteExpander]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Lines.Strings = (
                'GID Seq. / Packing Level')
              ParentFont = False
            end
          end
          object RLPanel48: TRLPanel
            Left = 188
            Top = 1
            Width = 130
            Height = 39
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLLabel33: TRLLabel
              Left = 3
              Top = 4
              Width = 104
              Height = 12
              Caption = 'MARKS & NUMBERS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel49: TRLPanel
            Left = 318
            Top = 1
            Width = 67
            Height = 39
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLMemo5: TRLMemo
              Left = 2
              Top = 4
              Width = 59
              Height = 24
              Behavior = [beSiteExpander]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Lines.Strings = (
                'NO OF PKGS')
              ParentFont = False
            end
          end
          object RLPanel50: TRLPanel
            Left = 385
            Top = 1
            Width = 180
            Height = 39
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLMemo6: TRLMemo
              Left = 2
              Top = 4
              Width = 141
              Height = 12
              Behavior = [beSiteExpander]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Lines.Strings = (
                'DESCRIPTION')
              ParentFont = False
            end
          end
          object RLPanel51: TRLPanel
            Left = 565
            Top = 1
            Width = 54
            Height = 39
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLMemo7: TRLMemo
              Left = 3
              Top = 4
              Width = 49
              Height = 24
              Behavior = [beSiteExpander]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Lines.Strings = (
                'GROSS WEIGHT')
              ParentFont = False
            end
          end
          object RLPanel52: TRLPanel
            Left = 619
            Top = 1
            Width = 54
            Height = 39
            Align = faLeft
            AutoExpand = True
            object RLMemo8: TRLMemo
              Left = 2
              Top = 4
              Width = 49
              Height = 12
              Behavior = [beSiteExpander]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Lines.Strings = (
                'VOLUME')
              ParentFont = False
            end
          end
        end
        object rlbndControltotals: TRLBand
          Left = 0
          Top = 108
          Width = 813
          Height = 120
          BandType = btColumnFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Borders.Style = bsHorizontal
          object RLPanel1: TRLPanel
            Left = 0
            Top = 0
            Width = 813
            Height = 120
            Margins.TopMargin = 2.000000000000000000
            Align = faClient
            object RLPanel69: TRLPanel
              Left = 0
              Top = 8
              Width = 813
              Height = 24
              Align = faTop
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = True
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel70: TRLLabel
                Left = 3
                Top = 6
                Width = 111
                Height = 13
                Caption = 'HOUSE BILL DETAILS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
            end
            object RLPanel70: TRLPanel
              Left = 0
              Top = 32
              Width = 813
              Height = 88
              Align = faClient
              object RLPanel3: TRLPanel
                Left = 0
                Top = 25
                Width = 813
                Height = 63
                Margins.BottomMargin = 1.000000000000000000
                Align = faClient
                Borders.Sides = sdCustom
                Borders.DrawLeft = True
                Borders.DrawTop = False
                Borders.DrawRight = True
                Borders.DrawBottom = True
                object RLPanel14: TRLPanel
                  Left = 1
                  Top = 0
                  Width = 125
                  Height = 58
                  Align = faLeft
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = True
                  Borders.DrawBottom = False
                end
                object RLPanel15: TRLPanel
                  Left = 251
                  Top = 0
                  Width = 125
                  Height = 58
                  Align = faLeft
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = True
                  Borders.DrawBottom = False
                end
                object RLPanel71: TRLPanel
                  Left = 126
                  Top = 0
                  Width = 125
                  Height = 58
                  Align = faLeft
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = True
                  Borders.DrawBottom = False
                  Borders.FixedRight = True
                end
                object RLPanel18: TRLPanel
                  Left = 376
                  Top = 0
                  Width = 280
                  Height = 58
                  Align = faLeft
                  object RLPanel73: TRLPanel
                    Left = 0
                    Top = 0
                    Width = 140
                    Height = 58
                    Align = faLeft
                  end
                  object RLPanel74: TRLPanel
                    Left = 140
                    Top = 0
                    Width = 140
                    Height = 58
                    Align = faClient
                  end
                end
                object RLPanel72: TRLPanel
                  Left = 656
                  Top = 0
                  Width = 156
                  Height = 58
                  Align = faClient
                end
              end
              object RLPanel64: TRLPanel
                Left = 0
                Top = 0
                Width = 813
                Height = 25
                Align = faTop
                Borders.Sides = sdCustom
                Borders.DrawLeft = True
                Borders.DrawTop = True
                Borders.DrawRight = True
                Borders.DrawBottom = True
                object RLPanel65: TRLPanel
                  Left = 126
                  Top = 1
                  Width = 125
                  Height = 23
                  Align = faLeft
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = True
                  Borders.DrawBottom = False
                  object RLLabel65: TRLLabel
                    Left = 3
                    Top = 4
                    Width = 113
                    Height = 13
                    Caption = 'HOUSE BILL FILED BY'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -10
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object RLPanel66: TRLPanel
                  Left = 1
                  Top = 1
                  Width = 125
                  Height = 23
                  Align = faLeft
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = True
                  Borders.DrawBottom = False
                  object RLLabel66: TRLLabel
                    Left = 3
                    Top = 4
                    Width = 111
                    Height = 13
                    Caption = 'HOUSE BILL NUMBER'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -10
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object RLPanel67: TRLPanel
                  Left = 251
                  Top = 1
                  Width = 125
                  Height = 23
                  Align = faLeft
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = True
                  Borders.DrawBottom = False
                  object RLLabel67: TRLLabel
                    Left = 3
                    Top = 4
                    Width = 89
                    Height = 13
                    Caption = 'FILING COUNTRY'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -10
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object RLPanel68: TRLPanel
                  Left = 376
                  Top = 1
                  Width = 280
                  Height = 23
                  Align = faLeft
                  object RLLabel69: TRLLabel
                    Left = 3
                    Top = 4
                    Width = 174
                    Height = 13
                    Caption = 'FILER SCAC/FILING INFORMATION'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -10
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object RLPanel16: TRLPanel
                  Left = 656
                  Top = 1
                  Width = 156
                  Height = 23
                  Align = faClient
                  object RLLabel60: TRLLabel
                    Left = 4
                    Top = 4
                    Width = 53
                    Height = 13
                    Caption = 'CARGO ID'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -10
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                  end
                end
              end
            end
          end
        end
        object rlbndShipperDeclaredValue: TRLBand
          Left = 0
          Top = 228
          Width = 813
          Height = 72
          BandType = btSummary
          object rlpnlShipperDeclaredValue: TRLPanel
            Left = 0
            Top = 0
            Width = 813
            Height = 73
            Margins.TopMargin = 1.000000000000000000
            Margins.BottomMargin = 1.000000000000000000
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            object RLPanel55: TRLPanel
              Left = 1
              Top = 5
              Width = 170
              Height = 63
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel39: TRLLabel
                Left = 3
                Top = 3
                Width = 153
                Height = 12
                Caption = 'SHIPPERS DECLARED VALUE:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RLPanel56: TRLPanel
              Left = 171
              Top = 5
              Width = 172
              Height = 63
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel40: TRLLabel
                Left = 3
                Top = 4
                Width = 110
                Height = 12
                Caption = 'B/L RELEASE OFFICE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object RLLabel42: TRLLabel
                Left = 3
                Top = 18
                Width = 30
                Height = 13
                Caption = 'CITY:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object RLLabel51: TRLLabel
                Left = 3
                Top = 32
                Width = 56
                Height = 13
                Caption = 'COUNTRY:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object RLLabel52: TRLLabel
                Left = 3
                Top = 46
                Width = 72
                Height = 13
                Caption = 'LOCATION ID:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object RLDBText8: TRLDBText
                Left = 78
                Top = 18
                Width = 158
                Height = 13
                DataField = 'LOCAL_LIBERACAO_BL_NOME'
                Text = ''
              end
              object RLDBText9: TRLDBText
                Left = 78
                Top = 32
                Width = 151
                Height = 13
                DataField = 'LOCAL_LIBERACAO_BL_PAIS'
                Text = ''
              end
              object RLDBText10: TRLDBText
                Left = 78
                Top = 46
                Width = 137
                Height = 13
                DataField = 'LOCAL_LIBERACAO_BL_ID'
                Text = ''
              end
            end
            object RLPanel57: TRLPanel
              Left = 343
              Top = 5
              Width = 242
              Height = 63
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel41: TRLLabel
                Left = 3
                Top = 4
                Width = 80
                Height = 12
                Caption = 'DATE OF ISSUE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object RLDBText11: TRLDBText
                Left = 3
                Top = 18
                Width = 63
                Height = 13
                Text = ''
              end
              object RLDBMemo11: TRLDBMemo
                Left = 6
                Top = 27
                Width = 210
                Height = 13
                Behavior = [beSiteExpander]
                DataField = 'LOCAL_EMBARQUE'
                DataSource = dtmGerarArquivosDraft.dtsDraft
              end
            end
            object RLPanel58: TRLPanel
              Left = 585
              Top = 5
              Width = 128
              Height = 63
              Align = faLeft
              object RLMemo9: TRLMemo
                Left = 3
                Top = 4
                Width = 67
                Height = 24
                AutoSize = False
                Behavior = [beSiteExpander]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'FREIGHT PAYABLE AT')
                ParentFont = False
              end
            end
          end
        end
        object rlbndChargeType: TRLBand
          Left = 0
          Top = 300
          Width = 813
          Height = 45
          BandType = btSummary
          object rlpnlChargeType_1: TRLPanel
            Left = 0
            Top = 0
            Width = 813
            Height = 25
            Margins.TopMargin = 1.000000000000000000
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            object RLPanel36: TRLPanel
              Left = 171
              Top = 5
              Width = 172
              Height = 19
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel50: TRLLabel
                Left = 3
                Top = 4
                Width = 77
                Height = 12
                Caption = 'FREIGHT TERM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RLPanel37: TRLPanel
              Left = 1
              Top = 5
              Width = 170
              Height = 19
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel53: TRLLabel
                Left = 3
                Top = 4
                Width = 75
                Height = 12
                Caption = 'CHARGE TYPE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RLPanel38: TRLPanel
              Left = 343
              Top = 5
              Width = 242
              Height = 19
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel54: TRLLabel
                Left = 3
                Top = 4
                Width = 38
                Height = 12
                Caption = 'PAYER'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object RLPanel53: TRLPanel
              Left = 585
              Top = 5
              Width = 128
              Height = 19
              Align = faLeft
              object RLLabel55: TRLLabel
                Left = 3
                Top = 4
                Width = 106
                Height = 12
                Caption = 'PAYMENT LOCATION'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
          object rlpnlChangeType_2: TRLPanel
            Left = 0
            Top = 25
            Width = 813
            Height = 23
            Margins.BottomMargin = 1.000000000000000000
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = True
            object RLPanel59: TRLPanel
              Left = 1
              Top = 0
              Width = 170
              Height = 18
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLDBText14: TRLDBText
                Left = 3
                Top = 2
                Width = 129
                Height = 12
                DataField = 'PGTO_TAXA_DESCRICAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Text = ''
              end
            end
            object RLPanel60: TRLPanel
              Left = 171
              Top = 0
              Width = 172
              Height = 18
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLDBText13: TRLDBText
                Left = 3
                Top = 3
                Width = 134
                Height = 13
                DataField = 'TIPO_FRETE_DESCRICAO'
                Text = ''
              end
            end
            object RLPanel61: TRLPanel
              Left = 343
              Top = 0
              Width = 242
              Height = 18
              Align = faLeft
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
            end
            object RLPanel62: TRLPanel
              Left = 585
              Top = 0
              Width = 128
              Height = 18
              Align = faLeft
            end
          end
        end
        object rlbndClauses: TRLBand
          Left = 0
          Top = 345
          Width = 813
          Height = 128
          BandType = btSummary
          object rlpnlClauses: TRLPanel
            Left = 0
            Top = 0
            Width = 813
            Height = 116
            Margins.TopMargin = 1.000000000000000000
            Margins.BottomMargin = 1.000000000000000000
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            object RLLabel43: TRLLabel
              Left = 4
              Top = 8
              Width = 54
              Height = 12
              Caption = 'CLAUSES:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel44: TRLLabel
              Left = 4
              Top = 65
              Width = 169
              Height = 12
              Caption = 'MEASURE FOR B/L PRODUCTION:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel45: TRLLabel
              Left = 5
              Top = 95
              Width = 99
              Height = 12
              Caption = 'LETTER OF CREDIT:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel46: TRLLabel
              Left = 4
              Top = 78
              Width = 287
              Height = 13
              Caption = 'Documentation parameters as requested by submitting party:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLLabel47: TRLLabel
              Left = 5
              Top = 22
              Width = 58
              Height = 12
              Caption = 'COMMENT:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLMemo2: TRLMemo
              Left = 4
              Top = 36
              Width = 111
              Height = 13
              AutoSize = False
              Behavior = [beSiteExpander]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Lines.Strings = (
                'BL REMARKS:')
              ParentFont = False
            end
            object RLMemo3: TRLMemo
              Left = 4
              Top = 50
              Width = 117
              Height = 15
              AutoSize = False
              Behavior = [beSiteExpander]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Lines.Strings = (
                'TRANSPORT REMARKS:')
              ParentFont = False
            end
          end
        end
        object rlbndDetail: TRLBand
          Left = 0
          Top = 58
          Width = 813
          Height = 50
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLPanel39: TRLPanel
            Left = 1
            Top = 1
            Width = 125
            Height = 49
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            Borders.Style = bsHorizontal
            object rldbmContainer: TRLDBMemo
              Left = 3
              Top = 14
              Width = 116
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'NM_TP_CNTR'
              DataSource = dtmGerarArquivosDraft.dtsContainer
              AfterPrint = rldbmContainerAfterPrint
            end
            object rldbNrContainer: TRLDBText
              Left = 3
              Top = 0
              Width = 49
              Height = 12
              DataField = 'NR_CNTR'
              DataSource = dtmGerarArquivosDraft.dtsContainer
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Text = ''
            end
          end
          object RLPanel40: TRLPanel
            Left = 126
            Top = 1
            Width = 62
            Height = 49
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            Borders.Style = bsHorizontal
            object rldbmEmbalagem: TRLDBMemo
              Left = 2
              Top = 0
              Width = 60
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'DS_EMBALAGEM'
            end
          end
          object RLPanel41: TRLPanel
            Left = 188
            Top = 1
            Width = 130
            Height = 49
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            Borders.Style = bsHorizontal
            object rldbmMarcacao: TRLDBMemo
              Left = 4
              Top = 0
              Width = 117
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'MARCACAO_VOLUMES'
            end
          end
          object RLPanel42: TRLPanel
            Left = 318
            Top = 1
            Width = 67
            Height = 49
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            Borders.Style = bsHorizontal
            object rldbmQuantidade: TRLDBMemo
              Left = 3
              Top = 0
              Width = 59
              Height = 13
              Behavior = [beSiteExpander]
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Borders.Style = bsHorizontal
              DataField = 'QT_EMBALAGEM'
            end
          end
          object RLPanel43: TRLPanel
            Left = 385
            Top = 1
            Width = 180
            Height = 49
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            Borders.Style = bsHorizontal
            object rldbmMercadoria: TRLDBMemo
              Left = 4
              Top = 0
              Width = 170
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'DS_CARGA'
              DataSource = dtmGerarArquivosDraft.dtsContainer
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              BeforePrint = rldbmMercadoriaBeforePrint
            end
          end
          object RLPanel44: TRLPanel
            Left = 565
            Top = 1
            Width = 54
            Height = 49
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            Borders.Style = bsHorizontal
            object rldbPesoBruto: TRLDBText
              Left = 0
              Top = 0
              Width = 50
              Height = 13
              DataField = 'QT_PESO_BRUTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
          end
          object RLPanel45: TRLPanel
            Left = 619
            Top = 1
            Width = 54
            Height = 49
            Align = faLeft
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Borders.Style = bsHorizontal
            object RLDBText18: TRLDBText
              Left = 1
              Top = 0
              Width = 74
              Height = 13
              DataField = 'VL_CUBAGEM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
          end
        end
        object rlbndControltotals_: TRLBand
          Left = 0
          Top = 473
          Width = 813
          Height = 93
          AutoSize = True
          BandType = btFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          object rlpnlControlTotal: TRLPanel
            Left = 0
            Top = 0
            Width = 813
            Height = 93
            Margins.TopMargin = 2.000000000000000000
            Margins.BottomMargin = 1.000000000000000000
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            object RLLabel34: TRLLabel
              Left = 4
              Top = 11
              Width = 92
              Height = 12
              Caption = 'CONTROL TOTALS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel35: TRLLabel
              Left = 4
              Top = 25
              Width = 135
              Height = 12
              Caption = 'TOTAL CONTAINER COUNT:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel36: TRLLabel
              Left = 4
              Top = 40
              Width = 127
              Height = 12
              Caption = 'TOTAL PACKAGE COUNT:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel37: TRLLabel
              Left = 4
              Top = 55
              Width = 79
              Height = 12
              Caption = 'TOTAL WEIGHT:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel38: TRLLabel
              Left = 4
              Top = 70
              Width = 84
              Height = 12
              Caption = 'TOTAL VOLUME:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText4: TRLDBText
              Left = 171
              Top = 25
              Width = 52
              Height = 13
              DataField = 'QT_CNTR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBText5: TRLDBText
              Left = 171
              Top = 40
              Width = 96
              Height = 13
              DataField = 'QT_EMBALAGENS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBText6: TRLDBText
              Left = 171
              Top = 55
              Width = 53
              Height = 13
              DataField = 'QT_PESO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBText7: TRLDBText
              Left = 171
              Top = 70
              Width = 74
              Height = 13
              DataField = 'VL_CUBAGEM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -10
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
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
    Left = 744
    Top = 8
  end
end
