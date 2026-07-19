object FrameDetail: TFrameDetail
  Left = 0
  Top = 0
  Width = 350
  Height = 157
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 350
    Height = 157
    ActivePage = tshGrid
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tshGrid: TTabSheet
      Caption = 'Grid'
      object Panel2: TPanel
        Left = 251
        Top = 0
        Width = 91
        Height = 128
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          91
          128)
        object btnIncluir: TButton
          Left = 8
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Incluir'
          Default = True
          TabOrder = 0
        end
        object btnAlterar: TButton
          Left = 8
          Top = 34
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Alterar'
          TabOrder = 1
        end
        object btnConsultar: TButton
          Left = 8
          Top = 65
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Consultar'
          TabOrder = 2
        end
        object btnExcluir: TButton
          Left = 8
          Top = 97
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Excluir'
          TabOrder = 3
        end
      end
      object pnlGrid: TPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 128
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object dbgMain: TDBGrid
          Left = 0
          Top = 0
          Width = 251
          Height = 128
          Align = alClient
          BorderStyle = bsNone
          DataSource = dtsMain
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
    object tshEdit: TTabSheet
      Caption = 'Edit'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 251
        Top = 0
        Width = 91
        Height = 128
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          91
          128)
        object btnCancelar: TButton
          Left = 8
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Cancelar'
          TabOrder = 0
        end
        object btnSalvar: TButton
          Left = 8
          Top = 34
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Salvar'
          Default = True
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 128
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 129
      end
    end
  end
  object dtsMain: TDataSource
    AutoEdit = False
    DataSet = adsMain
    Left = 175
    Top = 101
  end
  object adsMain: TAureliusDataset
    FieldDefs = <>
    Left = 223
    Top = 101
  end
end
