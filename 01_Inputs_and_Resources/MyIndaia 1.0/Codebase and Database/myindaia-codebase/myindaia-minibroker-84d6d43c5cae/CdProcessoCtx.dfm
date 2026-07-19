inherited formMyCdProcessoCtx: TformMyCdProcessoCtx
  Caption = 'Pesquisar'
  ClientHeight = 232
  ClientWidth = 343
  ExplicitWidth = 349
  ExplicitHeight = 260
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Top = 196
    Width = 343
    Height = 36
    TabOrder = 1
    ExplicitTop = 196
    ExplicitWidth = 343
    ExplicitHeight = 36
    inherited btnCancela: TSpeedButton
      Left = 167
      Top = 3
      ExplicitLeft = 107
      ExplicitTop = 3
    end
    inherited btnOk: TButton
      Left = 255
      Top = 3
      Width = 73
      Default = True
      ExplicitLeft = 255
      ExplicitTop = 3
      ExplicitWidth = 73
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 196
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlUnidadeNegocio: TPanel
      Left = 0
      Top = 0
      Width = 343
      Height = 53
      Align = alTop
      TabOrder = 0
      inline FrameUnidadeNegocio: TFrameUnidadeNegocio
        Left = 8
        Top = 5
        Width = 307
        Height = 39
        AutoSize = True
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 5
        ExplicitWidth = 307
        ExplicitHeight = 39
        inherited Label1: TLabel
          Width = 113
          Height = 16
          ExplicitWidth = 113
          ExplicitHeight = 16
        end
        inherited edtCodigo: TEdit
          Height = 24
          ExplicitHeight = 24
        end
        inherited DBLookupComboBox: TDBLookupComboBox
          Left = 47
          Width = 260
          Height = 24
          ExplicitLeft = 47
          ExplicitWidth = 260
          ExplicitHeight = 24
        end
        inherited DataSource: TDataSource
          Left = 264
        end
        inherited adsUnidNegocio: TAureliusDataset
          Left = 288
          DesignClass = 'MyEntitiesBroker.TTunidNeg'
        end
      end
    end
    object pnlProduto: TPanel
      Left = 0
      Top = 53
      Width = 343
      Height = 53
      Align = alTop
      TabOrder = 1
      inline FrameProduto: TFrameProduto
        Left = 8
        Top = 4
        Width = 307
        Height = 39
        AutoSize = True
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 4
        ExplicitWidth = 307
        ExplicitHeight = 39
        inherited Label1: TLabel
          Width = 44
          Height = 16
          ExplicitWidth = 44
          ExplicitHeight = 16
        end
        inherited edtCodigo: TEdit
          Height = 24
          ExplicitHeight = 24
        end
        inherited DBLookupComboBox: TDBLookupComboBox
          Left = 47
          Width = 260
          Height = 24
          ExplicitLeft = 47
          ExplicitWidth = 260
          ExplicitHeight = 24
        end
        inherited DataSource: TDataSource
          Left = 264
        end
        inherited adsProduto: TAureliusDataset
          Left = 288
          DesignClass = 'MyEntitiesBroker.TTproduto'
        end
      end
    end
    object pnlTodosProcesso: TPanel
      Left = 0
      Top = 157
      Width = 343
      Height = 34
      Align = alTop
      TabOrder = 3
      object cbxTodos: TCheckBox
        Left = 8
        Top = 8
        Width = 320
        Height = 17
        Caption = 'Todos os Processos (Inclusive os que n'#227'o tem DUE)'
        TabOrder = 0
      end
    end
    object pnlPeriodoProcesso: TPanel
      Left = 0
      Top = 106
      Width = 343
      Height = 51
      Align = alTop
      TabOrder = 2
      object pnlNumeroProcesso: TPanel
        Left = 172
        Top = 1
        Width = 171
        Height = 50
        TabOrder = 1
        object Label2: TLabel
          Left = 16
          Top = 4
          Width = 123
          Height = 16
          Caption = 'N'#250'mero do Processo:'
        end
        object edtNumeroProcesso: TMaskEdit
          Left = 16
          Top = 21
          Width = 121
          Height = 24
          CharCase = ecUpperCase
          EditMask = '!aa-999999-99;1; '
          MaxLength = 12
          TabOrder = 0
          Text = '  -      -  '
          OnKeyDown = edtNumeroProcessoKeyDown
        end
      end
      object pnlPeriodo: TPanel
        Left = 0
        Top = 1
        Width = 170
        Height = 50
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 120
          Height = 16
          Caption = 'Per'#237'odo de Abertura:'
        end
        inline FramePeriodo: TFramePeriodo
          Left = 8
          Top = 20
          Width = 157
          Height = 24
          AutoSize = True
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 20
          ExplicitWidth = 157
          ExplicitHeight = 24
          inherited Label1: TLabel
            Left = 74
            Width = 7
            Height = 16
            ExplicitLeft = 74
            ExplicitWidth = 7
            ExplicitHeight = 16
          end
          inherited medDataInicial: TMaskEdit
            Width = 72
            Height = 24
            ExplicitWidth = 72
            ExplicitHeight = 24
          end
          inherited medDataFinal: TMaskEdit
            Left = 84
            Width = 73
            Height = 24
            ExplicitLeft = 84
            ExplicitWidth = 73
            ExplicitHeight = 24
          end
        end
      end
    end
  end
end
