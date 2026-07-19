object frm_emissao_remessa: Tfrm_emissao_remessa
  Left = 314
  Top = 221
  Width = 750
  Height = 550
  Caption = 'Emiss'#227'o de Remessa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_emissao_remessa: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 453
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_emissao_remessaChange
    OnChanging = pgctrl_emissao_remessaChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        DataSource = datm_emissao_remessa.ds_remessa
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
            FieldName = 'NR_REMESSA'
            Title.Caption = 'Remessa'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Agente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 203
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
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOTAL'
            Title.Caption = 'Valor Total'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_MOEDA'
            Title.Caption = 'Valor Cambial'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOTAL_REAL'
            Title.Caption = 'Valor em Reais'
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
            FieldName = 'calc_in_emissao'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 91
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 130
        Width = 734
        Height = 295
        Align = alClient
        DataSource = datm_emissao_remessa.ds_processo
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_PROCESSO'
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 85
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
            Width = 352
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ACCOUNT'
            Title.Caption = 'Valor Account'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ORIGEM'
            Title.Caption = 'Origem'
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
            FieldName = 'NM_DESTINO'
            Title.Caption = 'Destino'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 130
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label3: TLabel
          Left = 211
          Top = 42
          Width = 86
          Height = 13
          Caption = 'Valor Corretora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 111
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
        object Label5: TLabel
          Left = 8
          Top = 42
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
        object Label6: TLabel
          Left = 111
          Top = 42
          Width = 84
          Height = 13
          Caption = 'Valor Banc'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 4
          Width = 52
          Height = 13
          Caption = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_vl_moeda: TLabel
          Left = 428
          Top = 42
          Width = 89
          Height = 13
          Caption = 'Taxa da Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 313
          Top = 42
          Width = 63
          Height = 13
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 568
          Top = 42
          Width = 86
          Height = 13
          Caption = 'Valor em Reais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_dt_remessa: TLabel
          Left = 211
          Top = 83
          Width = 101
          Height = 13
          Caption = 'Data da Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 81
          Width = 112
          Height = 13
          Caption = 'Contrato de Cambio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 428
          Top = 4
          Width = 37
          Height = 13
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 428
          Top = 84
          Width = 102
          Height = 13
          Caption = 'Via de Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 18
          Width = 93
          Height = 21
          Color = clMenu
          DataField = 'NR_REMESSA'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 150
          Top = 18
          Width = 267
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 56
          Width = 93
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 111
          Top = 56
          Width = 97
          Height = 21
          Color = clMenu
          DataField = 'VL_BANCO'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 211
          Top = 56
          Width = 98
          Height = 21
          Color = clMenu
          DataField = 'VL_CORRETORA'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 313
          Top = 56
          Width = 103
          Height = 21
          Color = clMenu
          DataField = 'VL_TOTAL'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_vl_moeda: TDBEdit
          Left = 428
          Top = 56
          Width = 138
          Height = 21
          Color = clWhite
          DataField = 'VL_MOEDA'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 7
          OnChange = dbedt_vl_moedaChange
        end
        object DBEdit9: TDBEdit
          Left = 568
          Top = 56
          Width = 156
          Height = 21
          Color = clMenu
          DataField = 'VL_TOTAL_REAL'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_dt_emissao: TDBEdit
          Left = 211
          Top = 97
          Width = 207
          Height = 21
          Color = clMenu
          DataField = 'DT_ENVIO_REMESSA'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nr_contrato: TDBEdit
          Left = 8
          Top = 95
          Width = 198
          Height = 21
          Color = clWhite
          DataField = 'NR_CONTRATO_CAMBIO'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 10
          OnChange = dbedt_vl_moedaChange
        end
        object DBEdit8: TDBEdit
          Left = 455
          Top = 18
          Width = 271
          Height = 21
          Color = clMenu
          DataField = 'NM_BANCO'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit10: TDBEdit
          Left = 428
          Top = 18
          Width = 27
          Height = 21
          Color = clMenu
          DataField = 'CD_BANCO'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit11: TDBEdit
          Left = 465
          Top = 97
          Width = 258
          Height = 21
          Color = clMenu
          DataField = 'NM_VIA_TRANSP'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit12: TDBEdit
          Left = 428
          Top = 97
          Width = 39
          Height = 21
          Color = clMenu
          DataField = 'CD_VIA_TRANSP'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit2: TDBEdit
          Left = 111
          Top = 18
          Width = 39
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_emissao_remessa.ds_remessa
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      742
      51)
    object shp1: TShape
      Left = 512
      Top = 6
      Width = 227
      Height = 40
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 463
      Top = 4
      Width = 41
      Height = 43
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
      Left = 4
      Top = 4
      Width = 41
      Height = 43
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
      Left = 46
      Top = 4
      Width = 41
      Height = 43
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
    object btn_remeter: TSpeedButton
      Left = 88
      Top = 4
      Width = 39
      Height = 43
      Hint = 'Remeter'
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
      OnClick = btn_remeterClick
    end
    object SpeedButton1: TSpeedButton
      Left = 128
      Top = 4
      Width = 39
      Height = 43
      Hint = 'Remeter'
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
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 520
      Top = 8
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 620
      Top = 8
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object rdgrp_tp_remessa: TRadioGroup
      Left = 174
      Top = 3
      Width = 282
      Height = 40
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Abertos'
        'Remetidos'
        'Todos')
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = rdgrp_tp_remessaClick
    end
    object edt_chave: TEdit
      Left = 520
      Top = 21
      Width = 97
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 621
      Top = 21
      Width = 115
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      OnChange = cb_ordemChange
    end
  end
  object MainMenu1: TMainMenu
    Left = 476
    Top = 288
    object mi_salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = btn_salvarClick
    end
    object mi_Cancelar: TMenuItem
      Caption = 'Cancelar'
    end
    object mi_remeter: TMenuItem
      Caption = 'Remeter'
      OnClick = btn_remeterClick
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 500
    Top = 377
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = datm_emissao_remessa.ppRelER
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 4000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\remMar.RTM'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 452
    Top = 379
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppRelER'
    object HeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object DetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object Shape13: TppShape
        UserName = 'Shape13'
        mmHeight = 5821
        mmLeft = 1058
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object Shape14: TppShape
        UserName = 'Shape14'
        mmHeight = 5821
        mmLeft = 11906
        mmTop = 0
        mmWidth = 28046
        BandType = 4
      end
      object Shape15: TppShape
        UserName = 'Shape15'
        mmHeight = 5821
        mmLeft = 39688
        mmTop = 0
        mmWidth = 28046
        BandType = 4
      end
      object Shape16: TppShape
        UserName = 'Shape16'
        mmHeight = 5821
        mmLeft = 122502
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object Shape17: TppShape
        UserName = 'Shape17'
        mmHeight = 5821
        mmLeft = 150019
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object Shape18: TppShape
        UserName = 'Shape18'
        mmHeight = 5821
        mmLeft = 171715
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText8'
        DataField = 'NR_HOUSE'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 794
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText19'
        DataField = 'VALOR_REMESSA'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 4233
        mmLeft = 171715
        mmTop = 794
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText31'
        DataField = 'VALOR_CC'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 4233
        mmLeft = 122502
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText42'
        DataField = 'VALOR_DEDUCAO'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 4233
        mmLeft = 150019
        mmTop = 794
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText53'
        DataField = 'NR_MASTER'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 4233
        mmLeft = 11906
        mmTop = 794
        mmWidth = 28046
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape4'
        mmHeight = 5821
        mmLeft = 87048
        mmTop = 0
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText68'
        DataField = 'NOME_NAVIO'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 4233
        mmLeft = 87048
        mmTop = 794
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText83'
        DataField = 'NR_LINHA'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 794
        mmWidth = 11113
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape6'
        mmHeight = 5821
        mmLeft = 67469
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText15'
        DataField = 'CD_INCOTERM'
        DataPipeline = datm_emissao_remessa.ppRelER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelER'
        mmHeight = 4233
        mmLeft = 67469
        mmTop = 794
        mmWidth = 20108
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape10'
        mmHeight = 9790
        mmLeft = 794
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape101'
        mmHeight = 9790
        mmLeft = 198702
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_PAGINA'
      DataPipeline = datm_emissao_remessa.ppRelER
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelER'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 56886
        mmPrintPosition = 0
        object ppReport1Label2: TppLabel
          UserName = 'ppReport1Label2'
          AutoSize = False
          Caption = '(Carta - Circular Bacen Nr. 3249 de 30/07/2004)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 24606
          mmWidth = 197909
          BandType = 3
          GroupNo = 0
        end
        object Shape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 150019
          mmTop = 45773
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Shape7: TppShape
          UserName = 'ppReport1Shape7'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 171715
          mmTop = 45773
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppReport1DBText4: TppDBText
          UserName = 'ppReport1DBText4'
          DataField = 'AP_MOEDA'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 171715
          mmTop = 51858
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppReport1DBText1: TppDBText
          UserName = 'ppReport1DBText1'
          DataField = 'AP_MOEDA'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 150019
          mmTop = 51858
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Shape12: TppShape
          UserName = 'ppReport1Shape12'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 122502
          mmTop = 45773
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Shape11: TppShape
          UserName = 'ppReport1Shape11'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 39688
          mmTop = 45773
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Shape10: TppShape
          UserName = 'ppReport1Shape10'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 11906
          mmTop = 45773
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Shape9: TppShape
          UserName = 'ppReport1Shape9'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 1058
          mmTop = 45773
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label5: TppLabel
          UserName = 'ppReport1Label5'
          AutoSize = False
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 46831
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label10: TppLabel
          UserName = 'ppReport1Label10'
          AutoSize = False
          Caption = 'REMESSA L'#205'Q.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4233
          mmLeft = 171715
          mmTop = 46831
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppReport1DBText11: TppDBText
          UserName = 'ppReport1DBText11'
          DataField = 'AP_MOEDA'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 122502
          mmTop = 51858
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label4: TppLabel
          UserName = 'ppReport1Label4'
          Caption = 'Nr. da Opera'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 86254
          mmTop = 38100
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppdb1: TppDBText
          UserName = 'DBText67'
          DataField = 'NR_PAGINA'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 5556
          mmLeft = 188384
          mmTop = 1852
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppImage1: TppImage
          UserName = 'Image1'
          MaintainAspectRatio = False
          Stretch = True
          Picture.Data = {
            0A544A504547496D6167651E1C0000FFD8FFE000104A4649460001020100C800
            C80000FFEE000E41646F626500640000000001FFDB0084000604040405040605
            050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010707070D0C0D18
            101018140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108005B
            00D103011100021101031101FFDD0004001BFFC401A200000007010101010100
            00000000000000040503020601000708090A0B01000202030101010101000000
            00000000010002030405060708090A0B10000201030302040206070304020602
            73010203110400052112314151061361227181143291A10715B14223C152D1E1
            331662F0247282F12543345392A2B26373C235442793A3B33617546474C3D2E2
            082683090A181984944546A4B456D355281AF2E3F3C4D4E4F465758595A5B5C5
            D5E5F566768696A6B6C6D6E6F637475767778797A7B7C7D7E7F7384858687888
            98A8B8C8D8E8F82939495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACA
            DAEAFA110002020102030505040506040803036D010002110304211231410551
            1361220671819132A1B1F014C1D1E1234215526272F1332434438216925325A2
            63B2C20773D235E2448317549308090A18192636451A2764745537F2A3B3C328
            29D3E3F38494A4B4C4D4E4F465758595A5B5C5D5E5F5465666768696A6B6C6D6
            E6F6475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F83949596979
            8999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C030100021103
            11003F00F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
            8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD0F54E2A926B7E
            71D0F4797D1B994BDC815304439B0AF4E5D97E9CC8C5A59CC58E4E1E7D763C46
            89F57724E3F35341E4434170ABD8F1535FA3965FFC9F3EF0E2FF002C63EE923E
            D3F30FCA972789BBF418F6994A7E3B8CAA5A2C83A37C3B4F0CBAD7F593FB6BCB
            4BA8C496D324C87F6A360C3F0CC79448E61CD84E32160DAAE4593B15762AEC55
            D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
            B157FFD1F54E2AF0CD7219D35EBE8AE09F58DCB8773FE536C7FE04E743888E01
            5DCF1FA88919240F3E27AE693E56D0F4EB68E386D6391828E53C8A1DD8F7249A
            E69726A2723B97A6C3A4C7014004835CF34F92ADE792D1EC12F64889593D3893
            8861B11C8D3F0CC9C3A7CC45DF0B85A8D5E9E2787878FE0910D47F2F65979C02
            EF45B8ED35B96500FB852C3FE1732383381BF0E41E6E1F8BA526C71E23FD14F7
            4DD575D515D3354B4F305B8FF744A443754F9F427FD6198F931C3F8A32C47FD3
            41CCC59B27F04A39C7FA4C8AD71F9ABE4FD36E4597982EC685A870127D56F7E1
            25492392B0AAB2D46512D2CB9C7D63FA2E663D644ED2071CBFA489D27F33BC81
            ABEA10E9DA66BB6B777D704886DE27ABB15058D053C06572C1302C86E8E68134
            0B27CA9B5D8ABB15762AEC55D8AA5BAFF99342F2F592DF6B77D1585A33889669
            8F152EC090BF3A29C942064680B6329888B2C7C7E71FE5712147996C89240003
            F52761DB2DFCB64EE2D7F98877B32041008DC1DC650DCEC55D8ABB1549BCC5E7
            3F2AF96CC035DD4E0D38DCF2FAB89DB8F3E14E54F95464E18E52E42D84F2463C
            CA5B61F9ADF973A85EC16365E60B4B8BCB97115BC08F56776E8A053A9C99D3CC
            0B2188CD0268165794B6A95DDDDB5A5B4B75752AC36D0234934CE42AAA28AB33
            13D001840BD904D311FF0095CBF95B4AFF0089AC69FF00193FB32EFCB64EE2D5
            F98877B27D2358D3758D3E2D434C9D6E6CA6A98674078B006955A8151954A262
            68B6C6408B08CC8A5FFFD2F54E2AC0FF00323CAEF3A7E99B44E5246BC6F2351B
            941D241EE9FB5FE4E6C743A8AF41FF0035D2F6A692FF00791FF3FF00E2936F22
            7991356D2D6DE561F5EB450928EEE8365907CFF6BFCACA7578382563E99395D9
            DAA192147EB8FE389E75E67D21F4AD7A682E01FABC927AD1B8FDA89DAA69EEBB
            AE6D3065E380239BA2D5E1F0F290797D5FE6BD66CB44F2F8B3885B595B9B7640
            50F056AA91506A46F5CD2CF2CEF726DE971E9F1708A8C69057BE45F2C5D9E5F5
            316F2F512DB931303FEC76CB21ABC91EB7EF6AC9D9F865D384FF0047D2F943F3
            96E0BFE626A56BF5A96EE3D38476714B3B727023404AD7FC9766CDA6037106B8
            6DC09C384F0D9970FF003930FC85825FF1D8BE867B7827B1B691E0175511C8F2
            D23E1C87D962A5A8D833806344123FA2884CC6428C632FE9FF0017F45F46C5F9
            A7E55B7BE974BD76F6DF48D5ADE827B69A642B522A28E0D370797C59AD9E94D5
            C7D717638B5809E198E097FB1FF4C9CE99E71F2A6A82E1B4ED5ED2E96D104972
            D14C8C23435A33907E15DBBE512C721CC3923244F22914FF009D3F95B05D7D5A
            4F31DA7A95A12A59D01F775529FF000D960D364EE607510EF65BA7EA361A8D9C
            77B61711DD5A4C39453C2C1D187B32D465241068B6820EE1BBDBFB2B0B57BABD
            B88ED6DA2159279982228F7662062013C949039B10FF0095D7F957F59FAB7F88
            ED7D4AD3955B857FD7E3C3FE1B2EFCAE4EE6AFCC43BDE65FF3943E61B4BBD37C
            B765653A5C5BDCBCD7A258983A32A288D082B507777CCAD0C082497175B3B000
            78E7907481ABF9E341D348AADC5EC3EA7FA91B7A8DFF000A999B965C3027C9C4
            C51B900FB9259A28626966758E2415777215401DC93B0CD08776C3F50FCE2FCB
            1D3E568AE3CC569EA29A32C4C65A1FF9E61B2F1A6C87A349D440755B65F9D1F9
            5D78E121F31DA0726804ACD17E2E146274D907451A881EACC2DEE6DEE604B8B6
            95268241CA396360C8C3C430A8394914DA0DBC53F3CBCA9A3F99FCC764B77E6F
            D37446D3AD8A7D46EC832F295B9973F1A503284A66769721844D44CADC3D4E31
            23F508A47F959F94BA15A79E74ED4ADFCDFA76B4FA717B9FA8DA0AC868A515BE
            DB51519C1E993CFA826047098DB0C1800903C424FA12F6FECAC6DDAE6F6E23B5
            B74FB734CEB1A0F9B310335C013C9CF240E6F19FCE0F39F943CD1A5268363E79
            D3F4CB377E5A8811CB72D305A148F945F088EBF137F3E66E9F1CA06CC4970F51
            923214240311FCB6F21FE4FC7ACA5CEB3E6FB0D6DD08367A7906D612E3F6A513
            1AC9BFD98FECFF00AD97E7CB96B6898B561C58EF79093E99844422410F1F4B88
            F4F8538F1A6DC69B5299AA2EC9762AFF00FFD3F54E2AE2010411507A8C55E75E
            65F2BDFE857E35DF2F82B1212F342BBFA75FB5F0FED44DFB4BFB39B4C1A88E48
            F04FF1FF001E745ABD24B0CBC5C5CBFDCFFC713359F45F3D68FE8B1106A700E4
            17F6A373B721FCF1365353D3CEF9C4B90258F598EBE998FF0063FF001D4BBCB5
            E61BDF2E5E0D035F531C20FF00A35C1355504EDBF788F63FB19767C2328E3838
            FA5D4CB04BC2CBCBF865F8FE17A0B4B1AC4662C3D355E65FB7102B5CD5D3BCB7
            C19AF6A6FAAEBBA8EA6E6AF7D7535C1F948E587E19D0423400747295925EEDFF
            0038C5E5AB1BBD035FBFBFB749E1BAB88ED50482A38C09C9A9FECA4CC1D66531
            90A34E5E970C6713C43883C43CDF716F77E6BD66E2015B77BD9C41525BF768E5
            1373B9F85733E1742F9B866201A1C93FFCBDF20799BCDD61AADB6937696B6086
            237B6FCA8F72CB528AB18A7A8230C5BE23C7E2FE6C8649C624197FA648122088
            EE7F98C4F53D3E4D3B52BAD3E53592D25785C814DD0D3A1E9F2CB18036F78FF9
            C51BBBE27CC367CD8E9F1FD5E548FF0065667E618AF872551CBFD5CD76BC0D8F
            5761A12770F3DFCE5FCC5BFF0037F99EEADD276FD01A74CF0D85AA9A2398CF16
            9DC7ED33B03C6BF6533274D84423FD22D1A8CC672FE8B7F94BF94B73E7EB9BC7
            92ECD869761C566B8440EEF2B8256340C42ECA393B63A8D4787E64AE0C1E27B9
            20F3E79667F2AF9A2F3CB6F74D770E9CC05B48761E9CCA25D92A4213CBE30BFB
            596629F1C78BBDAF2C3865C3DCCCBFE71B749FAEFE652DD32D63D32D269C93D9
            E4A44BFF00126CA35B2AC7EF6ED1C6E7EE7A67E77F92FCD1E63BB8CCDE67D3B4
            5F2CC318F4ECEEE5922F565EAF2494F85E9F6517F6731B4B96311C8CA4E4EA71
            CA5D4462F32F2C7907F2A2CAFA5FF1779D2C6EEDD54082DB4D795416A9E46493
            8741FB2AB9953CD908F4C4FF009CE34316307D52FF004AC23CED67E58B4F335E
            DBF962E9AFB425286D2E1C96279282EB520160ADF0D6997E232311C5F5346411
            12F4F27B2FFCE2A6A1AA33EBDA71919B4A85609A28C9256399CB06E1FCBCD57E
            203F973075E06C7AB99A12771D1E57F9B5AA8D5FF323CC179F6916E9ADA2277F
            82D80847E2873334F1E1800E2E795CCBD2BFE71534657D575ED64A0FDC450D9C
            6DEF2132BFE0A998BAF96C0393A18EE4A37F387F2F7CC9AF6BF3DFEB9E6FD274
            ED291A9A6E9D752C9188A2ECC5294691BABBE474D9A318D0892596A31191B320
            0316F2AF923F256D239C79B7CE16D7D725A9047A7BCB142894EA5B87277AFF00
            B15CBB265CA7E98B5431E21F549E61ACDBE9B16AD7D069D31BAD3639E44B3B87
            1BC9086211C8FF0029732A24D0BE6E2C80BDB93E9AFF009C63D4B54BBF22DD43
            792B4B6D6578F0D897258AC7C158A027F6559BE1CD5EBA204F6767A324C777AF
            E61396FF00FFD4F54E2AEC55C402287A62AC23CC7E47B88AE7F4BF9718DB5EA1
            E6D6E878863DCA7615EE87E06CD860D58238726E1D46ABB3C83E262F4CBF9AA1
            69AEE8DE66B7FD11E62845A6A6878A48470F8FA5509FB0FF00E437DAC94B0CF1
            1E2C7EA8B086A31EA07879470CD2CD762F38796B44D474C8D85E69B756F2C167
            74D5A42F221552D4A94A57A7D9FE5C9C7C3CC41FA66C09CDA5147D78BBFF009A
            F95F52D1F51D267FAB5FC0D0B8FB2C774703BA30D9866716B84C48587D3FF961
            C3CADF909FA5643C1CDA5D6A4C7FCA939327E0133519FD79ABFCD76D87D38ADF
            2A2722A0B6EC7763EE7739B7756FA83F287C99629F94BA7EA72B359EA0C6E351
            8EFA3F864452E4AF2FE65E08BB66B72EA4C7211F547E9E173068E33C625F4CFF
            00866F99EFEF66BFBFBABF99CC935DCD24F2487AB348C589FA6B9B102B670EC9
            E6FA4FFE71B3459A1FCBCD56FE2F86E754B995616E9B43188D3FE1CBE6AF5B2F
            581DCECB471F413DEF9A2786782E2682E1592E2191E39D185195D5886041EF5C
            DA02EB69EC9F929F9C1E54F25795F50D37588EE3EB4F72D7503411FA8250E8AA
            12B51C5815FDACC2D4E9A539021CCD36A2308905E5DE6CF305D798FCCBA96B97
            29E9CB7F3B49E975F4D3ECA27FB040AB9978E1C3103B9C69CF8A44BD9BFE71AA
            DFF47797FCD9E6731191A0558A24037616F134CCA3E6CEB983AD3728C5CCD18A
            1293C4B5EF30EADE64D4E6D5F58B86BABBB93CC9724AA29DD5235E88883650B9
            9D08088A0E14A6646CBD13C8DA47E4545E525D57CDBA9C971ACFC6D2E948D223
            27162123448C0F50B2D1B997FDACC7CB2CBC5511B3918A38B86E477799DF4B6D
            35F5C4B6B07D56D6495DADEDAA5BD38CB1289C8EEDC576AE650E4E31E6FA33FE
            71CA04D1BF2DB5CF30CA0012CD34DC8ED58ECE2A0FF86E79ACD69E2988BB1D20
            A812F9BE5B896E6692E6524CB70ED2B93DDA462C7F139B3AA75B76FA0FF2CEF2
            F3CA1FF38FDAD799AD107D7EE1EE2E2DDD8546CCB6F1B11E094E79AECE04F308
            9E4EC30930C4641F3F5F5D5DDF5D4B797B33DDDE4C4BCB3CCC5DDD8EE49639B1
            000D8380493B97AADB699F905A5792E2BEBABC935EF324B6E0FD4124951BEB2E
            BFDDFA69C42246FB16639886598CAAB862E508E211BFAA4F2515037FA732DC47
            D87F90BA47E8DFCAED22ABC64BD125E480F8CCE4AFFC204CD36AE5790BB7D2C6
            A01E8398CE43FFD5F54E2AEC55D8ABB15487CCBE4FD2F5C8CBC8BE8DE8144BA4
            1BFB071FB6B99383532C7FD570B55A18661BED2FE7318875AF31F9558586BB01
            BFD28FC11CE3E2F87C031EBFF18E4CCB38B1E6F540F0CDD7C73E5D37A720E3C7
            FCEFC7FB9921F5AFCBFF002AF9B74F964D1E489E390132D84BF6031F01F6E16F
            9631D4CF19E1C83FCE49D1E3CBEBC12E13FCDFC7D2E3A8E9F0E823C9BE6ED25A
            DF4930A5A8F47908DA18E814554F2A7C23E246C074FC478F19B2CA3AE30F4668
            F0FF0049BB1FC93FC97D421F56CB4C8A78CF74B89CD3E63D4A8CA27A8CD13476
            73B1E2C33171F533B87CBFA441A02E810C1E9E92B6FF00535B756614878F0E3C
            ABCBECF7AF2CC5333C5C5D5CAE0155D183DD7FCE3DFE573DABC76DA40827E3FB
            A93D69C8561D2A0B9A8F1CC98EB260EE7671F2692241AD8A33C85AE689A3DBC3
            E545B15D25AD5DE18A2466788C85C961C9C9705989A72CB353A627D60F107134
            9AE8DF8721C12FA7FA2A9E6FFC97F20F9AEFDB51D46CDE1D41E9EB5D5A486179
            29B0E74AAB1FF2B8F2CA31EA670143939D934F091B285F2E7E427E5BE857E97F
            158C97B73130685AF6533AA30E85508095FF005970CF57390AB4434B089B549F
            F21BF2B279E49E6D183CD33B492399E7A9672598FDBEE4E01ABC83AA4E9A07A3
            27F2C7947CBDE58D31B4BD12D05AD8BC8D2BC5C99EAEF40C4972C77A6553C929
            9B2D908088A0C2754FF9C73FCB2BFBD92E96DAE6C8CAC59A1B59DA38B9135255
            086E3F25F872F8EB32014D32D2409B44F97FF207F2D745BE8EF52C64BDB88583
            C26F65332AB0DC109B21FF0064AD827ABC921569869611369779DFF2AFF29B43
            D0F56F33DEF97DAECDB2BDD5C471CF32B48CCD56A55C28A96C962CF924444163
            9306300921318353FC9FD234A1E403796F6505E208A4D25A69390FAE0E5E9B49
            53C1A4E7DE4C898E5278FED640E303818E0F24FF00CE367E9A6D0E96BFA55261
            6C6D3EB371CBD6AF1F4C1E7C4BD76E20E5BE2E7ABE8D7E161BAEA9FE8BE74FCA
            FB1F25DB69D74D6DA6E833ADCDBD969F349F59F52D6191A391D82FA84216E5CB
            9FD9FE6CAA58F21958DE4D83240468F261373F971FF38F7279A57435BDBAB6BD
            B98E09EDA18AE1FD061747F72913B07AB302AC16BF619732066CDC374D070E2E
            2A4C3CB1A37E4579674E4D5B508E3B0B9BA96EED2DE4D42E3EB53116EED04AF1
            FA5C953A7DA55E51FF00AD919CB348D065086288B2ADA8F927FE71AB4E4B5FAE
            0B5892F615B8B6617370EAD04868B2725760A8DFCEDF0E08E5CE7924E3C239BD
            7F4AB0B0D3F4DB5B1D3D047636D12456B1A92408D5405009AD76CC29124D972E
            20014115812FFFD6F54E2AEC55D8ABB15762AB27820B889A19E3596271474700
            823DC1C20906C319444851E4C2B55FCBD9ADAE0DFF0096EE5ACEE17716E5885F
            92B761FE4BF25CCFC7AD0470E41C41D4E6ECC313C584F0CBF9A858FCE92464E9
            5E70D3763B194A5411E253A1FF005A33933A5BF5629358D791E8CF1FC7E3F9AB
            CF9274ABD1FA43CADAA1B773B85572CA3DAA0874FF006583F3728FA7246D3F90
            84FD5865C3F8FF004CA6FABFE63687B5DDB8BFB74FF76F1E7B7FAD1D1BFE0972
            431E0C9C8F0962736AF0FD438C7E3F9AA2DF9B17DC4AFE8F8965A53E291A80FF
            00ABC41C3FC9C3BD8FF2CCBF9A2FDEC2EF2F66BABB9AF267FDFCCE65775DA8C4
            D76F0A76CCF8C40000E4EA673329191E65EE1A2CF733E916735D295B89214694
            1D8F22A2B5CE7F2802440E56F5F8244E38997D5483B5F34E9EFA94BA5DE1FA9E
            A113504521F864077568DFA1E43B7DAC9CB4F2E1E21EA8B543591333097A263F
            1E94E72872D2F6D7B4C5D7068864235136E6EC47C1B8FA41B8579D385797ECF2
            E592E0357D18F10BA57BCD534DB2B592EEF2EA2B7B5888592791D5514921402C
            4D01A9A601127609240567B8811433C8AAA4D03330009FA71A4DA4FE73D020F3
            2796350D024BAFAA0D4A2F43D700332D48350A48E5D3278E7C3207B984E3C429
            866A1F93AB77AB5EB47E617834CD4EEED750BFD2C5BC2CD24D682300ACCC7D44
            56685795065C3534396E1A4E0B3CF66331FE5BF9D64F3B471C6823D02DBCC2FA
            D6F716D244A8CECECC1428BBF55CB71E0FFBB4CB7C68F07F4B8785AFC1971797
            1712BF9A7F273CB767E59B27B9F30BC365A3A5C412DC0B55B87617D726415113
            07F85E4E207C4BFB5C7063D4C8CB97D5FEF567A78F0F3E4CA63FCAF306B9A3DF
            E9FE65B8B592C2C6D2C2EE2F4E1796EE0B393D55E4EDF147EA578C9C57EC655E
            3EC411CCB68C3B820F441FFCA9C685ECA4D27CC6D65A9598D417D6FAB4338683
            51B833BA7A521217D366E2AF92FCCF78DB6FF628F03B8F7A51E78FCA0D0E4D32
            6BED43CCCF6F61A5E951D95E48D6F1CCD1C76F52D32AC653D36727F78823C962
            D41BA03996393003B93D1EB7A21B73A3581B697D6B636F17A33538F34E038B53
            B721BE624B997263C823322C9FFFD7F54E2AEC55D8ABB15762AEC55D8AA1B50D
            32C35180C17B024F11FD9715A7C8F51F464E19251360D35E4C5198A90E20C2F5
            0FCB8BBB498DDF97AF5E0946E21762A7E4B20FF8DF33E1AE0456416EA72F65CA
            278B14B84FE3F890B1F9DFCD7A24820D76C4CC836F548E0C7E4EB58DB267498F
            26F02D63B43362359237F8FF004A9BC3E6AF22EAE00BD8A28A56EAB75101BFFA
            F423FE1B283A7CD0E5FEC5C98EB34D97EA007F5C26F63A1F94F9ACF656968ECB
            BABC611A9F757289E5CBC8993958F4F839C4453924015268075394396F25FCC6
            BDB1BCF3029B57593D1844733AEE0B8626951FCA0E6EB4503186FDEF33DA9923
            2CBE9E81997E5EEB32EA3A1FA53B17B8B26F4598EE4A52A84FD1F0FF00B1CC1D
            6E2119D8E5276BD999CCF1D1E70F4B16FCC9FCBEF366BFAC6AD75A54B1A4177A
            17E8EB70F33C645CFD6D26A90A3E11E9A9F8F061CD18800FF39C9CB8E5226BB9
            2AD63F252F65D3BCCDA7E9B6F6F1D9DFC3A74DA5DB4934A6317F6C49B99181E5
            C4CAA78F3F8B964E3A91609E97FE9584B4FB103C903E61FCA2F3A6A3A7E8DE9D
            969B12DA45791CBA341338B789AE240D1C8AF3ACDEA3851477E2ADFC9C70C351
            104F3FEB319E091039277A2FE4CC92EAD6F37991CDCC361A5E9B6F63730DCCA2
            68EF2CD8B48EA76FF2539B7C4E99096A76F4F79671C1BEFDC10FA4FE526BD67A
            9D86B45615D6A2F305D5EDCDE09E424E9937329153A1DD97945865A80411D387
            FD928C041BEBC5FEC522F2E7E4B7E60D9EA53CF3DC5BDA3DC596A36B3DE413B1
            2F2DDA11149C422BF0573FEEC92475FD9CB27A9811F10D50D3CC1F9ABDA7E4FF
            009C93CBBAAD95BE9BA768F757367676A86D2F2E5CDC4B05C24B24F297F810B2
            2B745E7F17DAE380EA23C40D99321825C2455236F3F297CDD2F9DDF528E1B30A
            FAD45AA2F983EB338BC4B442A5AD0434E1C28A53ED71F8B223511E0AFE8F0F0F
            FBE49C12E2BF3FA917A37E51EB3A6DE691ABC0B145AE43AADFDC6A7782795B9D
            8DC09BD18A9D19579C3CA3C8CB500823F8687FA64C701147ADB19D27F24BF302
            DA2D4C4BF5547BED22FAC26E3705966B8B8A189DA91A9E1CBFDF8D23A7F365D2
            D540D7BC35C74F217EE7BB797ECA7B0D074EB29E9EBDADAC30CBC4D579C71856
            A1F0A8CD7CCD925CD88A0023F22C9FFFD0F54E2AEC55D8ABB15762AEC55D8ABB
            15762AB658629A331CA8B246DF6918020FD070824724188228B19D4FF2E7CBB7
            9C9A146B295BF6A13F0D7FD4355CCBC7ADC91E7EA75F97B2F14F97A0FF00458C
            5E7E57EB56EC5B4FBA8E71D812D0BFE155CCB8EBE07EA1FEF9D7CFB27247E920
            FF00B14AAEFCB1E738C149ADAEA54EE164322FE0C72E8EA317421C69E9350398
            97CF890D0F94FCCB2B844D36607C5D4228FA49C99D4E31FC41AE3A3CC7944BD2
            FC93E5A9B43D3E45B960D7772C1E50BBAA8028AA0F7A66A7559C6496DC83D068
            34A70C4DFD5264598AE73B15762AEC55D8ABB15762AEC55D8ABB15762AEC55FF
            D1F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15
            762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD2F54E2AEC55D8ABB157
            62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
            C55D8ABB15762AEC55D8ABFFD9}
          mmHeight = 14023
          mmLeft = 1588
          mmTop = 1058
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 87048
          mmTop = 45773
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppDBText78: TppDBText
          UserName = 'DBText79'
          DataField = 'NM_UNID_NEG'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 53446
          mmTop = 2117
          mmWidth = 97102
          BandType = 3
          GroupNo = 0
        end
        object ppDBText79: TppDBText
          UserName = 'DBText80'
          DataField = 'ENDERECO_UNID'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 53446
          mmTop = 6350
          mmWidth = 97102
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'DBText81'
          DataField = 'TEL_UNID'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 53446
          mmTop = 10583
          mmWidth = 47096
          BandType = 3
          GroupNo = 0
        end
        object ppDBText81: TppDBText
          UserName = 'DBText82'
          DataField = 'FAX_UNID'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 103452
          mmTop = 10583
          mmWidth = 47096
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText9'
          DataField = 'TITULO1'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 19579
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText10'
          DataField = 'CAMPO1'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 11906
          mmTop = 46831
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText101'
          DataField = 'CAMPO2'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 39688
          mmTop = 46831
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText11'
          DataField = 'CAMPO3'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 87048
          mmTop = 46831
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText12'
          DataField = 'CAMPO4'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 4233
          mmLeft = 122502
          mmTop = 46831
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape5'
          Brush.Color = clSilver
          mmHeight = 10848
          mmLeft = 67469
          mmTop = 45773
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'ppReport1Label101'
          AutoSize = False
          Caption = 'INCOTERM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4233
          mmLeft = 67469
          mmTop = 46831
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'ppReport1Label102'
          AutoSize = False
          Caption = 'DEDU'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4233
          mmLeft = 150019
          mmTop = 46831
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppSystemVariable1: TppSystemVariable
          UserName = 'SystemVariable1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 172773
          mmTop = 38100
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label4'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 163777
          mmTop = 38100
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 38365
          mmLeft = 794
          mmTop = 18521
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape7'
          mmHeight = 38365
          mmLeft = 198702
          mmTop = 18521
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 1058
          mmTop = 17992
          mmWidth = 198173
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 73819
        mmPrintPosition = 0
        object ppReport1Shape6: TppShape
          UserName = 'ppReport1Shape6'
          Brush.Color = clSilver
          Shape = stRoundRect
          mmHeight = 5556
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 198173
          BandType = 5
          GroupNo = 0
        end
        object ppReport1Label14: TppLabel
          UserName = 'ppReport1Label14'
          Caption = 'TOTAL            (VALOR DO CONTRATO TIPO 04)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 1588
          mmWidth = 67733
          BandType = 5
          GroupNo = 0
        end
        object ppReport1Label11: TppLabel
          UserName = 'ppReport1Label11'
          Caption = 
            'Declaramos, sob  as penas da Lei, que os dados, elementos e info' +
            'rma'#231#245'es aqui prestados s'#227'o a express'#227'o da verdade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 10583
          mmLeft = 1852
          mmTop = 8731
          mmWidth = 91546
          BandType = 5
          GroupNo = 0
        end
        object ppReport1Memo1: TppMemo
          UserName = 'ppReport1Memo1'
          Caption = 'ppReport1Memo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Lines.Strings = (
            'OBSERVA'#199#195'O;'
            ''
            '1a. via apresentar ao Banco negociador'
            '2a. via apresentar, no prazo de 5(cinco) dias uteis a contar'
            'da contrata'#231#227'o do cambio, ao BANCO CENTRAL DO BRASIL'
            'Delegacia Regional em S'#227'o Paulo - RECAM/SUBIM,'
            'AV. Paulista, 1804 - 4o.andar')
          Transparent = True
          mmHeight = 50271
          mmLeft = 1852
          mmTop = 21960
          mmWidth = 91546
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object DBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NM_UNID_NEG'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 99219
          mmTop = 22225
          mmWidth = 97102
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label1'
          Caption = 'AGENTE CONSOLIDADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 99484
          mmTop = 29104
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label2'
          Caption = 'BANK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 99484
          mmTop = 41010
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label3'
          Caption = 'SWIFT CODE: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 58473
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label5'
          Caption = 'TRANSIT:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 62706
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label6'
          Caption = 'ACCOUNT No.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 99484
          mmTop = 67469
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object DBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'ST_ROUTING_INF'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 127529
          mmTop = 62442
          mmWidth = 70115
          BandType = 5
          GroupNo = 0
        end
        object DBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'NR_CONTA_1'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 127529
          mmTop = 66940
          mmWidth = 70115
          BandType = 5
          GroupNo = 0
        end
        object DBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'ST_SWIFT_1'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 127529
          mmTop = 57944
          mmWidth = 70115
          BandType = 5
          GroupNo = 0
        end
        object DBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'END_BANCO'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          WordWrap = True
          DataPipelineName = 'ppRelER'
          mmHeight = 7938
          mmLeft = 127529
          mmTop = 44979
          mmWidth = 70115
          BandType = 5
          GroupNo = 0
        end
        object DBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NM_BANCO'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 127529
          mmTop = 40217
          mmWidth = 70115
          BandType = 5
          GroupNo = 0
        end
        object DBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'NOME_AGENTE'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 127529
          mmTop = 32544
          mmWidth = 70115
          BandType = 5
          GroupNo = 0
        end
        object ppDBText50: TppDBText
          UserName = 'DBText52'
          DataField = 'TOTAL_REMESSA'
          DataPipeline = datm_emissao_remessa.ppRelERTotal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelERTotal'
          mmHeight = 3969
          mmLeft = 172244
          mmTop = 1852
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBText64: TppDBText
          UserName = 'DBText65'
          DataField = 'TOTAL_CC'
          DataPipeline = datm_emissao_remessa.ppRelERTotal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelERTotal'
          mmHeight = 3937
          mmLeft = 123031
          mmTop = 1588
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object ppDBText65: TppDBText
          UserName = 'DBText66'
          DataField = 'TOTAL_DEDUCAO'
          DataPipeline = datm_emissao_remessa.ppRelERTotal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppRelERTotal'
          mmHeight = 3937
          mmLeft = 150548
          mmTop = 1588
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 98690
          mmTop = 20638
          mmWidth = 101071
          BandType = 5
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText14'
          DataField = 'END_BANCO2'
          DataPipeline = datm_emissao_remessa.ppRelER
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppRelER'
          mmHeight = 3969
          mmLeft = 127529
          mmTop = 53181
          mmWidth = 70115
          BandType = 5
          GroupNo = 0
        end
        object ppShape7: TppShape
          UserName = 'Shape8'
          mmHeight = 72231
          mmLeft = 794
          mmTop = 265
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppShape8: TppShape
          UserName = 'Shape9'
          mmHeight = 72231
          mmLeft = 198702
          mmTop = 265
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 1058
          mmTop = 72231
          mmWidth = 198173
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
