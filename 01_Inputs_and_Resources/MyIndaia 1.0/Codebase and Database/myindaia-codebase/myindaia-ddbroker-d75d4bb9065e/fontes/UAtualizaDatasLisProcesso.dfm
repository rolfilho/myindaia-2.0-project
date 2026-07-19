object frmAtualizaDatasLisProcesso: TfrmAtualizaDatasLisProcesso
  Left = 158
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualiza'#231#227'o de Datas de LIs em Lote'
  ClientHeight = 601
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1056
    Height = 601
    Align = alClient
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 1054
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
    object pnl1: TPanel
      Left = 1
      Top = 33
      Width = 1054
      Height = 113
      Align = alTop
      TabOrder = 1
      object lbl_dt_reg_li: TLabel
        Left = 25
        Top = 9
        Width = 48
        Height = 13
        Caption = 'Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl1: TLabel
        Left = 183
        Top = 9
        Width = 78
        Height = 13
        Caption = 'Solici. Prorro.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label435: TLabel
        Left = 345
        Top = 9
        Width = 64
        Height = 13
        Caption = 'Solicita'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label434: TLabel
        Left = 504
        Top = 61
        Width = 44
        Height = 13
        Caption = 'Emissor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btnEmissor: TSpeedButton
        Left = 629
        Top = 75
        Width = 23
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
        OnClick = btnEmissorClick
      end
      object Label438: TLabel
        Left = 504
        Top = 9
        Width = 109
        Height = 13
        Caption = 'Apto Finaliz.Dossi'#234
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label436: TLabel
        Left = 680
        Top = 9
        Width = 107
        Height = 13
        Caption = 'Finalizacao Dossi'#234
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label439: TLabel
        Left = 841
        Top = 9
        Width = 209
        Height = 13
        Caption = 'Docs anexados ao Dossi'#234' (P'#243's ETA)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label440: TLabel
        Left = 25
        Top = 61
        Width = 78
        Height = 13
        Caption = 'Emiss'#227'o GRU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label442: TLabel
        Left = 183
        Top = 61
        Width = 113
        Height = 13
        Caption = 'Pagamento da GRU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object medtDataRegistro: TMaskEdit
        Left = 25
        Top = 25
        Width = 116
        Height = 21
        Hint = 'Registro'
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
      object medtDataProrrogacao: TMaskEdit
        Left = 183
        Top = 25
        Width = 116
        Height = 21
        Hint = 'Solicita'#231#227'o de Prorroga'#231#227'o'
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
      object chkDataRegistro: TCheckBox
        Left = 9
        Top = 25
        Width = 15
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = chkDataRegistroClick
      end
      object chkDataSolicitaProrrogacao: TCheckBox
        Left = 167
        Top = 25
        Width = 15
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkDataSolicitaProrrogacaoClick
      end
      object edtNmEmissor: TEdit
        Left = 539
        Top = 75
        Width = 85
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 20
      end
      object chkEmissaoGRU: TCheckBox
        Left = 9
        Top = 75
        Width = 15
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 12
        OnClick = chkEmissaoGRUClick
      end
      object chkTipoLi: TCheckBox
        Left = 330
        Top = 75
        Width = 15
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 16
        OnClick = chkTipoLiClick
      end
      object cbkFinDossie: TCheckBox
        Left = 663
        Top = 25
        Width = 15
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 8
        OnClick = cbkFinDossieClick
      end
      object chkPagamentoGRU: TCheckBox
        Left = 167
        Top = 75
        Width = 15
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 14
        OnClick = chkPagamentoGRUClick
      end
      object chkDocsAnexados: TCheckBox
        Left = 826
        Top = 25
        Width = 16
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 10
        OnClick = chkDocsAnexadosClick
      end
      object chkAptoFinDossie: TCheckBox
        Left = 490
        Top = 25
        Width = 16
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = chkAptoFinDossieClick
      end
      object chkSolicitacao: TCheckBox
        Left = 330
        Top = 25
        Width = 16
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = chkSolicitacaoClick
      end
      object chkEmissor: TCheckBox
        Left = 490
        Top = 75
        Width = 15
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 18
        OnClick = chkEmissorClick
      end
      object medDtSolicitacao: TMaskEdit
        Left = 345
        Top = 25
        Width = 116
        Height = 21
        Hint = 'Solicita'#231#227'o'
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 5
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
      object medAnexoDossie: TMaskEdit
        Left = 841
        Top = 25
        Width = 116
        Height = 21
        Hint = 'Docs anexados ao Dossi'#234
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 11
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
      object medFinDossie: TMaskEdit
        Left = 680
        Top = 25
        Width = 116
        Height = 21
        Hint = 'Finaliza'#231#227'o Dossi'#234
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 9
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
      object medAptoFinDossie: TMaskEdit
        Left = 504
        Top = 25
        Width = 117
        Height = 21
        Hint = 'Apto Finaliza'#231#227'o Dossi'#234
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 7
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
      object medEmissaoGRU: TMaskEdit
        Left = 25
        Top = 75
        Width = 116
        Height = 21
        Hint = 'Emiss'#227'o GRU'
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 13
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
      object rgTipoLi: TRadioGroup
        Left = 345
        Top = 59
        Width = 118
        Height = 38
        Hint = 'Tipo LI'
        Caption = 'Tipo LI'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Pr'#233
          'Pos')
        ParentFont = False
        TabOrder = 17
      end
      object edtUsuarioEmissor: TEdit
        Left = 504
        Top = 75
        Width = 36
        Height = 21
        Hint = 'Emissor'
        TabOrder = 19
        Text = 'edtUsuarioEmissor'
        OnChange = btnEmissorClick
      end
      object medPagtoGRU: TMaskEdit
        Left = 183
        Top = 75
        Width = 116
        Height = 21
        Hint = 'Pagamento GRU'
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 15
        Text = '  /  /    '
        OnExit = medtDataRegistroExit
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 146
      Width = 1054
      Height = 200
      Align = alTop
      TabOrder = 2
      object lbl2: TLabel
        Left = 14
        Top = 3
        Width = 97
        Height = 13
        Caption = 'L.I.s Dispon'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbgrdLi: TDBGrid
        Left = 1
        Top = 19
        Width = 1052
        Height = 180
        Align = alBottom
        Ctl3D = False
        DataSource = dsLIsDisponiveis
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
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_REGISTRO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_SOLICI_PRORROGACAO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_APTO_FIN_DOSSIE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FIN_DOSSIE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DOCTOS_DOSSIE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_EMISSAO_GRU'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PGMTO_GRU'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_LI_PRE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_USUARIO_EMISSOR'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 99
            Visible = True
          end>
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 346
      Width = 1054
      Height = 40
      Align = alTop
      TabOrder = 3
      object btnSelecionaTodos: TSpeedButton
        Left = 64
        Top = 8
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
        Top = 8
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
        Top = 8
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
      object btnSeleciona: TSpeedButton
        Left = 32
        Top = 8
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
    end
    object pnl4: TPanel
      Left = 1
      Top = 386
      Width = 1054
      Height = 200
      Align = alTop
      TabOrder = 4
      object lbl3: TLabel
        Left = 14
        Top = 3
        Width = 106
        Height = 13
        Caption = 'L.I.s Selecionadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbgrdSelecionadas: TDBGrid
        Left = 1
        Top = 19
        Width = 1052
        Height = 180
        Align = alBottom
        Ctl3D = False
        DataSource = dsLIsSelecionadas
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
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_REGISTRO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_SOLICI_PRORROGACAO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_APTO_FIN_DOSSIE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FIN_DOSSIE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DOCTOS_DOSSIE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_EMISSAO_GRU'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PGMTO_GRU'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_LI_PRE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_USUARIO_EMISSOR'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 99
            Visible = True
          end>
      end
    end
  end
  object dsLIsDisponiveis: TDataSource
    DataSet = cdsLisDisponiveis
    Left = 322
    Top = 202
  end
  object qry_li_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      ' NR_PROCESSO'
      ',NR_LI'
      ',DT_REGISTRO'
      ',DATA_SOLICI_PRORROGACAO'
      ',DT_SOLICITACAO'
      ',DT_APTO_FIN_DOSSIE'
      ',DT_FIN_DOSSIE'
      ',DT_DOCTOS_DOSSIE'
      ',DT_EMISSAO_GRU'
      ',DT_PGMTO_GRU'
      ',IN_PRE_EMBARQUE'
      ',CD_USUARIO_EMISSOR'
      'FROM TPROCESSO_LI (NOLOCK)'
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Left = 180
    Top = 206
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_li_NR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_LI.NR_PROCESSO'
      Size = 18
    end
    object qry_li_NR_LI: TStringField
      DisplayLabel = 'N'#186' L.I.'
      FieldName = 'NR_LI'
      Origin = 'TPROCESSO_LI.NR_LI'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_li_DT_REGISTRO: TDateTimeField
      DisplayLabel = 'Data de Registro'
      FieldName = 'DT_REGISTRO'
      Origin = 'TPROCESSO_LI.DT_REGISTRO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_li_DATA_SOLICI_PRORROGACAO: TDateTimeField
      DisplayLabel = 'Data Solicita'#231#227'o de Prorroga'#231#227'o'
      FieldName = 'DATA_SOLICI_PRORROGACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_li_DT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data Solicita'#231#227'o'
      FieldName = 'DT_SOLICITACAO'
      Origin = 'DBBROKER.TPROCESSO_LI.DT_SOLICITACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_li_DT_APTO_FIN_DOSSIE: TDateTimeField
      DisplayLabel = 'Data Apto Fin. Dossie'
      FieldName = 'DT_APTO_FIN_DOSSIE'
      Origin = 'DBBROKER.TPROCESSO_LI.DT_APTO_FIN_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_li_DT_FIN_DOSSIE: TDateTimeField
      DisplayLabel = 'Data Fin. Dossie'
      FieldName = 'DT_FIN_DOSSIE'
      Origin = 'DBBROKER.TPROCESSO_LI.DT_FIN_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_li_DT_DOCTOS_DOSSIE: TDateTimeField
      DisplayLabel = 'Data Doctos Dossie'
      FieldName = 'DT_DOCTOS_DOSSIE'
      Origin = 'DBBROKER.TPROCESSO_LI.DT_DOCTOS_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_li_DT_EMISSAO_GRU: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o GRU'
      FieldName = 'DT_EMISSAO_GRU'
      Origin = 'DBBROKER.TPROCESSO_LI.DT_EMISSAO_GRU'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_li_DT_PGMTO_GRU: TDateTimeField
      DisplayLabel = 'Data Pgmto GRU'
      FieldName = 'DT_PGMTO_GRU'
      Origin = 'DBBROKER.TPROCESSO_LI.DT_PGMTO_GRU'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_li_IN_PRE_EMBARQUE: TStringField
      DisplayLabel = 'Tipo LI'
      FieldName = 'IN_PRE_EMBARQUE'
      Origin = 'DBBROKER.TPROCESSO_LI.IN_PRE_EMBARQUE'
      FixedChar = True
      Size = 1
    end
    object qry_li_CD_USUARIO_EMISSOR: TStringField
      DisplayLabel = 'Usuario Emissor'
      FieldName = 'CD_USUARIO_EMISSOR'
      Origin = 'DBBROKER.TPROCESSO_LI.CD_USUARIO_EMISSOR'
      FixedChar = True
      Size = 4
    end
  end
  object cdsLisDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'dspLIsDisponiveis'
    OnCalcFields = cdsLisDisponiveisCalcFields
    Left = 327
    Top = 205
    object cdsLisDisponiveisNR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object cdsLisDisponiveisNR_LI: TStringField
      DisplayLabel = 'N'#186' L.I.'
      FieldName = 'NR_LI'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object cdsLisDisponiveisDT_REGISTRO: TDateTimeField
      DisplayLabel = 'Registro'
      FieldName = 'DT_REGISTRO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLisDisponiveisDATA_SOLICI_PRORROGACAO: TDateTimeField
      DisplayLabel = 'Solici. Prorro.'
      FieldName = 'DATA_SOLICI_PRORROGACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLisDisponiveisDT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Solicita'#231#227'o'
      FieldName = 'DT_SOLICITACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLisDisponiveisDT_APTO_FIN_DOSSIE: TDateTimeField
      DisplayLabel = 'Apto Fin. Dossie'
      FieldName = 'DT_APTO_FIN_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLisDisponiveisDT_FIN_DOSSIE: TDateTimeField
      DisplayLabel = 'Fin. Dossie'
      FieldName = 'DT_FIN_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLisDisponiveisDT_DOCTOS_DOSSIE: TDateTimeField
      DisplayLabel = 'Doctos Dossie'
      FieldName = 'DT_DOCTOS_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLisDisponiveisDT_EMISSAO_GRU: TDateTimeField
      DisplayLabel = 'Emiss'#227'o GRU'
      FieldName = 'DT_EMISSAO_GRU'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLisDisponiveisDT_PGMTO_GRU: TDateTimeField
      DisplayLabel = 'Pgmto GRU'
      FieldName = 'DT_PGMTO_GRU'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLisDisponiveisIN_PRE_EMBARQUE: TStringField
      DisplayLabel = 'Tipo LI'
      FieldName = 'IN_PRE_EMBARQUE'
      FixedChar = True
      Size = 1
    end
    object cdsLisDisponiveisCD_USUARIO_EMISSOR: TStringField
      DisplayLabel = 'Usuario Emiss'#227'o'
      FieldName = 'CD_USUARIO_EMISSOR'
      FixedChar = True
      Size = 4
    end
    object cdsLisDisponiveiscalc_LI_PRE: TStringField
      DisplayLabel = 'Tipo LI'
      FieldKind = fkCalculated
      FieldName = 'calc_LI_PRE'
      Size = 3
      Calculated = True
    end
  end
  object dspLIsDisponiveis: TDataSetProvider
    DataSet = qry_li_
    Left = 346
    Top = 204
  end
  object dsLIsSelecionadas: TDataSource
    DataSet = cdsLIsSelecionadas
    Left = 89
    Top = 206
  end
  object cdsLIsSelecionadas: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsLIsSelecionadasCalcFields
    Left = 85
    Top = 219
    object cdsLIsSelecionadasNR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object cdsLIsSelecionadasNR_LI: TStringField
      DisplayLabel = 'N'#186' L.I.'
      FieldName = 'NR_LI'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Registro'
      FieldName = 'DT_REGISTRO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLIsSelecionadasDATA_SOLICI_PRORROGACAO: TDateTimeField
      DisplayLabel = 'Solici. Prorro.'
      FieldName = 'DATA_SOLICI_PRORROGACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLIsSelecionadasDT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Solicita'#231#227'o'
      FieldName = 'DT_SOLICITACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLIsSelecionadasDT_APTO_FIN_DOSSIE: TDateTimeField
      DisplayLabel = 'Apto Fin. Dossie'
      FieldName = 'DT_APTO_FIN_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLIsSelecionadasDT_FIN_DOSSIE: TDateTimeField
      DisplayLabel = 'Fin. Dossie'
      FieldName = 'DT_FIN_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLIsSelecionadasDT_DOCTOS_DOSSIE: TDateTimeField
      DisplayLabel = 'Doctos Dossie'
      FieldName = 'DT_DOCTOS_DOSSIE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLIsSelecionadasDT_EMISSAO_GRU: TDateTimeField
      DisplayLabel = 'Emiss'#227'o GRU'
      FieldName = 'DT_EMISSAO_GRU'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLIsSelecionadasDT_PGMTO_GRU: TDateTimeField
      DisplayLabel = 'Pgmto GRU'
      FieldName = 'DT_PGMTO_GRU'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsLIsSelecionadasIN_PRE_EMBARQUE: TStringField
      DisplayLabel = 'Tipo LI'
      FieldName = 'IN_PRE_EMBARQUE'
      Size = 1
    end
    object cdsLIsSelecionadasCD_USUARIO_EMISSOR: TStringField
      DisplayLabel = 'Usuario Emiss'#227'o'
      DisplayWidth = 4
      FieldName = 'CD_USUARIO_EMISSOR'
      Size = 4
    end
    object cdsLIsSelecionadascalc_LI_PRE: TStringField
      DisplayLabel = 'Tipo LI'
      FieldKind = fkCalculated
      FieldName = 'calc_LI_PRE'
      Size = 3
      Calculated = True
    end
  end
end
