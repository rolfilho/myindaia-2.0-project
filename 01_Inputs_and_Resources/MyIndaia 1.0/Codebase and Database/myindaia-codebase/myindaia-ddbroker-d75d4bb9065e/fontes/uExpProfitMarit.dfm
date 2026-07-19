object frm_exp_profit_marit: Tfrm_exp_profit_marit
  Left = 131
  Top = 101
  Width = 720
  Height = 510
  Caption = 'Pr'#233' - Alerta - Mar'#237'timo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_transferencia: TPanel
    Left = 230
    Top = 1
    Width = 175
    Height = 105
    TabOrder = 2
    Visible = False
    object Label123: TLabel
      Left = 28
      Top = 26
      Width = 56
      Height = 13
      Caption = 'Nr Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_inclusao: TButton
      Left = 29
      Top = 71
      Width = 57
      Height = 20
      Caption = 'OK'
      TabOrder = 1
      OnClick = btn_inclusaoClick
    end
    object btn_cancela: TButton
      Left = 93
      Top = 72
      Width = 57
      Height = 19
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btn_cancelaClick
    end
    object msk_master: TMaskEdit
      Left = 28
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = msk_masterExit
    end
    object Panel23: TPanel
      Left = 2
      Top = 1
      Width = 345
      Height = 18
      Color = clActiveCaption
      TabOrder = 3
      object Label125: TLabel
        Left = 5
        Top = 3
        Width = 153
        Height = 13
        Caption = 'Transfer'#234'ncia de Processo'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 42
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 331
      Top = 7
      Width = 27
      Height = 25
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
      Left = 5
      Top = 7
      Width = 27
      Height = 25
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
      Left = 33
      Top = 7
      Width = 27
      Height = 25
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
      OnClick = btn_cancelarClick
    end
    object btn_pesq: TSpeedButton
      Left = 65
      Top = 7
      Width = 25
      Height = 25
      Hint = 'Pesquisar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BB0BBBBBBBBBBBBBBF8FBBBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB
        000BBBBBBBBBBBBF888BBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB00
        0BBBBBBBBFFFBF888BBBBBB80008BB80BBBBBBBF8883F888BBBBBB08888800BB
        BBBBBB887778888BBBBBB08FFFFF80BBBBBBB8F7777778FBBBBB88FFFFFFF88B
        BBBBB8777777783FBBBB08FFFFFFF80BBBBB8F777777778FBBBB08FFFFFFF80B
        BBBB8F777777778FBBBB08FFFFFFF80BBBBB83F77777778BBBBB88FFFFFFF88B
        BBBBB8F7777778FBBBBBB08FFFFF80BBBBBBB83FF777F8BBBBBBBB0888880BBB
        BBBBBB883FF88BBBBBBBBBB80008BBBBBBBBBBBB888BBBBBBBBB}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_pesqClick
    end
    object btn_calculo: TSpeedButton
      Left = 117
      Top = 7
      Width = 25
      Height = 25
      Hint = 'C'#225'lculo do Profit'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337444444444
        73333337777777773F333348888888884333337F3F3F3FFF7F33334848489998
        4333337F737377737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3FFFFFFF7F33334844444448
        4333337F7777777F7F333348444E4E484333337F7FFFFF7F7F33334844444448
        4333337F777777737F333348888888884333337F333333337F33334888888888
        43333373FFFFFFFF733333744444444473333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_calculoClick
    end
    object btn_tarifa_master: TSpeedButton
      Left = 90
      Top = 7
      Width = 25
      Height = 25
      Hint = 'Busca das tarifas do Master'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_tarifa_masterClick
    end
    object btn_transf_proc: TSpeedButton
      Left = 142
      Top = 7
      Width = 25
      Height = 25
      Hint = 'Transferir House'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_transf_procClick
    end
    object btn_estorno_proc: TSpeedButton
      Left = 168
      Top = 7
      Width = 25
      Height = 25
      Hint = 'Estornar Processo'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_estorno_procClick
    end
    object btn_finaliza_proc: TSpeedButton
      Left = 193
      Top = 7
      Width = 25
      Height = 25
      Hint = 'Encerar Consolidada'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
        0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
        000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
        00FF3777773333F77733333333333000033F3333333337777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_finaliza_procClick
    end
    object btn_imprimir: TSpeedButton
      Left = 279
      Top = 7
      Width = 25
      Height = 23
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_lista_relClick
    end
    object btn_lista_rel: TSpeedButton
      Left = 303
      Top = 7
      Width = 8
      Height = 23
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333000333
        33333333337F7F33333333333300033333333333337373F33333333330000033
        3333333337FFFFF3333333333000003333333333373337333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_lista_relClick
    end
    object Label1: TLabel
      Left = 412
      Top = 3
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
    object Label2: TLabel
      Left = 548
      Top = 2
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
    object btn_co_conso: TSpeedButton
      Left = 219
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Incluir Novo House'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
        BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
        BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
        BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
        BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
        F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
        F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
        7055557FFFFFF777F7F555000000000000555577777777777755}
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_co_consoClick
    end
    object btn_sda: TSpeedButton
      Left = 248
      Top = 7
      Width = 25
      Height = 25
      Hint = 'Calculo SDA'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888FFFFFFFFFFFFFFFF8888888888888888FFFFFFFFFFFFFFFF888888888888
        8888FFFFFFFFFFFFFFFF8888888888888888FFFFFFFFFFFFFFFF888888888888
        8888FFFFFFFFFFFFFFFF88CC88CC888C88C8FF77FF77FFF7FF7F8C88C8C8C88C
        88C8F7FF7F7F7FF7FF7F8888C8C88C8CCCC8FFFF7F7FF7F7777F88CC88C88C8C
        88C8FF77FF7FF7F7FF7F8C8888C88C8C88C8F7FFFF7FF7F7FF7F8C88C8C8C88C
        88C8F7FF7F7F7FF7FF7F88CC08CC8888CC88FF77FF77FFFF77FF888888888888
        8888FFFFFFFFFFFFFFFF8888888888888888FFFFFFFFFFFFFFFF888888888888
        8888FFFFFFFFFFFFFFFF8888888888888888FFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sdaClick
    end
    object edt_chave: TEdit
      Left = 412
      Top = 16
      Width = 129
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 548
      Top = 16
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_aviso_cheg: TPageControl
    Left = 0
    Top = 42
    Width = 712
    Height = 422
    ActivePage = ts_pesquisa
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_aviso_chegChange
    OnChanging = pgctrl_aviso_chegChanging
    object ts_pesquisa: TTabSheet
      Caption = 'Lista'
      ImageIndex = 4
      object DBGrid10: TDBGrid
        Left = 0
        Top = 81
        Width = 704
        Height = 313
        Align = alClient
        DataSource = datm_exp_profit_marit.ds_pes_cliente
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid10DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_BOOKING'
            Title.Caption = 'Booking'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_MASTER'
            Title.Caption = 'Master'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_EMBARQUE'
            Title.Caption = 'Embarque'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_HOUSE'
            Title.Caption = 'House'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_processo'
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CLIENTE'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CLIENTE'
            Title.Caption = 'Cliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REF_CLIENTE'
            Title.Caption = 'Ref.Cliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGLA_ORIGEM'
            Title.Caption = 'Origem'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGLA_DESTINO'
            Title.Caption = 'Destino'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ARMADOR'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ARMADOR'
            Title.Caption = 'Armador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 232
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_VEICULO'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_VEICULO'
            Title.Caption = 'Navio'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_tp_master'
            Title.Caption = 'Tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 36
            Visible = True
          end>
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 81
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 6
          Width = 52
          Height = 13
          Caption = 'Unidade '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 353
          Top = 6
          Width = 45
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 351
          Top = 42
          Width = 44
          Height = 13
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_pesq: TSpeedButton
          Left = 310
          Top = 19
          Width = 25
          Height = 20
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
          OnClick = btn_co_unid_pesqClick
        end
        object btn_co_prod_pesq: TSpeedButton
          Left = 667
          Top = 19
          Width = 25
          Height = 20
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
          OnClick = btn_co_prod_pesqClick
        end
        object btn_co_destino_pesq: TSpeedButton
          Left = 667
          Top = 55
          Width = 25
          Height = 20
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
          OnClick = btn_co_destino_pesqClick
        end
        object Label9: TLabel
          Left = 8
          Top = 42
          Width = 40
          Height = 13
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_origem_pesq: TSpeedButton
          Left = 310
          Top = 55
          Width = 25
          Height = 20
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
          OnClick = btn_co_origem_pesqClick
        end
        object msk_unid_pesq: TMaskEdit
          Left = 8
          Top = 19
          Width = 27
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnExit = msk_unid_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_unid_pesq: TEdit
          Left = 38
          Top = 19
          Width = 270
          Height = 21
          Color = clMenu
          TabOrder = 4
        end
        object msk_prod_pesq: TMaskEdit
          Left = 351
          Top = 19
          Width = 31
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 1
          OnExit = msk_prod_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_prod_pesq: TEdit
          Left = 386
          Top = 19
          Width = 277
          Height = 21
          Color = clMenu
          TabOrder = 5
        end
        object msk_destino_pesq: TMaskEdit
          Left = 351
          Top = 55
          Width = 41
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 3
          OnExit = msk_destino_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_destino_pesq: TEdit
          Left = 394
          Top = 55
          Width = 270
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object msk_origem_pesq: TMaskEdit
          Left = 8
          Top = 55
          Width = 41
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 2
          OnExit = msk_origem_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_origem_pesq: TEdit
          Left = 51
          Top = 55
          Width = 257
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
      end
    end
    object ts_master: TTabSheet
      Caption = 'Master'
      ImageIndex = 3
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 41
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label44: TLabel
          Left = 10
          Top = 2
          Width = 39
          Height = 13
          Caption = 'Master'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 255
          Top = 3
          Width = 99
          Height = 13
          Caption = 'Unidade Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label187: TLabel
          Left = 420
          Top = 4
          Width = 45
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 148
          Top = 3
          Width = 64
          Height = 13
          Caption = 'Nr Booking'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 592
          Top = 4
          Width = 48
          Height = 13
          Caption = 'Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_master_conso: TDBEdit
          Left = 8
          Top = 14
          Width = 130
          Height = 21
          DataField = 'NR_MASTER'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 0
          OnChange = dbedt_cd_agente_diretoChange
        end
        object DBEdit16: TDBEdit
          Left = 254
          Top = 16
          Width = 24
          Height = 21
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit20: TDBEdit
          Left = 279
          Top = 16
          Width = 136
          Height = 21
          Color = clMenu
          DataField = 'NM_UNID_NEG'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit21: TDBEdit
          Left = 445
          Top = 17
          Width = 142
          Height = 21
          Color = clMenu
          DataField = 'NM_PRODUTO'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit22: TDBEdit
          Left = 419
          Top = 17
          Width = 24
          Height = 21
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nr_book: TDBEdit
          Left = 147
          Top = 15
          Width = 101
          Height = 21
          DataField = 'NR_BOOKING'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 5
          OnChange = dbedt_cd_agente_diretoChange
        end
        object DBEdit55: TDBEdit
          Left = 591
          Top = 17
          Width = 108
          Height = 21
          Color = clMenu
          DataField = 'CD_MASTER'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 6
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 41
        Width = 704
        Height = 353
        Align = alClient
        TabOrder = 1
        object Label52: TLabel
          Left = 8
          Top = 5
          Width = 41
          Height = 13
          Caption = 'Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 357
          Top = 5
          Width = 47
          Height = 13
          Caption = 'Armador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 190
          Top = 162
          Width = 59
          Height = 13
          Caption = 'Tipo Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 8
          Top = 45
          Width = 40
          Height = 13
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 357
          Top = 46
          Width = 44
          Height = 13
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 468
          Top = 162
          Width = 57
          Height = 13
          Caption = 'Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 9
          Top = 161
          Width = 59
          Height = 13
          Caption = 'Nr Viagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 361
          Top = 162
          Width = 87
          Height = 13
          Caption = 'Prev.Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 570
          Top = 162
          Width = 47
          Height = 13
          Caption = 'Emiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label43: TLabel
          Left = 8
          Top = 123
          Width = 127
          Height = 13
          Caption = 'Armaz'#233'm de Descarga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_descarga: TSpeedButton
          Left = 319
          Top = 137
          Width = 25
          Height = 20
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
          OnClick = btn_co_descargaClick
        end
        object Label45: TLabel
          Left = 358
          Top = 85
          Width = 131
          Height = 13
          Caption = 'Armaz'#233'm de Atraca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_atracacao: TSpeedButton
          Left = 664
          Top = 99
          Width = 25
          Height = 20
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
          OnClick = btn_co_atracacaoClick
        end
        object Label48: TLabel
          Left = 6
          Top = 86
          Width = 63
          Height = 13
          Caption = 'Notificador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_notificador: TSpeedButton
          Left = 320
          Top = 100
          Width = 25
          Height = 20
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
          OnClick = btn_co_notificadorClick
        end
        object Label49: TLabel
          Left = 360
          Top = 123
          Width = 34
          Height = 13
          Caption = 'Navio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_veiculo: TSpeedButton
          Left = 664
          Top = 138
          Width = 25
          Height = 19
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
          OnClick = btn_co_veiculoClick
        end
        object dbedt_cd_agente_conso: TDBEdit
          Left = 8
          Top = 19
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_agente_conso: TDBEdit
          Left = 50
          Top = 19
          Width = 267
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_armador: TDBEdit
          Left = 357
          Top = 19
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_ARMADOR'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 2
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_armador: TDBEdit
          Left = 400
          Top = 19
          Width = 263
          Height = 21
          Color = clMenu
          DataField = 'NM_ARMADOR'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_origem_conso: TDBEdit
          Left = 8
          Top = 59
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_origem_conso: TDBEdit
          Left = 50
          Top = 59
          Width = 267
          Height = 21
          Color = clMenu
          DataField = 'NM_PORTO'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_destino_conso: TDBEdit
          Left = 357
          Top = 59
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_destino_conso: TDBEdit
          Left = 400
          Top = 59
          Width = 263
          Height = 21
          Color = clMenu
          DataField = 'NM_PORTO_1'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_nm_descarga: TDBEdit
          Left = 50
          Top = 137
          Width = 267
          Height = 21
          Color = clMenu
          DataField = 'NM_DESCARGA'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nm_atracacao: TDBEdit
          Left = 400
          Top = 99
          Width = 263
          Height = 21
          Color = clMenu
          DataField = 'NM_ATRACACAO'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nm_notificador: TDBEdit
          Left = 50
          Top = 101
          Width = 267
          Height = 21
          Color = clMenu
          DataField = 'NM_NOTIFICADOR'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_nm_veiculo: TDBEdit
          Left = 400
          Top = 137
          Width = 263
          Height = 21
          Color = clMenu
          DataField = 'NM_VEICULO'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_cd_notificador: TDBEdit
          Left = 6
          Top = 100
          Width = 40
          Height = 21
          DataField = 'CD_NOTIFICADOR'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 12
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_notificadorExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_cd_atracacao: TDBEdit
          Left = 358
          Top = 99
          Width = 40
          Height = 21
          DataField = 'CD_ARMAZEM_ATRACACAO'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 13
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_atracacaoExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_cd_descarga: TDBEdit
          Left = 8
          Top = 137
          Width = 40
          Height = 21
          DataField = 'CD_ARMAZEM_DESCARGA'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 14
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_descargaExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_cd_veiculo: TDBEdit
          Left = 360
          Top = 137
          Width = 40
          Height = 21
          DataField = 'CD_VEICULO'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 15
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_veiculoExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nr_voo_conso: TDBEdit
          Left = 9
          Top = 176
          Width = 160
          Height = 21
          DataField = 'NR_VOO'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 16
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dblookp_tp_frete_master: TDBLookupComboBox
          Left = 190
          Top = 176
          Width = 129
          Height = 21
          DataField = 'Look_nm_frete_master'
          DataSource = datm_exp_profit_marit.ds_master
          ListField = 'CODIGO'
          TabOrder = 17
        end
        object dbedt_dt_saida_conso: TDBEdit
          Left = 468
          Top = 176
          Width = 90
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 18
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_dt_cheg_conso: TDBEdit
          Left = 360
          Top = 177
          Width = 100
          Height = 21
          Color = clMenu
          DataField = 'DT_PREV_SAIDA'
          DataSource = datm_exp_profit_marit.ds_master
          ReadOnly = True
          TabOrder = 19
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_dt_chegada: TDBEdit
          Left = 567
          Top = 176
          Width = 100
          Height = 21
          DataField = 'DT_EMISSAO_DTA'
          DataSource = datm_exp_profit_marit.ds_master
          TabOrder = 20
          Visible = False
          OnChange = dbedt_cd_agente_diretoChange
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 203
          Width = 702
          Height = 149
          Align = alBottom
          Caption = 'Transbordo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          object Label55: TLabel
            Left = 230
            Top = 15
            Width = 31
            Height = 13
            Caption = 'Porto'
          end
          object Label61: TLabel
            Left = 612
            Top = 14
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label62: TLabel
            Left = 466
            Top = 15
            Width = 60
            Height = 13
            Caption = 'N'#186' Viagem'
          end
          object btn_co_porto_conso: TSpeedButton
            Left = 439
            Top = 27
            Width = 25
            Height = 20
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
            OnClick = btn_co_porto_consoClick
          end
          object Label63: TLabel
            Left = 12
            Top = 15
            Width = 34
            Height = 13
            Caption = 'Navio'
          end
          object btn_co_navio_transp_conso: TSpeedButton
            Left = 199
            Top = 28
            Width = 25
            Height = 20
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
            OnClick = btn_co_navio_transp_consoClick
          end
          object dbedt_nm_porto_transp: TDBEdit
            Left = 268
            Top = 27
            Width = 169
            Height = 21
            Color = clMenu
            DataField = 'NM_PORTO_TRANSB'
            DataSource = datm_exp_profit_marit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_veic_trans: TDBEdit
            Left = 52
            Top = 28
            Width = 144
            Height = 21
            Color = clMenu
            DataField = 'NM_VEICULO_TRANSB'
            DataSource = datm_exp_profit_marit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_cd_veic_transb: TDBEdit
            Left = 10
            Top = 28
            Width = 39
            Height = 21
            DataField = 'CD_VEIC_TRANSBORDO'
            DataSource = datm_exp_profit_marit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_cd_veic_transbExit
          end
          object dbedt_cd_porto_transp: TDBEdit
            Left = 227
            Top = 28
            Width = 39
            Height = 21
            DataField = 'CD_PORTO_TRANSBORDO'
            DataSource = datm_exp_profit_marit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_cd_porto_transpExit
          end
          object dbedt_nr_viagem_transb: TDBEdit
            Left = 466
            Top = 27
            Width = 142
            Height = 21
            DataField = 'NR_VIAGEM_TRANSBORDO'
            DataSource = datm_exp_profit_marit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = dbedt_cd_agente_diretoChange
          end
          object dbedt_dt_transb: TDBEdit
            Left = 612
            Top = 26
            Width = 85
            Height = 21
            DataField = 'DT_TRANSBORDO'
            DataSource = datm_exp_profit_marit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnChange = dbedt_cd_agente_diretoChange
          end
        end
      end
    end
    object ts_houses: TTabSheet
      Caption = 'Houses'
      ImageIndex = 11
      object pgctrl_houses: TPageControl
        Left = 0
        Top = 0
        Width = 704
        Height = 394
        ActivePage = ts_calc_profit
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_housesChange
        OnChanging = pgctrl_aviso_chegChanging
        object ts_lista_houses: TTabSheet
          Caption = 'Lista'
          object DBGrid9: TDBGrid
            Left = 0
            Top = 39
            Width = 696
            Height = 327
            Align = alClient
            DataSource = datm_exp_profit_marit.ds_house
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
                FieldName = 'NR_HOUSE'
                Title.Caption = 'House'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calc_processo'
                Title.Caption = 'Processo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_EMPRESA'
                Title.Caption = 'Cliente'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 333
                Visible = True
              end>
          end
          object Panel28: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 39
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            object Label183: TLabel
              Left = 543
              Top = 2
              Width = 39
              Height = 13
              Caption = 'Master'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 7
              Top = 2
              Width = 117
              Height = 13
              Caption = 'Unidade de Neg'#243'cio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label77: TLabel
              Left = 291
              Top = 2
              Width = 45
              Height = 13
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label184: TLabel
              Left = 551
              Top = 2
              Width = 5
              Height = 13
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit6: TDBEdit
              Left = 541
              Top = 14
              Width = 111
              Height = 21
              Color = clMenu
              DataField = 'NR_MASTER'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit7: TDBEdit
              Left = 5
              Top = 14
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit23: TDBEdit
              Left = 289
              Top = 14
              Width = 20
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit24: TDBEdit
              Left = 312
              Top = 14
              Width = 218
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit25: TDBEdit
              Left = 32
              Top = 14
              Width = 222
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 2
          object Panel13: TPanel
            Left = 0
            Top = 46
            Width = 696
            Height = 320
            Align = alClient
            TabOrder = 0
            object Label78: TLabel
              Left = 359
              Top = 84
              Width = 61
              Height = 13
              Caption = 'Comiss'#225'ria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_desp_conso: TSpeedButton
              Left = 651
              Top = 99
              Width = 25
              Height = 20
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
              OnClick = btn_co_desp_consoClick
            end
            object Label79: TLabel
              Left = 10
              Top = 165
              Width = 50
              Height = 13
              Caption = 'Incoterm'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label80: TLabel
              Left = 100
              Top = 164
              Width = 59
              Height = 13
              Caption = 'Tipo Frete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label92: TLabel
              Left = 10
              Top = 46
              Width = 62
              Height = 13
              Caption = 'Exportador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label93: TLabel
              Left = 359
              Top = 46
              Width = 61
              Height = 13
              Caption = 'Importador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_exp_conso: TSpeedButton
              Left = 651
              Top = 58
              Width = 25
              Height = 20
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
              OnClick = btn_co_exp_consoClick
            end
            object Label94: TLabel
              Left = 10
              Top = 124
              Width = 106
              Height = 13
              Caption = 'Destino do  House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label73: TLabel
              Left = 360
              Top = 6
              Width = 53
              Height = 13
              Caption = 'Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_instr_conso: TSpeedButton
              Left = 476
              Top = 20
              Width = 25
              Height = 20
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
              Visible = False
              OnClick = btn_co_instr_consoClick
            end
            object Label189: TLabel
              Left = 10
              Top = 8
              Width = 37
              Height = 13
              Caption = 'House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label191: TLabel
              Left = 10
              Top = 84
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_moeda_con: TSpeedButton
              Left = 302
              Top = 99
              Width = 25
              Height = 20
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
              OnClick = btn_co_moeda_conClick
            end
            object Label51: TLabel
              Left = 359
              Top = 124
              Width = 127
              Height = 13
              Caption = 'Armaz'#233'm de Descarga'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label68: TLabel
              Left = 212
              Top = 165
              Width = 75
              Height = 13
              Caption = 'Recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 511
              Top = 5
              Width = 64
              Height = 13
              Caption = 'Ref.Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_nm_desp_conso: TDBEdit
              Left = 403
              Top = 98
              Width = 242
              Height = 21
              Color = clMenu
              DataField = 'NM_COMISSARIA'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 6
            end
            object dbedt_cd_cliente_conso: TDBEdit
              Left = 10
              Top = 59
              Width = 42
              Height = 21
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_nm_cliente_conso: TDBEdit
              Left = 54
              Top = 59
              Width = 243
              Height = 21
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_nm_exp_conso: TDBEdit
              Left = 404
              Top = 58
              Width = 241
              Height = 21
              Color = clMenu
              DataField = 'NM_EMP_EST'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_cd_det_house_conso: TDBEdit
              Left = 10
              Top = 137
              Width = 42
              Height = 21
              Color = clMenu
              DataField = 'CD_DESTINO'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 4
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_cd_det_house_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_dest_house_conso: TDBEdit
              Left = 52
              Top = 137
              Width = 246
              Height = 21
              Color = clMenu
              DataField = 'NM_DESTINO'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 5
            end
            object msk_proc_conso: TMaskEdit
              Left = 359
              Top = 19
              Width = 113
              Height = 21
              Color = clMenu
              ReadOnly = True
              TabOrder = 0
              OnChange = msk_proc_diretoChange
              OnEnter = msk_proc_diretoEnter
              OnExit = msk_proc_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_moeda_con: TDBEdit
              Left = 51
              Top = 98
              Width = 246
              Height = 21
              Color = clMenu
              DataField = 'NM_MOEDA'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit27: TDBEdit
              Left = 359
              Top = 138
              Width = 37
              Height = 21
              Color = clMenu
              DataField = 'CD_ARMAZEM_DESCARGA'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 8
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_descargaExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit32: TDBEdit
              Left = 399
              Top = 138
              Width = 246
              Height = 21
              Color = clMenu
              DataField = 'NM_DESCARGA'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_nr_house_conso: TDBEdit
              Left = 10
              Top = 20
              Width = 122
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 10
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_nr_house_consoExit
            end
            object dbedt_cd_exp_conso: TDBEdit
              Left = 359
              Top = 58
              Width = 42
              Height = 21
              DataField = 'CD_EMP_EST'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 11
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_exp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_moeda_conso: TDBEdit
              Left = 10
              Top = 98
              Width = 38
              Height = 21
              DataField = 'CD_MOEDA_FRETE'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 12
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_moeda_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_desp_conso: TDBEdit
              Left = 359
              Top = 97
              Width = 42
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 13
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_desp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dblook_incoterm: TDBLookupComboBox
              Left = 10
              Top = 177
              Width = 69
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_exp_profit_marit.ds_processo
              ListField = 'CODIGO'
              TabOrder = 14
              OnClick = dblook_incotermClick
            end
            object dblook_tp_house_conso: TDBLookupComboBox
              Left = 99
              Top = 177
              Width = 99
              Height = 21
              Color = clMenu
              DataField = 'Look_nm_tp_frete'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 15
              OnClick = dbedt_cd_exp_diretoChange
            end
            object DBEdit47: TDBEdit
              Left = 212
              Top = 178
              Width = 85
              Height = 21
              Color = clMenu
              DataField = 'DT_RECEBIMENTO'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 16
            end
            object DBEdit4: TDBEdit
              Left = 511
              Top = 18
              Width = 133
              Height = 21
              Color = clMenu
              DataField = 'REF_CLIENTE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 17
            end
            object DBCheckBox1: TDBCheckBox
              Left = 138
              Top = 21
              Width = 157
              Height = 17
              Caption = 'AS PER AGREEMENT'
              DataField = 'IN_AS_AGREED'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 18
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbedt_cd_exp_diretoChange
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 46
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            object Label74: TLabel
              Left = 15
              Top = 5
              Width = 117
              Height = 13
              Caption = 'Unidade de Neg'#243'cio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label76: TLabel
              Left = 359
              Top = 5
              Width = 45
              Height = 13
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit34: TDBEdit
              Left = 13
              Top = 17
              Width = 28
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit35: TDBEdit
              Left = 359
              Top = 17
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit36: TDBEdit
              Left = 384
              Top = 17
              Width = 290
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit37: TDBEdit
              Left = 44
              Top = 17
              Width = 290
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
        object ts_compos_frete: TTabSheet
          Caption = 'Composis'#227'o Frete'
          ImageIndex = 6
          object Label18: TLabel
            Left = 0
            Top = 187
            Width = 696
            Height = 13
            Align = alBottom
            Caption = 'Others Charges'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnl_lcl: TPanel
            Left = 0
            Top = 48
            Width = 696
            Height = 139
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 3
            object dbgrid_lcl: TDBGrid
              Left = 2
              Top = 2
              Width = 692
              Height = 135
              Align = alClient
              DataSource = datm_exp_profit_marit.ds_processo_carga
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TP_EMBALAGEM'
                  Title.Caption = 'C'#243'd.'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NM_EMBALAGEM'
                  Title.Caption = 'Tipo da Embalagem'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 129
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QTDE'
                  Title.Caption = 'Qtde'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESO_TON'
                  Title.Caption = 'Peso Bruto (TON)'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 136
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESO_VOLUMETRICO'
                  Title.Caption = 'Cubagem (M3)'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 94
                  Visible = True
                end>
            end
          end
          object pnl_fcl: TPanel
            Left = 0
            Top = 48
            Width = 696
            Height = 139
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object dbgrid_contanier: TDBGrid
              Left = 2
              Top = 2
              Width = 692
              Height = 135
              Align = alClient
              DataSource = datm_exp_profit_marit.ds_proc_cntr
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TP_CNTR'
                  Title.Caption = 'C'#243'd.'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Look_nm_cntr'
                  Title.Caption = 'Contanier'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 107
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_PESO_TON'
                  Title.Caption = 'Peso Bruto (Ton)'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 124
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_VENDA'
                  Title.Caption = 'Venda'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 74
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_CNTR'
                  Title.Caption = 'Numero do Contanier'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 133
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_LACRE'
                  Title.Caption = 'Lacre'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 74
                  Visible = True
                end>
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 48
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object lb_tarifa_conso: TLabel
              Left = 323
              Top = 5
              Width = 34
              Height = 13
              Caption = 'Tarifa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label36: TLabel
              Left = 151
              Top = 5
              Width = 97
              Height = 13
              Caption = 'Peso Bruto (Ton)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label37: TLabel
              Left = 486
              Top = 5
              Width = 63
              Height = 13
              Caption = 'Total Frete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label38: TLabel
              Left = 12
              Top = 5
              Width = 107
              Height = 13
              Caption = 'Tipo de Estufagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_charg_conso: TDBEdit
              Left = 150
              Top = 20
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'VL_PESO_BRUTO'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_cd_exp_diretoChange
            end
            object rxcombo_tp_estufagem: TRxDBComboBox
              Left = 13
              Top = 19
              Width = 105
              Height = 21
              Style = csDropDownList
              DataField = 'TP_ESTUFAGEM'
              DataSource = datm_exp_profit_marit.ds_processo
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'LCL'
                'FCL')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1')
              OnChange = rxcombo_tp_estufagemChange
            end
            object dbedt_tarifa_conso: TDBEdit
              Left = 321
              Top = 20
              Width = 102
              Height = 21
              DataField = 'VL_TARIFA_FRETE'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 2
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tt_frete_conso: TDBEdit
              Left = 489
              Top = 20
              Width = 103
              Height = 21
              DataField = 'VL_FRETE'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 3
              OnChange = dbedt_cd_exp_diretoChange
            end
          end
          object dbgrid_other_charge: TDBGrid
            Left = 0
            Top = 200
            Width = 696
            Height = 99
            Align = alBottom
            DataSource = datm_exp_profit_marit.ds_other_charges
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_item'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 208
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_tp_calc'
                Title.Caption = 'Tipo Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_CLI'
                Title.Caption = 'Valor Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VENDA'
                Title.Caption = 'Venda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_frete'
                Title.Caption = 'PP/CC'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_in_profit'
                Title.Caption = 'Profit'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'in_notificacao'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end>
          end
          object Panel15: TPanel
            Left = 0
            Top = 299
            Width = 696
            Height = 67
            Align = alBottom
            TabOrder = 4
            object Label21: TLabel
              Left = 561
              Top = 8
              Width = 88
              Height = 13
              Caption = 'Total do House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label70: TLabel
              Left = 321
              Top = 8
              Width = 85
              Height = 13
              Caption = 'Total Other PP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label95: TLabel
              Left = 441
              Top = 8
              Width = 85
              Height = 13
              Caption = 'Total Other CC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit3: TDBEdit
              Left = 559
              Top = 21
              Width = 99
              Height = 21
              Color = clMenu
              DataField = 'VL_HOUSE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit54: TDBEdit
              Left = 322
              Top = 21
              Width = 99
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit65: TDBEdit
              Left = 442
              Top = 21
              Width = 99
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CC'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object GroupBox4: TGroupBox
              Left = 32
              Top = 6
              Width = 235
              Height = 46
              Caption = 'Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              object btn_co_moeda_mle_conso: TSpeedButton
                Left = 118
                Top = 18
                Width = 25
                Height = 20
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
                OnClick = btn_co_moeda_mle_consoClick
              end
              object dbedt_vl_merc_conso: TDBEdit
                Left = 150
                Top = 18
                Width = 72
                Height = 21
                DataField = 'VL_MLE_MNEG'
                DataSource = datm_exp_profit_marit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_cd_exp_diretoChange
              end
              object dbedt_cd_moeda_mle_conso: TDBEdit
                Left = 11
                Top = 18
                Width = 32
                Height = 21
                DataField = 'CD_MOEDA_MLE'
                DataSource = datm_exp_profit_marit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_cd_exp_diretoChange
                OnExit = dbedt_cd_moeda_mle_consoExit
                OnKeyDown = dbedt_cd_agente_diretoKeyDown
              end
              object dbedt_nm_moeda_mle_conso: TDBEdit
                Left = 46
                Top = 18
                Width = 67
                Height = 21
                Color = clMenu
                DataField = 'AP_MOEDA_MLE'
                DataSource = datm_exp_profit_marit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
            end
          end
        end
        object ts_custo_brasil: TTabSheet
          Caption = 'Custo no Brasil'
          ImageIndex = 5
          object Label23: TLabel
            Left = 0
            Top = 0
            Width = 108
            Height = 13
            Align = alTop
            Caption = 'Despesa do House'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 0
            Top = 185
            Width = 78
            Height = 13
            Align = alTop
            Caption = 'Valores Brasil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgrid_despesa_house: TDBGrid
            Left = 0
            Top = 13
            Width = 696
            Height = 172
            Align = alTop
            DataSource = datm_exp_profit_marit.ds_despesa_house
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyUp = dbgrid_despesa_houseKeyUp
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_item'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 151
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_MOEDA'
                Title.Caption = 'Cod.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_moeda'
                Title.Caption = 'Moeda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_nm_tp_base'
                Title.Caption = 'Tipo Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_AG'
                Title.Caption = 'Valor Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_COMPRA_AG'
                ReadOnly = True
                Title.Caption = 'Valor'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_CUSTO_EST'
                ReadOnly = True
                Title.Caption = 'Valor Convertido'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VL_COMPRA_CIA'
                ReadOnly = True
                Title.Caption = 'Armador'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_origem'
                Title.Caption = 'Origem'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
          object dbgrid_vl_brasil: TDBGrid
            Left = 0
            Top = 198
            Width = 696
            Height = 168
            Align = alClient
            DataSource = datm_exp_profit_marit.ds_vl_brasil
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyUp = dbgrid_vl_brasilKeyUp
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_item'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 169
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_MOEDA_VENDA'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 28
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_moeda'
                Title.Caption = 'Moeda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_repassa'
                Title.Caption = 'Cobrar do '
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_in_profit'
                Title.Caption = 'Profit'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_tp_base'
                Title.Caption = 'Tipo Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_CLI'
                Title.Caption = 'Valor Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VENDA'
                Title.Caption = 'Venda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VENDA_EST'
                ReadOnly = True
                Title.Caption = 'Valor Convertido'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'in_notificacao'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end>
          end
        end
        object ts_calc_profit: TTabSheet
          Caption = 'C'#225'lculo Profit'
          ImageIndex = 7
          object Panel27: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 29
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label148: TLabel
              Left = 28
              Top = 8
              Width = 37
              Height = 13
              Caption = 'House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label41: TLabel
              Left = 296
              Top = 8
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit17: TDBEdit
              Left = 75
              Top = 4
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit46: TDBEdit
              Left = 338
              Top = 4
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel31: TPanel
            Left = 286
            Top = 39
            Width = 408
            Height = 173
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 1
            object lb_divisao: TLabel
              Left = 9
              Top = 88
              Width = 80
              Height = 13
              Caption = 'Percent Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label39: TLabel
              Left = 10
              Top = 46
              Width = 90
              Height = 13
              Caption = 'Tipo de Divis'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label168: TLabel
              Left = 10
              Top = 6
              Width = 71
              Height = 13
              Caption = 'Profit House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label170: TLabel
              Left = 10
              Top = 130
              Width = 66
              Height = 13
              Caption = 'Profit Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label169: TLabel
              Left = 109
              Top = 131
              Width = 75
              Height = 13
              Caption = 'Profit Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_perc_brasil: TDBEdit
              Left = 9
              Top = 102
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_DIVISAO'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object rxdbcombo_tp_divisao: TRxDBComboBox
              Left = 10
              Top = 60
              Width = 90
              Height = 21
              Style = csDropDownList
              DataField = 'TP_DIVISAO'
              DataSource = datm_exp_profit_marit.ds_processo
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Valor Fixo'
                'Porcetagem')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1')
              OnChange = rxdbcombo_tp_divisaoChange
            end
            object dbedt_profit_house: TDBEdit
              Left = 10
              Top = 20
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_profit_brasil: TDBEdit
              Left = 10
              Top = 143
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_BRASIL'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_profit_agente: TDBEdit
              Left = 108
              Top = 145
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_AGENTE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 4
            end
          end
          object Panel4: TPanel
            Left = 390
            Top = 39
            Width = 304
            Height = 89
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 2
            object Label166: TLabel
              Left = 10
              Top = 7
              Width = 85
              Height = 13
              Caption = 'Despesa Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 167
              Top = 10
              Width = 94
              Height = 13
              Caption = 'Despesa Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 166
              Top = 49
              Width = 89
              Height = 13
              Caption = 'Receita Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label29: TLabel
              Left = 9
              Top = 46
              Width = 80
              Height = 13
              Caption = 'Receita Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_profit_total: TDBEdit
              Left = 10
              Top = 22
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_MASTER'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit9: TDBEdit
              Left = 167
              Top = 22
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_AG'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit13: TDBEdit
              Left = 166
              Top = 61
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_REC_AG'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit19: TDBEdit
              Left = 9
              Top = 61
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_REC_BR'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
          end
          object Panel5: TPanel
            Left = 287
            Top = 214
            Width = 270
            Height = 98
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 3
            object Label167: TLabel
              Left = 10
              Top = 4
              Width = 113
              Height = 13
              Caption = 'Valor Receita Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label173: TLabel
              Left = 139
              Top = 4
              Width = 118
              Height = 13
              Caption = 'Valor Despesa Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label35: TLabel
              Left = 10
              Top = 49
              Width = 99
              Height = 13
              Caption = 'Profit Total Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label72: TLabel
              Left = 139
              Top = 49
              Width = 108
              Height = 13
              Caption = 'Profit Total Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_profit_extra: TDBEdit
              Left = 10
              Top = 17
              Width = 120
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_profit_liquido: TDBEdit
              Left = 139
              Top = 17
              Width = 120
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit26: TDBEdit
              Left = 10
              Top = 62
              Width = 120
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_PROF_BR'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit28: TDBEdit
              Left = 139
              Top = 62
              Width = 120
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_PROF_AG'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object Panel10: TPanel
            Left = 559
            Top = 214
            Width = 133
            Height = 144
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 4
            object Label50: TLabel
              Left = 9
              Top = 101
              Width = 111
              Height = 13
              Caption = 'Profit Liquido Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 10
              Top = 6
              Width = 107
              Height = 13
              Caption = 'Comiss'#227'o Mar'#237'tima'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label112: TLabel
              Left = 9
              Top = 50
              Width = 120
              Height = 13
              Caption = 'Fatura Complementar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit29: TDBEdit
              Left = 6
              Top = 117
              Width = 120
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_LIQUIDO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit33: TDBEdit
              Left = 5
              Top = 20
              Width = 120
              Height = 21
              Color = clMenu
              DataField = 'VL_OVER'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit63: TDBEdit
              Left = 6
              Top = 66
              Width = 120
              Height = 21
              Color = clMenu
              DataField = 'VL_FAT_COMPLEMENTAR'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
          object GroupBox8: TGroupBox
            Left = 1
            Top = 33
            Width = 140
            Height = 181
            Caption = 'Receita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object Label87: TLabel
              Left = 10
              Top = 136
              Width = 70
              Height = 13
              Caption = 'Total Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label89: TLabel
              Left = 10
              Top = 55
              Width = 96
              Height = 13
              Caption = 'Other Charge PP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label90: TLabel
              Left = 10
              Top = 15
              Width = 70
              Height = 13
              Caption = 'Frete Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label96: TLabel
              Left = 10
              Top = 95
              Width = 96
              Height = 13
              Caption = 'Other Charge CC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit8: TDBEdit
              Left = 10
              Top = 150
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_VENDA'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit56: TDBEdit
              Left = 10
              Top = 28
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_FRETE'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit57: TDBEdit
              Left = 10
              Top = 68
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit66: TDBEdit
              Left = 10
              Top = 109
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CC'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object GroupBox9: TGroupBox
            Left = 143
            Top = 34
            Width = 140
            Height = 180
            Caption = 'Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            object Label91: TLabel
              Left = 10
              Top = 136
              Width = 66
              Height = 13
              Caption = 'Total Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label97: TLabel
              Left = 10
              Top = 55
              Width = 106
              Height = 13
              Caption = 'Other Charge Pa'#237's'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label102: TLabel
              Left = 10
              Top = 15
              Width = 66
              Height = 13
              Caption = 'Frete Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label108: TLabel
              Left = 10
              Top = 95
              Width = 123
              Height = 13
              Caption = 'Other Charge Exterior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit58: TDBEdit
              Left = 10
              Top = 150
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit59: TDBEdit
              Left = 10
              Top = 28
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_RATEIO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit60: TDBEdit
              Left = 10
              Top = 68
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit67: TDBEdit
              Left = 10
              Top = 109
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO_EX'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
    end
    object ts_tt_master: TTabSheet
      Caption = 'Totais do Master'
      ImageIndex = 4
      object Label14: TLabel
        Left = 0
        Top = 198
        Width = 704
        Height = 13
        Align = alBottom
        Caption = 'Despesas do Master'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnl_master_lcl: TPanel
        Left = 0
        Top = 48
        Width = 704
        Height = 150
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 5
        object dbgrid_master_lcl: TDBGrid
          Left = 2
          Top = 2
          Width = 700
          Height = 146
          Align = alClient
          DataSource = datm_exp_profit_marit.ds_master_carga
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_TON'
              Title.Caption = 'Peso Bruto (TON)'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_VOLUMETRICO'
              Title.Caption = 'Cubagem (M3)'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 94
              Visible = True
            end>
        end
      end
      object pnl_master_fcl: TPanel
        Left = 0
        Top = 48
        Width = 704
        Height = 150
        Align = alClient
        BevelInner = bvLowered
        Caption = 'pnl_master_fcl'
        TabOrder = 4
        object dbgrid_master_fcl: TDBGrid
          Left = 2
          Top = 2
          Width = 700
          Height = 146
          Align = alClient
          DataSource = datm_exp_profit_marit.ds_master_carga
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TP_CNTR'
              Title.Caption = 'C'#243'd.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Look_nm_cntr'
              Title.Caption = 'Contanier'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_TON'
              Title.Caption = 'Peso (Ton)'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_COMPRA'
              ReadOnly = True
              Title.Caption = 'Valor Compra'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_COMPRA_ARMADOR'
              ReadOnly = True
              Title.Caption = 'Compra Armador'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 111
              Visible = True
            end>
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 48
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object lb_tt_master_frete: TLabel
          Left = 601
          Top = 8
          Width = 63
          Height = 13
          Caption = 'Total Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label71: TLabel
          Left = 493
          Top = 8
          Width = 34
          Height = 13
          Caption = 'Tarifa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 261
          Top = 8
          Width = 75
          Height = 13
          Caption = 'Peso Taxado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 91
          Top = 8
          Width = 60
          Height = 13
          Caption = 'Estufagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 6
          Top = 8
          Width = 39
          Height = 13
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 183
          Top = 8
          Width = 28
          Height = 13
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 374
          Top = 8
          Width = 84
          Height = 13
          Caption = 'Tarifa Armador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_tarifa_master_conso: TDBEdit
          Left = 494
          Top = 22
          Width = 75
          Height = 21
          Color = clMenu
          DataField = 'TARIFA_CUSTO'
          DataSource = datm_exp_profit_marit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_termo_diretoChange
        end
        object dbedt_tt_frete_master_conso: TDBEdit
          Left = 600
          Top = 22
          Width = 74
          Height = 21
          Color = clMenu
          DataField = 'TT_FRETE_MASTER'
          DataSource = datm_exp_profit_marit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_termo_diretoChange
        end
        object DBEdit5: TDBEdit
          Left = 260
          Top = 22
          Width = 87
          Height = 21
          Color = clMenu
          DataField = 'CHARG_MASTER'
          DataSource = datm_exp_profit_marit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          OnChange = dbedt_cd_agente_diretoChange
        end
        object rxc_tp_estufagem_master: TRxDBComboBox
          Left = 92
          Top = 22
          Width = 64
          Height = 21
          Style = csDropDownList
          DataField = 'TP_ESTUFAGEM'
          DataSource = datm_exp_profit_marit.ds_master
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'LCL'
            'FCL')
          TabOrder = 3
          Values.Strings = (
            '0'
            '1')
          OnChange = rxc_tp_estufagem_masterChange
        end
        object DBEdit39: TDBEdit
          Left = 5
          Top = 22
          Width = 62
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_exp_profit_marit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_agente_diretoChange
        end
        object DBEdit15: TDBEdit
          Left = 182
          Top = 22
          Width = 48
          Height = 21
          Color = clMenu
          DataField = 'VOL_MASTER'
          DataSource = datm_exp_profit_marit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_cd_agente_diretoChange
        end
        object DBEdit30: TDBEdit
          Left = 375
          Top = 22
          Width = 87
          Height = 21
          Color = clMenu
          DataField = 'TARIFA_CUSTO_CIA'
          DataSource = datm_exp_profit_marit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_cd_agente_diretoChange
        end
      end
      object dbgrid_despesa_master: TDBGrid
        Left = 0
        Top = 211
        Width = 704
        Height = 147
        Align = alBottom
        DataSource = datm_exp_profit_marit.ds_despesa_master
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyUp = dbgrid_despesa_masterKeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_nm_item'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_tp_due'
            Title.Caption = 'Due'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Loo_nm_frete'
            Title.Caption = 'PP/CC'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_resp_pagto'
            Title.Caption = 'Resp.Pagto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_MOEDA'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_nm_moeda'
            Title.Caption = 'Moeda Custo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_base_calc'
            Title.Caption = 'Tipo Base'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_BASE_DESPESA'
            Title.Caption = 'Valor Base'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_COMPRA_AG'
            Title.Caption = 'Valor Compra'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_MOEDA_VENDA'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_nm_moeda_venda'
            Title.Caption = 'Moeda Venda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_CUSTO_EST'
            ReadOnly = True
            Title.Caption = 'Valor Convertido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VL_BASE_VENDA'
            Title.Caption = 'Vl Base Venda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_VENDA'
            Title.Caption = 'Venda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object pnl_mensagem: TPanel
        Left = 0
        Top = 358
        Width = 704
        Height = 20
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        Visible = False
        object lb_mensagem: TLabel
          Left = 4
          Top = 3
          Width = 5
          Height = 13
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl_nm_usuario: TLabel
          Left = 56
          Top = 3
          Width = 3
          Height = 13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object progress_houses: TProgressBar
        Left = 0
        Top = 378
        Width = 704
        Height = 16
        Align = alBottom
        TabOrder = 3
        Visible = False
      end
    end
    object ts_direto: TTabSheet
      Caption = 'Direto'
      ImageIndex = 4
      object pgctrl_house_direto: TPageControl
        Left = 0
        Top = 0
        Width = 704
        Height = 394
        ActivePage = ts_direto_dados_basicos
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_housesChange
        object ts_direto_dados_basicos: TTabSheet
          Caption = 'Dados B'#225'sicos'
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 43
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label65: TLabel
              Left = 7
              Top = 5
              Width = 39
              Height = 13
              Caption = 'Master'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label66: TLabel
              Left = 131
              Top = 5
              Width = 99
              Height = 13
              Caption = 'Unidade Neg'#243'cio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label67: TLabel
              Left = 351
              Top = 5
              Width = 45
              Height = 13
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 576
              Top = 6
              Width = 53
              Height = 13
              Caption = 'Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_nr_master_direto: TDBEdit
              Left = 6
              Top = 18
              Width = 104
              Height = 21
              DataField = 'NR_MASTER'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 0
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit41: TDBEdit
              Left = 130
              Top = 18
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit42: TDBEdit
              Left = 155
              Top = 18
              Width = 169
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit43: TDBEdit
              Left = 376
              Top = 18
              Width = 175
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit44: TDBEdit
              Left = 350
              Top = 18
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit1: TDBEdit
              Left = 575
              Top = 18
              Width = 107
              Height = 21
              Color = clMenu
              DataField = 'calc_processo'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 5
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 43
            Width = 696
            Height = 323
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object Label69: TLabel
              Left = 350
              Top = 13
              Width = 47
              Height = 13
              Caption = 'Armador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label75: TLabel
              Left = 350
              Top = 48
              Width = 44
              Height = 13
              Caption = 'Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label81: TLabel
              Left = 10
              Top = 47
              Width = 40
              Height = 13
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label82: TLabel
              Left = 10
              Top = 127
              Width = 63
              Height = 13
              Caption = 'Notificador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_notifi: TSpeedButton
              Left = 308
              Top = 141
              Width = 25
              Height = 20
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
              OnClick = btn_co_notifiClick
            end
            object Label83: TLabel
              Left = 351
              Top = 247
              Width = 131
              Height = 13
              Caption = 'Armaz'#233'm de Atraca'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object btn_co_atra_direto: TSpeedButton
              Left = 655
              Top = 260
              Width = 25
              Height = 20
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
              Visible = False
              OnClick = btn_co_atra_diretoClick
            end
            object Label84: TLabel
              Left = 10
              Top = 246
              Width = 127
              Height = 13
              Caption = 'Armaz'#233'm de Descarga'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label85: TLabel
              Left = 350
              Top = 124
              Width = 34
              Height = 13
              Caption = 'Navio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_veic_direto: TSpeedButton
              Left = 655
              Top = 139
              Width = 25
              Height = 19
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
              OnClick = btn_co_veic_diretoClick
            end
            object Label86: TLabel
              Left = 350
              Top = 163
              Width = 59
              Height = 13
              Caption = 'Nr Viagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label88: TLabel
              Left = 481
              Top = 163
              Width = 57
              Height = 13
              Caption = 'Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 10
              Top = 87
              Width = 61
              Height = 13
              Caption = 'Importador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label32: TLabel
              Left = 350
              Top = 87
              Width = 61
              Height = 13
              Caption = 'Comiss'#225'ria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 135
              Top = 164
              Width = 50
              Height = 13
              Caption = 'Incoterm'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label34: TLabel
              Left = 203
              Top = 164
              Width = 59
              Height = 13
              Caption = 'Tipo Frete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_exp_direto: TSpeedButton
              Left = 308
              Top = 101
              Width = 25
              Height = 20
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
              OnClick = btn_exp_diretoClick
            end
            object btn_co_desp_direto: TSpeedButton
              Left = 655
              Top = 102
              Width = 25
              Height = 20
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
              OnClick = btn_co_desp_diretoClick
            end
            object btn_co_desc_direto: TSpeedButton
              Left = 308
              Top = 261
              Width = 25
              Height = 20
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
              Visible = False
              OnClick = btn_co_desc_diretoClick
            end
            object Label7: TLabel
              Left = 10
              Top = 11
              Width = 62
              Height = 13
              Caption = 'Exportador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 13
              Top = 166
              Width = 64
              Height = 13
              Caption = 'Nr Booking'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 576
              Top = 163
              Width = 75
              Height = 13
              Caption = 'Recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label40: TLabel
              Left = 352
              Top = 203
              Width = 64
              Height = 13
              Caption = 'Ref.Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label30: TLabel
              Left = 484
              Top = 202
              Width = 47
              Height = 13
              Caption = 'Emiss'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object dbedt_cd_arm_direto: TDBEdit
              Left = 350
              Top = 27
              Width = 41
              Height = 21
              Color = clMenu
              DataField = 'CD_ARMADOR'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit48: TDBEdit
              Left = 393
              Top = 27
              Width = 260
              Height = 21
              Color = clMenu
              DataField = 'NM_ARMADOR'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit49: TDBEdit
              Left = 350
              Top = 61
              Width = 34
              Height = 21
              Color = clMenu
              DataField = 'CD_DESTINO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 2
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit50: TDBEdit
              Left = 386
              Top = 61
              Width = 267
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO_1'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit51: TDBEdit
              Left = 50
              Top = 61
              Width = 258
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit52: TDBEdit
              Left = 10
              Top = 61
              Width = 37
              Height = 21
              Color = clMenu
              DataField = 'CD_ORIGEM'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 5
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_notifi: TDBEdit
              Left = 49
              Top = 141
              Width = 256
              Height = 21
              Color = clMenu
              DataField = 'NM_NOTIFICADOR'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 6
            end
            object dbedt_nm_atrac_direto: TDBEdit
              Left = 390
              Top = 260
              Width = 264
              Height = 21
              Color = clMenu
              DataField = 'NM_ATRACACAO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 7
              Visible = False
            end
            object dbedt_nm_desc_direto: TDBEdit
              Left = 48
              Top = 260
              Width = 256
              Height = 21
              Color = clMenu
              DataField = 'NM_DESCARGA'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 8
              Visible = False
            end
            object dbedt_nm_veic_direto: TDBEdit
              Left = 393
              Top = 138
              Width = 260
              Height = 21
              Color = clMenu
              DataField = 'NM_VEICULO'
              DataSource = datm_exp_profit_marit.ds_master
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_nm_exp_direto: TDBEdit
              Left = 52
              Top = 100
              Width = 254
              Height = 21
              Color = clMenu
              DataField = 'NM_EMP_EST'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 10
            end
            object dbedt_nm_despachante_direto: TDBEdit
              Left = 395
              Top = 101
              Width = 258
              Height = 21
              Color = clMenu
              DataField = 'NM_COMISSARIA'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 11
            end
            object DBEdit11: TDBEdit
              Left = 10
              Top = 24
              Width = 42
              Height = 21
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 12
            end
            object DBEdit12: TDBEdit
              Left = 52
              Top = 24
              Width = 256
              Height = 21
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 13
            end
            object dbedt_cd_exp_direto: TDBEdit
              Left = 10
              Top = 100
              Width = 39
              Height = 21
              DataField = 'CD_EMP_EST'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 14
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_exp_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_despachante_direto: TDBEdit
              Left = 350
              Top = 101
              Width = 39
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 15
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_cd_despachante_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_notifi: TDBEdit
              Left = 10
              Top = 141
              Width = 35
              Height = 21
              DataField = 'CD_NOTIFICADOR'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 16
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_notifiExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_atrac_direto: TDBEdit
              Left = 351
              Top = 260
              Width = 37
              Height = 21
              DataField = 'CD_ARMAZEM_ATRACACAO'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 17
              Visible = False
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_atrac_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_desc_direto: TDBEdit
              Left = 10
              Top = 260
              Width = 37
              Height = 21
              DataField = 'CD_ARMAZEM_DESCARGA'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 18
              Visible = False
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_desc_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_veic_direto: TDBEdit
              Left = 350
              Top = 138
              Width = 37
              Height = 21
              DataField = 'CD_VEICULO'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 19
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_veic_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object nr_booking_direto: TDBEdit
              Left = 12
              Top = 178
              Width = 117
              Height = 21
              DataField = 'NR_BOOKING'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 20
              OnChange = dbedt_cd_agente_diretoChange
            end
            object dblook_incoterm_direto: TDBLookupComboBox
              Left = 135
              Top = 179
              Width = 65
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_exp_profit_marit.ds_processo
              ListField = 'CODIGO'
              TabOrder = 21
              OnClick = dblook_incoterm_diretoClick
            end
            object dblook_tp_frete_direto: TDBLookupComboBox
              Left = 203
              Top = 179
              Width = 78
              Height = 21
              Color = clMenu
              DataField = 'Look_nm_tp_frete'
              DataSource = datm_exp_profit_marit.ds_processo
              ListField = 'CODIGO'
              ReadOnly = True
              TabOrder = 22
              OnClick = dbedt_cd_exp_diretoChange
            end
            object dbedt_nr_voo_direto: TDBEdit
              Left = 350
              Top = 178
              Width = 124
              Height = 21
              DataField = 'NR_VOO'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 23
              OnChange = dbedt_cd_agente_diretoChange
            end
            object dbedt_dt_embarque_direto: TDBEdit
              Left = 481
              Top = 178
              Width = 81
              Height = 21
              DataField = 'DT_EMBARQUE'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 24
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit10: TDBEdit
              Left = 576
              Top = 176
              Width = 77
              Height = 21
              Color = clMenu
              DataField = 'DT_RECEBIMENTO'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 25
            end
            object DBEdit38: TDBEdit
              Left = 352
              Top = 216
              Width = 125
              Height = 21
              Color = clMenu
              DataField = 'REF_CLIENTE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 26
            end
            object dbedt_dt_emissao_direto: TDBEdit
              Left = 483
              Top = 216
              Width = 100
              Height = 21
              DataField = 'DT_EMISSAO_DTA'
              DataSource = datm_exp_profit_marit.ds_master
              TabOrder = 27
              Visible = False
              OnChange = dbedt_cd_agente_diretoChange
            end
          end
        end
        object ts_direto_comp: TTabSheet
          Caption = 'Composi'#231#227'o do Frete'
          ImageIndex = 1
          object Label101: TLabel
            Left = 0
            Top = 158
            Width = 696
            Height = 13
            Align = alBottom
            Caption = 'Others Charges'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnl_lcl_direto: TPanel
            Left = 0
            Top = 48
            Width = 696
            Height = 110
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 3
            object dbgrid_lcl_direto: TDBGrid
              Left = 2
              Top = 2
              Width = 692
              Height = 106
              Align = alClient
              DataSource = datm_exp_profit_marit.ds_processo_carga
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TP_EMBALAGEM'
                  Title.Caption = 'C'#243'd.'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NM_EMBALAGEM'
                  Title.Caption = 'Tipo da Embalagem'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 129
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QTDE'
                  Title.Caption = 'Qtde'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESO_TON'
                  Title.Caption = 'Peso Bruto (TON)'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 136
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESO_VOLUMETRICO'
                  Title.Caption = 'Cubagem (M3)'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 94
                  Visible = True
                end>
            end
          end
          object pnl_fcl_direto: TPanel
            Left = 0
            Top = 48
            Width = 696
            Height = 110
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 2
            object dbgrid_cntr_direto: TDBGrid
              Left = 2
              Top = 2
              Width = 692
              Height = 106
              Align = alClient
              DataSource = datm_exp_profit_marit.ds_proc_cntr
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TP_CNTR'
                  Title.Caption = 'C'#243'd.'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Look_nm_cntr'
                  Title.Caption = 'Contanier'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_PESO_TON'
                  Title.Caption = 'Peso Bruto (Ton)'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 102
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_VENDA'
                  Title.Caption = 'Venda'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_CNTR'
                  Title.Caption = 'Numero do Contanier'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 133
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_LACRE'
                  Title.Caption = 'Lacre'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 97
                  Visible = True
                end>
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 48
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object lb_tarifa: TLabel
              Left = 395
              Top = 5
              Width = 34
              Height = 13
              Caption = 'Tarifa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label98: TLabel
              Left = 206
              Top = 5
              Width = 97
              Height = 13
              Caption = 'Peso Bruto (Ton)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label99: TLabel
              Left = 566
              Top = 5
              Width = 63
              Height = 13
              Caption = 'Total Frete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label100: TLabel
              Left = 12
              Top = 5
              Width = 107
              Height = 13
              Caption = 'Tipo de Estufagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_charg_direto: TDBEdit
              Left = 205
              Top = 20
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'CHARGEABLE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_cd_exp_diretoChange
            end
            object rxcombo_tp_estufagem_direto: TRxDBComboBox
              Left = 13
              Top = 19
              Width = 105
              Height = 21
              Style = csDropDownList
              DataField = 'TP_ESTUFAGEM'
              DataSource = datm_exp_profit_marit.ds_processo
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'LCL'
                'FCL'
                'Break Bulk')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2')
              OnChange = rxcombo_tp_estufagem_diretoChange
            end
            object dbedt_tarifa_direto: TDBEdit
              Left = 393
              Top = 20
              Width = 102
              Height = 21
              DataField = 'VL_TARIFA_FRETE'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 2
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tt_frete_direto: TDBEdit
              Left = 569
              Top = 20
              Width = 103
              Height = 21
              DataField = 'VL_FRETE'
              DataSource = datm_exp_profit_marit.ds_processo
              TabOrder = 3
              OnChange = dbedt_cd_exp_diretoChange
            end
          end
          object dbgrid_other_direto: TDBGrid
            Left = 0
            Top = 171
            Width = 696
            Height = 142
            Align = alBottom
            DataSource = datm_exp_profit_marit.ds_other_charges
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_item'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 208
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_tp_calc'
                Title.Caption = 'Tipo Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 96
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_CLI'
                Title.Caption = 'Valor Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VENDA'
                Title.Caption = 'Venda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_due'
                Title.Caption = 'Due'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_frete'
                Title.Caption = 'PP/CC'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'in_notificacao'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 75
                Visible = True
              end>
          end
          object Panel17: TPanel
            Left = 0
            Top = 313
            Width = 696
            Height = 53
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 4
            object Label103: TLabel
              Left = 351
              Top = 5
              Width = 139
              Height = 13
              Caption = 'Total das Other Charges'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label104: TLabel
              Left = 514
              Top = 5
              Width = 88
              Height = 13
              Caption = 'Total do House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit73: TDBEdit
              Left = 352
              Top = 19
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit74: TDBEdit
              Left = 512
              Top = 19
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_HOUSE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object GroupBox7: TGroupBox
              Left = 43
              Top = 4
              Width = 235
              Height = 44
              Caption = 'Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object SpeedButton1: TSpeedButton
                Left = 118
                Top = 18
                Width = 25
                Height = 20
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
                OnClick = btn_co_moeda_mle_consoClick
              end
              object dbedt_vl_merc_direto: TDBEdit
                Left = 150
                Top = 18
                Width = 72
                Height = 21
                DataField = 'VL_MLE_MNEG'
                DataSource = datm_exp_profit_marit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_cd_exp_diretoChange
              end
              object dbedt_cd_moeda_mle_direto: TDBEdit
                Left = 11
                Top = 18
                Width = 32
                Height = 21
                DataField = 'CD_MOEDA_MLE'
                DataSource = datm_exp_profit_marit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_cd_exp_diretoChange
                OnExit = dbedt_cd_moeda_mle_diretoExit
                OnKeyDown = dbedt_cd_agente_diretoKeyDown
              end
              object dbedt_nm_moeda_mle_direto: TDBEdit
                Left = 46
                Top = 18
                Width = 67
                Height = 21
                Color = clMenu
                DataField = 'AP_MOEDA_MLE'
                DataSource = datm_exp_profit_marit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
            end
          end
        end
        object ts_direto_brasil: TTabSheet
          Caption = 'Custo no Brasil'
          ImageIndex = 2
          object Label105: TLabel
            Left = 0
            Top = 0
            Width = 696
            Height = 13
            Align = alTop
            Caption = 'Despesa do House'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label106: TLabel
            Left = 0
            Top = 173
            Width = 696
            Height = 13
            Align = alTop
            Caption = 'Valores Brasil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgrid_desp_direto: TDBGrid
            Left = 0
            Top = 13
            Width = 696
            Height = 160
            Align = alTop
            DataSource = datm_exp_profit_marit.ds_despesa_house
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyUp = dbgrid_desp_diretoKeyUp
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_item'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 151
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_MOEDA'
                Title.Caption = 'Cod.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_moeda'
                Title.Caption = 'Moeda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_nm_tp_base'
                Title.Caption = 'Tipo Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_AG'
                Title.Caption = 'Valor Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_COMPRA_AG'
                Title.Caption = 'Valor'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_CUSTO_EST'
                ReadOnly = True
                Title.Caption = 'Valor Convertido'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end>
          end
          object dbgrid_vl_direto: TDBGrid
            Left = 0
            Top = 186
            Width = 696
            Height = 180
            Align = alClient
            DataSource = datm_exp_profit_marit.ds_vl_brasil
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyUp = dbgrid_vl_diretoKeyUp
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_item'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 201
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_MOEDA_VENDA'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 36
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_moeda'
                Title.Caption = 'Moeda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_tp_base'
                Title.Caption = 'Tipo Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_CLI'
                Title.Caption = 'Valor Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VENDA'
                Title.Caption = 'Venda'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VENDA_EST'
                ReadOnly = True
                Title.Caption = 'Valor Convertido'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'in_notificacao'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 75
                Visible = True
              end>
          end
        end
        object ts_direto_calc_profit: TTabSheet
          Caption = 'Calculo Profit'
          ImageIndex = 3
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 29
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label107: TLabel
              Left = 28
              Top = 8
              Width = 37
              Height = 13
              Caption = 'House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label42: TLabel
              Left = 289
              Top = 9
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit75: TDBEdit
              Left = 75
              Top = 4
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_exp_profit_marit.ds_house
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit53: TDBEdit
              Left = 335
              Top = 4
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox2: TGroupBox
            Left = 1
            Top = 36
            Width = 115
            Height = 146
            Caption = 'Valor Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label109: TLabel
              Left = 10
              Top = 103
              Width = 70
              Height = 13
              Caption = 'Total Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label110: TLabel
              Left = 10
              Top = 62
              Width = 76
              Height = 13
              Caption = 'Other Charge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label111: TLabel
              Left = 10
              Top = 20
              Width = 70
              Height = 13
              Caption = 'Frete Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit76: TDBEdit
              Left = 10
              Top = 117
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_VENDA'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit78: TDBEdit
              Left = 10
              Top = 33
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_FRETE'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit79: TDBEdit
              Left = 10
              Top = 76
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
          object GroupBox3: TGroupBox
            Left = 117
            Top = 37
            Width = 115
            Height = 146
            Caption = 'Valor Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label113: TLabel
              Left = 10
              Top = 103
              Width = 66
              Height = 13
              Caption = 'Total Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label114: TLabel
              Left = 10
              Top = 63
              Width = 76
              Height = 13
              Caption = 'Other Charge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label115: TLabel
              Left = 10
              Top = 21
              Width = 66
              Height = 13
              Caption = 'Frete Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit80: TDBEdit
              Left = 10
              Top = 117
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_profit_direto: TDBEdit
              Left = 10
              Top = 34
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_RATEIO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = dbedt_cd_exp_diretoChange
            end
            object DBEdit83: TDBEdit
              Left = 10
              Top = 77
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
          object Panel14: TPanel
            Left = 233
            Top = 42
            Width = 285
            Height = 141
            Color = clSilver
            TabOrder = 3
            object Label121: TLabel
              Left = 157
              Top = 15
              Width = 66
              Height = 13
              Caption = 'Profit Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label126: TLabel
              Left = 10
              Top = 98
              Width = 76
              Height = 13
              Caption = 'Profit Liquido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label127: TLabel
              Left = 10
              Top = 15
              Width = 71
              Height = 13
              Caption = 'Profit House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 10
              Top = 60
              Width = 113
              Height = 13
              Caption = 'Valor Receita Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 158
              Top = 60
              Width = 118
              Height = 13
              Caption = 'Valor Despesa Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit85: TDBEdit
              Left = 157
              Top = 30
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_BRASIL'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 0
              Visible = False
            end
            object DBEdit90: TDBEdit
              Left = 10
              Top = 112
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_LIQUIDO'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit91: TDBEdit
              Left = 10
              Top = 30
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit31: TDBEdit
              Left = 10
              Top = 73
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_exp_profit_marit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit45: TDBEdit
              Left = 158
              Top = 73
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_exp_profit_marit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
      end
    end
    object ts_obs: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 5
      object DBM_texto: TDBMemo
        Left = 0
        Top = 0
        Width = 704
        Height = 394
        Align = alClient
        DataField = 'TEXTO'
        DataSource = datm_exp_profit_marit.ds_master
        TabOrder = 0
        OnChange = dbedt_cd_agente_diretoChange
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 612
    Top = 401
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_pesquisa: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesqClick
    end
    object mi_tarifa_master: TMenuItem
      Caption = '&Tarifa Master'
      Enabled = False
      OnClick = btn_tarifa_masterClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Calc. Pro&fit'
      Enabled = False
      OnClick = btn_calculoClick
    end
    object mi_transf_proc: TMenuItem
      Caption = '&Transf. Processo'
      Enabled = False
    end
    object mi_estorno_proc: TMenuItem
      Caption = '&Estornar Processo'
      Enabled = False
    end
    object mi_final_conso: TMenuItem
      Caption = 'E&ncera Consolidada'
      Enabled = False
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object popmenu_lista_rel: TPopupMenu
    Left = 572
    Top = 402
    object mi_pre_alerta_cli: TMenuItem
      Caption = 'Pr'#233' - Alerta'
      OnClick = mi_pre_alerta_cliClick
    end
    object mi_notificacao: TMenuItem
      Caption = 'Notifica'#231#227'o'
      OnClick = btn_imprimirClick
    end
    object mi_conhec_bl: TMenuItem
      Caption = 'Emiss'#227'o B/L'
      OnClick = mi_conhec_blClick
    end
    object mi_emissao_draft: TMenuItem
      Caption = 'Emiss'#227'o Draft'
      Visible = False
      OnClick = mi_emissao_draftClick
    end
  end
end
