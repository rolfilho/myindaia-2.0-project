object frm_cliente_armazem: Tfrm_cliente_armazem
  Left = 126
  Top = 134
  Width = 750
  Height = 550
  Caption = 'Cliente X Armaz'#233'm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Incluir'
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
    object btn_excluir: TSpeedButton
      Left = 119
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Excluir'
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
    object btn_sair: TSpeedButton
      Left = 389
      Top = 4
      Width = 38
      Height = 41
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
    object btn_salvar: TSpeedButton
      Left = 43
      Top = 4
      Width = 38
      Height = 41
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
      Left = 81
      Top = 4
      Width = 38
      Height = 41
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
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 45
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 0
      object lbl_pesquisa: TLabel
        Left = 12
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ordem_pesquisa: TLabel
        Left = 148
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_chave: TEdit
        Left = 12
        Top = 20
        Width = 129
        Height = 21
        TabStop = False
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        TabStop = False
      end
    end
    object dbnvg: TDBNavigator
      Left = 232
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_cliente_numerario.ds_cliente_numerario
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object pgctrl_despesas: TPageControl
    Left = 0
    Top = 49
    Width = 742
    Height = 455
    ActivePage = ts_despesas_lista
    Align = alClient
    TabOrder = 1
    object ts_despesas_lista: TTabSheet
      Caption = 'Listagem de Armaz'#233'ns'
      object shp1: TShape
        Left = 8
        Top = 8
        Width = 718
        Height = 52
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl2: TLabel
        Left = 8
        Top = 68
        Width = 250
        Height = 13
        Caption = 'Listagem de Armaz'#233'ns cadastrados para esse cliente'
      end
      object lbl9: TLabel
        Left = 18
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object dbgrd2: TDBGrid
        Left = 8
        Top = 82
        Width = 719
        Height = 335
        DataSource = dsClienteArmazem
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ARMAZEM'
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ARMAZEM'
            Title.Caption = 'Nome do Armaz'#233'm'
            Width = 516
            Visible = True
          end>
      end
      object ed1: TEdit
        Left = 18
        Top = 31
        Width = 101
        Height = 19
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object ed2: TEdit
        Left = 118
        Top = 31
        Width = 599
        Height = 19
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object pnlIncluirArmazem: TPanel
        Left = 123
        Top = 200
        Width = 497
        Height = 77
        TabOrder = 3
        Visible = False
        object shp8: TShape
          Left = 8
          Top = 8
          Width = 481
          Height = 61
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl1: TLabel
          Left = 19
          Top = 22
          Width = 207
          Height = 13
          Caption = 'Selecione o armaz'#233'm e clique em " Salvar "'
        end
        object btn_co_amz_atr_im: TSpeedButton
          Left = 451
          Top = 35
          Width = 25
          Height = 22
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
          OnClick = btn_co_amz_atr_imClick
        end
        object ed_nm_amz: TEdit
          Left = 69
          Top = 35
          Width = 381
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_amz_atr_im: TDBEdit
          Left = 20
          Top = 35
          Width = 50
          Height = 21
          DataField = 'CD_ARMAZEM'
          DataSource = dsClienteArmazem
          TabOrder = 0
        end
      end
    end
    object ts_despesas_config: TTabSheet
      Caption = 'Configura'#231#227'o de Despesas'
      ImageIndex = 1
      object pgc1: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 427
        ActivePage = ts1
        Align = alClient
        TabOrder = 0
        object ts1: TTabSheet
          Caption = 'Listagem das Despesas'
          object lbl13: TLabel
            Left = 8
            Top = 62
            Width = 112
            Height = 13
            Caption = 'Listagem das Despesas'
          end
          object shp7: TShape
            Left = 8
            Top = 6
            Width = 709
            Height = 51
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl14: TLabel
            Left = 19
            Top = 16
            Width = 43
            Height = 13
            Caption = 'Armaz'#233'm'
          end
          object dbgrd3: TDBGrid
            Left = 8
            Top = 76
            Width = 710
            Height = 312
            DataSource = dsDespesasBasicas
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NM_ITEM'
                Title.Caption = 'Item'
                Width = 201
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_DESCRICAO_DESPESA'
                Title.Caption = 'Descri'#231#227'o da Despesa'
                Width = 262
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_VALOR_LIMITE'
                Title.Caption = 'Valor Limite'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_PERIODO'
                Title.Caption = 'Per'#237'odo'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_MARGEM'
                Title.Caption = 'Margem'
                Width = 72
                Visible = True
              end>
          end
          object ed4: TEdit
            Left = 18
            Top = 29
            Width = 101
            Height = 19
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object ed5: TEdit
            Left = 118
            Top = 29
            Width = 590
            Height = 19
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ts2: TTabSheet
          Caption = 'Configura'#231#227'o / Valores / Per'#237'odos'
          ImageIndex = 1
          object shp2: TShape
            Left = 8
            Top = 6
            Width = 709
            Height = 383
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp4: TShape
            Left = 16
            Top = 63
            Width = 693
            Height = 104
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp5: TShape
            Left = 33
            Top = 129
            Width = 130
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp3: TShape
            Left = 16
            Top = 14
            Width = 693
            Height = 48
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl4: TLabel
            Left = 33
            Top = 76
            Width = 20
            Height = 13
            Caption = 'Item'
            FocusControl = dbedt2
            Transparent = True
          end
          object lbl6: TLabel
            Left = 464
            Top = 116
            Width = 75
            Height = 13
            Caption = 'Limitar por Valor'
            FocusControl = edt_valor_inicial
            Transparent = True
          end
          object lbl8: TLabel
            Left = 196
            Top = 116
            Width = 62
            Height = 13
            Caption = 'Qtde de Dias'
            FocusControl = dbedt6
            Transparent = True
          end
          object lbl10: TLabel
            Left = 32
            Top = 259
            Width = 67
            Height = 13
            Caption = 'Valor Principal'
            FocusControl = dbedt8
          end
          object lbl11: TLabel
            Left = 184
            Top = 259
            Width = 132
            Height = 13
            Caption = 'M'#237'nimo para Containers 20"'
            FocusControl = dbedt9
          end
          object lbl12: TLabel
            Left = 336
            Top = 259
            Width = 132
            Height = 13
            Caption = 'M'#237'nimo para Containers 40"'
            FocusControl = dbedt10
          end
          object lbl3: TLabel
            Left = 26
            Top = 21
            Width = 108
            Height = 13
            Caption = 'Descri'#231#227'o da Despesa'
            FocusControl = dbedt1
            Transparent = True
          end
          object lbl5: TLabel
            Left = 33
            Top = 116
            Width = 38
            Height = 13
            Caption = 'Per'#237'odo'
            FocusControl = edt_periodo
            Transparent = True
          end
          object btn1: TSpeedButton
            Left = 666
            Top = 88
            Width = 25
            Height = 23
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
          object img2: TImage
            Left = 605
            Top = 129
            Width = 19
            Height = 20
            Hint = 
              'Nesse campo voc'#234' limita per'#237'odos pelo valor do CIF.'#13#10'Se quiser p' +
              'or exemplo, limitar para CIF entre'#13#10'0 e 5000, preencha o primeir' +
              'o campo com " 0 " e o '#13#10'segundo com " 5000 ".'#13#10'Se quiser limitar' +
              ' um segundo per'#237'odo para maior'#13#10'de 5000, coloque " 5000 " e " ..' +
              '. ".'#13#10'Se n'#227'o desejar limitar, deixe os dois campos em branco.'
            Center = True
            ParentShowHint = False
            Picture.Data = {
              07544269746D6170F6000000424DF60000000000000076000000280000000F00
              000010000000010004000000000080000000C40E0000C40E0000100000000000
              0000000000000000800000800000008080008000000080008000808000007F7F
              7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
              0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
              0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
              F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
              3330}
            ShowHint = True
            Transparent = True
          end
          object img1: TImage
            Left = 163
            Top = 129
            Width = 19
            Height = 20
            Hint = 
              'Nesse campo '#233' colocado o per'#237'odo para esses valores. '#13#10'Caso voc'#234 +
              ' queira colocar esses valor para o per'#237'odo 1, 2 ou 3 em diante, ' +
              #13#10'basta clicar em " em diante ".'#13#10
            Center = True
            ParentShowHint = False
            Picture.Data = {
              07544269746D6170F6000000424DF60000000000000076000000280000000F00
              000010000000010004000000000080000000C40E0000C40E0000100000000000
              0000000000000000800000800000008080008000000080008000808000007F7F
              7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
              0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
              0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
              F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
              3330}
            ShowHint = True
            Transparent = True
          end
          object lbl7: TLabel
            Left = 526
            Top = 134
            Width = 15
            Height = 13
            Caption = 'at'#233
            FocusControl = edt_valor_inicial
            Transparent = True
          end
          object shp6: TShape
            Left = 464
            Top = 129
            Width = 139
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object edt_valor_inicial: TEdit
            Left = 464
            Top = 129
            Width = 59
            Height = 21
            TabOrder = 5
          end
          object dbedt6: TDBEdit
            Left = 196
            Top = 129
            Width = 65
            Height = 21
            DataField = 'QT_DIAS'
            DataSource = dsDespesasBasicas
            TabOrder = 3
          end
          object dbedt8: TDBEdit
            Left = 32
            Top = 272
            Width = 134
            Height = 21
            DataField = 'VL_PRINCIPAL'
            DataSource = dsDespesasBasicas
            TabOrder = 7
          end
          object dbedt9: TDBEdit
            Left = 184
            Top = 272
            Width = 134
            Height = 21
            DataField = 'VL_MINIMO_20'
            DataSource = dsDespesasBasicas
            TabOrder = 8
          end
          object dbedt10: TDBEdit
            Left = 336
            Top = 272
            Width = 134
            Height = 21
            DataField = 'VL_MINIMO_40'
            DataSource = dsDespesasBasicas
            TabOrder = 9
          end
          object dbedt1: TDBEdit
            Left = 25
            Top = 34
            Width = 676
            Height = 22
            AutoSize = False
            BevelInner = bvLowered
            BevelOuter = bvNone
            BevelKind = bkFlat
            Color = clWhite
            Ctl3D = False
            DataField = 'TX_DESCRICAO_DESPESA'
            DataSource = dsDespesasBasicas
            ParentCtl3D = False
            TabOrder = 0
          end
          object edt_periodo: TEdit
            Left = 33
            Top = 129
            Width = 56
            Height = 21
            TabOrder = 2
          end
          object ed3: TEdit
            Left = 75
            Top = 89
            Width = 590
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 10
          end
          object dbedt2: TDBEdit
            Left = 33
            Top = 89
            Width = 43
            Height = 21
            DataField = 'CD_ITEM'
            DataSource = dsDespesasBasicas
            TabOrder = 1
          end
          object dbrgrp1: TDBRadioGroup
            Left = 274
            Top = 116
            Width = 178
            Height = 35
            Caption = 'Margem'
            Columns = 2
            DataField = 'CD_MARGEM'
            DataSource = dsDespesasBasicas
            Items.Strings = (
              'Esquerda'
              'Direita')
            TabOrder = 4
            Values.Strings = (
              'E'
              'D')
          end
          object dbrgrp2: TDBRadioGroup
            Left = 32
            Top = 195
            Width = 153
            Height = 49
            Caption = 'Tipo de Calculo'
            Columns = 2
            DataField = 'TX_TIPO_CALCULO'
            DataSource = dsDespesasBasicas
            Items.Strings = (
              '% CIF'
              'FIXO')
            TabOrder = 6
            Values.Strings = (
              '%CIF'
              'FIXO')
          end
          object chk_emdiante: TCheckBox
            Left = 92
            Top = 132
            Width = 69
            Height = 17
            Caption = 'em diante'
            TabOrder = 11
          end
          object edt_valor_final: TEdit
            Left = 544
            Top = 129
            Width = 59
            Height = 21
            TabOrder = 12
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 182
    Top = 3
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Hint = ' '
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object dsDespesasBasicas: TDataSource
    DataSet = qryDespesasBasicas
    Left = 576
    Top = 383
  end
  object qryDespesasBasicas: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    DataSource = datm_amz.ds_amz
    SQL.Strings = (
      'SELECT *'
      '  FROM TARMAZEM_DESPESAS AD'
      '  INNER      JOIN TITEM IT ON ADB.CD_ITEM = IT.CD_ITEM'
      '  LEFT OUTER JOIN TMARGEM MA ON ADB.CD_MARGEM = MA.CD_MARGEM'
      'WHERE     (ADB.CD_ARMAZEM = :CD_ARMAZEM)')
    Left = 664
    Top = 335
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end>
    object qryDespesasBasicasCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryDespesasBasicasCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryDespesasBasicasCD_DESPESA_BASICA: TIntegerField
      FieldName = 'CD_DESPESA_BASICA'
    end
    object qryDespesasBasicasTX_VALOR_LIMITE: TStringField
      FieldName = 'TX_VALOR_LIMITE'
      FixedChar = True
    end
    object qryDespesasBasicasCD_MARGEM: TStringField
      FieldName = 'CD_MARGEM'
      FixedChar = True
      Size = 1
    end
    object qryDespesasBasicasQT_DIAS: TIntegerField
      FieldName = 'QT_DIAS'
    end
    object qryDespesasBasicasTX_TIPO_CALCULO: TStringField
      FieldName = 'TX_TIPO_CALCULO'
      FixedChar = True
      Size = 10
    end
    object qryDespesasBasicasVL_PRINCIPAL: TFloatField
      FieldName = 'VL_PRINCIPAL'
    end
    object qryDespesasBasicasVL_MINIMO_20: TFloatField
      FieldName = 'VL_MINIMO_20'
    end
    object qryDespesasBasicasVL_MINIMO_40: TFloatField
      FieldName = 'VL_MINIMO_40'
    end
    object qryDespesasBasicasVL_DESP_CIF: TStringField
      FieldName = 'VL_DESP_CIF'
      FixedChar = True
      Size = 50
    end
    object qryDespesasBasicasVL_DESP_VALOR: TStringField
      FieldName = 'VL_DESP_VALOR'
      FixedChar = True
      Size = 50
    end
    object qryDespesasBasicasTX_DESCRICAO_DESPESA: TStringField
      FieldName = 'TX_DESCRICAO_DESPESA'
      FixedChar = True
      Size = 200
    end
    object qryDespesasBasicasTX_PERIODO: TStringField
      FieldName = 'TX_PERIODO'
      FixedChar = True
      Size = 10
    end
    object qryDespesasBasicasNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qryDespesasBasicasNM_MARGEM: TStringField
      FieldName = 'NM_MARGEM'
      FixedChar = True
      Size = 8
    end
  end
  object updDespesasBasicas: TUpdateSQL
    ModifySQL.Strings = (
      'update TARMAZEM_DESPESAS_BASICAS'
      'set'
      '  CD_ARMAZEM = :CD_ARMAZEM,'
      '  CD_ITEM = :CD_ITEM,'
      '  CD_DESPESA_BASICA = :CD_DESPESA_BASICA,'
      '  TX_DESCRICAO_DESPESA = :TX_DESCRICAO_DESPESA,'
      '  TX_VALOR_LIMITE = :TX_VALOR_LIMITE,'
      '  CD_MARGEM = :CD_MARGEM,'
      '  TX_PERIODO = :TX_PERIODO,'
      '  QT_DIAS = :QT_DIAS,'
      '  TX_TIPO_CALCULO = :TX_TIPO_CALCULO,'
      '  VL_PRINCIPAL = :VL_PRINCIPAL,'
      '  VL_MINIMO_20 = :VL_MINIMO_20,'
      '  VL_MINIMO_40 = :VL_MINIMO_40,'
      '  VL_DESP_CIF = :VL_DESP_CIF,'
      '  VL_DESP_VALOR = :VL_DESP_VALOR'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_DESPESA_BASICA = :OLD_CD_DESPESA_BASICA')
    InsertSQL.Strings = (
      'insert into TARMAZEM_DESPESAS_BASICAS'
      
        '  (CD_ARMAZEM, CD_ITEM, CD_DESPESA_BASICA, TX_DESCRICAO_DESPESA,' +
        ' TX_VALOR_LIMITE, '
      
        '   CD_MARGEM, TX_PERIODO, QT_DIAS, TX_TIPO_CALCULO, VL_PRINCIPAL' +
        ', VL_MINIMO_20, '
      '   VL_MINIMO_40, VL_DESP_CIF, VL_DESP_VALOR)'
      'values'
      
        '  (:CD_ARMAZEM, :CD_ITEM, :CD_DESPESA_BASICA, :TX_DESCRICAO_DESP' +
        'ESA, :TX_VALOR_LIMITE, '
      
        '   :CD_MARGEM, :TX_PERIODO, :QT_DIAS, :TX_TIPO_CALCULO, :VL_PRIN' +
        'CIPAL, '
      '   :VL_MINIMO_20, :VL_MINIMO_40, :VL_DESP_CIF, :VL_DESP_VALOR)')
    DeleteSQL.Strings = (
      'delete from TARMAZEM_DESPESAS_BASICAS'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_DESPESA_BASICA = :OLD_CD_DESPESA_BASICA')
    Left = 664
    Top = 383
  end
  object qryClienteArmazem: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    DataSource = datm_cliente.ds_empresa_nac
    SQL.Strings = (
      'SELECT * '
      '  FROM TCLIENTE_ARMAZEM CA, TARMAZEM AR'
      'WHERE CA.CD_CLIENTE = :CD_EMPRESA'
      'AND AR.CD_ARMAZEM = CA.CD_ARMAZEM')
    UpdateObject = updDespesasBasicas
    Left = 656
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
        Size = 6
      end>
    object qryClienteArmazemCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TCLIENTE_ARMAZEM.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryClienteArmazemCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'DBBROKER.TCLIENTE_ARMAZEM.CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryClienteArmazemNM_ARMAZEM: TStringField
      FieldName = 'NM_ARMAZEM'
      Origin = 'DBBROKER.TCLIENTE_ARMAZEM.CD_CLIENTE'
      FixedChar = True
      Size = 50
    end
  end
  object dsClienteArmazem: TDataSource
    DataSet = qryClienteArmazem
    Left = 552
    Top = 223
  end
end
