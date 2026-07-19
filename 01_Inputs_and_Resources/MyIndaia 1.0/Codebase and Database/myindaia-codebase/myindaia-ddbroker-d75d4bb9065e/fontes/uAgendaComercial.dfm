object frm_agenda_comercial: Tfrm_agenda_comercial
  Left = 320
  Top = 204
  Width = 750
  Height = 550
  Caption = 'Agenda Comercial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_agenda_comercial: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 453
    ActivePage = ts_mov_ag
    Align = alClient
    MultiLine = True
    TabOrder = 0
    OnChange = pgctrl_agenda_comercialChange
    OnChanging = pgctrl_agenda_comercialChanging
    object ts_consulta_ag: TTabSheet
      Caption = 'Consulta da Agenda'
      object DBGrid_agenda_mensal: TDBGrid
        Left = 0
        Top = 117
        Width = 734
        Height = 308
        Align = alClient
        DataSource = datm_agenda_comercial.ds_agenda_mensal
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_AGENDA'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_mens_periodo'
            Title.Caption = 'Per'#237'odo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_EMPRESA'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Empresa'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 257
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_mens_tp_agenda'
            Title.Caption = 'Tipo da Agenda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 97
            Visible = True
          end>
      end
      object DBGrid_agenda_comerc: TDBGrid
        Left = 0
        Top = 117
        Width = 734
        Height = 308
        Align = alClient
        DataSource = datm_agenda_comercial.ds_agenda_diaria
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_AGENDA'
            ReadOnly = False
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HR_AGENDA'
            Title.Caption = 'Hora'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'calc_diar_periodo'
            Title.Caption = 'Per'#237'odo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_EMPRESA'
            ReadOnly = False
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Empresa'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 296
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_diar_tp_agenda'
            Title.Caption = 'Tipo da Agenda'
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
      object DBGrid_agenda_semanal: TDBGrid
        Left = 0
        Top = 117
        Width = 734
        Height = 308
        Align = alClient
        DataSource = datm_agenda_comercial.ds_agenda_semanal
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_AGENDA'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_sem_periodo'
            Title.Caption = 'Per'#237'odo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_EMPRESA'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Empresa'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 361
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_sem_tp_agenda'
            Title.Caption = 'Tipo da Agenda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 55
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label31: TLabel
          Left = 353
          Top = 10
          Width = 34
          Height = 13
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 12
          Top = 10
          Width = 55
          Height = 13
          Caption = 'Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_vendedor: TSpeedButton
          Left = 318
          Top = 22
          Width = 25
          Height = 23
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
          OnClick = btn_co_vendedorClick
        end
        object lb_mes: TLabel
          Left = 478
          Top = 8
          Width = 30
          Height = 16
          Caption = 'M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object edt_nm_vendedor: TEdit
          Left = 54
          Top = 23
          Width = 263
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object DateEditData: TDateEdit
          Left = 353
          Top = 23
          Width = 116
          Height = 21
          Hint = 'Selecione uma Data'
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnExit = DateEditDataExit
        end
        object Edit_agenda_mes: TEdit
          Left = 479
          Top = 23
          Width = 111
          Height = 20
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Color = clMenu
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
          Visible = False
        end
        object msk_cd_vendedor: TMaskEdit
          Left = 12
          Top = 23
          Width = 43
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 0
          OnChange = btn_co_vendedorClick
          OnExit = msk_cd_vendedorExit
          OnKeyDown = msk_cd_vendedorKeyDown
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 55
        Width = 734
        Height = 62
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        DesignSize = (
          734
          62)
        object rdgrp_tp_agenda: TRadioGroup
          Left = 10
          Top = 7
          Width = 257
          Height = 46
          Columns = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Di'#225'rio'
            'Semanal'
            'Mensal')
          ParentFont = False
          TabOrder = 0
          OnClick = rdgrp_tp_agendaClick
        end
        object pnl_semana: TPanel
          Left = 504
          Top = 6
          Width = 222
          Height = 50
          Anchors = [akTop, akRight]
          BevelInner = bvLowered
          TabOrder = 1
          Visible = False
          object Label8: TLabel
            Left = 8
            Top = 6
            Width = 63
            Height = 16
            Caption = 'Segunda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 127
            Top = 6
            Width = 63
            Height = 16
            Caption = 'Domingo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 100
            Top = 23
            Width = 23
            Height = 16
            Caption = 'at'#233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EditData2: TEdit
            Left = 128
            Top = 22
            Width = 86
            Height = 20
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
          end
          object EditData1: TEdit
            Left = 9
            Top = 22
            Width = 84
            Height = 20
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
    end
    object ts_mov_ag: TTabSheet
      Caption = 'Movimenta'#231#227'o da Agenda'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 150
        Width = 734
        Height = 275
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          734
          275)
        object Label3: TLabel
          Left = 6
          Top = 4
          Width = 55
          Height = 13
          Caption = 'Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 6
          Top = 189
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 142
          Top = 189
          Width = 28
          Height = 13
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_vend: TSpeedButton
          Left = 244
          Top = 24
          Width = 25
          Height = 23
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
          OnClick = btn_co_vendClick
        end
        object Label11: TLabel
          Left = 6
          Top = 44
          Width = 40
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_proc_comerc: TSpeedButton
          Left = 243
          Top = 64
          Width = 25
          Height = 23
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
          OnClick = btn_co_proc_comercClick
        end
        object Label4: TLabel
          Left = 6
          Top = 82
          Width = 45
          Height = 13
          Caption = 'Contato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 280
          Top = 3
          Width = 69
          Height = 13
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbrg_in_periodo: TDBRadioGroup
          Left = 6
          Top = 122
          Width = 261
          Height = 62
          BiDiMode = bdLeftToRight
          Caption = ' Per'#237'odo Visita '
          Columns = 2
          DataField = 'IN_PERIODO'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            '  8:00 '#224's 10:00'
            '10:00 '#224's 12:00'
            '14:00 '#225's 16:00'
            '16:00 '#224's 18:00')
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 3
          Values.Strings = (
            '1'
            '2'
            '3'
            '4')
          OnChange = dbedt_cd_vendedorChange
          OnClick = dbrg_in_periodoClick
        end
        object dbedt_cd_vendedor: TDBEdit
          Left = 6
          Top = 17
          Width = 39
          Height = 21
          DataField = 'CD_VENDEDOR'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          TabOrder = 0
          OnChange = dbedt_cd_vendedorChange
          OnExit = dbedt_cd_vendedorExit
          OnKeyDown = msk_cd_vendedorKeyDown
        end
        object dbedt_nm_vendedor: TDBEdit
          Left = 45
          Top = 17
          Width = 197
          Height = 21
          Color = clMenu
          DataField = 'NM_VENDEDOR'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          ReadOnly = True
          TabOrder = 8
        end
        object DBRadioGroup_tp_agenda: TDBRadioGroup
          Left = 6
          Top = 229
          Width = 262
          Height = 41
          Caption = 'Tipo da Agenda'
          Columns = 2
          DataField = 'IN_PARTICULAR'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Profissional'
            'Particular')
          ParentFont = False
          TabOrder = 6
          Values.Strings = (
            '0'
            '1')
          OnChange = dbedt_cd_vendedorChange
          OnClick = DBRadioGroup_tp_agendaClick
        end
        object dbedt_hr_agenda: TDBEdit
          Left = 142
          Top = 202
          Width = 125
          Height = 21
          DataField = 'HR_AGENDA'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          TabOrder = 5
          OnChange = dbedt_cd_vendedorChange
        end
        object dbedt_cliente: TDBEdit
          Left = 6
          Top = 57
          Width = 48
          Height = 21
          DataField = 'CD_EMPRESA'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          TabOrder = 1
          OnChange = dbedt_cd_vendedorChange
          OnExit = dbedt_clienteExit
          OnKeyDown = msk_cd_vendedorKeyDown
        end
        object DBDateEdit_DT_agenda: TDBDateEdit
          Left = 6
          Top = 202
          Width = 126
          Height = 21
          DataField = 'DT_AGENDA'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          NumGlyphs = 2
          TabOrder = 4
          OnChange = dbmemo_obs_agendaChange
        end
        object dbedt_nm_Cliente: TDBEdit
          Left = 54
          Top = 57
          Width = 188
          Height = 21
          Color = clMenu
          DataField = 'NM_EMPRESA'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_contato: TDBEdit
          Left = 6
          Top = 95
          Width = 261
          Height = 21
          DataField = 'NM_CONTATO'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          TabOrder = 2
          OnChange = dbmemo_obs_agendaChange
        end
        object dbmemo_obs_agenda: TDBMemo
          Left = 280
          Top = 19
          Width = 446
          Height = 248
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'OBS_AGENDA'
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          ScrollBars = ssVertical
          TabOrder = 7
          OnChange = dbmemo_obs_agendaChange
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 150
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object dbgrid_mov_agenda: TDBGrid
          Left = 0
          Top = 17
          Width = 646
          Height = 133
          Align = alClient
          DataSource = datm_agenda_comercial.ds_agenda_comercial
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrid_mov_agendaDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_VENDEDOR'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NM_VENDEDOR'
              Title.Caption = 'Vendedor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 146
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_AGENDA'
              Title.Caption = 'Data '
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_periodo'
              Title.Caption = 'Per'#237'odo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IN_PERIODO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NM_EMPRESA'
              Title.Caption = 'Empresa'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 187
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_CONTATO'
              Title.Caption = 'Contato'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_tp_agenda'
              Title.Caption = 'Meio de Contato'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_cancelado'
              Title.Caption = 'Status'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 85
              Visible = True
            end>
        end
        object pnl: TPanel
          Left = 646
          Top = 17
          Width = 88
          Height = 133
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object shp2: TShape
            Left = 0
            Top = 20
            Width = 88
            Height = 113
            Align = alClient
          end
          object shp3: TShape
            Left = 6
            Top = 26
            Width = 15
            Height = 16
            Brush.Color = 14869191
            Pen.Color = clGray
          end
          object lbl1: TLabel
            Left = 24
            Top = 28
            Width = 25
            Height = 13
            Caption = 'Visita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object shp4: TShape
            Left = 6
            Top = 43
            Width = 15
            Height = 16
            Brush.Color = 12189625
            Pen.Color = clGray
          end
          object lbl2: TLabel
            Left = 23
            Top = 45
            Width = 42
            Height = 13
            Caption = 'Telefone'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object shp5: TShape
            Left = 6
            Top = 60
            Width = 15
            Height = 16
            Brush.Color = 11060735
            Pen.Color = clGray
          end
          object lbl3: TLabel
            Left = 23
            Top = 62
            Width = 28
            Height = 13
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object shp6: TShape
            Left = 6
            Top = 77
            Width = 15
            Height = 16
            Brush.Color = 16763025
            Pen.Color = clGray
          end
          object lbl4: TLabel
            Left = 23
            Top = 79
            Width = 17
            Height = 13
            Caption = 'Fax'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object shp7: TShape
            Left = 6
            Top = 94
            Width = 15
            Height = 16
            Brush.Color = 9671679
            Pen.Color = clGray
          end
          object lbl5: TLabel
            Left = 23
            Top = 95
            Width = 47
            Height = 13
            Caption = 'Postagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lbl6: TLabel
            Left = 23
            Top = 114
            Width = 51
            Height = 13
            Caption = 'Cancelado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object pnl1: TPanel
            Left = 0
            Top = 0
            Width = 88
            Height = 20
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Legendas'
            Color = clAppWorkSpace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object shp1: TShape
              Left = 0
              Top = 0
              Width = 88
              Height = 20
              Align = alClient
              Brush.Style = bsClear
            end
          end
          object txt1: TStaticText
            Left = 6
            Top = 112
            Width = 15
            Height = 16
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'A'
            Color = clWindow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 0
          Width = 734
          Height = 17
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object chkCancelada: TCheckBox
            Left = 4
            Top = 0
            Width = 198
            Height = 17
            Caption = 'Mostrar Movimenta'#231#245'es Canceladas'
            TabOrder = 0
            OnClick = chkCanceladaClick
          end
        end
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      742
      51)
    object btn_sair: TSpeedButton
      Left = 693
      Top = 3
      Width = 45
      Height = 45
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
      OnClick = btn_sairClick
    end
    object btn_salvar: TSpeedButton
      Left = 44
      Top = 4
      Width = 40
      Height = 43
      Hint = 'Salvar'
      Enabled = False
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 84
      Top = 4
      Width = 40
      Height = 43
      Hint = 'Cancela Altera'#231#227'o'
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
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 40
      Height = 43
      Hint = 'Incluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_incluirClick
    end
    object btn_excluir: TSpeedButton
      Left = 124
      Top = 4
      Width = 40
      Height = 43
      Hint = 'Cancela Movimenta'#231#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_excluirClick
    end
    object btn_print_: TSpeedButton
      Left = 168
      Top = 4
      Width = 38
      Height = 43
      Hint = 'Impress'#227'o de solicita'#231#227'o'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_print_Click
    end
    object Label2: TLabel
      Left = 216
      Top = 8
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 386
      Top = 21
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
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
      OnClick = btn_co_unid_negClick
    end
    object Label7: TLabel
      Left = 426
      Top = 8
      Width = 50
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_nm_unid_neg: TEdit
      Left = 244
      Top = 21
      Width = 141
      Height = 21
      Anchors = [akTop, akRight]
      ParentColor = True
      ReadOnly = True
      TabOrder = 1
    end
    object edit_nm_usuario: TEdit
      Left = 427
      Top = 21
      Width = 243
      Height = 21
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 217
      Top = 21
      Width = 28
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnChange = msk_cd_unid_negChange
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_vendedorKeyDown
    end
  end
  object MainMenu1: TMainMenu
    Left = 564
    Top = 300
    object mi_incluir: TMenuItem
      Caption = 'Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = btn_salvarClick
    end
    object mi_Cancelar: TMenuItem
      Caption = 'Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_Excluir: TMenuItem
      Caption = 'Excluir'
      OnClick = btn_excluirClick
    end
    object TMenuItem
    end
    object mi_Sair: TMenuItem
      Caption = 'Sair'
      OnClick = btn_sairClick
    end
  end
  object pp_agenda: TppReport
    AutoStop = False
    DataPipeline = datm_agenda_comercial.pp_mensal
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\rel_agenda_mensal.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 532
    Top = 300
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'pp_mensal'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 5556
        mmLeft = 265
        mmTop = 8202
        mmWidth = 197115
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 7408
        mmLeft = 265
        mmTop = 529
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Vendedor: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 8996
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NM_VENDEDOR'
        DataPipeline = datm_agenda_comercial.pp_mensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pp_mensal'
        mmHeight = 4233
        mmLeft = 20108
        mmTop = 8996
        mmWidth = 23019
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 179123
        mmTop = 3175
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Agenda Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 40746
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 60854
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        UserName = 'Region1'
        KeepTogether = True
        Caption = 'Region1'
        Stretch = True
        mmHeight = 60061
        mmLeft = 265
        mmTop = 264
        mmWidth = 197115
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Pen.Color = clGray
          mmHeight = 5556
          mmLeft = 1058
          mmTop = 37570
          mmWidth = 195527
          BandType = 4
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          Pen.Color = clGray
          mmHeight = 5556
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 195527
          BandType = 4
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'calc_descricao_tp_agenda'
          DataPipeline = datm_agenda_comercial.pp_mensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pp_mensal'
          mmHeight = 27781
          mmLeft = 2646
          mmTop = 8201
          mmWidth = 192352
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Observa'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 38364
          mmWidth = 21431
          BandType = 4
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          KeepTogether = True
          CharWrap = False
          DataField = 'OBS_AGENDA'
          DataPipeline = datm_agenda_comercial.pp_mensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'pp_mensal'
          mmHeight = 11642
          mmLeft = 2646
          mmTop = 43655
          mmWidth = 192352
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'calc_mens_tp_agenda'
          DataPipeline = datm_agenda_comercial.pp_mensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pp_mensal'
          mmHeight = 4233
          mmLeft = 174096
          mmTop = 1587
          mmWidth = 21696
          BandType = 4
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'DT_AGENDA'
          DataPipeline = datm_agenda_comercial.pp_mensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pp_mensal'
          mmHeight = 4233
          mmLeft = 11113
          mmTop = 1851
          mmWidth = 17727
          BandType = 4
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 1851
          mmWidth = 8731
          BandType = 4
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Hor'#225'rio: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 45509
          mmTop = 1851
          mmWidth = 14817
          BandType = 4
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'calc_mens_periodo'
          DataPipeline = datm_agenda_comercial.pp_mensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pp_mensal'
          mmHeight = 4233
          mmLeft = 61120
          mmTop = 1851
          mmWidth = 21960
          BandType = 4
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'NM_CONTATO'
          DataPipeline = datm_agenda_comercial.pp_mensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pp_mensal'
          mmHeight = 4233
          mmLeft = 125943
          mmTop = 1851
          mmWidth = 13229
          BandType = 4
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Contato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 110068
          mmTop = 1851
          mmWidth = 14552
          BandType = 4
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pp_agenda
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 500
    Top = 300
  end
end
