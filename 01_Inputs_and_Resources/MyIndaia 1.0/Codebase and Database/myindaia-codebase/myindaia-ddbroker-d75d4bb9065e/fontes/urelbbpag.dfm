object frm_RelBBPag: Tfrm_RelBBPag
  Left = 391
  Top = 318
  Width = 390
  Height = 279
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rios BBPAG'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 252
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      382
      252)
    object Shape1: TShape
      Left = 8
      Top = 40
      Width = 361
      Height = 167
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_cd_cliente: TLabel
      Left = 16
      Top = 96
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
    object lbl_cd_unid_neg: TLabel
      Left = 16
      Top = 48
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
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 378
      Height = 248
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      DesignSize = (
        378
        248)
      object Shape3: TShape
        Left = 8
        Top = 10
        Width = 361
        Height = 29
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 8
        Top = 40
        Width = 361
        Height = 174
        Anchors = [akLeft, akTop, akBottom]
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label1: TLabel
        Left = 107
        Top = 180
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
      object Label5: TLabel
        Left = 18
        Top = 160
        Width = 120
        Height = 13
        Caption = 'Selecione o per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUnidNeg: TLabel
        Left = 18
        Top = 46
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
      object lblTitulo: TLabel
        Left = 15
        Top = 18
        Width = 73
        Height = 16
        Caption = 'Relat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblTipo: TLabel
        Left = 191
        Top = 120
        Width = 99
        Height = 13
        Caption = 'Tipo de Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnGerar: TSpeedButton
        Left = 288
        Top = 217
        Width = 81
        Height = 26
        Hint = 'Planilha do Excel'
        Caption = 'Gerar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FF407050
          4070503070403070403070403068403068403068402060302060302060302050
          30205030205030FF00FF40705070A88060A07060A07060987060987050987050
          987050906050906050906040905040905030905030905020503040785070A880
          F0F0F0F0F0F0E0F0E0E0F0E0E0F0E0E0F0E0E0E8E0E0E8E0E0E8E0E0E8E0E0E8
          E0E0E8E030905020503040785070A880F0F8F0F0F0F0F0F0F0E0F0E0E0F0E0E0
          F0E0E0F0E0E0E8E0E0E8E0E0E8E0E0E8E0E0E8E040905020503040806070B080
          F0F8F0F0F8F0F0F0F0F0F0F0F0F0F0E0F0E080A8903050303050303050303050
          30E0E8E040905020503050886080B890F0F8F050A86030503030503030503030
          503020782070B870509060509850206030E0E8E050906020603050906080C090
          F0F8F0F0F8F050A86060B07050A86020782080C08050906050985020603080A8
          90E0E8E050906020603050987090B890F0F8F0F0F8F0F0F8F050A86030883080
          C090509060509850206030609860609860E0F0E050906020603060987090C8A0
          FFF8FFF0F8F0F0F8F030883090C8A060A86050A860307040006800E0F0E0E0F0
          E0E0F0E050987030684060A07090C8A0FFFFFFFFF8FF409040A0D0A070B87060
          A86040885050A860308830006800E0F0E0E0F0E050987030684070A880A0D0A0
          FFFFFF509850B0D8B070B88070B88050906050806060B07050A8603088300068
          00E0F0E060987030704070A880A0D0A0FFFFFF60B07060B07060B070509860F0
          F8F0F0F8F0508060508060508060508060F0F0F060987030704070B080B0D8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFF8FFF0F8F0F0F8F0F0F8F0F0F8F0F0F8
          F0F0F0F060A07040705080B890B0D8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F8FFFFF8FFF0F8F0F0F8F0F0F8F0F0F8F0F0F8F060A07040705080B890B0D8B0
          B0D8B0A0D0A0A0D0A090C8A090C8A090C8A090B89080C09080B89070B08070A8
          8070A88070A880407050FF00FF80B89070B08070A88070A88060A07060987050
          9870509060508860508860408060407850407850407050FF00FF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnGerarClick
      end
      object lblGrupo: TLabel
        Left = 18
        Top = 81
        Width = 35
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo: TSpeedButton
        Left = 336
        Top = 93
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
        OnClick = btn_co_grupoClick
      end
      object btn_co_unid_neg: TSpeedButton
        Left = 336
        Top = 60
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
        OnClick = btn_co_unid_negClick
      end
      object Label2: TLabel
        Left = 18
        Top = 120
        Width = 91
        Height = 13
        Caption = 'Tipo de Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_nm_unid_neg: TEdit
        Left = 60
        Top = 59
        Width = 275
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 6
      end
      object msk_dt_inicio: TDateTimePicker
        Left = 19
        Top = 174
        Width = 82
        Height = 21
        Date = 39814.000000000000000000
        Time = 39814.000000000000000000
        TabOrder = 4
      end
      object msk_dt_fim: TDateTimePicker
        Left = 121
        Top = 176
        Width = 84
        Height = 21
        Date = 40178.000000000000000000
        Time = 40178.000000000000000000
        TabOrder = 5
      end
      object cbTipo: TComboBox
        Left = 192
        Top = 136
        Width = 169
        Height = 21
        BevelInner = bvLowered
        BevelKind = bkFlat
        BiDiMode = bdLeftToRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 3
        OnChange = cbTipoChange
        Items.Strings = (
          'Numer'#225'rios'
          'Pagamentos')
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 19
        Top = 59
        Width = 40
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
        OnExit = btn_co_unid_negClick
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_grupo: TMaskEdit
        Left = 19
        Top = 94
        Width = 38
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 1
        OnExit = btn_co_grupoClick
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_grupo: TEdit
        Left = 60
        Top = 94
        Width = 275
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 7
      end
      object cbTipoDetino: TComboBox
        Left = 19
        Top = 136
        Width = 166
        Height = 21
        BevelInner = bvLowered
        BevelKind = bkFlat
        BiDiMode = bdLeftToRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ItemIndex = 0
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        Text = 'Todos'
        OnChange = cbTipoChange
        Items.Strings = (
          'Todos'
          'Terceiros'
          'D'#233'bito em Conta'
          'Comiss'#225'ria'
          'D'#233'b Conta Com.'
          'Contas a Pagar'
          'Border'#244)
      end
    end
  end
  object sp_loop_campo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_loop_campo'
    Left = 34
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@CAMPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@WHERE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@RETORNO'
        ParamType = ptOutput
      end>
  end
end
