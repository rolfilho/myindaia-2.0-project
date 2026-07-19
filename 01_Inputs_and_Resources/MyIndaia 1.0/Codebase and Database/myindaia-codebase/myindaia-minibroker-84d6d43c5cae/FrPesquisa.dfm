inherited formMyPesquisa: TformMyPesquisa
  Caption = 'Pesquisa'
  ClientHeight = 373
  ClientWidth = 759
  ExplicitWidth = 765
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Top = 332
    Width = 759
    ExplicitTop = 332
    ExplicitWidth = 759
    inherited btnCancela: TSpeedButton
      Left = 583
      ExplicitLeft = 444
    end
    inherited btnOk: TButton
      Left = 671
      ExplicitLeft = 671
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 272
      Top = 4
      Width = 55
      Height = 16
      Caption = 'Pesquisa:'
    end
    object Label2: TLabel
      Left = 128
      Top = 4
      Width = 83
      Height = 16
      Caption = 'Pesquisar por:'
    end
    object Label3: TLabel
      Left = 8
      Top = 4
      Width = 96
      Height = 16
      Caption = 'Forma Pesquisa:'
    end
    object btnPesquisar: TButton
      Left = 593
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      Default = True
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object edtPesquisa: TEdit
      Left = 272
      Top = 20
      Width = 315
      Height = 24
      TabOrder = 0
    end
    object cboPesquisa: TComboBox
      Left = 128
      Top = 20
      Width = 114
      Height = 22
      Cursor = crDrag
      Style = csOwnerDrawFixed
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 2
      OnDrawItem = cboPesquisaDrawItem
    end
    object cbxTipoPesquisa: TComboBox
      Left = 8
      Top = 20
      Width = 105
      Height = 24
      ItemIndex = 0
      TabOrder = 3
      Text = 'Aproximada'
      Items.Strings = (
        'Aproximada'
        'Exata')
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 42
    Width = 759
    Height = 290
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 8
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 743
      Height = 274
      Align = alClient
      DataSource = dsMain
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dsMain: TDataSource
    DataSet = adsMain
    Left = 296
    Top = 184
  end
  object adsMain: TAureliusDataset
    FieldDefs = <>
    Left = 344
    Top = 184
  end
end
