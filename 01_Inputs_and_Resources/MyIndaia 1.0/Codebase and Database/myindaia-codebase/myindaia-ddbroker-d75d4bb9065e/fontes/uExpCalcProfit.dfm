object frm_exp_calc_profit: Tfrm_exp_calc_profit
  Left = 102
  Top = 79
  Width = 720
  Height = 510
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
      EditMask = '999-9999-9999;1;_'
      MaxLength = 13
      TabOrder = 0
      Text = '   -    -    '
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
        Top = 80
        Width = 704
        Height = 314
        Align = alClient
        DataSource = datm_exp_calc_profit.ds_pes_cliente
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
            Width = 75
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
            Width = 74
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
            Width = 71
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
            Width = 128
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
            Width = 83
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
            Width = 49
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
            Width = 50
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
            Width = 64
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
            Width = 64
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
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calc_tp_master'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 32
            Visible = True
          end>
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 80
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 4
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
          Left = 361
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
        object Label8: TLabel
          Left = 360
          Top = 40
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
          Left = 307
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
          OnClick = btn_co_unid_pesqClick
        end
        object btn_co_prod_pesq: TSpeedButton
          Left = 673
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
          OnClick = btn_co_prod_pesqClick
        end
        object btn_co_destino_pesq: TSpeedButton
          Left = 673
          Top = 53
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
          Top = 40
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
          Left = 307
          Top = 53
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
          Top = 17
          Width = 32
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnExit = msk_unid_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_unid_pesq: TEdit
          Left = 44
          Top = 17
          Width = 261
          Height = 21
          Color = clMenu
          TabOrder = 4
        end
        object msk_prod_pesq: TMaskEdit
          Left = 360
          Top = 17
          Width = 31
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 1
          OnExit = msk_prod_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_prod_pesq: TEdit
          Left = 396
          Top = 17
          Width = 274
          Height = 21
          Color = clMenu
          TabOrder = 5
        end
        object msk_destino_pesq: TMaskEdit
          Left = 360
          Top = 53
          Width = 41
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 3
          OnExit = msk_destino_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object edt_nm_destino_pesq: TEdit
          Left = 403
          Top = 53
          Width = 268
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object msk_origem_pesq: TMaskEdit
          Left = 8
          Top = 53
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
          Top = 53
          Width = 255
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
        Top = 43
        Width = 704
        Height = 351
        Align = alClient
        TabOrder = 0
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
          Left = 351
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
        object Label47: TLabel
          Left = 9
          Top = 240
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
          Top = 43
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
          Left = 351
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
        object Label59: TLabel
          Left = 8
          Top = 123
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
          Left = 8
          Top = 202
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
        object Label91: TLabel
          Left = 10
          Top = 83
          Width = 91
          Height = 13
          Caption = 'Prev. Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label98: TLabel
          Left = 9
          Top = 160
          Width = 47
          Height = 13
          Caption = 'Emiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_dt_saida_conso: TDBEdit
          Left = 8
          Top = 138
          Width = 100
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_exp_calc_profit.ds_master
          TabOrder = 0
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_dt_emissao: TDBEdit
          Left = 9
          Top = 175
          Width = 100
          Height = 21
          DataField = 'DT_EMISSAO_DTA'
          DataSource = datm_exp_calc_profit.ds_master
          TabOrder = 1
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_nr_voo_conso: TDBEdit
          Left = 8
          Top = 217
          Width = 100
          Height = 21
          DataField = 'NR_VOO'
          DataSource = datm_exp_calc_profit.ds_master
          TabOrder = 2
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dblookp_tp_frete_master: TDBLookupComboBox
          Left = 8
          Top = 255
          Width = 100
          Height = 21
          DataField = 'Look_nm_frete_master'
          DataSource = datm_exp_calc_profit.ds_master
          ListField = 'CODIGO'
          TabOrder = 3
        end
        object GroupBox7: TGroupBox
          Left = 163
          Top = 84
          Width = 131
          Height = 151
          Caption = 'Master'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label197: TLabel
            Left = 11
            Top = 19
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
            Left = 11
            Top = 107
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
          object Label90: TLabel
            Left = 11
            Top = 63
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
            Left = 11
            Top = 31
            Width = 110
            Height = 21
            DataField = 'VOL_MASTER'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_vol_masterExit
          end
          object dbedt_gross_master: TDBEdit
            Left = 11
            Top = 75
            Width = 110
            Height = 21
            DataField = 'GROSS_MASTER'
            DataSource = datm_exp_calc_profit.ds_master
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
            Left = 11
            Top = 119
            Width = 110
            Height = 21
            DataField = 'CHARG_MASTER'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_chargebel_masterExit
          end
        end
        object GroupBox8: TGroupBox
          Left = 351
          Top = 83
          Width = 344
          Height = 166
          Caption = 'Escalas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label31: TLabel
            Left = 8
            Top = 12
            Width = 27
            Height = 13
            Caption = 'Para'
          end
          object Label40: TLabel
            Left = 8
            Top = 49
            Width = 85
            Height = 13
            Caption = 'Sa'#237'da Prevista'
          end
          object Label41: TLabel
            Left = 138
            Top = 123
            Width = 40
            Height = 13
            Caption = 'Nr V'#244'o'
          end
          object Label42: TLabel
            Left = 8
            Top = 86
            Width = 27
            Height = 13
            Caption = 'Para'
          end
          object Label50: TLabel
            Left = 8
            Top = 125
            Width = 85
            Height = 13
            Caption = 'Sa'#237'da Prevista'
          end
          object Label62: TLabel
            Left = 134
            Top = 48
            Width = 40
            Height = 13
            Caption = 'Nr V'#244'o'
          end
          object btn_co_escala1_conso: TSpeedButton
            Left = 315
            Top = 27
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
            OnClick = btn_co_escala1_consoClick
          end
          object btn_co_escala2_conso: TSpeedButton
            Left = 315
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
            OnClick = btn_co_escala2_consoClick
          end
          object dbedt_nm_escala1_conso: TDBEdit
            Left = 48
            Top = 27
            Width = 265
            Height = 21
            Color = clMenu
            DataField = 'NM_ESCALA1'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_escala2_conso: TDBEdit
            Left = 48
            Top = 100
            Width = 265
            Height = 21
            Color = clMenu
            DataField = 'NM_ESCALA2'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_cd_escala1_conso: TDBEdit
            Left = 8
            Top = 27
            Width = 38
            Height = 21
            DataField = 'ESCALA1'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_cd_escala1_consoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedt_dt_prev_said_escala1_conso: TDBEdit
            Left = 8
            Top = 62
            Width = 90
            Height = 21
            DataField = 'DT_PREV_ESCALA1'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = dbedt_cd_agente_diretoChange
          end
          object dbedt_nr_voo_escala1_conso: TDBEdit
            Left = 134
            Top = 62
            Width = 121
            Height = 21
            DataField = 'ESCALA1_NR_VOO'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = dbedt_cd_agente_diretoChange
          end
          object dbedt_cd_escala2_conso: TDBEdit
            Left = 8
            Top = 101
            Width = 38
            Height = 21
            DataField = 'ESCALA2'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_cd_escala2_consoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedt_prev_said_escala2_conso: TDBEdit
            Left = 8
            Top = 138
            Width = 88
            Height = 21
            DataField = 'DT_PREV_ESCALA2'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnChange = dbedt_cd_agente_diretoChange
          end
          object dbedt_nr_voo_escala2_conso: TDBEdit
            Left = 138
            Top = 138
            Width = 120
            Height = 21
            DataField = 'ESCALA2_NR_VOO'
            DataSource = datm_exp_calc_profit.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnChange = dbedt_cd_agente_diretoChange
          end
        end
        object dbedt_cd_agente_conso: TDBEdit
          Left = 8
          Top = 19
          Width = 37
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_agente_consoExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_agente_conso: TDBEdit
          Left = 48
          Top = 19
          Width = 278
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_cia_conso: TDBEdit
          Left = 351
          Top = 19
          Width = 41
          Height = 21
          Color = clMenu
          DataField = 'CD_CIA_TRANSP'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 8
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_cia_consoExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_cia_conso: TDBEdit
          Left = 394
          Top = 19
          Width = 300
          Height = 21
          Color = clMenu
          DataField = 'NM_CIA_TRANSP'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_cd_origem_conso: TDBEdit
          Left = 8
          Top = 57
          Width = 36
          Height = 21
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 10
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_origem_consoExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_origem_conso: TDBEdit
          Left = 46
          Top = 57
          Width = 281
          Height = 21
          Color = clMenu
          DataField = 'NM_PORTO'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_cd_destino_conso: TDBEdit
          Left = 351
          Top = 57
          Width = 34
          Height = 21
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 12
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_destino_consoExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nm_destino_conso: TDBEdit
          Left = 387
          Top = 57
          Width = 307
          Height = 21
          Color = clMenu
          DataField = 'NM_PORTO_1'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit64: TDBEdit
          Left = 10
          Top = 98
          Width = 100
          Height = 21
          Color = clMenu
          DataField = 'DT_PREV_SAIDA'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 14
          OnChange = dbedt_cd_agente_diretoChange
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 43
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
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
          Left = 131
          Top = 4
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
          Left = 349
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
        object Label122: TLabel
          Left = 577
          Top = 3
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
          Width = 112
          Height = 21
          Color = clMenu
          DataField = 'NR_MASTER'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit16: TDBEdit
          Left = 130
          Top = 17
          Width = 24
          Height = 21
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit20: TDBEdit
          Left = 155
          Top = 17
          Width = 187
          Height = 21
          Color = clMenu
          DataField = 'NM_UNID_NEG'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit21: TDBEdit
          Left = 374
          Top = 17
          Width = 193
          Height = 21
          Color = clMenu
          DataField = 'NM_PRODUTO'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit22: TDBEdit
          Left = 348
          Top = 17
          Width = 24
          Height = 21
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_exp_calc_profit.ds_master
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit63: TDBEdit
          Left = 577
          Top = 15
          Width = 116
          Height = 21
          Color = clMenu
          DataField = 'CD_MASTER'
          DataSource = datm_exp_calc_profit.ds_master
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
            DataSource = datm_exp_calc_profit.ds_house
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
                Width = 99
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
                Width = 106
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
                Width = 306
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_RECEBIMENTO'
                Title.Caption = 'Recebimento'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 87
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
              Left = 12
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
              Left = 139
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
              Left = 361
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
            object Label124: TLabel
              Left = 573
              Top = 3
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
              Left = 10
              Top = 14
              Width = 111
              Height = 21
              Color = clMenu
              DataField = 'NR_MASTER'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit7: TDBEdit
              Left = 137
              Top = 14
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit23: TDBEdit
              Left = 359
              Top = 14
              Width = 20
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit24: TDBEdit
              Left = 382
              Top = 14
              Width = 179
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit25: TDBEdit
              Left = 164
              Top = 14
              Width = 183
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit8: TDBEdit
              Left = 573
              Top = 15
              Width = 116
              Height = 21
              Color = clMenu
              DataField = 'CD_MASTER'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 5
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
              Left = 665
              Top = 100
              Width = 23
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
              Left = 362
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
            object Label80: TLabel
              Left = 453
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
            object Label92: TLabel
              Left = 15
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
              Left = 665
              Top = 60
              Width = 23
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
              Left = 15
              Top = 125
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
            object btn_co_dest_house: TSpeedButton
              Left = 322
              Top = 139
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
              OnClick = btn_co_dest_houseClick
            end
            object Label73: TLabel
              Left = 359
              Top = 8
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
              Top = 22
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
              Left = 15
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
              Left = 15
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
              Left = 322
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
              Visible = False
              OnClick = btn_co_moeda_conClick
            end
            object Label15: TLabel
              Left = 573
              Top = 125
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
            object Label88: TLabel
              Left = 511
              Top = 8
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
              Left = 405
              Top = 100
              Width = 258
              Height = 21
              Color = clMenu
              DataField = 'NM_COMISSARIA'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 6
            end
            object dbedt_cd_cliente_conso: TDBEdit
              Left = 15
              Top = 60
              Width = 42
              Height = 21
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_nm_cliente_conso: TDBEdit
              Left = 60
              Top = 60
              Width = 259
              Height = 21
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_nm_exp_conso: TDBEdit
              Left = 405
              Top = 60
              Width = 258
              Height = 21
              Color = clMenu
              DataField = 'NM_EMP_EST'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_cd_det_house_conso: TDBEdit
              Left = 15
              Top = 139
              Width = 42
              Height = 21
              Color = clMenu
              DataField = 'CD_ORIGEM'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 4
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_cd_det_house_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_dest_house_conso: TDBEdit
              Left = 58
              Top = 139
              Width = 262
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO_1'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 5
            end
            object msk_proc_conso: TMaskEdit
              Left = 359
              Top = 22
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
              Left = 57
              Top = 100
              Width = 263
              Height = 21
              Color = clMenu
              DataField = 'NM_MOEDA'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_nr_house_conso: TDBEdit
              Left = 15
              Top = 22
              Width = 112
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 8
              OnChange = dbedt_instr_direto1Change
            end
            object dbedt_cd_exp_conso: TDBEdit
              Left = 359
              Top = 60
              Width = 42
              Height = 21
              DataField = 'CD_EMP_EST'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 9
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_exp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_moeda_conso: TDBEdit
              Left = 15
              Top = 100
              Width = 38
              Height = 21
              Color = clMenu
              DataField = 'CD_MOEDA_FRETE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 10
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_moeda_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_desp_conso: TDBEdit
              Left = 359
              Top = 100
              Width = 42
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 11
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_desp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dblook_incoterm: TDBLookupComboBox
              Left = 361
              Top = 139
              Width = 80
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_exp_calc_profit.ds_processo
              ListField = 'CODIGO'
              TabOrder = 12
              OnClick = dblook_incotermClick
            end
            object dblook_tp_house_conso: TDBLookupComboBox
              Left = 452
              Top = 139
              Width = 99
              Height = 21
              Color = clMenu
              DataField = 'Look_nm_tp_frete'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 13
              OnClick = dbedt_cd_exp_diretoChange
            end
            object DBEdit47: TDBEdit
              Left = 573
              Top = 139
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'DT_RECEBIMENTO'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 14
            end
            object DBEdit61: TDBEdit
              Left = 511
              Top = 22
              Width = 150
              Height = 21
              Color = clMenu
              DataField = 'REF_CLIENTE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 15
            end
            object DBCheckBox1: TDBCheckBox
              Left = 182
              Top = 22
              Width = 137
              Height = 17
              Caption = 'HAWB AS AGREED'
              DataField = 'IN_AS_AGREED'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 16
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
              Left = 360
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
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit35: TDBEdit
              Left = 360
              Top = 17
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit36: TDBEdit
              Left = 385
              Top = 17
              Width = 277
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit37: TDBEdit
              Left = 44
              Top = 17
              Width = 277
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_exp_calc_profit.ds_master
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
            Top = 48
            Width = 88
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
          object dbgrid_other_charge: TDBGrid
            Left = 0
            Top = 61
            Width = 696
            Height = 198
            Align = alClient
            DataSource = datm_exp_calc_profit.ds_other_charges
            TabOrder = 0
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
                Width = 188
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
                Width = 66
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
                Width = 40
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
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LooK_in_profit'
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
                Width = 66
                Visible = True
              end>
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 48
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            object Label35: TLabel
              Left = 480
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
              Left = 362
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
              Left = 585
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
              Left = 178
              Top = 4
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
            object Label83: TLabel
              Left = 251
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
            object Label30: TLabel
              Left = 10
              Top = 5
              Width = 125
              Height = 13
              Caption = 'Descri'#231#227'o Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_qtde_conso: TDBEdit
              Left = 179
              Top = 19
              Width = 64
              Height = 21
              Color = clMenu
              DataField = 'QTD_VOLUME'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 0
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_charg_conso: TDBEdit
              Left = 361
              Top = 20
              Width = 103
              Height = 21
              DataField = 'CHARGEABLE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 1
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tarifa_conso: TDBEdit
              Left = 479
              Top = 20
              Width = 102
              Height = 21
              DataField = 'VL_TARIFA_FRETE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 2
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tt_frete_conso: TDBEdit
              Left = 588
              Top = 20
              Width = 103
              Height = 21
              DataField = 'VL_FRETE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 3
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_gross_conso: TDBEdit
              Left = 250
              Top = 19
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'VL_PESO_BRUTO'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 4
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_descr_mercadoria: TDBEdit
              Left = 9
              Top = 19
              Width = 162
              Height = 21
              DataField = 'DESCR_MERCADORIA'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 5
              OnChange = dbedt_cd_exp_diretoChange
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 259
            Width = 696
            Height = 107
            Align = alBottom
            TabOrder = 2
            object Label21: TLabel
              Left = 516
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
            object Label22: TLabel
              Left = 204
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
              Left = 359
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
            object Label116: TLabel
              Left = 283
              Top = 54
              Width = 147
              Height = 13
              Caption = 'Total Other PP Declarado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label112: TLabel
              Left = 457
              Top = 54
              Width = 147
              Height = 13
              Caption = 'Total Other CC Declarado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit2: TDBEdit
              Left = 205
              Top = 22
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 517
              Top = 22
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_HOUSE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit65: TDBEdit
              Left = 360
              Top = 22
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CC'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object msk_tt_pp_other: TMaskEdit
              Left = 285
              Top = 69
              Width = 121
              Height = 21
              Color = clMenu
              ReadOnly = True
              TabOrder = 3
            end
            object msk_tt_cc_other: TMaskEdit
              Left = 457
              Top = 69
              Width = 121
              Height = 21
              Color = clMenu
              ReadOnly = True
              TabOrder = 4
            end
            object GroupBox4: TGroupBox
              Left = 6
              Top = 5
              Width = 169
              Height = 69
              Caption = 'Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              object btn_co_cd_moeda_mle_conso: TSpeedButton
                Left = 138
                Top = 14
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
                OnClick = btn_co_cd_moeda_mle_consoClick
              end
              object dbedt_vl_merc_conso: TDBEdit
                Left = 9
                Top = 41
                Width = 124
                Height = 21
                DataField = 'VL_MLE_MNEG'
                DataSource = datm_exp_calc_profit.ds_processo
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
                Left = 8
                Top = 14
                Width = 31
                Height = 21
                DataField = 'CD_MOEDA_MLE'
                DataSource = datm_exp_calc_profit.ds_processo
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
              object dbedt_nm_moeda_mle_conso: TDBEdit
                Left = 44
                Top = 14
                Width = 90
                Height = 21
                Color = clMenu
                DataField = 'AP_MOEDA_MLE'
                DataSource = datm_exp_calc_profit.ds_processo
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
            Top = 184
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
            Height = 171
            Align = alTop
            DataSource = datm_exp_calc_profit.ds_despesa_house
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
                Width = 32
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
                Width = 52
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
                Width = 81
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
                Title.Caption = 'Cia'
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
                FieldName = 'Look_origem_dep'
                Title.Caption = 'Origem'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 67
                Visible = True
              end>
          end
          object dbgrid_vl_brasil: TDBGrid
            Left = 0
            Top = 197
            Width = 696
            Height = 169
            Align = alClient
            DataSource = datm_exp_calc_profit.ds_vl_brasil
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
                Width = 162
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
                Width = 64
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
                FieldName = 'Look_nm_repassa'
                Title.Caption = 'Cobrar do'
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
                Width = 45
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
                Title.Caption = 'Notificacao'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 71
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
            object Label17: TLabel
              Left = 233
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
              Top = 4
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit10: TDBEdit
              Left = 293
              Top = 3
              Width = 95
              Height = 21
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_exp_calc_profit.ds_master
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
          end
          object GroupBox6: TGroupBox
            Left = 142
            Top = 36
            Width = 140
            Height = 180
            Caption = 'Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label158: TLabel
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
            object Label159: TLabel
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
            object Label160: TLabel
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
            object Label97: TLabel
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
            object dbedt_tt_house_custo: TDBEdit
              Left = 10
              Top = 150
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_frete_custo: TDBEdit
              Left = 10
              Top = 28
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_RATEIO'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_other_charge_custo: TDBEdit
              Left = 10
              Top = 68
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_exp_calc_profit.ds_processo
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
              DataSource = datm_exp_calc_profit.ds_processo
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
          object GroupBox5: TGroupBox
            Left = 1
            Top = 36
            Width = 140
            Height = 181
            Caption = 'Receita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label153: TLabel
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
            object Label154: TLabel
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
            object Label155: TLabel
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
            object dbedt_tt_house_calc_prof: TDBEdit
              Left = 10
              Top = 150
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_VENDA'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_frete_venda: TDBEdit
              Left = 10
              Top = 28
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_FRETE'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_other_charge: TDBEdit
              Left = 10
              Top = 68
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_calc_profit.ds_processo
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
              DataSource = datm_exp_calc_profit.ds_processo
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
          object Panel4: TPanel
            Left = 381
            Top = 41
            Width = 314
            Height = 117
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 3
            object Label166: TLabel
              Left = 10
              Top = 4
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
              Left = 10
              Top = 41
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
              Left = 175
              Top = 41
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
            object Label4: TLabel
              Left = 175
              Top = 4
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
            object Label10: TLabel
              Left = 10
              Top = 79
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
              Left = 175
              Top = 79
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
            object dbedt_profit_total: TDBEdit
              Left = 10
              Top = 19
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_MASTER'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit18: TDBEdit
              Left = 10
              Top = 53
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_AG'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit1: TDBEdit
              Left = 175
              Top = 53
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_REC_AG'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit9: TDBEdit
              Left = 175
              Top = 19
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_REC_BR'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit15: TDBEdit
              Left = 10
              Top = 92
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_PROF_BR'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit29: TDBEdit
              Left = 175
              Top = 92
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_PROF_AG'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
          end
          object Panel5: TPanel
            Left = 383
            Top = 160
            Width = 312
            Height = 103
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 4
            object Label167: TLabel
              Left = 10
              Top = 19
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
              Left = 171
              Top = 19
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
            object Label20: TLabel
              Left = 10
              Top = 62
              Width = 67
              Height = 13
              Caption = 'Receita Cia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label85: TLabel
              Left = 171
              Top = 62
              Width = 72
              Height = 13
              Caption = 'Despesa Cia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_profit_extra: TDBEdit
              Left = 10
              Top = 32
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_profit_liquido: TDBEdit
              Left = 171
              Top = 32
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit49: TDBEdit
              Left = 10
              Top = 75
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_CIA'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit50: TDBEdit
              Left = 171
              Top = 75
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_CUSTO_CIA'
              DataSource = datm_exp_calc_profit.ds_processo
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
          object Panel10: TPanel
            Left = 285
            Top = 264
            Width = 413
            Height = 47
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 5
            object Label11: TLabel
              Left = 295
              Top = 5
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
            object Label13: TLabel
              Left = 5
              Top = 5
              Width = 86
              Height = 13
              Caption = 'Comiss'#227'o IATA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 105
              Top = 5
              Width = 28
              Height = 13
              Caption = 'Over'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label128: TLabel
              Left = 191
              Top = 5
              Width = 65
              Height = 13
              Caption = 'Fat. Compl.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit30: TDBEdit
              Left = 294
              Top = 20
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_LIQUIDO'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit31: TDBEdit
              Left = 6
              Top = 20
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_COMISS_IATA'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit46: TDBEdit
              Left = 105
              Top = 20
              Width = 80
              Height = 21
              Color = clMenu
              DataField = 'VL_OVER'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit68: TDBEdit
              Left = 192
              Top = 18
              Width = 90
              Height = 21
              Color = clMenu
              DataField = 'VL_OVER'
              DataSource = datm_exp_calc_profit.ds_processo
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
          object Panel31: TPanel
            Left = 284
            Top = 41
            Width = 96
            Height = 222
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 6
            object lb_divisao: TLabel
              Left = 8
              Top = 94
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
              Left = 8
              Top = 51
              Width = 43
              Height = 13
              Caption = 'Divis'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label168: TLabel
              Left = 8
              Top = 13
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
              Left = 6
              Top = 137
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
              Left = 8
              Top = 177
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
              Top = 108
              Width = 80
              Height = 21
              Color = clMenu
              DataField = 'VL_DIVISAO'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object rxdbcombo_tp_divisao: TRxDBComboBox
              Left = 8
              Top = 65
              Width = 80
              Height = 21
              Style = csDropDownList
              DataField = 'TP_DIVISAO'
              DataSource = datm_exp_calc_profit.ds_processo
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
              Left = 8
              Top = 27
              Width = 80
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_profit_brasil: TDBEdit
              Left = 7
              Top = 150
              Width = 80
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_BRASIL'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_profit_agente: TDBEdit
              Left = 7
              Top = 193
              Width = 80
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_AGENTE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 4
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
        Width = 704
        Height = 53
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label70: TLabel
          Left = 598
          Top = 6
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
          Left = 395
          Top = 5
          Width = 92
          Height = 13
          Caption = 'Tarifa Acordada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 495
          Top = 6
          Width = 88
          Height = 13
          Caption = 'Tarifa Impressa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 53
          Top = 9
          Width = 82
          Height = 13
          Caption = 'Charg. Weight'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 297
          Top = 5
          Width = 56
          Height = 13
          Caption = 'Tarifa Cia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 5
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
        object dbedt_tarifa_master_conso: TDBEdit
          Left = 393
          Top = 19
          Width = 98
          Height = 21
          Color = clMenu
          DataField = 'TARIFA_CUSTO'
          DataSource = datm_exp_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_tt_frete_master_conso: TDBEdit
          Left = 599
          Top = 20
          Width = 92
          Height = 21
          Color = clMenu
          DataField = 'TT_FRETE_MASTER'
          DataSource = datm_exp_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_tarifa_imp: TDBEdit
          Left = 496
          Top = 20
          Width = 98
          Height = 21
          Color = clMenu
          DataField = 'TARIFA_AUX'
          DataSource = datm_exp_calc_profit.ds_master
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
        object DBEdit5: TDBEdit
          Left = 54
          Top = 23
          Width = 88
          Height = 21
          Color = clMenu
          DataField = 'CHARG_MASTER'
          DataSource = datm_exp_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit11: TDBEdit
          Left = 298
          Top = 19
          Width = 92
          Height = 21
          Color = clMenu
          DataField = 'TARIFA_CUSTO_CIA'
          DataSource = datm_exp_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit28: TDBEdit
          Left = 6
          Top = 22
          Width = 41
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_exp_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbgrp_iata: TDBCheckBox
          Left = 155
          Top = 10
          Width = 118
          Height = 17
          Caption = 'Usar Tarifa IATA'
          DataField = 'IN_IATA'
          DataSource = datm_exp_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbch_agreement: TDBCheckBox
          Left = 156
          Top = 29
          Width = 126
          Height = 17
          Caption = 'As Per Agreement'
          DataField = 'IN_PER_AGREEMENT'
          DataSource = datm_exp_calc_profit.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbch_agreementClick
        end
      end
      object dbgrid_despesa_master: TDBGrid
        Left = 0
        Top = 53
        Width = 704
        Height = 283
        Align = alClient
        DataSource = datm_exp_calc_profit.ds_despesa_master
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
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_tp_due'
            PickList.Strings = (
              'A'
              'C')
            Title.Caption = 'Due'
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
            FieldName = 'Look_nm_frete'
            Title.Caption = 'PP/CC'
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
            FieldName = 'Look_resp_pagto'
            Title.Caption = 'Resp. Pagto'
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
            FieldName = 'Look_base_calc'
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
            FieldName = 'CD_MOEDA'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 31
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
            Width = 80
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
            Width = 64
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
            Width = 71
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
            FieldName = 'Look_moeda_venda'
            Title.Caption = 'Moeda Venda'
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
      object progress_houses: TProgressBar
        Left = 0
        Top = 378
        Width = 704
        Height = 16
        Align = alBottom
        TabOrder = 2
        Visible = False
      end
      object Panel17: TPanel
        Left = 0
        Top = 336
        Width = 704
        Height = 42
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 3
        object lb_tarifa_net_net: TLabel
          Left = 3
          Top = 4
          Width = 84
          Height = 13
          Caption = 'Tarifa Net/Net'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_tarifa_net_net: TDBEdit
          Left = 6
          Top = 16
          Width = 87
          Height = 21
          Color = clMenu
          DataField = 'VL_TARIFA_NET_NET'
          DataSource = datm_exp_calc_profit.ds_master
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
            Top = 41
            Width = 696
            Height = 325
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object Label48: TLabel
              Left = 350
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
              Left = 8
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
            object Label53: TLabel
              Left = 350
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
            object Label61: TLabel
              Left = 8
              Top = 250
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
            object Label75: TLabel
              Left = 8
              Top = 5
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
            object Label12: TLabel
              Left = 350
              Top = 85
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
            object btn_exp_direto: TSpeedButton
              Left = 665
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
              OnClick = btn_exp_diretoClick
            end
            object btn_co_desp_direto: TSpeedButton
              Left = 317
              Top = 224
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
            object Label32: TLabel
              Left = 8
              Top = 210
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
            object Label100: TLabel
              Left = 8
              Top = 172
              Width = 91
              Height = 13
              Caption = 'Prev. Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label55: TLabel
              Left = 114
              Top = 172
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
            object Label33: TLabel
              Left = 163
              Top = 130
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
              Left = 233
              Top = 130
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
            object Label16: TLabel
              Left = 197
              Top = 250
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
            object Label89: TLabel
              Left = 8
              Top = 130
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
            object Label99: TLabel
              Left = 222
              Top = 172
              Width = 51
              Height = 13
              Caption = 'Emiss'#227'o '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit32: TDBEdit
              Left = 350
              Top = 20
              Width = 35
              Height = 21
              Color = clMenu
              DataField = 'CD_CIA_TRANSP'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 3
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_cia_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit33: TDBEdit
              Left = 386
              Top = 20
              Width = 273
              Height = 21
              Color = clMenu
              DataField = 'NM_CIA_TRANSP'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit38: TDBEdit
              Left = 48
              Top = 100
              Width = 263
              Height = 21
              Color = clMenu
              DataField = 'NM_MOEDA'
              DataSource = datm_exp_calc_profit.ds_master
              TabOrder = 5
            end
            object DBEdit39: TDBEdit
              Left = 8
              Top = 100
              Width = 36
              Height = 21
              Color = clMenu
              DataField = 'CD_MOEDA'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 6
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit40: TDBEdit
              Left = 8
              Top = 60
              Width = 37
              Height = 21
              Color = clMenu
              DataField = 'CD_ORIGEM'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 7
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_origem_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit41: TDBEdit
              Left = 48
              Top = 60
              Width = 263
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 8
            end
            object DBEdit42: TDBEdit
              Left = 350
              Top = 60
              Width = 35
              Height = 21
              Color = clMenu
              DataField = 'CD_DESTINO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 9
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_destino_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit43: TDBEdit
              Left = 387
              Top = 60
              Width = 274
              Height = 21
              Color = clMenu
              DataField = 'NM_PORTO_1'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 10
            end
            object dbedt_nr_voo_direto: TDBEdit
              Left = 8
              Top = 265
              Width = 146
              Height = 21
              DataField = 'NR_VOO'
              DataSource = datm_exp_calc_profit.ds_master
              TabOrder = 2
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit27: TDBEdit
              Left = 8
              Top = 20
              Width = 41
              Height = 21
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 11
            end
            object DBEdit58: TDBEdit
              Left = 51
              Top = 20
              Width = 260
              Height = 21
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 12
            end
            object dbedt_cd_exp_direto: TDBEdit
              Left = 350
              Top = 100
              Width = 42
              Height = 21
              DataField = 'CD_EMP_EST'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 1
              OnChange = dbedt_cd_exp_diretoChange
              OnExit = dbedt_cd_exp_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_exp_direto: TDBEdit
              Left = 394
              Top = 100
              Width = 269
              Height = 21
              Color = clMenu
              DataField = 'NM_EMP_EST'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 13
            end
            object dbedt_nm_despachante_direto: TDBEdit
              Left = 50
              Top = 224
              Width = 262
              Height = 21
              Color = clMenu
              DataField = 'NM_COMISSARIA'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 14
            end
            object dbedt_cd_despachante_direto: TDBEdit
              Left = 8
              Top = 224
              Width = 39
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 0
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_cd_despachante_diretoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object DBEdit70: TDBEdit
              Left = 8
              Top = 185
              Width = 101
              Height = 21
              Color = clMenu
              DataField = 'DT_PREV_SAIDA'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 15
              OnChange = dbedt_cd_agente_diretoChange
            end
            object group_escala_direto: TGroupBox
              Left = 349
              Top = 129
              Width = 344
              Height = 166
              Caption = 'Escalas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 16
              object Label108: TLabel
                Left = 8
                Top = 12
                Width = 27
                Height = 13
                Caption = 'Para'
              end
              object Label117: TLabel
                Left = 8
                Top = 49
                Width = 85
                Height = 13
                Caption = 'Sa'#237'da Prevista'
              end
              object Label118: TLabel
                Left = 138
                Top = 123
                Width = 40
                Height = 13
                Caption = 'Nr V'#244'o'
              end
              object Label119: TLabel
                Left = 8
                Top = 86
                Width = 27
                Height = 13
                Caption = 'Para'
              end
              object Label120: TLabel
                Left = 8
                Top = 125
                Width = 85
                Height = 13
                Caption = 'Sa'#237'da Prevista'
              end
              object Label121: TLabel
                Left = 134
                Top = 48
                Width = 40
                Height = 13
                Caption = 'Nr V'#244'o'
              end
              object SpeedButton1: TSpeedButton
                Left = 315
                Top = 27
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
                OnClick = btn_co_escala1_consoClick
              end
              object SpeedButton2: TSpeedButton
                Left = 315
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
                OnClick = btn_co_escala2_consoClick
              end
              object dbedt_nm_escala1_direto: TDBEdit
                Left = 48
                Top = 27
                Width = 265
                Height = 21
                Color = clMenu
                DataField = 'NM_ESCALA1'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbedt_nm_escala2_direto: TDBEdit
                Left = 48
                Top = 100
                Width = 265
                Height = 21
                Color = clMenu
                DataField = 'NM_ESCALA2'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbedt_cd_escala1_direto: TDBEdit
                Left = 8
                Top = 27
                Width = 38
                Height = 21
                DataField = 'ESCALA1'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnChange = dbedt_cd_agente_diretoChange
                OnExit = dbedt_cd_escala1_diretoExit
                OnKeyDown = dbedt_cd_agente_diretoKeyDown
              end
              object DBEdit71: TDBEdit
                Left = 8
                Top = 62
                Width = 90
                Height = 21
                DataField = 'DT_PREV_ESCALA1'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnChange = dbedt_cd_agente_diretoChange
              end
              object DBEdit77: TDBEdit
                Left = 134
                Top = 62
                Width = 121
                Height = 21
                DataField = 'ESCALA1_NR_VOO'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnChange = dbedt_cd_agente_diretoChange
              end
              object dbedt_cd_escala2_direto: TDBEdit
                Left = 8
                Top = 101
                Width = 38
                Height = 21
                DataField = 'ESCALA2'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                OnChange = dbedt_cd_agente_diretoChange
                OnExit = dbedt_cd_escala2_diretoExit
                OnKeyDown = dbedt_cd_agente_diretoKeyDown
              end
              object DBEdit82: TDBEdit
                Left = 8
                Top = 138
                Width = 88
                Height = 21
                DataField = 'DT_PREV_ESCALA2'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                OnChange = dbedt_cd_agente_diretoChange
              end
              object DBEdit84: TDBEdit
                Left = 138
                Top = 138
                Width = 120
                Height = 21
                DataField = 'ESCALA2_NR_VOO'
                DataSource = datm_exp_calc_profit.ds_master
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                OnChange = dbedt_cd_agente_diretoChange
              end
            end
            object dbedt_dt_embarque_direto: TDBEdit
              Left = 114
              Top = 185
              Width = 88
              Height = 21
              DataField = 'DT_EMBARQUE'
              DataSource = datm_exp_calc_profit.ds_master
              TabOrder = 17
              OnChange = dbedt_cd_agente_diretoChange
            end
            object dblook_incoterm_direto: TDBLookupComboBox
              Left = 162
              Top = 144
              Width = 63
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_exp_calc_profit.ds_processo
              ListField = 'CODIGO'
              TabOrder = 18
              OnClick = dblook_incoterm_diretoClick
            end
            object dblook_tp_frete_direto: TDBLookupComboBox
              Left = 232
              Top = 144
              Width = 80
              Height = 21
              Color = clMenu
              DataField = 'Look_nm_tp_frete'
              DataSource = datm_exp_calc_profit.ds_processo
              ListField = 'CODIGO'
              ReadOnly = True
              TabOrder = 19
              OnClick = dbedt_cd_exp_diretoChange
            end
            object DBEdit48: TDBEdit
              Left = 197
              Top = 265
              Width = 92
              Height = 21
              Color = clMenu
              DataField = 'DT_RECEBIMENTO'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 20
            end
            object DBEdit62: TDBEdit
              Left = 8
              Top = 144
              Width = 145
              Height = 21
              Color = clMenu
              DataField = 'REF_CLIENTE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 21
            end
            object dbedt_dt_emissao_direto: TDBEdit
              Left = 222
              Top = 185
              Width = 91
              Height = 21
              DataField = 'DT_EMISSAO_DTA'
              DataSource = datm_exp_calc_profit.ds_master
              TabOrder = 22
              OnChange = dbedt_cd_agente_diretoChange
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 41
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
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
              Left = 141
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
              Left = 347
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
              Left = 573
              Top = 2
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
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit54: TDBEdit
              Left = 140
              Top = 15
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit55: TDBEdit
              Left = 165
              Top = 15
              Width = 165
              Height = 21
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit56: TDBEdit
              Left = 372
              Top = 15
              Width = 171
              Height = 21
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit57: TDBEdit
              Left = 346
              Top = 15
              Width = 24
              Height = 21
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_exp_calc_profit.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit19: TDBEdit
              Left = 573
              Top = 14
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'calc_processo'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 5
            end
          end
        end
        object ts_direto_comp: TTabSheet
          Caption = 'Composi'#231#227'o do Frete'
          ImageIndex = 1
          object Label101: TLabel
            Left = 0
            Top = 48
            Width = 88
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
            Width = 696
            Height = 246
            Align = alClient
            DataSource = datm_exp_calc_profit.ds_other_charges
            TabOrder = 0
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
                Width = 76
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
                Width = 59
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
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_nm_frete'
                Title.Caption = 'CC/PP'
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
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 48
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            object Label3: TLabel
              Left = 474
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
              Left = 353
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
              Left = 583
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
              Left = 176
              Top = 4
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
            object Label84: TLabel
              Left = 238
              Top = 6
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
            object Label102: TLabel
              Left = 10
              Top = 5
              Width = 125
              Height = 13
              Caption = 'Descri'#231#227'o Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_ap_moeda_direto: TDBEdit
              Left = 177
              Top = 19
              Width = 49
              Height = 21
              Color = clMenu
              DataField = 'QTD_VOLUME'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 0
            end
            object dbedt_charg_direto: TDBEdit
              Left = 352
              Top = 20
              Width = 103
              Height = 21
              DataField = 'CHARGEABLE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 1
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tarifa_direto: TDBEdit
              Left = 473
              Top = 20
              Width = 102
              Height = 21
              DataField = 'VL_TARIFA_FRETE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 2
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tt_frete_direto: TDBEdit
              Left = 586
              Top = 20
              Width = 103
              Height = 21
              DataField = 'VL_FRETE'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 3
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_gross_direto: TDBEdit
              Left = 237
              Top = 20
              Width = 103
              Height = 21
              Color = clMenu
              DataField = 'VL_PESO_BRUTO'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 4
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_descr_mercadoria2: TDBEdit
              Left = 9
              Top = 19
              Width = 162
              Height = 21
              DataField = 'DESCR_MERCADORIA'
              DataSource = datm_exp_calc_profit.ds_processo
              TabOrder = 5
              OnChange = dbedt_cd_exp_diretoChange
            end
          end
          object Panel18: TPanel
            Left = 0
            Top = 307
            Width = 696
            Height = 59
            Align = alBottom
            TabOrder = 2
            object Label103: TLabel
              Left = 351
              Top = 8
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
            object DBEdit73: TDBEdit
              Left = 352
              Top = 23
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit74: TDBEdit
              Left = 512
              Top = 23
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'VL_HOUSE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object GroupBox9: TGroupBox
              Left = 16
              Top = 6
              Width = 256
              Height = 43
              Caption = 'Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object SpeedButton4: TSpeedButton
                Left = 115
                Top = 14
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
                OnClick = btn_co_cd_moeda_mle_consoClick
              end
              object dbedt_vl_merc_direto: TDBEdit
                Left = 145
                Top = 14
                Width = 104
                Height = 21
                DataField = 'VL_MLE_MNEG'
                DataSource = datm_exp_calc_profit.ds_processo
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
                Left = 8
                Top = 14
                Width = 31
                Height = 21
                DataField = 'CD_MOEDA_MLE'
                DataSource = datm_exp_calc_profit.ds_processo
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
              object dbedt_nm_moeda_mle_direto: TDBEdit
                Left = 41
                Top = 14
                Width = 70
                Height = 21
                Color = clMenu
                DataField = 'AP_MOEDA_MLE'
                DataSource = datm_exp_calc_profit.ds_processo
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
          object Label106: TLabel
            Left = 0
            Top = 188
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
          object dbgrid_despesa_direto: TDBGrid
            Left = 0
            Top = 13
            Width = 696
            Height = 175
            Align = alTop
            DataSource = datm_exp_calc_profit.ds_despesa_house
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
                Width = 64
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
              end>
          end
          object dbgrid_vl_direto: TDBGrid
            Left = 0
            Top = 201
            Width = 696
            Height = 165
            Align = alClient
            DataSource = datm_exp_calc_profit.ds_vl_brasil
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
                Width = 32
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
                Width = 91
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
                Width = 54
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
            object Label81: TLabel
              Left = 233
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
            object DBEdit75: TDBEdit
              Left = 75
              Top = 4
              Width = 121
              Height = 21
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_exp_calc_profit.ds_house
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit26: TDBEdit
              Left = 293
              Top = 3
              Width = 95
              Height = 21
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_exp_calc_profit.ds_master
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
          end
          object GroupBox2: TGroupBox
            Left = 1
            Top = 29
            Width = 115
            Height = 141
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
              Top = 98
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
              Top = 112
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_VENDA'
              DataSource = datm_exp_calc_profit.ds_processo
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
              DataSource = datm_exp_calc_profit.ds_processo
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
              Top = 74
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_exp_calc_profit.ds_processo
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
            Left = 119
            Top = 29
            Width = 115
            Height = 141
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
              Left = 10
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
              Left = 10
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
              Left = 10
              Top = 113
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_exp_calc_profit.ds_processo
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
              Top = 33
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_RATEIO'
              DataSource = datm_exp_calc_profit.ds_processo
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
              Top = 70
              Width = 93
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_exp_calc_profit.ds_processo
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
            Left = 236
            Top = 32
            Width = 461
            Height = 164
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 3
            object Label126: TLabel
              Left = 10
              Top = 81
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
              Top = 5
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
            object Label65: TLabel
              Left = 272
              Top = 5
              Width = 61
              Height = 13
              Caption = 'Valor Over'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label66: TLabel
              Left = 140
              Top = 5
              Width = 86
              Height = 13
              Caption = 'Comiss'#227'o IATA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label63: TLabel
              Left = 10
              Top = 42
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
            object Label82: TLabel
              Left = 140
              Top = 42
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
            object Label86: TLabel
              Left = 10
              Top = 120
              Width = 67
              Height = 13
              Caption = 'Receita Cia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label87: TLabel
              Left = 140
              Top = 120
              Width = 72
              Height = 13
              Caption = 'Despesa Cia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit90: TDBEdit
              Left = 10
              Top = 94
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_LIQUIDO'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit91: TDBEdit
              Left = 10
              Top = 18
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit12: TDBEdit
              Left = 272
              Top = 18
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_OVER'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit14: TDBEdit
              Left = 140
              Top = 18
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_COMISS_IATA'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit51: TDBEdit
              Left = 10
              Top = 56
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_exp_calc_profit.ds_processo
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit53: TDBEdit
              Left = 140
              Top = 56
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit59: TDBEdit
              Left = 10
              Top = 135
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_VENDA_CIA'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit60: TDBEdit
              Left = 140
              Top = 135
              Width = 110
              Height = 21
              Color = clMenu
              DataField = 'VL_CUSTO_CIA'
              DataSource = datm_exp_calc_profit.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
          end
        end
      end
    end
    object ts_obs: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 5
      object DBM_text: TDBMemo
        Left = 0
        Top = 0
        Width = 704
        Height = 394
        Align = alClient
        DataField = 'TEXTO'
        DataSource = datm_exp_calc_profit.ds_master
        TabOrder = 0
        OnChange = dbedt_cd_agente_diretoChange
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
      Left = 367
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
      Left = 7
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
      Left = 35
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
    object btn_pesq: TSpeedButton
      Left = 68
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
      Left = 118
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
      Left = 93
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
    object btn_transf_proc: TSpeedButton
      Left = 143
      Top = 8
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
      Top = 8
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
      Left = 271
      Top = 8
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
      Left = 330
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
      Left = 354
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
    object btn_busca_iata: TSpeedButton
      Left = 299
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Tarifa IATA'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333C3333333333333337F3333333333333C0C3333
        333333333777F33333333333C0F0C3333333333377377F333333333C0FFF0C33
        3333333777F377F3333333CCC0FFF0C333333373377F377F33333CCCCC0FFF0C
        333337333377F377F3334CCCCCC0FFF0C3337F3333377F377F33C4CCCCCC0FFF
        0C3377F333F377F377F33C4CC0CCC0FFF0C3377F3733F77F377333C4CCC0CC0F
        0C333377F337F3777733333C4C00CCC0333333377F773337F3333333C4CCCCCC
        3333333377F333F7333333333C4CCCC333333333377F37733333333333C4C333
        3333333333777333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_busca_iataClick
    end
    object Label1: TLabel
      Left = 443
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
      Left = 562
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
      Left = 194
      Top = 8
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
      Left = 219
      Top = 8
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
      Left = 444
      Top = 16
      Width = 114
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 563
      Top = 16
      Width = 138
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object MainMenu1: TMainMenu
    Left = 668
    Top = 1
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
      Caption = 'E&ncerar Consolidada'
      Enabled = False
      OnClick = btn_finaliza_procClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object popmenu_lista_rel: TPopupMenu
    Left = 640
    Top = 1
    object mi_conhec_master: TMenuItem
      Caption = 'Emiss'#227'o MAWB'
      OnClick = mi_conhec_masterClick
    end
    object mi_conhec_house: TMenuItem
      Caption = 'Emiss'#227'o HAWB'
      OnClick = mi_conhec_houseClick
    end
    object mi_conhec_direto: TMenuItem
      Caption = 'Emiss'#227'o AWB'
      OnClick = mi_conhec_houseClick
    end
    object mi_cargo_manifest: TMenuItem
      Caption = 'Cargo - Manifest'
      Visible = False
      OnClick = mi_cargo_manifestClick
    end
    object mi_pre_alerta_cli: TMenuItem
      Caption = 'Pr'#233' - Alerta'
      OnClick = mi_pre_alerta_cliClick
    end
    object mi_notificacao: TMenuItem
      Caption = 'Notifica'#231#227'o'
      OnClick = mi_notificacaoClick
    end
  end
end
