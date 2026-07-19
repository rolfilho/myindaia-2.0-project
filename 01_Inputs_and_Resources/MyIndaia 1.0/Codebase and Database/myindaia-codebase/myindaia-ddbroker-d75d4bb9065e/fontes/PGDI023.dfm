object frm_icms_online: Tfrm_icms_online
  Left = 289
  Top = 153
  Width = 750
  Height = 592
  Caption = 'ICMS OnLine'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mi_icms
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 56
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lbl_cd_unid_neg: TLabel
      Left = 11
      Top = 11
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 164
      Top = 24
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
    object Label4: TLabel
      Left = 198
      Top = 11
      Width = 109
      Height = 13
      Caption = 'Tipo de  Impress'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 649
      Top = 11
      Width = 56
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object edt_nm_unid_neg: TEdit
      Left = 39
      Top = 24
      Width = 124
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 1
    end
    object combo_tipo_icms: TComboBox
      Left = 199
      Top = 24
      Width = 140
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnExit = combo_tipo_icmsExit
      Items.Strings = (
        'Pagamento - GARE'
        'Pagamento - GNRE'
        'Exonera'#231#227'o'
        'CAT63')
    end
    object edt_chave: TEdit
      Left = 649
      Top = 24
      Width = 64
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      Visible = False
      OnExit = edt_chaveExit
    end
    object pnl_desp: TPanel
      Left = 438
      Top = 9
      Width = 185
      Height = 38
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      object Label5: TLabel
        Left = 4
        Top = 1
        Width = 76
        Height = 13
        Caption = 'Despachante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_desp: TSpeedButton
        Left = 156
        Top = 15
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
        OnClick = btn_co_despClick
      end
      object msk_nm_desp: TEdit
        Left = 39
        Top = 15
        Width = 116
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object msk_cd_desp: TMaskEdit
        Left = 5
        Top = 15
        Width = 35
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        OnExit = msk_cd_despExit
      end
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 11
      Top = 24
      Width = 29
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
    end
    object ckbInSemAdicao: TCheckBox
      Left = 344
      Top = 28
      Width = 97
      Height = 17
      Caption = 'Sem DI (local)'
      TabOrder = 5
      OnClick = ckbInSemAdicaoClick
    end
  end
  object PnlBotoes: TPanel
    Left = 0
    Top = 470
    Width = 734
    Height = 63
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 1
    DesignSize = (
      734
      63)
    object lbl_data_venc: TLabel
      Left = 105
      Top = 14
      Width = 72
      Height = 13
      Caption = 'Data Vencto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_data_base: TLabel
      Left = 15
      Top = 14
      Width = 60
      Height = 13
      Caption = 'Data Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_Imprimir: TSpeedButton
      Left = 512
      Top = 17
      Width = 107
      Height = 30
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_imprimirClick
    end
    object btn_sair: TBitBtn
      Left = 619
      Top = 17
      Width = 107
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Sai&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn_sairClick
    end
    object msk_data_base: TDateTimePicker
      Left = 15
      Top = 27
      Width = 85
      Height = 21
      Date = 37434.000000000000000000
      Time = 37434.000000000000000000
      TabOrder = 0
      OnExit = msk_data_baseExit
    end
    object msk_vencimento: TDateTimePicker
      Left = 105
      Top = 27
      Width = 85
      Height = 21
      Date = 37434.000000000000000000
      Time = 37434.000000000000000000
      TabOrder = 1
      OnExit = msk_data_baseExit
    end
    object BtnGerar: TBitBtn
      Left = 404
      Top = 17
      Width = 107
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '&Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupGerar
      TabOrder = 3
      Visible = False
      OnClick = BtnGerarClick
    end
  end
  object NB: TNotebook
    Left = 0
    Top = 56
    Width = 734
    Height = 414
    Align = alClient
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 414
        Align = alClient
        BorderWidth = 4
        TabOrder = 0
        DesignSize = (
          734
          414)
        object DBGrid1: TDBGrid
          Left = 5
          Top = 5
          Width = 724
          Height = 404
          Align = alClient
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Status'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Processo'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Importador'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Despesas'
              Title.Caption = 'Despesas ?'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object DBGrid2: TDBGrid
          Left = 5
          Top = 5
          Width = 724
          Height = 404
          Align = alClient
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Status'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Processo'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Despesas'
              Title.Caption = 'Despesas ?'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object DBGrid3: TDBGrid
          Left = 5
          Top = 5
          Width = 724
          Height = 404
          Align = alClient
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Status'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Processo'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Despesas'
              Title.Caption = 'Despesas ?'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object dbgrd_icms: TDBGrid
          Left = 5
          Top = 5
          Width = 724
          Height = 404
          Align = alClient
          Ctl3D = False
          DataSource = datm_icms_online.ds_lista_processos
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgrd_icmsDblClick
          Columns = <
            item
              Alignment = taCenter
              Color = clInfoBk
              Expanded = False
              FieldName = 'calc_STATUS'
              Font.Charset = SYMBOL_CHARSET
              Font.Color = clGreen
              Font.Height = -15
              Font.Name = 'Wingdings'
              Font.Style = []
              ReadOnly = True
              Title.Caption = 'Status'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_NR_PROCESSO'
              Title.Caption = 'Processo'
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
              FieldName = 'AP_EMPRESA'
              Title.Caption = 'Importador'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF_CLIENTE'
              Title.Caption = 'UF'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_IMPRESSAO'
              Title.Caption = 'Dt. Impress'#227'o'
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
              FieldName = 'VL_BASE_CALC_ICMS'
              Title.Caption = 'Base C'#225'lculo'
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
              FieldName = 'VL_ICMS_A_RECOLHER'
              Title.Caption = 'Valor ICMS'
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
        object pnl_hint: TPanel
          Left = 3
          Top = 388
          Width = 400
          Height = 34
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          TabOrder = 0
          object shp_hint: TShape
            Left = 2
            Top = 6
            Width = 370
            Height = 25
            Brush.Color = clInfoBk
          end
          object lbl_hint: TLabel
            Left = 24
            Top = 13
            Width = 334
            Height = 13
            Caption = 
              '- Emitidos              - Selecionados      (duplo-clique para a' +
              'lterar o status)'
            Transparent = True
          end
          object lbl_emitidos: TLabel
            Left = 8
            Top = 9
            Width = 104
            Height = 21
            Caption = '2    '#252
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clGreen
            Font.Height = -19
            Font.Name = 'Wingdings'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object btn_encolhe: TSpeedButton
            Left = 378
            Top = 2
            Width = 20
            Height = 30
            Caption = '<<'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btn_encolheClick
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'CAT63'
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 385
        Align = alClient
        BorderWidth = 4
        TabOrder = 0
        object Panel5: TPanel
          Left = 5
          Top = 190
          Width = 732
          Height = 190
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Shape2: TShape
            Left = 0
            Top = 0
            Width = 732
            Height = 23
            Align = alTop
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object Label3: TLabel
            Left = 5
            Top = 7
            Width = 75
            Height = 13
            Caption = 'ICMS OnLine'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object DBGrid5: TDBGrid
            Left = 0
            Top = 24
            Width = 732
            Height = 166
            Align = alClient
            Ctl3D = False
            DataSource = datm_icms_online.ds_processos_cat63_icms
            ParentCtl3D = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGrid5DblClick
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'calc_status'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clGreen
                Font.Height = -15
                Font.Name = 'Wingdings'
                Font.Style = []
                Title.Color = clBlack
                Width = 27
                Visible = True
              end
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
                Width = 83
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AP_EMPRESA'
                Title.Caption = 'Importador'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 321
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'END_UF'
                Title.Caption = 'UF'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_CALC_ICMS'
                Title.Caption = 'Base de Calculo do ICMS'
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
                FieldName = 'VALOR_ICMS'
                Title.Caption = 'Valor ICMS'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 85
                Visible = True
              end>
          end
          object Panel8: TPanel
            Left = 0
            Top = 23
            Width = 732
            Height = 1
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
        object Panel6: TPanel
          Left = 5
          Top = 5
          Width = 732
          Height = 185
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 732
            Height = 23
            Align = alTop
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object Label2: TLabel
            Left = 5
            Top = 7
            Width = 112
            Height = 13
            Caption = 'Exonera'#231#227'o OnLine'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object DBGrid4: TDBGrid
            Left = 0
            Top = 24
            Width = 732
            Height = 158
            Align = alClient
            Ctl3D = False
            DataSource = datm_icms_online.ds_processos_cat63_exoneracao
            ParentCtl3D = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGrid4DblClick
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'calc_status'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clGreen
                Font.Height = -15
                Font.Name = 'Wingdings'
                Font.Style = []
                Title.Color = clBlack
                Width = 26
                Visible = True
              end
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
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AP_EMPRESA'
                Title.Caption = 'Importador'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 321
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'END_UF'
                Title.Caption = 'UF'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_CALC_ICMS'
                Title.Caption = 'Base de Calculo do ICMS'
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
                FieldName = 'VALOR_ICMS'
                Title.Caption = 'Valor ICMS'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 85
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 23
            Width = 732
            Height = 1
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel9: TPanel
            Left = 0
            Top = 182
            Width = 732
            Height = 3
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
      end
    end
  end
  object mi_icms: TMainMenu
    Left = 518
    Top = 194
    object mi_imprimir: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object crp_darj: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = True
    WindowState = wsMaximized
    LoadEngineOnUse = True
    Left = 408
    Top = 272
  end
  object PopupGerar: TPopupMenu
    Left = 450
    Top = 159
    object mnuICMSImportacao: TMenuItem
      Caption = 'ICMS Importa'#231#227'o'
      OnClick = mnuFundodeCombateClick
    end
    object mnuFundodeCombate: TMenuItem
      Caption = 'Fundo de Combate a pobreza e desigualdades sociais'
      OnClick = mnuFundodeCombateClick
    end
  end
end
