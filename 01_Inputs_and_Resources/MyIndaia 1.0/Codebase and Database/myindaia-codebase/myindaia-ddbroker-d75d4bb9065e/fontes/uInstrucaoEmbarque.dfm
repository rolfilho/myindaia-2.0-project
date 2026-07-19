object Frm_Instrucao_Embarque: TFrm_Instrucao_Embarque
  Left = 317
  Top = 137
  Width = 750
  Height = 550
  Caption = 'Instru'#231#227'o de Embarque A'#233'reo'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 0
    DesignSize = (
      742
      47)
    object shp1: TShape
      Left = 455
      Top = 2
      Width = 285
      Height = 43
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 412
      Top = 4
      Width = 38
      Height = 39
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
      Width = 38
      Height = 39
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
      Left = 42
      Top = 4
      Width = 38
      Height = 39
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
    object btn_prealerta: TSpeedButton
      Left = 88
      Top = 4
      Width = 36
      Height = 39
      Hint = 'Imprimir/Envio Pr'#233'-alerta'
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
      OnClick = btn_prealertaClick
    end
    object Label1: TLabel
      Left = 462
      Top = 6
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
      Left = 588
      Top = 6
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
    object dnav_instr: TDBNavigator
      Left = 304
      Top = 12
      Width = 100
      Height = 25
      DataSource = datm_instrucao_embarque.ds_processo
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 462
      Top = 19
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 589
      Top = 19
      Width = 145
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_instrucao_embarque: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_volumes
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_instrucao_embarqueChange
    OnChanging = pgctrl_instrucao_embarqueChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object DBGrid_Lista_instrucao: TDBGrid
        Left = 0
        Top = 52
        Width = 734
        Height = 377
        Align = alClient
        DataSource = datm_instrucao_embarque.ds_processo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
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
            FieldName = 'calc_processo'
            Title.Caption = 'Processo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_SIGLA'
            Title.Caption = 'Origem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_SIGLA_1'
            Title.Caption = 'Destino'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_SIGLA_CIDADE'
            Title.Caption = 'Origem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_SIGLA_CIDADE_1'
            Title.Caption = 'Destino'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMPRESA_1'
            Title.Caption = 'Exportador'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 166
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Agente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 95
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 52
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label21: TLabel
          Left = 9
          Top = 9
          Width = 82
          Height = 13
          Caption = 'Unid. Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_uni_neg: TSpeedButton
          Left = 299
          Top = 21
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
          OnClick = btn_uni_negClick
        end
        object Label51: TLabel
          Left = 336
          Top = 9
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
        object btn_co_produto: TSpeedButton
          Left = 618
          Top = 21
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
          OnClick = btn_co_produtoClick
        end
        object edt_nm_unid: TEdit
          Left = 36
          Top = 22
          Width = 262
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object edt_nm_produto: TEdit
          Left = 363
          Top = 22
          Width = 254
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object msk_cd_produto: TMaskEdit
          Left = 337
          Top = 22
          Width = 27
          Height = 21
          EditMask = '99;1;_'
          MaxLength = 2
          TabOrder = 2
          Text = '  '
          OnChange = btn_co_produtoClick
          OnExit = msk_cd_produtoExit
          OnKeyDown = msk_cd_unidKeyDown
        end
        object msk_cd_unid: TMaskEdit
          Left = 10
          Top = 22
          Width = 27
          Height = 21
          EditMask = '99;1;_'
          MaxLength = 2
          TabOrder = 0
          Text = '  '
          OnChange = btn_uni_negClick
          OnExit = msk_cd_unidExit
          OnKeyDown = msk_cd_unidKeyDown
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 139
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        OnExit = btn_cancelarClick
        object shp2: TShape
          Left = 453
          Top = 68
          Width = 268
          Height = 68
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label4: TLabel
          Left = 18
          Top = 14
          Width = 82
          Height = 13
          Caption = 'Unid. Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 18
          Top = 54
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
        object Label53: TLabel
          Left = 233
          Top = 55
          Width = 44
          Height = 13
          Caption = 'Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 18
          Top = 94
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
        object Label6: TLabel
          Left = 233
          Top = 14
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
        object btn_co_processo: TSpeedButton
          Left = 141
          Top = 67
          Width = 25
          Height = 20
          Enabled = False
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
          Visible = False
        end
        object lbl5: TLabel
          Left = 451
          Top = 51
          Width = 102
          Height = 13
          Caption = 'Ref.Cliente / Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit4: TDBEdit
          Left = 270
          Top = 68
          Width = 175
          Height = 21
          TabStop = False
          DataField = 'NM_SERVICO'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_nm_cliente: TDBEdit
          Left = 280
          Top = 27
          Width = 437
          Height = 21
          TabStop = False
          DataField = 'NM_EMPRESA'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_cliente: TDBEdit
          Left = 233
          Top = 27
          Width = 45
          Height = 21
          TabStop = False
          DataField = 'CD_CLIENTE'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 6
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object DBEdit10: TDBEdit
          Left = 18
          Top = 107
          Width = 159
          Height = 21
          TabStop = False
          DataField = 'calc_processo'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit12: TDBEdit
          Left = 45
          Top = 27
          Width = 181
          Height = 21
          TabStop = False
          DataField = 'NM_UNID_NEG'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit14: TDBEdit
          Left = 45
          Top = 67
          Width = 179
          Height = 21
          TabStop = False
          DataField = 'NM_PRODUTO'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit11: TDBEdit
          Left = 18
          Top = 27
          Width = 28
          Height = 21
          TabStop = False
          DataField = 'CD_UNID_NEG'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit13: TDBEdit
          Left = 18
          Top = 67
          Width = 28
          Height = 21
          TabStop = False
          DataField = 'CD_PRODUTO'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 233
          Top = 68
          Width = 37
          Height = 21
          TabStop = False
          DataField = 'CD_SERVICO'
          DataSource = datm_instrucao_embarque.ds_processo
          ParentColor = True
          ReadOnly = True
          TabOrder = 4
        end
        object dbgrdRefCli: TDBGrid
          Left = 456
          Top = 71
          Width = 262
          Height = 62
          Color = clMenu
          Ctl3D = False
          DataSource = datm_instrucao_embarque.dsRefCli
          Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_REFERENCIA'
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_ITEM_PO'
              Width = 50
              Visible = True
            end>
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 139
        Width = 734
        Height = 290
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object Label7: TLabel
          Left = 18
          Top = 13
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
          Left = 568
          Top = 52
          Width = 63
          Height = 13
          Caption = 'Tipo Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 469
          Top = 52
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
        object Label24: TLabel
          Left = 375
          Top = 52
          Width = 56
          Height = 13
          Caption = 'Incoterms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_exportador: TSpeedButton
          Left = 331
          Top = 26
          Width = 26
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
          OnClick = btn_co_exportadorClick
        end
        object Label17: TLabel
          Left = 375
          Top = 129
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
        object Label18: TLabel
          Left = 375
          Top = 90
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
        object Label19: TLabel
          Left = 18
          Top = 90
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
        object btn_co_agente: TSpeedButton
          Left = 674
          Top = 158
          Width = 25
          Height = 20
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
          Visible = False
          OnClick = btn_co_agenteClick
        end
        object btn_co_origem: TSpeedButton
          Left = 307
          Top = 103
          Width = 25
          Height = 20
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
          Visible = False
          OnClick = btn_co_origemClick
        end
        object btn_co_destino: TSpeedButton
          Left = 674
          Top = 119
          Width = 25
          Height = 20
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
          Visible = False
          OnClick = btn_co_destinoClick
        end
        object Label5: TLabel
          Left = 18
          Top = 52
          Width = 110
          Height = 13
          Caption = 'Contato Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 153
          Top = 52
          Width = 94
          Height = 13
          Caption = 'Fone Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 375
          Top = 13
          Width = 120
          Height = 13
          Caption = 'Endere'#231'o Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 255
          Top = 52
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
          Left = 332
          Top = 65
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
          OnClick = btn_co_moedaClick
        end
        object lb_proc_vinc: TLabel
          Left = 175
          Top = 257
          Width = 386
          Height = 16
          Caption = 'PROCESSO DISPONIBILIZADO PARA  CONSOLIDA'#199#195'O'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object lb_proc_canc: TLabel
          Left = 278
          Top = 248
          Width = 179
          Height = 16
          Caption = 'PROCESSO CANCELADO'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object lb_consolidacao: TLabel
          Left = 375
          Top = 169
          Width = 130
          Height = 13
          Caption = 'Local de Consolida'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_consolidacao: TSpeedButton
          Left = 691
          Top = 182
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
          OnClick = btn_consolidacaoClick
        end
        object Label20: TLabel
          Left = 18
          Top = 129
          Width = 71
          Height = 13
          Caption = 'Embarca'#231#227'o'
          FocusControl = dbedtCdEmbarcacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnNavio: TSpeedButton
          Left = 330
          Top = 143
          Width = 26
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
          OnClick = btnNavioClick
        end
        object lbl_viagem_im: TLabel
          Left = 19
          Top = 168
          Width = 42
          Height = 13
          Caption = 'Viagem'
          FocusControl = dbedtNrViagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnViagem: TSpeedButton
          Left = 71
          Top = 182
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
          OnClick = btnViagemClick
        end
        object lbl4: TLabel
          Left = 107
          Top = 168
          Width = 92
          Height = 13
          Caption = 'Viagem Armador'
          FocusControl = dbedtViagemArmador
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_exportador: TDBEdit
          Left = 62
          Top = 26
          Width = 268
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_EMPRESA_1'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_agente: TDBEdit
          Left = 413
          Top = 142
          Width = 303
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_nm_origem: TDBEdit
          Left = 56
          Top = 103
          Width = 299
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_PORTO'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbet_nm_destino: TDBEdit
          Left = 413
          Top = 103
          Width = 303
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_PORTO_1'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit2: TDBEdit
          Left = 18
          Top = 65
          Width = 127
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_CONTATO'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object DBEdit5: TDBEdit
          Left = 154
          Top = 65
          Width = 93
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_TELEFONE'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object DBEdit7: TDBEdit
          Left = 375
          Top = 26
          Width = 340
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'END_EMPRESA'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 2
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 286
          Top = 65
          Width = 45
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_MOEDA'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 6
        end
        object dbLookp_tp_frete: TDBLookupComboBox
          Left = 470
          Top = 65
          Width = 93
          Height = 21
          Color = clMenu
          DataField = 'Look_tp_frete'
          DataSource = datm_instrucao_embarque.ds_processo
          ListField = 'DESCRICAO'
          ReadOnly = True
          TabOrder = 8
          OnClick = dbLookCB_incotermClick
          OnKeyDown = dbLookCB_incotermKeyDown
        end
        object dbedt_nm_local_conso: TDBEdit
          Left = 414
          Top = 182
          Width = 276
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_CONSOLIDACAO'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
        end
        object dbedt_cd_exportador: TDBEdit
          Left = 18
          Top = 26
          Width = 45
          Height = 21
          DataField = 'CD_EMP_EST'
          DataSource = datm_instrucao_embarque.ds_processo
          TabOrder = 0
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object dbLookCB_incoterm: TDBLookupComboBox
          Left = 375
          Top = 65
          Width = 86
          Height = 21
          Color = clMenu
          DataField = 'Look_incoterm'
          DataSource = datm_instrucao_embarque.ds_processo
          ListField = 'CODIGO'
          ReadOnly = True
          TabOrder = 7
          OnClick = dbLookCB_incotermClick
          OnKeyDown = dbLookCB_incotermKeyDown
        end
        object dbedt_cd_local_conso: TDBEdit
          Left = 375
          Top = 182
          Width = 40
          Height = 21
          DataField = 'CD_LOCAL_CONSOLIDACAO'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_local_consoExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object dbedt_cd_origem: TDBEdit
          Left = 18
          Top = 103
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_origemExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 255
          Top = 65
          Width = 32
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_instrucao_embarque.ds_processo
          TabOrder = 5
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object dbedt_cd_destino: TDBEdit
          Left = 375
          Top = 103
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_destinoExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object dbedt_cd_agente: TDBEdit
          Left = 375
          Top = 142
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
          OnChange = dbedt_cd_exportadorChange
          OnExit = dbedt_cd_agenteExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object cbbTipoCarga: TComboBox
          Left = 570
          Top = 65
          Width = 146
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 9
          OnChange = cbbTipoCargaChange
          Items.Strings = (
            'Normal'
            'Perigosa'
            'Perec'#237'vel'
            'Animal Vivo'
            'Outros'
            'Todos')
        end
        object dbedtCdEmbarcacao: TDBEdit
          Left = 18
          Top = 143
          Width = 51
          Height = 21
          DataField = 'CD_EMBARCACAO'
          DataSource = datm_instrucao_embarque.ds_processo
          TabOrder = 16
          OnChange = dbedtCdEmbarcacaoChange
          OnEnter = dbedtCdEmbarcacaoEnter
          OnExit = dbedtCdEmbarcacaoExit
        end
        object dbedtNrViagem: TDBEdit
          Left = 18
          Top = 182
          Width = 52
          Height = 21
          DataField = 'NR_VIAGEM'
          DataSource = datm_instrucao_embarque.ds_processo
          TabOrder = 18
          OnChange = dbedtNrViagemChange
          OnExit = dbedtNrViagemExit
        end
        object dbedtNmEmbarcacao: TDBEdit
          Left = 69
          Top = 143
          Width = 260
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NOME_NAVIO'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 17
        end
        object dbedtViagemArmador: TDBEdit
          Left = 106
          Top = 182
          Width = 111
          Height = 21
          DataField = 'NR_VIAGEM_ARMADOR'
          DataSource = datm_instrucao_embarque.ds_processo
          TabOrder = 19
          OnChange = dbedtNrViagemChange
          OnExit = dbedtNrViagemExit
        end
      end
    end
    object ts_carga: TTabSheet
      Caption = 'Dimens'#245'es da Carga'
      ImageIndex = 2
      object lb_receita: TLabel
        Left = 0
        Top = 190
        Width = 51
        Height = 13
        Align = alTop
        Caption = 'Receitas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 0
        Top = 327
        Width = 69
        Height = 13
        Align = alBottom
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 340
        Width = 734
        Height = 89
        Align = alBottom
        DataField = 'TX_DESCR'
        DataSource = datm_instrucao_embarque.ds_processo
        TabOrder = 3
        OnChange = dbedt_cd_exportadorChange
      end
      object dbgrid_receitas: TDBGrid
        Left = 0
        Top = 203
        Width = 734
        Height = 124
        Align = alClient
        Color = clMenu
        DataSource = datm_instrucao_embarque.ds_frete_despesa
        ReadOnly = True
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
            FieldName = 'NM_ITEM'
            Title.Caption = 'Descri'#231#227'o'
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
            FieldName = 'NM_MOEDA'
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
            FieldName = 'NM_BASE_CALC'
            Title.Caption = 'Tipo Base'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_VENDA'
            Title.Caption = 'Valor Venda'
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
            FieldName = 'NM_MENCIONADO'
            Title.Caption = 'Mencionado no House/Awb'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 175
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
            Visible = False
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 96
        Align = alTop
        Caption = 'Panel2'
        TabOrder = 0
        DesignSize = (
          734
          96)
        object dbgrid_carga: TDBGrid
          Left = 1
          Top = 1
          Width = 732
          Height = 94
          Align = alClient
          DataSource = datm_instrucao_embarque.ds_instrucao_fcl
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
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_COMPR'
              Title.Caption = 'Comprimento'
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
              FieldName = 'VL_LARG'
              Title.Caption = 'Largura'
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
              FieldName = 'VL_ALT'
              Title.Caption = 'Altura'
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
              FieldName = 'PESO_KG'
              Title.Caption = 'Peso Bruto {Kg}'
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
              FieldName = 'CUBAGEM_VENDA'
              ReadOnly = True
              Title.Caption = 'Const. Cubagem'
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
              FieldName = 'PESO_VOLUMETRICO'
              Title.Caption = 'Peso Volum'#233'trico'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 108
              Visible = True
            end>
        end
        object dbedcheck_in_cubagem: TDBCheckBox
          Left = 611
          Top = 3
          Width = 121
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Cubagem Padr'#227'o'
          DataField = 'IN_CUBAGEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_exportadorChange
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 96
        Width = 734
        Height = 94
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label3: TLabel
          Left = 16
          Top = 9
          Width = 61
          Height = 13
          Caption = 'Total Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 187
          Top = 9
          Width = 123
          Height = 13
          Caption = 'Total Peso Bruto (Kg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 365
          Top = 9
          Width = 132
          Height = 13
          Caption = 'Total Peso Volum'#233'trico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 558
          Top = 9
          Width = 65
          Height = 13
          Caption = 'Chargeable'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_tarifa_venda: TLabel
          Left = 365
          Top = 48
          Width = 92
          Height = 13
          Caption = 'Tarifa de Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_tt_frete: TLabel
          Left = 557
          Top = 50
          Width = 81
          Height = 13
          Caption = 'Total do Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 366
          Top = 22
          Width = 134
          Height = 21
          Color = clMenu
          DataField = 'CUBAGEM'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 559
          Top = 22
          Width = 134
          Height = 21
          Color = clMenu
          DataField = 'CHARGEABLE'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 17
          Top = 22
          Width = 122
          Height = 21
          Color = clMenu
          DataField = 'QTD_VOLUME'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 188
          Top = 22
          Width = 129
          Height = 21
          Color = clMenu
          DataField = 'VL_PESO_BRUTO'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_tarifa_venda: TDBEdit
          Left = 366
          Top = 61
          Width = 134
          Height = 21
          Color = clMenu
          DataField = 'VL_TARIFA_FRETE'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_tt_frete: TDBEdit
          Left = 558
          Top = 63
          Width = 134
          Height = 21
          Color = clMenu
          DataField = 'VL_FRETE'
          DataSource = datm_instrucao_embarque.ds_processo
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object ts_volumes: TTabSheet
      Caption = 'Dimens'#245'es da Carga'
      ImageIndex = 3
      object Label22: TLabel
        Left = 0
        Top = 329
        Width = 734
        Height = 13
        Align = alBottom
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnl_lcl: TPanel
        Left = 0
        Top = 53
        Width = 734
        Height = 276
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object dbgrid_lcl: TDBGrid
          Left = 0
          Top = 0
          Width = 734
          Height = 216
          Hint = 
            '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
            's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
          Align = alClient
          DataSource = datm_instrucao_embarque.ds_instrucao_lcl
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColExit = dbgrid_lclColExit
          OnDblClick = dbgrid_lclDblClick
          OnEnter = dbgrid_fclEnter
          OnExit = dbgrid_lclExit
          OnKeyDown = dbgrid_lclKeyDown
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TP_EMBALAGEM'
              Title.Caption = 'C'#243'd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 37
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'calcEMBALAGEM'
              Title.Caption = 'Tipo da Embalagem'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 224
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 78
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_TON'
              Title.Caption = 'Peso Bruto (TON)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 148
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_VOLUMETRICO'
              Title.Caption = 'Cubagem (M3)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end>
        end
        object pnl1: TPanel
          Left = 0
          Top = 216
          Width = 734
          Height = 60
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 1
          object lbl1: TLabel
            Left = 122
            Top = 12
            Width = 130
            Height = 13
            Caption = 'Total Peso Bruto (Ton)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl2: TLabel
            Left = 13
            Top = 12
            Width = 61
            Height = 13
            Caption = 'Total Qtde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl3: TLabel
            Left = 258
            Top = 12
            Width = 132
            Height = 13
            Caption = 'Total Peso Volum'#233'trico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_tarifa_lcl: TLabel
            Left = 402
            Top = 12
            Width = 92
            Height = 13
            Caption = 'Tarifa de Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_frete_lcl: TLabel
            Left = 542
            Top = 12
            Width = 81
            Height = 13
            Caption = 'Total do Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt1: TDBEdit
            Left = 14
            Top = 25
            Width = 88
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'QTD_VOLUME'
            DataSource = datm_instrucao_embarque.ds_processo
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt2: TDBEdit
            Left = 123
            Top = 25
            Width = 116
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_PESO_BRUTO'
            DataSource = datm_instrucao_embarque.ds_processo
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt3: TDBEdit
            Left = 260
            Top = 25
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CUBAGEM'
            DataSource = datm_instrucao_embarque.ds_processo
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_venda_lcl: TDBEdit
            Left = 403
            Top = 25
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_TARIFA_FRETE'
            DataSource = datm_instrucao_embarque.ds_processo
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_frete_lcl: TDBEdit
            Left = 543
            Top = 25
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_FRETE'
            DataSource = datm_instrucao_embarque.ds_processo
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
      object pnl_fcl: TPanel
        Left = 0
        Top = 53
        Width = 734
        Height = 276
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel7: TPanel
          Left = 0
          Top = 222
          Width = 734
          Height = 54
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 1
          object Label27: TLabel
            Left = 101
            Top = 10
            Width = 130
            Height = 13
            Caption = 'Total Peso Bruto (Ton)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 8
            Top = 10
            Width = 61
            Height = 13
            Caption = 'Total Qtde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 248
            Top = 10
            Width = 132
            Height = 13
            Caption = 'Total Peso Volum'#233'trico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lb_tarifa_fcl: TLabel
            Left = 399
            Top = 10
            Width = 92
            Height = 13
            Caption = 'Tarifa de Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lb_frete_fcl: TLabel
            Left = 528
            Top = 10
            Width = 81
            Height = 13
            Caption = 'Total do Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit18: TDBEdit
            Left = 10
            Top = 23
            Width = 83
            Height = 21
            Color = clMenu
            DataField = 'QTD_VOLUME'
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit19: TDBEdit
            Left = 103
            Top = 23
            Width = 139
            Height = 21
            Color = clMenu
            DataField = 'VL_PESO_BRUTO'
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit20: TDBEdit
            Left = 250
            Top = 23
            Width = 144
            Height = 21
            Color = clMenu
            DataField = 'CUBAGEM'
            ReadOnly = True
            TabOrder = 2
            Visible = False
          end
          object dbedt_venda_fcl: TDBEdit
            Left = 401
            Top = 23
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'VL_TARIFA_FRETE'
            ReadOnly = True
            TabOrder = 3
            Visible = False
          end
          object dbedt_frete_fcl: TDBEdit
            Left = 530
            Top = 23
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'VL_FRETE'
            ReadOnly = True
            TabOrder = 4
          end
        end
        object dbgrid_fcl: TDBGrid
          Left = 0
          Top = 0
          Width = 734
          Height = 222
          Align = alClient
          DataSource = datm_instrucao_embarque.ds_instrucao_fcl
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColExit = dbgrid_fclColExit
          OnDblClick = dbgrid_fclDblClick
          OnEnter = dbgrid_fclEnter
          OnExit = dbgrid_fclExit
          OnKeyDown = dbgrid_fclKeyDown
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TP_CNTR'
              Title.Caption = 'C'#243'd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'calcCNTR'
              Title.Caption = 'Container'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 129
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_TON'
              Title.Caption = 'Peso Bruto (TON)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 136
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VL_VENDA'
              Title.Caption = 'Valor Venda'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 92
              Visible = True
            end>
        end
      end
      object DBMemo2: TDBMemo
        Left = 0
        Top = 342
        Width = 734
        Height = 87
        Align = alBottom
        DataField = 'TX_DESCR'
        DataSource = datm_instrucao_embarque.ds_processo
        TabOrder = 3
        OnChange = dbedt_cd_exportadorChange
        OnKeyDown = DBMemo2KeyDown
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 53
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object dbrgrpEstufagem: TDBRadioGroup
          Left = 527
          Top = 6
          Width = 200
          Height = 37
          Caption = 'Tipo de Estufagem'
          Columns = 2
          DataField = 'TP_ESTUFAGEM'
          DataSource = datm_instrucao_embarque.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'LCL'
            'FCL')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
          OnClick = dbrgrpEstufagemClick
          OnEnter = dbrgrpEstufagemEnter
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 1
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_prealerta: TMenuItem
      Caption = 'Imprimir/Envio Pr'#233'-alerta'
      Enabled = False
      OnClick = btn_prealertaClick
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
  object ppReport_instrucao: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\SIagente.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 62
    Top = 455
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 295011
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Pen.Width = 2
        mmHeight = 270934
        mmLeft = 0
        mmTop = 15875
        mmWidth = 197380
        BandType = 0
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 30000
        mmLeft = 0
        mmTop = 107156
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
        end
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
        mmHeight = 10054
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Attention to Mr/s.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4741
        mmLeft = 7938
        mmTop = 10319
        mmWidth = 34798
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'TO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5546
        mmLeft = 33073
        mmTop = 3175
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = ' SHIPPING INSTRUCTIONS - '
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 794
        mmTop = 16669
        mmWidth = 196057
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 22225
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Shipper/Exporter: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 23548
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Address: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 27781
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Cnee/Importer: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 39952
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Address: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 44186
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Commodity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 57944
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Incoterm '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 62177
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Container 20'#39
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 66411
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Container 40'#39' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 70644
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Weight/KG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 74877
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Dims/CBM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 79111
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Volume'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 83344
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'AGREED RATES:'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 529
        mmTop = 90223
        mmWidth = 196057
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 95779
        mmWidth = 196057
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 265
        mmTop = 89694
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4598
        mmLeft = 103981
        mmTop = 98690
        mmWidth = 20000
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Selling Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 125148
        mmTop = 98690
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = '   Buying Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4598
        mmLeft = 67733
        mmTop = 98690
        mmWidth = 35000
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4598
        mmLeft = 46831
        mmTop = 98690
        mmWidth = 20000
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Profit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 173832
        mmTop = 98954
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Shipping rates:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 800
        mmTop = 102923
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Expenses abroad:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 380
        mmTop = 137584
        mmWidth = 42863
        BandType = 0
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 29898
        mmLeft = 0
        mmTop = 141817
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 29898
        mmLeft = 0
        mmTop = 190500
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
        end
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'AGREED RATES:'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 529
        mmTop = 173567
        mmWidth = 196057
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 179123
        mmWidth = 196057
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 173038
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 104775
        mmTop = 182034
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'Selling Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 125942
        mmTop = 182034
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = '   Buying Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 68527
        mmTop = 182034
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 47625
        mmTop = 182034
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Profit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 174625
        mmTop = 182298
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Shipping rates:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 186267
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Expenses abroad:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 220928
        mmWidth = 42863
        BandType = 0
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 29898
        mmLeft = 0
        mmTop = 225161
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
        end
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 255853
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'Remarks:'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 529
        mmTop = 256382
        mmWidth = 196057
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 261938
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Customer PO#'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 262996
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'ETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 279930
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'ETS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 275696
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Vessel/Voy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 271463
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Pick Up Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 267230
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'SI prepared by:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 287073
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Date: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 118534
        mmTop = 287073
        mmWidth = 42863
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
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
    Report = ppReport_instrucao
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 26
    Top = 456
  end
end
