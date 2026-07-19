object frm_sistema_cool: Tfrm_sistema_cool
  Left = 384
  Top = 135
  Width = 800
  Height = 571
  Anchors = []
  Caption = 'SISTEMA COOL ( FIESP )   -   Certificado de Origem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object txtRemessa: TMemo
    Left = 424
    Top = 57
    Width = 129
    Height = 40
    BorderStyle = bsNone
    Color = 8454143
    Lines.Strings = (
      '')
    OEMConvert = True
    TabOrder = 2
    Visible = False
    WantReturns = False
    WordWrap = False
  end
  object pc_cool: TPageControl
    Left = 0
    Top = 40
    Width = 792
    Height = 504
    ActivePage = Tab_Certificados
    Align = alClient
    TabOrder = 1
    Visible = False
    OnExit = pc_coolExit
    object Tab_Certificados: TTabSheet
      Caption = 'VISUALIZA'#199#195'O'
      Highlighted = True
      ImageIndex = 2
      object pnl_bottom: TPanel
        Left = 0
        Top = 424
        Width = 784
        Height = 52
        Align = alBottom
        TabOrder = 2
        DesignSize = (
          784
          52)
        object Label9: TLabel
          Left = 7
          Top = 8
          Width = 97
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'CNPJ Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 213
          Top = 8
          Width = 150
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = '15. Nome de Quem Assina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_cgc_empresa: TEdit
          Left = 7
          Top = 21
          Width = 162
          Height = 22
          Anchors = [akLeft, akBottom]
          Color = clBtnFace
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnClick = edt_cgc_empresaClick
        end
        object eAssinante: TEdit
          Left = 213
          Top = 22
          Width = 279
          Height = 21
          Anchors = [akRight, akBottom]
          BorderStyle = bsNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object bGera: TBitBtn
          Left = 514
          Top = 8
          Width = 262
          Height = 37
          Cursor = crHandPoint
          Anchors = [akRight, akBottom]
          Caption = 'Gerar Arquivo Remessa do Certificado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = bGeraClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF313131313131313131313131FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF313131746B6D7A767674
            7575828282313131313131313131FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF313131726E726A66697D797A2929293838384242422828286868683131
            31313131313131FF00FFFF00FFFF00FF3131316F6C6F7470746D6A6D7D797B6C
            6D6D4C4C4C1F1F1F000000000000090909757274777277424141FF00FF313131
            CCCACEC9C4C9999398696669E5E2E5D8D9D9ACACAC8E8E8E525252232323201F
            203D483D3C563C424141313131929193D7D5D9D7D5D8F2F4F68082846D6C6DA4
            A3A4D8D8D8E9EBEBE3EAEAD4D9D9ADACAF6F836F388239424141313131EFEEF2
            E5E5E9F7F6F6CFACACC4A6A99296986A6B6C5152536D6364A78384C4ADAFD3D0
            D1E6E3E5D8D8D8424141313131FCFCFCFEFFFFCA9895B43837934041826263BF
            ACABD0D0D1B588887D12119C3C3D766D6E6E6869626060FF00FF313131FFFFFF
            FFFFFF9F3536BC4242A355557F2A28AC6C6BFFFFFFD1A4A47B14149F35362D2C
            2C2D2C2CFF00FFFF00FF3F3F3F313131CACECF9F3536BD4241AB53539A545389
            5354CAC5C2CC92928217179F3536FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            3131319F3536B84442B64F4FC16968BC6363B85959BD5E5DBF58589F3536FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F3536B5635FE9D5D4EEDEDDEF
            DDDCEEDAD9F2E6E5C47B799F3536FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF9F3536C47E7AF3FBF8C5C2C1C5C2C1C5C2C1E7EBEBC47B799F3536FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F3536C17A78F3F3F3DDD8D7DD
            D8D7DDD8D7E3E6E5C47B799F3536FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF9F3536C47B79F3F3F3C5C2C1C5C2C1C5C2C1E3E6E5C47B799F3536FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1706ECCC6C6CCC6C6CC
            C6C6CCC6C6CCC6C6B1706EFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphRight
          Spacing = 8
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 241
        Width = 784
        Height = 183
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 1
        DesignSize = (
          784
          183)
        object Label22: TLabel
          Left = 1
          Top = 121
          Width = 782
          Height = 13
          Align = alTop
          Anchors = [akLeft, akRight, akBottom]
          Caption = '14. Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_cd_obs: TSpeedButton
          Left = 100
          Top = 121
          Width = 21
          Height = 14
          Cursor = crHandPoint
          Anchors = [akLeft, akBottom]
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
          OnClick = btn_cd_obsClick
        end
        object dbg_normas: TDBGrid
          Left = 1
          Top = 1
          Width = 782
          Height = 120
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          Ctl3D = False
          DataSource = ds_certificados
          DefaultDrawing = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines]
          ParentCtl3D = False
          ParentFont = False
          PopupMenu = pop_normas
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dbg_normasCellClick
          OnColExit = dbg_normasColExit
          OnDrawColumnCell = dbg_normasDrawColumnCell
          OnDblClick = dbg_normasDblClick
          Columns = <
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'CD_MERCADORIA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'MERCADORIA'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'CD_NCM_NALADI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 6250335
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Classifica'#231#227'o'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 81
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'EMBALAGEM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 6250335
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Embalagem'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 69
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'DENOMINACAO_NCM_NALADI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 6250335
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 399
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'QTD_MERCADORIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 6250335
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Alignment = taRightJustify
              Title.Caption = 'Qtde'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'Valor_FOB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 6250335
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor FOB (U$)'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 92
              Visible = True
            end
            item
              Color = 12320767
              Expanded = False
              FieldName = 'NM_NORMA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 6250335
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Caption = 'Normas de Origem'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 388
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'CD_DECLARACAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = 'Declara'#231#227'o'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'DT_VALIDADE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'VALIDADE'
              Title.Color = 14211288
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 75
              Visible = True
            end>
        end
        object edt_OBS: TMemo
          Left = 1
          Top = 134
          Width = 782
          Height = 39
          Align = alTop
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '')
          ParentCtl3D = False
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object pnl_descricao: TPanel
          Left = 273
          Top = 8
          Width = 361
          Height = 177
          Caption = 'pnl_descricao'
          TabOrder = 2
          Visible = False
          DesignSize = (
            361
            177)
          object lbl_altera_titulo: TLabel
            Left = 1
            Top = 1
            Width = 359
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = ' Descri'#231#227'o:'
            Color = clSilver
            ParentColor = False
            Layout = tlCenter
          end
          object lbl_fecha_titulo: TLabel
            Left = 338
            Top = 3
            Width = 19
            Height = 15
            Cursor = crHandPoint
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = '[X]'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            OnClick = lbl_fecha_tituloClick
          end
          object btn_salvar: TButton
            Left = 272
            Top = 144
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = btn_salvarClick
          end
          object dbmm_descricao: TMemo
            Left = 8
            Top = 32
            Width = 337
            Height = 89
            Lines.Strings = (
              'dbmm_descricao')
            TabOrder = 1
          end
        end
      end
      object pnl_certificado: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 241
        Align = alTop
        Anchors = []
        BevelInner = bvRaised
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        TabOrder = 0
        DesignSize = (
          780
          237)
        object btn_Zoom_menos: TSpeedButton
          Left = 753
          Top = 211
          Width = 23
          Height = 22
          Hint = 'Diminuir a Visualiza'#231#227'o abaixo'
          Anchors = [akRight, akBottom]
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
            333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078999998703
            33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
            333337F3333337F333333078F8F870333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_Zoom_menosClick
        end
        object Label11: TLabel
          Left = 4
          Top = 69
          Width = 155
          Height = 13
          Caption = '2. Raz'#227'o Social Importador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 4
          Top = 35
          Width = 135
          Height = 13
          Caption = '1. Endere'#231'o Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 4
          Top = 2
          Width = 156
          Height = 13
          Caption = '1. Raz'#227'o Social Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 4
          Top = 103
          Width = 134
          Height = 13
          Caption = '2. Endere'#231'o Importador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 4
          Top = 138
          Width = 129
          Height = 13
          Caption = '3. Nome Consignat'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 466
          Top = 138
          Width = 123
          Height = 13
          Caption = '3. Pa'#237's Consignat'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 4
          Top = 172
          Width = 125
          Height = 13
          Caption = '4. Local de Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 245
          Top = 172
          Width = 107
          Height = 13
          Caption = '5. Pa'#237's de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 466
          Top = 171
          Width = 126
          Height = 13
          Caption = '6. Meio de Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 4
          Top = 206
          Width = 70
          Height = 13
          Caption = '7. N'#186' Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 143
          Top = 206
          Width = 83
          Height = 13
          Caption = '7. Data Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rx_acordo: TRxLabel
          Left = 645
          Top = 100
          Width = 125
          Height = 42
          Alignment = taCenter
          AutoSize = False
          Caption = 'acordo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -24
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
          ShadowColor = 15790320
          ShadowSize = 2
          ShadowPos = spRightTop
        end
        object Shape24: TShape
          Left = 264
          Top = 203
          Width = 16
          Height = 16
          Brush.Color = 4210816
          Pen.Color = clGray
        end
        object Label34: TLabel
          Left = 280
          Top = 205
          Width = 153
          Height = 13
          Caption = 'Declara'#231#227'o Vencida/Inexistente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Shape25: TShape
          Left = 264
          Top = 219
          Width = 16
          Height = 16
          Brush.Color = clYellow
          Pen.Color = clGray
        end
        object Label53: TLabel
          Left = 280
          Top = 221
          Width = 131
          Height = 13
          Caption = 'Declara'#231#227'o vencendo Hoje'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btn_Zoom_mais: TSpeedButton
          Left = 753
          Top = 212
          Width = 23
          Height = 22
          Hint = 'Aumentar a Visualiza'#231#227'o abaixo'
          Anchors = [akRight, akBottom]
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_Zoom_maisClick
        end
        object Shape1: TShape
          Left = 447
          Top = 203
          Width = 16
          Height = 16
          Brush.Color = clRed
          Pen.Color = clGray
        end
        object Label10: TLabel
          Left = 463
          Top = 206
          Width = 127
          Height = 13
          Caption = 'Descri'#231#227'o excedeu o limite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object rgTipo_Medida: TRadioGroup
          Left = 639
          Top = 145
          Width = 135
          Height = 38
          Anchors = [akLeft, akBottom]
          Caption = 'Unidade de Medida'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Peso'
            'Qtd')
          TabOrder = 14
          OnClick = rgTipo_MedidaClick
        end
        object cb_agrupa: TCheckBox
          Left = 639
          Top = 221
          Width = 99
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Agrupar Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = cb_agrupaClick
        end
        object edt_exportador: TEdit
          Left = 4
          Top = 14
          Width = 632
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object edt_end_exportador: TEdit
          Left = 4
          Top = 47
          Width = 632
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object edt_importador: TEdit
          Left = 4
          Top = 81
          Width = 632
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object edt_end_importador: TEdit
          Left = 4
          Top = 115
          Width = 632
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object edt_consignatario: TEdit
          Left = 4
          Top = 150
          Width = 450
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object edt_embarque: TEdit
          Left = 4
          Top = 184
          Width = 192
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object edt_pais_destino: TEdit
          Left = 245
          Top = 184
          Width = 209
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object edt_pais_consignatario: TEdit
          Left = 466
          Top = 150
          Width = 170
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object edt_meio_transporte: TEdit
          Left = 466
          Top = 184
          Width = 170
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object edt_numero_fatura: TEdit
          Left = 4
          Top = 218
          Width = 117
          Height = 18
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
        end
        object edt_data_fatura: TDateEdit
          Left = 134
          Top = 218
          Width = 121
          Height = 18
          Color = 12320767
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6250335
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          YearDigits = dyFour
          TabOrder = 11
        end
        object cb_exibir_produto: TCheckBox
          Left = 639
          Top = 203
          Width = 103
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Exibir Produto'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 12
          OnClick = cb_exibir_produtoClick
        end
        object cb_descricao_fiesp: TCheckBox
          Left = 639
          Top = 186
          Width = 125
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Descri'#231#227'o FIESP'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 13
          OnClick = cb_descricao_fiespClick
        end
      end
    end
  end
  object pTopo: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 40
    Align = alTop
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    TabOrder = 0
    DesignSize = (
      792
      40)
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 1
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 132
      Top = 14
      Width = 20
      Height = 18
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_nr_processo: TLabel
      Left = 162
      Top = 1
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_sair: TSpeedButton
      Left = 759
      Top = 10
      Width = 25
      Height = 25
      Anchors = [akRight, akBottom]
      BiDiMode = bdLeftToRight
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
      ParentBiDiMode = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object pnl_acordos: TPanel
      Left = 418
      Top = 1
      Width = 117
      Height = 34
      BevelOuter = bvNone
      Color = 13752796
      TabOrder = 5
      object Label2: TLabel
        Left = 3
        Top = 2
        Width = 41
        Height = 13
        Caption = 'Acordo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dblc_acordos: TDBLookupComboBox
        Left = 3
        Top = 14
        Width = 106
        Height = 19
        Ctl3D = False
        KeyField = 'CD_ACORDO'
        ListField = 'CD_ACORDO'
        ListSource = ds_acordos
        ParentCtl3D = False
        TabOrder = 0
        OnExit = dblc_acordosExit
      end
    end
    object pnl_faturas: TPanel
      Left = 266
      Top = 1
      Width = 147
      Height = 34
      BevelOuter = bvNone
      Color = 13752796
      TabOrder = 4
      object Label1: TLabel
        Left = 4
        Top = 1
        Width = 37
        Height = 13
        Caption = 'Fatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dblc_faturas: TDBLookupComboBox
        Left = 5
        Top = 13
        Width = 135
        Height = 19
        Ctl3D = False
        KeyField = 'NR_FATURA'
        ListField = 'NR_FATURA'
        ListSource = ds_faturas_exportador
        ParentCtl3D = False
        TabOrder = 0
        OnEnter = dblc_faturasEnter
        OnExit = dblc_faturasExit
      end
    end
    object rgCO: TRadioGroup
      Left = 547
      Top = 3
      Width = 204
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'C.O em nome do'
      Columns = 2
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Exportador'
        'Cliente')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      OnClick = rgCOClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 13
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 0
      OnChange = btn_co_unid_negClick
      OnClick = seleciona_todos
      OnExit = msk_nr_processoExit
    end
    object edt_nm_unid_neg: TEdit
      Left = 38
      Top = 13
      Width = 90
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object msk_nr_processo: TMaskEdit
      Left = 161
      Top = 13
      Width = 74
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyPress = msk_nr_processoKeyPress
    end
    object btn_co_processo: TBitBtn
      Left = 237
      Top = 14
      Width = 22
      Height = 19
      Cursor = crHandPoint
      Hint = 'Visualiza o Certificado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btn_co_processoClick
      Glyph.Data = {
        76080000424DB608000000000000B60000002800000020000000100000000100
        2000000000000008000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        800080008000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00800080008000800080008000800080008000
        8000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000080008000800080008000800080008000800080008000
        80007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F0080008000FFFFFF008000800080008000800080000000
        00000000000000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
        FF00BFBFBF0000FFFF0000000000800080008000800080008000800080007F7F
        7F007F7F7F0080008000FFFFFF00800080008000800080008000800080008000
        800080008000800080007F7F7F0080008000FFFFFF0080008000800080000000
        0000FFFFFF000000000000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBF
        BF0000FFFF00BFBFBF0000FFFF00000000008000800080008000800080007F7F
        7F00FFFFFF007F7F7F0080008000FFFFFF008000800080008000800080008000
        80008000800080008000800080007F7F7F0080008000FFFFFF00800080000000
        000000FFFF00FFFFFF000000000000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
        FF00BFBFBF0000FFFF00BFBFBF0000FFFF000000000080008000800080007F7F
        7F00FFFFFF00800080007F7F7F0080008000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFFFF00800080000000
        0000FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000080008000800080007F7F
        7F00FFFFFF0080008000800080007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0080008000800080000000
        000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF000000000080008000800080008000800080008000800080007F7F
        7F00FFFFFF008000800080008000800080008000800080008000800080008000
        8000800080007F7F7F00FFFFFF00800080008000800080008000800080000000
        0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF000000000080008000800080008000800080008000800080007F7F
        7F00FFFFFF00800080008000800080008000800080008000800080008000FFFF
        FF00FFFFFF007F7F7F0080008000800080008000800080008000800080000000
        000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
        0000000000008000800080008000800080008000800080008000800080007F7F
        7F0080008000FFFFFF00800080008000800080008000800080007F7F7F007F7F
        7F007F7F7F008000800080008000800080008000800080008000800080008000
        80000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        80007F7F7F0080008000FFFFFF00FFFFFF00FFFFFF007F7F7F00800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        80007F7F7F00000000000000000000000000000000007F7F7F00800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080007F7F7F007F7F7F007F7F7F007F7F7F0080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000}
      NumGlyphs = 2
    end
  end
  object qry_processo_exp: TQuery
    CachedUpdates = True
    OnCalcFields = qry_processo_expCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select pe.NR_PROCESSO,  pe.CD_PAIS_DESTINO CD_PAIS_IMPORTADOR, p' +
        'e.DT_FATURA,   en.NM_EMPRESA, en.CGC_EMPRESA , en.AP_EMPRESA,'
      'ee.NM_EMPRESA NM_IMPORTADOR,'
      ''
      ' isNull(rtrim(ee.END_EMPRESA),'#39#39')+'
      
        'case isNull(rtrim(ee.END_NUMERO),'#39#39')  when '#39#39' then '#39#39' else  '#39' - ' +
        #39' end+isNull(rtrim(ee.END_NUMERO),'#39#39')+'
      
        'case isNull(rtrim(ee.END_COMPL),'#39#39') when '#39#39' then '#39#39' else '#39' - '#39' e' +
        'nd+isNull(rtrim(ee.END_COMPL),'#39#39')+'
      
        'case isNull(rtrim(ee.END_CIDADE),'#39#39') when '#39#39' then '#39#39' else '#39' - '#39' ' +
        'end+isNull(rtrim(ee.END_CIDADE),'#39#39')+'
      
        'case isNull(rtrim(ee.NR_TELEFONE),'#39#39') when '#39#39' then '#39#39' else '#39' - '#39 +
        ' end+isNull(rtrim(ee.NR_TELEFONE),'#39#39')  END_IMPORTADOR,'
      ''
      ''
      ''
      
        'ee.CD_EMPRESA CD_IMPORTADOR, /*(select top 1 p.CD_ACORDO from TC' +
        'ONFIG_PAIS_ACORDO_NORMA_PADRAO p where p.CD_PAIS=pe.CD_PAIS_DEST' +
        'INO and p.CD_ACORDO<>'#39'FORM-A'#39' and p.CD_ACORDO<> '#39'ACE 43'#39' ) as CD' +
        '_ACORDO,*/'
      ''
      '(RTRIM(ISNULL(EN.END_EMPRESA, '#39#39')) + '#39', '#39'  +'
      '       RTRIM(ISNULL(EN.END_NUMERO, '#39#39'))  + '#39' '#39'   +'
      '       RTRIM(ISNULL(EN.END_COMPL, '#39#39'))   + '#39' - '#39' +'
      '       RTRIM(ISNULL(EN.END_BAIRRO, '#39#39'))  + '#39' - '#39' +       '
      
        '       RTRIM(ISNULL(EN.END_CIDADE, '#39#39')) +'#39'/'#39'+RTRIM(ISNULL(EN.END' +
        '_UF , '#39#39'))'
      ')+'#39' - '#39'+ pExp.DESCRICAO AS END_PAIS_EXPORTADOR,'
      ''
      
        'le1.DESCRICAO CIDADE_DESTINO, case le2.CODIGO when '#39'0111'#39' then '#39 +
        'CAMPINAS/SP/BRASIL'#39' when '#39'0125'#39' then '#39'GUARULHOS/SP/BRASIL'#39' else ' +
        ' le2.DESCRICAO end LOCAL_EMBARQUE ,  pImp.DESCRICAO Pais_Destino' +
        ','
      ''
      ''
      ''
      'case '
      '    rtrim(pe.TP_CONSIGNATARIO)'
      
        '    when '#39'0'#39' then (SELECT distinct ee.NM_EMPRESA FROM TEMPRESA_E' +
        'ST ee (NOLOCK)'
      '          WHERE ee.CD_EMPRESA = pe.CD_CONSIGNATARIO'
      '            AND ee.IN_IMPORTADOR = '#39'1'#39' AND ee.IN_ATIVO = '#39'1'#39')'
      ''
      
        '    when '#39'1'#39' then (SELECT distinct ee.NM_EMPRESA FROM TEMPRESA_E' +
        'ST ee (NOLOCK)'
      '          WHERE ee.CD_EMPRESA = pe.CD_CONSIGNATARIO'
      '            AND ee.IN_AGENTE = '#39'1'#39' AND ee.IN_ATIVO = '#39'1'#39')'
      ''
      
        '    when '#39'3'#39' then (SELECT distinct ee.NM_EMPRESA FROM TEMPRESA_E' +
        'ST ee (NOLOCK)'
      '          WHERE ee.CD_EMPRESA = pe.CD_CONSIGNATARIO'
      '            AND ee.IN_BANCO = '#39'1'#39' AND ee.IN_ATIVO = '#39'1'#39')'
      ''
      
        '    when '#39'2'#39' then (SELECT distinct ee.DESCRICAO FROM TTRANSPORTA' +
        'DOR_ITL ee (NOLOCK) '
      '          WHERE ee.CODIGO = pe.CD_CONSIGNATARIO )'
      ''
      ''
      
        '    when '#39'4'#39' then (SELECT distinct ee.NM_DESPACHANTE FROM TDESPA' +
        'CHANTE ee (NOLOCK) '
      '          WHERE ee.CD_DESPACHANTE = pe.CD_CONSIGNATARIO )'
      ''
      ' end nome_consignatario,'
      ''
      ''
      ' case '
      '    rtrim(pe.TP_CONSIGNATARIO)'
      ''
      
        '    when '#39'0'#39' then (SELECT distinct  (RTRIM(ISNULL(ee.END_EMPRESA' +
        ', '#39#39')) + '#39', '#39'  +'
      
        '                                    RTRIM(ISNULL(ee.END_NUMERO, ' +
        #39#39'))  + '#39' '#39'   +'
      
        '                                    RTRIM(ISNULL(ee.END_COMPL, '#39 +
        #39'))   + '#39' - '#39' +'
      
        '                                    RTRIM(ISNULL(ee.END_CIDADE, ' +
        #39#39')))+'#39' - '#39'+rtrim(p.DESCRICAO)'
      
        '                                    FROM TEMPRESA_EST ee (NOLOCK' +
        ') '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CD_EMPRESA = pe.CD_' +
        'CONSIGNATARIO'
      
        '                                    AND ee.IN_IMPORTADOR = '#39'1'#39' A' +
        'ND ee.IN_ATIVO = '#39'1'#39')'
      ''
      
        '    when '#39'1'#39' then (SELECT distinct  (RTRIM(ISNULL(ee.END_EMPRESA' +
        ', '#39#39')) + '#39', '#39'  +'
      
        '                                    RTRIM(ISNULL(ee.END_NUMERO, ' +
        #39#39'))  + '#39' '#39'   +'
      
        '                                    RTRIM(ISNULL(ee.END_COMPL, '#39 +
        #39'))   + '#39' - '#39' +'
      
        '                                    RTRIM(ISNULL(ee.END_CIDADE, ' +
        #39#39')))+'#39' - '#39'+rtrim(p.DESCRICAO)'
      
        '                                    FROM TEMPRESA_EST ee (NOLOCK' +
        ') '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CD_EMPRESA = pe.CD_' +
        'CONSIGNATARIO'
      
        '                                    AND ee.IN_AGENTE = '#39'1'#39' AND e' +
        'e.IN_ATIVO = '#39'1'#39')'
      ''
      
        '    when '#39'3'#39' then (SELECT distinct  (RTRIM(ISNULL(ee.END_EMPRESA' +
        ', '#39#39')) + '#39', '#39'  +'
      
        '                                    RTRIM(ISNULL(ee.END_NUMERO, ' +
        #39#39'))  + '#39' '#39'   +'
      
        '                                    RTRIM(ISNULL(ee.END_COMPL, '#39 +
        #39'))   + '#39' - '#39' +'
      
        '                                    RTRIM(ISNULL(ee.END_CIDADE, ' +
        #39#39')))+'#39' - '#39'+rtrim(p.DESCRICAO)'
      
        '                                    FROM TEMPRESA_EST ee (NOLOCK' +
        ') '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CD_EMPRESA = pe.CD_' +
        'CONSIGNATARIO'
      
        '                                    AND ee.IN_BANCO = '#39'1'#39' AND ee' +
        '.IN_ATIVO = '#39'1'#39')'
      ''
      
        '    when '#39'2'#39' then (SELECT distinct  (rtrim(isnull(ee.END_CIA_TRA' +
        'NSP,'#39#39'))+'#39' , '#39'+'
      
        '                                     rtrim(isnull(ee.END_COMPL_C' +
        'IA_TRANSP,'#39#39')))+'#39' - '#39'+rtrim(p.DESCRICAO)'
      
        '                                    FROM TTRANSPORTADOR_ITL ee (' +
        'NOLOCK) '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CODIGO = pe.CD_CONS' +
        'IGNATARIO )'
      ''
      ''
      '    when '#39'4'#39' then '#39#39
      ''
      ' end end_pais_consignatario,'
      ''
      ''
      ' case '
      '    rtrim(pe.TP_CONSIGNATARIO)'
      ''
      '    when '#39'0'#39' then (SELECT distinct  rtrim(p.DESCRICAO)'
      
        '                                    FROM TEMPRESA_EST ee (NOLOCK' +
        ') '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CD_EMPRESA = pe.CD_' +
        'CONSIGNATARIO'
      
        '                                    AND ee.IN_IMPORTADOR = '#39'1'#39' A' +
        'ND ee.IN_ATIVO = '#39'1'#39')'
      ''
      '    when '#39'1'#39' then (SELECT distinct  rtrim(p.DESCRICAO)'
      
        '                                    FROM TEMPRESA_EST ee (NOLOCK' +
        ') '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CD_EMPRESA = pe.CD_' +
        'CONSIGNATARIO'
      
        '                                    AND ee.IN_AGENTE = '#39'1'#39' AND e' +
        'e.IN_ATIVO = '#39'1'#39')'
      ''
      '    when '#39'3'#39' then (SELECT distinct  rtrim(p.DESCRICAO)'
      
        '                                    FROM TEMPRESA_EST ee (NOLOCK' +
        ') '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CD_EMPRESA = pe.CD_' +
        'CONSIGNATARIO'
      
        '                                    AND ee.IN_BANCO = '#39'1'#39' AND ee' +
        '.IN_ATIVO = '#39'1'#39')'
      ''
      '    when '#39'2'#39' then (SELECT distinct  rtrim(p.DESCRICAO)'
      
        '                                    FROM TTRANSPORTADOR_ITL ee (' +
        'NOLOCK) '
      
        '                                    join TPais p on p.CODIGO = e' +
        'e.CD_PAIS'
      
        '                                    WHERE ee.CODIGO = pe.CD_CONS' +
        'IGNATARIO )'
      ''
      ''
      '    when '#39'4'#39' then '#39#39
      ''
      ' end pais_consignatario,'
      ''
      ''
      ' case vt.CD_VIA_TRANSPORTE'
      '    when '#39'01'#39' then '#39'MARITIMO'#39
      '    when '#39'02'#39' then '#39'FLUVIAL'#39
      '    when '#39'03'#39' then '#39'LACUSTRE'#39
      '    when '#39'04'#39' then '#39'AEREO'#39
      '    when '#39'05'#39' then '#39'POSTAL'#39
      '    when '#39'06'#39' then '#39'FERROVIARIO'#39
      '    when '#39'07'#39' then '#39'RODOVIARIO'#39
      '    when '#39'08'#39' then '#39'TUBO-CONDUTO'#39
      '    when '#39'09'#39' then '#39'MEIOS PROPRIOS'#39
      '    when '#39'12'#39' then '#39'BY SEA'#39
      ' end  MEIO_TRANSPORTE, en.CD_EMPRESA CD_CLIENTE'
      ''
      ''
      ' from TPROCESSO_EXP pe'
      ' join TPROCESSO pr          ON PR.NR_PROCESSO=PE.NR_PROCESSO'
      ' join TEmpresa_est ee       on pe.CD_IMPORTADOR = ee.CD_EMPRESA'
      
        ' join TEmpresa_nac en       on (pe.CD_EXPORTADOR = en.CD_EMPRESA' +
        ' AND 0=:PARAM) OR (pR.CD_CLIENTE = en.CD_EMPRESA AND 1=:PARAM)'
      
        ' join tPais pExp            on pExp.CODIGO= en.CD_PAIS_IMPORTADO' +
        'R'
      ' join tPais pImp            on pImp.CODIGO= pe.CD_PAIS_DESTINO'
      ' join TLOCAL_EMBARQUE le1   on le1.CODIGO = pe.CD_LOCAL_DESTINO'
      ' join TLOCAL_EMBARQUE le2   on le2.CODIGO = pe.CD_LOCAL_ORIGEM'
      
        ' join TVIA_TRANSPORTE vt    on vt.CD_VIA_TRANSPORTE = pe.CD_VIA_' +
        'TRANSPORTE'
      ''
      ' where pe.NR_PROCESSO = :NR_PROCESSO'
      ''
      
        ' and pe.NR_PROCESSO in (select pei.NR_PROCESSO from TPROCESSO_EX' +
        'P_ITEM pei where IsNull(pei.NR_PROCESSO,'#39#39')<>'#39#39' and IsNull(pei.N' +
        'R_PEDIDO,'#39#39')<>'#39#39')'
      ' '
      ''
      ''
      
        '/* and exists(select top 1 p.CD_ACORDO from TCONFIG_PAIS_ACORDO_' +
        'NORMA_PADRAO p where p.CD_PAIS=pe.CD_PAIS_DESTINO and p.CD_ACORD' +
        'O<>'#39'FORM-A'#39' and p.CD_ACORDO<> '#39'ACE 43'#39' and p.CD_ACORDO<>'#39'ACE 02'#39 +
        ' and p.CD_ACORDO<>'#39'ACE 14'#39'  )*/'
      ' and isNull(pe.cd_consignatario,'#39#39')<>'#39#39
      ''
      ''
      ''
      ''
      ' order by  pe.NR_PROCESSO, ee.CD_EMPRESA'
      ' '
      ''
      ''
      ''
      ''
      '')
    Left = 144
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'PARAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PARAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_expNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_EXP.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_expDT_FATURA: TDateTimeField
      Alignment = taCenter
      FieldName = 'DT_FATURA'
    end
    object qry_processo_expcd_acordo_cool: TStringField
      FieldKind = fkCalculated
      FieldName = 'cd_acordo_cool'
      Calculated = True
    end
    object qry_processo_expNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qry_processo_expEND_IMPORTADOR: TStringField
      FieldName = 'END_IMPORTADOR'
      FixedChar = True
      Size = 111
    end
    object qry_processo_expCD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_processo_expCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_processo_expcd_pais_importador_COOL: TStringField
      FieldKind = fkCalculated
      FieldName = 'cd_pais_importador_COOL'
      Calculated = True
    end
    object qry_processo_expnome_consignatario: TStringField
      FieldName = 'nome_consignatario'
      FixedChar = True
      Size = 60
    end
    object qry_processo_expend_pais_consignatario: TStringField
      FieldName = 'end_pais_consignatario'
      FixedChar = True
      Size = 255
    end
    object qry_processo_expEND_PAIS_EXPORTADOR: TStringField
      FieldName = 'END_PAIS_EXPORTADOR'
      FixedChar = True
      Size = 255
    end
    object qry_processo_expCIDADE_DESTINO: TStringField
      FieldName = 'CIDADE_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_expPais_Destino: TStringField
      FieldName = 'Pais_Destino'
      FixedChar = True
      Size = 120
    end
    object qry_processo_expMEIO_TRANSPORTE: TStringField
      FieldName = 'MEIO_TRANSPORTE'
      FixedChar = True
    end
    object qry_processo_exppais_consignatario: TStringField
      FieldName = 'pais_consignatario'
      FixedChar = True
      Size = 120
    end
    object qry_processo_expLOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qry_processo_expNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qry_processo_expCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_processo_expAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_processo_expCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
  end
  object ds_processo_exp: TDataSource
    DataSet = qry_processo_exp
    Left = 56
    Top = 360
  end
  object ds_faturas_exportador: TDataSource
    DataSet = qry_faturas_exportador
    Left = 50
    Top = 416
  end
  object qry_faturas_exportador: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' select '
      '       pep.NR_FATURA,'
      '       pep.TX_MARCACAO_VOLUME,'
      '       pep.TX_INF_EMBALAGEM,'
      '       isNull( pep.VL_PESO_LIQUIDO,0) VL_PESO_LIQUIDO ,'
      '       isNull( pep.VL_PESO_BRUTO,0) VL_PESO_BRUTO'
      '  ,case '
      '   when isNull(pep.VL_DESCONTO,0) > 0 then'
      '      case when pe.CD_LINGUA_PEDIDO='#39'0'#39' then'
      
        '          cast(pep.TX_MERCADORIA as Varchar(450)) +'#39' - Desconto:' +
        ' '#39'+mb.AP_MOEDA+'#39' '#39'+Cast(isNull(pep.VL_DESCONTO,0) as Varchar(15)' +
        ')'
      ''
      '           when pe.CD_LINGUA_PEDIDO='#39'1'#39' then'
      
        '          cast(pep.TX_MERCADORIA as Varchar(450)) +'#39' - Discount:' +
        ' '#39'+mb.AP_MOEDA+'#39' '#39'+Cast(isNull(pep.VL_DESCONTO,0) as Varchar(15)' +
        ')'
      '      '
      '           when pe.CD_LINGUA_PEDIDO='#39'2'#39' then'
      
        '          cast(pep.TX_MERCADORIA as Varchar(450)) +'#39' - Descuento' +
        ': '#39'+mb.AP_MOEDA+'#39' '#39'+Cast(isNull(pep.VL_DESCONTO,0) as Varchar(15' +
        '))'
      '      end'
      '    else'
      '       cast(pep.TX_MERCADORIA as Varchar(450))'
      '   end OBS '
      ' from'
      ' TPROCESSO_EXP_PEDIDO pep'
      
        ' left join Tprocesso_Exp pe on pe.NR_FATURA = pep.NR_PEDIDO  and' +
        ' pe.NR_PROCESSO = pep.NR_PROCESSO'
      ' left join tMoeda_Broker mb on mb.CD_MOEDA = pe.CD_MOEDA'
      ' where pep.NR_PROCESSO =  :NR_PROCESSO'
      ''
      ''
      'order by   pep.NR_FATURA')
    Left = 146
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_faturas_exportadorNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_faturas_exportadorTX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_MARCACAO_VOLUME'
      BlobType = ftMemo
      Transliterate = False
    end
    object qry_faturas_exportadorTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_faturas_exportadorVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_PESO_LIQUIDO'
    end
    object qry_faturas_exportadorVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_PESO_BRUTO'
    end
    object qry_faturas_exportadorOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 255
    end
  end
  object ds_faturas_itens: TDataSource
    DataSet = qry_faturas_exportador_itens
    Left = 714
    Top = 472
  end
  object qry_faturas_exportador_itens: TQuery
    OnCalcFields = qry_faturas_exportador_itensCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '/* itens do processo */'
      ' select'
      '  df.CD_DECLARACAO ,'
      ' case '
      '    when pei.CD_ACORDO='#39'ACE 18'#39' then'
      '       pei.CD_NCM'
      '    else'
      '       pei.CD_NALADI_SH'
      ' end CD_NCM_NALADI  '
      ''
      ' ,m.NM_UNID_MEDIDA EMBALAGEM,'
      ' case '
      '    when pei.CD_ACORDO='#39'ACE 18'#39' then'
      '       ncm.DESCRICAO'
      '    else'
      '       n.DESCRICAO'
      ' end DENOMINACAO_NCM_NALADI  '
      ' ,pei.CD_UNID_MEDIDA  '
      ' , isNull(cast(pei.CD_UNID_MEDIDA as Int),0) CD_MEDIDA_NUMERICO'
      ' ,pei.CD_NORMAS'
      ' ,pei.NR_PEDIDO '
      ' ,sum(pei.QT_MERCADORIA) QT_MERCADORIA  '
      ' ,sum( pei.VL_TOT_ITEM) VL_TOT_ITEM'
      ''
      ' from TPROCESSO_EXP_ITEM pei '
      
        ' join TPROCESSO_EXP pe           ON pe.NR_PROCESSO     = pei.NR_' +
        'PROCESSO '
      
        ' JOIN TUNID_MEDIDA_BROKER M      ON pei.CD_UNID_MEDIDA = M.CD_UN' +
        'ID_MEDIDA '
      
        ' left join TNALADISH_EXP n           ON pei.CD_NALADI_SH   = n.C' +
        'odigo'
      
        ' left join TNCM_EXP ncm              ON pei.CD_NCM         = ncm' +
        '.CODIGO   '
      
        ' left join TDeclaracoes_Fiesp df ON pe.CD_EXPORTADOR   = df.CD_E' +
        'MPRESA  and pei.CD_ACORDO = df.CD_ACORDO_BROKER   and df.in_ativ' +
        'o=1'
      
        ' and df.CD_NCM_NALADI= case when pei.CD_ACORDO = '#39'ACE 18'#39' then p' +
        'ei.CD_NCM else pei.CD_NALADI_SH end  '
      ''
      ''
      
        '  where pei.NR_PROCESSO = :NR_PROCESSO and pei.NR_PEDIDO = :NR_P' +
        'EDIDO'
      '  AND pei.CD_NORMAS<>0'
      ''
      ' Group By   df.CD_DECLARACAO ,'
      ' case '
      '    when pei.CD_ACORDO='#39'ACE 18'#39' then'
      '       pei.CD_NCM'
      '    else'
      '       pei.CD_NALADI_SH'
      ' end '
      ''
      ' ,m.NM_UNID_MEDIDA,'
      ' case '
      '    when pei.CD_ACORDO='#39'ACE 18'#39' then'
      '       ncm.DESCRICAO'
      '    else'
      '       n.DESCRICAO'
      ' end '
      ' ,pei.CD_UNID_MEDIDA  '
      ' , isNull(cast(pei.CD_UNID_MEDIDA as Int),0)'
      ' ,pei.CD_NORMAS'
      ' ,pei.NR_PEDIDO ')
    Left = 618
    Top = 472
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PEDIDO'
        ParamType = ptInput
      end>
    object qry_faturas_exportador_itenscd_unidade_medida_COOL: TStringField
      FieldKind = fkCalculated
      FieldName = 'cd_unidade_medida_COOL'
      Calculated = True
    end
    object qry_faturas_exportador_itensCD_DECLARACAO: TStringField
      FieldName = 'CD_DECLARACAO'
      FixedChar = True
      Size = 10
    end
    object qry_faturas_exportador_itensCD_NCM_NALADI: TStringField
      FieldName = 'CD_NCM_NALADI'
      FixedChar = True
      Size = 11
    end
    object qry_faturas_exportador_itensEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      FixedChar = True
      Size = 50
    end
    object qry_faturas_exportador_itensDENOMINACAO_NCM_NALADI: TStringField
      FieldName = 'DENOMINACAO_NCM_NALADI'
      FixedChar = True
      Size = 120
    end
    object qry_faturas_exportador_itensCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_faturas_exportador_itensCD_MEDIDA_NUMERICO: TIntegerField
      FieldName = 'CD_MEDIDA_NUMERICO'
    end
    object qry_faturas_exportador_itensCD_NORMAS: TStringField
      FieldName = 'CD_NORMAS'
      FixedChar = True
      Size = 10
    end
    object qry_faturas_exportador_itensNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 18
    end
    object qry_faturas_exportador_itensQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qry_faturas_exportador_itensVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
  end
  object qry_certificados: TQuery
    CachedUpdates = True
    AfterOpen = qry_certificadosAfterOpen
    BeforeScroll = qry_certificadosBeforeScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' ')
    UpdateMode = upWhereChanged
    UpdateObject = upd_certificados
    Left = 660
    Top = 336
  end
  object ds_certificados: TDataSource
    DataSet = qry_certificados
    Left = 708
    Top = 392
  end
  object pop_normas: TPopupMenu
    Left = 700
    Top = 79
    object AlterarNorma1: TMenuItem
      Caption = 'Alterar Norma'
      OnClick = AlterarNorma1Click
    end
  end
  object upd_certificados: TUpdateSQL
    Left = 732
    Top = 333
  end
  object qry_acordos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT CD_ACORDO'
      'FROM   TPROCESSO_EXP_ITEM'
      'WHERE  NR_PROCESSO = :NR_PROCESSO '
      'AND NR_PEDIDO = :NR_PEDIDO'
      '')
    Left = 156
    Top = 469
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PEDIDO'
        ParamType = ptUnknown
      end>
    object qry_acordosCD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.CD_ACORDO'
      FixedChar = True
      Size = 10
    end
  end
  object ds_acordos: TDataSource
    DataSet = qry_acordos
    Left = 60
    Top = 469
  end
end
