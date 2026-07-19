object frm_fatura_comercial2: Tfrm_fatura_comercial2
  Left = 1161
  Top = 274
  Width = 338
  Height = 296
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 258
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object shp2: TShape
      Left = 30
      Top = 138
      Width = 92
      Height = 41
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape1: TShape
      Left = 10
      Top = 10
      Width = 302
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 119
      Height = 16
      Caption = 'Fatura Comercial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 219
      Top = 220
      Width = 93
      Height = 28
      Caption = '&Emitir Fatura'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Shape2: TShape
      Left = 10
      Top = 36
      Width = 303
      Height = 163
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label2: TLabel
      Left = 28
      Top = 93
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
    object Label3: TLabel
      Left = 28
      Top = 53
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
    object btn_co_unid_neg: TSpeedButton
      Left = 228
      Top = 66
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
      OnClick = btn_co_unid_negClick
    end
    object btn_nr_processo: TSpeedButton
      Left = 156
      Top = 106
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
      OnClick = btn_nr_processoClick
    end
    object edt_nm_unid_neg: TEdit
      Left = 52
      Top = 66
      Width = 175
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object mskedt_nr_processo: TMaskEdit
      Left = 29
      Top = 106
      Width = 127
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 2
      OnExit = mskedt_nr_processoExit
      OnKeyDown = mskedt_cd_unid_negKeyDown
    end
    object mskedt_cd_unid_neg: TMaskEdit
      Left = 29
      Top = 66
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
      TabOrder = 0
      OnChange = btn_co_unid_negClick
      OnKeyDown = mskedt_cd_unid_negKeyDown
    end
    object rb_original: TRadioButton
      Left = 34
      Top = 142
      Width = 83
      Height = 17
      Caption = 'Original'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object rb_copia: TRadioButton
      Left = 34
      Top = 158
      Width = 83
      Height = 17
      Caption = 'C'#243'pia'
      TabOrder = 4
    end
    object chkProcessos: TCheckBox
      Left = 183
      Top = 108
      Width = 124
      Height = 17
      Caption = #218'ltimos Processos'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object pnl1: TPanel
      Left = 124
      Top = 138
      Width = 167
      Height = 41
      BevelOuter = bvNone
      Caption = 'pnl1'
      TabOrder = 6
      object shp1: TShape
        Left = 0
        Top = 0
        Width = 167
        Height = 41
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object rbFatura: TRadioButton
        Left = 5
        Top = 4
        Width = 113
        Height = 17
        Caption = 'Quebra por Fatura'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbFaturaPedido: TRadioButton
        Left = 5
        Top = 20
        Width = 151
        Height = 17
        Caption = 'Quebra por Fatura + Pedido'
        TabOrder = 1
      end
    end
    object pnlPedido: TPanel
      Left = 20
      Top = 65
      Width = 281
      Height = 91
      BevelInner = bvLowered
      BorderWidth = 2
      Color = clBlack
      TabOrder = 7
      Visible = False
      object pnlpedido2: TPanel
        Left = 4
        Top = 4
        Width = 273
        Height = 83
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrintPedido: TSpeedButton
          Left = 177
          Top = 50
          Width = 93
          Height = 28
          Caption = '&Emitir Fatura'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          OnClick = btnPrintPedidoClick
        end
        object lblFechar: TLabel
          Left = 254
          Top = 2
          Width = 15
          Height = 13
          Caption = '[x]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblFecharClick
        end
        object lbl1: TLabel
          Left = 4
          Top = 3
          Width = 181
          Height = 13
          Caption = 'Escolha a Fatura que deseja imprimir...'
        end
        object cbbPedido: TComboBox
          Left = 6
          Top = 23
          Width = 262
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
  end
  object crp_fatura: TCRPE
    WindowShowPrintSetupBtn = False
    WindowShowProgressCtls = False
    WindowState = wsNormal
    LoadEngineOnUse = False
    Left = 37
    Top = 3
  end
  object ds_total: TDataSource
    DataSet = qry_total_
    Left = 102
    Top = 7
  end
  object qry_total_: TQuery
    OnCalcFields = qry_total_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT E.NR_PROCESSO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.NM_EMPRESA ELSE '#39#39' END AS NM_EMPRESA,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_EMPRESA ELSE '#39#39' END AS END_EMPRESA,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_NUMERO ELSE '#39#39' END AS END_NUMERO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_COMPL ELSE '#39#39' END AS END_COMPL,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_ESTADO ELSE '#39#39' END AS END_ESTADO,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_TELEFONE, '#39#39') WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39'TEL: '#39' +ISNULL(EE1.NR_TELEFONE, '#39#39') END'
      '       ELSE '#39#39' END AS NR_TELEFONE,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_FAX, '#39#39') WHEN '#39#39' THEN' +
        ' '#39#39' ELSE '#39'FAX: '#39' +ISNULL(EE1.NR_FAX, '#39#39') END'
      '       ELSE '#39#39' END AS NR_FAX,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_RUC, '#39#39') WHEN '#39#39' THEN' +
        ' '#39#39' ELSE '#39'RUC: '#39' + EE1.NR_RUC END'
      '       ELSE '#39#39' END AS NR_RUC,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_NIT, '#39#39') WHEN '#39#39' THEN' +
        ' '#39#39' ELSE '#39'NIT: '#39' + EE1.NR_NIT END'
      '       ELSE '#39#39' END AS NR_NIT,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_CUIT, '#39#39') WHEN '#39#39' THE' +
        'N '#39#39' ELSE '#39'CUIT: '#39' + EE1.NR_CUIT END'
      '       ELSE '#39#39' END AS NR_CUIT,'
      ''
      '       (CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_POR' +
        'T FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE1.CD_PAIS)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_ING' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE1.CD_PAIS)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ESP' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE1.CD_PAIS)'
      '        END) AS NM_PAIS, EE1.END_CIDADE,'
      
        '       (SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = E.CD_EXPORTADOR) AS CLIENTE,'
      
        '       (SELECT END_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_E' +
        'MPRESA = E.CD_EXPORTADOR) AS END_CLIENTE,'
      
        '       (SELECT END_NUMERO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = E.CD_EXPORTADOR) AS NUM_CLIENTE,'
      
        '       (SELECT END_COMPL FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMP' +
        'RESA = E.CD_EXPORTADOR) AS COMPL_CLIENTE,'
      
        '       (SELECT END_CIDADE FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = E.CD_EXPORTADOR) AS CIDADE_CLIENTE,'
      
        '       (SELECT END_UF FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_EXPORTADOR) AS UF_CLIENTE,'
      
        '       (SELECT END_CEP FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_EXPORTADOR) AS CEP_CLIENTE,'
      
        '       (SELECT NR_TELEFONE FROM TEMPRESA_NAC (NOLOCK) WHERE CD_E' +
        'MPRESA = E.CD_EXPORTADOR) AS TEL_CLIENTE,'
      
        '       (SELECT NR_FAX FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_EXPORTADOR) AS FAX_CLIENTE,'
      
        '       (SELECT '#39'CNPJ:'#39' +SUBSTRING(CGC_EMPRESA,1,2)+'#39'.'#39'+SUBSTRING' +
        '(CGC_EMPRESA,3,3)+'#39'.'#39'+SUBSTRING(CGC_EMPRESA,6,3)+'#39'/'#39'+SUBSTRING(C' +
        'GC_EMPRESA,9,4)+'#39'-'#39'+SUBSTRING(CGC_EMPRESA,13,2)'
      
        '           FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = E.CD_EX' +
        'PORTADOR) AS CGC_CLIENTE,'
      '     '
      '       LTRIM(RTRIM((CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_VIA_TRAN' +
        'SP FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD_V' +
        'IA_TRANSPORTE)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_VIA_TRAN' +
        'SP_INGLES FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP =' +
        ' E.CD_VIA_TRANSPORTE)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_VIA_TRAN' +
        'SP_ESP FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.' +
        'CD_VIA_TRANSPORTE)'
      '        END))) +       '
      
        '        CASE WHEN P.CD_GRUPO = '#39'028'#39' AND P.CD_PAIS_DESTINO ='#39'169' +
        #39' /*SAINT GOBAIN - DESTINO COLOMBIA*/'
      '             THEN '#39'  INCOTERM-PONTO DESTINO'#39
      '             ELSE '#39#39
      '        END  AS VIA,'
      '        '
      '        '
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_CON' +
        'SIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'4'#39' THEN (' +
        'SELECT NM_DESPACHANTE FROM TDESPACHANTE  WHERE CD_DESPACHANTE = ' +
        'E.CD_CONSIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS NM_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT END_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRE' +
        'SA = E.CD_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT END_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.C' +
        'D_CONSIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS END_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT ISNULL(LTRIM(END_NUMERO), '#39#39') + '#39' '#39' + ISNULL' +
        '(LTRIM(END_COMPL), '#39#39') FROM TEMPRESA_EST WHERE CD_EMPRESA = E.CD' +
        '_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT END_COMPL_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO' +
        ' = E.CD_CONSIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS END_CONSIGNATARIO_2,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      '                               CASE'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39 +
        ' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39 +
        ' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39 +
        ' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO))'
      '                               END'
      '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN'
      '                                CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_CONSIGNATARIO))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_CONSIGNATARIO))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_CONSIGNATARIO))'
      '                                END'
      '                        END'
      '       ELSE '#39#39' END AS PAIS_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT ISNULL(END_CIDADE, '#39#39') FROM TEMPRESA_EST (NO' +
        'LOCK) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT CD_CIDADE FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_CON' +
        'SIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS CIDADE_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      
        '           WHEN '#39#39' THEN (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMP' +
        'RESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '       ELSE '#39#39' END AS ESTADO_CONSIG,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                           (SELECT CASE ISNULL(NR_TELEFONE, '#39#39')' +
        ' WHEN '#39#39' THEN '#39#39' ELSE '#39'TEL: '#39' +ISNULL(NR_TELEFONE, '#39#39') END FROM ' +
        'TEMPRESA_EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS TELEFONE_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                            (SELECT CASE ISNULL(NR_FAX, '#39#39') WHE' +
        'N '#39#39' THEN '#39#39' ELSE '#39'FAX: '#39' +ISNULL(NR_FAX, '#39#39') END FROM TEMPRESA_' +
        'EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS FAX_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                            (SELECT CASE ISNULL(NR_RUC, '#39#39') WHE' +
        'N '#39#39' THEN '#39#39' ELSE '#39'RUC: '#39' +ISNULL(NR_RUC, '#39#39') END FROM TEMPRESA_' +
        'EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                         ELSE '#39#39' END'
      '       ELSE '#39#39' END AS RUC_CONSIGNATARIO,'
      ''
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                           (SELECT CASE ISNULL(NR_NIT, '#39#39') WHEN' +
        ' '#39#39' THEN '#39#39' ELSE '#39'NIT: '#39' +ISNULL(NR_NIT, '#39#39') END FROM TEMPRESA_E' +
        'ST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS NIT_CONSIGNATARIO,'
      ''
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                           (SELECT CASE ISNULL(NR_CUIT, '#39#39') WHE' +
        'N '#39#39' THEN '#39#39' ELSE '#39'CUIT: '#39' +ISNULL(NR_CUIT, '#39#39') END FROM TEMPRES' +
        'A_EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS CUIT_CONSIGNATARIO,'
      ''
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E.' +
        'CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'4'#39' THEN (SELECT' +
        ' NM_DESPACHANTE FROM TDESPACHANTE  WHERE CD_DESPACHANTE = E.CD_N' +
        'OTIFY1)'
      '                         END'
      '       ELSE '#39#39' END AS NM_NOTIFY,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT END_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E' +
        '.CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' END_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTI' +
        'FY1)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(LTRIM(END_NUMERO), '#39#39') + '#39' '#39' + ISNULL(LTRIM' +
        '(END_COMPL), '#39#39') FROM TEMPRESA_EST WHERE CD_EMPRESA = E.CD_NOTIF' +
        'Y1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' END_COMPL_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.C' +
        'D_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY_2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      '                                CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY1))'
      '                                END'
      '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN'
      '                                CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_NOTIFY1))'
      '                                END'
      '                        END'
      '       ELSE '#39#39' END AS PAIS_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(END_CIDADE, '#39#39') FROM TEMPRESA_EST (NOLOCK) ' +
        'WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' CD_CIDADE FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS CIDADE_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMP' +
        'RESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS ESTADO_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_TELEFONE,' +
        ' '#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39'TEL: '#39'+ISNULL(NR_TELEFONE, '#39#39') END FR' +
        'OM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS TELEFONE_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_FAX, '#39#39') ' +
        'WHEN '#39#39' THEN '#39#39' ELSE '#39'FAX: '#39'+ISNULL(NR_FAX, '#39#39') END FROM TEMPRES' +
        'A_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS FAX_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_RUC, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'RUC: '#39'+NR_RUC END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS RUC_NOTIFY,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_NIT, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'NIT: '#39'+NR_NIT END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS NIT_NOTIFY,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_CUIT, '#39#39') WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39'CUIT: '#39'+NR_CUIT END FROM TEMPRESA_EST (NOLOCK) WH' +
        'ERE CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS CUIT_NOTIFY,'
      ''
      ''
      '       (CASE'
      '          WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN'
      
        '           (CASE (SELECT ISNULL(NM_CONTATO, '#39#39') FROM TEMPRESA_ES' +
        'T (NOLOCK) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '              WHEN '#39#39' THEN '#39#39
      
        #9#9#9'  ELSE(SELECT ISNULL(NM_CONTATO, '#39#39') FROM TEMPRESA_EST (NOLOC' +
        'K) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      #9#9#9'END)'
      '          ELSE '#39#39
      '        END) AS CONTATO_NOTIFY,'
      '       E.CD_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E.' +
        'CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'4'#39' THEN (SELECT' +
        ' NM_DESPACHANTE FROM TDESPACHANTE  WHERE CD_DESPACHANTE = E.CD_N' +
        'OTIFY2)'
      '                        END'
      '       ELSE '#39#39' END AS NM_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT END_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E' +
        '.CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' END_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTI' +
        'FY2)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(LTRIM(END_NUMERO), '#39#39') + '#39' '#39' + ISNULL(LTRIM' +
        '(END_COMPL), '#39#39') FROM TEMPRESA_EST WHERE CD_EMPRESA = E.CD_NOTIF' +
        'Y2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' END_COMPL_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.C' +
        'D_NOTIFY2)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY2_2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      '                               CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY2))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY2))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY2))'
      '                               END'
      '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN'
      '                               CASE'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39 +
        ' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE COD' +
        'IGO = E.CD_NOTIFY2))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39 +
        ' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE COD' +
        'IGO = E.CD_NOTIFY2))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39 +
        ' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE COD' +
        'IGO = E.CD_NOTIFY2))'
      '                               END'
      '                        END'
      '       ELSE '#39#39' END AS PAIS_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(END_CIDADE, '#39#39') FROM TEMPRESA_EST (NOLOCK) ' +
        'WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' CD_CIDADE FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY2)'
      '                        END'
      '       ELSE '#39#39' END AS CIDADE_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMP' +
        'RESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS ESTADO_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_TELEFONE,' +
        ' '#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39'TEL: '#39'+ISNULL(NR_TELEFONE, '#39#39') END FR' +
        'OM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      '                         ELSE '#39#39' END'
      '       ELSE '#39#39' END AS TELEFONE_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_FAX, '#39#39') ' +
        'WHEN '#39#39' THEN '#39#39' ELSE '#39'FAX: '#39'+NR_FAX END FROM TEMPRESA_EST (NOLOC' +
        'K) WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS FAX_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_RUC, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'RUC: '#39'+NR_RUC END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS RUC_NOTIFY2,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_NIT, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'NIT: '#39'+NR_NIT END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS NIT_NOTIFY2,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_CUIT, '#39#39') WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39'CUIT: '#39'+NR_CUIT END FROM TEMPRESA_EST (NOLOCK) WH' +
        'ERE CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS CUIT_NOTIFY2,'
      ''
      ''
      '       (CASE'
      
        '          WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) ' +
        'WHERE CD_SERVICO = P.CD_SERVICO) IN ('#39'01'#39', '#39'12'#39', '#39'02'#39') THEN'
      
        '               (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) W' +
        'HERE CD_EMBARCACAO = P.CD_EMBARCACAO)'
      
        '          WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK)W' +
        'HERE CD_SERVICO = P.CD_SERVICO) IN ('#39'07'#39') THEN (P.NR_CAMINHAO)'
      
        '          WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) ' +
        'WHERE CD_SERVICO = P.CD_SERVICO) IN ('#39'04'#39') THEN (P.NR_VOO)'
      '        END) AS TRANSPORTE,'
      '        P.NR_CONHECIMENTO, P.NR_CONHECIMENTO_MASTER,'
      '       (CASE'
      '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN NM_TERMO_PAGTO  '
      '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN TX_TERMO_INGLES '
      '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN TX_TERMO_ESP '
      '        END) AS TERMO_PAGTO,'
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.C' +
        'D_LOCAL_ORIGEM) NM_LOCAL_ORIGEM,'
      '       (CASE'
      '         WHEN E.CD_LINGUA_PEDIDO IN ('#39'0'#39','#39'2'#39') THEN '#39'BRASIL'#39
      
        '    '#9#9' ELSE (CASE WHEN (SELECT CD_GRUPO FROM TPROCESSO  WHERE NR' +
        '_PROCESSO = E.NR_PROCESSO) IN ('#39'028'#39', '#39'923'#39','#39'329'#39') THEN '#39'BRASIL'#39
      
        #9#9'      '#9'   ELSE '#39'BRAZIL'#39' END)-- ALTERADO PARA SER APRESENTADO E' +
        'M PORTUGUES, INDEPENDETE DO IDIOMA PARA SG ANDR'#201' 03/08/2009'
      '       END) AS NM_PAIS_ORIGEM,'
      
        '       (SELECT L.DESCRICAO + '#39' - '#39' + ISNULL(L.CD_UF,'#39#39') + '#39' - '#39' ' +
        'FROM TLOCAL_EMBARQUE L WHERE L.CODIGO = E.CD_LOCAL_ORIGEM) NM_LO' +
        'CAL_ORIGEM_AJI,       '
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.C' +
        'D_LOCAL_DESTINO) NM_LOCAL_DESTINO,'
      '       (CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_POR' +
        'T FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = E.CD_PAIS_DESTINO)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_ING' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = E.CD_PAIS_DESTINO)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ESP' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = E.CD_PAIS_DESTINO)'
      '        END) NM_PAIS_DESTINO,'
      '       CONVERT(DECIMAL(16,3), E.VL_TOT_QTDE_PROD) AS QTDE,'
      
        '       CONVERT(DECIMAL(16,3), E.VL_PESO_LIQUIDO) AS PESO_LIQUIDO' +
        ','
      '       CONVERT(DECIMAL(16,3), E.VL_PESO_BRUTO) AS PESO_BRUTO,'
      '       CONVERT(DECIMAL(16,3), E.VL_TOT_CUBAGEM) AS CUBAGEM,'
      '       CONVERT(DECIMAL(16,2), E.VL_TOT_FOB) AS TOTAL_FOB,'
      '       CONVERT(DECIMAL(16,2), E.VL_DESCONTO) AS TOTAL_DESC,'
      
        '       CONVERT(DECIMAL(16,2), E.VL_TOT_FOB) - CONVERT(DECIMAL(16' +
        ',2), E.VL_DESCONTO) AS SUB_TOT,'
      '       CONVERT(DECIMAL(16,2), E.VL_FRETE) AS FRETE,'
      '       CONVERT(DECIMAL(16,2), E.VL_SEGURO) AS SEGURO,'
      
        '       CONVERT(DECIMAL(16,2), E.VL_TOT_MCV) TOTAL_MCV, E.CD_INCO' +
        'TERM,'
      
        '       CONVERT(DECIMAL(16,2), E.VL_TOT_DESPESA) AS TOTAL_DESPESA' +
        ','
      '       CONVERT(DECIMAL(16,2), E.VL_FRETE_INT) FRETE_INTERNO,'
      '       E.NR_FATURA,'
      '       DATEPART(DD, E.DT_FATURA) DIA_FATURA,'
      '       DATEPART(MM, E.DT_FATURA) MES_FATURA,'
      '       DATEPART(YYYY, E.DT_FATURA) ANO_FATURA,'
      '       E.TX_DECL_ADICIONAL, P.TX_MERCADORIA,'
      '       E.CD_LINGUA_PEDIDO,'
      '       ISNULL(MB.AP_MOEDA, '#39#39') AS SIGLA_MOEDA,'
      '       (CASE'
      
        '          WHEN P.TP_BANCO_EXP = '#39'1'#39' THEN (SELECT NM_EMPRESA FROM' +
        ' TEMPRESA_EST WHERE CD_EMPRESA = P.CD_BANCO_EXP)'
      '        ELSE'
      '          (CASE'
      '             WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN '#39'N'#195'O POSSUI'#39
      '             WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN '#39'NO CHARGE'#39
      '             WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN '#39'NO TIENE'#39
      '           END) '
      '        END) AS NOME_BANCO,'
      '        (CASE'
      
        '          WHEN P.TP_BANCO_EXP = '#39'1'#39' THEN (SELECT RTRIM(LTRIM(END' +
        '_EMPRESA)) + '#39', '#39' + '
      
        '                                                 RTRIM(LTRIM(END' +
        '_NUMERO))  FROM TEMPRESA_EST WHERE CD_EMPRESA = P.CD_BANCO_EXP)'
      '         END) AS END_BANCO,'
      '         E.TX_MARCACAO_VOLUME,'
      '         E.TX_INF_EMBALAGEM,'
      ''
      
        '  CASE WHEN ((EN.CGC_EMPRESA = '#39'71587240000263'#39') OR (EN.CGC_EMPR' +
        'ESA = '#39'71587240000182'#39'))'
      '       THEN '#39'C:\DDBroker\doble_a.bmp'#39
      '       ELSE CASE WHEN P.CD_GRUPO = '#39'895'#39
      '                 THEN ( '#39'C:\DDBroker\logo_airproducts.jpg'#39' )'
      '                 ELSE CASE ISNULL(TX_LOGOMARCA, '#39#39')'
      '                           WHEN '#39#39' '
      
        '                           THEN ( '#39'C:\DDBroker\SG_ABRASIVES.bmp'#39 +
        ' )'
      
        '                           ELSE ( '#39'C:\DDBroker\'#39' + E.TX_LOGOMARC' +
        'A )'
      '                      END '
      '            END              '
      '  END AS TX_LOGOMARCA,'
      '            '
      '           CASE ISNULL(EN.PATH_LOGO, '#39#39')'
      '                WHEN '#39#39' '
      '                THEN ( '#39#39' )'
      '                ELSE ( '#39'C:\DDBroker\'#39' + EN.PATH_LOGO )'
      '         END AS TX_LOGOMARCA_EMPRESA_NAC,         '
      ''
      '/*'
      '         CASE E.CD_TIPO_FRETE'
      
        '           WHEN '#39'0'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_ORIGEM)'
      
        '           WHEN '#39'1'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_DESTINO)'
      '         END AS LOCAL_TOTAL,'
      '*/'
      ''
      '        Upper( CASE substring(E.CD_INCOTERM,1,1)'
      
        '           when '#39'E'#39' THEN (SELECT END_CIDADE FROM TEMPRESA_NAC WH' +
        'ERE CD_EMPRESA= E.CD_EXPORTADOR )'
      
        '           WHEN '#39'F'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_ORIGEM)'
      
        '           WHEN '#39'C'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_DESTINO)'
      '           WHEN '#39'D'#39' THEN EE1.END_CIDADE'
      ''
      '         END) AS LOCAL_TOTAL,'
      ''
      ''
      ''
      '         CASE E.CD_TIPO_FRETE'
      '           WHEN '#39'0'#39' THEN EC.NM_LOCAL_ORIGEM'
      '           WHEN '#39'1'#39' THEN EC.NM_LOCAL_DESTINO'
      '         END AS LOCAL_TOTAL_CARTA,'
      
        '         (CASE ISNULL((SELECT CD_VIA_TRANSPORTE FROM TSERVICO WH' +
        'ERE CD_SERVICO = P.CD_SERVICO), '#39#39')'
      '           WHEN '#39'04'#39' THEN '#39'FCA'#39
      '           WHEN '#39'07'#39' THEN '#39'FCA'#39
      '           WHEN '#39'06'#39' THEN '#39'FCA'#39
      '           ELSE '#39'FOB'#39
      '         END) AS INCOTERM_MERC,'
      ' '#9' EC.TX_IMPORTADOR, EC.TX_EXPORTADOR, EC.TX_CONSIGNATARIO,'
      ' '#9' EC.TX_NOTIFY1, EC.TX_NOTIFY2, EC.TX_DOCTO, EC.TX_COPIA, '
      #9' EC.TX_SAQUE, EC.NM_UNID_MED_PL, EC.NM_UNID_MED_PB, '
      #9' EC.NM_LOCAL_DESTINO, EC.NM_LOCAL_ORIGEM, EC.NM_PAIS_DESTINO,'
      
        #9' EC.NM_PAIS_ORIGEM, EC.TX_TERMO_PAGTO, '#9'CASE E.CD_INCOTERM when' +
        ' '#39'EXW'#39' then '#39'EXW'#39' else CASE E.CD_VIA_TRANSPORTE'#9'      '#9'when '#39'01'#39 +
        ' then '#39'FOB'#39' when '#39'04'#39' then '#39'FCA'#39' when '#39'07'#39' then '#39'FCA'#39' END'#9'end as' +
        ' INCOTERM2,'
      '  (CASE'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_VIA_TRANSP FR' +
        'OM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD_VIA_TR' +
        'ANSPORTE) + '#39' Frete / '#39
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_VIA_TRANSP_IN' +
        'GLES FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD' +
        '_VIA_TRANSPORTE) + '#39' Freight / '#39
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_VIA_TRANSP_ES' +
        'P FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD_VI' +
        'A_TRANSPORTE) + '#39' Frete / '#39
      '   END) AS VIA_AJI,'
      
        '  (SELECT C.NM_CONTATO FROM TCLIENTE_CONTATO C (NOLOCK) WHERE C.' +
        'CD_CLIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG AND ' +
        'P.CD_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO) NM_' +
        'CONTATO,'
      '  (CASE'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT TX_CARGO + '#39' - '#39 +
        ' + TX_DEPARTAMENTO FROM TCLIENTE_CONTATO C (NOLOCK) WHERE C.CD_C' +
        'LIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG AND P.CD' +
        '_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO)'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT TX_CARGO_ING + '#39 +
        ' - '#39' + TX_DEPARTAMENTO_ING FROM TCLIENTE_CONTATO C (NOLOCK) WHER' +
        'E C.CD_CLIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG ' +
        'AND P.CD_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO)'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT TX_CARGO_ESP + '#39 +
        ' - '#39' + TX_DEPARTAMENTO_ESP FROM TCLIENTE_CONTATO C (NOLOCK) WHER' +
        'E C.CD_CLIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG ' +
        'AND P.CD_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO)'
      '   END) AS CONTATO_CARGO,'
      '   E.CD_IMPORTADOR   '
      'FROM TPROCESSO_EXP              E   (NOLOCK)'
      
        ' INNER JOIN TPROCESSO_EXP_ITEM  EI  (NOLOCK) ON EI.NR_PROCESSO  ' +
        '  = E.NR_PROCESSO'
      
        '  LEFT JOIN TEMPRESA_EST        EE1 (NOLOCK) ON EE1.CD_EMPRESA  ' +
        '  = E.CD_IMPORTADOR'
      
        '  LEFT JOIN TTERMO_PAGTO        TP  (NOLOCK) ON TP.CD_TERMO_PAGT' +
        'O = E.CD_TERMO_PAGTO'
      
        '       JOIN TPROCESSO           P   (NOLOCK) ON P.NR_PROCESSO   ' +
        '  = E.NR_PROCESSO'
      
        '  LEFT JOIN TEXP_CARTA_CRED     EC  (NOLOCK) ON EC.NR_PROCESSO  ' +
        '  = E.NR_PROCESSO'
      
        '  LEFT JOIN TMOEDA_BROKER       MB  (NOLOCK) ON MB.CD_MOEDA     ' +
        '  = E.CD_MOEDA'
      
        '       JOIN TEMPRESA_NAC        EN  (NOLOCK) ON EN.CD_EMPRESA   ' +
        '  = P.CD_CLIENTE '
      'WHERE E.NR_PROCESSO = :PROCESSO')
    Left = 136
    Top = 158
    ParamData = <
      item
        DataType = ftString
        Name = 'PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_total_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qry_total_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qry_total_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_total_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 41
    end
    object qry_total_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_total_NM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      FixedChar = True
      Size = 60
    end
    object qry_total_END_CONSIGNATARIO: TStringField
      FieldName = 'END_CONSIGNATARIO'
      FixedChar = True
      Size = 100
    end
    object qry_total_END_CONSIGNATARIO_2: TStringField
      FieldName = 'END_CONSIGNATARIO_2'
      FixedChar = True
      Size = 100
    end
    object qry_total_CIDADE_CONSIGNATARIO: TStringField
      FieldName = 'CIDADE_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qry_total_TRANSPORTE: TStringField
      FieldName = 'TRANSPORTE'
      FixedChar = True
      Size = 40
    end
    object qry_total_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_total_TERMO_PAGTO: TMemoField
      FieldName = 'TERMO_PAGTO'
      BlobType = ftMemo
    end
    object qry_total_NM_LOCAL_ORIGEM: TStringField
      FieldName = 'NM_LOCAL_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_total_NM_LOCAL_DESTINO: TStringField
      FieldName = 'NM_LOCAL_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_total_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_total_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_total_DIA_FATURA: TIntegerField
      FieldName = 'DIA_FATURA'
    end
    object qry_total_MES_FATURA: TIntegerField
      FieldName = 'MES_FATURA'
    end
    object qry_total_ANO_FATURA: TIntegerField
      FieldName = 'ANO_FATURA'
    end
    object qry_total_TX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object qry_total_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_total_calc_dt_fatura: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'calc_dt_fatura'
      Size = 50
      Calculated = True
    end
    object qry_total_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_total_SIGLA_MOEDA: TStringField
      FieldName = 'SIGLA_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_total_NOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      FixedChar = True
      Size = 60
    end
    object qry_total_calc_incoterm: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_incoterm'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_importador: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_importador'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_import2: TStringField
      DisplayWidth = 255
      FieldKind = fkCalculated
      FieldName = 'calc_import2'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_consig2: TStringField
      DisplayWidth = 255
      FieldKind = fkCalculated
      FieldName = 'calc_consig2'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_consig: TStringField
      DisplayWidth = 255
      FieldKind = fkCalculated
      FieldName = 'calc_consig'
      Size = 255
      Calculated = True
    end
    object qry_total_QTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qry_total_PESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '#0,000'
    end
    object qry_total_PESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '#0,000'
    end
    object qry_total_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      DisplayFormat = '#0,.000'
    end
    object qry_total_TOTAL_FOB: TFloatField
      FieldName = 'TOTAL_FOB'
      DisplayFormat = '#0,.00'
    end
    object qry_total_FRETE: TFloatField
      FieldName = 'FRETE'
      DisplayFormat = '#0,.00'
    end
    object qry_total_SEGURO: TFloatField
      FieldName = 'SEGURO'
      DisplayFormat = '#0,.00'
    end
    object qry_total_TOTAL_MCV: TFloatField
      FieldName = 'TOTAL_MCV'
      DisplayFormat = '#0,.00'
    end
    object qry_total_TOTAL_DESPESA: TFloatField
      FieldName = 'TOTAL_DESPESA'
      DisplayFormat = '#0,.00'
    end
    object qry_total_calc_termo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_termo'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_original: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_original'
      Size = 8
      Calculated = True
    end
    object qry_total_FRETE_INTERNO: TFloatField
      FieldName = 'FRETE_INTERNO'
      DisplayFormat = '#0,.00'
    end
    object qry_total_CLIENTE: TStringField
      FieldName = 'CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_total_END_CLIENTE: TStringField
      FieldName = 'END_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_total_NUM_CLIENTE: TStringField
      FieldName = 'NUM_CLIENTE'
      FixedChar = True
      Size = 6
    end
    object qry_total_COMPL_CLIENTE: TStringField
      FieldName = 'COMPL_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_total_CIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_total_UF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      FixedChar = True
      Size = 2
    end
    object qry_total_CEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      FixedChar = True
      Size = 8
    end
    object qry_total_TEL_CLIENTE: TStringField
      FieldName = 'TEL_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_total_FAX_CLIENTE: TStringField
      FieldName = 'FAX_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_total_VIA: TStringField
      FieldName = 'VIA'
      FixedChar = True
      Size = 100
    end
    object qry_total_NM_NOTIFY: TStringField
      FieldName = 'NM_NOTIFY'
      FixedChar = True
      Size = 60
    end
    object qry_total_END_NOTIFY: TStringField
      FieldName = 'END_NOTIFY'
      FixedChar = True
      Size = 100
    end
    object qry_total_END_NOTIFY_2: TStringField
      FieldName = 'END_NOTIFY_2'
      FixedChar = True
      Size = 100
    end
    object qry_total_CIDADE_NOTIFY: TStringField
      FieldName = 'CIDADE_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_total_NM_PAIS_ORIGEM: TStringField
      FieldName = 'NM_PAIS_ORIGEM'
      FixedChar = True
      Size = 6
    end
    object qry_total_NM_PAIS_DESTINO: TStringField
      FieldName = 'NM_PAIS_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_total_TOTAL_DESC: TFloatField
      FieldName = 'TOTAL_DESC'
      DisplayFormat = '#0,.00'
    end
    object qry_total_SUB_TOT: TFloatField
      FieldName = 'SUB_TOT'
      DisplayFormat = '#0,.00'
    end
    object qry_total_TX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object qry_total_TX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_total_calc_notify: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_notify2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify2'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_consig3: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_consig3'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_notify3: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify3'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_end_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_cliente'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_end_cliente2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_cliente2'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_origem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_origem'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_destino: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_destino'
      Size = 255
      Calculated = True
    end
    object qry_total_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_total_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      FixedChar = True
      Size = 50
    end
    object qry_total_PAIS_CONSIGNATARIO: TStringField
      FieldName = 'PAIS_CONSIGNATARIO'
      FixedChar = True
      Size = 50
    end
    object qry_total_PAIS_NOTIFY: TStringField
      FieldName = 'PAIS_NOTIFY'
      FixedChar = True
      Size = 50
    end
    object qry_total_TELEFONE_CONSIGNATARIO: TStringField
      FieldName = 'TELEFONE_CONSIGNATARIO'
      FixedChar = True
      Size = 15
    end
    object qry_total_TELEFONE_NOTIFY: TStringField
      FieldName = 'TELEFONE_NOTIFY'
      FixedChar = True
      Size = 15
    end
    object qry_total_ESTADO_CONSIG: TStringField
      FieldName = 'ESTADO_CONSIG'
      FixedChar = True
      Size = 30
    end
    object qry_total_ESTADO_NOTIFY: TStringField
      FieldName = 'ESTADO_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_total_END_BANCO: TStringField
      FieldName = 'END_BANCO'
      FixedChar = True
      Size = 68
    end
    object qry_total_TX_LOGOMARCA: TStringField
      FieldName = 'TX_LOGOMARCA'
      FixedChar = True
      Size = 25
    end
    object qry_total_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_total_LOCAL_TOTAL: TStringField
      FieldName = 'LOCAL_TOTAL'
      FixedChar = True
      Size = 50
    end
    object qry_total_calcNrOrder: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrOrder'
      Size = 255
      Calculated = True
    end
    object qry_total_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      FixedChar = True
      Size = 30
    end
    object qry_total_INCOTERM_MERC: TStringField
      FieldName = 'INCOTERM_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_total_TX_IMPORTADOR: TMemoField
      FieldName = 'TX_IMPORTADOR'
      BlobType = ftMemo
    end
    object qry_total_TX_EXPORTADOR: TMemoField
      FieldName = 'TX_EXPORTADOR'
      BlobType = ftMemo
    end
    object qry_total_TX_CONSIGNATARIO: TMemoField
      FieldName = 'TX_CONSIGNATARIO'
      BlobType = ftMemo
    end
    object qry_total_TX_NOTIFY1: TMemoField
      FieldName = 'TX_NOTIFY1'
      BlobType = ftMemo
    end
    object qry_total_TX_NOTIFY2: TMemoField
      FieldName = 'TX_NOTIFY2'
      BlobType = ftMemo
    end
    object qry_total_TX_DOCTO: TMemoField
      FieldName = 'TX_DOCTO'
      BlobType = ftMemo
    end
    object qry_total_TX_COPIA: TMemoField
      FieldName = 'TX_COPIA'
      BlobType = ftMemo
    end
    object qry_total_TX_SAQUE: TMemoField
      FieldName = 'TX_SAQUE'
      BlobType = ftMemo
    end
    object qry_total_NM_UNID_MED_PL: TStringField
      FieldName = 'NM_UNID_MED_PL'
      FixedChar = True
      Size = 6
    end
    object qry_total_NM_UNID_MED_PB: TStringField
      FieldName = 'NM_UNID_MED_PB'
      FixedChar = True
      Size = 6
    end
    object qry_total_NM_LOCAL_DESTINO_1: TStringField
      FieldName = 'NM_LOCAL_DESTINO_1'
      FixedChar = True
      Size = 50
    end
    object qry_total_NM_LOCAL_ORIGEM_1: TStringField
      FieldName = 'NM_LOCAL_ORIGEM_1'
      FixedChar = True
      Size = 50
    end
    object qry_total_NM_PAIS_DESTINO_1: TStringField
      FieldName = 'NM_PAIS_DESTINO_1'
      FixedChar = True
      Size = 120
    end
    object qry_total_NM_PAIS_ORIGEM_1: TStringField
      FieldName = 'NM_PAIS_ORIGEM_1'
      FixedChar = True
      Size = 120
    end
    object qry_total_TX_TERMO_PAGTO: TMemoField
      FieldName = 'TX_TERMO_PAGTO'
      BlobType = ftMemo
    end
    object qry_total_END_ESTADO: TStringField
      FieldName = 'END_ESTADO'
      FixedChar = True
      Size = 30
    end
    object qry_total_NM_NOTIFY2: TStringField
      FieldName = 'NM_NOTIFY2'
      FixedChar = True
      Size = 60
    end
    object qry_total_END_NOTIFY2: TStringField
      FieldName = 'END_NOTIFY2'
      FixedChar = True
      Size = 100
    end
    object qry_total_END_NOTIFY2_2: TStringField
      FieldName = 'END_NOTIFY2_2'
      FixedChar = True
      Size = 100
    end
    object qry_total_PAIS_NOTIFY2: TStringField
      FieldName = 'PAIS_NOTIFY2'
      FixedChar = True
      Size = 50
    end
    object qry_total_CIDADE_NOTIFY2: TStringField
      FieldName = 'CIDADE_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_total_ESTADO_NOTIFY2: TStringField
      FieldName = 'ESTADO_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_total_TELEFONE_NOTIFY2: TStringField
      FieldName = 'TELEFONE_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_total_calc_notify2_linha2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify2_linha2'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_notify2_linha1: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify2_linha1'
      Size = 255
      Calculated = True
    end
    object qry_total_calc_notify2_linha3: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify2_linha3'
      Size = 255
      Calculated = True
    end
    object qry_total_CD_NOTIFY2: TStringField
      FieldName = 'CD_NOTIFY2'
      FixedChar = True
      Size = 5
    end
    object qry_total_LOCAL_TOTAL_CARTA: TStringField
      FieldName = 'LOCAL_TOTAL_CARTA'
      FixedChar = True
      Size = 50
    end
    object qry_total_INCOTERM2: TStringField
      FieldName = 'INCOTERM2'
      FixedChar = True
      Size = 3
    end
    object qry_total_FAX_NOTIFY: TStringField
      FieldName = 'FAX_NOTIFY'
      FixedChar = True
      Size = 15
    end
    object qry_total_CONTATO_NOTIFY: TStringField
      FieldName = 'CONTATO_NOTIFY'
      FixedChar = True
      Size = 50
    end
    object qry_total_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_total_NR_RUC: TStringField
      FieldName = 'NR_RUC'
      FixedChar = True
      Size = 30
    end
    object qry_total_NR_NIT: TStringField
      FieldName = 'NR_NIT'
      FixedChar = True
      Size = 30
    end
    object qry_total_FAX_CONSIGNATARIO: TStringField
      FieldName = 'FAX_CONSIGNATARIO'
      FixedChar = True
      Size = 15
    end
    object qry_total_RUC_CONSIGNATARIO: TStringField
      FieldName = 'RUC_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qry_total_NIT_CONSIGNATARIO: TStringField
      FieldName = 'NIT_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qry_total_RUC_NOTIFY: TStringField
      FieldName = 'RUC_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_total_NIT_NOTIFY: TStringField
      FieldName = 'NIT_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_total_FAX_NOTIFY2: TStringField
      FieldName = 'FAX_NOTIFY2'
      FixedChar = True
      Size = 15
    end
    object qry_total_RUC_NOTIFY2: TStringField
      FieldName = 'RUC_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_total_NIT_NOTIFY2: TStringField
      FieldName = 'NIT_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_total_VIA_AJI: TStringField
      FieldName = 'VIA_AJI'
      FixedChar = True
      Size = 31
    end
    object qry_total_NM_LOCAL_ORIGEM_AJI: TStringField
      FieldName = 'NM_LOCAL_ORIGEM_AJI'
      FixedChar = True
      Size = 178
    end
    object qry_total_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_total_CGC_CLIENTE: TStringField
      FieldName = 'CGC_CLIENTE'
      FixedChar = True
      Size = 23
    end
    object qry_total_CONTATO_CARGO: TStringField
      FieldName = 'CONTATO_CARGO'
      FixedChar = True
      Size = 78
    end
    object qry_total_NR_CUIT: TStringField
      FieldName = 'NR_CUIT'
      FixedChar = True
      Size = 31
    end
    object qry_total_CUIT_CONSIGNATARIO: TStringField
      FieldName = 'CUIT_CONSIGNATARIO'
      FixedChar = True
      Size = 31
    end
    object qry_total_CUIT_NOTIFY: TStringField
      FieldName = 'CUIT_NOTIFY'
      FixedChar = True
      Size = 31
    end
    object qry_total_CUIT_NOTIFY2: TStringField
      FieldName = 'CUIT_NOTIFY2'
      FixedChar = True
      Size = 31
    end
    object qry_total_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_total_TX_LOGOMARCA_EMPRESA_NAC: TStringField
      FieldName = 'TX_LOGOMARCA_EMPRESA_NAC'
      FixedChar = True
      Size = 112
    end
  end
  object ds_detalhe: TDataSource
    DataSet = qry_detalhe_
    Left = 98
    Top = 4
  end
  object qry_detalhe_: TQuery
    OnCalcFields = qry_detalhe_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_total
    SQL.Strings = (
      'SELECT CONVERT(DECIMAL(16,2), EI.QT_MERCADORIA) QT_MERCADORIA,'
      '       EI.CD_UNID_MEDIDA,'
      '       ( CASE E.CD_LINGUA_PEDIDO'
      
        '           WHEN '#39'0'#39' THEN (SELECT NM_UNID_MEDIDA FROM TUNID_MEDID' +
        'A_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      
        '           WHEN '#39'1'#39' THEN (SELECT NM_UNID_MEDIDA_ING FROM TUNID_M' +
        'EDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      
        '           WHEN '#39'2'#39' THEN (SELECT NM_UNID_MEDIDA_ESP FROM TUNID_M' +
        'EDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      '         END ) UNIDADE,'
      '       ( CASE E.CD_LINGUA_PEDIDO'
      
        '           WHEN '#39'0'#39' THEN (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROK' +
        'ER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      '           WHEN '#39'1'#39' THEN'
      
        '             CASE (SELECT NM_SIGLA_ING FROM TUNID_MEDIDA_BROKER ' +
        'WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      
        '               WHEN '#39#39' THEN (SELECT NM_SIGLA FROM TUNID_MEDIDA_B' +
        'ROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      
        '               ELSE (SELECT NM_SIGLA_ING FROM TUNID_MEDIDA_BROKE' +
        'R WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      '             END'
      '           WHEN '#39'2'#39' THEN'
      
        '             CASE (SELECT NM_SIGLA_ESP FROM TUNID_MEDIDA_BROKER ' +
        'WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      
        '               WHEN '#39#39' THEN (SELECT NM_SIGLA FROM TUNID_MEDIDA_B' +
        'ROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      
        '               ELSE (SELECT NM_SIGLA_ESP FROM TUNID_MEDIDA_BROKE' +
        'R WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA)'
      '             END'
      ''
      
        '         END ) SIGLA_UNIDADE, CASE E.CD_LINGUA_PEDIDO  WHEN 0 TH' +
        'EN '#39#39' WHEN 1 THEN ME.NM_PROCEDENCIA_ING WHEN 2 THEN ME.NM_PROCED' +
        'ENCIA_ESP ELSE '#39#39' END NM_PROCEDENCIA,'
      
        '       CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_LIQ) VL_TOT_PESO_LI' +
        'Q,'
      '      CASE E.CD_LINGUA_PEDIDO  WHEN 0 THEN ME.NM_MERCADORIA'
      '         WHEN 1 THEN ME.TX_DESC_INGLES'
      '         WHEN 2 THEN ME.TX_DESC_ESP'
      '         ELSE ME.NM_MERCADORIA END TX_MERCADORIA,'
      '       CONVERT(DECIMAL(16,2), EI.VL_UNITARIO) VL_UNITARIO,'
      '       CONVERT(DECIMAL(16,2), EI.VL_UNITARIO) VL_UNITARIO5,'
      '       CONVERT(DECIMAL(16,2), EI.VL_TOT_ITEM) VL_TOT_ITEM,'
      '       EI.NR_PROCESSO,'
      '       ME.CD_MERCADORIA,'
      '       ME.CD_MATERIAL, EI.NR_PEDIDO AS NR_PEDIDO_IMP, EI.CD_NCM,'
      
        '       CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_LIQ) AS VL_PESO_LIQ' +
        '_ITEM,'
      
        '       CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_BRUTO) AS VL_PESO_B' +
        'RUTO_ITEM,'
      '       CONVERT(DECIMAL(16,3), EI.VL_CUBAGEM) AS VL_CUBAGEM_ITEM,'
      '       ISNULL(EI.CD_FABRICANTE, '#39#39') AS CD_FABRICANTE,'
      '       EI.NR_PEDIDO_IMP AS REMESSA, EI.NR_ORDER,'
      
        '       ISNULL(EP.VL_DESCONTO, 0) AS VL_DESCONTO, ISNULL(EP.VL_FR' +
        'ETE, 0) AS VL_FRETE, ISNULL(EP.VL_SEGURO, 0) AS VL_SEGURO, ISNUL' +
        'L(EP.VL_ACRESCIMO, 0) AS VL_ACRESCIMO,'
      
        '       RTRIM(LTRIM(EI.CD_NORMAS)) + '#39' - '#39' + (SELECT RTRIM(LTRIM(' +
        'ISNULL(N.NM_DESCRICAO, '#39#39'))) FROM TNORMAS N (NOLOCK) WHERE N.COD' +
        'IGO = EI.CD_NORMAS) AS NORMA_ORIGEM,'
      '       EI.CD_NALADI_SH, EI.TX_BILLING_DOC, EI.TX_DELIVERY_NOTE,'
      
        '       (SELECT EM.QT_EMBALAGEM_SUP FROM TEMBALAGEM EM (NOLOCK) W' +
        'HERE EM.CD_EMBALAGEM = ME.CD_EMBALAGEM) VL_EMBALAGEM,'
      
        '       EP.TX_INF_EMBALAGEM TX_INF_EMBALAGEM, EI.NR_ORDER AS NR_O' +
        'RDER,'
      
        '       EI.QT_EMBALAGEM,  EI.QT_POR_EMB, DENSE_RANK() OVER (ORDER' +
        ' BY PM.NM_PAIS_ING) AS RANK,'
      
        '       CASE EI.CD_FABR_EXPO WHEN 2 THEN PM.NM_PAIS_ING ELSE (SEL' +
        'ECT P.NM_PAIS_ING FROM TPAIS_BROKER P WHERE P.CD_PAIS = (SELECT ' +
        'EM.CD_PAIS_IMPORTADOR FROM TEMPRESA_NAC EM WHERE CD_EMPRESA = E.' +
        'CD_EXPORTADOR)) END DESCRICAO'
      'FROM TPROCESSO_EXP_ITEM EI (NOLOCK)'
      
        '     LEFT JOIN TPROCESSO_EXP_PEDIDO EP (NOLOCK) ON EP.NR_PROCESS' +
        'O = EI.NR_PROCESSO AND EP.NR_PEDIDO = EI.NR_PEDIDO'
      
        '     LEFT JOIN TMERCADORIA_EXP ME (NOLOCK) ON ME.CD_MERCADORIA =' +
        ' EI.CD_MERCADORIA'
      
        '     LEFT JOIN TMERC_EXP_ACORDO MEA (NOLOCK) ON MEA.CD_MERCADORI' +
        'A = EI.CD_MERCADORIA'
      
        '                                            AND MEA.CD_NORMA = E' +
        'I.CD_NORMAS'
      
        '                                            AND MEA.CD_ACORDO = ' +
        'EI.CD_ACORDO'
      
        '     INNER JOIN TPROCESSO_EXP E (NOLOCK) ON E.NR_PROCESSO = EI.N' +
        'R_PROCESSO'
      '     LEFT JOIN TPAIS_BROKER PM ON PM.CD_PAIS = EI.CD_PAIS_ORIGEM'
      'WHERE EI.NR_PROCESSO = :NR_PROCESSO'
      '  AND EI.NR_PEDIDO = :NR_PEDIDO'
      
        'ORDER BY EI.NR_PEDIDO, EI.TX_BILLING_DOC, EI.TX_DELIVERY_NOTE, E' +
        'I.CD_FABRICANTE, EI.CD_UNID_MEDIDA, EI.NR_PROCESSO, EI.NR_ITEM, ' +
        ' EI.NR_ORDER')
    Left = 39
    Top = 176
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_PEDIDO'
        ParamType = ptInput
      end>
    object qry_detalhe_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qry_detalhe_UNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_detalhe_VL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      DisplayFormat = '#0,.000'
    end
    object qry_detalhe_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#0,.000'
    end
    object qry_detalhe_VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      DisplayFormat = '#0,.00'
    end
    object qry_detalhe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_detalhe_NR_PEDIDO_IMP: TStringField
      FieldName = 'NR_PEDIDO_IMP'
      FixedChar = True
      Size = 15
    end
    object qry_detalhe_VL_UNITARIO5: TFloatField
      FieldName = 'VL_UNITARIO5'
      DisplayFormat = '#0,.00'
    end
    object qry_detalhe_VL_PESO_LIQ_ITEM: TFloatField
      FieldName = 'VL_PESO_LIQ_ITEM'
    end
    object qry_detalhe_VL_PESO_BRUTO_ITEM: TFloatField
      FieldName = 'VL_PESO_BRUTO_ITEM'
    end
    object qry_detalhe_VL_CUBAGEM_ITEM: TFloatField
      FieldName = 'VL_CUBAGEM_ITEM'
    end
    object qry_detalhe_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_detalhe_SIGLA_UNIDADE: TStringField
      FieldName = 'SIGLA_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_detalhe_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_detalhe_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      EditMask = '9999.9999;1;_'
      FixedChar = True
      Size = 11
    end
    object qry_detalhe_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_detalhe_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qry_detalhe_calcCD_Mercadoria: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCD_Mercadoria'
      Size = 30
      Calculated = True
    end
    object qry_detalhe_calcMarcas: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMarcas'
      Size = 255
      Calculated = True
    end
    object qry_detalhe_calcPacote: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcPacote'
      Size = 255
      Calculated = True
    end
    object qry_detalhe_REMESSA: TStringField
      FieldName = 'REMESSA'
      FixedChar = True
      Size = 15
    end
    object qry_detalhe_NR_ORDER: TStringField
      FieldName = 'NR_ORDER'
      FixedChar = True
    end
    object qry_detalhe_calcREF: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcREF'
      Size = 255
      Calculated = True
    end
    object qry_detalhe_calcDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDescricao'
      Size = 255
      Calculated = True
    end
    object qry_detalhe_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qry_detalhe_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_detalhe_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object qry_detalhe_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
    end
    object qry_detalhe_NORMA_ORIGEM: TStringField
      FieldName = 'NORMA_ORIGEM'
      FixedChar = True
      Size = 213
    end
    object qry_detalhe_calcPackage: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcPackage'
      Size = 255
      Calculated = True
    end
    object qry_detalhe_MATERIALOLD: TStringField
      FieldKind = fkCalculated
      FieldName = 'MATERIALOLD'
      Size = 40
      Calculated = True
    end
    object qry_detalhe_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_detalhe_TX_BILLING_DOC: TStringField
      FieldName = 'TX_BILLING_DOC'
      FixedChar = True
      Size = 10
    end
    object qry_detalhe_TX_DELIVERY_NOTE: TStringField
      FieldName = 'TX_DELIVERY_NOTE'
      FixedChar = True
      Size = 10
    end
    object qry_detalhe_VL_EMBALAGEM: TFloatField
      FieldName = 'VL_EMBALAGEM'
    end
    object qry_detalhe_TX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_detalhe_QT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object qry_detalhe_QT_POR_EMB: TFloatField
      FieldName = 'QT_POR_EMB'
    end
    object qry_detalhe_RANK: TFloatField
      FieldName = 'RANK'
    end
    object qry_detalhe_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 120
    end
    object qry_detalhe_CD_MATERIAL: TStringField
      FieldName = 'CD_MATERIAL'
      FixedChar = True
      Size = 40
    end
    object qry_detalhe_CD_SAP: TStringField
      FieldKind = fkCalculated
      FieldName = 'CD_SAP'
      Calculated = True
    end
    object qry_detalhe_NM_PROCEDENCIA: TMemoField
      FieldName = 'NM_PROCEDENCIA'
      BlobType = ftMemo
    end
  end
  object ppRep_fatura: TppReport
    AutoStop = False
    DataPipeline = BDE_detalhe
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 20000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\fatcomCroda.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 6
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDE_detalhe'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 265
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TX_MERCADORIA'
        DataPipeline = BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 10583
        mmLeft = 87577
        mmTop = 1058
        mmWidth = 60061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'QT_MERCADORIA'
        DataPipeline = BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'CD_MERCADORIA'
        DataPipeline = BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 19050
        mmTop = 1058
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        BlankWhenZero = True
        DataField = 'VL_UNITARIO5'
        DataPipeline = BDE_detalhe
        DisplayFormat = '#0.,00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 148696
        mmTop = 1058
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        BlankWhenZero = True
        DataField = 'VL_TOT_ITEM'
        DataPipeline = BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 1058
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText67'
        DataField = 'calcPackage'
        DataPipeline = BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 1058
        mmWidth = 35190
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 97896
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 81492
        mmLeft = 0
        mmTop = 16404
        mmWidth = 189971
        BandType = 8
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'DBMemo8'
        CharWrap = False
        DataField = 'TX_NOTIFY1'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 16669
        mmLeft = 3704
        mmTop = 80698
        mmWidth = 86519
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText79: TppDBText
        UserName = 'DBText79'
        DataField = 'NIT_NOTIFY'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 91546
        mmWidth = 79111
        BandType = 8
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 11906
        mmLeft = 0
        mmTop = 63500
        mmWidth = 189971
        BandType = 8
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 11906
        mmLeft = 122238
        mmTop = 63500
        mmWidth = 67733
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'DBText9'
        DataField = 'ROD01'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 794
        mmTop = 18256
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText10'
        DataField = 'ROD08'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 61913
        mmTop = 17463
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText11'
        DataField = 'ROD09'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3429
        mmLeft = 62177
        mmTop = 43392
        mmWidth = 32015
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'DBText12'
        DataField = 'ROD10'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3387
        mmLeft = 61913
        mmTop = 49213
        mmWidth = 32808
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText13'
        DataField = 'ROD07'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 794
        mmTop = 75936
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText15: TppDBText
        UserName = 'DBText14'
        DataField = 'ROD06'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 529
        mmTop = 64294
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText16: TppDBText
        UserName = 'DBText15'
        DataField = 'ROD02'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 30163
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText17: TppDBText
        UserName = 'DBText16'
        DataField = 'ROD03'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 34660
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText18: TppDBText
        UserName = 'DBText17'
        DataField = 'ROD04'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 39158
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText19: TppDBText
        UserName = 'DBText18'
        DataField = 'ROD05'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 43656
        mmWidth = 31750
        BandType = 8
      end
      object ppDBText20: TppDBText
        UserName = 'DBText19'
        DataField = 'ROD11'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 31750
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText21: TppDBText
        UserName = 'DBText20'
        DataField = 'ROD12'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 46302
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText23: TppDBText
        UserName = 'DBText21'
        DataField = 'ROD13'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 50800
        mmWidth = 28046
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'VIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 47890
        mmWidth = 5292
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'B/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 51858
        mmWidth = 5027
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'L/C NR.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 124354
        mmTop = 64558
        mmWidth = 11377
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'TOTAL           :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 123561
        mmTop = 55033
        mmWidth = 21336
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'SUB-TOTAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 21431
        mmWidth = 19315
        BandType = 8
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'calcMarcas'
        DataPipeline = BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 19579
        mmLeft = 62442
        mmTop = 21960
        mmWidth = 59002
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'calcPacote'
        DataPipeline = BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 7144
        mmLeft = 1058
        mmTop = 22225
        mmWidth = 59531
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText23'
        DataField = 'TERMO_PAGTO'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 71173
        mmWidth = 120386
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 30163
        mmWidth = 4233
        BandType = 8
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 34396
        mmWidth = 4233
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'M3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 56092
        mmTop = 38894
        mmWidth = 3969
        BandType = 8
      end
      object ppDBText29: TppDBText
        UserName = 'DBText28'
        DataField = 'NM_NOTIFY'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 80433
        mmWidth = 78846
        BandType = 8
      end
      object ppDBText30: TppDBText
        UserName = 'DBText29'
        DataField = 'calc_notify3'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2498
        mmLeft = 3704
        mmTop = 83344
        mmWidth = 85725
        BandType = 8
      end
      object ppDBText31: TppDBText
        UserName = 'DBText30'
        DataField = 'calc_notify2'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 86254
        mmWidth = 79375
        BandType = 8
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'TRANSPORTE'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 28046
        mmTop = 43921
        mmWidth = 32015
        BandType = 8
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'VIA'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 48154
        mmWidth = 48419
        BandType = 8
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'NR_CONHECIMENTO'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 51858
        mmWidth = 48419
        BandType = 8
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'CD_INCOTERM'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3704
        mmLeft = 134938
        mmTop = 55298
        mmWidth = 7938
        BandType = 8
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'NM_LOCAL_DESTINO'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 43392
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'NM_LOCAL_ORIGEM'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 48948
        mmWidth = 26988
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 46831
        mmLeft = 60854
        mmTop = 16669
        mmWidth = 2117
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 46567
        mmLeft = 122238
        mmTop = 17198
        mmWidth = 2117
        BandType = 8
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1852
        mmLeft = 265
        mmTop = 29369
        mmWidth = 60590
        BandType = 8
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1852
        mmLeft = 61119
        mmTop = 21431
        mmWidth = 61119
        BandType = 8
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1852
        mmLeft = 61119
        mmTop = 42069
        mmWidth = 61119
        BandType = 8
      end
      object ppDBText41: TppDBText
        UserName = 'DBText302'
        DataField = 'TELEFONE_NOTIFY'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 88900
        mmWidth = 79375
        BandType = 8
      end
      object ppPesoLiq: TppLabel
        UserName = 'Label13'
        Caption = '5.040,0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 30427
        mmWidth = 23283
        BandType = 8
      end
      object ppPesoBruto: TppLabel
        UserName = 'Label15'
        Caption = '5.588,2400'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 34925
        mmWidth = 23283
        BandType = 8
      end
      object ppCubagem: TppLabel
        UserName = 'Label16'
        Caption = '9,097'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 39158
        mmWidth = 23283
        BandType = 8
      end
      object ppSubTot: TppLabel
        UserName = 'Label17'
        Caption = '34.574,40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 21167
        mmWidth = 18785
        BandType = 8
      end
      object ppDesc: TppLabel
        UserName = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 18521
        mmWidth = 18785
        BandType = 8
      end
      object ppTotFob: TppLabel
        UserName = 'Label19'
        Caption = '34.574,40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3528
        mmLeft = 175260
        mmTop = 35983
        mmWidth = 12065
        BandType = 8
      end
      object ppFrete: TppLabel
        UserName = 'Label20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 145786
        mmTop = 26458
        mmWidth = 18785
        BandType = 8
      end
      object ppSeguro: TppLabel
        UserName = 'Label21'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 22490
        mmWidth = 18785
        BandType = 8
      end
      object ppTot: TppLabel
        UserName = 'Label22'
        Caption = '34.574,40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 55298
        mmWidth = 18785
        BandType = 8
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'VL_DESCONTO'
        DataPipeline = BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 168540
        mmTop = 31750
        mmWidth = 18256
        BandType = 8
      end
      object ppDBText50: TppDBText
        UserName = 'DBText201'
        DataField = 'VL_FRETE'
        DataPipeline = BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 168275
        mmTop = 46302
        mmWidth = 18785
        BandType = 8
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'VL_SEGURO'
        DataPipeline = BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 168540
        mmTop = 50800
        mmWidth = 18785
        BandType = 8
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'TX_TERMO_PAGTO'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 67469
        mmWidth = 120121
        BandType = 8
      end
      object ppDBText63: TppDBText
        UserName = 'DBText601'
        DataField = 'NM_LOCAL_DESTINO_1'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 43392
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'NM_LOCAL_ORIGEM_1'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 49213
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'ROD14'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123031
        mmTop = 41804
        mmWidth = 43921
        BandType = 8
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'VL_ACRESCIMO'
        DataPipeline = BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 169334
        mmTop = 41540
        mmWidth = 18256
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line8'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 22490
        mmLeft = 93663
        mmTop = 74877
        mmWidth = 2117
        BandType = 8
      end
      object ppDBText32: TppDBText
        UserName = 'DBText41'
        DataField = 'NM_PAIS_DESTINO_1'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 54769
        mmWidth = 25400
        BandType = 8
      end
      object ppDBText33: TppDBText
        UserName = 'DBText48'
        DataField = 'NM_PAIS_ORIGEM'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 60061
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText34: TppDBText
        UserName = 'DBText50'
        DataField = 'NM_PAIS_ORIGEM_1'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 60061
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText35: TppDBText
        UserName = 'DBText602'
        DataField = 'NM_PAIS_DESTINO'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 54769
        mmWidth = 24871
        BandType = 8
      end
      object ppDBText36: TppDBText
        UserName = 'DBText63'
        DataField = 'CRO02'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 2910
        mmLeft = 62177
        mmTop = 54769
        mmWidth = 33867
        BandType = 8
      end
      object ppDBText37: TppDBText
        UserName = 'DBText66'
        DataField = 'CRO01'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3429
        mmLeft = 61913
        mmTop = 60061
        mmWidth = 32808
        BandType = 8
      end
      object ppDBTxtNot1: TppDBText
        UserName = 'DBTxtNot1'
        DataField = 'ROD15'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 95250
        mmTop = 75936
        mmWidth = 39952
        BandType = 8
      end
      object ppDBMemNot: TppDBMemo
        UserName = 'DBMemNot'
        CharWrap = False
        DataField = 'TX_NOTIFY2'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 15875
        mmLeft = 98690
        mmTop = 79904
        mmWidth = 74613
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBTxtNot2: TppDBText
        UserName = 'DBTxtNot2'
        DataField = 'NM_NOTIFY2'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 98690
        mmTop = 80433
        mmWidth = 78846
        BandType = 8
      end
      object ppDBTxtNot3: TppDBText
        UserName = 'DBTxtNot3'
        DataField = 'calc_notify2_linha2'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 98954
        mmTop = 83344
        mmWidth = 79111
        BandType = 8
      end
      object ppDBTxtNot4: TppDBText
        UserName = 'DBText303'
        DataField = 'calc_notify2_linha3'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 99219
        mmTop = 86254
        mmWidth = 78581
        BandType = 8
      end
      object ppDBTxtNot5: TppDBText
        UserName = 'DBTxtNot5'
        DataField = 'TELEFONE_NOTIFY2'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 99219
        mmTop = 89165
        mmWidth = 79111
        BandType = 8
      end
      object ppDBTxtAss1: TppDBText
        UserName = 'DBText69'
        DataField = 'ROD16'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 75671
        mmWidth = 8731
        BandType = 8
      end
      object ppDBTxtAss2: TppDBText
        UserName = 'DBText70'
        DataField = 'CLIENTE'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 147109
        mmTop = 75671
        mmWidth = 41275
        BandType = 8
      end
      object ppDBTxtAss3: TppDBText
        UserName = 'DBText701'
        DataField = 'CRO04'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 92075
        mmWidth = 82286
        BandType = 8
      end
      object ppLineAss4: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 93663
        mmTop = 92340
        mmWidth = 95250
        BandType = 8
      end
      object ppDBTxtDestino: TppDBText
        UserName = 'DBText35'
        DataField = 'LOCAL_TOTAL'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 145257
        mmTop = 55827
        mmWidth = 21696
        BandType = 8
      end
      object ppDBTxtDestinoCC: TppDBText
        UserName = 'DBTxtDestinoCC'
        DataField = 'LOCAL_TOTAL_CARTA'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 55827
        mmWidth = 22490
        BandType = 8
      end
      object ppDBText38: TppDBText
        UserName = 'DBText71'
        DataField = 'CRO03'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        WordWrap = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 13758
        mmLeft = 55827
        mmTop = 1323
        mmWidth = 82286
        BandType = 8
      end
      object ppDBText80: TppDBText
        UserName = 'DBText46'
        DataField = 'LOCAL_TOTAL'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 146315
        mmTop = 55827
        mmWidth = 25135
        BandType = 8
      end
      object ppDBText83: TppDBText
        UserName = 'DBText83'
        DataField = 'RUC_NOTIFY'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2646
        mmLeft = 3969
        mmTop = 91546
        mmWidth = 77523
        BandType = 8
      end
      object ppDBText97: TppDBText
        UserName = 'DBText97'
        DataField = 'CUIT_NOTIFY'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 4233
        mmTop = 91546
        mmWidth = 79111
        BandType = 8
      end
      object ppLabel1: TppLabel
        UserName = 'Label23'
        Caption = 'TOTAL           :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 35983
        mmWidth = 21431
        BandType = 8
      end
      object ppDBText5: TppDBText
        UserName = 'DBText68'
        DataField = 'INCOTERM2'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 36248
        mmWidth = 7938
        BandType = 8
      end
    end
    object ppPageStyle2: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 262000
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape5'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 208227
        mmLeft = 0
        mmTop = 53711
        mmWidth = 189971
        BandType = 9
      end
      object ppShape8: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 20108
        mmLeft = 0
        mmTop = 20373
        mmWidth = 189971
        BandType = 9
      end
      object ppShape9: TppShape
        UserName = 'Shape3'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 8996
        mmLeft = 0
        mmTop = 45244
        mmWidth = 189971
        BandType = 9
      end
      object ppLine7: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 216165
        mmLeft = 17727
        mmTop = 45244
        mmWidth = 2381
        BandType = 9
      end
      object ppLine9: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 215900
        mmLeft = 51065
        mmTop = 45244
        mmWidth = 2381
        BandType = 9
      end
      object ppLine10: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 216165
        mmLeft = 147109
        mmTop = 45244
        mmWidth = 1323
        BandType = 9
      end
      object ppLine11: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 216165
        mmLeft = 168540
        mmTop = 45244
        mmWidth = 794
        BandType = 9
      end
      object ppLabel13: TppLabel
        UserName = 'Label1'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 169598
        mmTop = 46302
        mmWidth = 19844
        BandType = 9
      end
      object ppDBText39: TppDBText
        UserName = 'DBText1'
        DataField = 'TIT09'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 148167
        mmTop = 46038
        mmWidth = 20373
        BandType = 9
      end
      object ppDBText40: TppDBText
        UserName = 'DBText2'
        DataField = 'TIT08'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 88371
        mmTop = 49477
        mmWidth = 58208
        BandType = 9
      end
      object ppDBText45: TppDBText
        UserName = 'DBText3'
        DataField = 'TIT07'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 18785
        mmTop = 49477
        mmWidth = 32015
        BandType = 9
      end
      object ppDBText46: TppDBText
        UserName = 'DBText4'
        DataField = 'TIT06'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 49477
        mmWidth = 16140
        BandType = 9
      end
      object ppDBText48: TppDBText
        UserName = 'DBText5'
        DataField = 'TIT05'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 41010
        mmWidth = 187590
        BandType = 9
      end
      object ppDBText55: TppDBText
        UserName = 'DBText6'
        DataField = 'TIT03'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 21431
        mmWidth = 84402
        BandType = 9
      end
      object ppDBText56: TppDBText
        UserName = 'DBText7'
        DataField = 'TIT04'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 93398
        mmTop = 21696
        mmWidth = 94721
        BandType = 9
      end
      object ppDBText57: TppDBText
        UserName = 'DBText8'
        DataField = 'TIT02'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123296
        mmTop = 11906
        mmWidth = 13229
        BandType = 9
      end
      object ppLabel14: TppLabel
        UserName = 'Label2'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 123296
        mmTop = 7408
        mmWidth = 3440
        BandType = 9
      end
      object ppLabel17: TppLabel
        UserName = 'Label3'
        Caption = 'E-MAIL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 123296
        mmTop = 16404
        mmWidth = 11906
        BandType = 9
      end
      object ppDBText58: TppDBText
        UserName = 'DBText22'
        DataField = 'TIT01'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 5556
        mmLeft = 123031
        mmTop = 1058
        mmWidth = 65881
        BandType = 9
      end
      object ppDBText59: TppDBText
        UserName = 'DBText53'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 49742
        mmWidth = 20108
        BandType = 9
      end
      object ppDBText66: TppDBText
        UserName = 'DBText54'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 50006
        mmWidth = 19050
        BandType = 9
      end
      object ppShape11: TppShape
        UserName = 'Shape2'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 0
        mmTop = 39952
        mmWidth = 189971
        BandType = 9
      end
      object ppPG: TppSystemVariable
        UserName = 'pg'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 178065
        mmTop = 261673
        mmWidth = 11303
        BandType = 9
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3260
        mmLeft = 119327
        mmTop = 794
        mmWidth = 1566
        BandType = 9
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765B60B0000FFD8FFE000104A46494600010101006000
          600000FFE1001645786966000049492A0008000000000000000000FFDB004300
          080606070605080707070909080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A
          1C1C20242E2720222C231C1C2837292C30313434341F27393D38323C2E333432
          FFDB0043010909090C0B0C180D0D1832211C2132323232323232323232323232
          3232323232323232323232323232323232323232323232323232323232323232
          3232323232FFC0001108002400A103012200021101031101FFC4001F00000105
          01010101010100000000000000000102030405060708090A0BFFC400B5100002
          010303020403050504040000017D010203000411051221314106135161072271
          14328191A1082342B1C11552D1F02433627282090A161718191A25262728292A
          3435363738393A434445464748494A535455565758595A636465666768696A73
          7475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9
          AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4
          E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F010003010101010101010101
          0000000000000102030405060708090A0BFFC400B51100020102040403040705
          040400010277000102031104052131061241510761711322328108144291A1B1
          C109233352F0156272D10A162434E125F11718191A262728292A35363738393A
          434445464748494A535455565758595A636465666768696A737475767778797A
          82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6
          B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2
          F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00EAFE21FC45D46C75C83C
          25E128966D6E76559262011096FBAA01E0B60E493C281DC9E2E69FF096D2EADD
          5FC59AB6A5AF5F37CD234B74EB0A93D42203D3FCF1D2BCFF00E13C835AF8C7AA
          6A5704B4A52EEE23CF6264551F92B115F4381834C4796F883E12E9B63A45D5DF
          86F51D5B49BC82279505BDDC8C8E5464295CE7B63823AF7AEC3C06D7AFE04D12
          4D4269E6BB92D12495E724B92C33839E78CE3F0AE888CD2D219F3EFC67D3DFC2
          371A54FA36A5AB5B0BC5B83320D4662A4AF9641196E3EF37E95DB695F0CAC2FB
          C3B657136BBE23173716D1CAF22EA9270C541240E9D4D72FFB46FF00AAF0F7FB
          B77FCA2AEB6F7E26E85E0CD174BB2D4A2BE7BA3A7432C690DB92241B07DD6240
          FAF3401C169FAE7897E1FF00C5287C3773AC5CEA9A7C93C5115BA90B6E8E5C05
          619C95604F63838E8335F41AFDD1CE6BC7FC2BE0AD5FC51E355F1F78912DED61
          629358D94320972BB7F765987180083EA4F3F28E0FACDD4C6DAD279F6EE31C6C
          F8CE33804D0079678C3C77AD6ABE304F047835E28AF0B6CBAD40FCDE49032C17
          8C0DA3A9E4E78001E6B66DBE10E85240875DBAD4F5BBC03E7B8BBBB7C16EE554
          3617D873F535E7BFB3F7FA5F8AB59BFB87325D9B2525D8F2C6493739FC4AAD7D
          09408F16F16F80F57F035849AFF82B5CD4E1B7B51BEE34F926322841D5941C82
          077520F19E462BAFF869E3D5F1C68D29B98E38753B32A2E6343F2B039DAEB9EC
          7078ED8AEDE48D654649143A302ACA464107A8AF9CBE0C2BE93F156EF4D4CBA0
          B7B9B563ED1C8B863FF7CE3FE0540CF5FF001F787ADB52F0FEA3A8B5C5F5BDDD
          9D94B2432DB5DC9160AA961955201E7D6BCB7E12688FE3687569758D6B5C6FB2
          BC4B188B529547CCA49CF3ED5ED7E2CFF91375CFFB07CFFF00A2DABCAFF6761F
          F12ED7CFACD07FE80D401D36A3F0BA78E02FE1FF001778834FBC1CA79D7AF344
          C7D1949CFE3FA1E95CF7833E26EB363E2A3E10F1AA27DB3CD104776301849FC2
          1F1C32B0230C31DB239E3D988AF9D7E3EC4B6BE34B0BA87E499EC439653CEE47
          6DA7FCFA5311F45D676BBABDBE85A0DEEAD73FEA6D216958671BB03819F7381F
          8D5BB790CB6B148C082E8AC41EA32335E77F10DFFE125F11E83E0684EE8AEA51
          7DA963F86DE3E429FF0079BF503D690CE47E0E78D751B8F176A3A46B77334B2E
          A5BAE621331F92619664507EE82A490380367BD7BB8E95F3EFC60D3AE3C2BE3F
          D37C59A7A60DC32C9C703CE8B0307FDE4C0FC0D7BB693A9DBEB1A459EA7684B5
          BDDC293464FA300467DF9A00BB45145007CCE5DFE177C677B8BC471626791F70
          1F7ADA524EE03BED39CE3FB9F4AFA4EDEE22BA8239E0952586450E924672AE0F
          4208EA2B0BC57E0ED23C636096BAAC2C4C24B433C676C9093D4AB7E0320F0703
          D2BCFF004EF86FE3DF089683C2BE2EB57B124B086F222A14E7B2E1C7E20AE4F6
          A623D849A335E6F1787FE285FF00EE753F1869D63011CB69F69BE43ED960A071
          DF9FA5777A36991E8FA45B69F1CF3CEB026DF36E1CBC8E7A96627A9249A433C6
          7F68C3FBBF0EF3F36DBBC7E515769E20F0641E36F86DA65AA954BE82CE296CA6
          3FC2FE58F94FFB2DD0FE07B0AC7F18FC36F13F8EE7B59355D774AB74B4F35608
          EDACA4E8E573B8B3F270ABFAD767E12D37C41A469E9A7EB17BA7DDDB5B411C36
          CF6D03C7210A31F3E5883C6DE98EF408F2EF833E359B4DBE7F056B1BA222475B
          4F34E1A29013BE13F8E48F7C8EE2BDD36874C300411820F4AF2DF1E7C223E2AF
          11C5ACE97A9C7A6CEE07DA18C658975C6D91369186F5E7B0F7AEFF00428B59B7
          D3162D72EED6EEED0E3CEB688C61D78C12A49C37AE38A067CF7E06B93F0E3E2D
          CBA66A6DE5C04BE9F248FC0D8C418A4CFA1DABCFA31F4AFA60139E6B8BF1CFC3
          8D27C7102C972EF6BA8449B62BB897276FF7594F0CBC9E3AF270466B0F45F0F7
          C50F0D40B6367AE687A9D8C43643F6F4943AA8E9F779E9D8B1A623D0B58D56DB
          44D26EF53BC7096D6B134AE49C671D87B9E83EB5E3BF02742BAB8BED57C5F789
          B45D06820E387667DF291EC18003E87D2BABB8F016B7E2C9226F1BEB914F6914
          9E62E97A5C6D1424F6DCE7E66FD31EB5DFDADAC1676B15B5BC31C30C481238E3
          50AAAA380001D052199BE2EE3C17AE9FFA87DC7FE8B6AF2BFD9D8FFA0F8807FD
          3683FF00416AF4FF001669BAA6B3E1FB8D374ABBB5B592E94C334B711B385898
          10DB4023E6E98CF1D6BCFF00C39F0C7C61E0D5B95D07C55A72ADC953289B4F27
          76D040EAC71D6803D7092180E39AF9FBC428BF14BE32C563A7B0974BD395629E
          E1794F2D1B739C8EC58EC1EBC91C577577E05F18F88AD7ECBE21F1C15B37E26B
          7D36C844645F42E4F4F6C1AEC3C37E17D27C29A52E9FA45B08A2CEE66639791B
          D59BB9FE5D050234E79E2B4B69679DC470C485DDCF45503249FC05790F83FC3F
          7FE3ABDD4FC7275BD4B486D426782D16D76022D9080A0960DDD79C71906BB2F1
          CF877C43E29B19748B0D56C2C34CB88C2CE5EDDE4998E79504300148C7BF5AB1
          E0BD135EF0EE9F0E95A85EE9B75A7DADBAC56CD6D6CF14B91DDF2C41E3D3BD03
          394F197C34D4350F0BDD86F156B3A9CD6CA6E60B7BAF2D91A45071F7501CE0B0
          E08EB547E02F8996F343BAF0F4AE3CDB26F3E053D4C2E79C7D1C9FFBE857AA6A
          E3543A7B8D1E4B34BDDCBB1AF119E3033F3642904F19C73D6BCA748F845E23F0
          FF0088FF00B7B4CF11E9D1DE6F91CC26C9C4243924A11BF3B79FC303D2803D97
          3ED4572FE5F8EFFE7EBC39FF0080D3FF00F1745007804FF1A3C709732AAEA916
          15D947FA2C7D33FEED33FE17578EBFE82917FE02C7FF00C4D1453107FC2EAF1D
          7FD0522FFC058FFF0089A3FE17578EBFE82917FE02C7FF00C4D145001FF0BABC
          75FF004148BFF0163FFE268FF85D5E3AFF00A0A45FF80B1FFF00134514007FC2
          EAF1D7FD0522FF00C058FF00F89A3FE17578EBFE82917FE02C7FFC4D145001FF
          000BABC75FF4148BFF000163FF00E268FF0085D5E3AFFA0A45FF0080B1FF00F1
          34514007FC2EAF1D7FD0522FFC058FFF0089A3FE17578EBFE82917FE02C7FF00
          C4D145001FF0BABC75FF004148BFF0163FFE268FF85D5E3AFF00A0A45FF80B1F
          FF00134514007FC2EAF1D7FD0522FF00C058FF00F89A3FE17578EBFE82917FE0
          2C7FFC4D145001FF000BABC75FF4148BFF000163FF00E268FF0085D5E3AFFA0A
          45FF0080B1FF00F134514007FC2EAF1D7FD0522FFC058FFF0089A6B7C6BF1D05
          27FB522E9FF3EB1FFF0013451401D3FF00C2CFF177FD04D7FF0001A2FF00E268
          A28A00FFD9}
        mmHeight = 10848
        mmLeft = 0
        mmTop = 6085
        mmWidth = 44979
        BandType = 9
      end
      object ppLine12: TppLine
        UserName = 'Line9'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 215900
        mmLeft = 87048
        mmTop = 45244
        mmWidth = 2381
        BandType = 9
      end
      object ppDBText67: TppDBText
        UserName = 'DBText72'
        DataField = 'ROD01'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 52388
        mmTop = 49477
        mmWidth = 33602
        BandType = 9
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_PEDIDO_IMP'
      DataPipeline = BDE_detalhe
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 81000
        mmPrintPosition = 0
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = False
          DataField = 'TX_IMPORTADOR'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'BDE_total'
          mmHeight = 17727
          mmLeft = 4763
          mmTop = 23019
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText76'
          DataField = 'NR_NIT'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2879
          mmLeft = 5027
          mmTop = 34660
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo6: TppDBMemo
          UserName = 'DBMemo6'
          CharWrap = False
          DataField = 'TX_CONSIGNATARIO'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'BDE_total'
          mmHeight = 17992
          mmLeft = 94192
          mmTop = 22754
          mmWidth = 93663
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText93: TppDBText
          UserName = 'DBText82'
          DataField = 'RUC_CONSIGNATARIO'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 34660
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText73'
          DataField = 'NIT_CONSIGNATARIO'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 34660
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
        object ppDBText92: TppDBText
          UserName = 'DBText74'
          DataField = 'NR_RUC'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 34660
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText86: TppDBText
          UserName = 'DBText40'
          DataField = 'TELEFONE_CONSIGNATARIO'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 37306
          mmWidth = 90752
          BandType = 3
          GroupNo = 0
        end
        object ppDBText85: TppDBText
          UserName = 'DBText39'
          DataField = 'NR_TELEFONE'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 37835
          mmWidth = 83608
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo7: TppDBMemo
          UserName = 'DBMemo7'
          CharWrap = False
          DataField = 'TX_EXPORTADOR'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'BDE_total'
          mmHeight = 17727
          mmLeft = 49213
          mmTop = 3175
          mmWidth = 85461
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText68: TppDBText
          UserName = 'DBText31'
          DataField = 'NR_PEDIDO_IMP'
          DataPipeline = BDE_detalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3260
          mmLeft = 137848
          mmTop = 7144
          mmWidth = 51594
          BandType = 3
          GroupNo = 0
        end
        object ppDBText69: TppDBText
          UserName = 'DBText32'
          DataField = 'calc_dt_fatura'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 137848
          mmTop = 11377
          mmWidth = 51594
          BandType = 3
          GroupNo = 0
        end
        object ppDBText70: TppDBText
          UserName = 'DBText33'
          DataField = 'NM_EMPRESA'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 25665
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText71: TppDBText
          UserName = 'DBText34'
          DataField = 'calc_importador'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2381
          mmLeft = 5027
          mmTop = 28310
          mmWidth = 86519
          BandType = 3
          GroupNo = 0
        end
        object ppDBText72: TppDBText
          UserName = 'DBText301'
          DataField = 'calc_import2'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 31485
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText73: TppDBText
          UserName = 'DBText36'
          DataField = 'calc_consig2'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 31485
          mmWidth = 92075
          BandType = 3
          GroupNo = 0
        end
        object ppDBText74: TppDBText
          UserName = 'DBText37'
          DataField = 'calc_consig3'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2381
          mmLeft = 94456
          mmTop = 28575
          mmWidth = 92075
          BandType = 3
          GroupNo = 0
        end
        object ppDBText75: TppDBText
          UserName = 'DBText38'
          DataField = 'NM_CONSIGNATARIO'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 25400
          mmWidth = 92075
          BandType = 3
          GroupNo = 0
        end
        object ppDBText76: TppDBText
          UserName = 'DBText55'
          DataField = 'CLIENTE'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 3175
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label11'
          Caption = 'Phone:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 15875
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppDBText77: TppDBText
          UserName = 'DBText56'
          DataField = 'TEL_CLIENTE'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 58738
          mmTop = 15875
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText81: TppDBText
          UserName = 'DBText57'
          DataField = 'FAX_CLIENTE'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 89429
          mmTop = 15875
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText82: TppDBText
          UserName = 'DBText58'
          DataField = 'calc_end_cliente'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 6350
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppDBText84: TppDBText
          UserName = 'DBText59'
          DataField = 'calc_end_cliente2'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 9525
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label14'
          Caption = 'FAX:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 82021
          mmTop = 15875
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppMerc: TppMemo
          UserName = 'Merc'
          Caption = 'PHARMALAN USP'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'PHARMALAN USP'
            'CRODAMAZON CACAU')
          Transparent = True
          mmHeight = 265
          mmLeft = 56092
          mmTop = 57000
          mmWidth = 82815
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText91: TppDBText
          UserName = 'DBText75'
          DataField = 'CGC_CLIENTE'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 12700
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText77'
          DataField = 'NR_CUIT'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 34660
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText80'
          DataField = 'CUIT_CONSIGNATARIO'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 34660
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppDBMemo5: TppDBMemo
          UserName = 'DBMemo5'
          CharWrap = False
          DataField = 'TX_DECL_ADICIONAL'
          DataPipeline = BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          DataPipelineName = 'BDE_total'
          mmHeight = 9260
          mmLeft = 56356
          mmTop = 6085
          mmWidth = 81756
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VL_TOT_ITEM'
          DataPipeline = BDE_detalhe
          DisplayFormat = '#0.,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3175
          mmLeft = 171715
          mmTop = 2117
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 170921
          mmTop = 1058
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line7'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 1323
          mmTop = 265
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'QT_MERCADORIA'
          DataPipeline = BDE_detalhe
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CD_UNID_MEDIDA'
      DataPipeline = BDE_detalhe
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText94: TppDBText
          UserName = 'DBText45'
          DataField = 'UNIDADE'
          DataPipeline = BDE_detalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 794
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NR_ORDER'
      DataPipeline = BDE_detalhe
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'REMESSA'
      DataPipeline = BDE_detalhe
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsTexto: TDataSource
    DataSet = qryTexto
    Left = 111
    Top = 5
  end
  object qryTexto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'FATURA COMERCIAL'#39' W' +
        'HEN '#39'1'#39' THEN '#39'COMMERCIAL INVOICE'#39' WHEN '#39'2'#39' THEN '#39'FACTURA COMERCI' +
        'AL'#39' END) AS TIT01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'DATA'#39' WHEN '#39'1'#39' THEN' +
        ' '#39'DATE'#39' WHEN '#39'2'#39' THEN '#39'FECHA'#39' END) AS TIT02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PARA'#39' WHEN '#39'1'#39' THEN' +
        ' '#39'TO'#39' WHEN '#39'2'#39' THEN '#39'A'#39'END) AS TIT03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'CONSIGNAT'#193'RIO'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'CONSIGNEE'#39' WHEN '#39'2'#39' THEN '#39'CONSIGNATARIO'#39' END) AS TIT0' +
        '4,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PRODUTO'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'PRODUCT'#39' WHEN '#39'2'#39' THEN '#39'PRODUCTO'#39' END) AS TIT05,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'QTD'#39' WHEN '#39'1'#39' THEN ' +
        #39'QTY'#39' WHEN '#39'2'#39' THEN '#39'CTD'#39' END) AS TIT06,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'C'#211'DIGO'#39' WHEN '#39'1'#39' TH' +
        'EN '#39'CODE'#39' WHEN '#39'2'#39' THEN '#39'CODIGO'#39' END) AS TIT07,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'DESCRI'#199#195'O'#39' WHEN '#39'1'#39 +
        ' THEN '#39'DESCRIPTION'#39' WHEN '#39'2'#39' THEN '#39'DESCRIPCION'#39' END) AS TIT08,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PRE'#199'O UNIT'#39' WHEN '#39'1' +
        #39' THEN '#39'UNIT PRICE'#39' WHEN '#39'2'#39' THEN '#39'PRECIO UNIT'#39' END) AS TIT09,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'FATURA PROFORMA'#39' WH' +
        'EN '#39'1'#39' THEN '#39'PROFORMA INVOICE'#39' WHEN '#39'2'#39' THEN '#39'FACTURA PROFORMA'#39' ' +
        'END) AS TIT10,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'EMBALAGEM'#39' WHEN '#39'1'#39 +
        ' THEN '#39'PACKAGE'#39' WHEN '#39'2'#39' THEN '#39'EMBALAJE'#39' END) AS TIT11,       '
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'EMBALAGEM'#39' WHEN '#39'1'#39 +
        ' THEN '#39'PACKING'#39' WHEN '#39'2'#39' THEN '#39'EMPAQUE'#39' END) AS ROD01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO L'#205'QUIDO'#39' WHEN ' +
        #39'1'#39' THEN '#39'NET WEIGHT'#39' WHEN '#39'2'#39' THEN '#39'PESO NETO'#39' END) AS ROD02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO BRUTO'#39' WHEN '#39'1' +
        #39' THEN '#39'GROSS WEIGHT'#39' WHEN '#39'2'#39' THEN '#39'PESO BRUTO'#39' END) AS ROD03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'CUBAGEM'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'MEASUREMENT'#39' WHEN '#39'2'#39' THEN '#39'CUBAJE'#39' END) AS ROD04,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'TRANSPORTE'#39' WHEN '#39'1' +
        #39' THEN '#39'COMPANY/VESSEL'#39' WHEN '#39'2'#39' THEN '#39'TRANSP./VAPOR'#39' END) AS RO' +
        'D05,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'CONDI'#199#195'O DE PAGAMEN' +
        'TO:'#39' WHEN '#39'1'#39' THEN '#39'PAYMT. COND:'#39' WHEN '#39'2'#39' THEN '#39'COND PAGO'#39' END)' +
        ' AS ROD06,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'NOTIFICADOR'#39' WHEN '#39 +
        '1'#39' THEN '#39'NOTIFY'#39' WHEN '#39'2'#39' THEN '#39'NOTIFICAR'#39' END) AS ROD07,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'MARCA'#199#195'O'#39' WHEN '#39'1'#39' ' +
        'THEN '#39'MARKS'#39' WHEN '#39'2'#39' THEN '#39'MARCAS'#39' END) AS ROD08,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PORTO DE DESCARGA'#39' ' +
        'WHEN '#39'1'#39' THEN '#39'PORT OF DISCHARGE'#39' WHEN '#39'2'#39' THEN '#39'PUERTO DE DESEM' +
        'BARQUE'#39' END) AS ROD09,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PORTO DE EMBARQUE'#39' ' +
        'WHEN '#39'1'#39' THEN '#39'PORT OF LOADING'#39' WHEN '#39'2'#39' THEN '#39'PUERTO DE EMBARQU' +
        'E'#39' END) AS ROD10,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'DESCONTO:'#39' WHEN '#39'1'#39 +
        ' THEN '#39'DISCOUNT:'#39' WHEN '#39'2'#39' THEN '#39'DESCUENTO:'#39' END) AS ROD11,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'FRETE:'#39' WHEN '#39'1'#39' TH' +
        'EN '#39'FREIGHT:'#39' WHEN '#39'2'#39' THEN '#39'FLETE:'#39' END) AS ROD12,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'SEGURO:'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'INSURANCE:'#39' WHEN '#39'2'#39' THEN '#39'SEGURO:'#39' END) AS ROD13,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'ACR'#201'SCIMO:'#39' WHEN '#39'1' +
        #39' THEN '#39'DOCUMENTS/OTHER FEES:'#39' WHEN '#39'2'#39' THEN '#39'DOCUMENTACI'#211'N/COST' +
        'AS:'#39' END) AS ROD14,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'NOTIFICADOR 2'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'NOTIFY 2'#39' WHEN '#39'2'#39' THEN '#39'NOTIFICAR 2'#39' END) AS ROD15,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'POR: '#39' WHEN '#39'1'#39' THE' +
        'N '#39'FOR: '#39' WHEN '#39'2'#39' THEN '#39'POR: '#39' END) AS ROD16,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'AEROPORTO DE DESCAR' +
        'GA'#39' WHEN '#39'1'#39' THEN '#39'AIRPORT OF DISCHARGE'#39' WHEN '#39'2'#39' THEN '#39'AEROPUER' +
        'TO DE DESEMBARQUE'#39' END) AS ROD17,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'AEROPORTO DE EMBARQ' +
        'UE'#39' WHEN '#39'1'#39' THEN '#39'AIRPORT OF LOADING'#39' WHEN '#39'2'#39' THEN '#39'AEROPUERTO' +
        ' DE EMBARQUE'#39' END) AS ROD18,'
      ''
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'CONTINUA'#199#195'O NA P'#193'GI' +
        'NA:'#39' WHEN '#39'1'#39' THEN '#39'CONTINUES ON PAGE:'#39' WHEN '#39'2'#39' THEN '#39'CONTINUAC' +
        'ION HOJA:'#39' END) AS DET01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'CONSIGNAT'#193'RIO'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'IMPORTER, DELIVERED AND CONSIGNED TO'#39' WHEN '#39'2'#39' THEN '#39 +
        'CONSIGNATARIO'#39' END) AS DUP01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'N'#250'mero Ordem:'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'Customer'#180's Order Number:'#39' WHEN '#39'2'#39' THEN '#39'Numero Orden' +
        ':'#39' END) AS DUP02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Embarca'#231#227'o/V'#244'o:'#39' WH' +
        'EN '#39'1'#39' THEN '#39'Vessel/Voy:'#39' WHEN '#39'2'#39' THEN '#39'Embarc./Vuelo:'#39' END) AS' +
        ' DUP03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'No. HBL/HAWB:'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'HBL/HAWB No.:'#39' WHEN '#39'2'#39' THEN '#39'No. HBL/HAWB:'#39' END) AS ' +
        'DUP04,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'No. MBL/MAWB:'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'MBL/MAWB No.:'#39' WHEN '#39'2'#39' THEN '#39'No. MBL/MAWB:'#39' END) AS ' +
        'DUP05,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Local de Embarque:'#39 +
        ' WHEN '#39'1'#39' THEN '#39'Place of Shipment:'#39' WHEN '#39'2'#39' THEN '#39'Local del Emb' +
        'arque:'#39' END) AS DUP06,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Pa'#237's de Origem:'#39' WH' +
        'EN '#39'1'#39' THEN '#39'Country of Origin:'#39' WHEN '#39'2'#39' THEN '#39'Pa'#237's de Origen:'#39 +
        ' END) AS DUP07,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Local de Desembarqu' +
        'e:'#39' WHEN '#39'1'#39' THEN '#39'Place of Discharge:'#39' WHEN '#39'2'#39' THEN '#39'Local del' +
        ' Desembarque:'#39' END) AS DUP08,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Destino Final:'#39' WHE' +
        'N '#39'1'#39' THEN '#39'Final Destination:'#39' WHEN '#39'2'#39' THEN '#39'Destinaci'#243'n Final' +
        ':'#39' END) AS DUP09,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'TERMOS E CONDI'#199#213'ES ' +
        'DE PAGTO.:'#39' WHEN '#39'1'#39' THEN '#39'PAYEMENT TERMS AND CONDITIONS:'#39' WHEN ' +
        #39'2'#39' THEN '#39'CONDICIONES DEL PAGO:'#39' END) AS DUP10,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'TERMO DE VENDAS:'#39' W' +
        'HEN '#39'1'#39' THEN '#39'SALES TERM:'#39' WHEN '#39'2'#39' THEN '#39'TERMO DE VENTAS:'#39' END)' +
        ' AS DUP11,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'LOCAL DE ENTREGA:'#39' ' +
        'WHEN '#39'1'#39' THEN '#39'PLACE FOR DELIVERY:'#39' WHEN '#39'2'#39' THEN '#39'LUGAR DE LA E' +
        'NTREGA:'#39' END) AS DUP12,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Qtd'#39' WHEN '#39'1'#39' THEN ' +
        #39'Qty'#39' WHEN '#39'2'#39' THEN '#39'Ctd'#39' END) AS DUP13,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Unidade'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'Unit'#39' WHEN '#39'2'#39' THEN '#39'Unidad'#39' END) AS DUP14,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Peso L'#237'q.'#39' WHEN '#39'1'#39 +
        ' THEN '#39'Net Weight'#39' WHEN '#39'2'#39' THEN '#39'Peso Neto'#39' END) AS DUP15,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Descri'#231#227'o'#39' WHEN '#39'1'#39 +
        ' THEN '#39'Description'#39' WHEN '#39'2'#39' THEN '#39'Descripci'#243'n'#39' END) AS DUP16,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Pre'#231'o Unit.'#39' WHEN '#39 +
        '1'#39' THEN '#39'Unit Price'#39' WHEN '#39'2'#39' THEN '#39'Precio Unit.'#39' END) AS DUP17,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'P. L'#237'q.'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'P. Neto'#39' WHEN '#39'2'#39' THEN '#39'Net'#39' END) AS DUP18,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'P. Bruto'#39' WHEN '#39'1'#39' ' +
        'THEN '#39'Gross'#39' WHEN '#39'2'#39' THEN '#39'P. Bruto'#39' END) AS DUP19,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Marca'#231#227'o'#39' WHEN '#39'1'#39' ' +
        'THEN '#39'Remarks'#39' WHEN '#39'2'#39' THEN '#39'Marcas'#39' END) AS DUP20,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Pa'#237's de Origem'#39' WHE' +
        'N '#39'1'#39' THEN '#39'Country of Origin'#39' WHEN '#39'2'#39' THEN '#39'Pa'#237's de Origen'#39' EN' +
        'D) AS CRO01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PA'#205'S DE DESTINO'#39' WH' +
        'EN '#39'1'#39' THEN '#39'COUNTRY OF DESTINATION'#39' WHEN '#39'2'#39' THEN '#39'DESTINACI'#211'N ' +
        'FINAL'#39' END) AS CRO02,'
      ''
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Fatura Nr:'#39' WHEN '#39'1' +
        #39' THEN '#39'Invoice Nr.:'#39' WHEN '#39'2'#39' THEN '#39'Fatura Nr:'#39' END) AS AJI01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'A:'#39' WHEN '#39'1'#39' THEN '#39 +
        'For Account of:'#39' WHEN '#39'2'#39' THEN '#39'A:'#39' END) AS AJI02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Endere'#231'o:'#39' WHEN '#39'1'#39 +
        ' THEN '#39'Address:'#39' WHEN '#39'2'#39' THEN '#39'End.:'#39' END) AS AJI03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Meios de Transporte' +
        ':'#39' WHEN '#39'1'#39' THEN '#39'Means of Transport:'#39' WHEN '#39'2'#39' THEN '#39'Medios de ' +
        'Transporte:'#39' END) AS AJI04,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Local de Embarque: ' +
        #39' WHEN '#39'1'#39' THEN '#39'Shipped from:'#39' WHEN '#39'2'#39' THEN '#39'Local de Origem:'#39 +
        ' END) AS AJI05,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Porto de Destino:'#39' ' +
        'WHEN '#39'1'#39' THEN '#39'Port of Destination:'#39' WHEN '#39'2'#39' THEN '#39'Puerto de De' +
        'stinaci'#243'n:'#39' END) AS AJI06,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Pedido nr.:'#39' WHEN '#39 +
        '1'#39' THEN '#39'Your Order nr.:'#39' WHEN '#39'2'#39' THEN '#39'Pedido nr.:'#39' END) AS AJ' +
        'I07,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Processo nr.:'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'Our Order nr.:'#39' WHEN '#39'2'#39' THEN '#39'Processo nr.:'#39' END) AS' +
        ' AJI08,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Cond. de Pagto'#39' WHE' +
        'N '#39'1'#39' THEN '#39'Terms of Payment:'#39' WHEN '#39'2'#39' THEN '#39'Cond. de pago:'#39' EN' +
        'D) AS AJI09,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Moeda:'#39' WHEN '#39'1'#39' TH' +
        'EN '#39'Currency:'#39' WHEN '#39'2'#39' THEN '#39'Moneda:'#39' END) AS AJI10,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Valor Total:'#39' WHEN ' +
        #39'1'#39' THEN '#39'Total Amount:'#39' WHEN '#39'2'#39' THEN '#39'Valor Total:'#39' END) AS AJ' +
        'I11,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Marcas:'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'Marks and numbers:'#39' WHEN '#39'2'#39' THEN '#39'Marcas y n'#250'meros:'#39' END) ' +
        'AS AJI12,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Quantidade de Pacot' +
        'es:'#39' WHEN '#39'1'#39' THEN '#39'Quantity of Packages:'#39' WHEN '#39'2'#39' THEN '#39'Cantid' +
        'ad de Paquete:'#39' END) AS AJI13,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Peso L'#237'q. Kg:'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'Net Weight Kg:'#39' WHEN '#39'2'#39' THEN '#39'Peso Neto Kg:'#39' END) AS' +
        ' AJI14,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Peso Bruto Kg:'#39' WHE' +
        'N '#39'1'#39' THEN '#39'Gross Weight Kg:'#39' WHEN '#39'2'#39' THEN '#39'Peso Bruto Kg:'#39' END' +
        ') AS AJI15,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'C'#243'd. Material'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'Material Code'#39' WHEN '#39'2'#39' THEN '#39'C'#243'd. Material'#39' END) AS ' +
        'AJI16,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Kg. Pacote.:'#39' WHEN ' +
        #39'1'#39' THEN '#39'Kgs. Package'#39' WHEN '#39'2'#39' THEN '#39'Kgs. Paquete'#39' END) AS AJI' +
        '17,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Qtd Pacote:'#39' WHEN '#39 +
        '1'#39' THEN '#39'Qty. Package'#39' WHEN '#39'2'#39' THEN '#39'Qtd. Paquete'#39' END) AS AJI1' +
        '8,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Descri'#231#227'o'#39' WHEN '#39'1'#39 +
        ' THEN '#39'Description of Goods'#39' WHEN '#39'2'#39' THEN '#39'Descripci'#243'n'#39' END) AS' +
        ' AJI19,'
      '       (CASE CD_LINGUA_PEDIDO'
      
        '         WHEN '#39'0'#39' THEN '#39'"N'#243's declaramos que as informa'#231#245'es acima' +
        ' mencionadas s'#227'o verdadeiras e corretas."'#39
      
        '         WHEN '#39'1'#39' THEN '#39'"We here by declare that that the above ' +
        'mentioned information is true and correct to the best of our kno' +
        'wledge."'#39
      
        '         WHEN '#39'2'#39' THEN '#39'"Declaramos que la informaci'#243'n arriba me' +
        'ncionada es verdadera y correcta."'#39
      '       END) AS AJI20,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Data'#39' WHEN '#39'1'#39' THEN' +
        ' '#39'Date'#39' WHEN '#39'2'#39' THEN '#39'Fecha'#39' END) AS AJI21,'
      ''
      '       (CASE CD_LINGUA_PEDIDO'
      
        '         WHEN '#39'0'#39' THEN '#39'Declara'#231#227'o: N'#243's declaramos que esta fatu' +
        'ra mostra o pre'#231'o real do produto descrito e que todos os detalh' +
        'es s'#227'o verdadeiros e corretos.'#39
      
        '         WHEN '#39'1'#39' THEN '#39'Declaration: We declare that this invoic' +
        'e shows the actual price of the goods described and that all the' +
        ' particulars are the true and correct.'#39
      
        '         WHEN '#39'2'#39' THEN '#39'Declarac'#237'on: Nosotros declaramos que est' +
        'a factura muestra el precio real del g'#233'nero descrito y que todos' +
        ' los detalles son verdad y correctos.'#39
      '       END) AS CRO03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Assinatura Autoriza' +
        'da'#39' WHEN '#39'1'#39' THEN '#39'Authorized Signature'#39' WHEN '#39'2'#39' THEN '#39'Firma Au' +
        'torizada'#39' END) AS CRO04'
      '  FROM TPROCESSO_EXP E (NOLOCK)'
      ' WHERE E.NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 186
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryTextoTIT01: TStringField
      FieldName = 'TIT01'
      FixedChar = True
      Size = 18
    end
    object qryTextoTIT02: TStringField
      FieldName = 'TIT02'
      FixedChar = True
      Size = 5
    end
    object qryTextoTIT03: TStringField
      FieldName = 'TIT03'
      FixedChar = True
      Size = 4
    end
    object qryTextoTIT04: TStringField
      FieldName = 'TIT04'
      FixedChar = True
      Size = 13
    end
    object qryTextoTIT05: TStringField
      FieldName = 'TIT05'
      FixedChar = True
      Size = 8
    end
    object qryTextoTIT06: TStringField
      FieldName = 'TIT06'
      FixedChar = True
      Size = 3
    end
    object qryTextoTIT07: TStringField
      FieldName = 'TIT07'
      FixedChar = True
      Size = 6
    end
    object qryTextoTIT08: TStringField
      FieldName = 'TIT08'
      FixedChar = True
      Size = 11
    end
    object qryTextoTIT09: TStringField
      FieldName = 'TIT09'
      FixedChar = True
      Size = 11
    end
    object qryTextoROD01: TStringField
      FieldName = 'ROD01'
      FixedChar = True
      Size = 9
    end
    object qryTextoROD02: TStringField
      FieldName = 'ROD02'
      FixedChar = True
      Size = 12
    end
    object qryTextoROD03: TStringField
      FieldName = 'ROD03'
      FixedChar = True
      Size = 12
    end
    object qryTextoROD04: TStringField
      FieldName = 'ROD04'
      FixedChar = True
      Size = 11
    end
    object qryTextoROD05: TStringField
      FieldName = 'ROD05'
      FixedChar = True
      Size = 14
    end
    object qryTextoROD06: TStringField
      FieldName = 'ROD06'
      FixedChar = True
      Size = 22
    end
    object qryTextoROD07: TStringField
      FieldName = 'ROD07'
      FixedChar = True
      Size = 11
    end
    object qryTextoROD08: TStringField
      FieldName = 'ROD08'
      FixedChar = True
      Size = 8
    end
    object qryTextoROD09: TStringField
      FieldName = 'ROD09'
      FixedChar = True
      Size = 21
    end
    object qryTextoROD10: TStringField
      FieldName = 'ROD10'
      FixedChar = True
      Size = 17
    end
    object qryTextoROD11: TStringField
      FieldName = 'ROD11'
      FixedChar = True
      Size = 10
    end
    object qryTextoROD12: TStringField
      FieldName = 'ROD12'
      FixedChar = True
      Size = 8
    end
    object qryTextoROD13: TStringField
      FieldName = 'ROD13'
      FixedChar = True
      Size = 10
    end
    object qryTextoDET01: TStringField
      FieldName = 'DET01'
      FixedChar = True
      Size = 22
    end
    object qryTextoDUP01: TStringField
      FieldName = 'DUP01'
      FixedChar = True
      Size = 36
    end
    object qryTextoDUP02: TStringField
      FieldName = 'DUP02'
      FixedChar = True
      Size = 24
    end
    object qryTextoDUP03: TStringField
      FieldName = 'DUP03'
      FixedChar = True
      Size = 15
    end
    object qryTextoDUP04: TStringField
      FieldName = 'DUP04'
      FixedChar = True
      Size = 13
    end
    object qryTextoDUP05: TStringField
      FieldName = 'DUP05'
      FixedChar = True
      Size = 13
    end
    object qryTextoDUP06: TStringField
      FieldName = 'DUP06'
      FixedChar = True
      Size = 25
    end
    object qryTextoDUP07: TStringField
      FieldName = 'DUP07'
      FixedChar = True
      Size = 18
    end
    object qryTextoDUP08: TStringField
      FieldName = 'DUP08'
      FixedChar = True
      Size = 26
    end
    object qryTextoDUP09: TStringField
      FieldName = 'DUP09'
      FixedChar = True
      Size = 18
    end
    object qryTextoDUP10: TStringField
      FieldName = 'DUP10'
      FixedChar = True
      Size = 30
    end
    object qryTextoDUP11: TStringField
      FieldName = 'DUP11'
      FixedChar = True
      Size = 16
    end
    object qryTextoDUP12: TStringField
      FieldName = 'DUP12'
      FixedChar = True
    end
    object qryTextoDUP13: TStringField
      FieldName = 'DUP13'
      FixedChar = True
      Size = 3
    end
    object qryTextoDUP14: TStringField
      FieldName = 'DUP14'
      FixedChar = True
      Size = 7
    end
    object qryTextoDUP15: TStringField
      FieldName = 'DUP15'
      FixedChar = True
      Size = 10
    end
    object qryTextoDUP16: TStringField
      FieldName = 'DUP16'
      FixedChar = True
      Size = 11
    end
    object qryTextoDUP17: TStringField
      FieldName = 'DUP17'
      FixedChar = True
      Size = 12
    end
    object qryTextoDUP18: TStringField
      FieldName = 'DUP18'
      FixedChar = True
      Size = 7
    end
    object qryTextoDUP19: TStringField
      FieldName = 'DUP19'
      FixedChar = True
      Size = 8
    end
    object qryTextoDUP20: TStringField
      FieldName = 'DUP20'
      FixedChar = True
      Size = 8
    end
    object qryTextoROD14: TStringField
      FieldName = 'ROD14'
      FixedChar = True
      Size = 21
    end
    object qryTextoCRO01: TStringField
      FieldName = 'CRO01'
      FixedChar = True
      Size = 17
    end
    object qryTextoCRO02: TStringField
      FieldName = 'CRO02'
      FixedChar = True
      Size = 22
    end
    object qryTextoROD15: TStringField
      FieldName = 'ROD15'
      FixedChar = True
      Size = 13
    end
    object qryTextoCRO03: TStringField
      FieldName = 'CRO03'
      FixedChar = True
      Size = 142
    end
    object qryTextoCRO04: TStringField
      FieldName = 'CRO04'
      FixedChar = True
      Size = 21
    end
    object qryTextoROD16: TStringField
      FieldName = 'ROD16'
      FixedChar = True
      Size = 5
    end
    object qryTextoROD17: TStringField
      FieldName = 'ROD17'
      FixedChar = True
      Size = 25
    end
    object qryTextoROD18: TStringField
      FieldName = 'ROD18'
      FixedChar = True
      Size = 22
    end
    object qryTextoAJI01: TStringField
      FieldName = 'AJI01'
      FixedChar = True
      Size = 12
    end
    object qryTextoAJI02: TStringField
      FieldName = 'AJI02'
      FixedChar = True
      Size = 15
    end
    object qryTextoAJI03: TStringField
      FieldName = 'AJI03'
      FixedChar = True
      Size = 9
    end
    object qryTextoAJI04: TStringField
      FieldName = 'AJI04'
      FixedChar = True
      Size = 21
    end
    object qryTextoAJI05: TStringField
      FieldName = 'AJI05'
      FixedChar = True
      Size = 19
    end
    object qryTextoAJI06: TStringField
      FieldName = 'AJI06'
      FixedChar = True
      Size = 22
    end
    object qryTextoAJI07: TStringField
      FieldName = 'AJI07'
      FixedChar = True
      Size = 15
    end
    object qryTextoAJI08: TStringField
      FieldName = 'AJI08'
      FixedChar = True
      Size = 14
    end
    object qryTextoAJI09: TStringField
      FieldName = 'AJI09'
      FixedChar = True
      Size = 17
    end
    object qryTextoAJI10: TStringField
      FieldName = 'AJI10'
      FixedChar = True
      Size = 9
    end
    object qryTextoAJI11: TStringField
      FieldName = 'AJI11'
      FixedChar = True
      Size = 13
    end
    object qryTextoAJI12: TStringField
      FieldName = 'AJI12'
      FixedChar = True
      Size = 18
    end
    object qryTextoAJI13: TStringField
      FieldName = 'AJI13'
      FixedChar = True
      Size = 22
    end
    object qryTextoAJI14: TStringField
      FieldName = 'AJI14'
      FixedChar = True
      Size = 14
    end
    object qryTextoAJI15: TStringField
      FieldName = 'AJI15'
      FixedChar = True
      Size = 16
    end
    object qryTextoAJI16: TStringField
      FieldName = 'AJI16'
      FixedChar = True
      Size = 13
    end
    object qryTextoAJI17: TStringField
      FieldName = 'AJI17'
      FixedChar = True
      Size = 12
    end
    object qryTextoAJI18: TStringField
      FieldName = 'AJI18'
      FixedChar = True
    end
    object qryTextoAJI19: TStringField
      FieldName = 'AJI19'
      FixedChar = True
    end
    object qryTextoAJI20: TStringField
      FieldName = 'AJI20'
      FixedChar = True
      Size = 110
    end
    object qryTextoAJI21: TStringField
      FieldName = 'AJI21'
      FixedChar = True
      Size = 5
    end
    object qryTextoTIT10: TStringField
      FieldName = 'TIT10'
      FixedChar = True
      Size = 16
    end
    object qryTextoTIT11: TStringField
      FieldName = 'TIT11'
      FixedChar = True
      Size = 9
    end
  end
  object ppBDETexto: TppBDEPipeline
    DataSource = dsTexto
    UserName = 'BDETexto'
    Left = 266
    Top = 32
    object ppBDETextoppField1: TppField
      FieldAlias = 'TIT01'
      FieldName = 'TIT01'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object ppBDETextoppField2: TppField
      FieldAlias = 'TIT02'
      FieldName = 'TIT02'
      FieldLength = 5
      DisplayWidth = 5
      Position = 1
    end
    object ppBDETextoppField3: TppField
      FieldAlias = 'TIT03'
      FieldName = 'TIT03'
      FieldLength = 4
      DisplayWidth = 4
      Position = 2
    end
    object ppBDETextoppField4: TppField
      FieldAlias = 'TIT04'
      FieldName = 'TIT04'
      FieldLength = 13
      DisplayWidth = 13
      Position = 3
    end
    object ppBDETextoppField5: TppField
      FieldAlias = 'TIT05'
      FieldName = 'TIT05'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object ppBDETextoppField6: TppField
      FieldAlias = 'TIT06'
      FieldName = 'TIT06'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object ppBDETextoppField7: TppField
      FieldAlias = 'TIT07'
      FieldName = 'TIT07'
      FieldLength = 6
      DisplayWidth = 6
      Position = 6
    end
    object ppBDETextoppField8: TppField
      FieldAlias = 'TIT08'
      FieldName = 'TIT08'
      FieldLength = 11
      DisplayWidth = 11
      Position = 7
    end
    object ppBDETextoppField9: TppField
      FieldAlias = 'TIT09'
      FieldName = 'TIT09'
      FieldLength = 11
      DisplayWidth = 11
      Position = 8
    end
    object ppBDETextoppField10: TppField
      FieldAlias = 'ROD01'
      FieldName = 'ROD01'
      FieldLength = 9
      DisplayWidth = 9
      Position = 9
    end
    object ppBDETextoppField11: TppField
      FieldAlias = 'ROD02'
      FieldName = 'ROD02'
      FieldLength = 12
      DisplayWidth = 12
      Position = 10
    end
    object ppBDETextoppField12: TppField
      FieldAlias = 'ROD03'
      FieldName = 'ROD03'
      FieldLength = 12
      DisplayWidth = 12
      Position = 11
    end
    object ppBDETextoppField13: TppField
      FieldAlias = 'ROD04'
      FieldName = 'ROD04'
      FieldLength = 11
      DisplayWidth = 11
      Position = 12
    end
    object ppBDETextoppField14: TppField
      FieldAlias = 'ROD05'
      FieldName = 'ROD05'
      FieldLength = 14
      DisplayWidth = 14
      Position = 13
    end
    object ppBDETextoppField15: TppField
      FieldAlias = 'ROD06'
      FieldName = 'ROD06'
      FieldLength = 22
      DisplayWidth = 22
      Position = 14
    end
    object ppBDETextoppField16: TppField
      FieldAlias = 'ROD07'
      FieldName = 'ROD07'
      FieldLength = 11
      DisplayWidth = 11
      Position = 15
    end
    object ppBDETextoppField17: TppField
      FieldAlias = 'ROD08'
      FieldName = 'ROD08'
      FieldLength = 8
      DisplayWidth = 8
      Position = 16
    end
    object ppBDETextoppField18: TppField
      FieldAlias = 'ROD09'
      FieldName = 'ROD09'
      FieldLength = 21
      DisplayWidth = 21
      Position = 17
    end
    object ppBDETextoppField19: TppField
      FieldAlias = 'ROD10'
      FieldName = 'ROD10'
      FieldLength = 17
      DisplayWidth = 17
      Position = 18
    end
    object ppBDETextoppField20: TppField
      FieldAlias = 'ROD11'
      FieldName = 'ROD11'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppBDETextoppField21: TppField
      FieldAlias = 'ROD12'
      FieldName = 'ROD12'
      FieldLength = 8
      DisplayWidth = 8
      Position = 20
    end
    object ppBDETextoppField22: TppField
      FieldAlias = 'ROD13'
      FieldName = 'ROD13'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppBDETextoppField23: TppField
      FieldAlias = 'DET01'
      FieldName = 'DET01'
      FieldLength = 22
      DisplayWidth = 22
      Position = 22
    end
    object ppBDETextoppField24: TppField
      FieldAlias = 'DUP01'
      FieldName = 'DUP01'
      FieldLength = 36
      DisplayWidth = 36
      Position = 23
    end
    object ppBDETextoppField25: TppField
      FieldAlias = 'DUP02'
      FieldName = 'DUP02'
      FieldLength = 24
      DisplayWidth = 24
      Position = 24
    end
    object ppBDETextoppField26: TppField
      FieldAlias = 'DUP03'
      FieldName = 'DUP03'
      FieldLength = 15
      DisplayWidth = 15
      Position = 25
    end
    object ppBDETextoppField27: TppField
      FieldAlias = 'DUP04'
      FieldName = 'DUP04'
      FieldLength = 13
      DisplayWidth = 13
      Position = 26
    end
    object ppBDETextoppField28: TppField
      FieldAlias = 'DUP05'
      FieldName = 'DUP05'
      FieldLength = 13
      DisplayWidth = 13
      Position = 27
    end
    object ppBDETextoppField29: TppField
      FieldAlias = 'DUP06'
      FieldName = 'DUP06'
      FieldLength = 25
      DisplayWidth = 25
      Position = 28
    end
    object ppBDETextoppField30: TppField
      FieldAlias = 'DUP07'
      FieldName = 'DUP07'
      FieldLength = 18
      DisplayWidth = 18
      Position = 29
    end
    object ppBDETextoppField31: TppField
      FieldAlias = 'DUP08'
      FieldName = 'DUP08'
      FieldLength = 26
      DisplayWidth = 26
      Position = 30
    end
    object ppBDETextoppField32: TppField
      FieldAlias = 'DUP09'
      FieldName = 'DUP09'
      FieldLength = 18
      DisplayWidth = 18
      Position = 31
    end
    object ppBDETextoppField33: TppField
      FieldAlias = 'DUP10'
      FieldName = 'DUP10'
      FieldLength = 30
      DisplayWidth = 30
      Position = 32
    end
    object ppBDETextoppField34: TppField
      FieldAlias = 'DUP11'
      FieldName = 'DUP11'
      FieldLength = 16
      DisplayWidth = 16
      Position = 33
    end
    object ppBDETextoppField35: TppField
      FieldAlias = 'DUP12'
      FieldName = 'DUP12'
      FieldLength = 20
      DisplayWidth = 20
      Position = 34
    end
    object ppBDETextoppField36: TppField
      FieldAlias = 'DUP13'
      FieldName = 'DUP13'
      FieldLength = 3
      DisplayWidth = 3
      Position = 35
    end
    object ppBDETextoppField37: TppField
      FieldAlias = 'DUP14'
      FieldName = 'DUP14'
      FieldLength = 7
      DisplayWidth = 7
      Position = 36
    end
    object ppBDETextoppField38: TppField
      FieldAlias = 'DUP15'
      FieldName = 'DUP15'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppBDETextoppField39: TppField
      FieldAlias = 'DUP16'
      FieldName = 'DUP16'
      FieldLength = 11
      DisplayWidth = 11
      Position = 38
    end
    object ppBDETextoppField40: TppField
      FieldAlias = 'DUP17'
      FieldName = 'DUP17'
      FieldLength = 12
      DisplayWidth = 12
      Position = 39
    end
    object ppBDETextoppField41: TppField
      FieldAlias = 'DUP18'
      FieldName = 'DUP18'
      FieldLength = 7
      DisplayWidth = 7
      Position = 40
    end
    object ppBDETextoppField42: TppField
      FieldAlias = 'DUP19'
      FieldName = 'DUP19'
      FieldLength = 8
      DisplayWidth = 8
      Position = 41
    end
    object ppBDETextoppField43: TppField
      FieldAlias = 'DUP20'
      FieldName = 'DUP20'
      FieldLength = 8
      DisplayWidth = 8
      Position = 42
    end
    object ppBDETextoppField44: TppField
      FieldAlias = 'ROD14'
      FieldName = 'ROD14'
      FieldLength = 21
      DisplayWidth = 21
      Position = 43
    end
    object ppBDETextoppField45: TppField
      FieldAlias = 'CRO01'
      FieldName = 'CRO01'
      FieldLength = 17
      DisplayWidth = 17
      Position = 44
    end
    object ppBDETextoppField46: TppField
      FieldAlias = 'CRO02'
      FieldName = 'CRO02'
      FieldLength = 22
      DisplayWidth = 22
      Position = 45
    end
    object ppBDETextoppField47: TppField
      FieldAlias = 'ROD15'
      FieldName = 'ROD15'
      FieldLength = 13
      DisplayWidth = 13
      Position = 46
    end
    object ppBDETextoppField48: TppField
      FieldAlias = 'CRO03'
      FieldName = 'CRO03'
      FieldLength = 142
      DisplayWidth = 142
      Position = 47
    end
    object ppBDETextoppField49: TppField
      FieldAlias = 'CRO04'
      FieldName = 'CRO04'
      FieldLength = 21
      DisplayWidth = 21
      Position = 48
    end
    object ppBDETextoppField50: TppField
      FieldAlias = 'ROD16'
      FieldName = 'ROD16'
      FieldLength = 5
      DisplayWidth = 5
      Position = 49
    end
    object ppBDETextoppField51: TppField
      FieldAlias = 'ROD17'
      FieldName = 'ROD17'
      FieldLength = 25
      DisplayWidth = 25
      Position = 50
    end
    object ppBDETextoppField52: TppField
      FieldAlias = 'ROD18'
      FieldName = 'ROD18'
      FieldLength = 22
      DisplayWidth = 22
      Position = 51
    end
    object ppBDETextoppField53: TppField
      FieldAlias = 'AJI01'
      FieldName = 'AJI01'
      FieldLength = 12
      DisplayWidth = 12
      Position = 52
    end
    object ppBDETextoppField54: TppField
      FieldAlias = 'AJI02'
      FieldName = 'AJI02'
      FieldLength = 15
      DisplayWidth = 15
      Position = 53
    end
    object ppBDETextoppField55: TppField
      FieldAlias = 'AJI03'
      FieldName = 'AJI03'
      FieldLength = 9
      DisplayWidth = 9
      Position = 54
    end
    object ppBDETextoppField56: TppField
      FieldAlias = 'AJI04'
      FieldName = 'AJI04'
      FieldLength = 21
      DisplayWidth = 21
      Position = 55
    end
    object ppBDETextoppField57: TppField
      FieldAlias = 'AJI05'
      FieldName = 'AJI05'
      FieldLength = 19
      DisplayWidth = 19
      Position = 56
    end
    object ppBDETextoppField58: TppField
      FieldAlias = 'AJI06'
      FieldName = 'AJI06'
      FieldLength = 22
      DisplayWidth = 22
      Position = 57
    end
    object ppBDETextoppField59: TppField
      FieldAlias = 'AJI07'
      FieldName = 'AJI07'
      FieldLength = 15
      DisplayWidth = 15
      Position = 58
    end
    object ppBDETextoppField60: TppField
      FieldAlias = 'AJI08'
      FieldName = 'AJI08'
      FieldLength = 14
      DisplayWidth = 14
      Position = 59
    end
    object ppBDETextoppField61: TppField
      FieldAlias = 'AJI09'
      FieldName = 'AJI09'
      FieldLength = 17
      DisplayWidth = 17
      Position = 60
    end
    object ppBDETextoppField62: TppField
      FieldAlias = 'AJI10'
      FieldName = 'AJI10'
      FieldLength = 9
      DisplayWidth = 9
      Position = 61
    end
    object ppBDETextoppField63: TppField
      FieldAlias = 'AJI11'
      FieldName = 'AJI11'
      FieldLength = 13
      DisplayWidth = 13
      Position = 62
    end
    object ppBDETextoppField64: TppField
      FieldAlias = 'AJI12'
      FieldName = 'AJI12'
      FieldLength = 18
      DisplayWidth = 18
      Position = 63
    end
    object ppBDETextoppField65: TppField
      FieldAlias = 'AJI13'
      FieldName = 'AJI13'
      FieldLength = 22
      DisplayWidth = 22
      Position = 64
    end
    object ppBDETextoppField66: TppField
      FieldAlias = 'AJI14'
      FieldName = 'AJI14'
      FieldLength = 14
      DisplayWidth = 14
      Position = 65
    end
    object ppBDETextoppField67: TppField
      FieldAlias = 'AJI15'
      FieldName = 'AJI15'
      FieldLength = 16
      DisplayWidth = 16
      Position = 66
    end
    object ppBDETextoppField68: TppField
      FieldAlias = 'AJI16'
      FieldName = 'AJI16'
      FieldLength = 13
      DisplayWidth = 13
      Position = 67
    end
    object ppBDETextoppField69: TppField
      FieldAlias = 'AJI17'
      FieldName = 'AJI17'
      FieldLength = 12
      DisplayWidth = 12
      Position = 68
    end
    object ppBDETextoppField70: TppField
      FieldAlias = 'AJI18'
      FieldName = 'AJI18'
      FieldLength = 20
      DisplayWidth = 20
      Position = 69
    end
    object ppBDETextoppField71: TppField
      FieldAlias = 'AJI19'
      FieldName = 'AJI19'
      FieldLength = 20
      DisplayWidth = 20
      Position = 70
    end
    object ppBDETextoppField72: TppField
      FieldAlias = 'AJI20'
      FieldName = 'AJI20'
      FieldLength = 110
      DisplayWidth = 110
      Position = 71
    end
    object ppBDETextoppField73: TppField
      FieldAlias = 'AJI21'
      FieldName = 'AJI21'
      FieldLength = 5
      DisplayWidth = 5
      Position = 72
    end
    object ppBDETextoppField74: TppField
      FieldAlias = 'TIT10'
      FieldName = 'TIT10'
      FieldLength = 16
      DisplayWidth = 16
      Position = 73
    end
    object ppBDETextoppField75: TppField
      FieldAlias = 'TIT11'
      FieldName = 'TIT11'
      FieldLength = 10
      DisplayWidth = 10
      Position = 74
    end
  end
  object BDE_total: TppBDEPipeline
    DataSource = ds_total
    UserName = 'BDE_total'
    Left = 266
    Top = 5
    object BDE_totalppField1: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object BDE_totalppField2: TppField
      FieldAlias = 'END_EMPRESA'
      FieldName = 'END_EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object BDE_totalppField3: TppField
      FieldAlias = 'END_NUMERO'
      FieldName = 'END_NUMERO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object BDE_totalppField4: TppField
      FieldAlias = 'END_COMPL'
      FieldName = 'END_COMPL'
      FieldLength = 41
      DisplayWidth = 41
      Position = 3
    end
    object BDE_totalppField5: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object BDE_totalppField6: TppField
      FieldAlias = 'NM_CONSIGNATARIO'
      FieldName = 'NM_CONSIGNATARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object BDE_totalppField7: TppField
      FieldAlias = 'END_CONSIGNATARIO'
      FieldName = 'END_CONSIGNATARIO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object BDE_totalppField8: TppField
      FieldAlias = 'END_CONSIGNATARIO_2'
      FieldName = 'END_CONSIGNATARIO_2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object BDE_totalppField9: TppField
      FieldAlias = 'CIDADE_CONSIGNATARIO'
      FieldName = 'CIDADE_CONSIGNATARIO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object BDE_totalppField10: TppField
      FieldAlias = 'TRANSPORTE'
      FieldName = 'TRANSPORTE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
    object BDE_totalppField11: TppField
      FieldAlias = 'NR_CONHECIMENTO'
      FieldName = 'NR_CONHECIMENTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object BDE_totalppField12: TppField
      FieldAlias = 'TERMO_PAGTO'
      FieldName = 'TERMO_PAGTO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 11
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField13: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM'
      FieldName = 'NM_LOCAL_ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object BDE_totalppField14: TppField
      FieldAlias = 'NM_LOCAL_DESTINO'
      FieldName = 'NM_LOCAL_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object BDE_totalppField15: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 14
    end
    object BDE_totalppField16: TppField
      FieldAlias = 'NR_FATURA'
      FieldName = 'NR_FATURA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 15
    end
    object BDE_totalppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIA_FATURA'
      FieldName = 'DIA_FATURA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object BDE_totalppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'MES_FATURA'
      FieldName = 'MES_FATURA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object BDE_totalppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANO_FATURA'
      FieldName = 'ANO_FATURA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object BDE_totalppField20: TppField
      FieldAlias = 'TX_DECL_ADICIONAL'
      FieldName = 'TX_DECL_ADICIONAL'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 19
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField21: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 20
    end
    object BDE_totalppField22: TppField
      FieldAlias = 'calc_dt_fatura'
      FieldName = 'calc_dt_fatura'
      FieldLength = 50
      DisplayWidth = 50
      Position = 21
    end
    object BDE_totalppField23: TppField
      FieldAlias = 'CD_LINGUA_PEDIDO'
      FieldName = 'CD_LINGUA_PEDIDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object BDE_totalppField24: TppField
      FieldAlias = 'SIGLA_MOEDA'
      FieldName = 'SIGLA_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 23
    end
    object BDE_totalppField25: TppField
      FieldAlias = 'NOME_BANCO'
      FieldName = 'NOME_BANCO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 24
    end
    object BDE_totalppField26: TppField
      FieldAlias = 'calc_incoterm'
      FieldName = 'calc_incoterm'
      FieldLength = 255
      DisplayWidth = 255
      Position = 25
    end
    object BDE_totalppField27: TppField
      FieldAlias = 'calc_importador'
      FieldName = 'calc_importador'
      FieldLength = 255
      DisplayWidth = 255
      Position = 26
    end
    object BDE_totalppField28: TppField
      FieldAlias = 'calc_import2'
      FieldName = 'calc_import2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 27
    end
    object BDE_totalppField29: TppField
      FieldAlias = 'calc_consig2'
      FieldName = 'calc_consig2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 28
    end
    object BDE_totalppField30: TppField
      FieldAlias = 'calc_consig'
      FieldName = 'calc_consig'
      FieldLength = 255
      DisplayWidth = 255
      Position = 29
    end
    object BDE_totalppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object BDE_totalppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_LIQUIDO'
      FieldName = 'PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object BDE_totalppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_BRUTO'
      FieldName = 'PESO_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object BDE_totalppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUBAGEM'
      FieldName = 'CUBAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object BDE_totalppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_FOB'
      FieldName = 'TOTAL_FOB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object BDE_totalppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'FRETE'
      FieldName = 'FRETE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object BDE_totalppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEGURO'
      FieldName = 'SEGURO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object BDE_totalppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_MCV'
      FieldName = 'TOTAL_MCV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object BDE_totalppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_DESPESA'
      FieldName = 'TOTAL_DESPESA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object BDE_totalppField40: TppField
      FieldAlias = 'calc_termo'
      FieldName = 'calc_termo'
      FieldLength = 255
      DisplayWidth = 255
      Position = 39
    end
    object BDE_totalppField41: TppField
      FieldAlias = 'calc_original'
      FieldName = 'calc_original'
      FieldLength = 8
      DisplayWidth = 8
      Position = 40
    end
    object BDE_totalppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'FRETE_INTERNO'
      FieldName = 'FRETE_INTERNO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object BDE_totalppField43: TppField
      FieldAlias = 'CLIENTE'
      FieldName = 'CLIENTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 42
    end
    object BDE_totalppField44: TppField
      FieldAlias = 'END_CLIENTE'
      FieldName = 'END_CLIENTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 43
    end
    object BDE_totalppField45: TppField
      FieldAlias = 'NUM_CLIENTE'
      FieldName = 'NUM_CLIENTE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 44
    end
    object BDE_totalppField46: TppField
      FieldAlias = 'COMPL_CLIENTE'
      FieldName = 'COMPL_CLIENTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 45
    end
    object BDE_totalppField47: TppField
      FieldAlias = 'CIDADE_CLIENTE'
      FieldName = 'CIDADE_CLIENTE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 46
    end
    object BDE_totalppField48: TppField
      FieldAlias = 'UF_CLIENTE'
      FieldName = 'UF_CLIENTE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 47
    end
    object BDE_totalppField49: TppField
      FieldAlias = 'CEP_CLIENTE'
      FieldName = 'CEP_CLIENTE'
      FieldLength = 8
      DisplayWidth = 8
      Position = 48
    end
    object BDE_totalppField50: TppField
      FieldAlias = 'TEL_CLIENTE'
      FieldName = 'TEL_CLIENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 49
    end
    object BDE_totalppField51: TppField
      FieldAlias = 'FAX_CLIENTE'
      FieldName = 'FAX_CLIENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 50
    end
    object BDE_totalppField52: TppField
      FieldAlias = 'VIA'
      FieldName = 'VIA'
      FieldLength = 100
      DisplayWidth = 100
      Position = 51
    end
    object BDE_totalppField53: TppField
      FieldAlias = 'NM_NOTIFY'
      FieldName = 'NM_NOTIFY'
      FieldLength = 60
      DisplayWidth = 60
      Position = 52
    end
    object BDE_totalppField54: TppField
      FieldAlias = 'END_NOTIFY'
      FieldName = 'END_NOTIFY'
      FieldLength = 100
      DisplayWidth = 100
      Position = 53
    end
    object BDE_totalppField55: TppField
      FieldAlias = 'END_NOTIFY_2'
      FieldName = 'END_NOTIFY_2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 54
    end
    object BDE_totalppField56: TppField
      FieldAlias = 'CIDADE_NOTIFY'
      FieldName = 'CIDADE_NOTIFY'
      FieldLength = 30
      DisplayWidth = 30
      Position = 55
    end
    object BDE_totalppField57: TppField
      FieldAlias = 'NM_PAIS_ORIGEM'
      FieldName = 'NM_PAIS_ORIGEM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 56
    end
    object BDE_totalppField58: TppField
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 57
    end
    object BDE_totalppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_DESC'
      FieldName = 'TOTAL_DESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object BDE_totalppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUB_TOT'
      FieldName = 'SUB_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object BDE_totalppField61: TppField
      FieldAlias = 'TX_MARCACAO_VOLUME'
      FieldName = 'TX_MARCACAO_VOLUME'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 60
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField62: TppField
      FieldAlias = 'TX_INF_EMBALAGEM'
      FieldName = 'TX_INF_EMBALAGEM'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 61
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField63: TppField
      FieldAlias = 'calc_notify'
      FieldName = 'calc_notify'
      FieldLength = 255
      DisplayWidth = 255
      Position = 62
    end
    object BDE_totalppField64: TppField
      FieldAlias = 'calc_notify2'
      FieldName = 'calc_notify2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 63
    end
    object BDE_totalppField65: TppField
      FieldAlias = 'calc_consig3'
      FieldName = 'calc_consig3'
      FieldLength = 255
      DisplayWidth = 255
      Position = 64
    end
    object BDE_totalppField66: TppField
      FieldAlias = 'calc_notify3'
      FieldName = 'calc_notify3'
      FieldLength = 255
      DisplayWidth = 255
      Position = 65
    end
    object BDE_totalppField67: TppField
      FieldAlias = 'calc_end_cliente'
      FieldName = 'calc_end_cliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 66
    end
    object BDE_totalppField68: TppField
      FieldAlias = 'calc_end_cliente2'
      FieldName = 'calc_end_cliente2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 67
    end
    object BDE_totalppField69: TppField
      FieldAlias = 'calc_origem'
      FieldName = 'calc_origem'
      FieldLength = 255
      DisplayWidth = 255
      Position = 68
    end
    object BDE_totalppField70: TppField
      FieldAlias = 'calc_destino'
      FieldName = 'calc_destino'
      FieldLength = 255
      DisplayWidth = 255
      Position = 69
    end
    object BDE_totalppField71: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 70
    end
    object BDE_totalppField72: TppField
      FieldAlias = 'NM_PAIS'
      FieldName = 'NM_PAIS'
      FieldLength = 50
      DisplayWidth = 50
      Position = 71
    end
    object BDE_totalppField73: TppField
      FieldAlias = 'PAIS_CONSIGNATARIO'
      FieldName = 'PAIS_CONSIGNATARIO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 72
    end
    object BDE_totalppField74: TppField
      FieldAlias = 'PAIS_NOTIFY'
      FieldName = 'PAIS_NOTIFY'
      FieldLength = 50
      DisplayWidth = 50
      Position = 73
    end
    object BDE_totalppField75: TppField
      FieldAlias = 'TELEFONE_CONSIGNATARIO'
      FieldName = 'TELEFONE_CONSIGNATARIO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 74
    end
    object BDE_totalppField76: TppField
      FieldAlias = 'TELEFONE_NOTIFY'
      FieldName = 'TELEFONE_NOTIFY'
      FieldLength = 15
      DisplayWidth = 15
      Position = 75
    end
    object BDE_totalppField77: TppField
      FieldAlias = 'ESTADO_CONSIG'
      FieldName = 'ESTADO_CONSIG'
      FieldLength = 30
      DisplayWidth = 30
      Position = 76
    end
    object BDE_totalppField78: TppField
      FieldAlias = 'ESTADO_NOTIFY'
      FieldName = 'ESTADO_NOTIFY'
      FieldLength = 30
      DisplayWidth = 30
      Position = 77
    end
    object BDE_totalppField79: TppField
      FieldAlias = 'END_BANCO'
      FieldName = 'END_BANCO'
      FieldLength = 68
      DisplayWidth = 68
      Position = 78
    end
    object BDE_totalppField80: TppField
      FieldAlias = 'TX_LOGOMARCA'
      FieldName = 'TX_LOGOMARCA'
      FieldLength = 25
      DisplayWidth = 25
      Position = 79
    end
    object BDE_totalppField81: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 80
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField82: TppField
      FieldAlias = 'LOCAL_TOTAL'
      FieldName = 'LOCAL_TOTAL'
      FieldLength = 50
      DisplayWidth = 50
      Position = 81
    end
    object BDE_totalppField83: TppField
      FieldAlias = 'calcNrOrder'
      FieldName = 'calcNrOrder'
      FieldLength = 255
      DisplayWidth = 255
      Position = 82
    end
    object BDE_totalppField84: TppField
      FieldAlias = 'NR_CONHECIMENTO_MASTER'
      FieldName = 'NR_CONHECIMENTO_MASTER'
      FieldLength = 30
      DisplayWidth = 30
      Position = 83
    end
    object BDE_totalppField85: TppField
      FieldAlias = 'INCOTERM_MERC'
      FieldName = 'INCOTERM_MERC'
      FieldLength = 3
      DisplayWidth = 3
      Position = 84
    end
    object BDE_totalppField86: TppField
      FieldAlias = 'TX_IMPORTADOR'
      FieldName = 'TX_IMPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 85
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField87: TppField
      FieldAlias = 'TX_EXPORTADOR'
      FieldName = 'TX_EXPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 86
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField88: TppField
      FieldAlias = 'TX_CONSIGNATARIO'
      FieldName = 'TX_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 87
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField89: TppField
      FieldAlias = 'TX_NOTIFY1'
      FieldName = 'TX_NOTIFY1'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 88
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField90: TppField
      FieldAlias = 'TX_NOTIFY2'
      FieldName = 'TX_NOTIFY2'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 89
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField91: TppField
      FieldAlias = 'TX_DOCTO'
      FieldName = 'TX_DOCTO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 90
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField92: TppField
      FieldAlias = 'TX_COPIA'
      FieldName = 'TX_COPIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 91
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField93: TppField
      FieldAlias = 'TX_SAQUE'
      FieldName = 'TX_SAQUE'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 92
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField94: TppField
      FieldAlias = 'NM_UNID_MED_PL'
      FieldName = 'NM_UNID_MED_PL'
      FieldLength = 6
      DisplayWidth = 6
      Position = 93
    end
    object BDE_totalppField95: TppField
      FieldAlias = 'NM_UNID_MED_PB'
      FieldName = 'NM_UNID_MED_PB'
      FieldLength = 6
      DisplayWidth = 6
      Position = 94
    end
    object BDE_totalppField96: TppField
      FieldAlias = 'NM_LOCAL_DESTINO_1'
      FieldName = 'NM_LOCAL_DESTINO_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 95
    end
    object BDE_totalppField97: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM_1'
      FieldName = 'NM_LOCAL_ORIGEM_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 96
    end
    object BDE_totalppField98: TppField
      FieldAlias = 'NM_PAIS_DESTINO_1'
      FieldName = 'NM_PAIS_DESTINO_1'
      FieldLength = 120
      DisplayWidth = 120
      Position = 97
    end
    object BDE_totalppField99: TppField
      FieldAlias = 'NM_PAIS_ORIGEM_1'
      FieldName = 'NM_PAIS_ORIGEM_1'
      FieldLength = 120
      DisplayWidth = 120
      Position = 98
    end
    object BDE_totalppField100: TppField
      FieldAlias = 'TX_TERMO_PAGTO'
      FieldName = 'TX_TERMO_PAGTO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 99
      Searchable = False
      Sortable = False
    end
    object BDE_totalppField101: TppField
      FieldAlias = 'END_ESTADO'
      FieldName = 'END_ESTADO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 100
    end
    object BDE_totalppField102: TppField
      FieldAlias = 'NM_NOTIFY2'
      FieldName = 'NM_NOTIFY2'
      FieldLength = 60
      DisplayWidth = 60
      Position = 101
    end
    object BDE_totalppField103: TppField
      FieldAlias = 'END_NOTIFY2'
      FieldName = 'END_NOTIFY2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 102
    end
    object BDE_totalppField104: TppField
      FieldAlias = 'END_NOTIFY2_2'
      FieldName = 'END_NOTIFY2_2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 103
    end
    object BDE_totalppField105: TppField
      FieldAlias = 'PAIS_NOTIFY2'
      FieldName = 'PAIS_NOTIFY2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 104
    end
    object BDE_totalppField106: TppField
      FieldAlias = 'CIDADE_NOTIFY2'
      FieldName = 'CIDADE_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 105
    end
    object BDE_totalppField107: TppField
      FieldAlias = 'ESTADO_NOTIFY2'
      FieldName = 'ESTADO_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 106
    end
    object BDE_totalppField108: TppField
      FieldAlias = 'TELEFONE_NOTIFY2'
      FieldName = 'TELEFONE_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 107
    end
    object BDE_totalppField109: TppField
      FieldAlias = 'calc_notify2_linha2'
      FieldName = 'calc_notify2_linha2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 108
    end
    object BDE_totalppField110: TppField
      FieldAlias = 'calc_notify2_linha1'
      FieldName = 'calc_notify2_linha1'
      FieldLength = 255
      DisplayWidth = 255
      Position = 109
    end
    object BDE_totalppField111: TppField
      FieldAlias = 'calc_notify2_linha3'
      FieldName = 'calc_notify2_linha3'
      FieldLength = 255
      DisplayWidth = 255
      Position = 110
    end
    object BDE_totalppField112: TppField
      FieldAlias = 'CD_NOTIFY2'
      FieldName = 'CD_NOTIFY2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 111
    end
    object BDE_totalppField113: TppField
      FieldAlias = 'LOCAL_TOTAL_CARTA'
      FieldName = 'LOCAL_TOTAL_CARTA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 112
    end
    object BDE_totalppField114: TppField
      FieldAlias = 'INCOTERM2'
      FieldName = 'INCOTERM2'
      FieldLength = 3
      DisplayWidth = 3
      Position = 113
    end
    object BDE_totalppField115: TppField
      FieldAlias = 'FAX_NOTIFY'
      FieldName = 'FAX_NOTIFY'
      FieldLength = 15
      DisplayWidth = 15
      Position = 114
    end
    object BDE_totalppField116: TppField
      FieldAlias = 'CONTATO_NOTIFY'
      FieldName = 'CONTATO_NOTIFY'
      FieldLength = 50
      DisplayWidth = 50
      Position = 115
    end
    object BDE_totalppField117: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 15
      DisplayWidth = 15
      Position = 116
    end
    object BDE_totalppField118: TppField
      FieldAlias = 'NR_RUC'
      FieldName = 'NR_RUC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 117
    end
    object BDE_totalppField119: TppField
      FieldAlias = 'NR_NIT'
      FieldName = 'NR_NIT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 118
    end
    object BDE_totalppField120: TppField
      FieldAlias = 'FAX_CONSIGNATARIO'
      FieldName = 'FAX_CONSIGNATARIO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 119
    end
    object BDE_totalppField121: TppField
      FieldAlias = 'RUC_CONSIGNATARIO'
      FieldName = 'RUC_CONSIGNATARIO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 120
    end
    object BDE_totalppField122: TppField
      FieldAlias = 'NIT_CONSIGNATARIO'
      FieldName = 'NIT_CONSIGNATARIO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 121
    end
    object BDE_totalppField123: TppField
      FieldAlias = 'RUC_NOTIFY'
      FieldName = 'RUC_NOTIFY'
      FieldLength = 30
      DisplayWidth = 30
      Position = 122
    end
    object BDE_totalppField124: TppField
      FieldAlias = 'NIT_NOTIFY'
      FieldName = 'NIT_NOTIFY'
      FieldLength = 30
      DisplayWidth = 30
      Position = 123
    end
    object BDE_totalppField125: TppField
      FieldAlias = 'FAX_NOTIFY2'
      FieldName = 'FAX_NOTIFY2'
      FieldLength = 15
      DisplayWidth = 15
      Position = 124
    end
    object BDE_totalppField126: TppField
      FieldAlias = 'RUC_NOTIFY2'
      FieldName = 'RUC_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 125
    end
    object BDE_totalppField127: TppField
      FieldAlias = 'NIT_NOTIFY2'
      FieldName = 'NIT_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 126
    end
    object BDE_totalppField128: TppField
      FieldAlias = 'VIA_AJI'
      FieldName = 'VIA_AJI'
      FieldLength = 31
      DisplayWidth = 31
      Position = 127
    end
    object BDE_totalppField129: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM_AJI'
      FieldName = 'NM_LOCAL_ORIGEM_AJI'
      FieldLength = 178
      DisplayWidth = 178
      Position = 128
    end
    object BDE_totalppField130: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 129
    end
    object BDE_totalppField131: TppField
      FieldAlias = 'CGC_CLIENTE'
      FieldName = 'CGC_CLIENTE'
      FieldLength = 23
      DisplayWidth = 23
      Position = 130
    end
    object BDE_totalppField132: TppField
      FieldAlias = 'CONTATO_CARGO'
      FieldName = 'CONTATO_CARGO'
      FieldLength = 78
      DisplayWidth = 78
      Position = 131
    end
    object BDE_totalppField133: TppField
      FieldAlias = 'NR_CUIT'
      FieldName = 'NR_CUIT'
      FieldLength = 31
      DisplayWidth = 31
      Position = 132
    end
    object BDE_totalppField134: TppField
      FieldAlias = 'CUIT_CONSIGNATARIO'
      FieldName = 'CUIT_CONSIGNATARIO'
      FieldLength = 31
      DisplayWidth = 31
      Position = 133
    end
    object BDE_totalppField135: TppField
      FieldAlias = 'CUIT_NOTIFY'
      FieldName = 'CUIT_NOTIFY'
      FieldLength = 31
      DisplayWidth = 31
      Position = 134
    end
    object BDE_totalppField136: TppField
      FieldAlias = 'CUIT_NOTIFY2'
      FieldName = 'CUIT_NOTIFY2'
      FieldLength = 31
      DisplayWidth = 31
      Position = 135
    end
    object BDE_totalppField137: TppField
      FieldAlias = 'CD_IMPORTADOR'
      FieldName = 'CD_IMPORTADOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 136
    end
    object BDE_totalppField138: TppField
      FieldAlias = 'TX_LOGOMARCA_EMPRESA_NAC'
      FieldName = 'TX_LOGOMARCA_EMPRESA_NAC'
      FieldLength = 112
      DisplayWidth = 112
      Position = 137
    end
  end
  object qry_Ajinomoto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DENSE_RANK() OVER (ORDER BY E.CD_PAIS_ORIGEM) AS RANK, E.' +
        'CD_PAIS_ORIGEM, P.DESCRICAO'
      'FROM TPROCESSO_EXP_ITEM E'
      'INNER JOIN TPAIS P ON P.CODIGO = E.CD_PAIS_ORIGEM '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY E.CD_PAIS_ORIGEM, P.DESCRICAO'
      'ORDER BY E.CD_PAIS_ORIGEM')
    Left = 103
    Top = 177
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_AjinomotoRANK: TFloatField
      FieldName = 'RANK'
    end
    object qry_AjinomotoCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_AjinomotoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 120
    end
  end
  object ds_Ajinomoto: TDataSource
    DataSet = qry_Ajinomoto
    Left = 125
    Top = 5
  end
  object BDE_Ajinomoto: TppBDEPipeline
    DataSource = ds_Ajinomoto
    UserName = 'BDE_Ajinomoto'
    Left = 244
    Top = 33
    object ppBDEPipeline1ppField206: TppField
      Alignment = taRightJustify
      FieldAlias = 'RANK'
      FieldName = 'RANK'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDEPipeline1ppField207: TppField
      FieldAlias = 'CD_PAIS_ORIGEM'
      FieldName = 'CD_PAIS_ORIGEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object ppBDEPipeline1ppField208: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 2
    end
  end
  object BDE_detalhe: TppBDEPipeline
    DataSource = ds_detalhe
    UserName = 'BDE_detalhe'
    Left = 268
    Top = 70
    MasterDataPipelineName = 'BDE_total'
    object BDE_detalheppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'QT_MERCADORIA'
      FieldName = 'QT_MERCADORIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object BDE_detalheppField2: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object BDE_detalheppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_PESO_LIQ'
      FieldName = 'VL_TOT_PESO_LIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object BDE_detalheppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_UNITARIO'
      FieldName = 'VL_UNITARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object BDE_detalheppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_ITEM'
      FieldName = 'VL_TOT_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object BDE_detalheppField6: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 5
    end
    object BDE_detalheppField7: TppField
      FieldAlias = 'NR_PEDIDO_IMP'
      FieldName = 'NR_PEDIDO_IMP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object BDE_detalheppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_UNITARIO5'
      FieldName = 'VL_UNITARIO5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object BDE_detalheppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQ_ITEM'
      FieldName = 'VL_PESO_LIQ_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object BDE_detalheppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO_ITEM'
      FieldName = 'VL_PESO_BRUTO_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object BDE_detalheppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CUBAGEM_ITEM'
      FieldName = 'VL_CUBAGEM_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object BDE_detalheppField12: TppField
      FieldAlias = 'CD_UNID_MEDIDA'
      FieldName = 'CD_UNID_MEDIDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 11
    end
    object BDE_detalheppField13: TppField
      FieldAlias = 'SIGLA_UNIDADE'
      FieldName = 'SIGLA_UNIDADE'
      FieldLength = 3
      DisplayWidth = 3
      Position = 12
    end
    object BDE_detalheppField14: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 13
      Searchable = False
      Sortable = False
    end
    object BDE_detalheppField15: TppField
      FieldAlias = 'CD_NCM'
      FieldName = 'CD_NCM'
      FieldLength = 11
      DisplayWidth = 11
      Position = 14
    end
    object BDE_detalheppField16: TppField
      FieldAlias = 'CD_FABRICANTE'
      FieldName = 'CD_FABRICANTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 15
    end
    object BDE_detalheppField17: TppField
      FieldAlias = 'CD_MERCADORIA'
      FieldName = 'CD_MERCADORIA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 16
    end
    object BDE_detalheppField18: TppField
      FieldAlias = 'calcMarcas'
      FieldName = 'calcMarcas'
      FieldLength = 255
      DisplayWidth = 255
      Position = 17
    end
    object BDE_detalheppField19: TppField
      FieldAlias = 'calcPacote'
      FieldName = 'calcPacote'
      FieldLength = 255
      DisplayWidth = 255
      Position = 18
    end
    object BDE_detalheppField20: TppField
      FieldAlias = 'REMESSA'
      FieldName = 'REMESSA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 19
    end
    object BDE_detalheppField21: TppField
      FieldAlias = 'NR_ORDER'
      FieldName = 'NR_ORDER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 20
    end
    object BDE_detalheppField22: TppField
      FieldAlias = 'calcREF'
      FieldName = 'calcREF'
      FieldLength = 255
      DisplayWidth = 255
      Position = 21
    end
    object BDE_detalheppField23: TppField
      FieldAlias = 'calcDescricao'
      FieldName = 'calcDescricao'
      FieldLength = 255
      DisplayWidth = 255
      Position = 22
    end
    object BDE_detalheppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_DESCONTO'
      FieldName = 'VL_DESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object BDE_detalheppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_FRETE'
      FieldName = 'VL_FRETE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object BDE_detalheppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_SEGURO'
      FieldName = 'VL_SEGURO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object BDE_detalheppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_ACRESCIMO'
      FieldName = 'VL_ACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object BDE_detalheppField28: TppField
      FieldAlias = 'NORMA_ORIGEM'
      FieldName = 'NORMA_ORIGEM'
      FieldLength = 213
      DisplayWidth = 213
      Position = 27
    end
    object BDE_detalheppField29: TppField
      FieldAlias = 'calcPackage'
      FieldName = 'calcPackage'
      FieldLength = 255
      DisplayWidth = 255
      Position = 28
    end
    object BDE_detalheppField30: TppField
      FieldAlias = 'MATERIALOLD'
      FieldName = 'MATERIALOLD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 29
    end
    object BDE_detalheppField31: TppField
      FieldAlias = 'CD_NALADI_SH'
      FieldName = 'CD_NALADI_SH'
      FieldLength = 8
      DisplayWidth = 8
      Position = 30
    end
    object BDE_detalheppField32: TppField
      FieldAlias = 'TX_BILLING_DOC'
      FieldName = 'TX_BILLING_DOC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object BDE_detalheppField33: TppField
      FieldAlias = 'TX_DELIVERY_NOTE'
      FieldName = 'TX_DELIVERY_NOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
    object BDE_detalheppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_EMBALAGEM'
      FieldName = 'VL_EMBALAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object BDE_detalheppField35: TppField
      FieldAlias = 'TX_INF_EMBALAGEM'
      FieldName = 'TX_INF_EMBALAGEM'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 34
      Searchable = False
      Sortable = False
    end
    object BDE_detalheppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'QT_EMBALAGEM'
      FieldName = 'QT_EMBALAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object BDE_detalheppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'QT_POR_EMB'
      FieldName = 'QT_POR_EMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object BDE_detalheppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'RANK'
      FieldName = 'RANK'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object BDE_detalheppField39: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 38
    end
    object BDE_detalheppField40: TppField
      FieldAlias = 'CD_MATERIAL'
      FieldName = 'CD_MATERIAL'
      FieldLength = 40
      DisplayWidth = 40
      Position = 39
    end
    object BDE_detalheppField41: TppField
      FieldAlias = 'CD_SAP'
      FieldName = 'CD_SAP'
      FieldLength = 20
      DisplayWidth = 20
      Position = 40
    end
    object BDE_detalheppField42: TppField
      FieldAlias = 'NM_PROCEDENCIA'
      FieldName = 'NM_PROCEDENCIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 41
      Searchable = False
      Sortable = False
    end
    object calcCD_Mercadoria: TppField
      FieldAlias = 'calcCD_Mercadoria'
      FieldName = 'calcCD_Mercadoria'
      FieldLength = 10
      DisplayWidth = 10
      Position = 42
    end
  end
end
