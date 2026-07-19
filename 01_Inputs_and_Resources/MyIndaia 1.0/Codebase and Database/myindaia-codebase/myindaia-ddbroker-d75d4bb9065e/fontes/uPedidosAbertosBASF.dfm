object frmPedidosAbertosBASF: TfrmPedidosAbertosBASF
  Left = 296
  Top = 355
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Integra'#231#227'o - Planilha "Chegada de Navios"'
  ClientHeight = 101
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  Menu = mmAtalho
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 56
    Width = 367
    Height = 13
    Caption = 
      'Escolha o arquivo a ser integrado (ex.: c:\planilha\planilha.xls' +
      '):'
  end
  object btnDialog: TSpeedButton
    Left = 711
    Top = 72
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
    OnClick = btnDialogClick
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      43)
    object ggProgresso: TGauge
      Left = 103
      Top = 6
      Width = 279
      Height = 28
      ForeColor = clAqua
      Progress = 0
      ShowText = False
      Visible = False
    end
    object lblSimbolo: TLabel
      Left = 105
      Top = 6
      Width = 275
      Height = 30
      Caption = '6         6'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clTeal
      Font.Height = -27
      Font.Name = 'Wingdings'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object btnIntegra: TSpeedButton
      Left = 4
      Top = 2
      Width = 93
      Height = 39
      Hint = 'Integra Planilha'
      Caption = '&Integrar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btnIntegraClick
    end
    object btnSair: TSpeedButton
      Left = 700
      Top = 2
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
      OnClick = btnSairClick
    end
    object lblAviso: TLabel
      Left = 138
      Top = 12
      Width = 209
      Height = 16
      Caption = 'Integrando arquivo ... Aguarde!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
  end
  object edtPath: TEdit
    Left = 8
    Top = 73
    Width = 697
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object mmAtalho: TMainMenu
    Left = 552
    Top = 40
    object Integrar1: TMenuItem
      Caption = '&Integrar'
      Visible = False
      OnClick = btnIntegraClick
    end
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '.xls'
    Filter = 'Planinas do Excel|*.xls;*.xlsx|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 592
    Top = 40
  end
  object dsProcura: TDataSource
    DataSet = qryProcura
    Left = 464
    Top = 40
  end
  object qryProcura: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT (SELECT UN.AP_UNID_NEG'
      #9#9'FROM TUNID_NEG UN (NOLOCK)'
      
        #9#9'WHERE UN.CD_UNID_NEG = SUBSTRING(RC.NR_PROCESSO, 1,2)) AS UNID' +
        'ADE,'
      '       (SELECT PR.NM_PRODUTO'
      #9#9'FROM TPRODUTO PR (NOLOCK)'
      
        #9#9'WHERE PR.CD_PRODUTO   = SUBSTRING(RC.NR_PROCESSO, 3,2)) AS PRO' +
        'DUTO,'
      '       SUBSTRING(RC.NR_PROCESSO,5,14) AS PROCESSO,'
      #9'   (SELECT DT_REALIZACAO'
      #9#9'FROM TFOLLOWUP F (NOLOCK)'
      #9#9'WHERE F.NR_PROCESSO = RC.NR_PROCESSO'
      #9#9'  AND F.CD_EVENTO = '#39'215'#39') AS REALIZACAO_BL'
      'FROM TREF_CLIENTE RC(NOLOCK)'
      'WHERE RC.CD_REFERENCIA = :REFERENCIA'
      '  AND RC.NR_ITEM_PO = :ITEMPO')
    Left = 496
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ITEMPO'
        ParamType = ptInput
      end>
    object qryProcuraUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 10
    end
    object qryProcuraPRODUTO: TStringField
      FieldName = 'PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qryProcuraPROCESSO: TStringField
      FieldName = 'PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qryProcuraREALIZACAO_BL: TDateTimeField
      FieldName = 'REALIZACAO_BL'
    end
  end
end
