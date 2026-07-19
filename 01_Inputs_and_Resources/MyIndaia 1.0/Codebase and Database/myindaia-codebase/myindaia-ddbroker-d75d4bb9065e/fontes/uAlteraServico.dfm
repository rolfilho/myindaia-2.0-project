object frm_altera_servico: Tfrm_altera_servico
  Left = 276
  Top = 237
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 289
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 289
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Shape1: TShape
      Left = 8
      Top = 8
      Width = 372
      Height = 39
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 15
      Top = 16
      Width = 281
      Height = 13
      Caption = 'Altera'#231#227'o de Servi'#231'os e Atualiza'#231#227'o do FollowUp'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 14
      Top = 28
      Width = 145
      Height = 13
      Caption = '( uso restrito aos supervisores )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object TabSet1: TTabSet
      Left = 9
      Top = 260
      Width = 371
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Tabs.Strings = (
        '  Processos  '
        '        PO        ')
      TabIndex = 0
      OnChange = TabSet1Change
    end
    object Notebook1: TNotebook
      Left = 8
      Top = 48
      Width = 373
      Height = 214
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = '0'
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 372
          Height = 213
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape3: TShape
          Left = 2
          Top = 2
          Width = 368
          Height = 20
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Bevel1: TBevel
          Left = 8
          Top = 30
          Width = 355
          Height = 86
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel2: TBevel
          Left = 8
          Top = 118
          Width = 355
          Height = 48
          Shape = bsFrame
          Style = bsRaised
        end
        object Label3: TLabel
          Left = 16
          Top = 37
          Width = 44
          Height = 13
          Caption = 'Processo'
        end
        object Label4: TLabel
          Left = 16
          Top = 75
          Width = 141
          Height = 13
          Caption = 'Servi'#231'o atual para o processo'
        end
        object Label5: TLabel
          Left = 16
          Top = 124
          Width = 156
          Height = 13
          Caption = 'Novo servi'#231'o para este processo'
        end
        object btn_co_servico: TSpeedButton
          Left = 332
          Top = 137
          Width = 23
          Height = 21
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object Label6: TLabel
          Left = 7
          Top = 6
          Width = 115
          Height = 13
          Caption = 'Gest'#227'o do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object SpeedButton3: TSpeedButton
          Left = 272
          Top = 174
          Width = 91
          Height = 30
          Caption = 'Alterar'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
        object SpeedButton4: TSpeedButton
          Left = 139
          Top = 50
          Width = 23
          Height = 21
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object Edit2: TEdit
          Left = 56
          Top = 89
          Width = 299
          Height = 19
          TabStop = False
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object Edit1: TEdit
          Left = 17
          Top = 89
          Width = 38
          Height = 19
          TabStop = False
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object Edit3: TEdit
          Left = 17
          Top = 51
          Width = 120
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 17
          Top = 138
          Width = 38
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
        end
        object Edit5: TEdit
          Left = 56
          Top = 138
          Width = 275
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 1
        Caption = '1'
        object Shape5: TShape
          Left = 0
          Top = 0
          Width = 372
          Height = 213
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape2: TShape
          Left = 2
          Top = 2
          Width = 368
          Height = 20
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label7: TLabel
          Left = 7
          Top = 6
          Width = 139
          Height = 13
          Caption = 'Gest'#227'o do Pedido ( PO )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Bevel3: TBevel
          Left = 8
          Top = 30
          Width = 355
          Height = 86
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel4: TBevel
          Left = 8
          Top = 118
          Width = 355
          Height = 48
          Shape = bsFrame
          Style = bsRaised
        end
        object Label8: TLabel
          Left = 16
          Top = 37
          Width = 63
          Height = 13
          Caption = 'Pedido ( PO )'
        end
        object Label9: TLabel
          Left = 16
          Top = 75
          Width = 130
          Height = 13
          Caption = 'Servi'#231'o atual para o pedido'
        end
        object Label10: TLabel
          Left = 16
          Top = 124
          Width = 145
          Height = 13
          Caption = 'Novo servi'#231'o para este pedido'
        end
        object SpeedButton1: TSpeedButton
          Left = 332
          Top = 137
          Width = 23
          Height = 21
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object SpeedButton2: TSpeedButton
          Left = 272
          Top = 174
          Width = 91
          Height = 30
          Caption = 'Alterar'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
        object SpeedButton5: TSpeedButton
          Left = 139
          Top = 50
          Width = 23
          Height = 21
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object Edit6: TEdit
          Left = 17
          Top = 89
          Width = 38
          Height = 19
          TabStop = False
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object Edit7: TEdit
          Left = 56
          Top = 89
          Width = 299
          Height = 19
          TabStop = False
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object Edit8: TEdit
          Left = 17
          Top = 51
          Width = 120
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
        end
        object Edit9: TEdit
          Left = 17
          Top = 138
          Width = 38
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
        end
        object Edit10: TEdit
          Left = 56
          Top = 138
          Width = 275
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
      end
    end
  end
end
