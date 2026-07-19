inherited frm_sel_unid_cont: Tfrm_sel_unid_cont
  Left = 267
  Top = 119
  Height = 418
  Caption = 'frm_sel_unid_cont'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 391
    inherited Shape1: TShape
      Height = 321
    end
    inherited lbl_unid_neg: TLabel
      Left = 12
    end
    inherited lbl_produto: TLabel
      Left = 12
    end
    inherited lbl_periodo: TLabel
      Left = 12
      Top = 279
    end
    inherited lbl_a: TLabel
      Top = 298
    end
    inherited lbl_cd_cliente: TLabel
      Left = 12
    end
    inherited lblGrupo: TLabel
      Left = 12
    end
    object lbl_agente: TLabel [11]
      Left = 12
      Top = 164
      Width = 41
      Height = 13
      Caption = 'Agente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_agente: TSpeedButton [12]
      Left = 305
      Top = 179
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
      OnClick = btn_co_agenteClick
    end
    object lbl_transp: TLabel [13]
      Left = 12
      Top = 204
      Width = 80
      Height = 13
      Caption = 'Transportador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_transp: TSpeedButton [14]
      Left = 305
      Top = 219
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
      OnClick = btn_co_transpClick
    end
    inherited lbl_prefixo: TLabel
      Top = 279
    end
    inherited lbl_relatorio: TLabel
      Left = 235
    end
    inherited msk_sg_grupo_area: TMaskEdit
      TabOrder = 20
    end
    inherited btn_imprimir: TButton
      Top = 341
      TabOrder = 9
    end
    inherited btn_sair: TButton
      Top = 341
      TabOrder = 10
    end
    inherited msk_cd_unid_neg: TMaskEdit
      Left = 12
    end
    inherited edt_nm_unid_neg: TEdit
      TabOrder = 11
    end
    inherited msk_cd_produto: TMaskEdit
      Left = 12
    end
    inherited edt_nm_produto: TEdit
      TabOrder = 23
    end
    inherited msk_cd_cliente: TMaskEdit
      Left = 12
    end
    inherited edt_nm_cliente: TEdit
      TabOrder = 13
    end
    inherited mem_field: TMemo
      Left = 12
      Top = 362
      TabOrder = 24
    end
    inherited edt_nm_grupo: TEdit
      TabOrder = 17
    end
    inherited msk_cd_grupo: TMaskEdit
      Left = 12
    end
    inherited msk_nr_cheque: TMaskEdit
      Top = 330
      TabOrder = 12
    end
    inherited msk_cd_prefixo: TMaskEdit
      Top = 293
      TabOrder = 25
    end
    inherited msk_dt_inicio: TDateTimePicker
      Left = 12
      Top = 292
      TabOrder = 26
    end
    inherited msk_dt_fim: TDateTimePicker
      Top = 292
      TabOrder = 27
    end
    inherited chk_excel: TCheckBox
      Left = 292
      Top = 253
      Width = 60
      TabOrder = 14
    end
    inherited msk_nr_relatorio: TMaskEdit
      TabOrder = 7
    end
    inherited msk_cd_fornecedor: TMaskEdit
      TabOrder = 8
    end
    inherited edt_nm_fornecedor: TEdit
      TabOrder = 16
    end
    inherited chk_arquivo: TCheckBox
      Left = 133
      Top = 253
      TabOrder = 6
    end
    inherited msk_cd_area: TMaskEdit
      TabOrder = 15
    end
    inherited edt_nm_area: TEdit
      TabOrder = 21
    end
    object chkbox_po_registro: TCheckBox
      Left = 16
      Top = 248
      Width = 97
      Height = 17
      TabOrder = 22
      Visible = False
    end
    object msk_cd_agente: TMaskEdit
      Left = 12
      Top = 179
      Width = 39
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 4
      OnExit = msk_cd_agenteExit
      OnKeyDown = msk_cd_agenteKeyDown
    end
    object edt_nm_agente: TEdit
      Left = 54
      Top = 179
      Width = 242
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 18
    end
    object msk_cd_transp: TMaskEdit
      Left = 12
      Top = 219
      Width = 39
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 5
      OnExit = msk_cd_transpExit
      OnKeyDown = msk_cd_agenteKeyDown
    end
    object edt_nm_transp: TEdit
      Left = 56
      Top = 219
      Width = 242
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 19
    end
  end
  inherited crp_unid_prod: TCRPE
    Left = 319
    Top = 286
  end
end
