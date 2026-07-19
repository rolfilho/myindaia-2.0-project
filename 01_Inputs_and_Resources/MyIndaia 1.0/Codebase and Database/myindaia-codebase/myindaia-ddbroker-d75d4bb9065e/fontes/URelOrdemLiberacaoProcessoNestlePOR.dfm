object frmRelOrdemLiberacaoProcessoNestlePOR: TfrmRelOrdemLiberacaoProcessoNestlePOR
  Left = 269
  Top = 127
  Width = 843
  Height = 634
  Caption = 'frmRelOrdemLiberacaoProcessoNestlePOR'
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
    Top = 8
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Courier New'
    Font.Style = []
    object RLGroup1: TRLGroup
      Left = 39
      Top = 39
      Width = 716
      Height = 466
      DataFields = 'NR_FORNECIMENTO'
      IntegralHeight = True
      object RL2ColHeader: TRLBand
        Left = 0
        Top = 27
        Width = 716
        Height = 172
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLPanel1: TRLPanel
          Left = 343
          Top = 86
          Width = 374
          Height = 85
          object RLLabel36: TRLLabel
            Left = 4
            Top = 3
            Width = 40
            Height = 12
            Caption = 'NOTIFY:'
          end
          object RLDBText6: TRLDBText
            Left = 8
            Top = 35
            Width = 358
            Height = 12
            AutoSize = False
            DataField = 'NOTIFY_ENDERECO1'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText7: TRLDBText
            Left = 8
            Top = 20
            Width = 358
            Height = 12
            AutoSize = False
            DataField = 'NOTIFY_NM_EMPRESA'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText36: TRLDBText
            Left = 8
            Top = 50
            Width = 358
            Height = 12
            AutoSize = False
            DataField = 'NOTIFY_ENDERECO2'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText21: TRLDBText
            Left = 8
            Top = 66
            Width = 358
            Height = 12
            AutoSize = False
            DataField = 'NOTIFY_ENDERECO3'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText43: TRLDBText
            Left = 56
            Top = 3
            Width = 309
            Height = 12
            AutoSize = False
            DataField = 'NOTIFY_CD_EMPRESA'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
        end
        object RLPanel2: TRLPanel
          Left = 1
          Top = 85
          Width = 342
          Height = 85
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLLabel35: TRLLabel
            Left = 4
            Top = 3
            Width = 55
            Height = 12
            Caption = 'CONSIGNEE:'
          end
          object RLDBText34: TRLDBText
            Left = 8
            Top = 20
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'CONSIG_NM_EMPRESA'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText35: TRLDBText
            Left = 8
            Top = 36
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'CONSIG_ENDERECO1'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText38: TRLDBText
            Left = 8
            Top = 51
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'CONSIG_ENDERECO2'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText20: TRLDBText
            Left = 8
            Top = 67
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'CONSIG_ENDERECO3'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText42: TRLDBText
            Left = 72
            Top = 3
            Width = 263
            Height = 12
            AutoSize = False
            DataField = 'CONSIG_CD_EMPRESA'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
        end
        object RLPanel4: TRLPanel
          Left = 1
          Top = 0
          Width = 342
          Height = 86
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object RLLabel34: TRLLabel
            Left = 4
            Top = 3
            Width = 30
            Height = 12
            Caption = 'PARA:'
          end
          object RLDBText1: TRLDBText
            Left = 8
            Top = 20
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'IMPOR_NM_EMPRESA'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText33: TRLDBText
            Left = 8
            Top = 36
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'IMPOR_ENDERECO1'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText37: TRLDBText
            Left = 8
            Top = 51
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'IMPOR_ENDERECO2'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText19: TRLDBText
            Left = 8
            Top = 67
            Width = 328
            Height = 12
            AutoSize = False
            DataField = 'IMPOR_ENDERECO3'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText41: TRLDBText
            Left = 46
            Top = 3
            Width = 278
            Height = 12
            AutoSize = False
            DataField = 'IMPOR_CD_EMPRESA'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
        end
        object RLPanel3: TRLPanel
          Left = 343
          Top = 0
          Width = 374
          Height = 86
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLLabel30: TRLLabel
            Left = 4
            Top = 4
            Width = 60
            Height = 12
            Caption = 'PEDIDO No.:'
          end
          object RLLabel31: TRLLabel
            Left = 4
            Top = 20
            Width = 70
            Height = 12
            Caption = 'DATA EMISS'#195'O:'
          end
          object RLLabel32: TRLLabel
            Left = 4
            Top = 37
            Width = 70
            Height = 12
            Caption = 'PED. CLIENTE:'
          end
          object RLLabel33: TRLLabel
            Left = 4
            Top = 53
            Width = 90
            Height = 12
            Caption = 'DT. PED. CLIENTE:'
          end
          object RLDBText2: TRLDBText
            Left = 104
            Top = 4
            Width = 80
            Height = 12
            DataField = 'NR_FORNECIMENTO'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText4: TRLDBText
            Left = 104
            Top = 37
            Width = 50
            Height = 12
            DataField = 'NR_PEDIDO'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLDBText5: TRLDBText
            Left = 104
            Top = 53
            Width = 60
            Height = 12
            DataField = 'DT_INSERCAO'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
          object RLSystemInfo1: TRLSystemInfo
            Left = 104
            Top = 20
            Width = 35
            Height = 12
          end
          object RLLabel39: TRLLabel
            Left = 5
            Top = 69
            Width = 50
            Height = 12
            Caption = 'COD. RAP:'
          end
          object RLDBText40: TRLDBText
            Left = 104
            Top = 69
            Width = 35
            Height = 12
            DataField = 'CD_RAP'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
          end
        end
      end
      object RL1Header: TRLBand
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
          Left = 260
          Top = 4
          Width = 144
          Height = 12
          Caption = 'INSTRU'#199#195'O PARA EMBARQUE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 199
        Width = 716
        Height = 295
        AllowedBands = [btHeader, btDetail, btColumnFooter, btSummary]
        DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
        IntegralHeight = True
        BeforePrint = RLSubDetail1BeforePrint
        object RL1SColHeader: TRLBand
          Left = 0
          Top = 0
          Width = 716
          Height = 40
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLPanel5: TRLPanel
            Left = 528
            Top = 0
            Width = 190
            Height = 39
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLPanel6: TRLPanel
              Left = 1
              Top = 0
              Width = 188
              Height = 20
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = True
              object RLLabel27: TRLLabel
                Left = 68
                Top = 4
                Width = 70
                Height = 12
                Caption = 'VALOR EN US $'
              end
            end
            object RLPanel7: TRLPanel
              Left = 0
              Top = 20
              Width = 94
              Height = 19
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel28: TRLLabel
                Left = 27
                Top = 4
                Width = 30
                Height = 12
                Caption = 'PRE'#199'O'
              end
            end
            object RLPanel8: TRLPanel
              Left = 96
              Top = 20
              Width = 93
              Height = 19
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              object RLLabel29: TRLLabel
                Left = 26
                Top = 4
                Width = 30
                Height = 12
                Caption = 'TOTAL'
              end
            end
          end
          object RLPanel47: TRLPanel
            Left = 1
            Top = 0
            Width = 208
            Height = 39
            Align = faHeight
            object RLLabel20: TRLLabel
              Left = 82
              Top = 12
              Width = 40
              Height = 12
              Caption = 'PRODUTO'
            end
          end
          object RLPanel58: TRLPanel
            Left = 224
            Top = 0
            Width = 66
            Height = 39
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel21: TRLLabel
              Left = 21
              Top = 6
              Width = 25
              Height = 12
              Caption = 'PESO'
            end
            object RLLabel22: TRLLabel
              Left = 18
              Top = 18
              Width = 30
              Height = 12
              Caption = 'BRUTO'
            end
          end
          object RLPanel65: TRLPanel
            Left = 291
            Top = 0
            Width = 67
            Height = 39
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel23: TRLLabel
              Left = 21
              Top = 6
              Width = 25
              Height = 12
              Caption = 'PESO'
            end
            object RLLabel24: TRLLabel
              Left = 13
              Top = 18
              Width = 40
              Height = 12
              Caption = 'LIQUIDO'
            end
          end
          object RLPanel66: TRLPanel
            Left = 359
            Top = 0
            Width = 70
            Height = 39
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel25: TRLLabel
              Left = 12
              Top = 12
              Width = 40
              Height = 12
              Caption = 'CUBAGEM'
            end
          end
          object RLPanel67: TRLPanel
            Left = 431
            Top = 0
            Width = 94
            Height = 39
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel26: TRLLabel
              Left = 14
              Top = 12
              Width = 55
              Height = 12
              Caption = 'QUANTIDADE'
            end
          end
        end
        object RL2SDetail: TRLBand
          Left = 0
          Top = 40
          Width = 716
          Height = 14
          AutoSize = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Completion = ctFullPage
          object RLPanel69: TRLPanel
            Left = 224
            Top = 0
            Width = 66
            Height = 14
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText9: TRLDBText
              Left = 3
              Top = 2
              Width = 60
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'PESO_BRUTO'
              DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
            end
          end
          object RLPanel70: TRLPanel
            Left = 291
            Top = 0
            Width = 67
            Height = 14
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText10: TRLDBText
              Left = 4
              Top = 2
              Width = 60
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'PESO_LIQUIDO'
              DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
            end
          end
          object RLPanel71: TRLPanel
            Left = 359
            Top = 0
            Width = 70
            Height = 14
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText11: TRLDBText
              Left = 9
              Top = 2
              Width = 53
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'CUBAGEM'
              DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
            end
          end
          object RLPanel72: TRLPanel
            Left = 431
            Top = 0
            Width = 94
            Height = 14
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText12: TRLDBText
              Left = 4
              Top = 2
              Width = 86
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'QT_UNIDADE'
              DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
            end
          end
          object RLPanel73: TRLPanel
            Left = 528
            Top = 0
            Width = 94
            Height = 14
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLDBText13: TRLDBText
              Left = 8
              Top = 2
              Width = 71
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VL_PRECO_UNIT'
              DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
            end
          end
          object RLPanel74: TRLPanel
            Left = 624
            Top = 0
            Width = 93
            Height = 14
            Align = faHeight
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBText14: TRLDBText
              Left = 9
              Top = 2
              Width = 70
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VL_PRECO_TOT'
              DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
            end
          end
          object RLDBMemo1: TRLDBMemo
            Left = 3
            Top = 2
            Width = 194
            Height = 12
            Behavior = [beSiteExpander]
            DataField = 'NM_MERCADORIA'
            DataSource = datm_RelatorioNestle.dsInstrucaoEmbarqueItem
          end
        end
        object RL3SColFooter: TRLBand
          Left = 0
          Top = 54
          Width = 716
          Height = 240
          AlignToBottom = True
          BandType = btColumnFooter
          IntegralHeight = False
          object RLPanel10: TRLPanel
            Left = 0
            Top = 0
            Width = 716
            Height = 239
            Align = faWidth
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLPanel11: TRLPanel
              Left = 1
              Top = 20
              Width = 133
              Height = 191
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = True
            end
            object RLPanel12: TRLPanel
              Left = 134
              Top = 20
              Width = 352
              Height = 191
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = True
              object RLPanel21: TRLPanel
                Left = 0
                Top = 0
                Width = 111
                Height = 190
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = False
                object RLPanel22: TRLPanel
                  Left = 0
                  Top = 1
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel6: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    Caption = 'PESO LIQ (KG)'
                  end
                end
                object RLPanel23: TRLPanel
                  Left = 0
                  Top = 20
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel7: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 80
                    Height = 12
                    Caption = 'PESO BRUTO (KG)'
                  end
                end
                object RLPanel24: TRLPanel
                  Left = 0
                  Top = 39
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel8: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 75
                    Height = 12
                    Caption = 'CUBAGEM   (KG)'
                  end
                end
                object RLPanel25: TRLPanel
                  Left = 0
                  Top = 58
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel9: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 20
                    Height = 12
                    Caption = 'VIA'
                  end
                end
                object RLPanel26: TRLPanel
                  Left = 0
                  Top = 77
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel10: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 75
                    Height = 12
                    Caption = 'LOCAL EMBARQUE'
                  end
                end
                object RLPanel27: TRLPanel
                  Left = 0
                  Top = 96
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel11: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    Caption = 'LOCAL DESTINO'
                  end
                end
                object RLPanel28: TRLPanel
                  Left = 0
                  Top = 115
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel12: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    Caption = 'PREV EMBARQUE'
                  end
                end
                object RLPanel29: TRLPanel
                  Left = 0
                  Top = 134
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel13: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 65
                    Height = 12
                    Caption = 'UNIDADE EXP.'
                  end
                end
                object RLPanel30: TRLPanel
                  Left = 0
                  Top = 153
                  Width = 111
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel14: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 95
                    Height = 12
                    Caption = 'PRONTIDAO DE CARGA'
                  end
                end
                object RLPanel41: TRLPanel
                  Left = 0
                  Top = 172
                  Width = 111
                  Height = 18
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = False
                  object RLLabel15: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    Caption = 'DELIVERY DATE'
                  end
                end
              end
              object RLPanel15: TRLPanel
                Left = 111
                Top = 0
                Width = 240
                Height = 188
                Borders.Sides = sdCustom
                Borders.DrawLeft = True
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = False
                object RLPanel31: TRLPanel
                  Left = 1
                  Top = 1
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText23: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 60
                    Height = 12
                    DataField = 'VL_PESO_LIQ'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel32: TRLPanel
                  Left = 1
                  Top = 20
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText24: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    DataField = 'VL_PESO_BRUTO'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel33: TRLPanel
                  Left = 1
                  Top = 39
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText25: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 55
                    Height = 12
                    DataField = 'VL_CUBAGEM'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel34: TRLPanel
                  Left = 1
                  Top = 58
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText26: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    DataField = 'NM_VIA_TRANSP'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel35: TRLPanel
                  Left = 1
                  Top = 77
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText27: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 90
                    Height = 12
                    DataField = 'DS_LOCAL_EMBARQUE'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel36: TRLPanel
                  Left = 1
                  Top = 97
                  Width = 239
                  Height = 18
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText28: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 85
                    Height = 12
                    DataField = 'DS_LOCAL_DESTINO'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel37: TRLPanel
                  Left = 1
                  Top = 115
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText29: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 85
                    Height = 12
                    DataField = 'DT_PREV_EMBARQUE'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel38: TRLPanel
                  Left = 1
                  Top = 134
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText30: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 65
                    Height = 12
                    DataField = 'NM_EXPOTADOR'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel39: TRLPanel
                  Left = 1
                  Top = 153
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText31: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    DataField = 'DT_FECHAMENTO'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel40: TRLPanel
                  Left = 1
                  Top = 172
                  Width = 239
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = False
                  object RLDBText32: TRLDBText
                    Left = 5
                    Top = 2
                    Width = 70
                    Height = 12
                    DataField = 'DT_FINALIZADO'
                  end
                end
              end
            end
            object RLPanel13: TRLPanel
              Left = 486
              Top = 20
              Width = 230
              Height = 191
              object RLPanel17: TRLPanel
                Left = 85
                Top = 0
                Width = 144
                Height = 115
                Borders.Sides = sdCustom
                Borders.DrawLeft = True
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = False
                object RLPanel43: TRLPanel
                  Left = 1
                  Top = 20
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel44: TRLPanel
                  Left = 1
                  Top = 39
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel45: TRLPanel
                  Left = 1
                  Top = 58
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel46: TRLPanel
                  Left = 1
                  Top = 77
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel42: TRLPanel
                  Left = 1
                  Top = 1
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel48: TRLPanel
                  Left = 1
                  Top = 20
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel49: TRLPanel
                  Left = 1
                  Top = 39
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel50: TRLPanel
                  Left = 1
                  Top = 58
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText15: TRLDBText
                    Left = 66
                    Top = 2
                    Width = 65
                    Height = 12
                    Alignment = taRightJustify
                    DataField = 'VL_FRETE_INT'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel51: TRLPanel
                  Left = 1
                  Top = 77
                  Width = 143
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLDBText16: TRLDBText
                    Left = 82
                    Top = 2
                    Width = 50
                    Height = 12
                    Alignment = taRightJustify
                    DataField = 'VL_SEGURO'
                    DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                  end
                end
                object RLPanel52: TRLPanel
                  Left = 1
                  Top = 96
                  Width = 143
                  Height = 18
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = False
                  object RLLabel37: TRLLabel
                    Left = 106
                    Top = 2
                    Width = 25
                    Height = 12
                    Alignment = taRightJustify
                    Caption = '0,00'
                  end
                end
              end
              object RLPanel53: TRLPanel
                Left = 1
                Top = 0
                Width = 84
                Height = 115
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = False
                Borders.DrawBottom = False
                object RLPanel54: TRLPanel
                  Left = 0
                  Top = 20
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel55: TRLPanel
                  Left = 0
                  Top = 39
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel56: TRLPanel
                  Left = 0
                  Top = 58
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel57: TRLPanel
                  Left = 0
                  Top = 77
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel59: TRLPanel
                  Left = 0
                  Top = 1
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel60: TRLPanel
                  Left = 0
                  Top = 20
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel61: TRLPanel
                  Left = 0
                  Top = 39
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                end
                object RLPanel62: TRLPanel
                  Left = 0
                  Top = 58
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel16: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 30
                    Height = 12
                    Caption = 'FRETE'
                  end
                end
                object RLPanel63: TRLPanel
                  Left = 0
                  Top = 77
                  Width = 84
                  Height = 19
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = True
                  object RLLabel17: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 35
                    Height = 12
                    Caption = 'SEGURO'
                  end
                end
                object RLPanel64: TRLPanel
                  Left = 0
                  Top = 96
                  Width = 84
                  Height = 18
                  Align = faWidth
                  Borders.Sides = sdCustom
                  Borders.DrawLeft = False
                  Borders.DrawTop = False
                  Borders.DrawRight = False
                  Borders.DrawBottom = False
                  object RLLabel18: TRLLabel
                    Left = 5
                    Top = 2
                    Width = 35
                    Height = 12
                    Caption = 'OUTROS'
                  end
                end
              end
              object RLPanel16: TRLPanel
                Left = 0
                Top = 114
                Width = 228
                Height = 77
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = True
                Borders.DrawRight = False
                Borders.DrawBottom = True
                object RLLabel19: TRLLabel
                  Left = 5
                  Top = 2
                  Width = 30
                  Height = 12
                  Caption = 'TOTAL'
                end
                object RLDBText39: TRLDBText
                  Left = 45
                  Top = 2
                  Width = 60
                  Height = 12
                  DataField = 'CD_INCOTERM'
                  DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                end
                object RLDBText3: TRLDBText
                  Left = 5
                  Top = 36
                  Width = 85
                  Height = 12
                  DataField = 'DS_LOCAL_DESTINO'
                  DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                end
                object RLDBText18: TRLDBText
                  Left = 172
                  Top = 20
                  Width = 45
                  Height = 12
                  Alignment = taRightJustify
                  DataField = 'VL_TOTAL'
                  DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
                end
              end
            end
            object RLPanel18: TRLPanel
              Left = 0
              Top = 1
              Width = 716
              Height = 19
              Align = faTop
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = True
              object RLPanel19: TRLPanel
                Left = 0
                Top = 0
                Width = 134
                Height = 18
                Align = faHeight
                Borders.Sides = sdCustom
                Borders.DrawLeft = False
                Borders.DrawTop = False
                Borders.DrawRight = True
                Borders.DrawBottom = False
                object RLLabel3: TRLLabel
                  Left = 4
                  Top = 2
                  Width = 35
                  Height = 12
                  Caption = 'MARCAS'
                end
              end
              object RLPanel20: TRLPanel
                Left = 485
                Top = 0
                Width = 87
                Height = 18
                Align = faHeight
                Borders.Sides = sdCustom
                Borders.DrawLeft = True
                Borders.DrawTop = False
                Borders.DrawRight = True
                Borders.DrawBottom = False
                object RLLabel5: TRLLabel
                  Left = 8
                  Top = 2
                  Width = 30
                  Height = 12
                  Caption = 'TOTAL'
                end
              end
              object RLLabel4: TRLLabel
                Left = 139
                Top = 2
                Width = 70
                Height = 12
                Caption = 'CONTAINER(S):'
              end
              object RLDBText22: TRLDBText
                Left = 217
                Top = 2
                Width = 35
                Height = 12
                DataField = 'TX_OBS'
                DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
              end
              object RLDBText17: TRLDBText
                Left = 669
                Top = 2
                Width = 35
                Height = 12
                Alignment = taRightJustify
                DataField = 'VL_MLE'
                DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
              end
            end
            object RLPanel9: TRLPanel
              Left = 0
              Top = 211
              Width = 377
              Height = 28
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = True
              Borders.DrawBottom = False
              object RLLabel2: TRLLabel
                Left = 6
                Top = 1
                Width = 100
                Height = 12
                Caption = 'COND. DE PAGAMENTO:'
              end
              object RLDBText8: TRLDBText
                Left = 16
                Top = 14
                Width = 75
                Height = 12
                DataField = 'NM_TERMO_PAGTO'
                DataSource = datm_RelatorioNestle.dsInstrucaoEmbarque
              end
            end
            object RLLabel38: TRLLabel
              Left = 387
              Top = 214
              Width = 65
              Height = 12
              Caption = 'SEM COMISS'#195'O'
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
    Left = 685
    Top = 91
  end
end
