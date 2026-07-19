object frm_log_erro_calculo: Tfrm_log_erro_calculo
  Left = 85
  Top = 91
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Erros no cálculo'
  ClientHeight = 453
  ClientWidth = 632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  PrintScale = poNone
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 453
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object dbg_erros: TDBGrid
      Left = 16
      Top = 16
      Width = 609
      Height = 385
      DataSource = datm_log_erro_calculo.ds_log_erro_calculo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          FieldName = 'CD_ERRO'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 32
        end
        item
          FieldName = 'NM_MENSAGEM'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 309
        end
        item
          FieldName = 'NM_ITEM'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 227
        end>
    end
    object btn_ok: TBitBtn
      Left = 278
      Top = 412
      Width = 75
      Height = 29
      TabOrder = 1
      OnClick = btn_okClick
      Kind = bkOK
    end
  end
end
