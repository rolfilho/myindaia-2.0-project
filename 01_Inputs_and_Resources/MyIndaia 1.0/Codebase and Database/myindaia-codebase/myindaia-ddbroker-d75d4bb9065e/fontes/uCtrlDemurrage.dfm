object frm_ctrl_demurrage: Tfrm_ctrl_demurrage
  Left = 425
  Top = 200
  Width = 750
  Height = 550
  Caption = 'Controle de Demurrage'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 45
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      45)
    object shp1: TShape
      Left = 480
      Top = 4
      Width = 258
      Height = 39
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 436
      Top = 3
      Width = 40
      Height = 40
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
      Left = 4
      Top = 3
      Width = 40
      Height = 40
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
      Left = 44
      Top = 3
      Width = 40
      Height = 40
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
    object btn_consulta: TSpeedButton
      Left = 396
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Pesquisar'
      Anchors = [akTop, akRight]
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
      OnClick = btn_consultaClick
    end
    object Label2: TLabel
      Left = 610
      Top = 6
      Width = 54
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nr House'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 486
      Top = 6
      Width = 72
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nr Contanier'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbnvg: TDBNavigator
      Left = 286
      Top = 10
      Width = 100
      Height = 25
      DataSource = datm_ctrl_demurrage.ds_demurrage
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object msk_nr_house: TMaskEdit
      Left = 610
      Top = 19
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object msk_nr_cntr: TMaskEdit
      Left = 486
      Top = 19
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object pgctrl_demurrage: TPageControl
    Left = 0
    Top = 45
    Width = 742
    Height = 459
    ActivePage = ts_pesquisa
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_demurrageChange
    OnChanging = pgctrl_demurrageChanging
    object ts_pesquisa: TTabSheet
      Caption = 'Pesquisa'
      object dbgrid_lista: TDBGrid
        Left = 0
        Top = 55
        Width = 734
        Height = 376
        Align = alClient
        DataSource = datm_ctrl_demurrage.ds_demurrage
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrid_listaDrawColumnCell
        Columns = <
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
            Width = 105
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_CNTR'
            Title.Caption = 'Nr Contanier'
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
            FieldName = 'DT_DEMURRAGE'
            Title.Caption = 'Dt Chegada'
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
            FieldName = 'CD_CLIENTE'
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
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Cliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 277
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
            Visible = True
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 55
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        DesignSize = (
          734
          55)
        object btn_co_unid_neg: TSpeedButton
          Left = 205
          Top = 21
          Width = 25
          Height = 21
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
          OnClick = btn_co_unid_negClick
        end
        object Label13: TLabel
          Left = 8
          Top = 7
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
        object Label4: TLabel
          Left = 248
          Top = 7
          Width = 118
          Height = 13
          Caption = 'Per'#237'odo de Chegada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 328
          Top = 28
          Width = 8
          Height = 13
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_nm_unid: TEdit
          Left = 36
          Top = 21
          Width = 165
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
          Text = 'edt_nm_unid'
        end
        object msk_cd_unid: TMaskEdit
          Left = 9
          Top = 21
          Width = 27
          Height = 21
          TabOrder = 1
          OnChange = btn_co_unid_negClick
          OnExit = msk_cd_unidExit
          OnKeyDown = msk_cd_unidKeyDown
        end
        object msk_dt_inicial: TMaskEdit
          Left = 248
          Top = 24
          Width = 72
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
        end
        object msk_dt_final: TMaskEdit
          Left = 345
          Top = 24
          Width = 72
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
        end
        object rdgrp_devolvido: TRadioGroup
          Left = 512
          Top = 8
          Width = 211
          Height = 40
          Anchors = [akTop, akRight]
          Caption = 'Devolvidos'
          Columns = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'N'#227'o'
            'Sim'
            'Todos')
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 431
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object Label3: TLabel
          Left = 8
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
        object Label5: TLabel
          Left = 8
          Top = 43
          Width = 40
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 160
          Top = 82
          Width = 82
          Height = 13
          Caption = 'Data Chegada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 277
          Top = 82
          Width = 55
          Height = 13
          Caption = 'Dias Free'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 554
          Top = 82
          Width = 93
          Height = 13
          Caption = 'Data Devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 374
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
        object Label20: TLabel
          Left = 374
          Top = 43
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
        object Label21: TLabel
          Left = 554
          Top = 43
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
        object Label22: TLabel
          Left = 8
          Top = 82
          Width = 91
          Height = 13
          Caption = 'N'#186' do Contanier'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 374
          Top = 82
          Width = 123
          Height = 13
          Caption = 'Data Prev Devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_armador: TDBEdit
          Left = 374
          Top = 19
          Width = 31
          Height = 21
          Color = clMenu
          DataField = 'CD_ARMADOR'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_cd_armadorChange
        end
        object dbedt_nm_armador: TDBEdit
          Left = 404
          Top = 19
          Width = 320
          Height = 21
          Color = clMenu
          DataField = 'DESCRICAO'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 57
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 46
          Top = 57
          Width = 312
          Height = 21
          Color = clMenu
          DataField = 'NM_EMPRESA'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit11: TDBEdit
          Left = 278
          Top = 96
          Width = 79
          Height = 21
          Color = clMenu
          DataField = 'NR_FREE_TIME'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_armadorChange
        end
        object dbedt_dt_cheg: TDBEdit
          Left = 158
          Top = 96
          Width = 115
          Height = 21
          Color = clMenu
          DataField = 'DT_DEMURRAGE'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_cd_armadorChange
        end
        object DBEdit4: TDBEdit
          Left = 374
          Top = 57
          Width = 170
          Height = 21
          Color = clMenu
          DataField = 'NR_MASTER'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit7: TDBEdit
          Left = 554
          Top = 57
          Width = 170
          Height = 21
          Color = clMenu
          DataField = 'NR_HOUSE'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit10: TDBEdit
          Left = 8
          Top = 96
          Width = 145
          Height = 21
          Color = clMenu
          DataField = 'NR_CNTR'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 8
          OnChange = dbedt_cd_armadorChange
        end
        object DBEdit1: TDBEdit
          Left = 374
          Top = 96
          Width = 170
          Height = 21
          Color = clMenu
          DataField = 'DT_DEVOLUCAO_CNTR'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedt_cd_armadorChange
        end
        object edt_cd_unid: TEdit
          Left = 8
          Top = 20
          Width = 31
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 10
          Text = 'edt_cd_unid'
        end
        object edt_unid: TEdit
          Left = 39
          Top = 21
          Width = 320
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 11
          Text = 'edt_unid'
        end
        object dbedt_dt_devolucao: TDBEdit
          Left = 554
          Top = 96
          Width = 170
          Height = 21
          DataField = 'DT_DEV_EFETIVA'
          DataSource = datm_ctrl_demurrage.ds_demurrage
          TabOrder = 12
          OnChange = dbedt_cd_armadorChange
          OnExit = dbedt_dt_devolucaoExit
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 120
          Width = 351
          Height = 62
          Caption = 'Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          object Label14: TLabel
            Left = 8
            Top = 20
            Width = 55
            Height = 13
            Caption = 'Valor/Dia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 73
            Top = 20
            Width = 47
            Height = 13
            Caption = '% Desc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 148
            Top = 20
            Width = 84
            Height = 13
            Caption = 'Valor Corrigido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 270
            Top = 20
            Width = 34
            Height = 13
            Caption = 'Total '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit2: TDBEdit
            Left = 8
            Top = 34
            Width = 53
            Height = 21
            Color = clMenu
            DataField = 'VL_DEMURRAGE'
            DataSource = datm_ctrl_demurrage.ds_demurrage
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = dbedt_cd_armadorChange
          end
          object dbedt_desc: TDBEdit
            Left = 72
            Top = 34
            Width = 70
            Height = 21
            DataField = 'VL_DESC_DEMURRAGE'
            DataSource = datm_ctrl_demurrage.ds_demurrage
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = dbedt_cd_armadorChange
            OnExit = dbedt_descExit
          end
          object dbedt_vl_corrigido: TDBEdit
            Left = 148
            Top = 34
            Width = 117
            Height = 21
            DataField = 'VL_CORRIGIDO'
            DataSource = datm_ctrl_demurrage.ds_demurrage
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_cd_armadorChange
            OnExit = dbedt_vl_corrigidoExit
          end
          object DBEdit9: TDBEdit
            Left = 270
            Top = 34
            Width = 75
            Height = 21
            Color = clMenu
            DataField = 'VL_CUSTO_TOTAL'
            DataSource = datm_ctrl_demurrage.ds_demurrage
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            OnChange = dbedt_cd_armadorChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 374
          Top = 120
          Width = 351
          Height = 62
          Caption = 'Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          object Label18: TLabel
            Left = 8
            Top = 20
            Width = 55
            Height = 13
            Caption = 'Valor/Dia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 185
            Top = 20
            Width = 34
            Height = 13
            Caption = 'Total '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_vl_venda: TDBEdit
            Left = 8
            Top = 34
            Width = 159
            Height = 21
            DataField = 'VL_VENDA_TOTAL'
            DataSource = datm_ctrl_demurrage.ds_demurrage
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_cd_armadorChange
            OnExit = dbedt_vl_vendaExit
          end
          object DBEdit15: TDBEdit
            Left = 184
            Top = 34
            Width = 153
            Height = 21
            Color = clMenu
            DataField = 'VL_VENDA_TOTAL'
            DataSource = datm_ctrl_demurrage.ds_demurrage
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnChange = dbedt_cd_armadorChange
          end
        end
        object GroupBox3: TGroupBox
          Left = 374
          Top = 184
          Width = 352
          Height = 62
          Caption = 'Valor Demurrage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          object Label23: TLabel
            Left = 8
            Top = 20
            Width = 34
            Height = 13
            Caption = 'Total '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit8: TDBEdit
            Left = 8
            Top = 34
            Width = 159
            Height = 21
            Color = clMenu
            DataField = 'TT_DEMURRAGE'
            DataSource = datm_ctrl_demurrage.ds_demurrage
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = dbedt_cd_armadorChange
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 568
    Top = 404
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object TMenuItem
    end
    object mi_pesquisa: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_consultaClick
    end
    object TMenuItem
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
