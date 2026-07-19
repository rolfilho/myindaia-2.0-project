object frm_pendencias: Tfrm_pendencias
  Left = 352
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ' Controle de Pend'#234'ncias'
  ClientHeight = 543
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_opcao_pendencias: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 38
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      743
      38)
    object Shape2: TShape
      Left = 472
      Top = 3
      Width = 213
      Height = 31
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 703
      Top = 4
      Width = 28
      Height = 30
      Hint = 'Sair'
      Anchors = [akTop, akRight]
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
      Left = 35
      Top = 4
      Width = 29
      Height = 30
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 65
      Top = 4
      Width = 30
      Height = 30
      Hint = 'Cancelar'
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
      OnClick = btn_cancelarClick
    end
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 30
      Height = 30
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
      Left = 96
      Top = 4
      Width = 30
      Height = 30
      Hint = 'Cancelar pend'#234'ncia'
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
    object DBText2: TDBText
      Left = 482
      Top = 7
      Width = 194
      Height = 26
      DataField = 'NR_PROCESSO2'
      DataSource = dsPendenciasGrid
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_solicitar: TSpeedButton
      Left = 128
      Top = 4
      Width = 99
      Height = 30
      Hint = 'Solicitar pend'#234'ncia'
      Caption = 'Solicitar'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_solicitarClick
    end
    object btn_historico_email_geral: TSpeedButton
      Left = 231
      Top = 4
      Width = 28
      Height = 30
      Hint = 'Enviar por email'
      Anchors = [akTop, akRight]
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_historico_emailClick
    end
    object btn_proc_realiza: TSpeedButton
      Left = 275
      Top = 4
      Width = 30
      Height = 30
      Hint = 'Realiza'#231#227'o por Processo - <CTRL+F2>'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_proc_realizaClick
    end
  end
  object pnlPendencias: TPanel
    Left = 0
    Top = 38
    Width = 743
    Height = 505
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object pnl_titulo: TPanel
      Left = 5
      Top = 5
      Width = 732
      Height = 143
      BevelOuter = bvNone
      TabOrder = 0
      object shp_titulo: TShape
        Left = 0
        Top = 0
        Width = 732
        Height = 143
        Align = alClient
        Brush.Color = clBtnFace
        Pen.Color = clTeal
      end
      object lblTitulo: TLabel
        Left = 8
        Top = 4
        Width = 35
        Height = 13
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 43
        Width = 45
        Height = 13
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_contato: TSpeedButton
        Left = 283
        Top = 56
        Width = 23
        Height = 23
        Hint = 'Procurar contato'
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
        OnClick = btn_co_contatoClick
      end
      object btn_incluir_contato: TSpeedButton
        Left = 309
        Top = 74
        Width = 23
        Height = 23
        Hint = 'Incluir contato'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_incluir_contatoClick
      end
      object btn_excluir_contato: TSpeedButton
        Left = 309
        Top = 98
        Width = 23
        Height = 23
        Hint = 'Remover contato'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_excluir_contatoClick
      end
      object dbedt_nm_contato: TEdit
        Left = 54
        Top = 57
        Width = 227
        Height = 19
        TabStop = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object lbContatos: TListBox
        Left = 334
        Top = 57
        Width = 386
        Height = 80
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
      end
      object edt_co_contato: TEdit
        Left = 9
        Top = 57
        Width = 43
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnChange = btn_co_contatoClick
      end
      object rxle_nm_pendencia: TDBLookupComboBox
        Left = 8
        Top = 19
        Width = 714
        Height = 21
        KeyField = 'NM_PENDENCIA'
        ListField = 'NM_PENDENCIA'
        ListSource = dsLookupPendencias
        NullValueKey = 17
        TabOrder = 3
      end
    end
    object pnl_grid: TPanel
      Left = 5
      Top = 152
      Width = 732
      Height = 350
      BevelOuter = bvNone
      TabOrder = 1
      object shp_grid: TShape
        Left = 0
        Top = 0
        Width = 732
        Height = 350
        Align = alClient
        Brush.Color = clBtnFace
        Pen.Color = clTeal
      end
      object dbg_pendencias: TDBGrid
        Left = 4
        Top = 4
        Width = 724
        Height = 342
        Ctl3D = False
        DataSource = dsPendenciasGrid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbg_pendenciasDrawColumnCell
        OnDblClick = dbg_pendenciasDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_PENDENCIA'
            Title.Caption = 'T'#237'tulo'
            Width = 259
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_STATUS'
            Title.Caption = 'Status'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_NOME_USUARIO'
            Title.Caption = 'Usu'#225'rio'
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_NOME_CONTATO'
            Title.Caption = 'Contato'
            Width = 157
            Visible = True
          end>
      end
    end
  end
  object pnl_historico_pendencias: TPanel
    Left = 66
    Top = 170
    Width = 615
    Height = 343
    BevelInner = bvLowered
    TabOrder = 2
    Visible = False
    object pnl_historico_pendencias1: TPanel
      Left = 5
      Top = 5
      Width = 605
      Height = 334
      BevelOuter = bvNone
      Caption = 'pnl_historico_pendencias1'
      TabOrder = 0
      DesignSize = (
        605
        334)
      object shp_historico_pendencias: TShape
        Left = 0
        Top = 0
        Width = 605
        Height = 334
        Align = alClient
        Brush.Color = clBtnFace
        Pen.Color = clTeal
      end
      object btn_historico_sair: TSpeedButton
        Left = 571
        Top = 5
        Width = 28
        Height = 30
        Hint = 'Sair'
        Anchors = [akTop, akRight]
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
        OnClick = btn_historico_sairClick
      end
      object lbl_nome_interno: TLabel
        Left = 144
        Top = 316
        Width = 69
        Height = 13
        Caption = 'Analista Indai'#225
      end
      object lbl_nome_externo: TLabel
        Left = 24
        Top = 316
        Width = 72
        Height = 13
        Caption = 'Analista Cliente'
      end
      object btn_historico_email: TSpeedButton
        Left = 571
        Top = 46
        Width = 28
        Height = 30
        Hint = 'Enviar por email'
        Anchors = [akTop, akRight]
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_historico_emailClick
      end
      object mm_historico: TMemo
        Left = 4
        Top = 256
        Width = 549
        Height = 55
        Ctl3D = False
        MaxLength = 5000
        ParentCtl3D = False
        TabOrder = 0
        OnChange = mm_historicoChange
      end
      object pnl_historico_aux: TPanel
        Left = 5
        Top = 4
        Width = 548
        Height = 250
        BevelOuter = bvNone
        Color = clWindow
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 548
          Height = 250
          Align = alClient
        end
        object re_historico_texto: TRichEdit
          Left = 1
          Top = 1
          Width = 546
          Height = 248
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            'RichEdit1')
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object btn_historico_ok: TBitBtn
        Left = 556
        Top = 256
        Width = 45
        Height = 55
        Caption = 'OK'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btn_historico_okClick
      end
      object pnl_legenda_externo: TPanel
        Left = 6
        Top = 315
        Width = 13
        Height = 13
        BevelOuter = bvNone
        Color = clTeal
        TabOrder = 3
      end
      object pnl_legenda_interno: TPanel
        Left = 126
        Top = 315
        Width = 13
        Height = 13
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 4
      end
    end
  end
  object pnl_historico_email: TPanel
    Left = 112
    Top = 229
    Width = 493
    Height = 98
    BevelInner = bvLowered
    TabOrder = 3
    Visible = False
    object pnl_historico_email_geral: TPanel
      Left = 4
      Top = 4
      Width = 485
      Height = 90
      BevelOuter = bvNone
      TabOrder = 0
      object shp_historico_email: TShape
        Left = 0
        Top = 0
        Width = 485
        Height = 90
        Align = alClient
        Brush.Color = clBtnFace
      end
      object btn_email_enviar: TButton
        Left = 168
        Top = 57
        Width = 74
        Height = 25
        Caption = 'Enviar'
        TabOrder = 2
        OnClick = btn_email_enviarClick
      end
      object btn_email_cancelar: TButton
        Left = 246
        Top = 57
        Width = 74
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = btn_email_cancelarClick
      end
      object pnl_historico_email2: TPanel
        Left = 8
        Top = 32
        Width = 465
        Height = 19
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 1
        object Label2: TLabel
          Left = 67
          Top = 3
          Width = 41
          Height = 13
          Caption = 'Assunto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edt_assunto: TEdit
          Left = 112
          Top = 0
          Width = 353
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object pnl_historico_email1: TPanel
        Left = 8
        Top = 8
        Width = 465
        Height = 19
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object lbl_para: TLabel
          Left = 82
          Top = 3
          Width = 25
          Height = 13
          Cursor = crHandPoint
          Caption = 'Para:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lbl_paraClick
        end
        object edt_para: TEdit
          Left = 112
          Top = 0
          Width = 353
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
      end
    end
  end
  object dsPendenciasGrid: TDataSource
    DataSet = qryPendenciasGrid
    OnDataChange = dsPendenciasGridDataChange
    Left = 192
    Top = 434
  end
  object qryPendenciasGrid: TQuery
    CachedUpdates = True
    BeforeInsert = qryPendenciasGridBeforeInsert
    AfterInsert = ATIVA_SALVAR
    AfterEdit = ATIVA_SALVAR
    BeforePost = qryPendenciasGridBeforePost
    AfterPost = qryPendenciasGridAfterPost
    AfterCancel = qryPendenciasGridAfterCancel
    AfterDelete = qryPendenciasGridAfterDelete
    AfterScroll = qryPendenciasGridAfterScroll
    OnCalcFields = qryPendenciasGridCalcFields
    OnNewRecord = qryPendenciasGridNewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT *, SUBSTRING(P.NR_PROCESSO,5,15) AS NR_PROCESSO2, (SELECT' +
        ' COUNT(*) FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS_LOG PL (NOLOCK)' +
        ' WHERE CD_PENDENCIA = P.CD_PENDENCIA AND NR_PROCESSO = P.NR_PROC' +
        'ESSO AND NR_REFERENCIA = P.NR_REFERENCIA AND NR_ITEM_CLIENTE = P' +
        '.NR_ITEM_CLIENTE AND NR_PARCIAL = P.NR_PARCIAL AND CD_EMPRESA = ' +
        'P.CD_EMPRESA) AS CONTADOR'
      'FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS P (NOLOCK)'
      
        'INNER JOIN MYINDAIA.DBO.TTP_STATUS_PENDENCIAS S (NOLOCK) ON S.CD' +
        '_STATUS = P.CD_STATUS '
      'WHERE P.NR_PROCESSO = :NR_PROCESSO'
      '  AND P.NR_REFERENCIA = :NR_REFERENCIA'
      '  AND P.NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE'
      '  AND P.NR_PARCIAL = :NR_PARCIAL'
      '  AND P.CD_EMPRESA = :CD_EMPRESA')
    UpdateObject = upPendenciasGrid
    Left = 224
    Top = 434
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_PARCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qryPendenciasGridNM_PENDENCIA: TStringField
      FieldName = 'NM_PENDENCIA'
      Origin = 'DBBROKER.VW_PROCESSO_PENDENCIAS.NM_PENDENCIA'
      FixedChar = True
      Size = 50
    end
    object qryPendenciasGridCD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.VW_PROCESSO_PENDENCIAS.CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qryPendenciasGridCD_PENDENCIA: TIntegerField
      FieldName = 'CD_PENDENCIA'
      Origin = 'DBBROKER.VW_PROCESSO_PENDENCIAS.CD_PENDENCIA'
    end
    object qryPendenciasGridNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.VW_PROCESSO_PENDENCIAS.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPendenciasGridDT_CRIACAO_PENDENCIA: TDateTimeField
      FieldName = 'DT_CRIACAO_PENDENCIA'
      Origin = 'DBBROKER.VW_PROCESSO_PENDENCIAS.DT_CRIACAO_PENDENCIA'
    end
    object qryPendenciasGridNM_STATUS: TStringField
      FieldName = 'NM_STATUS'
      Origin = 'DBBROKER.VW_PROCESSO_PENDENCIAS.CD_PENDENCIA'
      FixedChar = True
      Size = 50
    end
    object qryPendenciasGridCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
    end
    object qryPendenciasGridCD_USUARIO_SOLICITANTE: TStringField
      FieldName = 'CD_USUARIO_SOLICITANTE'
      FixedChar = True
      Size = 4
    end
    object qryPendenciasGridCD_USUARIO_CRIADOR: TStringField
      FieldName = 'CD_USUARIO_CRIADOR'
      FixedChar = True
      Size = 4
    end
    object qryPendenciasGridCD_USUARIO_SOLICITACAO: TStringField
      FieldName = 'CD_USUARIO_SOLICITACAO'
      FixedChar = True
      Size = 4
    end
    object qryPendenciasGridCD_USUARIO_FINALIZACAO: TStringField
      FieldName = 'CD_USUARIO_FINALIZACAO'
      FixedChar = True
      Size = 4
    end
    object qryPendenciasGridCD_USUARIO_CANCELAMENTO: TStringField
      FieldName = 'CD_USUARIO_CANCELAMENTO'
      FixedChar = True
      Size = 4
    end
    object qryPendenciasGridDT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
    end
    object qryPendenciasGridDT_FINALIZACAO: TDateTimeField
      FieldName = 'DT_FINALIZACAO'
    end
    object qryPendenciasGridDT_PRIMEIRA_SOLICITACAO: TDateTimeField
      FieldName = 'DT_PRIMEIRA_SOLICITACAO'
    end
    object qryPendenciasGridCD_USUARIO_RESPOSTA_SOLICITA: TStringField
      FieldName = 'CD_USUARIO_RESPOSTA_SOLICITA'
      FixedChar = True
      Size = 4
    end
    object qryPendenciasGridDT_RESPOSTA_SOLICITA: TDateTimeField
      FieldName = 'DT_RESPOSTA_SOLICITA'
    end
    object qryPendenciasGridCALC_NOME_USUARIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NOME_USUARIO'
      Size = 100
      Calculated = True
    end
    object qryPendenciasGridNR_PROCESSO2: TStringField
      FieldName = 'NR_PROCESSO2'
      FixedChar = True
      Size = 15
    end
    object qryPendenciasGridNR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      FixedChar = True
      Size = 18
    end
    object qryPendenciasGridNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qryPendenciasGridNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qryPendenciasGridCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryPendenciasGridCALC_NOME_CONTATO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NOME_CONTATO'
      Size = 100
      Calculated = True
    end
    object qryPendenciasGridCD_USUARIO_CONTATO: TStringField
      FieldName = 'CD_USUARIO_CONTATO'
      FixedChar = True
      Size = 4
    end
  end
  object dsLookupPendencias: TDataSource
    DataSet = qryLookupPendencias
    Left = 51
    Top = 429
  end
  object qryLookupPendencias: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT NM_PENDENCIA'
      'FROM MYINDAIA.DBO.TTP_PROCESSO_PENDENCIAS (NOLOCK)')
    Left = 49
    Top = 428
    object qryLookupPendenciasNM_PENDENCIA: TStringField
      FieldName = 'NM_PENDENCIA'
      FixedChar = True
      Size = 50
    end
  end
  object upPendenciasGrid: TUpdateSQL
    ModifySQL.Strings = (
      'update MYINDAIA.DBO.TPROCESSO_PENDENCIAS'
      'set'
      '  CD_PENDENCIA = :CD_PENDENCIA,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_REFERENCIA = :NR_REFERENCIA,'
      '  NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  NM_PENDENCIA = :NM_PENDENCIA,'
      '  CD_STATUS = :CD_STATUS,'
      '  DT_CRIACAO_PENDENCIA = :DT_CRIACAO_PENDENCIA,'
      '  CD_USUARIO_SOLICITANTE = :CD_USUARIO_SOLICITANTE,'
      '  CD_USUARIO_CANCELAMENTO = :CD_USUARIO_CANCELAMENTO,'
      '  CD_USUARIO_SOLICITACAO = :CD_USUARIO_SOLICITACAO,'
      '  DT_SOLICITACAO = :DT_SOLICITACAO,'
      '  DT_PRIMEIRA_SOLICITACAO = :DT_PRIMEIRA_SOLICITACAO,'
      '  DT_FINALIZACAO = :DT_FINALIZACAO,'
      '  CD_USUARIO_FINALIZACAO = :CD_USUARIO_FINALIZACAO,'
      '  DT_RESPOSTA_SOLICITA = :DT_RESPOSTA_SOLICITA,'
      '  CD_USUARIO_RESPOSTA_SOLICITA = :CD_USUARIO_RESPOSTA_SOLICITA,'
      '  CD_USUARIO_CONTATO = :CD_USUARIO_CONTATO'
      'where'
      '  CD_PENDENCIA = :OLD_CD_PENDENCIA and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_REFERENCIA = :OLD_NR_REFERENCIA and'
      '  NR_ITEM_CLIENTE = :OLD_NR_ITEM_CLIENTE and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA'
      '')
    InsertSQL.Strings = (
      'insert into MYINDAIA.DBO.TPROCESSO_PENDENCIAS'
      
        '  (CD_PENDENCIA, NR_PROCESSO,  NR_REFERENCIA, NR_ITEM_CLIENTE, N' +
        'R_PARCIAL, CD_EMPRESA, NM_PENDENCIA, CD_STATUS, '
      
        'DT_CRIACAO_PENDENCIA, IN_ATIVO, CD_USUARIO_CRIADOR, CD_USUARIO_C' +
        'ONTATO)'
      'values'
      
        '  (:CD_PENDENCIA, :NR_PROCESSO, :NR_REFERENCIA, :NR_ITEM_CLIENTE' +
        ', :NR_PARCIAL, :CD_EMPRESA, :NM_PENDENCIA, :CD_STATUS, '
      
        ':DT_CRIACAO_PENDENCIA, '#39'1'#39', :CD_USUARIO_CRIADOR, :CD_USUARIO_CON' +
        'TATO)')
    DeleteSQL.Strings = (
      'update MYINDAIA.DBO.TPROCESSO_PENDENCIAS'
      'set'
      '  IN_ATIVO = '#39'0'#39','
      '  CD_STATUS = '#39'5'#39','
      '  DT_CANCELAMENTO = GETDATE()'
      'where'
      '  CD_PENDENCIA = :OLD_CD_PENDENCIA and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and '
      '  NR_REFERENCIA = :OLD_NR_REFERENCIA and'
      '  NR_ITEM_CLIENTE = :OLD_NR_ITEM_CLIENTE and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    Left = 256
    Top = 434
  end
  object dsHistorico: TDataSource
    DataSet = qryHistorico
    Left = 376
    Top = 438
  end
  object qryHistorico: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.*, U.AP_USUARIO, U.NM_USUARIO '
      'FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS_LOG P (NOLOCK)'
      'INNER JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = P.CD_USUARIO'
      'WHERE P.CD_PENDENCIA = :CD_PENDENCIA AND '
      'P.NR_PROCESSO = :NR_PROCESSO AND'
      'P.NR_REFERENCIA = :NR_REFERENCIA AND'
      'P.NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE AND'
      'P.NR_PARCIAL = :NR_PARCIAL AND'
      'P.CD_EMPRESA = :CD_EMPRESA'
      'ORDER BY DT_TEXTO, CD_TEXTO')
    Left = 408
    Top = 438
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_PARCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qryHistoricoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryHistoricoDT_TEXTO: TDateTimeField
      FieldName = 'DT_TEXTO'
    end
    object qryHistoricoCD_PENDENCIA: TIntegerField
      FieldName = 'CD_PENDENCIA'
    end
    object qryHistoricoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryHistoricoCD_TEXTO: TIntegerField
      FieldName = 'CD_TEXTO'
    end
    object qryHistoricoTP_TEXTO: TStringField
      FieldName = 'TP_TEXTO'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoCD_USUARIO_PARA: TStringField
      FieldName = 'CD_USUARIO_PARA'
      FixedChar = True
      Size = 4
    end
    object qryHistoricoAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qryHistoricoNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryHistoricoNM_TEXTO: TMemoField
      FieldName = 'NM_TEXTO'
      BlobType = ftMemo
    end
    object qryHistoricoNR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      FixedChar = True
      Size = 18
    end
    object qryHistoricoNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qryHistoricoNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qryHistoricoCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object sp_historico_texto: TSpellCheck
    Language = wdBrazilianPortuguese
    CompletedMessage = False
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ReplaceDialog = repDefault
    Left = 340
    Top = 440
  end
  object qryAuxProcesso: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    Left = 440
    Top = 438
  end
end
