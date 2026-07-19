object frm_calc_profit: Tfrm_calc_profit
  Left = 123
  Top = 148
  Width = 788
  Height = 527
  Caption = 'Pr'#233' - Alerta - '#193'ereo'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object painel_inclusao: TPanel
    Left = 225
    Top = 0
    Width = 346
    Height = 408
    TabOrder = 2
    Visible = False
    object Label122: TLabel
      Left = 15
      Top = 20
      Width = 86
      Height = 13
      Caption = 'Tipo do Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label123: TLabel
      Left = 184
      Top = 18
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
    object Label4: TLabel
      Left = 16
      Top = 53
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 185
      Top = 53
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
    object Label11: TLabel
      Left = 16
      Top = 153
      Width = 63
      Height = 13
      Caption = 'Companhia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 17
      Top = 119
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
    object lb_agente: TLabel
      Left = 16
      Top = 222
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
    object Label15: TLabel
      Left = 15
      Top = 85
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
    object Label16: TLabel
      Left = 16
      Top = 256
      Width = 59
      Height = 13
      Caption = 'Processos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 138
      Top = 256
      Width = 43
      Height = 13
      Caption = 'Houses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_orig: TSpeedButton
      Left = 312
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
      OnClick = btn_co_origClick
    end
    object btn_co_dest: TSpeedButton
      Left = 313
      Top = 132
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
      OnClick = btn_co_destClick
    end
    object btn_co_cia: TSpeedButton
      Left = 313
      Top = 167
      Width = 25
      Height = 21
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
      OnClick = btn_co_ciaClick
    end
    object btn_co_ag: TSpeedButton
      Left = 313
      Top = 236
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
      OnClick = btn_co_agClick
    end
    object IncludeBtn: TSpeedButton
      Left = 107
      Top = 280
      Width = 24
      Height = 24
      Caption = '>'
      OnClick = IncludeBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 107
      Top = 312
      Width = 24
      Height = 24
      Caption = '<'
      Enabled = False
      OnClick = ExcludeBtnClick
    end
    object Label14: TLabel
      Left = 226
      Top = 256
      Width = 60
      Height = 13
      Caption = 'Nr Houses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 17
      Top = 188
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
    object btn_co_moeda: TSpeedButton
      Left = 314
      Top = 202
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
      OnClick = btn_co_moedaClick
    end
    object btn_inclusao: TButton
      Left = 105
      Top = 382
      Width = 57
      Height = 20
      Caption = 'OK'
      TabOrder = 10
      OnClick = btn_inclusaoClick
    end
    object btn_cancela: TButton
      Left = 169
      Top = 381
      Width = 57
      Height = 22
      Caption = 'Cancelar'
      TabOrder = 11
      OnClick = btn_cancelaClick
    end
    object ComboBox_tp_master: TComboBox
      Left = 16
      Top = 32
      Width = 153
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox_tp_masterChange
      Items.Strings = (
        'Direto'
        'Consolidado')
    end
    object msk_master: TMaskEdit
      Left = 184
      Top = 32
      Width = 121
      Height = 21
      EditMask = '999-9999-9999;1;_'
      MaxLength = 13
      TabOrder = 1
      Text = '   -    -    '
      OnExit = msk_masterExit
    end
    object Panel23: TPanel
      Left = 2
      Top = 1
      Width = 345
      Height = 18
      Color = clActiveCaption
      TabOrder = 12
      object Label125: TLabel
        Left = 8
        Top = 3
        Width = 49
        Height = 13
        Caption = 'Inclus'#227'o'
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
    object edt_nm_unid: TEdit
      Left = 16
      Top = 65
      Width = 153
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object edt_nm_prod: TEdit
      Left = 182
      Top = 65
      Width = 155
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_origem: TMaskEdit
      Left = 15
      Top = 98
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 4
      OnExit = msk_cd_origemExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object edt_nm_origem: TEdit
      Left = 53
      Top = 98
      Width = 257
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 13
    end
    object msk_cd_destino: TMaskEdit
      Left = 16
      Top = 132
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 5
      OnExit = msk_cd_destinoExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object edt_nm_destino: TEdit
      Left = 54
      Top = 132
      Width = 257
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 14
    end
    object msk_cd_cia: TMaskEdit
      Left = 17
      Top = 166
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 6
      OnExit = msk_cd_ciaExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object edt_nm_cia: TEdit
      Left = 55
      Top = 166
      Width = 257
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 15
    end
    object msk_cd_agente: TMaskEdit
      Left = 17
      Top = 235
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 8
      OnExit = msk_cd_agenteExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object edt_nm_agente: TEdit
      Left = 55
      Top = 235
      Width = 257
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 16
    end
    object Lis_proc: TListBox
      Left = 16
      Top = 272
      Width = 86
      Height = 105
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 17
    end
    object Lis_house: TListBox
      Left = 135
      Top = 272
      Width = 86
      Height = 105
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 18
    end
    object grdRef: TStringGrid
      Left = 225
      Top = 272
      Width = 111
      Height = 103
      ColCount = 2
      DefaultColWidth = 130
      DefaultRowHeight = 13
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
      ScrollBars = ssVertical
      TabOrder = 9
      OnKeyDown = grdRefKeyDown
      OnSetEditText = grdRefSetEditText
    end
    object msk_cd_moeda: TMaskEdit
      Left = 18
      Top = 201
      Width = 34
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 7
      OnExit = msk_cd_moedaExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object edt_nm_moeda: TEdit
      Left = 56
      Top = 201
      Width = 257
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 19
    end
  end
  object pgctrl_aviso_cheg: TPageControl
    Left = 0
    Top = 39
    Width = 780
    Height = 442
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
        Top = 83
        Width = 772
        Height = 331
        Align = alClient
        DataSource = datm_calc_profit.ds_pes_cliente
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
            FieldName = 'NR_MASTER'
            Title.Caption = 'Master'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 82
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
            Width = 63
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
            Width = 59
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
            Width = 148
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
            Width = 45
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
            FieldName = 'AP_MOEDA'
            Title.Caption = 'Moeda'
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
            FieldName = 'DT_PREV_CHEGADA'
            Title.Caption = 'Chegada'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CIA_TRANSP'
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
            FieldName = 'NM_CIA_TRANSP'
            Title.Caption = 'Cia'
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
            FieldName = 'CD_EMP_EST'
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
            FieldName = 'NM_EMP_EST'
            Title.Caption = 'Exportador'
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
            FieldName = 'calc_tp_master'
            Title.Caption = 'Tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 39
            Visible = True
          end>
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 772
        Height = 83
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 11
          Top = 5
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
          Left = 412
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
        object Label8: TLabel
          Left = 412
          Top = 41
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
          Left = 309
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
          OnClick = btn_co_unid_pesqClick
        end
        object btn_co_prod_pesq: TSpeedButton
          Left = 723
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
          OnClick = btn_co_prod_pesqClick
        end
        object btn_co_destino_pesq: TSpeedButton
          Left = 723
          Top = 54
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
          Left = 11
          Top = 41
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
          Left = 309
          Top = 54
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
          Left = 11
          Top = 18
          Width = 32
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnExit = msk_unid_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_unid_pesq: TEdit
          Left = 47
          Top = 18
          Width = 259
          Height = 21
          Color = clMenu
          TabOrder = 4
        end
        object msk_prod_pesq: TMaskEdit
          Left = 412
          Top = 18
          Width = 31
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 1
          OnExit = msk_prod_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_prod_pesq: TEdit
          Left = 446
          Top = 18
          Width = 275
          Height = 21
          Color = clMenu
          TabOrder = 5
        end
        object msk_destino_pesq: TMaskEdit
          Left = 412
          Top = 54
          Width = 41
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 3
          OnExit = msk_destino_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_destino_pesq: TEdit
          Left = 455
          Top = 54
          Width = 266
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object msk_origem_pesq: TMaskEdit
          Left = 11
          Top = 54
          Width = 41
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 2
          OnExit = msk_origem_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_origem_pesq: TEdit
          Left = 54
          Top = 54
          Width = 253
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
      object Panel9: TPanel
        Left = 0
        Top = 45
        Width = 772
        Height = 369
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
          Width = 60
          Height = 13
          Caption = 'Cia. A'#233'rea'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 8
          Top = 81
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
        object Label47: TLabel
          Left = 239
          Top = 82
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
          Top = 44
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
          Top = 45
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
          Left = 8
          Top = 124
          Width = 35
          Height = 13
          Caption = 'Sa'#237'da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 109
          Top = 80
          Width = 40
          Height = 13
          Caption = 'V'#244'o Nr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 120
          Top = 124
          Width = 81
          Height = 13
          Caption = 'Prev.Chegada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 234
          Top = 124
          Width = 51
          Height = 13
          Caption = 'Chegada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_agente_conso: TDBEdit
          Left = 8
          Top = 19
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_agente_conso: TDBEdit
          Left = 48
          Top = 19
          Width = 278
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_cia_conso: TDBEdit
          Left = 357
          Top = 19
          Width = 41
          Height = 21
          Color = clMenu
          DataField = 'CD_CIA_TRANSP'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 2
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_cia_conso: TDBEdit
          Left = 400
          Top = 19
          Width = 277
          Height = 21
          Color = clMenu
          DataField = 'NM_CIA_TRANSP'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_moeda_conso: TDBEdit
          Left = 46
          Top = 95
          Width = 59
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_calc_profit.ds_master
          TabOrder = 10
        end
        object dbedt_cd_moeda_conso: TDBEdit
          Left = 8
          Top = 95
          Width = 36
          Height = 21
          Color = clMenu
          DataField = 'CD_MOEDA'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_cd_origem_conso: TDBEdit
          Left = 8
          Top = 58
          Width = 37
          Height = 21
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_origem_conso: TDBEdit
          Left = 46
          Top = 58
          Width = 281
          Height = 21
          Color = clMenu
          DataField = 'NM_PORTO'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_destino_conso: TDBEdit
          Left = 357
          Top = 58
          Width = 34
          Height = 21
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_cd_agente_diretoChange
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_destino_conso: TDBEdit
          Left = 393
          Top = 58
          Width = 284
          Height = 21
          Color = clMenu
          DataField = 'NM_PORTO_1'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_nr_voo_conso: TDBEdit
          Left = 109
          Top = 95
          Width = 124
          Height = 21
          DataField = 'NR_VOO'
          DataSource = datm_calc_profit.ds_master
          TabOrder = 11
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dblookp_tp_frete_master: TDBLookupComboBox
          Left = 239
          Top = 96
          Width = 90
          Height = 21
          DataField = 'Look_nm_frete_master'
          DataSource = datm_calc_profit.ds_master
          ListField = 'CODIGO'
          TabOrder = 12
          OnClick = dbedt_cd_agente_diretoChange
        end
        object dbedt_dt_saida_conso: TDBEdit
          Left = 8
          Top = 139
          Width = 95
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_calc_profit.ds_master
          TabOrder = 13
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_dt_cheg_conso: TDBEdit
          Left = 120
          Top = 139
          Width = 95
          Height = 21
          DataField = 'DT_PREV_CHEGADA'
          DataSource = datm_calc_profit.ds_master
          TabOrder = 14
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_dt_chegada: TDBEdit
          Left = 231
          Top = 139
          Width = 95
          Height = 21
          DataField = 'DT_CHEGADA'
          DataSource = datm_calc_profit.ds_master
          TabOrder = 15
          OnChange = dbedt_cd_agente_diretoChange
        end
        object GroupBox7: TGroupBox
          Left = 359
          Top = 84
          Width = 322
          Height = 58
          Caption = 'Master'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object Label197: TLabel
            Left = 10
            Top = 13
            Width = 48
            Height = 13
            Caption = 'Volumes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label199: TLabel
            Left = 206
            Top = 13
            Width = 109
            Height = 13
            Caption = 'Chargeable Weight'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label95: TLabel
            Left = 100
            Top = 13
            Width = 77
            Height = 13
            Caption = 'Gross Weight'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_vol_master: TDBEdit
            Left = 9
            Top = 29
            Width = 65
            Height = 21
            DataField = 'VOL_MASTER'
            DataSource = datm_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = dbedt_cd_agente_diretoChange
          end
          object dbedt_chargebel_master: TDBEdit
            Left = 205
            Top = 28
            Width = 84
            Height = 21
            DataField = 'CHARG_MASTER'
            DataSource = datm_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_chargebel_masterExit
          end
          object dbedt_gross_master: TDBEdit
            Left = 99
            Top = 29
            Width = 93
            Height = 21
            DataField = 'GROSS_MASTER'
            DataSource = datm_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_gross_masterExit
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 772
        Height = 45
        Align = alTop
        TabOrder = 0
        object Label44: TLabel
          Left = 13
          Top = 4
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
          Left = 123
          Top = 6
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
          Left = 339
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
        object Label30: TLabel
          Left = 558
          Top = 8
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
        object DBEdit13: TDBEdit
          Left = 12
          Top = 17
          Width = 101
          Height = 21
          Color = clMenu
          DataField = 'NR_MASTER'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit16: TDBEdit
          Left = 122
          Top = 19
          Width = 24
          Height = 21
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit20: TDBEdit
          Left = 147
          Top = 19
          Width = 184
          Height = 21
          Color = clMenu
          DataField = 'NM_UNID_NEG'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit21: TDBEdit
          Left = 364
          Top = 19
          Width = 190
          Height = 21
          Color = clMenu
          DataField = 'NM_PRODUTO'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit22: TDBEdit
          Left = 338
          Top = 19
          Width = 24
          Height = 21
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit53: TDBEdit
          Left = 557
          Top = 20
          Width = 142
          Height = 21
          Color = clMenu
          DataField = 'CD_MASTER'
          DataSource = datm_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object ts_houses: TTabSheet
      Caption = 'Houses'
      ImageIndex = 11
      object pgctrl_houses: TPageControl
        Left = 0
        Top = 0
        Width = 772
        Height = 414
        ActivePage = ts_lista_houses
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_housesChange
        object ts_lista_houses: TTabSheet
          Caption = 'Lista'
          object DBGrid9: TDBGrid
            Left = 0
            Top = 47
            Width = 764
            Height = 339
            Align = alClient
            DataSource = datm_calc_profit.ds_house
            ReadOnly = True
            TabOrder = 1
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
                FieldName = 'CD_CLIENTE'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 43
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
                Width = 295
                Visible = True
              end>
          end
          object Panel28: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 47
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label183: TLabel
              Left = 436
              Top = 6
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
            object Label77: TLabel
              Left = 225
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
            object Label96: TLabel
              Left = 565
              Top = 6
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
            object DBEdit6: TDBEdit
              Left = 434
              Top = 18
              Width = 122
              Height = 21
              Color = clMenu
              DataField = 'NR_MASTER'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit7: TDBEdit
              Left = 5
              Top = 17
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit23: TDBEdit
              Left = 223
              Top = 17
              Width = 20
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit24: TDBEdit
              Left = 246
              Top = 17
              Width = 178
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit25: TDBEdit
              Left = 32
              Top = 17
              Width = 182
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit59: TDBEdit
              Left = 563
              Top = 18
              Width = 126
              Height = 21
              Color = clMenu
              DataField = 'CD_MASTER'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 5
            end
          end
          object pnl_incl_processo: TPanel
            Left = 244
            Top = 70
            Width = 258
            Height = 104
            BevelInner = bvLowered
            TabOrder = 2
            Visible = False
            object SpeedButton1: TSpeedButton
              Left = 109
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
              OnClick = SpeedButton1Click
            end
            object Label97: TLabel
              Left = 13
              Top = 5
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
            object Label98: TLabel
              Left = 141
              Top = 5
              Width = 55
              Height = 13
              Caption = 'N'#186' House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel1: TBevel
              Left = 15
              Top = 53
              Width = 234
              Height = 7
            end
            object Button1: TButton
              Left = 69
              Top = 67
              Width = 56
              Height = 26
              Caption = 'Incluir'
              TabOrder = 2
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 131
              Top = 67
              Width = 56
              Height = 26
              Caption = 'Cancelar'
              TabOrder = 3
              OnClick = Button2Click
            end
            object msk_processo: TMaskEdit
              Left = 15
              Top = 20
              Width = 90
              Height = 21
              TabOrder = 0
              OnExit = msk_processoExit
            end
            object msk_nr_house: TMaskEdit
              Left = 141
              Top = 20
              Width = 104
              Height = 21
              TabOrder = 1
            end
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 2
          object Panel13: TPanel
            Left = 0
            Top = 46
            Width = 764
            Height = 340
            Align = alClient
            TabOrder = 1
            object Label78: TLabel
              Left = 365
              Top = 85
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
              Left = 660
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
              Left = 365
              Top = 127
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
              Left = 533
              Top = 127
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
              Top = 48
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
            object Label93: TLabel
              Left = 365
              Top = 48
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
            object btn_co_exp_conso: TSpeedButton
              Left = 660
              Top = 61
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
              Top = 127
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
              Left = 365
              Top = 10
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
              Left = 455
              Top = 23
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
              Top = 10
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
              Top = 85
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
              Left = 319
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
              Visible = False
              OnClick = btn_co_moeda_conClick
            end
            object Label41: TLabel
              Left = 10
              Top = 165
              Width = 81
              Height = 13
              Caption = 'Prev.Chegada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label42: TLabel
              Left = 216
              Top = 165
              Width = 51
              Height = 13
              Caption = 'Chegada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label82: TLabel
              Left = 213
              Top = 10
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
            object Label90: TLabel
              Left = 485
              Top = 10
              Width = 64
              Height = 13
              Caption = 'Ref Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_nm_desp_conso: TDBEdit
              Left = 410
              Top = 99
              Width = 248
              Height = 21
              Color = clMenu
              DataField = 'NM_COMISSARIA'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 11
            end
            object dbedt_cd_cliente_conso: TDBEdit
              Left = 10
              Top = 61
              Width = 42
              Height = 21
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 4
            end
            object dbedt_nm_cliente_conso: TDBEdit
              Left = 54
              Top = 61
              Width = 262
              Height = 21
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_nm_exp_conso: TDBEdit
              Left = 410
              Top = 61
              Width = 248
              Height = 21
              Color = clMenu
              DataField = 'NM_EMP_EST'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_cd_det_house_conso: TDBEdit
              Left = 10
              Top = 140
              Width = 42
              Height = 21
              Color = clMenu
              DataField = 'CD_DESTINO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 12
              OnChange = dbedt_instr_direto1Change
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_dest_house_conso: TDBEdit
              Left = 52
              Top = 140
              Width = 265
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO_1'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 13
            end
            object msk_proc_conso: TMaskEdit
              Left = 365
              Top = 23
              Width = 86
              Height = 21
              Color = clMenu
              ReadOnly = True
              TabOrder = 2
              OnChange = msk_proc_diretoChange
              OnEnter = msk_proc_diretoEnter
              OnExit = msk_proc_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_moeda_con: TDBEdit
              Left = 51
              Top = 99
              Width = 266
              Height = 21
              Color = clMenu
              DataField = 'NM_MOEDA'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 9
            end
            object DBEdit14: TDBEdit
              Left = 10
              Top = 179
              Width = 95
              Height = 21
              Color = clMenu
              DataField = 'DT_PREV_CHEGADA'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 16
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit15: TDBEdit
              Left = 215
              Top = 179
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'DT_CHEGADA'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 17
              OnChange = dbedt_cd_agente_diretoChange
            end
            object dbedt_nr_house_conso: TDBEdit
              Left = 10
              Top = 23
              Width = 112
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_nr_house_consoExit
            end
            object dbedt_cd_exp_conso: TDBEdit
              Left = 365
              Top = 61
              Width = 42
              Height = 21
              DataField = 'CD_EMP_EST'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 6
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_exp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_moeda_conso: TDBEdit
              Left = 10
              Top = 99
              Width = 38
              Height = 21
              Color = clMenu
              DataField = 'CD_MOEDA_FRETE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 8
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_moeda_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_desp_conso: TDBEdit
              Left = 365
              Top = 99
              Width = 42
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 10
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_desp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dblook_incoterm: TDBLookupComboBox
              Left = 365
              Top = 140
              Width = 128
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_calc_profit.ds_processo
              ListField = 'CODIGO'
              TabOrder = 14
              OnClick = dblook_incotermClick
            end
            object dblook_tp_house_conso: TDBLookupComboBox
              Left = 533
              Top = 140
              Width = 125
              Height = 21
              Color = clMenu
              DataField = 'Look_nm_tp_frete'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 15
              OnClick = dbedt_cd_exp_diretoChange
            end
            object DBEdit47: TDBEdit
              Left = 213
              Top = 23
              Width = 101
              Height = 21
              Color = clMenu
              DataField = 'DT_RECEBIMENTO'
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit46: TDBEdit
              Left = 486
              Top = 23
              Width = 170
              Height = 21
              Color = clMenu
              DataField = 'REF_CLIENTE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 46
            Align = alTop
            TabOrder = 0
            object Label74: TLabel
              Left = 14
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
              Left = 367
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
              Left = 12
              Top = 17
              Width = 28
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit35: TDBEdit
              Left = 367
              Top = 17
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit36: TDBEdit
              Left = 392
              Top = 17
              Width = 262
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit37: TDBEdit
              Left = 43
              Top = 17
              Width = 217
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
        object ts_compos_frete: TTabSheet
          Caption = 'Composi'#231#227'o Frete'
          ImageIndex = 6
          object Label18: TLabel
            Left = 0
            Top = 48
            Width = 764
            Height = 13
            Align = alTop
            Caption = ' Others Charges'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel4: TBevel
            Left = 2
            Top = 49
            Width = 762
            Height = 13
            ParentShowHint = False
            ShowHint = False
          end
          object dbgrid_other_charge: TDBGrid
            Left = 0
            Top = 61
            Width = 764
            Height = 259
            Align = alTop
            DataSource = datm_calc_profit.ds_other_charges
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
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VENDA'
                ReadOnly = True
                Title.Caption = 'Venda'
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
                FieldName = 'in_notificao'
                ReadOnly = True
                Title.Caption = 'Notificado'
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
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 48
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label35: TLabel
              Left = 451
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
              Left = 276
              Top = 5
              Width = 109
              Height = 13
              Caption = 'Chargeable Weight'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label37: TLabel
              Left = 608
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
              Left = 10
              Top = 5
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
            object Label86: TLabel
              Left = 116
              Top = 5
              Width = 77
              Height = 13
              Caption = 'Gross Weight'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_qtde: TDBEdit
              Left = 11
              Top = 20
              Width = 59
              Height = 21
              Color = clMenu
              DataField = 'QTD_VOLUME'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 1
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_charg_conso: TDBEdit
              Left = 277
              Top = 20
              Width = 103
              Height = 21
              DataField = 'CHARGEABLE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 2
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tarifa_conso: TDBEdit
              Left = 452
              Top = 20
              Width = 102
              Height = 21
              DataField = 'VL_TARIFA_FRETE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 3
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tt_frete_conso: TDBEdit
              Left = 611
              Top = 20
              Width = 103
              Height = 21
              DataField = 'VL_FRETE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 4
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_gross_conso: TDBEdit
              Left = 117
              Top = 19
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'VL_PESO_BRUTO'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_cd_exp_diretoChange
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 320
            Width = 764
            Height = 61
            Align = alTop
            TabOrder = 2
            object Label22: TLabel
              Left = 351
              Top = 10
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
            object Label21: TLabel
              Left = 514
              Top = 10
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
            object DBEdit2: TDBEdit
              Left = 353
              Top = 25
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 517
              Top = 25
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_HOUSE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object GroupBox1: TGroupBox
              Left = 66
              Top = 8
              Width = 223
              Height = 45
              Caption = 'Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object btn_co_moeda_mle_conso: TSpeedButton
                Left = 102
                Top = 17
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
                Left = 135
                Top = 16
                Width = 81
                Height = 21
                DataField = 'VL_MERCADORIA'
                DataSource = datm_calc_profit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_cd_exp_diretoChange
              end
              object dbedt_nm_moeda_mle_conso: TDBEdit
                Left = 42
                Top = 17
                Width = 57
                Height = 21
                Color = clMenu
                DataField = 'AP_MOEDA_MLE'
                DataSource = datm_calc_profit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object dbedt_cd_moeda_mle_conso: TDBEdit
                Left = 7
                Top = 17
                Width = 31
                Height = 21
                DataField = 'CD_MOEDA_MLE'
                DataSource = datm_calc_profit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_cd_exp_diretoChange
                OnExit = dbedt_cd_moeda_mle_consoExit
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
            Width = 764
            Height = 13
            Align = alTop
            Caption = ' Despesa do House'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 0
            Top = 184
            Width = 764
            Height = 13
            Align = alTop
            Caption = ' Valores Brasil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel2: TBevel
            Left = 1
            Top = 0
            Width = 762
            Height = 13
            ParentShowHint = False
            ShowHint = False
          end
          object Bevel3: TBevel
            Left = 3
            Top = 185
            Width = 762
            Height = 13
            ParentShowHint = False
            ShowHint = False
          end
          object dbgrid_despesa_house: TDBGrid
            Left = 0
            Top = 13
            Width = 764
            Height = 171
            Align = alTop
            DataSource = datm_calc_profit.ds_despesa_house
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
                Width = 34
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
                Width = 51
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
                Width = 74
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
                Width = 81
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
          object dbgrid_vl_brasil: TDBGrid
            Left = 0
            Top = 197
            Width = 764
            Height = 189
            Align = alClient
            DataSource = datm_calc_profit.ds_vl_brasil
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
                Width = 174
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
                Width = 47
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
                Width = 62
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
                Width = 67
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
                Width = 42
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
                ReadOnly = True
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
                FieldName = 'in_notificado'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
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
            Width = 764
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
            object Label88: TLabel
              Left = 272
              Top = 7
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
              Top = 5
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit28: TDBEdit
              Left = 318
              Top = 4
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object GroupBox6: TGroupBox
            Left = 117
            Top = 29
            Width = 115
            Height = 140
            BiDiMode = bdLeftToRight
            Caption = 'Valor Custo'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            object Label158: TLabel
              Left = 8
              Top = 99
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
            object Label159: TLabel
              Left = 8
              Top = 57
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
            object Label160: TLabel
              Left = 8
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
            object dbedt_tt_house_custo: TDBEdit
              Left = 8
              Top = 113
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_frete_custo: TDBEdit
              Left = 8
              Top = 34
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_RATEIO'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_other_charge_custo: TDBEdit
              Left = 8
              Top = 71
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox5: TGroupBox
            Left = 0
            Top = 29
            Width = 115
            Height = 140
            BiDiMode = bdLeftToRight
            Caption = 'Valor Venda'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            object Label153: TLabel
              Left = 8
              Top = 99
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
            object Label154: TLabel
              Left = 8
              Top = 58
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
            object Label155: TLabel
              Left = 8
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
            object dbedt_tt_house_calc_prof: TDBEdit
              Left = 8
              Top = 113
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_VENDA'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_frete_venda: TDBEdit
              Left = 8
              Top = 33
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_FRETE'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_other_charge: TDBEdit
              Left = 8
              Top = 72
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel31: TPanel
            Left = 233
            Top = 34
            Width = 220
            Height = 135
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 4
            object lb_divisao: TLabel
              Left = 8
              Top = 46
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
            object Label29: TLabel
              Left = 120
              Top = 7
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
              Left = 8
              Top = 8
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
              Left = 9
              Top = 85
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
              Left = 112
              Top = 82
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
              Left = 8
              Top = 60
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_DIVISAO'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object rxdbcombo_tp_divisao: TRxDBComboBox
              Left = 120
              Top = 21
              Width = 90
              Height = 21
              Style = csDropDownList
              DataField = 'TP_DIVISAO'
              DataSource = datm_calc_profit.ds_processo
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Valor Fixo'
                'Porcetagem')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
              OnChange = rxdbcombo_tp_divisaoChange
            end
            object dbedt_profit_house: TDBEdit
              Left = 8
              Top = 22
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_profit_brasil: TDBEdit
              Left = 10
              Top = 98
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_BRASIL'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_profit_agente: TDBEdit
              Left = 110
              Top = 98
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_AGENTE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 4
            end
          end
          object Panel4: TPanel
            Left = 455
            Top = 33
            Width = 241
            Height = 135
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 3
            object Label166: TLabel
              Left = 8
              Top = 8
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
            object Label43: TLabel
              Left = 130
              Top = 8
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
              Left = 130
              Top = 55
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
            object Label65: TLabel
              Left = 8
              Top = 55
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
              Left = 8
              Top = 23
              Width = 95
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_MASTER'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit18: TDBEdit
              Left = 130
              Top = 23
              Width = 95
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_AG'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit8: TDBEdit
              Left = 130
              Top = 70
              Width = 95
              Height = 21
              Color = clMenu
              DataField = 'VL_REC_AG'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit9: TDBEdit
              Left = 8
              Top = 70
              Width = 95
              Height = 21
              Color = clMenu
              DataField = 'VL_REC_BR'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
          end
          object Panel5: TPanel
            Left = 233
            Top = 170
            Width = 317
            Height = 98
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 6
            object Label167: TLabel
              Left = 8
              Top = 11
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
              Left = 165
              Top = 11
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
            object Label66: TLabel
              Left = 8
              Top = 50
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
              Left = 165
              Top = 50
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
              Left = 8
              Top = 24
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_profit_liquido: TDBEdit
              Left = 165
              Top = 24
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit11: TDBEdit
              Left = 8
              Top = 63
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_PROF_BR'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit12: TDBEdit
              Left = 165
              Top = 63
              Width = 124
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_PROF_AG'
              DataSource = datm_calc_profit.ds_processo
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
          object Panel10: TPanel
            Left = 551
            Top = 169
            Width = 143
            Height = 98
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 5
            object Label81: TLabel
              Left = 15
              Top = 52
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
            object Label99: TLabel
              Left = 13
              Top = 11
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
            object DBEdit26: TDBEdit
              Left = 16
              Top = 66
              Width = 113
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_LIQUIDO'
              DataSource = datm_calc_profit.ds_processo
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
              Left = 14
              Top = 25
              Width = 113
              Height = 21
              Color = clMenu
              DataField = 'VL_FAT_COMPLEMENTAR'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
      end
    end
    object ts_tt_master: TTabSheet
      Caption = 'Totais do Master'
      ImageIndex = 4
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 772
        Height = 57
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label70: TLabel
          Left = 492
          Top = 7
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
          Left = 86
          Top = 7
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
        object Label25: TLabel
          Left = 333
          Top = 7
          Width = 113
          Height = 13
          Caption = 'Total das Despesas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 203
          Top = 7
          Width = 109
          Height = 13
          Caption = 'Chargeable Weight'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 6
          Top = 7
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
        object dbedt_tarifa_master_conso: TDBEdit
          Left = 84
          Top = 20
          Width = 97
          Height = 21
          Color = clMenu
          DataField = 'TARIFA_CUSTO'
          DataSource = datm_calc_profit.ds_master
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
        object dbedt_tt_frete_master_conso: TDBEdit
          Left = 491
          Top = 20
          Width = 130
          Height = 21
          Color = clMenu
          DataField = 'TT_FRETE_MASTER'
          DataSource = datm_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_termo_diretoChange
        end
        object DBEdit4: TDBEdit
          Left = 335
          Top = 20
          Width = 130
          Height = 21
          Color = clMenu
          DataField = 'TT_DESPESA_MASTER'
          DataSource = datm_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_termo_diretoChange
        end
        object DBEdit5: TDBEdit
          Left = 202
          Top = 20
          Width = 110
          Height = 21
          Color = clMenu
          DataField = 'CHARG_MASTER'
          DataSource = datm_calc_profit.ds_master
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
        object DBEdit1: TDBEdit
          Left = 6
          Top = 20
          Width = 59
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_calc_profit.ds_master
          TabOrder = 0
        end
      end
      object dbgrid_despesa_master: TDBGrid
        Left = 0
        Top = 57
        Width = 772
        Height = 175
        Align = alTop
        DataSource = datm_calc_profit.ds_despesa_master
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
            Width = 94
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
            Width = 29
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
            Width = 51
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
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_origem_desp'
            Title.Caption = 'Origem'
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
            FieldName = 'Look_base_calc'
            Title.Caption = 'Tipo Base'
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
            FieldName = 'VL_BASE_DESPESA'
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
            FieldName = 'VL_COMPRA_AG'
            Title.Caption = 'Compra'
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
            FieldName = 'Look_in_solicitado'
            ReadOnly = True
            Title.Caption = 'Solicitado'
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
        Top = 394
        Width = 772
        Height = 20
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 3
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
        Width = 772
        Height = 16
        Align = alBottom
        TabOrder = 2
        Visible = False
      end
    end
    object ts_direto: TTabSheet
      Caption = 'Direto'
      ImageIndex = 4
      object pgctrl_house_direto: TPageControl
        Left = 0
        Top = 0
        Width = 772
        Height = 414
        ActivePage = ts_direto_dados_basicos
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_housesChange
        OnChanging = pgctrl_aviso_chegChanging
        object ts_direto_dados_basicos: TTabSheet
          Caption = 'Dados B'#225'sicos'
          object Panel1: TPanel
            Left = 0
            Top = 41
            Width = 764
            Height = 345
            Align = alClient
            TabOrder = 1
            object Label48: TLabel
              Left = 355
              Top = 5
              Width = 60
              Height = 13
              Caption = 'Cia. A'#233'rea'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label49: TLabel
              Left = 10
              Top = 85
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
            object Label51: TLabel
              Left = 10
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
            object Label53: TLabel
              Left = 355
              Top = 44
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
            object Label55: TLabel
              Left = 222
              Top = 170
              Width = 35
              Height = 13
              Caption = 'Sa'#237'da'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label61: TLabel
              Left = 10
              Top = 170
              Width = 40
              Height = 13
              Caption = 'V'#244'o Nr'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label62: TLabel
              Left = 355
              Top = 170
              Width = 81
              Height = 13
              Caption = 'Prev.Chegada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label63: TLabel
              Left = 464
              Top = 171
              Width = 51
              Height = 13
              Caption = 'Chegada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label75: TLabel
              Left = 10
              Top = 4
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
            object Label12: TLabel
              Left = 355
              Top = 85
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
            object btn_exp_direto: TSpeedButton
              Left = 664
              Top = 99
              Width = 24
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
              Left = 298
              Top = 140
              Width = 24
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
            object Label32: TLabel
              Left = 11
              Top = 125
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
              Left = 507
              Top = 125
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
              Left = 585
              Top = 125
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
            object Label83: TLabel
              Left = 581
              Top = 172
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
            object Label91: TLabel
              Left = 355
              Top = 125
              Width = 64
              Height = 13
              Caption = 'Ref Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit32: TDBEdit
              Left = 355
              Top = 19
              Width = 41
              Height = 21
              Color = clMenu
              DataField = 'CD_CIA_TRANSP'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 2
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit33: TDBEdit
              Left = 398
              Top = 19
              Width = 263
              Height = 21
              Color = clMenu
              DataField = 'NM_CIA_TRANSP'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit38: TDBEdit
              Left = 49
              Top = 99
              Width = 273
              Height = 21
              Color = clMenu
              DataField = 'NM_MOEDA'
              DataSource = datm_calc_profit.ds_master
              TabOrder = 11
            end
            object DBEdit39: TDBEdit
              Left = 10
              Top = 99
              Width = 36
              Height = 21
              Color = clMenu
              DataField = 'CD_MOEDA'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 10
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit40: TDBEdit
              Left = 10
              Top = 56
              Width = 37
              Height = 21
              Color = clMenu
              DataField = 'CD_ORIGEM'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 4
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit41: TDBEdit
              Left = 49
              Top = 56
              Width = 273
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit42: TDBEdit
              Left = 355
              Top = 57
              Width = 34
              Height = 21
              Color = clMenu
              DataField = 'CD_DESTINO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 6
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit43: TDBEdit
              Left = 391
              Top = 57
              Width = 271
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO_1'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit44: TDBEdit
              Left = 10
              Top = 183
              Width = 191
              Height = 21
              DataField = 'NR_VOO'
              DataSource = datm_calc_profit.ds_master
              TabOrder = 17
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit45: TDBEdit
              Left = 220
              Top = 183
              Width = 106
              Height = 21
              DataField = 'DT_EMBARQUE'
              DataSource = datm_calc_profit.ds_master
              TabOrder = 18
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit48: TDBEdit
              Left = 355
              Top = 183
              Width = 95
              Height = 21
              DataField = 'DT_PREV_CHEGADA'
              DataSource = datm_calc_profit.ds_master
              TabOrder = 19
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit49: TDBEdit
              Left = 461
              Top = 184
              Width = 105
              Height = 21
              DataField = 'DT_CHEGADA'
              DataSource = datm_calc_profit.ds_master
              TabOrder = 20
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit27: TDBEdit
              Left = 10
              Top = 19
              Width = 41
              Height = 21
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit58: TDBEdit
              Left = 52
              Top = 19
              Width = 270
              Height = 21
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_cd_exp_direto: TDBEdit
              Left = 355
              Top = 98
              Width = 39
              Height = 21
              DataField = 'CD_EMP_EST'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 8
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_exp_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_exp_direto: TDBEdit
              Left = 397
              Top = 98
              Width = 265
              Height = 21
              Color = clMenu
              DataField = 'NM_EMP_EST'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_nm_despachante_direto: TDBEdit
              Left = 54
              Top = 139
              Width = 242
              Height = 21
              Color = clMenu
              DataField = 'NM_COMISSARIA'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 14
            end
            object dbedt_cd_despachante_direto: TDBEdit
              Left = 11
              Top = 139
              Width = 39
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 13
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_cd_despachante_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dblook_incoterm_direto: TDBLookupComboBox
              Left = 506
              Top = 138
              Width = 66
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_calc_profit.ds_processo
              ListField = 'CODIGO'
              TabOrder = 12
              OnClick = dblook_incoterm_diretoClick
            end
            object dblook_tp_frete_direto: TDBLookupComboBox
              Left = 585
              Top = 139
              Width = 74
              Height = 21
              DataField = 'Look_nm_tp_frete'
              DataSource = datm_calc_profit.ds_processo
              ListField = 'CODIGO'
              TabOrder = 16
              OnClick = dbedt_cd_exp_diretoChange
            end
            object DBEdit10: TDBEdit
              Left = 581
              Top = 185
              Width = 77
              Height = 21
              Color = clMenu
              DataField = 'DT_RECEBIMENTO'
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 21
            end
            object DBEdit50: TDBEdit
              Left = 355
              Top = 139
              Width = 128
              Height = 21
              Color = clMenu
              DataField = 'REF_CLIENTE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 15
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 41
            Align = alTop
            TabOrder = 0
            object Label67: TLabel
              Left = 13
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
            object Label68: TLabel
              Left = 125
              Top = 2
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
            object Label69: TLabel
              Left = 323
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
            object Label45: TLabel
              Left = 525
              Top = 1
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
            object DBEdit52: TDBEdit
              Left = 12
              Top = 15
              Width = 101
              Height = 21
              Color = clMenu
              DataField = 'NR_MASTER'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit54: TDBEdit
              Left = 124
              Top = 15
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit55: TDBEdit
              Left = 149
              Top = 15
              Width = 165
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit56: TDBEdit
              Left = 348
              Top = 15
              Width = 171
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit57: TDBEdit
              Left = 322
              Top = 15
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit19: TDBEdit
              Left = 525
              Top = 14
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'calc_processo'
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        object ts_direto_comp: TTabSheet
          Caption = 'Composi'#231#227'o do Frete'
          ImageIndex = 1
          object Label101: TLabel
            Left = 0
            Top = 48
            Width = 764
            Height = 13
            Align = alTop
            Caption = 'Others Charges'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgrid_other_direto: TDBGrid
            Left = 0
            Top = 61
            Width = 764
            Height = 147
            Align = alTop
            DataSource = datm_calc_profit.ds_other_charges
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
                Width = 88
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
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'in_notificao'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 79
                Visible = True
              end>
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 48
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label3: TLabel
              Left = 374
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
            object Label7: TLabel
              Left = 235
              Top = 5
              Width = 109
              Height = 13
              Caption = 'Chargeable Weight'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 510
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
            object Label39: TLabel
              Left = 10
              Top = 5
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
            object Label87: TLabel
              Left = 97
              Top = 5
              Width = 77
              Height = 13
              Caption = 'Gross Weight'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_ap_moeda_direto: TDBEdit
              Left = 11
              Top = 20
              Width = 53
              Height = 21
              Color = clMenu
              DataField = 'QTD_VOLUME'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 1
            end
            object dbedt_charg_direto: TDBEdit
              Left = 234
              Top = 20
              Width = 103
              Height = 21
              DataField = 'CHARGEABLE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 2
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tarifa_direto: TDBEdit
              Left = 372
              Top = 20
              Width = 102
              Height = 21
              DataField = 'VL_TARIFA_FRETE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 3
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tt_frete_direto: TDBEdit
              Left = 513
              Top = 20
              Width = 103
              Height = 21
              DataField = 'VL_FRETE'
              DataSource = datm_calc_profit.ds_processo
              TabOrder = 4
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_gross_direto: TDBEdit
              Left = 98
              Top = 19
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'VL_PESO_BRUTO'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_cd_exp_diretoChange
            end
          end
          object Panel17: TPanel
            Left = 0
            Top = 208
            Width = 764
            Height = 178
            Align = alClient
            TabOrder = 2
            object Label103: TLabel
              Left = 468
              Top = 8
              Width = 84
              Height = 13
              Caption = 'Total Other Ch'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label104: TLabel
              Left = 586
              Top = 8
              Width = 70
              Height = 13
              Caption = 'Total House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit73: TDBEdit
              Left = 469
              Top = 23
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit74: TDBEdit
              Left = 584
              Top = 23
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_HOUSE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object pnl_ag_comissao: TPanel
              Left = 3
              Top = 57
              Width = 209
              Height = 41
              TabOrder = 4
              Visible = False
              object Label40: TLabel
                Left = 8
                Top = 4
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
              object btn_co_ag_comissao: TSpeedButton
                Left = 180
                Top = 17
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
                OnClick = btn_co_ag_comissaoClick
              end
              object dbedt_cd_ag_comissao: TDBEdit
                Left = 8
                Top = 17
                Width = 40
                Height = 21
                DataField = 'CD_AG_COMISSAO'
                DataSource = datm_calc_profit.ds_master
                TabOrder = 1
                OnChange = dbedt_cd_agente_diretoChange
                OnExit = dbedt_cd_ag_comissaoExit
                OnKeyDown = dbedt_cd_agente_diretoKeyDown
              end
              object dbedt_nm_ag_comissao: TDBEdit
                Left = 52
                Top = 16
                Width = 125
                Height = 21
                Color = clMenu
                DataField = 'AGENTE_COMISSAO'
                DataSource = datm_calc_profit.ds_master
                ReadOnly = True
                TabOrder = 0
              end
            end
            object checkbox_in_comissao: TDBRadioGroup
              Left = 2
              Top = 5
              Width = 210
              Height = 49
              Caption = 'Origem Comiss'#227'o'
              Columns = 2
              DataField = 'IN_COMISSAO'
              DataSource = datm_calc_profit.ds_master
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Companhia'
                'Agente')
              ParentFont = False
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
              OnChange = checkbox_in_comissaoChange
            end
            object GroupBox4: TGroupBox
              Left = 226
              Top = 8
              Width = 223
              Height = 45
              Caption = 'Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object SpeedButton2: TSpeedButton
                Left = 102
                Top = 17
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
                OnClick = SpeedButton2Click
              end
              object DBEdit51: TDBEdit
                Left = 135
                Top = 16
                Width = 81
                Height = 21
                DataField = 'VL_MERCADORIA'
                DataSource = datm_calc_profit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_cd_exp_diretoChange
              end
              object dbedt_nm_moeda_mle_direto: TDBEdit
                Left = 42
                Top = 17
                Width = 57
                Height = 21
                Color = clMenu
                DataField = 'AP_MOEDA_MLE'
                DataSource = datm_calc_profit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object dbedt_cd_moeda_mle_direto: TDBEdit
                Left = 7
                Top = 17
                Width = 31
                Height = 21
                DataField = 'CD_MOEDA_MLE'
                DataSource = datm_calc_profit.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_cd_exp_diretoChange
                OnExit = dbedt_cd_moeda_mle_diretoExit
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
            Width = 764
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
            Top = 143
            Width = 764
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
          object dbgrid_despesa_direto: TDBGrid
            Left = 0
            Top = 13
            Width = 764
            Height = 130
            Align = alTop
            DataSource = datm_calc_profit.ds_despesa_house
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyUp = dbgrid_despesa_diretoKeyUp
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
                Width = 84
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
                Width = 74
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
            Top = 156
            Width = 764
            Height = 230
            Align = alClient
            DataSource = datm_calc_profit.ds_vl_brasil
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
                Width = 43
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
                Width = 69
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
                Visible = False
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
                Width = 73
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
                Width = 66
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
                FieldName = 'in_notificado'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
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
            Width = 764
            Height = 29
            Align = alTop
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
            object Label89: TLabel
              Left = 272
              Top = 6
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
              DataSource = datm_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit29: TDBEdit
              Left = 318
              Top = 3
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object GroupBox2: TGroupBox
            Left = 1
            Top = 36
            Width = 160
            Height = 142
            Caption = 'Valor Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label109: TLabel
              Left = 10
              Top = 101
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
              Left = 15
              Top = 60
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
              Left = 15
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
              Left = 12
              Top = 115
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_VENDA'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit78: TDBEdit
              Left = 11
              Top = 33
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_FRETE'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit79: TDBEdit
              Left = 12
              Top = 74
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox3: TGroupBox
            Left = 164
            Top = 35
            Width = 160
            Height = 142
            Caption = 'Valor Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label113: TLabel
              Left = 9
              Top = 99
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
              Left = 9
              Top = 56
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
              Left = 8
              Top = 20
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
              Left = 9
              Top = 113
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_profit_direto: TDBEdit
              Left = 9
              Top = 33
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_RATEIO'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_cd_exp_diretoChange
            end
            object DBEdit83: TDBEdit
              Left = 9
              Top = 70
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel14: TPanel
            Left = 328
            Top = 40
            Width = 345
            Height = 137
            BevelInner = bvLowered
            BevelOuter = bvSpace
            Color = clSilver
            TabOrder = 3
            object Label121: TLabel
              Left = 160
              Top = 8
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
            object Label126: TLabel
              Left = 10
              Top = 96
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
              Top = 8
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
            object Label84: TLabel
              Left = 10
              Top = 53
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
            object Label85: TLabel
              Left = 160
              Top = 53
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
              Left = 160
              Top = 23
              Width = 115
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_BRASIL'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit90: TDBEdit
              Left = 10
              Top = 110
              Width = 115
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_LIQUIDO'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit91: TDBEdit
              Left = 10
              Top = 23
              Width = 115
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit30: TDBEdit
              Left = 10
              Top = 66
              Width = 115
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit31: TDBEdit
              Left = 160
              Top = 66
              Width = 115
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
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
    object ts_obs: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 5
      object DBM_texto: TDBMemo
        Left = 0
        Top = 0
        Width = 772
        Height = 414
        Align = alClient
        DataField = 'TEXTO'
        DataSource = datm_calc_profit.ds_master
        TabOrder = 0
        OnChange = dbedt_cd_agente_diretoChange
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 39
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 329
      Top = 8
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
      Left = 41
      Top = 8
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
      Left = 69
      Top = 8
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
    object btn_incluir: TSpeedButton
      Left = 13
      Top = 8
      Width = 27
      Height = 25
      Hint = 'Incluir'
      Enabled = False
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
    object btn_pesq: TSpeedButton
      Left = 148
      Top = 8
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
      Left = 211
      Top = 8
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
      Left = 179
      Top = 8
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
    object btn_finaliza_proc: TSpeedButton
      Left = 243
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Finalizar Consolidada'
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
      Left = 277
      Top = 8
      Width = 25
      Height = 25
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
      Left = 301
      Top = 8
      Width = 8
      Height = 25
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
  object MainMenu1: TMainMenu
    Left = 604
    Top = 377
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
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
      Caption = '&Buscar Tarifa Master'
      Enabled = False
      OnClick = btn_tarifa_masterClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Calculo Pro&fit'
      Enabled = False
      OnClick = btn_calculoClick
    end
    object mi_final_conso: TMenuItem
      Caption = '&Finalizar Consolidada'
      Enabled = False
      OnClick = btn_finaliza_procClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object pp_calc_profit: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\rel_notificacao.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 20
    Top = 354
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pp_calc_profit
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 52
    Top = 355
  end
  object popmenu_lista_rel: TPopupMenu
    Left = 576
    Top = 377
    object mi_pre_alerta_cli: TMenuItem
      Caption = 'Pr'#233' - Alerta'
      OnClick = mi_pre_alerta_cliClick
    end
    object mi_notificacao: TMenuItem
      Caption = 'Notifica'#231#227'o'
      OnClick = btn_imprimirClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 576
    Top = 377
    object MenuItem1: TMenuItem
      Caption = 'Pr'#233' - Alerta'
      OnClick = mi_pre_alerta_cliClick
    end
    object MenuItem2: TMenuItem
      Caption = 'Notifica'#231#227'o'
      OnClick = btn_imprimirClick
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 576
    Top = 377
    object MenuItem3: TMenuItem
      Caption = 'Pr'#233' - Alerta'
      OnClick = mi_pre_alerta_cliClick
    end
    object MenuItem4: TMenuItem
      Caption = 'Notifica'#231#227'o'
      OnClick = btn_imprimirClick
    end
  end
end
