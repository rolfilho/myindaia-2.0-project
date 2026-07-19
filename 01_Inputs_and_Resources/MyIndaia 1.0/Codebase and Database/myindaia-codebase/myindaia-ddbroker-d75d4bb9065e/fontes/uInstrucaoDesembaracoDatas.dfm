object FrmInstrucaoDesembaracoDatas: TFrmInstrucaoDesembaracoDatas
  Left = 194
  Top = 101
  BorderStyle = bsDialog
  Caption = 'Instru'#231#227'o de Desembara'#231'o'
  ClientHeight = 408
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_ev_espec: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 373
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    DesignSize = (
      640
      373)
    object shp13: TShape
      Left = 4
      Top = 33
      Width = 632
      Height = 334
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp9: TShape
      Left = 10
      Top = 42
      Width = 621
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object lbl_09: TLabel
      Left = 40
      Top = 44
      Width = 41
      Height = 13
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_11: TLabel
      Left = 348
      Top = 44
      Width = 40
      Height = 13
      Caption = 'Aplicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_14: TLabel
      Left = 401
      Top = 44
      Width = 57
      Height = 13
      Caption = 'Realizada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 563
      Height = 13
      Caption = 
        'Selecione os eventos que deseja atualizar o Follow Up dos Itens ' +
        'selecionando-os na primeira coluna da tabela abaixo : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbgrdEventoEspec: TDBGrid
      Left = 10
      Top = 57
      Width = 621
      Height = 298
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DtsDatas
      Options = [dgEditing, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdEventoEspecDrawColumnCell
      OnDblClick = dbgrdEventoEspecDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IN_MARCADO'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -15
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CD_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 275
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IN_APLICAVEL'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -15
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REALIZADO'
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 373
    Width = 640
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      640
      35)
    object btnSalvarPedido: TSpeedButton
      Left = 473
      Top = 3
      Width = 77
      Height = 26
      Hint = 'Salvar'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalvarPedidoClick
    end
    object btnCancelarPedido: TSpeedButton
      Left = 557
      Top = 3
      Width = 77
      Height = 26
      Hint = 'Cancelar'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarPedidoClick
    end
  end
  object DtsDatas: TDataSource
    DataSet = TblDatas
    Left = 401
    Top = 166
  end
  object TblDatas: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CD_EVENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NM_EVENTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DT_REALIZADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IN_APLICAVEL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IN_MARCADO'
        DataType = ftString
        Size = 20
      end>
    Left = 352
    Top = 176
    object TblDatasCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
    end
    object TblDatasNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Size = 50
    end
    object TblDatasDT_REALIZADO: TStringField
      FieldName = 'DT_REALIZADO'
      EditMask = '99/99/9999'
    end
    object TblDatasIN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
    end
    object TblDatasIN_MARCADO: TStringField
      FieldName = 'IN_MARCADO'
    end
  end
end
