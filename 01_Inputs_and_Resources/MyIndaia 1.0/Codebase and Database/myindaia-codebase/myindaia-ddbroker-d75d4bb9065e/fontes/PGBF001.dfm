object frm_integra_basf: Tfrm_integra_basf
  Left = 196
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Integra'#231#227'o de Exporta'#231#227'o - BASF'
  ClientHeight = 434
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mi_integra_basf
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_integra: TPageControl
    Left = 0
    Top = 0
    Width = 632
    Height = 434
    ActivePage = tb_remessas
    Align = alClient
    TabOrder = 0
    object tb_remessas: TTabSheet
      Caption = 'Remessas'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 641
        Height = 425
      end
      object Panel1: TPanel
        Left = 3
        Top = 3
        Width = 618
        Height = 37
        TabOrder = 0
        object Bevel3: TBevel
          Left = 5
          Top = 4
          Width = 172
          Height = 29
        end
        object btn_importar_remessa: TSpeedButton
          Left = 7
          Top = 6
          Width = 25
          Height = 25
          Hint = 'Importar para Broker'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
          OnClick = btn_importar_remessaClick
        end
        object btn_sair: TSpeedButton
          Left = 39
          Top = 6
          Width = 25
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
      end
      object Panel2: TPanel
        Left = 2
        Top = 40
        Width = 619
        Height = 385
        TabOrder = 1
      end
      object pnl_status_remessa: TPanel
        Left = 4
        Top = 379
        Width = 613
        Height = 25
        Caption = 'Informe um nome do arquivo a ser lido e clique em importar ...'
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 5
        Top = 41
        Width = 616
        Height = 30
        TabOrder = 3
        object Label1: TLabel
          Left = 7
          Top = 9
          Width = 197
          Height = 13
          Caption = 'Informe um nome para o arquivo a ser lido'
        end
        object btn_file_remessa: TSpeedButton
          Left = 587
          Top = 2
          Width = 25
          Height = 26
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
          OnClick = btn_file_remessaClick
        end
        object edt_nm_file_remessa: TEdit
          Left = 233
          Top = 5
          Width = 352
          Height = 21
          TabOrder = 0
          OnExit = edt_nm_file_remessaExit
          OnKeyDown = edt_nm_file_remessaKeyDown
        end
      end
    end
  end
  object OpenFile: TOpenDialog
    Filter = 'Arquivos texto|*.TXT;*.OUT|Todos os arquivos|*.*'
    InitialDir = 'C:\DDBroker'
    Left = 576
    Top = 145
  end
  object mi_integra_basf: TMainMenu
    Left = 456
    Top = 148
    object mi_importar_remessa: TMenuItem
      Caption = '&Importar Remessa'
      OnClick = btn_importar_remessaClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
