object frm_exp_impr_bordero: Tfrm_exp_impr_bordero
  Left = 430
  Top = 171
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Border'#244
  ClientHeight = 185
  ClientWidth = 383
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    383
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object shpFundo: TShape
    Left = 0
    Top = 132
    Width = 383
    Height = 53
    Align = alBottom
    Brush.Style = bsClear
    Pen.Color = clGray
  end
  object btnImprimir: TSpeedButton
    Left = 143
    Top = 138
    Width = 143
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Gerar Border'#244
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
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
    ParentFont = False
    OnClick = btnImprimirClick
  end
  object btnSair: TSpeedButton
    Left = 291
    Top = 138
    Width = 83
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
    ParentFont = False
    OnClick = btnSairClick
  end
  object btnVoltar: TSpeedButton
    Left = 291
    Top = 138
    Width = 82
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Voltar'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    Visible = False
    OnClick = btnVoltarClick
  end
  object fllstAux: TFileListBox
    Left = 39
    Top = 104
    Width = 145
    Height = 97
    ItemHeight = 13
    Mask = 'bordero*.txt'
    TabOrder = 0
    Visible = False
  end
  object nbPrincipal: TNotebook
    Left = 0
    Top = 0
    Width = 383
    Height = 132
    Align = alClient
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object Label1: TLabel
        Left = 8
        Top = 47
        Width = 74
        Height = 13
        Caption = 'N'#186' do Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 19
        Width = 40
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btn_co_proc_new: TSpeedButton
        Left = 250
        Top = 44
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
        OnClick = btn_co_proc_newClick
      end
      object btn_cd_unid_neg: TSpeedButton
        Left = 318
        Top = 14
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
        OnClick = btn_cd_unid_negClick
      end
      object lbl_nr_dhl: TLabel
        Left = 8
        Top = 103
        Width = 37
        Height = 13
        Caption = 'N'#176' DHL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label4: TLabel
        Left = 8
        Top = 76
        Width = 86
        Height = 13
        Caption = 'Tipo de impress'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object msk_nr_processo: TMaskEdit
        Left = 104
        Top = 43
        Width = 142
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = msk_nr_processoExit
        OnKeyDown = msk_nr_processoKeyDown
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 105
        Top = 15
        Width = 32
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 3
        OnChange = btn_cd_unid_negClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_nr_processoKeyDown
      end
      object edt_nm_unid_neg: TEdit
        Left = 138
        Top = 15
        Width = 177
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 4
      end
      object msk_nr_dhl: TMaskEdit
        Left = 105
        Top = 99
        Width = 140
        Height = 21
        MaxLength = 15
        TabOrder = 2
        Visible = False
      end
      object cbo_tp_impressao: TComboBox
        Left = 105
        Top = 72
        Width = 143
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbo_tp_impressaoChange
        Items.Strings = (
          'C'#243'pias para arquivo'
          'C'#243'pias para o banco'
          'Originais para o banco')
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'Bord'
      object pg: TPageControl
        Left = 0
        Top = 0
        Width = 383
        Height = 132
        ActivePage = ts1
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object ts1: TTabSheet
        end
      end
    end
  end
  object dsGeral: TDataSource
    DataSet = qryGeral
    Left = 16
    Top = 16
  end
  object qryGeral: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT B.NR_PROCESSO, B.NR_FATURA, CONVERT(VARCHAR, B.DT_FATURA,' +
        ' 103) AS DT_FATURA,'
      '       CASE SUBSTRING(B.NR_PROCESSO, 1, 2)'
      '         WHEN '#39'02'#39' THEN '#39'RIO-'#39' + SUBSTRING(B.NR_PROCESSO, 5, 10)'
      '         ELSE '#39'STS-'#39' + + SUBSTRING(B.NR_PROCESSO, 5, 10)'
      '       END AS PROC_SIGLA,'
      
        '       (SELECT A.NM_AREA FROM TAREA A (NOLOCK) WHERE A.CD_AREA =' +
        ' P.CD_AREA) AS NM_AREA,'
      
        '       CO.NM_CONTATO AS NM_USUARIO, CO.NM_EMAIL AS EMAIL_USUARIO' +
        ','
      '       CONVERT(VARCHAR, GETDATE(), 103) AS DT_ATUAL,'
      
        '       BCO.NM_EMPRESA AS NM_BANCO, RTRIM(LTRIM(BCO.END_EMPRESA))' +
        ' + '#39' '#39' + RTRIM(LTRIM(BCO.END_NUMERO)) + '#39' '#39' + RTRIM(LTRIM(BCO.EN' +
        'D_COMPL)) AS END_BANCO,'
      
        '       RTRIM(LTRIM(BCO.END_CIDADE)) + '#39' '#39' + RTRIM(LTRIM(BCO.END_' +
        'ESTADO)) + '#39' '#39' + RTRIM(LTRIM((SELECT PA2.NM_PAIS FROM TPAIS_BROK' +
        'ER PA2 (NOLOCK) WHERE PA2.CD_PAIS = BCO.CD_PAIS))) AS CID_BANCO,'
      
        '       (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) WHERE M.' +
        'CD_MOEDA = E.CD_MOEDA) AS AP_MOEDA,'
      '       E.VL_TOT_MCV,'
      
        '       (SELECT TP.NM_TERMO_PAGTO FROM TTERMO_PAGTO TP (NOLOCK) W' +
        'HERE TP.CD_TERMO_PAGTO = E.CD_TERMO_PAGTO) AS NM_TERMO_PAGTO,'
      '       IMP.NM_EMPRESA,'
      
        '       (SELECT PA.NM_PAIS FROM TPAIS_BROKER PA (NOLOCK) WHERE PA' +
        '.CD_PAIS = IMP.CD_PAIS) AS PAIS_IMP,'
      
        '       (SELECT PD.NM_PAIS FROM TPAIS_BROKER PD (NOLOCK) WHERE PD' +
        '.CD_PAIS = P.CD_PAIS_DESTINO) AS PAIS_DEST,'
      
        '       --CONVERT(VARCHAR, (SELECT F1.DT_REALIZACAO FROM TFOLLOWU' +
        'P F1 (NOLOCK) WHERE F1.NR_PROCESSO = B.NR_PROCESSO AND F1.CD_EVE' +
        'NTO = '#39'132'#39'), 103) AS DT_EMBARQUE, by Carlos'
      '       CONVERT(VARCHAR, P.DT_CONHECIMENTO, 103) AS DT_EMBARQUE,'
      '       CASE ISNULL(P.NR_CONHECIMENTO_MASTER, '#39#39')'
      '         WHEN '#39#39' THEN P.NR_CONHECIMENTO'
      '         ELSE P.NR_CONHECIMENTO_MASTER'
      '       END  AS CONHECIMENTO,'
      '       (CASE ISNULL(E.NR_SD, '#39#39')'
      '         WHEN '#39#39' THEN '#39#39
      
        '         ELSE SUBSTRING(E.NR_SD, 1, 10) + '#39'/'#39' + SUBSTRING(E.NR_S' +
        'D, 11, 1)'
      '       END) AS  NR_SD,'
      '       C.NM_EMPRESA AS CLIENTE,'
      '       C.NR_TELEFONE,'
      '       C.NR_FAX,'
      
        '       (SUBSTRING(C.CGC_EMPRESA, 1, 2) + '#39'.'#39' + SUBSTRING(C.CGC_E' +
        'MPRESA, 3, 3) + '#39'.'#39' + SUBSTRING(C.CGC_EMPRESA, 6, 3) + '#39'/'#39' +'
      
        '       SUBSTRING(C.CGC_EMPRESA, 9, 4) + '#39'-'#39' + SUBSTRING(C.CGC_EM' +
        'PRESA, 13, 2)) AS CNPJ_EMPRESA,'
      
        '       (SELECT BCO2.NM_EMPRESA FROM TEMPRESA_EST BCO2 (NOLOCK) W' +
        'HERE BCO2.CD_EMPRESA = E.CD_BANCO_SAQUE_BORDERO) AS NM_BANCO_BOR' +
        'D,'
      
        '       (CASE ISNULL(G.CD_LAYOUT_BORDERO, '#39#39') WHEN '#39#39' THEN 1 ELSE' +
        ' G.CD_LAYOUT_BORDERO END) AS TP_LAYOUT,'
      
        '       O.NM_USUARIO AS USUARIO_GERADOR, O.NM_EMAIL, ISNULL(E.CD_' +
        'FORMA_PAGTO,'#39#39') AS CD_FORMA_PAGTO, ISNULL(E.CD_SEGURADORA, '#39#39') A' +
        'S CD_SEGURADORA, ISNULL(P.CD_BANCO_EXP, '#39#39') AS CD_BANCO_EXP,'
      
        '       AG.NM_EMPRESA AS NM_AGENTE, RTRIM(LTRIM(AG.END_EMPRESA)) ' +
        '+ '#39' '#39' + RTRIM(LTRIM(AG.END_NUMERO)) + '#39' '#39' + RTRIM(LTRIM(AG.END_C' +
        'OMPL)) + '#39' '#39' +'
      
        '       RTRIM(LTRIM(AG.END_CIDADE)) + '#39' '#39' + RTRIM(LTRIM(AG.END_ES' +
        'TADO)) + '#39' '#39' + RTRIM(LTRIM((SELECT PA3.NM_PAIS FROM TPAIS_BROKER' +
        ' PA3 (NOLOCK) WHERE PA3.CD_PAIS = AG.CD_PAIS))) AS END_AGENTE,'
      
        '       ltrim(rtrim(convert(varchar(1000),IsNull(AG.TX_OBS_AGENTE' +
        ','#39#39')))) AS OBS_AGENTE, ltrim(rtrim(convert(varchar(1000),isNull(' +
        'AG.TX_OBS_BANCO,'#39#39')))) AS OBS_BANCO,'
      
        '       (ISNULL(E.VL_COMISSAO_PERCENT/100, 0)*(SELECT SUM(ISNULL(' +
        'EI.VL_MLE, 0)) FROM TPROCESSO_EXP_ITEM EI (NOLOCK) WHERE EI.NR_P' +
        'ROCESSO = B.NR_PROCESSO AND RTRIM(LTRIM(EI.NR_PEDIDO)) = RTRIM(L' +
        'TRIM(B.NR_FATURA))  )) AS COMISSAO_AGENTE,'
      
        '       substring(P.NR_DDE,1,10)+'#39'/'#39'+substring(P.NR_DDE,11,1) NR_' +
        'DDE'
      '  FROM TPROCESSO_EXP_BORD B (NOLOCK)'
      
        ' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = B.NR_PROCESS' +
        'O'
      
        '  LEFT JOIN TPROCESSO_EXP E (NOLOCK) ON E.NR_PROCESSO = B.NR_PRO' +
        'CESSO'
      
        '  LEFT JOIN TEMPRESA_NAC C (NOLOCK) ON C.CD_EMPRESA = P.CD_CLIEN' +
        'TE'
      '  LEFT JOIN TGRUPO G (NOLOCK) ON C.CD_GRUPO = G.CD_GRUPO'
      '  LEFT JOIN TUSUARIO O (NOLOCK) ON O.CD_USUARIO = :USUARIO'
      
        '  LEFT JOIN TEMPRESA_EST IMP (NOLOCK) ON IMP.CD_EMPRESA = B.CD_I' +
        'MPORTADOR'
      
        '  LEFT JOIN TEMPRESA_EST BCO (NOLOCK) ON BCO.CD_EMPRESA = P.CD_B' +
        'ANCO_EXP'
      
        '  LEFT JOIN TEMPRESA_EST AG  (NOLOCK) ON AG.CD_EMPRESA  = E.CD_S' +
        'EGURADORA'
      
        '  LEFT JOIN TCLIENTE_CONTATO CO (NOLOCK) ON CO.CD_CLIENTE = P.CD' +
        '_CLIENTE'
      
        '                                        AND CO.CD_UNID_NEG = P.C' +
        'D_UNID_NEG'
      
        '                                        AND CO.CD_PRODUTO = P.CD' +
        '_PRODUTO'
      
        '                                        AND CO.CD_CONTATO = P.CD' +
        '_CONTATO'
      ' WHERE B.NR_PROCESSO = :NR_PROCESSO')
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryGeralNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryGeralNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qryGeralPROC_SIGLA: TStringField
      FieldName = 'PROC_SIGLA'
      FixedChar = True
      Size = 14
    end
    object qryGeralNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object qryGeralNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryGeralEMAIL_USUARIO: TStringField
      FieldName = 'EMAIL_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryGeralDT_ATUAL: TStringField
      FieldName = 'DT_ATUAL'
      FixedChar = True
      Size = 30
    end
    object qryGeralNM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 60
    end
    object qryGeralAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryGeralVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
    end
    object qryGeralNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 50
    end
    object qryGeralNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qryGeralPAIS_IMP: TStringField
      FieldName = 'PAIS_IMP'
      FixedChar = True
      Size = 120
    end
    object qryGeralPAIS_DEST: TStringField
      FieldName = 'PAIS_DEST'
      FixedChar = True
      Size = 120
    end
    object qryGeralDT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      FixedChar = True
      Size = 30
    end
    object qryGeralCONHECIMENTO: TStringField
      FieldName = 'CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryGeralNR_SD: TStringField
      FieldName = 'NR_SD'
      FixedChar = True
      Size = 12
    end
    object qryGeralCLIENTE: TStringField
      FieldName = 'CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qryGeralNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qryGeralNR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qryGeralCNPJ_EMPRESA: TStringField
      FieldName = 'CNPJ_EMPRESA'
      FixedChar = True
      Size = 18
    end
    object qryGeralNM_BANCO_BORD: TStringField
      FieldName = 'NM_BANCO_BORD'
      FixedChar = True
      Size = 60
    end
    object qryGeralTP_LAYOUT: TIntegerField
      FieldName = 'TP_LAYOUT'
    end
    object qryGeralDT_FATURA: TStringField
      FieldName = 'DT_FATURA'
      FixedChar = True
      Size = 30
    end
    object qryGeralEND_BANCO: TStringField
      FieldName = 'END_BANCO'
      FixedChar = True
      Size = 109
    end
    object qryGeralCID_BANCO: TStringField
      FieldName = 'CID_BANCO'
      FixedChar = True
      Size = 182
    end
    object qryGeralUSUARIO_GERADOR: TStringField
      FieldName = 'USUARIO_GERADOR'
      FixedChar = True
      Size = 50
    end
    object qryGeralNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      FixedChar = True
      Size = 255
    end
    object qryGeralCD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      FixedChar = True
      Size = 1
    end
    object qryGeralCD_SEGURADORA: TStringField
      FieldName = 'CD_SEGURADORA'
      FixedChar = True
      Size = 5
    end
    object qryGeralCD_BANCO_EXP: TStringField
      FieldName = 'CD_BANCO_EXP'
      FixedChar = True
      Size = 5
    end
    object qryGeralNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qryGeralEND_AGENTE: TStringField
      FieldName = 'END_AGENTE'
      FixedChar = True
      Size = 255
    end
    object qryGeralCOMISSAO_AGENTE: TFloatField
      FieldName = 'COMISSAO_AGENTE'
    end
    object qryGeralOBS_AGENTE: TStringField
      FieldName = 'OBS_AGENTE'
      FixedChar = True
      Size = 255
    end
    object qryGeralOBS_BANCO: TStringField
      FieldName = 'OBS_BANCO'
      FixedChar = True
      Size = 255
    end
    object qryGeralNR_DDE: TStringField
      FieldName = 'NR_DDE'
      FixedChar = True
      Size = 12
    end
  end
  object dsDet: TDataSource
    DataSet = qryDet
    Left = 80
    Top = 16
  end
  object qryDet: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsGeral
    SQL.Strings = (
      'SELECT (CASE ISNULL(G.CD_LAYOUT_BORDERO, '#39'1'#39')'
      '       WHEN '#39'1'#39' THEN'
      '         (CASE CD_DOCUMENTO'
      '           WHEN '#39'001'#39' THEN '#39'Fatura Comercial'#39
      '           WHEN '#39'002'#39' THEN '#39'Saque de'#39
      '           WHEN '#39'003'#39' THEN '#39'Packing List'#39
      '           WHEN '#39'004'#39' THEN CASE ISNULL(S.CD_VIA_TRANSPORTE, '#39#39')'
      
        '                             WHEN '#39'04'#39' THEN '#39'Conhecimento AWB N'#186 +
        #39
      
        '                             WHEN '#39'07'#39' THEN '#39'Conhecimento CRT N'#186 +
        #39
      '                             ELSE '#39'Conhecimento B/L N'#186#39
      '                           END'
      '           WHEN '#39'005'#39' THEN '#39'Certificado de Origem'#39
      '           WHEN '#39'006'#39' THEN '#39'Certificado de Seguro'#39
      '           WHEN '#39'019'#39' THEN '#39'Certificado de An'#225'lise'#39
      
        '           ELSE (SELECT TOP 1 D.DESCRICAO FROM TTP_DOCUMENTO D (' +
        'NOLOCK) WHERE D.CODIGO = BI.CD_DOCUMENTO)'
      '         END)'
      '       WHEN '#39'2'#39' THEN'
      '         (CASE CD_DOCUMENTO'
      '           WHEN '#39'001'#39' THEN '#39'FATURA COMERCIAL'#39
      '           WHEN '#39'002'#39' THEN '#39'SAQUE'#39
      '           WHEN '#39'003'#39' THEN '#39'PACKING LIST'#39
      '           WHEN '#39'004'#39' THEN '#39'CONHECIMENTO'#39
      '           WHEN '#39'005'#39' THEN '#39'CERTIFICADO DE ORIGEM'#39
      '           WHEN '#39'006'#39' THEN '#39'CERTIFICADO DE SEGURO'#39
      '           WHEN '#39'019'#39' THEN '#39'CERTIFICADO DE AN'#193'LISE'#39
      
        '           ELSE (SELECT TOP 1 UPPER(D.DESCRICAO) FROM TTP_DOCUME' +
        'NTO D (NOLOCK) WHERE D.CODIGO = BI.CD_DOCUMENTO)'
      '         END)'
      ''
      '       END)   AS NM_DOCTO,'
      '       RIGHT('#39'000'#39' + CONVERT(VARCHAR, QT_ORIGINAIS), 3) AS ORIG,'
      '       RIGHT('#39'000'#39' + CONVERT(VARCHAR, QT_COPIAS), 3) AS COPIA,'
      '       CD_DOCUMENTO'
      '  FROM TPROCESSO_EXP_BORD_ITEM BI (NOLOCK)'
      
        ' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = BI.NR_PROCES' +
        'SO'
      '  LEFT JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO'
      
        '  LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLI' +
        'ENTE'
      '  LEFT JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EN.CD_GRUPO'
      ' WHERE BI.NR_PROCESSO = :NR_PROCESSO'
      '   AND BI.NR_FATURA = :NR_FATURA'
      
        '   AND BI.CD_DOCUMENTO IN ('#39'001'#39', '#39'002'#39', '#39'003'#39', '#39'004'#39', '#39'005'#39', '#39'0' +
        '06'#39', '#39'019'#39')')
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_FATURA'
        ParamType = ptInput
        Size = 16
      end>
    object qryDetNM_DOCTO: TStringField
      FieldName = 'NM_DOCTO'
      FixedChar = True
      Size = 50
    end
    object qryDetORIG: TStringField
      FieldName = 'ORIG'
      FixedChar = True
      Size = 3
    end
    object qryDetCOPIA: TStringField
      FieldName = 'COPIA'
      FixedChar = True
      Size = 3
    end
    object qryDetCD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      FixedChar = True
      Size = 3
    end
  end
  object dsRef: TDataSource
    DataSet = qryRef
    Left = 16
    Top = 48
  end
  object qryRef: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsGeral
    SQL.Strings = (
      'SELECT RTRIM(LTRIM(CD_REFERENCIA)) AS REF '
      '  FROM TREF_CLIENTE (NOLOCK)'
      ' WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 48
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
    object qryRefREF: TStringField
      FieldName = 'REF'
      FixedChar = True
      Size = 15
    end
  end
  object dsRE: TDataSource
    DataSet = qryRE
    Left = 80
    Top = 48
  end
  object qryRE: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsGeral
    SQL.Strings = (
      'SELECT SUBSTRING(RE.NR_RE, 1, 2) + '#39'/'#39' +'
      '       SUBSTRING(RE.NR_RE, 3, 7) + '#39'-'#39' +'
      
        '       SUBSTRING(RE.NR_RE, 10,3) + case when RC.NR_OUTRA_REF <> ' +
        #39#39' then '#39' ('#39' + RC.NR_OUTRA_REF + '#39')'#39' else '#39#39' end  AS RE, RC.NR_O' +
        'UTRA_REF '
      '  FROM TPROCESSO_EXP_RE RE (NOLOCK)'
      
        '  LEFT JOIN TRE_CAPA RC (NOLOCK) ON RC.NR_PROCESSO = RE.NR_PROCE' +
        'SSO'
      '  AND SUBSTRING(RE.NR_RE, 1, 2) + '#39'/'#39' +'
      '      SUBSTRING(RE.NR_RE, 3, 7) + '#39'-'#39' +'
      '      SUBSTRING(RE.NR_RE, 10,3) = RC.NR_RE_SISCOMEX'
      ' WHERE RE.NR_PROCESSO = :NR_PROCESSO'
      '   AND ISNULL(RE.NR_RE, '#39#39') <> '#39#39
      '  AND ISNULL(RC.NR_PROCESSO, '#39#39') <> '#39#39)
    Left = 112
    Top = 48
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
    object qryRERE: TStringField
      FieldName = 'RE'
      FixedChar = True
      Size = 14
    end
    object qryRENR_OUTRA_REF: TStringField
      FieldName = 'NR_OUTRA_REF'
      FixedChar = True
      Size = 30
    end
  end
  object dsSaque: TDataSource
    DataSet = qrySaque
    Left = 16
    Top = 80
  end
  object qrySaque: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsGeral
    SQL.Strings = (
      'SELECT TOP 1 ISNULL(DT_VCTO_SAQUE, '#39#39') AS DT_VCTO_SAQUE,'
      '             VL_TOT_SAQUE'
      '  FROM TPROCESSO_EXP_SAQUE (NOLOCK)'
      ' WHERE NR_PROCESSO = :NR_PROCESSO'
      '   AND ((NR_FATURA = :NR_FATURA) OR (:NR_FATURA = '#39#39'))')
    Left = 48
    Top = 81
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_FATURA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftFixedChar
        Name = 'NR_FATURA'
        ParamType = ptUnknown
      end>
    object qrySaqueDT_VCTO_SAQUE: TDateTimeField
      FieldName = 'DT_VCTO_SAQUE'
    end
    object qrySaqueVL_TOT_SAQUE: TFloatField
      FieldName = 'VL_TOT_SAQUE'
    end
  end
  object dsNF: TDataSource
    DataSet = qryNF
    Left = 80
    Top = 80
  end
  object qryNF: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsGeral
    SQL.Strings = (
      'SELECT RTRIM(LTRIM(NR_NF)) AS NF'
      '  FROM TPROCESSO_EXP_NF (NOLOCK)'
      ' WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
    object qryNFNF: TStringField
      FieldName = 'NF'
      FixedChar = True
      Size = 10
    end
  end
  object ppReport1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\bordero.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 16
    Top = 112
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppMem: TppMemo
        UserName = 'Mem'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 11
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
