object frm_re_anexo_fabric: Tfrm_re_anexo_fabric
  Left = 201
  Top = 150
  Width = 649
  Height = 440
  BorderWidth = 1
  Caption = 
    'Dados do Fabricante diferente do Exportador - [M'#243'dulo de Exporta' +
    #231#227'o]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 411
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 44
      Width = 635
      Height = 365
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 0
      DesignSize = (
        635
        365)
      object Label82: TLabel
        Left = 18
        Top = 350
        Width = 83
        Height = 13
        Caption = 'Campos edit'#225'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape36: TShape
        Left = 3
        Top = 350
        Width = 13
        Height = 13
        Anchors = [akTop, akRight]
        Brush.Color = clInfoBk
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 631
        Height = 347
        Align = alTop
        BorderStyle = bsNone
        DataSource = datm_re_capa.ds_re_anexo_fabric
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_FABRICANTE'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'FABRICANTE'
            ReadOnly = True
            Title.Caption = 'Fabricante'
            Width = 110
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'CNPJ'
            ReadOnly = True
            Width = 101
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'NCM'
            ReadOnly = True
            Width = 68
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'ESTADO_PRODUTOR'
            ReadOnly = True
            Title.Caption = 'UF'
            Width = 27
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NR_ATO'
            Title.Caption = 'Ato'
            Width = 73
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'QT_MERCADORIA'
            Title.Caption = 'Qtde. Mercadoria'
            Width = 89
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_TOTAL'
            Title.Caption = 'Valor Total'
            Width = 86
            Visible = True
          end>
      end
      object pnlInclusao: TPanel
        Left = 134
        Top = 84
        Width = 378
        Height = 192
        TabOrder = 1
        Visible = False
        object Shape1: TShape
          Left = 8
          Top = 158
          Width = 365
          Height = 28
          Brush.Color = 15263976
          Pen.Mode = pmMask
        end
        object Shape16: TShape
          Left = 5
          Top = 4
          Width = 369
          Height = 20
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label12: TLabel
          Left = 9
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Incluindo...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label2: TLabel
          Left = 12
          Top = 30
          Width = 50
          Height = 13
          Caption = 'Fabricante'
          FocusControl = edt_cd_fabricante
        end
        object btn_co_fabricante: TSpeedButton
          Left = 342
          Top = 43
          Width = 25
          Height = 22
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          ParentFont = False
          OnClick = btn_co_fabricanteClick
        end
        object Label1: TLabel
          Left = 14
          Top = 80
          Width = 16
          Height = 13
          Caption = 'Ato'
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 13
          Top = 122
          Width = 53
          Height = 13
          Caption = 'Qtde Merc.'
          FocusControl = DBEdit2
        end
        object Label4: TLabel
          Left = 109
          Top = 122
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 224
          Top = 166
          Width = 120
          Height = 13
          Caption = '<--- Dados Sugeridos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6974058
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 94
          Top = 63
          Width = 228
          Height = 13
          Caption = '( para CNPJ gen'#233'rico,  digite: "00000" )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_cd_fabricante: TDBEdit
          Left = 12
          Top = 43
          Width = 59
          Height = 21
          DataField = 'CD_FABRICANTE'
          DataSource = datm_re_capa.ds_re_anexo_fabric
          TabOrder = 0
          OnChange = btn_co_fabricanteClick
          OnExit = edt_cd_fabricanteExit
        end
        object edt_nm_fabricante: TEdit
          Left = 71
          Top = 43
          Width = 270
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit1: TDBEdit
          Left = 13
          Top = 93
          Width = 116
          Height = 21
          DataField = 'NR_ATO'
          DataSource = datm_re_capa.ds_re_anexo_fabric
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 13
          Top = 135
          Width = 88
          Height = 21
          DataField = 'QT_MERCADORIA'
          DataSource = datm_re_capa.ds_re_anexo_fabric
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 109
          Top = 135
          Width = 108
          Height = 21
          DataField = 'VL_TOTAL'
          DataSource = datm_re_capa.ds_re_anexo_fabric
          TabOrder = 4
        end
        object dbQTD: TDBEdit
          Left = 13
          Top = 161
          Width = 88
          Height = 21
          Color = 15263976
          DataField = 'PESO_LIQUIDO'
          DataSource = datm_re_capa.ds_re_anexo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          OnClick = selecionaALL
          OnEnter = dbQTDEnter
        end
        object DBEdit5: TDBEdit
          Left = 109
          Top = 161
          Width = 108
          Height = 21
          Color = 15263976
          DataField = 'VL_LOCAL_VENDA'
          DataSource = datm_re_capa.ds_re_anexo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          OnClick = selecionaALL
        end
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 635
      Height = 42
      Align = alTop
      BevelInner = bvLowered
      Color = clSilver
      TabOrder = 1
      object btn_sair: TSpeedButton
        Left = 597
        Top = 4
        Width = 33
        Height = 34
        Hint = 'Sair'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_sairClick
      end
      object btn_incluir: TSpeedButton
        Left = 4
        Top = 4
        Width = 33
        Height = 34
        Hint = 'Novo'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_incluirClick
      end
      object btn_salvar: TSpeedButton
        Left = 37
        Top = 4
        Width = 33
        Height = 34
        Hint = 'Salvar'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_salvarClick
      end
      object btn_cancelar: TSpeedButton
        Left = 70
        Top = 4
        Width = 33
        Height = 34
        Hint = 'Cancelar'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_cancelarClick
      end
      object btn_excluir: TSpeedButton
        Left = 103
        Top = 4
        Width = 33
        Height = 34
        Hint = 'Excluir item'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_excluirClick
      end
    end
  end
end
