object frmExpIntegraRAP_Normas: TfrmExpIntegraRAP_Normas
  Left = 306
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecione um Acordo / Norma para esta Mercadoria'
  ClientHeight = 258
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_mercadoria: TLabel
    Left = 0
    Top = 19
    Width = 629
    Height = 21
    Align = alTop
    AutoSize = False
    Caption = 'lbl_mercadoria'
    Color = 14548991
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlBottom
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 629
    Height = 19
    Align = alTop
    AutoSize = False
    Caption = '  Mercadoria:'
    Color = 14548991
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlBottom
  end
  object label12: TLabel
    Left = 1
    Top = 218
    Width = 156
    Height = 26
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Processando Mercadoria: '
    Color = 15791607
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object lProcessando: TLabel
    Left = 157
    Top = 217
    Width = 66
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = '0 / 0'
    Color = 15791607
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object btn_outros: TSpeedButton
    Left = 306
    Top = 232
    Width = 23
    Height = 22
    Cursor = crHandPoint
    Hint = 'ver outros acordos/normas'#13#10'   para esta mercadoria'
    Flat = True
    Glyph.Data = {
      76080000424DB608000000000000B60000002800000020000000100000000100
      2000000000000008000000000000000000001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00008080000080
      8000008080000080800000808000008080000080800000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000008080007F7F7F00FFFFFF000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080000080800000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000008080007F7F7F0000808000FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000000000000000FF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F00FFFFFF007F7F7F00FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000000000000000FF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F00008080007F7F7F000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000FF000000FF000000FF000000
      0000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000008080007F7F7F00FFFFFF0000808000008080007F7F
      7F00FFFFFF000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000FF000000FF000000FF000000
      0000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000008080007F7F7F000080800000808000008080007F7F
      7F0000808000FFFFFF0000808000008080000080800000808000008080000080
      80000080800000808000000000000000FF000000FF000000FF000000FF000000
      FF00000000000080800000808000008080000080800000808000008080000080
      800000808000008080007F7F7F00FFFFFF000080800000808000008080000080
      80007F7F7F00FFFFFF0000808000008080000080800000808000008080000080
      80000080800000808000000000000000FF000000FF000000FF000000FF000000
      FF00000000000080800000808000008080000080800000808000008080000080
      800000808000008080007F7F7F00008080000080800000808000008080000080
      80007F7F7F0000808000FFFFFF00008080000080800000808000008080000080
      800000808000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000808000008080000080800000808000008080000080
      8000008080007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000FFFF
      FF00FFFFFF007F7F7F00FFFFFF00008080000080800000808000008080000080
      800000808000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000808000008080000080800000808000008080000080
      8000008080007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F0000808000008080000080800000808000008080000080
      800000808000008080000080800000808000000000000000FF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F00FFFFFF007F7F7F00FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000000000000000FF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F00FFFFFF007F7F7F00FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000000000000000FF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F00FFFFFF007F7F7F00FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000000000000000FF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F00FFFFFF007F7F7F00FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000000000000000FF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F00FFFFFF007F7F7F00FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000008080007F7F7F007F7F7F007F7F7F000080
      8000008080000080800000808000008080000080800000808000}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btn_outrosClick
  end
  object lbl_mercadoria_idioma: TLabel
    Left = 0
    Top = 40
    Width = 629
    Height = 21
    Align = alTop
    AutoSize = False
    Caption = 'lbl_mercadoria_idioma'
    Color = 14548991
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 61
    Width = 629
    Height = 156
    Align = alTop
    Ctl3D = False
    DataSource = frmExpIntegraRAP.ds_acordos_normas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Color = clWhite
        Expanded = False
        FieldName = 'CD_ACORDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Acordo'
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
        Color = clWhite
        Expanded = False
        FieldName = 'Norma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 517
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 418
    Top = 218
    Width = 209
    Height = 34
    Cursor = crHandPoint
    Caption = 'Confirma a norma Selecionda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
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
  end
  object dbg_geral: TDBGrid
    Left = 0
    Top = 258
    Width = 629
    Height = 0
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ds_acordos_normas_geral
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cd_acordo'
        Title.Alignment = taCenter
        Title.Caption = 'ACORDO'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clYellow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cd_norma'
        Title.Alignment = taCenter
        Title.Caption = 'NORMA'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clYellow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_NORMA'
        Title.Caption = 'DESCRI'#199#195'O NORMA'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clYellow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 457
        Visible = True
      end>
  end
  object edt_cd_mercadoria: TEdit
    Left = 81
    Top = 4
    Width = 132
    Height = 17
    AutoSize = False
    Color = clWhite
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 3
  end
  object qry_acordos_normas_geral: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select distinct '
      'cd_acordo,cd_norma , n.NM_DESCRICAO NM_NORMA'
      'from tmerc_exp_acordo '
      'join tnormas n on cd_norma = n.CODIGO'
      'where cd_mercadoria = :CD_MERCADORIA')
    Left = 216
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_acordos_normas_geralcd_acordo: TStringField
      FieldName = 'cd_acordo'
      FixedChar = True
      Size = 10
    end
    object qry_acordos_normas_geralcd_norma: TStringField
      FieldName = 'cd_norma'
      FixedChar = True
      Size = 10
    end
    object qry_acordos_normas_geralNM_NORMA: TStringField
      FieldName = 'NM_NORMA'
      FixedChar = True
      Size = 200
    end
  end
  object ds_acordos_normas_geral: TDataSource
    DataSet = qry_acordos_normas_geral
    Left = 152
    Top = 120
  end
end
