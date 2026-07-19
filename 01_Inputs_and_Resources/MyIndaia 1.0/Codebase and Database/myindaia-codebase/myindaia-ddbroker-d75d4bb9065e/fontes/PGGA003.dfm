object frm_proc_realiza: Tfrm_proc_realiza
  Left = 161
  Top = 137
  Width = 750
  Height = 550
  BorderIcons = [biSystemMenu]
  Caption = 'Realiza'#231#227'o por Processo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_entrada_de_dados: TPanel
    Left = 0
    Top = 147
    Width = 742
    Height = 357
    Align = alClient
    BevelInner = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    DesignSize = (
      742
      357)
    object bvl_cabecalho_grid: TBevel
      Left = 2
      Top = 2
      Width = 738
      Height = 19
      Align = alTop
      Style = bsRaised
    end
    object lbl_Evento: TLabel
      Left = 60
      Top = 3
      Width = 395
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = ' Evento'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 456
      Top = 3
      Width = 65
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_aplic: TLabel
      Left = 583
      Top = 3
      Width = 45
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = ' Aplic'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_Aplicavel: TLabel
      Left = 629
      Top = 3
      Width = 109
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = ' Realiza'#231#227'o'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_cd_evento: TLabel
      Left = 4
      Top = 3
      Width = 55
      Height = 16
      AutoSize = False
      Caption = ' C'#243'digo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 522
      Top = 3
      Width = 60
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Previs'#227'o'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbg_evento_aplicavel: TDBCtrlGrid
      Left = 2
      Top = 21
      Width = 738
      Height = 334
      Align = alClient
      Color = clWhite
      DataSource = datm_proc_realiza.ds_tfollowup
      PanelHeight = 20
      PanelWidth = 722
      ParentColor = False
      TabOrder = 0
      RowCount = 16
      SelectedColor = clTeal
      object DBText1: TDBText
        Left = 6
        Top = 3
        Width = 50
        Height = 16
        DataField = 'CD_EVENTO'
        DataSource = datm_proc_realiza.ds_tfollowup
      end
      object DBText2: TDBText
        Left = 59
        Top = 3
        Width = 436
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Look_Evento'
        DataSource = datm_proc_realiza.ds_tfollowup
      end
      object DBText3: TDBText
        Left = 455
        Top = 3
        Width = 60
        Height = 14
        Anchors = [akTop, akRight]
        DataField = 'CalcAtrazado'
        DataSource = datm_proc_realiza.ds_tfollowup
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 434
        Top = 3
        Width = 17
        Height = 14
        Anchors = [akTop, akRight]
        DataField = 'CAlcBloqueado'
        DataSource = datm_proc_realiza.ds_tfollowup
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 521
        Top = 3
        Width = 60
        Height = 14
        Anchors = [akTop, akRight]
        DataField = 'DT_PREVISTA'
        DataSource = datm_proc_realiza.ds_tfollowup
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedt_realiza: TDBEdit
        Left = 627
        Top = 0
        Width = 94
        Height = 19
        Anchors = [akTop, akRight]
        AutoSize = False
        BevelOuter = bvNone
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'DT_REALIZACAO'
        DataSource = datm_proc_realiza.ds_tfollowup
        ParentCtl3D = False
        TabOrder = 0
        OnChange = dbedt_realizaChange
        OnDblClick = dbedt_realizaDblClick
        OnEnter = dbedt_realizaEnter
        OnExit = dbedt_realizaExit
      end
      object dbchk_aplic: TDBCheckBox
        Left = 595
        Top = 3
        Width = 16
        Height = 14
        Anchors = [akTop, akRight]
        Ctl3D = False
        DataField = 'IN_APLICAVEL'
        DataSource = datm_proc_realiza.ds_tfollowup
        ParentCtl3D = False
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  object pnl_manut_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      742
      49)
    object btn_sair: TSpeedButton
      Left = 351
      Top = 4
      Width = 37
      Height = 41
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
      OnClick = btn_sairClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 5
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Manuten'#231#227'o do Processo - <F2>'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_manut_procClick
    end
    object btn_proc_vinc: TSpeedButton
      Left = 42
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Realiza'#231#227'o do Processo Vinculado'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_proc_vincClick
    end
    object bvl_nm_usuario: TBevel
      Left = 392
      Top = 3
      Width = 346
      Height = 43
      Anchors = [akTop, akRight]
      Style = bsRaised
    end
    object lbl_nm_usuario: TLabel
      Left = 398
      Top = 7
      Width = 48
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_canal: TLabel
      Left = 608
      Top = 7
      Width = 33
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Canal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_obs: TButton
      Left = 96
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Observa'#231#245'es'
      Enabled = False
      TabOrder = 0
      OnClick = btn_obsClick
    end
    object edt_nm_usuario: TEdit
      Left = 398
      Top = 20
      Width = 205
      Height = 22
      TabStop = False
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      Text = 'edt_nm_usuario'
    end
    object dblkpcbox_canal: TDBLookupComboBox
      Left = 609
      Top = 20
      Width = 124
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'LookCanal'
      DataSource = datm_proc_realiza.ds_proc_edita
      DropDownRows = 3
      TabOrder = 2
      OnExit = dblkpcbox_canalExit
    end
  end
  object pnl_selecao: TPanel
    Left = 0
    Top = 49
    Width = 742
    Height = 98
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbl_cd_cliente: TLabel
      Left = 455
      Top = 11
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
    object lbl_nr_processo: TLabel
      Left = 12
      Top = 50
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_processo: TSpeedButton
      Left = 126
      Top = 63
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
      OnClick = btn_processoClick
    end
    object Label3: TLabel
      Left = 233
      Top = 11
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_cd_produto: TSpeedButton
      Left = 419
      Top = 24
      Width = 25
      Height = 22
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 11
      Top = 11
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_cd_unid_neg: TSpeedButton
      Left = 198
      Top = 24
      Width = 25
      Height = 22
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
      OnClick = btn_cd_unid_negClick
    end
    object lbl_cd_servico: TLabel
      Left = 456
      Top = 50
      Width = 44
      Height = 13
      Caption = 'Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_proc_evento: TLabel
      Left = 279
      Top = 50
      Width = 41
      Height = 13
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msk_nr_processo: TMaskEdit
      Left = 12
      Top = 63
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 234
      Top = 24
      Width = 24
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 258
      Top = 24
      Width = 160
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 12
      Top = 24
      Width = 25
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 37
      Top = 24
      Width = 160
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 456
      Top = 24
      Width = 44
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_CLIENTE'
      DataSource = datm_proc_realiza.ds_processo
      ReadOnly = True
      TabOrder = 6
    end
    object dbedt_cd_servico: TDBEdit
      Left = 456
      Top = 63
      Width = 44
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_SERVICO'
      DataSource = datm_proc_realiza.ds_processo
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_nm_cliente: TDBEdit
      Left = 500
      Top = 24
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'AP_EMPRESA'
      DataSource = datm_proc_realiza.ds_processo
      ReadOnly = True
      TabOrder = 8
    end
    object dbedt_nm_servico: TDBEdit
      Left = 500
      Top = 63
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NM_SERVICO'
      DataSource = datm_proc_realiza.ds_processo
      ReadOnly = True
      TabOrder = 9
    end
    object msk_evento: TMaskEdit
      Left = 280
      Top = 63
      Width = 165
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = msk_eventoChange
      OnExit = msk_eventoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object chkProcessos: TCheckBox
      Left = 155
      Top = 65
      Width = 124
      Height = 17
      Caption = #218'ltimos Processos'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
  end
  object menu_manut: TMainMenu
    Left = 561
    Top = 8
    object mi_manut_proc: TMenuItem
      Caption = '&Manuten'#231#227'o do Processo'
      ShortCut = 113
      OnClick = btn_manut_procClick
    end
    object mi_proc_vinc: TMenuItem
      Caption = 'Realiza'#231#227'o do Processo Vinculado'
      Enabled = False
      OnClick = btn_proc_vincClick
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
end
