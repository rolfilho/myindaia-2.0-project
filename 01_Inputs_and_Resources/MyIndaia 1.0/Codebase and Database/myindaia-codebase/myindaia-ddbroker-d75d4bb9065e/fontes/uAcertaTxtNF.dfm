object frmAcertaTxtNF: TfrmAcertaTxtNF
  Left = 245
  Top = 165
  BorderStyle = bsSingle
  Caption = 'Envia arquivos de Nota Fiscal (DDNota - Layout 4)'
  ClientHeight = 279
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 0
    Top = 232
    Width = 407
    Height = 43
    Align = alTop
    Brush.Style = bsClear
    Pen.Color = clGray
  end
  object shp2: TShape
    Left = 0
    Top = 0
    Width = 407
    Height = 225
    Align = alTop
    Brush.Style = bsClear
    Pen.Color = clGray
  end
  object btnExecuta: TSpeedButton
    Left = 203
    Top = 236
    Width = 116
    Height = 33
    Caption = 'Gera Arquivos'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
    ParentFont = False
    OnClick = btnExecutaClick
  end
  object lbl2: TLabel
    Left = 5
    Top = 7
    Width = 357
    Height = 13
    Caption = 'Escolha o diret'#243'rio onde se encontram os arquivos desejados :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnEnviar: TSpeedButton
    Left = 326
    Top = 236
    Width = 75
    Height = 33
    Caption = 'Enviar'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
      000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
      FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
      FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
      9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
      0000777777777777777733333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = btnEnviarClick
  end
  object lbl4: TLabel
    Left = 7
    Top = 76
    Width = 185
    Height = 13
    Caption = 'Resultados (Arquivos alterados):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 6
    Top = 51
    Width = 327
    Height = 13
    Caption = 
      'Obs: ser'#227'o alterados todos os arquivos txt'#180's que constam no dire' +
      't'#243'rio.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object bvl1: TBevel
    Left = 0
    Top = 225
    Width = 407
    Height = 7
    Align = alTop
    Shape = bsSpacer
  end
  object DirectoryEdit1: TDirectoryEdit
    Left = 6
    Top = 25
    Width = 391
    Height = 21
    DialogKind = dkWin32
    InitialDir = 'c:\DDBroker\'
    Ctl3D = False
    NumGlyphs = 1
    ParentCtl3D = False
    TabOrder = 0
  end
  object lstAlterados: TListBox
    Left = 8
    Top = 90
    Width = 386
    Height = 127
    TabStop = False
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
  end
  object fllstNF: TFileListBox
    Left = 20
    Top = 109
    Width = 145
    Height = 97
    ItemHeight = 13
    Mask = '*.txt'
    TabOrder = 2
    Visible = False
  end
  object Memo1: TMemo
    Left = 74
    Top = 124
    Width = 321
    Height = 89
    TabOrder = 3
    Visible = False
  end
end
