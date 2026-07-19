object frmImpressaoDocumentos: TfrmImpressaoDocumentos
  Left = 290
  Top = 219
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Documentos'
  ClientHeight = 254
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbModelosDocumentos: TDBGrid
    Left = 0
    Top = 45
    Width = 723
    Height = 209
    Align = alClient
    DataSource = dtmDocumentosFaturamento.dsModelosDocumentos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Documento'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_PATH'
        Title.Caption = 'Caminho do Modelo'
        Width = 452
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 45
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 715
    object btnGravar: TBitBtn
      Left = 584
      Top = 8
      Width = 55
      Height = 31
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnVisualizar: TBitBtn
      Left = 645
      Top = 8
      Width = 55
      Height = 31
      Caption = 'Visualizar'
      TabOrder = 1
      OnClick = btnVisualizarClick
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '||*.pdf||*.htm'
    Filter = 'PDF|*.PDF|HTML|*.HTM'
    InitialDir = 'C:\DDBROKER\FaturamentoERP\Documentos'
    Left = 16
  end
end
