object frmAtualizaDatasOrgaosAnuentesProcesso: TfrmAtualizaDatasOrgaosAnuentesProcesso
  Left = 367
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualiza'#231#227'o de Datas de  Org'#227'os Anuentes em Lote'
  ClientHeight = 435
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 435
    Align = alClient
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 610
      Height = 32
      Align = alTop
      TabOrder = 0
      object btn_salvar: TSpeedButton
        Left = 11
        Top = 4
        Width = 70
        Height = 24
        Hint = 'Atualizar Datas LIs'
        Caption = 'Salvar'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btn_salvarClick
      end
      object btn_cancelar: TSpeedButton
        Left = 89
        Top = 4
        Width = 70
        Height = 24
        Hint = 'Cancelar'
        Caption = 'Cancelar'
        Enabled = False
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
        OnClick = btn_cancelarClick
      end
    end
    object pnlCampos: TPanel
      Left = 1
      Top = 33
      Width = 610
      Height = 120
      Align = alTop
      TabOrder = 1
      object lbl1: TLabel
        Left = 29
        Top = 7
        Width = 76
        Height = 13
        Caption = 'Data Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 181
        Top = 5
        Width = 74
        Height = 13
        Caption = 'Data Defnto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 330
        Top = 5
        Width = 76
        Height = 13
        Caption = 'Data Vencto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 481
        Top = 5
        Width = 63
        Height = 13
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object medtDataEntrada: TMaskEdit
        Left = 28
        Top = 24
        Width = 114
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = medtDataEntradaExit
      end
      object chkDataEntrada: TCheckBox
        Left = 6
        Top = 24
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = chkDataEntradaClick
      end
      object medtDataDeferimento: TMaskEdit
        Left = 180
        Top = 24
        Width = 114
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
        OnExit = medtDataDeferimentoExit
      end
      object chkDataDeferimento: TCheckBox
        Left = 158
        Top = 24
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = chkDataDeferimentoClick
      end
      object medtDataVencimento: TMaskEdit
        Left = 329
        Top = 24
        Width = 114
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
        OnExit = medtDataVencimentoExit
      end
      object chkDataVencimento: TCheckBox
        Left = 310
        Top = 24
        Width = 14
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = chkDataVencimentoClick
      end
      object chkSomenteLISelecionada: TCheckBox
        Left = 223
        Top = 64
        Width = 169
        Height = 17
        Caption = 'Somente L.I. Selecionada'
        TabOrder = 6
        OnClick = chkSomenteLISelecionadaClick
      end
      object chkSomenteOrgaoSelecionado: TCheckBox
        Left = 7
        Top = 67
        Width = 209
        Height = 17
        Caption = 'Somente Org'#227'o Anuente Selecionado'
        TabOrder = 7
        OnClick = chkSomenteOrgaoSelecionadoClick
      end
      object cmbOrgaosAnuentes: TDBLookupComboBox
        Left = 7
        Top = 85
        Width = 196
        Height = 21
        Enabled = False
        KeyField = 'CD_ORGAO_ANUENTE'
        ListField = 'CD_ORGAO_ANUENTE'
        ListSource = dsOrgaosAnuentes
        TabOrder = 8
        OnExit = cmbOrgaosAnuentesExit
      end
      object cmbLIs: TDBLookupComboBox
        Left = 221
        Top = 84
        Width = 145
        Height = 21
        Enabled = False
        KeyField = 'NR_LI_SEM_FORMATACAO'
        ListField = 'NR_LI'
        ListSource = dsLIs
        TabOrder = 9
        OnExit = cmbLIsExit
      end
      object chkReferencia: TCheckBox
        Left = 458
        Top = 24
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 10
        OnClick = chkReferenciaClick
      end
      object lblReferencia: TEdit
        Left = 481
        Top = 24
        Width = 114
        Height = 21
        TabOrder = 11
      end
    end
    object pnlDisponiveis: TPanel
      Left = 1
      Top = 153
      Width = 610
      Height = 120
      Align = alTop
      TabOrder = 2
      object lbl4: TLabel
        Left = 14
        Top = 3
        Width = 169
        Height = 13
        Caption = 'Org'#227'os Anuentes Dispon'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbgrdDisponiveis: TDBGrid
        Left = 1
        Top = 19
        Width = 608
        Height = 100
        Align = alBottom
        Ctl3D = False
        DataSource = dsOrgaosAnuentesDisponiveis
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_LI'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ORGAO_ANUENTE'
            Title.Caption = 'Org'#227'o Anuente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ENTR_PROC'
            Title.Caption = 'Entrada'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DEFERIMENTO'
            Title.Caption = 'Deferimento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_VENCTO'
            Title.Caption = 'Vencimento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end>
      end
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 313
      Width = 610
      Height = 120
      Align = alTop
      TabOrder = 3
      object lbl5: TLabel
        Left = 14
        Top = 3
        Width = 178
        Height = 13
        Caption = 'Org'#227'os Anuentes Selecionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbgrdSelecionados: TDBGrid
        Left = 1
        Top = 19
        Width = 608
        Height = 100
        Align = alBottom
        Ctl3D = False
        DataSource = dsOrgaoAnuentesSelecionados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_LI'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ORGAO_ANUENTE'
            Title.Caption = 'Org'#227'o Anuente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ENTR_PROC'
            Title.Caption = 'Entrada'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DEFERIMENTO'
            Title.Caption = 'Deferimento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_VENCTO'
            Title.Caption = 'Vencimento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end>
      end
    end
    object pnlSelecionados: TPanel
      Left = 1
      Top = 273
      Width = 610
      Height = 40
      Align = alTop
      TabOrder = 4
      object btnSeleciona: TSpeedButton
        Left = 32
        Top = 9
        Width = 23
        Height = 22
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8000888888088888800088888060888880008888066608888000888066666088
          8000880666666608800080000666000080008888066608888000888806660888
          8000888806660888800088880000088880008888888888888000888888888888
          8000}
        OnClick = btnSelecionaClick
      end
      object btnSelecionaTodos: TSpeedButton
        Left = 64
        Top = 9
        Width = 23
        Height = 22
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888088888
          8000888880608888800088880666088880008880660660888000880660606608
          8000800006660000800088806666608880008806666666088000800006660000
          8000888806660888800088880666088880008888066608888000888800000888
          8000}
        OnClick = btnSelecionaTodosClick
      end
      object btnRemove: TSpeedButton
        Left = 128
        Top = 9
        Width = 23
        Height = 22
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8000888888888888800088880000088880008888066608888000888806660888
          8000888806660888800080000666000080008806666666088000888066666088
          8000888806660888800088888060888880008888880888888000888888888888
          8000}
        OnClick = btnRemoveClick
      end
      object btnRemoveTodos: TSpeedButton
        Left = 160
        Top = 9
        Width = 23
        Height = 22
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888800000888
          8000888806660888800088880666088880008888066608888000800006660000
          8000880666666608800088806666608880008000066600008000880660606608
          8000888066066088800088880666088880008888806088888000888888088888
          8000}
        OnClick = btnRemoveTodosClick
      end
    end
  end
  object qryOrgaosAnuentesDisponiveis: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DECLARE @NR_PROCESSO       VARCHAR(18)'
      'DECLARE @NR_LI'#9#9'       VARCHAR(10)'
      'DECLARE @CD_ORGAO_ANUENTE  VARCHAR(16)'
      'SET @NR_PROCESSO = :NR_PROCESSO'
      'SET @NR_LI       = :NR_LI'
      'SET @CD_ORGAO_ANUENTE = :CD_ORGAO_ANUENTE'
      ''
      'SELECT'
      '  NR_PROCESSO, '
      '  NR_LI, '
      '  CD_ORGAO_ANUENTE, '
      '  DT_DEFERIMENTO, '
      '  DT_VENCTO, '
      '  DT_ENTR_PROC,'
      '  REFERENCIA'
      'FROM TPROCESSO_LI_ORGAO_ANUENTE A WITH (NOLOCK) '
      'WHERE NR_PROCESSO = @NR_PROCESSO'
      '  AND ((NR_LI     = @NR_LI) OR (ISNULL(@NR_LI, '#39#39')= '#39#39'))'
      
        '  AND ((CD_ORGAO_ANUENTE = @CD_ORGAO_ANUENTE) OR (ISNULL(@CD_ORG' +
        'AO_ANUENTE, '#39#39')= '#39#39'))  ')
    Left = 331
    Top = 371
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_ORGAO_ANUENTE'
        ParamType = ptInput
      end>
    object strngfld_li_NR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_LI.NR_PROCESSO'
      Size = 18
    end
    object strngfld_li_NR_LI: TStringField
      DisplayLabel = 'N'#186' L.I.'
      FieldName = 'NR_LI'
      Origin = 'TPROCESSO_LI.NR_LI'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object strngfldOrgaosAnuentesDisponiveisCD_ORGAO_ANUENTE: TStringField
      FieldName = 'CD_ORGAO_ANUENTE'
      Size = 16
    end
    object qryOrgaosAnuentesDisponiveisDT_DEFERIMENTO: TDateTimeField
      FieldName = 'DT_DEFERIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryOrgaosAnuentesDisponiveisDT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryOrgaosAnuentesDisponiveisDT_ENTR_PROC: TDateTimeField
      FieldName = 'DT_ENTR_PROC'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryOrgaosAnuentesDisponiveisREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
  end
  object dspOrgaosAnuentesDisponiveis: TDataSetProvider
    DataSet = qryOrgaosAnuentesDisponiveis
    Left = 331
    Top = 372
  end
  object dsOrgaosAnuentesDisponiveis: TDataSource
    DataSet = cdsOrgaosAnuentesDisponiveis
    Left = 330
    Top = 371
  end
  object cdsOrgaosAnuentesDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_LI'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'CD_ORGAO_ANUENTE'
        ParamType = ptInput
        Size = 16
      end>
    ProviderName = 'dspOrgaosAnuentesDisponiveis'
    Left = 331
    Top = 369
    object strngfldLisDisponiveisNR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object strngfldLisDisponiveisNR_LI: TStringField
      DisplayLabel = 'N'#186' L.I.'
      FieldName = 'NR_LI'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object strngfldOrgaosAnuentesDisponiveisCD_ORGAO_ANUENTE1: TStringField
      FieldName = 'CD_ORGAO_ANUENTE'
      Size = 16
    end
    object cdsOrgaosAnuentesDisponiveisDT_DEFERIMENTO: TDateTimeField
      FieldName = 'DT_DEFERIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsOrgaosAnuentesDisponiveisDT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsOrgaosAnuentesDisponiveisDT_ENTR_PROC: TDateTimeField
      FieldName = 'DT_ENTR_PROC'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsOrgaosAnuentesDisponiveisREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
  end
  object cdsOrgaoAnuentesSelecionados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'dspOrgaosAnuentesDisponiveis'
    Left = 73
    Top = 359
    object strngfld1: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object strngfld2: TStringField
      DisplayLabel = 'N'#186' L.I.'
      FieldName = 'NR_LI'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object strngfld3: TStringField
      FieldName = 'CD_ORGAO_ANUENTE'
      Size = 16
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_DEFERIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_VENCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DT_ENTR_PROC'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsOrgaoAnuentesSelecionadosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
  end
  object dsOrgaoAnuentesSelecionados: TDataSource
    DataSet = cdsOrgaoAnuentesSelecionados
    Left = 73
    Top = 357
  end
  object qryOrgaosAnuentes: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'DECLARE @NR_PROCESSO       VARCHAR(18)'
      'DECLARE @NR_LI'#9#9'       VARCHAR(10)'
      ''
      'SET @NR_PROCESSO      = :NR_PROCESSO'
      'SET @NR_LI      = :NR_LI'
      ''
      'SELECT DISTINCT CD_ORGAO_ANUENTE'
      'FROM TPROCESSO_LI_ORGAO_ANUENTE A WITH (NOLOCK) '
      'WHERE NR_PROCESSO = @NR_PROCESSO'
      '  AND ((NR_LI     = @NR_LI) OR (ISNULL(@NR_LI, '#39#39')= '#39#39'))')
    Left = 481
    Top = 358
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_LI'
        ParamType = ptInput
        Size = 16
      end>
    object strngfld6: TStringField
      FieldName = 'CD_ORGAO_ANUENTE'
      Size = 16
    end
  end
  object qryLIs: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DECLARE @NR_PROCESSO       VARCHAR(18)'
      'SET @NR_PROCESSO      = :NR_PROCESSO'
      ''
      'SELECT DISTINCT NR_LI, NR_LI AS NR_LI_SEM_FORMATACAO'
      'FROM TPROCESSO_LI_ORGAO_ANUENTE A WITH (NOLOCK) '
      'WHERE NR_PROCESSO = @NR_PROCESSO'
      '')
    Left = 212
    Top = 364
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
    object strngfld8: TStringField
      DisplayLabel = 'N'#186' L.I.'
      FieldName = 'NR_LI'
      Origin = 'TPROCESSO_LI.NR_LI'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object strngfldLIsNR_LI_SEM_FORMATACAO: TStringField
      FieldName = 'NR_LI_SEM_FORMATACAO'
      Size = 16
    end
  end
  object dsLIs: TDataSource
    DataSet = qryLIs
    Left = 212
    Top = 362
  end
  object dsOrgaosAnuentes: TDataSource
    DataSet = qryOrgaosAnuentes
    Left = 482
    Top = 358
  end
end
