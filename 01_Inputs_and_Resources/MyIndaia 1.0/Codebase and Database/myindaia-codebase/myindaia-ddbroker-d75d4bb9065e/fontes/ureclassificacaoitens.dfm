object frm_reclassificacao_itens: Tfrm_reclassificacao_itens
  Left = 327
  Top = 291
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frm_reclassificacao_itens'
  ClientHeight = 84
  ClientWidth = 309
  Color = clHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 309
    Height = 84
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clWhite
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 305
      Height = 80
      Align = alClient
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 0
      object Panel2: TPanel
        Left = 15
        Top = 14
        Width = 277
        Height = 54
        BevelInner = bvLowered
        Caption = '          Classificando os Itens da DI'
        Color = clScrollBar
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        object Bevel1: TBevel
          Left = 9
          Top = 9
          Width = 41
          Height = 37
          Shape = bsFrame
        end
        object Label1: TLabel
          Left = 19
          Top = 9
          Width = 19
          Height = 36
          Caption = '6'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -32
          Font.Name = 'Wingdings'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
    end
  end
  object sp_reclassificacao_itens: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_reclassificacao_itens'
    Left = 269
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end>
  end
end
